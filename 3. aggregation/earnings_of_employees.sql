-- Topic: MAX, COUNT, SUBQUERY, JOIN 
-- Link: https://www.hackerrank.com/challenges/earnings-of-employees/problem?isFullScreen=true
-- same table remove salary < max salary, then calculate max salary and how many people received

-- a. MULTIPLE COULUMS FOR FUNCTIONS
SELECT MAX(salary * months), COUNT(*)
FROM Employee
WHERE (salary * months) = 
      (SELECT MAX(salary * months)
        FROM Employee)
-- b. you can also write like this, groups by 1st column, order by 1st column, but above query works efficient in large datasets
SELECT months * salary, COUNT(*)
FROM Employee
GROUP BY 1
ORDER BY 1 DESC
LIMIT 1