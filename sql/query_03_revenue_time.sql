---Query 03: Revenue by traffic source by week, by month in June 2017


--- Create Month and add Time &Time_type column
WITH Raw_Month AS(SELECT *,
      FORMAT_DATE('%Y%m', PARSE_DATE('%Y%m%d', date)) AS Time1,
      'Month' AS Time_type
      FROM `bigquery-public-data.google_analytics_sample.ga_sessions_201706*`),
--- Create Week
      Raw_Week AS(SELECT *,
            FORMAT_DATE('%Y%W', PARSE_DATE('%Y%m%d', date)) AS Week,
            'Week' AS Time_type
      FROM `bigquery-public-data.google_analytics_sample.ga_sessions_201706*`),


--- Combine to have raw data & unnest revenue
      raw_data AS(SELECT Time_type,
                        Time1,
                        trafficSource.source AS source,
                        productRevenue AS revenue  
                  FROM Raw_Month,
                  UNNEST (hits) hits,
                  UNNEST (hits.product) product
                  WHERE product.productRevenue is not null
                  UNION ALL
                  SELECT Time_type,
                        Week,
                        trafficSource.source AS source,
                        productRevenue AS revenue  
                  FROM Raw_Week,
                  UNNEST (hits) hits,
                  UNNEST (hits.product) product
                  WHERE product.productRevenue is not null)


SELECT Time_type,
      Time1,
      source,
      ROUND(SUM(revenue)/1000000,4) AS revenue
FROM raw_data
GROUP BY Time_type, Time1, source
ORDER BY revenue DESC;
