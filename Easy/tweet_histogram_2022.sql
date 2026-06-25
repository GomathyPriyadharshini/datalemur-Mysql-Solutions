-- Problem Statement:
-- Given a Twitter tweets table, write a query to obtain a histogram of tweets posted per user in 2022.
-- Output the tweet count per user as the bucket and the number of users who fall into that bucket.
--
-- In other words, group users by how many tweets they posted in 2022 and count how many users fall into each group.

-- Pattern:
-- Aggregation + Nested Aggregation (Group By within Subquery)

-- Technique:
-- 1. Filter tweets for year 2022
-- 2. Count tweets per user (inner aggregation)
-- 3. Group by tweet count to build histogram (outer aggregation)

-- Time complexity idea:
-- O(n) to scan rows + O(u log u) depending on grouping (n = tweets, u = users)

-- Solution:

SELECT tweet_bucket,
       COUNT(*) AS users_num
FROM (
    SELECT user_id,
           COUNT(*) AS tweet_bucket
    FROM tweets
    WHERE YEAR(tweet_date) = 2022
    GROUP BY user_id
) t
GROUP BY tweet_bucket
ORDER BY tweet_bucket;
