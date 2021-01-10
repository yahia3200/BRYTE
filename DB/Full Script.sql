CREATE SCHEMA BRYTE;


use BRYTE;

create table DEVELOPER
(
    DEV_Fname varchar(50) not null, DEV_Lname varchar(50) not null,
    DEV_User_Name varchar(50) not null unique,
    DEV_ID int unique not null auto_increment,
    DEV_Email varchar(50) unique not null,
    DEV_Profile_Picture varchar(500),
    DEV_Cover varchar(500),
    DEV_Is_Pro BIT default 0,
    DEV_Phone varchar(50),
    DEV_Creation_Date date not null,
    DEV_Birth_Date date not null,
    DEV_Last_Login date not null,
    DEV_Hash varchar(255) not null,
    DEV_Credentials varchar(50) not null,
    DEV_Wallet float not null default 0,
    DEV_Address varchar(200),
    DEV_Job_Title varchar(50),
    DEV_About varchar(5000),

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
    DEV_DEG_University varchar(50) not null,
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
    DEV_LIN_Link varchar(500) not null,
    DEV_LIN_Developer_Id int not null,
    Primary key (DEV_LIN_Developer_Id, DEV_LIN_Name),
    Foreign key (DEV_LIN_Developer_Id) references DEVELOPER(DEV_ID)
);

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
    LIN_Link varchar(500) not null,
    LIN_Expert_Id int not null,
    Primary key (LIN_Expert_Id, LIN_Name),
    Foreign key (LIN_Expert_Id) references EXPERT(EXP_ID)
);

create table PROJECT
(
    PRO_ID int unique not null auto_increment,
    PRO_Name varchar(50) not null,
    PRO_Start_Date Date,
    PRO_Creation DateTime not null,
    PRO_End_Date Date,
    PRO_Description varchar(5000),
    PRO_Rate float,
    check(PRO_Rate >0 and PRO_Rate <=5),
    PRO_Thumbnail varchar(500),
    PRIMARY KEY (PRO_ID)
);

/* Multivalued Attributes*/

create table TIMELINE
(
    PRO_TIM_ID int not null,
    PRO_TIM_Phase_Start_Date Date not null,
    PRO_TIM_Phase_End_Date Date not null,
    PRO_TIM_Title varchar(30),
    PRO_TIM_Description varchar(100),
    Foreign KEY (PRO_TIM_ID) references PROJECT(PRO_ID),
    PRIMARY KEY (PRO_TIM_ID, PRO_TIM_Phase_Start_Date, PRO_TIM_Phase_End_Date)
);

create table PRO_MULTIMEDIA
(
    PRO_MUL_ID int not null,
    PRO_MUL_Link varchar(500) not null,
    PRO_MUL_Link_Name varchar(50),
    Foreign KEY (PRO_MUL_ID) references PROJECT(PRO_ID),
    PRIMARY KEY (PRO_MUL_ID, PRO_MUL_Link)
);



CREATE TABLE PRO_CATEGORY
(
    PRO_CAT_Field varchar(50) not null,
    PRO_CAT_Skill varchar(50),
    CAT_PRO_Id int not null,
    Primary key (PRO_CAT_Field, PRO_CAT_Skill, CAT_PRO_Id),
    Foreign key (CAT_PRO_Id) references PROJECT(PRO_ID)
);

create table TEAM
(
    TEA_Name varchar(50) not null,
    TEA_ID int unique not null auto_increment,
    TEA_Email varchar(50) unique not null,
    TEA_Profile_Picture varchar(500),
    TEA_Creation_Date date not null,
    TEA_Credentials varchar(50) not null,
    TEA_Wallet float not null default 0,

    /*Derived Attributes*/
    TEA_Wining_Count int default 0 not null,
    TEA_Participation_Count int default 0 not null,
    TEA_Pick_Rate float default 0 not null,
    TEA_Bids_Count int default 0 not null,
    TEA_Projects_Count int default 0 not null,
    primary key (TEA_ID)
);


/* Multivalued Attributes*/

