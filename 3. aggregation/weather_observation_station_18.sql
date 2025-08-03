-- Topic: CTE, CO-ORDINATES, ROUND, ABS
-- Link: https://www.hackerrank.com/challenges/weather-observation-station-18/problem?isFullScreen=true
-- manhattan dist between two points (a,b) and (c,d) is |a-c| + |b-d|
WITH
P1 AS (
SELECT MIN(LAT_N) AS a, MIN(LONG_W) AS b
FROM STATION
),
P2 AS(
SELECT MAX(LAT_N) AS c, MAX(LONG_W) as d
FROM STATION
)
SELECT ROUND( ABS( a - c ) + ABS( b - d) , 4 )
FROM P1, P2
-- this problem don't even need cte(clarity), can be solved like below 
SELECT ROUND( ABS( MIN(LAT_N) - MAX(LAT_N) ) + ABS( MIN(LONG_W) - MAX(LONG_W)) , 4 )
FROM STATION