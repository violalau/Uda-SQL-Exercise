--position & strpos 2
--现在创建一个包含 sales_rep 表格中每个销售代表姓名的列，同样，需要提供名字和姓氏列。

SELECT name,
LEFT(name, POSITION(' ' IN name)) AS frist_name,
RIGHT(name, LENGTH(name) - POSITION(' ' IN name)) AS last_name
FROM sales_reps
GROUP BY 1