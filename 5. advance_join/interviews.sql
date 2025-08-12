/*
TOPIC: Aggregated JOIN
LINK: https://www.hackerrank.com/challenges/interviews/problem?isFullScreen=true
*/
SELECT 
    c.contest_id,
    c.hacker_id,
    c.name,
    SUM(COALESCE(ss.total_submissions, 0)) AS total_submissions,
    SUM(COALESCE(ss.total_accepted_submissions, 0)) AS total_accepted_submissions,
    SUM(COALESCE(vs.total_views, 0)) AS total_views,
    SUM(COALESCE(vs.total_unique_views, 0)) AS total_unique_views
FROM Contests AS c
JOIN Colleges AS col
    ON c.contest_id = col.contest_id
JOIN Challenges AS ch
    ON col.college_id = ch.college_id
-- one aggregated sub row per challenge id
LEFT JOIN (
    SELECT 
        challenge_id,
        SUM(total_submissions) AS total_submissions,
        SUM(total_accepted_submissions) AS total_accepted_submissions
    FROM Submission_Stats
    GROUP BY challenge_id
) AS ss
-- one aggregated view_stats row per challenge id
    ON ch.challenge_id = ss.challenge_id
LEFT JOIN (
    SELECT 
        challenge_id,
        SUM(total_views) AS total_views,
        SUM(total_unique_views) AS total_unique_views
    FROM View_Stats
    GROUP BY challenge_id
) AS vs
    ON ch.challenge_id = vs.challenge_id
GROUP BY c.contest_id, c.hacker_id, c.name
HAVING 
    SUM(COALESCE(ss.total_submissions, 0)) > 0
    OR SUM(COALESCE(ss.total_accepted_submissions, 0)) > 0
    OR SUM(COALESCE(vs.total_views, 0)) > 0
    OR SUM(COALESCE(vs.total_unique_views, 0)) > 0
ORDER BY c.contest_id;

-- COALESCE: If a challenge has no matching row in Submission_Stats or View_Stats (because maybe nobody submitted anything or viewed it
