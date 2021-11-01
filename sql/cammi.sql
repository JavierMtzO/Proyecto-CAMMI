-- phpMyAdmin SQL Dump
-- version 4.9.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 01, 2021 at 07:34 PM
-- Server version: 5.7.26
-- PHP Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `CAMMI`
--

-- --------------------------------------------------------

--
-- Table structure for table `ALIMENTACION`
--

CREATE TABLE `ALIMENTACION` (
  `Id_Alimentacion` int(11) NOT NULL,
  `Fecha` date DEFAULT NULL,
  `Id_Tipo_de_Persona` int(11) DEFAULT NULL,
  `Id_Tipo_de_Platillo` int(11) DEFAULT NULL,
  `Fecha_de_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ALOJAMIENTO`
--

CREATE TABLE `ALOJAMIENTO` (
  `Id_Alojamiento` int(11) NOT NULL,
  `Persona_Id` int(11) DEFAULT NULL,
  `Persona_Refugiada` varchar(10) DEFAULT NULL,
  `Miembro_de_la_Estacion_Migratoria` varchar(10) DEFAULT NULL,
  `Uso_de_Cama` varchar(10) DEFAULT NULL,
  `Alojamiento_con_Costo` varchar(10) DEFAULT NULL,
  `MPP` varchar(10) DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `Fecha_de_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ASISTENCIA_SOCIAL`
--

CREATE TABLE `ASISTENCIA_SOCIAL` (
  `Id_Asistencia_Social` int(11) NOT NULL,
  `Persona_Id` int(11) DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `Tipo_social` int(11) DEFAULT NULL,
  `Formato_de_Atencion` varchar(25) DEFAULT NULL,
  `Fecha_de_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ATENCION_PSICOSOCIAL`
--

CREATE TABLE `ATENCION_PSICOSOCIAL` (
  `Id_Atencion_Psicologica` int(11) NOT NULL,
  `Persona_Id` int(11) DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `Tipo_psicosocial` int(11) DEFAULT NULL,
  `Formato_de_atencion` varchar(25) DEFAULT NULL,
  `Fecha_de_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `COMUNICACION`
--

CREATE TABLE `COMUNICACION` (
  `Id_comunicacion` int(11) NOT NULL,
  `Persona_Id` int(11) DEFAULT NULL,
  `Inicio_Servicio` varchar(10) DEFAULT NULL,
  `Carga_de_Bateria` varchar(10) DEFAULT NULL,
  `Uso_de_Wifi` varchar(10) DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `Pais_Destino_de_Llamada` varchar(25) DEFAULT NULL,
  `Completado_de_la_Llamada` varchar(10) DEFAULT NULL,
  `Mantenimiento_del_Contacto_Familiar` varchar(10) DEFAULT NULL,
  `Fecha_de_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `DELITO`
--

CREATE TABLE `DELITO` (
  `Id_Delito` int(11) NOT NULL,
  `Denuncia` datetime DEFAULT NULL,
  `Denuncia_CAMMI` varchar(10) DEFAULT NULL,
  `Victima_de_Delito` varchar(10) DEFAULT NULL,
  `Carpeta_de_Investigacion` varchar(10) DEFAULT NULL,
  `Persona_Id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `IMPULSO`
--

CREATE TABLE `IMPULSO` (
  `Id_Impulso` int(11) NOT NULL,
  `Descripcion` longtext,
  `Estatus` varchar(20) DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `Tipo_Impulso` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `JUICIO_DE_AMPARO`
--

CREATE TABLE `JUICIO_DE_AMPARO` (
  `Id_Juicio_de_Amparo` int(11) NOT NULL,
  `Inicio` varchar(10) DEFAULT NULL,
  `Inicio_CAMMI` varchar(10) DEFAULT NULL,
  `Resolución` varchar(10) DEFAULT NULL,
  `Persona_Id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `JUICIO_DE_AMPARO_HAS_IMPULSO`
--

CREATE TABLE `JUICIO_DE_AMPARO_HAS_IMPULSO` (
  `Id_Juicio_de_Amparo` int(11) NOT NULL,
  `Id_Impulso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `PERFIL_DE_REFUGIO`
--

CREATE TABLE `PERFIL_DE_REFUGIO` (
  `Id_Perfil_de_Refugio` int(11) NOT NULL,
  `Perfil_de_Refugio` varchar(10) DEFAULT NULL,
  `Certificado_de_Nacionalidad_tramitado_CAMMI` varchar(10) DEFAULT NULL,
  `Inicio_con_CAMMI` varchar(10) DEFAULT NULL,
  `Persona_Id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `PERFIL_DE_REFUGIO_HAS_IMPULSO`
--

CREATE TABLE `PERFIL_DE_REFUGIO_HAS_IMPULSO` (
  `Id_Perfil_de_Refugio` int(11) NOT NULL,
  `Id_Impulso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `PERSONA`
--

CREATE TABLE `PERSONA` (
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
  `Fecha_de_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `PRIVILEGIOS`
--

CREATE TABLE `PRIVILEGIOS` (
  `ID_PRIVILEGIO` int(11) NOT NULL,
  `NOMBRE` varchar(255) DEFAULT NULL,
  `DESCRIPCION` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `PRIVILEGIOS`
--

INSERT INTO `PRIVILEGIOS` (`ID_PRIVILEGIO`, `NOMBRE`, `DESCRIPCION`) VALUES
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
-- Table structure for table `PROGRAMA_INTEGRACION_LOCAL`
--

CREATE TABLE `PROGRAMA_INTEGRACION_LOCAL` (
  `Id_PIL` int(11) NOT NULL,
  `Persona_Id` int(11) DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `Tipo_pil` int(11) DEFAULT NULL,
  `Fecha_de_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `REGULARIZACION_MIGRATORIO`
--

CREATE TABLE `REGULARIZACION_MIGRATORIO` (
  `Id_Regularización_Migratoria` int(11) NOT NULL,
  `Tipo` varchar(10) DEFAULT NULL,
  `Inicio` varchar(10) DEFAULT NULL,
  `Resolución` varchar(10) DEFAULT NULL,
  `Persona_Id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `REGULARIZACION_MIGRATORIO_HAS_IMPULSO`
--

CREATE TABLE `REGULARIZACION_MIGRATORIO_HAS_IMPULSO` (
  `Id_Regularización_Migratoria` int(11) NOT NULL,
  `Id_Impulso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `RETORNO_ASISTIDO`
--

CREATE TABLE `RETORNO_ASISTIDO` (
  `Id_Retorno_Asistido` int(11) NOT NULL,
  `Asesoría_CAMMI` varchar(10) DEFAULT NULL,
  `Acompañamiento_CAMMI` varchar(10) DEFAULT NULL,
  `Persona_Id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `RETORNO_ASISTIDO_HAS_IMPULSO`
--

CREATE TABLE `RETORNO_ASISTIDO_HAS_IMPULSO` (
  `Id_Retorno_Asistido` int(11) NOT NULL,
  `Id_Impulso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `REUFAM`
--

CREATE TABLE `REUFAM` (
  `Id_REUFAM` int(11) NOT NULL,
  `Inicio_CAMMI` varchar(10) DEFAULT NULL,
  `Asesoria` varchar(10) DEFAULT NULL,
  `Persona_Id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `REUFAM_HAS_IMPULSO`
--

CREATE TABLE `REUFAM_HAS_IMPULSO` (
  `Id_REUFAM` int(11) NOT NULL,
  `Id_Impulso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ROLES`
--

CREATE TABLE `ROLES` (
  `ID_ROL` int(11) NOT NULL,
  `NOMBRE` varchar(255) DEFAULT NULL,
  `DESCRIPCION` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ROLES`
--

INSERT INTO `ROLES` (`ID_ROL`, `NOMBRE`, `DESCRIPCION`) VALUES
(1, 'administrador', 'Administrador de todo el sistema. Tiene todos los privilegios'),
(2, 'psicosocial', 'Area psicoscocial, tiene los privilegios de es área'),
(3, 'juridico', 'Area jurídica, tiene los privilegios de esa área'),
(4, 'albergue', 'Area albergue, tiene los privilegios de esa área'),
(5, 'psicosocial-albergue', 'Area psicoscocial y albergue, tiene los privilegios de ambas áreas'),
(6, 'psicosocial-juridico', 'Area psicoscocial y jurídica, tiene los privilegios de ambas áreas'),
(7, 'albergue-juridico', 'Area albergue y jurídica, tiene los privilegios de ambas áreas');

-- --------------------------------------------------------

--
-- Table structure for table `ROLES_PRIVILEGIOS`
--

CREATE TABLE `ROLES_PRIVILEGIOS` (
  `ID_ROLES_PRIVILEGIOS` int(11) NOT NULL,
  `ID_ROL` int(11) DEFAULT NULL,
  `ID_PRIVILEGIO` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ROLES_PRIVILEGIOS`
--

INSERT INTO `ROLES_PRIVILEGIOS` (`ID_ROLES_PRIVILEGIOS`, `ID_ROL`, `ID_PRIVILEGIO`) VALUES
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
-- Table structure for table `TIPO_DE_APOYO_P`
--

CREATE TABLE `TIPO_DE_APOYO_P` (
  `Id_Tipo_de_Apoyo` int(11) NOT NULL,
  `Nombre_Tipo_de_Apoyo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `TIPO_DE_APOYO_P`
--

INSERT INTO `TIPO_DE_APOYO_P` (`Id_Tipo_de_Apoyo`, `Nombre_Tipo_de_Apoyo`) VALUES
(1, 'INTERVENCIÓN PSICOLOGÍA'),
(2, 'EVALUACIÓN  PSICOLÓGICA'),
(3, 'INFORME DE EVALUACIÓN'),
(4, 'ACCESO A LA SALUD FÍSICA'),
(5, 'ACCESO A LA SALUD MENTAL');

-- --------------------------------------------------------

--
-- Table structure for table `TIPO_DE_APOYO_PIL`
--

CREATE TABLE `TIPO_DE_APOYO_PIL` (
  `Id_Tipo_de_Apoyo` int(11) NOT NULL,
  `Nombre_Tipo_de_Apoyo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `TIPO_DE_APOYO_PIL`
--

INSERT INTO `TIPO_DE_APOYO_PIL` (`Id_Tipo_de_Apoyo`, `Nombre_Tipo_de_Apoyo`) VALUES
(1, 'ORIENTACIÓN EDUCACIÓN, VIVIENDA Y TRABAJO');

-- --------------------------------------------------------

--
-- Table structure for table `TIPO_DE_APOYO_S`
--

CREATE TABLE `TIPO_DE_APOYO_S` (
  `Id_Tipo_de_Apoyo` int(11) NOT NULL,
  `Nombre_Tipo_de_Apoyo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `TIPO_DE_APOYO_S`
--

INSERT INTO `TIPO_DE_APOYO_S` (`Id_Tipo_de_Apoyo`, `Nombre_Tipo_de_Apoyo`) VALUES
(1, 'ACCESO A LA EDUCACIÓN- REVALIDACIÓN DE ESTUDIOS'),
(2, 'ACCESO A LA EDUCACIÓN- INCORPORACIÓN'),
(3, 'ACCESO A OPCIONES DE EMPLEO'),
(4, 'ACCESO A OPCIONES DE VIVIENDA '),
(5, 'ACCESO A OPCIONES DE SALUD'),
(6, 'EDUCACIÓN- REGULARIZACIÓN');

-- --------------------------------------------------------

--
-- Table structure for table `TIPO_DE_PERSONA`
--

CREATE TABLE `TIPO_DE_PERSONA` (
  `Id_Tipo_de_Persona` int(11) NOT NULL,
  `Nombre` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `TIPO_DE_PERSONA`
--

INSERT INTO `TIPO_DE_PERSONA` (`Id_Tipo_de_Persona`, `Nombre`) VALUES
(1, 'HOSPEDADO'),
(2, 'PERSONAL '),
(3, 'VOLUNTARIO');

-- --------------------------------------------------------

--
-- Table structure for table `TIPO_DE_PLATILLO`
--

CREATE TABLE `TIPO_DE_PLATILLO` (
  `Id_Tipo_de_Platillo` int(11) NOT NULL,
  `Nombre` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `TIPO_DE_PLATILLO`
--

INSERT INTO `TIPO_DE_PLATILLO` (`Id_Tipo_de_Platillo`, `Nombre`) VALUES
(1, 'DESAYUNO'),
(2, 'COMIDA '),
(3, 'CENA');

-- --------------------------------------------------------

--
-- Table structure for table `TIPO_IMPULSO`
--

CREATE TABLE `TIPO_IMPULSO` (
  `Id_tipo_impulso` int(11) NOT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  `Tipo_de_tramite` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `USUARIOS`
--

CREATE TABLE `USUARIOS` (
  `ID_USUARIO` int(11) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `LASTNAME` varchar(255) DEFAULT NULL,
  `USERNAME` varchar(255) DEFAULT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `ID_ROL` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `USUARIOS`
--

INSERT INTO `USUARIOS` (`ID_USUARIO`, `NAME`, `LASTNAME`, `USERNAME`, `EMAIL`, `PASSWORD`, `ID_ROL`) VALUES
(1, 'Javier', 'Martinez', 'javiermtzo', 'javier@itesm.mx', '$2a$12$PmLn00VvKCEu/eFqdpWBQ.CDFD404oh8Hm7r2a45vE0MqgjIwwFXy', 1),
(2, 'Adrian', 'Torres', 'adrian.torres', 'adrian@itesm.mx', '$2a$12$fRPHY8g1VvfjAcDBfnHnO.hI33JovaQWnuNGc//kxCHVCK5bo09Zu', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ALIMENTACION`
--
ALTER TABLE `ALIMENTACION`
  ADD PRIMARY KEY (`Id_Alimentacion`),
  ADD UNIQUE KEY `Id_Alimentacion` (`Id_Alimentacion`),
  ADD KEY `Id_Tipo_de_Persona` (`Id_Tipo_de_Persona`),
  ADD KEY `Id_Tipo_de_Platillo` (`Id_Tipo_de_Platillo`);

--
-- Indexes for table `ALOJAMIENTO`
--
ALTER TABLE `ALOJAMIENTO`
  ADD PRIMARY KEY (`Id_Alojamiento`),
  ADD UNIQUE KEY `Id_Alojamiento` (`Id_Alojamiento`),
  ADD KEY `Persona_Id` (`Persona_Id`);

--
-- Indexes for table `ASISTENCIA_SOCIAL`
--
ALTER TABLE `ASISTENCIA_SOCIAL`
  ADD PRIMARY KEY (`Id_Asistencia_Social`),
  ADD UNIQUE KEY `Id_Asistencia_Social` (`Id_Asistencia_Social`),
  ADD KEY `Persona_Id` (`Persona_Id`),
  ADD KEY `Tipo_social` (`Tipo_social`);

--
-- Indexes for table `ATENCION_PSICOSOCIAL`
--
ALTER TABLE `ATENCION_PSICOSOCIAL`
  ADD PRIMARY KEY (`Id_Atencion_Psicologica`),
  ADD UNIQUE KEY `Id_Atencion_Psicologica` (`Id_Atencion_Psicologica`),
  ADD KEY `Persona_Id` (`Persona_Id`),
  ADD KEY `Tipo_psicosocial` (`Tipo_psicosocial`);

--
-- Indexes for table `COMUNICACION`
--
ALTER TABLE `COMUNICACION`
  ADD PRIMARY KEY (`Id_comunicacion`),
  ADD UNIQUE KEY `Id_comunicacion` (`Id_comunicacion`),
  ADD KEY `Persona_Id` (`Persona_Id`);

--
-- Indexes for table `DELITO`
--
ALTER TABLE `DELITO`
  ADD PRIMARY KEY (`Id_Delito`),
  ADD KEY `Persona_Id` (`Persona_Id`);

--
-- Indexes for table `IMPULSO`
--
ALTER TABLE `IMPULSO`
  ADD PRIMARY KEY (`Id_Impulso`),
  ADD KEY `Tipo_Impulso` (`Tipo_Impulso`);

--
-- Indexes for table `JUICIO_DE_AMPARO`
--
ALTER TABLE `JUICIO_DE_AMPARO`
  ADD PRIMARY KEY (`Id_Juicio_de_Amparo`),
  ADD KEY `Persona_Id` (`Persona_Id`);

--
-- Indexes for table `JUICIO_DE_AMPARO_HAS_IMPULSO`
--
ALTER TABLE `JUICIO_DE_AMPARO_HAS_IMPULSO`
  ADD PRIMARY KEY (`Id_Juicio_de_Amparo`,`Id_Impulso`),
  ADD KEY `Id_Impulso` (`Id_Impulso`);

--
-- Indexes for table `PERFIL_DE_REFUGIO`
--
ALTER TABLE `PERFIL_DE_REFUGIO`
  ADD PRIMARY KEY (`Id_Perfil_de_Refugio`),
  ADD UNIQUE KEY `Id_Perfil_de_Refugio` (`Id_Perfil_de_Refugio`),
  ADD KEY `Persona_Id` (`Persona_Id`);

--
-- Indexes for table `PERFIL_DE_REFUGIO_HAS_IMPULSO`
--
ALTER TABLE `PERFIL_DE_REFUGIO_HAS_IMPULSO`
  ADD PRIMARY KEY (`Id_Perfil_de_Refugio`,`Id_Impulso`),
  ADD KEY `Id_Impulso` (`Id_Impulso`);

--
-- Indexes for table `PERSONA`
--
ALTER TABLE `PERSONA`
  ADD PRIMARY KEY (`Folio`),
  ADD UNIQUE KEY `Folio` (`Folio`);

--
-- Indexes for table `PRIVILEGIOS`
--
ALTER TABLE `PRIVILEGIOS`
  ADD PRIMARY KEY (`ID_PRIVILEGIO`),
  ADD UNIQUE KEY `ID_PRIVILEGIO` (`ID_PRIVILEGIO`);

--
-- Indexes for table `PROGRAMA_INTEGRACION_LOCAL`
--
ALTER TABLE `PROGRAMA_INTEGRACION_LOCAL`
  ADD PRIMARY KEY (`Id_PIL`),
  ADD UNIQUE KEY `Id_PIL` (`Id_PIL`),
  ADD KEY `Persona_Id` (`Persona_Id`),
  ADD KEY `Tipo_pil` (`Tipo_pil`);

--
-- Indexes for table `REGULARIZACION_MIGRATORIO`
--
ALTER TABLE `REGULARIZACION_MIGRATORIO`
  ADD PRIMARY KEY (`Id_Regularización_Migratoria`),
  ADD KEY `Persona_Id` (`Persona_Id`);

--
-- Indexes for table `REGULARIZACION_MIGRATORIO_HAS_IMPULSO`
--
ALTER TABLE `REGULARIZACION_MIGRATORIO_HAS_IMPULSO`
  ADD PRIMARY KEY (`Id_Regularización_Migratoria`,`Id_Impulso`),
  ADD KEY `Id_Impulso` (`Id_Impulso`);

--
-- Indexes for table `RETORNO_ASISTIDO`
--
ALTER TABLE `RETORNO_ASISTIDO`
  ADD PRIMARY KEY (`Id_Retorno_Asistido`),
  ADD KEY `Persona_Id` (`Persona_Id`);

--
-- Indexes for table `RETORNO_ASISTIDO_HAS_IMPULSO`
--
ALTER TABLE `RETORNO_ASISTIDO_HAS_IMPULSO`
  ADD PRIMARY KEY (`Id_Retorno_Asistido`,`Id_Impulso`),
  ADD KEY `Id_Impulso` (`Id_Impulso`);

--
-- Indexes for table `REUFAM`
--
ALTER TABLE `REUFAM`
  ADD PRIMARY KEY (`Id_REUFAM`),
  ADD KEY `Persona_Id` (`Persona_Id`);

--
-- Indexes for table `REUFAM_HAS_IMPULSO`
--
ALTER TABLE `REUFAM_HAS_IMPULSO`
  ADD PRIMARY KEY (`Id_REUFAM`,`Id_Impulso`),
  ADD KEY `Id_Impulso` (`Id_Impulso`);

--
-- Indexes for table `ROLES`
--
ALTER TABLE `ROLES`
  ADD PRIMARY KEY (`ID_ROL`),
  ADD UNIQUE KEY `ID_ROL` (`ID_ROL`);

--
-- Indexes for table `ROLES_PRIVILEGIOS`
--
ALTER TABLE `ROLES_PRIVILEGIOS`
  ADD PRIMARY KEY (`ID_ROLES_PRIVILEGIOS`),
  ADD UNIQUE KEY `ID_ROLES_PRIVILEGIOS` (`ID_ROLES_PRIVILEGIOS`),
  ADD KEY `ID_ROL` (`ID_ROL`),
  ADD KEY `ID_PRIVILEGIO` (`ID_PRIVILEGIO`);

--
-- Indexes for table `TIPO_DE_APOYO_P`
--
ALTER TABLE `TIPO_DE_APOYO_P`
  ADD PRIMARY KEY (`Id_Tipo_de_Apoyo`),
  ADD UNIQUE KEY `Id_Tipo_de_Apoyo` (`Id_Tipo_de_Apoyo`);

--
-- Indexes for table `TIPO_DE_APOYO_PIL`
--
ALTER TABLE `TIPO_DE_APOYO_PIL`
  ADD PRIMARY KEY (`Id_Tipo_de_Apoyo`),
  ADD UNIQUE KEY `Id_Tipo_de_Apoyo` (`Id_Tipo_de_Apoyo`);

--
-- Indexes for table `TIPO_DE_APOYO_S`
--
ALTER TABLE `TIPO_DE_APOYO_S`
  ADD PRIMARY KEY (`Id_Tipo_de_Apoyo`),
  ADD UNIQUE KEY `Id_Tipo_de_Apoyo` (`Id_Tipo_de_Apoyo`);

--
-- Indexes for table `TIPO_DE_PERSONA`
--
ALTER TABLE `TIPO_DE_PERSONA`
  ADD PRIMARY KEY (`Id_Tipo_de_Persona`),
  ADD UNIQUE KEY `Id_Tipo_de_Persona` (`Id_Tipo_de_Persona`);

--
-- Indexes for table `TIPO_DE_PLATILLO`
--
ALTER TABLE `TIPO_DE_PLATILLO`
  ADD PRIMARY KEY (`Id_Tipo_de_Platillo`),
  ADD UNIQUE KEY `Id_Tipo_de_Platillo` (`Id_Tipo_de_Platillo`);

--
-- Indexes for table `TIPO_IMPULSO`
--
ALTER TABLE `TIPO_IMPULSO`
  ADD PRIMARY KEY (`Id_tipo_impulso`);

--
-- Indexes for table `USUARIOS`
--
ALTER TABLE `USUARIOS`
  ADD PRIMARY KEY (`ID_USUARIO`),
  ADD UNIQUE KEY `ID_USUARIO` (`ID_USUARIO`),
  ADD KEY `ID_ROL` (`ID_ROL`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ALIMENTACION`
--
ALTER TABLE `ALIMENTACION`
  MODIFY `Id_Alimentacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ALOJAMIENTO`
--
ALTER TABLE `ALOJAMIENTO`
  MODIFY `Id_Alojamiento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ASISTENCIA_SOCIAL`
--
ALTER TABLE `ASISTENCIA_SOCIAL`
  MODIFY `Id_Asistencia_Social` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ATENCION_PSICOSOCIAL`
--
ALTER TABLE `ATENCION_PSICOSOCIAL`
  MODIFY `Id_Atencion_Psicologica` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `COMUNICACION`
--
ALTER TABLE `COMUNICACION`
  MODIFY `Id_comunicacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `PERFIL_DE_REFUGIO`
--
ALTER TABLE `PERFIL_DE_REFUGIO`
  MODIFY `Id_Perfil_de_Refugio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `PERSONA`
--
ALTER TABLE `PERSONA`
  MODIFY `Folio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `PRIVILEGIOS`
--
ALTER TABLE `PRIVILEGIOS`
  MODIFY `ID_PRIVILEGIO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `PROGRAMA_INTEGRACION_LOCAL`
--
ALTER TABLE `PROGRAMA_INTEGRACION_LOCAL`
  MODIFY `Id_PIL` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ROLES`
--
ALTER TABLE `ROLES`
  MODIFY `ID_ROL` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `ROLES_PRIVILEGIOS`
--
ALTER TABLE `ROLES_PRIVILEGIOS`
  MODIFY `ID_ROLES_PRIVILEGIOS` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `TIPO_DE_APOYO_P`
--
ALTER TABLE `TIPO_DE_APOYO_P`
  MODIFY `Id_Tipo_de_Apoyo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `TIPO_DE_APOYO_PIL`
--
ALTER TABLE `TIPO_DE_APOYO_PIL`
  MODIFY `Id_Tipo_de_Apoyo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `TIPO_DE_APOYO_S`
--
ALTER TABLE `TIPO_DE_APOYO_S`
  MODIFY `Id_Tipo_de_Apoyo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `TIPO_DE_PERSONA`
--
ALTER TABLE `TIPO_DE_PERSONA`
  MODIFY `Id_Tipo_de_Persona` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `TIPO_DE_PLATILLO`
--
ALTER TABLE `TIPO_DE_PLATILLO`
  MODIFY `Id_Tipo_de_Platillo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `USUARIOS`
--
ALTER TABLE `USUARIOS`
  MODIFY `ID_USUARIO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ALIMENTACION`
--
ALTER TABLE `ALIMENTACION`
  ADD CONSTRAINT `alimentacion_ibfk_1` FOREIGN KEY (`Id_Tipo_de_Persona`) REFERENCES `TIPO_DE_PERSONA` (`Id_Tipo_de_Persona`) ON DELETE CASCADE,
  ADD CONSTRAINT `alimentacion_ibfk_2` FOREIGN KEY (`Id_Tipo_de_Platillo`) REFERENCES `TIPO_DE_PLATILLO` (`Id_Tipo_de_Platillo`) ON DELETE CASCADE;

--
-- Constraints for table `ALOJAMIENTO`
--
ALTER TABLE `ALOJAMIENTO`
  ADD CONSTRAINT `alojamiento_ibfk_1` FOREIGN KEY (`Persona_Id`) REFERENCES `PERSONA` (`Folio`) ON DELETE CASCADE;

--
-- Constraints for table `ASISTENCIA_SOCIAL`
--
ALTER TABLE `ASISTENCIA_SOCIAL`
  ADD CONSTRAINT `asistencia_social_ibfk_1` FOREIGN KEY (`Persona_Id`) REFERENCES `PERSONA` (`Folio`) ON DELETE CASCADE,
  ADD CONSTRAINT `asistencia_social_ibfk_2` FOREIGN KEY (`Tipo_social`) REFERENCES `TIPO_DE_APOYO_S` (`Id_Tipo_de_Apoyo`) ON DELETE CASCADE;

--
-- Constraints for table `ATENCION_PSICOSOCIAL`
--
ALTER TABLE `ATENCION_PSICOSOCIAL`
  ADD CONSTRAINT `atencion_psicosocial_ibfk_1` FOREIGN KEY (`Persona_Id`) REFERENCES `PERSONA` (`Folio`) ON DELETE CASCADE,
  ADD CONSTRAINT `atencion_psicosocial_ibfk_2` FOREIGN KEY (`Tipo_psicosocial`) REFERENCES `TIPO_DE_APOYO_P` (`Id_Tipo_de_Apoyo`) ON DELETE CASCADE;

--
-- Constraints for table `COMUNICACION`
--
ALTER TABLE `COMUNICACION`
  ADD CONSTRAINT `comunicacion_ibfk_1` FOREIGN KEY (`Persona_Id`) REFERENCES `PERSONA` (`Folio`) ON DELETE CASCADE;

--
-- Constraints for table `DELITO`
--
ALTER TABLE `DELITO`
  ADD CONSTRAINT `delito_ibfk_1` FOREIGN KEY (`Persona_Id`) REFERENCES `PERSONA` (`Folio`) ON DELETE CASCADE;

--
-- Constraints for table `IMPULSO`
--
ALTER TABLE `IMPULSO`
  ADD CONSTRAINT `impulso_ibfk_1` FOREIGN KEY (`Tipo_Impulso`) REFERENCES `TIPO_IMPULSO` (`Id_tipo_impulso`) ON DELETE CASCADE;

--
-- Constraints for table `JUICIO_DE_AMPARO`
--
ALTER TABLE `JUICIO_DE_AMPARO`
  ADD CONSTRAINT `juicio_de_amparo_ibfk_1` FOREIGN KEY (`Persona_Id`) REFERENCES `PERSONA` (`Folio`) ON DELETE CASCADE;

--
-- Constraints for table `JUICIO_DE_AMPARO_HAS_IMPULSO`
--
ALTER TABLE `JUICIO_DE_AMPARO_HAS_IMPULSO`
  ADD CONSTRAINT `juicio_de_amparo_has_impulso_ibfk_1` FOREIGN KEY (`Id_Juicio_de_Amparo`) REFERENCES `JUICIO_DE_AMPARO` (`Id_Juicio_de_Amparo`) ON DELETE CASCADE,
  ADD CONSTRAINT `juicio_de_amparo_has_impulso_ibfk_2` FOREIGN KEY (`Id_Impulso`) REFERENCES `IMPULSO` (`Id_Impulso`) ON DELETE CASCADE;

--
-- Constraints for table `PERFIL_DE_REFUGIO`
--
ALTER TABLE `PERFIL_DE_REFUGIO`
  ADD CONSTRAINT `perfil_de_refugio_ibfk_1` FOREIGN KEY (`Persona_Id`) REFERENCES `PERSONA` (`Folio`) ON DELETE CASCADE;

--
-- Constraints for table `PERFIL_DE_REFUGIO_HAS_IMPULSO`
--
ALTER TABLE `PERFIL_DE_REFUGIO_HAS_IMPULSO`
  ADD CONSTRAINT `perfil_de_refugio_has_impulso_ibfk_1` FOREIGN KEY (`Id_Perfil_de_Refugio`) REFERENCES `PERFIL_DE_REFUGIO` (`Id_Perfil_de_Refugio`) ON DELETE CASCADE,
  ADD CONSTRAINT `perfil_de_refugio_has_impulso_ibfk_2` FOREIGN KEY (`Id_Impulso`) REFERENCES `IMPULSO` (`Id_Impulso`) ON DELETE CASCADE;

--
-- Constraints for table `PROGRAMA_INTEGRACION_LOCAL`
--
ALTER TABLE `PROGRAMA_INTEGRACION_LOCAL`
  ADD CONSTRAINT `programa_integracion_local_ibfk_1` FOREIGN KEY (`Persona_Id`) REFERENCES `PERSONA` (`Folio`) ON DELETE CASCADE,
  ADD CONSTRAINT `programa_integracion_local_ibfk_2` FOREIGN KEY (`Tipo_pil`) REFERENCES `TIPO_DE_APOYO_PIL` (`Id_Tipo_de_Apoyo`) ON DELETE CASCADE;

--
-- Constraints for table `REGULARIZACION_MIGRATORIO`
--
ALTER TABLE `REGULARIZACION_MIGRATORIO`
  ADD CONSTRAINT `regularizacion_migratorio_ibfk_1` FOREIGN KEY (`Persona_Id`) REFERENCES `PERSONA` (`Folio`) ON DELETE CASCADE;

--
-- Constraints for table `REGULARIZACION_MIGRATORIO_HAS_IMPULSO`
--
ALTER TABLE `REGULARIZACION_MIGRATORIO_HAS_IMPULSO`
  ADD CONSTRAINT `regularizacion_migratorio_has_impulso_ibfk_1` FOREIGN KEY (`Id_Regularización_Migratoria`) REFERENCES `REGULARIZACION_MIGRATORIO` (`Id_Regularización_Migratoria`) ON DELETE CASCADE,
  ADD CONSTRAINT `regularizacion_migratorio_has_impulso_ibfk_2` FOREIGN KEY (`Id_Impulso`) REFERENCES `IMPULSO` (`Id_Impulso`) ON DELETE CASCADE;

--
-- Constraints for table `RETORNO_ASISTIDO`
--
ALTER TABLE `RETORNO_ASISTIDO`
  ADD CONSTRAINT `retorno_asistido_ibfk_1` FOREIGN KEY (`Persona_Id`) REFERENCES `PERSONA` (`Folio`) ON DELETE CASCADE;

--
-- Constraints for table `RETORNO_ASISTIDO_HAS_IMPULSO`
--
ALTER TABLE `RETORNO_ASISTIDO_HAS_IMPULSO`
  ADD CONSTRAINT `retorno_asistido_has_impulso_ibfk_1` FOREIGN KEY (`Id_Retorno_Asistido`) REFERENCES `RETORNO_ASISTIDO` (`Id_Retorno_Asistido`) ON DELETE CASCADE,
  ADD CONSTRAINT `retorno_asistido_has_impulso_ibfk_2` FOREIGN KEY (`Id_Impulso`) REFERENCES `IMPULSO` (`Id_Impulso`) ON DELETE CASCADE;

--
-- Constraints for table `REUFAM`
--
ALTER TABLE `REUFAM`
  ADD CONSTRAINT `reufam_ibfk_1` FOREIGN KEY (`Persona_Id`) REFERENCES `PERSONA` (`Folio`) ON DELETE CASCADE;

--
-- Constraints for table `REUFAM_HAS_IMPULSO`
--
ALTER TABLE `REUFAM_HAS_IMPULSO`
  ADD CONSTRAINT `reufam_has_impulso_ibfk_1` FOREIGN KEY (`Id_REUFAM`) REFERENCES `REUFAM` (`Id_REUFAM`),
  ADD CONSTRAINT `reufam_has_impulso_ibfk_2` FOREIGN KEY (`Id_Impulso`) REFERENCES `IMPULSO` (`Id_Impulso`);

--
-- Constraints for table `ROLES_PRIVILEGIOS`
--
ALTER TABLE `ROLES_PRIVILEGIOS`
  ADD CONSTRAINT `roles_privilegios_ibfk_1` FOREIGN KEY (`ID_ROL`) REFERENCES `ROLES` (`ID_ROL`) ON DELETE CASCADE,
  ADD CONSTRAINT `roles_privilegios_ibfk_2` FOREIGN KEY (`ID_PRIVILEGIO`) REFERENCES `PRIVILEGIOS` (`ID_PRIVILEGIO`) ON DELETE CASCADE;

--
-- Constraints for table `USUARIOS`
--
ALTER TABLE `USUARIOS`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`ID_ROL`) REFERENCES `ROLES` (`ID_ROL`) ON DELETE CASCADE;
