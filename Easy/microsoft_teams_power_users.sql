-- Problem:
-- Write a query to identify the top 2 Power Users who sent the highest number
-- of messages on Microsoft Teams in August 2022.
-- Display the IDs of these 2 users along with the total number of messages
-- they sent. Output the results in descending order based on message count.
--
-- Assumption:
-- No two users have sent the same number of messages in August 2022.

-- Pattern:
-- GROUP BY + COUNT + ORDER BY + LIMIT

-- Technique:
-- Filter messages to August 2022 using EXTRACT().
-- Group messages by sender_id and count the messages for each user.
-- Sort the counts in descending order and return the top 2 users.

-- Time complexity idea:
-- O(n) to scan the messages, with grouping and sorting by user message counts.

SELECT
    sender_id,
    COUNT(*) AS message_count
FROM messages
WHERE EXTRACT(MONTH FROM sent_date) = 8
  AND EXTRACT(YEAR FROM sent_date) = 2022
GROUP BY sender_id
ORDER BY message_count DESC
LIMIT 2;
