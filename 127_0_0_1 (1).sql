-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-06-2023 a las 01:19:34
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 7.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tiendamascotas`
--
CREATE DATABASE IF NOT EXISTS `tiendamascotas` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `tiendamascotas`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admin_interface_theme`
--

CREATE TABLE `admin_interface_theme` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `title` varchar(50) NOT NULL,
  `title_visible` tinyint(1) NOT NULL,
  `logo` varchar(100) NOT NULL,
  `logo_visible` tinyint(1) NOT NULL,
  `css_header_background_color` varchar(10) NOT NULL,
  `title_color` varchar(10) NOT NULL,
  `css_header_text_color` varchar(10) NOT NULL,
  `css_header_link_color` varchar(10) NOT NULL,
  `css_header_link_hover_color` varchar(10) NOT NULL,
  `css_module_background_color` varchar(10) NOT NULL,
  `css_module_text_color` varchar(10) NOT NULL,
  `css_module_link_color` varchar(10) NOT NULL,
  `css_module_link_hover_color` varchar(10) NOT NULL,
  `css_module_rounded_corners` tinyint(1) NOT NULL,
  `css_generic_link_color` varchar(10) NOT NULL,
  `css_generic_link_hover_color` varchar(10) NOT NULL,
  `css_save_button_background_color` varchar(10) NOT NULL,
  `css_save_button_background_hover_color` varchar(10) NOT NULL,
  `css_save_button_text_color` varchar(10) NOT NULL,
  `css_delete_button_background_color` varchar(10) NOT NULL,
  `css_delete_button_background_hover_color` varchar(10) NOT NULL,
  `css_delete_button_text_color` varchar(10) NOT NULL,
  `list_filter_dropdown` tinyint(1) NOT NULL,
  `related_modal_active` tinyint(1) NOT NULL,
  `related_modal_background_color` varchar(10) NOT NULL,
  `related_modal_rounded_corners` tinyint(1) NOT NULL,
  `logo_color` varchar(10) NOT NULL,
  `recent_actions_visible` tinyint(1) NOT NULL,
  `favicon` varchar(100) NOT NULL,
  `related_modal_background_opacity` varchar(5) NOT NULL,
  `env_name` varchar(50) NOT NULL,
  `env_visible_in_header` tinyint(1) NOT NULL,
  `env_color` varchar(10) NOT NULL,
  `env_visible_in_favicon` tinyint(1) NOT NULL,
  `related_modal_close_button_visible` tinyint(1) NOT NULL,
  `language_chooser_active` tinyint(1) NOT NULL,
  `language_chooser_display` varchar(10) NOT NULL,
  `list_filter_sticky` tinyint(1) NOT NULL,
  `form_pagination_sticky` tinyint(1) NOT NULL,
  `form_submit_sticky` tinyint(1) NOT NULL,
  `css_module_background_selected_color` varchar(10) NOT NULL,
  `css_module_link_selected_color` varchar(10) NOT NULL,
  `logo_max_height` smallint(5) UNSIGNED NOT NULL CHECK (`logo_max_height` >= 0),
  `logo_max_width` smallint(5) UNSIGNED NOT NULL CHECK (`logo_max_width` >= 0),
  `foldable_apps` tinyint(1) NOT NULL,
  `language_chooser_control` varchar(20) NOT NULL,
  `list_filter_highlight` tinyint(1) NOT NULL,
  `list_filter_removal_links` tinyint(1) NOT NULL,
  `show_fieldsets_as_tabs` tinyint(1) NOT NULL,
  `show_inlines_as_tabs` tinyint(1) NOT NULL,
  `css_generic_link_active_color` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `admin_interface_theme`
--

INSERT INTO `admin_interface_theme` (`id`, `name`, `active`, `title`, `title_visible`, `logo`, `logo_visible`, `css_header_background_color`, `title_color`, `css_header_text_color`, `css_header_link_color`, `css_header_link_hover_color`, `css_module_background_color`, `css_module_text_color`, `css_module_link_color`, `css_module_link_hover_color`, `css_module_rounded_corners`, `css_generic_link_color`, `css_generic_link_hover_color`, `css_save_button_background_color`, `css_save_button_background_hover_color`, `css_save_button_text_color`, `css_delete_button_background_color`, `css_delete_button_background_hover_color`, `css_delete_button_text_color`, `list_filter_dropdown`, `related_modal_active`, `related_modal_background_color`, `related_modal_rounded_corners`, `logo_color`, `recent_actions_visible`, `favicon`, `related_modal_background_opacity`, `env_name`, `env_visible_in_header`, `env_color`, `env_visible_in_favicon`, `related_modal_close_button_visible`, `language_chooser_active`, `language_chooser_display`, `list_filter_sticky`, `form_pagination_sticky`, `form_submit_sticky`, `css_module_background_selected_color`, `css_module_link_selected_color`, `logo_max_height`, `logo_max_width`, `foldable_apps`, `language_chooser_control`, `list_filter_highlight`, `list_filter_removal_links`, `show_fieldsets_as_tabs`, `show_inlines_as_tabs`, `css_generic_link_active_color`) VALUES
(1, 'Django', 1, 'Administración de Django', 1, '', 1, '#0C4B33', '#F5DD5D', '#44B78B', '#FFFFFF', '#C9F0DD', '#44B78B', '#FFFFFF', '#FFFFFF', '#C9F0DD', 1, '#0C3C26', '#156641', '#0C4B33', '#0C3C26', '#FFFFFF', '#BA2121', '#A41515', '#FFFFFF', 1, 1, '#000000', 1, '#FFFFFF', 1, '', '0.3', '', 1, '#E74C3C', 1, 1, 1, 'code', 1, 0, 0, '#FFFFCC', '#FFFFFF', 100, 400, 1, 'default-select', 1, 0, 0, 0, '#29B864');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `auth_group`
--

