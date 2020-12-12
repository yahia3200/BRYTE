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
	COM_Type char not null,
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

CREATE TABLE COM_CATEGORY
(
    COM_CAT_Field varchar(50) not null,
    COM_CAT_Skill varchar(50),
    CAT_Competition_Id int not null,
    Primary key (COM_CAT_Field, COM_CAT_Skill, CAT_Competition_Id),
    Foreign key (CAT_Competition_Id) references COMPETITION
);
CREATE TABLE COM_PRIZES
(
    PRZ_Prize varchar(50) not null,
    PRZ_Rank varchar(50) not null,
    PRZ_Competition_Id int not null,
    Primary key (PRZ_Rank, PRZ_Competition_Id),
    Foreign key (PRZ_Competition_Id) references COMPETITION
);
CREATE TABLE COM_Phases
(
    PHS_Start DateTime,
    PHS_End DateTime,
    PHS_Name varchar(50) not null,
	PHS_Description varchar(100) not null,
	PHS_Competition_Id int not null,
    Primary key (PHS_Name, 	PHS_Competition_Id),
    Foreign key (PRZ_Competition_Id) references COMPETITION
);

