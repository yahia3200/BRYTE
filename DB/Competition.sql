USE BRYTE
----------------------------------------start of Comp section-----------------------------------------------------
create table COMPETITION
(
    COM_ID int unique not null IDENTITY,
    COM_Name varchar(50) not null,
    COM_Status varchar(10),
    COM_Start_Date date,
    COM_End_Date date,
    COM_Description varchar(500),
    COM_Thumbnail varchar(100),
    COM_Total_Submissions int,
    primary key(COM_ID)
);

create table COM_ATTACHEMENTS
(
    COM_ATT_ID int not null,
    COM_ATT_Link varchar(100) not null,
    COM_ATT_Link_Description varchar(20),
    Foreign KEY (COM_ATT_ID) references COMPETITION,
    primary key (COM_ATT_ID, COM_ATT_Link)
);