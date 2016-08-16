-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: inventory_tracking
-- ------------------------------------------------------
-- Server version	5.6.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `deliveries`
--

DROP TABLE IF EXISTS `deliveries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deliveries` (
  `deliveryID` int(11) NOT NULL AUTO_INCREMENT,
  `supplierID` int(11) DEFAULT NULL,
  `type` varchar(45) NOT NULL,
  `status` varchar(45) NOT NULL,
  PRIMARY KEY (`deliveryID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deliveries`
--

LOCK TABLES `deliveries` WRITE;
/*!40000 ALTER TABLE `deliveries` DISABLE KEYS */;
INSERT INTO `deliveries` VALUES (1,NULL,'Outgoing','In Transit'),(2,NULL,'Outgoing','Finished'),(3,4,'Incoming','In Transit'),(4,NULL,'Outgoing','In Transit'),(5,NULL,'Outgoing','Pending'),(6,NULL,'Outgoing','Pending');
/*!40000 ALTER TABLE `deliveries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_of_request`
--

DROP TABLE IF EXISTS `item_of_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_of_request` (
  `itemID` int(11) NOT NULL,
  `requestID` int(11) NOT NULL,
  `deliveryID` int(11) NOT NULL DEFAULT '1',
  `count` int(11) NOT NULL,
  PRIMARY KEY (`itemID`,`requestID`,`deliveryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_of_request`
--

LOCK TABLES `item_of_request` WRITE;
/*!40000 ALTER TABLE `item_of_request` DISABLE KEYS */;
INSERT INTO `item_of_request` VALUES (1,1,1,10),(2,2,2,20),(3,4,5,5),(4,2,3,10),(5,3,4,8),(5,4,6,3);
/*!40000 ALTER TABLE `item_of_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items` (
  `itemID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` varchar(256) NOT NULL,
  `unit` varchar(45) NOT NULL,
  `isDeleted` char(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (1,'Hammer','sledgehammer','pc','0'),(2,'Nails','Nails (in kg)','kg','0'),(3,'Board','100\'\' x 100\'\'','pc','0'),(4,'Cement','1kg sack','kg','0'),(5,'Red Paint','100L Bucket','pc','0');
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `place_of_item`
--

DROP TABLE IF EXISTS `place_of_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `place_of_item` (
  `itemID` int(11) NOT NULL,
  `warehouseID` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  PRIMARY KEY (`itemID`,`warehouseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `place_of_item`
--

LOCK TABLES `place_of_item` WRITE;
/*!40000 ALTER TABLE `place_of_item` DISABLE KEYS */;
INSERT INTO `place_of_item` VALUES (1,1,30),(2,2,20),(3,1,20),(3,3,15),(4,2,30),(4,4,8),(5,1,10),(5,3,17),(5,5,70);
/*!40000 ALTER TABLE `place_of_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requests`
--

DROP TABLE IF EXISTS `requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `requests` (
  `requestID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `sourceWarehouseID` int(11) NOT NULL,
  `destWarehouseID` int(11) NOT NULL,
  `startDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `endDate` timestamp NULL DEFAULT NULL,
  `status` varchar(45) NOT NULL,
  PRIMARY KEY (`requestID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requests`
--

LOCK TABLES `requests` WRITE;
/*!40000 ALTER TABLE `requests` DISABLE KEYS */;
INSERT INTO `requests` VALUES (1,'JolliTransfer My Hammer!',1,4,'2016-08-15 15:46:35',NULL,'In Transit'),(2,'JolliTransfer My Nails And Cement!',2,3,'2016-08-15 15:46:35',NULL,'In Transit - Incomplete'),(3,'JolliTransfer My Paint!',5,2,'2016-08-15 15:46:35',NULL,'In Transit'),(4,'JolliTransfer My Board And Paint!',3,5,'2016-08-15 15:51:27',NULL,'Pending');
/*!40000 ALTER TABLE `requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supplier` (
  `supplierID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `location` varchar(256) NOT NULL,
  `contactNumber` varchar(256) NOT NULL,
  `emailAddress` varchar(256) NOT NULL,
  PRIMARY KEY (`supplierID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (1,'Cement Producers Inc.','Binan, Laguna','09123456789','supplier@cemprod.com.ph'),(2,'Wood Choppers Inc.','Binan, Laguna','09321456789','supplier@woodchop.com.ph'),(3,'JolliSupplier','weeland','123456789','JolliSupplier@Jolliweeee.com'),(4,'a','b','c','d'),(5,'w','p','o','i'),(6,'Republic Cement','Republic of the Philippines','8-7000','sales@republic.ph');
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier_of_item`
--

DROP TABLE IF EXISTS `supplier_of_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supplier_of_item` (
  `itemID` int(11) NOT NULL,
  `supplierID` int(11) NOT NULL,
  PRIMARY KEY (`itemID`,`supplierID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier_of_item`
--

LOCK TABLES `supplier_of_item` WRITE;
/*!40000 ALTER TABLE `supplier_of_item` DISABLE KEYS */;
INSERT INTO `supplier_of_item` VALUES (1,1),(2,2),(2,5),(3,1),(3,3),(3,4),(4,2),(4,4),(5,1),(5,3),(5,5);
/*!40000 ALTER TABLE `supplier_of_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `suppliers` (
  `supplierID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `location` varchar(256) NOT NULL,
  `contactNumber` varchar(256) NOT NULL,
  `emailAddress` varchar(256) NOT NULL,
  `contactPerson` varchar(45) NOT NULL DEFAULT 'Juan Dela Cruz',
  `isDeleted` char(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`supplierID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers`
--

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
INSERT INTO `suppliers` VALUES (1,'Cement Producers Inc.','Binan, Laguna','09123456789','supplier@cemprod.com.ph','Juan Dela Cruz','0'),(2,'Wood Choppers Inc.','Binan, Laguna','09321456789','supplier@woodchop.com.ph','Juan Dela Cruz','0'),(3,'Mcdo Inc.','Batangas','09654789453','Mcdo@hehekalaban.com','Ronald McDonald','0'),(4,'KFC Inc.','Taguig City','09546578654','KFC@hehekalaban.com','David Sanders','0'),(5,'Eagle Cement','Muntinlupa City','09434845453','matibay@ecement.com','Blue Eagle','0');
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `fullName` varchar(30) NOT NULL,
  `salt1` varchar(65) DEFAULT NULL,
  `password` varchar(65) NOT NULL,
  `salt2` varchar(65) DEFAULT NULL,
  `type` int(11) NOT NULL,
  `isDeleted` varchar(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','Lucas Yoo','86f65e28a754e1a71b2df9403615a6c436c32c42a75a10d02813961b86f1e428','8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918','1f6fa6f69d185e6086d04e7330361bf9001a3b8d0ce511171055dc34eb90c1c5',0,'0'),(2,'invmanager','Maxine Kang','89270a50341bb8e83734ee062603c63c219320ed4a40fb9fb8c2792358548e8a','273a9f5ddd47fb64303902c9815388c793ed4ffa9b88f6a644dd9778e6cd74e8','f59eff44a211fa33e2513758c4c3bb13582678c5ff8b64d6c6338a0c6512a4ad',1,'0'),(3,'eofficer','Diego Seo','22988607ff895660da293b4da1b2028cae8605fb65b3906c00ddec54b5c9c3ab','ab26d6eb290ca2c1ccc5ceae3eb5c2eeec1d86971a19e5ed35a1fa457c5c6f87','768490634b6310d05b4ccf4c69b01f5a8945c27bee22096a20800c236da6fe8d',2,'0'),(4,'apiclient','Moira Yoon','14c2529eb4498c5d1ffd6915d05bf58a91bdda796af59f41d480d11c099d0479','1d416901e93cca8a4b58cf78634e059778ec81c19b0abc1e13e2c3f656c379d2','adc5877fb1da7d50eec1c7b392202f8f8203bdd6809a262968179dd16c8ad7e6',3,'0');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `warehouse`
--

DROP TABLE IF EXISTS `warehouse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `warehouse` (
  `warehouseID` int(11) NOT NULL AUTO_INCREMENT,
  `location` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`warehouseID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warehouse`
--

LOCK TABLES `warehouse` WRITE;
/*!40000 ALTER TABLE `warehouse` DISABLE KEYS */;
INSERT INTO `warehouse` VALUES (1,'Laguna','Joguna House'),(2,'Cavite','Jovite House'),(3,'Batangas','Jotangas House'),(4,'Manila','Jonila House');
/*!40000 ALTER TABLE `warehouse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `warehouses`
--

DROP TABLE IF EXISTS `warehouses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `warehouses` (
  `warehouseID` int(11) NOT NULL AUTO_INCREMENT,
  `location` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`warehouseID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warehouses`
--

LOCK TABLES `warehouses` WRITE;
/*!40000 ALTER TABLE `warehouses` DISABLE KEYS */;
INSERT INTO `warehouses` VALUES (1,'Laguna','Joguna House'),(2,'Cavite','Jovite House'),(3,'Batangas','Jotangas House'),(4,'Manila','Jonila House'),(5,'weeland','Jolliweeeee');
/*!40000 ALTER TABLE `warehouses` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-08-15 23:59:35
