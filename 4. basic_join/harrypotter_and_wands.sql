-- TOPIC: WINDOW FUNCTION, SUBQUERY, JOIN, COMBINATION-MINVALUE
-- LINK: https://www.hackerrank.com/challenges/harry-potter-and-wands/problem?isFullScreen=true

-- wand is_evil 0 and with min coins needed for each combination of power and age
SELECT w1.id, wp1.age, w1.coins_needed, w1.power
FROM Wands w1
JOIN Wands_Property wp1 ON w1.code = wp1.code
WHERE wp1.is_evil = 0 AND
      w1.coins_needed = (
                    SELECT MIN(coins_needed)
                    FROM Wands w2
                    JOIN Wands_Property wp2 ON w2.code = wp2.code
                    WHERE w1.power = w2.power AND
                          wp1.age = wp2.age
                 )
ORDER BY w1.power DESC, wp1.age DESC


-- window_function
WITH ranked_wands AS (
  SELECT w.id, wp.age, w.coins_needed, w.power,
         ROW_NUMBER() OVER (
           PARTITION BY w.power, wp.age
           ORDER BY w.coins_needed ASC
         ) AS rn
  FROM Wands w
  JOIN Wands_Property wp ON w.code = wp.code
  WHERE wp.is_evil = 0
)
SELECT id, age, coins_needed, power
FROM ranked_wands 
WHERE rn = 1
ORDER BY power DESC, age DESC;

