--concat 3
--我们还需要创建初始密码，在用户第一次登录时将更改。
--初始密码将是 primary_poc 的名字的第一个字母（小写），
--然后依次是名字的最后一个字母（小写）、姓氏的第一个字母（小写）、
--姓氏的最后一个字母（小写）、名字的字母数量、姓氏的字母数量，然后是合作的公司名称（全大写，没有空格）
WITH t1 AS(
SELECT primary_poc, 
REPLACE(name, ' ', '') as c_name,
LEFT(primary_poc, POSITION(' ' IN primary_poc)) AS first_name,
RIGHT(primary_poc, LENGTH(primary_poc) - POSITION(' ' IN primary_poc)) AS last_name
FROM accounts
GROUP BY 1,2),

t2 AS(SELECT 
LOWER(LEFT (first_name, 1)) as p1,
LOWER(RIGHT(first_name, 2)) as p2,
LOWER(LEFT(last_name, 1)) as p3,
LOWER(RIGHT(last_name, 1)) as p4,
LENGTH(first_name) as p5,
LENGTH(last_name) as p6,
UPPER(c_name) as p7
FROM t1),

t3 AS(SELECT CONCAT(p1,p2,p3,p4,p5,p6,p7) as password
FROM t2)

SELECT 
REPLACE(password, ' ', '') as password
FROM t3