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
  KEY `fk_aviso_categoria` (`categoria_id`),
  KEY `fk_aviso_comunidad` (`comunidad_id`),
  KEY `aviso_usuario_id` (`usuario_id`),
  CONSTRAINT `aviso_usuario_id` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_aviso_categoria` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_aviso_comunidad` FOREIGN KEY (`comunidad_id`) REFERENCES `comunidad` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aviso`
--

LOCK TABLES `aviso` WRITE;
/*!40000 ALTER TABLE `aviso` DISABLE KEYS */;
INSERT INTO `aviso` VALUES (1,'Necesito ayuda con mi jardín','Busco a alguien que pueda ayudarme a podar los arbustos.','ACTIVO',1,1,1,'2025-09-05 16:09:02'),(2,'Alerta por robo','Se reportó un intento de robo anoche cerca de la esquina.','ACTIVO',2,1,1,'2025-09-05 16:09:02'),(3,'Compro frutas frescas','¿Alguien vende frutas frescas los fines de semana?','ATENDIDO',3,1,1,'2025-09-05 16:09:02'),(4,'Busco ayuda para mover muebles','Necesito ayuda para mover unos muebles pesados.','ACTIVO',1,2,1,'2025-09-05 16:09:02'),(5,'Reunión de vecinos','Convocamos reunión para tratar temas de seguridad.','ACTIVO',4,2,1,'2025-09-05 16:09:02'),(6,'Alerta: corte de agua','Se informa corte de agua este viernes por mantenimiento.','ATENDIDO',2,2,1,'2025-09-05 16:09:02'),(7,'Ofrezco ayuda con compras','Puedo hacer compras para adultos mayores del vecindario.','ACTIVO',1,3,1,'2025-09-05 16:09:02'),(8,'Venta de pan casero','Hago pan casero los fines de semana, entrego a domicilio.','ACTIVO',3,3,1,'2025-09-05 16:09:02'),(9,'Alerta por incendio','Pequeño incendio en calle 12, ya fue controlado.','ATENDIDO',2,3,1,'2025-09-05 16:09:02'),(10,'Compro herramientas usadas','Estoy buscando herramientas para jardinería.','ACTIVO',3,4,1,'2025-09-05 16:09:02'),(11,'Reunión por mejoras','Nos reuniremos para hablar de mejoras en el parque.','ACTIVO',4,4,1,'2025-09-05 16:09:02'),(12,'Ayuda con clases de inglés','¿Alguien puede ayudarme con tareas de inglés?','ATENDIDO',1,4,1,'2025-09-05 16:09:02'),(13,'Alerta: animal perdido','Se perdió un perro blanco, responde al nombre Max.','ACTIVO',2,5,1,'2025-09-05 16:09:02'),(14,'Venta de verduras orgánicas','Tengo huerto y vendo verduras frescas.','ACTIVO',3,5,1,'2025-09-05 16:09:02'),(15,'Reunión anual de vecinos','Reunión anual el próximo sábado en la plaza.','ATENDIDO',4,5,1,'2025-09-05 16:09:02'),(16,'Necesito transporte','¿Alguien va al centro y puede llevarme?','ACTIVO',1,6,2,'2025-09-05 16:09:02'),(17,'Alerta: persona sospechosa','Vecinos reportan a una persona merodeando casas.','ACTIVO',2,6,2,'2025-09-05 16:09:02'),(18,'Compro bicicleta usada','Busco bici usada en buen estado.','ATENDIDO',3,6,2,'2025-09-05 16:09:02'),(19,'Ofrezco ayuda con deberes','Puedo ayudar a niños con tareas escolares.','ACTIVO',1,7,2,'2025-09-05 16:09:02'),(20,'Corte de luz programado','Habrá corte de energía el lunes.','ACTIVO',2,7,2,'2025-09-05 16:09:02'),(21,'Reunión por limpieza','Organizamos limpieza comunitaria del parque.','ATENDIDO',4,7,2,'2025-09-05 16:09:02'),(22,'Vendo herramientas','Tengo herramientas que ya no uso.','ACTIVO',3,8,2,'2025-09-05 16:09:02'),(23,'Necesito ayuda para pintar','Busco alguien para ayudar a pintar una habitación.','ACTIVO',1,8,2,'2025-09-05 16:09:02'),(24,'Reunión por seguridad','Vamos a hablar sobre seguridad en la cuadra.','ATENDIDO',4,8,2,'2025-09-05 16:09:02'),(25,'Alerta: humo en la zona','Se ha visto humo saliendo de una casa vacía.','ACTIVO',2,9,2,'2025-09-05 16:09:02'),(26,'Busco proveedor de verduras','¿Alguien recomienda dónde comprar verduras frescas?','ACTIVO',3,9,2,'2025-09-05 16:09:02'),(27,'Ayuda con trámites','Necesito ayuda para llenar unos formularios.','ATENDIDO',1,9,2,'2025-09-05 16:09:02'),(28,'Reunión con autoridades','Nos visitará la policía comunitaria.','ACTIVO',4,10,2,'2025-09-05 16:09:02'),(29,'Vendo electrodomésticos','Licuadora y microondas en buen estado.','ACTIVO',3,10,2,'2025-09-05 16:09:02'),(30,'Alerta: ruidos extraños','Ruidos fuertes en la madrugada, ¿alguien más los oyó?','ATENDIDO',2,10,2,'2025-09-05 16:09:02'),(31,'Ayuda con mudanza','Me estoy mudando este fin de semana, necesito una mano.','ACTIVO',1,11,3,'2025-09-05 16:09:02'),(32,'Venta de pasteles','Hago tortas y pasteles por encargo.','ACTIVO',3,11,3,'2025-09-05 16:09:02'),(33,'Alerta por fuga de gas','Se detectó olor a gas en la cuadra, ya se llamó a emergencias.','ATENDIDO',2,11,3,'2025-09-05 16:09:02'),(34,'Busco clases de guitarra','Quiero aprender guitarra, ¿alguien ofrece clases?','ACTIVO',1,12,3,'2025-09-05 16:09:02'),(35,'Alerta: robo de auto','Robaron un auto anoche frente al edificio.','ACTIVO',2,12,3,'2025-09-05 16:09:02'),(36,'Taller de reciclaje','Organizamos taller de reciclaje para niños.','ATENDIDO',4,12,3,'2025-09-05 16:09:02'),(37,'Compro libros usados','Busco libros de literatura en buen estado.','ACTIVO',3,13,3,'2025-09-05 16:09:02'),(38,'Reunión de emergencia','Tema: seguridad en la zona tras recientes robos.','ACTIVO',4,13,3,'2025-09-05 16:09:02'),(39,'Ofrezco clases de apoyo','Puedo apoyar con matemáticas y lengua.','ATENDIDO',1,13,3,'2025-09-05 16:09:02'),(40,'Alerta: cables caídos','Cables caídos tras la tormenta, precaución en la calle 8.','ACTIVO',2,14,3,'2025-09-05 16:09:02'),(41,'Venta de plantas','Suculentas y otras plantas pequeñas en venta.','ACTIVO',3,14,3,'2025-09-05 16:09:02'),(42,'Necesito ayuda legal','Busco asesoramiento sobre un tema vecinal.','ATENDIDO',1,14,3,'2025-09-05 16:09:02'),(43,'Reunión mensual','Invitamos a todos los vecinos a la reunión mensual.','ACTIVO',4,15,3,'2025-09-05 16:09:02'),(44,'Compro muebles pequeños','Busco mesa y silla para escritorio.','ACTIVO',3,15,3,'2025-09-05 16:09:02'),(45,'Alerta por vandalismo','Pintadas en paredes del parque durante la noche.','ATENDIDO',2,15,3,'2025-09-05 16:09:02'),(46,'Necesito niñera','Busco niñera con experiencia para tardes.','ACTIVO',1,16,4,'2025-09-05 16:09:02'),(47,'Venta de ropa usada','Ropa en buen estado, talles varios.','ACTIVO',3,16,4,'2025-09-05 16:09:02'),(48,'Reunión por convivencia','Queremos mejorar la convivencia entre vecinos.','ATENDIDO',4,16,4,'2025-09-05 16:09:02'),(49,'Alerta: intento de allanamiento','Intentaron entrar en casa ajena, llamar al 911.','ACTIVO',2,17,4,'2025-09-05 16:09:02'),(50,'Ofrezco reparaciones','Puedo arreglar grifos, puertas y más.','ACTIVO',1,17,4,'2025-09-05 16:09:02'),(51,'Taller de compostaje','Aprendamos a hacer compost en casa.','ATENDIDO',4,17,4,'2025-09-05 16:09:02'),(52,'Busco donaciones','Recolectamos ropa de abrigo para personas sin hogar.','ACTIVO',1,18,4,'2025-09-05 16:09:02'),(53,'Alerta: basura acumulada','Montón de basura en esquina no se ha recogido.','ACTIVO',2,18,4,'2025-09-05 16:09:02'),(54,'Venta de juguetes','Juguetes en excelente estado a buen precio.','ATENDIDO',3,18,4,'2025-09-05 16:09:02'),(55,'Reunión por ruidos molestos','Debatiremos nuevas reglas para fiestas nocturnas.','ACTIVO',4,19,4,'2025-09-05 16:09:02'),(56,'Compro artículos de cocina','Busco olla a presión y batidora.','ACTIVO',3,19,4,'2025-09-05 16:09:02'),(57,'Ofrezco clases de yoga','Sesiones de yoga para principiantes en la plaza.','ATENDIDO',1,19,4,'2025-09-05 16:09:02'),(58,'Alerta por corte de luz','Sin electricidad desde esta mañana, ¿alguien más?','ACTIVO',2,20,4,'2025-09-05 16:09:02'),(59,'Necesito ayuda con mascotas','¿Quién puede cuidar a mi gato el fin de semana?','ACTIVO',1,20,4,'2025-09-05 16:09:02'),(60,'Reunión para plan de seguridad','Nueva propuesta de patrullaje barrial.','ATENDIDO',4,20,4,'2025-09-05 16:09:02'),(61,'Ofrezco transporte','Tengo auto y puedo llevar personas al centro.','ACTIVO',1,21,5,'2025-09-05 16:09:02'),(62,'Alerta: pérdida de llaves','Llaves encontradas cerca del parque.','ACTIVO',2,21,5,'2025-09-05 16:09:02'),(63,'Venta de empanadas','Empanadas caseras de carne y verdura.','ATENDIDO',3,21,5,'2025-09-05 16:09:02'),(64,'Busco alguien que repare calzado','Zapatos con suela rota, ¿quién puede ayudar?','ACTIVO',1,22,5,'2025-09-05 16:09:02'),(65,'Alerta: perro agresivo suelto','Precaución en la calle 5.','ACTIVO',2,22,5,'2025-09-05 16:09:02'),(66,'Reunión para mural comunitario','Queremos pintar un mural en la entrada del barrio.','ATENDIDO',4,22,5,'2025-09-05 16:09:02'),(67,'Venta de muebles usados','Silla, mesa, estantería en buen estado.','ACTIVO',3,23,5,'2025-09-05 16:09:02'),(68,'Necesito voluntarios','Para jornada de limpieza de la plaza.','ACTIVO',1,23,5,'2025-09-05 16:09:02'),(69,'Alerta: luces apagadas','Faroles de la calle sin funcionar.','ATENDIDO',2,23,5,'2025-09-05 16:09:02'),(70,'Reunión sobre reciclaje','Planeamos colocar contenedores diferenciados.','ACTIVO',4,24,5,'2025-09-05 16:09:02'),(71,'Busco sillas plegables','Para evento familiar este domingo.','ACTIVO',3,24,5,'2025-09-05 16:09:02'),(72,'Ofrezco apoyo escolar','Especialmente en ciencias y matemáticas.','ATENDIDO',1,24,5,'2025-09-05 16:09:02'),(73,'Alerta: portón abierto','Portón del edificio quedó sin traba toda la noche.','ACTIVO',2,25,5,'2025-09-05 16:09:02'),(74,'Venta de comidas caseras','Menú del día con entrega a domicilio.','ACTIVO',3,25,5,'2025-09-05 16:09:02'),(75,'Busco grupo de caminatas','Quiero salir a caminar en grupo por las tardes.','ATENDIDO',1,25,5,'2025-09-05 16:09:02');
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
INSERT INTO `categoria` VALUES (1,'Ayuda','Solicitudes o ofrecimientos de ayuda entre vecinos'),(2,'Alertas','Avisos importantes o situaciones de emergencia'),(3,'Compras','Ofertas o búsquedas de productos para compra'),(4,'Reuniones','Convocatorias o información sobre reuniones vecinales');
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
  KEY `aviso_id` (`aviso_id`),
  KEY `comentario_usuario_id` (`usuario_id`),
  KEY `comentario_comunidad_id` (`comunidad_id`),
  CONSTRAINT `comentario_comunidad_id` FOREIGN KEY (`comunidad_id`) REFERENCES `comunidad` (`id`) ON DELETE CASCADE,
  CONSTRAINT `comentario_usuario_id` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentario`
