-- Questions Set 3 --

--> Q1: Find how much amount spent by each customer on artists? 
--	Write a query to return customer name, artist name and total spent
SELECT C.Customer_id, C.Fname, c.Lname, A.Artist_name, SUM(IL.Unit_price*IL.Quantity) AS [Total_Spending]
FROM Customer C INNER JOIN Invoice I
	 ON C.Customer_id = I.Customer_id
	 INNER JOIN Invoice_Line IL
	 ON I.Invoice_id = IL.Invoice_id
	 INNER JOIN Track T
	 ON T.Track_id = IL.Track_id
	 INNER JOIN Album Alb
	 ON Alb.Album_id = T.Album_id
	 INNER JOIN Artist A
	 ON A.Artist_id = ALB.Artist_id
GROUP BY C.Customer_id, C.Fname, c.Lname, A.Artist_name
ORDER BY [Total_Spending] DESC

--> Q2: We want to find out the most popular music Genre for each country. We determine the 
--	most popular genre as the genre with the highest amount of purchases. Write a query 
--	that returns each country along with the top Genre. For countries where the maximum 
--	number of purchases is shared return all Genres
SELECT *
FROM ( SELECT C.Country, COUNT(IL.Quantity) AS [Total_Sales], G.Genre_id, G.Genre_name,
	   ROW_NUMBER() OVER(PARTITION BY C.Country ORDER BY COUNT(IL.Quantity) DESC) AS RN
	   FROM Customer C INNER JOIN Invoice I
	   ON C.Customer_id = I.Customer_id 
	   INNER JOIN Invoice_Line IL
	   ON I.Invoice_id = IL.Invoice_id 
	   INNER JOIN Track T
	   ON T.Track_id = IL.Track_id
	   INNER JOIN Genre G
	   ON G.Genre_id = T.Genre_id
	   GROUP BY C.Country, G.Genre_id, G.Genre_name) AS Temp
WHERE RN = 1


--> Q3: Write a query that determines the customer that has spent the most on music for each country.
--	Write a query that returns the country along with the top customer and how
--	much they spent. For countries where the top amount spent is shared, provide all 
--	customers who spent this amount
SELECT *
FROM ( SELECT C.Customer_id,C.Fname,C.Lname, I.Billing_country, SUM(I.Total) AS [Total_Spending],
	   ROW_NUMBER() OVER(PARTITION BY I.Billing_country ORDER BY SUM(I.Total) DESC) AS RN
	   FROM Customer C INNER JOIN Invoice I
	   ON C.Customer_id = I.Customer_id
	   GROUP BY C.Customer_id,C.Fname, C.Lname, I.Billing_country) AS Temp
WHERE RN = 1
