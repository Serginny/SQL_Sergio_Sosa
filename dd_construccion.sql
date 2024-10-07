-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-10-2024 a las 13:04:50
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

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `AumentarPrecioMaterial` (IN `idmaterial` INT, IN `porcentaje_aumento` DECIMAL(5,2))   BEGIN
    UPDATE materiales
    SET Precio = Precio * (1 + porcentaje_aumento / 100)
    WHERE id_material = idmaterial;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Ordenar_materiales_por_campo` (IN `campo` VARCHAR(44), IN `tipo_ordenamiento` ENUM('ASC','DESC'))   BEGIN
    IF campo <> '' THEN
        SET @Ordenar = CONCAT(' ORDER BY ', campo);
    ELSE
        SET @Ordenar = '';
    END IF;

    IF tipo_ordenamiento <> '' THEN
        SET @tipo = CONCAT(' ', tipo_ordenamiento);
    ELSE
        SET @tipo = '';
    END IF;
    SET @clausula = CONCAT('SELECT id_material, Descripcion, id_Vend_Material, Precio, Marca, Cant FROM materiales', @Ordenar, @tipo);
    PREPARE ejecutarSQL FROM @clausula;
    EXECUTE ejecutarSQL;
    DEALLOCATE PREPARE ejecutarSQL;
END$$

--
-- Funciones
--
CREATE DEFINER=`root`@`localhost` FUNCTION `Cantidad_material` (`l_Descripcion` VARCHAR(44)) RETURNS INT(11) DETERMINISTIC BEGIN
   DECLARE Cant_var INT;
   SELECT Cant INTO Cant_var
   FROM materiales
   WHERE Descripcion = l_Descripcion;
   RETURN Cant_var;
  
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `F_nombredecliente_idLDobra` (`param_id_proyecto` INT) RETURNS CHAR(50) CHARSET utf8mb4 COLLATE utf8mb4_general_ci DETERMINISTIC BEGIN
    DECLARE var CHAR(50);
    SELECT CONCAT(Cliente_proyecto, ' ', id_LD_obra_proyecto) INTO var 
    FROM proyecto 
    WHERE id_proyecto = param_id_proyecto;
    
    RETURN var;
END$$

DELIMITER ;

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

--
-- Volcado de datos para la tabla `albañil`
--

INSERT INTO `albañil` (`id_albañil`, `Albañil_nombre`, `id_albañil_proyecto`, `Localidad_albañil`, `Dia_de_contrato`, `Hora_de_contrato`, `id_albañil_LD_obra`) VALUES
(1115, 'JOSE HERNANDEZ', 25, 'LIMA', '2022-06-17', '16:00:00', 3325),
(1286, 'ARMANDO CASAS', 26, 'BOGOTA', '2022-02-23', '15:00:00', 4324),
(1321, 'MARIO CASTILLO', 25, 'CARACAS', '0000-00-00', '11:00:00', 3325),
(1432, 'LUIS BARRIOS', 27, 'CALI', '2022-07-22', '12:00:00', 3324),
(1465, 'DAVID CUESTA', 1010, 'OAXACA', '2021-01-23', '11:00:00', 7235),
(1481, 'DANIEL YAÑEZ', 26, 'CIUDAD DE MEXICO', '2023-01-15', '11:00:00', 4324),
(1681, 'ZUKE IGLESIAS', 1010, 'MARACAIBO', '2021-07-08', '11:00:00', 7235),
(1913, 'JULIAN CASTAÑEDA', 26, 'MADRID', '2021-01-16', '11:00:00', 4324),
(1918, 'ANDRES FERNANDEZ', 26, 'CARACAS', '2023-01-15', '11:00:00', 4324);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `arquitecto`
--

CREATE TABLE `arquitecto` (
  `id_arquitecto` int(15) NOT NULL,
  `Nombre_Arquitecto` varchar(44) DEFAULT NULL,
  `id_LDobra_arquitecto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `arquitecto`
--

INSERT INTO `arquitecto` (`id_arquitecto`, `Nombre_Arquitecto`, `id_LDobra_arquitecto`) VALUES
(10, 'Blake Blankhorn', 4324),
(12, 'Tristam Guerrazzi', 3324),
(22, 'Zilvia Lages', 7235),
(41, 'Tanhya Claeskens', 4324),
(45, 'Hyacinthe Allred', 4324),
(48, 'Vonnie Fransseni', 3325),
(76, 'Leeann Kops', 3325),
(93, 'Hebert Pitkaithly', 7235);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `arquitecto_plano`
--

