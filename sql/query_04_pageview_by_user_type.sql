---Q4: Calc Total Discount Cost belongs to Seasonal Discount for each SubCategory


---total discount cost = %discount * quantity discount * price unit discount




--- calculate total discount cost
WITH raw1 AS(SELECT EXTRACT(YEAR FROM sale.ModifiedDate) AS year,
      subcat.name AS name,
      DiscountPCT*UnitPrice*OrderQty AS total_cost,
      offer.Type


                  FROM `adventureworks2019.Sales.SpecialOffer` AS offer


                  LEFT JOIN `adventureworks2019.Sales.SalesOrderDetail` AS sale
                    ON offer.SpecialofferID = sale.SpecialofferID


                  LEFT JOIN `adventureworks2019.Production.Product` AS product_defi
                    ON sale.ProductID = product_defi.ProductID


                  LEFT JOIN `adventureworks2019.Production.ProductSubcategory` AS subcat
                    ON CAST(product_defi.ProductSubcategoryID AS INT64) = subcat.ProductSubcategoryID


                  WHERE EXTRACT(YEAR FROM sale.ModifiedDate) IN (SELECT EXTRACT(YEAR FROM ModifiedDate)
                                                                  FROM `adventureworks2019.Sales.SalesOrderDetail`
                                                                  GROUP BY EXTRACT(YEAR FROM ModifiedDate)
                                                                  HAVING COUNT( DISTINCT EXTRACT(MONTH FROM ModifiedDate)) = 12))


---Filter by seasonal discount
SELECT year, name,
      ROUND(SUM(total_cost),2) AS cost,
FROM raw1
WHERE Type LIKE '%Seasonal Discount%'
GROUP BY year, name
ORDER BY year;
