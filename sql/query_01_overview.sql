--- Query 01: Calculate total visit, pageview, transaction for Jan, Feb and March 2017 (order by month)
 
--- Generate into month with format %Y%m in Jan, Feb & Mar 2017
WITH raw_1_3 AS(SELECT *, FORMAT_DATE('%Y%m', PARSE_DATE('%Y%m%d', date)) AS month
FROM `bigquery-public-data.google_analytics_sample.ga_sessions_2017*`
WHERE _table_suffix between '0101' and '0331')


--- Calculate total visit, pageview, transaction
SELECT month,
      SUM(totals.visits) AS visits,
      SUM(totals.pageviews) AS pageviews,
      SUM(totals.transactions) AS transactions
FROM raw_1_3
GROUP BY month
ORDER BY month;