CREATE TABLE TEA_CATEGORY
(
    TEA_CAT_Field varchar(50) not null,
    TEA_CAT_Skill varchar(50),
    CAT_TEA_Id int not null,
    TEA_CAT_Verified BIT,
    Primary key (TEA_CAT_Field, TEA_CAT_Skill, CAT_TEA_Id),
    Foreign key (CAT_TEA_Id) references TEAM(TEA_ID)
);

CREATE TABLE TEA_AWARDS
(
    TEA_AWA_Title varchar(50) not null,
    TEA_AWA_Descreption varchar(100),
    TEA_AWA_TEA_Id int not null,
    TEA_AWA_Date date,
    Primary key (TEA_AWA_TEA_Id, TEA_AWA_Title, TEA_AWA_Date),
    Foreign key (TEA_AWA_TEA_Id) references TEAM(TEA_ID)
);

CREATE TABLE TEA_Links
(
    TEA_LIN_Name varchar(50) not null,
    TEA_LIN_Link varchar(500) not null,
    TEA_LIN_TEA_Id int not null,
    Primary key (TEA_LIN_TEA_Id, TEA_LIN_Name),
    Foreign key (TEA_LIN_TEA_Id) references TEAM(TEA_ID)
);

create table BID
(
    BID_ID int unique not null auto_increment,
    BID_Name varchar(50) not null,
    BID_Status varchar(10),
    BID_Start_Date date,
    BID_End_Date date,
    BID_Description varchar(500),
    BID_Price int not null,
    BID_Thumbnail varchar(500),
    BID_Total_Applications int,
    BID_Accepted_Participation int,
    primary key(BID_ID),
    Foreign key (BID_Accepted_Participation) references PROJECT(PRO_ID)
);

/*Multivalued Attributes*/

create table BID_ATTACHEMENTS
(
    BID_ATT_ID int not null,
    BID_ATT_Link varchar(100) not null,
    BID_ATT_Link_Description varchar(20),
    Foreign KEY (BID_ATT_ID) references BID(BID_ID),
    primary key (BID_ATT_ID, BID_ATT_Link)
);

CREATE TABLE BID_CATEGORY
(
    BID_CAT_Field varchar(50) not null,
    BID_CAT_Skill varchar(50),
    CAT_BID_ID int not null,
    Primary key (BID_CAT_Field, BID_CAT_Skill, CAT_Bid_ID),
    Foreign key (CAT_BID_ID) references BID(BID_ID)
);

create table CLIENT
(
    CLI_Name varchar(50) not null, 
    CLI_User_Name varchar(50) not null unique, 
    CLI_ID int unique not null auto_increment,
    CLI_Email varchar(50) unique not null,
    CLI_Profile_Picture varchar(500),
    CLI_Phone varchar(50),
    CLI_Creation_Date date not null,
	CLI_Founded_Date date,
    CLI_Last_Login date not null,
    CLI_Hash varchar(255) not null,
    CLI_Credentials varchar(50) not null,
    CLI_Wallet float not null default 0,
	CLI_Location varchar(50),

    /*Derived Attributes*/
    CLI_AVG_Participation float default 0 not null,
    CLI_Competitions_Count int default 0 not null,
	CLI_Bids_Count int default 0 not null,
    CLI_AVG_Application float default 0 not null,
    primary key (CLI_ID)
);

/* Multivalued Attributes*/

CREATE TABLE CLI_Field
(
    CLI_CAT_Field varchar(50) not null,
    CAT_Client_Id int not null,
    Primary key (CLI_CAT_Field, CAT_Client_Id),
    Foreign key (CAT_Client_Id) references Client(CLI_ID)
);

CREATE TABLE CLI_Links
(
    CLI_LIN_Name varchar(50) not null,
    CLI_LIN_Link varchar(500) not null,
    CLI_LIN_Client_Id int not null,
    Primary key (CLI_LIN_Client_Id, CLI_LIN_Name),
    Foreign key (CLI_LIN_Client_Id) references Client(CLI_ID)
);

