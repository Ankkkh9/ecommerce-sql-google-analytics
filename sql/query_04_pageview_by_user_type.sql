---Query 04: Average number of pageviews by purchaser type (purchasers vs non-purchasers) in June, July 2017.
---Hint 3: Avg pageview = total pageview / number unique user.


--- CTE for purchaser (generate YYYYMM & avg pageview)
WITH purchaser_data AS(SELECT FORMAT_DATE('%Y%m', PARSE_DATE('%Y%m%d', date)) AS month,
                        SUM(totals.pageviews) AS total_pageview,
                        COUNT(DISTINCT fullVisitorId) AS no_unique_user,
                        SUM(productRevenue) AS revenue,
                        ROUND(SUM(totals.pageviews)/COUNT(DISTINCT fullVisitorId),2) AS avg_pageviews_purchase
                FROM `bigquery-public-data.google_analytics_sample.ga_sessions_2017*`,
                        UNNEST (hits) hits,
                        UNNEST (hits.product) product
                WHERE _table_suffix between '0601' and '0731'
                        AND productRevenue IS NOT NULL
                GROUP BY FORMAT_DATE('%Y%m', PARSE_DATE('%Y%m%d', date))
                HAVING SUM(totals.transactions)>=1),


--- CTE for non-purchaser (generate YYYYMM & avg pageview)
non_purchaser_data AS(SELECT FORMAT_DATE('%Y%m', PARSE_DATE('%Y%m%d', date)) AS month,
                        SUM(totals.pageviews) AS total_pageview,
                        COUNT(DISTINCT fullVisitorId) AS no_unique_user,
                        SUM(productRevenue) AS revenue,
                        ROUND(SUM(totals.pageviews)/COUNT(DISTINCT fullVisitorId),2) AS avg_pageviews_non_purchase
                FROM `bigquery-public-data.google_analytics_sample.ga_sessions_2017*`,
                        UNNEST (hits) hits,
                        UNNEST (hits.product) product
                WHERE _table_suffix between '0601' and '0731'
                        AND productRevenue IS NULL
                        AND totals.transactions IS NULL
                GROUP BY FORMAT_DATE('%Y%m', PARSE_DATE('%Y%m%d', date)))


--- Combine 2 data of non_purchase & purchase
SELECT purchaser_data.month,avg_pageviews_purchase,avg_pageviews_non_purchase
FROM purchaser_data
INNER JOIN non_purchaser_data
ON purchaser_data.month = non_purchaser_data.month
ORDER BY purchaser_data.month;
