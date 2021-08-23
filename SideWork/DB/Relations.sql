USE BRYTE;
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
