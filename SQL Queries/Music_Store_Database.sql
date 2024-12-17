----- CREATE TABLES -----
--1. TABLE Employee
CREATE TABLE Employee(
	Employee_id INT PRIMARY KEY,
	Fname		VARCHAR(20),
	Lname		VARCHAR(20),
	Title		VARCHAR(20),
	Reports_to	INT,
	Levels		VARCHAR(10),
	Birth_Date	DATE,
	Hire_Date	DATE,
	Address		VARCHAR(30),
	City		VARCHAR(30),
	State		VARCHAR(10),
	Country		VARCHAR(30),
	Postal_Code VARCHAR(30),
	Phone		VARCHAR(30),
	Fax			VARCHAR(30),
	Email		VARCHAR(30)
)

----------------------------------------------------
--2. TABLE Customer
CREATE TABLE Customer(
	Customer_id		INT PRIMARY KEY,
	Fname			VARCHAR(20),
	Lname			VARCHAR(20),
	Company			VARCHAR(30),
	Address			VARCHAR(30),
	City			VARCHAR(30),
	State			VARCHAR(10),
	Country			VARCHAR(30),
	Postal_code		VARCHAR(30),
	Phone			VARCHAR(30),
	Fax				VARCHAR(30),
	Email			VARCHAR(30),
	Support_rep_id	INT
)

----------------------------------------------------
--3. TABLE Invoice
CREATE TABLE Invoice(
	Invoice_id		INT PRIMARY KEY,
	Customer_id		INT,
	Invoice_date	DATE,
	Billing_address VARCHAR(50),
	Billing_city	VARCHAR(20),
	Billing_state	VARCHAR(20),
	Billing_country VARCHAR(20),
	Billing_postal	VARCHAR(20),
	Total			REAL
)

----------------------------------------------------
--4. TABLE Invoice_Line
CREATE TABLE Invoice_Line(
	Invoice_line_id INT PRIMARY KEY,
	Invoice_id		INT,
	Track_id		INT,
	Unit_price		SMALLMONEY,
	Quantity		INT
)

----------------------------------------------------
--5. TABLE Track
CREATE TABLE Track(
	Track_id		INT PRIMARY KEY,
	Track_Name		VARCHAR(30),
	Album_id		INT,
	Media_type_id	INT,
	Genre_id		INT,
	Composer		VARCHAR(30),
	MilliSeconds	TIMESTAMP,
	Bytes			BIGINT,
	Unit_price		BIGINT
)

----------------------------------------------------
--6. TABLE Playlist
CREATE TABLE Playlist(
	Playlist_id			INT PRIMARY KEY,
	Playlist_name		VARCHAR(30)
)

----------------------------------------------------
--7. TABLE Playlist_Track
CREATE TABLE Playlist_Track(
	Playlist_id INT,
	Track_id	INT,
	CONSTRAINT PK PRIMARY KEY(Playlist_id,Track_id)
)

----------------------------------------------------
--8. TABLE Artist
CREATE TABLE Artist(
	Artist_id	 INT PRIMARY KEY,
	Artist_name  VARCHAR(30)
) 

----------------------------------------------------
--9. TABLE Album
CREATE TABLE Album(
	Album_id   INT PRIMARY KEY,
	Title	   VARCHAR(30),
	Artist_id  INT
)

----------------------------------------------------
--10. TABLE Media_Type
CREATE TABLE Media_Type(
	Media_type_id	INT PRIMARY KEY,
	Media_type_name VARCHAR(20)
)

----------------------------------------------------
--11. TABLE Genre
CREATE TABLE Genre(
	Genre_id	INT PRIMARY KEY,
	Genre_name  VARCHAR(30)
)