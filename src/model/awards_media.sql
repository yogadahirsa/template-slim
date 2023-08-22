-- MySQL dump 10.13  Distrib 8.0.33, for Linux (x86_64)
--
-- Host: localhost    Database: awards_media
-- ------------------------------------------------------
-- Server version	8.0.33-0ubuntu0.22.04.4

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
-- Table structure for table `pendaftar`
--

DROP TABLE IF EXISTS `pendaftar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pendaftar` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_role` int DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `wa` varchar(16) DEFAULT NULL,
  `nama_lengkap` varchar(200) DEFAULT NULL,
  `username` varchar(200) DEFAULT NULL,
  `password` varchar(400) DEFAULT NULL,
  `status_verifikasi` varchar(10) DEFAULT NULL,
  `is_aktif` int DEFAULT '0',
  `surat` text,
  `created_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `nama_resmi` varchar(200) DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `is_tester` int DEFAULT '0',
  `last_login` datetime DEFAULT NULL,
  `is_choice` varchar(45) DEFAULT NULL,
  `is_deleted` smallint DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=157 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pendaftar`
--

LOCK TABLES `pendaftar` WRITE;
/*!40000 ALTER TABLE `pendaftar` DISABLE KEYS */;
INSERT INTO `pendaftar` VALUES (52,9,'asdf@gmail.com','1111','jaja miharja',NULL,NULL,NULL,1,NULL,'2023-08-16 09:18:54','jaja',16,0,NULL,NULL,1),(55,9,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2023-08-18 03:14:51','test1',16,0,NULL,NULL,1),(56,9,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2023-08-18 03:15:41','test2',16,0,NULL,NULL,1),(57,9,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2023-08-18 03:19:25','test3',16,0,NULL,NULL,1),(58,9,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2023-08-18 03:20:09','test4',16,0,NULL,NULL,1),(59,9,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2023-08-18 03:22:53','test5',16,0,NULL,NULL,1),(60,9,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2023-08-18 08:17:36','test6',16,0,NULL,NULL,1),(61,9,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2023-08-18 08:34:10','baba',16,0,NULL,NULL,1),(62,9,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2023-08-18 08:36:22','yy',16,0,NULL,NULL,1),(63,9,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2023-08-18 10:01:45','xx',16,0,NULL,NULL,1),(64,9,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2023-08-18 10:01:52','zxcv',16,0,NULL,NULL,1),(65,9,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2023-08-18 23:07:34','test7',16,0,NULL,NULL,1),(66,9,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2023-08-18 23:07:44','test8',16,0,NULL,NULL,1),(67,9,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2023-08-18 23:29:22','test7',16,0,NULL,NULL,1),(68,9,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2023-08-18 23:30:07','test8',16,0,NULL,NULL,1),(69,9,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2023-08-18 23:30:21','test9',16,0,NULL,NULL,1),(70,9,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2023-08-18 23:32:19','test9',16,0,NULL,NULL,1),(71,9,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2023-08-18 23:33:48','test9',16,0,NULL,NULL,1),(72,9,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2023-08-18 23:33:57','test10',16,0,NULL,NULL,1),(73,9,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2023-08-18 23:34:10','test11',16,0,NULL,NULL,1),(74,9,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2023-08-18 23:36:04','test8',NULL,0,NULL,NULL,1),(75,9,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2023-08-18 23:36:23','test10',16,0,NULL,NULL,1),(76,9,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2023-08-18 23:39:44','tt',16,0,NULL,NULL,1),(77,9,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2023-08-18 23:44:47','tt',16,0,NULL,NULL,1),(78,9,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2023-08-18 23:44:53','tt1',16,0,NULL,NULL,1),(79,9,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2023-08-18 23:45:43','yy',16,0,NULL,NULL,1),(80,9,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2023-08-18 23:50:04','test8',16,0,NULL,NULL,1),(81,9,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2023-08-18 23:50:09','test9',16,0,NULL,NULL,1),(82,9,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2023-08-18 23:50:18','test11',16,0,NULL,NULL,1),(83,9,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2023-08-18 23:51:46','a',16,0,NULL,NULL,1),(84,9,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2023-08-18 23:51:49','b',16,0,NULL,NULL,1),(85,9,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2023-08-18 23:51:55','c',16,0,NULL,NULL,1),(86,9,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2023-08-18 23:52:23','bb',16,0,NULL,NULL,1),(87,9,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2023-08-18 23:52:42','bb',16,0,NULL,NULL,1),(88,9,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2023-08-19 00:04:53','asdf',16,0,NULL,NULL,1),(89,9,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2023-08-19 00:05:01','qwer',16,0,NULL,NULL,1),(90,9,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2023-08-19 00:07:40','test7',16,0,NULL,NULL,1),(91,9,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2023-08-19 00:07:46','test8',16,0,NULL,NULL,1),(92,9,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2023-08-19 00:07:52','test9',16,0,NULL,NULL,1),(93,9,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2023-08-19 00:07:57','test10',16,0,NULL,NULL,1),(94,9,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2023-08-19 00:08:02','test11',16,0,NULL,NULL,1),(95,9,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2023-08-19 00:15:13','test8',16,0,NULL,NULL,1),(96,9,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2023-08-19 00:16:41','test9',16,0,NULL,NULL,1),(97,9,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2023-08-19 00:18:13','qwer',16,0,NULL,NULL,1),(98,9,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2023-08-19 00:24:26','baba',16,0,NULL,NULL,1),(99,9,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2023-08-19 00:24:29','baba',16,0,NULL,NULL,1),(100,9,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2023-08-19 00:24:32','abab',16,0,NULL,NULL,1),(101,9,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2023-08-19 00:24:35','baba',16,0,NULL,NULL,1),(102,9,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2023-08-19 00:24:39','abab',16,0,NULL,NULL,1),(103,9,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2023-08-19 00:24:44','qwer',16,0,NULL,NULL,1),(104,9,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2023-08-19 00:24:47','qwer',16,0,NULL,NULL,1),(105,9,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2023-08-19 00:24:51','qwerq',16,0,NULL,NULL,1),(106,9,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2023-08-19 05:41:03','dadada',16,0,NULL,NULL,1),(107,9,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2023-08-22 01:31:46','Antara',91,0,NULL,NULL,0),(108,9,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2023-08-22 01:31:46','Kompas',91,0,NULL,NULL,0),(109,9,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2023-08-22 01:31:46','Warta Ekonomi',91,0,NULL,NULL,0),(110,9,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2023-08-22 01:31:46','Rm.id',91,0,NULL,NULL,0),(111,9,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2023-08-22 01:31:46','Media Indonesia',91,0,NULL,NULL,0),(112,9,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2023-08-22 01:31:46','Medcom.Id',91,0,NULL,NULL,0),(113,9,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2023-08-22 01:31:46','Republika',91,0,NULL,NULL,0),(114,9,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2023-08-22 01:31:46','Jawa Post National Network',91,0,NULL,NULL,0),(115,9,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2023-08-22 01:31:46','Kontan',91,0,NULL,NULL,0),(116,9,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2023-08-22 01:31:46','Tribun News',91,0,NULL,NULL,0),(117,9,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2023-08-22 01:31:46','Merdeka News',91,0,NULL,NULL,0),(118,9,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2023-08-22 01:31:46','Beritaja.com',91,0,NULL,NULL,0),(119,9,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2023-08-22 01:31:46','Detik',91,0,NULL,NULL,0),(120,9,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2023-08-22 01:31:46','Sindo News',91,0,NULL,NULL,0),(121,9,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2023-08-22 01:31:46','Liputan 6',91,0,NULL,NULL,0),(122,9,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2023-08-22 01:31:46','Investor Daily',91,0,NULL,NULL,0),(123,9,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2023-08-22 01:31:46','Okezone',91,0,NULL,NULL,0),(124,9,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2023-08-22 01:31:46','Energi News',91,0,NULL,NULL,0),(125,9,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2023-08-22 01:31:46','Ruangenergi.com',91,0,NULL,NULL,0),(126,9,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2023-08-22 01:31:46','Wartabanyumas.com',91,0,NULL,NULL,0),(127,9,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2023-08-22 01:31:46','Suara.com',91,0,NULL,NULL,0),(128,9,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2023-08-22 01:31:46','Inews Portal',91,0,NULL,NULL,0),(129,9,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2023-08-22 01:31:46','Tempo.Co',91,0,NULL,NULL,0),(130,9,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2023-08-22 01:31:46','Pelita',91,0,NULL,NULL,0),(131,9,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2023-08-22 01:31:46','Iqplus',91,0,NULL,NULL,0),(132,9,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2023-08-22 01:31:46','Harianrakyat.com',91,0,NULL,NULL,0),(133,9,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2023-08-22 01:31:46','Idx Channel',91,0,NULL,NULL,0),(134,9,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2023-08-22 01:31:46','Inionline.id',91,0,NULL,NULL,0),(135,9,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2023-08-22 01:31:46','Redaksiharian.com',91,0,NULL,NULL,0),(136,9,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2023-08-22 01:31:46','Vivanews',91,0,NULL,NULL,0),(137,9,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2023-08-22 01:31:46','Bisnis Indonesia',91,0,NULL,NULL,0),(138,9,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2023-08-22 01:31:46','Neraca',91,0,NULL,NULL,0),(139,9,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2023-08-22 01:31:46','Berita Satu',91,0,NULL,NULL,0),(140,9,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2023-08-22 01:31:46','Jambiekspress.disway.id',91,0,NULL,NULL,0),(141,9,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2023-08-22 01:31:46','Koran Jakarta',91,0,NULL,NULL,0),(142,9,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2023-08-22 01:31:46','Harian Aceh',91,0,NULL,NULL,0),(143,9,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2023-08-22 01:31:46','Buddyku.com',91,0,NULL,NULL,0),(144,9,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2023-08-22 01:31:46','Cnbc Indonesia',91,0,NULL,NULL,0),(145,9,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2023-08-22 01:31:46','Akurat.co',91,0,NULL,NULL,0),(146,9,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2023-08-22 01:31:46','Metro Tv',91,0,NULL,NULL,0),(147,9,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2023-08-22 01:31:46','Elshinta',91,0,NULL,NULL,0),(148,9,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2023-08-22 01:31:46','Kompas.id',91,0,NULL,NULL,0),(149,9,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2023-08-22 01:31:46','Jawa Pos',91,0,NULL,NULL,0),(150,9,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2023-08-22 01:31:46','Indonesiatelegraph.com',91,0,NULL,NULL,0),(151,9,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2023-08-22 01:31:46','Antara Riau',91,0,NULL,NULL,0),(152,9,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2023-08-22 01:31:46','Merdeka',91,0,NULL,NULL,0),(153,9,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2023-08-22 01:31:46','Katadata',91,0,NULL,NULL,0),(154,9,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2023-08-22 01:31:46','Kedaulatan Rakyat',91,0,NULL,NULL,0),(155,9,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2023-08-22 01:31:46','Tribun News Jateng',91,0,NULL,NULL,0),(156,9,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2023-08-22 01:31:47','Times Indonesia',91,0,NULL,NULL,0);
/*!40000 ALTER TABLE `pendaftar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `penilaian`
--

