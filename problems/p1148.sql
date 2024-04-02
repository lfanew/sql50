-- Solution 1
SELECT
	author_id AS id
FROM Views
GROUP BY author_id
HAVING COUNT(CASE WHEN viewer_id = author_id THEN 1 END) > 0
ORDER BY id

-- Solution 2
SELECT
	DISTINCT author_id AS id
FROM Views
WHERE viewer_id = author_id
ORDER BY id
