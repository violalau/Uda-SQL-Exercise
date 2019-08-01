--CASE 1
--我们想要根据相关的消费量了解三组不同的客户。
--最高的一组是终身价值（所有订单的总销售额）大于 200,000 美元的客户。
--第二组是在 200,000 到 100,000 美元之间的客户。
--最低的一组是低于 under 100,000 美元的客户。
--请提供一个表格，其中包含与每个客户相关的级别。
--你应该提供客户的名称、所有订单的总销售额和级别。消费最高的客户列在最上面。

SELECT a.name, SUM(o.total_amt_usd) total_amt,
CASE WHEN SUM(o.total_amt_usd) > 200000 THEN 'high'
     WHEN SUM(o.total_amt_usd) > 100000 THEN 'middle'
	 ELSE 'low' END AS level
FROM accounts a
JOIN orders o
ON o.account_id = a.id
GROUP BY 1
ORDER BY level