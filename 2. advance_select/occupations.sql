-- Topic: WINDOW AND PIVOT
-- Link: https://www.hackerrank.com/challenges/occupations/problem?isFullScreen=true

-- new table with Doctor, Professor, Singer, Actor, use Occupations table add row number for each group of occupation. then for each row no, select name into that particular column
WITH Ranking AS(
SELECT 
 Name,
 Occupation,
 ROW_NUMBER() OVER( PARTITION BY Occupation ORDER BY Name) AS Rn
FROM OCCUPATIONS
)
SELECT 
 MAX(CASE WHEN Occupation LIKE 'Doctor' THEN Name END) AS Doctor,
 MAX(CASE WHEN Occupation LIKE 'Professor' THEN Name END) AS Professor,
 MAX(CASE WHEN Occupation LIKE 'Singer' THEN Name END) AS Singer,
 MAX(CASE WHEN Occupation LIKE 'Actor' THEN Name END) AS Actor
FROM Ranking
GROUP BY Rn
ORDER BY Rn

-- LEARNING FROM THIS QUERY
-- one solution is: form 4 tables for doc,prof,sing,act and join removing duplicates
-- you cannot have multiple with's, only one with and many result sets separated by comma
-- you can't put distinct for every column, distinct applies to all columns
-- FULL OUTER JOIN: Unlike PostgreSQL, SQL Server, or Oracle, MySQL only supports INNER JOIN, LEFT JOIN, RIGHT JOIN. USE LEFT/RIGHT JOIN AND THEN UNION
-- Because we are using GROUP BY rn, we can’t access columns other rn without aggregates due to ambiguity.


