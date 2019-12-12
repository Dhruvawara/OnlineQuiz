-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 30, 2019 at 12:26 AM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbms`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `getvaldetails` ()  BEGIN
select USERS.EMAIL,USERS.PASSWORD from USERS WHERE USERS.EMAIL IS NOT null and USERS.PASSWORD is not null;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `quiz_types` ()  BEGIN
SELECT * FROM dbms.quiz;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `USER_ID` varchar(8) NOT NULL,
  `PASSWORD` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `answered`
--

CREATE TABLE `answered` (
  `USER_ID` varchar(8) DEFAULT NULL,
  `MARKS` int(11) DEFAULT NULL,
  `idQuiz` varchar(8) NOT NULL,
  `TIMED` varchar(16) NOT NULL,
  `persentage` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `answered`
--

INSERT INTO `answered` (`USER_ID`, `MARKS`, `idQuiz`, `TIMED`, `persentage`) VALUES
('QUIZ001', 4, 'A', '1573577362', NULL),
('QUIZ001', 4, 'A', '1573579886', NULL),
('QUIZ001', 4, 'A', '1573580331', NULL),
('QUIZ416', 4, 'A', '1573581674', NULL),
('QUIZ174', 1, 'A', '1573986197', NULL),
('QUIZ914', 2, 'A', '1573989382', NULL),
('QUIZ914', 2, 'A', '1573989396', NULL),
('QUIZ914', 2, 'A', '1573989407', NULL),
('QUIZ914', 2, 'A', '1573989411', NULL),
('QUIZ914', 2, 'A', '1573989516', NULL),
('QUIZ914', 2, 'A', '1573989524', NULL),
('QUIZ914', 2, 'A', '1573989534', NULL),
('QUIZ280', 2, 'A', '1573989807', NULL),
('QUIZ280', 2, 'A', '1573989824', NULL),
('QUIZ280', 2, 'A', '1573989838', NULL),
('QUIZ280', 2, 'A', '1573989847', NULL),
('QUIZ280', 2, 'A', '1573989865', NULL),
('QUIZ914', 2, 'A', '1573990206', NULL),
('QUIZ596', 2, 'A', '1573990526', NULL),
('QUIZ596', 2, 'A', '1573991714', NULL),
('QUIZ596', 2, 'A', '1573992003', NULL),
('QUIZ393', 8, 'A', '1573992119', NULL),
('QUIZ596', 2, 'A', '1574070261', NULL),
('QUIZ596', 2, 'A', '1574081583', NULL),
('QUIZ596', 1, 'A', '1574144045', NULL),
('QUIZ596', 0, 'A', '1574144969', NULL),
('QUIZ596', 0, 'A', '1574144972', NULL),
('QUIZ596', 0, 'A', '1574144981', NULL),
('QUIZ596', 4, 'A', '1574145123', NULL),
('QUIZ596', 4, 'A', '1574145193', NULL),
('QUIZ596', 4, 'A', '1574145214', NULL),
('QUIZ596', 4, 'A', '1574145272', NULL),
('QUIZ596', 0, 'A', '1574145724', NULL),
('QUIZ596', 0, 'A', '1574146341', NULL),
('QUIZ596', 1, 'A', '1574146443', NULL),
('QUIZ596', 0, 'A', '1574152038', NULL),
('QUIZ582', 0, 'A', '1574166433', NULL),
('QUIZ596', 0, 'A', '1574173589', NULL),
('QUIZ104', 0, 'A', '1575010024', NULL),
('QUIZ104', 0, 'A', '1575010071', NULL),
('QUIZ104', 0, 'A', '1575010075', NULL),
('QUIZ104', 0, 'A', '1575010093', NULL),
('QUIZ104', 0, 'A', '1575010186', NULL),
('QUIZ104', 0, 'A', '1575010226', NULL),
('QUIZ104', 0, 'A', '1575010257', NULL),
('QUIZ104', 0, 'A', '1575010281', NULL),
('QUIZ104', 0, 'A', '1575010294', NULL),
('QUIZ104', 0, 'A', '1575010403', NULL),
('QUIZ104', 0, 'A', '1575010694', NULL),
('QUIZ596', 0, 'B', '1574173005', NULL),
('QUIZ314', 9, 'B', '1574173103', NULL),
('QUIZ596', 0, 'B', '1574922321', NULL),
('QUIZ596', 0, 'B', '1574925603', NULL),
('QUIZ596', 0, 'B', '1574925740', NULL),
('QUIZ596', 0, 'B', '1574925840', NULL),
('QUIZ596', 0, 'B', '1574968579', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `answered_pre_question`
--

CREATE TABLE `answered_pre_question` (
  `USER_ID` varchar(45) NOT NULL,
  `idQuiz` varchar(45) NOT NULL,
  `Q_ID` varchar(45) NOT NULL,
  `Time` varchar(45) NOT NULL,
  `Answered` varchar(45) DEFAULT NULL,
  `Certainability` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `answered_pre_question`
--

INSERT INTO `answered_pre_question` (`USER_ID`, `idQuiz`, `Q_ID`, `Time`, `Answered`, `Certainability`) VALUES
('QUIZ104', 'A', 'A001', '1575010024', 'O', 'sure'),
('QUIZ104', 'A', 'A002', '1575010024', 'O', 'sure'),
('QUIZ104', 'A', 'A003', '1575010024', 'O', 'sure'),
('QUIZ104', 'A', 'A004', '1575010024', 'O', 'sure'),
('QUIZ104', 'A', 'A005', '1575010024', 'O', 'sure'),
('QUIZ104', 'A', 'A006', '1575010024', 'O', 'sure'),
('QUIZ104', 'A', 'A007', '1575010024', 'O', 'sure'),
('QUIZ104', 'A', 'A008', '1575010024', 'O', 'sure'),
('QUIZ104', 'A', 'A009', '1575010024', 'O', 'sure'),
('QUIZ104', 'A', 'A010', '1575010024', 'O', 'sure'),
('QUIZ104', 'A', 'A001', '1575010071', 'O', 'sure'),
('QUIZ104', 'A', 'A002', '1575010071', 'O', 'sure'),
('QUIZ104', 'A', 'A003', '1575010071', 'O', 'sure'),
('QUIZ104', 'A', 'A004', '1575010071', 'O', 'sure'),
('QUIZ104', 'A', 'A005', '1575010071', 'O', 'sure'),
('QUIZ104', 'A', 'A006', '1575010071', 'O', 'sure'),
('QUIZ104', 'A', 'A007', '1575010071', 'O', 'sure'),
('QUIZ104', 'A', 'A008', '1575010071', 'O', 'sure'),
('QUIZ104', 'A', 'A009', '1575010071', 'O', 'sure'),
('QUIZ104', 'A', 'A010', '1575010071', 'O', 'sure'),
('QUIZ104', 'A', 'A001', '1575010075', 'O', 'sure'),
('QUIZ104', 'A', 'A002', '1575010075', 'O', 'sure'),
('QUIZ104', 'A', 'A003', '1575010075', 'O', 'sure'),
('QUIZ104', 'A', 'A004', '1575010075', 'O', 'sure'),
('QUIZ104', 'A', 'A005', '1575010075', 'O', 'sure'),
('QUIZ104', 'A', 'A006', '1575010075', 'O', 'sure'),
('QUIZ104', 'A', 'A007', '1575010075', 'O', 'sure'),
('QUIZ104', 'A', 'A008', '1575010075', 'O', 'sure'),
('QUIZ104', 'A', 'A009', '1575010075', 'O', 'sure'),
('QUIZ104', 'A', 'A010', '1575010075', 'O', 'sure'),
('QUIZ104', 'A', 'A001', '1575010093', 'O', 'sure'),
('QUIZ104', 'A', 'A002', '1575010093', 'O', 'sure'),
('QUIZ104', 'A', 'A003', '1575010093', 'O', 'sure'),
('QUIZ104', 'A', 'A004', '1575010093', 'O', 'sure'),
('QUIZ104', 'A', 'A005', '1575010093', 'O', 'sure'),
('QUIZ104', 'A', 'A006', '1575010093', 'O', 'sure'),
('QUIZ104', 'A', 'A007', '1575010093', 'O', 'sure'),
('QUIZ104', 'A', 'A008', '1575010093', 'O', 'sure'),
('QUIZ104', 'A', 'A009', '1575010093', 'O', 'sure'),
('QUIZ104', 'A', 'A010', '1575010093', 'O', 'sure'),
('QUIZ104', 'A', 'A001', '1575010186', 'O', 'sure'),
('QUIZ104', 'A', 'A002', '1575010186', 'O', 'sure'),
('QUIZ104', 'A', 'A003', '1575010186', 'O', 'sure'),
('QUIZ104', 'A', 'A004', '1575010186', 'O', 'sure'),
('QUIZ104', 'A', 'A005', '1575010186', 'O', 'sure'),
('QUIZ104', 'A', 'A006', '1575010186', 'O', 'sure'),
('QUIZ104', 'A', 'A007', '1575010186', 'O', 'sure'),
('QUIZ104', 'A', 'A008', '1575010186', 'O', 'sure'),
('QUIZ104', 'A', 'A009', '1575010186', 'O', 'sure'),
('QUIZ104', 'A', 'A010', '1575010186', 'O', 'sure'),
('QUIZ104', 'A', 'A001', '1575010226', 'O', 'sure'),
('QUIZ104', 'A', 'A002', '1575010226', 'O', 'sure'),
('QUIZ104', 'A', 'A003', '1575010226', 'O', 'sure'),
('QUIZ104', 'A', 'A004', '1575010226', 'O', 'sure'),
('QUIZ104', 'A', 'A005', '1575010226', 'O', 'sure'),
('QUIZ104', 'A', 'A006', '1575010226', 'O', 'sure'),
('QUIZ104', 'A', 'A007', '1575010226', 'O', 'sure'),
('QUIZ104', 'A', 'A008', '1575010226', 'O', 'sure'),
('QUIZ104', 'A', 'A009', '1575010226', 'O', 'sure'),
('QUIZ104', 'A', 'A010', '1575010226', 'O', 'sure'),
('QUIZ104', 'A', 'A001', '1575010257', 'O', 'sure'),
('QUIZ104', 'A', 'A002', '1575010257', 'O', 'sure'),
('QUIZ104', 'A', 'A003', '1575010257', 'O', 'sure'),
('QUIZ104', 'A', 'A004', '1575010257', 'O', 'sure'),
('QUIZ104', 'A', 'A005', '1575010257', 'O', 'sure'),
('QUIZ104', 'A', 'A006', '1575010257', 'O', 'sure'),
('QUIZ104', 'A', 'A007', '1575010257', 'O', 'sure'),
('QUIZ104', 'A', 'A008', '1575010257', 'O', 'sure'),
('QUIZ104', 'A', 'A009', '1575010257', 'O', 'sure'),
('QUIZ104', 'A', 'A010', '1575010257', 'O', 'sure'),
('QUIZ104', 'A', 'A001', '1575010281', 'O', 'sure'),
('QUIZ104', 'A', 'A002', '1575010281', 'O', 'sure'),
('QUIZ104', 'A', 'A003', '1575010281', 'O', 'sure'),
('QUIZ104', 'A', 'A004', '1575010281', 'O', 'sure'),
('QUIZ104', 'A', 'A005', '1575010281', 'O', 'sure'),
('QUIZ104', 'A', 'A006', '1575010281', 'O', 'sure'),
('QUIZ104', 'A', 'A007', '1575010281', 'O', 'sure'),
('QUIZ104', 'A', 'A008', '1575010281', 'O', 'sure'),
('QUIZ104', 'A', 'A009', '1575010281', 'O', 'sure'),
('QUIZ104', 'A', 'A010', '1575010281', 'O', 'sure'),
('QUIZ104', 'A', 'A001', '1575010294', 'O', 'sure'),
('QUIZ104', 'A', 'A002', '1575010294', 'O', 'sure'),
('QUIZ104', 'A', 'A003', '1575010294', 'O', 'sure'),
('QUIZ104', 'A', 'A004', '1575010294', 'O', 'sure'),
('QUIZ104', 'A', 'A005', '1575010294', 'O', 'sure'),
('QUIZ104', 'A', 'A006', '1575010294', 'O', 'sure'),
('QUIZ104', 'A', 'A007', '1575010294', 'O', 'sure'),
('QUIZ104', 'A', 'A008', '1575010294', 'O', 'sure'),
('QUIZ104', 'A', 'A009', '1575010294', 'O', 'sure'),
('QUIZ104', 'A', 'A010', '1575010294', 'O', 'sure'),
('QUIZ104', 'A', 'A001', '1575010403', 'O', 'sure'),
('QUIZ104', 'A', 'A002', '1575010403', 'O', 'sure'),
('QUIZ104', 'A', 'A003', '1575010403', 'O', 'sure'),
('QUIZ104', 'A', 'A004', '1575010403', 'O', 'sure'),
('QUIZ104', 'A', 'A005', '1575010403', 'O', 'sure'),
('QUIZ104', 'A', 'A006', '1575010403', 'O', 'sure'),
('QUIZ104', 'A', 'A007', '1575010403', 'O', 'sure'),
('QUIZ104', 'A', 'A008', '1575010403', 'O', 'sure'),
('QUIZ104', 'A', 'A009', '1575010403', 'O', 'sure'),
('QUIZ104', 'A', 'A010', '1575010403', 'O', 'sure'),
('QUIZ104', 'A', 'A001', '1575010694', 'O', 'sure'),
('QUIZ104', 'A', 'A002', '1575010694', 'O', 'sure'),
('QUIZ104', 'A', 'A003', '1575010694', 'O', 'sure'),
('QUIZ104', 'A', 'A004', '1575010694', 'O', 'sure'),
('QUIZ104', 'A', 'A005', '1575010694', 'O', 'sure'),
('QUIZ104', 'A', 'A006', '1575010694', 'O', 'sure'),
('QUIZ104', 'A', 'A007', '1575010694', 'O', 'sure'),
('QUIZ104', 'A', 'A008', '1575010694', 'O', 'sure'),
('QUIZ104', 'A', 'A009', '1575010694', 'O', 'sure'),
('QUIZ104', 'A', 'A010', '1575010694', 'O', 'sure'),
('QUIZ596', 'B', 'B001', '1574925740', 'O', 'sure'),
('QUIZ596', 'B', 'B001', '1574925840', 'O', 'sure'),
('QUIZ596', 'B', 'B002', '1574925840', 'O', 'sure'),
('QUIZ596', 'B', 'B003', '1574925840', 'O', 'sure'),
('QUIZ596', 'B', 'B004', '1574925840', 'O', 'sure'),
('QUIZ596', 'B', 'B005', '1574925840', 'O', 'sure'),
('QUIZ596', 'B', 'B006', '1574925840', 'O', 'sure'),
('QUIZ596', 'B', 'B007', '1574925840', 'O', 'sure'),
('QUIZ596', 'B', 'B008', '1574925840', 'O', 'sure'),
('QUIZ596', 'B', 'B009', '1574925840', 'O', 'sure'),
('QUIZ596', 'B', 'B010', '1574925840', 'O', 'sure'),
('QUIZ596', 'B', 'B001', '1574968579', 'O', 'sure'),
('QUIZ596', 'B', 'B002', '1574968579', 'O', 'sure'),
('QUIZ596', 'B', 'B003', '1574968579', 'O', 'sure'),
('QUIZ596', 'B', 'B004', '1574968579', 'O', 'sure'),
('QUIZ596', 'B', 'B005', '1574968579', 'O', 'sure'),
('QUIZ596', 'B', 'B006', '1574968579', 'O', 'sure'),
('QUIZ596', 'B', 'B007', '1574968579', 'O', 'sure'),
('QUIZ596', 'B', 'B008', '1574968579', 'O', 'sure'),
('QUIZ596', 'B', 'B009', '1574968579', 'O', 'sure'),
('QUIZ596', 'B', 'B010', '1574968579', 'O', 'sure');

-- --------------------------------------------------------

--
-- Table structure for table `answers`
--

CREATE TABLE `answers` (
  `Q_ID` varchar(8) NOT NULL,
  `Q_ANSWER` char(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `answers`
--

INSERT INTO `answers` (`Q_ID`, `Q_ANSWER`) VALUES
('A001', 'A'),
('A002', 'B'),
('A003', 'B'),
('A004', 'C'),
('A005', 'B'),
('A006', 'C'),
('A007', 'C'),
('A008', 'C'),
('A009', 'C'),
('A010', 'A'),
('B001', 'B'),
('B002', 'C'),
('B003', 'A'),
('B004', 'A'),
('B005', 'B'),
('B006', 'B'),
('B007', 'B'),
('B008', 'B'),
('B009', 'A'),
('B010', 'C');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `Q_ID` varchar(8) NOT NULL,
  `QUESTION` text DEFAULT NULL,
  `idQUIZ` varchar(45) DEFAULT NULL,
  `optionA` varchar(445) DEFAULT NULL,
  `optionB` varchar(445) DEFAULT NULL,
  `optionC` varchar(445) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`Q_ID`, `QUESTION`, `idQUIZ`, `optionA`, `optionB`, `optionC`) VALUES
('A001', 'What does SQL stands for ', 'A', 'Structured Question Langauge', 'Strong Question Language', 'Structured Query Language'),
('A002', 'Which SQL statement is used to extract data from a database?', 'A', 'SELECT', 'OPEN', 'GET'),
('A003', 'Which SQL statement is used to update data in a database?', 'A', 'SAVE', 'UPDATE', 'MODIFY'),
('A004', 'Which SQL statement is used to delete data from a database?', 'A', 'DROP', 'REMOVE', 'DELETE'),
('A005', 'Which SQL statement is used to insert new data in a database?', 'A', 'INSERT NEW', 'INSERT INTO', 'ADD RECORD'),
('A006', 'With SQL, how do you select a column named \"FirstName\" from a table named \"Persons\"?', 'A', 'EXTRACT FristName FROM Persons', 'SELECT Persons.FirestName', 'SELECT FirestName FROM Persons'),
('A007', 'With SQL, how do you select all the columns from a table named \"Persons\"?', 'A', 'SELECT [ALL] FROM Persons', 'SELECT Persons', 'SELECT * FROM Persons'),
('A008', 'With SQL, how do you select all the records from a table named \"Persons\" where the value of the column \"FirstName\" is \"Peter\"?', 'A', 'SELECT [ALL] FROM Persons WHERE FirestName = \'Peter\'', 'SELECT [ALL] FROM Persons WHERE FirestName LIKE \'Peter\'', 'SELECT * FROM Persons WHERE FirestName = \'Peter\''),
('A009', 'With SQL, how do you select all the records from a table named \"Persons\" where the value of the column \"FirstName\" starts with an \"a\"?', 'A', 'SELECT * FROM Persons WHERE FirestName = \'%a%\'', 'SELECT * FROM Persons WHERE FirestName LIKE \'%a\'', 'SELECT * FROM Persons WHERE FirestName LIKE \'a%\''),
('A010', 'The OR operator displays a record if ANY conditions listed are true. The AND operator displays a record if ALL of the conditions listed are true', 'A', 'TRUE', 'FALSE', 'BOTH'),
('B001', 'What of the following is the default value of an instance variable?', 'B', 'null', 'Depends upon the type of variable', '0'),
('B002', 'What is the size of long variable?', 'B', '16 bit', '32 bit', '64 bit'),
('B003', 'Which of the following is true about private access modifier?', 'B', 'Variables, methods and constructors which are declared private can be accessed only by the members of the same class.', 'Variables, methods and constructors which are declared private can be accessed by any class lying in same package.', 'Variables, methods and constructors which are declared private in the superclass can be accessed only by its child class.'),
('B004', 'What is class variable?', 'B', 'class variables are static variables within a class but outside any method.', ' class variables are variables defined inside methods, constructors or blocks.', 'class variables are variables within a class but outside any method.'),
('B005', 'What is function overriding?', 'B', 'If a subclass uses a method that is already provided by its parent class, it is known as Method Overriding.', 'If a subclass provides a specific implementation of a method that is already provided by its parent class, it is known as Method Overriding.', 'Both of the above.'),
('B006', 'What is Serialization?', 'B', 'Serialization is the process of writing the state of an object to another object.', 'Serialization is the process of writing the state of an object to a byte stream.', 'Both of the above.'),
('B007', 'Which of the following is a thread safe?', 'B', 'StringBuilder', 'StringBuffer', 'Both of the above'),
('B008', 'Is it necessary that each try block must be followed by a catch block?', 'B', 'TRUE', 'FALSE', 'Noon of above'),
('B009', 'What is the default value of short variable?', 'B', '0', '0.0', 'null'),
('B010', 'What is static block?', 'B', 'It is used to create syncronized code.', 'There is no such block.', 'It is used to initialize the static data member., It is excuted before main method at the time of class loading.');

-- --------------------------------------------------------

--
-- Table structure for table `quiz`
--

CREATE TABLE `quiz` (
  `idQUIZ` varchar(4) NOT NULL,
  `QUIZ` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `quiz`
--

INSERT INTO `quiz` (`idQUIZ`, `QUIZ`) VALUES
('A', 'SQL'),
('B', 'JAVA');

-- --------------------------------------------------------

--
-- Table structure for table `time_given`
--

CREATE TABLE `time_given` (
  `USER_ID` varchar(45) NOT NULL,
  `time_given` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `time_given`
--

INSERT INTO `time_given` (`USER_ID`, `time_given`) VALUES
('QUIZ104', '1575011634'),
('QUIZ183', NULL),
('QUIZ437', '1574999457'),
('QUIZ486', NULL),
('QUIZ740', '1575015861'),
('QUIZ766', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `USER_ID` varchar(8) NOT NULL,
  `EMAIL` varchar(64) DEFAULT NULL,
  `USERNAME` varchar(64) DEFAULT NULL,
  `PASSWORD` varchar(45) DEFAULT NULL,
  `DOB` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`USER_ID`, `EMAIL`, `USERNAME`, `PASSWORD`, `DOB`) VALUES
('asd', 'sad', 'asd', NULL, NULL),
('QUIZ001', 'DHRUVA', 'DHRUVAWARA', NULL, NULL),
('QUIZ104', 'dhruvavasanthkumar@gmail.com', 'DHRUVA', 'D9986832195d', '1998-10-14'),
('QUIZ174', 'sanjeev', 'sanjeev', NULL, NULL),
('QUIZ183', 'a@s.n', '', 'asdASD213', '2019-11-05'),
('QUIZ192', '123@123.123', '123', 'Number123', '2019-11-04'),
('QUIZ280', 'ab', 'ab', NULL, NULL),
('QUIZ314', 'manoj', 'manoj', NULL, NULL),
('QUIZ393', 'dhruva', 'dhruva', NULL, NULL),
('QUIZ416', 'DHRUVAW', 'DHRUVAW', NULL, NULL),
('QUIZ437', 'abcd@abc.com', 'abc', 'abc123ABC', '1343-02-23'),
('QUIZ486', 'asdf', 'asdf', 'adfs', 'daf'),
('QUIZ582', 'haha', 'haha', NULL, NULL),
('QUIZ596', 'Unknown', 'Unknown', NULL, NULL),
('QUIZ740', 'acvb@sa.com', 'uad', 'Number123', '2019-11-04'),
('QUIZ766', 'abc@abc.com', 'abc', 'D9986231dD', '2019-11-23'),
('QUIZ914', 'abc', 'abc', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_audit`
--

