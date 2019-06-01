/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.5.5-10.1.38-MariaDB : Database - proyecto2019_5
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`proyecto2019_5` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `proyecto2019_5`;

/*Table structure for table `aulas` */

DROP TABLE IF EXISTS `aulas`;

CREATE TABLE `aulas` (
  `IdAula` int(4) NOT NULL AUTO_INCREMENT,
  `Aula` varchar(50) NOT NULL,
  PRIMARY KEY (`IdAula`),
  UNIQUE KEY `Aula` (`Aula`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*Data for the table `aulas` */

insert  into `aulas`(`IdAula`,`Aula`) values (5,'101'),(6,'102'),(7,'103'),(8,'C101'),(9,'C102');

/*Table structure for table `carreras` */

DROP TABLE IF EXISTS `carreras`;

CREATE TABLE `carreras` (
  `IdCarrera` int(5) NOT NULL AUTO_INCREMENT,
  `Carrera` varchar(100) NOT NULL,
  PRIMARY KEY (`IdCarrera`),
  UNIQUE KEY `Carrera` (`Carrera`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*Data for the table `carreras` */

insert  into `carreras`(`IdCarrera`,`Carrera`) values (7,'Electrica'),(6,'Mantenimiento'),(5,'Patrimonio'),(4,'Sistemas');

/*Table structure for table `equipos` */

DROP TABLE IF EXISTS `equipos`;

CREATE TABLE `equipos` (
  `IdEquipo` int(10) NOT NULL AUTO_INCREMENT,
  `NombreEquipo` varchar(100) NOT NULL,
  `IdMarca` int(10) NOT NULL,
  `IdModelo` int(10) NOT NULL,
  `IdTipo` int(10) NOT NULL,
  `Descripcion` blob,
  `NumeroSerie` varchar(75) NOT NULL,
  `IdCarrera` int(5) NOT NULL,
  `Estado` varchar(75) NOT NULL DEFAULT 'Disponible',
  `Fecha_Registro` date NOT NULL,
  PRIMARY KEY (`IdEquipo`),
  UNIQUE KEY `NumeroSerie` (`NumeroSerie`),
  KEY `fk_IdModelo` (`IdModelo`),
  KEY `fk_IdCarreraEquipo` (`IdCarrera`),
  KEY `fk_IdMarca` (`IdMarca`),
  KEY `fk_tipo` (`IdTipo`),
  CONSTRAINT `fk_IdCarreraEquipo` FOREIGN KEY (`IdCarrera`) REFERENCES `carreras` (`IdCarrera`),
  CONSTRAINT `fk_IdMarca` FOREIGN KEY (`IdMarca`) REFERENCES `marcas` (`IdMarca`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_IdModelo` FOREIGN KEY (`IdModelo`) REFERENCES `modelos` (`IdModelo`),
  CONSTRAINT `fk_tipo` FOREIGN KEY (`IdTipo`) REFERENCES `tiposequipo` (`IdTipo`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

/*Data for the table `equipos` */

insert  into `equipos`(`IdEquipo`,`NombreEquipo`,`IdMarca`,`IdModelo`,`IdTipo`,`Descripcion`,`NumeroSerie`,`IdCarrera`,`Estado`,`Fecha_Registro`) values (5,'Computadora1',5,11,8,'disco duro amplio','1',4,'Disponible','2019-05-26'),(6,'Computadora2',8,9,8,'doble tarjeta grafica','2',5,'Disponible','2019-05-26'),(7,'Mouse',8,9,9,'innhalambrico','3',7,'Disponible','2019-05-26'),(8,'Pantalla1',9,12,11,'LG','4',6,'Disponible','2019-05-26'),(9,'Computadora3',10,6,8,'knlknsñvn','12345',6,'Disponible','2019-05-27'),(10,'Computadora4',9,12,8,'klvndld,bnv ','88900',7,'Disponible','2019-05-27'),(11,'Computadora5',5,11,8,'nfbvkjdbvldvn ','1111-1111-1112',4,'Disponible','2019-05-27'),(12,'Computadora6',5,11,8,'','9999999999999',7,'Disponible','2019-05-27');

/*Table structure for table `fallas_equipo` */

DROP TABLE IF EXISTS `fallas_equipo`;

CREATE TABLE `fallas_equipo` (
  `IdFalla` int(10) NOT NULL AUTO_INCREMENT,
  `IdEquipo` int(10) NOT NULL,
  `Descripcion` blob NOT NULL,
  `Fechareporte` date NOT NULL,
  PRIMARY KEY (`IdFalla`),
  KEY `Cod_Equipo` (`IdFalla`),
  KEY `fk_IdEquipo` (`IdEquipo`),
  CONSTRAINT `fk_IdEquipo` FOREIGN KEY (`IdEquipo`) REFERENCES `equipos` (`IdEquipo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `fallas_equipo` */

insert  into `fallas_equipo`(`IdFalla`,`IdEquipo`,`Descripcion`,`Fechareporte`) values (1,7,'falla numero 2','2019-05-28'),(2,7,'le falla el click derecho','2019-05-29');

/*Table structure for table `horarios_prestamo` */

DROP TABLE IF EXISTS `horarios_prestamo`;

CREATE TABLE `horarios_prestamo` (
  `IdHorario` int(10) NOT NULL AUTO_INCREMENT,
  `HoraI` time NOT NULL,
  `HoraF` time NOT NULL,
  PRIMARY KEY (`IdHorario`),
  UNIQUE KEY `Hora` (`HoraI`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=latin1;

/*Data for the table `horarios_prestamo` */

insert  into `horarios_prestamo`(`IdHorario`,`HoraI`,`HoraF`) values (67,'07:00:00','08:40:00'),(68,'08:40:00','10:40:00'),(69,'10:40:00','11:25:00'),(70,'11:30:00','12:20:00'),(71,'13:00:00','14:40:00'),(72,'14:40:00','15:30:00'),(73,'15:30:00','16:20:00'),(74,'16:20:00','17:10:00');

/*Table structure for table `marcas` */

DROP TABLE IF EXISTS `marcas`;

CREATE TABLE `marcas` (
  `IdMarca` int(10) NOT NULL AUTO_INCREMENT,
  `Marca` varchar(100) NOT NULL,
  PRIMARY KEY (`IdMarca`),
  UNIQUE KEY `Marca` (`Marca`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Data for the table `marcas` */

insert  into `marcas`(`IdMarca`,`Marca`) values (10,'Apple'),(7,'Canon'),(8,'Dell'),(5,'HP'),(9,'Sansumg');

/*Table structure for table `modelos` */

DROP TABLE IF EXISTS `modelos`;

CREATE TABLE `modelos` (
  `IdModelo` int(10) NOT NULL AUTO_INCREMENT,
  `Modelo` varchar(100) NOT NULL,
  `IdMarca` int(10) DEFAULT NULL,
  PRIMARY KEY (`IdModelo`),
  KEY `fk_idmarca2` (`IdMarca`),
  CONSTRAINT `fk_idmarca2` FOREIGN KEY (`IdMarca`) REFERENCES `marcas` (`IdMarca`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

/*Data for the table `modelos` */

insert  into `modelos`(`IdModelo`,`Modelo`,`IdMarca`) values (5,'A',10),(6,'B',10),(7,'A',7),(8,'B',7),(9,'A',8),(10,'50',8),(11,'200X',5),(12,'XP',9);

/*Table structure for table `prestamos` */

DROP TABLE IF EXISTS `prestamos`;

CREATE TABLE `prestamos` (
  `IdPrestamo` int(10) NOT NULL AUTO_INCREMENT,
  `IdEquipo` int(10) NOT NULL,
  `IdUsuario` int(10) NOT NULL,
  `IdAula` int(4) NOT NULL,
  `Fecha` date NOT NULL,
  `HoraInicio` time NOT NULL,
  `HoraFin` time NOT NULL,
  `HoraTotal` varchar(100) NOT NULL,
  `EstadoPrestamo` varchar(100) NOT NULL DEFAULT 'Activo',
  PRIMARY KEY (`IdPrestamo`),
  KEY `fk_IdEquipoPrestado` (`IdEquipo`),
  KEY `fk_IdUsuario` (`IdUsuario`),
  KEY `fk_IdAulaPrestamo` (`IdAula`),
  CONSTRAINT `fk_IdAulaPrestamo` FOREIGN KEY (`IdAula`) REFERENCES `aulas` (`IdAula`),
  CONSTRAINT `fk_IdEquipoPrestado` FOREIGN KEY (`IdEquipo`) REFERENCES `equipos` (`IdEquipo`),
  CONSTRAINT `fk_IdUsuario` FOREIGN KEY (`IdUsuario`) REFERENCES `usuarios` (`IdUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=latin1;

/*Data for the table `prestamos` */

insert  into `prestamos`(`IdPrestamo`,`IdEquipo`,`IdUsuario`,`IdAula`,`Fecha`,`HoraInicio`,`HoraFin`,`HoraTotal`,`EstadoPrestamo`) values (74,5,144,5,'2019-05-26','07:00:00','11:30:00','07:00:00Am-11:30:00Am','No Activo'),(75,5,145,5,'2019-05-26','11:30:00','12:20:00','11:30:00Am-12:20:00Pm','No Activo'),(81,5,145,5,'2019-05-26','11:30:00','12:20:00','11:30:00Am-12:20:00Pm','No Activo'),(82,5,144,5,'2019-05-27','07:00:00','10:40:00','07:00:00Am-10:40:00Am','No Activo'),(83,5,145,5,'2019-05-27','10:40:00','11:30:00','10:40:00Am-11:30:00Am','Activo'),(84,8,144,5,'2019-05-28','15:30:00','16:20:00','15:30:00Pm-16:20:00Pm','No Activo'),(85,11,144,5,'2019-06-12','07:00:00','08:40:00','07:00:00Am-08:40:00Am','No Activo'),(86,12,144,5,'2019-06-29','07:00:00','08:40:00','07:00:00Am-08:40:00Am','No Activo'),(87,5,144,5,'2019-07-20','07:00:00','08:40:00','07:00:00Am-08:40:00Am','No Activo'),(88,10,144,5,'2019-06-23','07:00:00','08:40:00','07:00:00Am-08:40:00Am','No Activo'),(89,5,144,5,'2019-07-31','07:00:00','08:40:00','07:00:00Am-08:40:00Am','No Activo');

/*Table structure for table `tiposequipo` */

DROP TABLE IF EXISTS `tiposequipo`;

CREATE TABLE `tiposequipo` (
  `IdTipo` int(10) NOT NULL AUTO_INCREMENT,
  `Tipo` varchar(75) NOT NULL,
  PRIMARY KEY (`IdTipo`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

/*Data for the table `tiposequipo` */

insert  into `tiposequipo`(`IdTipo`,`Tipo`) values (8,'Computadora'),(9,'Mouse'),(10,'Teclado'),(11,'Pantalla'),(12,'Proyector'),(13,'Cable'),(14,'Microfono');

/*Table structure for table `usuarios` */

DROP TABLE IF EXISTS `usuarios`;

CREATE TABLE `usuarios` (
  `IdUsuario` int(10) NOT NULL AUTO_INCREMENT,
  `Carnet` varchar(6) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Apellido` varchar(100) NOT NULL,
  `E_mail` varchar(75) NOT NULL,
  `Direccion` blob,
  `Fecha_Nacimiento` date DEFAULT NULL,
  `Fotografia` varchar(100) DEFAULT 'img/vacio.jpg',
  `Tipo` varchar(75) NOT NULL DEFAULT 'Docente',
  `IdCarrera` int(5) DEFAULT NULL,
  `Contra` varchar(500) NOT NULL,
  `Estado` varchar(75) NOT NULL DEFAULT 'Activo',
  PRIMARY KEY (`IdUsuario`),
  UNIQUE KEY `Contraseña` (`Contra`),
  KEY `fk_IdCarrera` (`IdCarrera`),
  CONSTRAINT `fk_IdCarrera` FOREIGN KEY (`IdCarrera`) REFERENCES `carreras` (`IdCarrera`)
) ENGINE=InnoDB AUTO_INCREMENT=148 DEFAULT CHARSET=latin1;

/*Data for the table `usuarios` */

insert  into `usuarios`(`IdUsuario`,`Carnet`,`Nombre`,`Apellido`,`E_mail`,`Direccion`,`Fecha_Nacimiento`,`Fotografia`,`Tipo`,`IdCarrera`,`Contra`,`Estado`) values (140,'030418','Tatiana Gabriela','Portillo vasquez              ','tatyaguilar000@gmail.com','El Congo Santa Ana, El Salvador','1999-10-14','img/1559180122-tati.gif','Administrador',4,'973825074d20ddd5bd74f93d2f3b2bb1b548465d15e26e5d335ee7999e144fd74e505471d2095f04abc1fbf45e4de4c988c1352f451731c175c2123c968d497e','Activo'),(144,'201618','Carolina','Hernandez        ','carolina@gmail.com','Ahuachapan','1994-08-28','img/caro.jfif','Docente',4,'ccb6f7f8db163bcc6a53bb9614f9c3e008eb0ad5166b8513041fba2e01cfa58167b7ba745749077a73f2613c271741446090eeebdc188faf1b12e67ed94897e1','Activo'),(145,'123456','Oscar','Cruz','oscar@gmail.com',NULL,NULL,'img/vacio.jpg','Docente',5,'267c31fb9637eecd6deb48a7c31875831740996f548d6c7ddf08bf23eceaca19b10ed538d2639aa020c83e9a14553c0175e6cbc953f07ef0cb902c8b8fb6f9a2','Activo'),(146,'654321','Alejandra','Ortega ','alejandra@gmail.com','El Congo Santa Ana','2001-05-28','img/1558921791-foto2.jpg','Docente',6,'89704eddd35b42f6a23708a6018fbafbcd6e896738521cd608fe546ca2751e376b1f0a09541dc5ba8f9712e35fec924efe8512cc57be38447bc5b6a404149e96','Activo'),(147,'654321','Jsjxkj','Mnackjna','tatiana@gmail.com',NULL,NULL,'img/vacio.jpg','Docente',6,'5b6196e16e3bd8e7cd5afc42120698ade331ede69a42db9ef54adb4b01fe3d93f192fc00e7d48d6cf9a008dfaa9c05dacba89791203a9cdfbccee08e6b78e159','Activo');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
