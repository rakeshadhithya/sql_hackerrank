-- TOPICS: WINDOW_FUNCTION, CTE, DATE FUNCTIONS
-- LINK: https://www.hackerrank.com/challenges/sql-projects/problem?isFullScreen=true

-- tables: Projects(tid, sd, ed)
-- requirements: select sd, ed. order by td, sd.
-- steps: rank table on asc end date, date sub of start date/end date and interval rnk days will give same date 
-- if end dates are consicutive, group on on that date_sub date. select min start date in group and max end date in group order by duration, sd
WITH ranked AS(
SELECT *, ROW_NUMBER() OVER(ORDER BY End_Date) AS rn
FROM Projects
),
grouped AS(
SELECT *, DATE_SUB(End_Date, INTERVAL rn DAY) AS grp
FROM ranked
)
SELECT MIN(Start_Date) AS sd, MAX(End_Date) AS ed
FROM grouped
GROUP BY grp
ORDER BY DATEDIFF(ed, sd) + 1, sd