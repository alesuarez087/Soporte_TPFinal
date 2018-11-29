CREATE DATABASE  IF NOT EXISTS `java_tpfinal` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;
USE `java_tpfinal`;
-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: java_tpfinal
-- ------------------------------------------------------
-- Server version	5.7.17-log

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
-- Table structure for table `artistas`
--

DROP TABLE IF EXISTS `artistas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `artistas` (
  `id_artista` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_artista` varchar(100) NOT NULL,
  `habilitado` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_artista`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artistas`
--

LOCK TABLES `artistas` WRITE;
/*!40000 ALTER TABLE `artistas` DISABLE KEYS */;
INSERT INTO `artistas` VALUES (1,'Ciro y los persas',1),(2,'Los Piojos',1),(3,'Callejeros',1),(5,'Bersuit Vergarabat',1),(7,'Luis Alberto Spinetta',1),(8,'Don Omar',1),(9,'Salta la Banca',1),(10,'Miss Bolivia',1),(11,'Onda Vaga',1),(12,'Andrés Calamaro',0),(13,'Javier Calamaro',1),(14,'Árbol',1),(17,'La Franela',1),(19,'Las pastillas del abuelo',1),(20,'Utopians',1),(21,'Fito Páez',1),(23,'Rosario',1),(24,'Romeo',1),(25,'El mató a un policía motorizado',1),(26,'Militantes del climax',1);
/*!40000 ALTER TABLE `artistas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clasificaciones`
--

DROP TABLE IF EXISTS `clasificaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clasificaciones` (
  `id_clasificacion` int(11) NOT NULL AUTO_INCREMENT,
  `puntos` int(11) NOT NULL,
  `mensaje_adjunto` varchar(500) DEFAULT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_item` int(11) NOT NULL,
  PRIMARY KEY (`id_clasificacion`),
  KEY `clasificaciones_usuario` (`id_usuario`),
  KEY `clasificaciones_item_idx` (`id_item`),
  CONSTRAINT `clasificaciones_item` FOREIGN KEY (`id_item`) REFERENCES `items` (`id_item`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `clasificaciones_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clasificaciones`
--

LOCK TABLES `clasificaciones` WRITE;
/*!40000 ALTER TABLE `clasificaciones` DISABLE KEYS */;
INSERT INTO `clasificaciones` VALUES (1,4,NULL,2,1),(2,4,'discazo',2,2),(3,4,'jajaja',2,3),(4,3,'Le sobran acordes',2,5),(5,4,'Un punto menos porque critan a la Jefa',2,7);
/*!40000 ALTER TABLE `clasificaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `generos`
--

DROP TABLE IF EXISTS `generos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `generos` (
  `id_genero` int(11) NOT NULL AUTO_INCREMENT,
  `desc_genero` varchar(50) NOT NULL,
  `habilitado` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_genero`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `generos`
--

LOCK TABLES `generos` WRITE;
/*!40000 ALTER TABLE `generos` DISABLE KEYS */;
INSERT INTO `generos` VALUES (1,'Rock',1),(2,'Pop',1),(3,'Indie',1),(4,'Tango',1),(5,'Reggaeton',1),(6,'House',1),(7,'Cumbia',1),(8,'Folclore',1),(9,'Folk',1),(10,'Techno',1),(11,'Punk',1),(12,'Rap',1);
/*!40000 ALTER TABLE `generos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items` (
  `id_item` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) NOT NULL,
  `anio_lanzamiento` varchar(4) NOT NULL,
  `stock` int(11) NOT NULL,
  `habilitado` tinyint(1) NOT NULL,
  `id_artista` int(11) NOT NULL,
  `id_genero` int(11) NOT NULL,
  `id_tipo_disco` int(11) NOT NULL,
  `url_portada` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_item`),
  KEY `item_artista` (`id_artista`),
  KEY `item_genero` (`id_genero`),
  KEY `item_tipo_item_idx` (`id_tipo_disco`),
  CONSTRAINT `item_artista` FOREIGN KEY (`id_artista`) REFERENCES `artistas` (`id_artista`),
  CONSTRAINT `item_genero` FOREIGN KEY (`id_genero`) REFERENCES `generos` (`id_genero`),
  CONSTRAINT `item_tipo_item` FOREIGN KEY (`id_tipo_disco`) REFERENCES `tipos_item` (`id_tipo_item`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (1,'Espejos','2010',49,1,1,1,2,'https://http2.mlstatic.com/ciro-y-los-persas-espejos-D_NQ_NP_13678-MLA91811310_2287-F.jpg'),(2,'27','2012',30,1,1,1,2,'http://1.bp.blogspot.com/-8HBeN45MWoE/UkcG-Kf-K-I/AAAAAAAABio/PwoxzD5n0_w/s1600/Ciro_Y_Los_Persas-27-Frontal.jpg'),(3,'Verde Paisaje del Infierno','2000',92,1,2,1,2,'http://images.coveralia.com/audio/l/Los_Piojos-Verde_Paisaje_Del_Infierno-Frontal.jpg'),(4,'Máquina de Sangre','2003',100,1,2,1,2,'http://www.cmtv.com.ar/tapas-cd/piojosmaquinadesangre.jpg'),(5,'Artaud','1973',100,1,7,1,5,'http://1.bp.blogspot.com/-JymquRyAGps/UKjeS7t_1dI/AAAAAAAAAP0/fDOUteefGA8/s1600/Pescado%2BRabioso%2B-%2BArtaud%2B-%2BCover.jpg'),(6,'The Last Don','2003',93,1,8,5,2,'http://obligao.net/ipauta/images/frontcuvu.jpg'),(7,'Visceral','2013',1,1,9,1,2,'http://www.cmtv.com.ar/tapas-cd/saltalabancavisceral.jpg'),(8,'Naranja Persa I','2016',0,1,1,1,2,'https://www.cmtv.com.ar/tapas-cd/ciroylospersasnaranjapersa.jpg'),(9,'Naranja Persa II','2018',0,0,1,1,2,'http://cdn-d15c.kxcdn.com/fotos/discos/000/013/095/original/foto.jpg'),(10,'Después de ver','2008',100,1,17,1,2,'https://www.cmtv.com.ar/tapas-cd/franeladespues.jpg'),(11,'Chac tu chac','1992',100,1,2,1,2,'https://www.cmtv.com.ar/tapas-cd/piojoschac.jpg');
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `precios`
--

DROP TABLE IF EXISTS `precios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `precios` (
  `id_item` int(11) unsigned NOT NULL,
  `fecha_desde` date NOT NULL,
  `monto` float NOT NULL,
  PRIMARY KEY (`id_item`,`fecha_desde`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `precios`
--

LOCK TABLES `precios` WRITE;
/*!40000 ALTER TABLE `precios` DISABLE KEYS */;
INSERT INTO `precios` VALUES (1,'2017-03-05',100),(1,'2017-04-17',200),(1,'2018-10-17',150),(1,'2018-10-26',200),(2,'2017-03-05',100),(2,'2017-04-21',200),(3,'2017-03-05',100),(4,'2017-03-05',100),(5,'2017-03-05',100),(5,'2018-10-26',104),(6,'2017-03-05',100),(7,'2017-03-05',200),(7,'2018-10-17',200),(8,'2018-10-17',250),(9,'2018-10-17',250),(10,'2018-10-26',150),(11,'2018-11-26',120);
/*!40000 ALTER TABLE `precios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provincias`
--

DROP TABLE IF EXISTS `provincias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `provincias` (
  `id_provincia` int(11) NOT NULL AUTO_INCREMENT,
  `desc_provincia` varchar(45) NOT NULL,
  PRIMARY KEY (`id_provincia`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provincias`
--

LOCK TABLES `provincias` WRITE;
/*!40000 ALTER TABLE `provincias` DISABLE KEYS */;
INSERT INTO `provincias` VALUES (1,'Buenos Aires'),(2,'Capital Federal'),(4,'Catamarca'),(5,'Chaco'),(6,'Chubut'),(7,'Córdoba'),(8,'Corrientes'),(9,'Entre Ríos'),(10,'Formosa'),(11,'Jujuy'),(12,'La Pampa'),(13,'La Rioja'),(14,'Mendoza'),(15,'Misiones'),(16,'Neuquén'),(17,'Río Negro'),(18,'Salta'),(19,'San Juan'),(20,'San Luis'),(21,'Santa Cruz'),(22,'Santa Fe'),(23,'Santiago del Estero'),(24,'Tierra del Fuego'),(25,'Tucumán');
/*!40000 ALTER TABLE `provincias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipos_item`
--

DROP TABLE IF EXISTS `tipos_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipos_item` (
  `id_tipo_item` int(11) NOT NULL AUTO_INCREMENT,
  `desc_tipo_item` varchar(45) NOT NULL,
  `habilitado` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_tipo_item`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipos_item`
--

LOCK TABLES `tipos_item` WRITE;
/*!40000 ALTER TABLE `tipos_item` DISABLE KEYS */;
INSERT INTO `tipos_item` VALUES (1,'Blue Ray',1),(2,'CD',1),(3,'DVD',1),(4,'Pasta',1),(5,'Vinilo',1),(6,'Cassette',1),(7,'Remaras',1),(8,'Buzo',0);
/*!40000 ALTER TABLE `tipos_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipos_usuario`
--

DROP TABLE IF EXISTS `tipos_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipos_usuario` (
  `id_tipo_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `desc_tipo_usuario` varchar(50) NOT NULL,
  `habilitado` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_tipo_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipos_usuario`
--

LOCK TABLES `tipos_usuario` WRITE;
/*!40000 ALTER TABLE `tipos_usuario` DISABLE KEYS */;
INSERT INTO `tipos_usuario` VALUES (1,'Administrador',1),(2,'Empleado',1),(3,'Usuario',1);
/*!40000 ALTER TABLE `tipos_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `habilitado` tinyint(1) NOT NULL,
  `id_tipo_usuario` int(11) NOT NULL,
  `clave` varchar(50) NOT NULL,
  `dni` varchar(50) NOT NULL,
  `nombre_usuario` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`id_usuario`),
  KEY `id_tipo_usuario` (`id_tipo_usuario`),
  CONSTRAINT `id_tipo_usuario` FOREIGN KEY (`id_tipo_usuario`) REFERENCES `tipos_usuario` (`id_tipo_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (2,'David','Martínez',1,3,'fer12345','martinezd@gmail.com','martinezd','12345678'),(3,'Ale','Suarez',1,1,'suareza','36005591','suareza','alepersa087@gmail.com'),(4,'Araceli','Castelletta',1,1,'fer12345','12','arac','arac@gmail.com'),(5,'Diego','Maradona',1,2,'fer12345','3223','maradonad','diegote@gmail.com'),(6,'José María','Suárez',1,3,'josema10','34567325','josema10','josema@gmail.com'),(7,'José María','Suárez',0,3,'fer12345','18976254','josema11','alferpa3@uolsinectis.com.ar');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta_item`
--

DROP TABLE IF EXISTS `venta_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `venta_item` (
  `id_venta` int(11) NOT NULL,
  `id_item` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  PRIMARY KEY (`id_venta`,`id_item`),
  KEY `venta_item_item` (`id_item`),
  CONSTRAINT `venta_item_item` FOREIGN KEY (`id_item`) REFERENCES `items` (`id_item`),
  CONSTRAINT `venta_item_venta` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id_venta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta_item`
--

LOCK TABLES `venta_item` WRITE;
/*!40000 ALTER TABLE `venta_item` DISABLE KEYS */;
INSERT INTO `venta_item` VALUES (5,1,3),(10,1,4),(20,3,3),(23,2,3),(23,8,5),(24,8,2),(25,1,4);
/*!40000 ALTER TABLE `venta_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ventas` (
  `id_venta` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `titular_tarjeta` varchar(150) NOT NULL,
  `nro_tarjeta` varchar(16) NOT NULL,
  `habilitado` tinyint(1) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `calle` varchar(45) NOT NULL,
  `numero` varchar(8) NOT NULL,
  `localidad` varchar(60) NOT NULL,
  `id_provincia` int(11) NOT NULL,
  `piso` char(1) DEFAULT NULL,
  `dpto` char(1) DEFAULT NULL,
  PRIMARY KEY (`id_venta`),
  KEY `venta_usuario` (`id_usuario`),
  KEY `venta_provincia_idx` (`id_provincia`),
  CONSTRAINT `venta_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
INSERT INTO `ventas` VALUES (5,'2017-03-05','aaa','1212',1,2,'','0','0',0,NULL,NULL),(10,'2017-04-24','Loco','34343434',1,2,'San Juan','5329','Rosario',22,NULL,NULL),(20,'2017-04-29','Dios','1234123412341234',1,2,'Falsa','123','Corrientes',8,NULL,NULL),(23,'2018-10-20','Don\'t have idea','1234123412341234',1,2,'False','123','Rio Cuarto',7,NULL,NULL),(24,'2018-10-20','Alguien','1234123412341234',1,2,'Falsa 123','156','Posadas',15,'5','A'),(25,'2018-11-28','José María Suárez','1234123412341234',1,2,'San Juan','5329','Rosario',22,NULL,NULL);
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'java_tpfinal'
--
/*!50003 DROP PROCEDURE IF EXISTS `ArtistasDelete` */;
ALTER DATABASE `java_tpfinal` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ArtistasDelete`(IN cod INT)
BEGIN
UPDATE artistas SET habilitado = false
WHERE id_artista = cod;
UPDATE items SET habilitado = false
WHERE id_genero = cod;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `java_tpfinal` CHARACTER SET utf8 COLLATE utf8_bin ;
/*!50003 DROP PROCEDURE IF EXISTS `ArtistasGetAll` */;
ALTER DATABASE `java_tpfinal` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ArtistasGetAll`()
BEGIN
SELECT *
FROM artistas
ORDER BY nombre_artista;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `java_tpfinal` CHARACTER SET utf8 COLLATE utf8_bin ;
/*!50003 DROP PROCEDURE IF EXISTS `ArtistasGetAllHabilitado` */;
ALTER DATABASE `java_tpfinal` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ArtistasGetAllHabilitado`()
BEGIN
SELECT *
FROM artistas
WHERE artistas.habilitado = true;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `java_tpfinal` CHARACTER SET utf8 COLLATE utf8_bin ;
/*!50003 DROP PROCEDURE IF EXISTS `ArtistasGetOne` */;
ALTER DATABASE `java_tpfinal` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ArtistasGetOne`(IN nombre VARCHAR(100))
BEGIN
SELECT *
FROM artistas
WHERE nombre_artista = nombre;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `java_tpfinal` CHARACTER SET utf8 COLLATE utf8_bin ;
/*!50003 DROP PROCEDURE IF EXISTS `ArtistasGetOneForID` */;
ALTER DATABASE `java_tpfinal` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ArtistasGetOneForID`(IN id INT)
BEGIN
SELECT *
FROM artistas
WHERE id_artista = id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `java_tpfinal` CHARACTER SET utf8 COLLATE utf8_bin ;
/*!50003 DROP PROCEDURE IF EXISTS `ArtistasInsert` */;
ALTER DATABASE `java_tpfinal` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ArtistasInsert`(IN nombre VARCHAR(100), IN hab BOOLEAN)
BEGIN
INSERT INTO artistas(nombre_artista, habilitado) VALUES (nombre, hab);
SELECT LAST_INSERT_ID();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `java_tpfinal` CHARACTER SET utf8 COLLATE utf8_bin ;
/*!50003 DROP PROCEDURE IF EXISTS `ArtistasUpdate` */;
ALTER DATABASE `java_tpfinal` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ArtistasUpdate`(IN nombre VARCHAR(100), IN hab BOOLEAN, IN cod INT)
BEGIN
UPDATE artistas SET nombre_artista = nombre, habilitado=hab
WHERE id_artista = cod;
UPDATE items SET habilitado = hab
WHERE id_artista = cod;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `java_tpfinal` CHARACTER SET utf8 COLLATE utf8_bin ;
/*!50003 DROP PROCEDURE IF EXISTS `ClasificacionesGetAll` */;
ALTER DATABASE `java_tpfinal` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ClasificacionesGetAll`(IN idItem INT)
BEGIN
SELECT *
FROM clasificaciones
WHERE id_item  = idItem;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `java_tpfinal` CHARACTER SET utf8 COLLATE utf8_bin ;
/*!50003 DROP PROCEDURE IF EXISTS `ClasificacionesGetOne` */;
ALTER DATABASE `java_tpfinal` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ClasificacionesGetOne`(IN item INT, IN user INT)
BEGIN
SELECT *
FROM clasificaciones
WHERE id_usuario = user AND id_item = item;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `java_tpfinal` CHARACTER SET utf8 COLLATE utf8_bin ;
/*!50003 DROP PROCEDURE IF EXISTS `ClasificacionesInsert` */;
ALTER DATABASE `java_tpfinal` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ClasificacionesInsert`(IN item INT, IN user INT, IN val INT, IN det VARCHAR(200))
BEGIN
INSERT INTO clasificaciones(id_item, id_usuario, puntos, mensaje_adjunto)
	VALUES(item, user, val, det);
