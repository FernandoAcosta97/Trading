-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-12-2022 a las 06:50:56
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
(209, 164, 27, 4, 18);

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
(1, 'Shiba Inu 2', 20, 1, 1, 3000, '2022-10-22 00:00:00', '2022-10-29 00:00:00', '2022-10-29'),
(4, 'BitCoin', 10, 1, 1, 2000, '2022-11-03 00:00:00', '2022-11-17 00:00:00', '2022-10-29'),
(10, 'Cardano', 20, 2, 1, 1000, '2022-11-08 00:00:00', '2022-11-12 00:00:00', '2022-11-19'),
(16, 'Bono Extra', 55000, 0, 2, 0, '2022-11-01 00:00:00', '2022-11-24 00:00:00', '2022-11-30'),
(18, 'Bono Extra', 30000, 1, 2, 0, '2022-12-04 00:00:00', '2022-12-29 00:00:00', '2022-12-30'),
(23, 'publicidad', 15000, 1, 3, 10, '2022-12-08 14:09:00', '2022-12-30 14:09:00', '2022-12-30');

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
(597, 426, 4, 1),
(598, 427, 4, 2);

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
  `doc_usuario` int(11) NOT NULL,
  `campana` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `comprobantes`
--

INSERT INTO `comprobantes` (`id`, `foto`, `fecha`, `estado`, `valor`, `doc_usuario`, `campana`) VALUES
(4, 'vistas/img/comprobantes/765/561.png', '2022-12-27 05:42:54', 1, 1000000, 765, 1),
(5, 'vistas/img/comprobantes/765/540.png', '2022-12-27 05:43:30', 1, 0, 765, 23);

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
(72, '984984', 26, 'cedula de ciudadania', 464545456, 'nombre titular', 'davivienda', 1, 'ahorros', '2022-12-27 03:33:25'),
(73, '32454353422', 27, 'cedula de ciudadania', 43545, 'nombre titular', 'davivienda', 1, 'ahorros', '2022-12-27 05:41:52'),
(74, '54', 66, 'cedula de ciudadania', 6456, 'hgh', 'bancolombia', 1, 'ahorros', '2022-12-27 05:48:16');

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
(426, 26, 0, 0, 0, '2022-12-27 05:42:54'),
(427, 64, 0, 0, 0, '2022-12-27 05:42:55');

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
(164, 26, 0, 0, 0, 0, '2022-12-27 05:42:54');

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
(351, 27, 4, 0, 0, '2022-12-27 05:42:54');

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

--
-- Volcado de datos para la tabla `pagos_publicidad`
--

INSERT INTO `pagos_publicidad` (`id`, `id_usuario`, `id_comprobante`, `valor`, `estado`, `id_cuenta`, `fecha`) VALUES
(3, 27, 5, 0, 0, 0, '2022-12-27 05:43:30');

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
(14, 25, 2, 1, 'admin-trading', 0, '2022-10-15 00:00:26'),
(15, 26, 3, 1, 'admin-trading', 0, '2022-12-27 03:54:37'),
(16, 27, 4, 3, 'admin-trading', 0, '2022-12-27 05:37:34'),
(19, 30, 7, 1, 'admin-trading', 0, '2022-12-27 05:39:09'),
(20, 31, 8, 1, 'admin-trading', 0, '2022-12-27 02:25:22'),
(21, 32, 9, 1, 'admin-trading', 0, '2022-10-17 21:12:36'),
(22, 35, 10, 1, 'admin-trading', 0, '2022-12-27 03:54:37'),
(23, 36, 11, 1, 'admin-trading', 0, '2022-12-27 03:54:37'),
(32, 46, 12, 1, 'admin-trading', 0, '2022-10-25 03:04:15'),
(33, 49, 13, 1, 'admin-trading', 0, '2022-12-17 23:55:28'),
(34, 55, 14, 1, 'admin-trading', 0, '2022-11-01 16:04:24'),
(35, 59, 15, 1, 'admin-trading', 0, '2022-11-09 17:23:30'),
(37, 63, 17, 1, 'admin-trading', 0, '2022-12-27 03:54:37'),
(38, 52, 18, 1, 'admin-trading', 0, '2022-12-27 03:54:37'),
(40, 64, 19, 1, 'admin-trading', 0, '2022-12-04 22:04:20'),
(41, 58, 20, 1, 'admin-trading', 0, '2022-12-05 19:39:46'),
(42, 65, 21, 1, 'admin-trading', 0, '2022-12-27 03:54:37'),
(43, 66, 22, 3, 'admin-trading', 0, '2022-12-27 05:37:44'),
(44, 69, 23, 1, 'admin-trading', 0, '2022-12-07 16:33:27'),
(45, 70, 24, 10, 'admin-trading', 0, '2022-12-27 05:37:54'),
(46, 53, 25, 1, 'admin-trading', 0, '2022-12-15 03:16:58'),
(47, 71, 26, 1, 'admin-trading', 0, '2022-12-27 05:39:09'),
(49, 54, 28, 1, 'admin-trading', 0, '2022-12-24 22:02:40'),
(50, 59, 29, 1, 'admin-trading', 0, '2022-12-27 03:54:37'),
(51, 59, 30, 1, 'admin-trading', 0, '2022-12-27 03:54:37'),
(52, 59, 31, 1, 'admin-trading', 0, '2022-12-27 03:54:37'),
(53, 59, 32, 1, 'admin-trading', 0, '2022-12-27 03:54:37');

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
(21, 25, 'admin-trading', '2022-11-16 03:32:12'),
(22, 26, 'prueba-desarrollo-64', '2022-12-06 20:37:01'),
(23, 27, 'mateo-26', '2022-11-16 03:32:12'),
(26, 30, 'mateo-26', '2022-11-16 03:32:12'),
(27, 31, 'admin-trading', '2022-12-27 02:25:22'),
(28, 32, 'admin-trading', '2022-11-16 03:32:12'),
(29, 35, 'jordan-63', '2022-11-29 22:58:16'),
(30, 36, 'carlos-31', '2022-11-26 04:32:23'),
(39, 46, 'admin-trading', '2022-11-16 03:32:13'),
(40, 49, 'admin-trading', '2022-12-17 23:55:28'),
(41, 55, 'admin-trading', '2022-11-16 03:32:13'),
(42, 59, 'admin-trading', '2022-11-16 03:32:13'),
(44, 63, 'julian-30', '2022-12-02 21:33:50'),
(45, 52, 'mateo-26', '2022-11-26 05:11:34'),
(47, 64, 'admin-trading', '2022-12-04 22:04:20'),
(48, 58, 'admin-trading', '2022-12-05 19:39:46'),
(49, 65, 'prueba-8773', '2022-12-24 22:01:22'),
(50, 66, 'admin-trading', '2022-12-07 16:30:58'),
(51, 69, 'admin-trading', '2022-12-07 16:33:27'),
(52, 70, 'admin-trading', '2022-12-07 16:33:50'),
(53, 53, 'admin-trading', '2022-12-15 03:16:58'),
(54, 71, 'admin-trading', '2022-12-20 15:45:55'),
(56, 54, 'admin-trading', '2022-12-24 22:02:40'),
(57, 59, 'mateo-26', '2022-12-27 02:13:51'),
(58, 59, 'mateo-26', '2022-12-27 02:15:17'),
(59, 59, 'mateo-26', '2022-12-27 03:08:24'),
(60, 59, 'mateo-26', '2022-12-27 03:11:20'),
(61, 59, 'mateo-26', '2022-12-27 03:15:13'),
(62, 59, 'mateo-26', '2022-12-27 03:15:58'),
(63, 59, 'mateo-26', '2022-12-27 03:22:56'),
(64, 59, 'mateo-26', '2022-12-27 03:26:14'),
(65, 59, 'mateo-26', '2022-12-27 03:26:43'),
(66, 59, 'mateo-26', '2022-12-27 03:30:18');

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

