/*
TOPIC: 
LINK: https://www.hackerrank.com/challenges/15-days-of-learning-sql/problem
*/

-- For each submission day:
--   1. Count how many unique hackers have submitted at least once on
--      every day from the first day up to the current day.
--   2. Find the hacker_id and name of the hacker who made the maximum
--      number of submissions on that specific day
--      (tie-break: choose the lowest hacker_id).
-- Output these results sorted by submission_date.
SELECT 
    sd,                      -- submission day
    cnt,                     -- count of unique hackers who submitted every day so far
    h.hacker_id,             -- top submitter's id for that day
    h.name                   -- top submitter's name for that day
FROM (

    SELECT 
        sd,

        -- Count distinct hackers who submitted on all days from 2016-03-01 to current day (sd)
        (
            SELECT COUNT(DISTINCT h.hacker_id)
            FROM hackers h
            JOIN submissions s 
              ON s.hacker_id = h.hacker_id
            WHERE s.submission_date <= sd
              AND (
                    SELECT COUNT(DISTINCT submission_date)
                    FROM hackers hh
                    JOIN submissions ss
                      ON ss.hacker_id = hh.hacker_id
                    WHERE hh.hacker_id = h.hacker_id
                      AND ss.submission_date <= sd
                  ) = 1 + DATEDIFF(sd, '2016-03-01')
        ) AS cnt,

        -- Hacker_id of the person with the most submissions on this date (lowest id if tie)
        (
            SELECT h.hacker_id
            FROM hackers h
            JOIN submissions s 
              ON s.hacker_id = h.hacker_id
            WHERE s.submission_date = sd
            GROUP BY h.hacker_id
            ORDER BY COUNT(s.submission_id) DESC, h.hacker_id
            LIMIT 1
        ) AS hacker_id

    FROM (
        -- List of all distinct submission dates
        SELECT submission_date AS sd
        FROM submissions
        GROUP BY submission_date
    ) AS date_tbl

) AS TBL2

-- Join to get hacker name for top submitter of the day
JOIN hackers h 
  ON h.hacker_id = TBL2.hacker_id

-- Sort by date
ORDER BY sd;