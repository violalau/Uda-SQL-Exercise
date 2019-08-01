--WITH 0
--问题：你需要算出每个渠道每天的平均事件数。

WITH t1 AS(
SELECT w.channel, DATE_TRUNC('day', w.occurred_at) AS day,
COUNT(*) AS event_count
FROM web_events w
GROUP BY 1,2)

SELECT channel, AVG(event_count) AS avg_events
FROM t1
GROUP BY 1
ORDER BY 2 DESC