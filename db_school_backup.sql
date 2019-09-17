-- MySQL dump 10.13  Distrib 5.7.27, for Linux (x86_64)
--
-- Host: localhost    Database: db_school
-- ------------------------------------------------------
-- Server version	5.7.27-0ubuntu0.18.04.1

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
-- Table structure for table `activity`
--

DROP TABLE IF EXISTS `activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity` varchar(50) NOT NULL,
  `details` varchar(250) NOT NULL,
  `date` date NOT NULL,
  `submission_date` date NOT NULL,
  `sections_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `school_id` int(11) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` date DEFAULT NULL,
  `active` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `sections_id` (`sections_id`),
  CONSTRAINT `activity_ibfk_1` FOREIGN KEY (`sections_id`) REFERENCES `sections` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity`
--

LOCK TABLES `activity` WRITE;
/*!40000 ALTER TABLE `activity` DISABLE KEYS */;
INSERT INTO `activity` VALUES (1,'21312','2312','2019-08-04','2019-08-25',34,1,3,34,'2019-08-28',NULL,NULL,1),(2,'22','22','2019-08-18','2019-08-31',34,1,3,34,'2019-08-29',NULL,NULL,1);
/*!40000 ALTER TABLE `activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attendance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `attendance` int(11) NOT NULL,
  `sections_id` int(11) NOT NULL,
  `students_id` int(11) NOT NULL,
  `teachers_id` int(11) NOT NULL,
  `school_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `class_id` (`class_id`,`sections_id`),
  KEY `sections_id` (`sections_id`),
  KEY `students_id` (`students_id`),
  KEY `teachers_id` (`teachers_id`),
  KEY `school_id` (`school_id`),
  CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`sections_id`) REFERENCES `sections` (`id`),
  CONSTRAINT `attendance_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `class` (`id`),
  CONSTRAINT `attendance_ibfk_3` FOREIGN KEY (`students_id`) REFERENCES `students` (`id`),
  CONSTRAINT `attendance_ibfk_4` FOREIGN KEY (`teachers_id`) REFERENCES `teachers` (`id`),
  CONSTRAINT `attendance_ibfk_5` FOREIGN KEY (`school_id`) REFERENCES `school` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance`
--

LOCK TABLES `attendance` WRITE;
/*!40000 ALTER TABLE `attendance` DISABLE KEYS */;
/*!40000 ALTER TABLE `attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backgrounds`
--

DROP TABLE IF EXISTS `backgrounds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backgrounds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wallpaper` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `page-name` varchar(250) NOT NULL,
  `school_id` int(11) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` date DEFAULT NULL,
  `active` int(11) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `school_id` (`school_id`),
  CONSTRAINT `backgrounds_ibfk_1` FOREIGN KEY (`school_id`) REFERENCES `school` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backgrounds`
--

LOCK TABLES `backgrounds` WRITE;
/*!40000 ALTER TABLE `backgrounds` DISABLE KEYS */;
INSERT INTO `backgrounds` VALUES (3,'logo1.png','2019-03-02','',9,1,'2019-09-04',NULL,NULL,1),(4,'index.jpeg','2007-08-05','',7,1,'2019-09-04',1,'2019-09-04',1),(5,'index1.jpeg','2018-05-05','',5,1,'2019-09-04',NULL,NULL,1);
/*!40000 ALTER TABLE `backgrounds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bus`
--

DROP TABLE IF EXISTS `bus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bus_number` varchar(110) NOT NULL,
  `route_id` int(11) NOT NULL,
  `student_strength` int(11) NOT NULL,
  `drivers_id` varchar(110) DEFAULT NULL,
  `school_id` int(11) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` date DEFAULT NULL,
  `active` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `bus_number` (`bus_number`),
  KEY `school_id` (`school_id`),
  CONSTRAINT `bus_ibfk_1` FOREIGN KEY (`school_id`) REFERENCES `school` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bus`
--

LOCK TABLES `bus` WRITE;
/*!40000 ALTER TABLE `bus` DISABLE KEYS */;
INSERT INTO `bus` VALUES (6,'mh12313213',15,23,'1,6',3,NULL,NULL,NULL,NULL,1),(25,'mh4344',18,232,'5,1',3,NULL,NULL,NULL,NULL,1),(26,'mh1111',15,11,'1,5,6',3,NULL,NULL,34,'2019-08-24',1);
/*!40000 ALTER TABLE `bus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class`
--

DROP TABLE IF EXISTS `class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class`
--

LOCK TABLES `class` WRITE;
/*!40000 ALTER TABLE `class` DISABLE KEYS */;
INSERT INTO `class` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10),(11,11),(12,12);
/*!40000 ALTER TABLE `class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drivers`
--

DROP TABLE IF EXISTS `drivers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drivers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `users_id` int(11) NOT NULL,
  `drivers_name` varchar(50) NOT NULL,
  `drivers_address` varchar(250) NOT NULL,
  `drivers_mobile` int(11) NOT NULL,
  `join_date` date NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` date DEFAULT NULL,
  `active` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drivers`