INSERT INTO `auth_group` (`id`, `name`) VALUES
(3, 'administradores'),
(2, 'cliente'),
(1, 'vendedor');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `auth_group_permissions`
--

INSERT INTO `auth_group_permissions` (`id`, `group_id`, `permission_id`) VALUES
(1, 1, 29),
(2, 1, 30),
(3, 1, 31),
(4, 1, 32),
(5, 1, 33),
(6, 1, 34),
(7, 1, 35),
(8, 1, 36),
(9, 1, 37),
(10, 1, 38),
(11, 1, 39),
(12, 1, 40),
(13, 1, 41),
(14, 1, 42),
(15, 1, 43),
(16, 1, 44),
(17, 1, 45),
(18, 1, 46),
(19, 1, 47),
(20, 1, 48),
(21, 1, 49),
(22, 1, 50),
(23, 1, 51),
(24, 1, 52),
(25, 1, 53),
(26, 1, 54),
(27, 1, 55),
(28, 1, 56),
(29, 2, 36),
(30, 2, 45),
(31, 2, 46),
(32, 2, 47),
(33, 2, 48),
(34, 3, 1),
(35, 3, 2),
(36, 3, 3),
(37, 3, 4),
(38, 3, 5),
(39, 3, 6),
(40, 3, 7),
(41, 3, 8),
(42, 3, 9),
(43, 3, 10),
(44, 3, 11),
(45, 3, 12),
(46, 3, 13),
(47, 3, 14),
(48, 3, 15),
(49, 3, 16),
(50, 3, 17),
(51, 3, 18),
(52, 3, 19),
(53, 3, 20),
(54, 3, 21),
(55, 3, 22),
(56, 3, 23),
(57, 3, 24),
(58, 3, 25),
(59, 3, 26),
(60, 3, 27),
(61, 3, 28),
(62, 3, 29),
(63, 3, 30),
(64, 3, 31),
(65, 3, 32),
(66, 3, 33),
(67, 3, 34),
(68, 3, 35),
(69, 3, 36),
(70, 3, 37),
(71, 3, 38),
(72, 3, 39),
(73, 3, 40),
(74, 3, 41),
(75, 3, 42),
(76, 3, 43),
(77, 3, 44),
(78, 3, 45),
(79, 3, 46),
(80, 3, 47),
(81, 3, 48),
(82, 3, 49),
(83, 3, 50),
(84, 3, 51),
(85, 3, 52),
(86, 3, 53),
(87, 3, 54),
(88, 3, 55),
(89, 3, 56),
(90, 3, 57),
(91, 3, 58),
(92, 3, 59),
(93, 3, 60);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add Theme', 1, 'add_theme'),
(2, 'Can change Theme', 1, 'change_theme'),
(3, 'Can delete Theme', 1, 'delete_theme'),
(4, 'Can view Theme', 1, 'view_theme'),
(5, 'Can add log entry', 2, 'add_logentry'),
(6, 'Can change log entry', 2, 'change_logentry'),
(7, 'Can delete log entry', 2, 'delete_logentry'),
(8, 'Can view log entry', 2, 'view_logentry'),
(9, 'Can add permission', 3, 'add_permission'),
(10, 'Can change permission', 3, 'change_permission'),
(11, 'Can delete permission', 3, 'delete_permission'),
(12, 'Can view permission', 3, 'view_permission'),
(13, 'Can add group', 4, 'add_group'),
(14, 'Can change group', 4, 'change_group'),
(15, 'Can delete group', 4, 'delete_group'),
(16, 'Can view group', 4, 'view_group'),
(17, 'Can add user', 5, 'add_user'),
(18, 'Can change user', 5, 'change_user'),
(19, 'Can delete user', 5, 'delete_user'),
(20, 'Can view user', 5, 'view_user'),
(21, 'Can add content type', 6, 'add_contenttype'),
(22, 'Can change content type', 6, 'change_contenttype'),
(23, 'Can delete content type', 6, 'delete_contenttype'),
(24, 'Can view content type', 6, 'view_contenttype'),
(25, 'Can add session', 7, 'add_session'),
(26, 'Can change session', 7, 'change_session'),
(27, 'Can delete session', 7, 'delete_session'),
(28, 'Can view session', 7, 'view_session'),
(29, 'Can add tipo producto', 8, 'add_tipoproducto'),
(30, 'Can change tipo producto', 8, 'change_tipoproducto'),
(31, 'Can delete tipo producto', 8, 'delete_tipoproducto'),
(32, 'Can view tipo producto', 8, 'view_tipoproducto'),
(33, 'Can add producto', 9, 'add_producto'),
(34, 'Can change producto', 9, 'change_producto'),
(35, 'Can delete producto', 9, 'delete_producto'),
(36, 'Can view producto', 9, 'view_producto'),
(37, 'Can add cliente', 10, 'add_cliente'),
(38, 'Can change cliente', 10, 'change_cliente'),
(39, 'Can delete cliente', 10, 'delete_cliente'),
(40, 'Can view cliente', 10, 'view_cliente'),
(41, 'Can add compras', 11, 'add_compras'),
(42, 'Can change compras', 11, 'change_compras'),
(43, 'Can delete compras', 11, 'delete_compras'),
(44, 'Can view compras', 11, 'view_compras'),
(45, 'Can add carrito', 12, 'add_carrito'),
(46, 'Can change carrito', 12, 'change_carrito'),
(47, 'Can delete carrito', 12, 'delete_carrito'),
(48, 'Can view carrito', 12, 'view_carrito'),
(49, 'Can add suscripcion', 13, 'add_suscripcion'),
(50, 'Can change suscripcion', 13, 'change_suscripcion'),
(51, 'Can delete suscripcion', 13, 'delete_suscripcion'),
(52, 'Can view suscripcion', 13, 'view_suscripcion'),
(53, 'Can add tipo suscripcion', 14, 'add_tiposuscripcion'),
(54, 'Can change tipo suscripcion', 14, 'change_tiposuscripcion'),
(55, 'Can delete tipo suscripcion', 14, 'delete_tiposuscripcion'),
(56, 'Can view tipo suscripcion', 14, 'view_tiposuscripcion'),
(57, 'Can add tipo estado', 15, 'add_tipoestado'),
(58, 'Can change tipo estado', 15, 'change_tipoestado'),
(59, 'Can delete tipo estado', 15, 'delete_tipoestado'),
(60, 'Can view tipo estado', 15, 'view_tipoestado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$216000$YZUkQNPiICpi$QwDiis9CcLLQ/kQpoJOaSQOyBKUuBxEDimGjZqyH5cc=', '2023-06-25 23:10:27.033060', 1, 'admin', '', '', 'ig.riffo@duocuc.cl', 1, 1, '2023-06-06 16:07:53.000000'),
(2, 'pbkdf2_sha256$216000$IsCvBD05n3Yg$9sz51HSHRVOuu/vDzzF6X20loOevACXDXwgZs9OnsHY=', '2023-06-13 17:12:11.165534', 0, 'vendedor', '', '', '', 0, 1, '2023-06-13 16:59:25.000000'),
(3, 'pbkdf2_sha256$216000$QdlvaRAO11Zw$3sTDzeT1joJUU+brouk9yO10o0pNCPOuwAIxZ8sY/ok=', '2023-06-13 17:11:47.112576', 0, 'cliente', '', '', '', 0, 1, '2023-06-13 16:59:52.000000'),
(4, 'pbkdf2_sha256$216000$eEuNOJyumPTi$LzMzal9EjTvmQvksxoKLYR/jJTpyTOz6NMURy7LhUSg=', '2023-06-25 23:08:01.097917', 0, 'administrador', '', '', '', 0, 1, '2023-06-13 17:00:13.000000'),
(14, 'pbkdf2_sha256$216000$OSRqkbmERhp9$Z5K0tYmYDfKwmpuATVC1eb1p1F7410LZ1lHgDbEG3H8=', '2023-06-25 23:03:24.333302', 0, 'ignacio', '', '', 'ignacio.drp@gmail.com', 0, 1, '2023-06-25 05:20:45.782738');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `auth_user_groups`
--

