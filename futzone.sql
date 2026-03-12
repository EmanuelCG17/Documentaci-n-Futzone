-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 26-02-2026 a las 13:55:18
-- Versión del servidor: 8.4.3
-- Versión de PHP: 8.3.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `futzone`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `arbitros`
--

CREATE TABLE `arbitros` (
  `id` int NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero_licencia` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefono` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `usuario_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `arbitros`
--

INSERT INTO `arbitros` (`id`, `nombre`, `numero_licencia`, `email`, `telefono`, `usuario_id`) VALUES
(6, 'Isabella Ochoa', NULL, 'ochoaisabella731@gmail.com', '3045214451', 55);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipos`
--

CREATE TABLE `equipos` (
  `id` int NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `usuario_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `equipos`
--

INSERT INTO `equipos` (`id`, `nombre`, `usuario_id`) VALUES
(12, 'DIM', 42),
(13, 'Atlético Nacional ', 43),
(14, 'Envigado FC', 44),
(15, 'Águilas Doradas', 48),
(16, 'Deportivo Cali', 50),
(17, 'América', 52),
(18, 'Santa Fe', 54);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipos_torneos`
--

CREATE TABLE `equipos_torneos` (
  `id` int NOT NULL,
  `equipo_id` int NOT NULL,
  `torneo_id` int NOT NULL,
  `fecha_inscripcion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `equipos_torneos`
--

INSERT INTO `equipos_torneos` (`id`, `equipo_id`, `torneo_id`, `fecha_inscripcion`) VALUES
(23, 12, 6, '2026-02-25 19:15:10'),
(24, 13, 6, '2026-02-25 19:15:40'),
(25, 14, 6, '2026-02-25 19:17:43'),
(26, 15, 6, '2026-02-25 19:18:09'),
(27, 16, 6, '2026-02-25 19:18:41'),
(28, 17, 6, '2026-02-25 19:19:16');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `goles`
--

CREATE TABLE `goles` (
  `id` int NOT NULL,
  `partido_id` int NOT NULL,
  `jugador_id` int NOT NULL,
  `equipo_id` int NOT NULL,
  `minuto` int DEFAULT NULL,
  `tipo` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `goles`
--

INSERT INTO `goles` (`id`, `partido_id`, `jugador_id`, `equipo_id`, `minuto`, `tipo`) VALUES
(51, 26, 23, 12, 15, 'normal'),
(52, 26, 28, 17, 14, 'normal'),
(53, 26, 28, 17, 54, 'penalty'),
(54, 26, 29, 12, 67, 'normal'),
(55, 26, 23, 12, 72, 'penalty'),
(56, 26, 28, 17, 90, 'normal'),
(57, 27, 24, 13, 15, 'normal'),
(58, 27, 32, 13, 26, 'normal'),
(59, 27, 27, 16, 38, 'normal'),
(60, 27, 27, 16, 88, 'own_goal');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jugadores`
--

CREATE TABLE `jugadores` (
  `id` int NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `apellido` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `posicion` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numero` int DEFAULT NULL,
  `equipo_id` int DEFAULT NULL,
  `usuario_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `jugadores`
--

INSERT INTO `jugadores` (`id`, `nombre`, `apellido`, `posicion`, `numero`, `equipo_id`, `usuario_id`) VALUES
(23, 'Brayan', 'León', 'Delantero', 27, 12, 45),
(24, 'Edwin', 'Cardona', 'Mediocampista', 10, 13, 46),
(25, 'Dorlan', 'Pabón', 'Extremo', 8, 14, 47),
(26, 'Jeison', 'Quiñones', 'Defensa', 3, 15, 49),
(27, 'Fredy', 'Montero', 'Delantero', 17, 16, 51),
(28, 'Adrián', 'Ramos', 'Delantero', 20, 17, 53),
(29, 'Adrian', 'Arregui', 'Centrocampista', 8, 12, NULL),
(30, 'Marino', 'Hinestroza', 'Delantero', 18, 13, NULL),
(31, 'Francisco', 'Fydrizewski', 'Delantero', 19, 12, NULL),
(32, 'Cristian', 'Arango', 'Delantero', 17, 13, NULL),
(33, 'Jean', 'Pineda', 'Centrocampista', 16, 15, NULL),
(34, 'Rafael', 'Carrascal', 'Centrocampista', 8, 17, NULL),
(35, 'Stiven', 'Rodriguez', 'Delantero', 9, 16, NULL),
(36, 'Edison', 'Lopez', 'Centrocampista', 67, 14, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notificaciones`
--

CREATE TABLE `notificaciones` (
  `id` int NOT NULL,
  `usuario_id` int NOT NULL,
  `titulo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mensaje` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `leido` tinyint(1) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `notificaciones`
--

INSERT INTO `notificaciones` (`id`, `usuario_id`, `titulo`, `mensaje`, `tipo`, `leido`, `fecha_creacion`) VALUES
(98, 41, 'Nuevo Equipo Registrado', 'El equipo DIM se ha unido al torneo Liga Betplay 2026-I.', 'info', 1, '2026-02-25 18:11:21'),
(99, 41, 'Nuevo Equipo Registrado', 'El equipo Atlético Nacional  se ha unido al torneo Liga Betplay 2026-I.', 'info', 1, '2026-02-25 18:15:31'),
(100, 41, 'Nuevo Equipo Registrado', 'El equipo Envigado FC se ha unido al torneo Liga Betplay 2026-I.', 'info', 1, '2026-02-25 18:17:34'),
(101, 41, 'Nuevo Equipo Inscrito', 'El equipo \'DIM\' se ha inscrito en \'Liga Betplay 2026-I\'.', 'team_registration', 1, '2026-02-25 19:15:10'),
(102, 41, 'Nuevo Equipo Inscrito', 'El equipo \'Atlético Nacional \' se ha inscrito en \'Liga Betplay 2026-I\'.', 'team_registration', 1, '2026-02-25 19:15:40'),
(103, 41, 'Nuevo Equipo Inscrito', 'El equipo \'Envigado FC\' se ha inscrito en \'Liga Betplay 2026-I\'.', 'team_registration', 1, '2026-02-25 19:17:43'),
(104, 41, 'Nuevo Equipo Inscrito', 'El equipo \'Águilas Doradas\' se ha inscrito en \'Liga Betplay 2026-I\'.', 'team_registration', 1, '2026-02-25 19:18:09'),
(105, 41, 'Nuevo Equipo Inscrito', 'El equipo \'Deportivo Cali\' se ha inscrito en \'Liga Betplay 2026-I\'.', 'team_registration', 1, '2026-02-25 19:18:41'),
(106, 41, 'Nuevo Equipo Inscrito', 'El equipo \'América\' se ha inscrito en \'Liga Betplay 2026-I\'.', 'team_registration', 1, '2026-02-25 19:19:16'),
(107, 40, 'Nuevo Usuario Registrado', 'El usuario Eduardo Mendez se ha registrado como team.', 'info', 1, '2026-02-26 01:45:12'),
(108, 41, 'Nuevo Equipo Registrado', 'El equipo Santa Fe se ha unido al torneo Liga Betplay 2026-I.', 'info', 1, '2026-02-26 01:45:45'),
(109, 40, 'Nuevo Usuario Registrado', 'El usuario Isabella Ochoa se ha registrado como referee.', 'info', 1, '2026-02-26 01:48:02'),
(110, 55, 'Nueva Asignación de Partido', 'Has sido asignado para pitar el partido DIM vs América.', 'info', 1, '2026-02-26 01:49:36'),
(111, 55, 'Nueva Asignación de Partido', 'Has sido asignado para pitar el partido Atlético Nacional  vs Deportivo Cali.', 'info', 0, '2026-02-26 02:19:22');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `partidos`
--

CREATE TABLE `partidos` (
  `id` int NOT NULL,
  `torneo_id` int NOT NULL,
  `equipo_local_id` int NOT NULL,
  `equipo_visitante_id` int NOT NULL,
  `arbitro_id` int DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `sede` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `goles_local` int DEFAULT NULL,
  `goles_visitante` int DEFAULT NULL,
  `estado` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jornada` int DEFAULT NULL,
  `observaciones` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `partidos`
--

INSERT INTO `partidos` (`id`, `torneo_id`, `equipo_local_id`, `equipo_visitante_id`, `arbitro_id`, `fecha`, `hora`, `sede`, `goles_local`, `goles_visitante`, `estado`, `jornada`, `observaciones`) VALUES
(26, 6, 12, 17, 6, '2026-01-16', '08:00:00', 'Campo Principal', 3, 3, 'played', 1, 'Todo súper bien  🙉'),
(27, 6, 13, 16, 6, '2026-01-16', '10:00:00', 'Campo Principal', 3, 1, 'played', 1, 'Stiven Rodriguez con el dorsal #9 fue grosero y me hizo llorar 😭'),
(28, 6, 14, 15, NULL, '2026-01-16', '12:00:00', 'Campo Principal', 0, 0, 'scheduled', 1, NULL),
(29, 6, 16, 12, NULL, '2026-01-23', '08:00:00', 'Campo Principal', 0, 0, 'scheduled', 2, NULL),
(30, 6, 15, 17, NULL, '2026-01-23', '10:00:00', 'Campo Principal', 0, 0, 'scheduled', 2, NULL),
(31, 6, 14, 13, NULL, '2026-01-23', '12:00:00', 'Campo Principal', 0, 0, 'scheduled', 2, NULL),
(32, 6, 12, 15, NULL, '2026-01-30', '08:00:00', 'Campo Principal', 0, 0, 'scheduled', 3, NULL),
(33, 6, 16, 14, NULL, '2026-01-30', '10:00:00', 'Campo Principal', 0, 0, 'scheduled', 3, NULL),
(34, 6, 17, 13, NULL, '2026-01-30', '12:00:00', 'Campo Principal', 0, 0, 'scheduled', 3, NULL),
(35, 6, 14, 12, NULL, '2026-02-06', '08:00:00', 'Campo Principal', 0, 0, 'scheduled', 4, NULL),
(36, 6, 13, 15, NULL, '2026-02-06', '10:00:00', 'Campo Principal', 0, 0, 'scheduled', 4, NULL),
(37, 6, 17, 16, NULL, '2026-02-06', '12:00:00', 'Campo Principal', 0, 0, 'scheduled', 4, NULL),
(38, 6, 12, 13, NULL, '2026-02-13', '08:00:00', 'Campo Principal', 0, 0, 'scheduled', 5, NULL),
(39, 6, 14, 17, NULL, '2026-02-13', '10:00:00', 'Campo Principal', 0, 0, 'scheduled', 5, NULL),
(40, 6, 15, 16, NULL, '2026-02-13', '12:00:00', 'Campo Principal', 0, 0, 'scheduled', 5, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `partidos_jugadores`
--

CREATE TABLE `partidos_jugadores` (
  `id` int NOT NULL,
  `partido_id` int NOT NULL,
  `jugador_id` int NOT NULL,
  `equipo_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `partidos_jugadores`
--

INSERT INTO `partidos_jugadores` (`id`, `partido_id`, `jugador_id`, `equipo_id`) VALUES
(27, 11, 16, 5),
(29, 12, 15, 6),
(30, 12, 19, 9),
(31, 13, 17, 7),
(32, 13, 18, 8),
(33, 14, 19, 9),
(34, 14, 16, 5),
(35, 17, 16, 5),
(36, 17, 18, 8),
(37, 15, 18, 8),
(39, 16, 17, 7),
(40, 16, 15, 6),
(41, 18, 19, 9),
(42, 18, 17, 7),
(44, 19, 15, 6),
(45, 26, 29, 12),
(46, 26, 23, 12),
(47, 26, 28, 17),
(48, 27, 24, 13),
(49, 27, 32, 13),
(50, 27, 30, 13),
(51, 27, 35, 16),
(52, 27, 27, 16);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `postulaciones_jugadores`
--

CREATE TABLE `postulaciones_jugadores` (
  `id` int NOT NULL,
  `jugador_id` int NOT NULL,
  `equipo_id` int NOT NULL,
  `link_video` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `peso` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estatura` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pie_habil` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `posicion` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trayectoria` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `postulaciones_jugadores`
--

INSERT INTO `postulaciones_jugadores` (`id`, `jugador_id`, `equipo_id`, `link_video`, `peso`, `estatura`, `pie_habil`, `posicion`, `trayectoria`, `estado`, `fecha_creacion`) VALUES
(13, 15, 6, 'https://youtu.be/6M9bcPxy2WQ?si=COwH4bo8tZzCN1GC', '55', '160', 'izquierdo', 'Delantero', 'El Gran Combo FC y PandaPan FC', 'accepted', '2026-02-25 01:04:14'),
(14, 16, 5, 'https://youtu.be/ssdN7ZfavHs?si=eJpRrqlVHKpCNHqL', '76', '187', 'derecho', 'Defensa', 'Juveantioquia FC y PandaPan FC', 'accepted', '2026-02-25 01:11:29'),
(15, 21, 7, 'https://youtu.be/YrsEyQ33JkA?si=z7oQvJbkMcYEf-i3', '100', '190', 'ambidiestro', 'Defensa', 'No tiene', 'accepted', '2026-02-25 12:22:11'),
(16, 22, 5, 'https://youtu.be/BbpTAOn27IM?si=AB3kCLaTTDvsDErM', '73', '174', 'ambidiestro', 'Delantero', 'nula', 'accepted', '2026-02-25 14:43:18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarjetas`
--

CREATE TABLE `tarjetas` (
  `id` int NOT NULL,
  `partido_id` int NOT NULL,
  `jugador_id` int NOT NULL,
  `equipo_id` int NOT NULL,
  `minuto` int DEFAULT NULL,
  `tipo` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tarjetas`
--

INSERT INTO `tarjetas` (`id`, `partido_id`, `jugador_id`, `equipo_id`, `minuto`, `tipo`) VALUES
(17, 26, 23, 12, 85, 'yellow'),
(18, 26, 29, 12, 34, 'yellow'),
(19, 27, 35, 16, 48, 'red');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `torneos`
--

CREATE TABLE `torneos` (
  `id` int NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `tipo` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `organizador_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `torneos`
--

INSERT INTO `torneos` (`id`, `nombre`, `fecha_inicio`, `fecha_fin`, `tipo`, `estado`, `organizador_id`) VALUES
(6, 'Liga Betplay 2026-I', '2026-01-16', '2026-07-11', 'League', 'open', 41);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre_completo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contrasena_hash` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rol` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `activo` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `email`, `nombre_completo`, `contrasena_hash`, `rol`, `activo`) VALUES
(40, 'emanuellcolorado17@gmail.com', 'Emanuel Colorado Gonzalez', '$argon2id$v=19$m=65536,t=3,p=4$u7dWqnWO0ZpzrrV27t17jw$31P+N0R0/Uv3sRdokaFkvYgH+EiSP2/AMJ3fcgy1VOw', 'admin', 1),
(41, 'carlomariozu@yopmail.com', 'Carlos Mario Zuluaga', '$argon2id$v=19$m=65536,t=3,p=4$KwUAACAEYEwpZax1LsW4Fw$oMS8sKGrsOs4CRoQcSiSmcTIptsIfBWPTwwRhyC7OE0', 'organizer', 1),
(42, 'dimoficial1913@yopmail.com', 'Raúl Giraldo', '$argon2id$v=19$m=65536,t=3,p=4$e29tzZmT0hpD6N17L0WolQ$324ZrAJgLWwcach1i2DX/1r9uuaRIZllqOX3Wiy96PU', 'team', 1),
(43, 'nacional8916@yopmail.com', 'Sebastián Arango', '$argon2id$v=19$m=65536,t=3,p=4$TWktJYQQolSKEQLgvDdGKA$GdrtaWvTdXz3WjS89Jp7hKEzVlwBUNfpcX5IyNDh8DA', 'team', 1),
(44, 'canteradeheroes@yopmail.com', 'Oscar Palomino', '$argon2id$v=19$m=65536,t=3,p=4$c+7d+1+LEQIAoLSW8v5/Tw$S7qFty+NHyZOB+Gk+2CwW6dh33dpQIwjvIjMSFlMePg', 'team', 1),
(45, 'brayan.león@futzone.com', 'Brayan León', '$argon2id$v=19$m=65536,t=3,p=4$bw1BaI3Rujem9F5rrRVizA$TUUF/ZXn1gXsHsapWsLknutNDIU+1LDpUecRAIwjtbM', 'player', 1),
(46, 'edwin.cardona@futzone.com', 'Edwin Cardona', '$argon2id$v=19$m=65536,t=3,p=4$EMK4t5byfi8F4DznfA/hfA$M+Dh1aLYjIGPCuXlsTZXmzI46IKT6MsTdebhBy2Ng6o', 'player', 1),
(47, 'dorlan.pabón@futzone.com', 'Dorlan Pabón', '$argon2id$v=19$m=65536,t=3,p=4$E8IYg/A+x7gXQghBiBECIA$W3YnJQTpiDDRLfc10CO735EFB2ReezpCFwFfwvK876Q', 'player', 1),
(48, 'aguilas.doradas@futzone.com', 'Águilas Doradas', '$argon2id$v=19$m=65536,t=3,p=4$4jxnTAnhvPe+916rNSZE6A$pZ+FZG+fAUVbEi4+BofLalBLtJDsHz7rOT4p0wk473A', 'team', 1),
(49, 'jeison.quiñones@futzone.com', 'Jeison Quiñones', '$argon2id$v=19$m=65536,t=3,p=4$ilHKuZfy/h8DwNgbA0CIUQ$BtXS38TxX/y1qX3ogZnDpWGAokQ59isbja6SORtRBl4', 'player', 1),
(50, 'deportivo.cali@futzone.com', 'Deportivo Cali', '$argon2id$v=19$m=65536,t=3,p=4$y3mvVerd29sbY+xdC2GsFQ$7wKWPKufVz7ac57MRfFnopDQSP2gB3LFNhv+ds4QZ7g', 'team', 1),
(51, 'fredy.montero@futzone.com', 'Fredy Montero', '$argon2id$v=19$m=65536,t=3,p=4$hzBGqJWS0vo/5zxHaE2pdQ$TKoRS8OBjJ6bXnrrWKu5S7AOYMrM9/1a+AujUt6pSMA', 'player', 1),
(52, 'america@futzone.com', 'América', '$argon2id$v=19$m=65536,t=3,p=4$i7E2BqBUKiUEQAhh7B2jFA$eWMM+LEUogdBnFYb+fJHOWXvsha5i2KYQAN8GHsxrFE', 'team', 1),
(53, 'adrián.ramos@futzone.com', 'Adrián Ramos', '$argon2id$v=19$m=65536,t=3,p=4$lRLCOEfoXStlTGltbe09Zw$G4Qsx3254zIsXaN50Fo6cLFEbAJmzzRrNqfxScTMviY', 'player', 1),
(54, 'santafeoficial@yopmail.com', 'Eduardo Mendez', '$argon2id$v=19$m=65536,t=3,p=4$vleKsTYG4Py/NyaEEIJwbg$cFhc9Zgy2HYNIuhy8HNkzfpXbgYhj+Hi5ynoBhUxER0', 'team', 1),
(55, 'ochoaisabella731@gmail.com', 'Isabella Ochoa', '$argon2id$v=19$m=65536,t=3,p=4$RSilVAqhFCLknFPK+Z/zHg$A4isXK+ZWiPXFXkxzcs1yqCUkwuw+L2uH6nh/nJSxug', 'referee', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `arbitros`
--
ALTER TABLE `arbitros`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`),
  ADD KEY `ix_arbitros_id` (`id`);

--
-- Indices de la tabla `equipos`
--
ALTER TABLE `equipos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`),
  ADD KEY `ix_equipos_id` (`id`);

--
-- Indices de la tabla `equipos_torneos`
--
ALTER TABLE `equipos_torneos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `equipo_id` (`equipo_id`),
  ADD KEY `torneo_id` (`torneo_id`),
  ADD KEY `ix_equipos_torneos_id` (`id`);

--
-- Indices de la tabla `goles`
--
ALTER TABLE `goles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `partido_id` (`partido_id`),
  ADD KEY `jugador_id` (`jugador_id`),
  ADD KEY `equipo_id` (`equipo_id`),
  ADD KEY `ix_goles_id` (`id`);

--
-- Indices de la tabla `jugadores`
--
ALTER TABLE `jugadores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `equipo_id` (`equipo_id`),
  ADD KEY `usuario_id` (`usuario_id`),
  ADD KEY `ix_jugadores_id` (`id`);

--
-- Indices de la tabla `notificaciones`
--
ALTER TABLE `notificaciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`),
  ADD KEY `ix_notificaciones_id` (`id`);

--
-- Indices de la tabla `partidos`
--
ALTER TABLE `partidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `torneo_id` (`torneo_id`),
  ADD KEY `equipo_local_id` (`equipo_local_id`),
  ADD KEY `equipo_visitante_id` (`equipo_visitante_id`),
  ADD KEY `arbitro_id` (`arbitro_id`),
  ADD KEY `ix_partidos_id` (`id`);

--
-- Indices de la tabla `partidos_jugadores`
--
ALTER TABLE `partidos_jugadores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `partido_id` (`partido_id`),
  ADD KEY `jugador_id` (`jugador_id`),
  ADD KEY `equipo_id` (`equipo_id`),
  ADD KEY `ix_partidos_jugadores_id` (`id`);

--
-- Indices de la tabla `postulaciones_jugadores`
--
ALTER TABLE `postulaciones_jugadores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jugador_id` (`jugador_id`),
  ADD KEY `equipo_id` (`equipo_id`),
  ADD KEY `ix_postulaciones_jugadores_id` (`id`);

--
-- Indices de la tabla `tarjetas`
--
ALTER TABLE `tarjetas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `partido_id` (`partido_id`),
  ADD KEY `jugador_id` (`jugador_id`),
  ADD KEY `equipo_id` (`equipo_id`),
  ADD KEY `ix_tarjetas_id` (`id`);

--
-- Indices de la tabla `torneos`
--
ALTER TABLE `torneos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `organizador_id` (`organizador_id`),
  ADD KEY `ix_torneos_id` (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ix_usuarios_email` (`email`),
  ADD KEY `ix_usuarios_id` (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `arbitros`
--
ALTER TABLE `arbitros`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `equipos`
--
ALTER TABLE `equipos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `equipos_torneos`
--
ALTER TABLE `equipos_torneos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT de la tabla `goles`
--
ALTER TABLE `goles`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT de la tabla `jugadores`
--
ALTER TABLE `jugadores`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de la tabla `notificaciones`
--
ALTER TABLE `notificaciones`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- AUTO_INCREMENT de la tabla `partidos`
--
ALTER TABLE `partidos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT de la tabla `partidos_jugadores`
--
ALTER TABLE `partidos_jugadores`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT de la tabla `postulaciones_jugadores`
--
ALTER TABLE `postulaciones_jugadores`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `tarjetas`
--
ALTER TABLE `tarjetas`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `torneos`
--
ALTER TABLE `torneos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `arbitros`
--
ALTER TABLE `arbitros`
  ADD CONSTRAINT `arbitros_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `equipos`
--
ALTER TABLE `equipos`
  ADD CONSTRAINT `equipos_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `equipos_torneos`
--
ALTER TABLE `equipos_torneos`
  ADD CONSTRAINT `equipos_torneos_ibfk_1` FOREIGN KEY (`equipo_id`) REFERENCES `equipos` (`id`),
  ADD CONSTRAINT `equipos_torneos_ibfk_2` FOREIGN KEY (`torneo_id`) REFERENCES `torneos` (`id`);

--
-- Filtros para la tabla `goles`
--
ALTER TABLE `goles`
  ADD CONSTRAINT `goles_ibfk_1` FOREIGN KEY (`partido_id`) REFERENCES `partidos` (`id`),
  ADD CONSTRAINT `goles_ibfk_2` FOREIGN KEY (`jugador_id`) REFERENCES `jugadores` (`id`),
  ADD CONSTRAINT `goles_ibfk_3` FOREIGN KEY (`equipo_id`) REFERENCES `equipos` (`id`);

--
-- Filtros para la tabla `jugadores`
--
ALTER TABLE `jugadores`
  ADD CONSTRAINT `jugadores_ibfk_1` FOREIGN KEY (`equipo_id`) REFERENCES `equipos` (`id`),
  ADD CONSTRAINT `jugadores_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `notificaciones`
--
ALTER TABLE `notificaciones`
  ADD CONSTRAINT `notificaciones_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `partidos`
--
ALTER TABLE `partidos`
  ADD CONSTRAINT `partidos_ibfk_1` FOREIGN KEY (`torneo_id`) REFERENCES `torneos` (`id`),
  ADD CONSTRAINT `partidos_ibfk_2` FOREIGN KEY (`equipo_local_id`) REFERENCES `equipos` (`id`),
  ADD CONSTRAINT `partidos_ibfk_3` FOREIGN KEY (`equipo_visitante_id`) REFERENCES `equipos` (`id`),
  ADD CONSTRAINT `partidos_ibfk_4` FOREIGN KEY (`arbitro_id`) REFERENCES `arbitros` (`id`);

--
-- Filtros para la tabla `partidos_jugadores`
--
ALTER TABLE `partidos_jugadores`
  ADD CONSTRAINT `partidos_jugadores_ibfk_1` FOREIGN KEY (`partido_id`) REFERENCES `partidos` (`id`),
  ADD CONSTRAINT `partidos_jugadores_ibfk_2` FOREIGN KEY (`jugador_id`) REFERENCES `jugadores` (`id`),
  ADD CONSTRAINT `partidos_jugadores_ibfk_3` FOREIGN KEY (`equipo_id`) REFERENCES `equipos` (`id`);

--
-- Filtros para la tabla `postulaciones_jugadores`
--
ALTER TABLE `postulaciones_jugadores`
  ADD CONSTRAINT `postulaciones_jugadores_ibfk_1` FOREIGN KEY (`jugador_id`) REFERENCES `jugadores` (`id`),
  ADD CONSTRAINT `postulaciones_jugadores_ibfk_2` FOREIGN KEY (`equipo_id`) REFERENCES `equipos` (`id`);

--
-- Filtros para la tabla `tarjetas`
--
ALTER TABLE `tarjetas`
  ADD CONSTRAINT `tarjetas_ibfk_1` FOREIGN KEY (`partido_id`) REFERENCES `partidos` (`id`),
  ADD CONSTRAINT `tarjetas_ibfk_2` FOREIGN KEY (`jugador_id`) REFERENCES `jugadores` (`id`),
  ADD CONSTRAINT `tarjetas_ibfk_3` FOREIGN KEY (`equipo_id`) REFERENCES `equipos` (`id`);

--
-- Filtros para la tabla `torneos`
--
ALTER TABLE `torneos`
  ADD CONSTRAINT `torneos_ibfk_1` FOREIGN KEY (`organizador_id`) REFERENCES `usuarios` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
