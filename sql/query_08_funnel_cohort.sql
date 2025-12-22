---Query 08: Calculate cohort map from product view to addtocart to purchase in Jan, Feb and March 2017. For example, 100% product view then 40% add_to_cart and 10% purchase.




--- Create number product view & product add-to-cart by month format (YYYYMM)
WITH raw_1 AS(SELECT FORMAT_DATE('%Y%m', PARSE_DATE('%Y%m%d', date)) AS month,
  COUNT(CASE WHEN eCommerceAction.action_type = '2' THEN 1 END) AS num_product_view,
  COUNT(CASE WHEN eCommerceAction.action_type = '3' THEN 1 END) AS num_addtocart
FROM `bigquery-public-data.google_analytics_sample.ga_sessions_2017*`,
  UNNEST(hits) AS hits,
  UNNEST(hits.product) AS products
---Filter Jan, Feb, Mar 2017
WHERE _table_suffix between '0101' and '0331'
      AND (products.isImpression IS NULL OR products.isImpression = FALSE)
GROUP BY FORMAT_DATE('%Y%m', PARSE_DATE('%Y%m%d', date))),


--- Create number product purchase by month format (YYYYMM)
raw_2 AS(SELECT FORMAT_DATE('%Y%m', PARSE_DATE('%Y%m%d', date)) AS month,
  COUNT(CASE WHEN eCommerceAction.action_type = '6' THEN 1 END) AS num_purchase
FROM `bigquery-public-data.google_analytics_sample.ga_sessions_2017*`,
  UNNEST(hits) AS hits,
  UNNEST(hits.product) AS products
---Filter Jan, Feb, Mar 2017
WHERE _table_suffix between '0101' and '0331'
      AND (products.isImpression IS NULL OR products.isImpression = FALSE)
      AND productRevenue IS NOT NULL
GROUP BY FORMAT_DATE('%Y%m', PARSE_DATE('%Y%m%d', date)))


---Combine 3 numbers and calculate add-to-cart rate and purchase rate
SELECT raw_1.month,
      num_product_view,
      num_addtocart,
      num_purchase,
---Add_to_cart_rate = number product  add to cart (3)/number product view(2)
      ROUND(num_addtocart*100/num_product_view,2) AS Add_to_cart_rate,
---Purchase_rate = number product purchase(6)/number product view.
      ROUND(num_purchase*100/num_product_view,2) AS Purchase_rate
FROM raw_1
INNER JOIN raw_2
ON raw_1.month = raw_2.month
ORDER BY month;
