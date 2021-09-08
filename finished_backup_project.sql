-- MySQL dump 10.13  Distrib 8.0.23, for macos10.15 (x86_64)
--
-- Host: localhost    Database: zoo
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `animal_details`
--

DROP TABLE IF EXISTS `animal_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `animal_details` (
  `animal_ID` varchar(50) NOT NULL,
  `animal_name` varchar(50) NOT NULL,
  `animal_type_ID` varchar(50) NOT NULL,
  `age_type` varchar(50) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `employee_ID` varchar(50) NOT NULL,
  PRIMARY KEY (`animal_ID`),
  KEY `animal_type_ID` (`animal_type_ID`),
  KEY `employee_ID` (`employee_ID`),
  CONSTRAINT `animal_details_ibfk_1` FOREIGN KEY (`animal_type_ID`) REFERENCES `animal_types` (`animal_type_ID`),
  CONSTRAINT `animal_details_ibfk_2` FOREIGN KEY (`employee_ID`) REFERENCES `employees` (`employee_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `animal_details`
--

LOCK TABLES `animal_details` WRITE;
/*!40000 ALTER TABLE `animal_details` DISABLE KEYS */;
INSERT INTO `animal_details` VALUES ('A1','Rosie','AT1','Adult','F','E1'),('A10','Pebbles','AT10','Baby','F','E4'),('A11','Ralph','AT11','Baby','M','E1'),('A12','Mina','AT12','Baby','F','E1'),('A13','Fergus','AT13','Baby','M','E2'),('A14','Jade','AT14','Baby','F','E2'),('A15','Luna','AT15','Baby','F','E4'),('A16','Lucky','AT8','Baby','M','E2'),('A2','Kurt','AT2','Adult','M','E1'),('A3','Celeste','AT3','Adult','F','E1'),('A4','Alba','AT4','Adult','F','E2'),('A5','Alvin','AT5','Adult','M','E3'),('A6','Fred','AT6','Adult','M','E4'),('A7','Mike','AT7','Adult','M','E3'),('A8','Nala','AT8','Adult','F','E2'),('A9','Opal','AT9','Adult','F','E4');
/*!40000 ALTER TABLE `animal_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `animal_food`
--

DROP TABLE IF EXISTS `animal_food`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `animal_food` (
  `animal_ID` varchar(50) NOT NULL,
  `supplier_ID` varchar(50) NOT NULL,
  `food_name` varchar(50) NOT NULL,
  `feeding_time` varchar(50) NOT NULL,
  `feeding_amount` varchar(50) DEFAULT NULL,
  `intolerance` varchar(50) DEFAULT NULL,
  KEY `animal_ID` (`animal_ID`),
  KEY `supplier_ID` (`supplier_ID`),
  CONSTRAINT `animal_food_ibfk_1` FOREIGN KEY (`animal_ID`) REFERENCES `animal_details` (`animal_ID`),
  CONSTRAINT `animal_food_ibfk_2` FOREIGN KEY (`supplier_ID`) REFERENCES `supplier` (`supplier_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `animal_food`
--

LOCK TABLES `animal_food` WRITE;
/*!40000 ALTER TABLE `animal_food` DISABLE KEYS */;
INSERT INTO `animal_food` VALUES ('A1','S1','Red meat','12pm','3kg',NULL),('A2','S5','Grass','1pm','3kg','Carrots'),('A3','S5','Christmas trees','10am','4kg',NULL),('A4','S3','Red meat','2pm','2kg','Cinnamon'),('A5','S5','Leaves','11am','2kg',NULL),('A6','S1','Sea urchins','2pm','0.8kg',NULL),('A7','S1','Crabs','3pm','1kg',NULL),('A8','S4','Ants','11am','2kg','Tomatoes'),('A9','S1','Fish','10am','0.8kg','Pineapple'),('A10','S1','Fish','10am','0.8kg','Pineapple'),('A11','S1','Red meat','12pm','1kg',NULL),('A12','S5','Grass','1pm','1.5kg','Apples'),('A13','S4','Ants','11am','1kg',NULL),('A14','S3','Red meat','2pm','1kg','Cinnamon'),('A15','S1','Fish','10am','0.4kg','Pineapple');
/*!40000 ALTER TABLE `animal_food` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `animal_health`
--

DROP TABLE IF EXISTS `animal_health`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `animal_health` (
  `animal_details_ID` varchar(50) DEFAULT NULL,
  `age_years` int NOT NULL,
  `health_status` varchar(50) DEFAULT NULL,
  `medication_ID` varchar(50) DEFAULT NULL,
  `operation` varchar(80) DEFAULT NULL,
  KEY `medication_ID` (`medication_ID`),
  KEY `animal_details_ID` (`animal_details_ID`),
  CONSTRAINT `animal_health_ibfk_1` FOREIGN KEY (`medication_ID`) REFERENCES `animal_medication` (`medication_ID`),
  CONSTRAINT `animal_health_ibfk_2` FOREIGN KEY (`animal_details_ID`) REFERENCES `animal_details` (`animal_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `animal_health`
--

LOCK TABLES `animal_health` WRITE;
/*!40000 ALTER TABLE `animal_health` DISABLE KEYS */;
INSERT INTO `animal_health` VALUES ('A1',8,'post-partum','M1','leg surgery'),('A2',13,'healthy',NULL,NULL),('A3',14,'healthy','M3','tooth surgery'),('A4',9,'healthy',NULL,'head surgery'),('A5',6,'healthy','M1',NULL),('A6',9,'healthy',NULL,NULL),('A7',4,'injured beak','M2','Awaiting tooth surgery'),('A8',12,'healthy','M3',NULL),('A9',6,'healthy',NULL,NULL),('A10',5,'healthy',NULL,'stomache surgery'),('A11',5,'healthy','M3',NULL),('A12',4,'healthy',NULL,NULL),('A13',3,'healthy',NULL,NULL),('A14',1,'healthy',NULL,NULL),('A15',2,'injured foot','M3','Awaiting tooth surgery');
/*!40000 ALTER TABLE `animal_health` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `animal_medication`
--

DROP TABLE IF EXISTS `animal_medication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `animal_medication` (
  `medication_ID` varchar(50) NOT NULL,
  `medication_name` varchar(50) NOT NULL,
  `start_date` date DEFAULT NULL,
  `frequency` varchar(50) NOT NULL,
  PRIMARY KEY (`medication_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `animal_medication`
--

LOCK TABLES `animal_medication` WRITE;
/*!40000 ALTER TABLE `animal_medication` DISABLE KEYS */;
INSERT INTO `animal_medication` VALUES ('M1','Paracetamol','2021-05-10','Every 12hrs'),('M2','Tylenol','2021-02-19','Every 8hrs'),('M3','Tylenol','2021-04-22','Every 12hrs');
/*!40000 ALTER TABLE `animal_medication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `animal_types`
--

DROP TABLE IF EXISTS `animal_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `animal_types` (
  `animal_type_ID` varchar(50) NOT NULL,
  `animal_type` varchar(50) NOT NULL,
  PRIMARY KEY (`animal_type_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `animal_types`
--

LOCK TABLES `animal_types` WRITE;
/*!40000 ALTER TABLE `animal_types` DISABLE KEYS */;
INSERT INTO `animal_types` VALUES ('AT1','Polar bear'),('AT10','Macaroni Penguin'),('AT11','Polar bear'),('AT12','African Elephant'),('AT13','Giant Anteater'),('AT14','Amur Tiger'),('AT15','Macaroni Penguin'),('AT2','African Elephant'),('AT3','African Elephant'),('AT4','Amur Tiger'),('AT5','Pygmy Hippopotamus'),('AT6','Giant Pacific Octopus'),('AT7','Eastern White Pelican'),('AT8','Giant Anteater'),('AT9','Macaroni Penguin');
/*!40000 ALTER TABLE `animal_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contactinformation_supplier`
--

DROP TABLE IF EXISTS `contactinformation_supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contactinformation_supplier` (
  `supplier_ID` varchar(50) NOT NULL,
  `email_address` varchar(50) NOT NULL,
  `telephone_number` varchar(50) NOT NULL,
  KEY `supplier_ID` (`supplier_ID`),
  CONSTRAINT `contactinformation_supplier_ibfk_1` FOREIGN KEY (`supplier_ID`) REFERENCES `supplier` (`supplier_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contactinformation_supplier`
--

LOCK TABLES `contactinformation_supplier` WRITE;
/*!40000 ALTER TABLE `contactinformation_supplier` DISABLE KEYS */;
INSERT INTO `contactinformation_supplier` VALUES ('S1','+44(0)7946340254','londonfoodsupplyltd@hotmail.com'),('S2','+44(0)7857226155','jonnysrepair@gmail.com'),('S3','+49(0)6648515329','tigerraw@gmx.co.de'),('S4','+1(406)569-9946','zoowoods@gmail.com'),('S5','+33(0)7902511400','maryveg@gmx.fr'),('S6','+44(0)7945559378','goldcleaner@gmail.com'),('S7','+44(0)7459670415','Cuesocoltd@gmx.co.uk'),('S8','+44(0)7956338570','flexiblefun@hotmail.co.uk'),('S9','+32(0)76548349562','wildcatsltd@gmail.be');
/*!40000 ALTER TABLE `contactinformation_supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departments` (
  `department_ID` varchar(50) NOT NULL,
  `department_name` varchar(50) NOT NULL,
  `department_purpose` varchar(50) DEFAULT NULL,
  `department_budget` varchar(50) DEFAULT NULL,
  `department_manager` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`department_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES ('D1','Administration Office','Managing Business','20000','Allissa McLaughlin'),('D2','Zookeepers','Looking after the animals','2000000','Zoe Glower'),('D3','Cleaning','Responsible for general hygiene','50000','Adam Rose'),('D4','Safety and Protection','Keeping everyone safe 24/7','800000','Mark Largman'),('D5','Animal Nutrition','Feeding all animals','5000000','Susie Mark'),('D6','Animal Welfare','Animal health','50000000','Gregor Treehouse'),('D7','Accounting and Finance','Financial stability','66000','Olliver Silver'),('D8','Marketing and Event Planning','Future competitivenss','1000000','Marie Evans');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `employee_ID` varchar(20) NOT NULL,
  `name_employee` varchar(50) NOT NULL,
  `manager_id` varchar(50) DEFAULT NULL,
  `shift_schedule` varchar(50) NOT NULL,
  `department_ID` varchar(20) NOT NULL,
  PRIMARY KEY (`employee_ID`),
  KEY `department_ID` (`department_ID`),
  CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`department_ID`) REFERENCES `departments` (`department_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES ('E1','Ben Tattlinger','E3','Monday-Friday','D1'),('E10','Gwyneth Marlow','E12','Monday-Friday','D3'),('E11','Rosalie Xiong','E12','Wednesday-Sunday','D3'),('E12','Adam Rose',NULL,'Tuesday-Saturday','D3'),('E13','Robert Murley','E15','Monday-Friday','D4'),('E14','Allistair Grown','E15','Tuesday-Saturday','D4'),('E15','Mark Largman',NULL,'Wednesday-Sunday','D4'),('E16','Sonja Miller','E18','Monday-Friday','D5'),('E17','Lena Mubashi','E18','Wednesday-Sunday','D5'),('E18','Susie Mark',NULL,'Monday-Friday','D5'),('E19','Bartosch Grorsky','E21','Monday-Friday','D6'),('E2','Margret Klory','E3','Monday-Friday','D1'),('E20','Emily Waren','E21','Monday-Friday','D6'),('E21','Gregor Treehouse',NULL,'Wednesday-Sunday','D6'),('E22','Troy Da Simmler','E24','Monday-Friday','D7'),('E23','Anna Summer','E24','Monday-Friday','D7'),('E24','Olliver Silver',NULL,'Monday-Friday','D7'),('E25','Courtney Bruno','E27','Monday-Friday','D8'),('E26','Rory Finnlay','E27','Monday-Friday','D8'),('E27','Marie Evans',NULL,'Monday-Friday','D8'),('E3','Allissa McLaughlin',NULL,'Monday-Friday','D1'),('E5','Alfred McQueen','E7','Monday-Friday','D2'),('E6','John Craford','E9','Wednesday-Sunday','D2'),('E7','Peter Jolly','E9','Tuesday, Friday, Saturday','D2'),('E8','Rachel Somonol','E7','Wednesday-Sunday','D2'),('E9','Zoe Glower',NULL,'Monday-Sunday','D1');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `employee_fired` BEFORE DELETE ON `employees` FOR EACH ROW INSERT INTO past_employees
SET employee_ID = OLD.employee_ID,
name_employee = OLD.name_employee,
deactivated_on = current_timestamp() */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `past_employees`
--

