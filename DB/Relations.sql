USE BRYTE

---------------------------- Expert Relations ----------------------------
CREATE TABLE EXPERT_REVIEW_PROJECT
(
    EXP_Id int not null,
    PRO_Id in not null,
    REV_Rating float not null,
    REV_Description varchar(500),
    Primary key (EXP_Id, PRO_Id),
    Foreign key (EXP_Id) references EXPERT,
    Foreign key (PRO_Id) references PROJECT
);

CREATE TABLE EXPERT_REVIEW_DEVELOPER
(
    EXP_Id int not null,
    DEV_Id int not null,
    REV_Rating float not null,
    REV_Description varchar(500),
    Primary key (EXP_Id, DEV_Id),
    Foreign key (EXP_Id) references EXPERT,
    Foreign key (DEV_Id) references DEVELOPER
);

CREATE TABLE EXPERT_JUDGE
(
    EXP_Id int not null,
    COM_Id int not null,
    JUD_Rating int not null,
    Primary key (EXP_Id, COM_Id),
    Foreign key (EXP_Id) references EXPERT,
    Foreign key (COM_Id) references COMPETITION 
);

---------------------------- Developer Relations ----------------------------
CREATE TABLE DEVELOPER_WORKS_ON
(
    DEV_Id int not null,
    PRO_Id in not null,
    Primary key (DEV_Id, PRO_Id),
    Foreign key (DEV_Id) references DEVELOPER,
    Foreign key (PRO_Id) references PROJECT
);

CREATE TABLE DEVELOPER_WORKS_IN
(
    DEV_Id int not null,
    TEA_Id int not null,
    Primary key (DEV_Id, TEA_Id),
    Foreign key (DEV_Id) references DEVELOPER,
    Foreign key (TEA_Id) references TEAM
);

CREATE TABLE DEVELOPER_RATES_CLIENT
(
    DEV_Id int not null,
    CLI_Id int not null,
    PRO_Id int not null,
    RAT_Rating float not null,
    RAT_Description varchar(500),
    Primary key (DEV_Id, CLI_Id, PRO_Id),
    Foreign key (DEV_Id) references DEVELOPER,
    Foreign key (PRO_Id) references PROJECT,
    Foreign key (CLI_Id) references CLIENT
);

CREATE TABLE DEVELOPER_PARTICIPATE
(
    DEV_Id int not null,
    COM_Id int not null,
    Primary key (DEV_Id, COM_Id),
    Foreign key (DEV_Id) references DEVELOPER,
    Foreign key (COM_Id) references COMPETITION
);

CREATE TABLE DEVELOPER_APPLAY
(
    DEV_Id int not null,
    BID_Id int not null,
    Primary key (DEV_Id, BID_Id),
    Foreign key (DEV_Id) references DEVELOPER,
    Foreign key (BID_Id) references BID
);

---------------------------- Client Relations ----------------------------
CREATE TABLE CLIENT_RATES_DEVELOPER
(
    DEV_Id int not null,
    CLI_Id int not null,
    PRO_Id int not null,
    RAT_Rating float not null,
    RAT_Description varchar(500),
    Primary key (DEV_Id, CLI_Id, PRO_Id),
    Foreign key (DEV_Id) references DEVELOPER,
    Foreign key (PRO_Id) references PROJECT,
    Foreign key (CLI_Id) references CLIENT
);

CREATE TABLE CLIENT_RATES_TEAM
(
    TEA_Id int not null,
    CLI_Id int not null,
    PRO_Id int not null,
    RAT_Rating float not null,
    RAT_Description varchar(500),
    Primary key (TEA_Id, CLI_Id, PRO_Id),
    Foreign key (TEA_Id) references TEAM,
    Foreign key (PRO_Id) references PROJECT,
    Foreign key (CLI_Id) references CLIENT
);

CREATE TABLE CREATES
(
    CLI_Id int not null,
    COM_Id int not null,
    Primary key (CLI_Id, COM_Id),
    Foreign key (CLI_Id) references CLIENT,
    Foreign key (COM_Id) references COMPETITION
);

CREATE TABLE POSTS
(
    CLI_Id int not null,
    BID_Id int not null,
    Primary key (CLI_Id, BID_Id),
    Foreign key (CLI_Id) references CLIENT,
    Foreign key (BID_Id) references BID
);