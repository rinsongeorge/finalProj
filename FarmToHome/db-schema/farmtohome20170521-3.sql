CREATE DATABASE  IF NOT EXISTS `farmtohome` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `farmtohome`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: localhost    Database: farmtohome
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
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart` (
  `CartItemID` int(11) NOT NULL AUTO_INCREMENT,
  `DateCreated` tinyint(1) NOT NULL,
  `Deleted` tinyint(1) NOT NULL,
  `Qty` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `SellerID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  PRIMARY KEY (`CartItemID`),
  KEY `FK_PRODUCT_idx` (`ProductID`),
  KEY `FK_SELLER_idx` (`SellerID`),
  KEY `FK_USER_idx` (`UserID`),
  CONSTRAINT `FK_PRODUCT_CART` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_SELLER_CART` FOREIGN KEY (`SellerID`) REFERENCES `seller` (`SellerID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_USER_CART` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `CategoryID` int(11) NOT NULL AUTO_INCREMENT,
  `CategoryName` varchar(45) NOT NULL,
  `Description` varchar(45) NOT NULL,
  `CategoryImage` varchar(45) NOT NULL,
  `Active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`CategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (101,'Greens','Greens','na',1),(102,'Vegetables','Vegetables','na',1),(103,'Millets','Millets','na',1),(104,'Pulses','Pulses','na',1),(105,'Rice','Rice','na',1),(106,'Jaggery','Jaggery','na',1),(107,'Fruits','Fruits','na',1),(108,'Spices','Spices','na',1),(109,'Eggs','Eggs','na',1),(110,'Oil','Oil','na',1),(111,'Plants','Plants','na',1),(112,'Others','Others','na',1);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deliveryaddress`
--

DROP TABLE IF EXISTS `deliveryaddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deliveryaddress` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `addressLine1` varchar(45) NOT NULL DEFAULT '',
  `addressLin2` varchar(45) DEFAULT NULL,
  `addressLine3` varchar(45) DEFAULT NULL,
  `city` varchar(45) NOT NULL DEFAULT '',
  `state` varchar(45) NOT NULL DEFAULT '',
  `country` varchar(45) NOT NULL DEFAULT '',
  `pinCode` decimal(10,0) NOT NULL DEFAULT '0',
  `userId` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK_DeliveryAddress_userid` (`userId`),
  CONSTRAINT `FK_DeliveryAddress_userid` FOREIGN KEY (`userId`) REFERENCES `user` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deliveryaddress`
--

