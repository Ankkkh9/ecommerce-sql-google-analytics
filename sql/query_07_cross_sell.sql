---Query 07: Other products purchased by customers who purchased product "YouTube Men's Vintage Henley" in July 2017. Output should show product name and the quantity was ordered.


-- list down visitor who purchase "YouTube Men's Vintage Henley"
WITH customer_id AS (
  SELECT DISTINCT fullVisitorId AS visitor_id
  FROM `bigquery-public-data.google_analytics_sample.ga_sessions_201707*`,
    UNNEST(hits) AS hits,
    UNNEST(hits.product) AS product
  WHERE _table_suffix BETWEEN '01' AND '31'
    AND v2ProductName = "YouTube Men's Vintage Henley"
    AND productRevenue IS NOT NULL
    AND totals.transactions >= 1)


--- Find other products that visitors above purchase
SELECT
  v2ProductName AS other_purchased_products,
  SUM(productQuantity) AS quantity
FROM `bigquery-public-data.google_analytics_sample.ga_sessions_201707*` AS table1,
  UNNEST(hits) AS hits,
  UNNEST(hits.product) AS product
INNER JOIN customer_id
  ON table1.fullVisitorId = customer_id.visitor_id
WHERE _table_suffix BETWEEN '01' AND '31'
  AND v2ProductName != "YouTube Men's Vintage Henley"
  AND productRevenue IS NOT NULL
  AND totals.transactions >= 1
GROUP BY v2ProductName
ORDER BY quantity DESC;