--

LOCK TABLES `drivers` WRITE;
/*!40000 ALTER TABLE `drivers` DISABLE KEYS */;
INSERT INTO `drivers` VALUES (1,37,'Ashutosh verma','Higna',2147483647,'2019-07-03',NULL,NULL,34,'2019-08-24',1),(5,47,'abc','abc',2312321,'2019-08-16',NULL,NULL,34,'2019-08-24',1),(6,48,'d1','d1',2147483647,'2019-08-16',NULL,NULL,34,'2019-08-24',1),(7,84,'d12','12',12,'2007-01-19',34,'2019-08-24',NULL,NULL,1),(8,85,'d11','11',11,'2007-01-19',34,'2019-08-24',NULL,NULL,1),(9,86,'d33','11',11,'2007-01-19',34,'2019-08-24',NULL,NULL,1);
/*!40000 ALTER TABLE `drivers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_type`
--

DROP TABLE IF EXISTS `exam_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exam_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(250) NOT NULL,
  `school_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `school_id` (`school_id`),
  CONSTRAINT `exam_type_ibfk_1` FOREIGN KEY (`school_id`) REFERENCES `school` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_type`
--

LOCK TABLES `exam_type` WRITE;
/*!40000 ALTER TABLE `exam_type` DISABLE KEYS */;
INSERT INTO `exam_type` VALUES (1,'unit 1',3),(2,'unit 2',3);
/*!40000 ALTER TABLE `exam_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exams`
--

DROP TABLE IF EXISTS `exams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exams` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_id` int(11) NOT NULL,
  `sections_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `subject` varchar(50) NOT NULL,
  `exam_type_id` int(11) NOT NULL,
  `school_id` int(11) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` date DEFAULT NULL,
  `active` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `class_id` (`class_id`),
  CONSTRAINT `exams_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `class` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exams`
--

LOCK TABLES `exams` WRITE;
/*!40000 ALTER TABLE `exams` DISABLE KEYS */;
INSERT INTO `exams` VALUES (8,1,34,'2019-08-27','21:00:00','Marathi',1,3,NULL,NULL,NULL,NULL,1),(10,1,34,'2019-08-31','03:00:00','Geography',2,3,NULL,NULL,NULL,NULL,1),(11,1,34,'2019-09-01','04:03:00','Maths',2,3,NULL,NULL,34,'2019-08-28',1);
/*!40000 ALTER TABLE `exams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faq`
--

DROP TABLE IF EXISTS `faq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faq` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `school_id` int(11) NOT NULL,
  `questions` varchar(250) NOT NULL,
  `answers` text NOT NULL,
  `date` date NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` date DEFAULT NULL,
  `active` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `school_id` (`school_id`),
  CONSTRAINT `faq_ibfk_1` FOREIGN KEY (`school_id`) REFERENCES `school` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faq`
--

LOCK TABLES `faq` WRITE;
/*!40000 ALTER TABLE `faq` DISABLE KEYS */;
INSERT INTO `faq` VALUES (2,3,'Does learning happen outside the classroom? ','What percentage of the school week is typically spent in the classroom and what percentage in labs and sports?  Do children go on field trips or visits to local museums?  Do they meet achievers in various fields?  Making real world connections to what children learn inside the classrooms are becoming very important.  Classrooms are the most artificial of places in the real world.  Many schools have started designing programs to ensure children see the purpose of their learning, by being exposed to the real world.','2019-07-14',NULL,NULL,34,'2019-08-28',1);
/*!40000 ALTER TABLE `faq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fees`
--

DROP TABLE IF EXISTS `fees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_id` int(11) NOT NULL,
  `sections_id` int(11) NOT NULL,
  `students_id` int(11) NOT NULL,
  `fees_paid` int(11) NOT NULL,
  `date` date NOT NULL,
  `annual_fees` int(11) NOT NULL,
  `total_fees` int(11) NOT NULL,
  `type_payment` varchar(200) NOT NULL,
  `school_id` int(11) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` date DEFAULT NULL,
  `active` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `teacher_details_id` (`students_id`),
  KEY `students_id` (`students_id`),
  CONSTRAINT `fees_ibfk_1` FOREIGN KEY (`students_id`) REFERENCES `students` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fees`
--

LOCK TABLES `fees` WRITE;
/*!40000 ALTER TABLE `fees` DISABLE KEYS */;
INSERT INTO `fees` VALUES (1,1,34,12,500,'2019-08-27',10000,0,'Cash',3,NULL,NULL,34,'2019-08-28',1);
/*!40000 ALTER TABLE `fees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `home_page_menu`
--

DROP TABLE IF EXISTS `home_page_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `home_page_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(250) NOT NULL,
  `page_name` varchar(250) NOT NULL,
  `school_id` int(11) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` date DEFAULT NULL,
  `active` int(11) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `school_id` (`school_id`),
  CONSTRAINT `home_page_menu_ibfk_1` FOREIGN KEY (`school_id`) REFERENCES `school` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_page_menu`
--

LOCK TABLES `home_page_menu` WRITE;
/*!40000 ALTER TABLE `home_page_menu` DISABLE KEYS */;
INSERT INTO `home_page_menu` VALUES (1,'Notify','Notication',4,NULL,NULL,NULL,NULL,1),(2,'Fees','Fees',4,NULL,NULL,1,'2019-08-14',1),(3,'Fees','Fees',3,NULL,NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `home_page_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `homework`
--

DROP TABLE IF EXISTS `homework`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `homework` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_id` int(11) NOT NULL,
  `sections_id` int(11) NOT NULL,
  `students_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `subject` varchar(50) NOT NULL,
  `details` varchar(200) NOT NULL,
  `image` varchar(200) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `submission_date` date NOT NULL,
  `school_id` int(11) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` date DEFAULT NULL,
  `active` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `class_id` (`class_id`,`students_id`,`teacher_id`),
  KEY `students_id` (`students_id`),
  KEY `teacher_details_id` (`teacher_id`),
  CONSTRAINT `homework_ibfk_2` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`),
  CONSTRAINT `homework_ibfk_3` FOREIGN KEY (`class_id`) REFERENCES `class` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `homework`
--

LOCK TABLES `homework` WRITE;
/*!40000 ALTER TABLE `homework` DISABLE KEYS */;
INSERT INTO `homework` VALUES (1,1,34,0,'2019-08-02','Marathi','234234','visitor.png',2,'2019-08-28',3,34,'2019-08-28',107,'2019-09-04',1),(2,1,34,0,'2019-08-24','Hindi','22','Screenshot_from_2019-09-03_17-12-56.png',1,'2019-09-29',3,34,'2019-08-29',107,'2019-09-04',1);
/*!40000 ALTER TABLE `homework` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marks`
--

DROP TABLE IF EXISTS `marks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_id` int(11) NOT NULL,
  `students_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `marks` int(11) NOT NULL,
  `out_of` int(11) NOT NULL,
  `subject` varchar(50) NOT NULL,
  `competence` varchar(50) NOT NULL,
  `school_id` int(11) NOT NULL,
  `exam_type_id` int(11) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` date DEFAULT NULL,
  `active` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `teacher_details_id` (`teacher_id`,`students_id`),
  KEY `students_id` (`students_id`),
  CONSTRAINT `marks_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`),
  CONSTRAINT `marks_ibfk_2` FOREIGN KEY (`students_id`) REFERENCES `students` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marks`
--

LOCK TABLES `marks` WRITE;
/*!40000 ALTER TABLE `marks` DISABLE KEYS */;
INSERT INTO `marks` VALUES (3,1,12,'2019-08-10',89,100,'Marathi','334',3,1,NULL,NULL,34,'2019-08-28',1);
/*!40000 ALTER TABLE `marks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roles_id` varchar(110) NOT NULL,
  `class_id` int(11) DEFAULT NULL,
  `sections_id` int(11) DEFAULT NULL,
  `school_id` int(11) NOT NULL,
  `message` varchar(250) NOT NULL,
  `datetime` date NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` date DEFAULT NULL,
  `active` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `roles_id` (`roles_id`,`school_id`),
  KEY `school_id` (`school_id`),
  CONSTRAINT `notification_ibfk_1` FOREIGN KEY (`school_id`) REFERENCES `school` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
