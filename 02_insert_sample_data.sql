-- Sample Data for Sales Analysis
-- This script inserts sample data into the tables

USE sales_analysis;

-- Insert Customers
INSERT INTO customers (customer_name, email, phone, city, state, country, signup_date, customer_segment) VALUES
('John Smith', 'john.smith@email.com', '555-0101', 'New York', 'NY', 'USA', '2023-01-15', 'Premium'),
('Emma Johnson', 'emma.j@email.com', '555-0102', 'Los Angeles', 'CA', 'USA', '2023-02-20', 'Regular'),
('Michael Brown', 'mbrown@email.com', '555-0103', 'Chicago', 'IL', 'USA', '2023-03-10', 'Premium'),
('Sarah Davis', 'sarah.d@email.com', '555-0104', 'Houston', 'TX', 'USA', '2023-04-05', 'Regular'),
('James Wilson', 'jwilson@email.com', '555-0105', 'Phoenix', 'AZ', 'USA', '2023-05-12', 'VIP'),
('Linda Martinez', 'linda.m@email.com', '555-0106', 'Philadelphia', 'PA', 'USA', '2023-06-18', 'Regular'),
('Robert Garcia', 'rgarcia@email.com', '555-0107', 'San Antonio', 'TX', 'USA', '2023-07-22', 'Premium'),
('Patricia Rodriguez', 'patricia.r@email.com', '555-0108', 'San Diego', 'CA', 'USA', '2023-08-30', 'Regular'),
('David Lee', 'dlee@email.com', '555-0109', 'Dallas', 'TX', 'USA', '2023-09-14', 'VIP'),
('Jennifer White', 'jwhite@email.com', '555-0110', 'San Jose', 'CA', 'USA', '2023-10-25', 'Premium');

-- Insert Products
INSERT INTO products (product_name, category, sub_category, unit_price, cost_price, stock_quantity) VALUES
('Laptop Pro 15', 'Electronics', 'Computers', 1299.99, 800.00, 50),
('Wireless Mouse', 'Electronics', 'Accessories', 29.99, 15.00, 200),
('USB-C Hub', 'Electronics', 'Accessories', 49.99, 25.00, 150),
('Office Chair Deluxe', 'Furniture', 'Chairs', 399.99, 200.00, 30),
('Standing Desk', 'Furniture', 'Desks', 599.99, 350.00, 25),
('Mechanical Keyboard', 'Electronics', 'Accessories', 129.99, 70.00, 100),
('Monitor 27"', 'Electronics', 'Displays', 349.99, 200.00, 40),
('Desk Lamp LED', 'Furniture', 'Lighting', 79.99, 40.00, 80),
('Notebook Set', 'Stationery', 'Writing', 19.99, 8.00, 300),
('Pen Collection', 'Stationery', 'Writing', 24.99, 10.00, 250);

-- Insert Sales (2024 data)
INSERT INTO sales (customer_id, product_id, sale_date, quantity, unit_price, discount_percent, total_amount, payment_method) VALUES
(1, 1, '2024-01-10', 1, 1299.99, 10.0, 1169.99, 'Credit Card'),
(2, 2, '2024-01-15', 2, 29.99, 0.0, 59.98, 'PayPal'),
(3, 4, '2024-01-20', 1, 399.99, 5.0, 379.99, 'Credit Card'),
(1, 6, '2024-02-05', 1, 129.99, 0.0, 129.99, 'Credit Card'),
(4, 3, '2024-02-12', 3, 49.99, 10.0, 134.97, 'Debit Card'),
(5, 5, '2024-02-18', 1, 599.99, 15.0, 509.99, 'Credit Card'),
(2, 7, '2024-03-01', 1, 349.99, 5.0, 332.49, 'PayPal'),
(6, 9, '2024-03-08', 5, 19.99, 0.0, 99.95, 'Cash'),
(3, 1, '2024-03-15', 1, 1299.99, 10.0, 1169.99, 'Credit Card'),
(7, 8, '2024-04-02', 2, 79.99, 5.0, 151.98, 'Credit Card'),
(8, 2, '2024-04-10', 1, 29.99, 0.0, 29.99, 'Debit Card'),
(9, 5, '2024-04-18', 1, 599.99, 10.0, 539.99, 'Credit Card'),
(10, 6, '2024-05-03', 1, 129.99, 0.0, 129.99, 'PayPal'),
(1, 7, '2024-05-12', 2, 349.99, 15.0, 594.98, 'Credit Card'),
(4, 10, '2024-05-20', 10, 24.99, 5.0, 237.41, 'Cash'),
(5, 4, '2024-06-05', 2, 399.99, 10.0, 719.98, 'Credit Card'),
(6, 1, '2024-06-14', 1, 1299.99, 10.0, 1169.99, 'Credit Card'),
(7, 3, '2024-06-22', 2, 49.99, 0.0, 99.98, 'Debit Card'),
(2, 9, '2024-07-08', 8, 19.99, 10.0, 143.93, 'PayPal'),
(8, 6, '2024-07-15', 1, 129.99, 5.0, 123.49, 'Credit Card'),
(9, 7, '2024-07-23', 1, 349.99, 10.0, 314.99, 'Credit Card'),
(3, 2, '2024-08-02', 3, 29.99, 0.0, 89.97, 'Debit Card'),
(10, 8, '2024-08-10', 2, 79.99, 5.0, 151.98, 'PayPal'),
(1, 5, '2024-08-18', 1, 599.99, 15.0, 509.99, 'Credit Card'),
(4, 4, '2024-09-05', 1, 399.99, 10.0, 359.99, 'Credit Card'),
(5, 1, '2024-09-12', 1, 1299.99, 10.0, 1169.99, 'Credit Card'),
(6, 10, '2024-09-20', 6, 24.99, 0.0, 149.94, 'Cash'),
(7, 7, '2024-10-03', 1, 349.99, 5.0, 332.49, 'Credit Card'),
(8, 3, '2024-10-11', 4, 49.99, 10.0, 179.96, 'Debit Card'),
(9, 6, '2024-10-18', 2, 129.99, 5.0, 246.98, 'PayPal');

-- Insert Regions
INSERT INTO regions (region_name, country) VALUES
('Northeast', 'USA'),
('Southeast', 'USA'),
('Midwest', 'USA'),
('Southwest', 'USA'),
('West', 'USA');

-- Insert Sales Targets
INSERT INTO sales_targets (region_id, year, quarter, target_amount) VALUES
(1, 2024, 1, 50000.00),
(1, 2024, 2, 55000.00),
(1, 2024, 3, 60000.00),
(1, 2024, 4, 65000.00),
(2, 2024, 1, 45000.00),
(2, 2024, 2, 50000.00),
(2, 2024, 3, 55000.00),
(2, 2024, 4, 60000.00),
(3, 2024, 1, 40000.00),
(3, 2024, 2, 45000.00),
(3, 2024, 3, 50000.00),
(3, 2024, 4, 55000.00),
(4, 2024, 1, 48000.00),
(4, 2024, 2, 52000.00),
(4, 2024, 3, 57000.00),
(4, 2024, 4, 62000.00),
(5, 2024, 1, 55000.00),
(5, 2024, 2, 60000.00),
(5, 2024, 3, 65000.00),
(5, 2024, 4, 70000.00);
