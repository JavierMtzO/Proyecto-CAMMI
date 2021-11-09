-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-11-2021 a las 02:57:58
-- Versión del servidor: 10.4.17-MariaDB
-- Versión de PHP: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cammi`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alimentacion`
--

CREATE TABLE `alimentacion` (
  `Id_Alimentacion` int(11) NOT NULL,
  `Fecha` date DEFAULT NULL,
  `Id_Tipo_de_Persona` int(11) DEFAULT NULL,
  `Id_Tipo_de_Platillo` int(11) DEFAULT NULL,
  `Fecha_de_registro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alojamiento`
--

CREATE TABLE `alojamiento` (
  `Id_Alojamiento` int(11) NOT NULL,
  `Persona_Id` int(11) DEFAULT NULL,
  `Persona_Refugiada` varchar(10) DEFAULT NULL,
  `Miembro_de_la_Estacion_Migratoria` varchar(10) DEFAULT NULL,
  `Uso_de_Cama` varchar(10) DEFAULT NULL,
  `Alojamiento_con_Costo` varchar(10) DEFAULT NULL,
  `MPP` varchar(10) DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `Fecha_de_registro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `alojamiento`
--

INSERT INTO `alojamiento` (`Id_Alojamiento`, `Persona_Id`, `Persona_Refugiada`, `Miembro_de_la_Estacion_Migratoria`, `Uso_de_Cama`, `Alojamiento_con_Costo`, `MPP`, `Fecha`, `Fecha_de_registro`) VALUES
(1, 1, 'NO', 'NO', 'NO', 'NO', 'NO', '0000-00-00', '2021-11-06 06:48:51');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asistencia_social`
--

CREATE TABLE `asistencia_social` (
  `Id_Asistencia_Social` int(11) NOT NULL,
  `Persona_Id` int(11) DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `Tipo_social` int(11) DEFAULT NULL,
  `Formato_de_Atencion` varchar(25) DEFAULT NULL,
  `Fecha_de_registro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `atencion_psicosocial`
--

CREATE TABLE `atencion_psicosocial` (
  `Id_Atencion_Psicologica` int(11) NOT NULL,
  `Persona_Id` int(11) DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `Tipo_psicosocial` int(11) DEFAULT NULL,
  `Formato_de_atencion` varchar(25) DEFAULT NULL,
  `Fecha_de_registro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comunicacion`
--

CREATE TABLE `comunicacion` (
  `Id_comunicacion` int(11) NOT NULL,
  `Persona_Id` int(11) DEFAULT NULL,
  `Inicio_Servicio` varchar(10) DEFAULT NULL,
  `Carga_de_Bateria` varchar(10) DEFAULT NULL,
  `Uso_de_Wifi` varchar(10) DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `Pais_Destino_de_Llamada` varchar(25) DEFAULT NULL,
  `Completado_de_la_Llamada` varchar(10) DEFAULT NULL,
  `Mantenimiento_del_Contacto_Familiar` varchar(10) DEFAULT NULL,
  `Fecha_de_registro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `comunicacion`
--

INSERT INTO `comunicacion` (`Id_comunicacion`, `Persona_Id`, `Inicio_Servicio`, `Carga_de_Bateria`, `Uso_de_Wifi`, `Fecha`, `Pais_Destino_de_Llamada`, `Completado_de_la_Llamada`, `Mantenimiento_del_Contacto_Familiar`, `Fecha_de_registro`) VALUES
(3, 1, 'NO', 'NO', 'NO', '0000-00-00', 'PANAMÁ', 'SI', 'MCF', '2021-11-09 01:54:03');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `delito`
--

CREATE TABLE `delito` (
  `Id_Delito` int(11) NOT NULL,
  `Persona_Id` int(11) DEFAULT NULL,
  `Denuncia` date DEFAULT NULL,
  `Denuncia_CAMMI` varchar(10) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `Victima_de_Delito` varchar(10) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `Carpeta_de_Investigacion` varchar(10) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `Fecha_de_registro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `delito`
--

INSERT INTO `delito` (`Id_Delito`, `Persona_Id`, `Denuncia`, `Denuncia_CAMMI`, `Victima_de_Delito`, `Carpeta_de_Investigacion`, `Fecha_de_registro`) VALUES
(1, NULL, NULL, NULL, NULL, NULL, '2021-11-09 01:40:35'),
(2, 1, '2002-01-23', 'NO', 'NO', 'SI', '2021-11-09 01:53:15');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `impulso`
--

CREATE TABLE `impulso` (
  `Id_Impulso` int(11) NOT NULL,
  `Descripcion` longtext DEFAULT NULL,
  `Estatus` varchar(20) DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `Tipo_Impulso` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `juicio_de_amparo`
--

CREATE TABLE `juicio_de_amparo` (
  `Id_Juicio_de_Amparo` int(11) NOT NULL,
  `Inicio` varchar(10) DEFAULT NULL,
  `Inicio_CAMMI` varchar(10) DEFAULT NULL,
  `Resolución` varchar(10) DEFAULT NULL,
  `Persona_Id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `juicio_de_amparo_has_impulso`
--

CREATE TABLE `juicio_de_amparo_has_impulso` (
  `Id_Juicio_de_Amparo` int(11) NOT NULL,
  `Id_Impulso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfil_de_refugio`
--

CREATE TABLE `perfil_de_refugio` (
  `Id_Perfil_de_Refugio` int(11) NOT NULL,
  `Perfil_de_Refugio` varchar(10) DEFAULT NULL,
  `Certificado_de_Nacionalidad_tramitado_CAMMI` varchar(10) DEFAULT NULL,
  `Inicio_con_CAMMI` varchar(10) DEFAULT NULL,
  `Persona_Id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfil_de_refugio_has_impulso`
--

CREATE TABLE `perfil_de_refugio_has_impulso` (
  `Id_Perfil_de_Refugio` int(11) NOT NULL,
  `Id_Impulso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `Folio` int(11) NOT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  `Edad` int(11) DEFAULT NULL,
  `Rango_de_Edad` varchar(50) DEFAULT NULL,
  `Genero` varchar(20) DEFAULT NULL,
  `Nacionalidad` varchar(25) DEFAULT NULL,
  `Discapacidad` varchar(10) DEFAULT NULL,
  `Contacto` varchar(20) DEFAULT NULL,
  `LGBT` varchar(10) DEFAULT NULL,
  `Dispositivo_propio` varchar(10) DEFAULT NULL,
  `RFC` varchar(12) DEFAULT NULL,
  `NSS` varchar(11) DEFAULT NULL,
  `Asesoria` varchar(50) DEFAULT NULL,
  `Acompanado` varchar(10) DEFAULT NULL,
  `Fecha_de_registro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`Folio`, `Nombre`, `Edad`, `Rango_de_Edad`, `Genero`, `Nacionalidad`, `Discapacidad`, `Contacto`, `LGBT`, `Dispositivo_propio`, `RFC`, `NSS`, `Asesoria`, `Acompanado`, `Fecha_de_registro`) VALUES
(1, 'Adrián Torres Hernández', 0, 'NN: 0-11 años', 'MASCULINO', 'ARGENTINA', 'NO', '', 'NO', 'NO', '', '', 'NO', 'NO', '2021-11-06 06:48:42');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `privilegios`
--

CREATE TABLE `privilegios` (
  `ID_PRIVILEGIO` int(11) NOT NULL,
  `NOMBRE` varchar(255) DEFAULT NULL,
  `DESCRIPCION` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `privilegios`
--

INSERT INTO `privilegios` (`ID_PRIVILEGIO`, `NOMBRE`, `DESCRIPCION`) VALUES
(1, 'Agregar usuario', 'Poder agregar usuario con su respectivo rol'),
(2, 'Editar usuario', 'Editar la información del usuario'),
(3, 'Eliminar usuario', 'Eliminar un usuario usuario'),
(4, 'Agregar persona', 'Agregar un migrante al sistema'),
(5, 'Editar persona', 'Editar un migrante en específico'),
(6, 'Eliminar persona', 'Eliminar un migrante del sistema'),
(7, 'Consultar persona', 'Consultar un migrante del sistema'),
(8, 'Agregar nueva persona a Atención psicosocial', 'Agrega un nuevo migrante y especifica la atención psicosocial atendida'),
(9, 'Agregar persona ya existente a Atención psicosocial', 'Agrega un nuevo migrante y especifica la atención psicosocial atendida'),
(10, 'Eliminar persona de Atención psicosocial', 'Elimina un migrante de atención psicosocial'),
(11, 'Agregar nueva persona a Programa de Integración Local', 'Agrega un nuevo migrante y especifica el Programa de Integración Local'),
(12, 'Agregar persona ya existente a Programa de Integración Local', 'Agrega un migrante ya existente al Programa de Integración Local'),
(13, 'Eliminar persona del Programa de Integración Local', 'Elimina un migrante del Programa de Integración Local'),
(14, 'Agregar nueva persona a Asistencia Social', 'Agrega un nuevo migrante y especifica la asistencia social que recibe'),
(15, 'Agregar persona ya existente a Asistencia Social', 'Agrega un migrante ya existente y especifica la asistencia social que recibe'),
(16, 'Eliminar persona de Asistencia Social', 'Elimina un migrante de la Asistencia Social'),
(17, 'Agregar persona a Alojamiento', 'Agrega un migrante al alojamiento'),
(18, 'Eliminar persona de Alojamiento', 'Elimina un migrante del alojamiento'),
(19, 'Agregar servicio de comunicacion a persona', 'Agrega un persona que recibió servicio de comunicación'),
(20, 'Eliminar servicio de comunicación a la persona', 'Eliminar servicio de comunicación a la persona');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `programa_integracion_local`
--

CREATE TABLE `programa_integracion_local` (
  `Id_PIL` int(11) NOT NULL,
  `Persona_Id` int(11) DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `Tipo_pil` int(11) DEFAULT NULL,
  `Fecha_de_registro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `regularizacion_migratorio`
--

CREATE TABLE `regularizacion_migratorio` (
  `Id_Regularización_Migratoria` int(11) NOT NULL,
  `Tipo` varchar(10) DEFAULT NULL,
  `Inicio` varchar(10) DEFAULT NULL,
  `Resolución` varchar(10) DEFAULT NULL,
  `Persona_Id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `regularizacion_migratorio_has_impulso`
--

CREATE TABLE `regularizacion_migratorio_has_impulso` (
  `Id_Regularización_Migratoria` int(11) NOT NULL,
  `Id_Impulso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `retorno_asistido`
--

CREATE TABLE `retorno_asistido` (
  `Id_Retorno_Asistido` int(11) NOT NULL,
  `Asesoría_CAMMI` varchar(10) DEFAULT NULL,
  `Acompañamiento_CAMMI` varchar(10) DEFAULT NULL,
  `Persona_Id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `retorno_asistido_has_impulso`
--

CREATE TABLE `retorno_asistido_has_impulso` (
  `Id_Retorno_Asistido` int(11) NOT NULL,
  `Id_Impulso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reufam`
--

CREATE TABLE `reufam` (
  `Id_REUFAM` int(11) NOT NULL,
  `Inicio_CAMMI` varchar(10) DEFAULT NULL,
  `Asesoria` varchar(10) DEFAULT NULL,
  `Persona_Id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reufam_has_impulso`
--

CREATE TABLE `reufam_has_impulso` (
  `Id_REUFAM` int(11) NOT NULL,
  `Id_Impulso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `ID_ROL` int(11) NOT NULL,
  `NOMBRE` varchar(255) DEFAULT NULL,
  `DESCRIPCION` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`ID_ROL`, `NOMBRE`, `DESCRIPCION`) VALUES
(1, 'administrador', 'Administrador de todo el sistema. Tiene todos los privilegios'),
(2, 'psicosocial', 'Area psicoscocial, tiene los privilegios de es área'),
(3, 'juridico', 'Area jurídica, tiene los privilegios de esa área'),
(4, 'albergue', 'Area albergue, tiene los privilegios de esa área'),
(5, 'psicosocial-albergue', 'Area psicoscocial y albergue, tiene los privilegios de ambas áreas'),
(6, 'psicosocial-juridico', 'Area psicoscocial y jurídica, tiene los privilegios de ambas áreas'),
(7, 'albergue-juridico', 'Area albergue y jurídica, tiene los privilegios de ambas áreas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles_privilegios`
--

CREATE TABLE `roles_privilegios` (
  `ID_ROLES_PRIVILEGIOS` int(11) NOT NULL,
  `ID_ROL` int(11) DEFAULT NULL,
  `ID_PRIVILEGIO` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `roles_privilegios`
--

INSERT INTO `roles_privilegios` (`ID_ROLES_PRIVILEGIOS`, `ID_ROL`, `ID_PRIVILEGIO`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7),
(8, 1, 8),
(9, 1, 9),
(10, 1, 10),
(11, 1, 11),
(12, 1, 12),
(13, 1, 13),
(14, 1, 14),
(15, 1, 15),
(16, 1, 16),
(17, 1, 17),
(18, 1, 18),
(19, 1, 19),
(20, 1, 20);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_de_apoyo_p`
--

CREATE TABLE `tipo_de_apoyo_p` (
  `Id_Tipo_de_Apoyo` int(11) NOT NULL,
  `Nombre_Tipo_de_Apoyo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipo_de_apoyo_p`
--

INSERT INTO `tipo_de_apoyo_p` (`Id_Tipo_de_Apoyo`, `Nombre_Tipo_de_Apoyo`) VALUES
(1, 'INTERVENCIÓN PSICOLOGÍA'),
(2, 'EVALUACIÓN  PSICOLÓGICA'),
(3, 'INFORME DE EVALUACIÓN'),
(4, 'ACCESO A LA SALUD FÍSICA'),
(5, 'ACCESO A LA SALUD MENTAL');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_de_apoyo_pil`
--

CREATE TABLE `tipo_de_apoyo_pil` (
  `Id_Tipo_de_Apoyo` int(11) NOT NULL,
  `Nombre_Tipo_de_Apoyo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipo_de_apoyo_pil`
--

INSERT INTO `tipo_de_apoyo_pil` (`Id_Tipo_de_Apoyo`, `Nombre_Tipo_de_Apoyo`) VALUES
(1, 'ORIENTACIÓN EDUCACIÓN, VIVIENDA Y TRABAJO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_de_apoyo_s`
--

CREATE TABLE `tipo_de_apoyo_s` (
  `Id_Tipo_de_Apoyo` int(11) NOT NULL,
  `Nombre_Tipo_de_Apoyo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipo_de_apoyo_s`
--

INSERT INTO `tipo_de_apoyo_s` (`Id_Tipo_de_Apoyo`, `Nombre_Tipo_de_Apoyo`) VALUES
(1, 'ACCESO A LA EDUCACIÓN- REVALIDACIÓN DE ESTUDIOS'),
(2, 'ACCESO A LA EDUCACIÓN- INCORPORACIÓN'),
(3, 'ACCESO A OPCIONES DE EMPLEO'),
(4, 'ACCESO A OPCIONES DE VIVIENDA '),
(5, 'ACCESO A OPCIONES DE SALUD'),
(6, 'EDUCACIÓN- REGULARIZACIÓN');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_de_persona`
--

CREATE TABLE `tipo_de_persona` (
  `Id_Tipo_de_Persona` int(11) NOT NULL,
  `Nombre` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipo_de_persona`
--

INSERT INTO `tipo_de_persona` (`Id_Tipo_de_Persona`, `Nombre`) VALUES
(1, 'HOSPEDADO'),
(2, 'PERSONAL '),
(3, 'VOLUNTARIO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_de_platillo`
--

CREATE TABLE `tipo_de_platillo` (
  `Id_Tipo_de_Platillo` int(11) NOT NULL,
  `Nombre` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipo_de_platillo`
--

INSERT INTO `tipo_de_platillo` (`Id_Tipo_de_Platillo`, `Nombre`) VALUES
(1, 'DESAYUNO'),
(2, 'COMIDA '),
(3, 'CENA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_impulso`
--

CREATE TABLE `tipo_impulso` (
  `Id_tipo_impulso` int(11) NOT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  `Tipo_de_tramite` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `ID_USUARIO` int(11) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `LASTNAME` varchar(255) DEFAULT NULL,
  `USERNAME` varchar(255) DEFAULT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `ID_ROL` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`ID_USUARIO`, `NAME`, `LASTNAME`, `USERNAME`, `EMAIL`, `PASSWORD`, `ID_ROL`) VALUES
(1, 'Javier', 'Martinez', 'javiermtzo', 'javier@itesm.mx', '$2a$12$PmLn00VvKCEu/eFqdpWBQ.CDFD404oh8Hm7r2a45vE0MqgjIwwFXy', 1),
(2, 'Adrian', 'Torres', 'adrian.torres', 'adrian@itesm.mx', '$2a$12$fRPHY8g1VvfjAcDBfnHnO.hI33JovaQWnuNGc//kxCHVCK5bo09Zu', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alimentacion`
--
ALTER TABLE `alimentacion`
  ADD PRIMARY KEY (`Id_Alimentacion`),
  ADD UNIQUE KEY `Id_Alimentacion` (`Id_Alimentacion`),
  ADD KEY `Id_Tipo_de_Persona` (`Id_Tipo_de_Persona`),
  ADD KEY `Id_Tipo_de_Platillo` (`Id_Tipo_de_Platillo`);

--
-- Indices de la tabla `alojamiento`
--
ALTER TABLE `alojamiento`
  ADD PRIMARY KEY (`Id_Alojamiento`),
  ADD UNIQUE KEY `Id_Alojamiento` (`Id_Alojamiento`),
  ADD KEY `Persona_Id` (`Persona_Id`);

--
-- Indices de la tabla `asistencia_social`
--
ALTER TABLE `asistencia_social`
  ADD PRIMARY KEY (`Id_Asistencia_Social`),
  ADD UNIQUE KEY `Id_Asistencia_Social` (`Id_Asistencia_Social`),
  ADD KEY `Persona_Id` (`Persona_Id`),
  ADD KEY `Tipo_social` (`Tipo_social`);

--
-- Indices de la tabla `atencion_psicosocial`
--
ALTER TABLE `atencion_psicosocial`
  ADD PRIMARY KEY (`Id_Atencion_Psicologica`),
  ADD UNIQUE KEY `Id_Atencion_Psicologica` (`Id_Atencion_Psicologica`),
  ADD KEY `Persona_Id` (`Persona_Id`),
  ADD KEY `Tipo_psicosocial` (`Tipo_psicosocial`);

--
-- Indices de la tabla `comunicacion`
--
ALTER TABLE `comunicacion`
  ADD PRIMARY KEY (`Id_comunicacion`),
  ADD UNIQUE KEY `Id_comunicacion` (`Id_comunicacion`),
  ADD KEY `Persona_Id` (`Persona_Id`);

--
-- Indices de la tabla `delito`
--
ALTER TABLE `delito`
  ADD PRIMARY KEY (`Id_Delito`),
  ADD UNIQUE KEY `Id_Delito` (`Id_Delito`),
  ADD KEY `Persona_Id` (`Persona_Id`);

--
-- Indices de la tabla `impulso`
--
ALTER TABLE `impulso`
  ADD PRIMARY KEY (`Id_Impulso`),
  ADD KEY `Tipo_Impulso` (`Tipo_Impulso`);

--
-- Indices de la tabla `juicio_de_amparo`
--
ALTER TABLE `juicio_de_amparo`
  ADD PRIMARY KEY (`Id_Juicio_de_Amparo`),
  ADD KEY `Persona_Id` (`Persona_Id`);

--
-- Indices de la tabla `juicio_de_amparo_has_impulso`
--
ALTER TABLE `juicio_de_amparo_has_impulso`
  ADD PRIMARY KEY (`Id_Juicio_de_Amparo`,`Id_Impulso`),
  ADD KEY `Id_Impulso` (`Id_Impulso`);

--
-- Indices de la tabla `perfil_de_refugio`
--
ALTER TABLE `perfil_de_refugio`
  ADD PRIMARY KEY (`Id_Perfil_de_Refugio`),
  ADD UNIQUE KEY `Id_Perfil_de_Refugio` (`Id_Perfil_de_Refugio`),
  ADD KEY `Persona_Id` (`Persona_Id`);

--
-- Indices de la tabla `perfil_de_refugio_has_impulso`
--
ALTER TABLE `perfil_de_refugio_has_impulso`
  ADD PRIMARY KEY (`Id_Perfil_de_Refugio`,`Id_Impulso`),
  ADD KEY `Id_Impulso` (`Id_Impulso`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`Folio`),
  ADD UNIQUE KEY `Folio` (`Folio`);

--
-- Indices de la tabla `privilegios`
--
ALTER TABLE `privilegios`
  ADD PRIMARY KEY (`ID_PRIVILEGIO`),
  ADD UNIQUE KEY `ID_PRIVILEGIO` (`ID_PRIVILEGIO`);

--
-- Indices de la tabla `programa_integracion_local`
--
ALTER TABLE `programa_integracion_local`
  ADD PRIMARY KEY (`Id_PIL`),
  ADD UNIQUE KEY `Id_PIL` (`Id_PIL`),
  ADD KEY `Persona_Id` (`Persona_Id`),
  ADD KEY `Tipo_pil` (`Tipo_pil`);

--
-- Indices de la tabla `regularizacion_migratorio`
--
ALTER TABLE `regularizacion_migratorio`
  ADD PRIMARY KEY (`Id_Regularización_Migratoria`),
  ADD KEY `Persona_Id` (`Persona_Id`);

--
-- Indices de la tabla `regularizacion_migratorio_has_impulso`
--
ALTER TABLE `regularizacion_migratorio_has_impulso`
  ADD PRIMARY KEY (`Id_Regularización_Migratoria`,`Id_Impulso`),
  ADD KEY `Id_Impulso` (`Id_Impulso`);

--
-- Indices de la tabla `retorno_asistido`
--
ALTER TABLE `retorno_asistido`
  ADD PRIMARY KEY (`Id_Retorno_Asistido`),
  ADD KEY `Persona_Id` (`Persona_Id`);

--
-- Indices de la tabla `retorno_asistido_has_impulso`
--
ALTER TABLE `retorno_asistido_has_impulso`
  ADD PRIMARY KEY (`Id_Retorno_Asistido`,`Id_Impulso`),
  ADD KEY `Id_Impulso` (`Id_Impulso`);

--
-- Indices de la tabla `reufam`
--
ALTER TABLE `reufam`
  ADD PRIMARY KEY (`Id_REUFAM`),
  ADD KEY `Persona_Id` (`Persona_Id`);

--
-- Indices de la tabla `reufam_has_impulso`
--
ALTER TABLE `reufam_has_impulso`
  ADD PRIMARY KEY (`Id_REUFAM`,`Id_Impulso`),
  ADD KEY `Id_Impulso` (`Id_Impulso`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`ID_ROL`),
  ADD UNIQUE KEY `ID_ROL` (`ID_ROL`);

--
-- Indices de la tabla `roles_privilegios`
--
ALTER TABLE `roles_privilegios`
  ADD PRIMARY KEY (`ID_ROLES_PRIVILEGIOS`),
  ADD UNIQUE KEY `ID_ROLES_PRIVILEGIOS` (`ID_ROLES_PRIVILEGIOS`),
  ADD KEY `ID_ROL` (`ID_ROL`),
  ADD KEY `ID_PRIVILEGIO` (`ID_PRIVILEGIO`);

--
-- Indices de la tabla `tipo_de_apoyo_p`
--
ALTER TABLE `tipo_de_apoyo_p`
  ADD PRIMARY KEY (`Id_Tipo_de_Apoyo`),
  ADD UNIQUE KEY `Id_Tipo_de_Apoyo` (`Id_Tipo_de_Apoyo`);

--
-- Indices de la tabla `tipo_de_apoyo_pil`
--
ALTER TABLE `tipo_de_apoyo_pil`
  ADD PRIMARY KEY (`Id_Tipo_de_Apoyo`),
  ADD UNIQUE KEY `Id_Tipo_de_Apoyo` (`Id_Tipo_de_Apoyo`);

--
-- Indices de la tabla `tipo_de_apoyo_s`
--
ALTER TABLE `tipo_de_apoyo_s`
  ADD PRIMARY KEY (`Id_Tipo_de_Apoyo`),
  ADD UNIQUE KEY `Id_Tipo_de_Apoyo` (`Id_Tipo_de_Apoyo`);

--
-- Indices de la tabla `tipo_de_persona`
--
ALTER TABLE `tipo_de_persona`
  ADD PRIMARY KEY (`Id_Tipo_de_Persona`),
  ADD UNIQUE KEY `Id_Tipo_de_Persona` (`Id_Tipo_de_Persona`);

--
-- Indices de la tabla `tipo_de_platillo`
--
ALTER TABLE `tipo_de_platillo`
  ADD PRIMARY KEY (`Id_Tipo_de_Platillo`),
  ADD UNIQUE KEY `Id_Tipo_de_Platillo` (`Id_Tipo_de_Platillo`);

--
-- Indices de la tabla `tipo_impulso`
--
ALTER TABLE `tipo_impulso`
  ADD PRIMARY KEY (`Id_tipo_impulso`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`ID_USUARIO`),
  ADD UNIQUE KEY `ID_USUARIO` (`ID_USUARIO`),
  ADD KEY `ID_ROL` (`ID_ROL`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alimentacion`
--
ALTER TABLE `alimentacion`
  MODIFY `Id_Alimentacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `alojamiento`
--
ALTER TABLE `alojamiento`
  MODIFY `Id_Alojamiento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `asistencia_social`
--
ALTER TABLE `asistencia_social`
  MODIFY `Id_Asistencia_Social` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `atencion_psicosocial`
--
ALTER TABLE `atencion_psicosocial`
  MODIFY `Id_Atencion_Psicologica` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `comunicacion`
--
ALTER TABLE `comunicacion`
  MODIFY `Id_comunicacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `delito`
--
ALTER TABLE `delito`
  MODIFY `Id_Delito` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `perfil_de_refugio`
--
ALTER TABLE `perfil_de_refugio`
  MODIFY `Id_Perfil_de_Refugio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `Folio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `privilegios`
--
ALTER TABLE `privilegios`
  MODIFY `ID_PRIVILEGIO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `programa_integracion_local`
--
ALTER TABLE `programa_integracion_local`
  MODIFY `Id_PIL` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `ID_ROL` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `roles_privilegios`
--
ALTER TABLE `roles_privilegios`
  MODIFY `ID_ROLES_PRIVILEGIOS` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `tipo_de_apoyo_p`
--
ALTER TABLE `tipo_de_apoyo_p`
  MODIFY `Id_Tipo_de_Apoyo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tipo_de_apoyo_pil`
--
ALTER TABLE `tipo_de_apoyo_pil`
  MODIFY `Id_Tipo_de_Apoyo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tipo_de_apoyo_s`
--
ALTER TABLE `tipo_de_apoyo_s`
  MODIFY `Id_Tipo_de_Apoyo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `tipo_de_persona`
--
ALTER TABLE `tipo_de_persona`
  MODIFY `Id_Tipo_de_Persona` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tipo_de_platillo`
--
ALTER TABLE `tipo_de_platillo`
  MODIFY `Id_Tipo_de_Platillo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `ID_USUARIO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alimentacion`
--
ALTER TABLE `alimentacion`
  ADD CONSTRAINT `alimentacion_ibfk_1` FOREIGN KEY (`Id_Tipo_de_Persona`) REFERENCES `tipo_de_persona` (`Id_Tipo_de_Persona`) ON DELETE CASCADE,
  ADD CONSTRAINT `alimentacion_ibfk_2` FOREIGN KEY (`Id_Tipo_de_Platillo`) REFERENCES `tipo_de_platillo` (`Id_Tipo_de_Platillo`) ON DELETE CASCADE;

--
-- Filtros para la tabla `alojamiento`
--
ALTER TABLE `alojamiento`
  ADD CONSTRAINT `alojamiento_ibfk_1` FOREIGN KEY (`Persona_Id`) REFERENCES `persona` (`Folio`) ON DELETE CASCADE;

--
-- Filtros para la tabla `asistencia_social`
--
ALTER TABLE `asistencia_social`
  ADD CONSTRAINT `asistencia_social_ibfk_1` FOREIGN KEY (`Persona_Id`) REFERENCES `persona` (`Folio`) ON DELETE CASCADE,
  ADD CONSTRAINT `asistencia_social_ibfk_2` FOREIGN KEY (`Tipo_social`) REFERENCES `tipo_de_apoyo_s` (`Id_Tipo_de_Apoyo`) ON DELETE CASCADE;

--
-- Filtros para la tabla `atencion_psicosocial`
--
ALTER TABLE `atencion_psicosocial`
  ADD CONSTRAINT `atencion_psicosocial_ibfk_1` FOREIGN KEY (`Persona_Id`) REFERENCES `persona` (`Folio`) ON DELETE CASCADE,
  ADD CONSTRAINT `atencion_psicosocial_ibfk_2` FOREIGN KEY (`Tipo_psicosocial`) REFERENCES `tipo_de_apoyo_p` (`Id_Tipo_de_Apoyo`) ON DELETE CASCADE;

--
-- Filtros para la tabla `comunicacion`
--
ALTER TABLE `comunicacion`
  ADD CONSTRAINT `comunicacion_ibfk_1` FOREIGN KEY (`Persona_Id`) REFERENCES `persona` (`Folio`) ON DELETE CASCADE;

--
-- Filtros para la tabla `delito`
--
ALTER TABLE `delito`
  ADD CONSTRAINT `delito_ibfk_1` FOREIGN KEY (`Persona_Id`) REFERENCES `persona` (`Folio`);

--
-- Filtros para la tabla `impulso`
--
ALTER TABLE `impulso`
  ADD CONSTRAINT `impulso_ibfk_1` FOREIGN KEY (`Tipo_Impulso`) REFERENCES `tipo_impulso` (`Id_tipo_impulso`) ON DELETE CASCADE;

--
-- Filtros para la tabla `juicio_de_amparo`
--
ALTER TABLE `juicio_de_amparo`
  ADD CONSTRAINT `juicio_de_amparo_ibfk_1` FOREIGN KEY (`Persona_Id`) REFERENCES `persona` (`Folio`) ON DELETE CASCADE;

--
-- Filtros para la tabla `juicio_de_amparo_has_impulso`
--
ALTER TABLE `juicio_de_amparo_has_impulso`
  ADD CONSTRAINT `juicio_de_amparo_has_impulso_ibfk_1` FOREIGN KEY (`Id_Juicio_de_Amparo`) REFERENCES `juicio_de_amparo` (`Id_Juicio_de_Amparo`) ON DELETE CASCADE,
  ADD CONSTRAINT `juicio_de_amparo_has_impulso_ibfk_2` FOREIGN KEY (`Id_Impulso`) REFERENCES `impulso` (`Id_Impulso`) ON DELETE CASCADE;

--
-- Filtros para la tabla `perfil_de_refugio`
--
ALTER TABLE `perfil_de_refugio`
  ADD CONSTRAINT `perfil_de_refugio_ibfk_1` FOREIGN KEY (`Persona_Id`) REFERENCES `persona` (`Folio`) ON DELETE CASCADE;

--
-- Filtros para la tabla `perfil_de_refugio_has_impulso`
--
ALTER TABLE `perfil_de_refugio_has_impulso`
  ADD CONSTRAINT `perfil_de_refugio_has_impulso_ibfk_1` FOREIGN KEY (`Id_Perfil_de_Refugio`) REFERENCES `perfil_de_refugio` (`Id_Perfil_de_Refugio`) ON DELETE CASCADE,
  ADD CONSTRAINT `perfil_de_refugio_has_impulso_ibfk_2` FOREIGN KEY (`Id_Impulso`) REFERENCES `impulso` (`Id_Impulso`) ON DELETE CASCADE;

--
-- Filtros para la tabla `programa_integracion_local`
--
ALTER TABLE `programa_integracion_local`
  ADD CONSTRAINT `programa_integracion_local_ibfk_1` FOREIGN KEY (`Persona_Id`) REFERENCES `persona` (`Folio`) ON DELETE CASCADE,
  ADD CONSTRAINT `programa_integracion_local_ibfk_2` FOREIGN KEY (`Tipo_pil`) REFERENCES `tipo_de_apoyo_pil` (`Id_Tipo_de_Apoyo`) ON DELETE CASCADE;

--
-- Filtros para la tabla `regularizacion_migratorio`
--
ALTER TABLE `regularizacion_migratorio`
  ADD CONSTRAINT `regularizacion_migratorio_ibfk_1` FOREIGN KEY (`Persona_Id`) REFERENCES `persona` (`Folio`) ON DELETE CASCADE;

--
-- Filtros para la tabla `regularizacion_migratorio_has_impulso`
--
ALTER TABLE `regularizacion_migratorio_has_impulso`
  ADD CONSTRAINT `regularizacion_migratorio_has_impulso_ibfk_1` FOREIGN KEY (`Id_Regularización_Migratoria`) REFERENCES `regularizacion_migratorio` (`Id_Regularización_Migratoria`) ON DELETE CASCADE,
  ADD CONSTRAINT `regularizacion_migratorio_has_impulso_ibfk_2` FOREIGN KEY (`Id_Impulso`) REFERENCES `impulso` (`Id_Impulso`) ON DELETE CASCADE;

--
-- Filtros para la tabla `retorno_asistido`
--
ALTER TABLE `retorno_asistido`
  ADD CONSTRAINT `retorno_asistido_ibfk_1` FOREIGN KEY (`Persona_Id`) REFERENCES `persona` (`Folio`) ON DELETE CASCADE;

--
-- Filtros para la tabla `retorno_asistido_has_impulso`
--
ALTER TABLE `retorno_asistido_has_impulso`
  ADD CONSTRAINT `retorno_asistido_has_impulso_ibfk_1` FOREIGN KEY (`Id_Retorno_Asistido`) REFERENCES `retorno_asistido` (`Id_Retorno_Asistido`) ON DELETE CASCADE,
  ADD CONSTRAINT `retorno_asistido_has_impulso_ibfk_2` FOREIGN KEY (`Id_Impulso`) REFERENCES `impulso` (`Id_Impulso`) ON DELETE CASCADE;

--
-- Filtros para la tabla `reufam`
--
ALTER TABLE `reufam`
  ADD CONSTRAINT `reufam_ibfk_1` FOREIGN KEY (`Persona_Id`) REFERENCES `persona` (`Folio`) ON DELETE CASCADE;

--
-- Filtros para la tabla `reufam_has_impulso`
--
ALTER TABLE `reufam_has_impulso`
  ADD CONSTRAINT `reufam_has_impulso_ibfk_1` FOREIGN KEY (`Id_REUFAM`) REFERENCES `reufam` (`Id_REUFAM`),
  ADD CONSTRAINT `reufam_has_impulso_ibfk_2` FOREIGN KEY (`Id_Impulso`) REFERENCES `impulso` (`Id_Impulso`);

--
-- Filtros para la tabla `roles_privilegios`
--
ALTER TABLE `roles_privilegios`
  ADD CONSTRAINT `roles_privilegios_ibfk_1` FOREIGN KEY (`ID_ROL`) REFERENCES `roles` (`ID_ROL`) ON DELETE CASCADE,
  ADD CONSTRAINT `roles_privilegios_ibfk_2` FOREIGN KEY (`ID_PRIVILEGIO`) REFERENCES `privilegios` (`ID_PRIVILEGIO`) ON DELETE CASCADE;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`ID_ROL`) REFERENCES `roles` (`ID_ROL`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
