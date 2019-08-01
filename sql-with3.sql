--WITH 3
--对于购买标准纸张数量 (standard_qty) 最多的客户（在作为客户的整个时期内），有多少客户的购买总数依然更多？

WITH t1 AS(SELECT SUM(o.standard_qty) s_qty, SUM(o.total) total, a.name
FROM orders o 
JOIN accounts a
ON o.account_id = a.id
GROUP BY 3
ORDER BY 1 DESC
LIMIT 1),

t2 AS(
SELECT a.name
FROM accounts a
JOIN orders o 
ON a.id = o.account_id
GROUP BY a.name
HAVING SUM(o.total) > (SELECT total FROM t1)
)

SELECT COUNT(*)
FROM t2