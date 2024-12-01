-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: exemplo
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
-- Table structure for table `amigos`
--

DROP TABLE IF EXISTS `amigos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `amigos` (
  `id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amigos`
--

LOCK TABLES `amigos` WRITE;
/*!40000 ALTER TABLE `amigos` DISABLE KEYS */;
/*!40000 ALTER TABLE `amigos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migos`
--

DROP TABLE IF EXISTS `migos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `sexo` enum('M','F') COLLATE utf8mb4_general_ci NOT NULL,
  `telefone` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nome` (`nome`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migos`
--

LOCK TABLES `migos` WRITE;
/*!40000 ALTER TABLE `migos` DISABLE KEYS */;
INSERT INTO `migos` VALUES (1,'Maria','F','22222-3333'),(2,'João','M','111-2222'),(3,'José','M','4444-5555');
/*!40000 ALTER TABLE `migos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-01 12:33:24
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: loja
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
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(80) NOT NULL,
  `CPF` varchar(11) NOT NULL,
  `Celular` varchar(11) NOT NULL,
  `EndLogradouro` varchar(100) NOT NULL,
  `EndNumero` varchar(10) NOT NULL,
  `EndMunicipio` int NOT NULL,
  `EndCEP` char(8) NOT NULL,
  `FK_Municipio_ID` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_Municipio_ID` (`FK_Municipio_ID`),
  CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`FK_Municipio_ID`) REFERENCES `municipio` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Ana Silva','98765432101','9876543210','Rua A','123',1,'98765432',1),(2,'José Santos','12345678910','1234567890','Rua B','456',2,'12345678',2),(3,'Maria Oliveira','45678912310','4567891230','Rua C','789',3,'45678912',3);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contareceber`
--

DROP TABLE IF EXISTS `contareceber`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contareceber` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `FK_Cliente_ID` int NOT NULL,
  `FaturaVendaID` int NOT NULL,
  `DataConta` date NOT NULL,
  `DataVencimento` date NOT NULL,
  `Valor` decimal(18,2) NOT NULL,
  `Situacao` enum('1','2','3') NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_Cliente_ID` (`FK_Cliente_ID`),
  CONSTRAINT `contareceber_ibfk_1` FOREIGN KEY (`FK_Cliente_ID`) REFERENCES `cliente` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contareceber`
--

LOCK TABLES `contareceber` WRITE;
/*!40000 ALTER TABLE `contareceber` DISABLE KEYS */;
INSERT INTO `contareceber` VALUES (1,1,105,'2024-08-06','2025-05-15',100.00,'1'),(2,2,106,'2024-04-07','2025-03-28',200.00,'2'),(3,3,107,'2024-06-25','2025-04-20',300.00,'3');
/*!40000 ALTER TABLE `contareceber` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `contasnaopagas`
--

DROP TABLE IF EXISTS `contasnaopagas`;
/*!50001 DROP VIEW IF EXISTS `contasnaopagas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `contasnaopagas` AS SELECT 
 1 AS `ID da conta a receber`,
 1 AS `Nome do Cliente`,
 1 AS `CPF do Cliente`,
 1 AS `Data de vencimento`,
 1 AS `Valor da conta`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `estado`
--

DROP TABLE IF EXISTS `estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estado` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(100) NOT NULL,
  `UF` varchar(2) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado`
--

LOCK TABLES `estado` WRITE;
/*!40000 ALTER TABLE `estado` DISABLE KEYS */;
INSERT INTO `estado` VALUES (1,'São Paulo','SP'),(2,'Rio de Janeiro','RJ'),(3,'Minas Gerais','MG');
/*!40000 ALTER TABLE `estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `municipio`
--

DROP TABLE IF EXISTS `municipio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `municipio` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `FK_EstadoID` int NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `codIBGE` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_EstadoID` (`FK_EstadoID`),
  CONSTRAINT `municipio_ibfk_1` FOREIGN KEY (`FK_EstadoID`) REFERENCES `estado` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `municipio`
--

LOCK TABLES `municipio` WRITE;
/*!40000 ALTER TABLE `municipio` DISABLE KEYS */;
INSERT INTO `municipio` VALUES (1,1,'São Luiz',3550308),(2,2,'São João',3304557),(3,3,'Santo Antonio',3106200);
/*!40000 ALTER TABLE `municipio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `contasnaopagas`
--

/*!50001 DROP VIEW IF EXISTS `contasnaopagas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `contasnaopagas` AS select `cr`.`ID` AS `ID da conta a receber`,`c`.`Nome` AS `Nome do Cliente`,`c`.`CPF` AS `CPF do Cliente`,`cr`.`DataVencimento` AS `Data de vencimento`,`cr`.`Valor` AS `Valor da conta` from (`contareceber` `cr` join `cliente` `c` on((`cr`.`FK_Cliente_ID` = `c`.`ID`))) where (`cr`.`Situacao` = '1') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-01 12:33:24
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: cadrastro
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
-- Table structure for table `assisti`
--

DROP TABLE IF EXISTS `assisti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assisti` (
  `id` int NOT NULL AUTO_INCREMENT,
  `data` date DEFAULT NULL,
  `idcolaboradores` int DEFAULT NULL,
  `idcurso` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idcolaboradores` (`idcolaboradores`),
  KEY `idcurso` (`idcurso`),
  CONSTRAINT `assisti_ibfk_1` FOREIGN KEY (`idcolaboradores`) REFERENCES `colaboradores` (`id`),
  CONSTRAINT `assisti_ibfk_2` FOREIGN KEY (`idcurso`) REFERENCES `curso` (`idcurso`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assisti`
--

LOCK TABLES `assisti` WRITE;
/*!40000 ALTER TABLE `assisti` DISABLE KEYS */;
INSERT INTO `assisti` VALUES (1,'2014-03-01',1,2),(2,'2022-05-04',6,7),(3,'2015-09-10',9,9),(4,'2024-10-28',10,1),(5,'2016-11-14',7,10),(6,'2021-02-16',13,3);
/*!40000 ALTER TABLE `assisti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `colaboradores`
--

DROP TABLE IF EXISTS `colaboradores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `colaboradores` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `profissao` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nascimento` date DEFAULT NULL,
  `sexo` enum('M','F') COLLATE utf8mb4_general_ci DEFAULT NULL,
  `peso` decimal(5,2) DEFAULT NULL,
  `altura` decimal(3,2) DEFAULT NULL,
  `nacionalidade` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `cursopreferido` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cursopreferido` (`cursopreferido`),
  CONSTRAINT `colaboradores_ibfk_1` FOREIGN KEY (`cursopreferido`) REFERENCES `curso` (`idcurso`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colaboradores`
--

LOCK TABLES `colaboradores` WRITE;
/*!40000 ALTER TABLE `colaboradores` DISABLE KEYS */;
INSERT INTO `colaboradores` VALUES (1,'HAna Silva','Engenheira','2006-04-12','F',65.50,1.70,'Brasil',6),(2,'Carlos Souza','Médico','1979-11-23','M',107.98,1.80,'Brasil',5),(3,'Beatriz Oliveira','Advogada','2008-06-15','F',58.70,1.65,'Brasil',24),(4,'João Ferreira','Professor','1982-01-05','M',85.20,1.75,'Brasil',22),(5,'Maria Santos','Arquiteta','2010-09-30','F',60.80,1.68,'Brasil',3),(6,'Pedro Lima','Designer','1992-07-20','M',109.65,1.78,'Brasil',15),(7,'Mariana Costa','Dentista','1993-03-22','F',62.50,1.67,'Brasil',8),(8,'Rafael Barbosa','Engenheiro','2017-12-18','M',80.40,1.82,'Brasil',4),(9,'Fernanda Rocha','Médica','1989-05-14','F',63.20,1.66,'Brasil',1),(10,'Lucas Martins','Desenvolvedor','1995-08-10','M',70.40,1.80,'Brasil',7),(11,'Juliana Souza','Psicóloga','1986-11-25','F',59.30,1.64,'Brasil',8),(12,'Guilherme Moreira','Analista de Sistemas','1991-02-15','M',82.50,1.85,'Brasil',10),(13,'Letícia Gomes','Fisioterapeuta','1988-10-09','F',56.40,1.62,'Brasil',9),(14,'Renato Nascimento','Cozinheiro','1983-08-22','M',89.30,1.77,'Brasil',17),(15,'Patrícia Almeida','Farmacêutica','1990-12-02','F',61.50,1.70,'Brasil',19),(16,'Fábio Ribeiro','Motorista','1975-06-30','M',92.20,1.73,'Brasil',18),(17,'Aline Teixeira','Secretária','1995-04-18','F',59.80,1.64,'Brasil',13),(18,'Marcelo Vieira','Vendedor','1986-01-14','M',75.60,1.78,'Brasil',14),(19,'Bruna Fernandes','Nutricionista','1987-09-29','F',55.90,1.63,'Brasil',16),(20,'Rodrigo Lopes','Programador','1992-11-05','M',73.40,1.75,'Brasil',20),(21,'Camila Carvalho','Advogada','1991-03-23','F',63.70,1.69,'Brasil',21),(22,'Douglas Macedo','Jornalista','1985-07-11','M',81.20,1.80,'Brasil',1),(23,'Larissa Pires','Designer Gráfica','1993-05-08','F',60.10,1.67,'Brasil',6),(24,'Vitor Martins','Eletricista','1989-08-16','M',87.00,1.76,'Brasil',2),(25,'Juliana Costa','Médica Veterinária','1988-12-22','F',58.60,1.65,'Brasil',8),(26,'Thiago Ferreira','Engenheiro Civil','1990-04-07','M',76.30,1.79,'Brasil',9),(27,'Sara Neves','Professora','1984-11-30','F',108.54,1.68,'Brasil',7),(28,'Daniel Barros','Consultor Financeiro','1994-02-10','M',72.80,1.74,'Brasil',12),(29,'Rafaela Silva','Fonoaudióloga','1996-06-12','F',57.40,1.66,'Brasil',24),(30,'Adriana Moura','Psicóloga','1989-02-11','F',59.20,1.64,'Brasil',12),(31,'Ricardo Farias','Administrador','1985-06-17','M',83.50,1.81,'Brasil',8),(32,'Fernanda Souza','Fisioterapeuta','1993-10-05','F',61.00,1.67,'Brasil',6),(33,'Eduardo Lima','Empresário','1988-11-30','M',86.30,1.79,'Brasil',4),(34,'Tatiana Pereira','Consultora','1990-04-25','F',60.10,1.65,'Brasil',8),(35,'Leonardo Campos','Analista de TI','1991-09-21','M',78.40,1.76,'Brasil',2),(36,'Débora Santos','Enfermeira','1992-12-19','F',107.98,1.68,'Brasil',1),(37,'Rodrigo Souza','Professor de Matemática','1986-03-08','M',85.70,1.83,'Brasil',22),(38,'Elaine Fernandes','Jornalista','1984-07-23','F',58.80,1.63,'Brasil',1),(39,'Felipe Rodrigues','Advogado','1987-01-14','M',76.60,1.74,'Brasil',4),(40,'Simone Oliveira','Gerente de Projetos','1985-05-29','F',62.90,1.69,'Brasil',6),(41,'Lucas Pereira','Contador','1992-08-12','M',79.10,1.80,'Brasil',8),(42,'Bruna Alves','Arquiteta','1990-02-07','F',57.50,1.66,'Brasil',4),(43,'Carlos Nunes','Engenheiro Mecânico','1988-11-02','M',90.40,1.85,'Brasil',4),(44,'Mariana Rodrigues','Publicitária','1995-06-10','F',64.50,1.70,'Brasil',9),(45,'Thiago Costa','Desenvolvedor Web','1991-03-19','M',74.20,1.78,'Brasil',12),(46,'Larissa Carvalho','Farmacêutica','1987-09-15','F',56.80,1.64,'Brasil',13),(47,'André Barbosa','Consultor de Vendas','1994-07-22','M',81.30,1.82,'Brasil',15),(48,'Sophia Müller','Designer Gráfica','1992-05-14','F',58.90,1.68,'Alemanha',14),(49,'Michael Johnson','Engenheiro de Software','1984-11-23','M',82.10,1.85,'Alemanha',17),(50,'Isabel García','Médica','1990-03-02','F',60.50,1.70,'Espanha',19),(51,'Liam O Connor','Professor de Inglês','1986-09-18','M',76.30,1.78,'Irlanda',23),(52,'Aya Nakamura','Advogada','1991-12-27','F',55.20,1.62,'Japão',22),(53,'Omar El-Sayed','Empresário','1988-07-15','M',88.60,1.80,'Alemanha',5),(54,'Chloe Dubois','Psicóloga','1994-01-10','F',59.80,1.65,'França',8),(55,'Diego González','Contador','1985-04-03','M',84.50,1.83,'França',2),(56,'Olga Ivanova','Cientista de Dados','1993-06-22','F',63.20,1.70,'França',4),(57,'Marco Rossi','Chef de Cozinha','1987-02-17','M',90.30,1.77,'Italia',6),(58,'Emily Wilson','Arquiteta','1990-09-25','F',62.40,1.67,'Italia',6),(59,'Hassan Khan','Engenheiro Civil','1989-11-11','M',78.20,1.75,'Espanha',1),(60,'Ana María Lopez','Farmacêutica','1995-08-05','F',102.87,1.64,'Japão',8),(61,'Jürgen Schneider','Economista','1983-03-14','M',85.70,1.84,'Alemanha',9),(62,'Elena Petrova','Enfermeira','2020-10-09','F',61.80,1.66,'Italia',4),(63,'Pierre Martin','Desenvolvedor','1992-11-29','M',73.50,1.80,'França',2),(64,'Maria Souza','Nutricionista','1991-04-19','F',64.70,1.70,'Portugal',7),(65,'Amir Rahman','Consultor de TI','2012-12-12','M',105.90,1.76,'India',12),(66,'Lucia Rizzo','Professora','1993-05-30','F',59.00,1.65,'Italia',22),(67,'James Brown','Gerente de Projetos','2009-06-17','M',186.80,1.82,'Japão',12),(68,'Barbara dos Santos Bastos','Programadora','1995-04-16','F',69.80,1.56,'Russia',5);
/*!40000 ALTER TABLE `colaboradores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curso`
--

DROP TABLE IF EXISTS `curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `curso` (
  `idcurso` int NOT NULL,
  `nome` varchar(30) NOT NULL,
  `descricao` text,
  `carga` int unsigned DEFAULT NULL,
  `totaulas` int unsigned DEFAULT NULL,
  `ano` year DEFAULT '2016',
  PRIMARY KEY (`idcurso`),
  UNIQUE KEY `nome` (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curso`
--

LOCK TABLES `curso` WRITE;
/*!40000 ALTER TABLE `curso` DISABLE KEYS */;
INSERT INTO `curso` VALUES (1,'PHP','Lingugem de programação',40,23,2015),(2,'Jva','CURSO MUITO BOM',45,7,2024),(3,'javaScript','a distancia',60,78,2019),(4,'HTML5','FAZER SITE',76,34,2023),(5,'Introdução à Programação','Curso básico de programação em diversas linguagens',40,10,2024),(6,'Lógica de Programação','Estudo de conceitos fundamentais de lógica computacional',50,12,2024),(7,'Desenvolvimento Web','Curso completo de HTML, CSS e JavaScript',60,15,2024),(8,'Banco de Dados SQL','Fundamentos e manipulação de bancos de dados com SQL',45,10,2023),(9,'Desenvolvimento Mobile','Criação de aplicativos para dispositivos móveis',80,20,2016),(10,'Cloud Computing','Introdução à computação em nuvem e suas aplicações',70,18,2016),(11,'Segurança da Informação','Conceitos de segurança para proteção de sistemas e dados',50,12,2017),(12,'Inteligência Artificial','Introdução a IA e suas aplicações na indústria',65,14,2024),(13,'Python para Iniciantes','Curso de programação com Python desde o básico',40,10,2024),(14,'Redes de Computadores','Fundamentos de redes e comunicação de dados',55,13,2023),(15,'desenvolvedor full','Curso básico de programação em diversas linguagens',40,10,2017),(16,'Lógica ','Estudo de conceitos fundamentais de lógica computacional',50,12,2017),(17,'Desenvolvimento','Curso completo de HTML, CSS e JavaScript',60,15,2024),(18,'Banco de Dados ','Fundamentos e manipulação de bancos de dados com SQL',45,10,2017),(19,'Desenvolvimento app','Criação de aplicativos para dispositivos móveis',80,20,2014),(20,'Cloud ','Introdução à computação em nuvem e suas aplicações',70,18,2014),(21,'Segurança ','Conceitos de segurança para proteção de sistemas e dados',50,12,2014),(22,'Inteligência ','Introdução a IA e suas aplicações na indústria',65,14,2022),(23,'Python avançado','Curso de programação com Python desde o básico',40,10,2022),(24,'Redes ','Fundamentos de redes e comunicação de dados',55,13,2017);
/*!40000 ALTER TABLE `curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `membros`
--

DROP TABLE IF EXISTS `membros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `membros` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `profissao` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nascimento` date DEFAULT NULL,
  `sexo` enum('M','F') COLLATE utf8mb4_general_ci DEFAULT NULL,
  `peso` decimal(5,2) DEFAULT NULL,
  `altura` decimal(3,2) DEFAULT NULL,
  `nacionalidade` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `membros`
--

LOCK TABLES `membros` WRITE;
/*!40000 ALTER TABLE `membros` DISABLE KEYS */;
/*!40000 ALTER TABLE `membros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pessoas`
--

DROP TABLE IF EXISTS `pessoas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pessoas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `profissao` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nascimento` date DEFAULT NULL,
  `sexo` enum('M','F') COLLATE utf8mb4_general_ci DEFAULT NULL,
  `peso` decimal(5,2) DEFAULT NULL,
  `altura` decimal(3,2) DEFAULT NULL,
  `nacionalidade` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoas`
--

LOCK TABLES `pessoas` WRITE;
/*!40000 ALTER TABLE `pessoas` DISABLE KEYS */;
INSERT INTO `pessoas` VALUES (1,'Ana Silva','Engenheira','1985-04-12','F',65.50,1.70,'Brasileira'),(2,'Carlos Souza','Médico','1979-11-23','M',78.30,1.80,'Brasileiro'),(3,'Beatriz Oliveira','Advogada','1990-06-15','F',58.70,1.65,'Brasileira'),(4,'João Ferreira','Professor','1982-01-05','M',85.20,1.75,'Brasileiro'),(5,'Maria Santos','Arquiteta','1987-09-30','F',60.80,1.68,'Brasileira'),(6,'Pedro Lima','Designer','1992-07-20','M',72.10,1.78,'Brasileiro'),(7,'Mariana Costa','Dentista','1993-03-22','F',62.50,1.67,'Brasileira'),(8,'Rafael Barbosa','Engenheiro','1984-12-18','M',80.40,1.82,'Brasileiro'),(9,'Fernanda Rocha','Médica','1989-05-14','F',63.20,1.66,'Brasileira'),(10,'Lucas Martins','Desenvolvedor','1995-08-10','M',70.40,1.80,'Brasileiro'),(11,'Juliana Souza','Psicóloga','1986-11-25','F',59.30,1.64,'Brasileira');
/*!40000 ALTER TABLE `pessoas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-01 12:33:24
