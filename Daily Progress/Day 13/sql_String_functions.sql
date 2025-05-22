								-- string functions i covered today
USE MyDatabase
--concat
-- show a list of customers first name  with a country name together in a one column 
SELECT first_name,
country,
CONCAT(first_name,' ',country) AS done
FROM customers;

--lower 
--make a coustomer name lower
  SELECT 
  first_name,
  country,
  LOWER(first_name) AS Name_changed
  FROM customers;

  --upper 
--make a coustomer name upper
    SELECT 
  first_name,
  country,
 UPPER(first_name) AS Name_changed
  FROM customers;
  
  --TRIM
  --find whoes first name contains TRAILING and LEADING
     SELECT 
  first_name,
  country
  FROM customers
  UPDATE customers
  SET first_name = TRIM(first_name)
  WHERE first_name!=TRIM(first_name);

  --REPLACE 
  -- remove all dashes from the phone number 
     SELECT 
	 '123-456-7890' AS phone_number,
	 REPLACE('123-456-789','-','')AS Phone_number_cleaned
	
	--LEN
	-- calculate the length of each customer's first name
	
	SELECT 
	first_name,
	country,
	len(first_name)
	FROM customers;

-- LEFT() & RIGHT()
-- retrive the first two  and last two character of each first name 
SELECT 
first_name,
country,
	LEFT(TRIM(first_name),2)
FROM customers;

SELECT 
first_name,
country,
	RIGHT((first_name),2)
FROM customers;

-- substring 
SELECT 
first_name,
SUBSTRING(TRIM(first_name),2,LEN(first_name)) AS sub_name
FROM customers