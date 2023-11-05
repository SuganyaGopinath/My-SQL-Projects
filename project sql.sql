
--a. Get all the details from the person table including email ID, phone number and phone number Type

select p.BusinessEntityID,p.PersonType,p.Title,p.FirstName,p.LastName,p.MiddleName,p.EmailPromotion,p.rowguid,p.Demographics,p.ModifiedDate,pp.PhoneNumber,pp.PhoneNumberTypeID,pe.EmailAddress 
from Person.Person p
inner join 
Person.PersonPhone pp on p.BusinessEntityID=pp.BusinessEntityID
inner join 
Person.EmailAddress pe on pp.BusinessEntityID=pe.BusinessEntityID

--b. Get the details of the sales header order made in May 2011


SELECT * from sales.SalesOrderHeader where OrderDate = '2011-05-31 00:00:00.000'  

--c. Get the details of the sales details order made in the month of May 2011
SELECT * from sales.SalesOrderDetail where OrderDate = '2011-05-31 00:00:00.000'  

select soh.SalesOrderID,soh.OrderDate,soh.DueDate,soh.shipDate,soh.SalesPersonID,soh.CreditCardID,sod.salesOrderDetailID,sod.OrderQty,sod.ProductID,sod.UnitPrice,
sod.UnitPriceDiscount,sod.LineTotal,SUM(SOH.SubTotal) AS TotalSales from sales.SalesOrderHeader soh
inner join sales.SalesOrderDetail sod on
soh.SalesOrderID=sod.SalesOrderID
where FirstName='Gustavo'and LastName='Achong'

--d. Get the total sales made in May 2011

SELECT top 1 YEAR(SOH.OrderDate) as SalesYear,
         MONTH(SOH.OrderDate) as SalesMonth,
         SUM(SOH.SubTotal) AS TotalSales
 FROM sales.SalesOrderHeader SOH
     JOIN sales.SalesOrderDetail SOD ON SOH.SalesOrderId = SOD.SalesOrderId
GROUP BY YEAR(SOH.OrderDate),MONTH(SOH.OrderDate)
ORDER BY YEAR(SOH.OrderDate),MONTH(SOH.OrderDate) 

--e. Get the total sales made in the year 2011 by month order by increasing sales
SELECT 
    DATEPART(MONTH, OrderDate) AS Month,
    SUM(subtotal) AS TotalSales
FROM 
    sales.salesOrderHeader
WHERE 
    YEAR(Orderdate) = 2011
GROUP BY 
    DATEPART(MONTH,OrderDate)
ORDER BY 
    TotalSales ASC;






SELECT  YEAR(SOH.OrderDate) as SalesYear,
         MONTH(SOH.OrderDate) as SalesMonth,
         SUM(SOH.SubTotal) AS TotalSales
 FROM sales.SalesOrderHeader SOH
     JOIN sales.SalesOrderDetail SOD ON SOH.SalesOrderId = SOD.SalesOrderId
GROUP BY YEAR(SOH.OrderDate),MONTH(SOH.OrderDate)

--f. Get the total sales made to the customer with FirstName='Gustavo'and LastName='Achong'

SELECT  YEAR(SOH.OrderDate) as SalesYear,
         MONTH(SOH.OrderDate) as SalesMonth,
         SUM(SOH.SubTotal) AS TotalSales
 FROM sales.SalesOrderHeader SOH
     JOIN sales.SalesOrderDetail SOD ON SOH.SalesOrderId = SOD.SalesOrderId
	 where First
GROUP BY YEAR(SOH.OrderDate),MONTH(SOH.OrderDate)

select FirstName,p.LastName,p.MiddleName,SUM(SOH.SubTotal) AS TotalSales from
Person.Person p
inner join Sales.PersonCreditCard pcc
on p.BusinessEntityID=pcc.BusinessEntityID
inner join sales.SalesOrderHeader SOH
on pcc.CreditCardID=soh.CreditCardID
where FirstName='Gustavo'and LastName='Achong'
