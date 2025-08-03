-- Topic: ROUND, MIN
-- Link: https://www.hackerrank.com/challenges/weather-observation-station-16/problem?isFullScreen=true
-- same table keep rows wher lat_n > 38.7780. select smallest lat_n in it and round it

SELECT ROUND(MIN(LAT_N), 4)
FROM STATION
WHERE LAT_N > 38.7780