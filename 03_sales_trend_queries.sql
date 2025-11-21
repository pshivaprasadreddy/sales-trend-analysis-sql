-- Sales Trend Analysis Queries
-- This script contains various analytical queries for sales trend analysis

USE sales_analysis;

-- ====================
-- 1. BASIC SALES ANALYSIS
-- ====================

-- Total Sales by Month
SELECT 
    DATE_FORMAT(sale_date, '%Y-%m') AS month,
    COUNT(*) AS total_orders,
    SUM(quantity) AS total_units_sold,
    SUM(total_amount) AS total_revenue,
    AVG(total_amount) AS avg_order_value
FROM sales
GROUP BY DATE_FORMAT(sale_date, '%Y-%m')
ORDER BY month;

-- Sales by Quarter
SELECT 
    YEAR(sale_date) AS year,
    QUARTER(sale_date) AS quarter,
    COUNT(*) AS total_orders,
    SUM(total_amount) AS total_revenue
FROM sales
GROUP BY YEAR(sale_date), QUARTER(sale_date)
ORDER BY year, quarter;

-- ====================
-- 2. PRODUCT ANALYSIS
-- ====================

-- Top 10 Best Selling Products by Revenue
SELECT 
    p.product_name,
    p.category,
    COUNT(s.sale_id) AS times_sold,
    SUM(s.quantity) AS total_units_sold,
    SUM(s.total_amount) AS total_revenue
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.product_id, p.product_name, p.category
ORDER BY total_revenue DESC
LIMIT 10;

-- Sales by Category
SELECT 
    p.category,
    COUNT(s.sale_id) AS total_orders,
    SUM(s.quantity) AS total_units_sold,
    SUM(s.total_amount) AS total_revenue,
    AVG(s.total_amount) AS avg_order_value
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.category
ORDER BY total_revenue DESC;

-- Product Profitability Analysis
SELECT 
    p.product_name,
    p.category,
    SUM(s.quantity) AS units_sold,
    SUM(s.total_amount) AS revenue,
    SUM(s.quantity * p.cost_price) AS total_cost,
    SUM(s.total_amount) - SUM(s.quantity * p.cost_price) AS profit,
    ROUND(((SUM(s.total_amount) - SUM(s.quantity * p.cost_price)) / SUM(s.total_amount) * 100), 2) AS profit_margin_percent
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.product_id, p.product_name, p.category
ORDER BY profit DESC;

-- ====================
-- 3. CUSTOMER ANALYSIS
-- ====================

-- Top 10 Customers by Revenue
SELECT 
    c.customer_name,
    c.city,
    c.customer_segment,
    COUNT(s.sale_id) AS total_orders,
    SUM(s.total_amount) AS total_spent,
    AVG(s.total_amount) AS avg_order_value
FROM customers c
JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_id, c.customer_name, c.city, c.customer_segment
ORDER BY total_spent DESC
LIMIT 10;

-- Customer Segmentation Analysis
SELECT 
    c.customer_segment,
    COUNT(DISTINCT c.customer_id) AS total_customers,
    COUNT(s.sale_id) AS total_orders,
    SUM(s.total_amount) AS total_revenue,
    AVG(s.total_amount) AS avg_order_value
FROM customers c
JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_segment
ORDER BY total_revenue DESC;

-- Sales by City (Geographic Analysis)
SELECT 
    c.city,
    c.state,
    COUNT(s.sale_id) AS total_orders,
    SUM(s.total_amount) AS total_revenue,
    COUNT(DISTINCT c.customer_id) AS unique_customers
FROM customers c
JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.city, c.state
ORDER BY total_revenue DESC;

-- ====================
-- 4. TREND ANALYSIS
-- ====================

-- Month-over-Month Growth Rate
WITH monthly_sales AS (
    SELECT 
        DATE_FORMAT(sale_date, '%Y-%m') AS month,
        SUM(total_amount) AS revenue
    FROM sales
    GROUP BY DATE_FORMAT(sale_date, '%Y-%m')
)
SELECT 
    month,
    revenue,
    LAG(revenue) OVER (ORDER BY month) AS previous_month_revenue,
    ROUND(((revenue - LAG(revenue) OVER (ORDER BY month)) / LAG(revenue) OVER (ORDER BY month) * 100), 2) AS growth_rate_percent
