---Q6: Trend of Stock level & MoM diff % by all product in 2011. If %gr rate is null then 0. Round to 1 decimal


---Choose facts which need in the formula
WITH raw1 AS(SELECT b.name,
                SUM(StockedQty) AS cur_stock,
                  EXTRACT(MONTH FROM a.ModifiedDate) AS month,
                  EXTRACT(YEAR FROM a.ModifiedDate) AS year
            FROM `adventureworks2019.Production.WorkOrder` as a
            LEFT JOIN `adventureworks2019.Production.Product` as b
            ON a.ProductID = b.ProductID
            WHERE EXTRACT(YEAR FROM a.ModifiedDate) = 2011
            GROUP BY 1,3,4)


---Calculate previous stock quantity & difference
SELECT name, month, year, cur_stock,
      LAG(cur_stock) OVER(PARTITION BY name ORDER BY month) AS pre_stock,
      ROUND(IFNULL(cur_stock/LAG(cur_stock) OVER(PARTITION BY name ORDER BY month)-1,0)*100,1) AS diff
FROM raw1
ORDER BY name, month DESC;
