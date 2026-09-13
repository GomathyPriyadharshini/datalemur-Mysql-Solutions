-- Problem Statement:
-- Write a query that calculates the total viewership for laptops and mobile devices
-- where mobile is defined as the sum of tablet and phone viewership.
-- Output the total viewership for laptops as laptop_views and the total viewership
-- for mobile devices as mobile_views.

-- Pattern:
-- Conditional aggregation using SUM(CASE WHEN ... THEN 1 ELSE 0 END)

-- Technique:
-- Use CASE statements to classify each row by device type.
-- Count laptop rows as laptop_views.
-- Count phone and tablet rows together as mobile_views.

-- Time complexity idea:
-- O(n), where n is the number of rows in the viewership table.
-- The table is scanned once.

SELECT
SUM(CASE
WHEN device_type = 'laptop' THEN 1
ELSE 0
END) AS laptop_views,
SUM(CASE
WHEN device_type IN ('phone', 'tablet') THEN 1
ELSE 0
END) AS mobile_views
FROM viewership;
