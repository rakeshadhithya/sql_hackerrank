-- Topic: INNER JOIN
-- Link: https://www.hackerrank.com/challenges/african-cities/problem?isFullScreen=true
-- new table: for each row in city add its country columns. keep only africa continent. find all names(OF CITY NOT COUNTRY)
SELECT(CITY.NAME)
FROM CITY
     JOIN COUNTRY ON CITY.COUNTRYCODE = COUNTRY.CODE
WHERE CONTINENT LIKE 'Africa'