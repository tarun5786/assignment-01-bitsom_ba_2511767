-- Q1: List all customers from Mumbai along with their total order value
SELECT 
    cust.customer_name,
    cust.customer_city,
    SUM(ord_.quantity * prod.unit_price) AS total_value
FROM
    customers AS cust
        INNER JOIN
    orders_placed AS ord_ ON ord_.customer_id = cust.customer_id
        INNER JOIN
    products AS prod ON ord_.product_id = prod.product_id
WHERE
    cust.customer_city = 'Mumbai'
GROUP BY cust.customer_id;

-- Q2: Find the top 3 products by total quantity sold
SELECT 
    prod.product_name, SUM(ord_.quantity) AS sold_quantity
FROM
    products AS prod
        INNER JOIN
    orders_placed AS ord_ ON prod.product_id = ord_.product_id
GROUP BY prod.product_name
ORDER BY sold_quantity DESC
LIMIT 3;

-- Q3: List all sales representatives and the number of unique customers they have handled
SELECT 
    emp.sales_rep_name AS sales_representative,
    COUNT(DISTINCT cust.customer_id) AS customer_dealt
FROM
    customers AS cust
        INNER JOIN
    orders_placed AS ord_ ON ord_.customer_id = cust.customer_id
        INNER JOIN
    employees AS emp ON emp.sales_rep_id = ord_.sales_rep_id
GROUP BY emp.sales_rep_name;

-- Q4: Find all orders where the total value exceeds 10,000, sorted by value descending
SELECT 
    ord_.order_id,
    prod.unit_price * ord_.quantity AS total_value
FROM
    orders_placed AS ord_
        INNER JOIN
    products AS prod ON prod.product_id = ord_.product_id
HAVING total_value > 10000
ORDER BY total_value DESC;

-- Q5: Identify any products that have never been ordered
SELECT 
    prod.product_name AS not_ordered
FROM
    products AS prod
        LEFT JOIN
    orders_placed AS ord_ ON prod.product_id = ord_.product_id
WHERE
    ord_.product_id IS NULL;








    


