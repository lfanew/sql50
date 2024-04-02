-- Solution 1
SELECT
    s.user_id,
    ROUND(SUM(CASE WHEN c.action IS NOT NULL AND c.action = 'confirmed' THEN 1 ELSE 0 END) / COUNT(*)::numeric, 2) AS confirmation_rate
FROM Signups s
LEFT JOIN Confirmations c ON c.user_id = s.user_id
GROUP BY s.user_id

-- Solution 2
SELECT
    s.user_id,
    ROUND(AVG(CASE WHEN c.action IS NOT NULL AND c.action = 'confirmed' THEN 1 ELSE 0 END), 2) AS confirmation_rate
FROM Signups s
LEFT JOIN Confirmations c ON c.user_id = s.user_id
GROUP BY s.user_id
