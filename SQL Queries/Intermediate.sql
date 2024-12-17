--> Q1: Write query to return the email, first name, last name, & Genre of all Rock Music listeners. 
--		Return your list ordered alphabetically by email starting with A
SELECT DISTINCT C.Email, C.Fname, C.Lname, G.Genre_name
FROM Customer C INNER JOIN Invoice I
	 ON C.Customer_id = I.Customer_id
	 INNER JOIN Invoice_Line IL
	 ON I.Invoice_id = IL.Invoice_id
	 INNER JOIN Track T
	 ON T.Track_id = IL.Track_id
	 INNER JOIN Genre G
	 ON G.Genre_id = T.Genre_id AND G.Genre_name = 'Rock'
ORDER BY C.Email ASC

--> Q2: Let's invite the artists who have written the most rock music in our dataset. 
--		Write a query that returns the Artist name and total track count of the top 10 rock bands
SELECT TOP(10)A.Artist_id, A.Artist_name, COUNT(A.Artist_id) AS Number_of_Tracks
FROM Track T INNER JOIN Album Alb
	 ON Alb.Album_id = T.Album_id
	 INNER JOIN Artist A
	 ON A.Artist_id = Alb.Artist_id
	 INNER JOIN Genre G
	 ON G.Genre_id = T.Genre_id AND G.Genre_name LIKE 'Rock'
GROUP BY A.Artist_id, A.Artist_name
ORDER BY Number_of_Tracks DESC

--> Q3: Return all the track names that have a song length longer than the average song length. 
--		Return the Name and MilliSeconds for each track. Order by the song length with the longest songs listed first
SELECT Track_name, MilliSeconds
FROM Track 
WHERE MilliSeconds > (SELECT AVG(MilliSeconds) AS Avg_Track_Length FROM Track)
ORDER BY MilliSeconds DESC
