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
  KEY `usuario_id` (`usuario_id`),
  KEY `fk_aviso_categoria` (`categoria_id`),
  KEY `fk_aviso_comunidad` (`comunidad_id`),
  CONSTRAINT `aviso_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`),
  CONSTRAINT `fk_aviso_categoria` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_aviso_comunidad` FOREIGN KEY (`comunidad_id`) REFERENCES `comunidad` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aviso`
--

LOCK TABLES `aviso` WRITE;
/*!40000 ALTER TABLE `aviso` DISABLE KEYS */;
INSERT INTO `aviso` VALUES (1,'Solicitud de ayuda para mudanza','Necesito ayuda para trasladar muebles este sábado por la mañana.','ACTIVO',1,1,1,'2025-09-04 21:07:16'),(9,'Ayuda para trasladar paquetes grandes','Solicito apoyo para recibir y trasladar paquetes voluminosos.','ACTIVO',1,9,4,'2025-09-04 21:07:16'),(10,'Alerta por cortes de agua','Habrá un corte de agua programado el viernes de 8 am a 2 pm.','ACTIVO',2,10,5,'2025-09-04 21:07:16'),(11,'Compra de planta para área común','Se propone comprar plantas para embellecer la entrada principal.','ACTIVO',3,11,1,'2025-09-04 21:07:16'),(13,'Ayuda con reparaciones eléctricas','Buscamos alguien que nos ayude con la reparación de luces exteriores.','ACTIVO',1,13,3,'2025-09-04 21:07:16'),(18,'Alerta por plagas en el parque','Se han detectado plagas en el parque, se tomarán medidas próximamente.','ACTIVO',2,18,3,'2025-09-04 21:07:16'),(19,'Compra de materiales para juegos infantiles','Organizamos la compra de materiales para renovar el área de juegos.','ACTIVO',3,19,4,'2025-09-04 21:07:16'),(21,'Solicitud de ayuda para cuidar mascotas','Busco alguien que cuide a mis mascotas durante mi ausencia.','ACTIVO',1,1,1,'2025-09-04 21:07:16'),(23,'Compra colectiva de productos de limpieza','Se organiza compra grupal para productos de limpieza en cantidad.','ACTIVO',3,3,3,'2025-09-04 21:07:16'),(25,'Ayuda con instalación de estanterías','Se solicita apoyo para instalar estanterías en la sala común.','ACTIVO',1,5,5,'2025-09-04 21:07:16'),(26,'Alerta por cables sueltos','Se detectaron cables eléctricos sueltos en áreas comunes, tomar precauciones.','ACTIVO',2,6,1,'2025-09-04 21:07:16'),(29,'Ayuda con limpieza tras eventos','Se necesita ayuda para limpieza después de la última fiesta.','ACTIVO',1,9,4,'2025-09-04 21:07:16'),(30,'Alerta por basura fuera de horario','Recordamos respetar horarios para sacar la basura.','ACTIVO',2,10,5,'2025-09-04 21:07:16'),(31,'Solicitud de ayuda para mudanza','Necesito ayuda para trasladar muebles este sábado por la mañana.','ACTIVO',1,1,1,'2025-09-04 21:07:22'),(33,'Compra conjunta de pintura','Organizamos una compra grupal de pintura para las áreas comunes.','ACTIVO',3,3,3,'2025-09-04 21:07:22'),(35,'Ayuda con jardín comunitario','Buscamos voluntarios para mantener el jardín comunitario este fin de semana.','ACTIVO',1,5,5,'2025-09-04 21:07:22'),(36,'Alerta por robos en la zona','Se han reportado intentos de robo en la calle principal, extremen precauciones.','ACTIVO',2,6,1,'2025-09-04 21:07:22'),(39,'Ayuda para trasladar paquetes grandes','Solicito apoyo para recibir y trasladar paquetes voluminosos.','ACTIVO',1,9,4,'2025-09-04 21:07:22'),(40,'Alerta por cortes de agua','Habrá un corte de agua programado el viernes de 8 am a 2 pm.','ACTIVO',2,10,5,'2025-09-04 21:07:22'),(41,'Compra de planta para área común','Se propone comprar plantas para embellecer la entrada principal.','ACTIVO',3,11,1,'2025-09-04 21:07:22'),(43,'Ayuda con reparaciones eléctricas','Buscamos alguien que nos ayude con la reparación de luces exteriores.','ACTIVO',1,13,3,'2025-09-04 21:07:22'),(44,'Alerta por vehículos mal estacionados','Por favor, respetar las áreas de estacionamiento asignadas.','ACTIVO',2,14,4,'2025-09-04 21:07:22'),(45,'Compra de insumos para limpieza','Se propone comprar detergentes y guantes para la limpieza comunitaria.','ACTIVO',3,15,5,'2025-09-04 21:07:22'),(48,'Alerta por plagas en el parque','Se han detectado plagas en el parque, se tomarán medidas próximamente.','ACTIVO',2,18,3,'2025-09-04 21:07:22'),(49,'Compra de materiales para juegos infantiles','Organizamos la compra de materiales para renovar el área de juegos.','ACTIVO',3,19,4,'2025-09-04 21:07:22'),(51,'Solicitud de ayuda para cuidar mascotas','Busco alguien que cuide a mis mascotas durante mi ausencia.','ACTIVO',1,1,1,'2025-09-04 21:07:22'),(53,'Compra colectiva de productos de limpieza','Se organiza compra grupal para productos de limpieza en cantidad.','ACTIVO',3,3,3,'2025-09-04 21:07:22'),(55,'Ayuda con instalación de estanterías','Se solicita apoyo para instalar estanterías en la sala común.','ACTIVO',1,5,5,'2025-09-04 21:07:22'),(56,'Alerta por cables sueltos','Se detectaron cables eléctricos sueltos en áreas comunes, tomar precauciones.','ACTIVO',2,6,1,'2025-09-04 21:07:22'),(59,'Ayuda con limpieza tras eventos','Se necesita ayuda para limpieza después de la última fiesta.','ACTIVO',1,9,4,'2025-09-04 21:07:22'),(60,'Alerta por basura fuera de horario','Recordamos respetar horarios para sacar la basura.','ACTIVO',2,10,5,'2025-09-04 21:07:22'),(61,'Necesito taladro','¿Alguien me puede prestar un taladro para hoy?','ACTIVO',1,1,1,'2025-09-04 21:35:04');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Ayuda','Avisos para solicitudes de ayuda que tengan los vecinos'),(2,'Alertas','Avisos para algun tipo alerta que quieran dar los vecinos'),(3,'Compras','Avisos para organizar las compras comunitarias');
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
  KEY `comentario_ibfk_3` (`comunidad_id`),
  CONSTRAINT `comentario_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`),
  CONSTRAINT `comentario_ibfk_3` FOREIGN KEY (`comunidad_id`) REFERENCES `comunidad` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentario`
--

LOCK TABLES `comentario` WRITE;
/*!40000 ALTER TABLE `comentario` DISABLE KEYS */;
INSERT INTO `comentario` VALUES (1,'Gracias por el aviso, muy útil.',1,1,'2025-09-04 21:09:09',1),(3,'¿Podrían dar más detalles?',3,3,'2025-09-04 21:09:09',3),(4,'Excelente iniciativa.',4,4,'2025-09-04 21:09:09',4),(5,'¿Cuándo será la próxima reunión?',5,5,'2025-09-04 21:09:09',5),(6,'Me uno para la compra conjunta.',6,6,'2025-09-04 21:09:09',1),(8,'¿Hay voluntarios para ayudar?',8,8,'2025-09-04 21:09:09',3),(9,'Gracias por la información.',9,9,'2025-09-04 21:09:09',4),(10,'¿Quién coordina esta actividad?',10,10,'2025-09-04 21:09:09',5),(11,'Me parece una buena idea.',11,11,'2025-09-04 21:09:09',1),(13,'¿Se puede aportar con donaciones?',13,13,'2025-09-04 21:09:09',3),(14,'¿Cómo me inscribo?',14,14,'2025-09-04 21:09:09',4),(15,'¿Hay algún contacto para más información?',15,15,'2025-09-04 21:09:09',5),(16,'Buena gestión.',16,16,'2025-09-04 21:09:09',1),(18,'Necesito ayuda también.',18,18,'2025-09-04 21:09:09',3),(19,'¿Hay horarios específicos?',19,19,'2025-09-04 21:09:09',4),(20,'Me parece muy importante.',20,20,'2025-09-04 21:09:09',5),(21,'¿Qué materiales se necesitan?',1,21,'2025-09-04 21:09:09',1),(24,'¿Se requiere inscripción previa?',4,24,'2025-09-04 21:09:09',4),(25,'¿Hay límite de participantes?',5,25,'2025-09-04 21:09:09',5),(26,'Apoyo la iniciativa.',6,26,'2025-09-04 21:09:09',1),(28,'¿Qué día es la entrega?',8,28,'2025-09-04 21:09:09',3),(29,'¿Se puede colaborar con recursos?',9,29,'2025-09-04 21:09:09',4),(30,'Gracias por la coordinación.',10,30,'2025-09-04 21:09:09',5),(31,'¿Cómo ayudar en limpieza?',11,31,'2025-09-04 21:09:09',1),(33,'¿Hay que llevar algo?',13,33,'2025-09-04 21:09:09',3),(34,'¿Pueden enviar el cronograma?',14,34,'2025-09-04 21:09:09',4),(35,'¿Quién está a cargo?',15,35,'2025-09-04 21:09:09',5),(36,'Me interesa participar.',16,36,'2025-09-04 21:09:09',1),(38,'¿Cuánto tiempo durará?',18,38,'2025-09-04 21:09:09',3),(39,'¿Qué ropa es adecuada?',19,39,'2025-09-04 21:09:09',4),(40,'Gracias por organizar.',20,40,'2025-09-04 21:09:09',5),(41,'¿Se requiere autorización?',1,41,'2025-09-04 21:09:09',1),(43,'¿Pueden enviar aviso por email?',3,43,'2025-09-04 21:09:09',3),(44,'¿Quién puede asistir?',4,44,'2025-09-04 21:09:09',4),(45,'¿Se puede asistir con niños?',5,45,'2025-09-04 21:09:09',5),(46,'Muy buena iniciativa.',6,46,'2025-09-04 21:09:09',1),(48,'¿Hay actividades para jóvenes?',8,48,'2025-09-04 21:09:09',3),(49,'¿Cuántos participantes hay?',9,49,'2025-09-04 21:09:09',4),(50,'Gracias por el aviso.',10,50,'2025-09-04 21:09:09',5),(51,'¿Habrá comida disponible?',11,51,'2025-09-04 21:09:09',1),(53,'¿Quiénes participan?',13,53,'2025-09-04 21:09:09',3),(54,'¿Se puede hacer sugerencias?',14,54,'2025-09-04 21:09:09',4),(55,'¿Dónde puedo ver el acta?',15,55,'2025-09-04 21:09:09',5),(56,'Muy importante para la comunidad.',16,56,'2025-09-04 21:09:09',1),(58,'¿Habrá transporte?',18,58,'2025-09-04 21:09:09',3),(59,'¿Se pueden hacer donaciones online?',19,59,'2025-09-04 21:09:09',4),(60,'Gracias por organizar esto.',20,60,'2025-09-04 21:09:09',5),(61,'¿Puedo ayudar con la difusión?',1,1,'2025-09-04 21:09:09',1),(63,'¿Quiénes son los responsables?',3,3,'2025-09-04 21:09:09',3),(64,'¿Habrá reuniones virtuales?',4,4,'2025-09-04 21:09:09',4),(65,'¿Puedo participar aunque no viva en la comunidad?',5,5,'2025-09-04 21:09:09',5),(66,'¿Hay tareas específicas para voluntarios?',6,6,'2025-09-04 21:09:09',1),(68,'¿Dónde se hace la reunión?',8,8,'2025-09-04 21:09:09',3),(69,'¿Hay un plan de emergencia?',9,9,'2025-09-04 21:09:09',4),(70,'Gracias por la información.',10,10,'2025-09-04 21:09:09',5),(71,'¿Se puede asistir solo un rato?',11,11,'2025-09-04 21:09:09',1),(73,'¿Qué horarios tienen las actividades?',13,13,'2025-09-04 21:09:09',3),(74,'¿Hay actividades para adultos mayores?',14,14,'2025-09-04 21:09:09',4),(75,'¿Quién coordina la limpieza?',15,15,'2025-09-04 21:09:09',5),(76,'¿Se pueden hacer sugerencias para futuros avisos?',16,16,'2025-09-04 21:09:09',1),(78,'¿Habrá apoyo para personas con discapacidad?',18,18,'2025-09-04 21:09:09',3),(79,'¿Se puede traer mascotas?',19,19,'2025-09-04 21:09:09',4),(80,'Gracias por la ayuda.',20,20,'2025-09-04 21:09:09',5);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comunidad`
--

