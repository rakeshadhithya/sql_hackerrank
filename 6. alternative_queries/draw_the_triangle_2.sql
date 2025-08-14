
/*
TOPIC: user defined session variable, recursive cte, pattern printing(REPEAT function)
LINK: https://www.hackerrank.com/challenges/draw-the-triangle-2/problem?isFullScreen=true
*/
SET @n = 20;
WITH RECURSIVE nums AS(
SELECT 1 AS n
UNION ALL
SELECT n + 1
FROM nums
WHERE n < @n
)
SELECT REPEAT('* ', n)
FROM nums
