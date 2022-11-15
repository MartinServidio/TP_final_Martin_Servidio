-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-11-2022 a las 23:44:10
-- Versión del servidor: 10.4.25-MariaDB
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `subte`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `accesos`
--

CREATE TABLE `accesos` (
  `id_acceso` int(11) NOT NULL,
  `id_estacion` int(11) NOT NULL,
  `numero` int(30) NOT NULL,
  `calle` varchar(30) NOT NULL,
  `altura` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `boleteria`
--

CREATE TABLE `boleteria` (
  `id_boleteria` int(11) NOT NULL,
  `id_boleto` int(11) NOT NULL,
  `cantBoletosVendidos` int(200) NOT NULL,
  `id_estacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `boletos`
--

CREATE TABLE `boletos` (
  `id_boleto` int(11) NOT NULL,
  `precio` int(11) NOT NULL,
  `linea_a_viajar` varchar(20) NOT NULL,
  `fechaCompra` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cocheras`
--

CREATE TABLE `cocheras` (
  `id_cochera` int(11) NOT NULL,
  `cantMaquinasMax` int(50) NOT NULL,
  `cantVagonesMax` int(50) NOT NULL,
  `cantVagonesActual` int(50) NOT NULL,
  `cantMaquinasActual` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estaciones`
--

CREATE TABLE `estaciones` (
  `id_estacion` int(11) NOT NULL,
  `codigo_numerico` int(30) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `horaApertura` varchar(30) NOT NULL,
  `horaCierre` varchar(30) NOT NULL,
  `numBoleterias` int(40) NOT NULL,
  `id_cochera` int(11) NOT NULL,
  `id_boleteria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gps`
--

CREATE TABLE `gps` (
  `id_gps` int(11) NOT NULL,
  `id_estacion_mas_cercana` int(11) NOT NULL,
  `minutos_de_llegada` int(40) NOT NULL,
  `estado` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lineas`
--

CREATE TABLE `lineas` (
  `id_lineas` int(11) NOT NULL,
  `letra` varchar(10) NOT NULL,
  `color` varchar(20) NOT NULL,
  `primerTren` varchar(30) NOT NULL,
  `segundoTren` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rel_lineas_estaciones`
--

CREATE TABLE `rel_lineas_estaciones` (
  `id_rel_lineas_estaciones` int(11) NOT NULL,
  `id_linea` int(11) NOT NULL,
  `id_estacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id_rol` int(10) NOT NULL,
  `descripcion` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trenes`
--

CREATE TABLE `trenes` (
  `id_trenes` int(11) NOT NULL,
  `numero` int(30) NOT NULL,
  `estado` varchar(40) NOT NULL,
  `fechaCompra` varchar(40) NOT NULL,
  `modelo` varchar(40) NOT NULL,
  `cantVagones` int(20) NOT NULL,
  `cantAsientos` int(20) NOT NULL,
  `cantPersonasParadas` int(20) NOT NULL,
  `id_cochera` int(11) NOT NULL,
  `id_gps` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `contraseña` varchar(30) NOT NULL,
  `id_rol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `accesos`
--
ALTER TABLE `accesos`
  ADD PRIMARY KEY (`id_acceso`),
  ADD KEY `id_estacion` (`id_estacion`);

--
-- Indices de la tabla `boleteria`
--
ALTER TABLE `boleteria`
  ADD PRIMARY KEY (`id_boleteria`),
  ADD KEY `id_boleto` (`id_boleto`),
  ADD KEY `id_estacion` (`id_estacion`);

--
-- Indices de la tabla `boletos`
--
ALTER TABLE `boletos`
  ADD PRIMARY KEY (`id_boleto`);

--
-- Indices de la tabla `cocheras`
--
ALTER TABLE `cocheras`
  ADD PRIMARY KEY (`id_cochera`);

--
-- Indices de la tabla `estaciones`
--
ALTER TABLE `estaciones`
  ADD PRIMARY KEY (`id_estacion`);

--
-- Indices de la tabla `gps`
--
ALTER TABLE `gps`
  ADD PRIMARY KEY (`id_gps`),
  ADD KEY `id_estacion_mas_cercana` (`id_estacion_mas_cercana`);

--
-- Indices de la tabla `lineas`
--
ALTER TABLE `lineas`
  ADD PRIMARY KEY (`id_lineas`);

--
-- Indices de la tabla `rel_lineas_estaciones`
--
ALTER TABLE `rel_lineas_estaciones`
  ADD PRIMARY KEY (`id_rel_lineas_estaciones`),
  ADD KEY `id_linea` (`id_linea`),
  ADD KEY `id_estacion` (`id_estacion`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indices de la tabla `trenes`
--
ALTER TABLE `trenes`
  ADD PRIMARY KEY (`id_trenes`),
  ADD KEY `id_cochera` (`id_cochera`),
  ADD KEY `id_gps` (`id_gps`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `id_rol` (`id_rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `accesos`
--
ALTER TABLE `accesos`
  MODIFY `id_acceso` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `boleteria`
--
ALTER TABLE `boleteria`
  MODIFY `id_boleteria` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `boletos`
--
ALTER TABLE `boletos`
  MODIFY `id_boleto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cocheras`
--
ALTER TABLE `cocheras`
  MODIFY `id_cochera` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estaciones`
--
ALTER TABLE `estaciones`
  MODIFY `id_estacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `gps`
--
ALTER TABLE `gps`
  MODIFY `id_gps` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `lineas`
--
ALTER TABLE `lineas`
  MODIFY `id_lineas` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `rel_lineas_estaciones`
--
ALTER TABLE `rel_lineas_estaciones`
  MODIFY `id_rel_lineas_estaciones` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id_rol` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `trenes`
--
ALTER TABLE `trenes`
  MODIFY `id_trenes` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `accesos`
--
ALTER TABLE `accesos`
  ADD CONSTRAINT `accesos_ibfk_1` FOREIGN KEY (`id_estacion`) REFERENCES `accesos` (`id_acceso`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `boleteria`
--
ALTER TABLE `boleteria`
  ADD CONSTRAINT `boleteria_ibfk_1` FOREIGN KEY (`id_boleto`) REFERENCES `boletos` (`id_boleto`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `boleteria_ibfk_2` FOREIGN KEY (`id_estacion`) REFERENCES `estaciones` (`id_estacion`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `gps`
--
ALTER TABLE `gps`
  ADD CONSTRAINT `gps_ibfk_1` FOREIGN KEY (`id_estacion_mas_cercana`) REFERENCES `estaciones` (`id_estacion`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `rel_lineas_estaciones`
--
ALTER TABLE `rel_lineas_estaciones`
  ADD CONSTRAINT `rel_lineas_estaciones_ibfk_1` FOREIGN KEY (`id_linea`) REFERENCES `lineas` (`id_lineas`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rel_lineas_estaciones_ibfk_2` FOREIGN KEY (`id_estacion`) REFERENCES `estaciones` (`id_estacion`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `trenes`
--
ALTER TABLE `trenes`
  ADD CONSTRAINT `trenes_ibfk_1` FOREIGN KEY (`id_cochera`) REFERENCES `cocheras` (`id_cochera`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `trenes_ibfk_2` FOREIGN KEY (`id_gps`) REFERENCES `gps` (`id_gps`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