SELECT LAST_INSERT_ID();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `java_tpfinal` CHARACTER SET utf8 COLLATE utf8_bin ;
/*!50003 DROP PROCEDURE IF EXISTS `ClasificacionesPromedio` */;
ALTER DATABASE `java_tpfinal` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ClasificacionesPromedio`(IN idItem int)
BEGIN
SELECT AVG(puntos)
FROM clasificaciones
WHERE id_item = idItem
GROUP BY id_clasificacion;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `java_tpfinal` CHARACTER SET utf8 COLLATE utf8_bin ;
/*!50003 DROP PROCEDURE IF EXISTS `ClasificacionesUpdate` */;
ALTER DATABASE `java_tpfinal` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ClasificacionesUpdate`(IN item INT, IN user INT, IN val INT, IN det VARCHAR(200), IN id INT)
BEGIN
UPDATE clasificaciones 
SET id_item = item, id_usuario = user, puntos=val, mensaje_adjunto = det
WHERE id_clasificacion = id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `java_tpfinal` CHARACTER SET utf8 COLLATE utf8_bin ;
/*!50003 DROP PROCEDURE IF EXISTS `GenerosDelete` */;
ALTER DATABASE `java_tpfinal` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GenerosDelete`(IN cod BOOLEAN)
BEGIN
UPDATE generos SET  habilitado = false
WHERE id_genero = cod;
UPDATE items SET habilitado = false
WHERE id_genero = cod;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `java_tpfinal` CHARACTER SET utf8 COLLATE utf8_bin ;
/*!50003 DROP PROCEDURE IF EXISTS `GenerosGetAll` */;
ALTER DATABASE `java_tpfinal` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GenerosGetAll`()
BEGIN
SELECT *
FROM generos
ORDER BY desc_genero ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `java_tpfinal` CHARACTER SET utf8 COLLATE utf8_bin ;
/*!50003 DROP PROCEDURE IF EXISTS `GenerosGetAllHabilitado` */;
ALTER DATABASE `java_tpfinal` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GenerosGetAllHabilitado`()
BEGIN
SELECT *
FROM generos
WHERE habilitado = true
ORDER BY desc_genero;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `java_tpfinal` CHARACTER SET utf8 COLLATE utf8_bin ;
/*!50003 DROP PROCEDURE IF EXISTS `GenerosGetOne` */;
ALTER DATABASE `java_tpfinal` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GenerosGetOne`(IN descr varchar(50))
BEGIN
SELECT *
FROM generos
WHERE desc_genero = descr;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `java_tpfinal` CHARACTER SET utf8 COLLATE utf8_bin ;
/*!50003 DROP PROCEDURE IF EXISTS `GenerosGetOneForID` */;
ALTER DATABASE `java_tpfinal` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GenerosGetOneForID`(IN id INT)
BEGIN
SELECT *
FROM generos 
WHERE id_genero = id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `java_tpfinal` CHARACTER SET utf8 COLLATE utf8_bin ;
/*!50003 DROP PROCEDURE IF EXISTS `GenerosInsert` */;
ALTER DATABASE `java_tpfinal` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GenerosInsert`(IN nombre VARCHAR(50), IN hab BOOLEAN)
BEGIN
INSERT INTO generos(desc_genero, habilitado) VALUES (nombre, hab);
SELECT LAST_INSERT_ID();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `java_tpfinal` CHARACTER SET utf8 COLLATE utf8_bin ;
/*!50003 DROP PROCEDURE IF EXISTS `GenerosUpdate` */;
ALTER DATABASE `java_tpfinal` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GenerosUpdate`(IN nombre VARCHAR(50), IN hab BOOLEAN, IN cod INT)
BEGIN
UPDATE generos SET desc_genero = nombre, habilitado = hab
WHERE id_genero = cod;
UPDATE items SET habilitado = hab
WHERE id_genero = cod;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `java_tpfinal` CHARACTER SET utf8 COLLATE utf8_bin ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAllVentas` */;
ALTER DATABASE `java_tpfinal` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllVentas`(IN idVenta INT)
BEGIN
SELECT *
FROM venta_item
WHERE id_venta = idVenta;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `java_tpfinal` CHARACTER SET utf8 COLLATE utf8_bin ;
/*!50003 DROP PROCEDURE IF EXISTS `ItemsBusqueda` */;
ALTER DATABASE `java_tpfinal` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ItemsBusqueda`(IN busca VARCHAR(45))
BEGIN
select *
from items it
inner join artistas ar on ar.id_artista = it.id_artista
where it.titulo like (concat('%', busca, '%')) or ar.nombre_artista like (concat('%', busca, '%'))
group by it.id_item
;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `java_tpfinal` CHARACTER SET utf8 COLLATE utf8_bin ;
/*!50003 DROP PROCEDURE IF EXISTS `ItemsDelete` */;
ALTER DATABASE `java_tpfinal` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ItemsDelete`(IN id INT)
BEGIN
UPDATE items SET habilitado = false
WHERE id_item = id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `java_tpfinal` CHARACTER SET utf8 COLLATE utf8_bin ;
/*!50003 DROP PROCEDURE IF EXISTS `ItemsGetAll` */;
ALTER DATABASE `java_tpfinal` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ItemsGetAll`()
BEGIN
	SELECT * 
    FROM items
    ORDER BY titulo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `java_tpfinal` CHARACTER SET utf8 COLLATE utf8_bin ;
