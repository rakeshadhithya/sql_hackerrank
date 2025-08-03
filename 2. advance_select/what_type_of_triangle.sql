-- Topic: CASE WHEN THEN END
-- Link: https://www.hackerrank.com/challenges/what-type-of-triangle/problem?isFullScreen=true
SELECT
 CASE 
 -- First check whether triangle is valid
  WHEN A + B < C OR B + C < A OR C + A < B THEN 'Not A Triangle'
  WHEN A = B AND B = C THEN 'Equilateral'
  WHEN A = B OR B = C OR C = A THEN 'Isosceles'
  ELSE 'Scalene'
 END AS Triangle_Type
FROM TRIANGLES