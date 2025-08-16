
-- Create table
CREATE TABLE online_sales (
    order_id INT,
    order_date DATE,
    amount DECIMAL(10,2),
    product_id INT
);

-- Load data from CSV (adjust file path as needed for your MySQL setup)
-- Example for LOCAL INFILE (requires secure_file_priv to be set properly):
-- LOAD DATA LOCAL INFILE 'path/to/online_sales.csv'
-- INTO TABLE online_sales
-- FIELDS TERMINATED BY ','
-- ENCLOSED BY '"'
-- LINES TERMINATED BY '\n'
-- IGNORE 1 ROWS
-- (order_id, order_date, amount, product_id);

-- Sales Trend Analysis
SELECT 
    YEAR(order_date) AS sales_year,
    MONTH(order_date) AS sales_month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM online_sales
GROUP BY sales_year, sales_month
ORDER BY sales_year, sales_month;