/*!50003 DROP PROCEDURE IF EXISTS `ItemsGetAllForArtista` */;
ALTER DATABASE `java_tpfinal` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ItemsGetAllForArtista`(IN artista VARCHAR(100))
BEGIN
SELECT *
FROM items itm
INNER JOIN artistas art ON art.id_artista = itm.id_artista
WHERE art.nombre_artista = artista;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `java_tpfinal` CHARACTER SET utf8 COLLATE utf8_bin ;
/*!50003 DROP PROCEDURE IF EXISTS `ItemsGetAllForGenero` */;
ALTER DATABASE `java_tpfinal` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ItemsGetAllForGenero`(IN gen VARCHAR(50))
BEGIN
SELECT * 
FROM items
INNER JOIN generos ON items.id_genero = generos.id_genero
WHERE desc_genero = gen;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `java_tpfinal` CHARACTER SET utf8 COLLATE utf8_bin ;
/*!50003 DROP PROCEDURE IF EXISTS `ItemsGetAllHabilitado` */;
ALTER DATABASE `java_tpfinal` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ItemsGetAllHabilitado`()
BEGIN
SELECT *
FROM items
WHERE habilitado = true;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `java_tpfinal` CHARACTER SET utf8 COLLATE utf8_bin ;
/*!50003 DROP PROCEDURE IF EXISTS `ItemsGetMejorPromedio` */;
ALTER DATABASE `java_tpfinal` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ItemsGetMejorPromedio`()
BEGIN
select it.*, avg(ca.puntos) promedio
from items it
inner join clasificaciones ca on ca.id_item = it.id_item
group by it.id_item
order by promedio desc
limit 0,8;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `java_tpfinal` CHARACTER SET utf8 COLLATE utf8_bin ;
/*!50003 DROP PROCEDURE IF EXISTS `ItemsGetOne` */;
ALTER DATABASE `java_tpfinal` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ItemsGetOne`(IN id INT)
BEGIN
	SELECT *
    FROM items
    WHERE id_item = id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `java_tpfinal` CHARACTER SET utf8 COLLATE utf8_bin ;
/*!50003 DROP PROCEDURE IF EXISTS `ItemsGetTop8` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ItemsGetTop8`()
BEGIN
drop temporary table if exists valores_actuales;

