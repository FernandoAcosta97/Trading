-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-11-2022 a las 07:09:58
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
  `id_uninivel` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `bonos_extras`
--

INSERT INTO `bonos_extras` (`id`, `id_pago_extra`, `id_uninivel`) VALUES
(1, 12, 29),
(2, 12, 30);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `campanas`
--

CREATE TABLE `campanas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` text NOT NULL,
  `retorno` float NOT NULL,
  `estado` int(11) NOT NULL,
  `cupos` int(11) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `fecha_retorno` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `campanas`
--

INSERT INTO `campanas` (`id`, `nombre`, `retorno`, `estado`, `cupos`, `fecha_inicio`, `fecha_fin`, `fecha_retorno`) VALUES
(1, 'Shiba Inu 2', 20, 1, 3000, '2022-10-22', '2022-10-29', '2022-10-29'),
(4, 'BitCoin', 10, 2, 2000, '2022-11-03', '2022-11-17', '2022-10-29'),
(10, 'Cardano', 20, 2, 1000, '2022-11-08', '2022-11-12', '2022-11-19'),
(13, 'Bono Extra', 10000, 1, 0, '2022-11-14', '2022-11-21', '2022-11-21');

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
(16, 'vistas/img/comprobantes/879788/878.png', '2022-11-15 22:13:00', 1, 150000, 879788, 4),
(17, 'vistas/img/comprobantes/879788/413.jpg', '2022-11-15 14:53:20', 1, 350000, 879788, 10),
(18, 'vistas/img/comprobantes/43/176.png', '2022-11-15 16:43:32', 1, 80000, 43, 4),
(19, 'vistas/img/comprobantes/879788/617.png', '2022-11-15 14:29:30', 1, 500000, 879788, 4),
(20, 'vistas/img/comprobantes/879788/644.png', '2022-11-16 03:09:21', 1, 540000, 879788, 10),
(21, 'vistas/img/comprobantes/879788/614.png', '2022-11-15 14:27:18', 2, 50000, 879788, 1),
(22, 'vistas/img/comprobantes/879788/246.png', '2022-11-15 14:27:18', 2, 700000, 879788, 1),
(23, 'vistas/img/comprobantes/879788/597.png', '2022-11-15 14:27:20', 2, 780000, 879788, 1),
(24, 'vistas/img/comprobantes/89875/514.png', '2022-11-15 15:28:46', 1, 90000, 89875, 1),
(25, 'vistas/img/comprobantes/89875/198.png', '2022-11-15 14:27:22', 2, 89000, 89875, 1),
(26, 'vistas/img/comprobantes/43/397.png', '2022-11-15 14:27:24', 2, 987987, 43, 4),
(27, 'vistas/img/comprobantes/43/774.png', '2022-11-15 15:35:49', 1, 98000, 43, 1),
(28, 'vistas/img/comprobantes/980/430.png', '2022-11-16 03:17:53', 1, 50000, 980, 1),
(29, 'vistas/img/comprobantes/231321323/208.png', '2022-11-16 03:19:33', 1, 100000, 231321323, 1),
(30, 'vistas/img/comprobantes/34534545/410.png', '2022-11-16 05:16:37', 1, 100000, 34534545, 1),
(31, 'vistas/img/comprobantes/234234234/555.png', '2022-11-16 05:19:53', 1, 150000, 234234234, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuentas_bancarias`
--

CREATE TABLE `cuentas_bancarias` (
  `id` bigint(20) NOT NULL,
  `numero` bigint(20) NOT NULL,
  `usuario` bigint(20) NOT NULL,
  `titular` bigint(20) NOT NULL,
  `entidad` text NOT NULL,
  `estado` int(11) NOT NULL DEFAULT 2,
  `tipo` text NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cuentas_bancarias`
--

INSERT INTO `cuentas_bancarias` (`id`, `numero`, `usuario`, `titular`, `entidad`, `estado`, `tipo`, `fecha`) VALUES
(17, 423423, 27, 324324, 'Davivienda', 1, 'ahorros', '2022-11-15 15:35:05'),
(18, 32423424, 26, 7898, 'Bancolombia', 1, 'corriente', '2022-11-08 16:27:24'),
(19, 987, 30, 5465464, 'Davivienda', 1, 'ahorros', '2022-11-09 02:52:02'),
(20, 345345345, 28, 3242343, 'Banco Agrario', 1, 'ahorros', '2022-11-15 15:36:37'),
(21, 234234, 36, 4354354, 'Bancolombia', 1, 'corriente', '2022-11-16 05:34:31'),
(22, 423324, 35, 32434, 'Davivienda', 1, 'ahorros', '2022-11-16 05:35:08'),
(23, 23424, 62, 2122, 'Banco Agrario', 1, 'corriente', '2022-11-16 05:35:44'),
(24, 16416161, 29, 897, 'Davivienda', 1, 'ahorros', '2022-11-16 05:36:51');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos_comisiones`
--

CREATE TABLE `pagos_comisiones` (
  `id_pago` bigint(20) NOT NULL,
  `usuario_pago` int(11) NOT NULL,
  `periodo` text NOT NULL,
  `total` double NOT NULL,
  `estado` int(11) NOT NULL,
  `fecha_pago` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `pagos_comisiones`
--

INSERT INTO `pagos_comisiones` (`id_pago`, `usuario_pago`, `periodo`, `total`, `estado`, `fecha_pago`) VALUES
(6644464, 43, '', 80000, 0, '2022-11-23');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos_extras`
--

CREATE TABLE `pagos_extras` (
  `id` bigint(20) NOT NULL,
  `id_usuario` bigint(20) NOT NULL,
  `id_campana` bigint(20) NOT NULL,
  `estado` int(11) NOT NULL DEFAULT 0,
  `valor` double NOT NULL DEFAULT 0,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pagos_extras`
--

INSERT INTO `pagos_extras` (`id`, `id_usuario`, `id_campana`, `estado`, `valor`, `fecha`) VALUES
(12, 26, 13, 0, 0, '2022-11-16 06:08:22');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos_inversiones`
--

CREATE TABLE `pagos_inversiones` (
  `id` int(11) NOT NULL,
  `id_comprobante` bigint(20) NOT NULL,
  `estado` int(11) NOT NULL DEFAULT 0,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `pagos_inversiones`
--

INSERT INTO `pagos_inversiones` (`id`, `id_comprobante`, `estado`, `fecha`) VALUES
(9, 19, 1, '2022-11-15 14:34:39'),
(10, 17, 1, '2022-11-15 14:59:53'),
(11, 24, 1, '2022-11-15 15:30:03'),
(12, 27, 1, '2022-11-15 16:41:58'),
(13, 18, 0, '2022-11-15 21:42:28'),
(14, 16, 0, '2022-11-15 22:13:00'),
(21, 20, 0, '2022-11-16 03:09:21'),
(25, 28, 0, '2022-11-16 03:17:53'),
(26, 29, 0, '2022-11-16 03:19:34'),
(36, 30, 0, '2022-11-16 05:16:37'),
(37, 31, 0, '2022-11-16 05:19:53');

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
(1, 1, 1, 0, 'admin-trading', 0, '2022-10-14 16:58:45'),
(14, 25, 2, 1, 'admin-trading', 0, '2022-10-15 00:00:26'),
(15, 26, 3, 1, 'admin-trading', 0, '2022-10-15 00:31:49'),
(16, 27, 4, 3, 'mateo-26', 0, '2022-10-15 00:34:47'),
(17, 28, 5, 2, 'juan-25', 0, '2022-10-15 01:05:17'),
(18, 29, 6, 1, 'admin-trading', 0, '2022-10-15 14:54:55'),
(19, 30, 7, 3, 'mateo-26', 0, '2022-10-15 15:51:17'),
(20, 31, 8, 7, 'julian-30', 0, '2022-10-15 16:06:20'),
(21, 32, 9, 1, 'admin-trading', 0, '2022-10-17 21:12:36'),
(22, 35, 10, 3, 'mateo-26', 0, '2022-10-19 02:49:59'),
(23, 36, 11, 3, 'mateo-26', 0, '2022-10-19 02:58:37'),
(32, 46, 12, 1, 'admin-trading', 0, '2022-10-25 03:04:15'),
(33, 49, 13, 1, 'admin-trading', 0, '2022-10-26 16:19:05'),
(34, 55, 14, 1, 'admin-trading', 0, '2022-11-01 16:04:24'),
(35, 59, 15, 1, 'admin-trading', 0, '2022-11-09 17:23:30'),
(36, 62, 16, 3, 'mateo-26', 0, '2022-11-13 05:54:48');

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
(22, 26, 'admin-trading', '2022-11-16 03:32:12'),
(23, 27, 'mateo-26', '2022-11-16 03:32:12'),
(24, 28, 'juan-25', '2022-11-16 03:32:12'),
(25, 29, 'admin-trading', '2022-11-16 03:32:12'),
(26, 30, 'mateo-26', '2022-11-16 03:32:12'),
(27, 31, 'julian-30', '2022-11-16 03:32:12'),
(28, 32, 'admin-trading', '2022-11-16 03:32:12'),
(29, 35, 'mateo-26', '2022-11-16 03:32:12'),
(30, 36, 'mateo-26', '2022-11-16 03:32:13'),
(39, 46, 'admin-trading', '2022-11-16 03:32:13'),
(40, 49, 'admin-trading', '2022-11-16 03:32:13'),
(41, 55, 'admin-trading', '2022-11-16 03:32:13'),
(42, 59, 'admin-trading', '2022-11-16 03:32:13'),
(43, 62, 'mateo-26', '2022-11-16 03:32:13');

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
(1, 1, 30, 'Obtenga nuestros beneficos', '<p>Obtenga todos nuestros beneficios, no olvide ir a perfil y firmar el contrato.</p>', '[\"vistas\\/img\\/tickets\\/1\\/318.png\"]', 'enviado', NULL, '2022-10-15 15:35:32'),
(2, 26, 1, 'hola', '<p>dasdasdsad</p>', '[]', 'enviado', '[]', '2022-10-27 20:06:52');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` bigint(20) UNSIGNED NOT NULL,
  `doc_usuario` bigint(20) NOT NULL,
  `perfil` text NOT NULL,
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
  `fecha` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `doc_usuario`, `perfil`, `nombre`, `email`, `password`, `estado`, `operando`, `ciclo_pago`, `vencimiento`, `verificacion`, `email_encriptado`, `foto`, `enlace_afiliado`, `patrocinador`, `pais`, `codigo_pais`, `telefono_movil`, `firma`, `fecha_contrato`, `fecha`) VALUES
(1, 1, 'admin', 'Administrador', 'admin@trading.com', '$2a$07$asxx54ahjppf45sd87a5auGZEtGHuyZwm.Ur.FJvWLCql3nmsMbXy', 1, 1, NULL, '2019-10-07', 1, NULL, 'vistas/img/usuarios/1/434.jpg', 'admin-trading', NULL, NULL, NULL, '(573) 218-5749', 'firma', NULL, '2019-09-27 19:13:02'),
(28, 43, 'usuario', 'prueba', 'prueba@gmail.com', '$2a$07$asxx54ahjppf45sd87a5auGZEtGHuyZwm.Ur.FJvWLCql3nmsMbXy', 1, 1, NULL, NULL, 1, 'c81b5136bcd10b4390108c979ed28ee6', NULL, 'prueba-28', 'juan-25', 'Colombia', 'CO', '(571) 231-2312', '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?><!DOCTYPE svg PUBLIC \"-//W3C//DTD SVG 1.1//EN\" \"http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd\"><svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"64\" height=\"72\"><path stroke-linejoin=\"round\" stroke-linecap=\"round\" stroke-width=\"1\" stroke=\"#333\" fill=\"none\" d=\"M 1 71 c 0.12 -0.05 4.77 -1.78 7 -3 c 4.46 -2.45 9.26 -4.88 13 -8 c 3.99 -3.33 8.19 -7.78 11 -12 c 2.24 -3.37 2.86 -8.54 5 -12 c 1.98 -3.2 5.72 -5.73 8 -9 c 5.36 -7.69 10.12 -16.96 15 -24 l 3 -2\"/></svg>', '2022-10-06', '2022-10-15 01:04:21'),
(55, 123, 'usuario', 'desarrollo', 'desarrollo@gmail.com', '$2a$07$asxx54ahjppf45sd87a5auGZEtGHuyZwm.Ur.FJvWLCql3nmsMbXy', 1, 0, NULL, NULL, 1, '7ad7e61d9122e5379728a15c7e84bbbb', NULL, 'desarrollo-55', 'admin-trading', 'Afghanistan', 'AF', '+93 (123) 123-1231', NULL, '2022-11-01', '2022-11-01 15:58:05'),
(25, 369, 'usuario', 'Juan', 'juan@gmail.com', '$2a$07$asxx54ahjppf45sd87a5auGZEtGHuyZwm.Ur.FJvWLCql3nmsMbXy', 1, 1, NULL, NULL, 1, '7038663cc684aa330956752c7e6fe7d4', NULL, 'juan-25', 'admin-trading', 'Colombia', 'CO', '+57 (123) 123-2323', '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?><!DOCTYPE svg PUBLIC \"-//W3C//DTD SVG 1.1//EN\" \"http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd\"><svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"222\" height=\"79\"><path stroke-linejoin=\"round\" stroke-linecap=\"round\" stroke-width=\"1\" stroke=\"#333\" fill=\"none\" d=\"M 12 10 c -0.12 0.19 -4.9 7.19 -7 11 c -1.58 2.88 -3.53 6.17 -4 9 c -0.43 2.6 0.13 6.55 1 9 c 0.62 1.73 2.44 4.04 4 5 c 2.31 1.42 5.99 2.5 9 3 c 4.77 0.79 9.92 1 15 1 c 7.78 0 15.7 0.27 23 -1 c 7.63 -1.33 15.92 -3.89 23 -7 c 6.22 -2.73 13.06 -6.79 18 -11 c 3.51 -2.99 7.4 -7.92 9 -12 c 1.72 -4.38 3.11 -14.05 2 -16 c -0.7 -1.23 -7.47 0.36 -10 2 c -8.64 5.61 -19.2 14.2 -27 22 c -4.04 4.04 -7.32 9.8 -10 15 c -2.54 4.93 -4.76 10.85 -6 16 c -0.65 2.71 -1.1 6.91 0 9 c 1.73 3.29 6.5 7.73 10 10 c 2.58 1.68 6.7 2.7 10 3 c 7.27 0.66 15.62 0.99 23 0 c 9.57 -1.29 19.24 -4.19 29 -7 c 10.35 -2.98 20.38 -5.96 30 -10 c 6.94 -2.92 14.96 -6.71 20 -11 c 3.07 -2.61 5.98 -8.25 7 -12 c 0.74 -2.72 -0.25 -6.98 -1 -10 c -0.5 -2.01 -1.83 -4.25 -3 -6 c -0.74 -1.11 -2.11 -3.21 -3 -3 c -4.14 0.99 -13.19 4.73 -18 8 c -2.78 1.89 -4.93 5.89 -7 9 c -1.22 1.83 -2.64 4.22 -3 6 c -0.22 1.1 0.23 3.42 1 4 c 1.36 1.02 4.68 1.89 7 2 c 11.47 0.53 24.36 1.13 36 0 c 8.62 -0.83 17.93 -3.66 26 -6 l 5 -3\"/></svg>', '2022-10-06', '2022-10-14 23:51:52'),
(27, 765, 'usuario', 'pedro pablo', 'pedro@gmail.com', '$2a$07$asxx54ahjppf45sd87a5auGZEtGHuyZwm.Ur.FJvWLCql3nmsMbXy', 1, 1, NULL, NULL, 1, 'c3b7f393410fe6185ba5d966a213a38f', NULL, 'pedro-pablo-27', 'mateo-26', 'Peru', 'PE', '(888) 888-8888', '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?><!DOCTYPE svg PUBLIC \"-//W3C//DTD SVG 1.1//EN\" \"http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd\"><svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"210\" height=\"20\"><path stroke-linejoin=\"round\" stroke-linecap=\"round\" stroke-width=\"1\" stroke=\"#333\" fill=\"none\" d=\"M 1 1 c 1.58 0 59.27 -0.86 90 0 c 18.15 0.51 35.41 1.32 53 4 c 22 3.36 65 14 65 14\"/></svg>', '2022-10-06', '2022-10-15 00:33:48'),
(29, 980, 'usuario', 'Luis', 'luis@gmail.com', '$2a$07$asxx54ahjppf45sd87a5auGZEtGHuyZwm.Ur.FJvWLCql3nmsMbXy', 1, 1, NULL, NULL, 1, '19ff31020abd6906f2f975a3e77e07c7', NULL, 'luis-29', 'admin-trading', 'Israel', 'IL', '+972 (787) 767-6676', '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?><!DOCTYPE svg PUBLIC \"-//W3C//DTD SVG 1.1//EN\" \"http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd\"><svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"146\" height=\"54\"><path stroke-linejoin=\"round\" stroke-linecap=\"round\" stroke-width=\"1\" stroke=\"#333\" fill=\"none\" d=\"M 1 53 c 0.07 -0.02 2.96 -0.41 4 -1 c 1.07 -0.61 1.89 -2.26 3 -3 c 1.75 -1.17 3.88 -2.29 6 -3 c 22.86 -7.62 45.47 -15.05 69 -22 c 6.31 -1.86 12.66 -2.27 19 -4 c 8.58 -2.34 16.75 -4.9 25 -8 c 5.21 -1.95 10.83 -4.45 15 -7 l 3 -4\"/></svg>', '2022-10-06', '2022-10-15 14:53:53'),
(31, 73908, 'usuario', 'Carlos Andres', 'carlos@gmail.com', '$2a$07$asxx54ahjppf45sd87a5auGZEtGHuyZwm.Ur.FJvWLCql3nmsMbXy', 1, 0, NULL, NULL, 1, 'db1e0a3750e0399df3eeee808187d9b4', NULL, 'carlos-31', 'julian-30', 'Chile', 'CL', '(566) 575-7657', '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?><!DOCTYPE svg PUBLIC \"-//W3C//DTD SVG 1.1//EN\" \"http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd\"><svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"165\" height=\"40\"><path stroke-linejoin=\"round\" stroke-linecap=\"round\" stroke-width=\"1\" stroke=\"#333\" fill=\"none\" d=\"M 1 1 c 0.23 0.05 9.43 1.03 13 3 c 8.24 4.56 16.43 13.02 25 18 c 5.37 3.12 11.76 5.07 18 7 c 12.38 3.83 24.99 8.75 37 10 c 12.55 1.3 27.48 0.12 40 -2 c 8.31 -1.41 17.07 -6.62 25 -9 l 5 0\"/></svg>', '2022-10-06', '2022-10-15 16:04:22'),
(30, 89875, 'usuario', 'Julian', 'julian@gmail.com', '$2a$07$asxx54ahjppf45sd87a5auGZEtGHuyZwm.Ur.FJvWLCql3nmsMbXy', 1, 1, NULL, NULL, 1, '4efe518f863e162e8f00e7d823b40230', NULL, 'julian-30', 'mateo-26', 'Argentina', 'AR', '+54 (875) 858-7587', '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?><!DOCTYPE svg PUBLIC \"-//W3C//DTD SVG 1.1//EN\" \"http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd\"><svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"200\" height=\"90\"><path stroke-linejoin=\"round\" stroke-linecap=\"round\" stroke-width=\"1\" stroke=\"#333\" fill=\"none\" d=\"M 1 74 c 0.04 -0.05 1.19 -2.19 2 -3 c 1.76 -1.76 3.78 -3.78 6 -5 c 10.15 -5.61 21.37 -10.16 32 -16 c 6.68 -3.67 13.53 -7.21 19 -12 c 10.15 -8.89 19.7 -19.85 29 -30 c 1.61 -1.75 4.76 -5.67 4 -6 c -2.11 -0.92 -15.65 -3.18 -20 -1 c -4.96 2.48 -10.22 12.1 -14 18 c -1.21 1.88 -1.74 4.69 -2 7 c -0.39 3.49 -0.69 7.67 0 11 c 0.88 4.21 2.97 9.14 5 13 c 1.14 2.17 3.18 4.18 5 6 c 1.82 1.82 3.92 3.38 6 5 c 0.96 0.75 1.96 1.69 3 2 c 2.03 0.61 4.64 0.95 7 1 c 13.03 0.28 26.52 0.92 39 0 c 4.97 -0.37 10.06 -2.43 15 -4 c 2.42 -0.77 4.84 -1.82 7 -3 c 1.42 -0.77 4.07 -3.05 4 -3 c -0.23 0.15 -9.44 5.62 -13 9 c -2.75 2.61 -5.27 6.53 -7 10 c -1.8 3.6 -2.5 8.24 -4 12 c -0.43 1.07 -1.2 2.46 -2 3 c -0.92 0.61 -3.36 1.57 -4 1 c -1.8 -1.62 -3.76 -6.8 -6 -10 c -2.46 -3.51 -6.16 -6.73 -8 -10 c -0.87 -1.55 -1.98 -5.15 -1 -6 c 4.28 -3.69 15.33 -8.35 23 -13 c 3.54 -2.15 6.53 -4.88 10 -7 c 2.55 -1.56 5.27 -3.44 8 -4 c 7.98 -1.64 17.21 -2.27 26 -3 c 3.36 -0.28 6.81 -0.49 10 0 c 5.26 0.81 11.84 2.25 16 4 l 3 4\"/></svg>', '2022-10-06', '2022-10-15 15:09:33'),
(26, 879788, 'usuario', 'Mateo', 'mateo@gmail.com', '$2a$07$asxx54ahjppf45sd87a5auGZEtGHuyZwm.Ur.FJvWLCql3nmsMbXy', 1, 1, NULL, NULL, 1, 'e64b49457900a3435c49e2e8ee79f603', NULL, 'mateo-26', 'admin-trading', 'Chile', 'CL', '(968) 888-8888', '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?><!DOCTYPE svg PUBLIC \"-//W3C//DTD SVG 1.1//EN\" \"http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd\"><svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"235\" height=\"68\"><path stroke-linejoin=\"round\" stroke-linecap=\"round\" stroke-width=\"1\" stroke=\"#333\" fill=\"none\" d=\"M 42 48 c 0 -0.1 -0.78 -4.49 0 -6 c 3.01 -5.78 8.11 -13.43 13 -19 c 4.52 -5.14 10.37 -10.01 16 -14 c 4.5 -3.19 12.27 -7.52 15 -8 c 0.86 -0.15 2.39 3.69 2 5 c -1.24 4.12 -4.66 10.77 -8 15 c -5 6.34 -11.59 12.27 -18 18 c -6.45 5.77 -13.01 11.63 -20 16 c -5.99 3.74 -13.29 7.04 -20 9 c -6.49 1.9 -20.56 5.77 -21 3 c -1.14 -7.13 6.56 -41.45 13 -53 c 2.65 -4.76 14.01 -6.45 21 -8 c 7.49 -1.67 16.49 -2.72 24 -2 c 9.01 0.87 18.93 3.76 28 7 c 19.04 6.8 36.91 16.2 56 23 c 10.09 3.6 20.66 6.02 31 8 c 5.18 0.99 11.13 1.72 16 1 c 5.77 -0.85 12.18 -3.49 18 -6 c 8.92 -3.85 26 -13 26 -13\"/></svg>', '2022-10-06', '2022-10-15 00:30:39'),
(35, 34534545, 'usuario', 'Lucero', 'lucero@gmail.com', '$2a$07$asxx54ahjppf45sd87a5auGZEtGHuyZwm.Ur.FJvWLCql3nmsMbXy', 1, 1, NULL, NULL, 1, '1a8036f7ec230101fa36bc463b68ee0c', NULL, 'lucero-35', 'mateo-26', 'Colombia', 'CO', '+57 (432) 423-4234', '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?><!DOCTYPE svg PUBLIC \"-//W3C//DTD SVG 1.1//EN\" \"http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd\"><svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"127\" height=\"78\"><path stroke-linejoin=\"round\" stroke-linecap=\"round\" stroke-width=\"1\" stroke=\"#333\" fill=\"none\" d=\"M 1 44 c 0.19 0.09 7.34 4.41 11 5 c 7.88 1.28 17.79 1.84 26 1 c 7.5 -0.77 16.49 -2.82 23 -6 c 6.25 -3.05 13.24 -8.88 18 -14 c 3.36 -3.62 6.39 -9.32 8 -14 c 1.51 -4.39 2.28 -14.44 2 -15 c -0.19 -0.38 -4.07 5.83 -5 9 c -5.2 17.77 -8.93 37.13 -14 56 c -1.03 3.83 -1.8 10.14 -4 11 c -3.6 1.41 -13.24 -0.4 -19 -2 c -5.66 -1.57 -11.8 -4.81 -17 -8 c -4.93 -3.02 -14.35 -9.61 -14 -11 c 0.33 -1.33 11.15 -0.93 17 -1 c 24.73 -0.28 47.8 0.55 72 0 c 5.42 -0.12 10.91 -1.03 16 -2 l 5 -2\"/></svg>', '2022-10-03', '2022-10-19 02:49:00'),
(49, 34543543, 'usuario', 'Gabriel', 'gabriel@gmail.com', '$2a$07$asxx54ahjppf45sd87a5auGZEtGHuyZwm.Ur.FJvWLCql3nmsMbXy', 1, 0, NULL, NULL, 1, '2821e29f7fb82f182ecca8d8c9e681cf', NULL, 'gabriel-49', 'admin-trading', 'Chile', 'CL', '+56 (123) 123-1231', '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?><!DOCTYPE svg PUBLIC \"-//W3C//DTD SVG 1.1//EN\" \"http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd\"><svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"170\" height=\"70\"><path stroke-linejoin=\"round\" stroke-linecap=\"round\" stroke-width=\"1\" stroke=\"#333\" fill=\"none\" d=\"M 1 69 c 0 -0.09 -0.46 -3.77 0 -5 c 0.39 -1.04 1.89 -2.17 3 -3 c 2.84 -2.13 6.03 -4.52 9 -6 c 1.4 -0.7 4.29 -1.77 5 -1 c 2.17 2.35 4.65 10.79 7 14 c 0.62 0.84 3.31 1.58 4 1 c 2.51 -2.13 6.45 -7.76 9 -12 c 3.42 -5.69 6.94 -11.82 9 -18 c 3.16 -9.47 4.1 -21.29 7 -30 c 0.74 -2.21 3.2 -4.56 5 -6 c 1.24 -0.99 3.7 -2 5 -2 c 0.87 0 2.37 1.12 3 2 c 2.42 3.38 4.9 7.8 7 12 c 2.98 5.95 4.88 12.13 8 18 c 5.33 10.02 11.42 22.34 17 29 c 1.53 1.83 6 1.87 9 2 c 11.71 0.52 24.49 0.73 36 0 c 3.64 -0.23 7.3 -2.41 11 -3 l 14 -1\"/></svg>', '2022-10-26', '2022-10-26 16:04:59'),
(32, 54654656, 'usuario', 'Miguelito', 'miguel@gmail.com', '$2a$07$asxx54ahjppf45sd87a5auGZEtGHuyZwm.Ur.FJvWLCql3nmsMbXy', 1, 0, NULL, NULL, 1, 'c952ec83eabde595820603a3ca9d7f54', NULL, 'miguel-32', 'admin-trading', 'Israel', 'IL', '(972) 456-4564', '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?><!DOCTYPE svg PUBLIC \"-//W3C//DTD SVG 1.1//EN\" \"http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd\"><svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"228\" height=\"55\"><path stroke-linejoin=\"round\" stroke-linecap=\"round\" stroke-width=\"1\" stroke=\"#333\" fill=\"none\" d=\"M 1 37 c 0.25 -0.05 9.66 -1.45 14 -3 c 4.74 -1.69 9.15 -4.97 14 -7 c 5.59 -2.34 11.14 -4.51 17 -6 c 12.62 -3.21 26.06 -6.14 38 -8 c 2.17 -0.34 5.1 0.21 7 1 c 1.72 0.72 4.17 2.45 5 4 c 1.2 2.23 1.79 6.01 2 9 c 0.44 6.17 -0.26 12.77 0 19 c 0.07 1.67 0.1 4.2 1 5 c 1.51 1.35 5.4 2.51 8 3 c 2.44 0.46 5.47 0.4 8 0 c 3.61 -0.57 7.48 -1.56 11 -3 c 16.86 -6.91 33.06 -14.18 50 -22 c 5.27 -2.43 9.81 -5.59 15 -8 c 4.25 -1.97 8.87 -2.93 13 -5 c 5.85 -2.93 11.52 -6.42 17 -10 l 6 -5\"/></svg>', '2022-10-01', '2022-10-17 20:27:21'),
(46, 98716415, 'usuario', 'Manuel Perez', 'manuel@gmail.com', '$2a$07$asxx54ahjppf45sd87a5auGZEtGHuyZwm.Ur.FJvWLCql3nmsMbXy', 1, 0, NULL, NULL, 1, '4201ddc9eb0ad45aaeda7542c7c544de', NULL, 'manuel-perez-46', 'admin-trading', 'Colombia', 'CO', '+57 (321) 323-1231', 'firma', '2022-10-24', '2022-10-25 03:04:15'),
(62, 231321323, 'usuario', 'Andres', 'andres@gmail.com', '$2a$07$asxx54ahjppf45sd87a5auFL5K1.Cmt9ZheoVVuudOi5BCi10qWly', 1, 1, NULL, NULL, 1, 'eff6290cd447ba13392318b78f9a68f3', NULL, 'andres-62', 'mateo-26', 'Colombia', 'CO', '+57 (213) 213-2132', '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?><!DOCTYPE svg PUBLIC \"-//W3C//DTD SVG 1.1//EN\" \"http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd\"><svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"142\" height=\"61\"><path stroke-linejoin=\"round\" stroke-linecap=\"round\" stroke-width=\"1\" stroke=\"#333\" fill=\"none\" d=\"M 25 18 c -0.24 0 -9.42 0.38 -14 0 c -3.33 -0.28 -10.19 -2.1 -10 -2 c 0.65 0.32 21.44 10.53 32 13 c 9.8 2.3 22 2 32 2 c 2.27 0 5.17 -0.82 7 -2 c 3.38 -2.19 6.88 -5.74 10 -9 c 4.28 -4.47 9.69 -12.46 12 -14 c 0.63 -0.42 3.24 2.79 3 4 c -2.07 10.33 -7.53 27.85 -12 41 c -1.08 3.17 -2.88 8.58 -5 9 c -4.19 0.84 -17.38 -0.2 -20 -4 c -5.45 -7.91 -7.83 -27.76 -11 -41 c -0.37 -1.56 -0.26 -3.43 0 -5 c 0.38 -2.29 0.56 -6.32 2 -7 c 3.39 -1.61 11.24 -1.74 17 -2 c 9.09 -0.41 18.1 -0.86 27 0 c 11.7 1.13 23.34 4.48 35 6 l 11 0\"/></svg>', '2022-11-13', '2022-11-13 05:52:46'),
(36, 234234234, 'usuario', 'Carolina', 'carolina@gmail.com', '$2a$07$asxx54ahjppf45sd87a5auGZEtGHuyZwm.Ur.FJvWLCql3nmsMbXy', 1, 1, NULL, NULL, 1, '38ad84cbc67a6e587e34df5df5bdb41c', NULL, 'carolina-36', 'mateo-26', 'Chile', 'CL', '+56 ', '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?><!DOCTYPE svg PUBLIC \"-//W3C//DTD SVG 1.1//EN\" \"http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd\"><svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"202\" height=\"31\"><path stroke-linejoin=\"round\" stroke-linecap=\"round\" stroke-width=\"1\" stroke=\"#333\" fill=\"none\" d=\"M 29 7 c -0.35 -0.1 -13.52 -4.61 -20 -6 c -2.48 -0.53 -8.14 -0.01 -8 0 c 0.49 0.02 18.31 0.93 28 1 c 37.72 0.28 107.09 0.02 109 0 c 0.14 0 -5.48 -1.22 -8 -1 c -4.79 0.42 -10.12 1.58 -15 3 c -5.45 1.58 -11.34 3.48 -16 6 c -2.9 1.57 -7.57 5.27 -8 7 c -0.29 1.15 3.11 4.14 5 5 c 4.75 2.16 11.24 3.98 17 5 c 9.15 1.63 18.48 2.68 28 3 c 20.27 0.69 60 0 60 0\"/></svg>', '2022-10-03', '2022-10-19 02:51:58'),
(59, 3214235324, 'usuario', 'Patricio', 'patricio@gmail.com', '$2a$07$asxx54ahjppf45sd87a5auFL5K1.Cmt9ZheoVVuudOi5BCi10qWly', 1, 0, NULL, NULL, 1, 'dcd2251fc17d7637dfae626afc81a128', NULL, 'patricio-59', 'admin-trading', 'Colombia', 'CO', '+57 (312) 312-3123', 'firma', '2022-11-09', '2022-11-09 17:23:30'),
(58, 46300812382, 'usuario', 'gg', 'gg@gmail.com', '$2a$07$asxx54ahjppf45sd87a5auFL5K1.Cmt9ZheoVVuudOi5BCi10qWly', 1, 0, NULL, NULL, 1, '1208cd4bab8dd8c03d1ba8f20fb891dd', NULL, NULL, 'admin-trading', NULL, NULL, NULL, NULL, NULL, '2022-11-07 22:02:10'),
(54, 73567228773, 'usuario', 'Raze', 'raze@gmail.com', '$2a$07$asxx54ahjppf45sd87a5auGZEtGHuyZwm.Ur.FJvWLCql3nmsMbXy', 1, 0, NULL, NULL, 0, '7ffbf5fe803f04746d6c4c1e47d3a60a', NULL, NULL, 'prueba-28', NULL, NULL, NULL, NULL, NULL, '2022-10-29 04:52:45'),
(52, 244516653775, 'usuario', 'Mike', 'mike@gmail.com', '$2a$07$asxx54ahjppf45sd87a5auGZEtGHuyZwm.Ur.FJvWLCql3nmsMbXy', 1, 0, NULL, NULL, 0, 'e28f6f64608c970c663197d7fe1f5a59', NULL, NULL, 'prueba-28', NULL, NULL, NULL, NULL, NULL, '2022-10-29 04:33:21'),
(50, 560101318638, 'usuario', 'Daniel R', 'zzjdanielzz@gmail.com', '$2a$07$asxx54ahjppf45sd87a5auEFpkdIK7n86bXuxJThYTtqaCcNFhmx.', 1, 0, NULL, NULL, 0, 'd9104be379b16b1e4ebedc3e7f5a6706', NULL, NULL, 'admin-trading', NULL, NULL, NULL, NULL, NULL, '2022-10-29 03:39:13'),
(53, 997562129727, 'usuario', 'Viper', 'viper@gmail.com', '$2a$07$asxx54ahjppf45sd87a5auGZEtGHuyZwm.Ur.FJvWLCql3nmsMbXy', 1, 0, NULL, NULL, 1, 'ee37008efb0019ee0083fab4b32b9b47', NULL, NULL, 'admin-trading', NULL, NULL, NULL, NULL, NULL, '2022-10-29 04:49:40');

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
-- Indices de la tabla `pagos_comisiones`
--
ALTER TABLE `pagos_comisiones`
  ADD PRIMARY KEY (`id_pago`);

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
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `campanas`
--
ALTER TABLE `campanas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `comprobantes`
--
ALTER TABLE `comprobantes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de la tabla `cuentas_bancarias`
--
ALTER TABLE `cuentas_bancarias`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `pagos_comisiones`
--
ALTER TABLE `pagos_comisiones`
  MODIFY `id_pago` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6644465;

--
-- AUTO_INCREMENT de la tabla `pagos_extras`
--
ALTER TABLE `pagos_extras`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `pagos_inversiones`
--
ALTER TABLE `pagos_inversiones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT de la tabla `pagos_uninivel`
--
ALTER TABLE `pagos_uninivel`
  MODIFY `id_pago` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `red_binaria`
--
ALTER TABLE `red_binaria`
  MODIFY `id_binaria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de la tabla `red_uninivel`
--
ALTER TABLE `red_uninivel`
  MODIFY `id_uninivel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT de la tabla `soporte`
--
ALTER TABLE `soporte`
  MODIFY `id_soporte` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT de la tabla `videos`
--
ALTER TABLE `videos`
  MODIFY `id_video` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
