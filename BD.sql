CREATE DATABASE  IF NOT EXISTS `tp_soporte` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `tp_soporte`;
-- MySQL dump 10.13  Distrib 5.7.12, for Win32 (AMD64)
--
-- Host: localhost    Database: tp_soporte
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
-- Table structure for table `ciudades`
--

DROP TABLE IF EXISTS `ciudades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ciudades` (
  `id_ciudad` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_ciudad` varchar(45) NOT NULL,
  `id_provincia` int(11) NOT NULL,
  PRIMARY KEY (`id_ciudad`)
) ENGINE=InnoDB AUTO_INCREMENT=814 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciudades`
--

LOCK TABLES `ciudades` WRITE;
/*!40000 ALTER TABLE `ciudades` DISABLE KEYS */;
INSERT INTO `ciudades` VALUES (1,'Adolfo Gonzales',1),(2,'ChavesAguas',1),(3,'Verdes',1),(4,'Verdes',1),(5,'Arrecifes',1),(6,'Ayacucho',1),(7,'Azul',1),(8,'Bahia Blanca',1),(9,'Bahia San Blas',1),(10,'Balcarce',1),(11,'Balneario San Cayetano',1),(12,'Baradero',1),(13,'Benito Juarez',1),(14,'Berisso',1),(15,'Bolivar',1),(16,'Bragado',1),(17,'Brandsen',1),(18,'Campana',1),(19,'Cañuelas',1),(20,'Capilla del Señor',1),(21,'Capitan Sarmiento',1),(22,'Carhue',1),(23,'Carilo',1),(24,'Carlos Casares',1),(25,'Carlos Keen',1),(26,'Carlos Tejedor',1),(27,'Carmen de Areco',1),(28,'Carmen de Patagones',1),(29,'Castelli',1),(30,'Chacabuco',1),(31,'Chapadmalal',1),(32,'Chascomus',1),(33,'Chivilcoy',1),(34,'Claromeco',1),(35,'Colon',1),(36,'Coronel Dorrego',1),(37,'Coronel Pringles',1),(38,'Coronel Suarez',1),(39,'Coronel Vidal',1),(40,'Costa Azul',1),(41,'Costa Chica',1),(42,'Costa del Este',1),(43,'Costa Esmeralda',1),(44,'Daireaux',1),(45,'Dolores',1),(46,'Ensenada',1),(47,'Escobar',1),(48,'Exaltación de la Cruz',1),(49,'Ezeiza',1),(50,'Florentino Ameghino',1),(51,'General Belgrano',1),(52,'General Lamadrid',1),(53,'General Las Heras',1),(54,'General Lavalle',1),(55,'General Madariaga',1),(56,'General Pinto',1),(57,'General Rodriguez',1),(58,'General Villegas',1),(59,'Guaminí',1),(60,'Huanguelen',1),(61,'Junin',1),(62,'La Lucila del Mar',1),(63,'La Plata',1),(64,'Las Flores',1),(65,'Las Gaviotas',1),(66,'Las Toninas',1),(67,'Lincoln',1),(68,'Lobería',1),(69,'Lobos',1),(70,'Los Toldos',1),(71,'Lujan',1),(72,'Magdalena',1),(73,'Maipu',1),(74,'Mar Azul',1),(75,'Mar Chiquita',1),(76,'Mar de Ajo',1),(77,'Mar de Cobo',1),(78,'Mar de las Pampas',1),(79,'Mar del Plata',1),(80,'Mar del Sur',1),(81,'Mar del Tuyu',1),(82,'Marisol',1),(83,'Medanos',1),(84,'Mercedes',1),(85,'Miramar',1),(86,'Monte Hermoso',1),(87,'Navarro',1),(88,'Necochea',1),(89,'Nueva Atlantis',1),(90,'Nueve de Julio',1),(91,'Olavarria',1),(92,'Orense',1),(93,'Oriente',1),(94,'Ostende',1),(95,'Pedro Luro',1),(96,'Pehuajo',1),(97,'Pehuen Co',1),(98,'Pergamino',1),(99,'Pigüé',1),(100,'Pilar',1),(101,'Pinamar',1),(102,'Pinar del Sol',1),(103,'Pipinas',1),(104,'Puan',1),(105,'Punta Alta',1),(106,'Punta Indio',1),(107,'Punta Medanos',1),(108,'Quequen',1),(109,'Quilmes',1),(110,'Ramallo',1),(111,'Ranchos',1),(112,'Rauch',1),(113,'Reta',1),(114,'Rivadavia',1),(115,'Rojas',1),(116,'Roque Perez',1),(117,'Saavedra',1),(118,'Saladillo',1),(119,'Saldungaray',1),(120,'Salto',1),(121,'San Andres de Giles',1),(122,'San Antonio de Areco',1),(123,'San BernardoSan Cayetano',1),(124,'San Clemente del Tuyú',1),(125,'San Fernando',1),(126,'San Isidro',1),(127,'San Miguel del Monte',1),(128,'San Nicolas',1),(129,'San Pedro',1),(130,'Santa Clara del Mar',1),(131,'Santa Teresita',1),(132,'Sierra de la Ventana',1),(133,'Sierra de los Padres',1),(134,'Sierras Bayas',1),(135,'Suipacha',1),(136,'Tandil',1),(137,'Tapalque',1),(138,'Tigre',1),(139,'Tomas Jofre',1),(140,'Tornquist',1),(141,'Treinta de Agosto',1),(142,'Trenque Lauquen',1),(143,'Tres Arroyos',1),(144,'Valeria del Mar',1),(145,'Vedia',1),(146,'Veinticinco de Mayo',1),(147,'Verónica',1),(148,'Vicente Casares',1),(149,'Villa Gesell',1),(150,'Villa La Arcadia',1),(151,'Villa Serrana La Gruta',1),(152,'Villa Ventana',1),(153,'Villalonga',1),(154,'Zarate',1),(155,'Aconquija',2),(156,'Alijilan',2),(157,'Ancasti',2),(158,'Andalgala',2),(159,'Antofagasta',2),(160,'Belen',2),(161,'El Alto',2),(162,'El Rodeo',2),(163,'Fiambala',2),(164,'Icaño',2),(165,'La Paz',2),(166,'La Puerta',2),(167,'Las Juntas',2),(168,'Paclin',2),(169,'Poman',2),(170,'Recreo',2),(171,'San Fernando del Valle',2),(172,'San Isidro',2),(173,'Santa Maria',2),(174,'Saujil',2),(175,'Sumampa',2),(176,'Tinogasta',2),(177,'Villa Las Pirquitas',2),(178,'Avia Terai',3),(179,'Charata',3),(180,'El Sauzalito',3),(181,'Fuerte Esperanza',3),(182,'Gancedo',3),(183,'General Pinedo',3),(184,'General San Martin',3),(185,'General Vedia',3),(186,'Hermoso Campo',3),(187,'Isla del Cerrito',3),(188,'Juan Jose Castelli',3),(189,'Las Breñas',3),(190,'Machagai',3),(191,'Mision Nueva Pompeya',3),(192,'Pampa del Indio',3),(193,'Puerto Tirol',3),(194,'Resistencia',3),(195,'Roque Saenz Peña',3),(196,'Villa Angela',3),(197,'Villa Rio Bermejito',3),(198,'Alto Río Senguer',3),(199,'Bahía Bustamante',4),(200,'Camarones',4),(201,'Cholila',4),(202,'Comodoro Rivadavia',4),(203,'Corcovado',4),(204,'El Hoyo',4),(205,'El Maiten',4),(206,'Epuyen',4),(207,'Esquel',4),(208,'Gaiman',4),(209,'Gobernador Costa',4),(210,'Jose de San Martin',4),(211,'Lago Puelo',4),(212,'Playa Unión',4),(213,'Puerto Madryn',4),(214,'Puerto Piramides',4),(215,'Rawson',4),(216,'Rada Tilly',4),(217,'Rio Mayo',4),(218,'Rio Pico',4),(219,'Sarmiento',4),(220,'Trelew',4),(221,'Trevelin',4),(222,'Villa Ameghino',4),(223,'Villa Futalaufquen',4),(224,'CABA',5),(225,'Achiras',6),(226,'Aguas de Oro',6),(227,'Alcira Gigena',6),(228,'Almafuerte',6),(229,'Alpa Corral',6),(230,'Alta Gracia',6),(231,'AmboyAnisacate',6),(232,'Arroyito',6),(233,'Arroyo de los Patos',6),(234,'Ascochinga',6),(235,'Athos Pampa',6),(236,'Balnearia',6),(237,'Bell Ville',6),(238,'Bialet Masse',6),(239,'Cabalango',6),(240,'Calmayo',6),(241,'Capilla del Monte',6),(242,'Casa Grande',6),(243,'Cerro Colorado',6),(244,'Charbonier',6),(245,'Colonia Caroya',6),(246,'Copacabana',6),(247,'Córdoba',6),(248,'Cosquin',6),(249,'Cruz Alta',6),(250,'Cruz Chica',6),(251,'Cruz del Eje',6),(252,'Cruz Grande',6),(253,'Cuesta Blanca',6),(254,'Dean Funes',6),(255,'Del Campillo',6),(256,'Despeñaderos',6),(257,'El Durazno',6),(258,'El Manzano',6),(259,'Embalse',6),(260,'General Deheza',6),(261,'General Levalle',6),(262,'Hernando',6),(263,'Huerta Grande',6),(264,'Huinca Renanco',6),(265,'Icho Cruz',6),(266,'Intiyaco',6),(267,'Ischilin',6),(268,'James Craik',6),(269,'Jesus Maria',6),(270,'La Bolsa',6),(271,'Laboulaye',6),(272,'La Calera',6),(273,'La Carlota',6),(274,'La Cesira',6),(275,'La Cruz',6),(276,'La Cumbre',6),(277,'La Cumbrecita',6),(278,'La Falda',6),(279,'La Granja',6),(280,'La Paisanita',6),(281,'La Paz',6),(282,'La Poblacion',6),(283,'Las Albacas',6),(284,'Las Caleras',6),(285,'Las Calles',6),(286,'La Serranita',6),(287,'Las Rabonas',6),(288,'Las Tapias',6),(289,'Loma Bola',6),(290,'Los Cocos',6),(291,'Los Condores',6),(292,'Los Hornillos',6),(293,'Los Molinos',6),(294,'Los Pozos',6),(295,'Los Reartes',6),(296,'Loza Corral',6),(297,'Marcos Juarez',6),(298,'Mayu Sumaj',6),(299,'Mendiolaza',6),(300,'Mina Clavero',6),(301,'Miramar',6),(302,'Molinari',6),(303,'Monte Maiz',6),(304,'Morteros',6),(305,'Nono',6),(306,'Oncativo',6),(307,'Ongamira',6),(308,'Panaholma',6),(309,'Potrero de Garay',6),(310,'Quilino',6),(311,'Rio Ceballos',6),(312,'Rio CuartoRio de los Sauces',6),(313,'Rio Tercero',6),(314,'Saldan',6),(315,'Salsacate',6),(316,'Salsipuedes',6),(317,'San A. de Arredondo',6),(318,'San Carlos Minas',6),(319,'San Clemente',6),(320,'San Esteban',6),(321,'San Francisco',6),(322,'San Javier Traslasierra',6),(323,'San Jose de la Dormida',6),(324,'San Marcos Sierras',6),(325,'San Roque',6),(326,'Santa Cruz del Lago',6),(327,'Santa Maria de Punilla',6),(328,'Santa Monica',6),(329,'Santa Rosa Calamuchita',6),(330,'Sinsacate',6),(331,'Tala Huasi',6),(332,'Tancacha',6),(333,'Tanti',6),(334,'Unquillo',6),(335,'Valle Hermoso',6),(336,'Villa Alpina',6),(337,'Villa Allende',6),(338,'Villa Animi',6),(339,'Villa Ascasubi',6),(340,'Villa Berna',6),(341,'Villa Carlos Paz',6),(342,'Villa Ciudad America',6),(343,'V. C. Pque. Los Reartes',6),(344,'Villa Cura Brochero',6),(345,'Villa de las Rosas',6),(346,'Villa del DiqueVilla de Soto',6),(347,'Villa del Totoral',6),(348,'Villa de Maria',6),(349,'Villa Dolores',6),(350,'Villa General Belgrano',6),(351,'Villa Giardino',6),(352,'Villa Los Aromos',6),(353,'Villa Maria',6),(354,'Villa Parque Siquiman',6),(355,'Villa Rumipal',6),(356,'Villa Tulumba',6),(357,'Yacanto Calamuchita',6),(358,'Yacanto Traslasierra',6),(359,'Bella Vista',7),(360,'Caa Catí',7),(361,'Colonia Pellegrini',7),(362,'Corrientes',7),(363,'Curuzu Cuatia',7),(364,'Empedrado',7),(365,'Esquina',7),(366,'Goya',7),(367,'Ita Ibate',7),(368,'Itati',7),(369,'Ituzaingo',7),(370,'La Cruz',7),(371,'Mburucuya',7),(372,'Mercedes',7),(373,'Monte Caseros',7),(374,'Paso de la Patria',7),(375,'Paso de los Libres',7),(376,'San Antonio de Apipe',7),(377,'Santa Ana',7),(378,'Santo Tome',7),(379,'Sauce',7),(380,'Virasoro',7),(381,'Yapeyu',7),(382,'Basavilbaso',8),(383,'Brazo Largo',8),(384,'ChajariColon',8),(385,'Concepción del Uruguay',8),(386,'Concordia',8),(387,'Crespo',8),(388,'Diamante',8),(389,'Federacion',8),(390,'Federal',8),(391,'General Ramirez',8),(392,'Gualeguay',8),(393,'Gualeguaychu',8),(394,'Hasenkamp',8),(395,'Hernandarias',8),(396,'Ibicuy',8),(397,'La Paz',8),(398,'Larroque',8),(399,'Maria Grande',8),(400,'Nogoyá',8),(401,'Paraná',8),(402,'Piedras Blancas',8),(403,'Pueblo Liebig',8),(404,'Puerto Yerua',8),(405,'Puiggari',8),(406,'Rosario del Tala',8),(407,'San Jose de Feliciano',8),(408,'San Salvador',8),(409,'Santa Elena',8),(410,'Urdinarrain',8),(411,'Valle Maria',8),(412,'Viale',8),(413,'Victoria',8),(414,'Villa Elisa',8),(415,'Villaguay',8),(416,'Villa Paranacito',8),(417,'Villa San Jose',8),(418,'Villa Urquiza',8),(419,'Clorinda',9),(420,'El Colorado',9),(421,'Formosa',9),(422,'General Manuel Belgrano',9),(423,'Herradura',9),(424,'Ibarreta',9),(425,'Ingeniero Juárez',9),(426,'Laguna Blanca',9),(427,'Las Lomitas',9),(428,'Mayor Villafañe',9),(429,'Palo Santo',9),(430,'Pirane',9),(431,'San Francisco de Laishi',9),(432,'Abra Pampa',10),(433,'Aguas Calientes',10),(434,'Caimancito',10),(435,'Casabindo',10),(436,'El Carmen',10),(437,'Hornillos',10),(438,'Huacalera',10),(439,'Huichaira',10),(440,'Humahuaca',10),(441,'La Quiaca',10),(442,'Libertador San Martin',10),(443,'Lozano',10),(444,'Maimara',10),(445,'Palpalá',10),(446,'Perico',10),(447,'Purmamarca',10),(448,'San Francisco',10),(449,'San Pedro de Jujuy',10),(450,'San Salvador de Jujuy',10),(451,'Santa Catalina',10),(452,'Susques',10),(453,'Tilcara',10),(454,'Tumbaya',10),(455,'Uquia',10),(456,'Valle Grande',10),(457,'Villa Jardín de Reyes',10),(458,'Villamonte',10),(459,'Volcan',10),(460,'Yala',10),(461,'Yavi',10),(462,'Ataliva Roca',11),(463,'Bernardo Larroude',11),(464,'Casa de Piedra',11),(465,'Carro Quemado',11),(466,'Chacharramendi',11),(467,'Colonia 25 de Mayo',11),(468,'Colonia Baron',11),(469,'Eduardo Castex',11),(470,'General Acha',11),(471,'General Pico',11),(472,'General San Martin',11),(473,'Guatrache',11),(474,'Intendente Alvear',11),(475,'Jacinto Arauz',11),(476,'Macachin',11),(477,'Rancul',11),(478,'Realico',11),(479,'Santa Isabel',11),(480,'Santa Rosa',11),(481,'Toay',11),(482,'Victorica',11),(483,'Winifreda',11),(484,'Aminga',12),(485,'Anillaco',12),(486,'Chamical',12),(487,'Chepes',12),(488,'Chilecito',12),(489,'Famatina',12),(490,'Guandacol',12),(491,'La Rioja',12),(492,'Olta',12),(493,'Pagancillo',12),(494,'Patquia',12),(495,'Sanagasta',12),(496,'San Blas de Los Sauces',12),(497,'Santa Teresita',12),(498,'Tama',12),(499,'Ulapes',12),(500,'Villa Castelli',12),(501,'Villa Union',12),(502,'Vinchina',12),(503,'Cañon del Atuel',13),(504,'Chacras de Coria',13),(505,'Colonia Suiza',13),(506,'El Nihuil',13),(507,'El Sosneado',13),(508,'General Alvear',13),(509,'Godoy Cruz',13),(510,'Guaymallen',13),(511,'Junin',13),(512,'Las Carditas',13),(513,'Las Cuevas',13),(514,'Las Heras',13),(515,'Las Vegas',13),(516,'Los Molles',13),(517,'Los Reyunos',13),(518,'Lujan de Cuyo',13),(519,'Maipu',13),(520,'Malargue',13),(521,'Manzano Historico',13),(522,'Mendoza Capital',13),(523,'Potrerillos',13),(524,'Rivadavia',13),(525,'San Carlos',13),(526,'San Martin',13),(527,'San Rafael',13),(528,'Tunuyan',13),(529,'Tupungato',13),(530,'Uspallata',13),(531,'Valle de Uco',13),(532,'Valle Grande',13),(533,'2 de Mayo',14),(534,'25 de Mayo',14),(535,'Alba Posse',14),(536,'Andresito',14),(537,'Apostoles',14),(538,'Aristobulo del Valle',14),(539,'Bernardo de Irigoyen',14),(540,'Campo Grande',14),(541,'Campo Viera',14),(542,'Candelaria',14),(543,'Capiovi',14),(544,'Caraguatay',14),(545,'Colonia Victoria',14),(546,'Concepción de la Sierra',14),(547,'CorpusEl Alcazar',14),(548,'El Dorado',14),(549,'El Soberbio',14),(550,'Garupa',14),(551,'Gobernador Roca',14),(552,'Jardin America',14),(553,'Leandro Alem',14),(554,'Loreto',14),(555,'Montecarlo',14),(556,'Oberá',14),(557,'Panambi',14),(558,'Posadas',14),(559,'Puerto Esperanza',14),(560,'Puerto Iguazú',14),(561,'Puerto Libertad',14),(562,'Puerto Mineral',14),(563,'Puerto Piray',14),(564,'Puerto Rico',14),(565,'Salto Encantado',14),(566,'San Antonio',14),(567,'San Ignacio',14),(568,'San Javier',14),(569,'San Pedro',14),(570,'Santa Ana',14),(571,'Santa María',14),(572,'Santa Rita',14),(573,'San Vicente',14),(574,'Tobuna',14),(575,'Wanda',14),(576,'Alumine',15),(577,'Andacollo',15),(578,'Arroyito',15),(579,'Caviahue',15),(580,'Centenario',15),(581,'Chos Malal',15),(582,'Copahue',15),(583,'Cutral Co',15),(584,'El Cholar',15),(585,'El Huecu',15),(586,'Huinganco',15),(587,'Junin de los Andes',15),(588,'Las Lajas',15),(589,'Las Ovejas',15),(590,'Loncopue',15),(591,'Manzano Amargo',15),(592,'Moquehue',15),(593,'Neuquen',15),(594,'Picun Leufu',15),(595,'Piedra del Aguila',15),(596,'Plaza Huincul',15),(597,'Plottier',15),(598,'Primeros Pinos',15),(599,'Pulmari',15),(600,'Rincón de los Sauces',15),(601,'San Martín de los Andes',15),(602,'Tricao Malal',15),(603,'Varvarco',15),(604,'Villa El Chocon',15),(605,'Villa La Angostura',15),(606,'Villa Lago Meliquina',15),(607,'Villa Pehuenia',15),(608,'Villa Traful',15),(609,'Zapala',15),(610,'Allen',16),(611,'Bariloche',16),(612,'Catriel',16),(613,'Choele Choel',16),(614,'Cinco Saltos',16),(615,'Cipolletti',16),(616,'Dina Huapi',16),(617,'El Bolson',16),(618,'El Manso',16),(619,'General Conesa',16),(620,'General Roca',16),(621,'Ingeniero Jacobacci',16),(622,'Las Grutas',16),(623,'Los Menucos',16),(624,'Ministro Ramos Mexia',16),(625,'Playas Doradas',16),(626,'Rio Colorado',16),(627,'San Antonio Este',16),(628,'San Antonio Oeste',16),(629,'Sierra Colorada',16),(630,'Sierra Grande',16),(631,'Valcheta',16),(632,'Viedma',16),(633,'Villa El Condor',16),(634,'Villa Lago Gutiérrez',16),(635,'Villa Lago Mascardi',16),(636,'Villa Regina',16),(637,'Angastaco',17),(638,'Cabra Corral',17),(639,'Cachi',17),(640,'Cafayate',17),(641,'Campo Quijano',17),(642,'Cerrillos',17),(643,'Chicoana',17),(644,'Coronel Moldes',17),(645,'Embarcacion',17),(646,'General Güemes',17),(647,'General Mosconi',17),(648,'Iruya',17),(649,'Joaquin V. Gonzalez',17),(650,'La Caldera',17),(651,'La Poma',17),(652,'Molinos',17),(653,'Orán',17),(654,'Rosario de la Frontera',17),(655,'Salta',17),(656,'San Agustín de los Cobres',17),(657,'San Carlos',17),(658,'San Jose de Metan',17),(659,'Santa Rosa',17),(660,'Seclantas',17),(661,'Tartagal',17),(662,'Tolar Grande',17),(663,'Vaqueros',17),(664,'Villa San Lorenzo',17),(665,'Barreal',18),(666,'Bella Vista',18),(667,'Calingasta',18),(668,'Caucete',18),(669,'Iglesia',18),(670,'Jachal',18),(671,'Las Flores',18),(672,'Pismanta',18),(673,'Rawson',18),(674,'Rivadavia',18),(675,'Rodeo',18),(676,'San Juan',18),(677,'Santa Lucia',18),(678,'Tudcum',18),(679,'Ullum',18),(680,'Valle Fertil',18),(681,'Vallecito',18),(682,'Zonda',18),(683,'Balde',19),(684,'Carpinteria',19),(685,'ConcaranCortaderas',19),(686,'El Morro',19),(687,'El Trapiche',19),(688,'El Volcan',19),(689,'Juana Koslay',19),(690,'La Carolina',19),(691,'La Florida',19),(692,'La PuntaLa Toma',19),(693,'Los Molles',19),(694,'Lujan',19),(695,'Merlo',19),(696,'Nogoli',19),(697,'Nueva Galia',19),(698,'Papagayos',19),(699,'Potrero de los Funes',19),(700,'Quines',19),(701,'Renca',19),(702,'San Francisco del Monte',19),(703,'San Geronimo',19),(704,'San Luis',19),(705,'Santa Rosa del Conlara',19),(706,'Sierra de las Quijadas',19),(707,'Tilisarao',19),(708,'Villa de la Quebrada',19),(709,'Villa Elena',19),(710,'Villa LarcaVilla Mercedes',19),(711,'28 de Noviembre',20),(712,'Caleta Olivia',20),(713,'Cte. Piedra Buena',20),(714,'El Calafate',20),(715,'El Chalten',20),(716,'Fitz Roy',20),(717,'Gobernador Gregores',20),(718,'Hipolito Yrigoyen',20),(719,'Jaramillo',20),(720,'Las Heras',20),(721,'Los Antiguos',20),(722,'Perito Moreno',20),(723,'Pico Truncado',20),(724,'Puerto Deseado',20),(725,'Puerto San Julian',20),(726,'Puerto Santa Cruz',20),(727,'Rio Gallegos',20),(728,'Rio Turbio',20),(729,'Alejandra',21),(730,'Armstrong',21),(731,'Arocena',21),(732,'Arroyo Seco',21),(733,'Arroyo Leyes',21),(734,'Avellaneda',21),(735,'Barrancas',21),(736,'Carcaraña',21),(737,'Casilda',21),(738,'Cayastá',21),(739,'Cañada de Gomez',21),(740,'Ceres',21),(741,'Chabas',21),(742,'Coronda',21),(743,'Desvio Arijon',21),(744,'Elortondo',21),(745,'Esperanza',21),(746,'Firmat',21),(747,'Florencia',21),(748,'Franck',21),(749,'Funes',21),(750,'Granadero Baigorria',21),(751,'Helvecia',21),(752,'Melincué',21),(753,'Monje',21),(754,'Oliveros',21),(755,'Puerto Gaboto',21),(756,'Rafaela',21),(757,'Reconquista',21),(758,'Romang',21),(759,'Rosario',21),(760,'Rufino',21),(761,'San Carlos',21),(762,'San Cristobal',21),(763,'San Javier',21),(764,'San Jorge',21),(765,'San Jose del Rincon',21),(766,'San Justo',21),(767,'San Lorenzo',21),(768,'Santa Fe de la Vera Cruz',21),(769,'Santa Rosa de Calchines',21),(770,'Santo Tomé',21),(771,'Sastre',21),(772,'Sauce Viejo',21),(773,'Sunchales',21),(774,'Timbues',21),(775,'Tostado',21),(776,'Venado Tuerto',21),(777,'Villa Cañas',21),(778,'Villa Constitucion',21),(779,'Villa Ocampo',21),(780,'Añatuya',22),(781,'Bandera',22),(782,'Frias',22),(783,'La BandaPinto',22),(784,'Santiago del Estero',22),(785,'Termas de Rio Hondo',22),(786,'Villa La Punta',22),(787,'Villa Ojo de Agua',22),(788,'Rio Grande',23),(789,'Tolhuin',23),(790,'Ushuaia',23),(791,'Alberdi',24),(792,'Amaicha del Valle',24),(793,'Ampimpa',24),(794,'Burruyacu',24),(795,'Colalao del Valle',24),(796,'Concepcion',24),(797,'El Cadillal',24),(798,'El Mollar',24),(799,'El Siambon',24),(800,'Famailla',24),(801,'Raco',24),(802,'Ruinas de Quilmes',24),(803,'San Javier Tucuman',24),(804,'San Miguel de Tucuman',24),(805,'San Pedro de Colalao',24),(806,'Simoca',24),(807,'Taco Ralo',24),(808,'Tafi del Valle',24),(809,'Tafi Viejo',24),(810,'Villa Nougues',24),(811,'Yerba Buena',24),(812,'Alberti',1),(813,'Arenas',1);
/*!40000 ALTER TABLE `ciudades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perfiles`
--

DROP TABLE IF EXISTS `perfiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perfiles` (
  `id_perfil` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_perfil` varchar(45) NOT NULL,
  PRIMARY KEY (`id_perfil`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfiles`
--

LOCK TABLES `perfiles` WRITE;
/*!40000 ALTER TABLE `perfiles` DISABLE KEYS */;
INSERT INTO `perfiles` VALUES (1,'Administrador'),(2,'Usuario');
/*!40000 ALTER TABLE `perfiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provincias`
--

DROP TABLE IF EXISTS `provincias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `provincias` (
  `id_provincia` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_provincia` varchar(45) NOT NULL,
  PRIMARY KEY (`id_provincia`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provincias`
--

LOCK TABLES `provincias` WRITE;
/*!40000 ALTER TABLE `provincias` DISABLE KEYS */;
INSERT INTO `provincias` VALUES (1,'Buenos Aires'),(2,'Catamarca'),(3,'Chaco'),(4,'Chubut'),(5,'Ciudad Autónoma de Buenos Aires'),(6,'Córdoba'),(7,'Corrientes'),(8,'Entre Ríos'),(9,'Formosa'),(10,'Jujuy'),(11,'La Pampa'),(12,'La Rioja'),(13,'Mendoza'),(14,'Misiones'),(15,'Neuquén'),(16,'Río Negro'),(17,'Salta'),(18,'San Juan'),(19,'San Luis'),(20,'Santa Cruz'),(21,'Santa Fe'),(22,'Santiago del Estero'),(23,'Tierra del Fuego'),(24,'Tucumán');
/*!40000 ALTER TABLE `provincias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `fecha_naciemiento` date NOT NULL,
  `dni` int(11) NOT NULL,
  `id_perfil` int(11) NOT NULL,
  `nombre_usuario` varchar(45) NOT NULL,
  `contrasenia` varchar(45) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`id_usuario`),
  KEY `usuario_perfil_idx` (`id_perfil`),
  CONSTRAINT `usuario_perfil` FOREIGN KEY (`id_perfil`) REFERENCES `perfiles` (`id_perfil`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Ale','Suárez','1991-08-19',36005591,1,'ale087','fer12345','alepersa087@gmail.com'),(2,'José María','Suárez','2018-10-01',12123123,2,'josema10','fer12345','alferpa3@uolsinectis.com.ar'),(4,'Juan Román','Riquelme','2018-10-02',12123123,2,'roman','fer12345','alepersa087@gmail.com'),(5,'Marcelo','Palacios','1998-10-03',36005591,2,'mpalacions','fer12345','alepersa087@gmail.com'),(6,'Jorge','Sampalobby','1991-08-03',15147258,2,'sampa','fer12345','alepersa087@gmail.com');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'tp_soporte'
--
/*!50003 DROP PROCEDURE IF EXISTS `GetOneCiudad` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetOneCiudad`(IN id INT)
BEGIN
SELECT *
FROM ciudades
WHERE id_ciudad = id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-10-09 20:47:04
