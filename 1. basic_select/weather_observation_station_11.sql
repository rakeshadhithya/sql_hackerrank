-- Topic: REGEXP for either do not start or do not end chars
-- Link: https://www.hackerrank.com/challenges/weather-observation-station-11/problem?isFullScreen=true

-- a. without NOT
SELECT DISTINCT CITY
FROM STATION
WHERE LOWER(CITY) REGEXP '^[^aeiou]' OR LOWER(CITY) REGEXP '[^aeiou]$'

-- b. with NOT
SELECT DISTINCT CITY
FROM STATION
WHERE CITY NOT REGEXP '^[AEIOU]' OR CITY NOT REGEXP '[AEIOU]$';