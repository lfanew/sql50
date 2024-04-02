-- Solution 1
SELECT
	SUBSTRING(trans_date::varchar FROM 1 FOR 7) AS month,
	country,
	COUNT(*) AS trans_count,
	COUNT(*) FILTER (WHERE state = 'approved') AS approved_count,
	SUM(amount) AS trans_total_amount,
	COALESCE(SUM(amount) FILTER (WHERE state = 'approved'), 0) AS approved_total_amount
FROM transactions
GROUP BY month, country;

-- Solution 2
SELECT
	SUBSTRING(trans_date::varchar FROM 1 FOR 7) AS month,
	country,
	COUNT(*) AS trans_count,
	COUNT(CASE WHEN state = 'approved' THEN 1 END) AS approved_count,
	SUM(amount) AS trans_total_amount,
	SUM(CASE WHEN state = 'approved' THEN amount ELSE 0 END) AS approved_total_amount
FROM transactions
GROUP BY month, country;
