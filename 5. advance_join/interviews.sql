/*
TOPIC: Aggregated JOIN
LINK: https://www.hackerrank.com/challenges/interviews/problem?isFullScreen=true
*/
-- tables: Contests(ctid, hid, nm), Colleges(clgid, ctid), Challenges(chid, clgid), View_Stats(chid, tv, tuv), Submission_Stats(chid, ts, tas)
-- for each contest find the ctid, hid, nm, ts, tas, tv, tuv. 

SELECT ct.contest_id, ct.hacker_id, ct.name,
       SUM(COALESCE(ts,0)), SUM(COALESCE(tas,0)),
       SUM(COALESCE(tv,0)), SUM(COALESCE(tuv,0))
FROM Contests ct 
JOIN Colleges clg ON ct.contest_id = clg.contest_id
JOIN Challenges ch ON clg.college_id = ch.college_id
LEFT JOIN(
    SELECT challenge_id, SUM(total_submissions) AS ts, SUM(total_accepted_submissions) AS tas
    FROM Submission_Stats
    GROUP BY challenge_id
) AS ss ON ch.challenge_id = ss.challenge_id
LEFT JOIN(
    SELECT challenge_id, SUM(total_views) AS tv, SUM(total_unique_views) AS tuv
    FROM View_Stats 
    GROUP BY challenge_id
) AS vs ON ch.challenge_id = vs.challenge_id
-- if these are not 0 then their sums also can't be zero
WHERE ts > 0 OR tas > 0 OR tv > 0 OR tuv > 0
GROUP BY ct.contest_id, ct.hacker_id, ct.name
ORDER BY ct.contest_id

-- COALESCE: If a challenge has no matching row in Submission_Stats or View_Stats (because maybe nobody submitted anything or viewed it
