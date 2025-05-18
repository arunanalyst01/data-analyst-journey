use MyDatabase
--OUTER JOIN
SELECT o.order_id, c.customer_name
FROM orders o
FULL OUTER JOIN customers c ON o.customer_id = c.customer_id;
--LEFT JOIN
SELECT o.*
FROM orders o
LEFT JOIN customers c ON o.customer_id = c.customer_id
WHERE c.customer_id IS NULL;

--LEFT JOIN
SELECT c.*
FROM customers c
LEFT JOIN orders o ON o.customer_id = c.customer_id
WHERE o.customer_id IS NULL;

--CROSS JOIN
SELECT o.order_id, c.customer_name
FROM orders o
CROSS JOIN customers c;
