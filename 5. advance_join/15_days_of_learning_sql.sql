/*
TOPIC: CO-RELATED SCALER SUBQUERIES, JOINS, DATEDIFF FUNCTION
LINK: https://www.hackerrank.com/challenges/15-days-of-learning-sql/problem?isFullScreen=true
*/


-- tables: submissions, hackers
-- quesion: for each unique submission date, find all hackers who submitted every day from 2016-03-01 till that submission date, 
-- find hacker who submitted max on that day if tie lowest id

SELECT sd, unique_count, h.hacker_id, h.name
FROM(
    -- distinct submission date
    SELECT sd,
    -- all hackers who submitted all days till above date
    (SELECT COUNT(DISTINCT s.hacker_id)
    FROM Submissions s 
    WHERE s.submission_date <= sd AND
        -- count distinct submissions till above date of outer hacker
        (SELECT COUNT(DISTINCT ss.submission_date)
         FROM Submissions ss 
         WHERE ss.hacker_id = s.hacker_id AND
               ss.submission_date <= sd
        ) = DATEDIFF(sd, '2016-03-01') + 1
    ) AS unique_count,
    -- max hacker id who submitted max on this date
    (SELECT hacker_id
    FROM Submissions
    WHERE submission_date = sd
    GROUP BY hacker_id
    ORDER BY COUNT(submission_id) DESC, hacker_id
    LIMIT 1) AS max_hacker_id
    
    FROM (SELECT DISTINCT submission_date AS sd
         FROM Submissions) AS unique_dates
) AS final
JOIN Hackers h ON final.max_hacker_id = h.hacker_id
ORDER BY sd