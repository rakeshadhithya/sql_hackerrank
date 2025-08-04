-- TOPIC: MORE THAN 2 TABLES, HAVING
-- LINK: https://www.hackerrank.com/challenges/full-score/problem?isFullScreen=true
-- LOGIC: final goal, find hackers who scored full in more than one challenge.
-- from submissions table, join the hacker to get hacker details, join the challenge to know the challege details, join the difficulty to know the max_score, keep rows where score == max_score
-- from above take hacker_id, name where count(name) > 1

-- v1:
SELECT 
    s.hacker_id,
    h.name
FROM 
    Submissions s
JOIN Challenges c ON s.challenge_id = c.challenge_id
JOIN Difficulty d ON c.difficulty_level = d.difficulty_level
JOIN Hackers h ON s.hacker_id = h.hacker_id
WHERE 
    s.score = d.score  -- full score
GROUP BY 
    s.hacker_id, h.name
HAVING 
    COUNT(s.challenge_id) > 1    -- you can use distinct inside count
ORDER BY 
    COUNT(s.challenge_id) DESC,  -- you can use distinct inside count
    s.hacker_id ASC;


-- v2:
SELECT id, name
FROM (
    SELECT 
        s.hacker_id AS id, 
        h.name AS name, 
        COUNT(*) AS full_score_count
    FROM Submissions AS s
    JOIN Challenges AS c ON s.challenge_id = c.challenge_id
    JOIN Difficulty AS d ON c.difficulty_level = d.difficulty_level
    JOIN Hackers AS h ON s.hacker_id = h.hacker_id
    WHERE s.score = d.score
    GROUP BY s.hacker_id, h.name
) AS hacker_rank
WHERE full_score_count > 1
ORDER BY full_score_count DESC, id ASC;

