-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: cs5200-fall2019-poranki.camfldnst76t.us-east-2.rds.amazonaws.com    Database: Assignment2
-- ------------------------------------------------------
-- Server version	5.7.22-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `id` int(11) NOT NULL,
  `street1` varchar(100) CHARACTER SET latin1 NOT NULL,
  `street2` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `city` varchar(45) CHARACTER SET latin1 NOT NULL,
  `state` varchar(45) CHARACTER SET latin1 NOT NULL,
  `zip` varchar(45) CHARACTER SET latin1 NOT NULL,
  `primary` tinyint(4) NOT NULL,
  KEY `address_person_composition` (`id`),
  CONSTRAINT `address_person_composition` FOREIGN KEY (`id`) REFERENCES `person` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (12,'Birch St.',NULL,'Boston','MA','02345',0);
INSERT INTO `address` VALUES (23,'345 Charles St.',NULL,'Chelms','MA','03455',1);
INSERT INTO `address` VALUES (23,'456 Down St.',NULL,'Dalton','MA','04566',0);
INSERT INTO `address` VALUES (23,'543 East St.',NULL,'Everett','MA','01112',0);
INSERT INTO `address` VALUES (34,'654 Frank St.',NULL,'Foulton','MA','04322',1);
INSERT INTO `address` VALUES (12,'123 Adam St',NULL,'Alton','MA','1234',1);
/*!40000 ALTER TABLE `address` ENABLE KEYS */;

--
-- Table structure for table `data_type`
--

DROP TABLE IF EXISTS `data_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_type` (
  `widget_type` varchar(45) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`widget_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_type`
--



--
-- Temporary view structure for view `deleveloper_roles_and_privileges`
--

DROP TABLE IF EXISTS `deleveloper_roles_and_privileges`;
/*!50001 DROP VIEW IF EXISTS `deleveloper_roles_and_privileges`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `deleveloper_roles_and_privileges` AS SELECT 
 1 AS `first_name`,
 1 AS `last_name`,
 1 AS `username`,
 1 AS `email`,
 1 AS `name`,
 1 AS `visits`,
 1 AS `updated`,
 1 AS `role`,
 1 AS `priviledge`,
 1 AS `title`,
 1 AS `views`,
 1 AS `update`,
 1 AS `page_role`,
 1 AS `page_priviledge`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `developer`
--

DROP TABLE IF EXISTS `developer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `developer` (
  `id` int(11) NOT NULL,
  `developer_key` varchar(45) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `developer_person_generalization` FOREIGN KEY (`id`) REFERENCES `person` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `developer`
--



--
-- Table structure for table `dob`
--

DROP TABLE IF EXISTS `dob`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dob` (
  `date_of_birth` date NOT NULL,
  `dob_person_generalization` int(11) NOT NULL,
  PRIMARY KEY (`dob_person_generalization`),
  CONSTRAINT `dob_person_generalization` FOREIGN KEY (`dob_person_generalization`) REFERENCES `person` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dob`
--

/*!40000 ALTER TABLE `dob` DISABLE KEYS */;
/*!40000 ALTER TABLE `dob` ENABLE KEYS */;

--
-- Table structure for table `page_priviledge`
--

DROP TABLE IF EXISTS `page_priviledge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `page_priviledge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `developer_id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL,
  `priviledge` varchar(45) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`),
  KEY `page_priviledge_developer_association_idx` (`developer_id`),
  KEY `page_website_association_idx` (`page_id`),
  CONSTRAINT `page_priviledge_developer_association` FOREIGN KEY (`developer_id`) REFERENCES `developer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `page_priviledge_pages_association` FOREIGN KEY (`page_id`) REFERENCES `pages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_priviledge`
--



--
-- Table structure for table `page_role`
--

DROP TABLE IF EXISTS `page_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `page_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `developer_id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL,
  `role` varchar(45) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`),
  KEY `page_role_developer_association_idx` (`developer_id`),
  KEY `page_priviledge_pages_association_idx` (`page_id`),
  CONSTRAINT `page_role_developer_association` FOREIGN KEY (`developer_id`) REFERENCES `developer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `page_role_pages_association` FOREIGN KEY (`page_id`) REFERENCES `pages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_role`
--



--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages` (
  `id` int(11) NOT NULL,
  `name` varchar(45) CHARACTER SET latin1 NOT NULL,
  `description` varchar(100) CHARACTER SET latin1 NOT NULL,
  `website` varchar(45) CHARACTER SET latin1 NOT NULL,
  `editor` varchar(45) CHARACTER SET latin1 NOT NULL,
  `review` varchar(45) CHARACTER SET latin1 NOT NULL,
  `writer` varchar(45) CHARACTER SET latin1 NOT NULL,
  `created` date NOT NULL,
  `update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `views` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--



--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `person` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) CHARACTER SET latin1 NOT NULL,
  `password` varchar(45) CHARACTER SET latin1 NOT NULL,
  `first_name` varchar(45) CHARACTER SET latin1 NOT NULL,
  `last_name` varchar(45) CHARACTER SET latin1 NOT NULL,
  `type` varchar(45) CHARACTER SET latin1 NOT NULL,
  `email` varchar(45) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--