create temporary table valores_actuales(
select id_item, max(fecha_desde) as vigencia_desde
from precios
group by id_item
);

select it.*, count(vi.cantidad) as cantidad, pr.monto as monto
from items it
inner join venta_item vi on it.id_item = vi.id_item
inner join valores_actuales va ON it.id_item = va.id_item
inner join precios pr ON va.id_item = pr.id_item and va.vigencia_desde = pr.fecha_desde
group by it.id_item
order by cantidad desc 
limit 0,8
;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ItemsGetTopMes` */;
ALTER DATABASE `java_tpfinal` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ItemsGetTopMes`()
BEGIN
select it.*, count(vi.cantidad) as cantidad
from items it
inner join venta_item vi on it.id_item = vi.id_item
inner join ventas ve on vi.id_venta = ve.id_venta
where ve.fecha <= curdate() and ve.fecha>= date_sub(now(), interval 1 month)
group by it.id_item
order by cantidad desc 
limit 0,4
;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `java_tpfinal` CHARACTER SET utf8 COLLATE utf8_bin ;
/*!50003 DROP PROCEDURE IF EXISTS `ItemsGetTopSemana` */;
ALTER DATABASE `java_tpfinal` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ItemsGetTopSemana`()
BEGIN
select it.*, count(vi.cantidad) as cantidad
from items it
inner join venta_item vi on it.id_item = vi.id_item
inner join ventas ve on vi.id_venta = ve.id_venta
where ve.fecha <= curdate() and ve.fecha>= date_sub(now(), interval 7 day)
group by it.id_item
order by cantidad desc 
limit 0,8;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `java_tpfinal` CHARACTER SET utf8 COLLATE utf8_bin ;
/*!50003 DROP PROCEDURE IF EXISTS `ItemsInsert` */;
ALTER DATABASE `java_tpfinal` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ItemsInsert`(IN anio VARCHAR(4), IN hab BOOLEAN, IN artista INT,
						IN genero INT, IN st INT, IN tit VARCHAR(100),
                        IN tipo INT, IN url VARCHAR(200))
