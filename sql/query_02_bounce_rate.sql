---Query 02: Bounce rate per traffic source in July 2017 (Bounce_rate = num_bounce/total_visit) (order by total_visit DESC)


--- Filter for source and total visits,total bounces
WITH raw_data AS(SELECT trafficSource.source AS source,
      SUM(totals.visits) AS total_visits,
      SUM(totals.bounces) AS total_no_of_bounces,
      FROM `bigquery-public-data.google_analytics_sample.ga_sessions_201707*`
      GROUP BY trafficSource.source  )


SELECT source, total_visits, total_no_of_bounces,
      ROUND((total_no_of_bounces*100/total_visits),3) AS Bounce_rate
FROM raw_data
ORDER BY total_visits DESC;
