---Q5: Retention rate of Customer in 2014 with status of Successfully Shipped (Cohort Analysis)


---Step 1: create month & count customer in all month
WITH rawdata AS(SELECT customerID,
                  EXTRACT(MONTH FROM ModifiedDate) AS month,
                FROM `adventureworks2019.Sales.SalesOrderHeader`
                WHERE EXTRACT(YEAR FROM ModifiedDate) = 2014
                      AND status = 5
                ORDER BY month),


---Step 2: Find the opening month
      opening AS(SELECT customerID,
                  MIN(EXTRACT(MONTH FROM ModifiedDate)) AS opening_m
                  FROM `adventureworks2019.Sales.SalesOrderHeader`
                  WHERE EXTRACT(YEAR FROM ModifiedDate) = 2014
                        AND status = 5
                  GROUP BY customerID)




SELECT opening_m AS month_join,
      CONCAT('M - ',month-opening_m) AS month_diff,
      COUNT(distinct rawdata.customerID)
FROM rawdata
LEFT JOIN opening
ON rawdata.customerID = opening.customerID
GROUP BY 1,2
ORDER BY month_join, month_diff;


