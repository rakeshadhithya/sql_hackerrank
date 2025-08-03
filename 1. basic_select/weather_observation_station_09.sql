-- Topic: REGEXP for do not starting chars
-- Link: https://www.hackerrank.com/challenges/weather-observation-station-9/problem
SELECT DISTINCT CITY
FROM STATION 
WHERE LOWER(CITY) REGEXP '^[^aeiou]'