BEGIN
INSERT INTO items(anio_lanzamiento, habilitado, id_artista, id_genero,
		stock, titulo, id_tipo_disco, url_portada)
	VALUES(anio, hab, artista, genero, st, tit, tipo, url);
SELECT LAST_INSERT_ID();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `java_tpfinal` CHARACTER SET utf8 COLLATE utf8_bin ;
/*!50003 DROP PROCEDURE IF EXISTS `ItemsUpdate` */;
ALTER DATABASE `java_tpfinal` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ItemsUpdate`(IN anio VARCHAR(4), IN hab BOOLEAN, IN artista INT,
						IN genero INT, IN st INT, IN tit VARCHAR(100),
                        IN tipo INT, IN id INT, IN url VARCHAR(200))
BEGIN
UPDATE items SET anio_lanzamiento=anio, habilitado=hab, id_artista=artista,
				id_genero=genero, stock=st, titulo=tit,
                id_tipo_disco=tipo, url_portada=url
WHERE id_item = id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `java_tpfinal` CHARACTER SET utf8 COLLATE utf8_bin ;
/*!50003 DROP PROCEDURE IF EXISTS `PrecioGetToday` */;
ALTER DATABASE `java_tpfinal` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PrecioGetToday`(IN idItem int)
BEGIN
drop temporary table if exists valores_actuales;

