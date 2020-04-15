/*
select p.ProductName, c.CategoryName
from [Product] as p
join Category as c
group by p.ProductName
order by p.ProductName
*/

/*
select Shipper.CompanyName, [Order].Id, [Order].OrderDate FROM Shipper
join [Order]
where [Order].OrderDate < "2012-08-09"
group by [Order].Id
*/

/*
SELECT Product.ProductName, OrderDetail.ProductId, OrderDetail.OrderId, OrderDetail.Quantity FROM [OrderDetail]
JOIN Product 
ON OrderDetail.ProductId = Product.Id
WHERE OrderDetail.OrderId = 10251
ORDER BY Product.ProductName
*/
select [Order].Id as "Order ID", Customer.CompanyName as "Customer's Company Name", Employee.LastName as "Employee's Last Name" from [Order]
join Customer on Customer.Id = [Order].CustomerId
join Employee on Employee.Id = [Order].EmployeeId
where [Order].Id
