use master

create database BakMovie

use BakMovie

create table [User](
	userID varchar(6) NOT NULL PRIMARY KEY,
	 nickname varchar(255) NOT NULL,
	fullname char(50) NOT NULL,
	email varchar(255) NOT NULL,
	city char(20) NOT NULL,
	[description] varchar(255) NOT NULL,
	 CONSTRAINT checkuserID CHECK(userID LIKE 'USR[0-9][0-9][0-9]'),
	CONSTRAINT checknicklen CHECK(LEN(nickname)> 5),
	CONSTRAINT checkuserEmail CHECK(email LIKE '%@%'),
)

create table Director(
	directorID varchar(6) NOT NULL PRIMARY KEY,
	[name] char(50) NOT NULL,
	email varchar(255) NOT NULL,
	city char(20) NOT NULL,
	[address] varchar(255) NOT NULL,
	phone numeric(18,0) NOT NULL,
	CONSTRAINT CheckdirectorID CHECK(directorID LIKE 'DIR[0-9][0-9][0-9]'),
	CONSTRAINT CheckdirectorMail CHECK(email LIKE '%@%'),
)

create table Publisher(
	 publisherID varchar(6) NOT NULL PRIMARY KEY,
	 [name] char(50) NOT NULL,
	 email varchar(255) NOT NULL,
	 city char(20) NOT NULL,
	 [address] varchar(255) NOT NULL,
	 phone numeric(18,0) NOT NULL,
	 CONSTRAINT CheckpublisherAdd CHECK(LEN([address]) > 15),
	 CONSTRAINT CheckpublisherID CHECK(publisherID LIKE 'PUB[0-9][0-9][0-9]'),
)

create table Movie(
	 movieID varchar(6) NOT NULL PRIMARY KEY,
	 directorID varchar(6) NOT NULL FOREIGN KEY REFERENCES Director(directorID),
	 publisherID varchar(6) NOT NULL FOREIGN KEY REFERENCES Publisher(publisherID),
	 title varchar(255) NOT NULL,
	 [description] varchar(255) NOT NULL,
	 release_date DATE NOT NULL,
	 price numeric(18,0) NOT NULL,
	 CONSTRAINT Checkmoviedesc CHECK(LEN([description]) > 20),
	 CONSTRAINT CheckmovieID CHECK(movieID LIKE 'MOV[0-9][0-9][0-9]'),
	 CONSTRAINT CheckmovieDate CHECK(YEAR(release_date) BETWEEN 2000 AND 2016),
)

create table Sales_transaction(
	 sales_transactionID varchar(6) NOT NULL PRIMARY KEY,
	 userID varchar(6) NOT NULL FOREIGN KEY REFERENCES [User](userID),
	 movieID varchar(6) NOT NULL FOREIGN KEY REFERENCES Movie(movieID),
	 transaction_date DATE NOT NULL,
	 movie_title VARCHAR(255) NOT NULL,
	 quantity INT NOT NULL,
	 CONSTRAINT ChecksalesID CHECK(sales_transactionID LIKE 'SAL[0-9][0-9][0-9]'),
)

create table Genre(
	 genreID varchar(6) NOT NULL PRIMARY KEY,
	 movieID varchar(6) NOT NULL FOREIGN KEY REFERENCES Movie(movieID),
	 Name varchar(255) NOT NULL,
	 CONSTRAINT CheckgenreID CHECK(genreID LIKE 'GEN[0-9][0-9][0-9]'),
)

create table Review(
	 userID varchar(6) NOT NULL FOREIGN KEY REFERENCES [User](userID),
	 movieID varchar(6) NOT NULL FOREIGN KEY REFERENCES Movie(movieID),
	 recommendation_status char(50) NOT NULL,
	 review_content varchar(255) NOT NULL,
	 review_date DATE NOT NULL,
	 CONSTRAINT Checkreviewcontent CHECK(LEN(review_content)>20),
)
