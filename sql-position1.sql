--position & strpos 1
--使用 accounts 表格创建一个名字和姓氏列，用于存储 primary_poc 的名字和姓氏。

SELECT primary_poc,
LEFT(primary_poc, POSITION(' ' IN primary_poc)) AS frist_name,
RIGHT(primary_poc, LENGTH(primary_poc) - POSITION(' ' IN primary_poc)) AS last_name
FROM accounts
GROUP BY 1