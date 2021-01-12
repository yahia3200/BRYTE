CREATE DATABASE  IF NOT EXISTS `bryte` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bryte`;
-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: bryte
-- ------------------------------------------------------
-- Server version	8.0.22

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bid`
--

DROP TABLE IF EXISTS `bid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bid` (
  `BID_ID` int NOT NULL AUTO_INCREMENT,
  `BID_Name` varchar(50) NOT NULL,
  `BID_Status` varchar(10) DEFAULT NULL,
  `BID_Start_Date` date DEFAULT NULL,
  `BID_End_Date` date DEFAULT NULL,
  `BID_Description` varchar(10000) DEFAULT NULL,
  `BID_Price` int NOT NULL,
  `BID_Thumbnail` varchar(500) DEFAULT NULL,
  `BID_Total_Applications` int DEFAULT NULL,
  `BID_Accepted_Participation` int DEFAULT NULL,
  PRIMARY KEY (`BID_ID`),
  UNIQUE KEY `BID_ID` (`BID_ID`),
  KEY `BID_Accepted_Participation` (`BID_Accepted_Participation`),
  CONSTRAINT `bid_ibfk_1` FOREIGN KEY (`BID_Accepted_Participation`) REFERENCES `project` (`PRO_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bid`
--

LOCK TABLES `bid` WRITE;
/*!40000 ALTER TABLE `bid` DISABLE KEYS */;
INSERT INTO `bid` VALUES (1,'C.A.T.S Game Development','Closed','2020-05-11','2020-05-12','',250000,'https://img.poki.com/cdn-cgi/image/quality=78,width=314,height=314,fit=cover,g=0.5x0.5,f=auto/57bfa9231a7e71b4545b7b5b5e987287.png',NULL,NULL);
/*!40000 ALTER TABLE `bid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bid_attachements`
--

DROP TABLE IF EXISTS `bid_attachements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bid_attachements` (
  `BID_ATT_ID` int NOT NULL,
  `BID_ATT_Link` varchar(500) NOT NULL,
  `BID_ATT_Link_Description` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`BID_ATT_ID`,`BID_ATT_Link`),
  CONSTRAINT `bid_attachements_ibfk_1` FOREIGN KEY (`BID_ATT_ID`) REFERENCES `bid` (`BID_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bid_attachements`
--

LOCK TABLES `bid_attachements` WRITE;
/*!40000 ALTER TABLE `bid_attachements` DISABLE KEYS */;
INSERT INTO `bid_attachements` VALUES (1,'https://i.pinimg.com/originals/1a/85/97/1a85971dab4eab407657af253279ec56.png','image'),(1,'https://www.catsthegame.com/assets/og-ba95d791dacf713de66d6d4c955a76b05141352b4d3a7ceda252cb23197d1805.png','image');
/*!40000 ALTER TABLE `bid_attachements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bid_category`
--

DROP TABLE IF EXISTS `bid_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bid_category` (
  `BID_CAT_Field` varchar(50) NOT NULL,
  `BID_CAT_Skill` varchar(50) NOT NULL,
  `CAT_BID_ID` int NOT NULL,
  PRIMARY KEY (`BID_CAT_Field`,`BID_CAT_Skill`,`CAT_BID_ID`),
  KEY `CAT_BID_ID` (`CAT_BID_ID`),
  CONSTRAINT `bid_category_ibfk_1` FOREIGN KEY (`CAT_BID_ID`) REFERENCES `bid` (`BID_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bid_category`
--

LOCK TABLES `bid_category` WRITE;
/*!40000 ALTER TABLE `bid_category` DISABLE KEYS */;
INSERT INTO `bid_category` VALUES ('Back_end_Development','NodeJs',1),('Cloud_Computing','Azure',1),('Game_Development','Unity',1),('Game_Development','Unreal',1);
/*!40000 ALTER TABLE `bid_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cli_field`
--

DROP TABLE IF EXISTS `cli_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cli_field` (
  `CLI_CAT_Field` varchar(50) NOT NULL,
  `CAT_Client_Id` int NOT NULL,
  PRIMARY KEY (`CLI_CAT_Field`,`CAT_Client_Id`),
  KEY `CAT_Client_Id` (`CAT_Client_Id`),
  CONSTRAINT `cli_field_ibfk_1` FOREIGN KEY (`CAT_Client_Id`) REFERENCES `client` (`CLI_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cli_field`
--

LOCK TABLES `cli_field` WRITE;
/*!40000 ALTER TABLE `cli_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `cli_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cli_links`
--

DROP TABLE IF EXISTS `cli_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cli_links` (
  `CLI_LIN_Name` varchar(50) NOT NULL,
  `CLI_LIN_Link` varchar(500) NOT NULL,
  `CLI_LIN_Client_Id` int NOT NULL,
  PRIMARY KEY (`CLI_LIN_Client_Id`,`CLI_LIN_Name`),
  CONSTRAINT `cli_links_ibfk_1` FOREIGN KEY (`CLI_LIN_Client_Id`) REFERENCES `client` (`CLI_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cli_links`
--

LOCK TABLES `cli_links` WRITE;
/*!40000 ALTER TABLE `cli_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `cli_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `CLI_Name` varchar(50) NOT NULL,
  `CLI_User_Name` varchar(50) NOT NULL,
  `CLI_ID` int NOT NULL AUTO_INCREMENT,
  `CLI_Email` varchar(50) NOT NULL,
  `CLI_Profile_Picture` varchar(500) DEFAULT NULL,
  `CLI_Phone` varchar(50) DEFAULT NULL,
  `CLI_Creation_Date` date NOT NULL,
  `CLI_Founded_Date` date DEFAULT NULL,
  `CLI_Last_Login` date NOT NULL,
  `CLI_Hash` varchar(255) NOT NULL,
  `CLI_Credentials` varchar(50) NOT NULL DEFAULT 'Trial ',
  `CLI_Wallet` float NOT NULL DEFAULT '0',
  `CLI_Location` varchar(50) DEFAULT NULL,
  `CLI_AVG_Participation` float NOT NULL DEFAULT '0',
  `CLI_Competitions_Count` int NOT NULL DEFAULT '0',
  `CLI_Bids_Count` int NOT NULL DEFAULT '0',
  `CLI_AVG_Application` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`CLI_ID`),
  UNIQUE KEY `CLI_User_Name` (`CLI_User_Name`),
  UNIQUE KEY `CLI_ID` (`CLI_ID`),
  UNIQUE KEY `CLI_Email` (`CLI_Email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES ('BRYTE','osama_magdy',1,'osama_magdy@gmail.com','https://cdn-www.bluestacks.com/bs-images/CATS-796.jpg','01000','2021-01-12','2020-12-12','2021-01-12','$2b$10$Cf17cz63Dm2Hdo0VhS5LuuC5XgH00fDxJiFhvBvw1dE7CKcxBLifG','Trial ',0,'test',0,0,0,0);
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_rates_developer`
--

DROP TABLE IF EXISTS `client_rates_developer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_rates_developer` (
  `DEV_Id` int NOT NULL,
  `CLI_Id` int NOT NULL,
  `PRO_Id` int NOT NULL,
  `RAT_Rating` float NOT NULL,
  `RAT_Description` varchar(10000) DEFAULT NULL,
  PRIMARY KEY (`DEV_Id`,`CLI_Id`,`PRO_Id`),
  KEY `PRO_Id` (`PRO_Id`),
  KEY `CLI_Id` (`CLI_Id`),
  CONSTRAINT `client_rates_developer_ibfk_1` FOREIGN KEY (`DEV_Id`) REFERENCES `developer` (`DEV_ID`),
  CONSTRAINT `client_rates_developer_ibfk_2` FOREIGN KEY (`PRO_Id`) REFERENCES `project` (`PRO_ID`),
  CONSTRAINT `client_rates_developer_ibfk_3` FOREIGN KEY (`CLI_Id`) REFERENCES `client` (`CLI_ID`),
  CONSTRAINT `client_rates_developer_chk_1` CHECK (((`RAT_Rating` > 0) and (`RAT_Rating` <= 5)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_rates_developer`
--

LOCK TABLES `client_rates_developer` WRITE;
/*!40000 ALTER TABLE `client_rates_developer` DISABLE KEYS */;
/*!40000 ALTER TABLE `client_rates_developer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_rates_team`
--

DROP TABLE IF EXISTS `client_rates_team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_rates_team` (
  `TEA_Id` int NOT NULL,
  `CLI_Id` int NOT NULL,
  `PRO_Id` int NOT NULL,
  `RAT_Rating` float NOT NULL,
  `RAT_Description` varchar(10000) DEFAULT NULL,
  PRIMARY KEY (`TEA_Id`,`CLI_Id`,`PRO_Id`),
  KEY `PRO_Id` (`PRO_Id`),
  KEY `CLI_Id` (`CLI_Id`),
  CONSTRAINT `client_rates_team_ibfk_1` FOREIGN KEY (`TEA_Id`) REFERENCES `team` (`TEA_ID`),
  CONSTRAINT `client_rates_team_ibfk_2` FOREIGN KEY (`PRO_Id`) REFERENCES `project` (`PRO_ID`),
  CONSTRAINT `client_rates_team_ibfk_3` FOREIGN KEY (`CLI_Id`) REFERENCES `client` (`CLI_ID`),
  CONSTRAINT `client_rates_team_chk_1` CHECK (((`RAT_Rating` > 0) and (`RAT_Rating` <= 5)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_rates_team`
--

LOCK TABLES `client_rates_team` WRITE;
/*!40000 ALTER TABLE `client_rates_team` DISABLE KEYS */;
/*!40000 ALTER TABLE `client_rates_team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `com_attachements`
--

DROP TABLE IF EXISTS `com_attachements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `com_attachements` (
  `COM_ATT_ID` int NOT NULL,
  `COM_ATT_Link` varchar(500) NOT NULL,
  `COM_ATT_Link_Description` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`COM_ATT_ID`,`COM_ATT_Link`),
  CONSTRAINT `com_attachements_ibfk_1` FOREIGN KEY (`COM_ATT_ID`) REFERENCES `competition` (`COM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `com_attachements`
--

LOCK TABLES `com_attachements` WRITE;
/*!40000 ALTER TABLE `com_attachements` DISABLE KEYS */;
/*!40000 ALTER TABLE `com_attachements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `com_category`
--

DROP TABLE IF EXISTS `com_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `com_category` (
  `COM_CAT_Field` varchar(50) NOT NULL,
  `COM_CAT_Skill` varchar(50) NOT NULL,
  `CAT_Competition_Id` int NOT NULL,
  PRIMARY KEY (`COM_CAT_Field`,`COM_CAT_Skill`,`CAT_Competition_Id`),
  KEY `CAT_Competition_Id` (`CAT_Competition_Id`),
  CONSTRAINT `com_category_ibfk_1` FOREIGN KEY (`CAT_Competition_Id`) REFERENCES `competition` (`COM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `com_category`
--

LOCK TABLES `com_category` WRITE;
/*!40000 ALTER TABLE `com_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `com_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `com_phases`
--

DROP TABLE IF EXISTS `com_phases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `com_phases` (
  `PHS_Start` datetime DEFAULT NULL,
  `PHS_End` datetime DEFAULT NULL,
  `PHS_Name` varchar(50) NOT NULL,
  `PHS_Description` varchar(100) NOT NULL,
  `PHS_Competition_Id` int NOT NULL,
  PRIMARY KEY (`PHS_Name`,`PHS_Competition_Id`),
  KEY `PHS_Competition_Id` (`PHS_Competition_Id`),
  CONSTRAINT `com_phases_ibfk_1` FOREIGN KEY (`PHS_Competition_Id`) REFERENCES `competition` (`COM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `com_phases`
--

LOCK TABLES `com_phases` WRITE;
/*!40000 ALTER TABLE `com_phases` DISABLE KEYS */;
/*!40000 ALTER TABLE `com_phases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `com_prizes`
--

DROP TABLE IF EXISTS `com_prizes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `com_prizes` (
  `PRZ_Prize` varchar(50) NOT NULL,
  `PRZ_Rank` varchar(50) NOT NULL,
  `PRZ_Competition_Id` int NOT NULL,
  PRIMARY KEY (`PRZ_Rank`,`PRZ_Competition_Id`),
  KEY `PRZ_Competition_Id` (`PRZ_Competition_Id`),
  CONSTRAINT `com_prizes_ibfk_1` FOREIGN KEY (`PRZ_Competition_Id`) REFERENCES `competition` (`COM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `com_prizes`
--

LOCK TABLES `com_prizes` WRITE;
/*!40000 ALTER TABLE `com_prizes` DISABLE KEYS */;
/*!40000 ALTER TABLE `com_prizes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `competition`
--

DROP TABLE IF EXISTS `competition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `competition` (
  `COM_ID` int NOT NULL AUTO_INCREMENT,
  `COM_Name` varchar(50) NOT NULL,
  `COM_Status` varchar(10) DEFAULT NULL,
  `COM_Start_Date` date DEFAULT NULL,
  `COM_End_Date` date DEFAULT NULL,
  `COM_Description` varchar(10000) DEFAULT NULL,
  `COM_Thumbnail` varchar(500) DEFAULT NULL,
  `COM_Total_Submissions` int DEFAULT NULL,
  `COM_Type` char(1) NOT NULL,
  PRIMARY KEY (`COM_ID`),
  UNIQUE KEY `COM_ID` (`COM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `competition`
--

LOCK TABLES `competition` WRITE;
/*!40000 ALTER TABLE `competition` DISABLE KEYS */;
/*!40000 ALTER TABLE `competition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `creates`
--

DROP TABLE IF EXISTS `creates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `creates` (
  `CLI_Id` int NOT NULL,
  `COM_Id` int NOT NULL,
  PRIMARY KEY (`CLI_Id`,`COM_Id`),
  KEY `COM_Id` (`COM_Id`),
  CONSTRAINT `creates_ibfk_1` FOREIGN KEY (`CLI_Id`) REFERENCES `client` (`CLI_ID`),
  CONSTRAINT `creates_ibfk_2` FOREIGN KEY (`COM_Id`) REFERENCES `competition` (`COM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `creates`
--

LOCK TABLES `creates` WRITE;
/*!40000 ALTER TABLE `creates` DISABLE KEYS */;
/*!40000 ALTER TABLE `creates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dev_awards`
--

DROP TABLE IF EXISTS `dev_awards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dev_awards` (
  `DEV_AWA_Title` varchar(50) NOT NULL,
  `DEV_AWA_Descreption` varchar(100) DEFAULT NULL,
  `DEV_AWA_Developer_Id` int NOT NULL,
  `DEV_AWA_Date` date NOT NULL,
  PRIMARY KEY (`DEV_AWA_Developer_Id`,`DEV_AWA_Title`,`DEV_AWA_Date`),
  CONSTRAINT `dev_awards_ibfk_1` FOREIGN KEY (`DEV_AWA_Developer_Id`) REFERENCES `developer` (`DEV_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dev_awards`
--

LOCK TABLES `dev_awards` WRITE;
/*!40000 ALTER TABLE `dev_awards` DISABLE KEYS */;
/*!40000 ALTER TABLE `dev_awards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dev_category`
--

DROP TABLE IF EXISTS `dev_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dev_category` (
  `DEV_CAT_Field` varchar(50) NOT NULL,
  `DEV_CAT_Skill` varchar(50) NOT NULL,
  `CAT_Developer_Id` int NOT NULL,
  `DEV_CAT_Verified` bit(1) DEFAULT NULL,
  PRIMARY KEY (`DEV_CAT_Field`,`DEV_CAT_Skill`,`CAT_Developer_Id`),
  KEY `CAT_Developer_Id` (`CAT_Developer_Id`),
  CONSTRAINT `dev_category_ibfk_1` FOREIGN KEY (`CAT_Developer_Id`) REFERENCES `developer` (`DEV_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dev_category`
--

LOCK TABLES `dev_category` WRITE;
/*!40000 ALTER TABLE `dev_category` DISABLE KEYS */;
INSERT INTO `dev_category` VALUES ('Back_end_Development','Nodejs',1,_binary ''),('Back_end_Development','Nodejs',2,_binary ''),('Back_end_Development','Nodejs',3,_binary ''),('Back_end_Development','Nodejs',4,_binary '');
/*!40000 ALTER TABLE `dev_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dev_degree`
--

DROP TABLE IF EXISTS `dev_degree`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dev_degree` (
  `DEV_DEG_Field` varchar(50) NOT NULL,
  `DEV_DEG_Faculty` varchar(50) NOT NULL,
  `DEV_DEG_University` varchar(50) NOT NULL,
  `DEV_DEG_Developer_Id` int NOT NULL,
  `DEV_DEG_Start_Date` date NOT NULL,
  `DEV_DEG_End_Date` date DEFAULT NULL,
  `DEV_DEG_Title` varchar(50) NOT NULL,
  PRIMARY KEY (`DEV_DEG_Developer_Id`,`DEV_DEG_Field`,`DEV_DEG_Faculty`),
  CONSTRAINT `dev_degree_ibfk_1` FOREIGN KEY (`DEV_DEG_Developer_Id`) REFERENCES `developer` (`DEV_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dev_degree`
--

LOCK TABLES `dev_degree` WRITE;
/*!40000 ALTER TABLE `dev_degree` DISABLE KEYS */;
INSERT INTO `dev_degree` VALUES ('Computer Science','Engineering','Cairo',1,'2020-02-02','2020-02-02','BCS'),('Computer Science','Engineering','Cairo',2,'2020-02-02','2020-02-02','BCS'),('Computer Science','Engineering','Cairo',3,'2020-02-02','2020-02-02','BCS'),('Computer Science','Engineering','Cairo',4,'2020-02-02','2020-02-02','BCS');
/*!40000 ALTER TABLE `dev_degree` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dev_links`
--

DROP TABLE IF EXISTS `dev_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dev_links` (
  `DEV_LIN_Name` varchar(50) NOT NULL,
  `DEV_LIN_Link` varchar(500) NOT NULL,
  `DEV_LIN_Developer_Id` int NOT NULL,
  PRIMARY KEY (`DEV_LIN_Developer_Id`,`DEV_LIN_Name`),
  CONSTRAINT `dev_links_ibfk_1` FOREIGN KEY (`DEV_LIN_Developer_Id`) REFERENCES `developer` (`DEV_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dev_links`
--

LOCK TABLES `dev_links` WRITE;
/*!40000 ALTER TABLE `dev_links` DISABLE KEYS */;
INSERT INTO `dev_links` VALUES ('facebook','facebook.com',1),('youtube','youtube.com',1),('facebook','facebook.com',2),('youtube','youtube.com',2),('facebook','facebook.com',3),('youtube','youtube.com',3),('facebook','facebook.com',4),('youtube','youtube.com',4);
/*!40000 ALTER TABLE `dev_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dev_working_experince`
--

DROP TABLE IF EXISTS `dev_working_experince`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dev_working_experince` (
  `DEV_WOR_Title` varchar(50) NOT NULL,
  `DEV_WOR_Descreption` varchar(100) DEFAULT NULL,
  `DEV_WOR_Start_Date` date NOT NULL,
  `DEV_WOR_End_Date` date NOT NULL,
  `DEV_WOR_Developer_Id` int NOT NULL,
  `DEV_WOR_Place` varchar(50) NOT NULL,
  PRIMARY KEY (`DEV_WOR_Developer_Id`,`DEV_WOR_Title`,`DEV_WOR_Place`),
  CONSTRAINT `dev_working_experince_ibfk_1` FOREIGN KEY (`DEV_WOR_Developer_Id`) REFERENCES `developer` (`DEV_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dev_working_experince`
--

LOCK TABLES `dev_working_experince` WRITE;
/*!40000 ALTER TABLE `dev_working_experince` DISABLE KEYS */;
INSERT INTO `dev_working_experince` VALUES ('Frond-End Developer','Gammmmmmmmmmmmed','2020-02-02','2020-02-02',1,'Google'),('Frond-End Developer','Gammmmmmmmmmmmed','2020-02-02','2020-02-02',2,'Google'),('Frond-End Developer','Gammmmmmmmmmmmed','2020-02-02','2020-02-02',3,'Google'),('Frond-End Developer','Gammmmmmmmmmmmed','2020-02-02','2020-02-02',4,'Google');
/*!40000 ALTER TABLE `dev_working_experince` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `developer`
--

DROP TABLE IF EXISTS `developer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `developer` (
  `DEV_Fname` varchar(50) NOT NULL,
  `DEV_Lname` varchar(50) NOT NULL,
  `DEV_User_Name` varchar(50) NOT NULL,
  `DEV_ID` int NOT NULL AUTO_INCREMENT,
  `DEV_Email` varchar(50) NOT NULL,
  `DEV_Profile_Picture` varchar(500) DEFAULT NULL,
  `DEV_Cover` varchar(500) DEFAULT NULL,
  `DEV_Is_Pro` bit(1) DEFAULT b'0',
  `DEV_Phone` varchar(50) DEFAULT NULL,
  `DEV_Creation_Date` date NOT NULL,
  `DEV_Birth_Date` date NOT NULL,
  `DEV_Last_Login` date NOT NULL,
  `DEV_Hash` varchar(255) NOT NULL,
  `DEV_Credentials` varchar(50) NOT NULL,
  `DEV_Wallet` float NOT NULL DEFAULT '0',
  `DEV_Address` varchar(200) DEFAULT NULL,
  `DEV_Job_Title` varchar(50) DEFAULT NULL,
  `DEV_About` varchar(5000) DEFAULT NULL,
  `DEV_Wining_Count` int NOT NULL DEFAULT '0',
  `DEV_Participation_Count` int NOT NULL DEFAULT '0',
  `DEV_Pick_Rate` float NOT NULL DEFAULT '0',
  `DEV_Bids_Count` int NOT NULL DEFAULT '0',
  `DEV_Projects_Count` int NOT NULL DEFAULT '0',
  `DEV_Age` int NOT NULL,
  PRIMARY KEY (`DEV_ID`),
  UNIQUE KEY `DEV_User_Name` (`DEV_User_Name`),
  UNIQUE KEY `DEV_ID` (`DEV_ID`),
  UNIQUE KEY `DEV_Email` (`DEV_Email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `developer`
--

LOCK TABLES `developer` WRITE;
/*!40000 ALTER TABLE `developer` DISABLE KEYS */;
INSERT INTO `developer` VALUES ('osama','magdy','osama_magdy',1,'osamamagdy174@gmail.com','https://jooinn.com/images/young-man-17.jpg','https://lh3.googleusercontent.com/proxy/1e3tlpp_tDG5BeIgYGfs_h_w4_0T0uGxhpcCbNoIDtgn7_R1M4YFWVg1p05HGCqX8c2uWNV_khaR6r1gCQ8IKiCN9jXm2n07YtH_muetipmvPA8EQUk9U33GzKZZQ1fK2kp6RpyNJPBl7SBe',_binary '\0','+201118182713','2000-11-05','2000-11-05','2000-11-05','$2b$10$/UsSaq7gPm6DxK09H8aE5.TcldHdL3qyf6CDgsk5c/3GnTh0pECh.','Trial',0,'Faisal','Dev','Stephen William Hawking CH CBE FRS FRSA (8 January 1942 – 14 March 2018) was an English theoretical physicist, cosmologist, and author who was director of research at the Centre for Theoretical Cosmology at the University of Cambridge at the time of his death.[18][19][8] He was the Lucasian Professor of Mathematics at the University of Cambridge between 1979 and 2009.\n\nHawking was born in Oxford into a family of doctors. Hawking began his university education at University College, Oxford in October 1959 at the age of 17, where he received a first-class BA (Hons.) degree in physics. He began his graduate work at Trinity Hall, Cambridge in October 1962, where he obtained his PhD degree in applied mathematics and theoretical physics, specialising in general relativity and cosmology in March 1966. During this period—in 1963—Hawking was diagnosed with an early-onset slow-progressing form of motor neurone disease (also known as amyotrophic lateral sclerosis (ALS) or Lou Gehrig\'s disease) that gradually paralysed him over the decades.[20][21] After the loss of his speech, he was able to communicate through a speech-generating device—initially through use of a handheld switch, and eventually by using a single cheek muscle.\n\n',0,0,0,0,0,20),('Yahia','zakaria','yahia_zakaria',2,'yahia_zakaria@gmail.com','https://areyouawellbeing.texashealth.org/wp-content/uploads/2018/03/men-testicular-cancer-670x402.jpg','https://www.midlandladders.com/image///Logos/YoungmanLogoblack2.jpg',_binary '\0','+201118182713','2000-11-05','2000-11-05','2000-11-05','$2b$10$qUepJnreBSjbeUZ9ZJYVKOsWqXIso.fKL7JpqY4VghGE0WBU1cf82','Trial',0,'Faisal','Dev','Stephen William Hawking CH CBE FRS FRSA (8 January 1942 – 14 March 2018) was an English theoretical physicist, cosmologist, and author who was director of research at the Centre for Theoretical Cosmology at the University of Cambridge at the time of his death.[18][19][8] He was the Lucasian Professor of Mathematics at the University of Cambridge between 1979 and 2009.\n\nHawking was born in Oxford into a family of doctors. Hawking began his university education at University College, Oxford in October 1959 at the age of 17, where he received a first-class BA (Hons.) degree in physics. He began his graduate work at Trinity Hall, Cambridge in October 1962, where he obtained his PhD degree in applied mathematics and theoretical physics, specialising in general relativity and cosmology in March 1966. During this period—in 1963—Hawking was diagnosed with an early-onset slow-progressing form of motor neurone disease (also known as amyotrophic lateral sclerosis (ALS) or Lou Gehrig\'s disease) that gradually paralysed him over the decades.[20][21] After the loss of his speech, he was able to communicate through a speech-generating device—initially through use of a handheld switch, and eventually by using a single cheek muscle.\n\n',0,0,0,0,0,20),('Zyad','Atef','zyad_atef',3,'zyad_atef@gmail.com','https://media.istockphoto.com/photos/portrait-of-a-smiling-student-at-the-city-street-picture-id1147289240?k=6&m=1147289240&s=612x612&w=0&h=EBUqpCRQz1s3ssDSuF0JBT0_22copoJKbZ7FNOxHr7c=','https://media-exp1.licdn.com/dms/image/C510BAQHcv1fDrzvodA/company-logo_200_200/0/1583612284069?e=2159024400&v=beta&t=eMkBDT9K9lPovhftyGe1ZaAFbEK7-L0Iah2AyRjn958',_binary '\0','+201118182713','2000-05-11','2000-05-11','2000-05-11','$2b$10$sWf0Jg8qyDyKCTQvT.S12ON6pwZDctrIeAa6k3znwZ7Q.mLDIRjb2','Trial',0,'Faisal','Dev','Stephen William Hawking CH CBE FRS FRSA (8 January 1942 – 14 March 2018) was an English theoretical physicist, cosmologist, and author who was director of research at the Centre for Theoretical Cosmology at the University of Cambridge at the time of his death.[18][19][8] He was the Lucasian Professor of Mathematics at the University of Cambridge between 1979 and 2009.\n\nHawking was born in Oxford into a family of doctors. Hawking began his university education at University College, Oxford in October 1959 at the age of 17, where he received a first-class BA (Hons.) degree in physics. He began his graduate work at Trinity Hall, Cambridge in October 1962, where he obtained his PhD degree in applied mathematics and theoretical physics, specialising in general relativity and cosmology in March 1966. During this period—in 1963—Hawking was diagnosed with an early-onset slow-progressing form of motor neurone disease (also known as amyotrophic lateral sclerosis (ALS) or Lou Gehrig\'s disease) that gradually paralysed him over the decades.[20][21] After the loss of his speech, he was able to communicate through a speech-generating device—initially through use of a handheld switch, and eventually by using a single cheek muscle.\n\n',0,0,0,0,0,20),('Hossam','Mohammed','hossam_mohammed',4,'hossam_mohammed@gmail.com','https://static6.depositphotos.com/1008303/626/i/600/depositphotos_6264733-stock-photo-mixed-race-man-smiling.jpg','https://assets.simpleviewinc.com/simpleview/image/fetch/c_fill,h_553,q_75,w_1105/https://assets.simpleviewinc.com/simpleview/image/upload/crm/omaha/Lawrence-Youngman-Lake_1a445e17-5056-a36a-09e385fa8095fc4e.jpg',_binary '\0','+201118182713','2000-05-11','2000-05-11','2000-05-11','$2b$10$wMyBxcK3OuJeiGNh7sveV.mKydA1R6K0JLbxN/5i.30JU/P4rAt9y','Trial',0,'Faisal','Dev','Stephen William Hawking CH CBE FRS FRSA (8 January 1942 – 14 March 2018) was an English theoretical physicist, cosmologist, and author who was director of research at the Centre for Theoretical Cosmology at the University of Cambridge at the time of his death.[18][19][8] He was the Lucasian Professor of Mathematics at the University of Cambridge between 1979 and 2009.\n\nHawking was born in Oxford into a family of doctors. Hawking began his university education at University College, Oxford in October 1959 at the age of 17, where he received a first-class BA (Hons.) degree in physics. He began his graduate work at Trinity Hall, Cambridge in October 1962, where he obtained his PhD degree in applied mathematics and theoretical physics, specialising in general relativity and cosmology in March 1966. During this period—in 1963—Hawking was diagnosed with an early-onset slow-progressing form of motor neurone disease (also known as amyotrophic lateral sclerosis (ALS) or Lou Gehrig\'s disease) that gradually paralysed him over the decades.[20][21] After the loss of his speech, he was able to communicate through a speech-generating device—initially through use of a handheld switch, and eventually by using a single cheek muscle.\n\n',0,0,0,0,0,20);
/*!40000 ALTER TABLE `developer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `developer_apply`
--

DROP TABLE IF EXISTS `developer_apply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `developer_apply` (
  `DEV_Id` int NOT NULL,
  `BID_Id` int NOT NULL,
  PRIMARY KEY (`DEV_Id`,`BID_Id`),
  KEY `BID_Id` (`BID_Id`),
  CONSTRAINT `developer_apply_ibfk_1` FOREIGN KEY (`DEV_Id`) REFERENCES `developer` (`DEV_ID`),
  CONSTRAINT `developer_apply_ibfk_2` FOREIGN KEY (`BID_Id`) REFERENCES `bid` (`BID_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `developer_apply`
--

LOCK TABLES `developer_apply` WRITE;
/*!40000 ALTER TABLE `developer_apply` DISABLE KEYS */;
/*!40000 ALTER TABLE `developer_apply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `developer_participate`
--

DROP TABLE IF EXISTS `developer_participate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `developer_participate` (
  `DEV_Id` int NOT NULL,
  `COM_Id` int NOT NULL,
  PRIMARY KEY (`DEV_Id`,`COM_Id`),
  KEY `COM_Id` (`COM_Id`),
  CONSTRAINT `developer_participate_ibfk_1` FOREIGN KEY (`DEV_Id`) REFERENCES `developer` (`DEV_ID`),
  CONSTRAINT `developer_participate_ibfk_2` FOREIGN KEY (`COM_Id`) REFERENCES `competition` (`COM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `developer_participate`
--

LOCK TABLES `developer_participate` WRITE;
/*!40000 ALTER TABLE `developer_participate` DISABLE KEYS */;
/*!40000 ALTER TABLE `developer_participate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `developer_rates_client`
--

DROP TABLE IF EXISTS `developer_rates_client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `developer_rates_client` (
  `DEV_Id` int NOT NULL,
  `CLI_Id` int NOT NULL,
  `PRO_Id` int NOT NULL,
  `RAT_Rating` float NOT NULL,
  `RAT_Description` varchar(10000) DEFAULT NULL,
  PRIMARY KEY (`DEV_Id`,`CLI_Id`,`PRO_Id`),
  KEY `PRO_Id` (`PRO_Id`),
  KEY `CLI_Id` (`CLI_Id`),
  CONSTRAINT `developer_rates_client_ibfk_1` FOREIGN KEY (`DEV_Id`) REFERENCES `developer` (`DEV_ID`),
  CONSTRAINT `developer_rates_client_ibfk_2` FOREIGN KEY (`PRO_Id`) REFERENCES `project` (`PRO_ID`),
  CONSTRAINT `developer_rates_client_ibfk_3` FOREIGN KEY (`CLI_Id`) REFERENCES `client` (`CLI_ID`),
  CONSTRAINT `developer_rates_client_chk_1` CHECK (((`RAT_Rating` > 0) and (`RAT_Rating` <= 5)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `developer_rates_client`
--

LOCK TABLES `developer_rates_client` WRITE;
/*!40000 ALTER TABLE `developer_rates_client` DISABLE KEYS */;
/*!40000 ALTER TABLE `developer_rates_client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `developer_works_in`
--

DROP TABLE IF EXISTS `developer_works_in`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `developer_works_in` (
  `DEV_Id` int NOT NULL,
  `TEA_Id` int NOT NULL,
  PRIMARY KEY (`DEV_Id`,`TEA_Id`),
  KEY `TEA_Id` (`TEA_Id`),
  CONSTRAINT `developer_works_in_ibfk_1` FOREIGN KEY (`DEV_Id`) REFERENCES `developer` (`DEV_ID`),
  CONSTRAINT `developer_works_in_ibfk_2` FOREIGN KEY (`TEA_Id`) REFERENCES `team` (`TEA_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `developer_works_in`
--

LOCK TABLES `developer_works_in` WRITE;
/*!40000 ALTER TABLE `developer_works_in` DISABLE KEYS */;
/*!40000 ALTER TABLE `developer_works_in` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `developer_works_on`
--

DROP TABLE IF EXISTS `developer_works_on`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `developer_works_on` (
  `DEV_Id` int NOT NULL,
  `PRO_Id` int NOT NULL,
  `Dev_Role` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`DEV_Id`,`PRO_Id`),
  KEY `PRO_Id` (`PRO_Id`),
  CONSTRAINT `developer_works_on_ibfk_1` FOREIGN KEY (`DEV_Id`) REFERENCES `developer` (`DEV_ID`),
  CONSTRAINT `developer_works_on_ibfk_2` FOREIGN KEY (`PRO_Id`) REFERENCES `project` (`PRO_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `developer_works_on`
--

LOCK TABLES `developer_works_on` WRITE;
/*!40000 ALTER TABLE `developer_works_on` DISABLE KEYS */;
INSERT INTO `developer_works_on` VALUES (1,10,'Back-end'),(2,10,'Back-end');
/*!40000 ALTER TABLE `developer_works_on` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_awards`
--

DROP TABLE IF EXISTS `exp_awards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exp_awards` (
  `AWA_Title` varchar(50) NOT NULL,
  `AWA_Descreption` varchar(100) DEFAULT NULL,
  `AWA_Expert_Id` int NOT NULL,
  `AWA_Date` date NOT NULL,
  PRIMARY KEY (`AWA_Expert_Id`,`AWA_Title`,`AWA_Date`),
  CONSTRAINT `exp_awards_ibfk_1` FOREIGN KEY (`AWA_Expert_Id`) REFERENCES `expert` (`EXP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_awards`
--

LOCK TABLES `exp_awards` WRITE;
/*!40000 ALTER TABLE `exp_awards` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_awards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_category`
--

DROP TABLE IF EXISTS `exp_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exp_category` (
  `CAT_Field` varchar(50) NOT NULL,
  `CAT_Skill` varchar(50) NOT NULL,
  `CAT_Expert_Id` int NOT NULL,
  `CAT_Verified` bit(1) DEFAULT NULL,
  PRIMARY KEY (`CAT_Field`,`CAT_Skill`,`CAT_Expert_Id`),
  KEY `CAT_Expert_Id` (`CAT_Expert_Id`),
  CONSTRAINT `exp_category_ibfk_1` FOREIGN KEY (`CAT_Expert_Id`) REFERENCES `expert` (`EXP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_category`
--

LOCK TABLES `exp_category` WRITE;
/*!40000 ALTER TABLE `exp_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_degree`
--

DROP TABLE IF EXISTS `exp_degree`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exp_degree` (
  `DEG_Field` varchar(50) NOT NULL,
  `DEG_Faculty` varchar(50) NOT NULL,
  `DEG_Expert_Id` int NOT NULL,
  `DEG_Start_Date` date NOT NULL,
  `DEG_End_Date` date NOT NULL,
  PRIMARY KEY (`DEG_Expert_Id`,`DEG_Field`,`DEG_Faculty`),
  CONSTRAINT `exp_degree_ibfk_1` FOREIGN KEY (`DEG_Expert_Id`) REFERENCES `expert` (`EXP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_degree`
--

LOCK TABLES `exp_degree` WRITE;
/*!40000 ALTER TABLE `exp_degree` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_degree` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_links`
--

DROP TABLE IF EXISTS `exp_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exp_links` (
  `LIN_Name` varchar(50) NOT NULL,
  `LIN_Link` varchar(500) NOT NULL,
  `LIN_Expert_Id` int NOT NULL,
  PRIMARY KEY (`LIN_Expert_Id`,`LIN_Name`),
  CONSTRAINT `exp_links_ibfk_1` FOREIGN KEY (`LIN_Expert_Id`) REFERENCES `expert` (`EXP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_links`
--

LOCK TABLES `exp_links` WRITE;
/*!40000 ALTER TABLE `exp_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_working_experince`
--

DROP TABLE IF EXISTS `exp_working_experince`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exp_working_experince` (
  `WOR_Title` varchar(50) NOT NULL,
  `WOR_Descreption` varchar(100) DEFAULT NULL,
  `WOR_Start_Date` date NOT NULL,
  `WOR_End_Date` date NOT NULL,
  `WOR_Expert_Id` int NOT NULL,
  `WOR_Place` varchar(50) NOT NULL,
  PRIMARY KEY (`WOR_Expert_Id`,`WOR_Title`,`WOR_Place`),
  CONSTRAINT `exp_working_experince_ibfk_1` FOREIGN KEY (`WOR_Expert_Id`) REFERENCES `expert` (`EXP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_working_experince`
--

LOCK TABLES `exp_working_experince` WRITE;
/*!40000 ALTER TABLE `exp_working_experince` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_working_experince` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expert`
--

DROP TABLE IF EXISTS `expert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `expert` (
  `EXP_Fname` varchar(50) NOT NULL,
  `EXP_Lname` varchar(50) NOT NULL,
  `EXP_User_Name` varchar(50) NOT NULL,
  `EXP_ID` int NOT NULL AUTO_INCREMENT,
  `EXP_Email` varchar(50) NOT NULL,
  `EXP_Profile_Picture` varchar(500) DEFAULT NULL,
  `EXP_Phone` varchar(50) DEFAULT NULL,
  `EXP_Creation_Date` date NOT NULL,
  `EXP_Birth_Date` date NOT NULL,
  `EXP_Last_Login` date NOT NULL,
  `EXP_Hash` varchar(255) NOT NULL,
  `EXP_Credentials` varchar(50) NOT NULL,
  `EXP_Wallet` float NOT NULL DEFAULT '0',
  `EXP_Address` varchar(200) DEFAULT NULL,
  `EXP_Job_Title` varchar(50) DEFAULT NULL,
  `EXP_Portfolio_Count` int NOT NULL DEFAULT '0',
  `EXP_Questions_Count` int NOT NULL DEFAULT '0',
  `EXP_Projects_Review_Count` int NOT NULL DEFAULT '0',
  `EXP_Judge_Count` int NOT NULL DEFAULT '0',
  `EXP_Age` int NOT NULL,
  PRIMARY KEY (`EXP_ID`),
  UNIQUE KEY `EXP_User_Name` (`EXP_User_Name`),
  UNIQUE KEY `EXP_ID` (`EXP_ID`),
  UNIQUE KEY `EXP_Email` (`EXP_Email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expert`
--

LOCK TABLES `expert` WRITE;
/*!40000 ALTER TABLE `expert` DISABLE KEYS */;
/*!40000 ALTER TABLE `expert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expert_judge`
--

DROP TABLE IF EXISTS `expert_judge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `expert_judge` (
  `EXP_Id` int NOT NULL,
  `COM_Id` int NOT NULL,
  `JUD_Rating` int NOT NULL,
  PRIMARY KEY (`EXP_Id`,`COM_Id`),
  KEY `COM_Id` (`COM_Id`),
  CONSTRAINT `expert_judge_ibfk_1` FOREIGN KEY (`EXP_Id`) REFERENCES `expert` (`EXP_ID`),
  CONSTRAINT `expert_judge_ibfk_2` FOREIGN KEY (`COM_Id`) REFERENCES `competition` (`COM_ID`),
  CONSTRAINT `expert_judge_chk_1` CHECK (((`JUD_Rating` > 0) and (`JUD_Rating` <= 5)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expert_judge`
--

LOCK TABLES `expert_judge` WRITE;
/*!40000 ALTER TABLE `expert_judge` DISABLE KEYS */;
/*!40000 ALTER TABLE `expert_judge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expert_review_developer`
--

DROP TABLE IF EXISTS `expert_review_developer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `expert_review_developer` (
  `EXP_Id` int NOT NULL,
  `DEV_Id` int NOT NULL,
  `REV_Rating` float NOT NULL,
  `REV_Description` varchar(10000) DEFAULT NULL,
  PRIMARY KEY (`EXP_Id`,`DEV_Id`),
  KEY `DEV_Id` (`DEV_Id`),
  CONSTRAINT `expert_review_developer_ibfk_1` FOREIGN KEY (`EXP_Id`) REFERENCES `expert` (`EXP_ID`),
  CONSTRAINT `expert_review_developer_ibfk_2` FOREIGN KEY (`DEV_Id`) REFERENCES `developer` (`DEV_ID`),
  CONSTRAINT `expert_review_developer_chk_1` CHECK (((`REV_Rating` > 0) and (`REV_Rating` <= 5)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expert_review_developer`
--

LOCK TABLES `expert_review_developer` WRITE;
/*!40000 ALTER TABLE `expert_review_developer` DISABLE KEYS */;
/*!40000 ALTER TABLE `expert_review_developer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expert_review_project`
--

DROP TABLE IF EXISTS `expert_review_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `expert_review_project` (
  `EXP_Id` int NOT NULL,
  `PRO_Id` int NOT NULL,
  `REV_Rating` float NOT NULL,
  `REV_Title` varchar(50) NOT NULL,
  `REV_Description` varchar(10000) NOT NULL,
  `REV_Date` date NOT NULL,
  PRIMARY KEY (`EXP_Id`,`PRO_Id`),
  KEY `PRO_Id` (`PRO_Id`),
  CONSTRAINT `expert_review_project_ibfk_1` FOREIGN KEY (`EXP_Id`) REFERENCES `expert` (`EXP_ID`),
  CONSTRAINT `expert_review_project_ibfk_2` FOREIGN KEY (`PRO_Id`) REFERENCES `project` (`PRO_ID`),
  CONSTRAINT `expert_review_project_chk_1` CHECK (((`REV_Rating` > 0) and (`REV_Rating` <= 5)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expert_review_project`
--

LOCK TABLES `expert_review_project` WRITE;
/*!40000 ALTER TABLE `expert_review_project` DISABLE KEYS */;
/*!40000 ALTER TABLE `expert_review_project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `CLI_Id` int NOT NULL,
  `BID_Id` int NOT NULL,
  PRIMARY KEY (`CLI_Id`,`BID_Id`),
  KEY `BID_Id` (`BID_Id`),
  CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`CLI_Id`) REFERENCES `client` (`CLI_ID`),
  CONSTRAINT `posts_ibfk_2` FOREIGN KEY (`BID_Id`) REFERENCES `bid` (`BID_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pro_category`
--

DROP TABLE IF EXISTS `pro_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pro_category` (
  `PRO_CAT_Field` varchar(50) NOT NULL,
  `PRO_CAT_Skill` varchar(50) NOT NULL,
  `CAT_PRO_Id` int NOT NULL,
  PRIMARY KEY (`PRO_CAT_Field`,`PRO_CAT_Skill`,`CAT_PRO_Id`),
  KEY `CAT_PRO_Id` (`CAT_PRO_Id`),
  CONSTRAINT `pro_category_ibfk_1` FOREIGN KEY (`CAT_PRO_Id`) REFERENCES `project` (`PRO_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pro_category`
--

LOCK TABLES `pro_category` WRITE;
/*!40000 ALTER TABLE `pro_category` DISABLE KEYS */;
INSERT INTO `pro_category` VALUES ('Back_end_Development','NodeJS',10),('Front_end_Development','Vue',10);
/*!40000 ALTER TABLE `pro_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pro_multimedia`
--

DROP TABLE IF EXISTS `pro_multimedia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pro_multimedia` (
  `PRO_MUL_ID` int NOT NULL,
  `PRO_MUL_Link` varchar(500) NOT NULL,
  `PRO_MUL_Link_Name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`PRO_MUL_ID`,`PRO_MUL_Link`),
  CONSTRAINT `pro_multimedia_ibfk_1` FOREIGN KEY (`PRO_MUL_ID`) REFERENCES `project` (`PRO_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pro_multimedia`
--

LOCK TABLES `pro_multimedia` WRITE;
/*!40000 ALTER TABLE `pro_multimedia` DISABLE KEYS */;
INSERT INTO `pro_multimedia` VALUES (10,'https://media.licdn.com/dms/image/C4D1BAQHDZ1uPcBBPYQ/company-background_10000/0?e=2159024400&v=beta&t=h_PVNLy_ffjU7W_Q4BYvq759oZ6H3uWUkClBE5HxjiU','image'),(10,'https://www.marklives.com/wp-content/uploads/Bryte-Insurance-01-770x350.jpg','image');
/*!40000 ALTER TABLE `pro_multimedia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project` (
  `PRO_ID` int NOT NULL AUTO_INCREMENT,
  `PRO_Name` varchar(50) NOT NULL,
  `PRO_Start_Date` date DEFAULT NULL,
  `PRO_Creation` datetime NOT NULL,
  `PRO_End_Date` date DEFAULT NULL,
  `PRO_Description` varchar(10000) DEFAULT NULL,
  `PRO_Rate` float DEFAULT NULL,
  `PRO_Thumbnail` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`PRO_ID`),
  UNIQUE KEY `PRO_ID` (`PRO_ID`),
  CONSTRAINT `project_chk_1` CHECK (((`PRO_Rate` > 0) and (`PRO_Rate` <= 5)))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES (10,'BRYTE','2020-12-12','2021-01-12 00:00:00','2021-01-12','Bryte Design is a UK-based entertainment design company run by lighting designer Cate Carter, creative producer Paul ‘Pablo’ Beckett, and lighting designer Mike Smith. Together seamlessly working to combine imaginative lighting design with skilled creative content production and set design thus delivering rich, visual, highly atmospheric, multi-dimensional show designs.\n',5,'https://media-exp1.licdn.com/dms/image/C560BAQHBWD_gCrlbHg/company-logo_200_200/0/1594161768175?e=2159024400&v=beta&t=bE4gdhN_r95iSDWUpJ2UOqS811vji8AnieaCnF-kvXo');
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission`
--

DROP TABLE IF EXISTS `submission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `submission` (
  `COM_Id` int NOT NULL,
  `PRO_Id` int NOT NULL,
  `SUB_Rating` float NOT NULL,
  PRIMARY KEY (`COM_Id`,`PRO_Id`),
  KEY `PRO_Id` (`PRO_Id`),
  CONSTRAINT `submission_ibfk_1` FOREIGN KEY (`COM_Id`) REFERENCES `competition` (`COM_ID`),
  CONSTRAINT `submission_ibfk_2` FOREIGN KEY (`PRO_Id`) REFERENCES `project` (`PRO_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission`
--

LOCK TABLES `submission` WRITE;
/*!40000 ALTER TABLE `submission` DISABLE KEYS */;
/*!40000 ALTER TABLE `submission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tea_awards`
--

DROP TABLE IF EXISTS `tea_awards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tea_awards` (
  `TEA_AWA_Title` varchar(50) NOT NULL,
  `TEA_AWA_Descreption` varchar(100) DEFAULT NULL,
  `TEA_AWA_TEA_Id` int NOT NULL,
  `TEA_AWA_Date` date NOT NULL,
  PRIMARY KEY (`TEA_AWA_TEA_Id`,`TEA_AWA_Title`,`TEA_AWA_Date`),
  CONSTRAINT `tea_awards_ibfk_1` FOREIGN KEY (`TEA_AWA_TEA_Id`) REFERENCES `team` (`TEA_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tea_awards`
--

LOCK TABLES `tea_awards` WRITE;
/*!40000 ALTER TABLE `tea_awards` DISABLE KEYS */;
/*!40000 ALTER TABLE `tea_awards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tea_category`
--

DROP TABLE IF EXISTS `tea_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tea_category` (
  `TEA_CAT_Field` varchar(50) NOT NULL,
  `TEA_CAT_Skill` varchar(50) NOT NULL,
  `CAT_TEA_Id` int NOT NULL,
  `TEA_CAT_Verified` bit(1) DEFAULT NULL,
  PRIMARY KEY (`TEA_CAT_Field`,`TEA_CAT_Skill`,`CAT_TEA_Id`),
  KEY `CAT_TEA_Id` (`CAT_TEA_Id`),
  CONSTRAINT `tea_category_ibfk_1` FOREIGN KEY (`CAT_TEA_Id`) REFERENCES `team` (`TEA_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tea_category`
--

LOCK TABLES `tea_category` WRITE;
/*!40000 ALTER TABLE `tea_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `tea_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tea_links`
--

DROP TABLE IF EXISTS `tea_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tea_links` (
  `TEA_LIN_Name` varchar(50) NOT NULL,
  `TEA_LIN_Link` varchar(500) NOT NULL,
  `TEA_LIN_TEA_Id` int NOT NULL,
  PRIMARY KEY (`TEA_LIN_TEA_Id`,`TEA_LIN_Name`),
  CONSTRAINT `tea_links_ibfk_1` FOREIGN KEY (`TEA_LIN_TEA_Id`) REFERENCES `team` (`TEA_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tea_links`
--

LOCK TABLES `tea_links` WRITE;
/*!40000 ALTER TABLE `tea_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `tea_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team` (
  `TEA_Name` varchar(50) NOT NULL,
  `TEA_ID` int NOT NULL AUTO_INCREMENT,
  `TEA_Email` varchar(50) NOT NULL,
  `TEA_Profile_Picture` varchar(500) DEFAULT NULL,
  `TEA_Creation_Date` date NOT NULL,
  `TEA_Credentials` varchar(50) NOT NULL,
  `TEA_Wallet` float NOT NULL DEFAULT '0',
  `TEA_Wining_Count` int NOT NULL DEFAULT '0',
  `TEA_Participation_Count` int NOT NULL DEFAULT '0',
  `TEA_Pick_Rate` float NOT NULL DEFAULT '0',
  `TEA_Bids_Count` int NOT NULL DEFAULT '0',
  `TEA_Projects_Count` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`TEA_ID`),
  UNIQUE KEY `TEA_ID` (`TEA_ID`),
  UNIQUE KEY `TEA_Email` (`TEA_Email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team_apply`
--

DROP TABLE IF EXISTS `team_apply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team_apply` (
  `TEA_Id` int NOT NULL,
  `BID_Id` int NOT NULL,
  PRIMARY KEY (`TEA_Id`,`BID_Id`),
  KEY `BID_Id` (`BID_Id`),
  CONSTRAINT `team_apply_ibfk_1` FOREIGN KEY (`TEA_Id`) REFERENCES `team` (`TEA_ID`),
  CONSTRAINT `team_apply_ibfk_2` FOREIGN KEY (`BID_Id`) REFERENCES `bid` (`BID_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team_apply`
--

LOCK TABLES `team_apply` WRITE;
/*!40000 ALTER TABLE `team_apply` DISABLE KEYS */;
/*!40000 ALTER TABLE `team_apply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team_participate`
--

DROP TABLE IF EXISTS `team_participate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team_participate` (
  `TEA_Id` int NOT NULL,
  `COM_Id` int NOT NULL,
  PRIMARY KEY (`TEA_Id`,`COM_Id`),
  KEY `COM_Id` (`COM_Id`),
  CONSTRAINT `team_participate_ibfk_1` FOREIGN KEY (`TEA_Id`) REFERENCES `team` (`TEA_ID`),
  CONSTRAINT `team_participate_ibfk_2` FOREIGN KEY (`COM_Id`) REFERENCES `competition` (`COM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team_participate`
--

LOCK TABLES `team_participate` WRITE;
/*!40000 ALTER TABLE `team_participate` DISABLE KEYS */;
/*!40000 ALTER TABLE `team_participate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team_rates_client`
--

DROP TABLE IF EXISTS `team_rates_client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team_rates_client` (
  `TEA_Id` int NOT NULL,
  `CLI_Id` int NOT NULL,
  `PRO_Id` int NOT NULL,
  `RAT_Rating` float NOT NULL,
  `RAT_Description` varchar(10000) DEFAULT NULL,
  PRIMARY KEY (`TEA_Id`,`CLI_Id`,`PRO_Id`),
  KEY `PRO_Id` (`PRO_Id`),
  KEY `CLI_Id` (`CLI_Id`),
  CONSTRAINT `team_rates_client_ibfk_1` FOREIGN KEY (`TEA_Id`) REFERENCES `team` (`TEA_ID`),
  CONSTRAINT `team_rates_client_ibfk_2` FOREIGN KEY (`PRO_Id`) REFERENCES `project` (`PRO_ID`),
  CONSTRAINT `team_rates_client_ibfk_3` FOREIGN KEY (`CLI_Id`) REFERENCES `client` (`CLI_ID`),
  CONSTRAINT `team_rates_client_chk_1` CHECK (((`RAT_Rating` > 0) and (`RAT_Rating` <= 5)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team_rates_client`
--

LOCK TABLES `team_rates_client` WRITE;
/*!40000 ALTER TABLE `team_rates_client` DISABLE KEYS */;
/*!40000 ALTER TABLE `team_rates_client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team_works_on`
--

DROP TABLE IF EXISTS `team_works_on`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team_works_on` (
  `TEA_Id` int NOT NULL,
  `PRO_Id` int NOT NULL,
  `TEA_Role` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`TEA_Id`,`PRO_Id`),
  KEY `PRO_Id` (`PRO_Id`),
  CONSTRAINT `team_works_on_ibfk_1` FOREIGN KEY (`TEA_Id`) REFERENCES `team` (`TEA_ID`),
  CONSTRAINT `team_works_on_ibfk_2` FOREIGN KEY (`PRO_Id`) REFERENCES `project` (`PRO_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team_works_on`
--

LOCK TABLES `team_works_on` WRITE;
/*!40000 ALTER TABLE `team_works_on` DISABLE KEYS */;
/*!40000 ALTER TABLE `team_works_on` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timeline`
--

DROP TABLE IF EXISTS `timeline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `timeline` (
  `PRO_TIM_ID` int NOT NULL,
  `PRO_TIM_Phase_Start_Date` date NOT NULL,
  `PRO_TIM_Phase_End_Date` date NOT NULL,
  `PRO_TIM_Title` varchar(30) DEFAULT NULL,
  `PRO_TIM_Description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`PRO_TIM_ID`,`PRO_TIM_Phase_Start_Date`,`PRO_TIM_Phase_End_Date`),
  CONSTRAINT `timeline_ibfk_1` FOREIGN KEY (`PRO_TIM_ID`) REFERENCES `project` (`PRO_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timeline`
--

LOCK TABLES `timeline` WRITE;
/*!40000 ALTER TABLE `timeline` DISABLE KEYS */;
INSERT INTO `timeline` VALUES (10,'2020-12-12','2021-01-12','College Phase','College Phase');
/*!40000 ALTER TABLE `timeline` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-12 20:43:57
