CREATE DATABASE  IF NOT EXISTS `mobilewebdb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `mobilewebdb`;
-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: mobilewebdb
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brand` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `BrandName` varchar(50) DEFAULT NULL,
  `Company` varchar(45) DEFAULT NULL,
  `headquarter` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` VALUES (1,'SamSung','Samsung Electronics','Korean'),(2,'Redmi','Xiaomi','China'),(3,'Apple','Apple Inc.','USA'),(4,'Oppo','OPPO Electronics','China'),(5,'Nokia','Nokia','Findland');
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `ProductId` int DEFAULT NULL,
  `ProductName` varchar(100) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `Qty` int DEFAULT NULL,
  `Total` decimal(10,2) DEFAULT NULL,
  `ProductImage` varchar(100) DEFAULT NULL,
  `UserName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `FDateTime` varchar(30) NOT NULL,
  `Message` varchar(1000) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `EmailID` varchar(30) NOT NULL,
  `Subject` varchar(100) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (1,'2023-03-24 18:15:58','Improve Service ','Rajesh','ganesh@gmail.com','Service is not proper'),(2,'2023-03-24 10:51 PM','Please provide details information about mobiles','Rajeshl Patil','rajesh@gmail.com','Info about projects good');
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `OrderDateTime` varchar(45) DEFAULT NULL,
  `UserName` varchar(45) DEFAULT NULL,
  `OrderAmt` decimal(10,2) DEFAULT NULL,
  `OrderStatus` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'2023-03-26 08:29:38 PM','rajesh@gmail.com',1600.00,'Dispatched'),(2,'2023-03-26 08:39:39 PM','ganesh@gmail.com',1955.00,'Pending'),(3,'2023-03-29 06:52:10 AM','rajesh@gmail.com',152.00,'Pending');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordersitems`
--

DROP TABLE IF EXISTS `ordersitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordersitems` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `OrderId` int DEFAULT NULL,
  `ProductId` int DEFAULT NULL,
  `ProductName` varchar(45) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `Qty` int DEFAULT NULL,
  `Total` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordersitems`
--

LOCK TABLES `ordersitems` WRITE;
/*!40000 ALTER TABLE `ordersitems` DISABLE KEYS */;
INSERT INTO `ordersitems` VALUES (1,1,1,'P3546 CORN',1600.00,1,1600.00),(2,2,2,'P3388 CORN',1955.00,1,1955.00),(3,3,1,'Samsung Galaxy 10',152.00,1,152.00);
/*!40000 ALTER TABLE `ordersitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `ProductId` int NOT NULL AUTO_INCREMENT,
  `ProductName` varchar(45) DEFAULT NULL,
  `Brand` varchar(45) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `ProductImage` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ProductId`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Samsung Galaxy 10','1',152.00,'./assets/products/1.png'),(2,'Redmi Note 7','2',122.00,'./assets/products/2.png'),(3,'Redmi Note 6','2',112.00,'./assets/products/3.png'),(4,'Redmi Note 5','2',102.00,'./assets/products/4.png'),(5,'Redmi Note 4','2',82.00,'./assets/products/5.png'),(6,'Redmi Note 8','2',132.00,'./assets/products/6.png'),(7,'Redmi Note 9','2',142.00,'./assets/products/8.png'),(8,'Samsung Galaxy A23','1',122.00,'./assets/products/10.png'),(9,'Samsung Galaxy S6','1',122.00,'./assets/products/11.png'),(10,'Samsung Galaxy S7','1',132.00,'./assets/products/12.png'),(11,'Apple iPhone X','3',82.00,'./assets/products/13.png'),(12,'iPhone 13 ProMax','3',142.00,'./assets/products/14.png'),(13,'iPhone 12 Pro','3',122.00,'./assets/products/15.png');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile`
--

DROP TABLE IF EXISTS `profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profile` (
  `UserId` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `Address` varchar(100) DEFAULT NULL,
  `MobileNo` varchar(30) DEFAULT NULL,
  `JoinDate` date DEFAULT NULL,
  `AdharNo` varchar(20) DEFAULT NULL,
  `PanNo` varchar(20) DEFAULT NULL,
  `Photo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`UserId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile`
--

LOCK TABLES `profile` WRITE;
/*!40000 ALTER TABLE `profile` DISABLE KEYS */;
INSERT INTO `profile` VALUES (1,'Rajesh Shinde','Karad','9175625364','2023-03-01','123456789123','857256','Employee.png'),(2,'Ganesh Patil','Karad','8585858585','2023-03-01','785858585812','78522565','tv.JPG');
/*!40000 ALTER TABLE `profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `UserId` int NOT NULL AUTO_INCREMENT,
  `EmailID` varchar(30) NOT NULL,
  `Password` varchar(30) NOT NULL,
  `SecQ` varchar(100) NOT NULL,
  `SecA` varchar(50) NOT NULL,
  `UserType` varchar(30) NOT NULL,
  PRIMARY KEY (`UserId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'rajesh@gmail.com','rajesh','What is your last name?','rajesh','Customer'),(2,'ganesh@gmail.com','ganesh','What is your last name?','Patil','Customer'),(3,'admin@gmail.com','admin','What is your last name?','admin','Admin');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_product`
--

DROP TABLE IF EXISTS `vw_product`;
/*!50001 DROP VIEW IF EXISTS `vw_product`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_product` AS SELECT 
 1 AS `ProductId`,
 1 AS `ProductName`,
 1 AS `BrandName`,
 1 AS `Price`,
 1 AS `ProductImage`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_users`
--

DROP TABLE IF EXISTS `vw_users`;
/*!50001 DROP VIEW IF EXISTS `vw_users`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_users` AS SELECT 
 1 AS `UserId`,
 1 AS `Name`,
 1 AS `Address`,
 1 AS `MobileNo`,
 1 AS `EmailId`,
 1 AS `JoinDate`,
 1 AS `AdharNo`,
 1 AS `PanNo`,
 1 AS `UserType`,
 1 AS `Photo`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vw_product`
--

/*!50001 DROP VIEW IF EXISTS `vw_product`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_product` AS select `a`.`ProductId` AS `ProductId`,`a`.`ProductName` AS `ProductName`,`b`.`BrandName` AS `BrandName`,`a`.`Price` AS `Price`,`a`.`ProductImage` AS `ProductImage` from (`product` `a` join `brand` `b`) where (`a`.`Brand` = `b`.`Id`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_users`
--

/*!50001 DROP VIEW IF EXISTS `vw_users`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_users` AS select `a`.`UserId` AS `UserId`,`b`.`Name` AS `Name`,`b`.`Address` AS `Address`,`b`.`MobileNo` AS `MobileNo`,`a`.`EmailID` AS `EmailId`,`b`.`JoinDate` AS `JoinDate`,`b`.`AdharNo` AS `AdharNo`,`b`.`PanNo` AS `PanNo`,`a`.`UserType` AS `UserType`,`b`.`Photo` AS `Photo` from (`users` `a` left join `profile` `b` on((`a`.`UserId` = `b`.`UserId`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-29  6:53:16
