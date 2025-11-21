# Sample Query Outputs

This document shows example outputs from the analytical queries in `03_sales_trend_queries.sql`.

---

## 1. Total Sales by Month

```
+----------+--------------+------------------+---------------+-----------------+
| month    | total_orders | total_units_sold | total_revenue | avg_order_value |
+----------+--------------+------------------+---------------+-----------------+
| 2024-01  |            3 |                4 |       1609.96 |          536.65 |
| 2024-02  |            3 |                5 |        774.95 |          258.32 |
| 2024-03  |            3 |                7 |       1602.43 |          534.14 |
| 2024-04  |            3 |                4 |        721.96 |          240.65 |
| 2024-05  |            3 |               13 |        962.38 |          320.79 |
| 2024-06  |            3 |                5 |       1989.95 |          663.32 |
| 2024-07  |            3 |               10 |        582.41 |          194.14 |
| 2024-08  |            3 |                6 |        751.94 |          250.65 |
| 2024-09  |            3 |                8 |       1679.92 |          559.97 |
| 2024-10  |            3 |               10 |        759.43 |          253.14 |
+----------+--------------+------------------+---------------+-----------------+
```

**Key Insights:**
- Peak revenue month: June 2024 ($1,989.95)
- Lowest revenue month: July 2024 ($582.41)
- Average order value ranges from $194 to $663

---

## 2. Top 5 Products by Revenue

```
+---------------------+-------------+------------+------------------+---------------+
| product_name        | category    | times_sold | total_units_sold | total_revenue |
+---------------------+-------------+------------+------------------+---------------+
| Laptop Pro 15       | Electronics |          5 |                5 |       5849.95 |
| Monitor 27"         | Electronics |          4 |                5 |       1574.95 |
| Standing Desk       | Furniture   |          3 |                3 |       1649.97 |
| Office Chair Deluxe | Furniture   |          3 |                4 |       1459.96 |
| Mechanical Keyboard | Electronics |          3 |                4 |        500.45 |
+---------------------+-------------+------------+------------------+---------------+
```

**Key Insights:**
- Laptop Pro 15 is the top revenue generator ($5,849.95)
- Electronics category dominates top sellers
- High-value items drive overall revenue

---

## 3. Sales by Category

```
+-------------+--------------+------------------+---------------+-----------------+
| category    | total_orders | total_units_sold | total_revenue | avg_order_value |
+-------------+--------------+------------------+---------------+-----------------+
| Electronics |           18 |               42 |       8648.70 |          480.48 |
| Furniture   |            9 |               11 |       2291.89 |          254.65 |
| Stationery  |            3 |               23 |        393.74 |          131.25 |
+-------------+--------------+------------------+---------------+-----------------+
```

**Key Insights:**
- Electronics: 65.5% of total revenue
- Furniture: 17.4% of total revenue
- Stationery: 3.0% of total revenue (high volume, low value)

---

## 4. Product Profitability Analysis

```
+---------------------+-------------+------------+---------+------------+---------+----------------------+
| product_name        | category    | units_sold | revenue | total_cost | profit  | profit_margin_percent|
+---------------------+-------------+------------+---------+------------+---------+----------------------+
| Laptop Pro 15       | Electronics |          5 | 5849.95 |    4000.00 | 1849.95 |                31.63 |
| Standing Desk       | Furniture   |          3 | 1649.97 |    1050.00 |  599.97 |                36.36 |
| Monitor 27"         | Electronics |          4 | 1574.95 |     800.00 |  774.95 |                49.20 |
| Office Chair Deluxe | Furniture   |          4 | 1459.96 |     800.00 |  659.96 |                45.20 |
| Mechanical Keyboard | Electronics |          4 |  500.45 |     280.00 |  220.45 |                44.05 |
+---------------------+-------------+------------+---------+------------+---------+----------------------+
```

**Key Insights:**
- Monitor 27" has highest profit margin (49.20%)
- Laptop Pro 15 generates highest absolute profit ($1,849.95)
- All products showing healthy profit margins (30%+)

---

## 5. Top 5 Customers by Revenue

```
+------------------+----------------+------------------+--------------+-------------+-----------------+
| customer_name    | city           | customer_segment | total_orders | total_spent | avg_order_value |
+------------------+----------------+------------------+--------------+-------------+-----------------+
| John Smith       | New York       | Premium          |          4 |     2514.94 |          628.74 |
| James Wilson     | Phoenix        | VIP              |          3 |     2429.96 |          809.99 |
| Michael Brown    | Chicago        | Premium          |          3 |     1719.95 |          573.32 |
| Linda Martinez   | Philadelphia   | Regular          |          1 |     1169.99 |         1169.99 |
| Robert Garcia    | San Antonio    | Premium          |          2 |      432.47 |          216.24 |
+------------------+----------------+------------------+--------------+-------------+-----------------+
```

**Key Insights:**
- VIP and Premium segments drive highest revenue
- John Smith: Most orders (4) and highest total spend
- Linda Martinez: Highest single order value ($1,169.99)

---

## 6. Customer Segmentation Analysis

```
+------------------+-----------------+--------------+---------------+-----------------+
| customer_segment | total_customers | total_orders | total_revenue | avg_order_value |
+------------------+-----------------+--------------+---------------+-----------------+
| Premium          |               5 |           15 |       7336.78 |          489.12 |
| VIP              |               2 |            6 |       3379.95 |          563.33 |
| Regular          |               3 |            9 |       2618.60 |          291.03 |
+------------------+-----------------+--------------+---------------+-----------------+
```

