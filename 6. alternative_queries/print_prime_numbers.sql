/*
TOPIC: recursive cte, prime numbers(group_concat function)
LINK: https://www.hackerrank.com/challenges/print-prime-numbers/problem?isFullScreen=true
*/
SET @k = 1000;
-- generate nums from 2 till range
WITH RECURSIVE nums AS(
SELECT 2 AS n
UNION ALL
SELECT n + 1
FROM nums
WHERE n < @k
),
-- pick primes from nums
primes AS(
SELECT n
FROM nums 
WHERE NOT EXISTS(
    -- divisors < n
    SELECT n
    FROM nums AS divisors
    WHERE divisors.n < nums.n AND nums.n % divisors.n = 0
    )
)
SELECT GROUP_CONCAT(n SEPARATOR '&')
FROM primes
/*
GROUP_CONCAT() in MySQL is an aggregate function that takes each value from a column and one optional separator and 
concatenates into a SINGLE string. for multiple columns you can write: GROUP_CONCAT(CONCAT(first_name, ' ', last_name) SEPARATOR '; ')
*/

