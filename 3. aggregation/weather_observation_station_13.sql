-- Topic: TRUNCATE
-- Link: https://www.hackerrank.com/challenges/weather-observation-station-13/problem?isFullScreen=true
-- same table remove rows with lat_n out of given range. then calculate sum and truncate to 4 decimal places

SELECT TRUNCATE(SUM(LAT_N), 4)
FROM STATION
WHERE LAT_N > 38.7880 AND LAT_N < 137.2345
-- round vs truncate: -- ROUND looks at the next digit and may increase the last digit. TRUNCATE simply removes everything beyond the desired precision.
