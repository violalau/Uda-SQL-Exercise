--CASE 3
--现我们想要找出绩效最高的销售代表，也就是有超过 200 个订单的销售代表。
--创建一个包含以下列的表格：销售代表名称、订单总量和标为 top 或 not 的列（取决于是否拥有超过 200 个订单）。
--销售量最高的销售代表列在最上面。

SELECT s.name nane, COUNT(o.id) order_counts,
CASE WHEN COUNT(o.id) > 200 THEN 'top'
ELSE 'not' END AS sales_star
FROM sales_reps s
JOIN accounts a
ON s.id = a.sales_rep_id
JOIN orders o 
ON a.id = o.account_id
GROUP BY 1
ORDER BY 2 DESC