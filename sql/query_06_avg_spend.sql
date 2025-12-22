---Query 06: Average amount of money spent per session. Only include purchaser data in July 2017
---Hint 2: avg_spend_per_session = total revenue/ total visit


--- Generate format YYYYMM
SELECT FORMAT_DATE('%Y%m', PARSE_DATE('%Y%m%d', date)) AS month,
---avg_spend_per_session = total revenue/ total visit
      ROUND((SUM(productRevenue)/SUM(totals.visits))/1000000,2) AS avg_revenue_by_user_per_visit
FROM `bigquery-public-data.google_analytics_sample.ga_sessions_201707*`,
  UNNEST (hits) hits,
  UNNEST (hits.product) product
--- Filter the purchaser only
WHERE productRevenue IS NOT NULL
AND product.productRevenue IS NOT NULL
GROUP BY FORMAT_DATE('%Y%m', PARSE_DATE('%Y%m%d', date))
HAVING SUM(totals.transactions)>=1;
