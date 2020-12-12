-------------Database creation-------------
--create database CompanyDBLab4

use BRYTE

------------Table Creation-----------------
create table DEVELOPER
(
DEV_Fname varchar(50) not null, DEV_Lname varchar(50) not null,
DEV_User_Name varchar(50) not null,
DEV_ID int not null identity,
DEV_Email varchar not null,
DEV_Profile_Picture varchar(500),
DEV_Is_Pro BIT default 0,
DEV_Phone varchar(50),
DEV_Creation_Date date not null,
DEV_Birth_Date date not null,
DEV_Last_Login date not null,
DEV_Hash varchar(50) not null,
DEV_Hash_Token varchar(50) not null,
DEV_Credentials varchar(50) not null,
DEV_Wallet float not null default 0,
DEV_Address varchar(200),
DEV_Job_Title varchar(50),

/*Derived Attributes*/
DEV_Wining_Count int default 0 not null,
DEV_Participation_Count int default 0 not null,
DEV_Pick_Rate float default 0 not null,
DEV_Bids_Count int default 0 not null,
DEV_Projects_Count int default 0 not null,
DEV_Age int not null,
UNIQUE(DEV_User_Name,DEV_ID,DEV_Email),
primary key (DEV_ID)
);


/* Multivalued Attributes*/

CREATE TABLE DEV_CATEGORY
(
    CAT_Field varchar(50) not null,
    CAT_Skill varchar(50),
    CAT_Developer_Id int not null,
    CAT_Verified BIT,
    Primary key (CAT_Field, CAT_Skill, CAT_Developer_Id),
    Foreign key (CAT_Developer_Id) references DEVELOPER
);

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
);

CREATE TABLE DEV_DEGREE
(
    DEG_Field varchar(50) not null,
    DEG_Faculty varchar(50) not null,
    DEG_Developer_Id int not null,
    DEG_Start_Date date not null,
    DEG_End_Date date not null,
    Primary key (DEG_Developer_Id, DEG_Field, DEG_Faculty),
    Foreign key (DEG_Developer_Id) references DEVELOPER
);

CREATE TABLE DEV_AWARDS
(
    AWA_Title varchar(50) not null,
    AWA_Descreption varchar(100),
    AWA_Developer_Id int not null,
    AWA_Date date,
    Primary key (AWA_Developer_Id, AWA_Title, AWA_Date)
    Foreign key (AWA_Developer_Id) references DEVELOPER
);

CREATE TABLE DEV_Links
(
    LIN_Name varchar(50) not null,
    LIN_Link varchar(50) not null,
    LIN_Developer_Id int not null,
    Primary key (LIN_Developer_Id, LIN_Name)
    Foreign key (LIN_Developer_Id) references DEVELOPER
);