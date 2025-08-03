-- Topic: ROUND, MAX, SUBQUERY
-- Link: https://www.hackerrank.com/challenges/weather-observation-station-15/problem?isFullScreen=true
-- same table keep rows only with LAT_N < 137.2345, calculate max in it and calculate long_w where lat_n is that max

SELECT ROUND(LONG_W, 4)
FROM STATION
WHERE LAT_N = 
      (SELECT MAX(LAT_N)
       FROM STATION
       WHERE LAT_N < 137.2345)