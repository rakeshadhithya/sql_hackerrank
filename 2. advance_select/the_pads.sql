-- Topic: SUBQUERY
-- Link: https://www.hackerrank.com/challenges/the-pads/problem?isFullScreen=true

-- first table same table name, occupation sort by name. then for each name send name(occupation)
-- second table new one occupation, its count then sort by occupation count, then occupation name. then for each occupation send 'There are a total of [occupation_count] [occupation]s'
SELECT CONCAT(NAME, '(', LEFT(OCCUPATION, 1), ')') 
FROM OCCUPATIONS
ORDER BY NAME;
SELECT CONCAT('There are a total of ', OCCUPATION_COUNT, ' ', LOWER(OCCUPATION), 's.')
FROM (SELECT OCCUPATION, COUNT(OCCUPATION) AS OCCUPATION_COUNT
      FROM OCCUPATIONS 
      GROUP BY OCCUPATION
      ORDER BY COUNT(OCCUPATION), OCCUPATION)
      AS OCCUPATION_SUMMARY