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
  KEY `pssn_fk_idx` (`pssn_diagnose`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diagnose`
--

LOCK TABLES `diagnose` WRITE;
/*!40000 ALTER TABLE `diagnose` DISABLE KEYS */;
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
  `phone` int(10) NOT NULL,
  PRIMARY KEY (`essn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emergency_contact`
--

LOCK TABLES `emergency_contact` WRITE;
/*!40000 ALTER TABLE `emergency_contact` DISABLE KEYS */;
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
  CONSTRAINT `iid_fk` FOREIGN KEY (`iid_insured`) REFERENCES `insurance` (`iid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ppsn_fk` FOREIGN KEY (`pssn_insured`) REFERENCES `patients` (`pssn`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insured`
--

LOCK TABLES `insured` WRITE;
/*!40000 ALTER TABLE `insured` DISABLE KEYS */;
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
INSERT INTO `patients` VALUES (104746824,'Natasha Schmidt','F','0000-00-00',103,''),(156164487,'Mrs. Rachael Schroeder','F','0000-00-00',172,''),(185046064,'Toni Hamilton','F','0000-00-00',240,''),(200257369,'Kevin Watkins','M','0000-00-00',172,''),(206691081,'Daniel Jones','M','0000-00-00',282,''),(241507547,'Miranda Brown','F','0000-00-00',96,''),(252284321,'Steven Brown','M','0000-00-00',87,''),(256613962,'Cathy Klein','F','0000-00-00',173,''),(326076045,'Louis Richardson','M','0000-00-00',148,''),(353523642,'Shawn Garrett','M','0000-00-00',183,''),(368488402,'Richard Garcia','M','0000-00-00',207,''),(408810092,'Alexandra Goodman','F','0000-00-00',277,''),(416178369,'Ryan Miller','M','0000-00-00',139,''),(421633163,'Laura Massey','F','0000-00-00',174,''),(434248174,'Joseph Ramirez','M','0000-00-00',127,''),(444457705,'Nicholas Wade','M','0000-00-00',143,''),(545033059,'David Fox','M','0000-00-00',166,''),(560458179,'Michael Russell','M','0000-00-00',170,''),(606920042,'Logan Fox','M','0000-00-00',287,''),(608231071,'Marcus Vaughn','M','0000-00-00',219,''),(630985777,'Angela Williams','F','0000-00-00',227,''),(631482001,'Mr. William Ramirez','M','0000-00-00',207,''),(633171880,'Katrina Davidson','F','0000-00-00',111,''),(637557914,'Robert Rodriguez','M','0000-00-00',231,''),(637685524,'Kathy Robinson','F','0000-00-00',154,''),(655411964,'Eddie Russell','M','0000-00-00',192,''),(686088295,'Heather Martinez','F','0000-00-00',154,''),(734329154,'James Nelson','M','0000-00-00',135,''),(771102291,'Matthew Medina','M','0000-00-00',203,''),(782287209,'Raymond Contreras','M','0000-00-00',229,''),(827821398,'Gregory Martinez','M','0000-00-00',208,''),(838094072,'Mark Russell','M','0000-00-00',145,''),(840409397,'Crystal Daniels','F','0000-00-00',163,''),(883248655,'James Smith','M','0000-00-00',171,''),(907172978,'Maria Campbell','F','0000-00-00',166,''),(916337600,'Mr. George Conrad','M','0000-00-00',256,''),(936870213,'Curtis Huerta','M','0000-00-00',104,''),(959605779,'Scott Singh','M','0000-00-00',151,''),(983365927,'Yvonne Kelly','F','0000-00-00',185,''),(989245587,'Robert Cox','M','0000-00-00',261,'');
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
  CONSTRAINT `nssn_fk` FOREIGN KEY (`nssn_treats`) REFERENCES `nurses` (`nssn`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pssn_fk` FOREIGN KEY (`pssn_treats`) REFERENCES `patients` (`pssn`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treats`
--

LOCK TABLES `treats` WRITE;
/*!40000 ALTER TABLE `treats` DISABLE KEYS */;
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
  CONSTRAINT `did_works_in_fk` FOREIGN KEY (`dssn_works_in`) REFERENCES `departments` (`did`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `dssn_works_in_fk` FOREIGN KEY (`dssn_works_in`) REFERENCES `doctors` (`dssn`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `works_in`
--

LOCK TABLES `works_in` WRITE;
/*!40000 ALTER TABLE `works_in` DISABLE KEYS */;
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

-- Dump completed on 2020-12-05 22:39:35
