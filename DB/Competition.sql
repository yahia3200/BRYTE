-------------Database creation-------------
USE BRYTE

------------Table Creation-----------------
----------------------------------------start of Comp section-----------------------------------------------------
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