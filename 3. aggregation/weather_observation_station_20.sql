-- Topic: MEDIAN, WINDOW, CTE, ROUND
-- Link: https://www.hackerrank.com/challenges/weather-observation-station-20/problem?isFullScreen=true
-- median: first count total occurances, then sort ascending. if count is even then avg of middle two occurances, if count is odd then middle occurance 
-- new table with row number asigned over sorted lat_n. another table to keep total count. then from those two if find median as above 

WITH 
Ordered AS(
SELECT LAT_N, 
       ROW_NUMBER() OVER (ORDER BY LAT_N) AS rn,
       COUNT(*) OVER () AS n -- total rows
FROM STATION
),
median_lat AS(
    SELECT
     CASE 
      WHEN n % 2 = 0 THEN
        (
            SELECT AVG(LAT_N)
            FROM Ordered
            WHERE rn IN (n/2, n/2 + 1)
        )
      ELSE
        (
            SElECT LAT_N
            FROM Ordered
            WHERE rn = (n+1)/2
        )
     END AS median
    FROM Ordered
    LIMIT 1
)
SELECT ROUND(median, 4)
FROM median_lat
-- if only aggregates in select then without grouping works, if aggregates plus normal columns then without grouping throws error, use OVER() for aggregate
-- when cte's don't confuse from which tables you are selecting

