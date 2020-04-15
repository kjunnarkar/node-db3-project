-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.

select p.ProductName, c.CategoryName
from [Product] as p
join Category as c
group by p.ProductName
order by p.ProductName

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.

select Shipper.CompanyName, [Order].Id, [Order].OrderDate FROM Shipper
join [Order]
where [Order].OrderDate < "2012-08-09"
group by [Order].Id

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.

SELECT Product.ProductName, OrderDetail.ProductId, OrderDetail.OrderId, OrderDetail.Quantity FROM [OrderDetail]
JOIN Product 
ON OrderDetail.ProductId = Product.Id
WHERE OrderDetail.OrderId = 10251
ORDER BY Product.ProductName

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.

select [Order].Id as "Order ID", Customer.CompanyName as "Customer's Company Name", Employee.LastName as "Employee's Last Name" from [Order]
join Customer on Customer.Id = [Order].CustomerId
join Employee on Employee.Id = [Order].EmployeeId
where [Order].Id