--
-- Volcado de datos para la tabla `soporte`
--

INSERT INTO `soporte` (`id_soporte`, `remitente`, `receptor`, `asunto`, `mensaje`, `adjuntos`, `tipo`, `papelera`, `fecha_soporte`) VALUES
(26, 1, 26, 'Error en su numero de cuenta', '<p>werwer321 123 2</p>', '[\"vistas\\/img\\/tickets\\/1\\/233.png\"]', 'enviado', NULL, '2022-12-25 05:33:13'),
(27, 1, 63, 'prueba', '<p>fdsf</p>', '[]', 'enviado', NULL, '2022-12-27 03:04:56');

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
(66, 15, 'usuario', 'JGK', 'German01_yt', 'german@gmail.com', '$2a$07$asxx54ahjppf45sd87a5auFL5K1.Cmt9ZheoVVuudOi5BCi10qWly', 1, 0, NULL, NULL, 1, 'a0ffcfa76c6ef5fc13e3aff96a6470c2', NULL, 'german-hernandez-66', 'admin-trading', 'Canada', 'CA', '+1 (213) 123-2222', 'firma', '2022-12-07', '2022-12-07 16:30:58', 0),
(28, 43, 'usuario', '', 'prueba', 'prueba@gmail.com', '$2a$07$asxx54ahjppf45sd87a5auGZEtGHuyZwm.Ur.FJvWLCql3nmsMbXy', 1, 0, NULL, NULL, 1, 'c81b5136bcd10b4390108c979ed28ee6', NULL, 'prueba-28', 'juan-25', 'Colombia', 'CO', '+57 (123) 31-23123', '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?><!DOCTYPE svg PUBLIC \"-//W3C//DTD SVG 1.1//EN\" \"http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd\"><svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"64\" height=\"72\"><path stroke-linejoin=\"round\" stroke-linecap=\"round\" stroke-width=\"1\" stroke=\"#333\" fill=\"none\" d=\"M 1 71 c 0.12 -0.05 4.77 -1.78 7 -3 c 4.46 -2.45 9.26 -4.88 13 -8 c 3.99 -3.33 8.19 -7.78 11 -12 c 2.24 -3.37 2.86 -8.54 5 -12 c 1.98 -3.2 5.72 -5.73 8 -9 c 5.36 -7.69 10.12 -16.96 15 -24 l 3 -2\"/></svg>', '2022-10-06', '2022-10-15 01:04:21', 1),
(55, 123, 'usuario', '', 'desarrollo', 'desarrollo@gmail.com', '$2a$07$asxx54ahjppf45sd87a5auGZEtGHuyZwm.Ur.FJvWLCql3nmsMbXy', 1, 0, NULL, NULL, 1, '7ad7e61d9122e5379728a15c7e84bbbb', NULL, 'desarrollo-55', 'admin-trading', 'Afghanistan', 'AF', '+93 (132) 231-2312', '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?><!DOCTYPE svg PUBLIC \"-//W3C//DTD SVG 1.1//EN\" \"http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd\"><svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"142\" height=\"61\"><path stroke-linejoin=\"round\" stroke-linecap=\"round\" stroke-width=\"1\" stroke=\"#333\" fill=\"none\" d=\"M 25 18 c -0.24 0 -9.42 0.38 -14 0 c -3.33 -0.28 -10.19 -2.1 -10 -2 c 0.65 0.32 21.44 10.53 32 13 c 9.8 2.3 22 2 32 2 c 2.27 0 5.17 -0.82 7 -2 c 3.38 -2.19 6.88 -5.74 10 -9 c 4.28 -4.47 9.69 -12.46 12 -14 c 0.63 -0.42 3.24 2.79 3 4 c -2.07 10.33 -7.53 27.85 -12 41 c -1.08 3.17 -2.88 8.58 -5 9 c -4.19 0.84 -17.38 -0.2 -20 -4 c -5.45 -7.91 -7.83 -27.76 -11 -41 c -0.37 -1.56 -0.26 -3.43 0 -5 c 0.38 -2.29 0.56 -6.32 2 -7 c 3.39 -1.61 11.24 -1.74 17 -2 c 9.09 -0.41 18.1 -0.86 27 0 c 11.7 1.13 23.34 4.48 35 6 l 11 0\"/></svg>', '2022-11-01', '2022-11-01 15:58:05', 0),
(63, 321, 'usuario', '', 'Jordan', 'jordan@gmail.com', '$2a$07$asxx54ahjppf45sd87a5auFL5K1.Cmt9ZheoVVuudOi5BCi10qWly', 1, 0, NULL, NULL, 1, 'da99a16feba82ecc7757283f15cbea06', NULL, 'jordan-63', 'julian-30', 'Colombia', 'CO', '+57 (321) 216-5469', '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?><!DOCTYPE svg PUBLIC \"-//W3C//DTD SVG 1.1//EN\" \"http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd\"><svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"263\" height=\"79\"><path stroke-linejoin=\"round\" stroke-linecap=\"round\" stroke-width=\"1\" stroke=\"#333\" fill=\"none\" d=\"M 18 8 c 0.04 0.16 1.84 6 2 9 c 0.5 9.43 -0.43 19.26 0 29 c 0.24 5.41 0.84 10.84 2 16 c 1.14 5.06 2.06 13.58 5 15 c 4.46 2.15 19.09 1.61 24 -1 c 3.65 -1.94 6.13 -10.56 8 -16 c 2.02 -5.9 3.08 -12.58 4 -19 c 0.76 -5.3 1 -10.62 1 -16 c 0 -5.05 -1.19 -14.81 -1 -15 c 0.18 -0.17 0.58 9.75 2 14 c 2.1 6.31 5.42 13.09 9 19 c 4.01 6.63 8.54 14.23 14 19 c 7.06 6.18 17.72 13.46 26 16 c 6.25 1.91 20.13 -0.32 23 -1 c 0.56 -0.13 -0.96 -3.34 -2 -4 c -4.38 -2.77 -11.07 -5.55 -17 -8 c -9.79 -4.04 -18.95 -7.78 -29 -11 c -15.49 -4.96 -30.93 -7.63 -46 -13 c -14.11 -5.03 -33.47 -11.19 -41 -18 c -3.37 -3.05 -3.59 -17.53 -1 -20 c 3.11 -2.97 15.8 -1.74 24 -2 c 12.94 -0.42 25.04 -0.51 38 0 c 13 0.51 25.32 1.07 38 3 c 18.33 2.79 45.1 7.58 54 11 c 1.49 0.57 -1.63 6.02 -2 9 c -0.28 2.26 -0.51 5.12 0 7 c 0.37 1.34 1.85 2.99 3 4 c 1.35 1.18 3.27 2.38 5 3 c 2.73 0.97 5.93 1.63 9 2 c 8.01 0.97 16.09 0.81 24 2 c 5.41 0.81 10.72 2.24 16 4 c 11.96 3.99 23.07 9.1 35 13 c 5.58 1.82 15.14 4.12 17 4 l -2 -5\"/></svg>', '2022-11-24', '2022-11-24 16:02:23', 0),
(25, 369, 'usuario', '', 'Juan', 'juan@gmail.com', '$2a$07$asxx54ahjppf45sd87a5auGZEtGHuyZwm.Ur.FJvWLCql3nmsMbXy', 1, 0, NULL, NULL, 1, '7038663cc684aa330956752c7e6fe7d4', NULL, 'juan-25', 'admin-trading', 'Colombia', 'CO', '+57 (123) 123-2323', '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?><!DOCTYPE svg PUBLIC \"-//W3C//DTD SVG 1.1//EN\" \"http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd\"><svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"222\" height=\"79\"><path stroke-linejoin=\"round\" stroke-linecap=\"round\" stroke-width=\"1\" stroke=\"#333\" fill=\"none\" d=\"M 12 10 c -0.12 0.19 -4.9 7.19 -7 11 c -1.58 2.88 -3.53 6.17 -4 9 c -0.43 2.6 0.13 6.55 1 9 c 0.62 1.73 2.44 4.04 4 5 c 2.31 1.42 5.99 2.5 9 3 c 4.77 0.79 9.92 1 15 1 c 7.78 0 15.7 0.27 23 -1 c 7.63 -1.33 15.92 -3.89 23 -7 c 6.22 -2.73 13.06 -6.79 18 -11 c 3.51 -2.99 7.4 -7.92 9 -12 c 1.72 -4.38 3.11 -14.05 2 -16 c -0.7 -1.23 -7.47 0.36 -10 2 c -8.64 5.61 -19.2 14.2 -27 22 c -4.04 4.04 -7.32 9.8 -10 15 c -2.54 4.93 -4.76 10.85 -6 16 c -0.65 2.71 -1.1 6.91 0 9 c 1.73 3.29 6.5 7.73 10 10 c 2.58 1.68 6.7 2.7 10 3 c 7.27 0.66 15.62 0.99 23 0 c 9.57 -1.29 19.24 -4.19 29 -7 c 10.35 -2.98 20.38 -5.96 30 -10 c 6.94 -2.92 14.96 -6.71 20 -11 c 3.07 -2.61 5.98 -8.25 7 -12 c 0.74 -2.72 -0.25 -6.98 -1 -10 c -0.5 -2.01 -1.83 -4.25 -3 -6 c -0.74 -1.11 -2.11 -3.21 -3 -3 c -4.14 0.99 -13.19 4.73 -18 8 c -2.78 1.89 -4.93 5.89 -7 9 c -1.22 1.83 -2.64 4.22 -3 6 c -0.22 1.1 0.23 3.42 1 4 c 1.36 1.02 4.68 1.89 7 2 c 11.47 0.53 24.36 1.13 36 0 c 8.62 -0.83 17.93 -3.66 26 -6 l 5 -3\"/></svg>', '2022-10-06', '2022-10-14 23:51:52', 0),
(27, 765, 'usuario', '', 'pedro pablo', 'pedro@gmail.com', '$2a$07$asxx54ahjppf45sd87a5auGZEtGHuyZwm.Ur.FJvWLCql3nmsMbXy', 1, 1, NULL, NULL, 1, 'c3b7f393410fe6185ba5d966a213a38f', NULL, 'pedro-pablo-27', 'mateo-26', 'Peru', 'PE', '+8 (888) 888-8344', '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?><!DOCTYPE svg PUBLIC \"-//W3C//DTD SVG 1.1//EN\" \"http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd\"><svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"210\" height=\"20\"><path stroke-linejoin=\"round\" stroke-linecap=\"round\" stroke-width=\"1\" stroke=\"#333\" fill=\"none\" d=\"M 1 1 c 1.58 0 59.27 -0.86 90 0 c 18.15 0.51 35.41 1.32 53 4 c 22 3.36 65 14 65 14\"/></svg>', '2022-10-06', '2022-10-15 00:33:48', 0),
(71, 3243, 'usuario', 'prueba desarrollo', 'nombre prueba desarrollo', 'prdesarrollo@gmail.com', '$2a$07$asxx54ahjppf45sd87a5auFL5K1.Cmt9ZheoVVuudOi5BCi10qWly', 1, 0, NULL, NULL, 1, 'ce6e7d6969a0a0ac873e7c5ae434a76c', NULL, 'nombre-prueba-desarrollo-71', 'admin-trading', 'Colombia', 'CO', '+57 (312) 312-3123', '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?><!DOCTYPE svg PUBLIC \"-//W3C//DTD SVG 1.1//EN\" \"http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd\"><svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"194\" height=\"85\"><path stroke-linejoin=\"round\" stroke-linecap=\"round\" stroke-width=\"1\" stroke=\"#333\" fill=\"none\" d=\"M 49 61 c 0.07 0.02 3.63 0.38 4 1 c 0.37 0.62 -0.26 3.1 -1 4 c -1.9 2.32 -5.34 5.48 -8 7 c -1.52 0.87 -4.18 1.14 -6 1 c -2.18 -0.17 -5.52 -0.59 -7 -2 c -5.2 -4.98 -11.1 -13.1 -16 -20 c -2.4 -3.38 -4.35 -7.21 -6 -11 c -1.67 -3.83 -2.89 -7.88 -4 -12 c -1.26 -4.67 -2.24 -9.24 -3 -14 c -0.59 -3.67 -2.79 -10.3 -1 -11 c 6.02 -2.34 28.37 -4.53 37 -3 c 3.16 0.56 5.92 7.12 8 11 c 2.81 5.24 4.26 11.41 7 17 c 4.73 9.67 10.14 18.29 15 28 c 3.01 6.02 5.48 11.81 8 18 c 1.21 2.98 3.42 7.75 3 9 c -0.26 0.79 -4.4 0.7 -6 0 c -5.26 -2.29 -11.57 -6.27 -17 -10 c -5.29 -3.64 -10.34 -7.83 -15 -12 c -1.55 -1.39 -3.04 -3.23 -4 -5 c -1.28 -2.37 -3.6 -7.16 -3 -8 c 0.57 -0.79 5.57 0.23 8 1 c 3.64 1.15 7.16 3.87 11 5 c 18.72 5.51 37.79 10.93 57 15 c 9.18 1.94 18.5 2.42 28 3 c 7.09 0.43 14.13 0.44 21 0 c 3.34 -0.22 6.99 -0.8 10 -2 c 5.01 -2 10.33 -5.03 15 -8 c 2.53 -1.61 4.92 -3.92 7 -6 l 2 -3\"/></svg>', '2022-12-20', '2022-12-20 15:22:42', 0),
(52, 3333, 'usuario', '', 'Mike', 'mike@gmail.com', '$2a$07$asxx54ahjppf45sd87a5auGZEtGHuyZwm.Ur.FJvWLCql3nmsMbXy', 1, 0, NULL, NULL, 1, 'e28f6f64608c970c663197d7fe1f5a59', NULL, 'mike-52', 'mateo-26', 'Colombia', 'CO', '+57 (321) 564-5465', '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?><!DOCTYPE svg PUBLIC \"-//W3C//DTD SVG 1.1//EN\" \"http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd\"><svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"214\" height=\"78\"><path stroke-linejoin=\"round\" stroke-linecap=\"round\" stroke-width=\"1\" stroke=\"#333\" fill=\"none\" d=\"M 1 1 c 0.11 0.54 3.33 20.93 6 31 c 1.63 6.16 4.06 12.44 7 18 c 3.29 6.23 6.84 16.42 12 18 c 15.06 4.62 52.75 7.28 63 5 c 3.08 -0.68 0.53 -12.77 0 -19 c -0.46 -5.34 -1.69 -10.78 -3 -16 c -0.69 -2.74 -3 -8.15 -3 -8 c 0 0.18 2.37 6.61 3 10 c 1.03 5.56 1.65 11.24 2 17 c 0.33 5.38 2.63 14.58 0 16 c -6.12 3.31 -28.58 5.65 -37 4 c -3.58 -0.7 -6.47 -8.57 -9 -13 c -1.37 -2.39 -3 -5.87 -3 -8 c 0 -1.46 1.69 -4.44 3 -5 c 2.49 -1.07 7.25 -0.96 11 -1 c 25.83 -0.3 50.25 0.73 76 0 c 10.21 -0.29 20.22 -1.15 30 -3 c 9.44 -1.79 19.95 -5.14 28 -8 c 1.17 -0.42 1.9 -2.82 3 -3 c 3.88 -0.65 10.09 0.25 15 0 c 1.67 -0.08 3.54 -0.45 5 -1 l 3 -2\"/></svg>', '2022-11-26', '2022-10-29 04:33:21', 0),
(31, 73908, 'usuario', '', 'Carlos Andres', 'carlos@gmail.com', '$2a$07$asxx54ahjppf45sd87a5auGZEtGHuyZwm.Ur.FJvWLCql3nmsMbXy', 1, 0, NULL, NULL, 1, 'db1e0a3750e0399df3eeee808187d9b4', NULL, 'carlos-31', 'andres-62', 'Chile', 'CL', '+56 (566) 575-7657', '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?><!DOCTYPE svg PUBLIC \"-//W3C//DTD SVG 1.1//EN\" \"http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd\"><svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"165\" height=\"40\"><path stroke-linejoin=\"round\" stroke-linecap=\"round\" stroke-width=\"1\" stroke=\"#333\" fill=\"none\" d=\"M 1 1 c 0.23 0.05 9.43 1.03 13 3 c 8.24 4.56 16.43 13.02 25 18 c 5.37 3.12 11.76 5.07 18 7 c 12.38 3.83 24.99 8.75 37 10 c 12.55 1.3 27.48 0.12 40 -2 c 8.31 -1.41 17.07 -6.62 25 -9 l 5 0\"/></svg>', '2022-10-06', '2022-10-15 16:04:22', 0),
(30, 89875, 'usuario', '', 'Julian', 'julian@gmail.com', '$2a$07$asxx54ahjppf45sd87a5auGZEtGHuyZwm.Ur.FJvWLCql3nmsMbXy', 1, 0, NULL, NULL, 1, '4efe518f863e162e8f00e7d823b40230', NULL, 'julian-30', 'mateo-26', 'Argentina', 'AR', '+54 (875) 858-7587', '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?><!DOCTYPE svg PUBLIC \"-//W3C//DTD SVG 1.1//EN\" \"http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd\"><svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"200\" height=\"90\"><path stroke-linejoin=\"round\" stroke-linecap=\"round\" stroke-width=\"1\" stroke=\"#333\" fill=\"none\" d=\"M 1 74 c 0.04 -0.05 1.19 -2.19 2 -3 c 1.76 -1.76 3.78 -3.78 6 -5 c 10.15 -5.61 21.37 -10.16 32 -16 c 6.68 -3.67 13.53 -7.21 19 -12 c 10.15 -8.89 19.7 -19.85 29 -30 c 1.61 -1.75 4.76 -5.67 4 -6 c -2.11 -0.92 -15.65 -3.18 -20 -1 c -4.96 2.48 -10.22 12.1 -14 18 c -1.21 1.88 -1.74 4.69 -2 7 c -0.39 3.49 -0.69 7.67 0 11 c 0.88 4.21 2.97 9.14 5 13 c 1.14 2.17 3.18 4.18 5 6 c 1.82 1.82 3.92 3.38 6 5 c 0.96 0.75 1.96 1.69 3 2 c 2.03 0.61 4.64 0.95 7 1 c 13.03 0.28 26.52 0.92 39 0 c 4.97 -0.37 10.06 -2.43 15 -4 c 2.42 -0.77 4.84 -1.82 7 -3 c 1.42 -0.77 4.07 -3.05 4 -3 c -0.23 0.15 -9.44 5.62 -13 9 c -2.75 2.61 -5.27 6.53 -7 10 c -1.8 3.6 -2.5 8.24 -4 12 c -0.43 1.07 -1.2 2.46 -2 3 c -0.92 0.61 -3.36 1.57 -4 1 c -1.8 -1.62 -3.76 -6.8 -6 -10 c -2.46 -3.51 -6.16 -6.73 -8 -10 c -0.87 -1.55 -1.98 -5.15 -1 -6 c 4.28 -3.69 15.33 -8.35 23 -13 c 3.54 -2.15 6.53 -4.88 10 -7 c 2.55 -1.56 5.27 -3.44 8 -4 c 7.98 -1.64 17.21 -2.27 26 -3 c 3.36 -0.28 6.81 -0.49 10 0 c 5.26 0.81 11.84 2.25 16 4 l 3 4\"/></svg>', '2022-10-06', '2022-10-15 15:09:33', 0),
(53, 234234, 'usuario', '', 'Viper', 'viper@gmail.com', '$2a$07$asxx54ahjppf45sd87a5auGZEtGHuyZwm.Ur.FJvWLCql3nmsMbXy', 1, 0, NULL, NULL, 1, 'ee37008efb0019ee0083fab4b32b9b47', NULL, 'viper-53', 'admin-trading', 'Israel', 'IL', '+972 (234) 234-2342', '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?><!DOCTYPE svg PUBLIC \"-//W3C//DTD SVG 1.1//EN\" \"http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd\"><svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"133\" height=\"71\"><path stroke-linejoin=\"round\" stroke-linecap=\"round\" stroke-width=\"1\" stroke=\"#333\" fill=\"none\" d=\"M 2 51 c -0.02 -0.19 -1.87 -9.4 -1 -11 c 0.55 -1.01 5.12 -0.83 7 0 c 8.29 3.66 18.39 9.68 27 15 c 2.57 1.59 4.53 4.24 7 6 c 2.16 1.54 4.55 3.04 7 4 c 5.09 1.99 10.83 3.83 16 5 c 1.85 0.42 4.24 0.35 6 0 c 1.31 -0.26 2.9 -1.12 4 -2 c 2.08 -1.67 4.69 -3.72 6 -6 c 3.39 -5.88 6.94 -13.12 9 -20 c 3.86 -12.86 6.19 -31.13 9 -40 c 0.28 -0.89 2.75 -1 4 -1 c 1.85 0 4.33 0.22 6 1 c 2.97 1.39 6.05 3.84 9 6 c 2.13 1.56 4.17 3.17 6 5 c 2.16 2.16 4.4 4.6 6 7 l 2 5\"/></svg>', '2022-12-14', '2022-10-29 04:49:40', 0),
(58, 324234, 'usuario', '', 'gg', 'gg@gmail.com', '$2a$07$asxx54ahjppf45sd87a5auFL5K1.Cmt9ZheoVVuudOi5BCi10qWly', 1, 0, NULL, NULL, 1, '1208cd4bab8dd8c03d1ba8f20fb891dd', NULL, 'gg-58', 'admin-trading', 'Colombia', 'CO', '+57 (321) 232-3232', '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?><!DOCTYPE svg PUBLIC \"-//W3C//DTD SVG 1.1//EN\" \"http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd\"><svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"247\" height=\"44\"><path stroke-linejoin=\"round\" stroke-linecap=\"round\" stroke-width=\"1\" stroke=\"#333\" fill=\"none\" d=\"M 1 1 c 0.07 0.02 3.5 0.12 4 1 c 2.61 4.58 4.95 13.49 8 20 c 1.97 4.2 4.35 8.29 7 12 c 2.29 3.21 4.97 8.58 8 9 c 12.57 1.73 37.97 2.83 50 -1 c 6.16 -1.96 11.09 -13.04 16 -20 c 3.09 -4.38 8.27 -11.95 8 -14 c -0.17 -1.28 -6.87 -1.35 -10 -1 c -5.44 0.6 -11.17 2.98 -17 4 c -7.74 1.35 -15.23 2.48 -23 3 c -7.37 0.49 -15.46 0.5 -22 0 c -1.33 -0.1 -4.28 -1.66 -4 -2 c 0.62 -0.74 6 -3.53 9 -4 c 7.01 -1.1 15.05 -0.96 23 -1 c 62.82 -0.31 121.65 0.32 182 0 l 6 -1\"/></svg>', '2022-12-05', '2022-11-07 22:02:10', 0),
(26, 879788, 'usuario', 'Mat', 'Mateo', 'mateo@gmail.com', '$2a$07$asxx54ahjppf45sd87a5auGZEtGHuyZwm.Ur.FJvWLCql3nmsMbXy', 1, 0, NULL, NULL, 1, 'e64b49457900a3435c49e2e8ee79f603', NULL, 'mateo-26', 'prueba-desarrollo-64', 'Chile', 'CL', '+57 (569) 688-8887', '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?><!DOCTYPE svg PUBLIC \"-//W3C//DTD SVG 1.1//EN\" \"http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd\"><svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"235\" height=\"68\"><path stroke-linejoin=\"round\" stroke-linecap=\"round\" stroke-width=\"1\" stroke=\"#333\" fill=\"none\" d=\"M 42 48 c 0 -0.1 -0.78 -4.49 0 -6 c 3.01 -5.78 8.11 -13.43 13 -19 c 4.52 -5.14 10.37 -10.01 16 -14 c 4.5 -3.19 12.27 -7.52 15 -8 c 0.86 -0.15 2.39 3.69 2 5 c -1.24 4.12 -4.66 10.77 -8 15 c -5 6.34 -11.59 12.27 -18 18 c -6.45 5.77 -13.01 11.63 -20 16 c -5.99 3.74 -13.29 7.04 -20 9 c -6.49 1.9 -20.56 5.77 -21 3 c -1.14 -7.13 6.56 -41.45 13 -53 c 2.65 -4.76 14.01 -6.45 21 -8 c 7.49 -1.67 16.49 -2.72 24 -2 c 9.01 0.87 18.93 3.76 28 7 c 19.04 6.8 36.91 16.2 56 23 c 10.09 3.6 20.66 6.02 31 8 c 5.18 0.99 11.13 1.72 16 1 c 5.77 -0.85 12.18 -3.49 18 -6 c 8.92 -3.85 26 -13 26 -13\"/></svg>', '2022-10-06', '2022-10-15 00:30:39', 0),
(64, 987546, 'usuario', '', 'prueba desarrollo', 'developer@gmail.com', '$2a$07$asxx54ahjppf45sd87a5auFL5K1.Cmt9ZheoVVuudOi5BCi10qWly', 1, 0, NULL, NULL, 1, 'eb4b6134f24782361286aae36f1423cb', NULL, 'prueba-desarrollo-64', 'admin-trading', 'Colombia', 'CO', '+57 (321) 654-6451', '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?><!DOCTYPE svg PUBLIC \"-//W3C//DTD SVG 1.1//EN\" \"http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd\"><svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"208\" height=\"55\"><path stroke-linejoin=\"round\" stroke-linecap=\"round\" stroke-width=\"1\" stroke=\"#333\" fill=\"none\" d=\"M 16 24 c -0.07 -0.02 -3.15 -1.46 -4 -1 c -2.04 1.11 -5.52 4.44 -7 7 c -1.89 3.27 -3.09 8.13 -4 12 c -0.36 1.53 -0.49 3.66 0 5 c 0.7 1.93 2.47 4.93 4 6 c 1.29 0.9 4.09 1.15 6 1 c 6.35 -0.49 14.27 -1.09 20 -3 c 3.46 -1.15 6.91 -4.4 10 -7 c 3.22 -2.71 6.7 -5.81 9 -9 c 1.78 -2.47 3.4 -6 4 -9 c 0.98 -4.88 1.73 -12.71 1 -16 c -0.25 -1.11 -3.88 -2.48 -5 -2 c -2.51 1.08 -6.93 5.04 -9 8 c -2.24 3.19 -3.71 7.94 -5 12 c -1.01 3.19 -2 6.9 -2 10 c 0 2.8 0.73 6.78 2 9 c 1.07 1.88 3.89 4.13 6 5 c 3.03 1.25 7.78 2 11 2 c 1.55 0 3.44 -1.12 5 -2 c 9.1 -5.12 19.03 -9.98 27 -16 c 5.21 -3.94 10.04 -9.72 14 -15 c 2.85 -3.8 5.02 -8.61 7 -13 c 0.97 -2.16 1.96 -7.25 2 -7 c 0.14 0.94 0.04 18.57 1 27 c 0.3 2.67 1.63 6.28 3 8 c 0.87 1.08 3.36 1.77 5 2 c 2.74 0.39 6.56 0.85 9 0 c 3.53 -1.24 7.84 -4.25 11 -7 c 4.29 -3.73 9.06 -8.36 12 -13 c 3.05 -4.82 6.39 -16.48 7 -17 c 0.36 -0.31 -0.36 7.44 0 11 c 0.3 2.99 0.76 6.67 2 9 c 1.15 2.15 3.96 4.7 6 6 c 1.22 0.78 3.37 1 5 1 c 4.82 0 10.42 0.14 15 -1 c 5.6 -1.4 11.85 -4.31 17 -7 l 6 -5\"/></svg>', '2022-12-04', '2022-12-04 21:20:13', 0),
(35, 34534545, 'usuario', '', 'Lucero', 'lucero@gmail.com', '$2a$07$asxx54ahjppf45sd87a5auGZEtGHuyZwm.Ur.FJvWLCql3nmsMbXy', 1, 0, NULL, NULL, 1, '1a8036f7ec230101fa36bc463b68ee0c', NULL, 'lucero-35', 'jordan-63', 'Colombia', 'CO', '+57 (432) 423-4234', '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?><!DOCTYPE svg PUBLIC \"-//W3C//DTD SVG 1.1//EN\" \"http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd\"><svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"127\" height=\"78\"><path stroke-linejoin=\"round\" stroke-linecap=\"round\" stroke-width=\"1\" stroke=\"#333\" fill=\"none\" d=\"M 1 44 c 0.19 0.09 7.34 4.41 11 5 c 7.88 1.28 17.79 1.84 26 1 c 7.5 -0.77 16.49 -2.82 23 -6 c 6.25 -3.05 13.24 -8.88 18 -14 c 3.36 -3.62 6.39 -9.32 8 -14 c 1.51 -4.39 2.28 -14.44 2 -15 c -0.19 -0.38 -4.07 5.83 -5 9 c -5.2 17.77 -8.93 37.13 -14 56 c -1.03 3.83 -1.8 10.14 -4 11 c -3.6 1.41 -13.24 -0.4 -19 -2 c -5.66 -1.57 -11.8 -4.81 -17 -8 c -4.93 -3.02 -14.35 -9.61 -14 -11 c 0.33 -1.33 11.15 -0.93 17 -1 c 24.73 -0.28 47.8 0.55 72 0 c 5.42 -0.12 10.91 -1.03 16 -2 l 5 -2\"/></svg>', '2022-10-03', '2022-10-19 02:49:00', 0),
(49, 34543543, 'usuario', '', 'Gabriel', 'gabriel@gmail.com', '$2a$07$asxx54ahjppf45sd87a5auGZEtGHuyZwm.Ur.FJvWLCql3nmsMbXy', 1, 0, NULL, NULL, 1, '2821e29f7fb82f182ecca8d8c9e681cf', NULL, 'gabriel-49', 'admin-trading', 'Chile', 'CL', '+56 (123) 123-1231', '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?><!DOCTYPE svg PUBLIC \"-//W3C//DTD SVG 1.1//EN\" \"http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd\"><svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"170\" height=\"70\"><path stroke-linejoin=\"round\" stroke-linecap=\"round\" stroke-width=\"1\" stroke=\"#333\" fill=\"none\" d=\"M 1 69 c 0 -0.09 -0.46 -3.77 0 -5 c 0.39 -1.04 1.89 -2.17 3 -3 c 2.84 -2.13 6.03 -4.52 9 -6 c 1.4 -0.7 4.29 -1.77 5 -1 c 2.17 2.35 4.65 10.79 7 14 c 0.62 0.84 3.31 1.58 4 1 c 2.51 -2.13 6.45 -7.76 9 -12 c 3.42 -5.69 6.94 -11.82 9 -18 c 3.16 -9.47 4.1 -21.29 7 -30 c 0.74 -2.21 3.2 -4.56 5 -6 c 1.24 -0.99 3.7 -2 5 -2 c 0.87 0 2.37 1.12 3 2 c 2.42 3.38 4.9 7.8 7 12 c 2.98 5.95 4.88 12.13 8 18 c 5.33 10.02 11.42 22.34 17 29 c 1.53 1.83 6 1.87 9 2 c 11.71 0.52 24.49 0.73 36 0 c 3.64 -0.23 7.3 -2.41 11 -3 l 14 -1\"/></svg>', '2022-10-26', '2022-10-26 16:04:59', 0),
(32, 54654656, 'usuario', 'migue', 'Miguelito Gonzales', 'miguel@gmail.com', '$2a$07$asxx54ahjppf45sd87a5auGZEtGHuyZwm.Ur.FJvWLCql3nmsMbXy', 1, 0, NULL, NULL, 1, 'c952ec83eabde595820603a3ca9d7f54', NULL, 'miguel-32', 'admin-trading', 'Israel', 'IL', '(979) 724-5652', '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?><!DOCTYPE svg PUBLIC \"-//W3C//DTD SVG 1.1//EN\" \"http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd\"><svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"228\" height=\"55\"><path stroke-linejoin=\"round\" stroke-linecap=\"round\" stroke-width=\"1\" stroke=\"#333\" fill=\"none\" d=\"M 1 37 c 0.25 -0.05 9.66 -1.45 14 -3 c 4.74 -1.69 9.15 -4.97 14 -7 c 5.59 -2.34 11.14 -4.51 17 -6 c 12.62 -3.21 26.06 -6.14 38 -8 c 2.17 -0.34 5.1 0.21 7 1 c 1.72 0.72 4.17 2.45 5 4 c 1.2 2.23 1.79 6.01 2 9 c 0.44 6.17 -0.26 12.77 0 19 c 0.07 1.67 0.1 4.2 1 5 c 1.51 1.35 5.4 2.51 8 3 c 2.44 0.46 5.47 0.4 8 0 c 3.61 -0.57 7.48 -1.56 11 -3 c 16.86 -6.91 33.06 -14.18 50 -22 c 5.27 -2.43 9.81 -5.59 15 -8 c 4.25 -1.97 8.87 -2.93 13 -5 c 5.85 -2.93 11.52 -6.42 17 -10 l 6 -5\"/></svg>', '2022-10-01', '2022-10-17 20:27:21', 0),
(46, 98716415, 'usuario', '', 'Manuel Perez', 'manuel@gmail.com', '$2a$07$asxx54ahjppf45sd87a5auGZEtGHuyZwm.Ur.FJvWLCql3nmsMbXy', 1, 0, NULL, NULL, 1, '4201ddc9eb0ad45aaeda7542c7c544de', NULL, 'manuel-perez-46', 'admin-trading', 'Colombia', 'CO', '+57 (321) 323-1231', 'firma', '2022-10-24', '2022-10-25 03:04:15', 0),
(73, 98754894, 'usuario', 'jjj', 'nombre completo jjj', 'jjj@gmail.com', '$2a$07$asxx54ahjppf45sd87a5auFL5K1.Cmt9ZheoVVuudOi5BCi10qWly', 1, 0, NULL, NULL, 1, '913223ed944b3aa62dfe3fc8d42409ba', NULL, NULL, NULL, 'Colombia', 'CO', '+57 (312) 312-3123', '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?><!DOCTYPE svg PUBLIC \"-//W3C//DTD SVG 1.1//EN\" \"http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd\"><svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"230\" height=\"73\"><path stroke-linejoin=\"round\" stroke-linecap=\"round\" stroke-width=\"1\" stroke=\"#333\" fill=\"none\" d=\"M 10 27 c -0.1 0.16 -4.67 5.9 -6 9 c -1.52 3.54 -2.46 8.04 -3 12 c -0.44 3.2 -0.65 7.09 0 10 c 0.58 2.6 2.38 5.84 4 8 c 1.16 1.55 3.24 3.29 5 4 c 2.81 1.12 6.81 2 10 2 c 4.74 0 10.61 -0.44 15 -2 c 5.32 -1.89 12.02 -5.14 16 -9 c 5.9 -5.72 12.34 -14.69 16 -22 c 2.19 -4.38 2.6 -10.83 3 -16 c 0.25 -3.19 -1.23 -10.27 -1 -10 c 0.46 0.53 4.26 13.32 8 18 c 6.19 7.74 15.49 15.19 24 22 c 8.27 6.61 17.92 14.73 26 18 c 4.1 1.66 16.56 -0.72 16 -1 c -1.6 -0.8 -29.31 -8.03 -44 -13 c -8.33 -2.82 -16.45 -6.12 -24 -10 c -4.59 -2.36 -9.94 -5.75 -13 -9 c -1.65 -1.76 -3.73 -6.13 -3 -8 c 1.64 -4.2 7.52 -11.16 12 -15 c 4.28 -3.67 10.56 -7.09 16 -9 c 6.33 -2.22 13.91 -3.23 21 -4 c 8.29 -0.9 16.98 -2.07 25 -1 c 21.26 2.83 42.48 8.75 65 13 c 8.6 1.62 18.24 4 25 4 l 6 -4\"/></svg>', '2022-12-21', '2022-12-21 17:47:15', 1),
(36, 234234234, 'usuario', '', 'Carolina', 'carolina@gmail.com', '$2a$07$asxx54ahjppf45sd87a5auGZEtGHuyZwm.Ur.FJvWLCql3nmsMbXy', 1, 0, NULL, NULL, 1, '38ad84cbc67a6e587e34df5df5bdb41c', NULL, 'carolina-36', 'carlos-31', 'Chile', 'CL', '+56 222-5465', '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?><!DOCTYPE svg PUBLIC \"-//W3C//DTD SVG 1.1//EN\" \"http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd\"><svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"202\" height=\"31\"><path stroke-linejoin=\"round\" stroke-linecap=\"round\" stroke-width=\"1\" stroke=\"#333\" fill=\"none\" d=\"M 29 7 c -0.35 -0.1 -13.52 -4.61 -20 -6 c -2.48 -0.53 -8.14 -0.01 -8 0 c 0.49 0.02 18.31 0.93 28 1 c 37.72 0.28 107.09 0.02 109 0 c 0.14 0 -5.48 -1.22 -8 -1 c -4.79 0.42 -10.12 1.58 -15 3 c -5.45 1.58 -11.34 3.48 -16 6 c -2.9 1.57 -7.57 5.27 -8 7 c -0.29 1.15 3.11 4.14 5 5 c 4.75 2.16 11.24 3.98 17 5 c 9.15 1.63 18.48 2.68 28 3 c 20.27 0.69 60 0 60 0\"/></svg>', '2022-10-03', '2022-10-19 02:51:58', 0),
(54, 336541287, 'usuario', 'prueba', 'Raze', 'raze@gmail.com', '$2a$07$asxx54ahjppf45sd87a5auGZEtGHuyZwm.Ur.FJvWLCql3nmsMbXy', 1, 0, NULL, NULL, 1, '7ffbf5fe803f04746d6c4c1e47d3a60a', NULL, 'prueba-8773', 'luis-29', 'Austria', 'AT', '+43 (984) 216-5165', '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?><!DOCTYPE svg PUBLIC \"-//W3C//DTD SVG 1.1//EN\" \"http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd\"><svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"255\" height=\"88\"><path stroke-linejoin=\"round\" stroke-linecap=\"round\" stroke-width=\"1\" stroke=\"#333\" fill=\"none\" d=\"M 127 46 c 0 0.09 0.53 3.8 0 5 c -0.6 1.36 -2.55 2.84 -4 4 c -1.85 1.48 -3.91 2.95 -6 4 c -2.48 1.24 -5.27 2.28 -8 3 c -3.57 0.94 -7.32 1.68 -11 2 c -3.94 0.34 -7.93 0.18 -12 0 c -3.75 -0.16 -7.5 -0.24 -11 -1 c -4.01 -0.87 -8.32 -2.16 -12 -4 c -6.79 -3.4 -13.81 -7.72 -20 -12 c -2.25 -1.56 -4.4 -3.79 -6 -6 c -2.61 -3.62 -4.97 -7.94 -7 -12 c -0.92 -1.85 -1.87 -4.1 -2 -6 c -0.18 -2.73 0.12 -6.37 1 -9 c 1 -2.99 2.98 -6.81 5 -9 c 1.58 -1.71 5.01 -3.67 7 -4 c 1.33 -0.22 3.76 1.01 5 2 c 1.8 1.44 3.96 3.78 5 6 c 3.71 7.91 7.23 17.44 10 26 c 0.8 2.48 0.78 5.25 1 8 c 0.47 5.82 1.24 12.04 1 17 c -0.06 1.3 -1.12 3.12 -2 4 c -0.88 0.88 -2.68 1.78 -4 2 c -2.35 0.39 -5.43 0.37 -8 0 c -4.29 -0.61 -8.78 -1.73 -13 -3 c -2.41 -0.72 -4.79 -1.75 -7 -3 c -5.47 -3.09 -11.01 -6.44 -16 -10 c -1.87 -1.33 -3.65 -3.16 -5 -5 c -2.23 -3.03 -4.84 -6.69 -6 -10 c -1 -2.85 -1.77 -8.15 -1 -10 c 0.49 -1.17 4.02 -1.8 6 -2 c 4.38 -0.44 9.61 -0.65 14 0 c 4.26 0.63 8.71 2.37 13 4 c 5.51 2.09 10.76 4.3 16 7 c 6.59 3.39 12.98 6.87 19 11 c 5.65 3.88 10.6 8.4 16 13 c 3.89 3.31 7.93 6.29 11 10 c 4.76 5.75 7.76 17.81 13 19 c 12.1 2.75 36.99 0.26 53 -4 c 18.47 -4.91 37.19 -15.92 56 -25 c 10.16 -4.9 20.73 -10.33 29 -16 c 2.5 -1.71 5.09 -5.28 6 -8 c 1.18 -3.55 1.36 -9.03 1 -13 l -3 -9\"/></svg>', '2022-12-24', '2022-10-29 04:52:45', 0),
(65, 684964165, 'usuario', 'Kaggle', 'Rodrigo Perez', 'rodrigo@gmail.com', '$2a$07$asxx54ahjppf45sd87a5auFL5K1.Cmt9ZheoVVuudOi5BCi10qWly', 1, 0, NULL, NULL, 1, '07e7655f7b11a5a84afa062de7e2d0f7', NULL, 'rodrigo-perez-65', 'prueba-8773', 'Costa Rica', 'CR', '+506 (321) 489-1465', '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?><!DOCTYPE svg PUBLIC \"-//W3C//DTD SVG 1.1//EN\" \"http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd\"><svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"215\" height=\"66\"><path stroke-linejoin=\"round\" stroke-linecap=\"round\" stroke-width=\"1\" stroke=\"#333\" fill=\"none\" d=\"M 36 50 c -0.19 0.05 -7.72 1.41 -11 3 c -6.71 3.25 -14.87 9.86 -20 12 c -0.98 0.41 -4 -1.18 -4 -2 c 0 -1.98 2.15 -7.22 4 -10 c 2.56 -3.84 6.32 -7.89 10 -11 c 4.81 -4.07 10.43 -7.87 16 -11 c 5.01 -2.82 10.79 -5.99 16 -7 c 5.97 -1.16 14.4 -1.26 20 0 c 3.65 0.82 8.33 4.33 11 7 c 1.83 1.83 2.91 5.26 4 8 c 0.89 2.23 1.81 4.89 2 7 c 0.11 1.2 -0.33 3.2 -1 4 c -0.73 0.87 -2.65 1.71 -4 2 c -3.04 0.65 -7.08 1.58 -10 1 c -4.7 -0.94 -10.76 -3.26 -15 -6 c -5.58 -3.6 -11.75 -8.9 -16 -14 c -3.67 -4.4 -6.52 -10.5 -9 -16 c -2.14 -4.74 -4.84 -12.37 -5 -15 c -0.04 -0.68 2.71 -1 4 -1 c 3.77 0 8.51 -0.38 12 1 c 18.8 7.41 38.82 17.36 59 27 c 10.85 5.18 20.24 11.06 31 16 c 9.96 4.57 19.72 8.51 30 12 c 7.56 2.57 15.31 4.58 23 6 c 4.86 0.9 10.15 1.19 15 1 c 3.6 -0.14 8.43 -0.63 11 -2 c 1.66 -0.88 2.99 -3.99 4 -6 l 1 -4\"/></svg>', '2022-12-07', '2022-12-07 16:17:21', 0),
(59, 4444442222, 'usuario', 'Pat', 'Patricio', 'patricio@gmail.com', '$2a$07$asxx54ahjppf45sd87a5auFL5K1.Cmt9ZheoVVuudOi5BCi10qWly', 1, 0, NULL, NULL, 1, 'dcd2251fc17d7637dfae626afc81a128', NULL, 'pat-5555', 'mateo-26', 'Colombia', 'CO', '+57 (123) 123-1231', '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?><!DOCTYPE svg PUBLIC \"-//W3C//DTD SVG 1.1//EN\" \"http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd\"><svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"201\" height=\"50\"><path stroke-linejoin=\"round\" stroke-linecap=\"round\" stroke-width=\"1\" stroke=\"#333\" fill=\"none\" d=\"M 105 1 c 0.18 0.02 9.06 0.33 10 1 c 0.47 0.33 -1.77 3.08 -3 4 c -3.76 2.82 -8.49 6.25 -13 8 c -7.02 2.73 -15.18 4.56 -23 6 c -8.61 1.58 -17.19 2.55 -26 3 c -11.11 0.57 -22.02 0.48 -33 0 c -4.38 -0.19 -9.15 -1.04 -13 -2 c -1.05 -0.26 -2.89 -1.33 -3 -2 c -0.14 -0.83 1.01 -3.37 2 -4 c 2.1 -1.34 6.07 -2.83 9 -3 c 8.05 -0.46 17.64 -0.14 26 1 c 6 0.82 12.61 2.66 18 5 c 4.16 1.8 8.62 4.98 12 8 c 2.67 2.39 5.17 5.89 7 9 c 1.37 2.33 1.68 5.68 3 8 c 1.21 2.12 3.27 5.92 5 6 c 4.15 0.18 12.29 -2.75 18 -5 c 6.83 -2.7 13.27 -7.35 20 -10 c 4.02 -1.58 8.69 -1.69 13 -3 c 6.85 -2.08 13.14 -5.22 20 -7 c 9.9 -2.58 19.69 -3.79 30 -6 c 4.17 -0.89 8.16 -1.8 12 -3 l 4 -2\"/></svg>', '2022-12-26', '2022-11-09 17:23:30', 0),
(72, 205380746850, 'usuario', 'lll', 'nombre completo  lll', 'repetir@gmail.com', '$2a$07$asxx54ahjppf45sd87a5auFL5K1.Cmt9ZheoVVuudOi5BCi10qWly', 1, 0, NULL, NULL, 1, '9b5fb37ded2bb93d9c219e2cc6f0a709', NULL, NULL, 'admin-trading', NULL, NULL, NULL, NULL, NULL, '2022-12-21 17:44:34', 0),
(50, 560101318638, 'usuario', '', 'Daniel R', 'zzjdanielzz@gmail.com', '$2a$07$asxx54ahjppf45sd87a5auEFpkdIK7n86bXuxJThYTtqaCcNFhmx.', 1, 0, NULL, NULL, 0, 'd9104be379b16b1e4ebedc3e7f5a6706', NULL, NULL, 'admin-trading', NULL, NULL, NULL, NULL, NULL, '2022-10-29 03:39:13', 0);

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
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=210;

