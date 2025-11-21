# Sales Trend Analysis - SQL Project

## 📊 Project Overview

This project contains SQL scripts for comprehensive sales trend analysis. It includes database schema creation, sample data insertion, and various analytical queries to extract meaningful insights from sales data.

## 🎯 Project Objectives

- Analyze sales trends over time (monthly, quarterly)
- Identify top-performing products and categories
- Understand customer behavior and segmentation
- Calculate profitability and margins
- Perform advanced analytics (RFM analysis, CLV)
- Track payment methods and discount effectiveness

## 📁 Repository Structure

```
sales-trend-analysis-sql/
│
├── 01_create_schema.sql          # Database and table creation scripts
├── 02_insert_sample_data.sql     # Sample data for testing and analysis
├── 03_sales_trend_queries.sql    # Analytical queries for insights
└── README.md                     # Project documentation
```

## 🗄️ Database Schema

The project uses a relational database with the following tables:

### Tables:
1. **customers** - Customer information (ID, name, contact, location, segment)
2. **products** - Product catalog (ID, name, category, pricing, stock)
3. **sales** - Transaction records (sale details, amounts, discounts)
4. **regions** - Geographic regions
5. **sales_targets** - Quarterly sales targets by region

### Key Relationships:
- Sales → Customers (customer_id)
- Sales → Products (product_id)
- Sales_Targets → Regions (region_id)

## 🚀 Getting Started

### Prerequisites
- MySQL 5.7+ or MariaDB 10.2+
- MySQL Workbench or command-line client
- Basic SQL knowledge

### Installation Steps

1. **Clone the repository**
   ```bash
   git clone https://github.com/pshivaprasadreddy/sales-trend-analysis-sql.git
   cd sales-trend-analysis-sql
   ```

2. **Create the database schema**
   ```sql
   source 01_create_schema.sql;
   ```

3. **Insert sample data**
   ```sql
   source 02_insert_sample_data.sql;
   ```

4. **Run analytical queries**
   ```sql
   source 03_sales_trend_queries.sql;
   ```

## 📈 Analysis Categories

The project includes queries for:

### 1. Basic Sales Analysis
- Total sales by month and quarter
- Order volumes and revenue trends
- Average order values

### 2. Product Analysis
- Top-selling products by revenue
- Category-wise performance
- Product profitability and margins

### 3. Customer Analysis
- Top customers by revenue
- Customer segmentation (Premium, Regular, VIP)
- Geographic sales distribution

### 4. Trend Analysis
- Month-over-month growth rates
- Moving averages (3-month)
- Seasonal patterns

### 5. Payment & Discount Analysis
- Payment method preferences
- Discount effectiveness
- Transaction value distribution

### 6. Advanced Analytics
- Customer Lifetime Value (CLV)
- RFM Analysis (Recency, Frequency, Monetary)
- Customer status classification

## 💡 Key Insights & Use Cases

- **Sales Forecasting**: Use historical trends to predict future sales
- **Inventory Management**: Identify fast-moving products
- **Customer Retention**: Identify at-risk customers using RFM analysis
- **Pricing Strategy**: Analyze discount impact on sales
- **Marketing Campaigns**: Target high-value customer segments

## 🔍 Sample Queries

### Top 5 Products by Revenue
```sql
SELECT 
    p.product_name,
    SUM(s.total_amount) AS total_revenue
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_revenue DESC
LIMIT 5;
```

### Month-over-Month Growth
```sql
WITH monthly_sales AS (
    SELECT 
        DATE_FORMAT(sale_date, '%Y-%m') AS month,
        SUM(total_amount) AS revenue
    FROM sales
    GROUP BY month
)
SELECT 
    month,
    revenue,
    ROUND(((revenue - LAG(revenue) OVER (ORDER BY month)) / 
           LAG(revenue) OVER (ORDER BY month) * 100), 2) AS growth_percent
FROM monthly_sales;
```

## 🛠️ Technologies Used

- **Database**: MySQL
- **SQL Features**: 
  - JOIN operations
  - Window functions (LAG, OVER)
  - Common Table Expressions (CTEs)
  - Aggregate functions
  - Date functions

## 📊 Data Summary

- **Sample Period**: 2024 (January - October)
- **Total Customers**: 10
- **Total Products**: 10
- **Product Categories**: Electronics, Furniture, Stationery
- **Total Sales Records**: 30 transactions

## 🎓 Learning Outcomes

This project demonstrates:
- Database design and normalization
- Complex SQL query writing
- Data analysis techniques
- Business intelligence concepts
- Performance optimization with indexes

## 📝 Future Enhancements

- [ ] Add views for commonly used queries
- [ ] Create stored procedures for automation
- [ ] Implement data visualization dashboards
- [ ] Add year-over-year comparison queries
- [ ] Include sales forecasting models

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📧 Contact

**Author**: Shiva Prasad Reddy P
**GitHub**: [@pshivaprasadreddy](https://github.com/pshivaprasadreddy)

## 📄 License

This project is open source and available for educational purposes.

---

⭐ If you find this project helpful, please give it a star!
