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
    DEV_Phone
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
	"01023071750"
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
	"01222051750"
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
    'Node.js',
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
      'EXP_Profile_Picture:varchar',
      '01118182713',
      '2020-12-10',
      '2000-05-11',
      '2020-12-10',
      'EXP_Hash:varchar',
      'https://cdna.artstation.com/p/assets/images/images/006/003/764/large/natalya-samoylova-icon-1024.jpg?1495343917',
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
      EXP_Id,
      PRO_Id,
      REV_Rating,
      REV_Description
    )
  VALUES (
      1,
      1,
      5,
      'Great'
    );