create table COMPETITION
(
    COM_ID int unique not null auto_increment,
    COM_Name varchar(50) not null,
    COM_Status varchar(10),
    COM_Start_Date date,
    COM_End_Date date,
    COM_Description varchar(500),
    COM_Thumbnail varchar(500),
    COM_Total_Submissions int,
	COM_Type char not null,
    primary key(COM_ID)
);


/*Multivalued Attributes*/

create table COM_ATTACHEMENTS
(
    COM_ATT_ID int not null,
    COM_ATT_Link varchar(500) not null,
    COM_ATT_Link_Description varchar(20),
    Foreign KEY (COM_ATT_ID) references COMPETITION(COM_ID),
    primary key (COM_ATT_ID, COM_ATT_Link)
);

CREATE TABLE COM_CATEGORY
(
    COM_CAT_Field varchar(50) not null,
    COM_CAT_Skill varchar(50),
    CAT_Competition_Id int not null,
    Primary key (COM_CAT_Field, COM_CAT_Skill, CAT_Competition_Id),
    Foreign key (CAT_Competition_Id) references COMPETITION(COM_ID)
);

CREATE TABLE COM_PRIZES
(
    PRZ_Prize varchar(50) not null,
    PRZ_Rank varchar(50) not null,
    PRZ_Competition_Id int not null,
    Primary key (PRZ_Rank, PRZ_Competition_Id),
    Foreign key (PRZ_Competition_Id) references COMPETITION(COM_ID)
);

CREATE TABLE COM_Phases
(
    PHS_Start DateTime,
    PHS_End DateTime,
    PHS_Name varchar(50) not null,
	PHS_Description varchar(100) not null,
	PHS_Competition_Id int not null,
    Primary key (PHS_Name, 	PHS_Competition_Id),
    Foreign key (PHS_Competition_Id) references COMPETITION(COM_ID)
);

/*---------------------------- Expert Relations ----------------------------*/
CREATE TABLE EXPERT_REVIEW_PROJECT
(
    EXP_Id int not null,
    PRO_Id int not null,
    REV_Rating float not null,
    REV_Title varchar(50) not null,
    REV_Description varchar(500) not null,
	REV_Date date not null,
	check(REV_Rating >0 and REV_Rating <=5),
    Primary key (EXP_Id, PRO_Id),
    Foreign key (EXP_Id) references EXPERT(EXP_ID),
    Foreign key (PRO_Id) references PROJECT(PRO_ID)
);

CREATE TABLE EXPERT_REVIEW_DEVELOPER
(
    EXP_Id int not null,
    DEV_Id int not null,
    REV_Rating float not null,
    REV_Description varchar(500),
    check(REV_Rating >0 and REV_Rating <=5),
    Primary key (EXP_Id, DEV_Id),
    Foreign key (EXP_Id) references EXPERT(EXP_ID),
    Foreign key (DEV_Id) references DEVELOPER(DEV_ID)
);

CREATE TABLE EXPERT_JUDGE
(
    EXP_Id int not null,
    COM_Id int not null,
    JUD_Rating int not null,  
    check(JUD_Rating >0 and JUD_Rating <=5),
    Primary key (EXP_Id, COM_Id),
    Foreign key (EXP_Id) references EXPERT(EXP_ID),
    Foreign key (COM_Id) references COMPETITION(COM_ID) 
);

/*---------------------------- Developer Relations ----------------------------*/
CREATE TABLE DEVELOPER_WORKS_ON
(
    DEV_Id int not null,
    PRO_Id int not null,
    Dev_Role varchar(50),
    Primary key (DEV_Id, PRO_Id),
    Foreign key (DEV_Id) references DEVELOPER(DEV_ID),
    Foreign key (PRO_Id) references PROJECT(PRO_ID)
);

CREATE TABLE DEVELOPER_WORKS_IN
(
    DEV_Id int not null,
    TEA_Id int not null,
    Primary key (DEV_Id, TEA_Id),
    Foreign key (DEV_Id) references DEVELOPER(DEV_ID),
    Foreign key (TEA_Id) references TEAM(TEA_ID)
);

