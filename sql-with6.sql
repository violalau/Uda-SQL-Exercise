--WITH 6
--比所有客户的平均消费高的企业平均终身消费 (total_amt_usd) 是多少？

WITH t1 AS(
SELECT AVG(o.total_amt_usd) avg_all
FROM orders o
),

t2 AS(
SELECT a.name, SUM(o.total_amt_usd) total_amt
FROM orders o 
JOIN accounts a
ON o.account_id = a.id
GROUP BY 1
HAVING SUM(o.total_amt_usd) > (SELECT avg_all FROM t1)
ORDER BY 2 
)

SELECT AVG(total_amt)
FROM t2