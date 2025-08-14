/*
TOPIC: recursive cte, prime numbers(group_concat function)
LINK: https://www.hackerrank.com/challenges/print-prime-numbers/problem?isFullScreen=true
*/
SET @n = 1000;

WITH RECURSIVE nums AS(
SELECT 2 AS n
UNION ALL
SELECT n + 1
FROM nums
WHERE n < @n
),
primes AS(
SELECT n
FROM nums
-- there should not be any divisor for n
WHERE NOT EXISTS (
                SELECT 1
                FROM nums AS divisors
                WHERE divisors.n < nums.n AND 
                      nums.n % divisors.n = 0
                )

)
SELECT GROUP_CONCAT(n SEPARATOR '&') AS prime_numbers
FROM primes;

/*
GROUP_CONCAT() in MySQL is an aggregate function that takes multiple values from rows and concatenates them into a single string
*/

