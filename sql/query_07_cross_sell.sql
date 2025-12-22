--Q7: Calc Ratio of Stock / Sales in 2011 by product name, by month


---Order results by month desc, ratio desc. Round Ratio to 1 decimal mom yoy


---OUTPUT: product name, product id, month, year, stock, sale, ratio


---Data from sale table
WITH sale AS(SELECT a.productID, b.name,
                EXTRACT(YEAR FROM a.ModifiedDate) AS year,
                EXTRACT(MONTH FROM a.ModifiedDate) AS month,
                sum(OrderQty) AS order_qty
            FROM `adventureworks2019.Sales.SalesOrderDetail` AS a
            LEFT JOIN `adventureworks2019.Production.Product` AS b
            ON a.ProductID = b.ProductID
            WHERE EXTRACT(YEAR FROM a.ModifiedDate) = 2011
            GROUP BY 1,2,3,4),


--Data stocks
    stock AS(SELECT productID,
                    EXTRACT(YEAR FROM c.ModifiedDate) AS year,
                    EXTRACT(MONTH FROM c.ModifiedDate) AS month,
                    sum(StockedQty) AS stock_qty
            FROM `adventureworks2019.Production.WorkOrder` AS c
            WHERE EXTRACT(YEAR FROM ModifiedDate) = 2011
            GROUP BY 1,2,3)


---concat stock & sale and calculate ratio
SELECT sale.*, stock_qty,
      round(stock_qty/order_qty,1) AS ratio
FROM sale
LEFT JOIN stock
ON sale.productID = stock.productID AND sale.year = stock.year AND sale.month = stock.month
ORDER BY month DESC, ratio DESC;
