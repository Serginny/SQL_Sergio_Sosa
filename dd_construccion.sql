-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-08-2024 a las 02:36:55
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `dd_construccion`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `albañil`
--

CREATE TABLE `albañil` (
  `id_albañil` int(11) NOT NULL,
  `Albañil_nombre` varchar(45) DEFAULT NULL,
  `id_albañil_proyecto` int(11) DEFAULT NULL,
  `Localidad_albañil` varchar(45) DEFAULT NULL,
  `Dia_de_contrato` date DEFAULT NULL,
  `Hora_de_contrato` time DEFAULT NULL,
  `id_albañil_LD_obra` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialidad`
--

CREATE TABLE `especialidad` (
  `id_especialidad` int(11) NOT NULL,
  `Nombre_especialidad` varchar(45) DEFAULT NULL,
  `id_Albañil_especialidad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lider_de_obra`
--

CREATE TABLE `lider_de_obra` (
  `ID_LD_obra` int(11) NOT NULL,
  `Nombre_LD_obra` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materiales`
--

CREATE TABLE `materiales` (
  `id_material` int(11) NOT NULL,
  `Descripcion` varchar(45) DEFAULT NULL,
  `id_Vend_Material` int(11) DEFAULT NULL,
  `Precio` varchar(45) DEFAULT NULL,
  `Marca` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyecto`
--

CREATE TABLE `proyecto` (
  `id_proyecto` int(11) NOT NULL,
  `Cliente_proyecto` varchar(45) DEFAULT NULL,
  `Fecha_de_inicio` date DEFAULT NULL,
  `Fecha_de_finalizacion` date DEFAULT NULL,
  `proyecto_descripcion` varchar(45) DEFAULT NULL,
  `id_LD_obra_proyecto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vendedores`
--

CREATE TABLE `vendedores` (
  `id_Vend` int(11) NOT NULL,
  `Vend_name` varchar(45) DEFAULT NULL,
  `Localizacion_Vend` varchar(45) DEFAULT NULL,
  `Vend_telefono` varchar(45) DEFAULT NULL,
  `id_LD_obra_compra` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `albañil`
--
ALTER TABLE `albañil`
  ADD PRIMARY KEY (`id_albañil`),
  ADD KEY `id_albañil_proyecto` (`id_albañil_proyecto`),
  ADD KEY `id_albañil_LD_obra` (`id_albañil_LD_obra`);

--
-- Indices de la tabla `especialidad`
--
ALTER TABLE `especialidad`
  ADD PRIMARY KEY (`id_especialidad`),
  ADD KEY `id_Albañil_especialidad` (`id_Albañil_especialidad`);

--
-- Indices de la tabla `lider_de_obra`
--
ALTER TABLE `lider_de_obra`
  ADD PRIMARY KEY (`ID_LD_obra`);

--
-- Indices de la tabla `materiales`
--
ALTER TABLE `materiales`
  ADD PRIMARY KEY (`id_material`),
  ADD KEY `id_Vend_Material` (`id_Vend_Material`);

--
-- Indices de la tabla `proyecto`
--
ALTER TABLE `proyecto`
  ADD PRIMARY KEY (`id_proyecto`),
  ADD KEY `id_LD_obra_proyecto` (`id_LD_obra_proyecto`);

--
-- Indices de la tabla `vendedores`
--
ALTER TABLE `vendedores`
  ADD PRIMARY KEY (`id_Vend`),
  ADD KEY `id_LD_obra_compra` (`id_LD_obra_compra`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `albañil`
--
ALTER TABLE `albañil`
  MODIFY `id_albañil` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `especialidad`
--
ALTER TABLE `especialidad`
  MODIFY `id_especialidad` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `lider_de_obra`
--
ALTER TABLE `lider_de_obra`
  MODIFY `ID_LD_obra` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `proyecto`
--
ALTER TABLE `proyecto`
  MODIFY `id_proyecto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `vendedores`
--
ALTER TABLE `vendedores`
  MODIFY `id_Vend` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `albañil`
--
ALTER TABLE `albañil`
  ADD CONSTRAINT `albañil_ibfk_1` FOREIGN KEY (`id_albañil_proyecto`) REFERENCES `proyecto` (`id_proyecto`),
  ADD CONSTRAINT `albañil_ibfk_2` FOREIGN KEY (`id_albañil_LD_obra`) REFERENCES `lider_de_obra` (`ID_LD_obra`);

--
-- Filtros para la tabla `especialidad`
--
ALTER TABLE `especialidad`
  ADD CONSTRAINT `especialidad_ibfk_1` FOREIGN KEY (`id_Albañil_especialidad`) REFERENCES `albañil` (`id_albañil`);

--
-- Filtros para la tabla `materiales`
--
ALTER TABLE `materiales`
  ADD CONSTRAINT `materiales_ibfk_1` FOREIGN KEY (`id_Vend_Material`) REFERENCES `vendedores` (`id_Vend`);

--
-- Filtros para la tabla `proyecto`
--
ALTER TABLE `proyecto`
  ADD CONSTRAINT `proyecto_ibfk_1` FOREIGN KEY (`id_LD_obra_proyecto`) REFERENCES `lider_de_obra` (`ID_LD_obra`);

--
-- Filtros para la tabla `vendedores`
--
ALTER TABLE `vendedores`
  ADD CONSTRAINT `vendedores_ibfk_1` FOREIGN KEY (`id_LD_obra_compra`) REFERENCES `lider_de_obra` (`ID_LD_obra`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
