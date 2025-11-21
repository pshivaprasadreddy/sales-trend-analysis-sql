-- Sales Trend Analysis Database Schema
-- This script creates the database structure for sales analysis

-- Create database
CREATE DATABASE IF NOT EXISTS sales_analysis;
USE sales_analysis;

-- Create Customers table
CREATE TABLE IF NOT EXISTS customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    phone VARCHAR(20),
    city VARCHAR(50),
    state VARCHAR(50),
    country VARCHAR(50),
    signup_date DATE,
    customer_segment VARCHAR(20)
);

-- Create Products table
CREATE TABLE IF NOT EXISTS products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    sub_category VARCHAR(50),
    unit_price DECIMAL(10, 2),
    cost_price DECIMAL(10, 2),
    stock_quantity INT DEFAULT 0
);

-- Create Sales table
CREATE TABLE IF NOT EXISTS sales (
    sale_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    product_id INT,
    sale_date DATE NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(10, 2),
    discount_percent DECIMAL(5, 2) DEFAULT 0,
    total_amount DECIMAL(10, 2),
    payment_method VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Create Regions table
CREATE TABLE IF NOT EXISTS regions (
    region_id INT PRIMARY KEY AUTO_INCREMENT,
    region_name VARCHAR(50) NOT NULL,
    country VARCHAR(50)
);

-- Create Sales_Targets table
CREATE TABLE IF NOT EXISTS sales_targets (
    target_id INT PRIMARY KEY AUTO_INCREMENT,
    region_id INT,
    year INT,
    quarter INT,
    target_amount DECIMAL(12, 2),
    FOREIGN KEY (region_id) REFERENCES regions(region_id)
);

-- Create indexes for better query performance
CREATE INDEX idx_sale_date ON sales(sale_date);
CREATE INDEX idx_customer_id ON sales(customer_id);
CREATE INDEX idx_product_id ON sales(product_id);
CREATE INDEX idx_customer_city ON customers(city);
CREATE INDEX idx_product_category ON products(category);
