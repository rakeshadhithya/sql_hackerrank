-- Topic: JOINS, SCALER SUBQUERY
-- Link: https://www.hackerrank.com/challenges/the-company/problem?isFullScreen=true

-- a. USING JOINS
-- require: new table with company code, founder name, total lead managers, total senior managers, total managers, 
-- total employees. given tables of company, lead manager, senior manager, manager, employee
SELECT 
    c.company_code,
    c.founder,
    COUNT(DISTINCT lm.lead_manager_code) AS total_lead_managers,
    COUNT(DISTINCT sm.senior_manager_code) AS total_senior_managers,
    COUNT(DISTINCT m.manager_code) AS total_managers,
    COUNT(DISTINCT e.employee_code) AS total_employees
FROM Company c
LEFT JOIN Lead_Manager lm 
    ON c.company_code = lm.company_code
LEFT JOIN Senior_Manager sm 
    ON c.company_code = sm.company_code
LEFT JOIN Manager m 
    ON c.company_code = m.company_code
LEFT JOIN Employee e 
    ON c.company_code = e.company_code
GROUP BY c.company_code, c.founder
ORDER BY c.company_code ASC;

-- b. Using SCALAR SUBQUERIES
SELECT  
    c.company_code,
    c.founder,
    (SELECT COUNT(*) FROM Lead_Manager WHERE company_code = c.company_code),
    (SELECT COUNT(*) FROM Senior_Manager WHERE company_code = c.company_code),
    (SELECT COUNT(*) FROM Manager WHERE company_code = c.company_code),
    (SELECT COUNT(*) FROM Employee WHERE company_code = c.company_code)
FROM Company AS c 
ORDER BY c.company_code;

/*
Learnings: 
left join instead of join because: All companies appear in the result, even if they have no lead managers, senior managers, managers, or employees.
count(*), count(1), count(x) all are same. SQL evaluates the 1 or x for each row, and since 1 or x is a constant and never NULL, each row contributes one to the count.
A scalar subquery is a subquery that returns exactly one value (a single row and single column).
Advantages of scalar subqueries: They are simple to write, easy to understand for small datasets, and work well for single-value lookups.
Disadvantages: They can be slow on large datasets due to repeated execution per row, don't handle duplicates well without extra care, and are harder to scale or extend.
JOINs are preferred for performance, accurate aggregation, and flexibility when working with related tables and larger data.
*/
