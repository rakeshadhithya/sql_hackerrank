-- Topic: CEIL, AVG, CAST, REPLACE
-- Link: https://www.hackerrank.com/challenges/the-blunder/problem?isFullScreen=true
-- same table, calculate avg - avg(convert salary to string, remove 0, convert to int)

-- a.
SELECT CEIL(AVG(Salary) -
       AVG(CAST(REPLACE(CAST(Salary AS CHAR), '0', '') AS UNSIGNED)))
FROM Employees

-- b.
-- MySQL is permissive about automatic type casting between strings and numbers
select ceil(avg(salary) - avg(replace(salary, '0', ''))) from employees; -- this is valid but will fail in postgres and sql server
