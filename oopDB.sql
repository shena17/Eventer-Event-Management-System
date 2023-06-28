CREATE DATABASE  IF NOT EXISTS `oop` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `oop`;
-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: oop
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `event_supplier`
--

DROP TABLE IF EXISTS `event_supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_supplier` (
  `EID` int DEFAULT NULL,
  `SID` int DEFAULT NULL,
  `Date` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_supplier`
--

LOCK TABLES `event_supplier` WRITE;
/*!40000 ALTER TABLE `event_supplier` DISABLE KEYS */;
INSERT INTO `event_supplier` VALUES (2,22,'2022-03-20'),(3,19,'2022-02-01'),(3,20,'2022-02-01'),(5,20,'2022-11-02'),(5,22,'2022-11-02'),(6,17,'2022-11-11'),(6,19,'2022-11-11'),(6,20,'2022-11-11'),(6,21,'2022-11-11'),(9,2,'2022-12-07'),(9,22,'2022-12-07'),(10,2,'2022-11-02'),(10,19,'2022-11-02'),(11,19,'2022-11-30'),(11,2,'2022-11-30'),(11,0,'2022-11-30'),(11,0,'2022-11-30'),(12,19,'2022-11-22'),(12,20,'2022-11-22'),(12,17,'2022-11-22'),(12,0,'2022-11-22'),(13,19,'2022-11-23'),(13,20,'2022-11-23'),(13,17,'2022-11-23'),(13,0,'2022-11-23');
/*!40000 ALTER TABLE `event_supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `events` (
  `EID` int NOT NULL AUTO_INCREMENT,
  `UID` int NOT NULL,
  `VID` int NOT NULL,
  `Date` date NOT NULL,
  `Budget` double NOT NULL,
  `NoOfGuests` int NOT NULL,
  `Color` varchar(45) DEFAULT NULL,
  `Status` varchar(45) NOT NULL,
  `Type` varchar(45) NOT NULL,
  PRIMARY KEY (`EID`),
  KEY `fk1_idx` (`VID`),
  KEY `fk2_idx` (`UID`),
  CONSTRAINT `fk4` FOREIGN KEY (`UID`) REFERENCES `users` (`UID`),
  CONSTRAINT `fk5` FOREIGN KEY (`VID`) REFERENCES `venue` (`VID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES (2,3,3,'2022-03-20',20000,30,'black','pending','wedding'),(3,7,2,'2022-02-01',10000,20,'blue','confirm','wedding'),(5,3,2,'2022-11-02',125000,100,'#313796','confirm','wedding'),(6,3,3,'2022-11-11',275000,52,'#313796','confirm','wedding'),(7,3,2,'2022-10-05',105000,23,'yellow','past','party'),(9,3,2,'2022-12-07',220000,13,'#b05e5e','pending','wedding'),(10,3,1,'2022-11-02',108000,4,'#000000','confirm','meeting'),(11,3,2,'2022-11-30',208000,100,'#ab2626','pending','party'),(12,3,3,'2022-11-22',270000,100,'#aa5a5a','pending','wedding'),(13,16,3,'2022-11-23',270000,165,'#b04a4a','pending','meeting');
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offers`
--

DROP TABLE IF EXISTS `offers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `offers` (
  `OfferID` int NOT NULL AUTO_INCREMENT,
  `SID` int NOT NULL,
  `OfferName` varchar(45) NOT NULL,
  `Rate` double NOT NULL,
  `Description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`OfferID`),
  KEY `fk11_idx` (`SID`),
  CONSTRAINT `fk11` FOREIGN KEY (`SID`) REFERENCES `supplier` (`SID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offers`
--

LOCK TABLES `offers` WRITE;
/*!40000 ALTER TABLE `offers` DISABLE KEYS */;
/*!40000 ALTER TABLE `offers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `PID` int NOT NULL AUTO_INCREMENT,
  `EID` int NOT NULL,
  `Amount` double NOT NULL,
  PRIMARY KEY (`PID`),
  KEY `fk7_idx` (`EID`),
  CONSTRAINT `fk7` FOREIGN KEY (`EID`) REFERENCES `events` (`EID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,2,1230),(2,3,4320),(3,7,1500);
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier` (
  `SID` int NOT NULL,
  `type` varchar(45) DEFAULT NULL,
  `price` double DEFAULT NULL,
  PRIMARY KEY (`SID`),
  CONSTRAINT `fk3` FOREIGN KEY (`SID`) REFERENCES `users` (`UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (2,'music',5000),(17,'photography',7000),(18,'deco',2000),(19,'food',3000),(20,'music',10000),(21,'deco',5000),(22,'food',15000);
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier_payment`
--

DROP TABLE IF EXISTS `supplier_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier_payment` (
  `SPID` int NOT NULL AUTO_INCREMENT,
  `SID` int NOT NULL,
  `Amount` double NOT NULL,
  PRIMARY KEY (`SPID`),
  KEY `fk10_idx` (`SID`),
  CONSTRAINT `fk10` FOREIGN KEY (`SID`) REFERENCES `supplier` (`SID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier_payment`
--

LOCK TABLES `supplier_payment` WRITE;
/*!40000 ALTER TABLE `supplier_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `supplier_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_contact`
--

DROP TABLE IF EXISTS `user_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_contact` (
  `UID` int NOT NULL,
  `ContactNo` char(10) NOT NULL,
  PRIMARY KEY (`UID`,`ContactNo`),
  CONSTRAINT `fk1` FOREIGN KEY (`UID`) REFERENCES `users` (`UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_contact`
--

LOCK TABLES `user_contact` WRITE;
/*!40000 ALTER TABLE `user_contact` DISABLE KEYS */;
INSERT INTO `user_contact` VALUES (2,'0760637175'),(3,'0784546856'),(17,'0772106241'),(18,'0772341231'),(19,'0760768908'),(20,'0112345678'),(21,'0223457897'),(22,'0996783452'),(28,'0741412321'),(31,'0784477845'),(33,'0753423456');
/*!40000 ALTER TABLE `user_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `UID` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(45) NOT NULL,
  `LastName` varchar(45) NOT NULL,
  `Email` varchar(45) NOT NULL,
  `NIC` char(12) NOT NULL,
  `Type` varchar(45) NOT NULL,
  `Username` varchar(45) NOT NULL,
  `Password` varchar(500) NOT NULL,
  `Status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`UID`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (2,'Thanuka ','Minik','thanukaMinik@gmail.com','20054864845','supplier','supplier','supplier@123','Approved'),(3,'Shenal','de Silva','shenaldesilva@gmail.com','200235200139','customer','custom@123','custom@123',NULL),(7,'Akith','Wijebohonda','akithbole@gmail.com','19552545632','customer','akith@123','akith@123',NULL),(15,'Michelle','Fernando','michelle@gmail.com','20034512345','customer','michelle@123','michelle@123',NULL),(16,'Shenal','de Silva','shenaldesilva17@gmail.com','200235200139','customer','shenal@4224','shenal@4224',NULL),(17,'Chaminda','lankesha','chaminda@gmail.com','2001231231','supplier','chaminda@123','chaminda@123','Approved'),(18,'hashan','perera','hash@gmail.com','2002012345','supplier','hashan@123','hashan@123','Approved'),(19,'jack','ma','jack@gmail.com','1234567890','supplier','jack@123','jack@123','pending'),(20,'elon','musk','elon@gmail.com','0987654321','supplier','elon@123','elon@123','Approved'),(21,'mark','zuckerberg','mark@gmail.com','1212343456','supplier','mark@123','mark@123','Approved'),(22,'bill','gates','bill@gmail.com','0909878765','supplier','bill@123','bill@123','Approved'),(28,'MSHenal','aohuidbna','merish@gmail.com','846513266531','customer','merisha@123','merisha@123',NULL),(31,'Sample','Sample','sample@gmail.com','20034512345','customer','sample@123','sample@123',NULL),(32,'Hashan','de Silva','hashan@gmail.com','200235200139','organizer','organizer','organizer@123','Approved'),(33,'Admin','Sample','admin@gmail.com','123456787654','admin','admin','admin@123',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venue`
--

DROP TABLE IF EXISTS `venue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venue` (
  `VID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `MaxNoOfGuests` varchar(45) NOT NULL,
  `Cost` double NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `picture` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`VID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venue`
--

LOCK TABLES `venue` WRITE;
/*!40000 ALTER TABLE `venue` DISABLE KEYS */;
INSERT INTO `venue` VALUES (1,'Taj','300',100000,'Taj Smudra is the best place to throw out your high end paties and weddings','images/taj.jpeg'),(2,'kingsBury','250',200000,'KingsBury the place of pinnacle.Available for parties and other events.','images/kingsbury.jpg'),(3,'galface','350',250000,'GalFace is your most favorite and trusted venue partner for generations','images/galleFace.jpg');
/*!40000 ALTER TABLE `venue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venue_type`
--

DROP TABLE IF EXISTS `venue_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venue_type` (
  `VID` int NOT NULL,
  `Type` varchar(45) NOT NULL,
  PRIMARY KEY (`VID`,`Type`),
  CONSTRAINT `fk6` FOREIGN KEY (`VID`) REFERENCES `venue` (`VID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venue_type`
--

LOCK TABLES `venue_type` WRITE;
/*!40000 ALTER TABLE `venue_type` DISABLE KEYS */;
INSERT INTO `venue_type` VALUES (1,'party'),(1,'wedding'),(2,'wedding'),(3,'birthday'),(3,'meeting'),(3,'wedding');
/*!40000 ALTER TABLE `venue_type` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-10 10:33:23
