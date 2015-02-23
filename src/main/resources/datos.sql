/*
MySQL Data Transfer
Source Host: localhost
Source Database: cine
Target Host: localhost
Target Database: cine
Date: 18/02/2015 09:08:43 p.m.
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for Asiento
-- ----------------------------
DROP TABLE IF EXISTS `Asiento`;
CREATE TABLE `Asiento` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `columna` varchar(255) DEFAULT NULL,
  `fila` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for Cartelera
-- ----------------------------
DROP TABLE IF EXISTS `Cartelera`;
CREATE TABLE `Cartelera` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `activo` tinyint(1) NOT NULL,
  `fechaFin` datetime NOT NULL,
  `fechaInicio` datetime NOT NULL,
  `proyeccion` varchar(255) NOT NULL,
  `subtitulada` tinyint(1) NOT NULL,
  `Pelicula_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_3tu01ku14slg4dfylgipvyalm` (`Pelicula_id`),
  CONSTRAINT `FK_3tu01ku14slg4dfylgipvyalm` FOREIGN KEY (`Pelicula_id`) REFERENCES `Pelicula` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for Cartelera_Funcion
-- ----------------------------
DROP TABLE IF EXISTS `Cartelera_Funcion`;
CREATE TABLE `Cartelera_Funcion` (
  `Cartelera_id` bigint(20) NOT NULL,
  `Funciones_id` bigint(20) NOT NULL,
  UNIQUE KEY `UK_trgbgo386fbxtk5l5b0uiuaqe` (`Funciones_id`),
  KEY `FK_trgbgo386fbxtk5l5b0uiuaqe` (`Funciones_id`),
  KEY `FK_57kx047fcrtookbkb4hghrmbk` (`Cartelera_id`),
  CONSTRAINT `FK_57kx047fcrtookbkb4hghrmbk` FOREIGN KEY (`Cartelera_id`) REFERENCES `Cartelera` (`id`),
  CONSTRAINT `FK_trgbgo386fbxtk5l5b0uiuaqe` FOREIGN KEY (`Funciones_id`) REFERENCES `Funcion` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for Cliente
-- ----------------------------
DROP TABLE IF EXISTS `Cliente`;
CREATE TABLE `Cliente` (
  `direccion` varchar(255) DEFAULT NULL,
  `generoPreferido` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`email`),
  KEY `FK_tfai0ea59ylhrubk6at672968` (`email`),
  CONSTRAINT `FK_tfai0ea59ylhrubk6at672968` FOREIGN KEY (`email`) REFERENCES `Usuario` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for Complejo
-- ----------------------------
DROP TABLE IF EXISTS `Complejo`;
CREATE TABLE `Complejo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `activo` tinyint(1) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for Complejo_Sala
-- ----------------------------
DROP TABLE IF EXISTS `Complejo_Sala`;
CREATE TABLE `Complejo_Sala` (
  `Complejo_id` bigint(20) NOT NULL,
  `Salas_id` bigint(20) NOT NULL,
  UNIQUE KEY `UK_1k0ac4dj2wcsgel541m778htl` (`Salas_id`),
  KEY `FK_1k0ac4dj2wcsgel541m778htl` (`Salas_id`),
  KEY `FK_o0dghabb3x4au72hg46ue3orn` (`Complejo_id`),
  CONSTRAINT `FK_o0dghabb3x4au72hg46ue3orn` FOREIGN KEY (`Complejo_id`) REFERENCES `Complejo` (`id`),
  CONSTRAINT `FK_1k0ac4dj2wcsgel541m778htl` FOREIGN KEY (`Salas_id`) REFERENCES `Sala` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for Entrada_reserva
-- ----------------------------
DROP TABLE IF EXISTS `Entrada_reserva`;
CREATE TABLE `Entrada_reserva` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cantidadEntrada` int(11) NOT NULL,
  `tipoEntrada` varchar(255) NOT NULL,
  `idPrecio` bigint(20) DEFAULT NULL,
  `idReserva` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_8uybilwuyyrb2p95r4sg3s2no` (`idPrecio`),
  KEY `FK_9x85ro7uco7ocf9l2iwp4x6p7` (`idReserva`),
  CONSTRAINT `FK_9x85ro7uco7ocf9l2iwp4x6p7` FOREIGN KEY (`idReserva`) REFERENCES `Reserva` (`id`),
  CONSTRAINT `FK_8uybilwuyyrb2p95r4sg3s2no` FOREIGN KEY (`idPrecio`) REFERENCES `Precio` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for FichaTecnica
-- ----------------------------
DROP TABLE IF EXISTS `FichaTecnica`;
CREATE TABLE `FichaTecnica` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `actores` varchar(255) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `director` varchar(255) NOT NULL,
  `urlTrailer` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for Funcion
-- ----------------------------
DROP TABLE IF EXISTS `Funcion`;
CREATE TABLE `Funcion` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `activo` tinyint(1) NOT NULL,
  `Horario_id` bigint(20) DEFAULT NULL,
  `Pelicula_id` bigint(20) DEFAULT NULL,
  `Sala_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_8pvjs7i4ll0dpt9mj5xi0wkyg` (`Horario_id`),
  KEY `FK_1we7nb6gob10vuwtw9na9wxpc` (`Pelicula_id`),
  KEY `FK_oaclbsaeaycmih0fwx14mudva` (`Sala_id`),
  CONSTRAINT `FK_oaclbsaeaycmih0fwx14mudva` FOREIGN KEY (`Sala_id`) REFERENCES `Sala` (`id`),
  CONSTRAINT `FK_1we7nb6gob10vuwtw9na9wxpc` FOREIGN KEY (`Pelicula_id`) REFERENCES `Pelicula` (`id`),
  CONSTRAINT `FK_8pvjs7i4ll0dpt9mj5xi0wkyg` FOREIGN KEY (`Horario_id`) REFERENCES `Horario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for Horario
-- ----------------------------
DROP TABLE IF EXISTS `Horario`;
CREATE TABLE `Horario` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `duracion` time NOT NULL,
  `horaFin` time NOT NULL,
  `horaInicio` time NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for Pelicula
-- ----------------------------
DROP TABLE IF EXISTS `Pelicula`;
CREATE TABLE `Pelicula` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `activo` tinyint(1) NOT NULL,
  `clasificacion` varchar(255) NOT NULL,
  `duracion` time NOT NULL,
  `fechaCreacion` datetime NOT NULL,
  `idioma` varchar(255) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `reposicion` tinyint(1) NOT NULL,
  `subs` tinyint(1) NOT NULL,
  `detalles_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ebk4h30rlxuq8v2252iu8ndm9` (`detalles_id`),
  CONSTRAINT `FK_ebk4h30rlxuq8v2252iu8ndm9` FOREIGN KEY (`detalles_id`) REFERENCES `FichaTecnica` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for Precio
-- ----------------------------
DROP TABLE IF EXISTS `Precio`;
CREATE TABLE `Precio` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `activo` tinyint(1) NOT NULL,
  `general` float NOT NULL,
  `mayor` float NOT NULL,
  `menor` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for Precios_Detalle
-- ----------------------------
DROP TABLE IF EXISTS `Precios_Detalle`;
CREATE TABLE `Precios_Detalle` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cantidad` int(11) NOT NULL,
  `idReserva` bigint(20) DEFAULT NULL,
  `tipoPrecio` varchar(255) DEFAULT NULL,
  `Precio_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_q95210j5tc3jd4002tyvrm5g2` (`Precio_id`),
  CONSTRAINT `FK_q95210j5tc3jd4002tyvrm5g2` FOREIGN KEY (`Precio_id`) REFERENCES `Precio` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for Promocion
-- ----------------------------
DROP TABLE IF EXISTS `Promocion`;
CREATE TABLE `Promocion` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `activo` tinyint(1) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `fechaFin` datetime NOT NULL,
  `fechaInicio` datetime NOT NULL,
  `nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for Promocion_Complejo
-- ----------------------------
DROP TABLE IF EXISTS `Promocion_Complejo`;
CREATE TABLE `Promocion_Complejo` (
  `Promocion_id` bigint(20) NOT NULL,
  `Complejo_id` bigint(20) NOT NULL,
  UNIQUE KEY `UK_dgqj1aifqdwj42iqihnw23w3m` (`Complejo_id`),
  KEY `FK_dgqj1aifqdwj42iqihnw23w3m` (`Complejo_id`),
  KEY `FK_8qje7cq4h6y8dup6c96s48w56` (`Promocion_id`),
  CONSTRAINT `FK_8qje7cq4h6y8dup6c96s48w56` FOREIGN KEY (`Promocion_id`) REFERENCES `Promocion` (`id`),
  CONSTRAINT `FK_dgqj1aifqdwj42iqihnw23w3m` FOREIGN KEY (`Complejo_id`) REFERENCES `Complejo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for Reserva
-- ----------------------------
DROP TABLE IF EXISTS `Reserva`;
CREATE TABLE `Reserva` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `activo` tinyint(1) NOT NULL,
  `codigo` varchar(255) NOT NULL,
  `fechaCreacion` datetime NOT NULL,
  `fechaReserva` datetime NOT NULL,
  `importe` float NOT NULL,
  `Cliente_email` varchar(255) DEFAULT NULL,
  `Funcion_id` bigint(20) DEFAULT NULL,
  `promo_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_pesclbriwxrt9y3ke6dfbqgvv` (`Cliente_email`),
  KEY `FK_rwor5hwxpyif0p29i4tgc3o0g` (`Funcion_id`),
  KEY `FK_g4s1lpqiw75kv7jid7ftqrm8p` (`promo_id`),
  CONSTRAINT `FK_g4s1lpqiw75kv7jid7ftqrm8p` FOREIGN KEY (`promo_id`) REFERENCES `Promocion` (`id`),
  CONSTRAINT `FK_pesclbriwxrt9y3ke6dfbqgvv` FOREIGN KEY (`Cliente_email`) REFERENCES `Cliente` (`email`),
  CONSTRAINT `FK_rwor5hwxpyif0p29i4tgc3o0g` FOREIGN KEY (`Funcion_id`) REFERENCES `Funcion` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for Reserva_Asiento
-- ----------------------------
DROP TABLE IF EXISTS `Reserva_Asiento`;
CREATE TABLE `Reserva_Asiento` (
  `Reserva_id` bigint(20) NOT NULL,
  `Asientos_id` bigint(20) NOT NULL,
  KEY `FK_5sxk85s2ccsyvu5i3ep5kpiwk` (`Asientos_id`),
  KEY `FK_fete5fico331txqfnv66twxiy` (`Reserva_id`),
  CONSTRAINT `FK_fete5fico331txqfnv66twxiy` FOREIGN KEY (`Reserva_id`) REFERENCES `Reserva` (`id`),
  CONSTRAINT `FK_5sxk85s2ccsyvu5i3ep5kpiwk` FOREIGN KEY (`Asientos_id`) REFERENCES `Asiento` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for Reserva_Precios_Detalle
-- ----------------------------
DROP TABLE IF EXISTS `Reserva_Precios_Detalle`;
CREATE TABLE `Reserva_Precios_Detalle` (
  `Reserva_id` bigint(20) NOT NULL,
  `Precios_Detalle_id` bigint(20) NOT NULL,
  UNIQUE KEY `UK_boyucky1r3hx3fnl5i213jabk` (`Precios_Detalle_id`),
  KEY `FK_boyucky1r3hx3fnl5i213jabk` (`Precios_Detalle_id`),
  KEY `FK_qej4b5dort4gg0l8mcgwwcjkw` (`Reserva_id`),
  CONSTRAINT `FK_qej4b5dort4gg0l8mcgwwcjkw` FOREIGN KEY (`Reserva_id`) REFERENCES `Reserva` (`id`),
  CONSTRAINT `FK_boyucky1r3hx3fnl5i213jabk` FOREIGN KEY (`Precios_Detalle_id`) REFERENCES `Precios_Detalle` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for Sala
-- ----------------------------
DROP TABLE IF EXISTS `Sala`;
CREATE TABLE `Sala` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `activa` tinyint(1) NOT NULL,
  `idComplejo` bigint(20) NOT NULL,
  `numeroSala` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for Usuario
-- ----------------------------
DROP TABLE IF EXISTS `Usuario`;
CREATE TABLE `Usuario` (
  `email` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `apellido` varchar(255) NOT NULL,
  `dni` bigint(20) NOT NULL,
  `fechaNacimiento` datetime DEFAULT NULL,
  `nombre` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `preguntaSeguridad` varchar(255) DEFAULT NULL,
  `respuestaSeguridad` varchar(255) DEFAULT NULL,
  `role` varchar(255) NOT NULL,
  `sexo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records 
-- ----------------------------

INSERT INTO `Asiento` VALUES ('2', '2', '1');
INSERT INTO `Asiento` VALUES ('3', '3', '1');
INSERT INTO `Asiento` VALUES ('4', '4', '1');
INSERT INTO `Asiento` VALUES ('5', '5', '1');
INSERT INTO `Asiento` VALUES ('6', '6', '1');
INSERT INTO `Asiento` VALUES ('7', '7', '1');
INSERT INTO `Asiento` VALUES ('8', '8', '1');
INSERT INTO `Asiento` VALUES ('9', '9', '1');
INSERT INTO `Asiento` VALUES ('10', '10', '1');
INSERT INTO `Asiento` VALUES ('11', '1', '2');
INSERT INTO `Asiento` VALUES ('12', '2', '2');
INSERT INTO `Asiento` VALUES ('13', '3', '2');
INSERT INTO `Asiento` VALUES ('14', '4', '2');
INSERT INTO `Asiento` VALUES ('15', '5', '2');
INSERT INTO `Asiento` VALUES ('16', '6', '2');
INSERT INTO `Asiento` VALUES ('17', '7', '2');
INSERT INTO `Asiento` VALUES ('18', '8', '2');
INSERT INTO `Asiento` VALUES ('19', '9', '2');
INSERT INTO `Asiento` VALUES ('20', '10', '2');
INSERT INTO `Asiento` VALUES ('21', '1', '3');
INSERT INTO `Asiento` VALUES ('22', '2', '3');
INSERT INTO `Asiento` VALUES ('23', '3', '3');
INSERT INTO `Asiento` VALUES ('24', '4', '3');
INSERT INTO `Asiento` VALUES ('25', '5', '3');
INSERT INTO `Asiento` VALUES ('26', '6', '3');
INSERT INTO `Asiento` VALUES ('27', '7', '3');
INSERT INTO `Asiento` VALUES ('28', '8', '3');
INSERT INTO `Asiento` VALUES ('29', '9', '3');
INSERT INTO `Asiento` VALUES ('30', '10', '3');
INSERT INTO `Asiento` VALUES ('31', '1', '4');
INSERT INTO `Asiento` VALUES ('32', '2', '4');
INSERT INTO `Asiento` VALUES ('33', '3', '4');
INSERT INTO `Asiento` VALUES ('34', '4', '4');
INSERT INTO `Asiento` VALUES ('35', '5', '4');
INSERT INTO `Asiento` VALUES ('36', '6', '4');
INSERT INTO `Asiento` VALUES ('37', '7', '4');
INSERT INTO `Asiento` VALUES ('38', '8', '4');
INSERT INTO `Asiento` VALUES ('39', '9', '4');
INSERT INTO `Asiento` VALUES ('40', '10', '4');
INSERT INTO `Asiento` VALUES ('41', '1', '5');
INSERT INTO `Asiento` VALUES ('42', '2', '5');
INSERT INTO `Asiento` VALUES ('43', '3', '5');
INSERT INTO `Asiento` VALUES ('44', '4', '5');
INSERT INTO `Asiento` VALUES ('45', '5', '5');
INSERT INTO `Asiento` VALUES ('46', '6', '5');
INSERT INTO `Asiento` VALUES ('47', '7', '5');
INSERT INTO `Asiento` VALUES ('48', '8', '5');
INSERT INTO `Asiento` VALUES ('49', '9', '5');
INSERT INTO `Asiento` VALUES ('50', '10', '5');
INSERT INTO `Asiento` VALUES ('51', '1', '6');
INSERT INTO `Asiento` VALUES ('52', '2', '6');
INSERT INTO `Asiento` VALUES ('53', '3', '6');
INSERT INTO `Asiento` VALUES ('54', '4', '6');
INSERT INTO `Asiento` VALUES ('55', '5', '6');
INSERT INTO `Asiento` VALUES ('56', '6', '6');
INSERT INTO `Asiento` VALUES ('57', '7', '6');
INSERT INTO `Asiento` VALUES ('58', '8', '6');
INSERT INTO `Asiento` VALUES ('59', '9', '6');
INSERT INTO `Asiento` VALUES ('60', '10', '6');
INSERT INTO `Asiento` VALUES ('61', '1', '7');
INSERT INTO `Asiento` VALUES ('62', '2', '7');
INSERT INTO `Asiento` VALUES ('63', '3', '7');
INSERT INTO `Asiento` VALUES ('64', '4', '7');
INSERT INTO `Asiento` VALUES ('65', '5', '7');
INSERT INTO `Asiento` VALUES ('66', '6', '7');
INSERT INTO `Asiento` VALUES ('67', '7', '7');
INSERT INTO `Asiento` VALUES ('68', '8', '7');
INSERT INTO `Asiento` VALUES ('69', '9', '7');
INSERT INTO `Asiento` VALUES ('70', '10', '7');
INSERT INTO `Asiento` VALUES ('71', '1', '8');
INSERT INTO `Asiento` VALUES ('72', '2', '8');
INSERT INTO `Asiento` VALUES ('73', '3', '8');
INSERT INTO `Asiento` VALUES ('74', '4', '8');
INSERT INTO `Asiento` VALUES ('75', '5', '8');
INSERT INTO `Asiento` VALUES ('76', '6', '8');
INSERT INTO `Asiento` VALUES ('77', '7', '8');
INSERT INTO `Asiento` VALUES ('78', '8', '8');
INSERT INTO `Asiento` VALUES ('79', '9', '8');
INSERT INTO `Asiento` VALUES ('80', '10', '8');
INSERT INTO `Asiento` VALUES ('81', '1', '9');
INSERT INTO `Asiento` VALUES ('82', '2', '9');
INSERT INTO `Asiento` VALUES ('83', '3', '9');
INSERT INTO `Asiento` VALUES ('84', '4', '9');
INSERT INTO `Asiento` VALUES ('85', '5', '9');
INSERT INTO `Asiento` VALUES ('86', '6', '9');
INSERT INTO `Asiento` VALUES ('87', '7', '9');
INSERT INTO `Asiento` VALUES ('88', '8', '9');
INSERT INTO `Asiento` VALUES ('89', '9', '9');
INSERT INTO `Asiento` VALUES ('90', '10', '9');
INSERT INTO `Asiento` VALUES ('91', '1', '10');
INSERT INTO `Asiento` VALUES ('92', '2', '10');
INSERT INTO `Asiento` VALUES ('93', '3', '10');
INSERT INTO `Asiento` VALUES ('94', '4', '10');
INSERT INTO `Asiento` VALUES ('95', '5', '10');
INSERT INTO `Asiento` VALUES ('96', '6', '10');
INSERT INTO `Asiento` VALUES ('97', '7', '10');
INSERT INTO `Asiento` VALUES ('98', '8', '10');
INSERT INTO `Asiento` VALUES ('99', '9', '10');
INSERT INTO `Asiento` VALUES ('100', '10', '10');
INSERT INTO `Cartelera` VALUES ('16', '1', '2015-02-26 00:00:00', '2015-02-19 00:00:00', '2d', '0', '1');
INSERT INTO `Cartelera` VALUES ('17', '1', '2015-02-26 00:00:00', '2015-02-19 00:00:00', '3D', '0', '6');
INSERT INTO `Cartelera` VALUES ('18', '1', '2015-02-26 00:00:00', '2015-02-19 00:00:00', '2D', '0', '16');
INSERT INTO `Cartelera` VALUES ('19', '1', '2015-02-26 00:00:00', '2015-02-19 00:00:00', '2D', '0', '20');
INSERT INTO `Cartelera` VALUES ('20', '1', '2015-02-26 00:00:00', '2015-02-19 00:00:00', '3D', '0', '24');
INSERT INTO `Cartelera` VALUES ('21', '1', '2015-02-26 00:00:00', '2015-02-19 00:00:00', '3D', '0', '25');
INSERT INTO `Cartelera` VALUES ('22', '1', '2015-02-26 00:00:00', '2015-02-19 00:00:00', '2D', '0', '27');
INSERT INTO `Cartelera` VALUES ('23', '1', '2015-02-26 00:00:00', '2015-02-19 00:00:00', '3D', '0', '29');
INSERT INTO `Cliente` VALUES ('P.O. Box 651, 892 Malesuada Rd.', 'Accion', 'Alvin.Bennett@prueba.com');
INSERT INTO `Cliente` VALUES ('Ap #839-2262 Lacus, St.', 'Misterio', 'Ariel.Ochoa@prueba.com');
INSERT INTO `Cliente` VALUES ('725-4070 Vivamus Rd.', 'Misterio', 'Brianna.Prince@prueba.com');
INSERT INTO `Cliente` VALUES ('415-2337 Sit Av.', 'Misterio', 'Caesar.Dickson@prueba.com');
INSERT INTO `Cliente` VALUES ('7428 Cursus. Road', 'Misterio', 'Channing.Saunders@prueba.com');
INSERT INTO `Cliente` VALUES ('248-7905 At, Avenue', 'Aventuras', 'Charissa.Chaney@prueba.com');
INSERT INTO `Cliente` VALUES ('P.O. Box 576, 9258 Sed, Av.', 'Accion', 'Charissa.Macdonald@prueba.com');
INSERT INTO `Cliente` VALUES ('32 Wallaby St', 'Accion', 'Cliente@frgp.utn.edu.ar');
INSERT INTO `Cliente` VALUES ('Ap #660-2181 Et Rd.', 'Accion', 'Dylan.Maldonado@prueba.com');
INSERT INTO `Cliente` VALUES ('1370 Nullam Street', 'Misterio', 'Emily.Moran@prueba.com');
INSERT INTO `Cliente` VALUES ('2184 Amet, Rd.', 'Misterio', 'Hamish.Branch@prueba.com');
INSERT INTO `Cliente` VALUES ('Ap #134-9782 Auctor St.', 'Accion', 'Hedy.Bradshaw@prueba.com');
INSERT INTO `Cliente` VALUES ('4638 Mauris Avenue', 'Accion', 'Hunter.Patel@prueba.com');
INSERT INTO `Cliente` VALUES ('Ap #806-6310 Rhoncus. Av.', 'Accion', 'Jordan.Jensen@prueba.com');
INSERT INTO `Cliente` VALUES ('1640 Adipiscing Street', 'Accion', 'Josiah.Brady@prueba.com');
INSERT INTO `Cliente` VALUES ('8165 Est. Ave', 'Aventuras', 'Logan.Chase@prueba.com');
INSERT INTO `Cliente` VALUES ('890-2915 Ad St.', 'Misterio', 'Madeline.Bright@prueba.com');
INSERT INTO `Cliente` VALUES ('Ap #437-8684 Semper, Av.', 'Accion', 'Maile.Morin@prueba.com');
INSERT INTO `Cliente` VALUES ('3348 Mi Rd.', 'Misterio', 'Melvin.Burns@prueba.com');
INSERT INTO `Cliente` VALUES ('745-4144 Sit Av.', 'Accion', 'Nehru.Flores@prueba.com');
INSERT INTO `Cliente` VALUES ('2405 Integer Rd.', 'Misterio', 'Phillip.Jennings@prueba.com');
INSERT INTO `Cliente` VALUES ('32 Wallaby St', 'Misterio', 'prueba@frgp.utn.edu.ar');
INSERT INTO `Cliente` VALUES ('Ap #231-8566 Non, Ave', 'Misterio', 'Reese.Mcintosh@prueba.com');
INSERT INTO `Cliente` VALUES ('P.O. Box 419, 4307 Rhoncus. Street', 'Aventuras', 'Reuben.Jenkins@prueba.com');
INSERT INTO `Cliente` VALUES ('152-5625 Integer Rd.', 'Misterio', 'Rhea.Kirkland@prueba.com');
INSERT INTO `Cliente` VALUES ('507-5256 Bibendum Avenue', 'Accion', 'Shannon.Yang@prueba.com');
INSERT INTO `Cliente` VALUES ('P.O. Box 243, 5895 Aliquam Rd.', 'Misterio', 'Sigourney.Snyder@prueba.com');
INSERT INTO `Cliente` VALUES ('Ap #863-6958 Lorem Av.', 'Accion', 'Virginia.Ball@prueba.com');
INSERT INTO `Cliente` VALUES ('519-4280 Auctor Av.', 'Aventuras', 'Whitney.Vaughn@prueba.com');
INSERT INTO `Cliente` VALUES ('P.O. Box 881, 5482 Massa Rd.', 'Accion', 'Zephr.Suarez@prueba.com');
INSERT INTO `Complejo` VALUES ('1', '1', 'Avenida  R Balbin 2712', 'Hoyts General Cinema');
INSERT INTO `Complejo` VALUES ('2', '1', 'Av. Melian 4620 Saavedra', 'Hoyts');
INSERT INTO `Complejo` VALUES ('3', '1', 'Lavalle 896', 'Sweet Srl');
INSERT INTO `Complejo` VALUES ('4', '0', 'E. Echeverria 3750', 'Showcase norte');
INSERT INTO `Complejo` VALUES ('5', '0', 'Avenida Cabildo 1428', 'Belgrano Multiplex');
INSERT INTO `Complejo` VALUES ('6', '0', 'Lavalle 869', 'Atlas cine');
INSERT INTO `Complejo` VALUES ('7', '0', 'Avenida Cabildo 2829', 'Savoy');
INSERT INTO `Complejo` VALUES ('8', '0', 'Monroe 1655', 'Showcase cinema');
INSERT INTO `Complejo` VALUES ('9', '1', 'Soler 4123', 'Produccion cines');
INSERT INTO `Complejo` VALUES ('10', '0', 'Avenida R.S.Ortiz 140', 'Cinema group');
INSERT INTO `Complejo_Sala` VALUES ('1', '1');
INSERT INTO `Complejo_Sala` VALUES ('1', '2');
INSERT INTO `Complejo_Sala` VALUES ('2', '3');
INSERT INTO `Complejo_Sala` VALUES ('3', '4');
INSERT INTO `Complejo_Sala` VALUES ('3', '5');
INSERT INTO `Complejo_Sala` VALUES ('3', '6');
INSERT INTO `Complejo_Sala` VALUES ('4', '7');
INSERT INTO `Complejo_Sala` VALUES ('4', '8');
INSERT INTO `Complejo_Sala` VALUES ('5', '9');
INSERT INTO `Complejo_Sala` VALUES ('5', '10');
INSERT INTO `Complejo_Sala` VALUES ('5', '11');
INSERT INTO `Complejo_Sala` VALUES ('6', '12');
INSERT INTO `Complejo_Sala` VALUES ('7', '13');
INSERT INTO `Complejo_Sala` VALUES ('8', '14');
INSERT INTO `Complejo_Sala` VALUES ('9', '15');
INSERT INTO `Complejo_Sala` VALUES ('9', '16');
INSERT INTO `Complejo_Sala` VALUES ('10', '17');
INSERT INTO `Complejo_Sala` VALUES ('10', '18');
INSERT INTO `Complejo_Sala` VALUES ('10', '19');
INSERT INTO `FichaTecnica` VALUES ('1', 'Ricardo Darin, Oscar Martinez', 'La desigualdad, la injusticia y las demandas del mundo en el que vivimos le causan estres y depresion a mucha gente. Algunas de ellas explotan.', 'Damian Szifron', 'http://www.youtube.com/watch?v=xdv61uCTso0');
INSERT INTO `FichaTecnica` VALUES ('2', 'Billy Bob Thornton, Vera Farmiga, Robert Downey Jr, Robert Duvall, Vincent D Onofrio, Dax Shephard, Jeremy Strong', 'Hank Palmer es un abogado que regresa a la ciudad de su niÃ±ez en donde su padre, del que esta distanciado, es juez y es sospechoso de haber cometido un asesinato', 'Bobby Farrelly', 'http://www.youtube.com/watch?v=qHMPxUX6cKA');
INSERT INTO `FichaTecnica` VALUES ('3', 'Jeff Daniels, Jim Carrey, Brady Bluhm, Cam Neely, Kathleen Turner, Laurie Holden, Rachel Melvin, Steve Tom.', 'Veinte aÃ±os despues de su primer aventura, Lloyd y Harry vuelven a las andadas para buscar a la hija perdida de Harry de quien nunca supo nada hasta ahora.', 'Bobby Farrelly, Peter Farrelly.', 'http://www.youtube.com/watch?v=camB3kmKg1U');
INSERT INTO `FichaTecnica` VALUES ('4', 'Robin Wright, Xavier Samuel, Naomi Watts, James Frecheville, Sophie Lowe.', 'Dos amigas encuentran la felicidad de forma inesperada en relaciones que rompen las convenciones.', 'Anne Fontaine.', 'http://www.youtube.com/watch?v=2phTUVU0PNA');
INSERT INTO `FichaTecnica` VALUES ('5', 'Ron Perlman, Channing Tatum, Zoe Saldana, Diego Luna, Christina Applegate.', 'Narra la leyenda de Manolo, un heroe soÃ±ador que emprende una misionn tipica a traves de mundos magicos, miticos y asombrosos, para poder reunirse con el amor de su vida y defender a su pueblo.', 'Jorge Gutierrez.', 'http://www.youtube.com/watch?v=JvIvF8ST8CY');
INSERT INTO `FichaTecnica` VALUES ('6', 'Jennifer Lawrence, Josh Hutcherson, Liam Hemsworth, Julianne Moore, Phillip Seymour Hoffman', 'Katniss es la cabeza de la rebelion contra el Capitolio, mientras debe encontrar la manera de rescatar a Peeta, que fue tomado como prisionero por el Presidente Snow.', 'Francis Lawrence.', 'http://www.youtube.com/watch?v=b1XQymoxcAQ');
INSERT INTO `FichaTecnica` VALUES ('7', 'Jessica Chastain, Michael Caine, Topher Grace, Anne Hathaway, Matthew Mcconaughey, Casey Affleck', 'Cuando el tiempo de la humanidad en la Tierra esta llegando a su fin, un grupo de exploradores emprende la mision mas importante en la historia: viajar mas alla de esta galaxia para descubrir si los humanos tienen futuro entre las estrellas.', 'Christopher Nolan', 'http://www.youtube.com/watch?v=F1BiKNCNDBY');
INSERT INTO `FichaTecnica` VALUES ('8', 'Liam Neeson, David Harbour, Boyd Holbrook, Dan Stevens.', 'Matt Scudder es un ex-policiaa de la ciudad de Nueva York que ahora trabaja como detective privado fuera de la ley. Cuando Scudder acepta ayudar a un traficante de heroina a atrapar a los hombres que secuestraron y asesinaron a su esposa.', 'Scott Frank', 'http://www.youtube.com/watch?v=k4qPneZLxfw');
INSERT INTO `FichaTecnica` VALUES ('9', 'Colin Firth, Mark Strong, Nicole Kidman, Anne Marie Duff, Ben Crompton.', 'Christine sufre las secuelas de un terrible accidente. Solo logra retener recuerdos durante un dia. Vive atrapada en una existencia en la que desconoce casi todo lo que la vincula con el mundo.', 'Rowan Joffe.', 'http://www.youtube.com/watch?v=z48AQ2RpA3Y');
INSERT INTO `FichaTecnica` VALUES ('10', 'Bruce Willlis,Ben Affleck,Liv tyler,Billy Bob Thornton, Steve Buscemi, Udo Kier, Will Patton, Peter Stormare, Michael Clarke Duncan, Keith David, Owen Wilson, Mark Curry, Jason Isaacs, William Fichtner, Jessica Steen', 'Cuando un meteorito esta a punto de chocar con la tierra se buscara la solucion enviando a un grupo de hombres entrenados en unos dias para realizar una excavacion en el meteorito y volarlo antes de que sea demasiado tarde.', 'Michael Bay', 'http://www.youtube.com/watch?v=iq6q2BrTino');
INSERT INTO `FichaTecnica` VALUES ('11', 'Annabelle Wallis,Alfre Woodard,Eric Ladin', 'John Form ha encontrado el regalo perfecto para su mujer Mia, quien esta embarazada: una hermosa muÃ±eca antigua y dificil de conseguir que luce un vestido blanco de novia', 'John R. Leonetti', 'http://www.youtube.com/embed/t5-9hrkexZI');
INSERT INTO `FichaTecnica` VALUES ('12', 'Elle Faning,Simon Pegg,Toni Colette', 'Los Boxtrolls es una fabula comica que se desarrolla en Cheesebridge, una ciudad de la epoca victoriana, cuya sociedad esta obsesionada con la elegancia, la riqueza, la clase alta y los quesos finos, aunque sean algo apestosos.', 'Graham Annable,Anthony Stacchi', 'http://www.youtube.com/embed/TnaYUdnBkYQ');
INSERT INTO `FichaTecnica` VALUES ('13', 'Kate Winslet Leonardo DiCaprio Victor Garber Kathy Bates', 'Jack, un joven artista, gana en una partida de cartas un pasaje para viajar a AmÃ©rica en el Titanic, el trasatlÃ¡ntico mÃ¡s grande y seguro jamÃ¡s construido. A bordo conoce a Rose, una joven de una buena familia', 'James Cameron', 'http://www.youtube.com/watch?v=ZQ6klONCq4s');
INSERT INTO `FichaTecnica` VALUES ('14', 'Edwin Hodge,Ben Feldman,Perdita Weeks', 'Miles de catacumbas laberinticas se encuentran por debajo de las calles de Paris, conformando un hogar eterno para innumerables almas.', 'John Erick Dowdle', 'http://www.youtube.com/embed/pkNjAx8odU');
INSERT INTO `FichaTecnica` VALUES ('15', 'Juan Gil Navarro,Agustina Lecouna, Nicolas Alberti', 'De sus profundidades de un bosque emerge, desnudo y baÃ±ado en sangre, Elias, sin un solo recuerdo de lo que les ha ocurrido a el y a sus tres amigos desaparecidos.', 'Ezio Massa', 'http://www.youtube.com/embed/PyNockpbFF0');
INSERT INTO `FichaTecnica` VALUES ('16', 'Christian Bale,Aaron Paul,Joel Edgerton', 'Biografia sobre Moises, uno de los mÃ¡s importantes personajes biblicos, y que lidera el exodo de los judios por Egipto', 'Ridley Scott', 'http://www.youtube.com/embed/XVJEm3c9eoA');
INSERT INTO `FichaTecnica` VALUES ('17', 'Helene Giraud,Thomas Szabo', 'En un pacifico bosque, los restos de un picnic desatan una guerra entre colonias de hormigas rivales obsesionadas con tener el control de un mismo premio: una caja de cubos de azucar.', 'Helenene Giraud,Tomas Szabo', 'http://www.youtube.com/embed/5xOdazHpoYs');
INSERT INTO `FichaTecnica` VALUES ('18', 'Kristin Scott Thomas, Daniel Auteuil, LeÃ¯la Bekhti, Vicky Krieps, Richard Berry, Jerome Varanfrain, Laure Killing, Anne Metzler, Laurent Claret, Jean-FranÃ§ois Wolff.', 'Paul es un neurocirujano de sesenta aÃ±os. EstÃ¡ casado con Lucie y siempre han sido felices, hasta que un buen dÃ­a empiezan a llegar ramos de rosas a su casa coincidiendo con que Lou, una joven de veinte aÃ±os, no deja de cruzarse en el camino de Paul.', 'Philippe Claudel', 'http://www.youtube.com/watch?v=Wv3HsXyjWNY');
INSERT INTO `FichaTecnica` VALUES ('19', 'Johannes Kuhnke,Lisa Loven Kongsli,Clara Wettergren', 'Una familia sueca viaja a los Alpes franceses para disfrutar de unos dias de esqui y tiempo de calidad en familia.', 'Ruben Astlund', 'http://www.youtube.com/embed/qf4T0freLbY');
INSERT INTO `FichaTecnica` VALUES ('20', 'Olivia Newton John,John Travolta', 'Verano de 1959. Sandy (Olivia Newton John) y Danny (John Travolta) han pasado un romantico y maravilloso verano juntos, pero, cuando las vacaciones se acaban, sus caminos se separan.', 'Randal Kleiser', 'http://www.youtube.com/embed/q6CuHRX_dml');
INSERT INTO `FichaTecnica` VALUES ('21', 'Audrey Hepburn,Mickey Rooney', 'Holly Golightly es una bella joven neoyorquina que, aparentemente, lleva una vida facil y alegre. Tiene un comportamiento bastante extravagante, por ejemplo, desayunar contemplando el escaparate de la lujosa joyeria Tiffanys.', 'Blake Edwards', 'http://www.youtube.com/embed/urQVzgEO_w8');
INSERT INTO `FichaTecnica` VALUES ('22', 'Saul Swimmer', 'Celebra la magia de Queen con los fans de todo el mundo en este dia tan especial. Queen Rock Montreal, un recital unico de una de las bandas mas grandes del mundo, este recital se conoce como una de las mejores actuaciones de Queen.', 'Saul Swimmer', 'http://www.youtube.com/embed/e0NDSVsSqx0');
INSERT INTO `FichaTecnica` VALUES ('23', 'Michael J Fox, Marty McFly', 'un tipico adolescente americano de los aÃ±os 80 es accidentalmente enviado al aÃ±o 1955 en un DeLorean inventado por su amigo Doc, un cientifico al que todos toman por loco que puede viajar a traves del tiempo y que se alimenta con plutonio', 'Robert Zemeckis', 'http://www.youtube.com/embed/Es3df08rTb0');
INSERT INTO `FichaTecnica` VALUES ('24', 'Genesis Rodriguez, Damon Wayans Jr, Jamie Chung', 'grandes hÃ©roes nos presenta al genio de la robÃ³tica, Hiro Hamada, quien se encuentra en las garras de un complot criminal que amenaza con destruir la enÃ©rgica y tecnolÃ³gica ciudad de San Fransokyo. Con la ayuda de su compaÃ±ero mÃ¡s cercano.', 'Don Hall, Chris Williams', 'https://www.youtube.com/watch?v=ygc5X3vRG5M');
INSERT INTO `FichaTecnica` VALUES ('25', 'Benedict Cumberbatch, Evangeline Lilly, Martin Freeman', 'El director Peter Jackson culmina el ciclo de El hobbit con esta tercera parte que se centrarÃ¡ en el final de las aventuras del pequeÃ±o Bilbo Bolson y su regreso a BolsÃ³n Cerrado, su hogar. DespuÃ©s de enfrentarse con el dragÃ³n Smaug.', 'Peter Jackson', 'https://www.youtube.com/watch?v=qkPYofGuZS4');
INSERT INTO `FichaTecnica` VALUES ('26', 'Jon Favreau, John Leguizamo, Bobby Cannavale, Emjay Anthony, Scarlett Johansson, Dustin Hoffman', 'Cuando el chef Carl Casper repentinamente deja su trabajo en un famoso restaurante de Los Ãngeles, al enfrentarse a su controlador dueÃ±o y negarse a renunciar a su integridad creativa.', 'Jon Favreau', 'https://www.youtube.com/watch?v=Ho0XIi-oCmQ');
INSERT INTO `FichaTecnica` VALUES ('27', 'Bill Murray, Melissa McCarthy, Naomi Watts', 'Maggie es una madre separada que se muda a Brooklyn con su hijo de doce aÃ±os, Oliver. Al tener que trabajar muchas horas, no le queda mÃ¡s opciÃ³n que dejar a Oliver al cargo de su nuevo vecino, Vincent.', 'Theodore Melfi', 'https://www.youtube.com/watch?v=Iy-4VbRelvw');
INSERT INTO `FichaTecnica` VALUES ('28', 'Stellan Skarsgard, Emma Rigby, Ben Kingsley', 'Rob J. Cole, un niÃ±o huÃ©rfano de nueve aÃ±os es adoptado por un barbero que le enseÃ±a el oficio. Durante aÃ±os recorren Inglaterra montando espectÃ¡culos para atraer al pÃºblico hasta que su padre adoptivo tambiÃ©n muere.', 'Philipp Stolzl', 'https://www.youtube.com/watch?v=kFm9Sy3DZm4');
INSERT INTO `FichaTecnica` VALUES ('29', 'Hugh Bonneville, Sally Hawkins, Julie Walters', 'La aventura comienza. Un oso peruano joven con una pasion por todo lo britanico viaja a Londres para encontrar un hogar.', 'Paul King', 'https://www.youtube.com/watch?v=Dec_07CjBA8');
INSERT INTO `Funcion` VALUES ('9', '1', '15', '1', '1');
INSERT INTO `Funcion` VALUES ('10', '1', '18', '1', '1');
INSERT INTO `Funcion` VALUES ('11', '1', '25', '1', '1');
INSERT INTO `Funcion` VALUES ('12', '1', '21', '25', '3');
INSERT INTO `Funcion` VALUES ('13', '1', '22', '25', '3');
INSERT INTO `Funcion` VALUES ('14', '1', '23', '25', '3');
INSERT INTO `Funcion` VALUES ('15', '1', '15', '6', '5');
INSERT INTO `Funcion` VALUES ('16', '1', '15', '16', '15');
INSERT INTO `Funcion` VALUES ('17', '1', '4', '20', '16');
INSERT INTO `Horario` VALUES ('1', '02:00:00', '13:00:00', '11:00:00');
INSERT INTO `Horario` VALUES ('2', '02:00:00', '15:00:00', '13:00:00');
INSERT INTO `Horario` VALUES ('3', '02:00:00', '17:00:00', '15:00:00');
INSERT INTO `Horario` VALUES ('4', '02:00:00', '19:00:00', '17:00:00');
INSERT INTO `Horario` VALUES ('5', '02:00:00', '21:00:00', '19:00:00');
INSERT INTO `Horario` VALUES ('6', '02:00:00', '23:00:00', '21:00:00');
INSERT INTO `Horario` VALUES ('7', '02:00:00', '01:00:00', '23:00:00');
INSERT INTO `Horario` VALUES ('8', '02:00:00', '12:00:00', '10:00:00');
INSERT INTO `Horario` VALUES ('9', '02:00:00', '14:00:00', '12:00:00');
INSERT INTO `Horario` VALUES ('10', '02:00:00', '16:00:00', '14:00:00');
INSERT INTO `Horario` VALUES ('11', '02:00:00', '18:00:00', '16:00:00');
INSERT INTO `Horario` VALUES ('12', '02:00:00', '20:00:00', '18:00:00');
INSERT INTO `Horario` VALUES ('13', '02:00:00', '22:00:00', '20:00:00');
INSERT INTO `Horario` VALUES ('14', '02:00:00', '00:00:00', '22:00:00');
INSERT INTO `Horario` VALUES ('15', '02:30:00', '12:30:00', '10:00:00');
INSERT INTO `Horario` VALUES ('16', '02:30:00', '15:00:00', '12:30:00');
INSERT INTO `Horario` VALUES ('17', '02:30:00', '17:30:00', '15:00:00');
INSERT INTO `Horario` VALUES ('18', '02:30:00', '20:00:00', '17:30:00');
INSERT INTO `Horario` VALUES ('19', '02:30:00', '22:30:00', '20:00:00');
INSERT INTO `Horario` VALUES ('20', '02:30:00', '01:00:00', '22:30:00');
INSERT INTO `Horario` VALUES ('21', '03:00:00', '13:00:00', '10:00:00');
INSERT INTO `Horario` VALUES ('22', '03:00:00', '16:00:00', '13:00:00');
INSERT INTO `Horario` VALUES ('23', '03:00:00', '19:00:00', '16:00:00');
INSERT INTO `Horario` VALUES ('24', '03:00:00', '22:00:00', '19:00:00');
INSERT INTO `Horario` VALUES ('25', '03:00:00', '01:00:00', '22:00:00');
INSERT INTO `Pelicula` VALUES ('1', '1', '13', '02:01:00', '2014-11-20 23:31:38', 'ES', 'RELATOS SALVAJES', '0', '0', '1');
INSERT INTO `Pelicula` VALUES ('2', '0', '13', '02:21:00', '2014-11-20 21:00:53', 'EN', 'THE JUDGE', '0', '1', '2');
INSERT INTO `Pelicula` VALUES ('3', '0', '13', '01:50:00', '2014-11-13 00:00:00', 'EN', 'DUMD AND DUMBER TO', '0', '1', '3');
INSERT INTO `Pelicula` VALUES ('4', '1', '18', '01:42:00', '2014-11-13 00:00:00', 'EN', 'ADORE', '0', '1', '4');
INSERT INTO `Pelicula` VALUES ('5', '1', 'ATP', '01:33:00', '2014-10-16 00:00:00', 'EN', 'THE BOOK OF LIFE', '0', '1', '5');
INSERT INTO `Pelicula` VALUES ('6', '1', '13', '02:03:00', '2014-11-20 00:00:00', 'EN', 'THE HUNGER GAMES: Mockingjay. Part 1', '0', '1', '6');
INSERT INTO `Pelicula` VALUES ('7', '0', '13', '02:48:00', '2014-11-06 00:00:00', 'EN', ' INTERSTELLAR', '0', '1', '7');
INSERT INTO `Pelicula` VALUES ('8', '0', '16', '01:53:00', '2014-11-13 00:00:00', 'EN', 'CAMINANDO ENTRE TUMBAS', '0', '1', '8');
INSERT INTO `Pelicula` VALUES ('9', '1', '13', '01:53:00', '2014-11-13 00:00:00', 'EN', 'ANTES DE DESPERTAR', '0', '1', '9');
INSERT INTO `Pelicula` VALUES ('10', '0', '13', '02:30:00', '2014-11-20 23:32:17', 'EN', 'ARMAGEDON', '0', '0', '10');
INSERT INTO `Pelicula` VALUES ('11', '0', '16', '01:30:00', '2014-11-13 00:00:00', 'ES', 'ANNABELLE', '0', '0', '11');
INSERT INTO `Pelicula` VALUES ('12', '0', 'ATP', '01:25:00', '2014-11-13 00:00:00', 'ES', 'BOXTROLLS', '0', '0', '12');
INSERT INTO `Pelicula` VALUES ('13', '0', '16', '02:00:00', '2014-11-13 00:00:00', 'ES', 'TITANIC', '0', '0', '13');
INSERT INTO `Pelicula` VALUES ('14', '0', '16', '01:30:00', '2014-11-13 00:00:00', 'ES', 'ASI EN LA TIERRA COMO EN EL INFIERNO', '0', '0', '14');
INSERT INTO `Pelicula` VALUES ('15', '0', '16', '01:30:00', '2014-11-13 00:00:00', 'ES', 'EL DIA DE LOS MUERTOS', '0', '0', '15');
INSERT INTO `Pelicula` VALUES ('16', '1', 'ATP', '02:30:00', '2014-11-13 00:00:00', 'ES', 'EXODO DIOSES Y REYES', '0', '0', '16');
INSERT INTO `Pelicula` VALUES ('17', '0', 'ATP', '01:20:00', '2014-11-13 00:00:00', 'ES', 'MINUSCULOS', '0', '0', '17');
INSERT INTO `Pelicula` VALUES ('18', '1', '16', '01:20:00', '2014-11-13 00:00:00', 'ES', 'ANTES DEL FRIO INVIERNO', '0', '0', '18');
INSERT INTO `Pelicula` VALUES ('19', '0', '13', '01:10:00', '2014-11-13 00:00:00', 'ES', 'FORCE MAJEURE: La traicion del instinto', '0', '0', '19');
INSERT INTO `Pelicula` VALUES ('20', '1', 'ATP', '01:40:00', '2014-11-13 00:00:00', 'EN', 'GREASE', '0', '1', '20');
INSERT INTO `Pelicula` VALUES ('21', '0', 'ATP', '01:40:00', '2014-11-13 00:00:00', 'EN', 'MU&Ntilde;EQUITA DE LUJO', '0', '1', '21');
INSERT INTO `Pelicula` VALUES ('22', '0', 'ATP', '01:45:00', '2014-11-13 00:00:00', 'EN', 'QUEEN ROCK MONTREAL', '0', '1', '22');
INSERT INTO `Pelicula` VALUES ('23', '0', 'ATP', '01:50:00', '2014-11-13 00:00:00', 'EN', 'VOLVER AL FUTURO', '0', '1', '23');
INSERT INTO `Pelicula` VALUES ('24', '1', 'ATP', '02:00:00', '2015-02-19 00:00:00', 'EN', 'GRANDES HEROES', '0', '1', '24');
INSERT INTO `Pelicula` VALUES ('25', '1', '13', '03:00:00', '2015-02-19 00:00:00', 'EN', 'THE HOBBIT', '0', '1', '25');
INSERT INTO `Pelicula` VALUES ('26', '1', '13', '02:00:00', '2015-02-19 00:00:00', 'EN', '#CHEF', '0', '1', '26');
INSERT INTO `Pelicula` VALUES ('27', '1', '16', '02:00:00', '2015-02-19 00:00:00', 'EN', 'SN. VINCENT', '0', '1', '27');
INSERT INTO `Pelicula` VALUES ('28', '1', '16', '02:00:00', '2015-02-19 00:00:00', 'EN', 'MEDICUS', '0', '1', '28');
INSERT INTO `Pelicula` VALUES ('29', '1', 'ATP', '02:00:00', '2015-02-19 00:00:00', 'EN', 'PADDINGTON', '0', '1', '29');
INSERT INTO `Precio` VALUES ('1', '1', '55', '45', '35');
INSERT INTO `Precio` VALUES ('2', '0', '45', '35', '25');
INSERT INTO `Precio` VALUES ('3', '0', '35', '25', '15');
INSERT INTO `Precios_Detalle` VALUES ('21', '2', '11', 'mayor', '1');
INSERT INTO `Precios_Detalle` VALUES ('22', '5', '12', 'general', '1');
INSERT INTO `Precios_Detalle` VALUES ('23', '3', '13', 'mayor', '1');
INSERT INTO `Precios_Detalle` VALUES ('24', '3', '13', 'general', '1');
INSERT INTO `Precios_Detalle` VALUES ('25', '1', '14', 'menor', '1');
INSERT INTO `Precios_Detalle` VALUES ('26', '3', '14', 'mayor', '1');
INSERT INTO `Precios_Detalle` VALUES ('27', '3', '14', 'general', '1');
INSERT INTO `Precios_Detalle` VALUES ('28', '3', '15', 'mayor', '1');
INSERT INTO `Precios_Detalle` VALUES ('29', '2', '15', 'general', '1');
INSERT INTO `Precios_Detalle` VALUES ('30', '2', '16', 'mayor', '1');
INSERT INTO `Precios_Detalle` VALUES ('31', '4', '16', 'general', '1');
INSERT INTO `Promocion` VALUES ('1', '1', 'Ninguna', '2015-02-28 00:00:00', '2015-02-01 00:00:00', 'Ninguna');
INSERT INTO `Promocion` VALUES ('2', '1', 'Dos por Uno', '2014-12-31 00:00:00', '2014-01-01 00:00:00', 'Banco Galicia');
INSERT INTO `Promocion` VALUES ('3', '1', 'Banco Galicia', '2015-02-28 00:00:00', '2015-02-01 00:00:00', 'Descuento');
INSERT INTO `Promocion` VALUES ('4', '1', 'Dos por Uno', '2014-12-31 00:00:00', '2014-01-01 00:00:00', 'Club La Nacion');
INSERT INTO `Reserva` VALUES ('11', '1', 'VhxgzsPBn1', '2015-02-18 20:42:08', '2015-02-24 20:42:08', '90', 'Cliente@frgp.utn.edu.ar', '9', '1');
INSERT INTO `Reserva` VALUES ('12', '1', 'U0iwhygchs', '2015-02-18 20:43:10', '2015-02-24 20:43:10', '275', 'Brianna.Prince@prueba.com', '9', '1');
INSERT INTO `Reserva` VALUES ('13', '1', '8Lxnchgd9N', '2015-02-18 20:45:00', '2015-02-22 20:45:00', '300', 'Caesar.Dickson@prueba.com', '13', '1');
INSERT INTO `Reserva` VALUES ('14', '1', 'SqUL3K8Mx0', '2015-02-18 20:46:32', '2015-02-22 20:46:32', '335', 'Phillip.Jennings@prueba.com', '13', '1');
INSERT INTO `Reserva` VALUES ('15', '1', 'veWCDAunGg', '2015-02-18 20:48:12', '2015-02-20 20:48:12', '245', 'Virginia.Ball@prueba.com', '15', '1');
INSERT INTO `Reserva` VALUES ('16', '1', 'X8gQTv0vrq', '2015-02-18 20:49:51', '2015-02-23 20:49:51', '310', 'Cliente@frgp.utn.edu.ar', '16', '1');
INSERT INTO `Reserva_Asiento` VALUES ('11', '47');
INSERT INTO `Reserva_Asiento` VALUES ('11', '48');
INSERT INTO `Reserva_Asiento` VALUES ('12', '31');
INSERT INTO `Reserva_Asiento` VALUES ('12', '32');
INSERT INTO `Reserva_Asiento` VALUES ('12', '33');
INSERT INTO `Reserva_Asiento` VALUES ('12', '34');
INSERT INTO `Reserva_Asiento` VALUES ('12', '35');
INSERT INTO `Reserva_Asiento` VALUES ('13', '61');
INSERT INTO `Reserva_Asiento` VALUES ('13', '62');
INSERT INTO `Reserva_Asiento` VALUES ('13', '63');
INSERT INTO `Reserva_Asiento` VALUES ('13', '64');
INSERT INTO `Reserva_Asiento` VALUES ('13', '65');
INSERT INTO `Reserva_Asiento` VALUES ('13', '66');
INSERT INTO `Reserva_Asiento` VALUES ('14', '35');
INSERT INTO `Reserva_Asiento` VALUES ('14', '36');
INSERT INTO `Reserva_Asiento` VALUES ('14', '37');
INSERT INTO `Reserva_Asiento` VALUES ('14', '38');
INSERT INTO `Reserva_Asiento` VALUES ('14', '39');
INSERT INTO `Reserva_Asiento` VALUES ('14', '40');
INSERT INTO `Reserva_Asiento` VALUES ('14', '50');
INSERT INTO `Reserva_Asiento` VALUES ('15', '11');
INSERT INTO `Reserva_Asiento` VALUES ('15', '12');
INSERT INTO `Reserva_Asiento` VALUES ('15', '21');
INSERT INTO `Reserva_Asiento` VALUES ('15', '22');
INSERT INTO `Reserva_Asiento` VALUES ('15', '23');
INSERT INTO `Reserva_Asiento` VALUES ('16', '61');
INSERT INTO `Reserva_Asiento` VALUES ('16', '62');
INSERT INTO `Reserva_Asiento` VALUES ('16', '81');
INSERT INTO `Reserva_Asiento` VALUES ('16', '82');
INSERT INTO `Reserva_Asiento` VALUES ('16', '83');
INSERT INTO `Reserva_Asiento` VALUES ('16', '84');
INSERT INTO `Reserva_Precios_Detalle` VALUES ('11', '21');
INSERT INTO `Reserva_Precios_Detalle` VALUES ('12', '22');
INSERT INTO `Reserva_Precios_Detalle` VALUES ('13', '23');
INSERT INTO `Reserva_Precios_Detalle` VALUES ('13', '24');
INSERT INTO `Reserva_Precios_Detalle` VALUES ('14', '25');
INSERT INTO `Reserva_Precios_Detalle` VALUES ('14', '26');
INSERT INTO `Reserva_Precios_Detalle` VALUES ('14', '27');
INSERT INTO `Reserva_Precios_Detalle` VALUES ('15', '28');
INSERT INTO `Reserva_Precios_Detalle` VALUES ('15', '29');
INSERT INTO `Reserva_Precios_Detalle` VALUES ('16', '30');
INSERT INTO `Reserva_Precios_Detalle` VALUES ('16', '31');
INSERT INTO `Sala` VALUES ('1', '1', '1', '1');
INSERT INTO `Sala` VALUES ('2', '1', '1', '2');
INSERT INTO `Sala` VALUES ('3', '1', '2', '1');
INSERT INTO `Sala` VALUES ('4', '1', '3', '1');
INSERT INTO `Sala` VALUES ('5', '1', '3', '2');
INSERT INTO `Sala` VALUES ('6', '1', '3', '3');
INSERT INTO `Sala` VALUES ('7', '1', '4', '1');
INSERT INTO `Sala` VALUES ('8', '1', '4', '2');
INSERT INTO `Sala` VALUES ('9', '0', '5', '1');
INSERT INTO `Sala` VALUES ('10', '0', '5', '2');
INSERT INTO `Sala` VALUES ('11', '0', '5', '3');
INSERT INTO `Sala` VALUES ('12', '0', '6', '1');
INSERT INTO `Sala` VALUES ('13', '0', '7', '1');
INSERT INTO `Sala` VALUES ('14', '0', '8', '1');
INSERT INTO `Sala` VALUES ('15', '1', '9', '1');
INSERT INTO `Sala` VALUES ('16', '1', '9', '2');
INSERT INTO `Sala` VALUES ('17', '0', '10', '1');
INSERT INTO `Sala` VALUES ('18', '0', '10', '2');
INSERT INTO `Sala` VALUES ('19', '0', '10', '3');
INSERT INTO `Usuario` VALUES ('admin@frgp.utn.edu.ar', '1', 'Pink', '1337', '1963-11-23 00:00:00', 'Danny', '4a40c2ed30e7f45d55c8e9fb3c2812026e51de9b5dc1815e2d64eec51063d64641a5482bffa258d8', 'pregunta', '8eb7b5df8eb6dfc96c68a2db73da838a8b7a44cfcacb08281b4d57f7c8cc874401d005e9f9992fae', 'A', 'M');
INSERT INTO `Usuario` VALUES ('Alvin.Bennett@prueba.com', '0', 'Bennett', '26912797', '1969-12-31 00:00:00', 'Alvin', 'd8b37740ad4701a4b00df93406fbeb18a02425584daeac09ecfe865e5668a89b4aa35f60d026acb9', 'pregunta', 'a9616ba9f096d2041aa5b807d0f8de73110999aa8f83f504914fd8eff5e13879352059bdd98df277', 'C', 'F');
INSERT INTO `Usuario` VALUES ('Ariel.Ochoa@prueba.com', '0', 'Ochoa', '93214454', '1969-12-31 00:00:00', 'Ariel', '4941b1e01852aa06d9e26f41eac7b1ec80a03444393d3a8d36d7bb93301486b9b84b1771bd3f1f19', 'pregunta', '09478e003fa9535a2950da29fd65b8745cc8b58e9bd6d86dd060fc4bdcf5ace0f8595740fc4c7285', 'C', 'F');
INSERT INTO `Usuario` VALUES ('Brianna.Prince@prueba.com', '1', 'Prince', '66275832', '1969-12-31 00:00:00', 'Brianna', '09cad6d72b741b3ce6f79667f311d66f256b12e0555b3a815ba850b737fb885c766daf9fa035cfb4', 'pregunta', '1d498a1dc41f7ab230f83c3855de5bd0f0c9fe55dfaf32ce1e12eacc4f842e18ef98267ab0ece16a', 'C', 'F');
INSERT INTO `Usuario` VALUES ('Caesar.Dickson@prueba.com', '1', 'Dickson', '88289571', '1969-12-31 00:00:00', 'Caesar', '8d9c6dd3f29d9a52483535dccf301c0c82d2fbabbaa6cf339c44ca2b07894217fba4fb00b81ef4a6', 'pregunta', '0e26aa30c6031039cd595fbbccf0b093cc7193d7ca73da0c3ba3340073c81cee753ef1af430752ea', 'C', 'F');
INSERT INTO `Usuario` VALUES ('Channing.Saunders@prueba.com', '0', 'Saunders', '31967618', '1969-12-31 00:00:00', 'Channing', '4458ea0fd30a9296ff1b26b13e7ff5b0fe0cb0c3b54a71446af545af98143a4636e35f7b2530fa73', 'pregunta', 'f603549c28cf64edf3254cd3ca355df6206fd99fdf1cf05622bbf599dca9739bb0e86b798f0a5980', 'C', 'M');
INSERT INTO `Usuario` VALUES ('Charissa.Chaney@prueba.com', '0', 'Chaney', '18316286', '1969-12-31 00:00:00', 'Charissa', '5406a6bab272817d3c86552cfc338484d439cef5a9fba2e27f25456b110ce81588fbc7fc03dbde0b', 'pregunta', '15f4aad54b335366eb247a0eae2d6c2d9ea508388e07a5c93e36f59408df7c4d6f08af3ab0547143', 'C', 'F');
INSERT INTO `Usuario` VALUES ('Charissa.Macdonald@prueba.com', '0', 'Macdonald', '83126992', '1969-12-31 00:00:00', 'Charissa', '6c4b5e756a4845126cfe54920cc35caef09293b6c80e4c981f0ae511a5a6239a39b59130c9e05dcf', 'pregunta', 'c3a60c1f5d433eefff9465ea1b00ca000a33c30ed06fdd916f37c5770491f9d5fee11d35d695c137', 'C', 'F');
INSERT INTO `Usuario` VALUES ('Cliente@frgp.utn.edu.ar', '1', 'Oswald', '7893', '1963-11-23 00:00:00', 'Clara', '7309a63a624e992ad8da431eee88f252ccfa40a0e9af7ea88faf6278409efdc38bf6d9134fd5fafd', 'pregunta', '1e8d0b3aabeda3f32ae37e991b6dafbba1c299b37c3a1d90bf3ca823a1de9c6247a9dc8929112d89', 'C', 'F');
INSERT INTO `Usuario` VALUES ('Dylan.Maldonado@prueba.com', '0', 'Maldonado', '41169745', '1969-12-31 00:00:00', 'Dylan', '2c57ac8051340def8f29049ea15ec24faf58eb7c444b93a952a0afb4fe379cfe83d56d19878b615f', 'pregunta', 'b6c4d6408d7ee757a5c25ca10f67cf641ecb0286695210d8921bfb1ef9d265a327fcef553e644b87', 'C', 'M');
INSERT INTO `Usuario` VALUES ('Emily.Moran@prueba.com', '0', 'Moran', '21148747', '1969-12-31 00:00:00', 'Emily', '58bc6bf3b6df9f4e06b3621e445aca8f2cd8aada414967ba6c64d1a5179772343e947639c3db84cd', 'pregunta', '966a86c0972472080112932b46d4bdbc07f1caefdbd21153b2ec2459e98a20cfa42100cc90abd940', 'C', 'M');
INSERT INTO `Usuario` VALUES ('gerente@frgp.utn.edu.ar', '1', 'Noble', '1234', '1963-11-23 00:00:00', 'Donna', 'c42623d2fad583bdf69b7d388859a871563becb39ce31ab8587bda5de037d5514333a0721119c8e3', 'pregunta', '6878592e64027d43580ae7084c26cc16495fccb582579075d089ca9730af15c9f7eeb48256ce1c3f', 'G', 'F');
INSERT INTO `Usuario` VALUES ('Hamish.Branch@prueba.com', '0', 'Branch', '61444967', '1969-12-31 00:00:00', 'Hamish', 'c3f5edcdcb1df1d9eb8e27330a92461dfca1d46c2010f850079733a4635a24fe285eccf57d2ceaf4', 'pregunta', '97d13bce74940b51301e0ec0d4f47c5977f191aeb6a0e1fd94b45f3b0ce44203e1f97b7e0af6129b', 'C', 'M');
INSERT INTO `Usuario` VALUES ('Hedy.Bradshaw@prueba.com', '0', 'Bradshaw', '72572694', '1969-12-31 00:00:00', 'Hedy', '740b51e1dd19d18deea08fca2d6d3d464331e59ccb2adf1c114e7ea3c3eff462b3bac023dbfab3d6', 'pregunta', '0f8eeeb34a69b1922bb22053b16cdc833b490f9f3a8773a9c1b13e21a77ca9c6916b7142885eb675', 'C', 'M');
INSERT INTO `Usuario` VALUES ('Hunter.Patel@prueba.com', '1', 'Patel', '19957625', '1969-12-31 00:00:00', 'Hunter', '1f100efb418c0cf042c1d3e04b30069e8a5cfba643fcd1519affb83cc70958661496ec44f6e77c34', 'pregunta', 'cc7adc413bf4676bc779f17ca93fec4e17e97570930fdc67b06fe7239c1abcc676e35ba4bb3ff428', 'C', 'M');
INSERT INTO `Usuario` VALUES ('Jordan.Jensen@prueba.com', '0', 'Jensen', '52247469', '1969-12-31 00:00:00', 'Jordan', 'df87d72e2d8f2eaff26c0f2357593dee2ebd2223653857bb8ab7c70bbd5700d0cf678c57c2d121c2', 'pregunta', '8f08a3b0af2c10ba35ef00fec3e0f5addbeefb4b233ebbcee650f549f7b61e6e8f715972eb9eb078', 'C', 'M');
INSERT INTO `Usuario` VALUES ('Josiah.Brady@prueba.com', '1', 'Brady', '82672493', '1969-12-31 00:00:00', 'Josiah', '24d74fee9bcd46ec97e4dc299340d7757c0ef0beab87817fd69457798df446d8afd77c22258ad0bb', 'pregunta', 'fe36be08004dc8b47c7473e82daec1e2eaaaa60f0d6f31e507504ab8b19f2a8c7f0b0918a3b2d914', 'C', 'M');
INSERT INTO `Usuario` VALUES ('Logan.Chase@prueba.com', '1', 'Chase', '83395372', '1969-12-31 00:00:00', 'Logan', 'b4f3791f893d7a92dcc915283cca98fa879e5c40a2a83acc10949d17bde726765f68c3ecf6eda85f', 'pregunta', '7744384131b404ea663acdfc0306256f70cd3bb5670c1f2172cf9963384cc4dc5693869c0484b727', 'C', 'F');
INSERT INTO `Usuario` VALUES ('Madeline.Bright@prueba.com', '0', 'Bright', '91712162', '1969-12-31 00:00:00', 'Madeline', 'ffb339f8bc9c93925f6bb74b30d629aa2f38f5c5cf2a35ce814ab8faf5ad22777d8527d26d047318', 'pregunta', 'ca0dd4cbb1a66123f81887cbcd2b06661924fb64e4bf9b8a239b6878494aec8fb6c66fd0b80d51e9', 'C', 'F');
INSERT INTO `Usuario` VALUES ('Maile.Morin@prueba.com', '0', 'Morin', '93584437', '1969-12-31 00:00:00', 'Maile', '3ee53d04dda3186cbeb471d98818bf2fa636e18df676878b72468e26a3448568ea96092137286f92', 'pregunta', '4e76351629a0d875f58ff7616067142dc248685cee5c3171239bb8a7665273a61f4cdca17b41588f', 'C', 'M');
INSERT INTO `Usuario` VALUES ('Melvin.Burns@prueba.com', '0', 'Burns', '15144683', '1969-12-31 00:00:00', 'Melvin', 'b6f4db43b88ab4880d04ebfc0cb821b79be0594e383695292d5360c8d47c344e2b2c9a9e4be06612', 'pregunta', '3888ee864fe61bff98b7c15b06c5a484f9f2fc700f8064d8c35b78381602340a95e5ec16b72588e6', 'C', 'M');
INSERT INTO `Usuario` VALUES ('Nehru.Flores@prueba.com', '1', 'Flores', '96261658', '1969-12-31 00:00:00', 'Nehru', 'ad81127a95bb2712dd0255f4f2f946aeddce1ba26336478919207c0184905142e3ef1f9a482bf288', 'pregunta', '751eed6ae457252dd3db114725708868ffac2a3e1b0b8c4363383dc9b7bb47bb3cc5e0328d3a5cd0', 'C', 'F');
INSERT INTO `Usuario` VALUES ('Phillip.Jennings@prueba.com', '1', 'Jennings', '51822956', '1969-12-31 00:00:00', 'Phillip', '02d0718f7cf8f6e36d558dc3f53b792d57eea62c2f7c5f517f0af9f8517bfbdcc49484ae1052a134', 'pregunta', 'be5534648919bcc0093ca82298f695e003c18fe8a66a33f5c433c5655608d6968ebd09f0423a4b8d', 'C', 'F');
INSERT INTO `Usuario` VALUES ('prueba@frgp.utn.edu.ar', '0', 'Perez', '123456', '1988-11-01 00:00:00', 'Juan', '7348f32b49df80286883fe3828a9a8cad7d18b9645ffbd623846097b086b24205e046294a82413ad', 'pregunta', '59bb7921602be31b184779fcf3de42e0207db081029c5c67ec8a284c5018f1fc06538d6f50fe2c38', 'C', 'M');
INSERT INTO `Usuario` VALUES ('Reese.Mcintosh@prueba.com', '0', 'Mcintosh', '45161489', '1969-12-31 00:00:00', 'Reese', 'd037cf4521c21957b0454c30606a3a4ea039e3a283ef810099427a36e31c5e940ac200e477a5215c', 'pregunta', 'd57ab1e5409032d9551b5e929bf7950c41fc887e38db07b581860470a85029898d20f3e14666975f', 'C', 'M');
INSERT INTO `Usuario` VALUES ('Reuben.Jenkins@prueba.com', '0', 'Jenkins', '61123281', '1969-12-31 00:00:00', 'Reuben', 'f0e9323427c008057dae1e55990971f1043c87a06c6279f3799a5a8bb8df383a01a9731a355cb720', 'pregunta', '9e7141646109cb708b4315d5ce7345d9d9bdfd51ad68b5fb16cb266db085e7efc1ce114d723b4f04', 'C', 'F');
INSERT INTO `Usuario` VALUES ('Rhea.Kirkland@prueba.com', '0', 'Kirkland', '82732926', '1969-12-31 00:00:00', 'Rhea', '4ef6f31203f0fbc90db6f1c228d16571b01790d3ceb673be5b4bb2a1528c0721a383949d4221076b', 'pregunta', 'e3310703ebcdc0c1b1fc058feab64da6311739c2142662e5676b772dd3387cb51351d41e2960267b', 'C', 'M');
INSERT INTO `Usuario` VALUES ('Shannon.Yang@prueba.com', '1', 'Yang', '49293522', '1969-12-31 00:00:00', 'Shannon', '7987b2dcd01b7628dd9ea331b842681c3f582a40f4f9171b456d63f3f2a6b43dba80ea15438b13f2', 'pregunta', '35212b153070e66712f59a0bdb7d9560e68d0f3b0aed1efba083d8d48d90bf17f0c794a1079c2469', 'C', 'M');
INSERT INTO `Usuario` VALUES ('Sigourney.Snyder@prueba.com', '1', 'Snyder', '36114643', '1969-12-31 00:00:00', 'Sigourney', '82a3b04e8326aba2e98be48d04901ee44d1da1b0a064b8911c60f976a9b67c7e9a80cb3dffed7ad2', 'pregunta', '80e90b67da823becd859924f9e6f37eb8f7debaaa81136e98f8d9841dc90091d395597b01223f2d4', 'C', 'M');
INSERT INTO `Usuario` VALUES ('Virginia.Ball@prueba.com', '1', 'Ball', '99467266', '1969-12-31 00:00:00', 'Virginia', '9b6fe49ba4951daeb2b90efd8ee18f038496cb4538635132a90ff507cbef2ae82ea12d963a7f1d4f', 'pregunta', 'b83119c89cfb2416266c9e3d96eb71fa7b588face126170bef1c4c18d464c95e0f4e6bf3f942cf1e', 'C', 'F');
INSERT INTO `Usuario` VALUES ('Whitney.Vaughn@prueba.com', '0', 'Vaughn', '47831324', '1969-12-31 00:00:00', 'Whitney', 'adbfb3a66e82baa91cce45758f8c3a1122b22ab82d8920c70185a95552c2ac2a957a638578e02850', 'pregunta', 'c82bf63e317a2d692f49ac92d9da15d7437cc0f1ce9da7dce5a4636c1993482eee5e0034a0bd54b8', 'C', 'F');
INSERT INTO `Usuario` VALUES ('Zephr.Suarez@prueba.com', '0', 'Suarez', '14381328', '1969-12-31 00:00:00', 'Zephr', '4daf47ee933b813c04cd12a7c4028fc1d65385b2fcea5c3966b54865444899ee211f84b9521c5e00', 'pregunta', '9cf2f8abf2cb9e839d3a27775ef22bffbf8f241f65079b7e3c79f0db2e0b595452c984afa1a1efdb', 'C', 'F');