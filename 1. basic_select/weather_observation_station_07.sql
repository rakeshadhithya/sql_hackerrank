-- Topic: REGEXP for ending chars
-- Link: https://www.hackerrank.com/challenges/weather-observation-station-7/problem?isFullScreen=true
SELECT DISTINCT CITY
FROM STATION
WHERE LOWER(CITY) REGEXP '[aeiou]$'