--

LOCK TABLES `comentario` WRITE;
/*!40000 ALTER TABLE `comentario` DISABLE KEYS */;
INSERT INTO `comentario` VALUES (1,'Puedo ayudarte con eso.',1,1,'2025-09-05 16:55:05',1),(2,'¿A qué hora necesitas ayuda?',1,1,'2025-09-05 16:55:05',1),(3,'Gracias por avisar, estaré atento.',1,2,'2025-09-05 16:55:05',1),(4,'Yo también noté movimientos extraños.',1,2,'2025-09-05 16:55:05',1),(5,'Vendo naranjas frescas, te interesa?',1,3,'2025-09-05 16:55:05',1),(6,'Tengo frutas disponibles el domingo.',1,3,'2025-09-05 16:55:05',1),(7,'Puedo ayudarte a mover los muebles.',2,4,'2025-09-05 16:55:05',1),(8,'Yo tengo una camioneta, te sirve?',2,4,'2025-09-05 16:55:05',1),(9,'Confirmo mi asistencia.',2,5,'2025-09-05 16:55:05',1),(10,'Llevaré algo para compartir.',2,5,'2025-09-05 16:55:05',1),(11,'Gracias por el aviso.',2,6,'2025-09-05 16:55:05',1),(12,'Habrá que almacenar agua antes.',2,6,'2025-09-05 16:55:05',1),(13,'Buena iniciativa, cuenta conmigo.',3,7,'2025-09-05 16:55:05',1),(14,'Yo también puedo ayudar con compras.',3,7,'2025-09-05 16:55:05',1),(15,'¿Qué tipos de pan haces?',3,8,'2025-09-05 16:55:05',1),(16,'Estoy interesado en probar.',3,8,'2025-09-05 16:55:05',1),(17,'Vi el humo también, fue preocupante.',3,9,'2025-09-05 16:55:05',1),(18,'Menos mal que ya fue controlado.',3,9,'2025-09-05 16:55:05',1),(19,'Tengo algunas herramientas en venta.',4,10,'2025-09-05 16:55:05',1),(20,'¿Qué herramientas necesitas?',4,10,'2025-09-05 16:55:05',1),(21,'Allí estaré con mis hijos.',4,11,'2025-09-05 16:55:05',1),(22,'Es importante que todos participemos.',4,11,'2025-09-05 16:55:05',1),(23,'Puedo ayudarte con inglés.',4,12,'2025-09-05 16:55:05',1),(24,'Yo doy clases, contáctame.',4,12,'2025-09-05 16:55:05',1),(25,'Allí estaré con mis hijos.',5,13,'2025-09-05 16:55:05',1),(26,'Es importante que todos participemos.',5,13,'2025-09-05 16:55:05',1),(27,'Allí estaré con mis hijos.',5,14,'2025-09-05 16:55:05',1),(28,'Es importante que todos participemos.',5,14,'2025-09-05 16:55:05',1),(29,'Tengo algunas herramientas en venta.',5,15,'2025-09-05 16:55:05',1),(30,'¿Qué herramientas necesitas?',5,15,'2025-09-05 16:55:05',1),(31,'Buena iniciativa, cuenta conmigo.',6,16,'2025-09-05 16:55:05',2),(32,'Yo también puedo ayudar con compras.',6,16,'2025-09-05 16:55:05',2),(33,'Puedo ayudarte con eso.',6,17,'2025-09-05 16:55:05',2),(34,'¿A qué hora necesitas ayuda?',6,17,'2025-09-05 16:55:05',2),(35,'Gracias por avisar, estaré atento.',6,18,'2025-09-05 16:55:05',2),(36,'Yo también noté movimientos extraños.',6,18,'2025-09-05 16:55:05',2),(37,'Vendo naranjas frescas, te interesa?',7,19,'2025-09-05 16:55:05',2),(38,'Tengo frutas disponibles el domingo.',7,19,'2025-09-05 16:55:05',2),(39,'Puedo ayudarte a mover los muebles.',7,20,'2025-09-05 16:55:05',2),(40,'Yo tengo una camioneta, te sirve?',7,20,'2025-09-05 16:55:05',2),(41,'Confirmo mi asistencia.',7,21,'2025-09-05 16:55:05',2),(42,'Llevaré algo para compartir.',7,21,'2025-09-05 16:55:05',2),(43,'Gracias por el aviso.',8,22,'2025-09-05 16:55:05',2),(44,'Habrá que almacenar agua antes.',8,22,'2025-09-05 16:55:05',2),(45,'Buena iniciativa, cuenta conmigo.',8,23,'2025-09-05 16:55:05',2),(46,'Yo también puedo ayudar con compras.',8,23,'2025-09-05 16:55:05',2),(47,'¿Qué tipos de pan haces?',8,24,'2025-09-05 16:55:05',2),(48,'Estoy interesado en probar.',8,24,'2025-09-05 16:55:05',2),(49,'Vi el humo también, fue preocupante.',9,25,'2025-09-05 16:55:05',2),(50,'Menos mal que ya fue controlado.',9,25,'2025-09-05 16:55:05',2),(51,'Tengo algunas herramientas en venta.',9,26,'2025-09-05 16:55:05',2),(52,'¿Qué herramientas necesitas?',9,26,'2025-09-05 16:55:05',2),(53,'Allí estaré con mis hijos.',9,27,'2025-09-05 16:55:05',2),(54,'Es importante que todos participemos.',9,27,'2025-09-05 16:55:05',2),(55,'Puedo ayudarte con inglés.',10,28,'2025-09-05 16:55:05',2),(56,'Yo doy clases, contáctame.',10,28,'2025-09-05 16:55:05',2),(57,'Allí estaré con mis hijos.',10,29,'2025-09-05 16:55:05',2),(58,'Es importante que todos participemos.',10,29,'2025-09-05 16:55:05',2),(59,'Allí estaré con mis hijos.',10,30,'2025-09-05 16:55:05',2),(60,'Es importante que todos participemos.',10,30,'2025-09-05 16:55:05',2),(61,'Puedo ayudarte con eso.',11,31,'2025-09-05 16:55:05',3),(62,'¿A qué hora necesitas ayuda?',11,31,'2025-09-05 16:55:05',3),(63,'Gracias por avisar, estaré atento.',11,32,'2025-09-05 16:55:05',3),(64,'Yo también noté movimientos extraños.',11,32,'2025-09-05 16:55:05',3),(65,'Vendo naranjas frescas, te interesa?',11,33,'2025-09-05 16:55:05',3),(66,'Tengo frutas disponibles el domingo.',11,33,'2025-09-05 16:55:05',3),(67,'Puedo ayudarte a mover los muebles.',12,34,'2025-09-05 16:55:05',3),(68,'Yo tengo una camioneta, te sirve?',12,34,'2025-09-05 16:55:05',3),(69,'Confirmo mi asistencia.',12,35,'2025-09-05 16:55:05',3),(70,'Llevaré algo para compartir.',12,35,'2025-09-05 16:55:05',3),(71,'Gracias por el aviso.',12,36,'2025-09-05 16:55:05',3),(72,'Habrá que almacenar agua antes.',12,36,'2025-09-05 16:55:05',3),(73,'Buena iniciativa, cuenta conmigo.',13,37,'2025-09-05 16:55:05',3),(74,'Yo también puedo ayudar con compras.',13,37,'2025-09-05 16:55:05',3),(75,'¿Qué tipos de pan haces?',13,38,'2025-09-05 16:55:05',3),(76,'Estoy interesado en probar.',13,38,'2025-09-05 16:55:05',3),(77,'Vi el humo también, fue preocupante.',13,39,'2025-09-05 16:55:05',3),(78,'Menos mal que ya fue controlado.',13,39,'2025-09-05 16:55:05',3),(79,'Tengo algunas herramientas en venta.',14,40,'2025-09-05 16:55:05',3),(80,'¿Qué herramientas necesitas?',14,40,'2025-09-05 16:55:05',3),(81,'Allí estaré con mis hijos.',14,41,'2025-09-05 16:55:05',3),(82,'Es importante que todos participemos.',14,41,'2025-09-05 16:55:05',3),(83,'Puedo ayudarte con inglés.',14,42,'2025-09-05 16:55:05',3),(84,'Yo doy clases, contáctame.',14,42,'2025-09-05 16:55:05',3),(85,'Allí estaré con mis hijos.',15,43,'2025-09-05 16:55:05',3),(86,'Es importante que todos participemos.',15,43,'2025-09-05 16:55:05',3),(87,'Allí estaré con mis hijos.',15,44,'2025-09-05 16:55:05',3),(88,'Es importante que todos participemos.',15,44,'2025-09-05 16:55:05',3),(89,'Tengo algunas herramientas en venta.',15,45,'2025-09-05 16:55:05',3),(90,'¿Qué herramientas necesitas?',15,45,'2025-09-05 16:55:05',3),(91,'Puedo ayudarte con eso.',16,46,'2025-09-05 16:55:05',4),(92,'¿A qué hora necesitas ayuda?',16,46,'2025-09-05 16:55:05',4),(93,'Gracias por avisar, estaré atento.',16,47,'2025-09-05 16:55:05',4),(94,'Yo también noté movimientos extraños.',16,47,'2025-09-05 16:55:05',4),(95,'Vendo naranjas frescas, te interesa?',16,48,'2025-09-05 16:55:05',4),(96,'Tengo frutas disponibles el domingo.',16,48,'2025-09-05 16:55:05',4),(97,'Puedo ayudarte a mover los muebles.',17,49,'2025-09-05 16:55:05',4),(98,'Yo tengo una camioneta, te sirve?',17,49,'2025-09-05 16:55:05',4),(99,'Confirmo mi asistencia.',17,50,'2025-09-05 16:55:05',4),(100,'Llevaré algo para compartir.',17,50,'2025-09-05 16:55:05',4),(101,'Gracias por el aviso.',17,51,'2025-09-05 16:55:05',4),(102,'Habrá que almacenar agua antes.',17,51,'2025-09-05 16:55:05',4),(103,'Buena iniciativa, cuenta conmigo.',18,52,'2025-09-05 16:55:05',4),(104,'Yo también puedo ayudar con compras.',18,52,'2025-09-05 16:55:05',4),(105,'¿Qué tipos de pan haces?',18,53,'2025-09-05 16:55:05',4),(106,'Estoy interesado en probar.',18,53,'2025-09-05 16:55:05',4),(107,'Vi el humo también, fue preocupante.',18,54,'2025-09-05 16:55:05',4),(108,'Menos mal que ya fue controlado.',18,54,'2025-09-05 16:55:05',4),(109,'Tengo algunas herramientas en venta.',19,55,'2025-09-05 16:55:05',4),(110,'¿Qué herramientas necesitas?',19,55,'2025-09-05 16:55:05',4),(111,'Allí estaré con mis hijos.',19,56,'2025-09-05 16:55:05',4),(112,'Es importante que todos participemos.',19,56,'2025-09-05 16:55:05',4),(113,'Puedo ayudarte con inglés.',19,57,'2025-09-05 16:55:05',4),(114,'Yo doy clases, contáctame.',19,57,'2025-09-05 16:55:05',4),(115,'Allí estaré con mis hijos.',20,58,'2025-09-05 16:55:05',4),(116,'Es importante que todos participemos.',20,58,'2025-09-05 16:55:05',4),(117,'Allí estaré con mis hijos.',20,59,'2025-09-05 16:55:05',4),(118,'Es importante que todos participemos.',20,59,'2025-09-05 16:55:05',4),(119,'Tengo algunas herramientas en venta.',20,60,'2025-09-05 16:55:05',4),(120,'¿Qué herramientas necesitas?',20,60,'2025-09-05 16:55:05',4),(121,'Puedo ayudarte con eso.',21,61,'2025-09-05 16:55:05',5),(122,'¿A qué hora necesitas ayuda?',21,61,'2025-09-05 16:55:05',5),(123,'Gracias por avisar, estaré atento.',21,62,'2025-09-05 16:55:05',5),(124,'Yo también noté movimientos extraños.',21,62,'2025-09-05 16:55:05',5),(125,'Vendo naranjas frescas, te interesa?',21,63,'2025-09-05 16:55:05',5),(126,'Tengo frutas disponibles el domingo.',21,63,'2025-09-05 16:55:05',5),(127,'Puedo ayudarte a mover los muebles.',22,64,'2025-09-05 16:55:05',5),(128,'Yo tengo una camioneta, te sirve?',22,64,'2025-09-05 16:55:05',5),(129,'Confirmo mi asistencia.',22,65,'2025-09-05 16:55:05',5),(130,'Llevaré algo para compartir.',22,65,'2025-09-05 16:55:05',5),(131,'Gracias por el aviso.',22,66,'2025-09-05 16:55:05',5),(132,'Habrá que almacenar agua antes.',22,66,'2025-09-05 16:55:05',5),(133,'Buena iniciativa, cuenta conmigo.',23,67,'2025-09-05 16:55:05',5),(134,'Yo también puedo ayudar con compras.',23,67,'2025-09-05 16:55:05',5),(135,'¿Qué tipos de pan haces?',23,68,'2025-09-05 16:55:05',5),(136,'Estoy interesado en probar.',23,68,'2025-09-05 16:55:05',5),(137,'Vi el humo también, fue preocupante.',23,69,'2025-09-05 16:55:05',5),(138,'Menos mal que ya fue controlado.',23,69,'2025-09-05 16:55:05',5),(139,'Tengo algunas herramientas en venta.',24,70,'2025-09-05 16:55:05',5),(140,'¿Qué herramientas necesitas?',24,70,'2025-09-05 16:55:05',5),(141,'Allí estaré con mis hijos.',24,71,'2025-09-05 16:55:05',5),(142,'Es importante que todos participemos.',24,71,'2025-09-05 16:55:05',5),(143,'Puedo ayudarte con inglés.',24,72,'2025-09-05 16:55:05',5),(144,'Yo doy clases, contáctame.',24,72,'2025-09-05 16:55:05',5),(145,'Allí estaré con mis hijos.',25,73,'2025-09-05 16:55:05',5),(146,'Es importante que todos participemos.',25,73,'2025-09-05 16:55:05',5),(147,'Allí estaré con mis hijos.',25,74,'2025-09-05 16:55:05',5),(148,'Es importante que todos participemos.',25,74,'2025-09-05 16:55:05',5),(149,'Tengo algunas herramientas en venta.',25,75,'2025-09-05 16:55:05',5),(150,'¿Qué herramientas necesitas?',25,75,'2025-09-05 16:55:05',5);
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
INSERT INTO `comunidad` VALUES (1,'Barrio Los Álamos','Calle 12 N°345, Ciudad Verde','2025-09-05 15:46:01'),(2,'Residencial El Sol','Av. del Lago 1234, Ciudad Lago','2025-09-05 15:46:01'),(3,'Villa Esperanza','Callejón 5, Zona Norte','2025-09-05 15:46:01'),(4,'Conjunto Las Rosas','Calle 8 N°90, Pueblo Nuevo','2025-09-05 15:46:01'),(5,'Parque Central','Av. Central 999, Ciudad Capital','2025-09-05 15:46:01');
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
  KEY `historial_usuario_id` (`usuario_id`),
  KEY `historial_comunidad_id` (`comunidad_id`),
  CONSTRAINT `historial_comunidad_id` FOREIGN KEY (`comunidad_id`) REFERENCES `comunidad` (`id`) ON DELETE CASCADE,
  CONSTRAINT `historial_usuario_id` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historial_eventos`
--

LOCK TABLES `historial_eventos` WRITE;
/*!40000 ALTER TABLE `historial_eventos` DISABLE KEYS */;
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
  CONSTRAINT `comunidad_id` FOREIGN KEY (`comunidad_id`) REFERENCES `comunidad` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Lucía Fernández','lucia.fernandez@vecindario.com','_?$Cm?:	T??e?','Calle 12 N°350',1,'2023-02-10 14:15:00','ADMIN'),(2,'Mariano Díaz','mariano.diaz@vecindario.com','?C?\\Y?^Gq???????','Calle 12 N°351',1,'2023-02-11 15:00:00','VECINO'),(3,'Sofía Méndez','sofia.mendez@vecindario.com','=????n???rż??','Calle 12 N°352',1,'2023-02-12 13:30:00','VECINO'),(4,'Ignacio Pérez','ignacio.perez@vecindario.com','?$?go???PPƇ}?K?','Calle 12 N°353',1,'2023-02-13 17:45:00','VECINO'),(5,'Valeria Ruiz','valeria.ruiz@vecindario.com','k1??~??:??G?$??','Calle 12 N°354',1,'2023-02-14 16:20:00','VECINO'),(6,'Carlos Ramírez','carlos.ramirez@vecindario.com','_?$Cm?:	T??e?','Av. del Lago 1240',2,'2023-03-05 16:20:00','ADMIN'),(7,'Julia Gómez','julia.gomez@vecindario.com','?C?\\Y?^Gq???????','Av. del Lago 1241',2,'2023-03-06 14:15:00','VECINO'),(8,'Martín Herrera','martin.herrera@vecindario.com','=????n???rż??','Av. del Lago 1242',2,'2023-03-07 18:45:00','VECINO'),(9,'Romina Torres','romina.torres@vecindario.com','?$?go???PPƇ}?K?','Av. del Lago 1243',2,'2023-03-08 20:00:00','VECINO'),(10,'Esteban Vidal','esteban.vidal@vecindario.com','k1??~??:??G?$??','Av. del Lago 1244',2,'2023-03-09 15:30:00','VECINO'),(11,'María López','maria.lopez@vecindario.com','_?$Cm?:	T??e?','Callejón 5 N°10',3,'2023-04-01 13:45:00','ADMIN'),(12,'Diego Castro','diego.castro@vecindario.com','?C?\\Y?^Gq???????','Callejón 5 N°11',3,'2023-04-02 16:00:00','VECINO'),(13,'Laura Benítez','laura.benitez@vecindario.com','=????n???rż??','Callejón 5 N°12',3,'2023-04-03 14:30:00','VECINO'),(14,'Pablo Funes','pablo.funes@vecindario.com','?$?go???PPƇ}?K?','Callejón 5 N°13',3,'2023-04-04 19:15:00','VECINO'),(15,'Claudia Ríos','claudia.rios@vecindario.com','k1??~??:??G?$??','Callejón 5 N°14',3,'2023-04-05 18:00:00','VECINO'),(16,'José Torres','jose.torres@vecindario.com','_?$Cm?:	T??e?','Calle 8 N°95',4,'2023-05-12 15:00:00','ADMIN'),(17,'Elena Suárez','elena.suarez@vecindario.com','?C?\\Y?^Gq???????','Calle 8 N°96',4,'2023-05-13 14:00:00','VECINO'),(18,'Tomás Acuña','tomas.acuna@vecindario.com','=????n???rż??','Calle 8 N°97',4,'2023-05-14 15:45:00','VECINO'),(19,'Rocío Blanco','rocio.blanco@vecindario.com','?$?go???PPƇ}?K?','Calle 8 N°98',4,'2023-05-15 13:30:00','VECINO'),(20,'Franco Gil','franco.gil@vecindario.com','k1??~??:??G?$??','Calle 8 N°99',4,'2023-05-16 17:15:00','VECINO'),(21,'Ana Morales','ana.morales@vecindario.com','_?$Cm?:	T??e?','Av. Central 1001',5,'2023-06-08 19:30:00','ADMIN'),(22,'Gabriel Vargas','gabriel.vargas@vecindario.com','?C?\\Y?^Gq???????','Av. Central 1002',5,'2023-06-09 15:00:00','VECINO'),(23,'Daniela Castro','daniela.castro@vecindario.com','=????n???rż??','Av. Central 1003',5,'2023-06-10 16:45:00','VECINO'),(24,'Federico Paredes','federico.paredes@vecindario.com','?$?go???PPƇ}?K?','Av. Central 1004',5,'2023-06-11 18:00:00','VECINO'),(25,'Nadia Guzmán','nadia.guzman@vecindario.com','k1??~??:??G?$??','Av. Central 1005',5,'2023-06-12 14:30:00','VECINO');
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

-- Dump completed on 2025-09-05 11:56:18
