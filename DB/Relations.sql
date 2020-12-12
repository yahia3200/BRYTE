USE BRYTE

CREATE TABLE DEVELOPER_WORKS_ON
(
    DEV_Id int not null,
    PRO_Id in not null,
    Primary key (DEV_Id, PRO_Id),
    Foreign key (DEV_Id) references DEVELOPER,
    Foreign key (PRO_Id) references PROJECT
);

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