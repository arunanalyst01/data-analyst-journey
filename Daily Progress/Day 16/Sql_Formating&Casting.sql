--EOMONTH 
USE SalesDB
SELECT OrderID,
CreationTime,
EOMONTH(CreationTime) AS End_of_month,
CAST(DATETRUNC(month, CreationTime)as date) Startofmonth
from Sales.Orders
--Format and casting
SELECT OrderID,CreationTime,
FORMAT(CreationTime,'mm-dd-yyyy')USA_Format,
FORMAT(CreationTime,'ddd')ddd,
FORMAT(CreationTime,'dddd')dddd,
FORMAT(CreationTime,'mm')mm,
FORMAT(CreationTime,'mmm')mmm,
FORMAT(CreationTime,'mmmm')mmmm
 FROM Sales.Orders;
 --show CreationTime using the following format:
 --Day wed jan Q1 2025 12:34:56 PM


SELECT OrderID,
CreationTime,
'Day '+ FORMAT(CreationTime,'ddd MMM')+
' Q'+DATENAME(QUARTER,CreationTime)+' '+
FORMAT(CreationTime,'yyyy hh:mm:ss tt') AS customeFormat
FROM sales.Orders;
