---Query 05: Average number of transactions per user that made a purchase in July 2017


--- Generate format YYYYMM
SELECT FORMAT_DATE('%Y%m', PARSE_DATE('%Y%m%d', date)) AS month,
--- Caluclate avg number of transactions per user= total transactions/ total unique vistors
      ROUND(SUM(totals.transactions)/COUNT(DISTINCT fullVisitorId),2) AS Avg_total_transactions_per_user
FROM `bigquery-public-data.google_analytics_sample.ga_sessions_201707*`,
  UNNEST (hits) hits,
  UNNEST (hits.product) product
--- Filter the purchaser only
WHERE productRevenue IS NOT NULL
AND product.productRevenue IS NOT NULL
GROUP BY FORMAT_DATE('%Y%m', PARSE_DATE('%Y%m%d', date))
HAVING SUM(totals.transactions)>=1;
