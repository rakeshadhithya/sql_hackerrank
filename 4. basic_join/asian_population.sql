-- Topic: INNER JOIN, SUM
-- https://www.hackerrank.com/challenges/asian-population/problem?isFullScreen=true
-- new table: for every row in city, add additional columns of it coutry. keep only asian continent. then calculate sum of city population(not country population)
SELECT SUM(CITY.POPULATION)
FROM CITY
     JOIN COUNTRY ON CITY.COUNTRYCODE = COUNTRY.CODE
WHERE CONTINENT LIKE 'Asia'