--
-- AUTO_INCREMENT de la tabla `campanas`
--
ALTER TABLE `campanas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `comisiones`
--
ALTER TABLE `comisiones`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=599;

--
-- AUTO_INCREMENT de la tabla `comprobantes`
--
ALTER TABLE `comprobantes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `cuentas_bancarias`
--
ALTER TABLE `cuentas_bancarias`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT de la tabla `niveles_comision`
--
ALTER TABLE `niveles_comision`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `notificaciones`
--
ALTER TABLE `notificaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `pagos_comisiones`
--
ALTER TABLE `pagos_comisiones`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=428;

--
-- AUTO_INCREMENT de la tabla `pagos_extras`
--
ALTER TABLE `pagos_extras`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=165;

--
-- AUTO_INCREMENT de la tabla `pagos_inversiones`
--
ALTER TABLE `pagos_inversiones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=352;

--
-- AUTO_INCREMENT de la tabla `pagos_publicidad`
--
ALTER TABLE `pagos_publicidad`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `pagos_uninivel`
--
ALTER TABLE `pagos_uninivel`
  MODIFY `id_pago` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `red_binaria`
--
ALTER TABLE `red_binaria`
  MODIFY `id_binaria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT de la tabla `red_uninivel`
--
ALTER TABLE `red_uninivel`
  MODIFY `id_uninivel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT de la tabla `soporte`
--
ALTER TABLE `soporte`
  MODIFY `id_soporte` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT de la tabla `videos`
--
ALTER TABLE `videos`
  MODIFY `id_video` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