CREATE TABLE `user_audit` (
  `user_id` varchar(45) NOT NULL,
  `create_date` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_audit`
--

INSERT INTO `user_audit` (`user_id`, `create_date`) VALUES
('asd', '2019-11-19 17:51:27'),
('QUIZ104', '2019-11-28 23:52:49'),
('QUIZ183', '2019-11-29 11:05:05'),
('QUIZ314', '2019-11-19 19:48:23'),
('QUIZ437', '2019-11-29 09:14:15'),
('QUIZ486', '2019-11-29 14:12:44'),
('QUIZ582', '2019-11-19 17:56:42'),
('QUIZ740', '2019-11-29 13:42:59'),
('QUIZ766', '2019-11-29 09:16:38');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`USER_ID`);

--
-- Indexes for table `answered`
--
ALTER TABLE `answered`
  ADD PRIMARY KEY (`idQuiz`,`TIMED`),
  ADD KEY `USER_ID` (`USER_ID`);

--
-- Indexes for table `answered_pre_question`
--
ALTER TABLE `answered_pre_question`
  ADD PRIMARY KEY (`USER_ID`,`Time`,`Q_ID`,`idQuiz`),
  ADD KEY `idQuiz_idx` (`idQuiz`),
  ADD KEY `Q_ID_idx` (`Q_ID`);

--
-- Indexes for table `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`Q_ID`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`Q_ID`),
  ADD KEY `idquiz_idx` (`idQUIZ`);

