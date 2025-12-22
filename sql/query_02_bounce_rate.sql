---Q2: Calc % YoY growth rate by SubCategory & release top 3 cat with highest grow rate. Can use metric: quantity_item. Round results to 2 decimal
---qty_diff = qty_item / prv_qty - 1


---Extract data that have full year
WITH raw_data AS(SELECT
                    EXTRACT(YEAR FROM sale.ModifiedDate) AS year,
                    subcat.name AS name,
                    SUM(sale.OrderQty) AS qty_item


                  FROM `adventureworks2019.Sales.SalesOrderDetail` AS sale


                  LEFT JOIN `adventureworks2019.Production.Product` AS product_defi
                    ON sale.ProductID = product_defi.ProductID


                  LEFT JOIN `adventureworks2019.Production.ProductSubcategory` AS subcat
                    ON CAST(product_defi.ProductSubcategoryID AS INT64) = subcat.ProductSubcategoryID


                  WHERE EXTRACT(YEAR FROM sale.ModifiedDate) IN (SELECT EXTRACT(YEAR FROM ModifiedDate)
                                                                  FROM `adventureworks2019.Sales.SalesOrderDetail`
                                                                  GROUP BY EXTRACT(YEAR FROM ModifiedDate)
                                                                  HAVING COUNT( DISTINCT EXTRACT(MONTH FROM ModifiedDate)) = 12)


                  GROUP BY 1, 2
                  ORDER BY 2),


--- define the latest year & previous year
latest_years AS (
  SELECT MAX(year) AS latest_year,
    MAX(year) - 1 AS prev_year
  FROM raw_data),


---Break current year & previous year in quantity
 raw2 AS(SELECT year,
                name,
                qty_item,
                LAG(qty_item) OVER (PARTITION BY name ORDER BY year) AS prv_qty
        FROM raw_data),


--- calculate %YOY growth & ranking
raw3 AS(SELECT name, qty_item, prv_qty,
      ROUND((qty_item/prv_qty -1),2) AS qty_diff,
      DENSE_RANK() OVER(ORDER BY (qty_item/prv_qty -1) DESC) AS rnk
        FROM raw2
        WHERE year = (SELECT latest_year FROM latest_years)
        AND qty_item IS NOT NULL AND prv_qty IS NOT NULL)


SELECT name, qty_item, prv_qty, qty_diff
FROM raw3
WHERE rnk<=3
ORDER BY rnk;


