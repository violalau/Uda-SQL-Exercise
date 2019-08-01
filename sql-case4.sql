--CASE 4
--我们想要找出绩效很高的销售代表，也就是有超过 200 个订单或总销售额超过 750000 美元的销售代表。
--中间级别是指有超过 150 个订单或销售额超过 500000 美元的销售代表。
--创建一个包含以下列的表格：销售代表名称、总订单量、所有订单的总销售额，
--以及标为 top、middle 或 low 的列（取决于上述条件）。
--在最终表格中将销售额最高的销售代表列在最上面。

SELECT s.name, COUNT(o.id) order_counts, SUM(total_amt_usd) total_amt,
CASE WHEN COUNT(o.id) > 200 OR SUM(total_amt_usd) >750000 THEN 'top'
	 WHEN COUNT(o.id) > 150 OR SUM(total_amt_usd) >500000 THEN 'middle'
	 ELSE 'low' END AS level
FROM sales_reps s
JOIN accounts a
ON s.id = a.sales_rep_id
JOIN orders o
ON a.id = o.account_id
GROUP BY 1
ORDER BY 3 DESC