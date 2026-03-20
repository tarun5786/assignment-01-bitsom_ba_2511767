-- Q1: Total sales revenue by product category for each month
SELECT 
    dp.category,
    d.month_,
    SUM(fs.units_sold * fs.unit_price) AS revenue
FROM
    fact_sales AS fs
        INNER JOIN
    dim_date AS d ON d.date_id = fs.date_id
        INNER JOIN
    dim_product AS dp ON dp.product_id = fs.product_id
GROUP BY dp.category , d.month_;

-- Q2: Top 2 performing stores by total revenue
SELECT 
    ds.store_name, SUM(fs.units_sold * fs.unit_price) AS revenue
FROM
    fact_sales AS fs
        INNER JOIN
    dim_store AS ds ON ds.store_id = fs.store_id
GROUP BY ds.store_name
ORDER BY revenue DESC
LIMIT 2;

-- Q3: Month-over-month sales trend across all stores
SELECT 
    d.year_,
    d.month_,
    SUM(fs.units_sold * fs.unit_price) AS sales_revenue
FROM
    fact_sales as fs
        INNER JOIN
    dim_date AS d ON d.date_id = fs.date_id
GROUP BY d.year_, d.month_
ORDER BY d.year_, d.month_;
