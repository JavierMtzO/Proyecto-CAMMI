-- phpMyAdmin SQL Dump
-- version 4.9.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 25, 2021 at 04:26 PM
-- Server version: 5.7.26
-- PHP Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `cammi`
--

-- --------------------------------------------------------

--
-- Table structure for table `alimentacion`
--

CREATE TABLE `alimentacion` (
  `Id_Alimentacion` int(11) NOT NULL,
  `Fecha` date DEFAULT NULL,
  `Id_Tipo_de_Persona` int(11) DEFAULT NULL,
  `Id_Tipo_de_Platillo` int(11) DEFAULT NULL,
  `Fecha_de_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `alimentacion`
--

INSERT INTO `alimentacion` (`Id_Alimentacion`, `Fecha`, `Id_Tipo_de_Persona`, `Id_Tipo_de_Platillo`, `Fecha_de_registro`) VALUES
(1, '2021-11-24', 2, 1, '2021-11-24 18:47:12'),
(2, '2021-11-23', 3, 3, '2021-11-24 19:44:10'),
(3, '2021-11-22', 3, 3, '2021-11-24 19:44:19');

-- --------------------------------------------------------

--
-- Table structure for table `alojamiento`
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
  `Fecha_de_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `alojamiento`
--

INSERT INTO `alojamiento` (`Id_Alojamiento`, `Persona_Id`, `Persona_Refugiada`, `Miembro_de_la_Estacion_Migratoria`, `Uso_de_Cama`, `Alojamiento_con_Costo`, `MPP`, `Fecha`, `Fecha_de_registro`) VALUES
(1, 1, 'SI', 'SI', 'NO', 'NO', 'SI', '2021-11-15', '2021-11-16 04:33:44'),
(2, 1, 'SI', 'SI', 'SI', 'SI', 'SI', '2021-11-14', '2021-11-16 05:09:00');

-- --------------------------------------------------------

--
-- Table structure for table `asistencia_social`
--

CREATE TABLE `asistencia_social` (
  `Id_Asistencia_Social` int(11) NOT NULL,
  `Persona_Id` int(11) DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `Tipo_social` int(11) DEFAULT NULL,
  `Formato_de_Atencion` varchar(25) DEFAULT NULL,
  `Inicio` varchar(10) NOT NULL,
  `Canalizacion` varchar(40) NOT NULL,
  `Fecha_de_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `asistencia_social`
--

INSERT INTO `asistencia_social` (`Id_Asistencia_Social`, `Persona_Id`, `Fecha`, `Tipo_social`, `Formato_de_Atencion`, `Inicio`, `Canalizacion`, `Fecha_de_registro`) VALUES
(2, 2, '2021-11-24', 3, 'VIDEOLLAMADA', 'SI', 'PIL', '2021-11-24 18:30:52');

-- --------------------------------------------------------

--
-- Table structure for table `atencion_psicosocial`
--

CREATE TABLE `atencion_psicosocial` (
  `Id_Atencion_Psicologica` int(11) NOT NULL,
  `Persona_Id` int(11) DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `Tipo_psicosocial` int(11) DEFAULT NULL,
  `Formato_de_atencion` varchar(25) DEFAULT NULL,
  `Inicio` varchar(10) NOT NULL,
  `Fecha_de_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `atencion_psicosocial`
--

INSERT INTO `atencion_psicosocial` (`Id_Atencion_Psicologica`, `Persona_Id`, `Fecha`, `Tipo_psicosocial`, `Formato_de_atencion`, `Inicio`, `Fecha_de_registro`) VALUES
(1, 1, '2021-11-19', 1, 'TELEF??NICA', 'NO', '2021-11-24 09:25:42'),
(2, 1, '2021-11-23', 3, 'VIDEOLLAMADA', 'NO', '2021-11-24 17:55:38');

-- --------------------------------------------------------

--
-- Table structure for table `comunicacion`
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
  `Fecha_de_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `comunicacion`
--

INSERT INTO `comunicacion` (`Id_comunicacion`, `Persona_Id`, `Inicio_Servicio`, `Carga_de_Bateria`, `Uso_de_Wifi`, `Fecha`, `Pais_Destino_de_Llamada`, `Completado_de_la_Llamada`, `Mantenimiento_del_Contacto_Familiar`, `Fecha_de_registro`) VALUES
(1, 1, 'SI', 'SI', 'SI', '2021-11-24', 'CANAD??', 'SI', 'RCF', '2021-11-24 06:43:17');

-- --------------------------------------------------------

--
-- Table structure for table `delito`
--

CREATE TABLE `delito` (
  `Id_Delito` int(11) NOT NULL,
  `Persona_Id` int(11) DEFAULT NULL,
  `Denuncia` date DEFAULT NULL,
  `Denuncia_CAMMI` varchar(10) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `Victima_de_Delito` varchar(10) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `Carpeta_de_Investigacion` varchar(10) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `Fecha_de_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `delito`
--

INSERT INTO `delito` (`Id_Delito`, `Persona_Id`, `Denuncia`, `Denuncia_CAMMI`, `Victima_de_Delito`, `Carpeta_de_Investigacion`, `Fecha_de_registro`) VALUES
(1, 1, '2021-11-23', 'SI', 'SI', 'SI', '2021-11-24 05:18:58');

-- --------------------------------------------------------

--
-- Table structure for table `impulso`
--

CREATE TABLE `impulso` (
  `Id_Impulso` int(11) NOT NULL,
  `Descripcion` longtext COLLATE utf8_spanish2_ci,
  `Estatus` varchar(20) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `Tipo_Impulso` int(11) DEFAULT NULL,
  `Fecha_de_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Table structure for table `juicio_de_amparo`
--

CREATE TABLE `juicio_de_amparo` (
  `Id_Juicio_de_Amparo` int(11) NOT NULL,
  `Persona_Id` int(11) DEFAULT NULL,
  `Inicio` varchar(10) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `Inicio_CAMMI` varchar(10) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `Resolucion` varchar(10) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `Fecha` date NOT NULL,
  `Fecha_de_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `juicio_de_amparo`
--

INSERT INTO `juicio_de_amparo` (`Id_Juicio_de_Amparo`, `Persona_Id`, `Inicio`, `Inicio_CAMMI`, `Resolucion`, `Fecha`, `Fecha_de_registro`) VALUES
(1, 1, 'SI', 'SI', 'SI', '2021-11-24', '2021-11-24 05:54:30');

-- --------------------------------------------------------

--
-- Table structure for table `juicio_de_amparo_has_impulso`
--

CREATE TABLE `juicio_de_amparo_has_impulso` (
  `Id_Juicio_de_Amparo` int(11) NOT NULL,
  `Id_Impulso` int(11) NOT NULL,
  `Fecha_de_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Table structure for table `perfil_de_refugio`
--

CREATE TABLE `perfil_de_refugio` (
  `Id_Perfil_de_Refugio` int(11) NOT NULL,
  `Persona_Id` int(11) DEFAULT NULL,
  `Perfil_de_Refugio` varchar(10) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `Certificado_de_Nacionalidad_tramitado_CAMMI` varchar(10) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `Inicio_con_CAMMI` varchar(10) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `Fecha_de_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `perfil_de_refugio`
--

INSERT INTO `perfil_de_refugio` (`Id_Perfil_de_Refugio`, `Persona_Id`, `Perfil_de_Refugio`, `Certificado_de_Nacionalidad_tramitado_CAMMI`, `Inicio_con_CAMMI`, `Fecha`, `Fecha_de_registro`) VALUES
(1, 1, 'SI', 'SI', 'SI', '2021-11-23', '2021-11-24 05:46:55');

-- --------------------------------------------------------

--
-- Table structure for table `perfil_de_refugio_has_impulso`
--

CREATE TABLE `perfil_de_refugio_has_impulso` (
  `Id_Perfil_de_Refugio` int(11) NOT NULL,
  `Id_Impulso` int(11) NOT NULL,
  `Fecha_de_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Table structure for table `persona`
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
  `Fecha_de_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `persona`
--

INSERT INTO `persona` (`Folio`, `Nombre`, `Edad`, `Rango_de_Edad`, `Genero`, `Nacionalidad`, `Discapacidad`, `Contacto`, `LGBT`, `Dispositivo_propio`, `RFC`, `NSS`, `Asesoria`, `Acompanado`, `Fecha_de_registro`) VALUES
(1, 'Adri??n Torres Hern??ndez', 21, 'NN: 0-11 a??os', 'MASCULINO', 'ARGENTINA', 'NO', '', 'NO', 'NO', '', '', 'NO', 'NO', '2021-11-16 04:41:44'),
(2, 'Javier Martinez Olivares', 22, 'Adul: 18-59 a??os', 'MASCULINO', 'HONDURAS', 'NO', 'javier@itesm.mx', 'NO', 'SI', 'JMAO991234', '1569853', 'NO', 'SI', '2021-11-16 04:41:32');

-- --------------------------------------------------------

--
-- Table structure for table `privilegios`
--

CREATE TABLE `privilegios` (
  `ID_PRIVILEGIO` int(11) NOT NULL,
  `NOMBRE` varchar(255) DEFAULT NULL,
  `DESCRIPCION` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `privilegios`
--

INSERT INTO `privilegios` (`ID_PRIVILEGIO`, `NOMBRE`, `DESCRIPCION`) VALUES
(1, 'Agregar usuario', 'Poder agregar usuario con su respectivo rol'),
(2, 'Editar usuario', 'Editar la informaci??n del usuario'),
(3, 'Eliminar usuario', 'Eliminar un usuario usuario'),
(4, 'Agregar persona', 'Agregar un migrante al sistema'),
(5, 'Editar persona', 'Editar un migrante en espec??fico'),
(6, 'Eliminar persona', 'Eliminar un migrante del sistema'),
(7, 'Consultar persona', 'Consultar un migrante del sistema'),
(8, 'Agregar nueva persona a Atenci??n psicosocial', 'Agrega un nuevo migrante y especifica la atenci??n psicosocial atendida'),
(9, 'Agregar persona ya existente a Atenci??n psicosocial', 'Agrega un nuevo migrante y especifica la atenci??n psicosocial atendida'),
(10, 'Eliminar persona de Atenci??n psicosocial', 'Elimina un migrante de atenci??n psicosocial'),
(11, 'Agregar nueva persona a Programa de Integraci??n Local', 'Agrega un nuevo migrante y especifica el Programa de Integraci??n Local'),
(12, 'Agregar persona ya existente a Programa de Integraci??n Local', 'Agrega un migrante ya existente al Programa de Integraci??n Local'),
(13, 'Eliminar persona del Programa de Integraci??n Local', 'Elimina un migrante del Programa de Integraci??n Local'),
(14, 'Agregar nueva persona a Asistencia Social', 'Agrega un nuevo migrante y especifica la asistencia social que recibe'),
(15, 'Agregar persona ya existente a Asistencia Social', 'Agrega un migrante ya existente y especifica la asistencia social que recibe'),
(16, 'Eliminar persona de Asistencia Social', 'Elimina un migrante de la Asistencia Social'),
(17, 'Agregar persona a Alojamiento', 'Agrega un migrante al alojamiento'),
(18, 'Eliminar persona de Alojamiento', 'Elimina un migrante del alojamiento'),
(19, 'Agregar servicio de comunicacion a persona', 'Agrega un persona que recibi?? servicio de comunicaci??n'),
(20, 'Eliminar servicio de comunicaci??n a la persona', 'Eliminar servicio de comunicaci??n a la persona');

-- --------------------------------------------------------

--
-- Table structure for table `programa_integracion_local`
--

CREATE TABLE `programa_integracion_local` (
  `Id_PIL` int(11) NOT NULL,
  `Persona_Id` int(11) DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `Tipo_pil` int(11) DEFAULT NULL,
  `Inicio` varchar(10) NOT NULL,
  `Fecha_de_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `programa_integracion_local`
--

INSERT INTO `programa_integracion_local` (`Id_PIL`, `Persona_Id`, `Fecha`, `Tipo_pil`, `Inicio`, `Fecha_de_registro`) VALUES
(1, 2, '2021-11-24', 1, 'SI', '2021-11-24 09:30:05');

-- --------------------------------------------------------

--
-- Table structure for table `regularizacion_migratorio`
--

CREATE TABLE `regularizacion_migratorio` (
  `Id_Regularizaci??n_Migratoria` int(11) NOT NULL,
  `Persona_Id` int(11) DEFAULT NULL,
  `Tipo` varchar(10) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `Inicio` varchar(10) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `Resolucion` varchar(10) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `Fecha` date NOT NULL,
  `Fecha_de_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `regularizacion_migratorio`
--

INSERT INTO `regularizacion_migratorio` (`Id_Regularizaci??n_Migratoria`, `Persona_Id`, `Tipo`, `Inicio`, `Resolucion`, `Fecha`, `Fecha_de_registro`) VALUES
(1, 1, 'RH(RCR)', 'SI', 'SI', '2021-11-24', '2021-11-24 06:01:44');

-- --------------------------------------------------------

--
-- Table structure for table `regularizacion_migratorio_has_impulso`
--

CREATE TABLE `regularizacion_migratorio_has_impulso` (
  `Id_Regularizaci??n_Migratoria` int(11) NOT NULL,
  `Id_Impulso` int(11) NOT NULL,
  `Fecha_de_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Table structure for table `retorno_asistido`
--

CREATE TABLE `retorno_asistido` (
  `Id_Retorno_Asistido` int(11) NOT NULL,
  `Persona_Id` int(11) DEFAULT NULL,
  `Asesor??a_CAMMI` varchar(10) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `Acompa??amiento_CAMMI` varchar(10) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `Fecha` date NOT NULL,
  `Fecha_de_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `retorno_asistido`
--

INSERT INTO `retorno_asistido` (`Id_Retorno_Asistido`, `Persona_Id`, `Asesor??a_CAMMI`, `Acompa??amiento_CAMMI`, `Fecha`, `Fecha_de_registro`) VALUES
(1, 1, 'SI', 'SI', '2021-11-23', '2021-11-24 05:51:33');

-- --------------------------------------------------------

--
-- Table structure for table `retorno_asistido_has_impulso`
--

CREATE TABLE `retorno_asistido_has_impulso` (
  `Id_Retorno_Asistido` int(11) NOT NULL,
  `Id_Impulso` int(11) NOT NULL,
  `Fecha_de_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reufam`
--

CREATE TABLE `reufam` (
  `Id_REUFAM` int(11) NOT NULL,
  `Persona_Id` int(11) DEFAULT NULL,
  `Inicio_CAMMI` varchar(10) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `Asesoria` varchar(10) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `Fecha` date NOT NULL,
  `Fecha_de_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `reufam`
--

INSERT INTO `reufam` (`Id_REUFAM`, `Persona_Id`, `Inicio_CAMMI`, `Asesoria`, `Fecha`, `Fecha_de_registro`) VALUES
(1, 1, 'SI', 'SI', '2021-11-23', '2021-11-24 05:59:00');

-- --------------------------------------------------------

--
-- Table structure for table `reufam_has_impulso`
--

CREATE TABLE `reufam_has_impulso` (
  `Id_REUFAM` int(11) NOT NULL,
  `Id_Impulso` int(11) NOT NULL,
  `Fecha_de_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `ID_ROL` int(11) NOT NULL,
  `NOMBRE` varchar(255) DEFAULT NULL,
  `DESCRIPCION` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`ID_ROL`, `NOMBRE`, `DESCRIPCION`) VALUES
(1, 'administrador', 'Administrador de todo el sistema. Tiene todos los privilegios'),
(2, 'psicosocial', 'Area psicoscocial, tiene los privilegios de es ??rea'),
(3, 'juridico', 'Area jur??dica, tiene los privilegios de esa ??rea'),
(4, 'albergue', 'Area albergue, tiene los privilegios de esa ??rea'),
(5, 'psicosocial-albergue', 'Area psicoscocial y albergue, tiene los privilegios de ambas ??reas'),
(6, 'psicosocial-juridico', 'Area psicoscocial y jur??dica, tiene los privilegios de ambas ??reas'),
(7, 'albergue-juridico', 'Area albergue y jur??dica, tiene los privilegios de ambas ??reas');

-- --------------------------------------------------------

--
-- Table structure for table `roles_privilegios`
--

CREATE TABLE `roles_privilegios` (
  `ID_ROLES_PRIVILEGIOS` int(11) NOT NULL,
  `ID_ROL` int(11) DEFAULT NULL,
  `ID_PRIVILEGIO` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `roles_privilegios`
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
-- Table structure for table `tipo_de_apoyo_p`
--

CREATE TABLE `tipo_de_apoyo_p` (
  `Id_Tipo_de_Apoyo` int(11) NOT NULL,
  `Nombre_Tipo_de_Apoyo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tipo_de_apoyo_p`
--

INSERT INTO `tipo_de_apoyo_p` (`Id_Tipo_de_Apoyo`, `Nombre_Tipo_de_Apoyo`) VALUES
(1, 'INTERVENCI??N PSICOLOG??A'),
(2, 'EVALUACI??N  PSICOL??GICA'),
(3, 'INFORME DE EVALUACI??N'),
(4, 'ACCESO A LA SALUD F??SICA'),
(5, 'ACCESO A LA SALUD MENTAL');

-- --------------------------------------------------------

--
-- Table structure for table `tipo_de_apoyo_pil`
--

CREATE TABLE `tipo_de_apoyo_pil` (
  `Id_Tipo_de_Apoyo` int(11) NOT NULL,
  `Nombre_Tipo_de_Apoyo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tipo_de_apoyo_pil`
--

INSERT INTO `tipo_de_apoyo_pil` (`Id_Tipo_de_Apoyo`, `Nombre_Tipo_de_Apoyo`) VALUES
(1, 'ORIENTACI??N EDUCACI??N, VIVIENDA Y TRABAJO');

-- --------------------------------------------------------

--
-- Table structure for table `tipo_de_apoyo_s`
--

CREATE TABLE `tipo_de_apoyo_s` (
  `Id_Tipo_de_Apoyo` int(11) NOT NULL,
  `Nombre_Tipo_de_Apoyo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tipo_de_apoyo_s`
--

INSERT INTO `tipo_de_apoyo_s` (`Id_Tipo_de_Apoyo`, `Nombre_Tipo_de_Apoyo`) VALUES
(1, 'ACCESO A LA EDUCACI??N- REVALIDACI??N DE ESTUDIOS'),
(2, 'ACCESO A LA EDUCACI??N- INCORPORACI??N'),
(3, 'ACCESO A OPCIONES DE EMPLEO'),
(4, 'ACCESO A OPCIONES DE VIVIENDA '),
(5, 'ACCESO A OPCIONES DE SALUD'),
(6, 'EDUCACI??N- REGULARIZACI??N');

-- --------------------------------------------------------

--
-- Table structure for table `tipo_de_persona`
--

CREATE TABLE `tipo_de_persona` (
  `Id_Tipo_de_Persona` int(11) NOT NULL,
  `Nombre` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tipo_de_persona`
--

INSERT INTO `tipo_de_persona` (`Id_Tipo_de_Persona`, `Nombre`) VALUES
(1, 'HOSPEDADO'),
(2, 'PERSONAL '),
(3, 'VOLUNTARIO');

-- --------------------------------------------------------

--
-- Table structure for table `tipo_de_platillo`
--

CREATE TABLE `tipo_de_platillo` (
  `Id_Tipo_de_Platillo` int(11) NOT NULL,
  `Nombre` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tipo_de_platillo`
--

INSERT INTO `tipo_de_platillo` (`Id_Tipo_de_Platillo`, `Nombre`) VALUES
(1, 'DESAYUNO'),
(2, 'COMIDA '),
(3, 'CENA');

-- --------------------------------------------------------

--
-- Table structure for table `tipo_impulso`
--

CREATE TABLE `tipo_impulso` (
  `Id_tipo_impulso` int(11) NOT NULL,
  `Tipo_de_tramite` varchar(60) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `Fecha_de_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `tipo_impulso`
--

INSERT INTO `tipo_impulso` (`Id_tipo_impulso`, `Tipo_de_tramite`, `Fecha_de_registro`) VALUES
(1, 'Inscripci??n de Acta Extranjera de Menor', '2021-11-17 04:36:30'),
(2, 'Regularizaci??n por vinculo familiar', '2021-11-17 04:36:30'),
(3, 'Asesor??a de RFC', '2021-11-17 04:36:30'),
(4, 'Asesor??a de NSS', '2021-11-17 04:36:30'),
(5, 'Reposici??n de documentos', '2021-11-17 04:36:30'),
(6, 'Asesor??a para regularizaci??n por razones humanitarias', '2021-11-17 04:38:14'),
(7, 'Asesor??a para renovaci??n de residencia temporal', '2021-11-17 04:36:30'),
(8, 'Apoyo econ??mico', '2021-11-17 04:36:30'),
(9, 'Asesor??a de caso de COMAR, certificaci??n de nacionalidad', '2021-11-17 04:38:48'),
(10, 'Cambio TVRH-RP', '2021-11-17 04:36:30'),
(11, 'Apoyo para Banco', '2021-11-17 04:36:30'),
(12, 'RFC', '2021-11-17 04:36:30'),
(13, 'Inscripci??n de Acta Extranjera de Menor', '2021-11-17 04:36:30'),
(14, 'RM', '2021-11-17 04:36:30'),
(15, 'Asesor??a', '2021-11-17 04:36:30');

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
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
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`ID_USUARIO`, `NAME`, `LASTNAME`, `USERNAME`, `EMAIL`, `PASSWORD`, `ID_ROL`) VALUES
(1, 'Javier', 'Martinez', 'javiermtzo', 'javier@itesm.mx', '$2a$12$PmLn00VvKCEu/eFqdpWBQ.CDFD404oh8Hm7r2a45vE0MqgjIwwFXy', 1),
(2, 'Adrian', 'Torres', 'adrian.torres', 'adrian@itesm.mx', '$2a$12$fRPHY8g1VvfjAcDBfnHnO.hI33JovaQWnuNGc//kxCHVCK5bo09Zu', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alimentacion`
--
ALTER TABLE `alimentacion`
  ADD PRIMARY KEY (`Id_Alimentacion`),
  ADD UNIQUE KEY `Id_Alimentacion` (`Id_Alimentacion`),
  ADD KEY `Id_Tipo_de_Persona` (`Id_Tipo_de_Persona`),
  ADD KEY `Id_Tipo_de_Platillo` (`Id_Tipo_de_Platillo`);

--
-- Indexes for table `alojamiento`
--
ALTER TABLE `alojamiento`
  ADD PRIMARY KEY (`Id_Alojamiento`),
  ADD UNIQUE KEY `Id_Alojamiento` (`Id_Alojamiento`),
  ADD KEY `Persona_Id` (`Persona_Id`);

--
-- Indexes for table `asistencia_social`
--
ALTER TABLE `asistencia_social`
  ADD PRIMARY KEY (`Id_Asistencia_Social`),
  ADD UNIQUE KEY `Id_Asistencia_Social` (`Id_Asistencia_Social`),
  ADD KEY `Persona_Id` (`Persona_Id`),
  ADD KEY `Tipo_social` (`Tipo_social`);

--
-- Indexes for table `atencion_psicosocial`
--
ALTER TABLE `atencion_psicosocial`
  ADD PRIMARY KEY (`Id_Atencion_Psicologica`),
  ADD UNIQUE KEY `Id_Atencion_Psicologica` (`Id_Atencion_Psicologica`),
  ADD KEY `Persona_Id` (`Persona_Id`),
  ADD KEY `Tipo_psicosocial` (`Tipo_psicosocial`);

--
-- Indexes for table `comunicacion`
--
ALTER TABLE `comunicacion`
  ADD PRIMARY KEY (`Id_comunicacion`),
  ADD UNIQUE KEY `Id_comunicacion` (`Id_comunicacion`),
  ADD KEY `Persona_Id` (`Persona_Id`);

--
-- Indexes for table `delito`
--
ALTER TABLE `delito`
  ADD PRIMARY KEY (`Id_Delito`),
  ADD UNIQUE KEY `Id_Delito` (`Id_Delito`),
  ADD KEY `Persona_Id` (`Persona_Id`);

--
-- Indexes for table `impulso`
--
ALTER TABLE `impulso`
  ADD PRIMARY KEY (`Id_Impulso`),
  ADD UNIQUE KEY `Id_Impulso` (`Id_Impulso`),
  ADD KEY `impulso_ibfk_1` (`Tipo_Impulso`);

--
-- Indexes for table `juicio_de_amparo`
--
ALTER TABLE `juicio_de_amparo`
  ADD PRIMARY KEY (`Id_Juicio_de_Amparo`),
  ADD UNIQUE KEY `Id_Juicio_de_Amparo` (`Id_Juicio_de_Amparo`),
  ADD KEY `juicio_de_amparo_ibfk_1` (`Persona_Id`);

--
-- Indexes for table `juicio_de_amparo_has_impulso`
--
ALTER TABLE `juicio_de_amparo_has_impulso`
  ADD PRIMARY KEY (`Id_Juicio_de_Amparo`,`Id_Impulso`),
  ADD KEY `juicio_de_amparo_has_impulso_ibfk_2` (`Id_Impulso`);

--
-- Indexes for table `perfil_de_refugio`
--
ALTER TABLE `perfil_de_refugio`
  ADD PRIMARY KEY (`Id_Perfil_de_Refugio`),
  ADD UNIQUE KEY `Id_Perfil_de_Refugio` (`Id_Perfil_de_Refugio`),
  ADD KEY `perfil_de_refugio_ibfk_1` (`Persona_Id`);

--
-- Indexes for table `perfil_de_refugio_has_impulso`
--
ALTER TABLE `perfil_de_refugio_has_impulso`
  ADD PRIMARY KEY (`Id_Perfil_de_Refugio`,`Id_Impulso`),
  ADD KEY `perfil_de_refugio_has_impulso_ibfk_2` (`Id_Impulso`);

--
-- Indexes for table `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`Folio`),
  ADD UNIQUE KEY `Folio` (`Folio`);

--
-- Indexes for table `privilegios`
--
ALTER TABLE `privilegios`
  ADD PRIMARY KEY (`ID_PRIVILEGIO`),
  ADD UNIQUE KEY `ID_PRIVILEGIO` (`ID_PRIVILEGIO`);

--
-- Indexes for table `programa_integracion_local`
--
ALTER TABLE `programa_integracion_local`
  ADD PRIMARY KEY (`Id_PIL`),
  ADD UNIQUE KEY `Id_PIL` (`Id_PIL`),
  ADD KEY `Persona_Id` (`Persona_Id`),
  ADD KEY `Tipo_pil` (`Tipo_pil`);

--
-- Indexes for table `regularizacion_migratorio`
--
ALTER TABLE `regularizacion_migratorio`
  ADD PRIMARY KEY (`Id_Regularizaci??n_Migratoria`),
  ADD UNIQUE KEY `Id_Regularizaci??n_Migratoria` (`Id_Regularizaci??n_Migratoria`),
  ADD KEY `regularizacion_migratorio_ibfk_1` (`Persona_Id`);

--
-- Indexes for table `regularizacion_migratorio_has_impulso`
--
ALTER TABLE `regularizacion_migratorio_has_impulso`
  ADD PRIMARY KEY (`Id_Regularizaci??n_Migratoria`,`Id_Impulso`),
  ADD KEY `regularizacion_migratorio_has_impulso_ibfk_2` (`Id_Impulso`);

--
-- Indexes for table `retorno_asistido`
--
ALTER TABLE `retorno_asistido`
  ADD PRIMARY KEY (`Id_Retorno_Asistido`),
  ADD UNIQUE KEY `Id_Retorno_Asistido` (`Id_Retorno_Asistido`),
  ADD KEY `retorno_asistido_ibfk_1` (`Persona_Id`);

--
-- Indexes for table `retorno_asistido_has_impulso`
--
ALTER TABLE `retorno_asistido_has_impulso`
  ADD PRIMARY KEY (`Id_Retorno_Asistido`,`Id_Impulso`),
  ADD KEY `retorno_asistido_has_impulso_ibfk_2` (`Id_Impulso`);

--
-- Indexes for table `reufam`
--
ALTER TABLE `reufam`
  ADD PRIMARY KEY (`Id_REUFAM`),
  ADD UNIQUE KEY `Id_REUFAM` (`Id_REUFAM`),
  ADD KEY `reufam_ibfk_1` (`Persona_Id`);

--
-- Indexes for table `reufam_has_impulso`
--
ALTER TABLE `reufam_has_impulso`
  ADD PRIMARY KEY (`Id_REUFAM`,`Id_Impulso`),
  ADD KEY `reufam_has_impulso_ibfk_2` (`Id_Impulso`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`ID_ROL`),
  ADD UNIQUE KEY `ID_ROL` (`ID_ROL`);

--
-- Indexes for table `roles_privilegios`
--
ALTER TABLE `roles_privilegios`
  ADD PRIMARY KEY (`ID_ROLES_PRIVILEGIOS`),
  ADD UNIQUE KEY `ID_ROLES_PRIVILEGIOS` (`ID_ROLES_PRIVILEGIOS`),
  ADD KEY `ID_ROL` (`ID_ROL`),
  ADD KEY `ID_PRIVILEGIO` (`ID_PRIVILEGIO`);

--
-- Indexes for table `tipo_de_apoyo_p`
--
ALTER TABLE `tipo_de_apoyo_p`
  ADD PRIMARY KEY (`Id_Tipo_de_Apoyo`),
  ADD UNIQUE KEY `Id_Tipo_de_Apoyo` (`Id_Tipo_de_Apoyo`);

--
-- Indexes for table `tipo_de_apoyo_pil`
--
ALTER TABLE `tipo_de_apoyo_pil`
  ADD PRIMARY KEY (`Id_Tipo_de_Apoyo`),
  ADD UNIQUE KEY `Id_Tipo_de_Apoyo` (`Id_Tipo_de_Apoyo`);

--
-- Indexes for table `tipo_de_apoyo_s`
--
ALTER TABLE `tipo_de_apoyo_s`
  ADD PRIMARY KEY (`Id_Tipo_de_Apoyo`),
  ADD UNIQUE KEY `Id_Tipo_de_Apoyo` (`Id_Tipo_de_Apoyo`);

--
-- Indexes for table `tipo_de_persona`
--
ALTER TABLE `tipo_de_persona`
  ADD PRIMARY KEY (`Id_Tipo_de_Persona`),
  ADD UNIQUE KEY `Id_Tipo_de_Persona` (`Id_Tipo_de_Persona`);

--
-- Indexes for table `tipo_de_platillo`
--
ALTER TABLE `tipo_de_platillo`
  ADD PRIMARY KEY (`Id_Tipo_de_Platillo`),
  ADD UNIQUE KEY `Id_Tipo_de_Platillo` (`Id_Tipo_de_Platillo`);

--
-- Indexes for table `tipo_impulso`
--
ALTER TABLE `tipo_impulso`
  ADD PRIMARY KEY (`Id_tipo_impulso`),
  ADD UNIQUE KEY `Id_tipo_impulso` (`Id_tipo_impulso`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`ID_USUARIO`),
  ADD UNIQUE KEY `ID_USUARIO` (`ID_USUARIO`),
  ADD KEY `ID_ROL` (`ID_ROL`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `alimentacion`
--
ALTER TABLE `alimentacion`
  MODIFY `Id_Alimentacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `alojamiento`
--
ALTER TABLE `alojamiento`
  MODIFY `Id_Alojamiento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `asistencia_social`
--
ALTER TABLE `asistencia_social`
  MODIFY `Id_Asistencia_Social` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `atencion_psicosocial`
--
ALTER TABLE `atencion_psicosocial`
  MODIFY `Id_Atencion_Psicologica` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `comunicacion`
--
ALTER TABLE `comunicacion`
  MODIFY `Id_comunicacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `delito`
--
ALTER TABLE `delito`
  MODIFY `Id_Delito` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `impulso`
--
ALTER TABLE `impulso`
  MODIFY `Id_Impulso` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `juicio_de_amparo`
--
ALTER TABLE `juicio_de_amparo`
  MODIFY `Id_Juicio_de_Amparo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `perfil_de_refugio`
--
ALTER TABLE `perfil_de_refugio`
  MODIFY `Id_Perfil_de_Refugio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `persona`
--
ALTER TABLE `persona`
  MODIFY `Folio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `privilegios`
--
ALTER TABLE `privilegios`
  MODIFY `ID_PRIVILEGIO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `programa_integracion_local`
--
ALTER TABLE `programa_integracion_local`
  MODIFY `Id_PIL` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `regularizacion_migratorio`
--
ALTER TABLE `regularizacion_migratorio`
  MODIFY `Id_Regularizaci??n_Migratoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `retorno_asistido`
--
ALTER TABLE `retorno_asistido`
  MODIFY `Id_Retorno_Asistido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `reufam`
--
ALTER TABLE `reufam`
  MODIFY `Id_REUFAM` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `ID_ROL` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `roles_privilegios`
--
ALTER TABLE `roles_privilegios`
  MODIFY `ID_ROLES_PRIVILEGIOS` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `tipo_de_apoyo_p`
--
ALTER TABLE `tipo_de_apoyo_p`
  MODIFY `Id_Tipo_de_Apoyo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tipo_de_apoyo_pil`
--
ALTER TABLE `tipo_de_apoyo_pil`
  MODIFY `Id_Tipo_de_Apoyo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tipo_de_apoyo_s`
--
ALTER TABLE `tipo_de_apoyo_s`
  MODIFY `Id_Tipo_de_Apoyo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tipo_de_persona`
--
ALTER TABLE `tipo_de_persona`
  MODIFY `Id_Tipo_de_Persona` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tipo_de_platillo`
--
ALTER TABLE `tipo_de_platillo`
  MODIFY `Id_Tipo_de_Platillo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tipo_impulso`
--
ALTER TABLE `tipo_impulso`
  MODIFY `Id_tipo_impulso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `ID_USUARIO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `alimentacion`
--
ALTER TABLE `alimentacion`
  ADD CONSTRAINT `alimentacion_ibfk_1` FOREIGN KEY (`Id_Tipo_de_Persona`) REFERENCES `tipo_de_persona` (`Id_Tipo_de_Persona`) ON DELETE CASCADE,
  ADD CONSTRAINT `alimentacion_ibfk_2` FOREIGN KEY (`Id_Tipo_de_Platillo`) REFERENCES `tipo_de_platillo` (`Id_Tipo_de_Platillo`) ON DELETE CASCADE;

--
-- Constraints for table `alojamiento`
--
ALTER TABLE `alojamiento`
  ADD CONSTRAINT `alojamiento_ibfk_1` FOREIGN KEY (`Persona_Id`) REFERENCES `persona` (`Folio`) ON DELETE CASCADE;

--
-- Constraints for table `asistencia_social`
--
ALTER TABLE `asistencia_social`
  ADD CONSTRAINT `asistencia_social_ibfk_1` FOREIGN KEY (`Persona_Id`) REFERENCES `persona` (`Folio`) ON DELETE CASCADE,
  ADD CONSTRAINT `asistencia_social_ibfk_2` FOREIGN KEY (`Tipo_social`) REFERENCES `tipo_de_apoyo_s` (`Id_Tipo_de_Apoyo`) ON DELETE CASCADE;

--
-- Constraints for table `atencion_psicosocial`
--
ALTER TABLE `atencion_psicosocial`
  ADD CONSTRAINT `atencion_psicosocial_ibfk_1` FOREIGN KEY (`Persona_Id`) REFERENCES `persona` (`Folio`) ON DELETE CASCADE,
  ADD CONSTRAINT `atencion_psicosocial_ibfk_2` FOREIGN KEY (`Tipo_psicosocial`) REFERENCES `tipo_de_apoyo_p` (`Id_Tipo_de_Apoyo`) ON DELETE CASCADE;

--
-- Constraints for table `comunicacion`
--
ALTER TABLE `comunicacion`
  ADD CONSTRAINT `comunicacion_ibfk_1` FOREIGN KEY (`Persona_Id`) REFERENCES `persona` (`Folio`) ON DELETE CASCADE;

--
-- Constraints for table `delito`
--
ALTER TABLE `delito`
  ADD CONSTRAINT `delito_ibfk_1` FOREIGN KEY (`Persona_Id`) REFERENCES `persona` (`Folio`);

--
-- Constraints for table `impulso`
--
ALTER TABLE `impulso`
  ADD CONSTRAINT `impulso_ibfk_1` FOREIGN KEY (`Tipo_Impulso`) REFERENCES `tipo_impulso` (`Id_tipo_impulso`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `juicio_de_amparo`
--
ALTER TABLE `juicio_de_amparo`
  ADD CONSTRAINT `juicio_de_amparo_ibfk_1` FOREIGN KEY (`Persona_Id`) REFERENCES `persona` (`Folio`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `juicio_de_amparo_has_impulso`
--
ALTER TABLE `juicio_de_amparo_has_impulso`
  ADD CONSTRAINT `juicio_de_amparo_has_impulso_ibfk_1` FOREIGN KEY (`Id_Juicio_de_Amparo`) REFERENCES `juicio_de_amparo` (`Id_Juicio_de_Amparo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `juicio_de_amparo_has_impulso_ibfk_2` FOREIGN KEY (`Id_Impulso`) REFERENCES `impulso` (`Id_Impulso`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `perfil_de_refugio`
--
ALTER TABLE `perfil_de_refugio`
  ADD CONSTRAINT `perfil_de_refugio_ibfk_1` FOREIGN KEY (`Persona_Id`) REFERENCES `persona` (`Folio`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `perfil_de_refugio_has_impulso`
--
ALTER TABLE `perfil_de_refugio_has_impulso`
  ADD CONSTRAINT `perfil_de_refugio_has_impulso_ibfk_1` FOREIGN KEY (`Id_Perfil_de_Refugio`) REFERENCES `perfil_de_refugio` (`Id_Perfil_de_Refugio`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `perfil_de_refugio_has_impulso_ibfk_2` FOREIGN KEY (`Id_Impulso`) REFERENCES `impulso` (`Id_Impulso`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `programa_integracion_local`
--
ALTER TABLE `programa_integracion_local`
  ADD CONSTRAINT `programa_integracion_local_ibfk_1` FOREIGN KEY (`Persona_Id`) REFERENCES `persona` (`Folio`) ON DELETE CASCADE,
  ADD CONSTRAINT `programa_integracion_local_ibfk_2` FOREIGN KEY (`Tipo_pil`) REFERENCES `tipo_de_apoyo_pil` (`Id_Tipo_de_Apoyo`) ON DELETE CASCADE;

--
-- Constraints for table `regularizacion_migratorio`
--
ALTER TABLE `regularizacion_migratorio`
  ADD CONSTRAINT `regularizacion_migratorio_ibfk_1` FOREIGN KEY (`Persona_Id`) REFERENCES `persona` (`Folio`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `regularizacion_migratorio_has_impulso`
--
ALTER TABLE `regularizacion_migratorio_has_impulso`
  ADD CONSTRAINT `regularizacion_migratorio_has_impulso_ibfk_1` FOREIGN KEY (`Id_Regularizaci??n_Migratoria`) REFERENCES `regularizacion_migratorio` (`Id_Regularizaci??n_Migratoria`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `regularizacion_migratorio_has_impulso_ibfk_2` FOREIGN KEY (`Id_Impulso`) REFERENCES `impulso` (`Id_Impulso`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `retorno_asistido`
--
ALTER TABLE `retorno_asistido`
  ADD CONSTRAINT `retorno_asistido_ibfk_1` FOREIGN KEY (`Persona_Id`) REFERENCES `persona` (`Folio`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `retorno_asistido_has_impulso`
--
ALTER TABLE `retorno_asistido_has_impulso`
  ADD CONSTRAINT `retorno_asistido_has_impulso_ibfk_1` FOREIGN KEY (`Id_Retorno_Asistido`) REFERENCES `retorno_asistido` (`Id_Retorno_Asistido`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `retorno_asistido_has_impulso_ibfk_2` FOREIGN KEY (`Id_Impulso`) REFERENCES `impulso` (`Id_Impulso`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `reufam`
--
ALTER TABLE `reufam`
  ADD CONSTRAINT `reufam_ibfk_1` FOREIGN KEY (`Persona_Id`) REFERENCES `persona` (`Folio`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `reufam_has_impulso`
--
ALTER TABLE `reufam_has_impulso`
  ADD CONSTRAINT `reufam_has_impulso_ibfk_1` FOREIGN KEY (`Id_REUFAM`) REFERENCES `reufam` (`Id_REUFAM`) ON DELETE CASCADE,
  ADD CONSTRAINT `reufam_has_impulso_ibfk_2` FOREIGN KEY (`Id_Impulso`) REFERENCES `impulso` (`Id_Impulso`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `roles_privilegios`
--
ALTER TABLE `roles_privilegios`
  ADD CONSTRAINT `roles_privilegios_ibfk_1` FOREIGN KEY (`ID_ROL`) REFERENCES `roles` (`ID_ROL`) ON DELETE CASCADE,
  ADD CONSTRAINT `roles_privilegios_ibfk_2` FOREIGN KEY (`ID_PRIVILEGIO`) REFERENCES `privilegios` (`ID_PRIVILEGIO`) ON DELETE CASCADE;

--
-- Constraints for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`ID_ROL`) REFERENCES `roles` (`ID_ROL`) ON DELETE CASCADE;
