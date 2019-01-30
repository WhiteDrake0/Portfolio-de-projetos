CREATE DATABASE  IF NOT EXISTS `cenarioc` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `cenarioc`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: cenarioc
-- ------------------------------------------------------
-- Server version	5.7.20-log

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
-- Table structure for table `acessibilidade`
--

DROP TABLE IF EXISTS `acessibilidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acessibilidade` (
  `idEquipamento` int(3) DEFAULT NULL,
  `descEquipamento` varchar(45) DEFAULT NULL,
  `acessibilidade` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acessibilidade`
--

LOCK TABLES `acessibilidade` WRITE;
/*!40000 ALTER TABLE `acessibilidade` DISABLE KEYS */;
INSERT INTO `acessibilidade` VALUES (1,'Camera Preta','Docentes e estudantes'),(2,'Projetor Pequeno','Apenas docentes'),(3,'Lapis de Cera','Docentes e estudantes'),(4,'Colunas','Apenas docentes'),(5,'Camera Branca','Docentes e estudantes'),(6,'Rato','Docentes e estudantes'),(7,'Projetor Grande','Apenas docentes'),(8,'Cabo HDMI','Apenas docentes'),(9,'Calculadora','Docentes e estudantes'),(10,'Auscultadores','Docentes e estudantes'),(10,'Auscultadores','Docentes e estudantes');
/*!40000 ALTER TABLE `acessibilidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria` (
  `idCategoria` int(2) NOT NULL,
  `descCategoria` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idCategoria`),
  KEY `cat` (`descCategoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Design'),(2,'Fotografia'),(3,'Informatica'),(4,'Multimidea'),(5,'Video');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `codigo_postal`
--

DROP TABLE IF EXISTS `codigo_postal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `codigo_postal` (
  `codPostal` varchar(8) NOT NULL,
  `localidade` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`codPostal`),
  KEY `cpostal` (`codPostal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `codigo_postal`
--

LOCK TABLES `codigo_postal` WRITE;
/*!40000 ALTER TABLE `codigo_postal` DISABLE KEYS */;
INSERT INTO `codigo_postal` VALUES ('4150-629','Porto'),('4150-708','Porto'),('4250-047','Porto'),('4445-145','Alfena'),('4455-828','Santa Cruz');
/*!40000 ALTER TABLE `codigo_postal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contactos`
--

DROP TABLE IF EXISTS `contactos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contactos` (
  `idUtente` int(8) NOT NULL,
  `contacto` int(9) DEFAULT NULL,
  PRIMARY KEY (`idUtente`),
  KEY `utente` (`idUtente`),
  CONSTRAINT `utente` FOREIGN KEY (`idUtente`) REFERENCES `utente` (`idUtente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contactos`
--

LOCK TABLES `contactos` WRITE;
/*!40000 ALTER TABLE `contactos` DISABLE KEYS */;
INSERT INTO `contactos` VALUES (1,123),(2,456),(3,789),(4,147),(5,369);
/*!40000 ALTER TABLE `contactos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curso`
--

DROP TABLE IF EXISTS `curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `curso` (
  `idCurso` int(2) NOT NULL,
  `descCurso` varchar(45) DEFAULT NULL,
  `codDepartamento` int(2) DEFAULT NULL,
  PRIMARY KEY (`idCurso`),
  KEY `departamento_idx` (`codDepartamento`),
  CONSTRAINT `departamento` FOREIGN KEY (`codDepartamento`) REFERENCES `departamento` (`idDepartamento`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curso`
--

LOCK TABLES `curso` WRITE;
/*!40000 ALTER TABLE `curso` DISABLE KEYS */;
INSERT INTO `curso` VALUES (1,'TSIW',3),(2,'Design Grafico',1),(3,'Design Industrial',1),(4,'Multimedia',2);
/*!40000 ALTER TABLE `curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamento`
--

DROP TABLE IF EXISTS `departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departamento` (
  `idDepartamento` int(2) NOT NULL,
  `descDepartamento` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idDepartamento`),
  KEY `departamento2` (`descDepartamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamento`
--

LOCK TABLES `departamento` WRITE;
/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;
INSERT INTO `departamento` VALUES (1,'Design'),(2,'Multimedia'),(3,'Tecnologia');
/*!40000 ALTER TABLE `departamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipamento`
--

DROP TABLE IF EXISTS `equipamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equipamento` (
  `idEquipamento` int(3) NOT NULL,
  `descEquipamento` varchar(45) DEFAULT NULL,
  `idEstado` int(2) DEFAULT NULL,
  `idCategoria` int(2) DEFAULT NULL,
  PRIMARY KEY (`idEquipamento`),
  KEY `estado2_idx` (`idEstado`),
  KEY `categoria_idx` (`idCategoria`),
  CONSTRAINT `categoria` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `estado2` FOREIGN KEY (`idEstado`) REFERENCES `estado` (`idEstado`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipamento`
--

LOCK TABLES `equipamento` WRITE;
/*!40000 ALTER TABLE `equipamento` DISABLE KEYS */;
INSERT INTO `equipamento` VALUES (1,'Camera Preta',2,2),(2,'Projetor Pequeno',2,4),(3,'Lapis de Cera',1,1),(4,'Colunas',3,4),(5,'Camera Branca',4,2),(6,'Rato',2,3),(7,'Projetor Grande',2,4),(8,'Cabo HDMI',1,3),(9,'Calculadora',2,3),(10,'Auscultadores',2,3);
/*!40000 ALTER TABLE `equipamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado`
--

DROP TABLE IF EXISTS `estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estado` (
  `idEstado` int(2) NOT NULL,
  `descEstado` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idEstado`),
  KEY `estado` (`descEstado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado`
--

LOCK TABLES `estado` WRITE;
/*!40000 ALTER TABLE `estado` DISABLE KEYS */;
INSERT INTO `estado` VALUES (3,'Avariado'),(1,'Disponivel'),(4,'Manutenção'),(2,'Requisitado');
/*!40000 ALTER TABLE `estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estatuto`
--

DROP TABLE IF EXISTS `estatuto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estatuto` (
  `idEstatuto` int(2) NOT NULL,
  `descEstatuto` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idEstatuto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estatuto`
--

LOCK TABLES `estatuto` WRITE;
/*!40000 ALTER TABLE `estatuto` DISABLE KEYS */;
INSERT INTO `estatuto` VALUES (1,'Docente'),(2,'Estudante');
/*!40000 ALTER TABLE `estatuto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estatuto_equipamento`
--

DROP TABLE IF EXISTS `estatuto_equipamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estatuto_equipamento` (
  `idEstatuto` int(2) NOT NULL,
  `idEquipamento` int(2) NOT NULL,
  PRIMARY KEY (`idEstatuto`,`idEquipamento`),
  KEY `equipamento_idx` (`idEquipamento`),
  CONSTRAINT `equipamento` FOREIGN KEY (`idEquipamento`) REFERENCES `equipamento` (`idEquipamento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `estatuto2` FOREIGN KEY (`idEstatuto`) REFERENCES `estatuto` (`idEstatuto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estatuto_equipamento`
--

LOCK TABLES `estatuto_equipamento` WRITE;
/*!40000 ALTER TABLE `estatuto_equipamento` DISABLE KEYS */;
INSERT INTO `estatuto_equipamento` VALUES (2,1),(1,2),(2,3),(1,4),(2,5),(2,6),(1,7),(1,8),(2,9),(2,10);
/*!40000 ALTER TABLE `estatuto_equipamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lista_equipamento`
--

DROP TABLE IF EXISTS `lista_equipamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lista_equipamento` (
  `idRequisicao` int(3) NOT NULL,
  `idEquipamento` int(3) NOT NULL,
  KEY `equip_idx` (`idEquipamento`),
  KEY `requisicao_idx` (`idRequisicao`),
  CONSTRAINT `equip` FOREIGN KEY (`idEquipamento`) REFERENCES `equipamento` (`idEquipamento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `requisicao` FOREIGN KEY (`idRequisicao`) REFERENCES `requisicao` (`idRequisicao`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lista_equipamento`
--

LOCK TABLES `lista_equipamento` WRITE;
/*!40000 ALTER TABLE `lista_equipamento` DISABLE KEYS */;
INSERT INTO `lista_equipamento` VALUES (1,3),(2,7),(3,3),(4,8),(5,2),(6,10),(7,3),(8,9),(9,7),(10,2),(11,10),(12,6),(13,1),(14,4),(15,6);
/*!40000 ALTER TABLE `lista_equipamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requisicao`
--

DROP TABLE IF EXISTS `requisicao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `requisicao` (
  `idRequisicao` int(3) NOT NULL,
  `estado` varchar(45) DEFAULT NULL,
  `data_levantamento` date DEFAULT NULL,
  `data_entrega` date DEFAULT NULL,
  PRIMARY KEY (`idRequisicao`),
  KEY `req` (`idRequisicao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requisicao`
--

LOCK TABLES `requisicao` WRITE;
/*!40000 ALTER TABLE `requisicao` DISABLE KEYS */;
INSERT INTO `requisicao` VALUES (1,'Entregue','2018-01-03','2018-01-05'),(2,'Entregue','2018-01-03','2018-01-03'),(3,'Recusada','2018-01-04','2018-01-10'),(4,'Entregue','2018-01-05','2018-01-09'),(5,'Recusada','2018-01-05','2018-01-05'),(6,'Entregue','2018-01-10','2018-01-11'),(7,'Entregue','2018-01-12','2018-01-17'),(8,'Em Curso','2018-01-15','2018-01-26'),(9,'Em Curso','2018-01-22','2018-01-26'),(10,'Em Curso','2018-01-22','2018-01-24'),(11,'Em Curso','2018-01-22','2018-01-23'),(12,'Atrasada','2018-01-18','2018-01-19'),(13,'Em Curso','2018-01-22','2018-01-25'),(14,'Recusada','2018-01-22','2018-01-23'),(15,'Em Espera','2018-01-23','2018-01-23'),(16,'Entregue','2018-01-11','2018-01-22');
/*!40000 ALTER TABLE `requisicao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requisicao_utente`
--

DROP TABLE IF EXISTS `requisicao_utente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `requisicao_utente` (
  `idRequisicao` int(3) NOT NULL,
  `idUtente` int(2) DEFAULT NULL,
  `aprovacao` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idRequisicao`),
  KEY `utente_idx` (`idUtente`),
  KEY `utente2_idx` (`idUtente`),
  CONSTRAINT `req` FOREIGN KEY (`idRequisicao`) REFERENCES `requisicao` (`idRequisicao`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `utente2` FOREIGN KEY (`idUtente`) REFERENCES `utente` (`idUtente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requisicao_utente`
--

LOCK TABLES `requisicao_utente` WRITE;
/*!40000 ALTER TABLE `requisicao_utente` DISABLE KEYS */;
INSERT INTO `requisicao_utente` VALUES (1,3,'Aprovada'),(2,1,'Aprovada'),(3,5,'Recusada'),(4,1,'Aprovada'),(5,2,'Recusada'),(6,4,'Aprovada'),(7,3,'Aprovada'),(8,5,'Aprovada'),(9,2,'Aprovada'),(10,1,'Aprovada'),(11,4,'Aprovada'),(12,5,'Aprovada'),(13,3,'Aprovada'),(14,4,'Recusada'),(15,2,'Em Espera');
/*!40000 ALTER TABLE `requisicao_utente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utente`
--

DROP TABLE IF EXISTS `utente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `utente` (
  `idUtente` int(8) NOT NULL,
  `nome` varchar(45) DEFAULT NULL,
  `idEstatuto` int(2) DEFAULT NULL,
  `idCurso` int(2) DEFAULT NULL,
  `morada` varchar(45) DEFAULT NULL,
  `codPostal` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`idUtente`),
  KEY `idcurso_idx` (`idCurso`),
  KEY `estatuto_idx` (`idEstatuto`),
  KEY `cpostal_idx` (`codPostal`),
  CONSTRAINT `cpostal` FOREIGN KEY (`codPostal`) REFERENCES `codigo_postal` (`codPostal`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `estatuto` FOREIGN KEY (`idEstatuto`) REFERENCES `estatuto` (`idEstatuto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idcurso` FOREIGN KEY (`idCurso`) REFERENCES `curso` (`idCurso`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utente`
--

LOCK TABLES `utente` WRITE;
/*!40000 ALTER TABLE `utente` DISABLE KEYS */;
INSERT INTO `utente` VALUES (1,'Hugo Barreiro',1,1,'Rua A ','4455-828'),(2,'Sebastião Barros',1,3,'Rua B','4150-629'),(3,'André Gonçalves',2,2,'Rua C','4445-145'),(4,'Matilde Valente',2,4,'Rua D','4150-708'),(5,'Diogo Falcão',2,1,'Rua E','4250-047');
/*!40000 ALTER TABLE `utente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `v_categorias_equipamento`
--

DROP TABLE IF EXISTS `v_categorias_equipamento`;
/*!50001 DROP VIEW IF EXISTS `v_categorias_equipamento`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_categorias_equipamento` AS SELECT 
 1 AS `Categoria`,
 1 AS `Equipamento`,
 1 AS `ID`,
 1 AS `Estado`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_data_req`
--

DROP TABLE IF EXISTS `v_data_req`;
/*!50001 DROP VIEW IF EXISTS `v_data_req`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_data_req` AS SELECT 
 1 AS `idRequisicao`,
 1 AS `descEquipamento`,
 1 AS `data_levantamento`,
 1 AS `data_entrega`,
 1 AS `nome`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_detalhes_requisicao`
--

DROP TABLE IF EXISTS `v_detalhes_requisicao`;
/*!50001 DROP VIEW IF EXISTS `v_detalhes_requisicao`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_detalhes_requisicao` AS SELECT 
 1 AS `idRequisicao`,
 1 AS `descEquipamento`,
 1 AS `nome`,
 1 AS `aprovacao`,
 1 AS `estado`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_estado_equipamentos`
--

DROP TABLE IF EXISTS `v_estado_equipamentos`;
/*!50001 DROP VIEW IF EXISTS `v_estado_equipamentos`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_estado_equipamentos` AS SELECT 
 1 AS `idEquipamento`,
 1 AS `descEquipamento`,
 1 AS `descEstado`,
 1 AS `descCategoria`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_estado_req`
--

DROP TABLE IF EXISTS `v_estado_req`;
/*!50001 DROP VIEW IF EXISTS `v_estado_req`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_estado_req` AS SELECT 
 1 AS `idRequisicao`,
 1 AS `estado`,
 1 AS `nome`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_mais_req`
--

DROP TABLE IF EXISTS `v_mais_req`;
/*!50001 DROP VIEW IF EXISTS `v_mais_req`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_mais_req` AS SELECT 
 1 AS `idEquipamento`,
 1 AS `descEquipamento`,
 1 AS `numero`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_utente_req`
--

DROP TABLE IF EXISTS `v_utente_req`;
/*!50001 DROP VIEW IF EXISTS `v_utente_req`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_utente_req` AS SELECT 
 1 AS `idRequisicao`,
 1 AS `nome`,
 1 AS `idUtente`,
 1 AS `descEstatuto`,
 1 AS `descCurso`,
 1 AS `descDepartamento`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'cenarioc'
--
/*!50003 DROP PROCEDURE IF EXISTS `pr_acessibilidade` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pr_acessibilidade`()
BEGIN
declare done boolean default 0;
declare idEquipamento int(2);
declare descEquipamento varchar(45);
declare idEstatuto int(2);
declare acessibilidade varchar(45);


declare c_acessibilidade cursor for


select equipamento.idEquipamento, equipamento.descEquipamento, estatuto_equipamento.idEstatuto from equipamento, estatuto_equipamento 
where equipamento.idEquipamento = estatuto_equipamento.idEquipamento;

declare continue handler for not found set done = 1;


create table if not exists acessibilidade (idEquipamento int(2), descEquipamento varchar(45), acessibilidade varchar(45));
open c_acessibilidade;

repeat

fetch c_acessibilidade into idEquipamento, descEquipamento, idEstatuto;

if estatuto_equipamento.idEstatuto = 2 then set acessibilidade = "Docentes e estudantes";
else set acessibilidade = "Apenas docentes";
end if;

insert into acessibilidade values(idEquipamento, descEquipamento, acessibilidade);
    
until done END repeat;



close c_acessibilidade;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `v_categorias_equipamento`
--

/*!50001 DROP VIEW IF EXISTS `v_categorias_equipamento`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_categorias_equipamento` AS select `categoria`.`descCategoria` AS `Categoria`,`equipamento`.`descEquipamento` AS `Equipamento`,`equipamento`.`idEquipamento` AS `ID`,`estado`.`descEstado` AS `Estado` from ((`categoria` join `equipamento`) join `estado`) where ((`categoria`.`idCategoria` = `equipamento`.`idCategoria`) and (`equipamento`.`idEstado` = `estado`.`idEstado`)) order by `categoria`.`descCategoria`,`equipamento`.`descEquipamento` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_data_req`
--

/*!50001 DROP VIEW IF EXISTS `v_data_req`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_data_req` AS select `requisicao`.`idRequisicao` AS `idRequisicao`,`equipamento`.`descEquipamento` AS `descEquipamento`,`requisicao`.`data_levantamento` AS `data_levantamento`,`requisicao`.`data_entrega` AS `data_entrega`,`utente`.`nome` AS `nome` from ((((`equipamento` join `requisicao`) join `lista_equipamento`) join `utente`) join `requisicao_utente`) where ((`utente`.`idUtente` = `requisicao_utente`.`idUtente`) and (`requisicao_utente`.`idRequisicao` = `requisicao`.`idRequisicao`) and (`requisicao`.`idRequisicao` = `lista_equipamento`.`idRequisicao`) and (`lista_equipamento`.`idEquipamento` = `equipamento`.`idEquipamento`)) order by `requisicao`.`idRequisicao` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_detalhes_requisicao`
--

/*!50001 DROP VIEW IF EXISTS `v_detalhes_requisicao`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_detalhes_requisicao` AS select `requisicao`.`idRequisicao` AS `idRequisicao`,`equipamento`.`descEquipamento` AS `descEquipamento`,`utente`.`nome` AS `nome`,`requisicao_utente`.`aprovacao` AS `aprovacao`,`requisicao`.`estado` AS `estado` from ((((`utente` join `requisicao_utente`) join `requisicao`) join `lista_equipamento`) join `equipamento`) where ((`utente`.`idUtente` = `requisicao_utente`.`idUtente`) and (`requisicao_utente`.`idRequisicao` = `requisicao`.`idRequisicao`) and (`requisicao`.`idRequisicao` = `lista_equipamento`.`idRequisicao`) and (`lista_equipamento`.`idEquipamento` = `equipamento`.`idEquipamento`)) order by `requisicao`.`idRequisicao` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_estado_equipamentos`
--

/*!50001 DROP VIEW IF EXISTS `v_estado_equipamentos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_estado_equipamentos` AS select `equipamento`.`idEquipamento` AS `idEquipamento`,`equipamento`.`descEquipamento` AS `descEquipamento`,`estado`.`descEstado` AS `descEstado`,`categoria`.`descCategoria` AS `descCategoria` from ((`equipamento` join `estado`) join `categoria`) where ((`equipamento`.`idEstado` = `estado`.`idEstado`) and (`equipamento`.`idCategoria` = `categoria`.`idCategoria`)) group by `equipamento`.`descEquipamento` order by `equipamento`.`idEquipamento` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_estado_req`
--

/*!50001 DROP VIEW IF EXISTS `v_estado_req`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_estado_req` AS select `requisicao`.`idRequisicao` AS `idRequisicao`,`requisicao`.`estado` AS `estado`,`utente`.`nome` AS `nome` from ((`utente` join `requisicao_utente`) join `requisicao`) where ((`requisicao_utente`.`idUtente` = `utente`.`idUtente`) and (`requisicao`.`idRequisicao` = `requisicao_utente`.`idRequisicao`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_mais_req`
--

/*!50001 DROP VIEW IF EXISTS `v_mais_req`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_mais_req` AS select `equipamento`.`idEquipamento` AS `idEquipamento`,`equipamento`.`descEquipamento` AS `descEquipamento`,count(`lista_equipamento`.`idEquipamento`) AS `numero` from (((`equipamento` join `lista_equipamento`) join `requisicao_utente`) join `requisicao`) where ((`equipamento`.`idEquipamento` = `lista_equipamento`.`idEquipamento`) and (`lista_equipamento`.`idRequisicao` = `requisicao`.`idRequisicao`) and (`requisicao_utente`.`idRequisicao` = `requisicao`.`idRequisicao`) and (`requisicao_utente`.`aprovacao` like 'Aprovada')) group by `equipamento`.`descEquipamento` order by count(`lista_equipamento`.`idEquipamento`) desc,`equipamento`.`descEquipamento` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_utente_req`
--

/*!50001 DROP VIEW IF EXISTS `v_utente_req`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_utente_req` AS select `requisicao_utente`.`idRequisicao` AS `idRequisicao`,`utente`.`nome` AS `nome`,`utente`.`idUtente` AS `idUtente`,`estatuto`.`descEstatuto` AS `descEstatuto`,`curso`.`descCurso` AS `descCurso`,`departamento`.`descDepartamento` AS `descDepartamento` from ((((`utente` join `curso`) join `departamento`) join `requisicao_utente`) join `estatuto`) where ((`utente`.`idUtente` = `requisicao_utente`.`idUtente`) and (`utente`.`idCurso` = `curso`.`idCurso`) and (`curso`.`codDepartamento` = `departamento`.`idDepartamento`) and (`utente`.`idEstatuto` = `estatuto`.`idEstatuto`)) order by `requisicao_utente`.`idRequisicao` */;
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

-- Dump completed on 2018-01-22 18:57:53
