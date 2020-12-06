-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: hospitaldb
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.16-MariaDB

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
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departments` (
  `did` int(9) NOT NULL,
  `dname` varchar(45) NOT NULL,
  `head` int(9) NOT NULL,
  PRIMARY KEY (`did`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1953,'Gynecology',0),(2168,'Emergency Services',0),(2551,'Cardiology',0),(2955,'Urology',0),(3783,'Gastroenterology',0),(4187,'General Surgery',0),(4827,'Dermatology',0),(5484,'Traditional Chinese Medicine',0),(5691,'ICU',0),(9290,'Psychology',0);
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diagnose`
--

DROP TABLE IF EXISTS `diagnose`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diagnose` (
  `dssn_diagnose` int(9) NOT NULL,
  `pssn_diagnose` int(9) NOT NULL,
  PRIMARY KEY (`dssn_diagnose`,`pssn_diagnose`),
  KEY `pssn_fk_idx` (`pssn_diagnose`),
  CONSTRAINT `dssn_diagnose_fk` FOREIGN KEY (`dssn_diagnose`) REFERENCES `doctors` (`dssn`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pssn_diagnose_fk` FOREIGN KEY (`pssn_diagnose`) REFERENCES `patients` (`pssn`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diagnose`
--

LOCK TABLES `diagnose` WRITE;
/*!40000 ALTER TABLE `diagnose` DISABLE KEYS */;
INSERT INTO `diagnose` VALUES (112135790,393915336),(150417692,179040864),(150417692,213790446),(161355222,947988893),(191249475,836630952),(203790522,882401283),(203790522,920075898),(273449008,153170679),(312228253,386222430),(312228253,462488533),(312228253,544394414),(312228253,975495306),(322408014,124661378),(322408014,193406448),(334153079,258481869),(334153079,707475423),(364975219,543603589),(364975219,781842447),(378778183,777583864),(410134016,289260942),(414715231,902089095),(431399529,558513199),(533369854,316816426),(533369854,819810948),(533369854,936978766),(543666088,797698980),(564462803,686814731),(564462803,828583923),(646838782,518943004),(646838782,865232015),(715966369,545546533),(715966369,842496239),(791775463,719211101),(791775463,874307007),(882870121,900355248),(882870121,946071338),(947920298,199440651),(947920298,604558597),(977291381,940229035),(977291381,987490318);
/*!40000 ALTER TABLE `diagnose` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctors`
--

DROP TABLE IF EXISTS `doctors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctors` (
  `dssn` int(9) NOT NULL,
  `drname` varchar(45) NOT NULL,
  `dob` date NOT NULL,
  `sex` char(1) NOT NULL,
  PRIMARY KEY (`dssn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctors`
--

LOCK TABLES `doctors` WRITE;
/*!40000 ALTER TABLE `doctors` DISABLE KEYS */;
INSERT INTO `doctors` VALUES (112135790,'Sharon Hanna','1966-05-16','F'),(131612946,'Christina Brown','1973-07-15','F'),(150417692,'Dominique Villarreal','1946-03-31','F'),(161355222,'Frank Davis','1970-11-02','M'),(191249475,'Victoria Garcia','1970-11-02','F'),(203790522,'Derek Fletcher','1982-02-27','M'),(273449008,'Daniel Davila','1973-07-21','M'),(312228253,'Nathan Allen','1987-05-19','M'),(322408014,'Stephanie Barton','1983-06-08','F'),(334153079,'Keith Garcia','1982-04-26','M'),(364975219,'Dr. Kimberly Harmon','1961-03-05','F'),(378778183,'Dana Beltran','1974-01-18','F'),(410134016,'Rodney Griffin','1955-01-27','M'),(414715231,'Victoria Bass','1978-03-02','F'),(431399529,'Dennis James','1972-11-04','M'),(448546147,'Martin Brown','1959-02-17','M'),(456315841,'Thomas Cruz','1961-09-10','M'),(533369854,'Jessica Knight','1957-10-03','F'),(543666088,'Ashley Vega','1987-10-27','F'),(552335665,'Deborah Davis','1986-11-23','F'),(564462803,'Melissa Waller','1974-11-20','F'),(646838782,'Amy Hall','1976-12-09','F'),(698141145,'Nathan Jones','1978-04-09','M'),(699640270,'Maria Castro','1972-09-27','F'),(715966369,'Mary Fitzgerald','1965-10-28','F'),(791775463,'Sarah Henderson','1976-05-29','F'),(882870121,'Michael Ruiz','1965-06-05','M'),(947216683,'Kristen Hernandez','1964-03-03','F'),(947920298,'Tim Wise','1950-06-28','M'),(977291381,'Devin Edwards','1954-08-18','M');
/*!40000 ALTER TABLE `doctors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emergency_contact`
--

DROP TABLE IF EXISTS `emergency_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emergency_contact` (
  `essn` int(9) NOT NULL,
  `ecname` varchar(45) NOT NULL,
  `phone` bigint(10) NOT NULL,
  PRIMARY KEY (`essn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emergency_contact`
--

LOCK TABLES `emergency_contact` WRITE;
/*!40000 ALTER TABLE `emergency_contact` DISABLE KEYS */;
INSERT INTO `emergency_contact` VALUES (110540816,'Virginia Marshall',8468358897),(126437804,'Rachel Baldwin',6188217964),(132936093,'Maria Rice',3117973355),(155945969,'Cynthia Russo',4816551979),(159610983,'Beth Williams',8534498169),(201700215,'Robert Miles',9488681823),(335366919,'Robert Phillips',1605886511),(375085280,'Francisco Douglas',2247567486),(384503866,'Joseph Obrien',9059229234),(394531187,'Monica Mcdaniel',9159649036),(430814579,'Timothy Martinez',9981262666),(436516608,'Rhonda Scott',8443482051),(446129522,'Elizabeth Powers',4453053304),(543337408,'Mark Mckenzie',9373641523),(548913353,'Pamela Flowers',2100223426),(562605885,'Vincent Wilson',7583012050),(594998752,'Anne Jackson',5906941364),(615758284,'Jason Smith',7141913616),(618878332,'Randy Washington PhD',3521992931),(625070101,'Anthony Mendez',6287979989),(625915132,'Megan Duran',3400196908),(643257564,'Bob Hubbard',5914822820),(693441343,'Barbara Schneider',4467562645),(694029238,'Joseph Hensley',8936742904),(705367778,'Frederick Reid',3354151986),(749127861,'Joshua Griffith',8356758418),(780278921,'Aaron Smith',2360419949),(802965403,'Jon Daniels',2171281907),(804162790,'Hannah Martinez',6978429144),(808242920,'Colin Hall',6669557775),(816112205,'Sarah Smith',6518427138),(838626828,'Austin Andrews',5097200616),(847297253,'Brooke Fleming',1864303660),(859154824,'David Knox',2268986804),(880002938,'Jacqueline Jennings',6092510740),(902234626,'Deborah Salazar',1644386889),(941413753,'Travis Sandoval',9397363440),(943272319,'Laura White',9683263978),(949662969,'Sara Nunez',7233355969),(998748155,'Jose Taylor',1756807623);
/*!40000 ALTER TABLE `emergency_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `has_ec`
--

DROP TABLE IF EXISTS `has_ec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `has_ec` (
  `essn_has_ec` int(9) NOT NULL,
  `pssn_has_ec` int(9) NOT NULL,
  PRIMARY KEY (`essn_has_ec`,`pssn_has_ec`),
  KEY `pssn_fk_idx` (`pssn_has_ec`),
  CONSTRAINT `essn_has_ec_fk` FOREIGN KEY (`essn_has_ec`) REFERENCES `emergency_contact` (`essn`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pssn_has_ec_fk` FOREIGN KEY (`pssn_has_ec`) REFERENCES `patients` (`pssn`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `has_ec`
--

LOCK TABLES `has_ec` WRITE;
/*!40000 ALTER TABLE `has_ec` DISABLE KEYS */;
INSERT INTO `has_ec` VALUES (110540816,900355248),(126437804,865232015),(132936093,797698980),(155945969,544394414),(159610983,545546533),(201700215,940229035),(335366919,874307007),(375085280,828583923),(384503866,936978766),(394531187,882401283),(430814579,393915336),(436516608,316816426),(446129522,819810948),(543337408,604558597),(548913353,836630952),(562605885,707475423),(594998752,975495306),(615758284,777583864),(618878332,258481869),(625070101,386222430),(625915132,543603589),(643257564,947988893),(693441343,462488533),(694029238,987490318),(705367778,781842447),(749127861,199440651),(780278921,686814731),(802965403,558513199),(804162790,213790446),(808242920,946071338),(816112205,920075898),(838626828,289260942),(847297253,518943004),(859154824,179040864),(880002938,193406448),(902234626,719211101),(941413753,153170679),(943272319,842496239),(949662969,124661378),(998748155,902089095);
/*!40000 ALTER TABLE `has_ec` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insurance`
--

DROP TABLE IF EXISTS `insurance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `insurance` (
  `iid` int(11) NOT NULL,
  `iname` varchar(45) NOT NULL,
  PRIMARY KEY (`iid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insurance`
--

LOCK TABLES `insurance` WRITE;
/*!40000 ALTER TABLE `insurance` DISABLE KEYS */;
INSERT INTO `insurance` VALUES (1134,'Kaiser Foundation'),(1743,'UnitedHealth'),(2521,'Cigna Health'),(4076,'Wellcare'),(5154,'Carefirst Inc.'),(5530,'Highmark Group'),(7265,'Anthem Inc.'),(7645,'Blue Cross Blue Shield'),(9362,'Humana'),(9540,'Metropolitan');
/*!40000 ALTER TABLE `insurance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insured`
--

DROP TABLE IF EXISTS `insured`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `insured` (
  `iid_insured` int(11) NOT NULL,
  `pssn_insured` int(9) NOT NULL,
  PRIMARY KEY (`iid_insured`,`pssn_insured`),
  KEY `ppsn_fk_idx` (`pssn_insured`),
  CONSTRAINT `iid_insured_fk` FOREIGN KEY (`iid_insured`) REFERENCES `insurance` (`iid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ppsn_insured_fk` FOREIGN KEY (`pssn_insured`) REFERENCES `patients` (`pssn`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insured`
--

LOCK TABLES `insured` WRITE;
/*!40000 ALTER TABLE `insured` DISABLE KEYS */;
INSERT INTO `insured` VALUES (1134,124661378),(1134,819810948),(1134,865232015),(1134,936978766),(1743,947988893),(1743,987490318),(2521,213790446),(2521,462488533),(2521,707475423),(2521,777583864),(2521,842496239),(2521,940229035),(4076,179040864),(4076,258481869),(4076,604558597),(4076,920075898),(4076,946071338),(5154,199440651),(5154,393915336),(5530,316816426),(5530,386222430),(5530,543603589),(5530,836630952),(5530,874307007),(7265,289260942),(7265,544394414),(7265,686814731),(7265,975495306),(7645,882401283),(9362,518943004),(9362,545546533),(9362,828583923),(9362,902089095),(9540,153170679),(9540,193406448),(9540,558513199),(9540,719211101),(9540,781842447),(9540,797698980),(9540,900355248);
/*!40000 ALTER TABLE `insured` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nurses`
--

DROP TABLE IF EXISTS `nurses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nurses` (
  `nssn` int(9) NOT NULL,
  `nname` varchar(45) NOT NULL,
  `sex` char(1) NOT NULL,
  `dob` date NOT NULL,
  PRIMARY KEY (`nssn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nurses`
--

LOCK TABLES `nurses` WRITE;
/*!40000 ALTER TABLE `nurses` DISABLE KEYS */;
INSERT INTO `nurses` VALUES (144561362,'Michael Fitzpatrick','M','1987-12-28'),(153043429,'Diane Poole','F','1977-09-19'),(247023403,'Anthony Nguyen','M','1993-03-21'),(264928545,'Ryan Atkinson','M','1959-01-17'),(356418973,'Peggy Lee','F','1995-02-18'),(360137419,'Patrick Ruiz','M','1985-07-06'),(431102026,'Erin Cook','F','1993-03-03'),(452340764,'Megan Phillips MD','F','1973-12-18'),(462181015,'Margaret Jacobs','F','1985-05-19'),(478202206,'Christina Rodriguez','F','1987-04-30'),(692894722,'Ashley Villanueva','F','1988-07-15'),(752722398,'Kathleen Jones','F','1980-12-14'),(804358707,'Herbert Johnson','M','1950-11-29'),(949225063,'Harold Guzman','M','1977-05-28'),(985938907,'Robert Francis','M','1972-12-22');
/*!40000 ALTER TABLE `nurses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patients`
--

DROP TABLE IF EXISTS `patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patients` (
  `pssn` int(9) NOT NULL,
  `pname` varchar(45) NOT NULL,
  `sex` char(1) NOT NULL,
  `dob` date NOT NULL,
  `weight` int(3) NOT NULL,
  `diagnosis` varchar(45) NOT NULL,
  PRIMARY KEY (`pssn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients`
--

LOCK TABLES `patients` WRITE;
/*!40000 ALTER TABLE `patients` DISABLE KEYS */;
INSERT INTO `patients` VALUES (124661378,'James Reyes','M','2005-11-27',121,'Urinary tract infection'),(153170679,'David Higgins','M','1941-08-07',89,'Diabetes'),(179040864,'Ricardo Robertson','M','1987-07-13',291,'Diabetes'),(193406448,'Brandon Phillips','M','1971-12-21',86,'Allergic rhinitis'),(199440651,'Derek Davis Jr.','M','1967-07-01',275,'Dead'),(213790446,'Martin Lozano','M','2005-08-18',206,'Diabetes'),(258481869,'Lisa Mckinney','F','1957-07-28',220,'Diabetes'),(289260942,'Ryan Rogers','M','1998-12-21',124,'Reflux esophagitis'),(316816426,'John Benitez','M','1964-11-12',181,'Hypothyroidism'),(386222430,'Andrea Stewart','F','1945-02-22',84,'Covid-19'),(393915336,'Kelly Nelson','F','1953-08-18',206,'Allergic rhinitis'),(462488533,'Tim Williamson','M','1975-08-26',208,'Allergic rhinitis'),(518943004,'April Gonzalez','F','1973-12-31',91,'Hypertension'),(543603589,'Thomas Parsons','M','1946-09-04',236,'Diabetes'),(544394414,'Bryan Johnson','M','1936-10-20',184,'Nail fungus'),(545546533,'Natasha Whitehead','F','2004-08-10',231,'Reflux esophagitis'),(558513199,'Bradley Klein','M','2001-09-25',296,'Acute bronchitisAsthma'),(604558597,'Peter Fowler','M','1917-02-07',119,'Reflux esophagitis'),(686814731,'Molly Dixon','F','1937-12-21',175,'Fibromyalgia '),(707475423,'Dylan Miller','M','1963-03-19',270,'Hyperlipidemia'),(719211101,'Robert Fitzgerald','M','1982-11-17',146,'Hypertension'),(777583864,'Alyssa Rivera','F','2002-05-29',200,'Reflux esophagitis'),(781842447,'Jordan Chung','F','1987-10-17',217,'Dry skin'),(797698980,'Kristin Johnson','F','1972-08-19',103,'Hypothyroidism'),(819810948,'Jill Garcia','F','1985-03-07',257,'Hypertension'),(828583923,'Cynthia Ibarra','F','1992-08-31',117,'Urinary tract infection'),(836630952,'Curtis Fitzgerald','M','1984-02-15',168,'Anxiety'),(842496239,'Ashley Delacruz','F','1931-11-06',281,'Anxiety'),(865232015,'Karen Gray','F','1945-01-29',245,'Acute laryngopharyngitis'),(874307007,'Jonathan Mclaughlin','M','1919-09-28',142,'Fibromyalgia '),(882401283,'Darlene House','F','1935-07-04',129,'Hypothyroidism'),(900355248,'Kyle Mills','M','1958-09-13',112,'Urinary tract infection'),(902089095,'Lynn Carter','F','1947-02-09',165,'Dry skin'),(920075898,'Christina Lam','F','1950-12-02',275,'Hypertension'),(936978766,'Elizabeth Washington','F','1925-02-21',279,'Acute bronchitisAsthma'),(940229035,'James Mahoney','M','1959-02-04',191,'ADHD'),(946071338,'Heather Sandoval','F','1940-06-25',226,'Anxiety'),(947988893,'Jessica Joyce','F','1977-10-17',292,'Fibromyalgia '),(975495306,'Tanya Hicks','F','1985-08-13',170,'Dry skin'),(987490318,'Alexander Vasquez','M','2003-09-27',149,'Acute laryngopharyngitis');
/*!40000 ALTER TABLE `patients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `treats`
--

DROP TABLE IF EXISTS `treats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `treats` (
  `nssn_treats` int(9) NOT NULL,
  `pssn_treats` int(9) NOT NULL,
  PRIMARY KEY (`nssn_treats`,`pssn_treats`),
  KEY `pssn_fk_idx` (`pssn_treats`),
  CONSTRAINT `nssn_treats_fk` FOREIGN KEY (`nssn_treats`) REFERENCES `nurses` (`nssn`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pssn_treats_fk` FOREIGN KEY (`pssn_treats`) REFERENCES `patients` (`pssn`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treats`
--

LOCK TABLES `treats` WRITE;
/*!40000 ALTER TABLE `treats` DISABLE KEYS */;
INSERT INTO `treats` VALUES (144561362,258481869),(144561362,386222430),(153043429,920075898),(153043429,947988893),(153043429,975495306),(247023403,153170679),(264928545,179040864),(264928545,199440651),(264928545,544394414),(264928545,604558597),(264928545,828583923),(356418973,543603589),(356418973,558513199),(356418973,707475423),(356418973,882401283),(360137419,545546533),(360137419,940229035),(360137419,987490318),(431102026,393915336),(431102026,797698980),(431102026,836630952),(452340764,213790446),(452340764,289260942),(452340764,518943004),(452340764,902089095),(462181015,462488533),(462181015,900355248),(478202206,316816426),(478202206,686814731),(478202206,874307007),(692894722,193406448),(752722398,719211101),(752722398,819810948),(752722398,842496239),(804358707,865232015),(949225063,936978766),(985938907,124661378),(985938907,777583864),(985938907,781842447),(985938907,946071338);
/*!40000 ALTER TABLE `treats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `works_in`
--

DROP TABLE IF EXISTS `works_in`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `works_in` (
  `dssn_works_in` int(9) NOT NULL,
  `did_works_in` int(11) NOT NULL,
  PRIMARY KEY (`dssn_works_in`,`did_works_in`),
  KEY `did_works_in_fk_idx` (`did_works_in`),
  CONSTRAINT `did_works_in_fk` FOREIGN KEY (`did_works_in`) REFERENCES `departments` (`did`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `dssn_works_in_fk` FOREIGN KEY (`dssn_works_in`) REFERENCES `doctors` (`dssn`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `works_in`
--

LOCK TABLES `works_in` WRITE;
/*!40000 ALTER TABLE `works_in` DISABLE KEYS */;
INSERT INTO `works_in` VALUES (112135790,1953),(131612946,2168),(150417692,2168),(161355222,2955),(191249475,3783),(203790522,1953),(273449008,2168),(312228253,5484),(322408014,5691),(334153079,4187),(364975219,9290),(378778183,3783),(410134016,2955),(414715231,4827),(431399529,3783),(448546147,4827),(456315841,1953),(533369854,4187),(543666088,2955),(552335665,2168),(564462803,9290),(646838782,5691),(698141145,4187),(699640270,5484),(715966369,5484),(791775463,2955),(882870121,9290),(947216683,9290),(947920298,2168),(977291381,4827);
/*!40000 ALTER TABLE `works_in` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-06  2:51:38
