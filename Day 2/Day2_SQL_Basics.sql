-- 1. TOP (SQL Server) or LIMIT (MySQL)
SELECT TOP 5 * FROM customers; -- SQL Server
-- SELECT * FROM customers LIMIT 5; -- MySQL

-- 2. DISTINCT
SELECT DISTINCT city FROM customers;

-- 3. Multi Queries (semicolon separates them)
SELECT * FROM products;
SELECT * FROM orders;

-- 4. Static Values
SELECT 'Hello World' AS greeting;

-- 5. WHERE Operator: =
SELECT * FROM customers WHERE city = 'Delhi';

-- 6. WHERE Operator: >
SELECT * FROM orders WHERE amount > 1000;

-- 7. WHERE Operator: BETWEEN
SELECT * FROM orders WHERE amount BETWEEN 500 AND 1000;

-- 8. WHERE Operator: LIKE
SELECT * FROM customers WHERE name LIKE 'A%';

-- 9. DDL: Create Table
CREATE TABLE employees (
  id INT,
  name VARCHAR(50),
  salary INT
);

-- 10. DDL: Drop Table
DROP TABLE old_customers;

-- 11. DML: Insert
INSERT INTO employees (id, name, salary) VALUES (1, 'Raj', 50000);

-- 12. DML: Update
UPDATE employees SET salary = 60000 WHERE name = 'Raj';

-- 13. DML: Delete
DELETE FROM employees WHERE name = 'Raj';

-- 14. WHERE with AND/OR
SELECT * FROM customers WHERE city = 'Chennai' AND age > 25;

-- 15. Aggregate Function with GROUP BY
SELECT city, COUNT(*) AS total_customers
FROM customers
GROUP BY city;
