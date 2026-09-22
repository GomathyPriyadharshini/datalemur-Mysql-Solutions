-- Problem statement:
-- Retrieve the top three cities with the highest number of completed trade orders,
-- listed in descending order. Output the city name and the corresponding
-- number of completed trade orders.

-- Pattern:
-- GROUP BY + COUNT + ORDER BY + LIMIT

-- Technique:
-- Join the completed trade orders with the user details table using the user ID.
-- Group the results by city, count the completed orders for each city,
-- sort by the count in descending order, and return the top three cities.

-- Time complexity idea:
-- O(n log n), due to grouping and sorting the aggregated city counts.

SELECT
    u.city,
    COUNT(*) AS completed_trade_orders
FROM trades t
JOIN users u
    ON t.user_id = u.user_id
WHERE t.status = 'Completed'
GROUP BY u.city
ORDER BY completed_trade_orders DESC
LIMIT 3;
