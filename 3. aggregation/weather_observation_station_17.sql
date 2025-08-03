-- Topic: CTE, ROUND
-- Link: https://www.hackerrank.com/challenges/weather-observation-station-17/problem?isFullScreen=true
-- same table find long_w where its lat_n is smallest > 38.7780. instead of subquery i used cte which is more readable but not useful as subquery is calculated only once and cte requires unnecesary join
WITH smallest AS(
SELECT MIN(LAT_N) AS min
FROM STATION
WHERE LAT_N > 38.7780
)
SELECT ROUND(LONG_W, 4)
FROM STATION, smallest
WHERE LAT_N = min