**Key Insights:**
- Premium segment: 55.6% of revenue
- VIP segment: Highest average order value ($563.33)
- Regular segment: Opportunity for upselling

---

## 7. Month-over-Month Growth Rate

```
+----------+-----------+--------------------------+--------------------+
| month    | revenue   | previous_month_revenue   | growth_rate_percent|
+----------+-----------+--------------------------+--------------------+
| 2024-01  |   1609.96 |                     NULL |               NULL |
| 2024-02  |    774.95 |                  1609.96 |             -51.88 |
| 2024-03  |   1602.43 |                   774.95 |             106.78 |
| 2024-04  |    721.96 |                  1602.43 |             -54.95 |
| 2024-05  |    962.38 |                   721.96 |              33.31 |
| 2024-06  |   1989.95 |                   962.38 |             106.76 |
| 2024-07  |    582.41 |                  1989.95 |             -70.73 |
| 2024-08  |    751.94 |                   582.41 |              29.11 |
| 2024-09  |   1679.92 |                   751.94 |             123.41 |
| 2024-10  |    759.43 |                  1679.92 |             -54.79 |
+----------+-----------+--------------------------+--------------------+
```

**Key Insights:**
- Volatile month-to-month performance
- Strong growth in March (+106.78%), June (+106.76%), and September (+123.41%)
- Sharp declines in February, April, July, and October
- Indicates seasonal patterns or irregular purchasing

---

## 8. Payment Method Analysis

```
+----------------+--------------------+---------------+-------------------------+----------------------------+
| payment_method | total_transactions | total_revenue | avg_transaction_value   | percentage_of_transactions |
+----------------+--------------------+---------------+-------------------------+----------------------------+
| Credit Card    |                 18 |       9458.72 |                  525.48 |                      60.00 |
| PayPal         |                  6 |       1974.35 |                  329.06 |                      20.00 |
| Debit Card     |                  4 |        594.89 |                  148.72 |                      13.33 |
| Cash           |                  2 |        387.35 |                  193.68 |                       6.67 |
+----------------+--------------------+---------------+-------------------------+----------------------------+
```

**Key Insights:**
- Credit Card: Preferred payment method (60% of transactions)
- Credit Card users have highest avg transaction value ($525.48)
- Cash transactions: Smallest segment (6.67%)

---

## 9. Discount Effectiveness Analysis

```
+----------------+--------------+---------+-------------------------+
| discount_range | total_orders | revenue | avg_quantity_per_order  |
+----------------+--------------+---------+-------------------------+
| No Discount    |           10 | 3348.82 |                    2.90 |
| 6-10%          |           13 | 6825.90 |                    2.77 |
| 11-15%         |            7 | 3160.61 |                    2.00 |
+----------------+--------------+---------+-------------------------+
```

**Key Insights:**
- 6-10% discount range generates highest revenue
- No discount orders have highest avg quantity (2.90 items)
- Strategic discounts driving sales without margin erosion

---

## 10. RFM Customer Status Analysis

```
+--------------------+------------------+----------------------------+------------------+-------------+-----------------+
| customer_name      | customer_segment | days_since_last_purchase   | total_purchases  | total_spent | customer_status |
+--------------------+------------------+----------------------------+------------------+-------------+-----------------+
| John Smith         | Premium          |                         67 |                4 |     2514.94 | Active          |
| James Wilson       | VIP              |                         59 |                3 |     2429.96 | Active          |
| Michael Brown      | Premium          |                        223 |                3 |     1719.95 | At Risk         |
| Linda Martinez     | Regular          |                        155 |                1 |     1169.99 | At Risk         |
| David Lee          | VIP              |                         64 |                2 |     1854.98 | Occasional      |
| Robert Garcia      | Premium          |                        120 |                2 |      432.47 | At Risk         |
| Jennifer White     | Premium          |                         95 |                1 |      129.99 | At Risk         |
| Sarah Davis        | Regular          |                        193 |                2 |      372.38 | At Risk         |
| Emma Johnson       | Regular          |                        257 |                2 |      477.42 | At Risk         |
| Patricia Rodriguez | Regular          |                         79 |                2 |      232.25 | Occasional      |
+--------------------+------------------+----------------------------+------------------+-------------+-----------------+
```

**Key Insights:**
- 60% of customers are "At Risk" (need retention efforts)
- Only 20% are "Active" customers
- 20% are "Occasional" buyers
- No customers currently in VIP status (need review of criteria)
- Re-engagement campaigns needed for at-risk customers

---

## Summary Statistics

### Overall Performance (2024)
- **Total Revenue**: $13,335.33
- **Total Orders**: 30
- **Total Customers**: 10
- **Average Order Value**: $444.51
- **Total Products Sold**: 76 units

### Category Breakdown
- **Electronics**: $8,648.70 (64.8%)
- **Furniture**: $2,291.89 (17.2%)
- **Stationery**: $2,394.74 (18.0%)

### Customer Insights
- **Average Customer Lifetime Value**: $1,333.53
- **Repeat Purchase Rate**: 70% (7 out of 10 customers)
- **Top Segment**: Premium (55.6% revenue)

---

## Recommendations

1. **Customer Retention**: Focus on reactivating "At Risk" customers (60% of base)
2. **Product Strategy**: Expand Electronics inventory (highest margin & demand)
3. **Pricing**: Continue 6-10% discount strategy (highest revenue generator)
4. **Payment Options**: Maintain focus on Credit Card convenience
5. **Seasonal Planning**: Address volatility with consistent monthly promotions
6. **VIP Program**: Review criteria - no current VIP-status customers
7. **Inventory**: Stock up on Laptops and Monitors (top sellers)