create temporary table valores_actuales(
select id_item, max(fecha_desde) as vigencia_desde
from precios
group by id_item
);

select it.id_item as id_item, pr.monto as monto, va.vigencia_desde as vigencia_desde
from items it
inner join valores_actuales va ON it.id_item = va.id_item
inner join precios pr ON va.id_item = pr.id_item and va.vigencia_desde = pr.fecha_desde
where it.id_item = idItem
;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `java_tpfinal` CHARACTER SET utf8 COLLATE utf8_bin ;
/*!50003 DROP PROCEDURE IF EXISTS `PrecioGetVenta` */;
ALTER DATABASE `java_tpfinal` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PrecioGetVenta`(IN idItem int, IN idVenta int)
BEGIN

SELECT fecha into @fecha_compra
FROM ventas
WHERE id_venta = idVenta;

drop temporary table if exists valores_actuales;

create temporary table valores_actuales(
select id_item, max(fecha_desde) as vigencia_desde
from precios
where fecha_desde <= @fecha_compra
group by id_item
);

select it.id_item as id_item, pr.monto as monto, va.vigencia_desde as vigencia_desde
from items it
inner join valores_actuales va ON it.id_item = va.id_item
inner join precios pr ON va.id_item = pr.id_item and va.vigencia_desde = pr.fecha_desde
where it.id_item = idItem
;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `java_tpfinal` CHARACTER SET utf8 COLLATE utf8_bin ;
/*!50003 DROP PROCEDURE IF EXISTS `PrecioInsert` */;
ALTER DATABASE `java_tpfinal` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PrecioInsert`(IN idItem int, IN precio double)
BEGIN
INSERT INTO precios(fecha_desde, id_item, monto) VALUES (CURDATE(), idItem, precio);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `java_tpfinal` CHARACTER SET utf8 COLLATE utf8_bin ;
/*!50003 DROP PROCEDURE IF EXISTS `ProvinciasGetAll` */;
ALTER DATABASE `java_tpfinal` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ProvinciasGetAll`()
BEGIN
select *
from provincias;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `java_tpfinal` CHARACTER SET utf8 COLLATE utf8_bin ;
/*!50003 DROP PROCEDURE IF EXISTS `ProvinciasGetOne` */;
ALTER DATABASE `java_tpfinal` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ProvinciasGetOne`(IN descrip VARCHAR(60))
BEGIN
select *
from provincias 
where desc_provincia = descrip;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `java_tpfinal` CHARACTER SET utf8 COLLATE utf8_bin ;
/*!50003 DROP PROCEDURE IF EXISTS `TiposItemGetAllHabilitados` */;
ALTER DATABASE `java_tpfinal` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `TiposItemGetAllHabilitados`()
BEGIN
SELECT *
FROM tipos_item
WHERE habilitado = true;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `java_tpfinal` CHARACTER SET utf8 COLLATE utf8_bin ;
/*!50003 DROP PROCEDURE IF EXISTS `TiposItemGetOne` */;
ALTER DATABASE `java_tpfinal` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `TiposItemGetOne`(IN descripcion VARCHAR(45))
BEGIN
SELECT *
FROM tipos_item
WHERE desc_tipo_item = descripcion;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `java_tpfinal` CHARACTER SET utf8 COLLATE utf8_bin ;
/*!50003 DROP PROCEDURE IF EXISTS `TiposItemGetOneForID` */;
ALTER DATABASE `java_tpfinal` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `TiposItemGetOneForID`(IN idTipoItem INT)
BEGIN
SELECT * 
FROM tipos_item
WHERE id_tipo_item = idTipoItem;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `java_tpfinal` CHARACTER SET utf8 COLLATE utf8_bin ;
/*!50003 DROP PROCEDURE IF EXISTS `TiposUsuarioGetAll` */;
ALTER DATABASE `java_tpfinal` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `TiposUsuarioGetAll`()
BEGIN
	SELECT * 
    FROM tipos_usuario;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `java_tpfinal` CHARACTER SET utf8 COLLATE utf8_bin ;
