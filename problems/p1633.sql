-- Solution 1
SELECT
    r.contest_id,
    ROUND(
        (COUNT(r.user_id) / (SELECT COUNT(*) FROM Users)::numeric) * 100,
        2
    ) AS percentage
FROM Register r
GROUP BY r.contest_id
ORDER BY percentage DESC, contest_id

-- Solution 2
WITH total_users AS (
    SELECT COUNT(*) AS count FROM Users
)

SELECT
    r.contest_id,
    ROUND(
        (COUNT(r.user_id) / (SELECT count from total_users)::numeric) * 100,
        2
    ) AS percentage
FROM Register r
GROUP BY r.contest_id
ORDER BY percentage DESC, contest_id
