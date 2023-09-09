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
-- Table structure for table `tratamientospacientes`
--

DROP TABLE IF EXISTS `tratamientospacientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tratamientospacientes` (
  `idtratamientosPacientes` int NOT NULL AUTO_INCREMENT,
  `idTratamientos` int NOT NULL,
  `idPaciente` int NOT NULL,
  `idEsteticista` int NOT NULL,
  `fechaTratamiento` varchar(20) NOT NULL,
  `numSesiones` int NOT NULL,
  PRIMARY KEY (`idtratamientosPacientes`),
  KEY `idTratamientos_fk_idx` (`idTratamientos`),
  KEY `idPaciente_fk_idx` (`idPaciente`),
  KEY `idEsteticistas_fk_idx` (`idEsteticista`),
  CONSTRAINT `idEsteticistas_fk` FOREIGN KEY (`idEsteticista`) REFERENCES `esteticistas` (`idEsteticistas`),
  CONSTRAINT `idPaciente_fk` FOREIGN KEY (`idPaciente`) REFERENCES `pacientes` (`idPacientes`),
  CONSTRAINT `idTratamientos_fk` FOREIGN KEY (`idTratamientos`) REFERENCES `tratamientos` (`idTratamiento`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tratamientospacientes`
--

LOCK TABLES `tratamientospacientes` WRITE;
/*!40000 ALTER TABLE `tratamientospacientes` DISABLE KEYS */;
INSERT INTO `tratamientospacientes` VALUES (9,3,16,1,'2023-09-26',2),(11,1,16,1,'2023-09-23',8),(12,29,16,1,'2023-09-14',2),(13,1,11,1,'2023-09-22',4),(14,29,11,2,'2023-09-23',2),(16,28,11,2,'2023-09-16',5),(17,32,11,1,'2023-09-23',3),(18,2,18,2,'2023-09-22',3);
/*!40000 ALTER TABLE `tratamientospacientes` ENABLE KEYS */;
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