INSERT INTO `auth_user_groups` (`id`, `user_id`, `group_id`) VALUES
(4, 1, 1),
(5, 1, 2),
(6, 1, 3),
(3, 2, 1),
(1, 3, 2),
(2, 4, 3),
(9, 14, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_carrito`
--

CREATE TABLE `core_carrito` (
  `id` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `vigente` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `core_carrito`
--

INSERT INTO `core_carrito` (`id`, `cliente_id`, `cantidad`, `producto_id`, `vigente`) VALUES
(14, 1, 2, 23, 0),
(20, 1, 2, 22, 0),
(21, 1, 1, 21, 0),
(26, 1, 2, 24, 0),
(27, 1, 1, 26, 0),
(29, 14, 1, 22, 0),
(30, 14, 1, 21, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_cliente`
--

CREATE TABLE `core_cliente` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `usuario` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_compras`
--

CREATE TABLE `core_compras` (
  `id` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `contacto` varchar(50) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `carrito_id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `estado_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `core_compras`
--

INSERT INTO `core_compras` (`id`, `cliente_id`, `contacto`, `direccion`, `carrito_id`, `fecha`, `estado_id`) VALUES
(1, 1, '968372902', 'Av las nieves 02196', 14, '2023-06-24', 2),
(2, 1, '968372902', 'Av las nieves 02196', 20, '2023-06-24', 2),
(3, 1, '968372902', 'Av las nieves 02196', 21, '2023-06-24', 1),
(5, 1, '968372902', 'Av las nieves 02196', 26, '2023-06-25', 1),
(6, 1, '968372902', 'Av las nieves 02196', 27, '2023-06-25', 3),
(7, 14, '968372902', 'Av las nieves 02196', 29, '2023-06-25', 1),
(8, 14, '968372902', 'Av las nieves 02196', 30, '2023-06-25', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_producto`
--

CREATE TABLE `core_producto` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `precio` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `descripcion` varchar(250) NOT NULL,
  `tipo_id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  `vigente` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `core_producto`
--

INSERT INTO `core_producto` (`id`, `nombre`, `precio`, `stock`, `descripcion`, `tipo_id`, `fecha`, `imagen`, `vigente`) VALUES
(21, 'Collar Martingale WhiteOwl', 700, 21, 'Collar para perros anti tirones con diseño de líneas en blanco y negro Tela hecha de poliéster Gancho de acero Tela suave para cuidar el cuello de tu perro', 6, '2023-06-20', 'collarblanco_PkjUdVj.jpg', 1),
(22, 'Arnes H Hawkins Stranger Things', 900, 15, 'Arnes en H para Perros. opción agradable y ligera para las caminatas diarias. Tiene dos anillos en D en la parte posterior disponibles para sujetar la correa.', 6, '2023-06-20', 'arnesverdedog_MkfqPVU.jpg', 1),
(23, 'Arnés HexCam', 800, 16, 'Arnés para perros con diseño de camuflaje verde y gris. Tela hecha de poliéster. Ganchos de acero. Tela suave para cuidar el cuello de tu perro.', 6, '2023-06-20', 'arnes_wolf_zORd7sT.png', 1),
(24, 'Arnés H Blocks', 1200, 15, 'Arnes en H para Perros. opción agradable y ligera para las caminatas diarias. Tiene dos anillos en D en la parte posterior disponibles para sujetar la correa.', 6, '2023-06-20', 'blocks_2_h_harness_YgEw8aT.jpg', 1),
(25, 'Collar Atlanta', 1300, 16, 'Es un collar para perros totalmente ajustable, súper suave en el pelaje y está hecho de poliéster duradero, La hebilla tiene un sistema de bloqueo de 4 puntos para mayor seguridad', 6, '2023-06-20', 'Zeedog___Atlanta_Collar_ioJzS8u.png', 1),
(26, 'Arnés y Correa Pink Gato', 1300, 15, 'El arnés es totalmente ajustable, suave para el pelaje de su gato y tiene nuestra famosa hebilla de bloqueo de 4 puntos para mayor seguridad. La correa es súper cómoda en las manos y tiene un gancho liviano que hace que tu gato pasee con facilidad.', 6, '2023-06-20', 'CorreaLedGato_rWnzdzj.jpg', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_suscripcion`
--

CREATE TABLE `core_suscripcion` (
  `id` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `suscripcion_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `core_suscripcion`
--

INSERT INTO `core_suscripcion` (`id`, `cliente_id`, `suscripcion_id`) VALUES
(7, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_tipoestado`
--

CREATE TABLE `core_tipoestado` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `core_tipoestado`
--

INSERT INTO `core_tipoestado` (`id`, `descripcion`) VALUES
(1, 'Validación'),
(2, 'Preparación'),
(3, 'Reparto'),
(4, 'Entregado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_tipoproducto`
--

CREATE TABLE `core_tipoproducto` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `core_tipoproducto`
--

INSERT INTO `core_tipoproducto` (`id`, `descripcion`) VALUES
(6, 'Collar'),
(7, 'Placa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_tiposuscripcion`
--

CREATE TABLE `core_tiposuscripcion` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `precio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `core_tiposuscripcion`
--

INSERT INTO `core_tiposuscripcion` (`id`, `nombre`, `precio`) VALUES
(1, 'Basica', 5000),
(2, 'Intermedia', 15000),
(3, 'Alta', 30000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2023-06-06 16:09:53.889425', '1', 'Collar', 1, '[{\"added\": {}}]', 8, 1),
(2, '2023-06-06 16:11:03.746684', '1', 'Collar Martingale WhiteOwl', 1, '[{\"added\": {}}]', 9, 1),
(3, '2023-06-06 16:29:47.922837', '2', 'Arnes H Hawkins Stranger Things', 1, '[{\"added\": {}}]', 9, 1),
(4, '2023-06-06 16:30:41.003798', '3', 'Gotham Cat Collar', 1, '[{\"added\": {}}]', 9, 1),
(5, '2023-06-06 16:32:28.828902', '4', 'Collar Atlanta', 1, '[{\"added\": {}}]', 9, 1),
(6, '2023-06-06 16:33:57.567147', '5', 'Arnés H Blocks', 1, '[{\"added\": {}}]', 9, 1),
(7, '2023-06-06 16:36:47.053090', '6', 'Arnés Comfort HexCamo', 1, '[{\"added\": {}}]', 9, 1),
(8, '2023-06-06 16:40:02.742960', '7', 'Arnés Multiuso Negro', 1, '[{\"added\": {}}]', 9, 1),
(9, '2023-06-06 16:42:14.214300', '8', 'Prisma Cat Collar', 1, '[{\"added\": {}}]', 9, 1),
(10, '2023-06-06 16:42:29.104457', '8', 'Prisma Cat Collar', 2, '[{\"changed\": {\"fields\": [\"Vigente\"]}}]', 9, 1),
(11, '2023-06-06 16:42:56.408348', '8', 'Prisma Cat Collar', 3, '', 9, 1),
(12, '2023-06-06 17:20:31.508214', '9', 'Arnés y Correa Pink Led Gato', 1, '[{\"added\": {}}]', 9, 1),
(13, '2023-06-06 17:25:13.489486', '2', 'Bandana', 1, '[{\"added\": {}}]', 8, 1),
(14, '2023-06-06 17:26:01.773570', '10', 'Bandana Azul', 1, '[{\"added\": {}}]', 9, 1),
(15, '2023-06-06 17:27:29.779755', '11', 'Bandana Fucsia', 1, '[{\"added\": {}}]', 9, 1),
(16, '2023-06-06 17:30:07.636993', '12', 'Bandana Hunter Nola', 1, '[{\"added\": {}}]', 9, 1),
(17, '2023-06-06 17:33:03.258791', '13', 'Placa Hueso Azul', 1, '[{\"added\": {}}]', 9, 1),
(18, '2023-06-06 17:33:22.353126', '3', 'Placa', 1, '[{\"added\": {}}]', 8, 1),
(19, '2023-06-06 17:33:30.018100', '13', 'Placa Hueso Azul', 2, '[{\"changed\": {\"fields\": [\"Tipo\"]}}]', 9, 1),
(20, '2023-06-06 17:40:33.374922', '15', 'Placa Coffee', 1, '[{\"added\": {}}]', 9, 1),
(21, '2023-06-13 16:57:11.795764', '1', 'vendedor', 1, '[{\"added\": {}}]', 4, 1),
(22, '2023-06-13 16:57:57.928033', '2', 'cliente', 1, '[{\"added\": {}}]', 4, 1),
(23, '2023-06-13 16:58:21.750757', '3', 'administradores', 1, '[{\"added\": {}}]', 4, 1),
(24, '2023-06-13 16:59:25.406470', '2', 'vendedor', 1, '[{\"added\": {}}]', 5, 1),
(25, '2023-06-13 16:59:52.241622', '3', 'cliente', 1, '[{\"added\": {}}]', 5, 1),
(26, '2023-06-13 17:00:14.090275', '4', 'administrador', 1, '[{\"added\": {}}]', 5, 1),
(27, '2023-06-13 17:00:39.625015', '3', 'cliente', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 5, 1),
(28, '2023-06-13 17:00:48.324989', '4', 'administrador', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 5, 1),
(29, '2023-06-13 17:00:54.595685', '2', 'vendedor', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 5, 1),
(30, '2023-06-13 17:13:21.410607', '1', 'admin', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 5, 1),
(31, '2023-06-15 18:26:11.038066', '2', 'Arnes H Hawkins Stranger Things', 2, '[{\"changed\": {\"fields\": [\"Stock\"]}}]', 9, 1),
(32, '2023-06-15 18:41:58.193693', '2', 'Arnes H Hawkins Stranger Things', 2, '[{\"changed\": {\"fields\": [\"Stock\"]}}]', 9, 1),
(33, '2023-06-19 00:22:32.057305', '15', 'Placa Coffee', 3, '', 9, 1),
(34, '2023-06-19 00:23:15.501435', '14', 'Placa Bandera \"My Family\" Francia', 3, '', 9, 1),
(35, '2023-06-19 00:23:15.505625', '13', 'Placa Hueso Azul', 3, '', 9, 1),
(36, '2023-06-19 00:23:15.513505', '12', 'Bandana Hunter Nola', 3, '', 9, 1),
(37, '2023-06-19 00:23:15.518667', '11', 'Bandana Fucsia', 3, '', 9, 1),
(38, '2023-06-19 00:23:15.525168', '10', 'Bandana Azul', 3, '', 9, 1),
(39, '2023-06-19 00:23:15.530027', '9', 'Arnés y Correa Pink Led Gato', 3, '', 9, 1),
(40, '2023-06-19 00:23:15.545020', '7', 'Arnés Multiuso Negro', 3, '', 9, 1),
(41, '2023-06-19 00:23:15.550213', '6', 'Arnés Comfort HexCamo', 3, '', 9, 1),
(42, '2023-06-19 00:23:15.554467', '5', 'Arnés H Blocks', 3, '', 9, 1),
(43, '2023-06-19 00:23:15.560440', '4', 'Collar Atlanta', 3, '', 9, 1),
(44, '2023-06-19 00:23:19.956497', '3', 'Gotham Cat Collar', 3, '', 9, 1),
(45, '2023-06-19 00:23:19.960513', '2', 'Arnes H Hawkins Stranger Things', 3, '', 9, 1),
(46, '2023-06-19 00:23:19.965509', '1', 'Collar Martingale WhiteOwl', 3, '', 9, 1),
(47, '2023-06-19 01:16:07.774922', '3', 'Placa', 3, '', 8, 1),
(48, '2023-06-19 01:16:07.784305', '2', 'Bandana', 3, '', 8, 1),
(49, '2023-06-19 01:16:07.788318', '1', 'Collar', 3, '', 8, 1),
(50, '2023-06-19 01:16:27.545547', '4', 'Poleron', 1, '[{\"added\": {}}]', 8, 1),
(51, '2023-06-19 01:16:33.630377', '5', 'Polera', 1, '[{\"added\": {}}]', 8, 1),
(52, '2023-06-19 01:17:32.388065', '16', '\"Flowery Vibes\" Negro', 1, '[{\"added\": {}}]', 9, 1),
(53, '2023-06-19 01:20:23.008062', '17', '\"From the hood\" Negro', 1, '[{\"added\": {}}]', 9, 1),
(54, '2023-06-19 01:21:03.675889', '18', '\"From the hood\" Verde', 1, '[{\"added\": {}}]', 9, 1),
(55, '2023-06-19 01:21:56.571108', '19', '\"Stodak Vision\"', 1, '[{\"added\": {}}]', 9, 1),
(56, '2023-06-19 01:23:24.326731', '20', '\"Angel\" Cafe', 1, '[{\"added\": {}}]', 9, 1),
(57, '2023-06-20 15:32:30.623649', '20', '\"Angel\" Cafe', 3, '', 9, 1),
(58, '2023-06-20 15:32:39.105330', '19', '\"Stodak Vision\"', 3, '', 9, 1),
(59, '2023-06-20 15:40:57.800362', '18', '\"From the hood\" Verde', 3, '', 9, 1),
(60, '2023-06-20 15:40:57.808399', '17', '\"From the hood\" Negro', 3, '', 9, 1),
(61, '2023-06-20 15:40:57.812393', '16', '\"Flowery Vibes\" Negro', 3, '', 9, 1),
(62, '2023-06-20 15:44:29.009092', '5', 'Polera', 3, '', 8, 1),
(63, '2023-06-20 15:44:29.013977', '4', 'Poleron', 3, '', 8, 1),
(64, '2023-06-20 15:44:41.814581', '6', 'Collar', 1, '[{\"added\": {}}]', 8, 1),
(65, '2023-06-20 15:44:58.199516', '7', 'Placa', 1, '[{\"added\": {}}]', 8, 1),
(66, '2023-06-20 15:53:28.004164', '21', 'Collar Martingale WhiteOwl', 1, '[{\"added\": {}}]', 9, 1),
(67, '2023-06-20 15:54:16.854583', '22', 'Arnes H Hawkins Stranger Things', 1, '[{\"added\": {}}]', 9, 1),
(68, '2023-06-20 15:55:45.632193', '23', 'Arnés HexCam', 1, '[{\"added\": {}}]', 9, 1),
(69, '2023-06-20 15:57:23.221717', '24', 'Arnés H Blocks', 1, '[{\"added\": {}}]', 9, 1),
(70, '2023-06-20 15:58:24.016701', '25', 'Collar Atlanta', 1, '[{\"added\": {}}]', 9, 1),
(71, '2023-06-20 15:59:20.757393', '26', 'Arnés y Correa Pink Gato', 1, '[{\"added\": {}}]', 9, 1),
(72, '2023-06-24 05:12:43.535733', '14', 'admin', 2, '[{\"changed\": {\"fields\": [\"Cantidad\"]}}]', 12, 1),
(73, '2023-06-24 05:22:39.138629', '1', 'Inicial', 1, '[{\"added\": {}}]', 15, 1),
(74, '2023-06-24 05:22:59.357137', '2', 'Solicitud Recibida', 1, '[{\"added\": {}}]', 15, 1),
(75, '2023-06-24 05:23:09.544649', '3', 'En Preparacion', 1, '[{\"added\": {}}]', 15, 1),
(76, '2023-06-24 05:23:17.498515', '4', 'En Camino', 1, '[{\"added\": {}}]', 15, 1),
(77, '2023-06-24 05:23:24.583277', '5', 'Entregado', 1, '[{\"added\": {}}]', 15, 1),
(78, '2023-06-24 05:27:34.081616', '21', 'admin', 2, '[{\"changed\": {\"fields\": [\"Vigente\"]}}]', 12, 1),
(79, '2023-06-24 05:27:34.097215', '20', 'admin', 2, '[{\"changed\": {\"fields\": [\"Vigente\"]}}]', 12, 1),
(80, '2023-06-24 05:27:34.109301', '14', 'admin', 2, '[{\"changed\": {\"fields\": [\"Vigente\"]}}]', 12, 1),
(81, '2023-06-24 05:29:06.410110', '21', 'admin', 2, '[{\"changed\": {\"fields\": [\"Vigente\"]}}]', 12, 1),
(82, '2023-06-24 05:29:15.372698', '14', 'admin', 2, '[{\"changed\": {\"fields\": [\"Vigente\"]}}]', 12, 1),
(83, '2023-06-24 05:29:26.766026', '21', 'admin', 2, '[{\"changed\": {\"fields\": [\"Vigente\"]}}]', 12, 1),
(84, '2023-06-24 05:29:26.775016', '14', 'admin', 2, '[{\"changed\": {\"fields\": [\"Vigente\"]}}]', 12, 1),
(85, '2023-06-24 05:31:22.573364', '1', 'admin', 1, '[{\"added\": {}}]', 11, 1),
(86, '2023-06-24 05:31:57.667279', '2', 'admin', 1, '[{\"added\": {}}]', 11, 1),
(87, '2023-06-24 05:32:11.568043', '3', 'admin', 1, '[{\"added\": {}}]', 11, 1),
(88, '2023-06-24 05:37:33.321413', '2', 'admin', 2, '[{\"changed\": {\"fields\": [\"Estado\"]}}]', 11, 1),
(89, '2023-06-24 05:37:33.347134', '1', 'admin', 2, '[{\"changed\": {\"fields\": [\"Estado\"]}}]', 11, 1),
(90, '2023-06-24 07:17:28.779841', '1', 'Validación', 2, '[{\"changed\": {\"fields\": [\"Descripcion\"]}}]', 15, 1),
(91, '2023-06-24 07:17:42.780893', '2', 'Preparación', 2, '[{\"changed\": {\"fields\": [\"Descripcion\"]}}]', 15, 1),
(92, '2023-06-24 07:17:58.303649', '3', 'Reparto', 2, '[{\"changed\": {\"fields\": [\"Descripcion\"]}}]', 15, 1),
(93, '2023-06-24 07:18:18.921656', '5', 'Entregado', 3, '', 15, 1),
(94, '2023-06-24 07:18:24.200200', '4', 'Entregado', 2, '[{\"changed\": {\"fields\": [\"Descripcion\"]}}]', 15, 1),
(95, '2023-06-25 03:21:42.471428', '3', 'administradores', 2, '[{\"changed\": {\"fields\": [\"Permissions\"]}}]', 4, 1),
(96, '2023-06-25 04:03:40.109861', '5', 'cliente2', 3, '', 5, 1),
(97, '2023-06-25 04:13:43.041490', '6', 'cliente2', 3, '', 5, 1),
(98, '2023-06-25 04:14:45.269899', '7', 'cliente2', 3, '', 5, 1),
(99, '2023-06-25 05:09:02.067359', '9', 'ignacio', 3, '', 5, 1),
(100, '2023-06-25 05:09:06.272253', '8', 'cliente2', 3, '', 5, 1),
(101, '2023-06-25 05:10:54.850773', '10', 'ignacio', 3, '', 5, 1),
(102, '2023-06-25 05:15:22.252111', '11', 'ignacio', 3, '', 5, 1),
(103, '2023-06-25 05:17:32.600860', '12', 'ignacio', 3, '', 5, 1),
(104, '2023-06-25 05:20:02.518227', '13', 'ignacio', 3, '', 5, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(2, 'admin', 'logentry'),
(1, 'admin_interface', 'theme'),
(4, 'auth', 'group'),
(3, 'auth', 'permission'),
(5, 'auth', 'user'),
(6, 'contenttypes', 'contenttype'),
(12, 'core', 'carrito'),
(10, 'core', 'cliente'),
(11, 'core', 'compras'),
(9, 'core', 'producto'),
(13, 'core', 'suscripcion'),
(15, 'core', 'tipoestado'),
(8, 'core', 'tipoproducto'),
(14, 'core', 'tiposuscripcion'),
(7, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-06-06 16:03:24.677056'),
(2, 'auth', '0001_initial', '2023-06-06 16:03:24.955806'),
(3, 'admin', '0001_initial', '2023-06-06 16:03:25.662671'),
(4, 'admin', '0002_logentry_remove_auto_add', '2023-06-06 16:03:25.829052'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-06-06 16:03:25.843605'),
(6, 'admin_interface', '0001_initial', '2023-06-06 16:03:25.945328'),
(7, 'admin_interface', '0002_add_related_modal', '2023-06-06 16:03:26.111307'),
(8, 'admin_interface', '0003_add_logo_color', '2023-06-06 16:03:26.161086'),
(9, 'admin_interface', '0004_rename_title_color', '2023-06-06 16:03:26.186898'),
(10, 'admin_interface', '0005_add_recent_actions_visible', '2023-06-06 16:03:26.276056'),
(11, 'admin_interface', '0006_bytes_to_str', '2023-06-06 16:03:26.392394'),
(12, 'admin_interface', '0007_add_favicon', '2023-06-06 16:03:26.468717'),
(13, 'admin_interface', '0008_change_related_modal_background_opacity_type', '2023-06-06 16:03:26.531958'),
(14, 'admin_interface', '0009_add_enviroment', '2023-06-06 16:03:26.615178'),
(15, 'admin_interface', '0010_add_localization', '2023-06-06 16:03:26.686158'),
(16, 'admin_interface', '0011_add_environment_options', '2023-06-06 16:03:26.819681'),
(17, 'admin_interface', '0012_update_verbose_names', '2023-06-06 16:03:26.837158'),
(18, 'admin_interface', '0013_add_related_modal_close_button', '2023-06-06 16:03:26.884910'),
(19, 'admin_interface', '0014_name_unique', '2023-06-06 16:03:26.921478'),
(20, 'admin_interface', '0015_add_language_chooser_active', '2023-06-06 16:03:26.986521'),
(21, 'admin_interface', '0016_add_language_chooser_display', '2023-06-06 16:03:27.024575'),
(22, 'admin_interface', '0017_change_list_filter_dropdown', '2023-06-06 16:03:27.035563'),
(23, 'admin_interface', '0018_theme_list_filter_sticky', '2023-06-06 16:03:27.074271'),
(24, 'admin_interface', '0019_add_form_sticky', '2023-06-06 16:03:27.154995'),
(25, 'admin_interface', '0020_module_selected_colors', '2023-06-06 16:03:27.237275'),
(26, 'admin_interface', '0021_file_extension_validator', '2023-06-06 16:03:27.253515'),
(27, 'admin_interface', '0022_add_logo_max_width_and_height', '2023-06-06 16:03:27.330033'),
(28, 'admin_interface', '0023_theme_foldable_apps', '2023-06-06 16:03:27.367950'),
(29, 'admin_interface', '0024_remove_theme_css', '2023-06-06 16:03:27.391622'),
(30, 'admin_interface', '0025_theme_language_chooser_control', '2023-06-06 16:03:27.431446'),
(31, 'admin_interface', '0026_theme_list_filter_highlight', '2023-06-06 16:03:27.470000'),
(32, 'admin_interface', '0027_theme_list_filter_removal_links', '2023-06-06 16:03:27.509328'),
(33, 'admin_interface', '0028_theme_show_fieldsets_as_tabs_and_more', '2023-06-06 16:03:27.607274'),
(34, 'admin_interface', '0029_theme_css_generic_link_active_color', '2023-06-06 16:03:27.646267'),
(35, 'contenttypes', '0002_remove_content_type_name', '2023-06-06 16:03:27.750155'),
(36, 'auth', '0002_alter_permission_name_max_length', '2023-06-06 16:03:27.844988'),
(37, 'auth', '0003_alter_user_email_max_length', '2023-06-06 16:03:27.876307'),
(38, 'auth', '0004_alter_user_username_opts', '2023-06-06 16:03:27.893467'),
(39, 'auth', '0005_alter_user_last_login_null', '2023-06-06 16:03:27.967027'),
(40, 'auth', '0006_require_contenttypes_0002', '2023-06-06 16:03:27.979653'),
(41, 'auth', '0007_alter_validators_add_error_messages', '2023-06-06 16:03:27.997674'),
(42, 'auth', '0008_alter_user_username_max_length', '2023-06-06 16:03:28.028508'),
(43, 'auth', '0009_alter_user_last_name_max_length', '2023-06-06 16:03:28.057486'),
(44, 'auth', '0010_alter_group_name_max_length', '2023-06-06 16:03:28.087485'),
(45, 'auth', '0011_update_proxy_permissions', '2023-06-06 16:03:28.107487'),
(46, 'auth', '0012_alter_user_first_name_max_length', '2023-06-06 16:03:28.135494'),
(47, 'core', '0001_initial', '2023-06-06 16:03:28.227624'),
(48, 'core', '0002_auto_20230502_1237', '2023-06-06 16:03:28.769451'),
(49, 'core', '0003_carrito_cliente_compras', '2023-06-06 16:03:28.904964'),
(50, 'core', '0004_auto_20230509_1324', '2023-06-06 16:03:29.308874'),
(51, 'core', '0005_auto_20230511_1147', '2023-06-06 16:03:29.490106'),
(52, 'core', '0006_auto_20230516_1328', '2023-06-06 16:03:29.651998'),
(53, 'core', '0007_auto_20230518_1154', '2023-06-06 16:03:29.758805'),
(54, 'core', '0008_cliente_usuario', '2023-06-06 16:03:29.970153'),
(55, 'core', '0009_auto_20230518_1252', '2023-06-06 16:03:30.186202'),
(56, 'core', '0010_auto_20230518_1254', '2023-06-06 16:03:30.220560'),
(57, 'core', '0011_auto_20230519_0043', '2023-06-06 16:03:30.358680'),
(58, 'core', '0012_auto_20230519_0048', '2023-06-06 16:03:30.479221'),
(59, 'core', '0013_auto_20230519_0055', '2023-06-06 16:03:30.777410'),
(60, 'core', '0014_suscripcion', '2023-06-06 16:03:30.822764'),
(61, 'core', '0015_auto_20230521_0023', '2023-06-06 16:03:31.137186'),
(62, 'core', '0016_auto_20230521_2128', '2023-06-06 16:03:31.301969'),
(63, 'sessions', '0001_initial', '2023-06-06 16:03:31.357174'),
(64, 'core', '0017_auto_20230615_1215', '2023-06-15 16:15:33.618408'),
(65, 'core', '0018_auto_20230624_0045', '2023-06-24 04:45:50.665616'),
(66, 'core', '0019_auto_20230624_0111', '2023-06-24 05:11:12.438803'),
(67, 'core', '0020_tipoestado', '2023-06-24 05:22:01.283912'),
(68, 'core', '0021_compras_estado', '2023-06-24 05:36:55.981597');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('xm3an5cvzfkpcuahma7x6jp40425kid1', '.eJxVjMsOgjAQRf-la9PQoYWOS_d-A7nTh6CmJBRWxn9XEha6veec-1IDtnUctpqWYYrqrIw6_W6C8EhlB_GOcpt1mMu6TKJ3RR-06usc0_NyuH8HI-r4rdlSQ9llYQ8KDTrTGoPA2ffkXQsOuZfGJXjLmZnISUYnhASLFDv1_gDXEDg0:1qDYsF:bJ_tBlfnNy3H8bP9OCoTx6QgGizG82k56qVkJOAaNCI', '2023-07-09 23:10:27.037045');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `admin_interface_theme`
--
ALTER TABLE `admin_interface_theme`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_interface_theme_name_30bda70f_uniq` (`name`);

--
-- Indices de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indices de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indices de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indices de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `core_carrito`
--
ALTER TABLE `core_carrito`
  ADD PRIMARY KEY (`id`),
  ADD KEY `core_carrito_cliente_id_8efb49fb` (`cliente_id`),
  ADD KEY `core_carrito_producto_id_f9c36034_fk_core_producto_id` (`producto_id`);

--
-- Indices de la tabla `core_cliente`
--
ALTER TABLE `core_cliente`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `core_cliente_usuario_f7f8d44c_uniq` (`usuario`);

--
-- Indices de la tabla `core_compras`
--
ALTER TABLE `core_compras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `core_compras_cliente_id_99141636_fk_core_cliente_id` (`cliente_id`),
  ADD KEY `core_compras_carrito_id_2028d125_fk_core_carrito_id` (`carrito_id`),
  ADD KEY `core_compras_estado_id_06186e32_fk_core_tipoestado_id` (`estado_id`);

--
-- Indices de la tabla `core_producto`
--
ALTER TABLE `core_producto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `core_producto_tipo_id_e0e92ad1_fk` (`tipo_id`);

--
-- Indices de la tabla `core_suscripcion`
--
ALTER TABLE `core_suscripcion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `core_suscripcion_cliente_id_b012260a_fk_core_cliente_id` (`cliente_id`),
  ADD KEY `core_suscripcion_suscripcion_id_6a460276_fk_core_tipo` (`suscripcion_id`);

--
-- Indices de la tabla `core_tipoestado`
--
ALTER TABLE `core_tipoestado`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `core_tipoproducto`
--
ALTER TABLE `core_tipoproducto`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `core_tiposuscripcion`
--
ALTER TABLE `core_tiposuscripcion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indices de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indices de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `admin_interface_theme`
--
ALTER TABLE `admin_interface_theme`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `core_carrito`
--
ALTER TABLE `core_carrito`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `core_cliente`
--
ALTER TABLE `core_cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `core_compras`
--
ALTER TABLE `core_compras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `core_producto`
--
ALTER TABLE `core_producto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `core_suscripcion`
--
ALTER TABLE `core_suscripcion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `core_tipoestado`
--
ALTER TABLE `core_tipoestado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `core_tipoproducto`
--
ALTER TABLE `core_tipoproducto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `core_tiposuscripcion`
--
ALTER TABLE `core_tiposuscripcion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Filtros para la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Filtros para la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `core_carrito`
--
ALTER TABLE `core_carrito`
  ADD CONSTRAINT `core_carrito_cliente_id_8efb49fb_fk_auth_user_id` FOREIGN KEY (`cliente_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `core_carrito_producto_id_f9c36034_fk_core_producto_id` FOREIGN KEY (`producto_id`) REFERENCES `core_producto` (`id`);

--
-- Filtros para la tabla `core_compras`
--
ALTER TABLE `core_compras`
  ADD CONSTRAINT `core_compras_carrito_id_2028d125_fk_core_carrito_id` FOREIGN KEY (`carrito_id`) REFERENCES `core_carrito` (`id`),
  ADD CONSTRAINT `core_compras_cliente_id_99141636_fk_auth_user_id` FOREIGN KEY (`cliente_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `core_compras_estado_id_06186e32_fk_core_tipoestado_id` FOREIGN KEY (`estado_id`) REFERENCES `core_tipoestado` (`id`);

--
-- Filtros para la tabla `core_producto`
--
ALTER TABLE `core_producto`
  ADD CONSTRAINT `core_producto_tipo_id_e0e92ad1_fk` FOREIGN KEY (`tipo_id`) REFERENCES `core_tipoproducto` (`id`);

--
-- Filtros para la tabla `core_suscripcion`
--
ALTER TABLE `core_suscripcion`
  ADD CONSTRAINT `core_suscripcion_cliente_id_b012260a_fk_auth_user_id` FOREIGN KEY (`cliente_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `core_suscripcion_suscripcion_id_6a460276_fk_core_tipo` FOREIGN KEY (`suscripcion_id`) REFERENCES `core_tiposuscripcion` (`id`);

--
-- Filtros para la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