LOCK TABLES `deliveryaddress` WRITE;
/*!40000 ALTER TABLE `deliveryaddress` DISABLE KEYS */;
/*!40000 ALTER TABLE `deliveryaddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order` (
  `OrderID` int(11) NOT NULL,
  `OrderDate` datetime NOT NULL,
  `OrderAmount` decimal(6,2) NOT NULL,
  `Freight` decimal(2,2) NOT NULL,
  `Tax` decimal(2,2) NOT NULL,
  `OrderShipName` varchar(45) NOT NULL,
  `OrderShipAddress1` varchar(45) NOT NULL,
  `OrderShipAddress2` varchar(45) DEFAULT NULL,
  `OrderCity` varchar(45) NOT NULL,
  `OrderState` varchar(45) NOT NULL,
  `OrderPinCode` varchar(45) NOT NULL,
  `OrderCountry` varchar(45) NOT NULL,
  `OrderPhone` varchar(45) NOT NULL,
  `OrderMobile` varchar(45) NOT NULL,
  `OrderEmail` varchar(45) NOT NULL,
  `Deleted` tinyint(1) NOT NULL,
  `TransactionStatus` varchar(45) NOT NULL,
  `Paid` tinyint(1) DEFAULT NULL,
  `ErrMsg` varchar(45) DEFAULT NULL,
  `ErrLoc` varchar(45) DEFAULT NULL,
  `Refund` tinyint(1) DEFAULT NULL,
  `PaymentID` int(11) DEFAULT NULL,
  `OrderUserID` int(11) DEFAULT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `FK_ORDER_UESR_idx` (`OrderUserID`),
  CONSTRAINT `FK_ORDER_UESR` FOREIGN KEY (`OrderUserID`) REFERENCES `user` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderdetails`
--

DROP TABLE IF EXISTS `orderdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderdetails` (
  `DetailIOrderID` int(11) NOT NULL AUTO_INCREMENT,
  `DetailPrice` decimal(6,2) NOT NULL,
  `DetailQuantity` int(11) NOT NULL,
  `Total` decimal(6,2) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `SellerID` int(11) NOT NULL,
  `OrderID` int(11) NOT NULL,
  `ReviewID` int(11) NOT NULL,
  PRIMARY KEY (`DetailIOrderID`),
  KEY `FK_PRODUCT_idx` (`ProductID`),
  KEY `FK_SELLER_idx` (`SellerID`),
  KEY `FK_ORDER_idx` (`OrderID`),
  KEY `FK_REVIEW_idx` (`ReviewID`),
  CONSTRAINT `FK_ORDER_ORDER` FOREIGN KEY (`OrderID`) REFERENCES `order` (`OrderID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_PRODUCT_ORDER` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_REVIEW_ORDER` FOREIGN KEY (`ReviewID`) REFERENCES `review` (`ReviewID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_SELLER_ORDER` FOREIGN KEY (`SellerID`) REFERENCES `seller` (`SellerID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderdetails`
--

LOCK TABLES `orderdetails` WRITE;
/*!40000 ALTER TABLE `orderdetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `orderdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paymentdetails`
--

DROP TABLE IF EXISTS `paymentdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paymentdetails` (
  `PaymentID` int(11) NOT NULL AUTO_INCREMENT,
  `PaymentMode` varchar(45) NOT NULL,
  `CreditCardTypeID` varchar(45) NOT NULL,
  `CreditCardExpMonth` int(11) NOT NULL,
  `CreditCardExpYear` int(11) NOT NULL,
  `CreditCardNumber` varchar(45) NOT NULL,
  `OrderID` int(11) NOT NULL,
  PRIMARY KEY (`PaymentID`),
  KEY `FK_ORDER_idx` (`OrderID`),
  CONSTRAINT `FK_ORDER` FOREIGN KEY (`OrderID`) REFERENCES `order` (`OrderID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paymentdetails`
--

LOCK TABLES `paymentdetails` WRITE;
/*!40000 ALTER TABLE `paymentdetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `paymentdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `ProductID` int(11) NOT NULL AUTO_INCREMENT,
  `ProductName` varchar(45) NOT NULL,
  `ProductUnitPrice` decimal(4,2) NOT NULL,
  `ProductUnitWeight` varchar(20) NOT NULL,
  `ProductDescription` varchar(500) NOT NULL DEFAULT '',
  `ProductImage` varchar(50) DEFAULT NULL,
  `ProductThumbImage` varchar(50) DEFAULT NULL,
  `ProductUpdateDate` datetime DEFAULT NULL,
  `Active` tinyint(1) DEFAULT NULL,
  `CategoryID` int(11) NOT NULL,
  `Currency` varchar(4) NOT NULL DEFAULT '',
  PRIMARY KEY (`ProductID`),
  KEY `FK_CATEGORY_idx` (`CategoryID`),
  CONSTRAINT `FK_CATEGORY` FOREIGN KEY (`CategoryID`) REFERENCES `category` (`CategoryID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Vazhakoombu (Banana flower)',30.00,'1 ps','Banana flower is an inherent to Andes Mountains of Colombia. The flower is large which grows from the end of the bunch of bananas and has a dark purple red blossom. The small flowers would be found on the inside part which would turn into the banana. It is starchy and bitter in taste. It is rich in Vitamin C and Vitamin A and can reduce the pains. It is included in the diet as the vegetable.','resources/static/images/Cabbage.jpg','resources/static/images/Cabbage.jpg','2017-05-13 17:33:07',1,101,'INR'),(2,'Kovakka (Coccinia grandis)',33.00,'500 gm','A variety of recipes from all over the world list rashmato, the fruit, as the main ingredient. They are best when cooked, and are often compared to bitter melon. The fruit is commonly eaten in Indian cuisine. People of Indonesia and other Southeast Asian countries also consume the fruit and leaves.','resources/static/images/ladies_finger.jpg','resources/static/images/ladies_finger.jpg','2017-05-13 20:12:14',1,101,'INR'),(3,'Kadachakka (Breadfruit)',40.00,'1 ps','Breadfruit is a species of flowering tree in the mulberry and jackfruit family. In India, fritters of breadfruit, called jeev kadge phodi in Konkani or kadachakka varuthath in Malayalam are a local delicacy in coastal Karnataka and Kerala.','resources/static/images/papaya.jpg','resources/static/images/papaya.jpg','2017-05-13 20:15:06',1,101,'INR'),(4,'Kaplanga',40.00,'1 ps','Breadfruit is a species of flowering tree in the mulberry and jackfruit family. In India, fritters of breadfruit, called jeev kadge phodi in Konkani or kadachakka varuthath in Malayalam are a local delicacy in coastal Karnataka and Kerala.','resources/static/images/papaya.jpg','resources/static/images/papaya.jpg','2017-05-13 22:13:11',1,101,'INR');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review` (
  `ReviewID` int(11) NOT NULL AUTO_INCREMENT,
  `ReviewDescription` varchar(45) NOT NULL,
  `Rating` int(11) NOT NULL,
  `TimeStamp` datetime NOT NULL,
  PRIMARY KEY (`ReviewID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `RoleName` varchar(45) NOT NULL,
  `RoleDesc` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'ROLE_USER','USER'),(2,'ROLE_ADMIN','ADMIN'),(3,'ROLE_SELLER','SELLER');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seller`
--

DROP TABLE IF EXISTS `seller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seller` (
  `SellerID` int(11) NOT NULL AUTO_INCREMENT,
  `About` varchar(45) NOT NULL,
  `LogoImage` varchar(45) DEFAULT NULL,
  `RegistrationNumber` varchar(45) NOT NULL,
  `CompanyName` varchar(45) NOT NULL,
  `URL` varchar(45) DEFAULT NULL,
  `PaymentMethods` varchar(45) NOT NULL,
  `ContactTitle` varchar(45) NOT NULL,
  `UserID` int(11) DEFAULT NULL,
  PRIMARY KEY (`SellerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seller`
--

LOCK TABLES `seller` WRITE;
/*!40000 ALTER TABLE `seller` DISABLE KEYS */;
/*!40000 ALTER TABLE `seller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sellersproduct`
--

DROP TABLE IF EXISTS `sellersproduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sellersproduct` (
  `SellersProductID` int(11) NOT NULL AUTO_INCREMENT,
  `SellersStock` bigint(20) NOT NULL,
  `StockStatus` varchar(45) NOT NULL,
  `SellersDiscount` decimal(2,2) DEFAULT NULL,
  `ProductID` int(11) NOT NULL,
  `SellerID` int(11) NOT NULL,
  PRIMARY KEY (`SellersProductID`),
  KEY `FK_PRODUCT_idx` (`ProductID`),
  KEY `FK_SELLER_idx` (`SellerID`),
  CONSTRAINT `FK_PRODUCT_SP` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_SELLER_SP` FOREIGN KEY (`SellerID`) REFERENCES `seller` (`SellerID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sellersproduct`
--

LOCK TABLES `sellersproduct` WRITE;
/*!40000 ALTER TABLE `sellersproduct` DISABLE KEYS */;
/*!40000 ALTER TABLE `sellersproduct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `UserID` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(45) NOT NULL DEFAULT '',
  `LastName` varchar(45) NOT NULL,
  `Address1` varchar(45) DEFAULT NULL,
  `Address2` varchar(45) DEFAULT NULL,
  `City` varchar(45) DEFAULT NULL,
  `State` varchar(45) DEFAULT NULL,
  `Country` varchar(45) DEFAULT NULL,
  `PinCode` varchar(45) DEFAULT NULL,
  `Phone` varchar(45) DEFAULT NULL,
  `Mobile` varchar(45) DEFAULT NULL,
  `Email` varchar(45) NOT NULL DEFAULT '',
  `Password` varchar(45) NOT NULL DEFAULT '',
  `UserIP` varchar(45) DEFAULT NULL,
  `DateCreated` datetime NOT NULL,
  `Role` int(11) NOT NULL,
  PRIMARY KEY (`UserID`),
  KEY `FK_ROLE_idx` (`Role`),
  CONSTRAINT `FK_ROLE` FOREIGN KEY (`Role`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=504 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (501,'Rinson','George',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'rinsongk@gmail.com','root',NULL,'2017-05-20 13:02:34',1),(502,'santo','scaria',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'sato@gmail.com','root',NULL,'2017-05-21 11:29:11',1),(503,'manu','edachira',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'manu@gmail.com','root',NULL,'2017-05-21 11:41:26',1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-05-21 16:27:35