LOCK TABLES `comunidad` WRITE;
/*!40000 ALTER TABLE `comunidad` DISABLE KEYS */;
INSERT INTO `comunidad` VALUES (1,'Comunidad El Roble','Av. Central 123','2025-09-04 20:57:45'),(3,'Residencial Los Álamos','Cra. 7 #89-12','2025-09-04 20:57:45'),(4,'Barrio Santa Ana','Callejón del Sol','2025-09-04 20:57:45'),(5,'Urbanización Mirador','Callejuela Azul silvestre','2025-09-04 20:57:45');
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
  `usuario_id` bigint(20) NOT NULL,
  `comunidad_id` bigint(20) NOT NULL,
  `tipo_evento` varchar(50) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `historial_eventos_ibfk_1` (`usuario_id`),
  KEY `historial_eventos_ibfk_2` (`comunidad_id`),
  CONSTRAINT `historial_eventos_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE CASCADE,
  CONSTRAINT `historial_eventos_ibfk_2` FOREIGN KEY (`comunidad_id`) REFERENCES `comunidad` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historial_eventos`
--

LOCK TABLES `historial_eventos` WRITE;
/*!40000 ALTER TABLE `historial_eventos` DISABLE KEYS */;
INSERT INTO `historial_eventos` VALUES (1,1,1,'AVISO_CREADO','Se creó un aviso con título \'Necesito taladro\'','2025-09-04 21:35:04'),(2,3,3,'AVISO_ATENDIDO','El aviso con ID 3 fue marcado como atendido','2025-09-04 21:36:23'),(3,3,3,'AVISO_ACTUALIZADO','El aviso con ID 3 fue actualizado con nuevos datos: título=\'Necesisdasdato taladro\', categoría=1','2025-09-04 21:37:45'),(4,3,3,'AVISO_ACTUALIZADO','El aviso con ID 3 fue actualizado con nuevos datos: título=\'Necesito taladro\', categoría=1','2025-09-04 21:38:12'),(5,3,3,'COMENTARIO_ELIMINADO','Comentario con ID 23 fue eliminado','2025-09-04 22:01:13');
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Ana Pérez','ana.perez@example.com','pass1234','Calle Falsa 123',1,'2025-09-04 21:02:52','VECINO'),(2,'Luis Gómez','luis.gomez@example.com','pass1234','Avenida Siempre Viva 742',NULL,'2025-09-04 21:02:52','VECINO'),(3,'Carlos López','carlos.lopez@example.com','pass1234','Calle Principal 101',NULL,'2025-09-04 21:02:52','ADMIN'),(4,'María Fernández','maria.fernandez@example.com','pass1234','Plaza Mayor 5',3,'2025-09-04 21:02:52','VECINO'),(5,'Sofía Martínez','sofia.martinez@example.com','pass1234','Camino Real 8',1,'2025-09-04 21:02:52','VECINO'),(6,'Javier Sánchez','javier.sanchez@example.com','pass1234','Calle del Encanto 123',4,'2025-09-04 21:02:52','VECINO'),(7,'Lucía Torres','lucia.torres@example.com','pass1234','Boulevard Central 12',NULL,'2025-09-04 21:02:52','ADMIN'),(8,'Miguel Díaz','miguel.diaz@example.com','pass1234','Avenida Verde 456',3,'2025-09-04 21:02:52','VECINO'),(9,'Elena Ruiz','elena.ruiz@example.com','pass1234','Parque Natural 7',1,'2025-09-04 21:02:52','VECINO'),(10,'Pedro Morales','pedro.morales@example.com','pass1234','Callejón Sin Salida 4',5,'2025-09-04 21:02:52','VECINO'),(11,'Andrea Jiménez','andrea.jimenez@example.com','pass1234','Rincón Alegre 9',NULL,'2025-09-04 21:02:52','VECINO'),(13,'Isabel Romero','isabel.romero@example.com','pass1234','Sendero Verde 11',1,'2025-09-04 21:02:52','VECINO'),(14,'Raúl Navarro','raul.navarro@example.com','pass1234','Paseo del Sol 3',NULL,'2025-09-04 21:02:52','VECINO'),(15,'Clara Ortiz','clara.ortiz@example.com','pass1234','Camino del Bosque 321',NULL,'2025-09-04 21:02:52','VECINO'),(16,'Jorge Castro','jorge.castro@example.com','pass1234','Plaza del Mercado 6',3,'2025-09-04 21:02:52','VECINO'),(17,'Natalia Vega','natalia.vega@example.com','pass1234','Avenida Luna 15',1,'2025-09-04 21:02:52','ADMIN'),(18,'Fernando Salazar','fernando.salazar@example.com','pass1234','Calle Estrella 14',1,'2025-09-04 21:02:52','VECINO'),(19,'Patricia Flores','patricia.flores@example.com','pass1234','Paseo de las Rosas 654',NULL,'2025-09-04 21:02:52','VECINO'),(20,'Alberto Molina','alberto.molina@example.com','pass1234','Camino del Río 10',3,'2025-09-04 21:02:52','VECINO');
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

-- Dump completed on 2025-09-04 17:10:53
