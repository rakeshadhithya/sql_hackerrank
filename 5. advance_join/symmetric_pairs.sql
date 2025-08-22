-- TOPICS: JOIN, GROUP BY HAVING, UNION
-- LINK: https://www.hackerrank.com/challenges/symmetric-pairs/problem?isFullScreen=true

-- tables: Functions(X,Y)
-- question: find pairs where x <= y, and exists a another pair where x1 = y2, x2 = y1
-- intuition: two parts: first part where x < y and reverse pair exists. second part: where x = y and appearing at least twice. 
(SELECT f1.X, f1.Y
FROM Functions f1
JOIN Functions f2 ON f1.X = f2.Y AND f1.Y = f2.X
WHERE f1.X < f1.Y)
UNION
(SELECT X, Y
FROM Functions
WHERE X = Y
GROUP BY X,Y
HAVING COUNT(*) > 1)
ORDER BY X
/*
NOTE: you cannot combine <= in first part because you’ll get (X = Y) pairs even if they occur once
ALTERNATE FOR JOINING, USE Co related Subquery
(SELECT f1.X, f1.Y
FROM Functions f1
WHERE f1.X < f1.Y AND
    EXISTS (
        SELECT 1
        FROM Functions f2
        WHERE f1.X = f2.Y AND f1.Y = f2.X
))
*/