CREATE TABLE DEVELOPER_RATES_CLIENT
(
    DEV_Id int not null,
    CLI_Id int not null,
    PRO_Id int not null,
    RAT_Rating float not null,
    RAT_Description varchar(500),
    check(RAT_Rating >0 and RAT_Rating <=5),
    Primary key (DEV_Id, CLI_Id, PRO_Id),
    Foreign key (DEV_Id) references DEVELOPER(DEV_ID),
    Foreign key (PRO_Id) references PROJECT(PRO_ID),
    Foreign key (CLI_Id) references CLIENT(CLI_ID)
);

CREATE TABLE DEVELOPER_PARTICIPATE
(
    DEV_Id int not null,
    COM_Id int not null,
    Primary key (DEV_Id, COM_Id),
    Foreign key (DEV_Id) references DEVELOPER(DEV_Id),
    Foreign key (COM_Id) references COMPETITION(COM_Id)
);

CREATE TABLE DEVELOPER_APPLY
(
    DEV_Id int not null,
    BID_Id int not null,
    Primary key (DEV_Id, BID_Id),
    Foreign key (DEV_Id) references DEVELOPER(DEV_Id),
    Foreign key (BID_Id) references BID(BID_Id)
);

/*---------------------------- Client Relations ----------------------------*/
CREATE TABLE CLIENT_RATES_DEVELOPER
(
    DEV_Id int not null,
    CLI_Id int not null,
    PRO_Id int not null,
    RAT_Rating float not null,
    RAT_Description varchar(500),
	check(RAT_Rating >0 and RAT_Rating <=5),
	Primary key (DEV_Id, CLI_Id, PRO_Id),
    Foreign key (DEV_Id) references DEVELOPER(DEV_Id),
    Foreign key (PRO_Id) references PROJECT(PRO_Id),
    Foreign key (CLI_Id) references CLIENT(CLI_Id)
);

CREATE TABLE CLIENT_RATES_TEAM
(
    TEA_Id int not null,
    CLI_Id int not null,
    PRO_Id int not null,
    RAT_Rating float not null,
    RAT_Description varchar(500),    
    check(RAT_Rating >0 and RAT_Rating <=5),
    Primary key (TEA_Id, CLI_Id, PRO_Id),
    Foreign key (TEA_Id) references TEAM(TEA_Id),
    Foreign key (PRO_Id) references PROJECT(PRO_Id),
    Foreign key (CLI_Id) references CLIENT(CLI_Id)
);

CREATE TABLE CREATES
(
    CLI_Id int not null,
    COM_Id int not null,
    Primary key (CLI_Id, COM_Id),
    Foreign key (CLI_Id) references CLIENT(CLI_Id),
    Foreign key (COM_Id) references COMPETITION(COM_Id)
);

CREATE TABLE POSTS
(
    CLI_Id int not null,
    BID_Id int not null,
    Primary key (CLI_Id, BID_Id),
    Foreign key (CLI_Id) references CLIENT(CLI_Id),
    Foreign key (BID_Id) references BID(BID_Id)
);

/*---------------------------- Team Relations ----------------------------*/
CREATE TABLE TEAM_WORKS_ON
(
    TEA_Id int not null,
    PRO_Id int not null,
    TEA_Role varchar(50),
    Primary key (TEA_Id, PRO_Id),
    Foreign key (TEA_Id) references TEAM(TEA_Id),
    Foreign key (PRO_Id) references PROJECT(PRO_Id)
);

CREATE TABLE TEAM_RATES_CLIENT
(
    TEA_Id int not null,
    CLI_Id int not null,
    PRO_Id int not null,
    RAT_Rating float not null,
    RAT_Description varchar(500),    
    check(RAT_Rating >0 and RAT_Rating <=5),
    Primary key (TEA_Id, CLI_Id, PRO_Id),
    Foreign key (TEA_Id) references TEAM(TEA_Id),
    Foreign key (PRO_Id) references PROJECT(PRO_Id),
    Foreign key (CLI_Id) references CLIENT(CLI_Id)
);

