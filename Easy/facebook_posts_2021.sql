-- Problem:
-- Given a table of Facebook posts, for each user who posted at least twice in 2021,
-- find the number of days between their first post and last post of the year.
-- Output the user and the number of days between their first and last post.

-- Pattern:
-- GROUP BY + MIN/MAX + DATEDIFF

-- Technique:
-- Filter posts to 2021, group by user_id, and use MIN() and MAX()
-- to find each user's first and last post dates.
-- DATEDIFF() calculates the number of days between those dates.
-- HAVING days_between > 0 ensures the user posted on at least two different days.

-- Time complexity idea:
-- O(n) to scan the posts, with GROUP BY processing per user.

SELECT
    user_id,
    DATEDIFF(MAX(post_date), MIN(post_date)) AS days_between
FROM posts
WHERE YEAR(post_date) = 2021
GROUP BY user_id
HAVING days_between > 0;
