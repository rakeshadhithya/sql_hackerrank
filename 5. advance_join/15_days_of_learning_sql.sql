/*
TOPIC: CO-RELATED SCALER SUBQUERIES, JOINS, DATEDIFF FUNCTION
LINK: https://www.hackerrank.com/challenges/15-days-of-learning-sql/problem?isFullScreen=true
*/

-- tables: Submissions(sd, sid, hid, scr), Hackers(hid, nm)
-- question: for each distinct sd, find all hackers who submitted till sd, find max hacker who submitted on sd if tie lowest id. sort results with sd asc

-- select sd, uc, id, name from
SELECT sd, unique_count, h.hacker_id, h.name
FROM(
    -- select sd
    SELECT sd,
    -- find count of all hackers who sbmitted all days till sd
    (SELECT COUNT(DISTINCT s.hacker_id)
     FROM Submissions s
     WHERE s.submission_date <= sd AND
            -- count total distinct days s.hacker_id has submitted
           (SELECT COUNT(DISTINCT ss.submission_date)
            FROM Submissions ss
            WHERE ss.submission_date <= sd AND
                  ss.hacker_id = s.hacker_id
           ) = DATEDIFF(sd, '2016-03-01') + 1
    ) AS unique_count,
    -- find hacker who submitted max on sd
    (SELECT hacker_id
    FROM Submissions
    WHERE submission_date = sd
    GROUP BY hacker_id
    ORDER BY COUNT(submission_id) DESC, hacker_id
    LIMIT 1) AS max_hacker_id
    
    -- from distinct dates
    FROM (SELECT DISTINCT submission_date AS sd
         FROM Submissions) AS unique_dates
) AS final
JOIN Hackers h on final.max_hacker_id = h.hacker_id
ORDER BY sd
  