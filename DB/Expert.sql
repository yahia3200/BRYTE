use BRYTE;

create table EXPERT
(
EXP_Fname varchar(50) not null, EXP_Lname varchar(50) not null,
EXP_User_Name varchar(50) unique not null,
EXP_ID int unique not null auto_increment,
EXP_Email varchar(50) unique not null,
EXP_Profile_Picture varchar(500),
EXP_Phone varchar(50),
EXP_Creation_Date date not null,
EXP_Birth_Date date not null,
EXP_Last_Login date not null,
EXP_Hash varchar(255) not null,
EXP_Hash_Token varchar(50) not null,
EXP_Credentials varchar(50) not null,
EXP_Wallet float not null default 0,
EXP_Address varchar(200),
EXP_Job_Title varchar(50),

/*Derived Attributes*/
EXP_Portfolio_Count int default 0 not null,
EXP_Questions_Count int default 0 not null,
EXP_Projects_Review_Count int default 0 not null,
EXP_Judge_Count int default 0 not null,
EXP_Age int not null,
primary key (EXP_ID)
);


/* Multivalued Attributes*/

CREATE TABLE EXP_CATEGORY
(
    CAT_Field varchar(50) not null,
    CAT_Skill varchar(50),
    CAT_Expert_Id int not null,
    CAT_Verified BIT,
    Primary key (CAT_Field, CAT_Skill, CAT_Expert_Id),
    Foreign key (CAT_Expert_Id) references EXPERT(EXP_ID)
);

CREATE TABLE EXP_WORKING_EXPERINCE
(
    WOR_Title varchar(50) not null,
    WOR_Descreption varchar(100),
    WOR_Start_Date date not null,
    WOR_End_Date date not null,
    WOR_Expert_Id int not null,
    WOR_Place varchar(50),
    Primary key (WOR_Expert_Id, WOR_Title, WOR_Place),
    Foreign key (WOR_Expert_Id) references EXPERT(EXP_ID)
);

CREATE TABLE EXP_DEGREE
(
    DEG_Field varchar(50) not null,
    DEG_Faculty varchar(50) not null,
    DEG_Expert_Id int not null,
    DEG_Start_Date date not null,
    DEG_End_Date date not null,
    Primary key (DEG_Expert_Id, DEG_Field, DEG_Faculty),
    Foreign key (DEG_Expert_Id) references EXPERT(EXP_ID)
);

CREATE TABLE EXP_AWARDS
(
    AWA_Title varchar(50) not null,
    AWA_Descreption varchar(100),
    AWA_Expert_Id int not null,
    AWA_Date date,
    Primary key (AWA_Expert_Id, AWA_Title, AWA_Date),
    Foreign key (AWA_Expert_Id) references EXPERT(EXP_ID)
);

CREATE TABLE EXP_Links
(
    LIN_Name varchar(50) not null,
    LIN_Link varchar(50) not null,
    LIN_Expert_Id int not null,
    Primary key (LIN_Expert_Id, LIN_Name),
    Foreign key (LIN_Expert_Id) references EXPERT(EXP_ID)
);