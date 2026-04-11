SELECT user_city, COUNT(DISTINCT user_id) as users_count
FROM users_sql_project
WHERE user_city is not NULL
GROUP BY user_city 
ORDER BY users_count DESC;

SELECT order_id
FROM (SELECT order_id, SUM(quantity) AS total_quantity 
FROM order_items_sql_project
GROUP BY order_id) AS order_totals
WHERE total_quantity = (SELECT MAX(total_quantity)
FROM (SELECT order_id, SUM (quantity) AS total_quantity
FROM order_items_sql_project
GROUP BY order_id) AS toals);

SELECT order_id
FROM order_items_sql_project
GROUP BY order_id
ORDER BY SUM(quantity) DESC
LIMIT 1;

SELECT COUNT(DISTINCT o.order_id) AS total_orders
FROM orders_sql_project o
JOIN payments_sql_project p
ON o.order_id = p.order_id
WHERE p.payment_status != 'Відхилено' 
AND p.payment_method IN ('Картка', 'Банківський переказ');

SELECT user_id, COUNT(*) AS orders_count
FROM orders_sql_project
GROUP BY user_id
HAVING COUNT (*) >= 5
ORDER BY orders_count DESC;

SELECT SUM(oi.quantity) AS total_items,
COUNT(DISTINCT oi.order_id) AS total_orders
FROM order_items_sql_project oi
JOIN products_sql_project p
ON oi.product_id = p.product_id
WHERE product_brand = 'DigitalUA';

SELECT order_id, tracking_number, COALESCE(TO_CHAR(delivery_date, 'YYYY-MM-DD'), 'в роботі') AS delivery_status
FROM shipments_sql_project;

SELECT 
CASE 
WHEN user_age < 25 THEN 'молоді'
WHEN user_age BETWEEN 25 AND 44 THEN 'середній вік'
WHEN user_age >= 45 THEN 'старший вік'
END AS age_category,
COUNT(*) AS user_count
FROM users_sql_project 
GROUP BY age_category ORDER BY age_category;

SELECT user_city, COUNT(DISTINCT loyalty_status) AS loyalty_status_count
FROM users_sql_project
GROUP BY user_city
HAVING COUNT(DISTINCT loyalty_status) >= 3
ORDER BY loyalty_status_count ASC;

SELECT *
FROM users_sql_project
WHERE user_email LIKE '%@gmail.com';

SELECT courier, 
ROUND (AVG(delivery_date - shipment_date), 0) AS avg_delivery_days
FROM shipments_sql_project
WHERE delivery_status = 'Доставлено'
AND shipment_date IS NOT NULL
AND delivery_date IS NOT NULL
GROUP BY courier
ORDER BY avg_delivery_days ASC;



--- Q1 ---
SELECT user_city, COUNT(DISTINCT user_id) AS users_count
FROM users_sql_project
WHERE user_city is not NULL
GROUP BY user_city 
ORDER BY users_count DESC;
--- Q2 ---
SELECT order_id
FROM order_items_sql_project
GROUP BY order_id
ORDER BY SUM(quantity) DESC
LIMIT 1;
--- Q3 ---
SELECT COUNT(DISTINCT o.order_id) AS total_orders
FROM orders_sql_project o
JOIN payments_sql_project p
ON o.order_id = p.order_id
WHERE p.payment_status != 'Відхилено' 
AND p.payment_method IN ('Картка', 'Банківський переказ');
--- Q4 ---
SELECT user_id, COUNT(*) AS orders_count
FROM orders_sql_project
GROUP BY user_id
HAVING COUNT (*) >= 5
ORDER BY orders_count DESC;
--- Q5 ---
SELECT SUM(oi.quantity) AS total_items,
COUNT(DISTINCT oi.order_id) AS total_orders
FROM order_items_sql_project oi
JOIN products_sql_project p
ON oi.product_id = p.product_id
WHERE product_brand = 'DigitalUA';
--- Q6 ---
SELECT order_id, tracking_number, COALESCE(TO_CHAR(delivery_date, 'YYYY-MM-DD'), 'в роботі') AS delivery_status
FROM shipments_sql_project;
--- Q7 ---
SELECT 
CASE 
WHEN user_age < 25 THEN 'молоді'
WHEN user_age BETWEEN 25 AND 44 THEN 'середній вік'
WHEN user_age >= 45 THEN 'старший вік'
END AS age_category,
COUNT(*) AS user_count
FROM users_sql_project 
GROUP BY age_category ORDER BY age_category;
--- Q8 ---
SELECT user_city, COUNT(DISTINCT loyalty_status) AS loyalty_status_count
FROM users_sql_project
GROUP BY user_city
HAVING COUNT(DISTINCT loyalty_status) >= 3
ORDER BY loyalty_status_count ASC;
--- Q9 ---
SELECT *
FROM users_sql_project
WHERE user_email LIKE '%@gmail.com';
--- Q10 ---
SELECT courier, 
ROUND (AVG(delivery_date - shipment_date), 0) AS avg_delivery_days
FROM shipments_sql_project
WHERE delivery_status = 'Доставлено'
AND shipment_date IS NOT NULL
AND delivery_date IS NOT NULL
GROUP BY courier
ORDER BY avg_delivery_days ASC;

