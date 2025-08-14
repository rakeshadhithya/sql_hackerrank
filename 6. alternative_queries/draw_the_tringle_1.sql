/*
TOPIC: user defined session variable, recursive cte, pattern printing(REPEAT function)
LINK: https://www.hackerrank.com/challenges/draw-the-triangle-1/problem?isFullScreen=true
*/
SET @n = 20;

WITH RECURSIVE nums AS(
SELECT @n AS n
UNION ALL
SELECT n - 1
FROM nums
WHERE n > 1
)
SELECT REPEAT('* ', n)
FROM nums


/*
user-defined session variable: 
It lives only for the current database session/connection. Once you disconnect, it’s gone. They always start with @ in MySQL (@@ is for system variables)
SET @n = 5;  -- Assigns value 5  (; mandatory for set statement, because it should be a separate query)
SELECT @n;   -- Reads value 5
*/
