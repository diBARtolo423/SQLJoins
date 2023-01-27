/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
SELECT p.Name, c.Name AS 'Computers'
FROM categories AS c
JOIN products As p
ON p.CategoryID = c.CategoryID
WHERE c.CategoryID = 1 AND p.CategoryID = 1;

/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
SELECT p.Name, p.Price, r.Rating
FROM products AS p
JOIN reviews AS r
ON p.ProductID = r.ProductID
WHERe r.Rating = 5;

/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT e.FirstName, e.LastName, e.EmployeeID, SUM(s.Quantity)
FROM sales AS s
LEFT JOIN employees AS e
ON e.EmployeeID = s.EmployeeID
GROUP BY e.EmployeeID
ORDER BY SUM(s.Quantity) DESC;

/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT d.Name AS 'Department Name', c.Name AS 'Category Name'
FROM departments AS d
JOIN categories AS c
ON d.DepartmentID = c.DepartmentID
WHERE c.Name = 'Appliances' OR c.Name = 'Games';

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
 SELECT p.Name AS 'Product', (p.Price * SUM(s.Quantity)) AS 'Total Sales', SUM(s.Quantity) AS 'Total Sold', p.ProductID
 FROM products AS p
 JOIN sales AS s
 ON p.ProductID = s.ProductID
 WHERE p.Name LIKE '%Hotel California%'
 GROUP BY p.Name, p.ProductID;

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT p.Name 'Product', r.Reviewer, r.Rating, r.Comment
FROM products AS p
LEFT JOIN reviews AS r
ON p.ProductID = r.ProductID
WHERE p.ProductID = 857 AND r.Rating = 1;

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */
/* SELECT e.EmployeeID, e.FirstName, e.LastName, p.Name 'Product', p.ProductID, s.SUM(Quantity)
FROM employees AS e
JOIN sales as S
ON p.ProductID = s.ProductID */

SELECT e.EmployeeID, e.FirstName, e.LastName, p.Name, SUM(s.Quantity) AS 'Quantity Sold'
FROM sales AS s
JOIN employees AS e
ON s.EmployeeID = e.EmployeeID
JOIN products AS p
ON p.ProductID = s.ProductID
GROUP BY e.EmployeeID, p.Name;
