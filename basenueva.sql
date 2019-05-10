CREATE DATABASE proyecto2019_5
USE proyecto2019_5


CREATE TABLE `tiposequipo` (
  `IdTipo` INT(10) NOT NULL AUTO_INCREMENT,
  `Tipo` VARCHAR(75) NOT NULL,
  PRIMARY KEY (`IdTipo`)
) ENGINE=INNODB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1


TABLE	CREATE TABLE
carreras	CREATE TABLE `carreras` (
  `IdCarrera` INT(5) NOT NULL AUTO_INCREMENT,
  `Carrera` VARCHAR(75) NOT NULL,
  PRIMARY KEY (`IdCarrera`),
  UNIQUE KEY `Carrera` (`Carrera`)
) ENGINE=INNODB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1



TABLE	CREATE TABLE
aulas	CREATE TABLE `aulas` (
  `IdAula` INT(4) NOT NULL AUTO_INCREMENT,
  `Aula` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`IdAula`),
  UNIQUE KEY `Aula` (`Aula`)
) ENGINE=INNODB DEFAULT CHARSET=latin1



TABLE	CREATE TABLE
marcas	CREATE TABLE `marcas` (
  `IdMarca` INT(10) NOT NULL AUTO_INCREMENT,
  `Marca` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`IdMarca`),
  UNIQUE KEY `Marca` (`Marca`)
) ENGINE=INNODB DEFAULT CHARSET=latin1



CREATE TABLE `modelos` (
  `IdModelo` INT(10) NOT NULL AUTO_INCREMENT,
  `Modelo` VARCHAR(100) NOT NULL,
  `IdMarca` INT(10) DEFAULT NULL,
  PRIMARY KEY (`IdModelo`),
  KEY `fk_idmarca2` (`IdMarca`),
  CONSTRAINT `fk_idmarca2` FOREIGN KEY (`IdMarca`) REFERENCES `marcas` (`IdMarca`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=INNODB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1



TABLE	CREATE TABLE
usuarios	CREATE TABLE `usuarios` (
  `IdUsuario` INT(10) NOT NULL AUTO_INCREMENT,
  `Carnet` VARCHAR(8) NOT NULL,
  `Nombre` VARCHAR(100) NOT NULL,
  `Apellido` VARCHAR(100) NOT NULL,
  `E_mail` VARCHAR(75) NOT NULL,
  `Direccion` BLOB,
  `Fecha_Nacimiento` DATE NOT NULL,
  `Fotografia` VARCHAR(70) DEFAULT 'img/vacio.jpg',
  `Tipo` VARCHAR(75) NOT NULL,
  `IdCarrera` INT(5) NOT NULL,
  `Contra` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`IdUsuario`),
  UNIQUE KEY `Contraseña` (`Contra`),
  KEY `fk_IdCarrera` (`IdCarrera`),
  CONSTRAINT `fk_IdCarrera` FOREIGN KEY (`IdCarrera`) REFERENCES `carreras` (`IdCarrera`)
) ENGINE=INNODB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1



CREATE TABLE `equipos` (
  `IdEquipo` INT(10) NOT NULL AUTO_INCREMENT,
  `NombreEquipo` VARCHAR(100) NOT NULL,
  `IdMarca` INT(10) NOT NULL,
  `IdModelo` INT(10) NOT NULL,
  `IdTipo` INT(10) NOT NULL,
  `Descripcion` BLOB NOT NULL,
  `NumeroSerie` VARCHAR(75) NOT NULL,
  `IdCarrera` INT(5) NOT NULL,
  `Estado` VARCHAR(75) NOT NULL DEFAULT 'Disponible',
  `Fecha_Registro` DATE NOT NULL,
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
) ENGINE=INNODB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1




CREATE TABLE `fallas_equipo` (
  `IdFalla` INT(10) NOT NULL AUTO_INCREMENT,
  `IdEquipo` INT(10) NOT NULL,
  `Descripcion` BLOB NOT NULL,
  `Fechareporte` DATE NOT NULL,
  PRIMARY KEY (`IdFalla`),
  KEY `Cod_Equipo` (`IdFalla`),
  KEY `fk_IdEquipo` (`IdEquipo`),
  CONSTRAINT `fk_IdEquipo` FOREIGN KEY (`IdEquipo`) REFERENCES `equipos` (`IdEquipo`)
) ENGINE=INNODB DEFAULT CHARSET=latin1



TABLE	CREATE TABLE
horarios_prestamo	CREATE TABLE `horarios_prestamo` (
  `IdHorario` INT(10) NOT NULL AUTO_INCREMENT,
  `HoraInicio` TIME NOT NULL,
  `HoraFinal` TIME NOT NULL,
  `Fecha` DATE NOT NULL,
  `HoraTotal` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`IdHorario`)
) ENGINE=INNODB DEFAULT CHARSET=latin1



TABLE	CREATE TABLE
prestamos	CREATE TABLE `prestamos` (
  `IdPrestamo` INT(10) NOT NULL AUTO_INCREMENT,
  `IdEquipo` INT(10) NOT NULL,
  `IdUsuario` INT(10) NOT NULL,
  `IdAula` INT(4) NOT NULL,
  PRIMARY KEY (`IdPrestamo`),
  KEY `fk_IdEquipoPrestado` (`IdEquipo`),
  KEY `fk_IdUsuario` (`IdUsuario`),
  KEY `fk_IdAulaPrestamo` (`IdAula`),
  CONSTRAINT `fk_IdAulaPrestamo` FOREIGN KEY (`IdAula`) REFERENCES `aulas` (`IdAula`),
  CONSTRAINT `fk_IdEquipoPrestado` FOREIGN KEY (`IdEquipo`) REFERENCES `equipos` (`IdEquipo`),
  CONSTRAINT `fk_IdUsuario` FOREIGN KEY (`IdUsuario`) REFERENCES `usuarios` (`IdUsuario`)
) ENGINE=INNODB DEFAULT CHARSET=latin1



TABLE	CREATE TABLE
descripcionprestamo	CREATE TABLE `descripcionprestamo` (
  `IdDescripcionPrestamo` INT(10) NOT NULL AUTO_INCREMENT,
  `IdPrestamo` INT(10) NOT NULL,
  `IdHorario` INT(10) NOT NULL,
  `Estado` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`IdDescripcionPrestamo`),
  KEY `fk_IdPrestamo` (`IdPrestamo`),
  KEY `fk_IdHorario` (`IdHorario`),
  CONSTRAINT `fk_IdHorario` FOREIGN KEY (`IdHorario`) REFERENCES `horarios_prestamo` (`IdHorario`),
  CONSTRAINT `fk_IdPrestamo` FOREIGN KEY (`IdPrestamo`) REFERENCES `prestamos` (`IdPrestamo`)
) ENGINE=INNODB DEFAULT CHARSET=latin1

