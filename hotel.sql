-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-11-2023 a las 00:41:39
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `hotel`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

CREATE TABLE `administrador` (
  `id` binary(16) NOT NULL,
  `correo` varchar(255) NOT NULL,
  `apellido` varchar(255) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `telefono` varchar(255) NOT NULL,
  `rol` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `administrador`
--

INSERT INTO `administrador` (`id`, `correo`, `apellido`, `nombre`, `telefono`, `rol`) VALUES
(0xd24eac17bb6943cdbba5dc003da857e8, 'elian7joyo7villanueva@gmail.com', 'alvarez', 'andre', '948631528', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id` binary(16) NOT NULL,
  `correo` varchar(255) NOT NULL,
  `apellido` varchar(255) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `numero_documento` varchar(255) NOT NULL,
  `telefono` varchar(255) NOT NULL,
  `tipo_documento` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id`, `correo`, `apellido`, `nombre`, `numero_documento`, `telefono`, `tipo_documento`) VALUES
(0x6e4bc89eccd444f59e02c964cd515339, 'test@testcorreo.com', 'Galarzaaads', 'Jose', '886476523', '996587789', 1),
(0xae8ff1a6807f4d12af9555bd2da172d4, 'test@gmail.com', 'Bogani', 'Ioa', '88686487', '66853125', 2),
(0xcd8374932a764b81b2c26deda2f83e5d, 'utp@correo.pe.com', 'rain', 'sky', '8897665853', '948765865', 0),
(0xd400d15f5679427b823c3c3a2ca8e807, 'andre7joyo7villanueva@gmail.com', 'joyo', 'andre', '76017232', '932186892', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `habitacion`
--

CREATE TABLE `habitacion` (
  `id` binary(16) NOT NULL,
  `categoria` tinyint(4) DEFAULT NULL,
  `piso` int(11) NOT NULL,
  `estado` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `habitacion`
--

INSERT INTO `habitacion` (`id`, `categoria`, `piso`, `estado`) VALUES
(0x2dae1b4f8fbd4f99bb63323b54e7de7d, 0, 3, 1),
(0xdcf917c1b9e3421aad8c776c024739a4, 1, 2, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reserva_habitacion`
--

CREATE TABLE `reserva_habitacion` (
  `id` binary(16) NOT NULL,
  `fecha_entrada` datetime(6) NOT NULL,
  `fecha_salida` datetime(6) NOT NULL,
  `numero_personas` int(11) NOT NULL,
  `estado_reserva` tinyint(4) NOT NULL,
  `total` double NOT NULL,
  `cliente_id` binary(16) DEFAULT NULL,
  `usuario_cliente_id` binary(16) DEFAULT NULL,
  `habitacion_id` binary(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `reserva_habitacion`
--

INSERT INTO `reserva_habitacion` (`id`, `fecha_entrada`, `fecha_salida`, `numero_personas`, `estado_reserva`, `total`, `cliente_id`, `usuario_cliente_id`, `habitacion_id`) VALUES
(0x565291ce7ba54574a9e22f83e5227b35, '2021-10-09 19:00:00.000000', '2021-10-19 19:00:00.000000', 2, 0, 100, 0xd400d15f5679427b823c3c3a2ca8e807, 0xd24eac17bb6943cdbba5dc003da857e8, 0x2dae1b4f8fbd4f99bb63323b54e7de7d);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reserva_servicios_adicionales`
--

CREATE TABLE `reserva_servicios_adicionales` (
  `reserva_id` binary(16) NOT NULL,
  `servicios_adicionales_id` binary(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `reserva_servicios_adicionales`
--

INSERT INTO `reserva_servicios_adicionales` (`reserva_id`, `servicios_adicionales_id`) VALUES
(0x565291ce7ba54574a9e22f83e5227b35, 0x27bfc1d12c84466db4cf2fa59ff69d70),
(0x565291ce7ba54574a9e22f83e5227b35, 0x614d338aeaed4904b59e4b136f4644e3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios_adicionales`
--

CREATE TABLE `servicios_adicionales` (
  `id` binary(16) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) NOT NULL,
  `precio` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `servicios_adicionales`
--

INSERT INTO `servicios_adicionales` (`id`, `descripcion`, `nombre`, `precio`) VALUES
(0x27bfc1d12c84466db4cf2fa59ff69d70, NULL, 'Recuerdo Hotelero', 20),
(0x614d338aeaed4904b59e4b136f4644e3, NULL, 'otro servicio', 22),
(0x641d56f3222747f9b2ad1180e9780558, '', 'Taxi Hotelero', 35.2),
(0x974c9bbcff0742b587a5836a38b6ece6, 'un jacuzzi', 'El Paraiso Jacuzzi', 50.2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_administrador`
--

CREATE TABLE `usuario_administrador` (
  `id` binary(16) NOT NULL,
  `contrasena` varchar(255) NOT NULL,
  `usuario` varchar(255) NOT NULL,
  `administrador_id` binary(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario_administrador`
--

INSERT INTO `usuario_administrador` (`id`, `contrasena`, `usuario`, `administrador_id`) VALUES
(0xfc84bdd2b3474278be38712fe385c929, 'admin', 'admin', 0xd24eac17bb6943cdbba5dc003da857e8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_cliente`
--

CREATE TABLE `usuario_cliente` (
  `id` binary(16) NOT NULL,
  `contrasena` varchar(255) NOT NULL,
  `usuario` varchar(255) NOT NULL,
  `cliente_id` binary(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario_cliente`
--

INSERT INTO `usuario_cliente` (`id`, `contrasena`, `usuario`, `cliente_id`) VALUES
(0x0eb2f178cc644668a26f703cee7d7951, '123456', 'elianl123', 0xd400d15f5679427b823c3c3a2ca8e807),
(0xb48ed4460a004d28958267997215c1bc, '', '', 0x6e4bc89eccd444f59e02c964cd515339);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_571pycikd1pkkvboiav3f69gp` (`correo`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_k6i2j3upwar1uora4mgiol6b` (`correo`);

--
-- Indices de la tabla `habitacion`
--
ALTER TABLE `habitacion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `reserva_habitacion`
--
ALTER TABLE `reserva_habitacion`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_pjjr3lvacy88m8oh5pbiwspyy` (`cliente_id`),
  ADD UNIQUE KEY `UK_iwos9v11ub329s0rpfvhmy7ps` (`usuario_cliente_id`),
  ADD UNIQUE KEY `UK_dyo4lqcjvam3jried5uvid5tn` (`habitacion_id`);

--
-- Indices de la tabla `reserva_servicios_adicionales`
--
ALTER TABLE `reserva_servicios_adicionales`
  ADD KEY `FKem1oo112kjcuv068hwhv3fnjy` (`servicios_adicionales_id`),
  ADD KEY `FKbr8v8dcgi2etv3208ls5iepe` (`reserva_id`);

--
-- Indices de la tabla `servicios_adicionales`
--
ALTER TABLE `servicios_adicionales`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuario_administrador`
--
ALTER TABLE `usuario_administrador`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_b0d4j0m7o7hag5ccwjvtwckp3` (`usuario`),
  ADD UNIQUE KEY `UK_4f83ix6wieqs9lfkjkasl2kqi` (`administrador_id`);

--
-- Indices de la tabla `usuario_cliente`
--
ALTER TABLE `usuario_cliente`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_lrusgh176pu946yf5ugxq1duq` (`usuario`),
  ADD UNIQUE KEY `UK_7ehg0eqao6pq6mpcsnrhhafnq` (`cliente_id`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `reserva_habitacion`
--
ALTER TABLE `reserva_habitacion`
  ADD CONSTRAINT `FK7a0etaju6e1a2chphoy0ovirh` FOREIGN KEY (`habitacion_id`) REFERENCES `habitacion` (`id`),
  ADD CONSTRAINT `FKoi9ska3grj0mo4ur0x3kw0tb1` FOREIGN KEY (`usuario_cliente_id`) REFERENCES `administrador` (`id`),
  ADD CONSTRAINT `FKqays5g7pqdefa3g6nfsrd2nj1` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`);

--
-- Filtros para la tabla `reserva_servicios_adicionales`
--
ALTER TABLE `reserva_servicios_adicionales`
  ADD CONSTRAINT `FKbr8v8dcgi2etv3208ls5iepe` FOREIGN KEY (`reserva_id`) REFERENCES `reserva_habitacion` (`id`),
  ADD CONSTRAINT `FKem1oo112kjcuv068hwhv3fnjy` FOREIGN KEY (`servicios_adicionales_id`) REFERENCES `servicios_adicionales` (`id`);

--
-- Filtros para la tabla `usuario_administrador`
--
ALTER TABLE `usuario_administrador`
  ADD CONSTRAINT `FK1h4hxqw8d11qvcfadw3r585y9` FOREIGN KEY (`administrador_id`) REFERENCES `administrador` (`id`);

--
-- Filtros para la tabla `usuario_cliente`
--
ALTER TABLE `usuario_cliente`
  ADD CONSTRAINT `FKp6ah6y51ph8e4qfvq19hvf8q3` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
