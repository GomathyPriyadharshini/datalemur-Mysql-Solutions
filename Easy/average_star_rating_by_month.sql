--Problem Statement:
--Given the reviews table, write a query to retrieve the average star rating for each product, grouped by month. The output should display the month as a numerical value, product ID, and average star rating rounded to two decimal places. Sort the output first by month and then by product ID.

-- Pattern: Aggregation and Grouping
-- Technique: GROUP BY with EXTRACT, AVG, ROUND, and ORDER BY
-- Time complexity idea: O(n + g log g), where n is the number of rows and g is the number of groups, assuming hash-based grouping and sorting the grouped results.

--Solution:
SELECT
    EXTRACT(MONTH FROM submit_date) AS mth,
    product_id AS product,
    ROUND(AVG(stars)::NUMERIC, 2) AS avg_stars
FROM reviews
GROUP BY EXTRACT(MONTH FROM submit_date), product_id
ORDER BY mth, product;
