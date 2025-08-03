-- Topic: MAX
-- Link: https://www.hackerrank.com/challenges/weather-observation-station-14/problem?isFullScreen=true
-- same table remove rows with lat_n < given value, calculate max in it (or) order by desc and limit to 1 and calculate lat_n

SELECT TRUNCATE(MAX(LAT_N), 4)
FROM STATION
WHERE LAT_N < 137.2345