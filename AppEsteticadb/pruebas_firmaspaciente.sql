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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `firmaspaciente`
--

LOCK TABLES `firmaspaciente` WRITE;
/*!40000 ALTER TABLE `firmaspaciente` DISABLE KEYS */;
INSERT INTO `firmaspaciente` VALUES (1,9,16,NULL,NULL,NULL,NULL,NULL);
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

-- Dump completed on 2023-09-07 16:18:37
