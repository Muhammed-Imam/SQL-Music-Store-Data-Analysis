--> Q1: Who is the senior most employee based on job title?
SELECT TOP(1) Title, CONCAT(Fname, ' ', Lname) AS [Full Name], Levels
FROM Employee
ORDER BY Levels DESC

select * from Employee

--> Q2: Which countries have the most Invoices?
SELECT Billing_country, COUNT(Customer_id) AS [Number_of_Customers]
FROM Invoice
GROUP BY Billing_country
ORDER BY [Number_of_Customers] DESC

--> Q3: What are top 3 values of total invoice?
SELECT TOP(3)Total
FROM Invoice
ORDER BY Total DESC

select top(3)Total, c.Fname+' '+c.Lname as [Full name]
from Invoice i inner join Customer c
on c.Customer_id = i.Customer_id
order by Total desc

--> Q4: Which city has the best customers? We would like to throw a promotional Music 
--      Festival in the city we made the most money. Write a query that returns one city that 
--      has the highest sum of invoice totals. Return both the city name & sum of all invoice totals
SELECT TOP(1)Billing_city, SUM(Total) AS [Invoice_Total]
FROM Invoice
GROUP BY Billing_city
ORDER BY [Invoice_Total] DESC 

--> Q5: Who is the best customer? The customer who has spent the most money will be 
--      declared the best customer. Write a query that returns the person who has spent the most money
SELECT TOP(1)C.Customer_id, CONCAT(C.Fname, ' ',C.Lname) AS [Best_Customer], SUM(Total) AS [Total_Spending]
FROM Customer C INNER JOIN Invoice I
ON C.Customer_id = I.Customer_id
GROUP BY C.Customer_id, CONCAT(C.Fname, ' ',C.Lname)
ORDER BY [Total_Spending] DESC
