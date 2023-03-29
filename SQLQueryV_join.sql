Use AdventureWorks2019 

Select P.Color, P.Size, PM.CatalogDescription
From Production.ProductModel PM
Inner Join Production.Product P ON  P.ProductModelID = PM.ProductModelID;
--Query 1

Select P.ProductID, SOD.SalesOrderDetailID, *
From Production.Product P Left Join Sales.SalesOrderDetail SOD ON P.ProductID = SOD.ProductID;
--Query 2

SELECT SP.BusinessEntityID, P.ProductID
FROM Sales.SalesPerson SP
CROSS JOIN Production.Product P;
--Query 3

SELECT DISTINCT P.Name, SOD.SalesOrderID
FROM Production.Product p
LEFT JOIN Sales.SalesOrderDetail sod ON P.ProductID = SOD.ProductID
UNION
SELECT DISTINCT 'Product Not Listed' as [Name], SOD.SalesOrderID
FROM Sales.SalesOrderDetail sod
WHERE SOD.ProductID NOT IN (SELECT ProductID FROM Production.Product)
UNION
SELECT DISTINCT P.Name, SOD.SalesOrderID
FROM Production.Product P
JOIN Sales.SalesOrderDetail sod ON P.ProductID <> SOD.ProductID;
--Query 4



