------------------------------Create Table------------------------------------------

------------------------------Address Table------------------------------------------

USE [MovieRental]
GO

/****** Object:  Table [dbo].[Address]    Script Date: 11/24/2019 12:06:36 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Address](
	[AddressID] [int] NOT NULL,
	[Line1] [varchar](50) NOT NULL,
	[Line2] [varchar](50) NULL,
	[City] [varchar](25) NOT NULL,
	[State] [varchar](25) NOT NULL,
	[ZipCode] [int] NOT NULL,
	[Country] [varchar](25) NOT NULL,
 CONSTRAINT [Address_PK] PRIMARY KEY CLUSTERED 
(
	[AddressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Address]  WITH CHECK ADD  CONSTRAINT [constraint_zipcode] CHECK  (([ZipCode] like '[0-9][0-9][0-9][0-9][0-9]'))
GO

ALTER TABLE [dbo].[Address] CHECK CONSTRAINT [constraint_zipcode]
GO
---------------------------Actor Table--------------------------
USE [MovieRental]
GO

/****** Object:  Table [dbo].[Actor]    Script Date: 11/24/2019 12:05:23 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Actor](
	[ActorID] [int] NOT NULL,
	[ActorName] [varchar](50) NOT NULL,
 CONSTRAINT [Actor_PK] PRIMARY KEY CLUSTERED 
(
	[ActorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-----------------------Customer Table------------------------------------
USE [MovieRental]
GO

/****** Object:  Table [dbo].[Customer]    Script Date: 11/24/2019 12:07:21 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Customer](
	[CustomerID] [int] NOT NULL,
	[CustomerName] [varchar](50) NOT NULL,
	[DOB] [date] NULL,
	[AddressID] [int] NOT NULL,
 CONSTRAINT [Customer_PK] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [Customer_FK] FOREIGN KEY([AddressID])
REFERENCES [dbo].[Address] ([AddressID])
GO

ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [Customer_FK]
GO

ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [constraint_dob] CHECK  (([DOB]>='1900-01-01' AND [DOB]<='2019-11-19'))
GO

ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [constraint_dob]
GO

-----------------------Director Table-----------------------------

USE [MovieRental]
GO

/****** Object:  Table [dbo].[Director]    Script Date: 11/24/2019 12:08:02 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Director](
	[DirectorID] [int] NOT NULL,
	[DirectorName] [varchar](50) NOT NULL,
	[NumberOfMovies] [int] NOT NULL,
 CONSTRAINT [Director_PK] PRIMARY KEY CLUSTERED 
(
	[DirectorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Director]  WITH CHECK ADD  CONSTRAINT [constraing_maxmovies] CHECK  (([NumberOfMovies]<=(100)))
GO

ALTER TABLE [dbo].[Director] CHECK CONSTRAINT [constraing_maxmovies]
GO


--------------------------------Genre Table ------------------------
USE [MovieRental]
GO

/****** Object:  Table [dbo].[Genre]    Script Date: 11/24/2019 12:08:20 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Genre](
	[GenreID] [int] NOT NULL,
	[GenreName] [varchar](25) NOT NULL,
 CONSTRAINT [Genre_PK] PRIMARY KEY CLUSTERED 
(
	[GenreID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Genre]  WITH CHECK ADD  CONSTRAINT [constraint_genr] CHECK  (([GenreName]='Political Drama' OR [GenreName]='Cyberpunk' OR [GenreName]='Documentary' OR [GenreName]='Biographical' OR [GenreName]='Romantic Comedy' OR [GenreName]='Mystery' OR [GenreName]='Drama' OR [GenreName]='Historical' OR [GenreName]='Adventure' OR [GenreName]='Fantasy' OR [GenreName]='Animation' OR [GenreName]='Romance' OR [GenreName]='Horror' OR [GenreName]='Comedy' OR [GenreName]='Thriller' OR [GenreName]='Science Fiction' OR [GenreName]='Action'))
GO

ALTER TABLE [dbo].[Genre] CHECK CONSTRAINT [constraint_genr]
GO

-----------------------Language Table --------------------------------
USE [MovieRental]
GO

/****** Object:  Table [dbo].[Language]    Script Date: 11/24/2019 12:08:40 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Language](
	[LanguageID] [int] NOT NULL,
	[Language] [varchar](25) NOT NULL,
 CONSTRAINT [Language_PK] PRIMARY KEY CLUSTERED 
(
	[LanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Language]  WITH CHECK ADD  CONSTRAINT [constraint_language] CHECK  (([Language]='Oriya' OR [Language]='Romanian' OR [Language]='Japanese' OR [Language]='Persian' OR [Language]='Mandarin' OR [Language]='Arabic' OR [Language]='Spanish' OR [Language]='Hindi' OR [Language]='French' OR [Language]='English'))
GO

ALTER TABLE [dbo].[Language] CHECK CONSTRAINT [constraint_language]
GO

------------------------------------Location Table ----------------------------------
USE [MovieRental]
GO

/****** Object:  Table [dbo].[Location]    Script Date: 11/24/2019 12:09:02 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Location](
	[LocationID] [int] NOT NULL,
	[Country] [varchar](25) NOT NULL,
 CONSTRAINT [Location_PK] PRIMARY KEY CLUSTERED 
(
	[LocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

----------------------------------------Payment Table -------------------------------

USE [MovieRental]
GO

/****** Object:  Table [dbo].[Payment]    Script Date: 11/24/2019 12:09:36 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Payment](
	[PaymentID] [int] NOT NULL,
	[Payment_Type] [varchar](25) NOT NULL,
 CONSTRAINT [Payment_PK] PRIMARY KEY CLUSTERED 
(
	[PaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [constraint_paytype] CHECK  (([Payment_Type]='Paypal' OR [Payment_Type]='Credit Care' OR [Payment_Type]='Debit Card' OR [Payment_Type]='Cash'))
GO

ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [constraint_paytype]
GO

--------------------------------Rating Table ----------------------------------

USE [MovieRental]
GO

/****** Object:  Table [dbo].[Rating]    Script Date: 11/24/2019 12:10:01 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Rating](
	[RatingID] [int] NOT NULL,
	[IMDB_Rating] [int] NOT NULL,
	[Rotten_Tomatoes] [int] NOT NULL,
 CONSTRAINT [Rating_PK] PRIMARY KEY CLUSTERED 
(
	[RatingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

--------------------------Rental Table ---------------------------------
USE [MovieRental]
GO

/****** Object:  Table [dbo].[Rental]    Script Date: 11/24/2019 12:10:18 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Rental](
	[RentalID] [int] NOT NULL,
	[RentalDate] [date] NOT NULL,
	[DueDate] [date] NOT NULL,
	[ReturnDate] [date] NULL,
	[PaymentID] [int] NOT NULL,
	[MovieID] [int] NOT NULL,
	[CustomerID] [int] NOT NULL,
 CONSTRAINT [Renatal_PK] PRIMARY KEY CLUSTERED 
(
	[RentalID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

--------------------------------Movie Table----------------------------------
USE [MovieRental]
GO

/****** Object:  Table [dbo].[Movie]    Script Date: 11/24/2019 12:09:19 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Movie](
	[MovieID] [int] NOT NULL,
	[MovieName] [varchar](50) NOT NULL,
	[Price] [decimal](20, 4) NULL,
	[LanguageID] [int] NOT NULL,
	[DirectorID] [int] NOT NULL,
	[LocationID] [int] NOT NULL,
	[GenreID] [int] NOT NULL,
	[RatingID] [int] NOT NULL,
	[ReleaseDate] [date] NULL,
 CONSTRAINT [Movie_PK] PRIMARY KEY CLUSTERED 
(
	[MovieID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Movie]  WITH CHECK ADD  CONSTRAINT [Movie_FK1] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Language] ([LanguageID])
GO

ALTER TABLE [dbo].[Movie] CHECK CONSTRAINT [Movie_FK1]
GO

ALTER TABLE [dbo].[Movie]  WITH CHECK ADD  CONSTRAINT [Movie_FK2] FOREIGN KEY([DirectorID])
REFERENCES [dbo].[Director] ([DirectorID])
GO

ALTER TABLE [dbo].[Movie] CHECK CONSTRAINT [Movie_FK2]
GO

ALTER TABLE [dbo].[Movie]  WITH CHECK ADD  CONSTRAINT [Movie_FK3] FOREIGN KEY([LocationID])
REFERENCES [dbo].[Location] ([LocationID])
GO

ALTER TABLE [dbo].[Movie] CHECK CONSTRAINT [Movie_FK3]
GO

ALTER TABLE [dbo].[Movie]  WITH CHECK ADD  CONSTRAINT [Movie_FK4] FOREIGN KEY([GenreID])
REFERENCES [dbo].[Genre] ([GenreID])
GO

ALTER TABLE [dbo].[Movie] CHECK CONSTRAINT [Movie_FK4]
GO

ALTER TABLE [dbo].[Movie]  WITH CHECK ADD  CONSTRAINT [Movie_FK5] FOREIGN KEY([RatingID])
REFERENCES [dbo].[Rating] ([RatingID])
GO

ALTER TABLE [dbo].[Movie] CHECK CONSTRAINT [Movie_FK5]
GO

----------------------Acts Table-------------------------------------------
USE [MovieRental]
GO

/****** Object:  Table [dbo].[Acts]    Script Date: 11/24/2019 12:05:57 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Acts](
	[ActorID] [int] NOT NULL,
	[MovieID] [int] NOT NULL,
 CONSTRAINT [Acts_PK] PRIMARY KEY CLUSTERED 
(
	[ActorID] ASC,
	[MovieID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Acts]  WITH CHECK ADD  CONSTRAINT [Acts_FK1] FOREIGN KEY([ActorID])
REFERENCES [dbo].[Actor] ([ActorID])
GO

ALTER TABLE [dbo].[Acts] CHECK CONSTRAINT [Acts_FK1]
GO

ALTER TABLE [dbo].[Acts]  WITH CHECK ADD  CONSTRAINT [Acts_FK2] FOREIGN KEY([MovieID])
REFERENCES [dbo].[Movie] ([MovieID])
GO

ALTER TABLE [dbo].[Acts] CHECK CONSTRAINT [Acts_FK2]
GO



--------------------------------------------------Table for Trigger 1----------------------------------------------------------------------------------------

------------------------------DefaultCustomer Table---------------------------------
USE [MovieRental]
GO

/****** Object:  Table [dbo].[defaultcustomer]    Script Date: 11/24/2019 12:07:46 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[defaultcustomer](
	[CustomerID] [int] NOT NULL,
	[CustomerName] [varchar](25) NOT NULL,
	[Defaulter] [varchar](5) NULL,
	[MovieName] [varchar](50) NULL
) ON [PRIMARY]
GO


--------------------------------------------------Table for Trigger 2----------------------------------------------------------------------------------------

--------------------Cust-Audit Table-----------------------

USE [MovieRental]
GO

/****** Object:  Table [dbo].[DeletedCustomerRental]    Script Date: 11/24/2019 12:07:00 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE TABLE DeletedCustomerRental (
   CustomerID int,
   CustomerName varchar(50),
   MovieID int,
   MovieName varchar(50),
   Price decimal(20,4),
   RentalDate date,
   Due date,

);

------------------------------Create Trigger------------------------------------------

-------------------------------------------------------Create Trigger 1---------------------------------------------------------------------------------
create trigger Defaulters on dbo.rental 
for insert
as
begin
insert into dbo.defaultcustomer(cust.CustomerID,c.CustomerName,[Defaulter],m.MovieName)
select cust.CustomerID,c.CustomerName,'Yes',m.MovieName 
from inserted as cust,Customer c,Movie m
where cust.ReturnDate>cust.DueDate and cust.ReturnDate is not null and cust.CustomerID = c.CustomerID and cust.MovieID = m.MovieID
end;
			
-------------------------------------------------------Create Trigger 2---------------------------------------------------------------------------------
create trigger DeleteCustomer on Customer
for delete

as
begin



insert into DeletedCustomerRental(CustomerID, CustomerName, MovieID, MovieName, Price, RentalDate, Due) 

select cust.CustomerID, cust.CustomerName, mov.MovieID, mov.MovieName, mov.Price, ren.RentalDate, ren.DueDate
from   deleted cust JOIN Rental ren ON cust.CustomerID = ren.CustomerID
                   JOIN Movie mov ON ren.MovieID = mov.MovieID
				  --- JOIN deleted ON cust.CustomerID = deleted.CustomerID
---from deleted as cust,Rental ren,Movie mov where cust.CustomerID=ren.CustomerID and ren.MovieID=mov.MovieID

delete from Rental 
where Rental.CustomerID = (
select CustomerID from deleted
)
end

delete from Customer where CustomerID=10;
 select * from DeletedCustomerRental

--------------------------------------------------------------------------------------------------------------------------------------------------------------

------------------------------Create Functions------------------------------------------

----------------------------------------------------------------------Function 1----------------------------------------------------------------

GO
CREATE FUNCTION GetGenreAvgRate (@GenreID int)
RETURNS TABLE
AS
RETURN(
SELECT Genre.GenreName, ROUND(AVG(Movie.Price),2) AS Average_Rental_Rate
FROM Genre 
JOIN Movie 
ON Genre.GenreID = @GenreID
GROUP BY GenreName
)

SELECT * FROM GetGenreAvgRate (5)

----------------------------------------------------------------------Function 2----------------------------------------------------------------

GO
CREATE FUNCTION GetMovieCount (@language VARCHAR(25))
RETURNS TABLE
AS
RETURN(
SELECT [Language].[Language], COUNT(Movie.MovieName)  AS Movie_Count
FROM MOVIE
JOIN [dbo].[Language]
ON
[Language].LanguageID = Movie.LanguageID
WHERE [Language].[Language] = @language
GROUP BY [Language]
)




select * FROM GetMovieCount ('Arabic')


----------------------------------------------------------------------Create Stored Procedure----------------------------------------------------------------


-------------------------------Customer Booking SP------------------------

USE [MovieRental]
GO

/****** Object:  StoredProcedure [dbo].[CustomerBooking]    Script Date: 11/24/2019 12:13:47 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CustomerBooking]  @CustomerName varchar(50),@UniqueNumber int
AS
Select cust.CustomerName,mov.MovieName as "Ordered Movie",mov.ReleaseDate,gen.GenreName as "Genre",lan.Language,loc.Country as "Movie Source",
cust.CustomerID as "Unique Number"
from Movie mov join Rental ren on mov.MovieID=ren.MovieID
join Customer cust on cust.CustomerID=ren.CustomerID
join Language lan on lan.LanguageID=mov.LanguageID
join Genre gen on gen.GenreID=mov.GenreID
join Location loc on loc.LocationID=mov.LocationID
where cust.CustomerName=@CustomerName and cust.CustomerID=@UniqueNumber

GO

-------------------------------Movies By Genre SP----------------------------

USE [MovieRental]
GO

/****** Object:  StoredProcedure [dbo].[MovieByGenre_sp]    Script Date: 11/24/2019 12:14:18 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MovieByGenre_sp]  @GenreName varchar(25)
AS
select mov.MovieName, mov.ReleaseDate, gen.GenreName, cust.CustomerName
from Movie mov join Rental ren on mov.MovieID=ren.MovieID
join Customer cust on cust.CustomerID=ren.CustomerID
join Genre gen on gen.GenreID=mov.GenreID
where gen.GenreName=@GenreName

GO

-----------------------------Movie trends SP--------------------------------------

USE [MovieRental]
GO

/****** Object:  StoredProcedure [dbo].[MovieTrends]    Script Date: 11/24/2019 12:14:41 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MovieTrends]  @MovieName varchar(50)
AS
Select cust.CustomerName,mov.MovieName as "Ordered Movie",mov.ReleaseDate,gen.GenreName as "Genre",lan.Language,loc.Country as "Movie Source"
from Movie mov join Rental ren on mov.MovieID=ren.MovieID
join Customer cust on cust.CustomerID=ren.CustomerID
join Language lan on lan.LanguageID=mov.LanguageID
join Genre gen on gen.GenreID=mov.GenreID
join Location loc on loc.LocationID=mov.LocationID
where mov.MovieName=@MovieName
GO

------------------------------Ordered Movies ----------------------------------------


USE [MovieRental]
GO

/****** Object:  StoredProcedure [dbo].[OrderedMovies]    Script Date: 11/24/2019 12:15:30 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[OrderedMovies]  
AS
Select cust.CustomerName,Count(mov.MovieName) as 'Ordered Movies'
from Movie mov join Rental ren on mov.MovieID=ren.MovieID
join Customer cust on cust.CustomerID=ren.CustomerID
group by cust.CustomerName
GO

--------------------------------Revenue Per Customer SP ----------------------------------
USE [MovieRental]
GO

/****** Object:  StoredProcedure [dbo].[RevenuePerCustomer]    Script Date: 11/24/2019 12:15:57 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[RevenuePerCustomer] 
AS
Select c.CustomerName, sum(Price) AS "Revenue Generated", count(r.RentalID) as "Movies Rented" 
from Customer c join Rental r on c.CustomerID = r.CustomerID
join Movie m on r.MovieID = m.MovieID
Group by c.CustomerName

-----------------------------------------------------------------Indexes----------------------------------------------------------------------------------

CREATE INDEX CustomerName 
ON Customer(CustomerName);

CREATE INDEX GenreName 
ON Genre(GenreName);

CREATE INDEX MovieName
ON Movie(MovieName, Price);

CREATE INDEX RentalDate
ON Rental(DueDate, RentalDate);



-----------------------------------------------------------------Views----------------------------------------------------------------------------------
-----------------------------------------------------------------Views 1----------------------------------------------------------------------------------


CREATE VIEW CustomerPaymentHistory AS
Select cust.CustomerName,mov.MovieName,mov.Price,pay.Payment_Type,ren.RentalDate,ren.DueDate
from
Customer cust join Rental ren on ren.CustomerID=cust.CustomerID
join Movie mov on ren.MovieID=mov.MovieID 
join Payment pay on ren.PaymentID=pay.PaymentID

-----------------------------------------------------------------Views 2----------------------------------------------------------------------------------

CREATE VIEW MovieDetails AS

Select mv.MovieName,gen.GenreName,ac.ActorName,dir.DirectorName,mv.ReleaseDate,lo.Country,lan.Language
from 
Movie mv join Acts act on mv.MovieID=act.MovieID
join Actor ac on act.ActorID=ac.ActorID
join Location lo on mv.LocationID=lo.LocationID
join Director dir on mv.DirectorID=dir.DirectorID
join Language lan on lan.LanguageID=mv.LanguageID
join Genre gen on gen.GenreID=mv.GenreID























