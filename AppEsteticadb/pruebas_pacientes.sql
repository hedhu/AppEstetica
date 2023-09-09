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
-- Table structure for table `pacientes`
--

DROP TABLE IF EXISTS `pacientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pacientes` (
  `idPacientes` int NOT NULL AUTO_INCREMENT,
  `nombrePaciente` varchar(70) NOT NULL,
  `edadPaciente` int NOT NULL,
  `fechaNacimiento` varchar(70) NOT NULL,
  `Telefono` varchar(45) NOT NULL,
  `Ocupacion` varchar(70) DEFAULT NULL,
  `Enfermedades` varchar(120) DEFAULT NULL,
  `EnfermedadesCronicas` varchar(120) DEFAULT NULL,
  `Medicamentos` varchar(120) DEFAULT NULL,
  `Alergias` varchar(120) DEFAULT NULL,
  `Implantes_Dispositivos` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`idPacientes`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pacientes`
--

LOCK TABLES `pacientes` WRITE;
/*!40000 ALTER TABLE `pacientes` DISABLE KEYS */;
INSERT INTO `pacientes` VALUES (11,'Eduardo Gallardo',19,'1112-02-07','12312321','Electricista','','','','',''),(12,'Julio Bascuñan',38,'2832-03-08','23423',NULL,NULL,NULL,NULL,NULL,NULL),(16,'Pancho Villa',35,'2023-05-10','9435345','Chofer','','','ibuprofeno','',''),(17,'Pedrito Juarez',34,'2023-09-11','2453345466','Chofer','Diarrea','Austismo','ibuprofeno','',''),(18,'Pedrito Nuñez',34,'2023-05-03','54657567','','','Austismo','ibuprofeno','A todo','');
/*!40000 ALTER TABLE `pacientes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-09 17:56:48