--
-- Table structure for table `phone`
--

DROP TABLE IF EXISTS `phone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `phone` (
  `id` int(11) NOT NULL,
  `phones` varchar(45) CHARACTER SET latin1 NOT NULL,
  `primary` tinyint(4) NOT NULL,
  KEY `phone_person_composition` (`id`),
  CONSTRAINT `phone_person_composition` FOREIGN KEY (`id`) REFERENCES `person` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phone`
--



--
-- Table structure for table `priviledge`
--

DROP TABLE IF EXISTS `priviledge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `priviledge` (
  `priviledge` varchar(45) NOT NULL,
  PRIMARY KEY (`priviledge`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `priviledge`
--


--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `Role` varchar(45) NOT NULL,
  PRIMARY KEY (`Role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--



--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `user_agreement` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_person_generalization_idx` (`id`),
  CONSTRAINT `user_person_generalization` FOREIGN KEY (`id`) REFERENCES `person` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--



--
-- Table structure for table `website`
--

DROP TABLE IF EXISTS `website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `website` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET latin1 NOT NULL,
  `description` varchar(150) CHARACTER SET latin1 NOT NULL,
  `owner` varchar(45) CHARACTER SET latin1 NOT NULL,
  `editor` varchar(45) CHARACTER SET latin1 NOT NULL,
  `admin` varchar(45) CHARACTER SET latin1 NOT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `visits` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `website_data_type_association_idx` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=679 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `website`
--



--
-- Table structure for table `website_priviledge`
--

DROP TABLE IF EXISTS `website_priviledge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `website_priviledge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `developer_id` int(11) NOT NULL,
  `website_id` int(11) NOT NULL,
  `priviledge` varchar(45) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`),
  KEY `website_priviledge_developer_association_idx` (`developer_id`),
  KEY `website_priviledge_website_association_idx` (`website_id`),
  CONSTRAINT `website_priviledge_developer_association` FOREIGN KEY (`developer_id`) REFERENCES `developer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `website_priviledge_website_association` FOREIGN KEY (`website_id`) REFERENCES `website` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=291 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `website_priviledge`
--



--
-- Table structure for table `website_role`
--

DROP TABLE IF EXISTS `website_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `website_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `developer_id` int(11) NOT NULL,
  `website_id` int(11) NOT NULL,
  `role` varchar(45) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`),
  KEY `website_role_developer_association_idx` (`developer_id`),
  KEY `website_role_website_association_idx` (`website_id`),
  CONSTRAINT `website_role_developer_association` FOREIGN KEY (`developer_id`) REFERENCES `developer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `website_role_website_association` FOREIGN KEY (`website_id`) REFERENCES `website` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `website_role`
--



--
-- Table structure for table `widget`
--

DROP TABLE IF EXISTS `widget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `widget` (
  `id` int(11) NOT NULL,
  `name` varchar(45) CHARACTER SET latin1 NOT NULL,
  `type` varchar(45) CHARACTER SET latin1 NOT NULL,
  `text` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  `order` varchar(45) CHARACTER SET latin1 NOT NULL,
  `width/height` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  `url` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  `page` varchar(45) CHARACTER SET latin1 NOT NULL,
  `shareable` tinyint(4) DEFAULT NULL,
  `expandable` tinyint(4) DEFAULT NULL,
  `size` int(11) DEFAULT '2',
  `html` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  `src` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  `css_class` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  `css_style` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widget`
--



--
-- Final view structure for view `deleveloper_roles_and_privileges`
--

/*!50001 DROP VIEW IF EXISTS `deleveloper_roles_and_privileges`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`navyasaiporanki`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `deleveloper_roles_and_privileges` AS select distinct `p`.`first_name` AS `first_name`,`p`.`last_name` AS `last_name`,`p`.`username` AS `username`,`p`.`email` AS `email`,`website`.`name` AS `name`,`website`.`visits` AS `visits`,`website`.`updated` AS `updated`,`wr`.`role` AS `role`,`wp`.`priviledge` AS `priviledge`,`pages`.`name` AS `title`,`pages`.`views` AS `views`,`pages`.`update` AS `update`,`pr`.`role` AS `page_role`,`pp`.`priviledge` AS `page_priviledge` from (((((((`person` `p` join `developer` `d` on((`p`.`id` = `d`.`id`))) join `website_role` `wr` on((`p`.`id` = `wr`.`developer_id`))) join `website` on(((`website`.`id` = `wr`.`website_id`) and (`p`.`id` = `wr`.`developer_id`)))) join `website_priviledge` `wp` on(((`wp`.`developer_id` = `p`.`id`) and (`wp`.`website_id` = `website`.`id`)))) join `pages` on((`pages`.`id` = `website`.`id`))) join `page_role` `pr` on(((`pr`.`developer_id` = `p`.`id`) and (`pr`.`page_id` = `pages`.`id`)))) join `page_priviledge` `pp` on(((`pp`.`page_id` = `pr`.`page_id`) and (`pr`.`developer_id` = `pp`.`developer_id`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed
