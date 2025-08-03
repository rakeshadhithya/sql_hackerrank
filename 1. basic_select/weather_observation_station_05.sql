-- Topic: LENGTH() and UNION
-- Link: https://www.hackerrank.com/challenges/weather-observation-station-5/problem?isFullScreen=true
(SELECT CITY, LENGTH(CITY)
FROM STATION
ORDER BY LENGTH(CITY), CITY
LIMIT 1)
UNION
(SELECT CITY, LENGTH(CITY)
FROM STATION
ORDER BY LENGTH(CITY) DESC, CITY
LIMIT 1)