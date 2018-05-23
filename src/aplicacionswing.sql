-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3307
-- Tiempo de generación: 22-05-2018 a las 15:51:07
-- Versión del servidor: 5.7.21
-- Versión de PHP: 7.1.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `aplicacionswing`
--
CREATE DATABASE IF NOT EXISTS `aplicacionswing` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `aplicacionswing`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnos`
--

CREATE TABLE `alumnos` (
  `Nombre` varchar(500) NOT NULL,
  `Apellido` varchar(500) NOT NULL,
  `DNI_Alumno` varchar(500) NOT NULL,
  `Email` varchar(500) NOT NULL,
  `Telefono` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `alumnos`
--

INSERT INTO `alumnos` (`Nombre`, `Apellido`, `DNI_Alumno`, `Email`, `Telefono`) VALUES
('Lucas', 'Pajares', '1234567-L', 'lucas.pajares@gmail.com', 123456789),
('Kiran', 'Lorenzo', '1236542-K', 'kiran.lorenzo@gmail.com', 123487653),
('Conrado', 'Delso', '2345678-C', 'conrado.delso@gmail.com', 234567890),
('Pablo', 'Cruz', '3456789-P', 'pablo.cruz@gmail.com', 123456970),
('Sebastián', 'Tangarife', '4567891-S', 'sebastian.tangarife@gmail.com', 123543765);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnos_aceptados`
--

