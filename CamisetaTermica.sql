-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: camisetatermicainteligente
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `alertas`
--

DROP TABLE IF EXISTS `alertas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alertas` (
  `ID_Alerta` int NOT NULL AUTO_INCREMENT,
  `ID_Camiseta` varchar(10) DEFAULT NULL,
  `Tipo_Alerta` enum('Temperatura Baja','Temperatura Alta','Fallo en Sensor') NOT NULL,
  `Fecha` date NOT NULL,
  `Hora` time NOT NULL,
  `Estado_Alerta` enum('Resuelta','No Resuelta') DEFAULT 'No Resuelta',
  PRIMARY KEY (`ID_Alerta`),
  KEY `ID_Camiseta` (`ID_Camiseta`),
  CONSTRAINT `alertas_ibfk_1` FOREIGN KEY (`ID_Camiseta`) REFERENCES `camisetas` (`ID_Camiseta`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alertas`
--

LOCK TABLES `alertas` WRITE;
/*!40000 ALTER TABLE `alertas` DISABLE KEYS */;
INSERT INTO `alertas` VALUES (1,'C001','Temperatura Baja','2024-11-01','08:30:00','Resuelta'),(2,'C002','Temperatura Alta','2024-11-02','14:00:00','No Resuelta'),(3,'C003','Fallo en Sensor','2024-11-03','10:15:00','Resuelta'),(4,'C004','Temperatura Alta','2024-11-05','13:20:00','No Resuelta'),(5,'C005','Temperatura Baja','2024-11-06','07:45:00','Resuelta'),(6,'C006','Fallo en Sensor','2024-11-07','09:30:00','Resuelta'),(7,'C007','Temperatura Alta','2024-11-08','15:00:00','No Resuelta'),(8,'C001','Temperatura Baja','2024-11-09','06:50:00','Resuelta');
/*!40000 ALTER TABLE `alertas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `camisetas`
--

DROP TABLE IF EXISTS `camisetas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `camisetas` (
  `ID_Camiseta` varchar(10) NOT NULL,
  `ID_Usuario` int DEFAULT NULL,
  `Modelo` enum('TérmicaPro V1','TérmicaPlus V2','TérmicaUltra V3') DEFAULT 'TérmicaPro V1',
  `Fecha_Compra` date DEFAULT NULL,
  `Estado` enum('Activa','En Mantenimiento','Desactivada') DEFAULT 'Activa',
  PRIMARY KEY (`ID_Camiseta`),
  KEY `ID_Usuario` (`ID_Usuario`),
  CONSTRAINT `camisetas_ibfk_1` FOREIGN KEY (`ID_Usuario`) REFERENCES `usuarios` (`ID_Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `camisetas`
--

LOCK TABLES `camisetas` WRITE;
/*!40000 ALTER TABLE `camisetas` DISABLE KEYS */;
INSERT INTO `camisetas` VALUES ('C001',1,'TérmicaPro V1','2024-10-15','Activa'),('C002',2,'TérmicaPlus V2','2024-10-20','Activa'),('C003',3,'TérmicaUltra V3','2024-10-25','En Mantenimiento'),('C004',1,'TérmicaPlus V2','2024-11-01','Activa'),('C005',4,'TérmicaPro V1','2024-10-18','Desactivada'),('C006',5,'TérmicaUltra V3','2024-11-05','Activa'),('C007',6,'TérmicaPro V1','2024-10-22','En Mantenimiento');
/*!40000 ALTER TABLE `camisetas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configuracion_usuario`
--

DROP TABLE IF EXISTS `configuracion_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `configuracion_usuario` (
  `ID_Configuracion` int NOT NULL AUTO_INCREMENT,
  `ID_Usuario` int DEFAULT NULL,
  `Umbral_Temp_Baja` decimal(4,1) DEFAULT '15.0',
  `Umbral_Temp_Alta` decimal(4,1) DEFAULT '30.0',
  PRIMARY KEY (`ID_Configuracion`),
  KEY `ID_Usuario` (`ID_Usuario`),
  CONSTRAINT `configuracion_usuario_ibfk_1` FOREIGN KEY (`ID_Usuario`) REFERENCES `usuarios` (`ID_Usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuracion_usuario`
--

LOCK TABLES `configuracion_usuario` WRITE;
/*!40000 ALTER TABLE `configuracion_usuario` DISABLE KEYS */;
INSERT INTO `configuracion_usuario` VALUES (1,1,16.0,28.0),(2,2,15.0,30.0),(3,3,14.0,32.0),(4,4,17.0,29.0),(5,5,15.5,31.0),(6,6,16.5,30.5);
/*!40000 ALTER TABLE `configuracion_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historial_temperatura`
--

DROP TABLE IF EXISTS `historial_temperatura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historial_temperatura` (
  `ID_Registro` int NOT NULL AUTO_INCREMENT,
  `ID_Camiseta` varchar(10) DEFAULT NULL,
  `Temp_Ambiente` decimal(4,1) NOT NULL,
  `Temp_Corporal` decimal(4,1) NOT NULL,
  `Fecha` date NOT NULL,
  `Ajuste` enum('Aumento Aislamiento','Reducción Aislamiento','Sin Cambio') DEFAULT 'Sin Cambio',
  PRIMARY KEY (`ID_Registro`),
  KEY `ID_Camiseta` (`ID_Camiseta`),
  CONSTRAINT `historial_temperatura_ibfk_1` FOREIGN KEY (`ID_Camiseta`) REFERENCES `camisetas` (`ID_Camiseta`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historial_temperatura`
--

LOCK TABLES `historial_temperatura` WRITE;
/*!40000 ALTER TABLE `historial_temperatura` DISABLE KEYS */;
INSERT INTO `historial_temperatura` VALUES (1,'C001',15.0,36.5,'2024-11-01','Aumento Aislamiento'),(2,'C002',28.0,36.8,'2024-11-02','Reducción Aislamiento'),(3,'C003',22.0,36.0,'2024-11-03','Sin Cambio'),(4,'C001',14.0,36.3,'2024-11-04','Aumento Aislamiento'),(5,'C004',25.0,36.7,'2024-11-05','Reducción Aislamiento'),(6,'C005',19.0,36.4,'2024-11-06','Sin Cambio'),(7,'C006',17.0,36.2,'2024-11-07','Aumento Aislamiento'),(8,'C007',21.0,36.6,'2024-11-08','Reducción Aislamiento'),(9,'C002',29.0,36.9,'2024-11-09','Reducción Aislamiento'),(10,'C003',20.0,36.1,'2024-11-10','Sin Cambio');
/*!40000 ALTER TABLE `historial_temperatura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `ID_Usuario` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) NOT NULL,
  `Preferencia_Termica` enum('Calor Moderado','Mayor Calidez','Frío Suave') DEFAULT 'Calor Moderado',
  PRIMARY KEY (`ID_Usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Carlos Pérez','Calor Moderado'),(2,'Laura Gómez','Mayor Calidez'),(3,'Ana Torres','Frío Suave'),(4,'Jorge Martínez','Calor Moderado'),(5,'Luis Ramírez','Frío Suave'),(6,'María López','Mayor Calidez');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-28 22:24:13
