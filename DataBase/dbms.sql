CREATE TABLE `users` (
  `USER_ID` varchar(8) NOT NULL,
  `EMAIL` varchar(64) DEFAULT NULL,
  `USERNAME` varchar(64) DEFAULT NULL,
  `PASSWORD` varchar(45) DEFAULT NULL,
  `DOB` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`USER_ID`)
);

CREATE TABLE `admins` (
  `USER_ID` varchar(8) NOT NULL,
  `PASSWORD` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`USER_ID`),
  CONSTRAINT `admins_ibfk_1` FOREIGN KEY (`USER_ID`) REFERENCES `users` (`USER_ID`)
);

CREATE TABLE `quiz` (
  `idQUIZ` varchar(4) NOT NULL,
  `QUIZ` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idQUIZ`)
);

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
);

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
);

CREATE TABLE `time_given` (
  `USER_ID` varchar(45) NOT NULL,
  `time_given` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`USER_ID`),
  CONSTRAINT `USER_ID` FOREIGN KEY (`USER_ID`) REFERENCES `users` (`USER_ID`)
);

CREATE TABLE `user_audit` (
  `user_id` varchar(45) NOT NULL,
  `create_date` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `user_id2` FOREIGN KEY (`user_id`) REFERENCES `users` (`USER_ID`)
);

CREATE TABLE `answers` (
  `Q_ID` varchar(8) NOT NULL,
  `Q_ANSWER` char(2) DEFAULT NULL,
  PRIMARY KEY (`Q_ID`),
  CONSTRAINT `answers_ibfk_1` FOREIGN KEY (`Q_ID`) REFERENCES `questions` (`Q_ID`)
);  

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
);


INSERT INTO `users` VALUES ('asd','sad','asd',NULL,NULL),
('QUIZ001','DHRUVA','DHRUVAWARA',NULL,NULL),
('QUIZ104','dhruvavasanthkumar@gmail.com','DHRUVA','D9986832195d','1998-10-14'),
('QUIZ174','sanjeev','sanjeev',NULL,NULL),
('QUIZ183','a@s.n','','asdASD213','2019-11-05'),
('QUIZ280','ab','ab',NULL,NULL),
('QUIZ314','manoj','manoj',NULL,NULL),
('QUIZ393','dhruva','dhruva',NULL,NULL),
('QUIZ416','DHRUVAW','DHRUVAW',NULL,NULL),
('QUIZ437','abcd@abc.com','abc','abc123ABC','1343-02-23'),
('QUIZ486','asdf','asdf','adfs','daf'),
('QUIZ582','haha','haha',NULL,NULL),
('QUIZ596','Unknown','Unknown',NULL,NULL),
('QUIZ740','acvb@sa.com','uad','Number123','2019-11-04'),
('QUIZ766','abc@abc.com','abc','D9986231dD','2019-11-23'),
('QUIZ914','abc','abc',NULL,NULL);


INSERT INTO `user_audit` VALUES ('asd','2019-11-19 17:51:27'),
('QUIZ104','2019-11-28 23:52:49'),
('QUIZ183','2019-11-29 11:05:05'),
('QUIZ314','2019-11-19 19:48:23'),
('QUIZ437','2019-11-29 09:14:15'),
('QUIZ486','2019-11-29 14:12:44'),
('QUIZ582','2019-11-19 17:56:42'),
('QUIZ740','2019-11-29 13:42:59'),
('QUIZ766','2019-11-29 09:16:38');

INSERT INTO `time_given` VALUES ('QUIZ104','1575011634'),
('QUIZ183',NULL),
('QUIZ437','1574999457'),
('QUIZ486',NULL),
('QUIZ740','1575015861'),
('QUIZ766',NULL);

INSERT INTO `quiz` VALUES ('A','SQL'),
('B','JAVA');

INSERT INTO `answers` VALUES ('A001','A'),
('A002','B'),
('A003','B'),
('A004','C'),
('A005','B'),
('A006','C'),
('A007','C'),
('A008','C'),
('A009','C'),
('A010','A'),
('B001','B'),
('B002','C'),
('B003','A'),
('B004','A'),
('B005','B'),
('B006','B'),
('B007','B'),
('B008','B'),
('B009','A'),
('B010','C');


INSERT INTO `answered_pre_question` VALUES ('QUIZ104','A','A001','1575010024','O','sure'),
('QUIZ104','A','A002','1575010024','O','sure'),
('QUIZ104','A','A003','1575010024','O','sure'),
('QUIZ104','A','A004','1575010024','O','sure'),
('QUIZ104','A','A005','1575010024','O','sure'),
('QUIZ104','A','A006','1575010024','O','sure'),
('QUIZ104','A','A007','1575010024','O','sure'),
('QUIZ104','A','A008','1575010024','O','sure'),
('QUIZ104','A','A009','1575010024','O','sure'),
('QUIZ104','A','A010','1575010024','O','sure'),
('QUIZ104','A','A001','1575010071','O','sure'),
('QUIZ104','A','A002','1575010071','O','sure'),
('QUIZ104','A','A003','1575010071','O','sure'),
('QUIZ104','A','A004','1575010071','O','sure'),
('QUIZ104','A','A005','1575010071','O','sure'),
('QUIZ104','A','A006','1575010071','O','sure'),
('QUIZ104','A','A007','1575010071','O','sure'),
('QUIZ104','A','A008','1575010071','O','sure'),
('QUIZ104','A','A009','1575010071','O','sure'),
('QUIZ104','A','A010','1575010071','O','sure'),
('QUIZ104','A','A001','1575010075','O','sure'),
('QUIZ104','A','A002','1575010075','O','sure'),
('QUIZ104','A','A003','1575010075','O','sure'),
('QUIZ104','A','A004','1575010075','O','sure'),
('QUIZ104','A','A005','1575010075','O','sure'),
('QUIZ104','A','A006','1575010075','O','sure'),
('QUIZ104','A','A007','1575010075','O','sure'),
('QUIZ104','A','A008','1575010075','O','sure'),
('QUIZ104','A','A009','1575010075','O','sure'),
('QUIZ104','A','A010','1575010075','O','sure'),
('QUIZ104','A','A001','1575010093','O','sure'),
('QUIZ104','A','A002','1575010093','O','sure'),
('QUIZ104','A','A003','1575010093','O','sure'),
('QUIZ104','A','A004','1575010093','O','sure'),
('QUIZ104','A','A005','1575010093','O','sure'),
('QUIZ104','A','A006','1575010093','O','sure'),
('QUIZ104','A','A007','1575010093','O','sure'),
('QUIZ104','A','A008','1575010093','O','sure'),
('QUIZ104','A','A009','1575010093','O','sure'),
('QUIZ104','A','A010','1575010093','O','sure'),
('QUIZ104','A','A001','1575010186','O','sure'),
('QUIZ104','A','A002','1575010186','O','sure'),
('QUIZ104','A','A003','1575010186','O','sure'),
('QUIZ104','A','A004','1575010186','O','sure'),
('QUIZ104','A','A005','1575010186','O','sure'),
('QUIZ104','A','A006','1575010186','O','sure'),
('QUIZ104','A','A007','1575010186','O','sure'),
('QUIZ104','A','A008','1575010186','O','sure'),
('QUIZ104','A','A009','1575010186','O','sure'),
('QUIZ104','A','A010','1575010186','O','sure'),
('QUIZ104','A','A001','1575010226','O','sure'),
('QUIZ104','A','A002','1575010226','O','sure'),
('QUIZ104','A','A003','1575010226','O','sure'),
('QUIZ104','A','A004','1575010226','O','sure'),
('QUIZ104','A','A005','1575010226','O','sure'),
('QUIZ104','A','A006','1575010226','O','sure'),
('QUIZ104','A','A007','1575010226','O','sure'),
('QUIZ104','A','A008','1575010226','O','sure'),
('QUIZ104','A','A009','1575010226','O','sure'),
('QUIZ104','A','A010','1575010226','O','sure'),
('QUIZ104','A','A001','1575010257','O','sure'),
('QUIZ104','A','A002','1575010257','O','sure'),
('QUIZ104','A','A003','1575010257','O','sure'),
('QUIZ104','A','A004','1575010257','O','sure'),
('QUIZ104','A','A005','1575010257','O','sure'),
('QUIZ104','A','A006','1575010257','O','sure'),
('QUIZ104','A','A007','1575010257','O','sure'),
('QUIZ104','A','A008','1575010257','O','sure'),
('QUIZ104','A','A009','1575010257','O','sure'),
('QUIZ104','A','A010','1575010257','O','sure'),
('QUIZ104','A','A001','1575010281','O','sure'),
('QUIZ104','A','A002','1575010281','O','sure'),
('QUIZ104','A','A003','1575010281','O','sure'),
('QUIZ104','A','A004','1575010281','O','sure'),
('QUIZ104','A','A005','1575010281','O','sure'),
('QUIZ104','A','A006','1575010281','O','sure'),
('QUIZ104','A','A007','1575010281','O','sure'),
('QUIZ104','A','A008','1575010281','O','sure'),
('QUIZ104','A','A009','1575010281','O','sure'),
('QUIZ104','A','A010','1575010281','O','sure'),
('QUIZ104','A','A001','1575010294','O','sure'),
('QUIZ104','A','A002','1575010294','O','sure'),
('QUIZ104','A','A003','1575010294','O','sure'),
('QUIZ104','A','A004','1575010294','O','sure'),
('QUIZ104','A','A005','1575010294','O','sure'),
('QUIZ104','A','A006','1575010294','O','sure'),
('QUIZ104','A','A007','1575010294','O','sure'),
('QUIZ104','A','A008','1575010294','O','sure'),
('QUIZ104','A','A009','1575010294','O','sure'),
('QUIZ104','A','A010','1575010294','O','sure'),
('QUIZ104','A','A001','1575010403','O','sure'),
('QUIZ104','A','A002','1575010403','O','sure'),
('QUIZ104','A','A003','1575010403','O','sure'),
('QUIZ104','A','A004','1575010403','O','sure'),
('QUIZ104','A','A005','1575010403','O','sure'),
('QUIZ104','A','A006','1575010403','O','sure'),
('QUIZ104','A','A007','1575010403','O','sure'),
('QUIZ104','A','A008','1575010403','O','sure'),
('QUIZ104','A','A009','1575010403','O','sure'),
('QUIZ104','A','A010','1575010403','O','sure'),
('QUIZ104','A','A001','1575010694','O','sure'),
('QUIZ104','A','A002','1575010694','O','sure'),
('QUIZ104','A','A003','1575010694','O','sure'),
('QUIZ104','A','A004','1575010694','O','sure'),
('QUIZ104','A','A005','1575010694','O','sure'),
('QUIZ104','A','A006','1575010694','O','sure'),
('QUIZ104','A','A007','1575010694','O','sure'),
('QUIZ104','A','A008','1575010694','O','sure'),
('QUIZ104','A','A009','1575010694','O','sure'),
('QUIZ104','A','A010','1575010694','O','sure'),
('QUIZ596','B','B001','1574925740','O','sure'),
('QUIZ596','B','B001','1574925840','O','sure'),
('QUIZ596','B','B002','1574925840','O','sure'),
('QUIZ596','B','B003','1574925840','O','sure'),
('QUIZ596','B','B004','1574925840','O','sure'),
('QUIZ596','B','B005','1574925840','O','sure'),
('QUIZ596','B','B006','1574925840','O','sure'),
('QUIZ596','B','B007','1574925840','O','sure'),
('QUIZ596','B','B008','1574925840','O','sure'),
('QUIZ596','B','B009','1574925840','O','sure'),
('QUIZ596','B','B010','1574925840','O','sure'),
('QUIZ596','B','B001','1574968579','O','sure'),
('QUIZ596','B','B002','1574968579','O','sure'),
('QUIZ596','B','B003','1574968579','O','sure'),
('QUIZ596','B','B004','1574968579','O','sure'),
('QUIZ596','B','B005','1574968579','O','sure'),
('QUIZ596','B','B006','1574968579','O','sure'),
('QUIZ596','B','B007','1574968579','O','sure'),
('QUIZ596','B','B008','1574968579','O','sure'),
('QUIZ596','B','B009','1574968579','O','sure'),
('QUIZ596','B','B010','1574968579','O','sure');

INSERT INTO `answered` VALUES ('QUIZ001',4,'A','1573577362',NULL),
('QUIZ001',4,'A','1573579886',NULL),('QUIZ001',4,'A','1573580331',NULL),
('QUIZ416',4,'A','1573581674',NULL),('QUIZ174',1,'A','1573986197',NULL),
('QUIZ914',2,'A','1573989382',NULL),('QUIZ914',2,'A','1573989396',NULL),
('QUIZ914',2,'A','1573989407',NULL),('QUIZ914',2,'A','1573989411',NULL),
('QUIZ914',2,'A','1573989516',NULL),('QUIZ914',2,'A','1573989524',NULL),
('QUIZ914',2,'A','1573989534',NULL),('QUIZ280',2,'A','1573989807',NULL),
('QUIZ280',2,'A','1573989824',NULL),('QUIZ280',2,'A','1573989838',NULL),
('QUIZ280',2,'A','1573989847',NULL),('QUIZ280',2,'A','1573989865',NULL),
('QUIZ914',2,'A','1573990206',NULL),('QUIZ596',2,'A','1573990526',NULL),
('QUIZ596',2,'A','1573991714',NULL),('QUIZ596',2,'A','1573992003',NULL),
('QUIZ393',8,'A','1573992119',NULL),('QUIZ596',2,'A','1574070261',NULL),
('QUIZ596',2,'A','1574081583',NULL),('QUIZ596',1,'A','1574144045',NULL),
('QUIZ596',0,'A','1574144969',NULL),('QUIZ596',0,'A','1574144972',NULL),
('QUIZ596',0,'A','1574144981',NULL),('QUIZ596',4,'A','1574145123',NULL),
('QUIZ596',4,'A','1574145193',NULL),('QUIZ596',4,'A','1574145214',NULL),
('QUIZ596',4,'A','1574145272',NULL),('QUIZ596',0,'A','1574145724',NULL),
('QUIZ596',0,'A','1574146341',NULL),('QUIZ596',1,'A','1574146443',NULL),
('QUIZ596',0,'A','1574152038',NULL),('QUIZ582',0,'A','1574166433',NULL),
('QUIZ596',0,'A','1574173589',NULL),('QUIZ104',0,'A','1575010024',NULL),
('QUIZ104',0,'A','1575010071',NULL),('QUIZ104',0,'A','1575010075',NULL),
('QUIZ104',0,'A','1575010093',NULL),('QUIZ104',0,'A','1575010186',NULL),
('QUIZ104',0,'A','1575010226',NULL),('QUIZ104',0,'A','1575010257',NULL),
('QUIZ104',0,'A','1575010281',NULL),('QUIZ104',0,'A','1575010294',NULL),
('QUIZ104',0,'A','1575010403',NULL),('QUIZ104',0,'A','1575010694',NULL),
('QUIZ596',0,'B','1574173005',NULL),('QUIZ314',9,'B','1574173103',NULL),
('QUIZ596',0,'B','1574922321',NULL),('QUIZ596',0,'B','1574925603',NULL),
('QUIZ596',0,'B','1574925740',NULL),('QUIZ596',0,'B','1574925840',NULL),
('QUIZ596',0,'B','1574968579',NULL);


DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getvaldetails`()
BEGIN
	select USERS.EMAIL,USERS.PASSWORD from USERS WHERE USERS.EMAIL IS NOT null and USERS.PASSWORD is not null;
END ;;
DELIMITER ;


DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `quiz_types`()
BEGIN
SELECT * FROM dbms.quiz;
END ;;
DELIMITER ;