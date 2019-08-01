--CASE 2
--现在我们想要执行和第一个问题相似的计算过程，但是我们想要获取在 2016 年和 2017 年客户的总消费数额。
--级别和上一个问题保持一样。消费最高的客户列在最上面。

SELECT a.name, DATE_PART('year', w.occurred_at) AS year,
SUM(o.total_amt_usd) total_amt,
CASE WHEN SUM(o.total_amt_usd) > 200000 THEN 'high'
     WHEN SUM(o.total_amt_usd) > 100000 THEN 'middle'
	 ELSE 'low' END AS level
FROM accounts a
JOIN orders o
ON o.account_id = a.id
JOIN web_events w
ON a.id = w.account_id
WHERE DATE_PART('year', w.occurred_at) > 2015
GROUP BY 1,2
ORDER BY DATE_PART('year', w.occurred_at) DESC