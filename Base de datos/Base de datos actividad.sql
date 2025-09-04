-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: actividad
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

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
-- Table structure for table `aviso`
--

DROP TABLE IF EXISTS `aviso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aviso` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(150) NOT NULL,
  `contenido` text NOT NULL,
  `estado` enum('ACTIVO','ATENDIDO') DEFAULT 'ACTIVO',
  `categoria_id` bigint(20) DEFAULT NULL,
  `usuario_id` bigint(20) DEFAULT NULL,
  `comunidad_id` bigint(20) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `categoria_id` (`categoria_id`),
  KEY `usuario_id` (`usuario_id`),
  KEY `comunidad_id` (`comunidad_id`),
  CONSTRAINT `aviso_ibfk_1` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`id`),
  CONSTRAINT `aviso_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`),
  CONSTRAINT `aviso_ibfk_3` FOREIGN KEY (`comunidad_id`) REFERENCES `comunidad` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aviso`
--

LOCK TABLES `aviso` WRITE;
/*!40000 ALTER TABLE `aviso` DISABLE KEYS */;
INSERT INTO `aviso` VALUES (1,'Necesito taladro','¿Alguien me puede prestar un taladro para hoy?','ATENDIDO',1,1,1,'2025-09-04 13:25:48'),(2,'Reunión del consorcio','Se realizará el martes a las 20hs en el SUM.','ACTIVO',4,2,1,'2025-09-04 13:25:48'),(3,'Ruido en la noche','Reporto ruidos molestos anoche en el pasillo.','ACTIVO',2,3,2,'2025-09-04 13:25:48'),(4,'Necesito pulidora','¿Alguien tiene una pulidora para el fin de semana?','ATENDIDO',1,2,2,'2025-09-04 14:20:27'),(7,'Necesito pulidora','¿Alguien tiene una pulidora para el fin de semana?','ATENDIDO',1,2,2,'2025-09-04 15:13:00'),(70,'Se perdió un perro','Perro mediano color marrón visto por última vez en la plaza.','ACTIVO',1,1,1,'2025-09-04 17:00:53'),(71,'Ofrezco herramientas','Presto taladro y escalera a quien lo necesite.','ACTIVO',1,80,4,'2025-09-04 17:01:18'),(72,'Propuesta de limpieza','Jornada de limpieza comunitaria el sábado.','ACTIVO',4,79,1,'2025-09-04 17:01:33'),(90,'Clases de yoga','Se dictan clases gratuitas en el salón.','ACTIVO',4,78,2,'2025-09-04 17:02:04'),(91,'Problemas de agua','Sin suministro de agua caliente en torre 1.','ACTIVO',2,77,6,'2025-09-04 17:02:21'),(92,'Pérdida de llaves','Llavero azul con 3 llaves. Perdido en el parque.','ACTIVO',1,75,1,'2025-09-04 17:02:39'),(93,'Invitación reunión','Se discutirá sobre mantenimiento del ascensor.','ACTIVO',4,75,2,'2025-09-04 17:02:53'),(94,'Vecino ruidoso','Música muy alta por las noches. Zona torre B.','ACTIVO',2,73,2,'2025-09-04 17:03:25'),(95,'Feria comunitaria','Domingo 10:00 am en el jardín central.','ACTIVO',4,71,7,'2025-09-04 17:03:43'),(96,'Mascota perdida','Buscamos a \"Luna\", perra pequeña extraviada.','ACTIVO',1,72,1,'2025-09-04 17:03:43'),(100,'Gato encontrado','Gato gris con collar rojo apareció en el patio común.','ACTIVO',1,69,1,'2025-09-04 17:04:11'),(101,'Donación de libros','Libros escolares en buen estado para donar.','ACTIVO',3,70,2,'2025-09-04 17:04:11'),(104,'Ayuda para mudanza','Se necesita ayuda para subir muebles al 3er piso.','ACTIVO',1,67,13,'2025-09-04 17:05:06');
/*!40000 ALTER TABLE `aviso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Ayuda','Pedir o brindar ayuda entre vecinos'),(2,'Alerta','Reportes de ruidos o situaciones anómalas'),(3,'Compra','Coordinación de compras comunitarias'),(4,'Reunión','Aviso de reuniones de consorcio');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comentario`
--