CREATE TABLE TEAM_PARTICIPATE
(
    TEA_Id int not null,
    COM_Id int not null,
    Primary key (TEA_Id, COM_Id),
    Foreign key (TEA_Id) references TEAM(TEA_Id),
    Foreign key (COM_Id) references COMPETITION(COM_Id)
);

CREATE TABLE TEAM_APPLY
(
    TEA_Id int not null,
    BID_Id int not null,
    Primary key (TEA_Id, BID_Id),
    Foreign key (TEA_Id) references TEAM(TEA_Id),
    Foreign key (BID_Id) references BID(BID_Id)
);

/*---------------------------- Project Relations ----------------------------*/
CREATE TABLE SUBMISSION
(
    COM_Id int not null,
    PRO_Id int not null,
    SUB_Rating float not null,
    Primary key (COM_Id, PRO_Id),
    Foreign key (COM_Id) references COMPETITION(COM_Id),
    Foreign key (PRO_Id) references PROJECT(PRO_Id)
);

USE BRYTE;

/* Insert Developers*/
INSERT INTO developer (
    DEV_Fname,
    DEV_Lname,
    DEV_User_Name,
    DEV_Email,
    DEV_Creation_Date,
    DEV_Birth_Date,
    DEV_Last_Login,
    DEV_Hash,
    DEV_Credentials,
    DEV_Wallet,
    DEV_Wining_Count,
    DEV_Participation_Count,
	DEV_Pick_Rate,
	DEV_Bids_Count,
    DEV_Projects_Count,
    DEV_Age,
    DEV_Address,
    DEV_Job_Title,
    DEV_Phone,
    DEV_Profile_Picture,
    DEV_About,
    DEV_Cover
     )
    VALUES (
    "Yahia",
    "Zakaria",
    "yahia3200",
    "yahia@gmail.com",
    "2020-02-02",
    "2000-03-07",
    "2020-02-02",
    '$2b$10$2FM5RH0M5KiCgjx5pO3CYu.v1JR.AN8UupehuUX7l.SiyRlibb32i',
    "Trial",
    0,
    0,
    0,
    0,
    0,
    0,
    20,
    "Haram Street",
    "Computer Engineer",
	"01023071750",
    "https://i.pinimg.com/originals/0b/65/e9/0b65e97d2a0f95782bc06642236cb2d2.png",
    "Stephen William Hawking CH CBE FRS FRSA (8 January 1942 – 14 March 2018) was an English theoretical physicist, cosmologist, and author who was director of research at the Centre for Theoretical Cosmology at the University of Cambridge at the time of his death.[18][19][8] He was the Lucasian Professor of Mathematics at the University of Cambridge between 1979 and 2009.

Hawking was born in Oxford into a family of doctors. Hawking began his university education at University College, Oxford in October 1959 at the age of 17, where he received a first-class BA (Hons.) degree in physics. He began his graduate work at Trinity Hall, Cambridge in October 1962, where he obtained his PhD degree in applied mathematics and theoretical physics, specialising in general relativity and cosmology in March 1966. During this period—in 1963—Hawking was diagnosed with an early-onset slow-progressing form of motor neurone disease (also known as amyotrophic lateral sclerosis (ALS) or Lou Gehrig's disease) that gradually paralysed him over the decades.[20][21] After the loss of his speech, he was able to communicate through a speech-generating device—initially through use of a handheld switch, and eventually by using a single cheek muscle.

",
    "https://cdn6.aptoide.com/imgs/e/5/6/e569aa780874adf71b4c1f913babf231_screen.png?h=500"
    );

INSERT INTO developer (
    DEV_Fname,
    DEV_Lname,
    DEV_User_Name,
    DEV_Email,
    DEV_Creation_Date,
    DEV_Birth_Date,
    DEV_Last_Login,
    DEV_Hash,
    DEV_Credentials,
    DEV_Wallet,
    DEV_Wining_Count,
    DEV_Participation_Count,
	DEV_Pick_Rate,
	DEV_Bids_Count,
    DEV_Projects_Count,
    DEV_Age,
    DEV_Address,
    DEV_Job_Title,
    DEV_Phone,
    DEV_Profile_Picture
     )
    VALUES (
    "Hossam",
    "Saeed",
    "Hossam3200",
    "Hosam@gmail.com",
    "2020-03-04",
    "2001-04-04",
    "2020-03-04",
    '$2b$10$2FM5RH0M5KiCgjx5pO3CYu.v1JR.AN8UupehuUX7l.SiyRlibb32i',
    "Trial",
    0,
    0,
    0,
    0,
    0,
    0,
    19,
    "Fisal Street",
    "Computer Graphics Engineer",
	"01222051750",
    "https://i.pinimg.com/originals/0b/65/e9/0b65e97d2a0f95782bc06642236cb2d2.png"
    );

INSERT INTO developer (
    DEV_Fname,
    DEV_Lname,
    DEV_User_Name,
    DEV_Email,
    DEV_Creation_Date,
    DEV_Birth_Date,
    DEV_Last_Login,
    DEV_Hash,
    DEV_Credentials,
    DEV_Wallet,
    DEV_Wining_Count,
    DEV_Participation_Count,
	DEV_Pick_Rate,
	DEV_Bids_Count,
    DEV_Projects_Count,
    DEV_Age,
    DEV_Address,
    DEV_Job_Title,
    DEV_Phone
     )
    VALUES (
    "Ossama",
    "Magdy",
    "Ossama3200",
    "Ossama@gmail.com",
    "2021-01-01",
    "2000-02-01",
    "2021-01-01",
    '$2b$10$2FM5RH0M5KiCgjx5pO3CYu.v1JR.AN8UupehuUX7l.SiyRlibb32i',
    "Trial",
    0,
    0,
    0,
    0,
    0,
    0,
    20,
    "Fisal Street",
    "Softwear Engineer",
	"01021021750"
    );

INSERT INTO developer (
    DEV_Fname,
    DEV_Lname,
    DEV_User_Name,
    DEV_Email,
    DEV_Creation_Date,
    DEV_Birth_Date,
    DEV_Last_Login,
    DEV_Hash,
    DEV_Credentials,
    DEV_Wallet,
    DEV_Wining_Count,
    DEV_Participation_Count,
	DEV_Pick_Rate,
	DEV_Bids_Count,
    DEV_Projects_Count,
    DEV_Age,
    DEV_Address,
    DEV_Job_Title,
    DEV_Phone
     )
    VALUES (
    "Ziad",
    "Youssef",
    "Ziad3200",
    "Ziad@gmail.com",
    "2020-05-01",
    "2000-02-01",
    "2021-01-01",
    '$2b$10$2FM5RH0M5KiCgjx5pO3CYu.v1JR.AN8UupehuUX7l.SiyRlibb32i',
    "Trial",
    0,
    0,
    0,
    0,
    0,
    0,
    20,
    "ABBAS Street",
    "Front-End Developer",
	"01021021750"
    );
/* Insert Projects */
INSERT INTO project (
    PRO_Name,
    PRO_Start_Date,
    PRO_Creation,
    PRO_End_Date,
    PRO_Description,
    PRO_Rate,
    PRO_Thumbnail
  )
    VALUES (
    'C.A.T.S',
    '2020-12-26',
    '2020-12-26',
    '2020-12-26',
    'A GREAT Game with great name',
    5,
    'https://i.pinimg.com/originals/40/ec/65/40ec6543854e8ce641728ee285f723ea.jpg'
  );

INSERT INTO pro_category (
    PRO_CAT_Field,
    PRO_CAT_Skill,
    CAT_PRO_Id
  )
    VALUES (
    'Front-end Development',
    'Vue',
    1
  );

INSERT INTO pro_category (
    PRO_CAT_Field,
    PRO_CAT_Skill,
    CAT_PRO_Id
  )
    VALUES (
    'Game Development',
    'Nodejs',
    1
  );

  INSERT INTO pro_multimedia (
    PRO_MUL_ID,
    PRO_MUL_Link,
    PRO_MUL_Link_Name
  )
    VALUES (
    1,
    'https://i.pinimg.com/originals/72/0f/fb/720ffb5a7c72bc2d3a2203f5f4f34de1.jpg',
    'Photo0'
  );

  INSERT INTO pro_multimedia (
    PRO_MUL_ID,
    PRO_MUL_Link,
    PRO_MUL_Link_Name
  )
VALUES (
    1,
    'https://www.catsthegame.com/assets/og-ba95d791dacf713de66d6d4c955a76b05141352b4d3a7ceda252cb23197d1805.png',
    'Photo1'
  );

  INSERT INTO developer_works_on (DEV_Id, PRO_Id, Dev_Role) VALUES ( 1, 1, 'Front End');

   INSERT INTO timeline (
      PRO_TIM_ID,
      PRO_TIM_Phase_Start_Date,
      PRO_TIM_Phase_End_Date,
      PRO_TIM_Title,
      PRO_TIM_Description
    )
  VALUES (
      1,
      '2020-12-10',
      '2021-1-10',
      'Good Work',
      'It is not a much but it is honest work'
    );

     INSERT INTO timeline (
      PRO_TIM_ID,
      PRO_TIM_Phase_Start_Date,
      PRO_TIM_Phase_End_Date,
      PRO_TIM_Title,
      PRO_TIM_Description
    )
  VALUES (
      1,
      '2021-11-10',
      '2020-2-10',
      'Good Work',
      'It is not a much but it is honest work'
    );

     INSERT INTO timeline (
      PRO_TIM_ID,
      PRO_TIM_Phase_Start_Date,
      PRO_TIM_Phase_End_Date,
      PRO_TIM_Title,
      PRO_TIM_Description
    )
  VALUES (
      1,
      '2026-12-10',
      '2021-6-10',
      'Good Work',
      'It is not a much but it is honest work'
    );

    INSERT INTO expert (
      EXP_Fname,
      EXP_Lname,
      EXP_User_Name,
      EXP_Email,
      EXP_Profile_Picture,
      EXP_Phone,
      EXP_Creation_Date,
      EXP_Birth_Date,
      EXP_Last_Login,
      EXP_Hash,
      EXP_Credentials,
      EXP_Wallet,
      EXP_Address,
      EXP_Job_Title,
      EXP_Portfolio_Count,
      EXP_Questions_Count,
      EXP_Projects_Review_Count,
      EXP_Judge_Count,
      EXP_Age
    )
  VALUES (
      'Hossam',
      'Saaed',
      'Hossam_saeed',
      'Hossam_saeed@gmail.com',
      'https://cdna.artstation.com/p/assets/images/images/006/003/764/large/natalya-samoylova-icon-1024.jpg?1495343917',
      '01118182713',
      '2020-12-10',
      '2000-05-11',
      '2020-12-10',
      'EXP_Hash:varchar',
      'Trial',
       0,
      'Giza',
      'DEV',
      0,
      0,
      1,
      0,
      20
    );

INSERT INTO expert_review_project (
	  REV_Title,
      EXP_Id,
      PRO_Id,
      REV_Rating,
      REV_Description,
      REV_Date
    )
  VALUES (
      "Gamed", 
      1,
      1,
      5,
      'Great',
      '2020-2-2'
    );

Insert into dev_links values ("facebook", "facebook.com", 1);
Insert into dev_links values ("youtube", "youtube.com", 1); 

insert into dev_degree values ("Computer Science","Engineering", "Cairo", 1, "2020-2-2", "2020-2-2", "BCS");

insert dev_category values ("Back-End Development", "Nodejs", 1, true);

/*insert into dev_working_experince values ("Frond-End Developer", "Gammmmmmmmmmmmed", "2020-02-02", "2020-02-02", 1, "Google");*/