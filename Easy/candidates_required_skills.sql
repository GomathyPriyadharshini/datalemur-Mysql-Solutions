-- Problem Statement:
-- Given a table of candidates and their skills, find candidates who
-- possess all the required skills: Python, Tableau, and PostgreSQL.
-- Sort the output by candidate ID in ascending order.

-- Pattern:
-- Filtering + GROUP BY + HAVING

-- Technique:
-- Filter for the required skills, group rows by candidate_id,
-- and use HAVING COUNT(*) = 3 to ensure the candidate has all
-- three required skills.

-- Time Complexity Idea:
-- O(n), where n is the number of rows in the candidates table,
-- assuming efficient grouping/indexing.

-- solution:

SELECT candidate_id
FROM candidates
WHERE skill IN ('Python', 'Tableau', 'PostgreSQL')
GROUP BY candidate_id
HAVING COUNT(*) = 3
ORDER BY candidate_id;
