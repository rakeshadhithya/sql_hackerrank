-- TOPIC: JOINING A COVERTED TABLE NOT DIRECT TABLE
-- LINK: https://www.hackerrank.com/challenges/contest-leaderboard/problem?isFullScreen=true
-- this is a tricky question, you should not join directly with submissions table, a user can submit multiple times to a challenge and max should be considered. so filter submissions table to keep a max score for each hacker_id, challenge_id combination. then from that find sum of scores fo reach user, keep rows having sum > 0, order by score, hacker_id

SELECT h.hacker_id, h.name, SUM(best_score) AS total
FROM (
    SELECT s.hacker_id, s.challenge_id, MAX(s.score) AS best_score
    FROM Submissions AS s
    GROUP BY s.hacker_id, s.challenge_id
) AS max_scores
JOIN Hackers AS h ON h.hacker_id = max_scores.hacker_id
GROUP BY h.hacker_id, h.name
HAVING total > 0
ORDER BY total DESC, h.hacker_id

