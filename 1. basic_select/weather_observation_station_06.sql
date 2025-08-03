-- Topic: REGEXP for starting chars
-- Link: https://www.hackerrank.com/challenges/weather-observation-station-6/problem?isFullScreen=true

-- a. using LOWER() and LIKE
SELECT DISTINCT CITY 
FROM STATION
WHERE CITY LIKE 'a%' OR
      CITY LIKE 'e%' OR
      CITY LIKE 'i%' OR
      CITY LIKE 'o%' OR
      CITY LIKE 'u%'

-- b. using REGEXP
SELECT DISTINCT CITY 
FROM STATION
WHERE LOWER(CITY) REGEXP '^[aeiou]'