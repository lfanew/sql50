SELECT
    customer_id,
    count(*) AS count_no_trans
FROM Visits
LEFT JOIN Transactions ON Transactions.visit_id = Visits.visit_id
WHERE transaction_id IS NULL
GROUP BY customer_id
