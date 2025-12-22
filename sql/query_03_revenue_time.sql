---Q3: Ranking Top 3 TeritoryID with biggest Order quantity of every year. If there's TerritoryID with same quantity in a year, do not skip the rank number
WITH raw1 AS(SELECT EXTRACT(YEAR FROM sale.ModifiedDate) AS year, TerritoryID, SUM(sale.OrderQty) AS qty_item,
        FROM `adventureworks2019.Sales.SalesOrderDetail` AS sale


        LEFT JOIN `adventureworks2019.Sales.SalesOrderHeader` AS header
            ON sale.SalesorderID =header.SalesorderID


        GROUP BY 1,2),
---Ranking by quantity item
raw2 AS(SELECT year, TerritoryID, qty_item,
                DENSE_RANK() OVER(PARTITION BY year ORDER BY qty_item DESC) AS rnk
        FROM raw1)


SELECT *
FROM raw2
WHERE rnk <=3
ORDER BY year DESC;
