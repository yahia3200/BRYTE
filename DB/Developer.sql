
use BRYTE;

create table DEVELOPER
(
    DEV_Fname varchar(50) not null, DEV_Lname varchar(50) not null,
    DEV_User_Name varchar(50) not null unique,
    DEV_ID int unique not null auto_increment,
    DEV_Email varchar(50) unique not null,
    DEV_Profile_Picture varchar(500),
    DEV_Is_Pro BIT default 0,
    DEV_Phone varchar(50),
    DEV_Creation_Date date not null,
    DEV_Birth_Date date not null,
    DEV_Last_Login date not null,
    DEV_Hash varchar(255) not null,
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
    primary key (DEV_ID)
);


/* Multivalued Attributes*/

CREATE TABLE DEV_CATEGORY
(
    DEV_CAT_Field varchar(50) not null,
    DEV_CAT_Skill varchar(50),
    CAT_Developer_Id int not null,
    DEV_CAT_Verified BIT,
    Primary key (DEV_CAT_Field, DEV_CAT_Skill, CAT_Developer_Id),
    Foreign key (CAT_Developer_Id) references DEVELOPER(DEV_ID)
);

CREATE TABLE DEV_WORKING_EXPERINCE
(
    DEV_WOR_Title varchar(50) not null,
    DEV_WOR_Descreption varchar(100),
    DEV_WOR_Start_Date date not null,
    DEV_WOR_End_Date date not null,
    DEV_WOR_Developer_Id int not null,
    DEV_WOR_Place varchar(50),
    Primary key (DEV_WOR_Developer_Id, DEV_WOR_Title, DEV_WOR_Place),
    Foreign key (DEV_WOR_Developer_Id) references DEVELOPER(DEV_ID)
);

CREATE TABLE DEV_DEGREE
(
    DEV_DEG_Field varchar(50) not null,
    DEV_DEG_Faculty varchar(50) not null,
    DEV_DEG_Developer_Id int not null,
    DEV_DEG_Start_Date date not null,
    DEV_DEG_End_Date date,
    DEV_DEG_Title varchar(50) not null, 
    Primary key (DEV_DEG_Developer_Id, DEV_DEG_Field, DEV_DEG_Faculty),
    Foreign key (DEV_DEG_Developer_Id) references DEVELOPER(DEV_ID)
);

CREATE TABLE DEV_AWARDS
(
    DEV_AWA_Title varchar(50) not null,
    DEV_AWA_Descreption varchar(100),
    DEV_AWA_Developer_Id int not null,
    DEV_AWA_Date date,
    Primary key (DEV_AWA_Developer_Id, DEV_AWA_Title, DEV_AWA_Date),
    Foreign key (DEV_AWA_Developer_Id) references DEVELOPER(DEV_ID)
);

CREATE TABLE DEV_Links
(
    DEV_LIN_Name varchar(50) not null,
    DEV_LIN_Link varchar(50) not null,
    DEV_LIN_Developer_Id int not null,
    Primary key (DEV_LIN_Developer_Id, DEV_LIN_Name),
    Foreign key (DEV_LIN_Developer_Id) references DEVELOPER(DEV_ID)
);