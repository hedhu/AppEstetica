-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: pruebas
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `firmaspaciente`
--

DROP TABLE IF EXISTS `firmaspaciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `firmaspaciente` (
  `idFirmasPaciente` int NOT NULL AUTO_INCREMENT,
  `idTratamientosPaciente` int NOT NULL,
  `idPaciente` int NOT NULL,
  `firmas` int DEFAULT NULL,
  `rutaFirma` varchar(175) DEFAULT NULL,
  `numeroSesion` int DEFAULT NULL,
  `fechaSesion` varchar(45) DEFAULT NULL,
  `observacionesSesion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idFirmasPaciente`),
  KEY `idTratamientosPaciente_fk_idx` (`idTratamientosPaciente`),
  KEY `idPacientes_fk_idx` (`idPaciente`),
  CONSTRAINT `idTratamientosPaciente_fk` FOREIGN KEY (`idTratamientosPaciente`) REFERENCES `tratamientospacientes` (`idtratamientosPacientes`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `firmaspaciente`
--

LOCK TABLES `firmaspaciente` WRITE;
/*!40000 ALTER TABLE `firmaspaciente` DISABLE KEYS */;
INSERT INTO `firmaspaciente` VALUES (2,13,11,1,'firma_9c01b487e71b30b3.png',1,'2023-09-22',NULL),(3,13,11,1,'firma_7f41854f4cf76908.png',2,'2023-10-07','Este paciente es wn\r\n'),(4,13,11,1,'firma_5decda0de4a9d5c0.png',3,NULL,NULL),(5,13,11,1,'firma_a1786b386ab40018.png',4,NULL,NULL),(6,14,11,1,'firma_501f1bc718721171.png',1,'2023-09-23',NULL),(7,14,11,NULL,NULL,2,'2023-09-30','javier'),(8,16,11,NULL,NULL,1,'2023-09-16',NULL),(9,16,11,NULL,NULL,2,NULL,NULL),(10,16,11,NULL,NULL,3,NULL,NULL),(11,16,11,NULL,NULL,4,NULL,NULL),(12,16,11,NULL,NULL,5,NULL,NULL),(13,17,11,1,'firma_e3bcc474bdd2e628.png',1,'2023-09-23','yuiy'),(14,17,11,NULL,NULL,2,NULL,NULL),(15,17,11,NULL,NULL,3,'2023-11-23','fhfghfghfhfghfgh tanto tanto'),(16,18,18,1,'firma_8a0d9fb42caa9876.png',1,'2023-09-22','pedrito es muy molesto'),(17,18,18,1,'firma_30ab46d815b9390e.png',2,'2023-09-14','uiuiuiuiu'),(18,18,18,1,'firma_8c9d253ee39f9ddd.png',3,'2023-09-30','aun\r\ns'),(19,19,11,1,'firma_02251cb2e6fa7d10.png',1,'2023-09-21','hdsfhsdfhs'),(20,20,11,1,'firma_cbcea81d18a63e64.png',1,'2023-09-30',NULL),(21,20,11,NULL,NULL,2,NULL,NULL),(22,20,11,NULL,NULL,3,NULL,NULL),(23,20,11,NULL,NULL,4,NULL,NULL),(24,20,11,NULL,NULL,5,NULL,NULL),(25,21,11,1,'firma_352c5c46fd91ec32.png',1,'2023-09-29','Este paciente tiene la piel muy sensible de debera usar la potencia de la depildora laser al 50%'),(26,21,11,1,'firma_ed3fe50e6bc08fac.png',2,'2023-09-15','misma observacion que la sesion anterior'),(27,21,11,NULL,NULL,3,NULL,NULL),(28,21,11,NULL,NULL,4,NULL,NULL),(29,21,11,NULL,NULL,5,NULL,NULL),(30,21,11,NULL,NULL,6,NULL,NULL),(31,21,11,NULL,NULL,7,NULL,NULL),(32,21,11,NULL,NULL,8,NULL,NULL),(34,13,11,NULL,NULL,5,'2023-09-30','Ppppp\r\n'),(35,14,11,NULL,NULL,3,NULL,NULL),(36,21,11,NULL,NULL,9,NULL,NULL),(37,9,16,NULL,NULL,1,'2023-09-26',NULL),(38,9,16,NULL,NULL,2,NULL,NULL),(39,22,16,NULL,NULL,1,'2023-09-16',NULL),(40,22,16,NULL,NULL,2,NULL,NULL),(41,22,16,NULL,NULL,3,NULL,NULL),(42,22,16,NULL,NULL,4,NULL,NULL),(43,22,16,NULL,NULL,5,NULL,NULL),(44,9,16,NULL,NULL,3,NULL,NULL),(45,22,16,NULL,NULL,6,NULL,NULL),(46,22,16,NULL,NULL,7,NULL,NULL),(47,22,16,NULL,NULL,8,NULL,NULL),(48,22,16,NULL,NULL,9,NULL,NULL),(49,22,16,NULL,NULL,10,NULL,NULL),(50,13,11,NULL,NULL,6,NULL,NULL),(51,19,11,1,'firma_94f0ce2f81c532cc.png',2,'2023-09-30',''),(52,19,11,NULL,NULL,3,NULL,NULL),(53,19,11,NULL,NULL,4,NULL,NULL),(54,19,11,NULL,NULL,5,NULL,NULL),(55,19,11,NULL,NULL,6,NULL,NULL),(56,19,11,NULL,NULL,7,NULL,NULL),(57,19,11,NULL,NULL,8,NULL,NULL),(58,23,11,NULL,NULL,1,'2023-09-30',NULL),(59,23,11,NULL,NULL,2,NULL,NULL),(60,23,11,NULL,NULL,3,NULL,NULL),(61,23,11,NULL,NULL,4,NULL,NULL);
/*!40000 ALTER TABLE `firmaspaciente` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-18 13:03:47
