--WITH 1
--提供每个区域拥有最高销售额 (total_amt_usd) 的销售代表的姓名。

WITH t1 AS(
SELECT r.name region, s.name sales_rep, SUM(o.total_amt_usd) total_amt 
FROM region r
JOIN sales_reps s
ON r.id = s.region_id
JOIN accounts a
ON s.id = a.sales_rep_id
JOIN orders o
ON a.id = o.account_id
GROUP BY 1,2
ORDER BY 3 DESC),

t2 AS(
SELECT region, MAX(total_amt) max_total
FROM t1
GROUP BY 1
ORDER BY 2 DESC)

SELECT t1.region, t1.sales_rep, t1.total_amt
FROM t1
JOIN t2
ON t1.region = t2.region AND t1.total_amt = t2.max_total
