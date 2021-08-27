use BakMovie


--user input his data
select 
	* 
from
	[User] u

INSERT INTO 
	[user] 
VALUES
	('USR031','MyteamNotWork','rizky prawira','rprawira@gmail.com','Jakarta','I have to do this project alone because my team is unactive :(')

--user select his movie and the quantity 
select 
	* 
from 
	Sales_transaction st

INSERT INTO 
	Sales_transaction 
VALUES
	('SAL040','USR004','MOV035','2016-06-19','GIANT','11'),
	('SAL041','USR005','MOV034','2016-06-21','Attack on Natit 2','12'),
	('SAL042','USR022','MOV033','2015-06-22','Attack on Natit','13'),
	('SAL043','USR023','MOV035','2016-06-28','Attack on Natit','14')

--after user buy his movie they can review it
select
	*
from
	Review r

INSERT INTO 
	Review 
VALUES
	('USR004','MOV035','Recommended','Film ini sangat luar biasa bagus, saya sangat menikmati film ini.','2016-07-01'),
	('USR005','MOV034','Recommended','Film ini sangat luar biasa bagus, saya sangat menikmati film ini.','2016-07-10'),
	('USR022','MOV033','Recommended','Film ini sangat luar biasa bagus, saya sangat menikmati film ini.','2016-07-09'),
	('USR023','MOV035','Recommended','Film ini sangat luar biasa bagus, saya sangat menikmati film ini.','2016-07-02')


create view USERRECAP AS
select 
	st.userID,st.movieID,st.sales_transactionID,st.movie_title,st.transaction_date,st.quantity,
	r.recommendation_status,r.review_content
from 
	Sales_transaction st JOIN Movie m ON st.movieID = m.movieID 
	JOIN Review r ON m.movieID = r.movieID


--tryme--
select * from USERRECAP































--sedih kerja sendiri :(
--2301924851