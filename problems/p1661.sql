-- Solution 1
WITH start_cte AS (
    SELECT
        machine_id,
        process_id,
        timestamp AS start_time
    FROM Activity
    WHERE activity_type = 'start'
), end_cte AS (
    SELECT
        machine_id,
        process_id,
        timestamp AS end_time
    FROM Activity
    WHERE activity_type = 'end'
)

SELECT
    start_cte.machine_id,
    ROUND(CAST(AVG(end_time - start_time) AS numeric), 3) AS processing_time
FROM start_cte
INNER JOIN end_cte ON
    end_cte.machine_id = start_cte.machine_id AND
    end_cte.process_id = start_cte.process_id
GROUP BY start_cte.machine_id

-- Solution 2
SELECT
    s.machine_id,
    ROUND(CAST(AVG(e.timestamp - s.timestamp) AS numeric), 3) AS processing_time
FROM Activity AS s
INNER JOIN Activity e ON
    e.machine_id = s.machine_id AND
    e.process_id = s.process_id
WHERE
    s.activity_type = 'start' AND
    e.activity_type = 'end'
GROUP BY s.machine_id
