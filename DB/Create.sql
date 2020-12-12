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
    WOR_Start_Date date,
    WOR_End_Date date,
    WOR_Developer_Id int not null,
    WOR_Place varchar(50),
    Primary key (WOR_Developer_Id, WOR_Title, WOR_Place)
    Foreign key (WOR_Developer_Id) references DEVELOPER
)

CREATE TABLE DEV_DEGREE
(
    DEG_Field varchar(50) not null,
    DEG_Colleague varchar(50) not null,
    DEG_Developer_Id int not null,
    DEG_Start_Date date,
    DEG_End_Date date,
    Primary key (DEG_Developer_Id, DEG_Field, DEG_Colleague),
    Foreign key (DEG_Developer_Id) references DEVELOPER
)

CREATE TABLE DEV_AWARDS
(
    AWA_Title varchar(50) not null,
    AWA_Descreption varchar(100),
    AWA_Developer_Id int not null,
    Primary key (AWA_Developer_Id, AWA_Title)
    Foreign key (AWA_Developer_Id) references DEVELOPER
)

CREATE TABLE DEV_Links
(
    LIN_Name varchar(50) not null,
    LIN_Link varchar(50) not null,
    
)