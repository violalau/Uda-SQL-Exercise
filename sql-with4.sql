--WITH 4
--对于（在作为客户的整个时期内）总消费 (total_amt_usd) 最多的客户，他们在每个渠道上有多少 web_events？

WITH t1 AS(
SELECT a.name, SUM(total_amt_usd) total_amt
FROM orders o
JOIN accounts a 
ON a.id = o.account_id 
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1)

SELECT a.name, w.channel, COUNT(w.id)
FROM accounts a
JOIN web_events w
ON a.id = w.account_id
WHERE a.name = (SELECT name FROM t1)
GROUP BY 1,2
ORDER BY 3 DESC

