-- Topic: SUBQUERY, CTE AND RECURSION
-- Link: https://www.hackerrank.com/challenges/binary-search-tree-1/problem?isFullScreen=true

-- a. Inline sub query. (sub query do not depend on outer query)
SELECT N,
 CASE
  WHEN P IS NULL THEN 'Root'
  WHEN N NOT IN (SELECT P 
                    FROM BST 
                    WHERE P IS NOT NULL)
                    THEN 'Leaf'
  ELSE 'Inner'
 END AS Node_Type
FROM BST
ORDER BY N



-- b. Co-related sub query (subquery refers to the column of outer query, subquery executed once for each row of outer query)
SELECT N,
 CASE
  WHEN P IS NULL THEN 'Root'
  WHEN NOT EXISTS(SELECT 1 
              FROM BST AS B 
              WHERE A.N = B.P)
              THEN 'Leaf'
  ELSE 'Inner'
 END AS Node_Type
FROM BST AS A
ORDER BY N

/*
order of execution:
-FROM BST AS A: Load all rows from BST and call it A
-SELECT N, CASE ...: For each row in A:
-Check if P IS NULL → label as 'Root'
-Otherwise, run the correlated subquery:

SELECT 1 FROM BST AS B WHERE A.N = B.P
→ This subquery is run once for that specific row from A
If no match is found in subquery → it's a 'Leaf'
Else → 'Inner'
*/


-- c. recursive cte(useful for finding level of each node)

WITH RECURSIVE Tree AS(
-- Table with base row: root node(s) (with no parent)
    SELECT N, P, 1 AS L
    FROM BST 
    WHERE P IS NULL
    
    UNION ALL
    
-- Add subsequent rows: find children and increment level
    SELECT BST.N, BST.P, Tree.L + 1
    FROM Tree
         JOIN BST ON Tree.N = BST.P
)
SELECT
 N,
 CASE 
  WHEN P IS NULL THEN 'Root'
  WHEN N NOT IN (SELECT DISTINCT P 
                 FROM BST 
                 WHERE P IS NOT NULL) 
         THEN 'Leaf'
  ELSE 'Inner'
 END
FROM Tree
ORDER BY N

-- note: this problem has no significance for level. just to learn