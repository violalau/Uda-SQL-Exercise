# Uda-SQL-Exercise | SQL课程练习

## 简介

练习来源于数据分析（入门）课程中的SQL部分。

本课程所用数据源自Parch & Posey（文件parch_and_posey_db），这是一个业务为销售纸张的Toy Database。

本练习使用环境为PostgreSQL，如需练习，需先使用pg_restore命令将数据库（文件parch_and_posey_db）恢复至本机，具体操作可参考[这里](https://github.com/ayushi-b/SQL-for-Data-Analysis) 。

> 1. 创建databse: CREATE DATABASE parch_and_posey
> 2. 将parch_and_posey_db恢复该database: g_restore -d parch_and_posey /本地路径/parch_and_posey_db

本数据库实体关系图（ERD）如下：
![avatar](https://github.com/ayushi-b/SQL-for-Data-Analysis/raw/master/schema.png)

## 题目

项目中的SQL文件为本人的解答，如需优达学城的标准解答请敲邮箱索取。

本项目各项练习题目如下：

### CASE 共4题

1. 我们想要根据相关的消费量了解三组不同的客户。最高的一组是终身价值（所有订单的总销售额）大于 200,000 美元的客户。第二组是在 200,000 到 100,000 美元之间的客户。最低的一组是低于 under 100,000 美元的客户。请提供一个表格，其中包含与每个客户相关的级别。你应该提供客户的名称、所有订单的总销售额和级别。消费最高的客户列在最上面。

2. 现在我们想要执行和第一个问题相似的计算过程，但是我们想要获取在 2016 年和 2017 年客户的总消费数额。级别和上一个问题保持一样。消费最高的客户列在最上面。

3. 我们想要找出绩效最高的销售代表，也就是有超过 200 个订单的销售代表。创建一个包含以下列的表格：销售代表名称、订单总量和标为 top 或 not 的列（取决于是否拥有超过 200 个订单）。销售量最高的销售代表列在最上面。

4. 之前的问题没有考虑中间水平的销售代表或销售额。管理层决定也要看看这些数据。我们想要找出绩效很高的销售代表，也就是有超过 200 个订单或总销售额超过 750000 美元的销售代表。中间级别是指有超过 150 个订单或销售额超过 500000 美元的销售代表。创建一个包含以下列的表格：销售代表名称、总订单量、所有订单的总销售额，以及标为 top、middle 或 low 的列（取决于上述条件）。在最终表格中将销售额最高的销售代表列在最上面。根据上述标准，你可能会见到几个表现很差的销售代表！


### CONCAT 共3题

1. accounts 表格中的每个客户都想为每个 primary_poc 创建一个电子邮箱。邮箱应该是 primary_poc 的名字.primary_poc的姓氏@公司名称.com。

2. 你可能注意到了，在上一个答案中，有些公司名称存在空格，肯定不适合作为邮箱地址。看看你能否通过删掉客户名称中的所有空格来创建合适的邮箱地址，否则你的答案就和问题 1. 的一样。此处是一些实用的文档。

3. 我们还需要创建初始密码，在用户第一次登录时将更改。初始密码将是 primary_poc 的名字的第一个字母（小写），然后依次是名字的最后一个字母（小写）、姓氏的第一个字母（小写）、姓氏的最后一个字母（小写）、名字的字母数量、姓氏的字母数量，然后是合作的公司名称（全大写，没有空格）


### FUNCTION - LEFT RIGHT 共2题

1. 在 accounts 表格中，有一个列存储的是每个公司的网站。最后三个数字表示他们使用的是什么类型的网址。此处给出了扩展（和价格）列表。请获取这些扩展并得出 accounts 表格中每个网址类型的存在数量。

2. 对于公司名称（甚至名称的第一个字母）的作用存在颇多争议 - https://www.entrepreneur.com/article/237643 。请从 accounts 表格中获取每个公司名称的第一个字母，看看以每个字母（数字）开头的公司名称分布情况。


### FUNCTION - POSITON STRPO 共2题

1. 使用 accounts 表格创建一个名字和姓氏列，用于存储 primary_poc 的名字和姓氏。

2. 现在创建一个包含 sales_rep 表格中每个销售代表姓名的列，同样，需要提供名字和姓氏列。


### WITH 共7题

0. 你需要算出每个渠道每天的平均事件数。

1. 提供每个区域拥有最高销售额 (total_amt_usd) 的销售代表的姓名。

2. 对于具有最高销售额 (total_amt_usd) 的区域，总订单量是多少（注：订单量这里指购买货物总数）？

3. 对于购买标准纸张数量 (standard_qty) 最多的客户（在作为客户的整个时期内），有多少客户的购买总数（total）比该用户的购买总数（total）更多？

4. 对于（在作为客户的整个时期内）总消费 (total_amt_usd) 最多的客户，他们在每个渠道上有多少 web_events？

5. 对于总消费前十名的客户，他们的平均终身消费 (total_amt_usd) 是多少?

6. 比所有客户的平均消费高的企业平均终身消费 (total_amt_usd) 是多少？
