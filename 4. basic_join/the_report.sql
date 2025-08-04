-- TOPIC: JOIN ON CONDITION, IF, CARTESIAN JOIN, CO-RELATED SCALER SUBQUERY
-- LINK: https://www.hackerrank.com/challenges/the-report/problem?isFullScreen=true
-- LOGIC: final goal: new table: name, grade, marks. from that if grade >=8 then name else null.


-- a. cartesian join, then filter
WITH student_grades AS(
SELECT Name, Grade, Marks
FROM Students, Grades
WHERE Marks >= Min_Mark AND Marks <= Max_Mark
ORDER BY Grade DESC, Name
)
SELECT IF(Grade >= 8, Name, Null),
       Grade,
       Marks
FROM student_grades



-- b. column with corelated subquery
SELECT 
       IF (Grade >=8, Name, Null),
       Grade,
       Marks
FROM 
     (SELECT Name,
             (SELECT Grade
              FROM Grades
              WHERE Marks >= Min_Mark AND Marks <= Max_Mark
             ) AS Grade,
              Marks
      FROM Students
      ORDER BY Grade DESC, Name
      ) AS Student_grades
-- Note co-related sub query is inefficient for large datasets



--c. most efficient: join on condition
-- learnings: join is on condition not column, when join use dot to tell which table they belong, IF operator
WITH student_grades AS(
SELECT s.Name, g.Grade, s.Marks
FROM Students AS s
JOIN Grades AS g ON s.Marks BETWEEN g.Min_Mark AND g.Max_Mark
)
SELECT IF(Grade >= 8, Name, NULL),
       Grade,
       Marks
FROM student_grades
ORDER BY Grade DESC, Name

