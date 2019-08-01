--LEFT AND RIGHT 2
--对于公司名称（甚至名称的第一个字母）的作用存在颇多争议 - https://www.entrepreneur.com/article/237643 。
--请从 accounts 表格中获取每个公司名称的第一个字母，看看以每个字母（数字）开头的公司名称分布情况
SELECT LEFT(name, 1) AS name,
COUNT(*)
FROM accounts
GROUP BY 1