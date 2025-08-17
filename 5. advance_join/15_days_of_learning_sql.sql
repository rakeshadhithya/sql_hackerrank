/*
TOPIC: CO-RELATED SCALER SUBQUERIES, JOINS, DATEDIFF FUNCTION
LINK: https://www.hackerrank.com/challenges/15-days-of-learning-sql/problem?isFullScreen=true

question: for each day, find unique hackers(since they can make multiple submissions) who made submission 
every day till that day, from them id and name of hacker who made max submissions that day
final table: submission date, unique count, id and name of hacker who made max submissions that date and 
in unique count
*/

SELECT sd, unique_count, h.hacker_id, h.name
FROM(
    -- submission date
    SELECT sd,
    -- count unique hackers who submitted all days from 2016-03-01 till above date(sd)
    (SELECT COUNT(DISTINCT s.hacker_id)
    FROM Submissions s
    JOIN Hackers h ON s.hacker_id = h.hacker_id
    WHERE s.submission_date <= sd AND
          DATEDIFF(sd, '2016-03-01') + 1 = 
          (SELECT COUNT(DISTINCT ss.submission_date)
          FROM Submissions ss
          JOIN Hackers hh ON ss.hacker_id = hh.hacker_id
          WHERE ss.submission_date <= sd AND
                hh.hacker_id = h.hacker_id)
    ) AS unique_count,
    -- Hacker_id with the most submissions(lowest id if tie) on this date(sd)
    (SELECT h.hacker_id
    FROM Submissions s
    JOIN Hackers h ON s.hacker_id = h.hacker_id
    WHERE s.submission_date = sd
    GROUP BY h.hacker_id
    ORDER BY COUNT(s.submission_id) DESC, h.hacker_id
    LIMIT 1) AS hacker_id
    -- distinct submissions dates sd
    FROM (SELECT s.submission_date AS sd
          FROM Submissions s
          GROUP BY sd) AS dates
) AS final
JOIN Hackers h on final.hacker_id = h.hacker_id
ORDER BY sd