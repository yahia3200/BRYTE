USE BRYTE
-----------------------------Strat of project section---------------------------------------
create table PROJECT
(
    PRO_ID int unique not null IDENTITY,
    PRO_Name varchar(50) not null,
    PRO_Start_Date Date,
    PRO_Creation DateTime not null,
    PRO_End_Date Date,
    PRO_Description varchar(500),
    PRO_Rate float,
    check(PRO_Rate<=0 and PRO_Rate<=5),
    PRO_Thumbnail varchar(100),
    PRIMARY KEY (PRO_ID)
);

create table TIMELINE
(
    PRO_TIM_ID int not null,
    PRO_TIM_Phase_Start_Date Date not null,
    PRO_TIM_Phase_End_Date Date not null,
    PRO_TIM_Description varchar(100),
    Foreign KEY (PRO_TIM_ID) references PROJECT,
    PRIMARY KEY (PRO_TIM_ID, PRO_TIM_Phase_Start_Date, PRO_TIM_Phase_End_Date)
);

create table PRO_MULTIMEDIA
(
    PRO_MUL_ID int not null,
    PRO_MUL_Link varchar(200) not null,
    PRO_MUL_Link_Name varchar(50),
    Foreign KEY (PRO_MUL_ID) references PROJECT,
    PRIMARY KEY (PRO_MUL_ID, PRO_MUL_Link)
);