INSERT INTO `notification` VALUES (2,'Section',1,34,3,'Section test Section test Section test Section test','2019-07-19',NULL,NULL,34,'2019-08-30',1),(3,'Section',1,34,3,'test2','2019-08-31',NULL,NULL,NULL,NULL,1),(4,'Teacher',0,0,3,'test teacher','2019-08-25',NULL,NULL,NULL,NULL,1),(5,'Student',0,0,3,'2112','2019-08-18',NULL,NULL,NULL,NULL,1),(6,'Student',0,0,3,'Hello','2019-09-04',34,'2019-09-04',NULL,NULL,1);
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pickup_point`
--

DROP TABLE IF EXISTS `pickup_point`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pickup_point` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pickup_point` varchar(255) NOT NULL,
  `longitude` varchar(110) NOT NULL,
  `lattitude` varchar(110) NOT NULL,
  `school_id` varchar(50) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` date DEFAULT NULL,
  `active` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pickup_point`
--

LOCK TABLES `pickup_point` WRITE;
/*!40000 ALTER TABLE `pickup_point` DISABLE KEYS */;
INSERT INTO `pickup_point` VALUES (3,'erwr','342.67','4332.12','3',NULL,NULL,34,'2019-08-24',1),(4,'khamla','345324.51111','34535.711111','3',NULL,NULL,NULL,NULL,1),(6,'Khamla Sq','234234.324','345.76','3',NULL,NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `pickup_point` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `practice`
--

DROP TABLE IF EXISTS `practice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `practice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_id` int(11) NOT NULL,
  `sections_id` int(11) NOT NULL,
  `image` varchar(250) NOT NULL,
  `subject` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `school_id` int(11) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` date DEFAULT NULL,
  `active` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `class_id` (`class_id`),
  CONSTRAINT `practice_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `class` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `practice`
