-- Pattern:
-- Anti-Join / NOT EXISTS

-- Technique:
-- Use NOT EXISTS to find pages for which no matching
-- record exists in the page_likes table.

-- Time complexity idea:
-- The database can use an index on page_likes.page_id
-- to efficiently check whether each page has a like.

--solution:

SELECT page_id
FROM pages t1
WHERE NOT EXISTS (
    SELECT 1
    FROM page_likes t2
    WHERE t1.page_id = t2.page_id
)
ORDER BY page_id;
