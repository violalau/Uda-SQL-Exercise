--concat 1
--accounts 表格中的每个客户都想为每个 primary_poc 创建一个电子邮箱。
--邮箱应该是 primary_poc 的名字.primary_poc的姓氏@公司名称.com。


WITH t1 AS (
 SELECT LEFT(primary_poc,     STRPOS(primary_poc, ' ') -1 ) first_name,  RIGHT(primary_poc, LENGTH(primary_poc) - STRPOS(primary_poc, ' ')) last_name, name
 FROM accounts)
SELECT first_name, last_name, CONCAT(first_name, '.', last_name, '@', name, '.com')
FROM t1;