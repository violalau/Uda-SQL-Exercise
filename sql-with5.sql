--WITH 5
--对于总消费前十名的客户，他们的平均终身消费 (total_amt_usd) 是多少?

WITH t1 AS(
SELECT a.name, SUM(o.total_amt_usd) total_amt
FROM accounts a 
JOIN orders o 
ON a.id = o.account_id 
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10)

SELECT AVG(total_amt)
FROM t1