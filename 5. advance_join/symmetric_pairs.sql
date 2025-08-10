-- TOPICS: JOIN, GROUP BY HAVING, UNION
-- LINK: https://www.hackerrank.com/challenges/symmetric-pairs/problem?isFullScreen=true

-- two parts: first part where x < y and reverse pair exists. second part: where x = y and appearing at least twice. 
-- union to remove duplicates, finally order by x
(
SELECT f1.X, f1.Y
FROM Functions f1
JOIN Functions f2 ON f1.X = f2.Y and f1.Y = f2.X
WHERE f1.X < f1.Y
GROUP BY f1.X, f1.Y
)
UNION
(
SELECT X, Y 
FROM Functions
WHERE X = Y
GROUP BY X, Y
HAVING COUNT(*) >= 2
)
ORDER BY X

/*
two parts because two different kinds of symmetry we need to catch. one: where x!=y (x<y) and reverse pair 
exists and two: both values same and when reversed they are indeed the same(appears at least twice so the 
reverse pair exists). union to remove duplicates and combile results
NOTE: you cannot combine <= in first part because you’ll get single (X = Y) pairs even if they occur once
*/