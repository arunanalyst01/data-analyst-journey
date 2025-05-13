USE MyDatabase
--using all joins 
--INNER JOIN ,FULL JOIN ,Left JOIN,RIGHT JOIN

--INNER JOIN

 SELECT
		c.id,
		c.first_name,
		o.sales,
		o.order_id

 FROM customers as c
 inner join orders as o
	on c.id = o.customer_id;

-- FULL JOIN
SELECT
		c.id,
		c.first_name,
		o.sales,
		o.order_id

 FROM orders as o
	  full join customers as c
	on c.id = o.customer_id;

 -- LEFT join
 SELECT
		c.id,
		c.first_name,
		o.sales,
		o.order_id

 FROM orders as o
	  left join customers as c
	on c.id = o.customer_id;

 -- RIGHT join
 SELECT
		c.id,
		c.first_name,
		o.sales,
		o.order_id

 FROM orders as o
	  left join customers as c
	on c.id = o.customer_id;