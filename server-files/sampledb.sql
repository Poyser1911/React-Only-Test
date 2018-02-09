-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: homestead
-- ------------------------------------------------------
-- Server version	5.7.20-log

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
-- Table structure for table `answer_votes`
--

DROP TABLE IF EXISTS `answer_votes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answer_votes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `answer_id` int(10) unsigned NOT NULL,
  `question_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `bit` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `answer_votes_answer_id_foreign` (`answer_id`),
  KEY `answer_votes_question_id_foreign` (`question_id`),
  KEY `answer_votes_user_id_foreign` (`user_id`),
  CONSTRAINT `answer_votes_answer_id_foreign` FOREIGN KEY (`answer_id`) REFERENCES `answers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `answer_votes_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `answer_votes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answer_votes`
--

LOCK TABLES `answer_votes` WRITE;
/*!40000 ALTER TABLE `answer_votes` DISABLE KEYS */;
/*!40000 ALTER TABLE `answer_votes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `answers`
--

DROP TABLE IF EXISTS `answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `question_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `solution` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `answers_question_id_foreign` (`question_id`),
  KEY `answers_user_id_foreign` (`user_id`),
  CONSTRAINT `answers_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `answers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answers`
--

LOCK TABLES `answers` WRITE;
/*!40000 ALTER TABLE `answers` DISABLE KEYS */;
INSERT INTO `answers` VALUES (137,9,27,'ok','2018-02-09 09:52:45','2018-02-09 09:52:45');
/*!40000 ALTER TABLE `answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2017_10_28_103522_create_users_table',1),(2,'2017_10_29_191640_create_questions_table',1),(3,'2017_10_29_193212_create_views_table',1),(4,'2017_10_29_193559_create_answers_table',1),(5,'2017_10_29_201408_create_tags_table',1),(6,'2017_12_03_002351_create_answers_votes_table',1),(7,'2017_12_03_002500_create_question_votes_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_votes`
--

DROP TABLE IF EXISTS `question_votes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question_votes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `question_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `bit` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `question_votes_question_id_foreign` (`question_id`),
  KEY `question_votes_user_id_foreign` (`user_id`),
  CONSTRAINT `question_votes_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `question_votes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_votes`
--

LOCK TABLES `question_votes` WRITE;
/*!40000 ALTER TABLE `question_votes` DISABLE KEYS */;
/*!40000 ALTER TABLE `question_votes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `questions_user_id_foreign` (`user_id`),
  CONSTRAINT `questions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (9,27,'Creating Drools .drl files programmatically','I have a requirement to generate drools drl files programmatically based on a service response from an external system. What is the recommended way to acheive this','3','2018-02-09 01:00:28','2018-02-09 01:00:28'),(10,27,'Testing','I have a requirement to generate drools drl files programmatically based on a service response from an external system. What is the recommended way to acheive this','3','2018-02-09 01:01:54','2018-02-09 01:01:54'),(11,27,'Testing Question','How do you even','3','2018-02-09 01:26:23','2018-02-09 01:26:23'),(12,27,'How to find Duplicate selectors between multiple css files using stylelint','0 down vote favorite I want to find duplicate selectors between multiple css files. i can\'t merge those files into single one. as i need to results for each file, which will be easy for removing duplicates.','3','2018-02-09 03:32:07','2018-02-09 03:32:07'),(13,27,'Creating Drools .drl files programmatically','I have a requirement to generate drools drl files programmatically based on a service response from an external system. What is the recommended way to acheive this','3','2018-02-09 06:24:39','2018-02-09 06:24:39'),(14,27,'Question','What is a question?','3','2018-02-09 06:32:11','2018-02-09 06:32:11'),(15,27,'Question','What is a question?','3','2018-02-09 06:32:13','2018-02-09 06:32:13'),(16,27,'Creating Drools .drl files programmatically','I have a requirement to generate drools drl files programmatically based on a service response from an external system. What is the recommended way to acheive this','3','2018-02-09 06:37:31','2018-02-09 06:37:31'),(17,27,'Ignore SSL self signed certificate errors Restful httpclient','0 down vote favorite I have done tons of searching and reading on this, there are so many different ways to achieve this. However, things have changed a bit since a lot of the posts. Ultimately, I am using a UWP (10586 minimum target) app.','3','2018-02-09 06:38:54','2018-02-09 06:38:54');
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `question_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `tags_question_id_foreign` (`question_id`),
  CONSTRAINT `tags_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (9,'Drools','2018-02-09 01:00:29','2018-02-09 01:00:29'),(9,'.drl','2018-02-09 01:00:29','2018-02-09 01:00:29'),(9,'response','2018-02-09 01:00:29','2018-02-09 01:00:29'),(9,'programmatically','2018-02-09 01:00:29','2018-02-09 01:00:29'),(10,'Drools','2018-02-09 01:01:54','2018-02-09 01:01:54'),(10,'.drl','2018-02-09 01:01:55','2018-02-09 01:01:55'),(10,'response','2018-02-09 01:01:55','2018-02-09 01:01:55'),(10,'programmatically','2018-02-09 01:01:55','2018-02-09 01:01:55'),(11,'How','2018-02-09 01:26:23','2018-02-09 01:26:23'),(11,'Even','2018-02-09 01:26:23','2018-02-09 01:26:23'),(11,'Test','2018-02-09 01:26:23','2018-02-09 01:26:23'),(12,'css','2018-02-09 03:32:07','2018-02-09 03:32:07'),(12,'stylelint','2018-02-09 03:32:07','2018-02-09 03:32:07'),(12,'csslint','2018-02-09 03:32:07','2018-02-09 03:32:07'),(13,'Drools','2018-02-09 06:24:39','2018-02-09 06:24:39'),(13,'.drl','2018-02-09 06:24:39','2018-02-09 06:24:39'),(13,'response','2018-02-09 06:24:39','2018-02-09 06:24:39'),(13,'programmatically','2018-02-09 06:24:39','2018-02-09 06:24:39'),(14,'What is','2018-02-09 06:32:11','2018-02-09 06:32:11'),(14,'question','2018-02-09 06:32:11','2018-02-09 06:32:11'),(15,'What is','2018-02-09 06:32:13','2018-02-09 06:32:13'),(15,'question','2018-02-09 06:32:13','2018-02-09 06:32:13'),(16,'Drools','2018-02-09 06:37:31','2018-02-09 06:37:31'),(16,'.drl','2018-02-09 06:37:31','2018-02-09 06:37:31'),(16,'response','2018-02-09 06:37:31','2018-02-09 06:37:31'),(16,'programmatically','2018-02-09 06:37:31','2018-02-09 06:37:31'),(17,'c#','2018-02-09 06:38:54','2018-02-09 06:38:54'),(17,'.net','2018-02-09 06:38:54','2018-02-09 06:38:54'),(17,'uwp','2018-02-09 06:38:54','2018-02-09 06:38:54'),(17,'windows-10-universal','2018-02-09 06:38:54','2018-02-09 06:38:54');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_unique` (`username`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (27,'Poyser','poyser1911@gmail.com','$2y$10$PGY9SvcNNyKRjauTEDILjO3PyZQrFq1cru0kK.EPFF/ZZoznJXCcK',NULL,'2018-02-08 22:58:04','2018-02-08 22:58:04');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `views`
--

DROP TABLE IF EXISTS `views`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `views` (
  `question_id` int(10) unsigned NOT NULL,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `views_question_id_foreign` (`question_id`),
  CONSTRAINT `views_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `views`
--

LOCK TABLES `views` WRITE;
/*!40000 ALTER TABLE `views` DISABLE KEYS */;
/*!40000 ALTER TABLE `views` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-02-09 17:55:30
