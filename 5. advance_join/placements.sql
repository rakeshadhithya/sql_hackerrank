-- TOPICS: JOIN MULTIPLE TABLES
-- LINK: https://www.hackerrank.com/challenges/placements/problem?isFullScreen=true

-- Tables: Students(id, nm), Friends(id, fid), Packages(id, sal)
-- requirements: select nm whose bf got more sal than him. order by sal of bf
-- steps: join students friends on fid. join packages two times, one time with sid, one time with fid.
SELECT s.Name
FROM Students s
JOIN Friends f ON s.ID = f.ID              -- get id of best friend
JOIN Packages ps ON s.ID = ps.ID           -- package of student
JOIN Packages pbf ON f.Friend_ID = pbf.ID  -- package of best friend
WHERE pbf.Salary > ps.Salary
ORDER BY pbf.Salary