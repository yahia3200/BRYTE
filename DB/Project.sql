-------------Database creation-------------


------------Table Creation-----------------
USE BRYTE
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