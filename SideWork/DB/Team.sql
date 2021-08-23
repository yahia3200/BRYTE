
use BRYTE;

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