FROM monthly_sales
ORDER BY month;

-- Moving Average (3-Month)
WITH monthly_sales AS (
    SELECT 
        DATE_FORMAT(sale_date, '%Y-%m') AS month,
        SUM(total_amount) AS revenue
    FROM sales
    GROUP BY DATE_FORMAT(sale_date, '%Y-%m')
)
SELECT 
    month,
    revenue,
    ROUND(AVG(revenue) OVER (ORDER BY month ROWS BETWEEN 2 PRECEDING AND CURRENT ROW), 2) AS moving_avg_3_months
FROM monthly_sales
ORDER BY month;

-- ====================
-- 5. PAYMENT METHOD ANALYSIS
-- ====================

SELECT 
    payment_method,
    COUNT(*) AS total_transactions,
    SUM(total_amount) AS total_revenue,
    AVG(total_amount) AS avg_transaction_value,
    ROUND((COUNT(*) * 100.0 / (SELECT COUNT(*) FROM sales)), 2) AS percentage_of_transactions
FROM sales
GROUP BY payment_method
ORDER BY total_revenue DESC;

-- ====================
-- 6. DISCOUNT ANALYSIS
-- ====================

SELECT 
    CASE 
        WHEN discount_percent = 0 THEN 'No Discount'
        WHEN discount_percent <= 5 THEN '1-5%'
        WHEN discount_percent <= 10 THEN '6-10%'
        WHEN discount_percent <= 15 THEN '11-15%'
        ELSE 'Above 15%'
    END AS discount_range,
    COUNT(*) AS total_orders,
    SUM(total_amount) AS revenue,
    AVG(quantity) AS avg_quantity_per_order
FROM sales
GROUP BY discount_range
ORDER BY revenue DESC;

-- ====================
-- 7. ADVANCED ANALYTICS
-- ====================

-- Customer Lifetime Value (CLV)
SELECT 
    c.customer_id,
    c.customer_name,
    c.customer_segment,
    COUNT(s.sale_id) AS total_orders,
    SUM(s.total_amount) AS lifetime_value,
    DATEDIFF(MAX(s.sale_date), MIN(s.sale_date)) AS days_as_customer,
    ROUND(SUM(s.total_amount) / NULLIF(DATEDIFF(MAX(s.sale_date), MIN(s.sale_date)), 0), 2) AS avg_daily_value
FROM customers c
JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_id, c.customer_name, c.customer_segment
ORDER BY lifetime_value DESC;

-- RFM Analysis (Recency, Frequency, Monetary)
WITH rfm_data AS (
    SELECT 
        customer_id,
        DATEDIFF(CURDATE(), MAX(sale_date)) AS recency,
        COUNT(*) AS frequency,
        SUM(total_amount) AS monetary
    FROM sales
    GROUP BY customer_id
)
SELECT 
    c.customer_name,
    c.customer_segment,
    r.recency AS days_since_last_purchase,
    r.frequency AS total_purchases,
    r.monetary AS total_spent,
    CASE 
        WHEN r.recency <= 30 AND r.frequency >= 3 AND r.monetary >= 1000 THEN 'VIP'
        WHEN r.recency <= 60 AND r.frequency >= 2 THEN 'Active'
        WHEN r.recency <= 90 THEN 'Occasional'
        ELSE 'At Risk'
    END AS customer_status
FROM rfm_data r
JOIN customers c ON r.customer_id = c.customer_id
ORDER BY r.monetary DESC;

-- Product Performance by Month
SELECT 
    DATE_FORMAT(s.sale_date, '%Y-%m') AS month,
    p.product_name,
    p.category,
    SUM(s.quantity) AS units_sold,
    SUM(s.total_amount) AS revenue
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY DATE_FORMAT(s.sale_date, '%Y-%m'), p.product_name, p.category
ORDER BY month, revenue DESC;