/*!50003 DROP PROCEDURE IF EXISTS `UsuariosDelete` */;
ALTER DATABASE `java_tpfinal` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UsuariosDelete`(IN cod int)
BEGIN
UPDATE usuarios SET habilitado = false
WHERE id=cod;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `java_tpfinal` CHARACTER SET utf8 COLLATE utf8_bin ;
/*!50003 DROP PROCEDURE IF EXISTS `UsuariosGetAll` */;
ALTER DATABASE `java_tpfinal` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UsuariosGetAll`()
BEGIN
	SELECT * FROM usuarios
    ORDER BY apellido, nombre;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `java_tpfinal` CHARACTER SET utf8 COLLATE utf8_bin ;
/*!50003 DROP PROCEDURE IF EXISTS `UsuariosGetOne` */;
ALTER DATABASE `java_tpfinal` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UsuariosGetOne`(IN user varchar(50))
BEGIN
SELECT * 
FROM usuarios 
WHERE usuarios.nombre_usuario = user;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `java_tpfinal` CHARACTER SET utf8 COLLATE utf8_bin ;
/*!50003 DROP PROCEDURE IF EXISTS `UsuariosGetOneForId` */;
ALTER DATABASE `java_tpfinal` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UsuariosGetOneForId`(IN id INT)
BEGIN
SELECT * 
FROM usuarios 
WHERE id_usuario = id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `java_tpfinal` CHARACTER SET utf8 COLLATE utf8_bin ;
/*!50003 DROP PROCEDURE IF EXISTS `UsuariosInsert` */;
ALTER DATABASE `java_tpfinal` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UsuariosInsert`(IN ape varchar(100), IN cla varchar(50), 
								 IN mail varchar(100), IN nom varchar(100), 
                                 IN user varchar(50), IN tipo INT, IN hab BOOLEAN,
                                 IN doc varchar(50))
BEGIN
INSERT INTO usuarios(apellido, clave, email, nombre, nombre_usuario, id_tipo_usuario, habilitado, dni) 
	   VALUES (ape, cla, mail, nom, user, tipo, hab, doc);
SELECT LAST_INSERT_ID();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `java_tpfinal` CHARACTER SET utf8 COLLATE utf8_bin ;
/*!50003 DROP PROCEDURE IF EXISTS `UsuariosLogin` */;
ALTER DATABASE `java_tpfinal` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UsuariosLogin`(IN user varchar(50), IN pass varchar(50))
BEGIN
SELECT * 
FROM usuarios 
WHERE usuarios.nombre_usuario = user and usuarios.clave = pass;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `java_tpfinal` CHARACTER SET utf8 COLLATE utf8_bin ;
/*!50003 DROP PROCEDURE IF EXISTS `UsuariosUpdate` */;
ALTER DATABASE `java_tpfinal` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UsuariosUpdate`(IN ape varchar(100), IN cla varchar(50), 
								 IN mail varchar(100), IN nom varchar(100), 
                                 IN user varchar(50), IN tipo INT, IN hab BOOLEAN,
                                 IN doc varchar(50), IN num INT)
BEGIN
UPDATE usuarios SET apellido=ape, clave=cla, email=mail, nombre=nom, 
					nombre_usuario=user, id_tipo_usuario=tipo, 
                    habilitado=hab, dni=doc
WHERE usuarios.id_usuario = num;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `java_tpfinal` CHARACTER SET utf8 COLLATE utf8_bin ;
/*!50003 DROP PROCEDURE IF EXISTS `VentaItemGetAll` */;
ALTER DATABASE `java_tpfinal` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `VentaItemGetAll`(IN idUsuario INT)
BEGIN
SELECT *
FROM venta_item
INNER JOIN ventas ON venta_item.id_venta = ventas.id_venta
WHERE ventas.id_usuario = idUsuario;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `java_tpfinal` CHARACTER SET utf8 COLLATE utf8_bin ;
/*!50003 DROP PROCEDURE IF EXISTS `VentaItemGetAllForUser` */;
ALTER DATABASE `java_tpfinal` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `VentaItemGetAllForUser`(IN idUsuario int)
BEGIN
select *
from venta_item vi
inner join ventas v on vi.id_venta = v.id_venta
inner join usuarios u on v.id_usuario = u.id_usuario
where u.id_usuario = idUsuario
group by vi.id_item;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `java_tpfinal` CHARACTER SET utf8 COLLATE utf8_bin ;
/*!50003 DROP PROCEDURE IF EXISTS `VentaItemGetAllForVenta` */;
ALTER DATABASE `java_tpfinal` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `VentaItemGetAllForVenta`(IN idVenta int)
BEGIN
select *
from venta_item
where id_venta = idVenta;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `java_tpfinal` CHARACTER SET utf8 COLLATE utf8_bin ;
/*!50003 DROP PROCEDURE IF EXISTS `VentaItemGetOne` */;
ALTER DATABASE `java_tpfinal` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `VentaItemGetOne`(IN idItem INT, IN idVenta INT)
BEGIN
SELECT *
FROM venta_item
WHERE id_venta = idVenta and id_item = idItem;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `java_tpfinal` CHARACTER SET utf8 COLLATE utf8_bin ;
/*!50003 DROP PROCEDURE IF EXISTS `VentaItemInsert` */;
ALTER DATABASE `java_tpfinal` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `VentaItemInsert`(IN cant INT, IN item INT, IN venta INT)
BEGIN
INSERT INTO venta_item(cantidad, id_item, id_venta) VALUES (cant, item, venta);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `java_tpfinal` CHARACTER SET utf8 COLLATE utf8_bin ;
/*!50003 DROP PROCEDURE IF EXISTS `VentasGetAllForUser` */;
ALTER DATABASE `java_tpfinal` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `VentasGetAllForUser`(IN idUser INT)
BEGIN
SELECT *
FROM ventas
WHERE id_usuario = idUser;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `java_tpfinal` CHARACTER SET utf8 COLLATE utf8_bin ;
/*!50003 DROP PROCEDURE IF EXISTS `VentasGetOne` */;
ALTER DATABASE `java_tpfinal` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `VentasGetOne`(IN id INT)
BEGIN
SELECT *
FROM ventas
WHERE id_venta = id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `java_tpfinal` CHARACTER SET utf8 COLLATE utf8_bin ;
/*!50003 DROP PROCEDURE IF EXISTS `VentasInsert` */;
ALTER DATABASE `java_tpfinal` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `VentasInsert`(IN user INT, IN nro_tarj VARCHAR(16), IN tit VARCHAR(150),
														   IN prov int, in ciudad VARCHAR(60), IN nom_calle VARCHAR(45),
                                                           IN nro VARCHAR(8), IN pi INT, in dep CHAR(1))
BEGIN
INSERT INTO ventas(id_usuario, nro_tarjeta, titular_tarjeta, habilitado, fecha, id_provincia, localidad, calle, numero, piso, dpto) 
	VALUES(user, nro_tarj, tit, true, CURDATE(), prov, ciudad, nom_calle, nro, pi, dep);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `java_tpfinal` CHARACTER SET utf8 COLLATE utf8_bin ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-29  0:56:38
