-- Problem statement:
-- Count the number of companies that have duplicate job listings,
-- where the duplicate listings belong to the same company and have
-- the same title and description.

-- Pattern:
-- Correlated EXISTS subquery

-- Technique:
-- For each job listing, check whether another listing exists
-- for the same company with the same title and description.
-- Use job_id <> job_id to ensure it is a different listing.
-- DISTINCT company_id ensures each company is counted only once.

-- Time complexity idea:
-- Without indexes, the correlated EXISTS can result in O(n²) comparisons
-- in the worst case.
-- With appropriate indexes on company_id, title, and description,
-- the database can significantly reduce the lookup cost.

SELECT COUNT(DISTINCT company_id) AS duplicate_companies
FROM job_listings t1
WHERE EXISTS (
SELECT 1
FROM job_listings t2
WHERE t1.company_id = t2.company_id
AND t1.job_id <> t2.job_id
AND t1.title = t2.title
AND t1.description = t2.description
);
