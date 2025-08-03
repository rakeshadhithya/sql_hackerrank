-- Topic: REGEXP for do not start and do not end
-- Link: https://www.hackerrank.com/challenges/weather-observation-station-12/problem?isFullScreen=true
SELECT DISTINCT CITY
FROM STATION
WHERE LOWER(CITY) REGEXP '^[^aeiou]' AND LOWER(CITY) REGEXP '[^aeiou]$'