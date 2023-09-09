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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `firmaspaciente`
--

LOCK TABLES `firmaspaciente` WRITE;
/*!40000 ALTER TABLE `firmaspaciente` DISABLE KEYS */;
INSERT INTO `firmaspaciente` VALUES (2,13,11,1,'firma_9c01b487e71b30b3.png',1,'2023-09-22',NULL),(3,13,11,NULL,NULL,2,NULL,NULL),(4,13,11,NULL,NULL,3,NULL,NULL),(5,13,11,NULL,NULL,4,NULL,NULL),(6,14,11,NULL,NULL,1,'2023-09-23',NULL),(7,14,11,NULL,NULL,2,NULL,NULL),(8,16,11,NULL,NULL,1,'2023-09-16',NULL),(9,16,11,NULL,NULL,2,NULL,NULL),(10,16,11,NULL,NULL,3,NULL,NULL),(11,16,11,NULL,NULL,4,NULL,NULL),(12,16,11,NULL,NULL,5,NULL,NULL),(13,17,11,1,'firma_e3bcc474bdd2e628.png',1,'2023-09-23','yuiy'),(14,17,11,NULL,NULL,2,NULL,NULL),(15,17,11,NULL,NULL,3,'2023-11-23','fhfghfghfhfghfgh tanto tanto'),(16,18,18,1,'firma_8a0d9fb42caa9876.png',1,'2023-09-22','pedrito es muy molesto'),(17,18,18,1,'firma_30ab46d815b9390e.png',2,'2023-09-14','uiuiuiuiu'),(18,18,18,1,'firma_8c9d253ee39f9ddd.png',3,'2023-09-30','aun\r\ns');
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

-- Dump completed on 2023-09-09 17:56:47