--

LOCK TABLES `practice` WRITE;
/*!40000 ALTER TABLE `practice` DISABLE KEYS */;
INSERT INTO `practice` VALUES (1,1,34,'download_(1).jpeg','Marathi','2019-08-17',3,34,'2019-08-28',34,'2019-09-04',1);
/*!40000 ALTER TABLE `practice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(55) NOT NULL,
  `menu_allowed` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin',''),(2,'School Admin','');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `route`
--

DROP TABLE IF EXISTS `route`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `route` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pickup_point_id` varchar(110) DEFAULT NULL,
  `route_name` varchar(100) NOT NULL,
  `school_id` int(11) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` date DEFAULT NULL,
  `active` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `route`
--

LOCK TABLES `route` WRITE;
/*!40000 ALTER TABLE `route` DISABLE KEYS */;
INSERT INTO `route` VALUES (15,'4,3','AAAA',3,NULL,NULL,34,'2019-08-24',1),(18,'4,3,6','XYZ',3,NULL,NULL,34,'2019-08-24',1),(20,'3,3','bbb',3,NULL,NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `route` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `school`
--

DROP TABLE IF EXISTS `school`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `school` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `school_name` varchar(250) NOT NULL,
  `school_address` varchar(250) NOT NULL,
  `school_mobile` int(11) NOT NULL,
  `school_mobile2` int(11) NOT NULL,
  `school_logo` varchar(255) NOT NULL,
  `school_mail` varchar(200) NOT NULL,
  `date` date NOT NULL,
  `created_date` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` date DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `school`
--

LOCK TABLES `school` WRITE;
/*!40000 ALTER TABLE `school` DISABLE KEYS */;
INSERT INTO `school` VALUES (3,'Disha','nagpur',2147483647,2147483641,'Screenshot_from_2019-06-12_11-46-404.png','aa@a.com','2019-06-21',NULL,NULL,'2019-09-03',1,1),(4,'NK','NK',2147483647,21312,'logo15.png','nk@nk.com','2019-06-15',NULL,NULL,'2019-09-04',1,1),(5,'my school','hj dbjsdhjas',1122112211,2147483647,'download10.jpeg','aaaaaa@aaaa.com','2019-08-03','2019-08-14',1,'2019-08-31',1,1),(7,'dsdsd','dasdsf',1234567890,2147483647,'banner2.jpg','asa@sdd.vbn','2019-09-03','2019-09-03',1,NULL,NULL,1),(9,'bhansali','kkkkkkkkk',2147483647,2147483647,'logo3.png','bhannn@gmail.com','2019-08-03','2019-09-03',1,'2019-09-04',1,1),(10,'skyline ','pune',2147483647,2147483647,'logo4.png','syline123@gmail.com','0001-08-06','2019-09-03',1,'2019-09-04',1,1);
/*!40000 ALTER TABLE `school` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_id` int(11) NOT NULL,
  `sections` varchar(50) NOT NULL,
  `subject` varchar(200) NOT NULL,
  `school_id` int(11) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` date DEFAULT NULL,
  `active` int(11) NOT NULL DEFAULT '1',
  `teachers_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `class_id` (`class_id`),
  CONSTRAINT `sections_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `class` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
INSERT INTO `sections` VALUES (34,1,'A','Marathi,Hindi,Maths,Science,History,Geography,English,IT',3,34,'2019-08-26',119,'2019-09-04',1,2),(35,1,'B','Marathi,Hindi,Maths,Science,History,Geography,Biology,English',3,34,'2019-08-27',119,'2019-09-04',1,2),(36,1,'C','Hindi,Science,History,Biology,Chemistry',3,34,'2019-08-29',NULL,NULL,1,NULL);
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `students` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `users_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `sections_id` int(11) DEFAULT NULL,
  `student_name` varchar(50) NOT NULL,
  `dob` date DEFAULT NULL,
  `adhar` varchar(110) NOT NULL,
  `profile` varchar(110) NOT NULL,
  `parent_name` varchar(50) NOT NULL,
  `parent_mob` int(11) NOT NULL,
  `mother_name` varchar(110) NOT NULL,
  `mother_mail` varchar(110) DEFAULT NULL,
  `mother_mob` int(11) NOT NULL,
  `parent_scan_id` varchar(11) NOT NULL,
  `roll_number` int(11) NOT NULL,
  `batch` varchar(50) NOT NULL,
  `teachers_id` int(11) NOT NULL,
  `username` varchar(200) NOT NULL,
  `password` varchar(110) NOT NULL,
  `school_id` int(11) NOT NULL,
  `bus_id` varchar(200) NOT NULL,
  `transportation_id` varchar(200) DEFAULT NULL,
  `join_date` date NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` date DEFAULT NULL,
  `active` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `class_id` (`class_id`,`sections_id`,`teachers_id`,`school_id`),
  KEY `sections_id` (`sections_id`),
  KEY `school_id` (`school_id`),
  KEY `teacher_details_id` (`teachers_id`),
  KEY `transportation_id` (`transportation_id`),
  KEY `bus_id` (`bus_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (12,105,1,34,'abc xyz','2007-01-19','31000','girl2.jpeg','abcd',2147483647,'abcd xyz','abc@gmail.com',12312312,'aaa',1,'Morning',0,'a@gmail.com','a',3,'',NULL,'2007-01-19',34,'2019-08-26',34,'2019-08-31',1),(13,113,1,34,'TestStudent','2014-09-01','76666667665','IMG-20190827-WA0001.jpg','Name Test',1234567890,'Test Name','Id@mail.com',2147483647,'Dftyhu',1,'1',0,'Testmail@mail.com','Test',3,'26','4','2019-07-01',34,'2019-09-04',NULL,NULL,1);
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject` varchar(110) NOT NULL,
  `school_id` int(11) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` date DEFAULT NULL,
  `active` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` VALUES (46,'Marathi',3,34,'2019-08-26',NULL,NULL,1),(47,'Maths',3,34,'2019-08-26',NULL,NULL,1),(48,'Geography',3,34,'2019-08-26',NULL,NULL,1),(49,'Hindi',3,34,'2019-08-27',NULL,NULL,1),(50,'Science',3,34,'2019-08-27',NULL,NULL,1),(51,'History',3,34,'2019-08-27',NULL,NULL,1),(52,'Biology',3,34,'2019-08-27',NULL,NULL,1),(53,'English',3,34,'2019-08-27',NULL,NULL,1),(54,'Chemistry',3,34,'2019-08-29',NULL,NULL,1),(55,'IT',3,NULL,NULL,34,'2019-08-30',1);
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teachers`
--

DROP TABLE IF EXISTS `teachers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teachers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `users_id` int(11) NOT NULL,
  `teacher_name` varchar(50) NOT NULL,
  `teacher_address` varchar(250) NOT NULL,
  `teacher_mobile` int(11) NOT NULL,
  `teacher_mail` varchar(50) NOT NULL,
  `salary_details` int(11) NOT NULL,
  `education_details` varchar(250) NOT NULL,
  `class` varchar(50) NOT NULL,
  `sections_id` int(11) NOT NULL,
  `join_date` date NOT NULL,
  `school_id` varchar(20) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` date DEFAULT NULL,
  `active` int(11) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `sections_id` (`sections_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teachers`
--

LOCK TABLES `teachers` WRITE;
/*!40000 ALTER TABLE `teachers` DISABLE KEYS */;
INSERT INTO `teachers` VALUES (1,106,'Kkk1  222','karad,Pune',2147483647,'kk1k@gmail.com',31000,'bsc mcm','',0,'2007-01-19','3',34,'2019-08-27',NULL,NULL,1),(2,107,'Kkk1  77','karad,Pune',2147483647,'55@gmail.com',31000,'bsc mcm','',0,'2007-01-19','3',34,'2019-08-27',NULL,NULL,1),(3,108,'111331 222','karad,Pune',2147483647,'113311@gmail.com',31000,'bsc mcm','',0,'2007-01-19','3',34,'2019-08-27',NULL,NULL,1);
/*!40000 ALTER TABLE `teachers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timetable`
--

DROP TABLE IF EXISTS `timetable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timetable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `details` text NOT NULL,
  `class_id` varchar(50) NOT NULL,
  `sections_id` int(11) NOT NULL,
  `subject` varchar(110) NOT NULL,
  `school_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` date DEFAULT NULL,
  `active` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timetable`
--

LOCK TABLES `timetable` WRITE;
/*!40000 ALTER TABLE `timetable` DISABLE KEYS */;
INSERT INTO `timetable` VALUES (11,'{\"id\":\"11\",\"class\":\"1\",\"section\":\"35\",\"subject\":\"Marathi,Hindi,Maths,Science,History,Geography,Biology,English\",\"mon\":\"6\",\"tue\":\"2\",\"wed\":\"2\",\"thu\":\"2\",\"fri\":\"2\",\"sat\":\"2\",\"sun\":\"0\",\"day\":[\"monday\",\"tuesday\",\"wednesday\",\"thursday\",\"friday\",\"saturday\"],\"lecture\":[\"6\",\"6\",\"6\",\"6\",\"6\",\"6\"],\"subject_mon\":[\"Marathi\",\"Hindi\",\"Maths\",\"Science\",\"History\",\"Biology\"],\"start_time_mon\":[\"10:12\",\"11:33\",\"\",\"\",\"\",\"\"],\"end_time_mon\":[\"11:23\",\"12:11\",\"\",\"\",\"\",\"\"],\"teacher_mon\":[\"1\",\"2\",\"3\",\"2\",\"3\",\"1\"],\"subject_tue\":[\"Marathi\",\"Science\"],\"start_time_tue\":[\"\",\"\"],\"end_time_tue\":[\"\",\"\"],\"teacher_tue\":[\"1\",\"3\"],\"subject_wed\":[\"Science\",\"Geography\"],\"start_time_wed\":[\"\",\"\"],\"end_time_wed\":[\"\",\"\"],\"teacher_wed\":[\"1\",\"2\"],\"subject_thu\":[\"Hindi\",\"Geography\"],\"start_time_thu\":[\"\",\"\"],\"end_time_thu\":[\"\",\"\"],\"teacher_thu\":[\"2\",\"1\"],\"subject_fri\":[\"Hindi\",\"English\"],\"start_time_fri\":[\"\",\"\"],\"end_time_fri\":[\"\",\"\"],\"teacher_fri\":[\"3\",\"1\"],\"subject_sat\":[\"Hindi\",\"History\"],\"start_time_sat\":[\"\",\"\"],\"end_time_sat\":[\"\",\"\"],\"teacher_sat\":[\"3\",\"1\"],\"edit_timetables\":\"Save\"}','1',35,'Marathi,Hindi,Maths,Science,History,Geography,Biology,English',3,'2019-08-29',34,'2019-08-29',34,'2019-08-29',1),(12,'{\"id\":\"12\",\"class\":\"1\",\"section\":\"36\",\"subject\":\"Hindi,Science,History,Biology,Chemistry\",\"mon\":\"2\",\"tue\":\"2\",\"wed\":\"2\",\"thu\":\"0\",\"fri\":\"0\",\"sat\":\"1\",\"sun\":\"0\",\"day\":[\"monday\",\"tuesday\",\"wednesday\",\"saturday\"],\"lecture\":[\"2\",\"2\",\"2\",\"2\"],\"subject_mon\":[\"Hindi\",\"Chemistry\"],\"start_time_mon\":[\"23:34\",\"23:23\"],\"end_time_mon\":[\"23:23\",\"23:23\"],\"teacher_mon\":[\"1\",\"2\"],\"subject_tue\":[\"Hindi\",\"Chemistry\"],\"start_time_tue\":[\"04:34\",\"23:34\"],\"end_time_tue\":[\"23:34\",\"23:23\"],\"teacher_tue\":[\"1\",\"3\"],\"subject_wed\":[\"Hindi\",\"Chemistry\"],\"start_time_wed\":[\"04:34\",\"23:04\"],\"end_time_wed\":[\"23:23\",\"23:04\"],\"teacher_wed\":[\"1\",\"2\"],\"subject_sat\":[\"Hindi\"],\"start_time_sat\":[\"03:23\"],\"end_time_sat\":[\"23:32\"],\"teacher_sat\":[\"1\"],\"edit_timetables\":\"Save\"}','1',36,'Hindi,Science,History,Biology,Chemistry',3,'2019-08-29',34,'2019-08-29',34,'2019-08-29',1),(13,'{\"class\":\"1\",\"section\":\"34\",\"subject\":\"Marathi,Hindi,Maths,Science,History,Geography,English,IT\",\"mon\":\"6\",\"tue\":\"6\",\"wed\":\"6\",\"thu\":\"6\",\"fri\":\"6\",\"sat\":\"4\",\"sun\":\"0\",\"day\":[\"monday\",\"tueday\",\"wednesday\",\"thursday\",\"friday\",\"saturday\",\"sunday\"],\"lecture\":[\"6\",\"6\",\"6\",\"6\",\"6\",\"4\",\"0\"],\"subject_mon\":[\"Marathi\",\"Hindi\",\"Science\",\"Maths\",\"Geography\",\"IT\"],\"start_time_mon\":[\"\",\"\",\"\",\"\",\"\",\"\"],\"end_time_mon\":[\"\",\"\",\"\",\"\",\"\",\"\"],\"teacher_mon\":[\"1\",\"3\",\"1\",\"2\",\"1\",\"3\"],\"subject_tue\":[\"Marathi\",\"Maths\",\"Marathi\",\"Science\",\"Marathi\",\"Maths\"],\"start_time_tue\":[\"\",\"\",\"\",\"\",\"\",\"\"],\"end_time_tue\":[\"\",\"\",\"\",\"\",\"\",\"\"],\"teacher_tue\":[\"1\",\"2\",\"1\",\"3\",\"1\",\"1\"],\"subject_wed\":[\"Geography\",\"Marathi\",\"Hindi\",\"Maths\",\"English\",\"IT\"],\"start_time_wed\":[\"\",\"\",\"\",\"\",\"\",\"\"],\"end_time_wed\":[\"\",\"\",\"\",\"\",\"\",\"\"],\"teacher_wed\":[\"1\",\"2\",\"1\",\"3\",\"1\",\"2\"],\"subject_thu\":[\"Hindi\",\"Marathi\",\"Geography\",\"Maths\",\"IT\",\"English\"],\"start_time_thu\":[\"\",\"\",\"\",\"\",\"\",\"\"],\"end_time_thu\":[\"\",\"\",\"\",\"\",\"\",\"\"],\"teacher_thu\":[\"1\",\"2\",\"3\",\"1\",\"2\",\"3\"],\"subject_fri\":[\"Marathi\",\"Maths\",\"History\",\"English\",\"Science\",\"Hindi\"],\"start_time_fri\":[\"\",\"\",\"\",\"\",\"\",\"\"],\"end_time_fri\":[\"\",\"\",\"\",\"\",\"\",\"\"],\"teacher_fri\":[\"2\",\"1\",\"2\",\"1\",\"3\",\"2\"],\"subject_sat\":[\"Marathi\",\"Maths\",\"Geography\",\"IT\"],\"start_time_sat\":[\"\",\"\",\"\",\"\"],\"end_time_sat\":[\"\",\"\",\"\",\"\"],\"teacher_sat\":[\"1\",\"2\",\"3\",\"1\"],\"save_timetables\":\"Save\"}','1',34,'Marathi,Hindi,Maths,Science,History,Geography,English,IT',3,'2019-08-30',34,'2019-08-30',NULL,NULL,1);
/*!40000 ALTER TABLE `timetable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transportation`
--

DROP TABLE IF EXISTS `transportation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transportation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bus_id` int(11) NOT NULL,
  `pickup_point` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `students_id` (`bus_id`),
  KEY `bus_id` (`bus_id`),
  KEY `bus_id_2` (`bus_id`),
  CONSTRAINT `transportation_ibfk_1` FOREIGN KEY (`bus_id`) REFERENCES `bus` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transportation`
--

LOCK TABLES `transportation` WRITE;
/*!40000 ALTER TABLE `transportation` DISABLE KEYS */;
/*!40000 ALTER TABLE `transportation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `role` varchar(50) NOT NULL,
  `school_id` int(11) NOT NULL,
  `token` varchar(200) NOT NULL,
  `gcm_id` varchar(50) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` date DEFAULT NULL,
  `active` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','admin','2019-06-20','admin',0,'79800_2019/08/19-12:08:33','',NULL,NULL,NULL,NULL,1),(35,'nk','nk','0000-00-00','school_admin',4,'','',NULL,NULL,1,'2019-08-14',1),(37,'ashutosh','ashutosh','0000-00-00','driver',3,'','',NULL,NULL,34,'2019-08-24',1),(43,'aaa','aaa','0000-00-00','driver',3,'','',NULL,NULL,NULL,NULL,1),(44,'aa','aa','0000-00-00','driver',3,'','',NULL,NULL,NULL,NULL,1),(45,'rr','rr','0000-00-00','driver',3,'','',NULL,NULL,NULL,NULL,1),(46,'tt','tt','0000-00-00','driver',3,'','',NULL,NULL,NULL,NULL,1),(47,'abc','abc','0000-00-00','driver',3,'','',NULL,NULL,34,'2019-08-24',1),(48,'d1','d1','0000-00-00','driver',3,'','',NULL,NULL,34,'2019-08-24',1),(84,'d12','d12','0000-00-00','driver',3,'','',34,'2019-08-24',NULL,NULL,1),(85,'d11','d11','0000-00-00','driver',3,'','',34,'2019-08-24',NULL,NULL,1),(86,'33','33','0000-00-00','driver',3,'57929_2019/08/30-11:08:35','',34,'2019-08-24',NULL,NULL,1),(87,'qq','qq','0000-00-00','driver',3,'','',34,'2019-08-24',34,'2019-08-24',1),(105,'a@gmail.com','aaa','0000-00-00','student',3,'32865_2019/09/05-06:09:06','',34,'2019-08-26',34,'2019-08-31',1),(106,'kkk1','kkk','0000-00-00','teacher',3,'','',34,'2019-08-27',NULL,NULL,1),(107,'77','77','0000-00-00','teacher',3,'64422_2019/09/04-13:09:37','',34,'2019-08-27',NULL,NULL,1),(108,'331231','33123','0000-00-00','teacher',3,'','',34,'2019-08-27',NULL,NULL,1),(110,'skyline','skyline1','0000-00-00','school_admin',10,'','',1,'2019-09-03',NULL,NULL,1),(112,'sunflower','sunflower1','0000-00-00','school_admin',6,'','',1,'2019-09-03',NULL,NULL,1),(113,'Testmail@mail.com','Test','0000-00-00','student',3,'61036_2019/09/04-06:09:28','',34,'2019-09-04',NULL,NULL,1),(114,'kyc','123','0000-00-00','school_admin',12,'','',1,'2019-09-04',NULL,NULL,1),(119,'disha','disha','0000-00-00','school_admin',3,'','',1,'2019-09-04',NULL,NULL,1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-09-05  6:40:35
