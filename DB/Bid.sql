USE BRYTE
----------------------------------------start of bids section-----------------------------------------------------
create table BID
(
    BID_ID int unique not null IDENTITY,
    BID_Name varchar(50) not null,
    BID_Status varchar(10),
    BID_Start_Date date,
    BID_End_Date date,
    BID_Description varchar(500),
    BID_Price int not null,
    BID_Thumbnail varchar(100),
    BID_Total_Applications int,
    BID_Accepted_Participation int,
    primary key(BID_ID),
    Foreign key (BID_Accepted_Participation) references PROJECT
);

create table BID_ATTACHEMENTS
(
    BID_ATT_ID int not null,
    BID_ATT_Link varchar(100) not null,
    BID_ATT_Link_Description varchar(20),
    Foreign KEY (BID_ATT_ID) references BID,
    primary key (BID_ATT_ID, BID_ATT_Link)
);

CREATE TABLE BID_CATEGORY
(
    BID_CAT_Field varchar(50) not null,
    BID_CAT_Skill varchar(50),
    CAT_BID_ID int not null,
    Primary key (BID_CAT_Field, BID_CAT_Skill, CAT_Bid_ID),
    Foreign key (CAT_BID_ID) references BID
);
