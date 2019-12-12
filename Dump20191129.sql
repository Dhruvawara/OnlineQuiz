
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
  `MARKS` int(11) DEFAULT NULL,
  `idQuiz` varchar(8) NOT NULL,
  `TIMED` varchar(16) NOT NULL,
  `persentage` int(11) DEFAULT NULL,
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
INSERT INTO `answered` VALUES ('QUIZ001',4,'A','1573577362',NULL),('QUIZ001',4,'A','1573579886',NULL),('QUIZ001',4,'A','1573580331',NULL),('QUIZ416',4,'A','1573581674',NULL),('QUIZ174',1,'A','1573986197',NULL),('QUIZ914',2,'A','1573989382',NULL),('QUIZ914',2,'A','1573989396',NULL),('QUIZ914',2,'A','1573989407',NULL),('QUIZ914',2,'A','1573989411',NULL),('QUIZ914',2,'A','1573989516',NULL),('QUIZ914',2,'A','1573989524',NULL),('QUIZ914',2,'A','1573989534',NULL),('QUIZ280',2,'A','1573989807',NULL),('QUIZ280',2,'A','1573989824',NULL),('QUIZ280',2,'A','1573989838',NULL),('QUIZ280',2,'A','1573989847',NULL),('QUIZ280',2,'A','1573989865',NULL),('QUIZ914',2,'A','1573990206',NULL),('QUIZ596',2,'A','1573990526',NULL),('QUIZ596',2,'A','1573991714',NULL),('QUIZ596',2,'A','1573992003',NULL),('QUIZ393',8,'A','1573992119',NULL),('QUIZ596',2,'A','1574070261',NULL),('QUIZ596',2,'A','1574081583',NULL),('QUIZ596',1,'A','1574144045',NULL),('QUIZ596',0,'A','1574144969',NULL),('QUIZ596',0,'A','1574144972',NULL),('QUIZ596',0,'A','1574144981',NULL),('QUIZ596',4,'A','1574145123',NULL),('QUIZ596',4,'A','1574145193',NULL),('QUIZ596',4,'A','1574145214',NULL),('QUIZ596',4,'A','1574145272',NULL),('QUIZ596',0,'A','1574145724',NULL),('QUIZ596',0,'A','1574146341',NULL),('QUIZ596',1,'A','1574146443',NULL),('QUIZ596',0,'A','1574152038',NULL),('QUIZ582',0,'A','1574166433',NULL),('QUIZ596',0,'A','1574173589',NULL),('QUIZ104',0,'A','1575010024',NULL),('QUIZ104',0,'A','1575010071',NULL),('QUIZ104',0,'A','1575010075',NULL),('QUIZ104',0,'A','1575010093',NULL),('QUIZ104',0,'A','1575010186',NULL),('QUIZ104',0,'A','1575010226',NULL),('QUIZ104',0,'A','1575010257',NULL),('QUIZ104',0,'A','1575010281',NULL),('QUIZ104',0,'A','1575010294',NULL),('QUIZ104',0,'A','1575010403',NULL),('QUIZ104',0,'A','1575010694',NULL),('QUIZ596',0,'B','1574173005',NULL),('QUIZ314',9,'B','1574173103',NULL),('QUIZ596',0,'B','1574922321',NULL),('QUIZ596',0,'B','1574925603',NULL),('QUIZ596',0,'B','1574925740',NULL),('QUIZ596',0,'B','1574925840',NULL),('QUIZ596',0,'B','1574968579',NULL);
/*!40000 ALTER TABLE `answered` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `answered_pre_question`
--

DROP TABLE IF EXISTS `answered_pre_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `answered_pre_question` (
  `USER_ID` varchar(45) NOT NULL,
  `idQuiz` varchar(45) NOT NULL,
  `Q_ID` varchar(45) NOT NULL,
  `Time` varchar(45) NOT NULL,
  `Answered` varchar(45) DEFAULT NULL,
  `Certainability` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`USER_ID`,`Time`,`Q_ID`,`idQuiz`),
  KEY `idQuiz_idx` (`idQuiz`),
  KEY `Q_ID_idx` (`Q_ID`),
  CONSTRAINT `Q_ID1` FOREIGN KEY (`Q_ID`) REFERENCES `questions` (`Q_ID`),
  CONSTRAINT `USER_ID1` FOREIGN KEY (`USER_ID`) REFERENCES `users` (`USER_ID`),
  CONSTRAINT `idQuiz1` FOREIGN KEY (`idQuiz`) REFERENCES `quiz` (`idQUIZ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answered_pre_question`
--

LOCK TABLES `answered_pre_question` WRITE;
/*!40000 ALTER TABLE `answered_pre_question` DISABLE KEYS */;
INSERT INTO `answered_pre_question` VALUES ('QUIZ104','A','A001','1575010024','O','sure'),('QUIZ104','A','A002','1575010024','O','sure'),('QUIZ104','A','A003','1575010024','O','sure'),('QUIZ104','A','A004','1575010024','O','sure'),('QUIZ104','A','A005','1575010024','O','sure'),('QUIZ104','A','A006','1575010024','O','sure'),('QUIZ104','A','A007','1575010024','O','sure'),('QUIZ104','A','A008','1575010024','O','sure'),('QUIZ104','A','A009','1575010024','O','sure'),('QUIZ104','A','A010','1575010024','O','sure'),('QUIZ104','A','A001','1575010071','O','sure'),('QUIZ104','A','A002','1575010071','O','sure'),('QUIZ104','A','A003','1575010071','O','sure'),('QUIZ104','A','A004','1575010071','O','sure'),('QUIZ104','A','A005','1575010071','O','sure'),('QUIZ104','A','A006','1575010071','O','sure'),('QUIZ104','A','A007','1575010071','O','sure'),('QUIZ104','A','A008','1575010071','O','sure'),('QUIZ104','A','A009','1575010071','O','sure'),('QUIZ104','A','A010','1575010071','O','sure'),('QUIZ104','A','A001','1575010075','O','sure'),('QUIZ104','A','A002','1575010075','O','sure'),('QUIZ104','A','A003','1575010075','O','sure'),('QUIZ104','A','A004','1575010075','O','sure'),('QUIZ104','A','A005','1575010075','O','sure'),('QUIZ104','A','A006','1575010075','O','sure'),('QUIZ104','A','A007','1575010075','O','sure'),('QUIZ104','A','A008','1575010075','O','sure'),('QUIZ104','A','A009','1575010075','O','sure'),('QUIZ104','A','A010','1575010075','O','sure'),('QUIZ104','A','A001','1575010093','O','sure'),('QUIZ104','A','A002','1575010093','O','sure'),('QUIZ104','A','A003','1575010093','O','sure'),('QUIZ104','A','A004','1575010093','O','sure'),('QUIZ104','A','A005','1575010093','O','sure'),('QUIZ104','A','A006','1575010093','O','sure'),('QUIZ104','A','A007','1575010093','O','sure'),('QUIZ104','A','A008','1575010093','O','sure'),('QUIZ104','A','A009','1575010093','O','sure'),('QUIZ104','A','A010','1575010093','O','sure'),('QUIZ104','A','A001','1575010186','O','sure'),('QUIZ104','A','A002','1575010186','O','sure'),('QUIZ104','A','A003','1575010186','O','sure'),('QUIZ104','A','A004','1575010186','O','sure'),('QUIZ104','A','A005','1575010186','O','sure'),('QUIZ104','A','A006','1575010186','O','sure'),('QUIZ104','A','A007','1575010186','O','sure'),('QUIZ104','A','A008','1575010186','O','sure'),('QUIZ104','A','A009','1575010186','O','sure'),('QUIZ104','A','A010','1575010186','O','sure'),('QUIZ104','A','A001','1575010226','O','sure'),('QUIZ104','A','A002','1575010226','O','sure'),('QUIZ104','A','A003','1575010226','O','sure'),('QUIZ104','A','A004','1575010226','O','sure'),('QUIZ104','A','A005','1575010226','O','sure'),('QUIZ104','A','A006','1575010226','O','sure'),('QUIZ104','A','A007','1575010226','O','sure'),('QUIZ104','A','A008','1575010226','O','sure'),('QUIZ104','A','A009','1575010226','O','sure'),('QUIZ104','A','A010','1575010226','O','sure'),('QUIZ104','A','A001','1575010257','O','sure'),('QUIZ104','A','A002','1575010257','O','sure'),('QUIZ104','A','A003','1575010257','O','sure'),('QUIZ104','A','A004','1575010257','O','sure'),('QUIZ104','A','A005','1575010257','O','sure'),('QUIZ104','A','A006','1575010257','O','sure'),('QUIZ104','A','A007','1575010257','O','sure'),('QUIZ104','A','A008','1575010257','O','sure'),('QUIZ104','A','A009','1575010257','O','sure'),('QUIZ104','A','A010','1575010257','O','sure'),('QUIZ104','A','A001','1575010281','O','sure'),('QUIZ104','A','A002','1575010281','O','sure'),('QUIZ104','A','A003','1575010281','O','sure'),('QUIZ104','A','A004','1575010281','O','sure'),('QUIZ104','A','A005','1575010281','O','sure'),('QUIZ104','A','A006','1575010281','O','sure'),('QUIZ104','A','A007','1575010281','O','sure'),('QUIZ104','A','A008','1575010281','O','sure'),('QUIZ104','A','A009','1575010281','O','sure'),('QUIZ104','A','A010','1575010281','O','sure'),('QUIZ104','A','A001','1575010294','O','sure'),('QUIZ104','A','A002','1575010294','O','sure'),('QUIZ104','A','A003','1575010294','O','sure'),('QUIZ104','A','A004','1575010294','O','sure'),('QUIZ104','A','A005','1575010294','O','sure'),('QUIZ104','A','A006','1575010294','O','sure'),('QUIZ104','A','A007','1575010294','O','sure'),('QUIZ104','A','A008','1575010294','O','sure'),('QUIZ104','A','A009','1575010294','O','sure'),('QUIZ104','A','A010','1575010294','O','sure'),('QUIZ104','A','A001','1575010403','O','sure'),('QUIZ104','A','A002','1575010403','O','sure'),('QUIZ104','A','A003','1575010403','O','sure'),('QUIZ104','A','A004','1575010403','O','sure'),('QUIZ104','A','A005','1575010403','O','sure'),('QUIZ104','A','A006','1575010403','O','sure'),('QUIZ104','A','A007','1575010403','O','sure'),('QUIZ104','A','A008','1575010403','O','sure'),('QUIZ104','A','A009','1575010403','O','sure'),('QUIZ104','A','A010','1575010403','O','sure'),('QUIZ104','A','A001','1575010694','O','sure'),('QUIZ104','A','A002','1575010694','O','sure'),('QUIZ104','A','A003','1575010694','O','sure'),('QUIZ104','A','A004','1575010694','O','sure'),('QUIZ104','A','A005','1575010694','O','sure'),('QUIZ104','A','A006','1575010694','O','sure'),('QUIZ104','A','A007','1575010694','O','sure'),('QUIZ104','A','A008','1575010694','O','sure'),('QUIZ104','A','A009','1575010694','O','sure'),('QUIZ104','A','A010','1575010694','O','sure'),('QUIZ596','B','B001','1574925740','O','sure'),('QUIZ596','B','B001','1574925840','O','sure'),('QUIZ596','B','B002','1574925840','O','sure'),('QUIZ596','B','B003','1574925840','O','sure'),('QUIZ596','B','B004','1574925840','O','sure'),('QUIZ596','B','B005','1574925840','O','sure'),('QUIZ596','B','B006','1574925840','O','sure'),('QUIZ596','B','B007','1574925840','O','sure'),('QUIZ596','B','B008','1574925840','O','sure'),('QUIZ596','B','B009','1574925840','O','sure'),('QUIZ596','B','B010','1574925840','O','sure'),('QUIZ596','B','B001','1574968579','O','sure'),('QUIZ596','B','B002','1574968579','O','sure'),('QUIZ596','B','B003','1574968579','O','sure'),('QUIZ596','B','B004','1574968579','O','sure'),('QUIZ596','B','B005','1574968579','O','sure'),('QUIZ596','B','B006','1574968579','O','sure'),('QUIZ596','B','B007','1574968579','O','sure'),('QUIZ596','B','B008','1574968579','O','sure'),('QUIZ596','B','B009','1574968579','O','sure'),('QUIZ596','B','B010','1574968579','O','sure');
/*!40000 ALTER TABLE `answered_pre_question` ENABLE KEYS */;
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
INSERT INTO `answers` VALUES ('A001','A'),('A002','B'),('A003','B'),('A004','C'),('A005','B'),('A006','C'),('A007','C'),('A008','C'),('A009','C'),('A010','A'),('B001','B'),('B002','C'),('B003','A'),('B004','A'),('B005','B'),('B006','B'),('B007','B'),('B008','B'),('B009','A'),('B010','C');
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
INSERT INTO `questions` VALUES ('A001','What does SQL stands for ','A','Structured Question Langauge','Strong Question Language','Structured Query Language'),('A002','Which SQL statement is used to extract data from a database?','A','SELECT','OPEN','GET'),('A003','Which SQL statement is used to update data in a database?','A','SAVE','UPDATE','MODIFY'),('A004','Which SQL statement is used to delete data from a database?','A','DROP','REMOVE','DELETE'),('A005','Which SQL statement is used to insert new data in a database?','A','INSERT NEW','INSERT INTO','ADD RECORD'),('A006','With SQL, how do you select a column named \"FirstName\" from a table named \"Persons\"?','A','EXTRACT FristName FROM Persons','SELECT Persons.FirestName','SELECT FirestName FROM Persons'),('A007','With SQL, how do you select all the columns from a table named \"Persons\"?','A','SELECT [ALL] FROM Persons','SELECT Persons','SELECT * FROM Persons'),('A008','With SQL, how do you select all the records from a table named \"Persons\" where the value of the column \"FirstName\" is \"Peter\"?','A','SELECT [ALL] FROM Persons WHERE FirestName = \'Peter\'','SELECT [ALL] FROM Persons WHERE FirestName LIKE \'Peter\'','SELECT * FROM Persons WHERE FirestName = \'Peter\''),('A009','With SQL, how do you select all the records from a table named \"Persons\" where the value of the column \"FirstName\" starts with an \"a\"?','A','SELECT * FROM Persons WHERE FirestName = \'%a%\'','SELECT * FROM Persons WHERE FirestName LIKE \'%a\'','SELECT * FROM Persons WHERE FirestName LIKE \'a%\''),('A010','The OR operator displays a record if ANY conditions listed are true. The AND operator displays a record if ALL of the conditions listed are true','A','TRUE','FALSE','BOTH'),('B001','What of the following is the default value of an instance variable?','B','null','Depends upon the type of variable','0'),('B002','What is the size of long variable?','B','16 bit','32 bit','64 bit'),('B003','Which of the following is true about private access modifier?','B','Variables, methods and constructors which are declared private can be accessed only by the members of the same class.','Variables, methods and constructors which are declared private can be accessed by any class lying in same package.','Variables, methods and constructors which are declared private in the superclass can be accessed only by its child class.'),('B004','What is class variable?','B','class variables are static variables within a class but outside any method.',' class variables are variables defined inside methods, constructors or blocks.','class variables are variables within a class but outside any method.'),('B005','What is function overriding?','B','If a subclass uses a method that is already provided by its parent class, it is known as Method Overriding.','If a subclass provides a specific implementation of a method that is already provided by its parent class, it is known as Method Overriding.','Both of the above.'),('B006','What is Serialization?','B','Serialization is the process of writing the state of an object to another object.','Serialization is the process of writing the state of an object to a byte stream.','Both of the above.'),('B007','Which of the following is a thread safe?','B','StringBuilder','StringBuffer','Both of the above'),('B008','Is it necessary that each try block must be followed by a catch block?','B','TRUE','FALSE','Noon of above'),('B009','What is the default value of short variable?','B','0','0.0','null'),('B010','What is static block?','B','It is used to create syncronized code.','There is no such block.','It is used to initialize the static data member., It is excuted before main method at the time of class loading.');
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
INSERT INTO `quiz` VALUES ('A','SQL'),('B','JAVA');
/*!40000 ALTER TABLE `quiz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_given`
--

DROP TABLE IF EXISTS `time_given`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `time_given` (
  `USER_ID` varchar(45) NOT NULL,
  `time_given` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`USER_ID`),
  CONSTRAINT `USER_ID` FOREIGN KEY (`USER_ID`) REFERENCES `users` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_given`
--

LOCK TABLES `time_given` WRITE;
/*!40000 ALTER TABLE `time_given` DISABLE KEYS */;
INSERT INTO `time_given` VALUES ('QUIZ104','1575011634'),('QUIZ183',NULL),('QUIZ437','1574999457'),('QUIZ486',NULL),('QUIZ740','1575015861'),('QUIZ766',NULL);
/*!40000 ALTER TABLE `time_given` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_audit`
--

DROP TABLE IF EXISTS `user_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_audit` (
  `user_id` varchar(45) NOT NULL,
  `create_date` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `user_id2` FOREIGN KEY (`user_id`) REFERENCES `users` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_audit`
--

LOCK TABLES `user_audit` WRITE;
/*!40000 ALTER TABLE `user_audit` DISABLE KEYS */;
INSERT INTO `user_audit` VALUES ('asd','2019-11-19 17:51:27'),('QUIZ104','2019-11-28 23:52:49'),('QUIZ183','2019-11-29 11:05:05'),('QUIZ314','2019-11-19 19:48:23'),('QUIZ437','2019-11-29 09:14:15'),('QUIZ486','2019-11-29 14:12:44'),('QUIZ582','2019-11-19 17:56:42'),('QUIZ740','2019-11-29 13:42:59'),('QUIZ766','2019-11-29 09:16:38');
/*!40000 ALTER TABLE `user_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `USER_ID` varchar(8) NOT NULL,
  `EMAIL` varchar(64) DEFAULT NULL,
  `USERNAME` varchar(64) DEFAULT NULL,
  `PASSWORD` varchar(45) DEFAULT NULL,
  `DOB` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('asd','sad','asd',NULL,NULL),('QUIZ001','DHRUVA','DHRUVAWARA',NULL,NULL),('QUIZ104','dhruvavasanthkumar@gmail.com','DHRUVA','D9986832195d','1998-10-14'),('QUIZ174','sanjeev','sanjeev',NULL,NULL),('QUIZ183','a@s.n','','asdASD213','2019-11-05'),('QUIZ280','ab','ab',NULL,NULL),('QUIZ314','manoj','manoj',NULL,NULL),('QUIZ393','dhruva','dhruva',NULL,NULL),('QUIZ416','DHRUVAW','DHRUVAW',NULL,NULL),('QUIZ437','abcd@abc.com','abc','abc123ABC','1343-02-23'),('QUIZ486','asdf','asdf','adfs','daf'),('QUIZ582','haha','haha',NULL,NULL),('QUIZ596','Unknown','Unknown',NULL,NULL),('QUIZ740','acvb@sa.com','uad','Number123','2019-11-04'),('QUIZ766','abc@abc.com','abc','D9986231dD','2019-11-23'),('QUIZ914','abc','abc',NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `users_AFTER_INSERT` AFTER INSERT ON `users` FOR EACH ROW BEGIN
	insert into user_audit values(new.user_id,sysdate());
    insert into dbms.time_given values(new.USER_ID,null);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'dbms'
--

--
-- Dumping routines for database 'dbms'
--
/*!50003 DROP PROCEDURE IF EXISTS `getvaldetails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getvaldetails`()
BEGIN
	select USERS.EMAIL,USERS.PASSWORD from USERS WHERE USERS.EMAIL IS NOT null and USERS.PASSWORD is not null;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
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

-- Dump completed on 2019-11-29 18:29:59
