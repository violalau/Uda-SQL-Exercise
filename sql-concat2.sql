--concat 2
--你可能注意到了，在上一个答案中，有些公司名称存在空格，肯定不适合作为邮箱地址。
--看看你能否通过删掉客户名称中的所有空格来创建合适的邮箱地址，否则你的答案就和问题 1. 的一样。此处是一些实用的文档。

WITH t1 AS(
SELECT primary_poc, 
REPLACE(name, ' ', '') as name,
LEFT(primary_poc, POSITION(' ' IN primary_poc)) AS first_name,
RIGHT(primary_poc, LENGTH(primary_poc) - POSITION(' ' IN primary_poc)) AS last_name
FROM accounts
GROUP BY 1,2)

SELECT CONCAT(first_name, '.', last_name,'@',name,'.com') AS address
FROM t1