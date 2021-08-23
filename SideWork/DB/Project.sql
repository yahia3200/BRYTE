USE BRYTE;

create table PROJECT
(
    PRO_ID int unique not null auto_increment,
    PRO_Name varchar(50) not null,
    PRO_Start_Date Date,
    PRO_Creation DateTime not null,
    PRO_End_Date Date,
    PRO_Description varchar(1000),
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
