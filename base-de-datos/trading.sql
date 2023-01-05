-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-01-2023 a las 22:09:40
-- Versión del servidor: 10.4.20-MariaDB
-- Versión de PHP: 8.0.9

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
-- Estructura de tabla para la tabla `bonos_extras`
--

CREATE TABLE `bonos_extras` (
  `id` bigint(20) NOT NULL,
  `id_pago_extra` bigint(20) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_comprobante` int(11) NOT NULL,
  `id_campana` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `bonos_extras`
--

INSERT INTO `bonos_extras` (`id`, `id_pago_extra`, `id_usuario`, `id_comprobante`, `id_campana`) VALUES
(321, 249, 84, 14, 2),
(322, 250, 75, 6, 2),
(323, 251, 77, 7, 2),
(324, 250, 78, 9, 2),
(326, 253, 80, 13, 2),
(327, 254, 82, 15, 2),
(328, 253, 81, 16, 2),
(330, 256, 74, 11, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `campanas`
--

CREATE TABLE `campanas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` text NOT NULL,
  `retorno` float NOT NULL,
  `estado` int(11) NOT NULL,
  `tipo` int(11) NOT NULL,
  `cupos` int(11) NOT NULL,
  `fecha_inicio` datetime NOT NULL,
  `fecha_fin` datetime NOT NULL,
  `fecha_retorno` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `campanas`
--

INSERT INTO `campanas` (`id`, `nombre`, `retorno`, `estado`, `tipo`, `cupos`, `fecha_inicio`, `fecha_fin`, `fecha_retorno`) VALUES
(1, 'stake1', 10, 1, 1, 100, '2023-01-04 15:23:00', '2023-01-28 15:24:00', '2023-01-31'),
(2, 'Bono Extra', 10000, 1, 2, 0, '2023-01-04 14:00:00', '2023-01-31 15:24:00', '2023-02-03'),
(3, 'publicidad1', 5000, 1, 3, 100, '2023-01-04 15:25:00', '2023-01-12 15:25:00', '2023-01-31');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id_categoria`, `nombre_categoria`, `ruta_categoria`, `descripcion_categoria`, `icono_categoria`, `color_categoria`, `fecha_categoria`) VALUES
(1, 'Cuerpo Activo', 'cuerpo-activo', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vitae luctus mauris. Phasellus diam elit, congue interdum velit vitae, aliquet dignissim massa. Nam risus tortor, sagittis eget erat ac, sodales bibendum quam', 'fas fa-heart', 'purple', '2019-07-10 18:46:53'),
(2, 'Mente Sana', 'mente-sana', 'Sed ac vehicula neque, at venenatis nibh. Nullam aliquam odio tempor molestie dignissim. Aenean feugiat porttitor magna, non lobortis magna euismod a. Praesent risus tortor, consectetur et felis ac, accumsan tempor risus.', 'fas fa-puzzle-piece', 'info', '2019-07-10 18:46:53'),
(3, 'Espíritu Libre', 'espiritu-libre', 'Etiam placerat rhoncus pharetra. Fusce dapibus sem ultricies nulla consequat, vel cursus lacus interdum. Nulla ornare iaculis sapien nec faucibus. Nulla condimentum tempus magna, id faucibus nunc egestas ac.', 'fas fa-wind', 'primary', '2019-07-10 18:46:53');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comisiones`
--

CREATE TABLE `comisiones` (
  `id` bigint(20) NOT NULL,
  `id_pago_comision` int(11) NOT NULL,
  `id_comprobante` int(11) NOT NULL,
  `nivel` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `comisiones`
--

INSERT INTO `comisiones` (`id`, `id_pago_comision`, `id_comprobante`, `nivel`) VALUES
(959, 575, 14, 1),
(960, 576, 14, 2),
(961, 577, 14, 3),
(962, 578, 14, 4),
(963, 579, 14, 5),
(964, 579, 6, 1),
(966, 578, 7, 1),
(967, 579, 7, 2),
(969, 579, 9, 1),
(972, 577, 13, 1),
(973, 578, 13, 2),
(974, 579, 13, 3),
(976, 576, 15, 1),
(977, 577, 15, 2),
(978, 578, 15, 3),
(979, 579, 15, 4),
(992, 577, 16, 1),
(993, 578, 16, 2),
(994, 579, 16, 3),
(1016, 586, 11, 1),
(1017, 586, 6, 2),
(1018, 586, 7, 3),
(1019, 586, 13, 4),
(1020, 586, 15, 5),
(1021, 586, 16, 4),
(1022, 586, 9, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comprobantes`
--

CREATE TABLE `comprobantes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `foto` text NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` int(11) NOT NULL,
  `valor` bigint(20) NOT NULL,
  `doc_usuario` bigint(20) NOT NULL,
  `campana` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `comprobantes`
--

INSERT INTO `comprobantes` (`id`, `foto`, `fecha`, `estado`, `valor`, `doc_usuario`, `campana`) VALUES
(6, 'vistas/img/comprobantes/5554443333235/178.png', '2023-01-05 20:52:27', 1, 1000000, 5554443333235, 1),
(7, 'vistas/img/comprobantes/99074563/568.png', '2023-01-05 20:52:28', 1, 100000, 99074563, 1),
(8, 'vistas/img/comprobantes/99074563/598.png', '2023-01-04 23:34:37', 0, 500000, 99074563, 1),
(9, 'vistas/img/comprobantes/903126765/945.png', '2023-01-05 20:52:30', 1, 150000, 903126765, 1),
(10, 'vistas/img/comprobantes/65756711/170.png', '2023-01-05 02:47:55', 0, 50000, 65756711, 1),
(11, 'vistas/img/comprobantes/123456123/552.png', '2023-01-05 20:52:32', 1, 200000, 123456123, 1),
(12, 'vistas/img/comprobantes/56456456112/869.png', '2023-01-05 20:57:14', 1, 150000, 56456456112, 1),
(13, 'vistas/img/comprobantes/212189700326/724.png', '2023-01-05 20:52:42', 1, 20000, 212189700326, 1),
(14, 'vistas/img/comprobantes/66645356341/723.png', '2023-01-05 20:52:25', 1, 100000, 66645356341, 1),
(15, 'vistas/img/comprobantes/99998744559/644.png', '2023-01-05 20:52:44', 1, 100000, 99998744559, 1),
(16, 'vistas/img/comprobantes/1111122235498/595.png', '2023-01-05 21:01:06', 1, 1000000, 1111122235498, 1);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cuentas_bancarias`
--

INSERT INTO `cuentas_bancarias` (`id`, `numero`, `usuario`, `tipo_documento`, `titular`, `nombre_titular`, `entidad`, `estado`, `tipo`, `fecha`) VALUES
(1, '45345345435', 75, 'cedula de ciudadania', 534356456456, 'Juan Perez', 'davivienda', 1, 'ahorros', '2023-01-04 21:28:54'),
(2, '032159484', 74, 'cedula de extranjeria', 123121111, 'Julio', 'bancolombia', 1, 'corriente', '2023-01-04 21:32:48'),
(3, '34234234234', 76, 'pasaporte', 43434108, 'Pablo', 'bbva', 1, 'otro', '2023-01-04 21:36:16'),
(4, '4356757511112222', 77, 'pasaporte', 3242345, 'Marta', 'banco de bogota', 1, 'corriente', '2023-01-04 21:42:49'),
(5, '633310', 78, 'cedula de ciudadania', 23432411, 'Gabriel', 'bbva', 1, 'otro', '2023-01-04 23:43:55'),
(6, '12300067655', 79, 'cedula de extranjeria', 213211, 'Pedro', 'bbva', 1, 'otro', '2023-01-05 01:43:22'),
(7, '2321021021', 80, 'cedula de extranjeria', 3123123, 'Pedro', 'davivienda', 1, 'corriente', '2023-01-05 20:26:19'),
(8, '034111100983', 81, 'cedula de ciudadania', 2131, 'Lucero', 'bbva', 1, 'ahorros', '2023-01-05 20:28:14'),
(9, '767667676767', 84, 'cedula de ciudadania', 12312312323, 'Julio', 'Banco popular', 1, 'ahorros', '2023-01-05 20:38:22');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `niveles_comision`
--

CREATE TABLE `niveles_comision` (
  `id` int(11) NOT NULL,
  `nivel` int(11) NOT NULL,
  `porcentaje` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `niveles_comision`
--

INSERT INTO `niveles_comision` (`id`, `nivel`, `porcentaje`) VALUES
(1, 1, 5);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `notificaciones`
--

INSERT INTO `notificaciones` (`id`, `tipo`, `id_usuario`, `id_detalle`, `visualizacion`, `fecha`) VALUES
(16, 'red', 1, 74, 0, '2023-01-04 20:28:07'),
(17, 'red', 74, 75, 0, '2023-01-04 20:59:19'),
(18, 'red', 1, 76, 0, '2023-01-04 21:35:46'),
(19, 'red', 75, 77, 0, '2023-01-04 21:42:28'),
(20, 'red', 74, 78, 0, '2023-01-04 23:43:12'),
(21, 'red', 1, 79, 0, '2023-01-05 01:43:02'),
(22, 'red', 77, 80, 0, '2023-01-05 20:25:42'),
(23, 'red', 77, 81, 0, '2023-01-05 20:27:43'),
(24, 'red', 1, 82, 0, '2023-01-05 20:29:20'),
(25, 'red', 82, 84, 0, '2023-01-05 20:36:33');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `pagos_comisiones`
--

INSERT INTO `pagos_comisiones` (`id`, `id_usuario`, `valor`, `estado`, `id_cuenta`, `fecha`) VALUES
(575, 82, 0, 0, 0, '2023-01-05 20:52:25'),
(576, 80, 0, 0, 0, '2023-01-05 20:52:25'),
(577, 77, 0, 0, 0, '2023-01-05 20:52:25'),
(578, 75, 0, 0, 0, '2023-01-05 20:52:25'),
(579, 74, 0, 0, 0, '2023-01-05 20:52:25'),
(586, 76, 0, 0, 0, '2023-01-05 21:08:53');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pagos_extras`
--

INSERT INTO `pagos_extras` (`id`, `id_usuario`, `estado`, `referidos_obtenidos`, `valor`, `id_cuenta`, `fecha`) VALUES
(249, 82, 0, 0, 0, 0, '2023-01-05 20:52:25'),
(250, 74, 0, 0, 0, 0, '2023-01-05 20:52:28'),
(251, 75, 0, 0, 0, 0, '2023-01-05 20:52:29'),
(253, 77, 0, 0, 0, 0, '2023-01-05 20:52:42'),
(254, 80, 0, 0, 0, 0, '2023-01-05 20:52:44'),
(256, 76, 0, 0, 0, 0, '2023-01-05 21:08:53');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos_inversiones`
--

CREATE TABLE `pagos_inversiones` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_comprobante` bigint(20) NOT NULL,
  `estado` int(11) NOT NULL DEFAULT 0,
  `id_cuenta` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `pagos_inversiones`
--

INSERT INTO `pagos_inversiones` (`id`, `id_usuario`, `id_comprobante`, `estado`, `id_cuenta`, `fecha`) VALUES
(465, 84, 14, 0, 0, '2023-01-05 20:52:25'),
(466, 75, 6, 0, 0, '2023-01-05 20:52:27'),
(467, 77, 7, 0, 0, '2023-01-05 20:52:28'),
(468, 78, 9, 0, 0, '2023-01-05 20:52:30'),
(469, 74, 11, 0, 0, '2023-01-05 20:52:32'),
(470, 80, 13, 0, 0, '2023-01-05 20:52:42'),
(471, 82, 15, 0, 0, '2023-01-05 20:52:44'),
(472, 76, 12, 0, 0, '2023-01-05 20:57:14'),
(473, 81, 16, 0, 0, '2023-01-05 21:01:06');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `red_binaria`
--

CREATE TABLE `red_binaria` (
  `id_binaria` int(11) NOT NULL,
  `usuario_red` int(11) NOT NULL,
  `orden_binaria` int(11) NOT NULL,
  `derrame_binaria` int(11) NOT NULL,
  `patrocinador_red` text DEFAULT NULL,
  `periodo_venta` float NOT NULL,
  `fecha_binaria` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `red_binaria`
--

INSERT INTO `red_binaria` (`id_binaria`, `usuario_red`, `orden_binaria`, `derrame_binaria`, `patrocinador_red`, `periodo_venta`, `fecha_binaria`) VALUES
(1, 1, 1, 0, 'admin-trading', 0, '2022-12-27 05:36:47'),
(54, 74, 2, 4, 'prueba-7585', 0, '2023-01-05 21:08:54'),
(55, 75, 3, 2, 'mateo-0902', 0, '2023-01-04 23:36:30'),
(56, 76, 4, 1, 'admin-trading', 0, '2023-01-05 21:06:55'),
(57, 77, 5, 3, 'pedro-0121', 0, '2023-01-04 21:42:28'),
(58, 78, 6, 2, 'mateo-0902', 0, '2023-01-04 23:43:12'),
(59, 79, 7, 1, 'admin-trading', 0, '2023-01-05 01:43:02'),
(60, 80, 8, 5, 'carolina-0075', 0, '2023-01-05 20:25:42'),
(61, 81, 9, 5, 'carolina-0075', 0, '2023-01-05 20:27:43'),
(62, 82, 10, 8, 'miguel-2671', 0, '2023-01-05 20:30:43'),
(63, 84, 11, 10, 'fernando-guzman-perez-82', 0, '2023-01-05 20:36:33');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `red_uninivel`
--

CREATE TABLE `red_uninivel` (
  `id_uninivel` int(11) NOT NULL,
  `usuario_red` int(11) NOT NULL,
  `patrocinador_red` text DEFAULT NULL,
  `fecha_uninivel` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `red_uninivel`
--

INSERT INTO `red_uninivel` (`id_uninivel`, `usuario_red`, `patrocinador_red`, `fecha_uninivel`) VALUES
(1, 1, 'admin-trading', '2022-11-16 03:31:13'),
(67, 74, 'prueba-7585', '2023-01-05 21:08:54'),
(68, 75, 'mateo-0902', '2023-01-04 23:36:30'),
(69, 76, 'admin-trading', '2023-01-05 21:06:55'),
(70, 77, 'pedro-0121', '2023-01-04 21:42:28'),
(71, 78, 'mateo-0902', '2023-01-04 23:43:12'),
(72, 79, 'admin-trading', '2023-01-05 01:43:02'),
(73, 80, 'carolina-0075', '2023-01-05 20:25:42'),
(74, 81, 'carolina-0075', '2023-01-05 20:27:43'),
(75, 82, 'miguel-2671', '2023-01-05 20:30:43'),
(76, 84, 'fernando-guzman-perez-82', '2023-01-05 20:36:33');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` bigint(20) UNSIGNED NOT NULL,
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
  `verificacion` int(11) NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `doc_usuario`, `perfil`, `usuario`, `nombre`, `email`, `password`, `estado`, `operando`, `ciclo_pago`, `vencimiento`, `verificacion`, `email_encriptado`, `foto`, `enlace_afiliado`, `patrocinador`, `pais`, `codigo_pais`, `telefono_movil`, `firma`, `fecha_contrato`, `fecha`, `eliminado`) VALUES
(1, 1, 'admin', 'Administrador', 'Administrador', 'admin@trading.com', '$2a$07$asxx54ahjppf45sd87a5auGZEtGHuyZwm.Ur.FJvWLCql3nmsMbXy', 1, 0, NULL, '2019-10-07', 1, NULL, 'vistas/img/usuarios/1/434.jpg', 'admin-trading', NULL, NULL, NULL, '+57 (321)85749', 'firma', NULL, '2019-09-27 19:13:02', 0),
(79, 65756711, 'usuario', 'Luis', 'Luis Amando Caceres', 'luis@gmail.com', '$2a$07$asxx54ahjppf45sd87a5auFL5K1.Cmt9ZheoVVuudOi5BCi10qWly', 1, 0, NULL, NULL, 1, '19ff31020abd6906f2f975a3e77e07c7', NULL, 'luis-1148', 'admin-trading', 'Peru', 'PE', '+51 (316) 312-3123', '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?><!DOCTYPE svg PUBLIC \"-//W3C//DTD SVG 1.1//EN\" \"http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd\"><svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"167\" height=\"88\"><path stroke-linejoin=\"round\" stroke-linecap=\"round\" stroke-width=\"1\" stroke=\"#333\" fill=\"none\" d=\"M 1 44 c 0 -0.09 -0.28 -5.26 0 -5 c 1.49 1.4 11.44 13.65 17 21 c 4 5.28 6.4 13.18 11 16 c 8.24 5.06 27.27 12.47 33 11 c 3.6 -0.92 5.3 -14.16 6 -21 c 0.9 -8.78 -0.28 -18.48 -1 -28 c -0.65 -8.55 -1.47 -16.9 -3 -25 c -0.77 -4.07 -3.96 -11.78 -4 -12 c -0.03 -0.13 1.66 4.91 3 7 c 3.89 6.09 8.28 12.1 13 18 c 6.18 7.72 12.08 15.59 19 22 c 6.47 6 14.43 11.75 22 16 c 5.64 3.16 12.73 5.48 19 7 c 4.35 1.05 9.72 1.37 14 1 c 2.89 -0.25 6.96 -1.4 9 -3 c 2.03 -1.59 3.81 -5.28 5 -8 c 1.04 -2.38 1.9 -5.39 2 -8 c 0.22 -5.38 -0.26 -12.1 -1 -17 l -2 -3\"/></svg>', '2023-01-04', '2023-01-05 01:39:09', 0),
(77, 99074563, 'usuario', 'Carolina', 'Carolina Torres', 'carolina@gmail.com', '$2a$07$asxx54ahjppf45sd87a5auFL5K1.Cmt9ZheoVVuudOi5BCi10qWly', 1, 1, NULL, NULL, 1, '38ad84cbc67a6e587e34df5df5bdb41c', NULL, 'carolina-0075', 'pedro-0121', 'Argentina', 'AR', '+54 (324) 123-1341', '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?><!DOCTYPE svg PUBLIC \"-//W3C//DTD SVG 1.1//EN\" \"http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd\"><svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"179\" height=\"54\"><path stroke-linejoin=\"round\" stroke-linecap=\"round\" stroke-width=\"1\" stroke=\"#333\" fill=\"none\" d=\"M 1 24 c 0.07 0.05 3.02 1.78 4 3 c 2.81 3.52 4.7 9.29 8 12 c 5.23 4.3 13.39 8.32 20 11 c 3.52 1.43 8.17 2 12 2 c 4.14 0 9.07 -0.69 13 -2 c 4.68 -1.56 10.13 -4.1 14 -7 c 3.67 -2.75 7.31 -7.04 10 -11 c 3.48 -5.13 6.57 -11.2 9 -17 c 1.84 -4.39 5 -13.33 4 -14 c -1.05 -0.7 -9.01 4.91 -13 8 c -6.29 4.87 -11.57 10.94 -18 16 c -12.61 9.91 -37.77 24.96 -38 28 c -0.18 2.32 23.6 -1.83 36 -2 c 37.82 -0.52 73.53 0.31 110 0 l 6 -1\"/></svg>', '2023-01-04', '2023-01-04 21:37:32', 0),
(74, 123456123, 'usuario', 'mateo', 'Mateo Ramirez', 'mateo@gmail.com', '$2a$07$asxx54ahjppf45sd87a5auFL5K1.Cmt9ZheoVVuudOi5BCi10qWly', 1, 1, NULL, NULL, 1, 'e64b49457900a3435c49e2e8ee79f603', NULL, 'mateo-0902', 'prueba-7585', 'Colombia', 'CO', '+57 (321) 973-8243', '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?><!DOCTYPE svg PUBLIC \"-//W3C//DTD SVG 1.1//EN\" \"http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd\"><svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"255\" height=\"47\"><path stroke-linejoin=\"round\" stroke-linecap=\"round\" stroke-width=\"1\" stroke=\"#333\" fill=\"none\" d=\"M 1 1 c 0.09 0.14 2.98 5.75 5 8 c 3.79 4.21 8.33 8.46 13 12 c 6.3 4.77 13.05 9.36 20 13 c 6.93 3.63 14.62 6.94 22 9 c 6.59 1.84 14.04 2.88 21 3 c 11.82 0.21 26.37 0.7 36 -2 c 4.92 -1.38 9.78 -7.62 14 -12 c 4.72 -4.9 9.43 -10.54 13 -16 c 1.86 -2.85 3.15 -6.8 4 -10 c 0.4 -1.49 -0.59 -5.17 0 -5 c 3.18 0.93 15.75 8.59 24 12 c 7.1 2.93 14.56 5.35 22 7 c 7.47 1.66 15.15 2.37 23 3 c 9.15 0.73 18.32 1.24 27 1 l 9 -2\"/></svg>', '2023-01-04', '2023-01-04 20:26:19', 0),
(78, 903126765, 'usuario', 'Juan', 'Juan Flórez', 'juan@gmail.com', '$2a$07$asxx54ahjppf45sd87a5auFL5K1.Cmt9ZheoVVuudOi5BCi10qWly', 1, 1, NULL, NULL, 1, '7038663cc684aa330956752c7e6fe7d4', NULL, 'juan-5310', 'mateo-0902', 'Colombia', 'CO', '+57 (123) 123-1231', '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?><!DOCTYPE svg PUBLIC \"-//W3C//DTD SVG 1.1//EN\" \"http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd\"><svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"264\" height=\"76\"><path stroke-linejoin=\"round\" stroke-linecap=\"round\" stroke-width=\"1\" stroke=\"#333\" fill=\"none\" d=\"M 1 13 c 1.73 0 66.19 1.07 99 0 c 8.06 -0.26 16.37 -1.95 24 -4 c 5.77 -1.55 11.38 -5.13 17 -7 c 2.16 -0.72 5.65 -1.9 7 -1 c 2.59 1.73 5.04 7.47 8 11 c 5.85 6.98 11.33 14.4 18 20 c 9.63 8.09 20.84 15.34 32 22 c 9.64 5.75 19.84 11.26 30 15 c 8.38 3.09 27 6 27 6\"/></svg>', '2023-01-04', '2023-01-04 23:38:57', 0),
(76, 56456456112, 'usuario', 'prueba', 'prueba desarrollo', 'prueba@gmail.com', '$2a$07$asxx54ahjppf45sd87a5auFL5K1.Cmt9ZheoVVuudOi5BCi10qWly', 1, 1, NULL, NULL, 1, 'c81b5136bcd10b4390108c979ed28ee6', NULL, 'prueba-7585', 'admin-trading', 'Colombia', 'CO', '+57 (312) 312-3123', '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?><!DOCTYPE svg PUBLIC \"-//W3C//DTD SVG 1.1//EN\" \"http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd\"><svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"162\" height=\"41\"><path stroke-linejoin=\"round\" stroke-linecap=\"round\" stroke-width=\"1\" stroke=\"#333\" fill=\"none\" d=\"M 1 4 c 0.24 0.18 9.6 6.29 14 10 c 6.34 5.35 11.44 14.11 18 17 c 11.13 4.9 37.02 9.72 41 9 c 1.61 -0.29 -5.02 -10.16 -8 -15 c -2.38 -3.88 -5.04 -7.7 -8 -11 c -2.62 -2.93 -5.82 -5.7 -9 -8 c -2.72 -1.96 -9.17 -5.07 -9 -5 c 0.74 0.29 28.25 13.49 42 18 c 5.75 1.88 19.33 1.99 19 2 c -1.4 0.05 -53.47 -0.31 -80 0 c -2.02 0.02 -6 0.57 -6 1 c 0 0.47 3.99 2.75 6 3 c 7.81 0.98 17 0.94 26 1 c 39.41 0.28 111.49 0.02 114 0 l -5 -1\"/></svg>', '2023-01-04', '2023-01-04 21:34:05', 0),
(84, 66645356341, 'usuario', 'Mike', 'Mike Torres', 'mike@gmail.com', '$2a$07$asxx54ahjppf45sd87a5auFL5K1.Cmt9ZheoVVuudOi5BCi10qWly', 1, 1, NULL, NULL, 1, 'e28f6f64608c970c663197d7fe1f5a59', NULL, 'mike-6341', 'fernando-guzman-perez-82', 'Colombia', 'CO', '+57 (312) 312-3123', 'firma', '2023-01-05', '2023-01-05 20:36:33', 0),
(82, 99998744559, 'usuario', 'Ford', 'Fernando Guzman Perez', 'fernando@gmail.com', '$2a$07$asxx54ahjppf45sd87a5auFL5K1.Cmt9ZheoVVuudOi5BCi10qWly', 1, 1, NULL, NULL, 1, '5c9da67f026979f60685dc07efc1be3c', NULL, 'fernando-guzman-perez-82', 'miguel-2671', 'Colombia', 'CO', '+57 (312) 312-3123', 'firma', '2023-01-05', '2023-01-05 20:29:20', 0),
(80, 212189700326, 'usuario', 'Miguel', 'Miguel Torrado', 'miguel@gmail.com', '$2a$07$asxx54ahjppf45sd87a5auFL5K1.Cmt9ZheoVVuudOi5BCi10qWly', 1, 1, NULL, NULL, 1, 'c952ec83eabde595820603a3ca9d7f54', NULL, 'miguel-2671', 'carolina-0075', 'Colombia', 'CO', '+57 (312) 312-3123', '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?><!DOCTYPE svg PUBLIC \"-//W3C//DTD SVG 1.1//EN\" \"http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd\"><svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"151\" height=\"51\"><path stroke-linejoin=\"round\" stroke-linecap=\"round\" stroke-width=\"1\" stroke=\"#333\" fill=\"none\" d=\"M 10 31 c -0.14 -0.23 -5.74 -8.74 -8 -13 c -0.61 -1.15 -1.55 -3.93 -1 -4 c 2.29 -0.29 11.6 0.59 17 2 c 9.68 2.52 18.91 6.89 29 10 c 17.8 5.5 34.01 10.25 52 15 c 11.93 3.15 23.26 5.93 35 8 c 5.24 0.92 16.24 1.79 16 1 c -0.32 -1.08 -12.33 -7.72 -19 -11 c -13.33 -6.55 -27.31 -11.8 -40 -18 c -1.85 -0.91 -5.61 -3.52 -5 -4 c 2.39 -1.86 15.16 -7.59 23 -10 c 9.26 -2.85 29 -6 29 -6\"/></svg>', '2023-01-05', '2023-01-05 20:24:56', 0),
(81, 1111122235498, 'usuario', 'Lucas', 'Lucas Quintero', 'lucas@gmail.com', '$2a$07$asxx54ahjppf45sd87a5auFL5K1.Cmt9ZheoVVuudOi5BCi10qWly', 1, 1, NULL, NULL, 1, '8cf1058ab12967c940ece8ea627adff2', NULL, 'lucas-6671', 'carolina-0075', 'Colombia', 'CO', '+57 (312) 312-3123', '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?><!DOCTYPE svg PUBLIC \"-//W3C//DTD SVG 1.1//EN\" \"http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd\"><svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"239\" height=\"68\"><path stroke-linejoin=\"round\" stroke-linecap=\"round\" stroke-width=\"1\" stroke=\"#333\" fill=\"none\" d=\"M 1 1 c 0.12 0.05 5.22 1.48 7 3 c 6.94 5.95 13.98 13.6 21 21 c 5.69 6 10.03 13.07 16 18 c 8.94 7.38 20.04 14.91 30 20 c 4.83 2.46 11.38 3.3 17 4 c 4.83 0.6 10.77 1.1 15 0 c 3.92 -1.02 9.08 -4.08 12 -7 c 3.5 -3.5 6.39 -9.14 9 -14 c 2.38 -4.45 5.15 -9.58 6 -14 c 0.67 -3.5 0.54 -9.9 -1 -12 c -1.34 -1.82 -6.7 -2.67 -10 -3 c -6.32 -0.63 -13.32 -0.48 -20 0 c -7.42 0.53 -15.18 1.25 -22 3 c -4.39 1.13 -10.24 3.83 -13 6 c -0.98 0.77 -1.64 4.04 -1 5 c 1.43 2.15 5.75 5.72 9 7 c 8.57 3.38 18.97 5.71 29 8 c 17 3.87 33.16 7.87 50 10 c 14.88 1.88 29.46 1.63 45 2 c 13.11 0.32 38 0 38 0\"/></svg>', '2023-01-05', '2023-01-05 20:27:12', 0),
(75, 5554443333235, 'usuario', 'Pedro', 'Pedro Pablo', 'pedro@gmail.com', '$2a$07$asxx54ahjppf45sd87a5auFL5K1.Cmt9ZheoVVuudOi5BCi10qWly', 1, 1, NULL, NULL, 1, 'c3b7f393410fe6185ba5d966a213a38f', NULL, 'pedro-0121', 'mateo-0902', 'Colombia', 'CO', '+57 (321) 312-3131', '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?><!DOCTYPE svg PUBLIC \"-//W3C//DTD SVG 1.1//EN\" \"http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd\"><svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"369\" height=\"59\"><path stroke-linejoin=\"round\" stroke-linecap=\"round\" stroke-width=\"1\" stroke=\"#333\" fill=\"none\" d=\"M 92 31 c 0.02 -0.1 0.93 -3.98 1 -6 c 0.27 -7.95 -0.34 -22.47 0 -24 c 0.1 -0.46 3.76 4.01 4 6 c 0.63 5.26 0.76 13.73 -1 19 c -1.87 5.61 -6.56 12.69 -11 17 c -5.84 5.67 -14.76 14.12 -22 15 c -16.38 2 -46.78 -2.27 -60 -5 c -1.88 -0.39 -3 -5.6 -3 -8 c 0 -3.2 0.94 -8.84 3 -11 c 3.31 -3.48 10.52 -7.67 16 -9 c 13.86 -3.35 31.32 -6.75 46 -6 c 22.79 1.17 46.44 7.45 71 12 c 31.64 5.86 60.18 14.15 91 18 c 33.62 4.2 94.17 6.39 101 6 c 1.2 -0.07 -9.08 -7.66 -14 -11 c -4.45 -3.02 -9.24 -5.82 -14 -8 c -3.08 -1.41 -10.17 -3.06 -10 -3 c 0.23 0.08 8.53 2.98 13 4 c 7.34 1.68 14.64 3.46 22 4 c 10.86 0.79 22.49 0.53 33 0 c 2.32 -0.12 5.27 -1.04 7 -2 l 2 -3\"/></svg>', '2023-01-04', '2023-01-04 20:58:20', 0);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `videos`
--

INSERT INTO `videos` (`id_video`, `id_cat`, `titulo_video`, `descripcion_video`, `medios_video`, `medios_video_mp4`, `imagen_video`, `vista_gratuita`, `fecha_video`) VALUES
(1, 1, 'Lorem ipsum dolor sit amet', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vitae luctus mauris. Phasellus diam elit, congue interdum velit vitae, aliquet dignissim massa. Nam risus tortor, sagittis eget erat ac, sodales bibendum quam.', 'vistas/videos/cuerpo-activo/01-video/01-video.m3u8', 'vistas/videos/cuerpo-activo/01-video.mp4', 'vistas/img/cuerpo-activo/01-imagen.jpg', 1, '2019-08-30 21:39:04'),
(2, 1, 'Consectetur adipiscing elit', 'Sed lacus purus, suscipit et nibh in, elementum varius purus. Mauris eget ornare ipsum, at faucibus est. Quisque sem elit, condimentum nec sodales et, auctor in nisl.', 'vistas/videos/cuerpo-activo/02-video/02-video.m3u8', 'vistas/videos/cuerpo-activo/02-video.mp4', 'vistas/img/cuerpo-activo/02-imagen.jpg', 1, '2019-08-30 21:39:24'),
(3, 1, 'Morbi eleifend porta efficitur', 'Aenean quis lectus ac nibh elementum lobortis. Praesent ac bibendum nisi, in tempor elit. Cras ex diam, tincidunt congue tincidunt in, consequat quis lorem. Maecenas rutrum scelerisque dignissim.', 'vistas/videos/cuerpo-activo/03-video/03-video.m3u8', 'vistas/videos/cuerpo-activo/03-video.mp4', 'vistas/img/cuerpo-activo/03-imagen.jpg', 1, '2019-08-30 21:39:27'),
(4, 1, 'Quisque nec tortor ultrices', 'Nunc suscipit suscipit porta. Donec sagittis urna hendrerit mauris suscipit, eu gravida lacus elementum. Donec augue lacus, ultricies quis hendrerit sit amet, varius sit amet justo.', 'vistas/videos/cuerpo-activo/04-video/04-video.m3u8', 'vistas/videos/cuerpo-activo/04-video.mp4', 'vistas/img/cuerpo-activo/04-imagen.jpg', 0, '2019-08-30 21:39:30'),
(5, 1, 'Vivamus et ullamcorper massa', 'Praesent quis diam in diam facilisis semper. Nam sit amet commodo arcu. Duis luctus, purus vel imperdiet gravida, urna nibh tincidunt nisl', 'vistas/videos/cuerpo-activo/05-video/05-video.m3u8', 'vistas/videos/cuerpo-activo/05-video.mp4', 'vistas/img/cuerpo-activo/05-imagen.jpg', 0, '2019-08-30 21:39:38'),
(6, 1, 'Erat sit amet urna consecteturt', 'Aliquam sed orci pretium, viverra orci sed, sollicitudin risus. Quisque velit ipsum, commodo ut venenatis non, bibendum vitae dolor. Nulla non porttitor nisi. In pharetra sed nisl eget fringilla. Suspendisse potenti.', 'vistas/videos/cuerpo-activo/06-video/06-video.m3u8', 'vistas/videos/cuerpo-activo/06-video.mp4', 'vistas/img/cuerpo-activo/06-imagen.jpg', 0, '2019-08-30 21:39:47'),
(7, 2, 'Lorem ipsum dolor sit amet', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vitae luctus mauris. Phasellus diam elit, congue interdum velit vitae, aliquet dignissim massa. Nam risus tortor, sagittis eget erat ac, sodales bibendum quam.', 'vistas/videos/mente-sana/01-video/01-video.m3u8', 'vistas/videos/mente-sana/01-video.mp4', 'vistas/img/mente-sana/01-imagen.jpg', 1, '2019-08-30 21:40:04'),
(8, 2, 'Consectetur adipiscing elit', 'Sed lacus purus, suscipit et nibh in, elementum varius purus. Mauris eget ornare ipsum, at faucibus est. Quisque sem elit, condimentum nec sodales et, auctor in nisl.', 'vistas/videos/mente-sana/02-video/02-video.m3u8', 'vistas/videos/mente-sana/02-video.mp4', 'vistas/img/mente-sana/02-imagen.jpg', 1, '2019-08-30 21:40:10'),
(9, 2, 'Morbi eleifend porta efficitur', 'Aenean quis lectus ac nibh elementum lobortis. Praesent ac bibendum nisi, in tempor elit. Cras ex diam, tincidunt congue tincidunt in, consequat quis lorem. Maecenas rutrum scelerisque dignissim.', 'vistas/videos/mente-sana/03-video/03-video.m3u8', 'vistas/videos/mente-sana/03-video.mp4', 'vistas/img/mente-sana/03-imagen.jpg', 1, '2019-08-30 21:40:14'),
(10, 2, 'Quisque nec tortor ultrices', 'Nunc suscipit suscipit porta. Donec sagittis urna hendrerit mauris suscipit, eu gravida lacus elementum. Donec augue lacus, ultricies quis hendrerit sit amet, varius sit amet justo.', 'vistas/videos/mente-sana/04-video/04-video.m3u8', 'vistas/videos/mente-sana/04-video.mp4', 'vistas/img/mente-sana/04-imagen.jpg', 0, '2019-08-30 21:40:18'),
(11, 2, 'Vivamus et ullamcorper massa', 'Praesent quis diam in diam facilisis semper. Nam sit amet commodo arcu. Duis luctus, purus vel imperdiet gravida, urna nibh tincidunt nisl', 'vistas/videos/mente-sana/05-video/05-video.m3u8', 'vistas/videos/mente-sana/05-video.mp4', 'vistas/img/mente-sana/05-imagen.jpg', 0, '2019-08-30 21:40:21'),
(12, 2, 'Erat sit amet urna consecteturt', 'Aliquam sed orci pretium, viverra orci sed, sollicitudin risus. Quisque velit ipsum, commodo ut venenatis non, bibendum vitae dolor. Nulla non porttitor nisi. In pharetra sed nisl eget fringilla. Suspendisse potenti.', 'vistas/videos/mente-sana/06-video/06-video.m3u8', 'vistas/videos/mente-sana/06-video.mp4', 'vistas/img/mente-sana/06-imagen.jpg', 0, '2019-08-30 21:40:25'),
(13, 3, 'Lorem ipsum dolor sit amet', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vitae luctus mauris. Phasellus diam elit, congue interdum velit vitae, aliquet dignissim massa. Nam risus tortor, sagittis eget erat ac, sodales bibendum quam.', 'vistas/videos/espiritu-libre/01-video/01-video.m3u8', 'vistas/videos/espiritu-libre/01-video.mp4', 'vistas/img/espiritu-libre/01-imagen.jpg', 1, '2019-08-30 21:40:41'),
(14, 3, 'Consectetur adipiscing elit', 'Sed lacus purus, suscipit et nibh in, elementum varius purus. Mauris eget ornare ipsum, at faucibus est. Quisque sem elit, condimentum nec sodales et, auctor in nisl.', 'vistas/videos/espiritu-libre/02-video/02-video.m3u8', 'vistas/videos/espiritu-libre/02-video.mp4', 'vistas/img/espiritu-libre/02-imagen.jpg', 1, '2019-08-30 21:49:04'),
(15, 3, 'Morbi eleifend porta efficitur', 'Aenean quis lectus ac nibh elementum lobortis. Praesent ac bibendum nisi, in tempor elit. Cras ex diam, tincidunt congue tincidunt in, consequat quis lorem. Maecenas rutrum scelerisque dignissim.', 'vistas/videos/espiritu-libre/03-video/03-video.m3u8', 'vistas/videos/espiritu-libre/03-video.mp4', 'vistas/img/espiritu-libre/03-imagen.jpg', 1, '2019-08-30 21:49:07'),
(16, 3, 'Quisque nec tortor ultrices', 'Nunc suscipit suscipit porta. Donec sagittis urna hendrerit mauris suscipit, eu gravida lacus elementum. Donec augue lacus, ultricies quis hendrerit sit amet, varius sit amet justo.', 'vistas/videos/espiritu-libre/04-video/04-video.m3u8', 'vistas/videos/espiritu-libre/04-video.mp4', 'vistas/img/espiritu-libre/04-imagen.jpg', 0, '2019-08-30 21:49:10'),
(17, 3, 'Vivamus et ullamcorper massa', 'Praesent quis diam in diam facilisis semper. Nam sit amet commodo arcu. Duis luctus, purus vel imperdiet gravida, urna nibh tincidunt nisl', 'vistas/videos/espiritu-libre/05-video/05-video.m3u8', 'vistas/videos/espiritu-libre/05-video.mp4', 'vistas/img/espiritu-libre/05-imagen.jpg', 0, '2019-08-30 21:49:15'),
(18, 3, 'Erat sit amet urna consecteturt', 'Aliquam sed orci pretium, viverra orci sed, sollicitudin risus. Quisque velit ipsum, commodo ut venenatis non, bibendum vitae dolor. Nulla non porttitor nisi. In pharetra sed nisl eget fringilla. Suspendisse potenti.', 'vistas/videos/espiritu-libre/06-video/06-video.m3u8', 'vistas/videos/espiritu-libre/06-video.mp4', 'vistas/img/espiritu-libre/06-imagen.jpg', 0, '2019-08-30 21:49:17');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `bonos_extras`
--
ALTER TABLE `bonos_extras`
  ADD PRIMARY KEY (`id`);

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
  ADD UNIQUE KEY `id` (`id`);

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
-- AUTO_INCREMENT de la tabla `bonos_extras`
--
ALTER TABLE `bonos_extras`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=331;

--
-- AUTO_INCREMENT de la tabla `campanas`
--
ALTER TABLE `campanas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `comisiones`
--
ALTER TABLE `comisiones`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1023;

--
-- AUTO_INCREMENT de la tabla `comprobantes`
--
ALTER TABLE `comprobantes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `cuentas_bancarias`
--
ALTER TABLE `cuentas_bancarias`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `niveles_comision`
--
ALTER TABLE `niveles_comision`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `notificaciones`
--
ALTER TABLE `notificaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `pagos_comisiones`
--
ALTER TABLE `pagos_comisiones`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=587;

--
-- AUTO_INCREMENT de la tabla `pagos_extras`
--
ALTER TABLE `pagos_extras`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=257;

--
-- AUTO_INCREMENT de la tabla `pagos_inversiones`
--
ALTER TABLE `pagos_inversiones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=474;

--
-- AUTO_INCREMENT de la tabla `pagos_publicidad`
--
ALTER TABLE `pagos_publicidad`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pagos_uninivel`
--
ALTER TABLE `pagos_uninivel`
  MODIFY `id_pago` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `red_binaria`
--
ALTER TABLE `red_binaria`
  MODIFY `id_binaria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT de la tabla `red_uninivel`
--
ALTER TABLE `red_uninivel`
  MODIFY `id_uninivel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT de la tabla `soporte`
--
ALTER TABLE `soporte`
  MODIFY `id_soporte` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT de la tabla `videos`
--
ALTER TABLE `videos`
  MODIFY `id_video` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
