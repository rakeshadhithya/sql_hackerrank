-- Topic: REGEXP for do not ending chars
-- Link: https://www.hackerrank.com/challenges/weather-observation-station-10/problem?isFullScreen=true
SELECT DISTINCT CITY 
FROM STATION
WHERE LOWER(CITY) REGEXP '[^aeiou]$'