DROP TABLE IF EXISTS `comentario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comentario` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `contenido` text NOT NULL,
  `usuario_id` bigint(20) DEFAULT NULL,
  `aviso_id` bigint(20) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `comunidad_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  KEY `aviso_id` (`aviso_id`),
  KEY `comunidad_id` (`comunidad_id`),
  CONSTRAINT `comentario_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`),
  CONSTRAINT `comentario_ibfk_2` FOREIGN KEY (`aviso_id`) REFERENCES `aviso` (`id`),
  CONSTRAINT `comentario_ibfk_3` FOREIGN KEY (`comunidad_id`) REFERENCES `comunidad` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=213 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentario`
--

LOCK TABLES `comentario` WRITE;
/*!40000 ALTER TABLE `comentario` DISABLE KEYS */;
INSERT INTO `comentario` VALUES (1,'Yo tengo uno, te lo presto.',2,1,'2025-09-04 13:25:48',NULL),(2,'Gracias por avisar, estaré presente.',1,2,'2025-09-04 13:25:48',NULL),(66,'Estoy buscando a mi perro también, cualquier novedad avísenme.',1,1,'2025-09-04 17:09:58',1),(184,'Confirmo asistencia a la reunión.',2,2,'2025-09-04 17:18:22',2),(185,'Me gustaría unirme a la compra de frutas.',3,3,'2025-09-04 17:18:22',1),(186,'El ruido sigue después de las 22:00, alguien más lo escucha?',64,4,'2025-09-04 17:18:22',4),(187,'Puedo regar plantas la próxima semana.',65,4,'2025-09-04 17:18:22',5),(188,'¿Ya llamaron al consorcio por el portón?',66,7,'2025-09-04 17:18:22',2),(189,'Quiero comprar empanadas, ¿a qué hora están?',67,7,'2025-09-04 17:18:22',1),(190,'Necesito ayuda para mover el sofá.',69,4,'2025-09-04 17:18:22',4),(191,'Vi al gato ayer en el parque.',69,70,'2025-09-04 17:18:22',1),(192,'Tengo libros para donar, ¿dónde los dejo?',70,7,'2025-09-04 17:18:22',2),(193,'¿A qué hora empieza la feria?',71,70,'2025-09-04 17:18:22',6),(194,'Voy a buscar a Luna esta tarde.',72,70,'2025-09-04 17:18:22',1),(195,'La música sigue siendo alta, por favor bajen el volumen.',73,71,'2025-09-04 17:18:22',2),(196,'¿Cuánto cuestan las suculentas?',74,94,'2025-09-04 17:18:22',8),(197,'¿Dónde será la reunión exactamente?',75,95,'2025-09-04 17:18:22',2),(198,'Encontré unas llaves ayer, ¿alguien las perdió?',76,96,'2025-09-04 17:18:22',1),(199,'¿Se sabe cuándo arreglarán el agua caliente?',77,100,'2025-09-04 17:18:22',12),(200,'Me interesa las clases de yoga.',78,101,'2025-09-04 17:18:22',12),(201,'Voy a participar en la limpieza del sábado.',79,104,'2025-09-04 17:18:22',1),(202,'Gracias por prestar las herramientas.',80,95,'2025-09-04 17:18:22',13),(203,'¿Alguien sabe si se ha visto a Luna?',1,94,'2025-09-04 17:18:22',1),(204,'¿Cuántos vecinos asistirán a la reunión?',2,96,'2025-09-04 17:18:22',2),(205,'¿Pueden traer más frutas para la compra?',3,3,'2025-09-04 17:18:22',1),(206,'El ruido ahora es menos, gracias por reportar.',64,4,'2025-09-04 17:18:22',13),(207,'Puedo ayudar con las plantas el fin de semana.',65,7,'2025-09-04 17:18:22',2),(208,'¿Se necesita más ayuda para el portón?',66,2,'2025-09-04 17:18:22',2),(209,'¿Cuándo será la próxima venta de empanadas?',67,7,'2025-09-04 17:18:22',1),(210,'¿Quién puede ayudar con la mudanza?',69,3,'2025-09-04 17:18:22',13),(211,'El gato estuvo cerca del parque comunitario.',69,71,'2025-09-04 17:18:22',1),(212,'¿Dónde se realizará la donación de libros?',70,1,'2025-09-04 17:18:22',2);
/*!40000 ALTER TABLE `comentario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comunidad`
--

DROP TABLE IF EXISTS `comunidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comunidad` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `direccion` varchar(150) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comunidad`
--

LOCK TABLES `comunidad` WRITE;
/*!40000 ALTER TABLE `comunidad` DISABLE KEYS */;
INSERT INTO `comunidad` VALUES (1,'Barrio Las Rosas','Calle Falsa 123','2025-09-04 13:25:48'),(2,'Edificio Central','Av. Siempre Viva 742','2025-09-04 13:25:48'),(4,'Comunidad Las Palmeras','Av. Siempre Viva 742','2025-09-04 16:51:19'),(5,'Residencial El Bosque','Calle 10 Nº 1050','2025-09-04 16:51:19'),(6,'Barrio Nuevo Horizonte','Ruta 5 KM 10','2025-09-04 16:51:19'),(7,'Villa Los Álamos','Callejón del Norte 333','2025-09-04 16:51:19'),(8,'Conjunto Cerrado Santa Elena','Diagonal 100 Nº 250','2025-09-04 16:51:19'),(9,'Torre Central Sur','Edificio Sur A - Piso 3','2025-09-04 16:51:19'),(10,'Barrio Parque Verde','Calle 9 Nº 789','2025-09-04 16:51:19'),(11,'Complejo Don Bosco','Av. del Trabajo 1234','2025-09-04 16:51:19'),(12,'Conjunto Las Rosas','Pasaje Las Flores 45','2025-09-04 16:51:19'),(13,'Residencial La Esperanza','Av. Libertad 890','2025-09-04 16:51:19');
/*!40000 ALTER TABLE `comunidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historial_eventos`
--

DROP TABLE IF EXISTS `historial_eventos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historial_eventos` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `usuario_id` bigint(20) DEFAULT NULL,
  `comunidad_id` bigint(20) DEFAULT NULL,
  `tipo_evento` varchar(50) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historial_eventos`
--

LOCK TABLES `historial_eventos` WRITE;
/*!40000 ALTER TABLE `historial_eventos` DISABLE KEYS */;
INSERT INTO `historial_eventos` VALUES (1,2,2,'AVISO_CREADO','Se creó un aviso con título \'Necesito pulidora\'','2025-09-04 15:13:00'),(2,2,NULL,'COMENTARIO_CREADO','Comentario agregado al aviso 1: \'Yo no tengo Sorry!!!, te lo presto....\'','2025-09-04 15:27:56'),(3,NULL,NULL,'COMENTARIO_EDITADO','Comentario con ID 3 fue editado','2025-09-04 15:29:46'),(4,NULL,NULL,'COMENTARIO_EDITADO','Comentario con ID 3 fue editado','2025-09-04 15:30:16'),(5,NULL,NULL,'COMENTARIO_EDITADO','Comentario con ID 3 fue editado','2025-09-04 15:30:51'),(6,NULL,NULL,'COMENTARIO_EDITADO','Comentario con ID 3 fue editado','2025-09-04 15:31:45'),(7,NULL,NULL,'COMENTARIO_EDITADO','Comentario con ID 3 fue editado','2025-09-04 15:32:50'),(8,NULL,NULL,'COMENTARIO_EDITADO','Comentario con ID 3 fue editado','2025-09-04 15:34:48'),(9,NULL,NULL,'COMENTARIO_ELIMINADO','Comentario con ID 3 fue eliminado','2025-09-04 15:35:23'),(10,2,2,'COMENTARIO_CREADO','Comentario agregado al aviso 1: \'Yo tengo uno, te lo presto....\'','2025-09-04 15:55:21'),(11,2,2,'COMENTARIO_EDITADO','Comentario con ID 4 fue editado','2025-09-04 15:57:08'),(12,2,2,'COMENTARIO_EDITADO','Comentario con ID 4 fue editado','2025-09-04 15:58:37'),(13,2,2,'COMENTARIO_ELIMINADO','Comentario con ID 4 fue eliminado','2025-09-04 15:59:16'),(14,2,1,'AVISO_CREADO','Se creó un aviso con título \'Ruido en el tercer piso\'','2025-09-04 16:05:18'),(15,NULL,NULL,'AVISO_ATENDIDO','El aviso con ID 8 fue marcado como atendido','2025-09-04 16:06:36'),(16,NULL,NULL,'AVISO_ELIMINADO','El aviso con ID 8 fue eliminado','2025-09-04 16:06:53'),(17,2,2,'AVISO_CREADO','Se creó un aviso con título \'Necesito pulidorasaddsad\'','2025-09-04 16:11:25'),(18,2,2,'AVISO_ATENDIDO','El aviso con ID 9 fue marcado como atendido','2025-09-04 16:11:53');
/*!40000 ALTER TABLE `historial_eventos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `contrasena` varchar(255) NOT NULL,
  `direccion` varchar(150) DEFAULT NULL,
  `comunidad_id` bigint(20) DEFAULT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp(),
  `rol` enum('ADMIN','VECINO') NOT NULL DEFAULT 'VECINO',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `comunidad_id` (`comunidad_id`),
  CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`comunidad_id`) REFERENCES `comunidad` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Ana López','ana@mail.com','hashed_pw1','Depto 3A',1,'2025-09-04 13:25:48','ADMIN'),(2,'Carlos Pérez','carlos@mail.com','hashed_pw2','Depto 3B',1,'2025-09-04 13:25:48','VECINO'),(3,'Lucía Gómez','lucia@mail.com','hashed_pw3','Piso 2',2,'2025-09-04 13:25:48','VECINO'),(64,'Ana Martínez','ana.martinez@example.com','1234hashed','Calle 1 Nº 100',1,'2025-09-04 16:55:06','ADMIN'),(65,'Luis Gómez','luis.gomez@example.com','abcdhashed','Calle 2 Nº 200',1,'2025-09-04 16:55:33','VECINO'),(66,'Sofía Herrera','sofia.herrera@example.com','pass1234','Calle 3 Nº 300',2,'2025-09-04 16:55:52','VECINO'),(67,'Carlos Díaz','carlos.diaz@example.com','securepass','Calle 4 Nº 400',2,'2025-09-04 16:56:04','VECINO'),(69,'María López','maria.lopez@example.com','mypassword','Calle 5 Nº 500',1,'2025-09-04 16:56:56','ADMIN'),(70,'Pedro Ruiz','pedro.ruiz@example.com','hashedpw1','Calle 6 Nº 600',4,'2025-09-04 16:56:56','VECINO'),(71,'Laura Méndez','laura.mendez@example.com','clave321','Calle 7 Nº 700',4,'2025-09-04 16:56:56','VECINO'),(72,'Jorge Silva','jorge.silva@example.com','seguro123','Calle 8 Nº 800',4,'2025-09-04 16:56:56','VECINO'),(73,'Camila Torres','camila.torres@example.com','clave456','Calle 9 Nº 900',5,'2025-09-04 16:56:56','VECINO'),(74,'Ricardo Fernández','ricardo.fernandez@example.com','pwadmin','Calle 10 Nº 1000',5,'2025-09-04 16:56:56','ADMIN'),(75,'Valeria Castro','valeria.castro@example.com','123valeria','Av. Siempre Viva 742',6,'2025-09-04 16:56:56','VECINO'),(76,'Martín Peña','martin.pena@example.com','peña2022','Av. 9 de Julio 1200',6,'2025-09-04 16:56:56','VECINO'),(77,'Natalia Duarte','natalia.duarte@example.com','duartePW','Pasaje 12',7,'2025-09-04 16:56:56','VECINO'),(78,'Andrés Morales','andres.morales@example.com','m0rales!','B° Central',7,'2025-09-04 16:56:56','VECINO'),(79,'Julieta Vargas','julieta.vargas@example.com','julieta22','Zona Sur',8,'2025-09-04 16:56:56','VECINO'),(80,'Hernán Bravo','hernan.bravo@example.com','bravoOK','Zona Norte',8,'2025-09-04 16:56:56','VECINO'),(81,'Lucía Paredes','lucia.paredes@example.com','paredes123','Diagonal 100',9,'2025-09-04 16:56:56','VECINO'),(82,'Francisco Ríos','francisco.rios@example.com','franpass','Ruta 5 KM 10',9,'2025-09-04 16:56:56','VECINO'),(83,'Romina Arce','romina.arce@example.com','arceRomina','Callejón 6',10,'2025-09-04 16:56:56','VECINO'),(84,'Oscar Molina','oscar.molina@example.com','oscarsecure','Edificio Sur A',10,'2025-09-04 16:56:56','VECINO');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-04 12:19:52