--
-- Indexes for table `quiz`
--
ALTER TABLE `quiz`
  ADD PRIMARY KEY (`idQUIZ`);

--
-- Indexes for table `time_given`
--
ALTER TABLE `time_given`
  ADD PRIMARY KEY (`USER_ID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`USER_ID`);

--
-- Indexes for table `user_audit`
--
ALTER TABLE `user_audit`
  ADD PRIMARY KEY (`user_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admins`
--
ALTER TABLE `admins`
  ADD CONSTRAINT `admins_ibfk_1` FOREIGN KEY (`USER_ID`) REFERENCES `users` (`USER_ID`);

--
-- Constraints for table `answered`
--
ALTER TABLE `answered`
  ADD CONSTRAINT `answered_ibfk_2` FOREIGN KEY (`USER_ID`) REFERENCES `users` (`USER_ID`),
  ADD CONSTRAINT `qui` FOREIGN KEY (`idQuiz`) REFERENCES `quiz` (`idQUIZ`);

--
-- Constraints for table `answered_pre_question`
--
ALTER TABLE `answered_pre_question`
  ADD CONSTRAINT `Q_ID1` FOREIGN KEY (`Q_ID`) REFERENCES `questions` (`Q_ID`),
  ADD CONSTRAINT `USER_ID1` FOREIGN KEY (`USER_ID`) REFERENCES `users` (`USER_ID`),
  ADD CONSTRAINT `idQuiz1` FOREIGN KEY (`idQuiz`) REFERENCES `quiz` (`idQUIZ`);

--
-- Constraints for table `answers`
--
ALTER TABLE `answers`
  ADD CONSTRAINT `answers_ibfk_1` FOREIGN KEY (`Q_ID`) REFERENCES `questions` (`Q_ID`);

--
-- Constraints for table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `idquiz` FOREIGN KEY (`idQUIZ`) REFERENCES `quiz` (`idQUIZ`);

--
-- Constraints for table `time_given`
--
ALTER TABLE `time_given`
  ADD CONSTRAINT `USER_ID` FOREIGN KEY (`USER_ID`) REFERENCES `users` (`USER_ID`);

--
-- Constraints for table `user_audit`
--
ALTER TABLE `user_audit`
  ADD CONSTRAINT `user_id2` FOREIGN KEY (`user_id`) REFERENCES `users` (`USER_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
