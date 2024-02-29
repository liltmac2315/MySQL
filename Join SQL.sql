/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
 select P.name as ProductName, C.name as CategoryName 
 from products as P
 inner join categories as C
 on C.CategoryID = P.CategoryID
 where C.Name = 'Computers';
 
 select products.Name, categories.name
 from products
 inner join categories on categories.CategoryID = products.CategoryID
 where catergories.name = "computer";
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
-- products table && reviews table and we'll join on productID column
 select poducts.Name as "product name", products.Price as "product price", review.Rating 
 from products as p
 inner join reviews on reviews.ProductID = products.ProductID
 where reviews.Rating = 5;
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
select e.FirstName, e.LastName, Sum(s.quantity) as total 
from sales as s
inner join employees as e on e.EmployeeID = s.EmployeeID
group by e.EmployeeID
order by total Desc
limit 2;

select * from sales
where EmployeeID = 33809;
/* joins: find the name of the department, and the name of the category for Appliances and Games */
select d.Name as 'department name', c.Name as 'category name' from departments as d
inner join categoriesas c on c.DepartmentID =d.DepartmentID
where c.Name = 'applainces' or c.Name = 'games';

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
 select p.Name, sum(s.quantity) as 'total sold', sum(s.quantity * s.PricePerUnit) as 'total price'
 from products as p
 inner join sales as s on s.productID = ProductID
 where p.ProductID = 97;
 -- To verify
 select * from sales where ProductID = 97;

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. 
--(only return for the lowest rating!) */
select p.Name, r.Reviewer, MIN(r.Rating) 
from products as p
inner join reviews as r on r.ProductID = p.productID
where p.ProductID = 857
Group by p.productID, Reviewer;

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */
select e.EmployeeID, e.FirstName, e.Lastname, p.Name, sum(s.Quantity) as TotalSold
from sales as s 
inner join employees as e on e.EmployeeID = s.EmployeeID
inner join products as p on p.productID = s.ProductID
Group by e.employeeeID, p.ProductID
order by TotalSold desc;