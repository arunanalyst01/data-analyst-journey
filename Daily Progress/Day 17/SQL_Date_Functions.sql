-- CAST
USE SalesDB
SELECT CreationTime,
CAST(CreationTime AS DATE) AS [Datetime to Date]
FROM Sales.Orders
-- DATE ADD

USE SalesDB
SELECT CreationTime,
OrderID,OrderDate,
DATEADD(day,-10,OrderDate) AS TenDaysBefore,
DATEADD(MONTH,3,OrderDate) AS ThreeMonthsLater,
DATEADD(YEAR,2,OrderDate)	 as TwoYearsLater
FROM Sales.Orders;

--DATEDIFF() FIND THE DIFFERENCE BETWEENTWO DATES,
-- calculate the age of employees
SELECT 
EmployeeID,
BirthDate,
DATEDIFF(YEAR,BirthDate,GETDATE()) Age
FROM Sales.Employees;

-- find the average shipping duration in days for each month
 SELECT
 OrderID,OrderDate,ShipDate,
 DATEDIFF(day,OrderDate,ShipDate) Day2ship 
 from sales.Orders
-- now we finds an a average for each months 
 SELECT
 MONTH(orderDate)as orderDate,
AVG(DATEDIFF(day,OrderDate,ShipDate)) avgship
 from sales.Orders
 GROUP BY MONTH(OrderDate)
 --Time Gap Analysis
 -- Find the number of days between each order and  the previous order
 
 SELECT
 OrderID,OrderDate CurrentOrderDate,
 Lag(OrderDate) over(order by orderdate) PreviousOrderDate,
 DATEDIFF(day,lag(OrderDate)OVER(ORDER BY OrderDate),OrderDate) NrOfdate
  FROM SALES.Orders