-------------Database creation-------------


------------Table Creation-----------------

----------------------------------------start of bids section-----------------------------------------------------
create table BID
(
BID_ID int unique not null IDENTITY,
BID_Name varchar(50) not null,
BID_Status varchar(10),
BID_Start_Date date,
BID_End_Date date,
BID_Description varchar(500),
BID_Price int not null,
BID_Thumbnail varchar(100),
BID_Total_Application int,
primary key(BID_ID)
);

create table BID_ATTACHEMENTS
(
BID_ID int ,
Link varchar(100),
Link_Description varchar(20),
Foreign KEY (BID_ID) references BID
);