CREATE TABLE `arquitecto_plano` (
  `id_arquitecto_plano` int(11) NOT NULL,
  `id_arq` int(15) DEFAULT NULL,
  `id_plan` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `arquitecto_plano`
--

INSERT INTO `arquitecto_plano` (`id_arquitecto_plano`, `id_arq`, `id_plan`) VALUES
(1, 41, 9897037),
(2, 76, 8828172),
(3, 45, 553907),
(4, 45, 9917426),
(5, 93, 1656933),
(6, 93, 6162152),
(7, 22, 3612902),
(8, 22, 2527805),
(9, 10, 5186039),
(10, 10, 1129575),
(11, 12, 8478996),
(12, 12, 4746396),
(13, 48, 7886917),
(14, 48, 6187417);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `compras`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `compras` (
`id_Material` int(11)
,`Descripcion` varchar(45)
,`Precio` varchar(45)
,`Marca` varchar(45)
,`id_LD_obra_compra` int(11)
,`Localizacion_vend` varchar(45)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `compra_total`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `compra_total` (
`Descripcion` varchar(45)
,`Cant` varchar(44)
,`precio` varchar(45)
,`total_Compra` double
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialidad`
--

CREATE TABLE `especialidad` (
  `id_especialidad` int(11) NOT NULL,
  `Nombre_especialidad` varchar(45) DEFAULT NULL,
  `id_Albañil_especialidad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `especialidad`
--

INSERT INTO `especialidad` (`id_especialidad`, `Nombre_especialidad`, `id_Albañil_especialidad`) VALUES
(1, 'Soldador', 1115),
(2, 'Soldador', 1321),
(3, 'Soldador', 1465),
(4, 'Electricista', 1432),
(5, 'Electricista', 1286),
(6, 'Electricista', 1681),
(7, 'Fontanero', 1918),
(8, 'Fontanero', 1321);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `especialidades_en_planos`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `especialidades_en_planos` (
`id_arquitecto` int(15)
,`id_arquitecto_plano` int(11)
,`id_arqEspecialidad` int(15)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialidad_arquitecto`
--

CREATE TABLE `especialidad_arquitecto` (
  `id_arqEspecialidad` int(15) NOT NULL,
  `Nombre_ArqEspecialidad` varchar(44) DEFAULT NULL,
  `id_Arquitecto_especialidad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `especialidad_arquitecto`
--

INSERT INTO `especialidad_arquitecto` (`id_arqEspecialidad`, `Nombre_ArqEspecialidad`, `id_Arquitecto_especialidad`) VALUES
(377855, 'paisajista', 41),
(926154, 'Ing_civil', 10),
(3361738, 'renderista', 45),
(4473852, 'renderista', 93),
(5315093, 'interiorista', 48),
(6784918, 'paisajista', 76),
(7665692, 'Ing_civil', 22),
(8163450, 'interiorista', 12);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `especialidad_en_proyecto`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `especialidad_en_proyecto` (
`id_albañil` int(11)
,`Albañil_nombre` varchar(45)
,`Nombre_especialidad` varchar(45)
,`id_proyecto` int(11)
,`Cliente_proyecto` varchar(45)
,`id_albañil_LD_obra` int(11)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lider_de_obra`
--

CREATE TABLE `lider_de_obra` (
  `ID_LD_obra` int(11) NOT NULL,
  `Nombre_LD_obra` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `lider_de_obra`
--

INSERT INTO `lider_de_obra` (`ID_LD_obra`, `Nombre_LD_obra`) VALUES
(3324, 'JOEL DORIAN'),
(3325, 'VICTOR MUÑO'),
(4324, 'JAVIER MARI'),
(7235, 'RICHARD MOR');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materiales`
--

CREATE TABLE `materiales` (
  `id_material` int(11) NOT NULL,
  `Descripcion` varchar(45) DEFAULT NULL,
  `id_Vend_Material` int(11) DEFAULT NULL,
  `Precio` varchar(45) DEFAULT NULL,
  `Marca` varchar(45) DEFAULT NULL,
  `Cant` varchar(44) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `materiales`
--

INSERT INTO `materiales` (`id_material`, `Descripcion`, `id_Vend_Material`, `Precio`, `Marca`, `Cant`) VALUES
(1, 'Cemento', 1319, '9203.7', 'ConstructoMax', '320'),
(2, 'Arena', 1421, '5091', 'ConstructoMax', '122'),
(3, 'Grava', 8412, '1664', 'ConstructoMax', '151'),
(4, 'Acero', 4563, '2082', 'ConstructoMax', '525'),
(5, 'Ladrillos', 1236, '9684', 'ConstructoMax', '250'),
(6, 'Bloques de hormigón', 7896, '5873', 'ConstructoMax', '320'),
(7, 'Yeso', 4569, '5800', 'FortiBlock', '122'),
(8, 'Cerámicas', 4785, '8400', 'FortiBlock', '151'),
(9, 'Pintura', 5896, '7200', 'FortiBlock', '525'),
(10, 'Madera', 6985, '5900', 'FortiBlock', '125'),
(11, 'Paneles de yeso', 4587, '3700', 'FortiBlock', '130'),
(12, 'Lana de vidrio', 4785, '2800', 'EdificaPro', '630'),
(13, 'Poliestireno expandido', 9845, '73058210', 'EdificaPro', '175'),
(14, 'Impermeabilizantes', 6521, '9080', 'EdificaPro', '140'),
(15, 'Clavos y tornillos', 3252, '5300', 'Solidara', '200'),
(16, 'Cinta métrica y niveles', 3254, '4800', 'Solidara', '322'),
(17, 'Tuberías PVC', 4532, '9880', 'Solidara', '450'),
(18, 'Tuberías cobre', 9820, '6125', 'Solidara', '315'),
(19, 'Mallas electrosoldadas', 6210, '6850', 'Arquitec Solutions', '265'),
(20, 'Mármol y granito', 1282, '9000', 'Arquitec Solutions', '425'),
(21, 'Vidrio', 7852, '8000', 'Arquitec Solutions', '500'),
(22, 'Hormigón decorativo', 7825, '7000', 'Arquitec Solutions', '550');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nuevo_proyecto`
--

CREATE TABLE `nuevo_proyecto` (
  `id_nuevo_proyecto` int(11) NOT NULL,
  `id_proyecto` int(11) NOT NULL,
  `Cliente_proyecto` varchar(45) DEFAULT NULL,
  `Fecha_de_inicio` date DEFAULT NULL,
  `Fecha_de_finalizacion` date DEFAULT NULL,
  `proyecto_descripcion` varchar(45) DEFAULT NULL,
  `id_LD_obra_proyecto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `nuevo_proyecto`
--

INSERT INTO `nuevo_proyecto` (`id_nuevo_proyecto`, `id_proyecto`, `Cliente_proyecto`, `Fecha_de_inicio`, `Fecha_de_finalizacion`, `proyecto_descripcion`, `id_LD_obra_proyecto`) VALUES
(2, 38, 'Julian Camarillo', '2024-09-11', '2027-06-12', 'PROYECTO MULTIFAMILIAR', 7235),
(3, 38, 'Julian Camarillo', '2024-09-11', '2027-06-12', 'PROYECTO MULTIFAMILIAR', 7235);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planos`
--

CREATE TABLE `planos` (
  `id_planos` int(15) NOT NULL,
  `Nombre_plano` varchar(44) DEFAULT NULL,
  `proyecto_plano` int(11) DEFAULT NULL,
  `tipo` varchar(44) DEFAULT NULL,
  `Descripcion` varchar(44) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `planos`
--

INSERT INTO `planos` (`id_planos`, `Nombre_plano`, `proyecto_plano`, `tipo`, `Descripcion`) VALUES
(553907, 'Sankeng', 25, 'corte', 'seccion de la edificacion'),
(1129575, 'Oslo', 1010, 'plantas tipo', 'planta de distribucion de espacios'),
(1656933, 'Shiye', 26, 'fachadas ', 'vista frontal del espacio'),
(2527805, 'Sumanding', 27, 'fachadas ', 'vista frontal del espacio'),
(3612902, 'Sumanding', 27, 'plantas tipo', 'planta de distribucion de espacios'),
(4746396, 'Oslo', 1010, 'corte', 'seccion de la edificacion'),
(5186039, 'Sumanding', 27, 'corte', 'seccion de la edificacion'),
(6162152, 'Shiye', 26, 'corte', 'seccion de la edificacion'),
(6187417, 'Shiye', 26, 'paisajismo', 'plano distribucion de vegetacion'),
(7886917, 'Shiye', 26, 'plano estructura', 'plano estructural del edificio'),
(8478996, 'Oslo', 1010, 'fachadas ', 'vista frontal del espacio'),
(8828172, 'Sankeng', 25, 'fachadas ', 'vista frontal del espacio'),
(9897037, 'Sankeng', 25, 'plantas tipo', 'planta de distribucion de espacios'),
(9917426, 'Shiye', 26, 'plantas tipo', 'planta de distribucion de espacios');

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

--
-- Volcado de datos para la tabla `proyecto`
--

INSERT INTO `proyecto` (`id_proyecto`, `Cliente_proyecto`, `Fecha_de_inicio`, `Fecha_de_finalizacion`, `proyecto_descripcion`, `id_LD_obra_proyecto`) VALUES
(25, 'JOSE RODRIGUEZ', '2022-01-09', '2023-06-16', 'PROYECTO UNIFAMILIAR', 3325),
(26, 'DANIEL SOSA', '2020-05-07', '2024-07-02', 'PROYECTO MULTIFAMILIAR', 4324),
(27, 'MANUEL MADRID', '2023-01-09', '2024-06-16', 'PROYECTO UNIFAMILIAR', 3324),
(1010, 'JOSE RODRIGUEZ', '2022-01-09', '2023-06-16', 'PROYECTO cafe', 7235);

--
-- Disparadores `proyecto`
--
DELIMITER $$
CREATE TRIGGER `elim_client` BEFORE DELETE ON `proyecto` FOR EACH ROW BEGIN
    INSERT INTO nuevo_proyecto (
        id_proyecto, 
        cliente_proyecto, 
        Fecha_de_inicio, 
        Fecha_de_finalizacion, 
        proyecto_descripcion, 
        id_LD_obra_proyecto) 
        VALUES (
        OLD.id_proyecto, 
        OLD.cliente_proyecto, 
        NOW(), 
        OLD.Fecha_de_finalizacion, 
        OLD.proyecto_descripcion, 
        OLD.id_LD_obra_proyecto
    );
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `new_client` AFTER INSERT ON `proyecto` FOR EACH ROW BEGIN
    INSERT INTO nuevo_proyecto (
        id_proyecto, 
        cliente_proyecto, 
        Fecha_de_inicio, 
        Fecha_de_finalizacion, 
        proyecto_descripcion, 
        id_LD_obra_proyecto) 
        VALUES (
        NEW.id_proyecto, 
        NEW.cliente_proyecto, 
        NOW(), 
        NEW.Fecha_de_finalizacion, 
        NEW.proyecto_descripcion, 
        NEW.id_LD_obra_proyecto
    );
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `trabajadores_de_obra`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `trabajadores_de_obra` (
`Albañil_nombre` varchar(45)
,`id_proyecto` int(11)
,`Dia_de_contrato` date
,`Hora_de_contrato` time
,`id_LD_obra_proyecto` int(11)
,`Fecha_de_finalizacion` date
);

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
-- Volcado de datos para la tabla `vendedores`
--

INSERT INTO `vendedores` (`id_Vend`, `Vend_name`, `Localizacion_Vend`, `Vend_telefono`, `id_LD_obra_compra`) VALUES
(1236, 'Ladrillos', 'Francisco', '62822115', 3324),
(1282, 'Mármol y granito', 'Javier', '64795022', 7235),
(1319, 'Cemento', 'Francisco', '39188368', 3325),
(1421, 'Arena', 'Francisco', '41544048', 3325),
(3252, 'Clavos y tornillos', 'Alejandro', '12510173', 4324),
(3254, 'Cinta métrica y niveles', 'Alejandro', '68704822', 4324),
(4532, 'Tuberías PVC', 'Alejandro', '73960793', 4324),
(4563, 'Acero', 'Francisco', '19806480', 3325),
(4569, 'Yeso', 'Lucía', '26334702', 3324),
(4587, 'Paneles de yeso', 'Lucía', '97016560', 4324),
(4785, 'Lana de vidrio', 'Sebastián', '10537596', 4324),
(4794, 'Cerámicas', 'Lucía', '13962931', 3324),
(5896, 'Pintura', 'Lucía', '85771847', 3324),
(6210, 'Mallas electrosoldadas', 'Javier', '50001314', 7235),
(6521, 'Impermeabilizantes', 'Sebastián', '95941477', 4324),
(6985, 'Madera', 'Lucía', '34714987', 4324),
(7825, 'Hormigón decorativo', 'Javier', '45962931', 7235),
(7852, 'Vidrio', 'Javier', '25137972', 7235),
(7896, 'Bloques de hormigón', 'Francisco', '60035530', 3325),
(8412, 'Grava', 'Francisco', '25887090', 3325),
(9820, 'Tuberías cobre', 'Alejandro', '17085768', 7235),
(9845, 'Poliestireno expandido', 'Sebastián', '73058210', 4324);

-- --------------------------------------------------------

--
-- Estructura para la vista `compras`
--
DROP TABLE IF EXISTS `compras`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `compras`  AS SELECT `materiales`.`id_material` AS `id_Material`, `materiales`.`Descripcion` AS `Descripcion`, `materiales`.`Precio` AS `Precio`, `materiales`.`Marca` AS `Marca`, `b`.`id_LD_obra_compra` AS `id_LD_obra_compra`, `b`.`Localizacion_Vend` AS `Localizacion_vend` FROM (`materiales` join `vendedores` `b`) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `compra_total`
--
DROP TABLE IF EXISTS `compra_total`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `compra_total`  AS SELECT `materiales`.`Descripcion` AS `Descripcion`, `materiales`.`Cant` AS `Cant`, `materiales`.`Precio` AS `precio`, `materiales`.`Cant`* `materiales`.`Precio` AS `total_Compra` FROM `materiales` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `especialidades_en_planos`
--
DROP TABLE IF EXISTS `especialidades_en_planos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `especialidades_en_planos`  AS SELECT `a`.`id_arquitecto` AS `id_arquitecto`, `i`.`id_arquitecto_plano` AS `id_arquitecto_plano`, `e`.`id_arqEspecialidad` AS `id_arqEspecialidad` FROM ((`arquitecto` `a` join `arquitecto_plano` `i` on(`a`.`id_arquitecto` = `i`.`id_arquitecto_plano`)) join `especialidad_arquitecto` `e` on(`a`.`id_arquitecto` = `e`.`id_arqEspecialidad`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `especialidad_en_proyecto`
--
DROP TABLE IF EXISTS `especialidad_en_proyecto`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `especialidad_en_proyecto`  AS SELECT `albañil`.`id_albañil` AS `id_albañil`, `albañil`.`Albañil_nombre` AS `Albañil_nombre`, `c`.`Nombre_especialidad` AS `Nombre_especialidad`, `a`.`id_proyecto` AS `id_proyecto`, `a`.`Cliente_proyecto` AS `Cliente_proyecto`, `albañil`.`id_albañil_LD_obra` AS `id_albañil_LD_obra` FROM ((`albañil` join `especialidad` `c` on(`c`.`id_Albañil_especialidad` = `albañil`.`id_albañil`)) join `proyecto` `a` on(`a`.`id_proyecto` = `albañil`.`id_albañil_proyecto`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `trabajadores_de_obra`
--
DROP TABLE IF EXISTS `trabajadores_de_obra`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `trabajadores_de_obra`  AS SELECT `albañil`.`Albañil_nombre` AS `Albañil_nombre`, `a`.`id_proyecto` AS `id_proyecto`, `albañil`.`Dia_de_contrato` AS `Dia_de_contrato`, `albañil`.`Hora_de_contrato` AS `Hora_de_contrato`, `a`.`id_LD_obra_proyecto` AS `id_LD_obra_proyecto`, `a`.`Fecha_de_finalizacion` AS `Fecha_de_finalizacion` FROM (`albañil` join `proyecto` `a` on(`a`.`id_proyecto` = `albañil`.`id_albañil_proyecto`)) ;

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
-- Indices de la tabla `arquitecto`
--
ALTER TABLE `arquitecto`
  ADD PRIMARY KEY (`id_arquitecto`),
  ADD KEY `id_LDobra_arquitecto` (`id_LDobra_arquitecto`);

--
-- Indices de la tabla `arquitecto_plano`
--
ALTER TABLE `arquitecto_plano`
  ADD PRIMARY KEY (`id_arquitecto_plano`),
  ADD KEY `id_arq` (`id_arq`),
  ADD KEY `id_plan` (`id_plan`);

--
-- Indices de la tabla `especialidad`
--
ALTER TABLE `especialidad`
  ADD PRIMARY KEY (`id_especialidad`),
  ADD KEY `id_Albañil_especialidad` (`id_Albañil_especialidad`);

--
-- Indices de la tabla `especialidad_arquitecto`
--
ALTER TABLE `especialidad_arquitecto`
  ADD PRIMARY KEY (`id_arqEspecialidad`),
  ADD KEY `id_Arquitecto_especialidad` (`id_Arquitecto_especialidad`);

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
-- Indices de la tabla `nuevo_proyecto`
--
ALTER TABLE `nuevo_proyecto`
  ADD PRIMARY KEY (`id_nuevo_proyecto`);

--
-- Indices de la tabla `planos`
--
ALTER TABLE `planos`
  ADD PRIMARY KEY (`id_planos`),
  ADD KEY `proyecto_plano` (`proyecto_plano`);

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
  MODIFY `id_albañil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1919;

--
-- AUTO_INCREMENT de la tabla `arquitecto_plano`
--
ALTER TABLE `arquitecto_plano`
  MODIFY `id_arquitecto_plano` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT de la tabla `especialidad`
--
ALTER TABLE `especialidad`
  MODIFY `id_especialidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `lider_de_obra`
--
ALTER TABLE `lider_de_obra`
  MODIFY `ID_LD_obra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7236;

--
-- AUTO_INCREMENT de la tabla `nuevo_proyecto`
--
ALTER TABLE `nuevo_proyecto`
  MODIFY `id_nuevo_proyecto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `proyecto`
--
ALTER TABLE `proyecto`
  MODIFY `id_proyecto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1011;

--
-- AUTO_INCREMENT de la tabla `vendedores`
--
ALTER TABLE `vendedores`
  MODIFY `id_Vend` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9846;

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
-- Filtros para la tabla `arquitecto`
--
ALTER TABLE `arquitecto`
  ADD CONSTRAINT `arquitecto_ibfk_1` FOREIGN KEY (`id_LDobra_arquitecto`) REFERENCES `lider_de_obra` (`ID_LD_obra`);

--
-- Filtros para la tabla `arquitecto_plano`
--
ALTER TABLE `arquitecto_plano`
  ADD CONSTRAINT `arquitecto_plano_ibfk_1` FOREIGN KEY (`id_arq`) REFERENCES `arquitecto` (`id_arquitecto`),
  ADD CONSTRAINT `arquitecto_plano_ibfk_2` FOREIGN KEY (`id_plan`) REFERENCES `planos` (`id_planos`);

--
-- Filtros para la tabla `especialidad`
--
ALTER TABLE `especialidad`
  ADD CONSTRAINT `especialidad_ibfk_1` FOREIGN KEY (`id_Albañil_especialidad`) REFERENCES `albañil` (`id_albañil`);

--
-- Filtros para la tabla `especialidad_arquitecto`
--
ALTER TABLE `especialidad_arquitecto`
  ADD CONSTRAINT `especialidad_arquitecto_ibfk_1` FOREIGN KEY (`id_Arquitecto_especialidad`) REFERENCES `arquitecto` (`id_arquitecto`);

--
-- Filtros para la tabla `materiales`
--
ALTER TABLE `materiales`
  ADD CONSTRAINT `materiales_ibfk_1` FOREIGN KEY (`id_Vend_Material`) REFERENCES `vendedores` (`id_Vend`);

--
-- Filtros para la tabla `planos`
--
ALTER TABLE `planos`
  ADD CONSTRAINT `planos_ibfk_1` FOREIGN KEY (`proyecto_plano`) REFERENCES `proyecto` (`id_proyecto`);

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
