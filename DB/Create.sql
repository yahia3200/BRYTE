CREATE TABLE DEV_CATEGORY
(
    CAT_Field varchar(50) not null,
    CAT_Skill varchar(50),
    CAT_Developer_Id int not null,
    CAT_Verified BIT,
    Primary key (CAT_Field, CAT_Skill, CAT_Developer_Id),
    Foreign key (CAT_Developer_Id) references DEVELOPER
)

CREATE TABLE DEV_WORKING_EXPERINCE
(
    WOR_Title varchar(50) not null,
    WOR_Descreption varchar(100),
    WOR_Start_Date date not null,
    WOR_End_Date date not null,
    WOR_Developer_Id int not null,
    WOR_Place varchar(50),
    Primary key (WOR_Developer_Id, WOR_Title, WOR_Place)
    Foreign key (WOR_Developer_Id) references DEVELOPER
)

CREATE TABLE DEV_DEGREE
(
    DEG_Field varchar(50) not null,
    DEG_Faculty varchar(50) not null,
    DEG_Developer_Id int not null,
    DEG_Start_Date date not null,
    DEG_End_Date date not null,
    Primary key (DEG_Developer_Id, DEG_Field, DEG_Faculty),
    Foreign key (DEG_Developer_Id) references DEVELOPER
)

CREATE TABLE DEV_AWARDS
(
    AWA_Title varchar(50) not null,
    AWA_Descreption varchar(100),
    AWA_Developer_Id int not null,
    AWA_Date date,
    Primary key (AWA_Developer_Id, AWA_Title, AWA_Date)
    Foreign key (AWA_Developer_Id) references DEVELOPER
)

CREATE TABLE DEV_Links
(
    LIN_Name varchar(50) not null,
    LIN_Link varchar(50) not null,
    LIN_Developer_Id int not null,
    Primary key (LIN_Developer_Id, LIN_Name)
    Foreign key (LIN_Developer_Id) references DEVELOPER
)