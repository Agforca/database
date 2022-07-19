-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 19-07-2022 a las 20:55:13
-- Versión del servidor: 8.0.29
-- Versión de PHP: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `portfolio`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `domicilio`
--

DROP TABLE IF EXISTS `domicilio`;
CREATE TABLE IF NOT EXISTS `domicilio` (
  `iddomicilio` int NOT NULL,
  `calle` varchar(45) DEFAULT NULL,
  `numero` int DEFAULT NULL,
  `piso` varchar(45) DEFAULT NULL,
  `departamento` varchar(45) DEFAULT NULL,
  `localidad` varchar(45) DEFAULT NULL,
  `provincia` varchar(45) DEFAULT NULL,
  `pais` varchar(45) DEFAULT NULL,
  `codigoPostal` int DEFAULT NULL,
  `persona_id` int NOT NULL,
  PRIMARY KEY (`iddomicilio`,`persona_id`),
  KEY `fk_domicilio_persona1_idx` (`persona_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `domicilio`
--

INSERT INTO `domicilio` (`iddomicilio`, `calle`, `numero`, `piso`, `departamento`, `localidad`, `provincia`, `pais`, `codigoPostal`, `persona_id`) VALUES
(1, 'Hipólito Yrigoyen', 3115, 'PB', 'A', 'Santa Fe', 'Santa Fe', 'Argentina', 3000, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `educacion`
--

DROP TABLE IF EXISTS `educacion`;
CREATE TABLE IF NOT EXISTS `educacion` (
  `ideducacion` int NOT NULL,
  `nombreInstitucion` varchar(45) DEFAULT NULL,
  `titulo` varchar(45) DEFAULT NULL,
  `fechaInicio` date DEFAULT NULL,
  `fechaFin` date DEFAULT NULL,
  `urlIcono` blob,
  `persona_id` int NOT NULL,
  PRIMARY KEY (`ideducacion`,`persona_id`),
  KEY `fk_educacion_persona1_idx` (`persona_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `educacion`
--

INSERT INTO `educacion` (`ideducacion`, `nombreInstitucion`, `titulo`, `fechaInicio`, `fechaFin`, `urlIcono`, `persona_id`) VALUES
(1, 'UNL', 'Doctor en Ingeniería Química', '2017-04-01', '2022-07-08', 0x7777772e666f746f2e636f6d2f69636f6e6f756e6c, 1),
(2, 'UNL', 'Ingeniero Químico', '2011-03-01', '2017-02-27', 0x7777772e666f746f2e636f6d2f69636f6e6f756e6c, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `experiencia_laboral`
--

DROP TABLE IF EXISTS `experiencia_laboral`;
CREATE TABLE IF NOT EXISTS `experiencia_laboral` (
  `id` int NOT NULL,
  `nombreEmpresa` varchar(45) DEFAULT NULL,
  `esTrabajoActual` tinyint DEFAULT NULL,
  `fechaInicio` date DEFAULT NULL,
  `fechaFin` date DEFAULT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `persona_id` int NOT NULL,
  `tipo_empleo_id` int NOT NULL,
  PRIMARY KEY (`id`,`persona_id`,`tipo_empleo_id`),
  KEY `fk_experiencia_laboral_persona_idx` (`persona_id`),
  KEY `fk_experiencia_laboral_tipo_empleo1_idx` (`tipo_empleo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `experiencia_laboral`
--

INSERT INTO `experiencia_laboral` (`id`, `nombreEmpresa`, `esTrabajoActual`, `fechaInicio`, `fechaFin`, `descripcion`, `persona_id`, `tipo_empleo_id`) VALUES
(1, 'INTEC (UNL-CONICET)', 0, '2017-04-01', '2022-07-08', 'Becario Doctoral', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `habilidades`
--

DROP TABLE IF EXISTS `habilidades`;
CREATE TABLE IF NOT EXISTS `habilidades` (
  `idhabilidades` int NOT NULL,
  `nombreHabilidad` varchar(45) DEFAULT NULL,
  `porcentajeHabilidad` int DEFAULT NULL,
  `persona_id` int NOT NULL,
  PRIMARY KEY (`idhabilidades`,`persona_id`),
  KEY `fk_habilidades_persona1_idx` (`persona_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `habilidades`
--

INSERT INTO `habilidades` (`idhabilidades`, `nombreHabilidad`, `porcentajeHabilidad`, `persona_id`) VALUES
(1, 'Office 365', 80, 1),
(2, 'Science Databases', 90, 1),
(3, 'Origin Software', 65, 1),
(4, 'Team Managment', 75, 1),
(5, 'Research and Development', 85, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `idiomas`
--

DROP TABLE IF EXISTS `idiomas`;
CREATE TABLE IF NOT EXISTS `idiomas` (
  `ididiomas` int NOT NULL,
  `nombreIdioma` varchar(45) DEFAULT NULL,
  `porcentajeIdioma` int DEFAULT NULL,
  `persona_id` int NOT NULL,
  PRIMARY KEY (`ididiomas`,`persona_id`),
  KEY `fk_idiomas_persona1_idx` (`persona_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `idiomas`
--

INSERT INTO `idiomas` (`ididiomas`, `nombreIdioma`, `porcentajeIdioma`, `persona_id`) VALUES
(1, 'Español', 100, 1),
(2, 'Inglés', 90, 1),
(3, 'Francés', 80, 1),
(4, 'Portugués', 30, 1),
(5, 'Alemán', 5, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

DROP TABLE IF EXISTS `persona`;
CREATE TABLE IF NOT EXISTS `persona` (
  `id` int NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `profesion` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `domicilio` varchar(45) DEFAULT NULL,
  `fechaNac` date DEFAULT NULL,
  `telefono` varchar(12) DEFAULT NULL,
  `correo` varchar(45) DEFAULT NULL,
  `sobre_mi` varchar(200) DEFAULT NULL,
  `url_foto` blob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`id`, `nombre`, `apellido`, `profesion`, `domicilio`, `fechaNac`, `telefono`, `correo`, `sobre_mi`, `url_foto`) VALUES
(1, 'Agustin', 'Forchetti', 'Doctor en Ingeniería Química', 'Santa Fe', '1991-06-09', '4122345', 'agu@gmail.com', 'Entusiasta de la programación', 0x7777772e666f746f2e636f6d2f666f746f616775);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyectos`
--

DROP TABLE IF EXISTS `proyectos`;
CREATE TABLE IF NOT EXISTS `proyectos` (
  `idproyectos` int NOT NULL,
  `nombreProyecto` varchar(45) DEFAULT NULL,
  `fechaInicio` date DEFAULT NULL,
  `fechaFin` date DEFAULT NULL,
  `descripcionProyecto` varchar(45) DEFAULT NULL,
  `urlIconoProyecto` blob,
  `persona_id` int NOT NULL,
  PRIMARY KEY (`idproyectos`,`persona_id`),
  KEY `fk_proyectos_persona1_idx` (`persona_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `proyectos`
--

INSERT INTO `proyectos` (`idproyectos`, `nombreProyecto`, `fechaInicio`, `fechaFin`, `descripcionProyecto`, `urlIconoProyecto`, `persona_id`) VALUES
(1, 'Desarrollo de Termoestables Biobasados', '2017-04-01', '2022-07-08', 'Desarrollo de Benzoxazinas', 0x7777772e69636f6e6f2e636f6d2f69636f6e6f70726f796563746f, 1),
(2, 'Portoflio Web AR Programa', '2022-02-01', '2022-08-31', 'Desarrollo de CV WEB', 0x7777772e69636f6e6f2e636f6d2f69636f6e6f70726f796563746f32, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_empleo`
--

DROP TABLE IF EXISTS `tipo_empleo`;
CREATE TABLE IF NOT EXISTS `tipo_empleo` (
  `id` int NOT NULL,
  `nombre_tipo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `tipo_empleo`
--

INSERT INTO `tipo_empleo` (`id`, `nombre_tipo`) VALUES
(1, 'Full-time'),
(2, 'Part-time');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `idusuario` int NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `contraseña` varchar(45) DEFAULT NULL,
  `persona_id` int NOT NULL,
  PRIMARY KEY (`idusuario`,`persona_id`),
  KEY `fk_usuario_persona1_idx` (`persona_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `domicilio`
--
ALTER TABLE `domicilio`
  ADD CONSTRAINT `fk_domicilio_persona1` FOREIGN KEY (`persona_id`) REFERENCES `persona` (`id`);

--
-- Filtros para la tabla `educacion`
--
ALTER TABLE `educacion`
  ADD CONSTRAINT `fk_educacion_persona1` FOREIGN KEY (`persona_id`) REFERENCES `persona` (`id`);

--
-- Filtros para la tabla `experiencia_laboral`
--
ALTER TABLE `experiencia_laboral`
  ADD CONSTRAINT `fk_experiencia_laboral_persona` FOREIGN KEY (`persona_id`) REFERENCES `persona` (`id`),
  ADD CONSTRAINT `fk_experiencia_laboral_tipo_empleo1` FOREIGN KEY (`tipo_empleo_id`) REFERENCES `tipo_empleo` (`id`);

--
-- Filtros para la tabla `habilidades`
--
ALTER TABLE `habilidades`
  ADD CONSTRAINT `fk_habilidades_persona1` FOREIGN KEY (`persona_id`) REFERENCES `persona` (`id`);

--
-- Filtros para la tabla `idiomas`
--
ALTER TABLE `idiomas`
  ADD CONSTRAINT `fk_idiomas_persona1` FOREIGN KEY (`persona_id`) REFERENCES `persona` (`id`);

--
-- Filtros para la tabla `proyectos`
--
ALTER TABLE `proyectos`
  ADD CONSTRAINT `fk_proyectos_persona1` FOREIGN KEY (`persona_id`) REFERENCES `persona` (`id`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_usuario_persona1` FOREIGN KEY (`persona_id`) REFERENCES `persona` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
