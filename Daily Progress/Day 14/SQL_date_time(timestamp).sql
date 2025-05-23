						--NUMERIC FUNCTIONS
							--round() in numbers
SELECT 
3.432,
ROUND(3.432,2) AS round_2,
ROUND(3.432,1) AS round_1,
ROUND(3.432,0) AS round_0

		-- ABS()--Absolute its is used to converts a negtive (-) to positive (+)

SELECT
-10,
ABS(-10)
	  
				--DAY(),MONTH(),YEAR()
USE SalesDB
	SELECT 
	OrderID,
	CreationTime,
	YEAR(CreationTime) year,
	DAY(CreationTime) day,
	MONTH(CreationTime) month
	FROM sales.Orders;

	 -- DATEPART 

USE SalesDB
	SELECT 
	OrderID,
	DATEPART(YEAR,CreationTime) YEAR_DP,
	DATEPART(MONTH,CreationTime) MONTH_DP,
	-- DATE NAME GIVES THE EXACT NAME OF THE MONTHS,DAY NAME
	DATENAME(MONTH,CreationTime) MONTH_NAME_DP,
	DATENAME(WEEKDAY,CreationTime) DAY_NAME_DP,
	DATEPART(DAY,CreationTime) DAY_DP,
	DATEPART(HOUR,CreationTime) HOUR_DP,
	DATEPART(QUARTER,CreationTime) QUARTER_DP,
	DATEPART(WEEK,CreationTime) WEEK_DP,	
	CreationTime,
	YEAR(CreationTime) year,
	DAY(CreationTime) day,
	MONTH(CreationTime) month
	FROM sales.Orders;