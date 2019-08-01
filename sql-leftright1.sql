--LEFT AND RIGHT 1
--在 accounts 表格中，有一个列存储的是每个公司的网站。最后三个数字表示他们使用的是什么类型的网址。此处给出了扩展（和价格）列表。
--请获取这些扩展并得出 accounts 表格中每个网址类型的存在数量。
SELECT RIGHT(website, 3) AS domain, COUNT(*) num_companies
FROM accounts
GROUP BY 1
ORDER BY 2 DESC;