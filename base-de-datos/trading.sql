-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-09-2022 a las 19:10:42
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
-- Estructura de tabla para la tabla `cuentas_bancarias`
--

CREATE TABLE `cuentas_bancarias` (
  `numero` bigint(20) NOT NULL,
  `titular` int(11) NOT NULL,
  `entidad` text NOT NULL,
  `estado` int(11) NOT NULL,
  `tipo` text NOT NULL,
  `certificado` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cuentas_bancarias`
--

INSERT INTO `cuentas_bancarias` (`numero`, `titular`, `entidad`, `estado`, `tipo`, `certificado`) VALUES
(1668964164, 109486500, 'DAVIVIENDA', 1, 'AHORROS', ''),
(2364876546945168468, 109486497, 'DAVIVIENDA', 1, 'AHORROS', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos_binaria`
--

CREATE TABLE `pagos_binaria` (
  `id_pago` int(11) NOT NULL,
  `id_pago_paypal` text NOT NULL,
  `usuario_pago` int(11) NOT NULL,
  `periodo` text NOT NULL,
  `periodo_comision` float NOT NULL,
  `periodo_venta` float NOT NULL,
  `fecha_pago` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `pagos_binaria`
--

INSERT INTO `pagos_binaria` (`id_pago`, `id_pago_paypal`, `usuario_pago`, `periodo`, `periodo_comision`, `periodo_venta`, `fecha_pago`) VALUES
(6546516, 'I-9885416', 109486497, '1', 10, 100, '2022-09-10 02:35:53');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos_matriz`
--

CREATE TABLE `pagos_matriz` (
  `id_pago` int(11) NOT NULL,
  `id_pago_paypal` text NOT NULL,
  `usuario_pago` int(11) NOT NULL,
  `periodo` text NOT NULL,
  `periodo_comision` float NOT NULL,
  `periodo_venta` float NOT NULL,
  `fecha_pago` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `posicion_binaria` varchar(1) DEFAULT NULL,
  `patrocinador_red` text DEFAULT NULL,
  `periodo_comision` float NOT NULL,
  `periodo_venta` float NOT NULL,
  `fecha_binaria` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `red_binaria`
--

INSERT INTO `red_binaria` (`id_binaria`, `usuario_red`, `orden_binaria`, `derrame_binaria`, `posicion_binaria`, `patrocinador_red`, `periodo_comision`, `periodo_venta`, `fecha_binaria`) VALUES
(1, 109486495, 1, 0, NULL, NULL, 0, 40, '2022-09-10 16:45:05'),
(31, 109486497, 2, 1, 'A', 'academy-of-life', 4, 20, '2022-09-10 02:27:08'),
(32, 109486498, 3, 2, 'A', 'sova-109486497', 0, 0, '2022-09-10 02:17:57'),
(33, 109486499, 4, 2, 'B', 'sova-109486497', 0, 0, '2022-09-10 02:25:57'),
(34, 109486500, 5, 3, 'A', 'sova-109486497', 0, 0, '2022-09-10 16:43:52');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `red_matriz`
--

CREATE TABLE `red_matriz` (
  `id_matriz` int(11) NOT NULL,
  `usuario_red` int(11) NOT NULL,
  `orden_matriz` int(11) NOT NULL,
  `derrame_matriz` int(11) NOT NULL,
  `posicion_matriz` varchar(1) DEFAULT NULL,
  `patrocinador_red` text DEFAULT NULL,
  `periodo_comision` float NOT NULL,
  `periodo_venta` float NOT NULL,
  `fecha_matriz` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `red_matriz`
--

INSERT INTO `red_matriz` (`id_matriz`, `usuario_red`, `orden_matriz`, `derrame_matriz`, `posicion_matriz`, `patrocinador_red`, `periodo_comision`, `periodo_venta`, `fecha_matriz`) VALUES
(1, 109486495, 1, 0, NULL, NULL, 0, 0, '2022-09-09 00:04:32');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `red_uninivel`
--

CREATE TABLE `red_uninivel` (
  `id_uninivel` int(11) NOT NULL,
  `usuario_red` int(11) NOT NULL,
  `patrocinador_red` text DEFAULT NULL,
  `periodo_comision` float NOT NULL,
  `periodo_venta` float NOT NULL,
  `fecha_uninivel` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `red_uninivel`
--

INSERT INTO `red_uninivel` (`id_uninivel`, `usuario_red`, `patrocinador_red`, `periodo_comision`, `periodo_venta`, `fecha_uninivel`) VALUES
(1, 109486495, 'academy-of-life', 0, 0, '2022-09-10 00:53:40');

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
(1, 109486495, 109486497, 'Error en su número de cuenta', '<p>Por favor verifique su numero de cuenta.</p><p>Att: soporte</p>', '[]', 'papelera', '[\"109486497\"]', '2022-09-10 16:34:17');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `perfil` text NOT NULL,
  `nombre` text NOT NULL,
  `email` text NOT NULL,
  `password` text NOT NULL,
  `suscripcion` int(11) NOT NULL,
  `id_suscripcion` text DEFAULT NULL,
  `ciclo_pago` int(11) DEFAULT NULL,
  `vencimiento` date DEFAULT NULL,
  `verificacion` int(11) NOT NULL,
  `email_encriptado` text DEFAULT NULL,
  `foto` text DEFAULT NULL,
  `enlace_afiliado` text DEFAULT NULL,
  `patrocinador` text DEFAULT NULL,
  `paypal` text DEFAULT NULL,
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

INSERT INTO `usuarios` (`id_usuario`, `perfil`, `nombre`, `email`, `password`, `suscripcion`, `id_suscripcion`, `ciclo_pago`, `vencimiento`, `verificacion`, `email_encriptado`, `foto`, `enlace_afiliado`, `patrocinador`, `paypal`, `pais`, `codigo_pais`, `telefono_movil`, `firma`, `fecha_contrato`, `fecha`) VALUES
(109486495, 'admin', 'Academy of life', 'admin@trading.com', '$2a$07$asxx54ahjppf45sd87a5auFL5K1.Cmt9ZheoVVuudOi5BCi10qWly', 1, NULL, NULL, '2019-10-07', 1, NULL, 'vistas/img/usuarios/1/434.jpg', 'admin@trading.com', NULL, 'tutorialesatualcance-buyer@hotmail.com', NULL, NULL, NULL, NULL, NULL, '2019-09-27 19:13:02'),
(109486497, 'usuario', 'Sova', 'sova@gmail.com', '$2a$07$asxx54ahjppf45sd87a5auGZEtGHuyZwm.Ur.FJvWLCql3nmsMbXy', 1, 'I-9885416', 1, '1970-02-01', 1, '9f4bcddac3a93b0803f4e5a13b47b3d5', 'vistas/img/usuarios/109486497/273.jpg', 'sova-109486497', 'admin@trading.com', 'email@paypal.com', 'Colombia', 'CO', '+57 (165) 161-6516', '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?><!DOCTYPE svg PUBLIC \"-//W3C//DTD SVG 1.1//EN\" \"http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd\"><svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"219\" height=\"53\"><path stroke-linejoin=\"round\" stroke-linecap=\"round\" stroke-width=\"1\" stroke=\"#333\" fill=\"none\" d=\"M 38 16 c -0.02 0.12 -0.24 5.02 -1 7 c -0.78 2.02 -2.48 4.64 -4 6 c -1.14 1.01 -3.35 1.88 -5 2 c -6.75 0.5 -14.79 0.27 -22 0 c -1.67 -0.06 -4.47 -0.15 -5 -1 c -0.73 -1.17 -0.49 -5.03 0 -7 c 0.41 -1.64 1.82 -3.65 3 -5 c 1.01 -1.15 2.63 -2.32 4 -3 c 1.13 -0.56 2.72 -1 4 -1 c 2.81 0 7 -0.25 9 1 c 2.52 1.58 5.15 5.75 7 9 c 5.07 8.93 10.52 24.02 14 28 c 0.9 1.02 5.08 -2.4 7 -4 c 1.86 -1.55 3.79 -3.79 5 -6 c 4.3 -7.84 9.72 -23.35 12 -25 c 1.1 -0.8 3.63 10.1 6 12 c 1.59 1.27 6.02 0.27 9 0 c 4.36 -0.4 9.19 -0.63 13 -2 c 4.03 -1.45 8.17 -4.39 12 -7 c 3.53 -2.41 7.11 -5.11 10 -8 c 1.94 -1.94 3.73 -4.67 5 -7 c 0.61 -1.12 1.35 -3.91 1 -4 c -0.49 -0.12 -4.68 1.72 -5 3 c -0.72 2.87 0.16 9.2 1 13 c 0.38 1.7 1.75 3.75 3 5 c 1.85 1.85 4.57 3.61 7 5 c 2.16 1.23 4.66 2.64 7 3 c 5.84 0.9 12.61 1 19 1 c 4.38 0 8.99 0.08 13 -1 c 7.88 -2.13 15.79 -6.5 24 -9 c 7.23 -2.2 15.24 -4 22 -5 c 1.53 -0.23 4.75 0.16 5 1 c 0.46 1.52 -0.75 6.49 -2 9 c -1.85 3.7 -4.81 8.42 -8 11 c -4.83 3.9 -12.33 7.9 -18 10 l -9 0\"/></svg>', '0000-00-00', '2022-09-10 01:07:17'),
(109486498, 'usuario', 'Viper', 'viper@gmail.com', '$2a$07$asxx54ahjppf45sd87a5auGZEtGHuyZwm.Ur.FJvWLCql3nmsMbXy', 1, 'I-9885416', 1, '1970-02-01', 1, 'ee37008efb0019ee0083fab4b32b9b47', NULL, 'viper-109486498', 'sova-109486497', 'email@paypal.com', 'Colombia', 'CO', '+57 (321) 857-4946', '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?><!DOCTYPE svg PUBLIC \"-//W3C//DTD SVG 1.1//EN\" \"http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd\"><svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"261\" height=\"81\"><path stroke-linejoin=\"round\" stroke-linecap=\"round\" stroke-width=\"1\" stroke=\"#333\" fill=\"none\" d=\"M 31 34 c -0.07 0.05 -2.98 1.8 -4 3 c -2.48 2.93 -6.74 8.72 -7 10 c -0.1 0.52 3.65 0.54 5 0 c 3.14 -1.26 7.48 -3.48 10 -6 c 4.02 -4.02 7.81 -9.73 11 -15 c 3.45 -5.7 10.46 -15.18 9 -18 c -1.68 -3.23 -18.26 -8.15 -22 -7 c -2.52 0.77 -3.16 9.97 -4 15 c -0.81 4.87 -2.08 11.13 -1 15 c 0.92 3.3 4.97 8.28 8 10 c 3.62 2.05 10 2.57 15 3 c 6.54 0.56 13.58 0.86 20 0 c 8.25 -1.1 17.18 -3 25 -6 c 11.84 -4.54 24.12 -10.93 35 -17 c 2.97 -1.66 7.25 -5.65 8 -7 c 0.25 -0.46 -2.17 -2.27 -3 -2 c -9.17 2.98 -24.13 10.05 -37 15 c -9.58 3.69 -18.42 7.41 -28 10 c -11.5 3.1 -22.97 4.96 -35 7 c -8.15 1.38 -15.9 2.31 -24 3 c -3.68 0.32 -11.2 -0.07 -11 0 c 0.42 0.14 15.23 2.17 23 4 c 32.93 7.75 62.93 16.08 96 24 c 7.15 1.71 13.86 2.95 21 4 c 4.35 0.64 13.33 1.15 13 1 c -1.27 -0.56 -32 -10.6 -47 -16 c -1.09 -0.39 -2.46 -1.2 -3 -2 c -0.61 -0.92 -1.34 -3.09 -1 -4 c 0.47 -1.25 2.53 -2.87 4 -4 c 2.81 -2.16 5.84 -4.28 9 -6 c 4.18 -2.28 8.6 -4.76 13 -6 c 5.91 -1.66 12.61 -2.79 19 -3 c 24.26 -0.79 64.64 -0.6 73 0 c 0.67 0.05 -1.63 4.19 -3 5 c -3.5 2.06 -9.79 3.01 -14 5 c -1.81 0.86 -4.36 2.72 -5 4 c -0.41 0.82 0.17 3.92 1 4 c 8.46 0.79 27.66 0.26 42 0 c 4.45 -0.08 8.93 -0.32 13 -1 l 5 -2\"/></svg>', '0000-00-00', '2022-09-10 02:13:14'),
(109486499, 'usuario', 'Raze', 'raze@gmail.com', '$2a$07$asxx54ahjppf45sd87a5auGZEtGHuyZwm.Ur.FJvWLCql3nmsMbXy', 1, 'I-9885416', 1, '1970-02-01', 1, '7ffbf5fe803f04746d6c4c1e47d3a60a', NULL, 'raze-109486499', 'sova-109486497', 'email@paypal.com', 'Costa Rica', 'CR', '+506 (464) 646-4646', '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?><!DOCTYPE svg PUBLIC \"-//W3C//DTD SVG 1.1//EN\" \"http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd\"><svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"248\" height=\"56\"><path stroke-linejoin=\"round\" stroke-linecap=\"round\" stroke-width=\"1\" stroke=\"#333\" fill=\"none\" d=\"M 23 41 c 0.11 0.02 4 1 6 1 c 11.17 0 23.38 0.97 34 -1 c 11.84 -2.2 23.53 -8.26 36 -12 c 11.55 -3.47 22.97 -6.58 34 -9 c 2.2 -0.48 4.94 -0.52 7 0 c 2.9 0.72 7.79 2.07 9 4 c 1.47 2.36 1.7 9.03 1 12 c -0.41 1.74 -3.1 4.05 -5 5 c -4.84 2.42 -11.32 4.99 -17 6 c -8.85 1.57 -18.65 2.14 -28 2 c -12.36 -0.19 -25.01 -0.75 -37 -3 c -14.42 -2.7 -29.41 -7.16 -43 -12 c -5.59 -1.99 -12.11 -5.72 -16 -9 c -1.61 -1.36 -2.67 -4.84 -3 -7 c -0.26 -1.72 0.03 -4.71 1 -6 c 1.59 -2.12 5.19 -4.6 8 -6 c 3.55 -1.78 8 -3.26 12 -4 c 4.75 -0.88 10.31 -1.47 15 -1 c 4.84 0.48 10.06 2.31 15 4 c 6.86 2.35 13.32 4.88 20 8 c 24.12 11.26 46.31 23.35 70 34 c 6.06 2.73 12.62 4.69 19 6 c 6.44 1.32 13.19 1.79 20 2 c 14.9 0.47 29.3 0.51 44 0 c 4.72 -0.16 9.29 -1.57 14 -2 l 8 0\"/></svg>', '0000-00-00', '2022-09-10 02:21:02'),
(109486500, 'usuario', 'Juan', 'juan@gmail.com', '$2a$07$asxx54ahjppf45sd87a5auGZEtGHuyZwm.Ur.FJvWLCql3nmsMbXy', 1, 'I-9885416', 1, '1970-02-01', 1, '7038663cc684aa330956752c7e6fe7d4', NULL, 'juan-109486500', 'sova-109486497', 'email@paypal.com', 'Colombia', 'CO', '+57 (135) 464-6156', '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?><!DOCTYPE svg PUBLIC \"-//W3C//DTD SVG 1.1//EN\" \"http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd\"><svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"228\" height=\"60\"><path stroke-linejoin=\"round\" stroke-linecap=\"round\" stroke-width=\"1\" stroke=\"#333\" fill=\"none\" d=\"M 42 10 c -0.16 0.02 -6.31 0.1 -9 1 c -4.93 1.64 -10.21 4.39 -15 7 c -2.49 1.36 -4.82 3.16 -7 5 c -2.15 1.82 -4.4 3.87 -6 6 c -1.26 1.69 -2.33 3.98 -3 6 c -0.61 1.83 -1 4.09 -1 6 c 0 1.91 -0.08 5.01 1 6 c 2.15 1.97 7.48 4.02 11 5 c 2.04 0.57 4.87 0.47 7 0 c 3.56 -0.79 7.77 -2.17 11 -4 c 4.14 -2.34 8.23 -5.7 12 -9 c 4.27 -3.73 8.8 -7.73 12 -12 c 2.53 -3.37 4.93 -8.03 6 -12 c 1.12 -4.15 2.2 -12.54 1 -14 c -0.89 -1.09 -7.62 1.22 -10 3 c -3.56 2.67 -7.26 7.74 -10 12 c -3.14 4.88 -5.52 10.46 -8 16 c -1.93 4.31 -4.23 8.96 -5 13 c -0.45 2.34 -0.32 6.58 1 8 c 2.2 2.36 8.24 5.15 12 6 c 2.81 0.64 7.11 0.07 10 -1 c 5.54 -2.05 11.5 -5.63 17 -9 c 4.92 -3.01 9.93 -6.28 14 -10 c 3.36 -3.07 6.61 -7.31 9 -11 c 1.06 -1.64 1.99 -6.19 2 -6 c 0.04 0.57 -1.24 13.44 -1 19 c 0.06 1.31 1.12 3.12 2 4 c 0.88 0.88 2.79 2 4 2 c 2.24 0 5.75 -0.78 8 -2 c 5.3 -2.87 11.35 -6.83 16 -11 c 4.75 -4.26 9.48 -9.94 13 -15 c 1.51 -2.18 2.81 -5.92 3 -8 c 0.08 -0.88 -1.58 -3.26 -2 -3 c -1.16 0.73 -4.84 5.25 -6 8 c -1.29 3.07 -1.61 7.33 -2 11 c -0.28 2.63 -0.55 5.97 0 8 c 0.29 1.07 2.01 2.91 3 3 c 1.93 0.18 5.99 -0.61 8 -2 c 5.87 -4.06 13.01 -10.39 18 -16 c 2.59 -2.92 4.41 -7.37 6 -11 c 0.65 -1.48 1 -5.11 1 -5 c 0.03 0.66 -1.17 23.78 0 30 c 0.25 1.31 4.48 2.62 6 2 c 10.34 -4.23 34.18 -18.73 38 -20 c 0.73 -0.24 -1.6 5.37 -2 8 c -0.25 1.59 -0.62 4.69 0 5 c 0.79 0.39 4.11 -1.12 6 -2 c 3.07 -1.43 6.01 -3.72 9 -5 l 5 -1\"/></svg>', '0000-00-00', '2022-09-10 16:37:04');

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
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `cuentas_bancarias`
--
ALTER TABLE `cuentas_bancarias`
  ADD PRIMARY KEY (`numero`),
  ADD KEY `titular` (`titular`);

--
-- Indices de la tabla `pagos_binaria`
--
ALTER TABLE `pagos_binaria`
  ADD PRIMARY KEY (`id_pago`);

--
-- Indices de la tabla `pagos_matriz`
--
ALTER TABLE `pagos_matriz`
  ADD PRIMARY KEY (`id_pago`);

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
-- Indices de la tabla `red_matriz`
--
ALTER TABLE `red_matriz`
  ADD PRIMARY KEY (`id_matriz`),
  ADD KEY `red_matriz_ibfk_1` (`usuario_red`);

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
  ADD PRIMARY KEY (`id_usuario`);

--
-- Indices de la tabla `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`id_video`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `pagos_binaria`
--
ALTER TABLE `pagos_binaria`
  MODIFY `id_pago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6546517;

--
-- AUTO_INCREMENT de la tabla `pagos_matriz`
--
ALTER TABLE `pagos_matriz`
  MODIFY `id_pago` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pagos_uninivel`
--
ALTER TABLE `pagos_uninivel`
  MODIFY `id_pago` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `red_binaria`
--
ALTER TABLE `red_binaria`
  MODIFY `id_binaria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT de la tabla `red_matriz`
--
ALTER TABLE `red_matriz`
  MODIFY `id_matriz` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de la tabla `red_uninivel`
--
ALTER TABLE `red_uninivel`
  MODIFY `id_uninivel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `soporte`
--
ALTER TABLE `soporte`
  MODIFY `id_soporte` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109486501;

--
-- AUTO_INCREMENT de la tabla `videos`
--
ALTER TABLE `videos`
  MODIFY `id_video` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cuentas_bancarias`
--
ALTER TABLE `cuentas_bancarias`
  ADD CONSTRAINT `cuentas_bancarias_ibfk_1` FOREIGN KEY (`titular`) REFERENCES `usuarios` (`id_usuario`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `red_binaria`
--
ALTER TABLE `red_binaria`
  ADD CONSTRAINT `red_binaria_ibfk_1` FOREIGN KEY (`usuario_red`) REFERENCES `usuarios` (`id_usuario`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `red_matriz`
--
ALTER TABLE `red_matriz`
  ADD CONSTRAINT `red_matriz_ibfk_1` FOREIGN KEY (`usuario_red`) REFERENCES `usuarios` (`id_usuario`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `red_uninivel`
--
ALTER TABLE `red_uninivel`
  ADD CONSTRAINT `red_uninivel_ibfk_1` FOREIGN KEY (`usuario_red`) REFERENCES `usuarios` (`id_usuario`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