CREATE TABLE `alumnos_aceptados` (
  `DNI_Alumno` varchar(500) NOT NULL,
  `Num_Convenio` varchar(15) NOT NULL,
  `Calificacion_Empresa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnos_tematicas`
--

CREATE TABLE `alumnos_tematicas` (
  `DNI_Alumno` varchar(500) NOT NULL,
  `ID_Tematica` int(11) NOT NULL,
  `ID_PK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignacion_definitiva`
--

CREATE TABLE `asignacion_definitiva` (
  `DNI_Alumno` varchar(500) NOT NULL,
  `Num_Convenio` varchar(500) NOT NULL,
  `Ubicacion` varchar(500) NOT NULL,
  `Tutor` varchar(500) NOT NULL,
  `Fecha_Inicio` varchar(500) NOT NULL,
  `Fecha_Fin` varchar(500) NOT NULL,
  `Jornada` varchar(500) NOT NULL,
  `ID_Tematica` int(11) NOT NULL,
  `ID_Practica` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `asignacion_definitiva`
--

INSERT INTO `asignacion_definitiva` (`DNI_Alumno`, `Num_Convenio`, `Ubicacion`, `Tutor`, `Fecha_Inicio`, `Fecha_Fin`, `Jornada`, `ID_Tematica`, `ID_Practica`) VALUES
('Pablo Cruz', 'Microsoft', 'C/ Fernando Sánchez, 10, Madrid', 'Javier', '12-04-2019', '15-06-2019', 'Lunes a viernes, de 9h a 15h', 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresas`
--

CREATE TABLE `empresas` (
  `Nombre` varchar(500) NOT NULL,
  `Num_Convenio` varchar(500) NOT NULL,
  `Responsable` varchar(500) NOT NULL,
  `Fecha_Convenio` varchar(500) NOT NULL,
  `Email` varchar(500) NOT NULL,
  `Telefono` int(20) NOT NULL,
  `Ubicacion` varchar(500) NOT NULL,
  `Imagen` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `empresas`
--

INSERT INTO `empresas` (`Nombre`, `Num_Convenio`, `Responsable`, `Fecha_Convenio`, `Email`, `Telefono`, `Ubicacion`, `Imagen`) VALUES
('Microsoft', '013-CM', 'Mónica', '12-04-2017', 'administracion@microsoft.com', 123456789, 'C/Fernando Sánchez, 10, Madrid', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresas_seleccionadas_por_alumno`
--

CREATE TABLE `empresas_seleccionadas_por_alumno` (
  `DNI_Alumno` varchar(500) NOT NULL,
  `Num_Convenio` varchar(500) NOT NULL,
  `Orden_Preferencia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresas_tematicas`
--

CREATE TABLE `empresas_tematicas` (
  `ID_PK` int(11) NOT NULL,
  `Num_Convenio` varchar(500) NOT NULL,
  `ID_Tematica` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entrevista`
--

CREATE TABLE `entrevista` (
  `Codigo` int(11) NOT NULL,
  `Fecha` datetime NOT NULL,
  `Ubicacion` varchar(500) NOT NULL,
  `DNI_Alumno` varchar(500) DEFAULT NULL,
  `Num_Convenio` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `login`
--

CREATE TABLE `login` (
  `Usuario` varchar(500) NOT NULL,
  `Contraseña` varchar(50) NOT NULL,
  `Rol` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `login`
--

INSERT INTO `login` (`Usuario`, `Contraseña`, `Rol`) VALUES
('profesor@live.u-tad.com', 'hola1234', 'Profesor'),
('sebastian.tangarife@live.u-tad.com', 'hola123', 'Alumno');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tematicas`
--

CREATE TABLE `tematicas` (
  `Nombre` varchar(500) NOT NULL,
  `ID_Tematica` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tematicas`
--

INSERT INTO `tematicas` (`Nombre`, `ID_Tematica`) VALUES
('Videojuegos', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  ADD PRIMARY KEY (`DNI_Alumno`);

--
-- Indices de la tabla `alumnos_aceptados`
--
ALTER TABLE `alumnos_aceptados`
  ADD PRIMARY KEY (`DNI_Alumno`,`Num_Convenio`),
  ADD KEY `Num_Convenio` (`Num_Convenio`);

--
-- Indices de la tabla `alumnos_tematicas`
--
ALTER TABLE `alumnos_tematicas`
  ADD PRIMARY KEY (`ID_PK`),
  ADD KEY `DNI_Alumno` (`DNI_Alumno`);

--
-- Indices de la tabla `asignacion_definitiva`
--
ALTER TABLE `asignacion_definitiva`
  ADD PRIMARY KEY (`ID_Practica`),
  ADD KEY `DNI_Alumno` (`DNI_Alumno`),
  ADD KEY `Num_Convenio` (`Num_Convenio`);

--
-- Indices de la tabla `empresas`
--
ALTER TABLE `empresas`
  ADD PRIMARY KEY (`Num_Convenio`);

--
-- Indices de la tabla `empresas_seleccionadas_por_alumno`
--
ALTER TABLE `empresas_seleccionadas_por_alumno`
  ADD PRIMARY KEY (`DNI_Alumno`,`Num_Convenio`),
  ADD KEY `Num_Convenio` (`Num_Convenio`);

--
-- Indices de la tabla `empresas_tematicas`
--
ALTER TABLE `empresas_tematicas`
  ADD PRIMARY KEY (`ID_PK`);

--
-- Indices de la tabla `entrevista`
--
ALTER TABLE `entrevista`
  ADD PRIMARY KEY (`Codigo`),
  ADD KEY `DNI_Alumno` (`DNI_Alumno`,`Num_Convenio`),
  ADD KEY `Fecha` (`Fecha`),
  ADD KEY `Num_Convenio` (`Num_Convenio`);

--
-- Indices de la tabla `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`Usuario`);

--
-- Indices de la tabla `tematicas`
--
ALTER TABLE `tematicas`
  ADD PRIMARY KEY (`ID_Tematica`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alumnos_tematicas`
--
ALTER TABLE `alumnos_tematicas`
  MODIFY `ID_PK` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `asignacion_definitiva`
--
ALTER TABLE `asignacion_definitiva`
  MODIFY `ID_Practica` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `empresas_tematicas`
--
ALTER TABLE `empresas_tematicas`
  MODIFY `ID_PK` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `entrevista`
--
ALTER TABLE `entrevista`
  MODIFY `Codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tematicas`
--
ALTER TABLE `tematicas`
  MODIFY `ID_Tematica` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alumnos_aceptados`
--
ALTER TABLE `alumnos_aceptados`
  ADD CONSTRAINT `alumnos_aceptados_ibfk_1` FOREIGN KEY (`DNI_Alumno`) REFERENCES `alumnos` (`DNI_Alumno`),
  ADD CONSTRAINT `alumnos_aceptados_ibfk_2` FOREIGN KEY (`Num_Convenio`) REFERENCES `empresas` (`Num_Convenio`);

--
-- Filtros para la tabla `alumnos_tematicas`
--
ALTER TABLE `alumnos_tematicas`
  ADD CONSTRAINT `alumnos_tematicas_ibfk_1` FOREIGN KEY (`DNI_Alumno`) REFERENCES `alumnos` (`DNI_Alumno`);

--
-- Filtros para la tabla `empresas_seleccionadas_por_alumno`
--
ALTER TABLE `empresas_seleccionadas_por_alumno`
  ADD CONSTRAINT `empresas_seleccionadas_por_alumno_ibfk_1` FOREIGN KEY (`DNI_Alumno`) REFERENCES `alumnos` (`DNI_Alumno`),
  ADD CONSTRAINT `empresas_seleccionadas_por_alumno_ibfk_2` FOREIGN KEY (`Num_Convenio`) REFERENCES `empresas` (`Num_Convenio`);

--
-- Filtros para la tabla `entrevista`
--
ALTER TABLE `entrevista`
  ADD CONSTRAINT `entrevista_ibfk_1` FOREIGN KEY (`DNI_Alumno`) REFERENCES `alumnos` (`DNI_Alumno`),
  ADD CONSTRAINT `entrevista_ibfk_2` FOREIGN KEY (`Num_Convenio`) REFERENCES `empresas` (`Num_Convenio`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

--
--query para el login
--
--SELECT * FROM login WHERE usuario = '"+usuario+"'&&password='"+password+"'
