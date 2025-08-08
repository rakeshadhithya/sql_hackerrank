-- TOPICS: WINDOW_FUNCTION, CTE, DATE FUNCTIONS
-- LINK: https://www.hackerrank.com/challenges/sql-projects/problem?isFullScreen=true

-- end date minus rownumber(ascending end date) gives SAME date(start date)

WITH
numbered AS(
SELECT *,
       ROW_NUMBER() OVER ( ORDER BY End_Date) AS rn
FROM Projects
),
grouped AS(
SELECT *,
       DATE_SUB(Start_Date, INTERVAL rn DAY ) AS grp_key
FROM numbered
),
projects_grouped AS(
SELECT MIN(Start_Date) AS start_day,
       MAX(End_Date) AS end_day,
       DATEDIFF( MAX(End_Date), MIN(Start_Date) ) + 1 AS duration
FROM grouped
GROUP BY grp_key
)
SELECT start_day,
       end_day
FROM projects_grouped
ORDER BY duration, start_day