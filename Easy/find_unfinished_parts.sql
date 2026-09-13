-- Problem Statement:
-- Tesla is investigating production bottlenecks and they need your help to
-- extract the relevant data. Write a query to determine which parts have
-- begun the assembly process but are not yet finished.
--
-- Assumptions:
-- parts_assembly table contains all parts currently in production, each at
-- varying stages of the assembly process.
-- An unfinished part is one that lacks a finish_date.
--
-- Pattern:
-- Filtering rows based on a NULL value.
--
-- Technique:
-- Use the IS NULL operator to find parts where finish_date has not been set.
--
-- Time complexity idea:
-- O(n), where n is the number of rows in parts_assembly.
--
-- Solution:

SELECT part, assembly_step
FROM parts_assembly
WHERE finish_date IS NULL;
