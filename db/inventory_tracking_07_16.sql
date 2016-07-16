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
INSERT INTO `deliveries` VALUES (1,2,'Incoming','Pending'),(2,NULL,'Outgoing','Finished'),(3,NULL,'Outgoing','Cancelled'),(4,NULL,'Outgoing','In Transit'),(5,NULL,'Outgoing','In Transit'),(6,NULL,'Outgoing','In Transit'),(7,NULL,'Outgoing','In Transit'),(8,NULL,'Outgoing','Finished');
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
INSERT INTO `item_of_request` VALUES (1,6,4,5),(2,7,2,10),(3,6,1,6),(3,9,6,7),(4,7,8,5),(5,8,5,3),(5,10,3,3),(6,7,7,2);
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
INSERT INTO `items` VALUES (1,'Hammer33131313','sledgehammer','pc','0'),(2,'Nails','Nails (in kg)','kg','0'),(3,'Board','100\'\' x 100\'\'','pc','0'),(4,'Cement','1kg sack','kg','0'),(5,'Red Paint','100L Bucket','bucket','0'),(6,'Jolliwings','asdf','pc','0'),(7,'a','asdf','ssss','0'),(8,'mcdo','asdf','pc','0');
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
INSERT INTO `place_of_item` VALUES (1,1,30),(1,2,100),(2,3,10),(3,3,200),(4,4,5),(5,5,15),(6,4,10);
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
INSERT INTO `requests` VALUES (6,'JolliTransfer My Hammer!',3,2,'2016-07-11 09:06:46',NULL,'In Transit'),(7,'JolliTransfer My Nails!',1,4,'2016-06-21 09:00:00',NULL,'In Transit'),(8,'JolliTransfer My Paint!',3,4,'2016-06-18 07:00:00','2016-06-18 07:00:00','Finished'),(9,'JolliTransfer My Board!',4,5,'2016-06-23 07:00:00',NULL,'In Transit - Incomplete'),(10,'JolliTransfer My Paint Part 2!',3,4,'2016-06-22 07:00:00',NULL,'Cancelled');
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
INSERT INTO `supplier_of_item` VALUES (1,1),(1,2),(1,3),(2,3),(2,4),(3,2),(3,4),(4,1),(4,2),(4,3),(5,1),(5,2),(5,3),(5,4);
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers`
--

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
INSERT INTO `suppliers` VALUES (1,'Cement Producers Inc.','Binan, Laguna','09123456789','supplier@cemprod.com.ph','Juan Dela Cruz','1'),(2,'Wood Choppers Inc.','Binan, Laguna','09321456789','supplier@woodchop.com.ph','Juan Dela Cruz','1'),(3,'JolliSupplier','weeland','123456789','JolliSupplier@Jolliweeee.com','Juan Dela Cruz','1'),(4,'a','b','c','d','Juan Dela Cruz','1'),(5,'w','p','o','i','Juan Dela Cruz','1'),(6,'haha333','hehe','hophop','hoho','huhu','0');
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
  `password` varchar(20) NOT NULL,
  `type` int(11) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','admin',0),(2,'invmanager','invmanager',1),(3,'eofficer','eofficer',2);
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
INSERT INTO `warehouse` VALUES (1,'Laguna','Joguna House'),(2,'Cavite','Jovite House'),(3,'Batangas','Jotangas House'),(4,'Manila','Jonila House'),(5,'weeland','Jolliweeeee'),(6,'eeeeee','ssss'),(7,'New Land','The New Warehouse');
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
INSERT INTO `warehouses` VALUES (1,'Laguna','Joguna House'),(2,'Cavite','Jovite House'),(3,'Batangas','Jotangas House'),(4,'Manila','Jonila House'),(5,'weeland','Jolliweeeee'),(6,'eeeeee','ssss'),(7,'aaaaaaaaa','sssssssssss');
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

-- Dump completed on 2016-07-16 15:16:07
