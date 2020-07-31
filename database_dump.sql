-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: amusementpark
-- ------------------------------------------------------
-- Server version	8.0.18

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking` (
  `booking_id` int(11) NOT NULL,
  `qty` int(11) DEFAULT NULL,
  `cost` decimal(10,0) DEFAULT NULL,
  `total_cost` decimal(10,0) DEFAULT NULL,
  `customer_` int(11) DEFAULT NULL,
  PRIMARY KEY (`booking_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` VALUES (6,1,80,80,23),(7,2,80,160,9),(8,1,80,80,10),(9,2,80,160,12),(10,3,80,240,13),(11,1,80,80,20),(22,9,80,720,22),(98,1,80,80,98),(99,7,80,560,999),(150,2,160,320,149),(333,20,80,1600,333),(543,1,80,80,543),(555,5,80,400,555),(666,7,80,560,666),(876,1,80,80,876);
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `booking_cost` BEFORE INSERT ON `booking` FOR EACH ROW set new.total_cost=new.qty*new.cost */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `time_trig` BEFORE INSERT ON `booking` FOR EACH ROW call time_proc(new.booking_id,now()) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `booking_time`
--

DROP TABLE IF EXISTS `booking_time`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking_time` (
  `booking_id` int(11) DEFAULT NULL,
  `booking_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_time`
--

LOCK TABLES `booking_time` WRITE;
/*!40000 ALTER TABLE `booking_time` DISABLE KEYS */;
INSERT INTO `booking_time` VALUES (333,'2019-12-06 17:29:15'),(99,'2019-12-06 17:31:10'),(555,'2019-12-06 17:51:59'),(876,'2019-12-07 03:27:41'),(543,'2019-12-07 03:38:20'),(98,'2019-12-07 03:39:56'),(666,'2019-12-07 10:14:35'),(150,'2020-07-03 08:10:44');
/*!40000 ALTER TABLE `booking_time` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `customer_fn` varchar(20) DEFAULT NULL,
  `customer_ln` varchar(20) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `email_id` varchar(40) DEFAULT NULL,
  `phone_number` int(11) DEFAULT NULL,
  `customer_in` date DEFAULT NULL,
  `booking_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  KEY `fk1` (`booking_id`),
  CONSTRAINT `fk1` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`booking_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (9,'Niklauss','Michealson',20,'Niklauss@gmail.com',23487,'2019-10-16',7),(10,'Jessy','Pinkman',20,'Jessy@gmail.com',21456,'2019-11-09',8),(12,'Lionel','Messi',32,'Messi@gmail.com',12378,'2019-11-09',9),(13,'Cristiano','Ronaldo',34,'Cristiano@gmail.com',12456,'2019-11-09',10),(20,'Night','king',52,'Longnight@hotmail.com',34509,'2020-01-01',11),(23,'Villanelle','Konstantin',20,'Villanelle@gmail.com',54678,'2019-10-16',6),(98,'hello','ger',12,'gm@gmail.com',97638,'2019-12-04',98),(666,'dhg','hgj',9,'gm@gmail.com',97638,'2019-12-07',666);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `empolyee_id` int(11) NOT NULL,
  `hourly_wage` decimal(10,0) DEFAULT NULL,
  `employee_fn` varchar(20) DEFAULT NULL,
  `employee_ln` varchar(20) DEFAULT NULL,
  `designation` varchar(20) DEFAULT NULL,
  `hours_worked` int(11) DEFAULT NULL,
  `salary` decimal(10,0) DEFAULT NULL,
  `mail_id` varchar(40) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`empolyee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,20,'Jon','Snow','Maintaince',10,200,'ygrite@gmail.com','jonsnow'),(2,30,'Dexter','Morgan','Admin',20,600,'debra@gmail.com','killing'),(3,15,'Barney','Stinson','Lifeguard',20,300,'barney@gmail.com','awesome'),(4,20,'Spiek','Winter','Ridetechnician',20,400,'winter@gmail.com','german'),(5,10,'Rachel','Green','Janitor',25,250,'friends@hotmail.com','green'),(6,10,'Zlatan','Ibra','Janitor',25,250,'god@hotmail.com','mls'),(7,20,'Andreas','Iniesta','Ridetechnician',20,400,'barca@gmail.com','spain'),(8,15,'Sergio','Ramos','Lifeguard',20,300,'halamadrid@gmail.com','header'),(9,20,'Philip','Gallager','Ridetechnician',20,400,'lip@hotmail.com','brains'),(10,20,'Fiona','Gallager','Ridetechnician',20,400,'fiona@hotmail.com','wolf');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `events` (
  `event_id` int(11) NOT NULL,
  `event` varchar(20) DEFAULT NULL,
  `description` varchar(40) DEFAULT NULL,
  `duration_hr` int(11) DEFAULT NULL,
  `rate_per_hr` int(11) DEFAULT NULL,
  `kingdom_id` int(11) DEFAULT NULL,
  `total_rent` int(11) DEFAULT NULL,
  PRIMARY KEY (`event_id`),
  KEY `fk3` (`kingdom_id`),
  CONSTRAINT `fk3` FOREIGN KEY (`kingdom_id`) REFERENCES `kingdom` (`kingdom_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES (13,'Caricature','Get sketched',5,100,3,500),(14,'Sherlock','Mazes',10,60,5,600),(16,'Knotts scary farm','Haunted Houses',15,30,3,450),(17,'Antique Exhibition','Sara antique',240,45,1,10800),(19,'Ice','Sculptures',120,50,2,6000),(20,'Santa Village','Children',72,35,4,2520),(21,'Mickeys Magic','Disney Theme',90,40,5,3600),(98,'9999s','wee',2,2,1,4),(100,'werrr','wee',2,2,1,40),(888,'Giant wheel','wee',2,30,1,40),(9999,'9999s','wee',2,40,1,40),(10000,'ranvir','wee',2,21,1,1);
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `final_payment`
--

DROP TABLE IF EXISTS `final_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `final_payment` (
  `payment_id` int(11) NOT NULL,
  `booking_id` int(11) DEFAULT NULL,
  `grand_tatal` int(11) DEFAULT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `fk2` (`booking_id`),
  CONSTRAINT `fk2` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`booking_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `final_payment`
--

LOCK TABLES `final_payment` WRITE;
/*!40000 ALTER TABLE `final_payment` DISABLE KEYS */;
INSERT INTO `final_payment` VALUES (2,7,1085),(3,8,825),(4,9,815),(5,10,11265),(6,10,6230),(7,11,2625);
/*!40000 ALTER TABLE `final_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kingdom`
--

DROP TABLE IF EXISTS `kingdom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kingdom` (
  `kingdom_id` int(11) NOT NULL,
  `kingdom_name` varchar(20) DEFAULT NULL,
  `kingdom_discription` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`kingdom_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kingdom`
--

LOCK TABLES `kingdom` WRITE;
/*!40000 ALTER TABLE `kingdom` DISABLE KEYS */;
INSERT INTO `kingdom` VALUES (1,'Shire','Magic Land'),(2,'Mordor','Hot as Hell'),(3,'Gondor','Fantasy World'),(4,'Kings Lnading','Adventure'),(5,'Winterfell','Snow park');
/*!40000 ALTER TABLE `kingdom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenance`
--

DROP TABLE IF EXISTS `maintenance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `maintenance` (
  `maintenance_id` int(11) NOT NULL,
  `ride_id` int(11) DEFAULT NULL,
  `cost` int(11) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`maintenance_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenance`
--

LOCK TABLES `maintenance` WRITE;
/*!40000 ALTER TABLE `maintenance` DISABLE KEYS */;
INSERT INTO `maintenance` VALUES (5,8,400,1),(6,5,120,4),(7,1,180,7),(8,14,200,9),(9,13,125,10);
/*!40000 ALTER TABLE `maintenance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parking`
--

DROP TABLE IF EXISTS `parking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parking` (
  `parking_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `parking_lot` varchar(20) DEFAULT NULL,
  `base_cost` int(11) DEFAULT NULL,
  PRIMARY KEY (`parking_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parking`
--

LOCK TABLES `parking` WRITE;
/*!40000 ALTER TABLE `parking` DISABLE KEYS */;
INSERT INTO `parking` VALUES (5,9,'M',25),(6,10,'A',25),(8,12,'B',25),(9,13,'C',25),(10,20,'Z',25),(11,23,'A',25);
/*!40000 ALTER TABLE `parking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL,
  `event_id` int(11) DEFAULT NULL,
  `parking_id` int(11) DEFAULT NULL,
  `booking_id` int(11) DEFAULT NULL,
  `payment_method` varchar(20) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `income_event` int(11) DEFAULT NULL,
  `income_parking` int(11) DEFAULT NULL,
  `income_booking` int(11) DEFAULT NULL,
  `income_maintenance` int(11) DEFAULT NULL,
  `maintenance_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `fk4` (`event_id`),
  KEY `fk5` (`parking_id`),
  KEY `fk6` (`booking_id`),
  CONSTRAINT `fk4` FOREIGN KEY (`event_id`) REFERENCES `events` (`event_id`),
  CONSTRAINT `fk5` FOREIGN KEY (`parking_id`) REFERENCES `parking` (`parking_id`),
  CONSTRAINT `fk6` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`booking_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (2,13,5,7,'Cash','2019-10-16',500,25,160,400,5),(3,14,6,8,'Credit Card','2019-11-09',600,25,80,120,6),(4,16,8,9,'Credit Card','2019-11-09',450,25,160,180,7),(5,17,9,10,'Gift Voucher','2019-11-09',10800,25,240,200,8),(6,19,10,11,'cash','2020-01-01',6000,25,80,125,9),(7,20,10,6,'cash','2019-10-16',2520,25,80,0,0);
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rides`
--

DROP TABLE IF EXISTS `rides`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rides` (
  `ride_id` int(11) NOT NULL,
  `ride_name` varchar(20) DEFAULT NULL,
  `kingdom_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`ride_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rides`
--

LOCK TABLES `rides` WRITE;
/*!40000 ALTER TABLE `rides` DISABLE KEYS */;
INSERT INTO `rides` VALUES (1,'Oblivion',1),(5,'Nemesis',5),(8,'Vertigo',3),(13,'Zodiac',4),(14,'Splash mountain',2);
/*!40000 ALTER TABLE `rides` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-07-31 15:03:17
