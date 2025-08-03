-- Topic: REGEXP for starting and ending chars
-- Link: https://www.hackerrank.com/challenges/weather-observation-station-8/problem?isFullScreen=true
SELECT CITY 
FROM STATION
WHERE LOWER(CITY) REGEXP '^[aeiou]' AND LOWER(CITY) REGEXP '[aeiou]$'