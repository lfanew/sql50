SELECT
    w1.id
FROM Weather AS w1
INNER JOIN Weather w2 ON DATE_ADD(w2.recordDate, INTERVAL '1 day') = w1.recordDate
WHERE w1.temperature > w2.temperature
