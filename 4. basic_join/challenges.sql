-- TOPIC: FILTERING, LEFT JOIN, CTES
-- LINK: https://www.hackerrank.com/challenges/challenges/problem?isFullScreen=true

-- Step 1: Count how many challenges each hacker created
WITH challenge_count AS (
    SELECT 
        h.hacker_id, 
        h.name, 
        COUNT(c.challenge_id) AS total_challenges
    FROM Hackers AS h
    JOIN Challenges AS c ON h.hacker_id = c.hacker_id
    GROUP BY h.hacker_id, h.name
),

-- Step 2: Find the maximum number of challenges created by any hacker
max_count AS (
    SELECT MAX(total_challenges) AS max_challenges
    FROM challenge_count
),

-- Step 3: Find which challenge counts are duplicated, (by more than one hacker)
duplicate_counts AS (
    SELECT total_challenges
    FROM challenge_count
    GROUP BY total_challenges
    HAVING COUNT(*) > 1
),

-- Step 4: Filter out hackers who:
-- - either have the maximum number of challenges (even if duplicate)
-- - or have a unique number of challenges (not duplicate)
filtered AS (
    SELECT cc.*
    FROM challenge_count AS cc
    JOIN max_count AS mc ON 1=1 
    LEFT JOIN duplicate_counts AS dc 
        ON cc.total_challenges = dc.total_challenges 
    WHERE 
        cc.total_challenges = mc.max_challenges  -- Keep if max
        OR dc.total_challenges IS NULL           -- Keep if not duplicate (i.e., unique)
)

-- Step 5: Return the final filtered list
-- Ordered by total challenges (desc), then hacker_id (asc)
SELECT *
FROM filtered
ORDER BY total_challenges DESC, hacker_id;