DROP TABLE IF EXISTS `penilaian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `penilaian` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `pendaftar_id` int unsigned NOT NULL,
  `penilai_id` int unsigned NOT NULL,
  `penilaian_kinerja` json DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `penilaian`
--

LOCK TABLES `penilaian` WRITE;
/*!40000 ALTER TABLE `penilaian` DISABLE KEYS */;
INSERT INTO `penilaian` VALUES (5,55,16,'{\"p1_a\": \"1\", \"p1_b\": \"1\", \"p2_a\": \"1\", \"p2_b\": \"1\", \"p2_c\": \"1\", \"link_artikel1\": \"\", \"link_artikel2\": \"\", \"link_artikel3\": \"\"}'),(6,56,16,'{\"p1_a\": \"1\", \"p1_b\": \"1\", \"p2_a\": \"1\", \"p2_b\": \"1\", \"p2_c\": \"1\", \"link_artikel1\": \"\", \"link_artikel2\": \"\", \"link_artikel3\": \"\"}');
/*!40000 ALTER TABLE `penilaian` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `penjurian`
--

DROP TABLE IF EXISTS `penjurian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `penjurian` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `pendaftar_id` int unsigned NOT NULL,
  `penilai_id` int unsigned NOT NULL,
  `tahap` smallint unsigned NOT NULL,
  `penjurian` json DEFAULT NULL,
  `is_accepted` smallint DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `penjurian`
