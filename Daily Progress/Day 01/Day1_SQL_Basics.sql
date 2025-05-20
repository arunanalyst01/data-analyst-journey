-- Creating a table for practice
CREATE TABLE Students (
    ID INT,
    First_Name VARCHAR(50),
    Country VARCHAR(50),
    Score INT
);

-- Inserting some data
INSERT INTO Students (ID, First_Name, Country, Score) VALUES
(1, 'John', 'USA', 85),
(2, 'Priya', 'India', 92),
(3, 'Ali', 'UAE', 75),
(4, 'Sara', 'UK', 65),
(5, 'Chen', 'China', 90),
(6, 'David', 'USA', 70),
(7, 'Aisha', 'India', 88)
 
 -- SELECT, FROM, WHERE
SELECT * FROM Students WHERE Score > 80;

-- SELECT with AND
SELECT * FROM Students WHERE Country = 'India' AND Score > 85;

-- SELECT with OR
SELECT * FROM Students WHERE Country = 'India' OR Country = 'USA';

-- ORDER BY Score DESC
SELECT * FROM Students ORDER BY Score DESC;

-- ALIAS usage
SELECT First_Name AS Name, Score AS Marks FROM Students;

-- LIMIT
SELECT * FROM Students ORDER BY Score DESC LIMIT 3;

-- GROUP BY with COUNT
SELECT Country, COUNT(Name) AS Total_Students FROM Students GROUP BY Country;

-- GROUP BY with AVG
SELECT Country, AVG(Score) AS Avg_Score FROM Students GROUP BY Country;

-- GROUP BY with SUM
SELECT Country, SUM(Score) AS Total_Score FROM Students GROUP BY Country;

-- HAVING with AVG
SELECT Country, AVG(Score) AS Avg_Score 
FROM Students 
GROUP BY Country 
HAVING AVG(Score) > 80;

