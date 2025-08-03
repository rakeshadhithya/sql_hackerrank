-- Topic: INNER JOIN, FLOOR, AVG
-- Link: https://www.hackerrank.com/challenges/average-population-of-each-continent/problem?isFullScreen=true
-- new table: for each row in city add its country coulumns, keep row only if match found(unless asked). group by continent and find AVERAGE(not sum) of all city population(not country) in them, if null then 0
SELECT COUNTRY.CONTINENT, 
       FLOOR(AVG(CITY.POPULATION)) AS avg_city_population
FROM CITY
     JOIN COUNTRY ON CITY.COUNTRYCODE = COUNTRY.CODE
GROUP BY CONTINENT