--

LOCK TABLES `penjurian` WRITE;
/*!40000 ALTER TABLE `penjurian` DISABLE KEYS */;
INSERT INTO `penjurian` VALUES (1,55,16,1,'{\"p1_a\": \"2\", \"p1_b\": \"4\", \"p2_a\": \"0\", \"p2_b\": \"0\", \"p2_c\": \"0\"}',1),(2,56,16,1,'{\"p1_a\": \"0\", \"p1_b\": \"0\", \"p2_a\": \"0\", \"p2_b\": \"0\", \"p2_c\": \"0\"}',1),(3,55,26,1,'{\"p1_a\": \"0\", \"p1_b\": \"0\", \"p2_a\": \"0\", \"p2_b\": \"3\", \"p2_c\": \"0\"}',1);
/*!40000 ALTER TABLE `penjurian` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role` varchar(40) DEFAULT NULL,
  `singkatan` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'admin','Admin'),(2,'Juri','Juri'),(3,'Kementerian','Kementerian'),(4,'Pemerintah Daerah','Pemda'),(5,'Organisasi Masyarakat Sipil','OMS'),(6,'Perguruan Tinggi','PT'),(7,'Lembaga Penelitian','Lembaga Penelitian'),(8,'Pelaku Usaha Besar','Pelaku Usaha Besar'),(9,'Media','Media'),(10,'Pemuda','Pemuda'),(11,'Pelaku Usaha Kecil','UMKM'),(12,'Asisten Media','Asst. Media'),(21,'juri tahap 1 (Dapur)','juri dapur');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_role` int DEFAULT NULL,
  `id_roles` varchar(200) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `wa` varchar(16) DEFAULT NULL,
  `nama_lengkap` varchar(200) DEFAULT NULL,
  `username` varchar(200) DEFAULT NULL,
  `password` varchar(400) DEFAULT NULL,
  `is_aktif` int DEFAULT '1',
  `created_by` int DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `juri_kategori` varchar(200) DEFAULT NULL,
  `surat` text,
  `last_login` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,1,'[\"1\",\"2\",\"21\"]','admin@itb.ac.id','82320702467','Wowo','admin@itb.ac.id','46f94c8de14fb36680850768ff1b7f2a',1,1,'2022-01-24 07:30:17','','',NULL),(2,0,'[\"21\"]','juri@juri.com','080280192','Mimin','juri@juri.com','827ccb0eea8a706c4c34a16891f84e7b',1,1,'2022-05-12 13:38:28','','',NULL),(3,1,'[\"1\"]','bapenas@bapenas.com','','bapenas admin','bapenas1','fd3ed049d4c143c77f6399249dd40d5e',1,1,'2022-05-23 01:32:00','','',NULL),(4,2,'[\"2\"]','bapenas@bapenas.com','85720002721','bapenas juri','bapenas@bapenas.com','fd3ed049d4c143c77f6399249dd40d5e',1,1,'2022-05-23 01:33:28','[\"6\"]','',NULL),(8,1,'[\"21\"]','gantjang2509@gmail.com','85860922599','Gantjang Amannullah, MA','gantjang2509@gmail.com','827ccb0eea8a706c4c34a16891f84e7b',1,0,'2022-06-15 03:08:13','','',NULL),(9,1,'[\"1\"]','admin-1@gmail.com','082320702467','Admin-1','admin-1@gmail.com','bb2ae2282afe7d149bf804618ae69361',1,0,'2022-06-16 04:04:38','','',NULL),(10,2,'[\"2\"]','juri1@gmail.com','82320702467','juri test 2','juri1@gmail.com','827ccb0eea8a706c4c34a16891f84e7b',1,0,'2022-06-16 04:05:43','[\"8\",\"11\"]','',NULL),(11,1,'[\"2\"]','mimin.supriatna99@gmail.com','81224286781','juri test 3','mimin.supriatna99@gmail.com','827ccb0eea8a706c4c34a16891f84e7b',1,0,'2022-06-24 05:42:58','[\"8\"]','',NULL),(12,0,'[\"1\"]','admin2@gmail.com','82320702467','Admin-2','admin2@gmail.com','',1,0,'2022-07-24 01:06:24','','',NULL),(13,0,'[\"1\",\"2\"]','juri3@gmail.com','082167418821','Zulfahnur Akbar Sonjaya','juri3@gmail.com','76f08926b7de7700f383b6eb574732c6',1,0,'2022-07-24 01:52:48','[\"3\",\"7\"]','',NULL),(14,0,'[\"21\"]','juridapur@seknas.com','09886776767','Mimin','juridapur@seknas.com','827ccb0eea8a706c4c34a16891f84e7b',1,0,'2022-07-24 01:54:17','','',NULL),(15,0,'[\"2\"]','juri@gmail.com','81224286781','juri 1','juri@gmail.com','827ccb0eea8a706c4c34a16891f84e7b',1,0,'2022-07-25 07:56:35','[\"8\"]','',NULL),(16,0,'[\"1\",\"2\",\"21\",\"12\"]','wowowarsono@gmail.com','85720002721','wowo warsono','wowowarsono@gmail.com','827ccb0eea8a706c4c34a16891f84e7b',1,0,'2022-07-28 10:56:16','','',NULL),(17,0,'[\"1\",\"21\"]','tikarose91@gmail.com','85759181715','Tika Rostika','tikarose91@gmail.com','b586d5607e2f7e1d1b78159009740959',1,0,'2022-07-29 06:34:31','','',NULL),(18,0,'[\"1\"]','yogadahirsa123@gmail.com','81511060241','yoga dahirsa juri','yogadahirsa123@gmail.com','e9896f9b2179c2158c7746098dc4ffe0',1,0,'2022-08-02 02:26:51','[\"3\",\"7\",\"9\",\"5\",\"8\",\"11\",\"4\",\"10\",\"6\"]','',NULL),(19,0,'[\"21\"]','yogadahirsa456@gmail.com','81511060241','yoga dahirsa juri dapur','yogadahirsa456@gmail.com','9e0bd3c0005b6f4685bad70b68b81b9c',1,0,'2022-08-02 02:27:49','','',NULL),(20,0,'[\"1\"]','mandhalich@gmail.com','81287939344','Manhda','mandhalich@gmail.com','de6e8cc136c49541034217fdf0c9feb9',1,0,'2022-08-05 07:36:32','','',NULL),(21,0,'[\"1\"]','yundisupriadani@gmail.com','85720151607','Yundi','yundisupriadani@gmail.com','b5ba97a24178e52fdb7da3a4f2295bb4',1,0,'2022-08-05 07:37:46','','',NULL),(23,NULL,'[\"21\"]','sandi@gmail.com','81224286781','sandi','sandi@gmail.com','827ccb0eea8a706c4c34a16891f84e7b',1,NULL,'2022-08-15 02:23:32',NULL,NULL,NULL),(25,NULL,'[\"2\"]','anggi@gmail.com','81224286781','anggi','anggi@gmail.com','827ccb0eea8a706c4c34a16891f84e7b',1,NULL,'2022-08-23 11:00:23','[\"8\"]',NULL,NULL),(26,NULL,'[\"21\",\"12\"]','fadlanmuzakki@Gmail.com','81904121990','fadlanmuzakki','fadlanmuzakki@Gmail.com','6ae83afcd80f98d1b07fcc6faf4209f9',1,NULL,'2022-08-31 12:29:55',NULL,NULL,NULL),(29,NULL,'[\"12\"]','aditiad872@gmail.com','81532437290','aditiad872','aditiad872@gmail.com','bf026310650e1d2eb33388757144063e',1,NULL,'2022-08-31 13:56:59',NULL,NULL,NULL),(30,NULL,'[\"1\",\"2\",\"21\"]','zulfahnur.akbar@gmail.com','82320702467','Zulfahnur Akbar Sonjaya','zulfahnur.akbar@gmail.com','827ccb0eea8a706c4c34a16891f84e7b',1,NULL,'2022-09-01 02:11:16',NULL,NULL,NULL),(31,NULL,'[\"12\"]','putriadnyaningsih@gmail.com','85738003007','Ni Kadek Putri Adnyaningsih','putriadnyaningsih@gmail.com','e1cacf45cd187bb910a2eee7a9e295d9',1,NULL,'2022-09-05 06:20:48',NULL,NULL,NULL),(32,NULL,'[\"12\"]','wiratma.anne@gmail.com','81311223799','Anne Wiratma','wiratma.anne@gmail.com','fdfc530730be7e602bf8fb613fd27669',1,NULL,'2022-09-05 06:22:00',NULL,NULL,NULL),(34,NULL,'[\"12\"]','renaldimanurung123@gmail.com','81384202199','Renaldi Manurung','renaldimanurung123@gmail.com','6a65cb460d7c63e85287d3f0a9256c37',1,NULL,'2022-09-05 06:26:15',NULL,NULL,NULL),(35,NULL,'[\"12\"]','michaelpeter300@gmail.com','81316754302','Michael Peter Victory Simarmata','michaelpeter300@gmail.com','2303acf46580bf252a730131c6f41987',1,NULL,'2022-09-05 06:27:19',NULL,NULL,NULL),(37,NULL,'[\"12\"]','feberianto.sipayung@gmail.com','82362560427','Feberianto H S','feberianto.sipayung@gmail.com','a50c680955112cbf723d606b52a32aa9',1,NULL,'2022-09-05 06:30:54',NULL,NULL,NULL),(38,NULL,'[\"12\"]','amirahsyahirah.business@gmail.com','82176117208','Amirah Syahirah','amirahsyahirah.business@gmail.com','83a3b8812d9803756bfe8083e6cbb8a6',1,NULL,'2022-09-05 06:32:21',NULL,NULL,NULL),(39,NULL,'[\"12\"]','dsalfiyah@gmail.com','85335129320','Desy Alfiyah R R','dsalfiyah@gmail.com','06d9ba5a5d39ff5ce91cfc55511af053',1,NULL,'2022-09-05 06:33:09',NULL,NULL,NULL),(40,NULL,'[\"12\"]','agungchyo23@gmail.com','895388451037','Agung Cahyo W','agungchyo23@gmail.com','155f96987820c8b4ef0cdaa78bc750f7',1,NULL,'2022-09-05 06:33:55',NULL,NULL,NULL),(41,NULL,'[\"12\"]','izzatiadha@gmail.com','82182630360','Izzati Adha Pratitis','izzatiadha@gmail.com','95425408b43a3a83da0d3a9c9a234519',1,NULL,'2022-09-05 06:35:15',NULL,NULL,NULL),(42,NULL,'[\"12\"]','alia@gmail.com','85720002721','user juri dapur','alia@gmail.com','827ccb0eea8a706c4c34a16891f84e7b',1,NULL,'2022-09-06 05:52:30',NULL,NULL,NULL),(43,NULL,'[\"21\"]','juridapur1@gmail.com','82320702467','juri test 5','juridapur1@gmail.com','827ccb0eea8a706c4c34a16891f84e7b',1,NULL,'2022-09-08 03:01:01',NULL,NULL,NULL),(44,NULL,'[\"21\"]','juridapur2@gmail.com','82320702467','juri test 6','juridapur2@gmail.com','827ccb0eea8a706c4c34a16891f84e7b',1,NULL,'2022-09-08 03:03:13',NULL,NULL,NULL),(45,NULL,'[\"21\"]','juri_dummy1@itb.ac.id','89692525156','Angelina','juri_dummy1@itb.ac.id','d20c5317139fe77ba55b6b81e3657f68',1,NULL,'2022-09-11 03:33:20',NULL,NULL,NULL),(46,NULL,'[\"21\"]','sanjoyo.kirlan@gmail.com','8158027172','Sanjoyo','sanjoyo.kirlan@gmail.com','18cc6b6af6cc1a0c6d7049e64e9a723d',1,NULL,'2022-09-11 03:52:10',NULL,NULL,NULL),(47,NULL,'[\"21\"]','budidab@gmail.com','81808657877','Setyo Budiantoro','budidab@gmail.com','77ed426a2ec5bd83cb2910fffc20baf0',1,NULL,'2022-09-12 08:02:24',NULL,NULL,NULL),(48,NULL,'[\"21\"]','rachman.p3lh@gmail.com','81342659590','Rachman Kurniawan','rachman.p3lh@gmail.com','2f99ea0429ed1d0f55fcba28496e5701',1,NULL,'2022-09-12 08:03:46',NULL,NULL,NULL),(49,NULL,'[\"2\",\"12\"]','indrianasdgs@gmail.com','81385024575','Indriana Nugraheni','indrianasdgs@gmail.com','4b929e04790494ce58094f4ccc2f7f3e',1,NULL,'2022-09-12 08:06:23','[\"9\"]',NULL,NULL),(51,NULL,'[\"21\"]','irahmanda@gmail.com','8987485880','Khairanis Rahmanda','irahmanda@gmail.com','43c0129d3fa88a4c0f0a6d169d979448',1,NULL,'2022-09-12 12:23:02',NULL,NULL,NULL),(52,NULL,'[\"21\"]','adhika.dibya@gmail.com','81808791036 ','Adhika Dwita Dibyareswati','adhika.dibya@gmail.com','6103292dd6e62734ab3ed4e84b972a06',1,NULL,'2022-09-12 12:25:51',NULL,NULL,NULL),(53,NULL,'[\"21\"]','chiquita.abidin@gmail.com','83816210187','Chiquita Abidin','chiquita.abidin@gmail.com','a10e240f54faf598d7364669037a7b43',1,NULL,'2022-09-12 12:27:44',NULL,NULL,NULL),(54,NULL,'[\"21\"]','farhana.zahrotunnisa@gmail.com','81282381523','Farhana Zahrotunnisa','farhana.zahrotunnisa@gmail.com','6dde6894173f87aaea9d5c81c6982382',1,NULL,'2022-09-12 12:29:43',NULL,NULL,NULL),(55,NULL,'[\"21\"]','alimatulrahim@gmail.com','85255148471','Alimatul Rahim','alimatulrahim@gmail.com','28dfdac3cb9eb82553fd9e278a6aac23',1,NULL,'2022-09-12 12:31:35',NULL,NULL,NULL),(56,NULL,'[\"21\"]','fitriyani.yasir@gmail.com','8988364154','Fitriyani Yasir','fitriyani.yasir@gmail.com','6fcea58aaeab887f741c71c339e4d0aa',1,NULL,'2022-09-12 12:37:08',NULL,NULL,NULL),(57,NULL,'[\"21\"]','sandra.pratiwi@support.bappenas.go.id','81286019443','Sandra Pratiwi','sandra.pratiwi@support.bappenas.go.id','995bd7ea47c69cb2ab298448756cfce6',1,NULL,'2022-09-12 12:39:54',NULL,NULL,NULL),(59,NULL,'[\"21\"]','angie.setiowatie@gmail.com','85890353832','Anggita Sulisetiasih','angie.setiowatie@gmail.com','beb3993677f4696cd975153178bc38dd',1,NULL,'2022-09-12 12:43:31',NULL,NULL,NULL),(60,NULL,'[\"1\",\"21\"]','ardhiantie@gmail.com','81317358357','Ardhianti','ardhiantie@gmail.com','bb176a810b14ae45638c73b5eeb9aa3c',1,NULL,'2022-09-12 12:46:46',NULL,NULL,NULL),(61,NULL,'[\"1\",\"21\"]','larassita.dama@gmail.com','8112570412','Larassita Damayanti','larassita.dama@gmail.com','1328d9bb715a6d606a5271ff3dfbd033',1,NULL,'2022-09-12 12:48:46',NULL,NULL,NULL),(62,NULL,'[\"1\",\"21\"]','qawirimbawan@gmail.com','85712200635','M Qawi Rimbawan','qawirimbawan@gmail.com','c4216f5fd78427d111b2fd534049cc30',1,NULL,'2022-09-12 12:50:04',NULL,NULL,NULL),(63,NULL,'[\"1\",\"2\",\"21\"]','avianto.diky@gmail.com','85883127192','Diky Avianto','avianto.diky@gmail.com','d7afd54a4f25c1d45ade5721f6d82ddb',1,NULL,'2022-09-12 12:54:31','[\"3\",\"7\",\"9\",\"5\",\"8\",\"11\",\"4\",\"10\",\"6\"]',NULL,NULL),(66,NULL,'[\"21\"]','hapocta.ho@gmail.com','85172361001','Fani','hapocta.ho@gmail.com','c659970ab25ad2ac0e0c874d50045be5',1,NULL,'2022-09-19 04:28:11',NULL,NULL,NULL),(67,NULL,'[\"21\"]','luhurfm1@gmail.com','8128099527','Luhur Fajar','luhurfm1@gmail.com','4a7cef16802a59969598b46e2be8194f',1,NULL,'2022-09-19 04:33:15',NULL,NULL,NULL),(69,NULL,'[\"21\"]','m.showam@gmail.com','81218080678','Showam','m.showam@gmail.com','4cafbc6b35c9488698e0b65fbeb9a760',1,NULL,'2022-09-19 06:56:05',NULL,NULL,NULL),(70,NULL,'[\"21\"]','sariwidhiantari@gmail.com','81221688812','Sari','sariwidhiantari@gmail.com','0e8e0534cead21ae9fe6dffd8ac48cfd',1,NULL,'2022-09-19 06:57:12',NULL,NULL,NULL),(72,NULL,'[\"21\"]','ongky.sdgs@gmail.com','87781765474','Ongky','ongky.sdgs@gmail.com','ec9f3c8c9e41bfa0db652ee1f8b36c30',1,NULL,'2022-09-19 06:59:12',NULL,NULL,NULL),(74,NULL,'[\"1\",\"21\"]','sonny.rustiadi@sbm-itb.ac.id','8975493164','Sonny Rustiadi','sonny.rustiadi@sbm-itb.ac.id','dcc577ba8498eba87338ecdb15900cf2',1,NULL,'2022-09-29 02:47:51',NULL,NULL,NULL),(80,NULL,'[\"2\"]','avenzora@bps.go.id','81317144014','Ahmad Avenzora','avenzora@bps.go.id','9a9842436f134c5f51fb2fa0cdf3f559',1,NULL,'2022-10-17 09:05:18',NULL,NULL,NULL),(81,NULL,'[\"2\"]','yanuar.nugroho@gmail.com','81210381059','Yanuar Nugroho','yanuar.nugroho@gmail.com','0f3e3181cb4f08883f131d220e4a974a',1,NULL,'2022-10-17 09:08:13',NULL,NULL,NULL),(82,NULL,'[\"2\"]','mariakompas@gmail.com','8562992400','Maria Hartiningsih','mariakompas@gmail.com','3b6d86f581ce3cdc8d83a0ea2d7c3349',1,NULL,'2022-10-17 09:09:02',NULL,NULL,NULL),(83,NULL,'[\"2\"]','zumrotin20@gmail.com','8159955744','Zumrotin K. Susilo','zumrotin20@gmail.com','d99c9d333a499288693c16de4549bc1f',1,NULL,'2022-10-17 09:09:43',NULL,NULL,NULL),(85,NULL,'[\"2\"]','triarko@gmail.com','8129478287','Triarko Nur Lambang','triarko@gmail.com','498fe55238be424202885a5fcd9791e2',1,NULL,'2022-10-17 09:13:06',NULL,NULL,NULL),(86,NULL,'[\"2\"]','yayajunardy@gmail.com','818160510','Yaya Winarno Junardy','yayajunardy@gmail.com','6fbd42abdde3f501ecc1aa609bce5039',1,NULL,'2022-10-17 09:13:45',NULL,NULL,NULL),(87,NULL,'[\"2\"]','Sonny.sukada@gmail.com','8111019944','Sonny Sukada','Sonny.sukada@gmail.com','f361445a4c013c2701c12b610b4b75d4',1,NULL,'2022-10-17 09:14:26',NULL,NULL,NULL),(88,NULL,'[\"2\"]','myrahanartani@gmail.com','8161828221','Myra Maria Hanartani','myrahanartani@gmail.com','d9a0055470eac8d5483bd0aa1da74442',1,NULL,'2022-10-17 09:15:07',NULL,NULL,NULL),(89,1,'[\"2\"]','wowo.w@itb.ac.id','85720002721','Wowo Warsono','wowo.w@itb.ac.id','827ccb0eea8a706c4c34a16891f84e7b',1,NULL,'2022-10-17 09:22:40',NULL,NULL,NULL),(90,NULL,'[\"2\",\"21\"]','sdgs.awards@bappenas.go.id','81314960791','Seknas SDGs','sdgs.awards@bappenas.go.id','3295487fd764c16d5b00d19ae3bc8d49',1,NULL,'2023-07-17 07:25:47','[\"3\",\"7\",\"9\",\"5\",\"8\",\"11\",\"4\",\"10\",\"6\"]',NULL,NULL),(91,NULL,'[\"21\",\"12\"]','septiaannisa99@gmail.com','88286419186','Septi','septiaannisa99@gmail.com','37296b583d1c662c5c32dec037649ef8',1,NULL,'2023-08-10 09:29:23','[\"9\"]',NULL,NULL);
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

-- Dump completed on 2023-08-22  8:33:40