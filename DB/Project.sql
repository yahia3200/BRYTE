-------------Database creation-------------


------------Table Creation-----------------
create table Employee
(
Fname varchar(50) not null,
Minit char(1) not null,
Lname varchar(50) not null,
SSN int,
primary key (SSN),
Bdate date,
Address varchar(50),
Sex char(1),
Salary int,
Super_SSN int,
Dno int,
Foreign key (Super_SSN) references Employee,
)
-----------------------------Strat of project section---------------------------------------
create table PROJECT
(
PRO_ID int unique not null IDENTITY,
PRO_Name varchar(50) not null,
PRO_Start_Date Date,
PRO_Creation DateTime not null,
PRO_End_Date Date,
PRO_Description varchar(500),
PRO_Rate float,
check(PRO_Rate<=0 and PRO_Rate<=5),
PRO_Thumbnail varchar(100),
PRIMARY KEY (PRO_ID)
);

create table Timeline
(
PRO_ID int,
Phase_Start_Date Date,
Phase_End_Date Date,
TIM_Description varchar(100),
Foreign KEY (PRO_ID) references PROJECT
);

create table PRO_MULTIMEDIA
(
PRO_ID int,
Link varchar(100),
Link_Description varchar(20),
Foreign KEY (PRO_ID) references PROJECT
);
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

----------------------------------------start of bids section-----------------------------------------------------
create table COMPETITION
(
COMPETITION_ID int unique not null IDENTITY,
COMPETITION_Name varchar(50) not null,
COMPETITION_Status varchar(10),
COMPETITION_Start_Date date,
COMPETITION_End_Date date,
COMPETITION_Description varchar(500),
COMPETITION_Thumbnail varchar(100),
COMPETITION_Total_Participation int,
primary key(COMPETITION_ID)
);

create table COMPETITION_ATTACHEMENTS
(
COMPETITION_ID int ,
Link varchar(100),
Link_Description varchar(20),
Foreign KEY (COMPETITION_ID) references COMPETITION
);