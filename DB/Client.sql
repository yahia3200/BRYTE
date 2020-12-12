-------------Database creation-------------
--create database CompanyDBLab4

use BRYTE

------------Table Creation-----------------
create table CLIENT
(
    CLI_Name varchar(50) not null, 
    CLI_User_Name varchar(50) not null unique, 
    CLI_ID int unique not null identity,
    CLI_Email varchar(50) unique not null,
    CLI_Profile_Picture varchar(500),
    CLI_Phone varchar(50),
    CLI_Creation_Date date not null,
	CLI_Founded_Date date,
    CLI_Last_Login date not null,
    CLI_Hash varchar(50) not null,
    CLI_Hash_Token varchar(50) not null,
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
    Foreign key (CAT_Client_Id) references Client
);

CREATE TABLE CLI_Links
(
    CLI_LIN_Name varchar(50) not null,
    CLI_LIN_Link varchar(50) not null,
    CLI_LIN_Client_Id int not null,
    Primary key (CLI_LIN_Client_Id, CLI_LIN_Name),
    Foreign key (CLI_LIN_Client_Id) references Client
);