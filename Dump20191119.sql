CREATE DATABASE  IF NOT EXISTS `dbms` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `dbms`;
-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: dbms
-- ------------------------------------------------------
-- Server version	8.0.17

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
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admins` (
  `USER_ID` varchar(8) NOT NULL,
  `PASSWORD` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`USER_ID`),
  CONSTRAINT `admins_ibfk_1` FOREIGN KEY (`USER_ID`) REFERENCES `users` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `answered`
--

DROP TABLE IF EXISTS `answered`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `answered` (
  `USER_ID` varchar(8) DEFAULT NULL,
  `MARKS` varchar(4) DEFAULT NULL,
  `idQuiz` varchar(8) NOT NULL,
  `TIMED` varchar(16) NOT NULL,
  PRIMARY KEY (`idQuiz`,`TIMED`),
  KEY `USER_ID` (`USER_ID`),
  CONSTRAINT `answered_ibfk_2` FOREIGN KEY (`USER_ID`) REFERENCES `users` (`USER_ID`),
  CONSTRAINT `qui` FOREIGN KEY (`idQuiz`) REFERENCES `quiz` (`idQUIZ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answered`
--

LOCK TABLES `answered` WRITE;
/*!40000 ALTER TABLE `answered` DISABLE KEYS */;
INSERT INTO `answered` VALUES ('QUIZ001','4','A','1573577362'),('QUIZ001','4','A','1573579886'),('QUIZ001','4','A','1573580331'),('QUIZ416','4','A','1573581674'),('QUIZ174','1','A','1573986197'),('QUIZ914','2','A','1573989382'),('QUIZ914','2','A','1573989396'),('QUIZ914','2','A','1573989407'),('QUIZ914','2','A','1573989411'),('QUIZ914','2','A','1573989516'),('QUIZ914','2','A','1573989524'),('QUIZ914','2','A','1573989534'),('QUIZ280','2','A','1573989807'),('QUIZ280','2','A','1573989824'),('QUIZ280','2','A','1573989838'),('QUIZ280','2','A','1573989848'),('QUIZ280','2','A','1573989865'),('QUIZ914','2','A','1573990206'),('QUIZ596','2','A','1573990526'),('QUIZ596','2','A','1573991714'),('QUIZ596','2','A','1573992003'),('QUIZ393','8','A','1573992119'),('QUIZ596','2','A','1574070261'),('QUIZ596','2','A','1574081583');
/*!40000 ALTER TABLE `answered` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `answers`
--

DROP TABLE IF EXISTS `answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `answers` (
  `Q_ID` varchar(8) NOT NULL,
  `Q_ANSWER` char(2) DEFAULT NULL,
  PRIMARY KEY (`Q_ID`),
  CONSTRAINT `answers_ibfk_1` FOREIGN KEY (`Q_ID`) REFERENCES `questions` (`Q_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answers`
--

LOCK TABLES `answers` WRITE;
/*!40000 ALTER TABLE `answers` DISABLE KEYS */;
INSERT INTO `answers` VALUES ('A001','A'),('A002','B'),('A003','B'),('A004','C'),('A005','B'),('A006','C'),('A007','C'),('A008','C'),('A009','C'),('A010','A');
/*!40000 ALTER TABLE `answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questions` (
  `Q_ID` varchar(8) NOT NULL,
  `QUESTION` text,
  `idQUIZ` varchar(45) DEFAULT NULL,
  `optionA` varchar(445) DEFAULT NULL,
  `optionB` varchar(445) DEFAULT NULL,
  `optionC` varchar(445) DEFAULT NULL,
  PRIMARY KEY (`Q_ID`),
  KEY `idquiz_idx` (`idQUIZ`),
  CONSTRAINT `idquiz` FOREIGN KEY (`idQUIZ`) REFERENCES `quiz` (`idQUIZ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES ('A001','What does <B>SQL</B> stands for <br>','A','<b>A:</b>Structured Question Langauge<br>','<b>B:</b>Strong Question Language<br>','<b>C:</b>Structured Query Language'),('A002','Which SQL statement is used to extract data from a database?<br>','A','<b>A:</b>SELECT<br>','<b>B:</b>OPEN<br>','<b>C:</b>GET'),('A003','Which SQL statement is used to update data in a database?<br>','A','<b>A:</b>SAVE<br>','<b>B:</b>UPDATE<br>','<b>C:</b>MODIFY'),('A004','Which SQL statement is used to delete data from a database?<br>','A','<b>A:</b>DROP<br>','<b>B:</b>REMOVE<br>','<b>C:</b>DELETE'),('A005','Which SQL statement is used to insert new data in a database?<br>','A','<b>A:</b>INSERT NEW<br>','<b>B:</b>INSERT INTO<br>','<b>C:</b>ADD RECORD'),('A006','With SQL, how do you select a column named \"FirstName\" from a table named \"Persons\"?<br>','A','<b>A:</b>EXTRACT FristName FROM Persons<br>','<b>B:</b>SELECT Persons.FirestName<br>','<b>C:</b>SELECT FirestName FROM Persons'),('A007','With SQL, how do you select all the columns from a table named \"Persons\"?<br>','A','<b>A:</b>SELECT [ALL] FROM Persons<br>','<b>B:</b>SELECT Persons<br>','<b>C:</b>SELECT * FROM Persons'),('A008','With SQL, how do you select all the records from a table named \"Persons\" where the value of the column \"FirstName\" is \"Peter\"?<br>','A','<b>A:</b>SELECT [ALL] FROM Persons WHERE FirestName = \'Peter\'<br>','<b>B:</b>SELECT [ALL] FROM Persons WHERE FirestName LIKE \'Peter\'<br>','<b>C:</b>SELECT * FROM Persons WHERE FirestName = \'Peter\''),('A009','With SQL, how do you select all the records from a table named \"Persons\" where the value of the column \"FirstName\" starts with an \"a\"?<br>','A','<b>A:</b>SELECT * FROM Persons WHERE FirestName = \'%a%\'<br>','<b>B:</b>SELECT * FROM Persons WHERE FirestName LIKE \'%a\'<br>','<b>C:</b>SELECT * FROM Persons WHERE FirestName LIKE \'a%\''),('A010','The OR operator displays a record if ANY conditions listed are true. The AND operator displays a record if ALL of the conditions listed are true<br>','A','<b>A:</b>TRUE<br>','<b>B:</b>FALSE<br>','<b>C:</b>BOTH');
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz`
--

DROP TABLE IF EXISTS `quiz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quiz` (
  `idQUIZ` varchar(4) NOT NULL,
  `QUIZ` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idQUIZ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz`
--

LOCK TABLES `quiz` WRITE;
/*!40000 ALTER TABLE `quiz` DISABLE KEYS */;
INSERT INTO `quiz` VALUES ('A','SQL');
/*!40000 ALTER TABLE `quiz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `USER_ID` varchar(8) NOT NULL,
  `NAME` varchar(64) DEFAULT NULL,
  `USERNAME` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('QUIZ001','DHRUVA','DHRUVAWARA'),('QUIZ174','sanjeev','sanjeev'),('QUIZ280','ab','ab'),('QUIZ393','dhruva','dhruva'),('QUIZ416','DHRUVAW','DHRUVAW'),('QUIZ596','Unknown','Unknown'),('QUIZ914','','');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'dbms'
--

--
-- Dumping routines for database 'dbms'
--
/*!50003 DROP PROCEDURE IF EXISTS `quiz_types` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `quiz_types`()
BEGIN
SELECT * FROM dbms.quiz;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-19  8:26:51