DROP TABLE IF EXISTS `past_employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `past_employees` (
  `employee_ID` varchar(10) DEFAULT NULL,
  `name_employee` varchar(50) DEFAULT NULL,
  `deactivated_on` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `past_employees`
--

LOCK TABLES `past_employees` WRITE;
/*!40000 ALTER TABLE `past_employees` DISABLE KEYS */;
INSERT INTO `past_employees` VALUES ('E4','Lisa Johnson','2021-03-22 15:26:36');
/*!40000 ALTER TABLE `past_employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier` (
  `supplier_ID` varchar(50) NOT NULL,
  `supplier_name` varchar(50) NOT NULL,
  `supplier_address` varchar(50) NOT NULL,
  `supplier_postcode` varchar(50) NOT NULL,
  `supplier_city` varchar(50) NOT NULL,
  `supplier_country` varchar(50) DEFAULT NULL,
  `supplier_overseas` varchar(50) DEFAULT NULL,
  `supplier_regular` varchar(50) DEFAULT NULL,
  `supplier_relationshiplength` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`supplier_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES ('S1','London Food Supply','110 Chiswick High Road','W4 6HS','London','United Kingdom','No','Yes','6 years'),('S2','Jonnys Repair','55 Lower Ford Street','CV1 5PS','Coventry','United Kingdom','No','No','3 months'),('S3','Tiger Raw','1 Diamond Palace','50822','Berlin','Germany','Yes','Yes','4 years'),('S4','Zoo Woods','15 Yellow Lane','993276','Nevada','United States','Yes','Yes','10 years'),('S5','MaryVeg','Rue du Transport','75001','Paris','France','No','Yes','2 months'),('S6','Goldcleaner UK','10 John Moore Street','L2 5TS','Liverpool','United Kingdom','No','No','5 years'),('S7','Cueso UK','4 Derlonshire Road','SW3 5LO','Leeds','United Kingdom','Yes','No','4.5 years'),('S8','FlexibleFun','Market Place','BH5 4WK','Birmingham','United Kingdom','No','No','4 months'),('S9','WildCats','Belgique Rue','4 2000-2997','Antwerp','Belgium','No','Yes','2 months');
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-22 18:33:25
