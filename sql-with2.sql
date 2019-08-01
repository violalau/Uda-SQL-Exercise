--WITH 2
--对于具有最高销售额 (total_amt_usd) 的区域，总共下了多少个订单？

WITH t1 AS(
SELECT r.name region, SUM(total_amt_usd) total_amt
FROM region r
JOIN sales_reps s
ON r.id = s.region_id
JOIN accounts a
ON s.id = a.sales_rep_id 
JOIN orders o
ON a.id = o.account_id
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1),

t2 AS(
SELECT r.name region, COUNT(o.id) orders_count
FROM region r
JOIN sales_reps s
ON r.id = s.region_id
JOIN accounts a
ON s.id = a.sales_rep_id 
JOIN orders o
ON a.id = o.account_id
GROUP BY 1)

SELECT t2.region, t2.orders_count
FROM t2
JOIN t1
ON t1.region = t2.region

