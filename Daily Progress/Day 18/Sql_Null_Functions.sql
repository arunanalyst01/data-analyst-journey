USE SalesDB
SELECT
ISDATE('2025')
FROM Sales.Orders;
--NULL 
--Display the full name of the customer in a single field
--by merging their first and last names,
--and add 10 bonus points to each customer's score.
 SELECT 
 CustomerID,
 FirstName,
 LastName,
 FirstName+' '+ COALESCE(LastName,'') AS fullname,
 Score,
 COALESCE(Score,0) + 10 AS ScoreWithBonus
 from sales.Customers
 
