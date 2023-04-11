-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-04-2023 a las 05:18:36
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `trading`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `afiliados_recurrentes`
--

CREATE TABLE `afiliados_recurrentes` (
  `id` bigint(20) NOT NULL,
  `id_pago_afiliados` bigint(20) NOT NULL,
  `id_usuario` bigint(20) NOT NULL,
  `id_comprobante` bigint(20) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `afiliados_recurrentes`
--

INSERT INTO `afiliados_recurrentes` (`id`, `id_pago_afiliados`, `id_usuario`, `id_comprobante`, `fecha`) VALUES
(1, 1, 102, 3, '2023-04-07 20:43:26');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bonos_extras`
--

CREATE TABLE `bonos_extras` (
  `id` bigint(20) NOT NULL,
  `id_pago_extra` bigint(20) NOT NULL,
  `id_usuario` bigint(20) NOT NULL,
  `id_comprobante` bigint(20) NOT NULL,
  `id_campana` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `bonos_extras`
--

INSERT INTO `bonos_extras` (`id`, `id_pago_extra`, `id_usuario`, `id_comprobante`, `id_campana`) VALUES
(2, 2, 102, 3, 13);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `campanas`
--

CREATE TABLE `campanas` (
  `id` int(11) NOT NULL,
  `nombre` text NOT NULL,
  `retorno` float NOT NULL,
  `estado` int(11) NOT NULL,
  `tipo` int(11) NOT NULL,
  `cupos` int(11) NOT NULL,
  `fecha_inicio` datetime NOT NULL,
  `fecha_fin` datetime NOT NULL,
  `fecha_retorno` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `campanas`
--

INSERT INTO `campanas` (`id`, `nombre`, `retorno`, `estado`, `tipo`, `cupos`, `fecha_inicio`, `fecha_fin`, `fecha_retorno`) VALUES
(1, 'stake1', 10, 1, 1, 100, '2023-03-09 15:17:00', '2023-04-28 15:17:00', '2023-05-05'),
(7, 'publicidad1', 5000, 1, 3, 100, '2023-03-14 11:40:00', '2023-04-27 11:40:00', '2023-05-06'),
(8, 'stake2', 10, 2, 1, 100, '2023-03-01 12:27:00', '2023-03-30 12:27:00', '2023-04-06'),
(9, 'Bono Apalancamiento', 10, 1, 4, 0, '2023-03-14 19:36:00', '2023-04-27 19:36:00', '2023-05-06'),
(10, '[{\"afiliados\":\"1\",\"retorno\":\"1000\"},{\"afiliados\":\"2\",\"retorno\":\"2000\"}]', 0, 1, 6, 0, '2023-03-22 19:37:00', '2023-04-28 19:37:00', '2023-05-06'),
(11, 'Bono Bienvenida', 5000, 1, 7, 0, '2023-03-13 19:38:00', '2023-04-27 19:38:00', '2023-05-06'),
(12, '[{\"inversiones\":\"1\",\"retorno\":\"5000\"}]', 0, 1, 5, 0, '2023-03-21 19:38:00', '2023-04-28 19:38:00', '2023-05-06'),
(13, 'Bono Extra', 1000, 1, 2, 0, '2023-02-21 20:23:00', '2023-04-28 20:23:00', '2023-05-06');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id_categoria` int(11) NOT NULL,
  `nombre_categoria` text NOT NULL,
  `ruta_categoria` text NOT NULL,
  `descripcion_categoria` text NOT NULL,
  `icono_categoria` text NOT NULL,
  `color_categoria` text NOT NULL,
  `fecha_categoria` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comisiones`
--

CREATE TABLE `comisiones` (
  `id` bigint(20) NOT NULL,
  `id_pago_comision` int(11) NOT NULL,
  `id_comprobante` int(11) NOT NULL,
  `nivel` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `comisiones`
--

INSERT INTO `comisiones` (`id`, `id_pago_comision`, `id_comprobante`, `nivel`) VALUES
(5, 4, 3, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comprobantes`
--

CREATE TABLE `comprobantes` (
  `id` bigint(20) NOT NULL,
  `foto` text NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` int(11) NOT NULL,
  `valor` bigint(20) NOT NULL,
  `doc_usuario` bigint(20) NOT NULL,
  `campana` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `comprobantes`
--

INSERT INTO `comprobantes` (`id`, `foto`, `fecha`, `estado`, `valor`, `doc_usuario`, `campana`) VALUES
(1, 'vistas/img/comprobantes/9844161/903.png', '2023-03-23 20:19:17', 1, 100000, 9844161, 1),
(2, 'vistas/img/comprobantes/9844161/301.png', '2023-03-23 20:19:18', 1, 150000, 9844161, 1),
(3, '', '2023-04-07 20:43:26', 1, 100000, 5345435, 1),
(4, '', '2023-03-24 03:05:04', 0, 50000, 5345435, 1),
(5, '', '2023-04-07 20:43:23', 0, 120000, 5345435, 1),
(8, 'vistas/img/comprobantes/9844161/111.png', '2023-04-07 01:23:53', 1, 50000, 9844161, 8),
(9, '', '2023-03-27 23:44:23', 1, 50000, 9844161, 1),
(10, 'vistas/img/comprobantes/9844161/557.png', '2023-03-28 00:21:44', 1, 150000, 9844161, 1),
(11, 'vistas/img/comprobantes/5345435/644.png', '2023-04-07 20:43:24', 0, 5000, 5345435, 1),
(12, 'vistas/img/comprobantes/9844161/176.png', '2023-04-07 01:42:26', 1, 0, 9844161, 7),
(13, 'vistas/img/comprobantes/165416/724.png', '2023-04-07 01:54:30', 1, 100000, 165416, 1),
(14, 'vistas/img/comprobantes/9844161/521.png', '2023-04-07 20:42:05', 1, 100000, 9844161, 1),
(15, 'vistas/img/comprobantes/9844161/778.jpg', '2023-04-09 21:04:40', 2, 155650, 9844161, 1),
(16, 'vistas/img/comprobantes/9844161/315.png', '2023-04-10 01:22:48', 2, 100, 9844161, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuentas_bancarias`
--

CREATE TABLE `cuentas_bancarias` (
  `id` bigint(20) NOT NULL,
  `numero` text DEFAULT NULL,
  `usuario` bigint(20) NOT NULL,
  `tipo_documento` text NOT NULL,
  `titular` bigint(20) NOT NULL,
  `nombre_titular` text NOT NULL,
  `entidad` text NOT NULL,
  `estado` int(11) NOT NULL DEFAULT 2,
  `tipo` text NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cuentas_bancarias`
--

INSERT INTO `cuentas_bancarias` (`id`, `numero`, `usuario`, `tipo_documento`, `titular`, `nombre_titular`, `entidad`, `estado`, `tipo`, `fecha`) VALUES
(1, '2312313', 101, 'cedula de ciudadania', 213123, 'nombre titular', 'davivienda', 1, 'ahorros', '2023-03-23 20:18:44'),
(2, '324', 102, 'cedula de ciudadania', 324, 'nombre titular', 'davivienda', 1, 'corriente', '2023-03-24 05:20:33'),
(3, '165611', 106, 'cedula de ciudadania', 165165, 'nombre titular', 'davivienda', 1, 'ahorros', '2023-04-07 01:53:27');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `niveles_comision`
--

CREATE TABLE `niveles_comision` (
  `id` int(11) NOT NULL,
  `nivel` int(11) NOT NULL,
  `porcentaje` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notificaciones`
--

CREATE TABLE `notificaciones` (
  `id` int(11) NOT NULL,
  `tipo` text NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_detalle` int(11) NOT NULL,
  `visualizacion` int(11) NOT NULL DEFAULT 0,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `notificaciones`
--

INSERT INTO `notificaciones` (`id`, `tipo`, `id_usuario`, `id_detalle`, `visualizacion`, `fecha`) VALUES
(1, 'red', 1, 101, 0, '2023-03-23 19:18:29'),
(2, 'red', 101, 102, 0, '2023-03-23 19:19:13'),
(3, 'red', 101, 103, 0, '2023-03-23 20:16:24'),
(4, 'red', 1, 104, 0, '2023-03-24 02:23:17'),
(5, 'red', 1, 106, 0, '2023-04-07 01:52:30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos_afiliados`
--

CREATE TABLE `pagos_afiliados` (
  `id` bigint(20) NOT NULL,
  `id_usuario` bigint(20) NOT NULL,
  `valor` int(11) NOT NULL,
  `estado` int(11) NOT NULL DEFAULT 0,
  `id_cuenta` int(11) NOT NULL DEFAULT 0,
  `afiliados` int(11) NOT NULL,
  `id_campana` bigint(20) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pagos_afiliados`
--

INSERT INTO `pagos_afiliados` (`id`, `id_usuario`, `valor`, `estado`, `id_cuenta`, `afiliados`, `id_campana`, `fecha`) VALUES
(1, 101, 0, 0, 0, 1, 10, '2023-04-07 20:43:26');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos_bienvenida`
--

CREATE TABLE `pagos_bienvenida` (
  `id` bigint(20) NOT NULL,
  `id_usuario` bigint(20) NOT NULL,
  `estado` int(11) NOT NULL,
  `valor` double NOT NULL,
  `id_cuenta` int(11) NOT NULL,
  `id_campana` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pagos_bienvenida`
--

INSERT INTO `pagos_bienvenida` (`id`, `id_usuario`, `estado`, `valor`, `id_cuenta`, `id_campana`, `fecha`) VALUES
(1, 106, 0, 5000, 3, 11, '2023-04-07 20:15:02'),
(2, 102, 0, 0, 0, 11, '2023-04-07 20:43:26');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos_comisiones`
--

CREATE TABLE `pagos_comisiones` (
  `id` bigint(20) NOT NULL,
  `id_usuario` bigint(20) NOT NULL,
  `valor` double NOT NULL,
  `estado` int(11) NOT NULL,
  `id_cuenta` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `pagos_comisiones`
--

INSERT INTO `pagos_comisiones` (`id`, `id_usuario`, `valor`, `estado`, `id_cuenta`, `fecha`) VALUES
(4, 101, 0, 0, 0, '2023-04-07 20:43:26');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos_extras`
--

CREATE TABLE `pagos_extras` (
  `id` bigint(20) NOT NULL,
  `id_usuario` bigint(20) NOT NULL,
  `estado` int(11) NOT NULL DEFAULT 0,
  `referidos_obtenidos` int(11) NOT NULL DEFAULT 0,
  `valor` double NOT NULL DEFAULT 0,
  `id_cuenta` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pagos_extras`
--

INSERT INTO `pagos_extras` (`id`, `id_usuario`, `estado`, `referidos_obtenidos`, `valor`, `id_cuenta`, `fecha`) VALUES
(2, 101, 0, 0, 0, 0, '2023-04-07 20:43:26');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos_inversiones`
--

CREATE TABLE `pagos_inversiones` (
  `id` bigint(20) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_comprobante` bigint(20) NOT NULL,
  `id_apalancamiento` int(11) DEFAULT 0,
  `estado` int(11) NOT NULL DEFAULT 0,
  `id_cuenta` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `pagos_inversiones`
--

INSERT INTO `pagos_inversiones` (`id`, `id_usuario`, `id_comprobante`, `id_apalancamiento`, `estado`, `id_cuenta`, `fecha`) VALUES
(1, 101, 1, 0, 1, 1, '2023-04-10 04:39:16'),
(2, 101, 2, 0, 1, 1, '2023-04-10 21:45:14'),
(6, 101, 9, 0, 1, 1, '2023-04-10 21:45:14'),
(7, 101, 10, 0, 1, 1, '2023-04-10 21:45:14'),
(8, 101, 8, 0, 1, 1, '2023-04-10 21:45:14'),
(12, 106, 13, 0, 1, 3, '2023-04-10 21:45:14'),
(13, 101, 14, 9, 1, 1, '2023-04-10 21:45:14'),
(14, 102, 3, 9, 1, 2, '2023-04-10 21:45:14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos_publicidad`
--

CREATE TABLE `pagos_publicidad` (
  `id` bigint(20) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_comprobante` int(11) NOT NULL,
  `valor` double NOT NULL DEFAULT 0,
  `estado` int(11) NOT NULL DEFAULT 0,
  `id_cuenta` int(11) NOT NULL DEFAULT 0,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pagos_publicidad`
--

INSERT INTO `pagos_publicidad` (`id`, `id_usuario`, `id_comprobante`, `valor`, `estado`, `id_cuenta`, `fecha`) VALUES
(2, 101, 12, 0, 0, 1, '2023-04-10 21:47:50');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos_recurrencia`
--

CREATE TABLE `pagos_recurrencia` (
  `id` int(11) NOT NULL,
  `id_usuario` bigint(20) NOT NULL,
  `valor` float NOT NULL,
  `estado` int(11) NOT NULL DEFAULT 0,
  `id_cuenta` int(11) NOT NULL DEFAULT 0,
  `inversiones` int(11) NOT NULL,
  `id_campana` bigint(20) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pagos_recurrencia`
--

INSERT INTO `pagos_recurrencia` (`id`, `id_usuario`, `valor`, `estado`, `id_cuenta`, `inversiones`, `id_campana`, `fecha`) VALUES
(1, 102, 5000, 1, 2, 1, 12, '2023-04-10 22:33:44');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos_uninivel`
--

CREATE TABLE `pagos_uninivel` (
  `id_pago` int(11) NOT NULL,
  `id_pago_paypal` text DEFAULT NULL,
  `usuario_pago` int(11) NOT NULL,
  `periodo` text NOT NULL,
  `periodo_comision` float NOT NULL,
  `periodo_venta` float NOT NULL,
  `fecha_pago` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `red_binaria`
--

CREATE TABLE `red_binaria` (
  `id_binaria` int(11) NOT NULL,
  `usuario_red` bigint(20) NOT NULL,
  `orden_binaria` int(11) NOT NULL,
  `derrame_binaria` int(11) NOT NULL,
  `patrocinador_red` text DEFAULT NULL,
  `fecha_binaria` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `red_binaria`
--

INSERT INTO `red_binaria` (`id_binaria`, `usuario_red`, `orden_binaria`, `derrame_binaria`, `patrocinador_red`, `fecha_binaria`) VALUES
(1, 1, 1, 0, 'admin-trading', '2023-03-23 17:08:34'),
(77, 101, 2, 1, 'admin-trading', '2023-03-23 19:18:29'),
(78, 102, 3, 2, 'prueba-4161', '2023-04-11 02:23:07'),
(79, 103, 4, 2, 'prueba-4161', '2023-04-11 02:23:07'),
(80, 104, 5, 3, 'pedro-5435', '2023-04-11 02:54:57'),
(81, 106, 6, 2, 'prueba-4161', '2023-04-11 02:54:57');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `red_uninivel`
--

CREATE TABLE `red_uninivel` (
  `id_uninivel` int(11) NOT NULL,
  `usuario_red` bigint(20) NOT NULL,
  `patrocinador_red` text DEFAULT NULL,
  `fecha_uninivel` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `red_uninivel`
--

INSERT INTO `red_uninivel` (`id_uninivel`, `usuario_red`, `patrocinador_red`, `fecha_uninivel`) VALUES
(1, 1, 'admin-trading', '2023-03-23 17:09:48'),
(90, 101, 'admin-trading', '2023-03-23 19:18:29'),
(91, 102, 'prueba-4161', '2023-03-24 02:56:42'),
(92, 103, 'prueba-4161', '2023-03-23 20:16:23'),
(93, 104, 'pedro-5435', '2023-03-24 02:57:30'),
(95, 106, 'prueba-4161', '2023-04-11 01:16:16');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `soporte`
--

CREATE TABLE `soporte` (
  `id_soporte` int(11) NOT NULL,
  `remitente` int(11) NOT NULL,
  `receptor` int(11) NOT NULL,
  `asunto` text NOT NULL,
  `mensaje` text NOT NULL,
  `adjuntos` text NOT NULL,
  `tipo` text NOT NULL,
  `papelera` text DEFAULT NULL,
  `fecha_soporte` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` bigint(20) NOT NULL,
  `doc_usuario` bigint(20) NOT NULL,
  `perfil` text NOT NULL,
  `usuario` text NOT NULL,
  `nombre` text NOT NULL,
  `email` text NOT NULL,
  `password` text NOT NULL,
  `estado` int(11) NOT NULL DEFAULT 1,
  `operando` int(11) NOT NULL DEFAULT 0,
  `ciclo_pago` int(11) DEFAULT NULL,
  `vencimiento` date DEFAULT NULL,
  `verificacion` int(11) NOT NULL DEFAULT 1,
  `email_encriptado` text DEFAULT NULL,
  `foto` text DEFAULT NULL,
  `enlace_afiliado` text DEFAULT NULL,
  `patrocinador` text DEFAULT NULL,
  `pais` text DEFAULT NULL,
  `codigo_pais` text DEFAULT NULL,
  `telefono_movil` text DEFAULT NULL,
  `firma` text DEFAULT NULL,
  `fecha_contrato` date DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `eliminado` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `doc_usuario`, `perfil`, `usuario`, `nombre`, `email`, `password`, `estado`, `operando`, `ciclo_pago`, `vencimiento`, `verificacion`, `email_encriptado`, `foto`, `enlace_afiliado`, `patrocinador`, `pais`, `codigo_pais`, `telefono_movil`, `firma`, `fecha_contrato`, `fecha`, `eliminado`) VALUES
(1, 1, 'admin', 'Admin', 'Administrador', 'admin@trading.com', '$2a$07$asxx54ahjppf45sd87a5auGZEtGHuyZwm.Ur.FJvWLCql3nmsMbXy', 1, 0, NULL, NULL, 1, NULL, 'vistas/img/usuarios/1/434.jpg', 'admin-trading', NULL, NULL, NULL, NULL, 'firma', '2023-03-01', '2023-03-23 17:08:03', 0),
(106, 165416, 'usuario', 'Guillermo-3867', 'Guillermo Galeano', 'guillermo@gmail.com', '$2a$07$asxx54ahjppf45sd87a5auFL5K1.Cmt9ZheoVVuudOi5BCi10qWly', 1, 1, NULL, NULL, 1, 'a99d8f8cdc755cdb2150c23b8f50f77a', NULL, 'guillermo-5416', 'admin-trading', 'Israel', 'IL', '+972 (123) 123-1231', NULL, '2023-04-06', '2023-04-07 01:52:30', 0),
(102, 5345435, 'usuario', 'pedro-1166', 'pedro pablo', 'pedro@gmail.com', '$2a$07$asxx54ahjppf45sd87a5auFL5K1.Cmt9ZheoVVuudOi5BCi10qWly', 1, 1, NULL, NULL, 1, 'c3b7f393410fe6185ba5d966a213a38f', NULL, 'pedro-5435', 'prueba-4161', 'Colombia', 'CO', '+57 (312) 312-3123', NULL, '2023-03-23', '2023-03-23 19:19:13', 0),
(101, 9844161, 'usuario', 'prueba-8229', 'prueba', 'prueba@gmail.com', '$2a$07$asxx54ahjppf45sd87a5auFL5K1.Cmt9ZheoVVuudOi5BCi10qWly', 1, 1, NULL, NULL, 1, 'c81b5136bcd10b4390108c979ed28ee6', NULL, 'prueba-4161', 'admin-trading', 'Colombia', 'CO', '+57 (123) 123-1231', NULL, '2023-03-23', '2023-03-23 19:18:29', 0),
(104, 32423423, 'usuario', 'Ford-2146', 'ford', 'ford@gmail.com', '$2a$07$asxx54ahjppf45sd87a5auFL5K1.Cmt9ZheoVVuudOi5BCi10qWly', 1, 0, NULL, NULL, 1, 'd9d54b4cccdde0e775e467e0dbd0e9bf', NULL, 'ford-3423', 'pedro-5435', 'Colombia', 'CO', '+57 (123) 123-1231', NULL, '2023-03-23', '2023-03-24 02:23:17', 0),
(103, 631561651, 'usuario', 'pepe-2319', 'pepeliano', 'pepe@gmail.com', '$2a$07$asxx54ahjppf45sd87a5auFL5K1.Cmt9ZheoVVuudOi5BCi10qWly', 1, 0, NULL, NULL, 1, '6b0becddecd5a06042b3f8078c97f2e0', NULL, 'pepe-1651', 'prueba-4161', 'Colombia', 'CO', '+57 (123) 121-2312', NULL, '2023-03-23', '2023-03-23 20:16:23', 0),
(105, 26992667097, 'usuario', 'Miguel-7097', 'Miguel Torres', 'miguel@gmail.com', '$2a$07$asxx54ahjppf45sd87a5auFL5K1.Cmt9ZheoVVuudOi5BCi10qWly', 1, 0, NULL, NULL, 1, 'c952ec83eabde595820603a3ca9d7f54', NULL, NULL, 'admin-trading', NULL, NULL, NULL, NULL, NULL, '2023-04-01 15:16:30', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `videos`
--

CREATE TABLE `videos` (
  `id_video` int(11) NOT NULL,
  `id_cat` int(11) NOT NULL,
  `titulo_video` text NOT NULL,
  `descripcion_video` text NOT NULL,
  `medios_video` text NOT NULL,
  `medios_video_mp4` text NOT NULL,
  `imagen_video` text NOT NULL,
  `vista_gratuita` int(11) NOT NULL,
  `fecha_video` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `afiliados_recurrentes`
--
ALTER TABLE `afiliados_recurrentes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_pago_afiliados` (`id_pago_afiliados`),
  ADD KEY `id_comprobante` (`id_comprobante`);

--
-- Indices de la tabla `bonos_extras`
--
ALTER TABLE `bonos_extras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_pago_extra` (`id_pago_extra`),
  ADD KEY `id_comprobante` (`id_comprobante`),
  ADD KEY `id_campana` (`id_campana`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `campanas`
--
ALTER TABLE `campanas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `comisiones`
--
ALTER TABLE `comisiones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `comprobantes`
--
ALTER TABLE `comprobantes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `doc_usuario` (`doc_usuario`);

--
-- Indices de la tabla `cuentas_bancarias`
--
ALTER TABLE `cuentas_bancarias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `niveles_comision`
--
ALTER TABLE `niveles_comision`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `notificaciones`
--
ALTER TABLE `notificaciones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pagos_afiliados`
--
ALTER TABLE `pagos_afiliados`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pagos_bienvenida`
--
ALTER TABLE `pagos_bienvenida`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pagos_comisiones`
--
ALTER TABLE `pagos_comisiones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pagos_extras`
--
ALTER TABLE `pagos_extras`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pagos_inversiones`
--
ALTER TABLE `pagos_inversiones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pagos_publicidad`
--
ALTER TABLE `pagos_publicidad`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pagos_recurrencia`
--
ALTER TABLE `pagos_recurrencia`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pagos_uninivel`
--
ALTER TABLE `pagos_uninivel`
  ADD PRIMARY KEY (`id_pago`);

--
-- Indices de la tabla `red_binaria`
--
ALTER TABLE `red_binaria`
  ADD PRIMARY KEY (`id_binaria`),
  ADD KEY `red_binaria_ibfk_1` (`usuario_red`);

--
-- Indices de la tabla `red_uninivel`
--
ALTER TABLE `red_uninivel`
  ADD PRIMARY KEY (`id_uninivel`),
  ADD KEY `red_uninivel_ibfk_1` (`usuario_red`);

--
-- Indices de la tabla `soporte`
--
ALTER TABLE `soporte`
  ADD PRIMARY KEY (`id_soporte`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`doc_usuario`),
  ADD UNIQUE KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`id_video`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `afiliados_recurrentes`
--
ALTER TABLE `afiliados_recurrentes`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `bonos_extras`
--
ALTER TABLE `bonos_extras`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `campanas`
--
ALTER TABLE `campanas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `comisiones`
--
ALTER TABLE `comisiones`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `comprobantes`
--
ALTER TABLE `comprobantes`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `cuentas_bancarias`
--
ALTER TABLE `cuentas_bancarias`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `niveles_comision`
--
ALTER TABLE `niveles_comision`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `notificaciones`
--
ALTER TABLE `notificaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `pagos_afiliados`
--
ALTER TABLE `pagos_afiliados`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `pagos_bienvenida`
--
ALTER TABLE `pagos_bienvenida`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `pagos_comisiones`
--
ALTER TABLE `pagos_comisiones`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `pagos_extras`
--
ALTER TABLE `pagos_extras`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `pagos_inversiones`
--
ALTER TABLE `pagos_inversiones`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `pagos_publicidad`
--
ALTER TABLE `pagos_publicidad`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `pagos_recurrencia`
--
ALTER TABLE `pagos_recurrencia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `pagos_uninivel`
--
ALTER TABLE `pagos_uninivel`
  MODIFY `id_pago` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `red_binaria`
--
ALTER TABLE `red_binaria`
  MODIFY `id_binaria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT de la tabla `red_uninivel`
--
ALTER TABLE `red_uninivel`
  MODIFY `id_uninivel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT de la tabla `soporte`
--
ALTER TABLE `soporte`
  MODIFY `id_soporte` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- AUTO_INCREMENT de la tabla `videos`
--
ALTER TABLE `videos`
  MODIFY `id_video` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `afiliados_recurrentes`
--
ALTER TABLE `afiliados_recurrentes`
  ADD CONSTRAINT `afiliados_recurrentes_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON UPDATE CASCADE,
  ADD CONSTRAINT `afiliados_recurrentes_ibfk_2` FOREIGN KEY (`id_pago_afiliados`) REFERENCES `pagos_afiliados` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `afiliados_recurrentes_ibfk_3` FOREIGN KEY (`id_comprobante`) REFERENCES `comprobantes` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `bonos_extras`
--
ALTER TABLE `bonos_extras`
  ADD CONSTRAINT `bonos_extras_ibfk_1` FOREIGN KEY (`id_pago_extra`) REFERENCES `pagos_extras` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `bonos_extras_ibfk_2` FOREIGN KEY (`id_comprobante`) REFERENCES `comprobantes` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `bonos_extras_ibfk_3` FOREIGN KEY (`id_campana`) REFERENCES `campanas` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `bonos_extras_ibfk_4` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `comprobantes`
--
ALTER TABLE `comprobantes`
  ADD CONSTRAINT `comprobantes_ibfk_1` FOREIGN KEY (`doc_usuario`) REFERENCES `usuarios` (`doc_usuario`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `red_binaria`
--
ALTER TABLE `red_binaria`
  ADD CONSTRAINT `red_binaria_ibfk_1` FOREIGN KEY (`usuario_red`) REFERENCES `usuarios` (`id_usuario`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `red_uninivel`
--
ALTER TABLE `red_uninivel`
  ADD CONSTRAINT `red_uninivel_ibfk_1` FOREIGN KEY (`usuario_red`) REFERENCES `usuarios` (`id_usuario`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
