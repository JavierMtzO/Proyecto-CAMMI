DROP DATABASE IF EXISTS CAMMI;
CREATE DATABASE CAMMI;
USE CAMMI;

CREATE TABLE PERSONA (

	Folio int NOT NULL UNIQUE AUTO_INCREMENT,                     
	Nombre varchar(50),	
	Edad int,
	Rango_de_Edad varchar(50),
	Genero varchar(20),
	Nacionalidad varchar(25),
	Discapacidad varchar(10),
	Contacto varchar(20),
	LGBT varchar(10),
	Dispositivo_propio varchar(10),
	RFC varchar(12),
	NSS	varchar(11),
	Asesoria varchar(50),
	Acompanado varchar(10),
	Fecha_de_registro timestamp,
	PRIMARY KEY (Folio)


);


CREATE TABLE DELITO (
	Id_Delito int PRIMARY KEY,
	Denuncia datetime,
	Denuncia_CAMMI varchar(10),
	Victima_de_Delito varchar(10),
	Carpeta_de_Investigacion varchar(10),
	Persona_Id int, 
	FOREIGN KEY (Persona_Id) REFERENCES PERSONA(Folio) ON DELETE CASCADE
);


CREATE TABLE PERFIL_DE_REFUGIO(
	Id_Perfil_de_Refugio int PRIMARY KEY UNIQUE AUTO_INCREMENT, 
	Perfil_de_Refugio varchar(10),
	Certificado_de_Nacionalidad_tramitado_CAMMI varchar(10),
	Inicio_con_CAMMI varchar(10),
	Persona_Id int, 
	FOREIGN KEY (Persona_Id) REFERENCES PERSONA(Folio) ON DELETE CASCADE

);


CREATE TABLE RETORNO_ASISTIDO(
	Id_Retorno_Asistido int PRIMARY KEY,
	Asesoría_CAMMI varchar(10),
	Acompañamiento_CAMMI varchar(10),
	Persona_Id int, 
	FOREIGN KEY (Persona_Id) REFERENCES PERSONA(Folio) ON DELETE CASCADE

);


CREATE TABLE JUICIO_DE_AMPARO(
	Id_Juicio_de_Amparo int PRIMARY KEY,
	Inicio varchar(10),
	Inicio_CAMMI varchar(10),
	Resolución varchar(10),
	Persona_Id int, 
	FOREIGN KEY (Persona_Id) REFERENCES PERSONA(Folio) ON DELETE CASCADE

);


CREATE TABLE REUFAM(
	Id_REUFAM int PRIMARY KEY,
	Inicio_CAMMI varchar(10),
	Asesoria varchar(10),
	Persona_Id int, 
	FOREIGN KEY (Persona_Id) REFERENCES PERSONA(Folio) ON DELETE CASCADE

);


CREATE TABLE REGULARIZACION_MIGRATORIO(
	Id_Regularización_Migratoria int PRIMARY KEY,
	Tipo varchar(10),
	Inicio varchar(10),
	Resolución varchar(10),
	Persona_Id int, 
	FOREIGN KEY (Persona_Id) REFERENCES PERSONA(Folio) ON DELETE CASCADE


);


CREATE TABLE TIPO_IMPULSO(
	Id_tipo_impulso int PRIMARY KEY,
	Nombre varchar(50),
	Tipo_de_tramite varchar(10)
	

);


CREATE TABLE IMPULSO(
	Id_Impulso int PRIMARY KEY,
	Descripcion longtext,
	Estatus varchar(20),
	Fecha date,
	Tipo_Impulso int,
	FOREIGN KEY (Tipo_Impulso) REFERENCES TIPO_IMPULSO(Id_tipo_impulso) ON DELETE CASCADE

);


CREATE TABLE PERFIL_DE_REFUGIO_HAS_IMPULSO(
	Id_Perfil_de_Refugio int, 
	Id_Impulso int, 
	FOREIGN KEY (Id_Perfil_de_Refugio) REFERENCES PERFIL_DE_REFUGIO(Id_Perfil_de_Refugio) ON DELETE CASCADE,
	FOREIGN KEY (Id_impulso) REFERENCES IMPULSO(Id_impulso) ON DELETE CASCADE,
	PRIMARY KEY (Id_Perfil_de_Refugio, id_Impulso)
);


CREATE TABLE RETORNO_ASISTIDO_HAS_IMPULSO(
	Id_Retorno_Asistido int, 
	Id_Impulso int, 
	FOREIGN KEY (Id_Retorno_Asistido) REFERENCES RETORNO_ASISTIDO(Id_Retorno_Asistido) ON DELETE CASCADE,
	FOREIGN KEY (Id_impulso) REFERENCES IMPULSO(Id_impulso) ON DELETE CASCADE,
	PRIMARY KEY (Id_Retorno_Asistido, id_Impulso)
);


CREATE TABLE JUICIO_DE_AMPARO_HAS_IMPULSO(
	Id_Juicio_de_Amparo int, 
	Id_Impulso int, 
	FOREIGN KEY (Id_Juicio_de_Amparo) REFERENCES JUICIO_DE_AMPARO(Id_Juicio_de_Amparo) ON DELETE CASCADE,
	FOREIGN KEY (Id_impulso) REFERENCES IMPULSO(Id_impulso) ON DELETE CASCADE,
	PRIMARY KEY (Id_Juicio_de_Amparo, id_Impulso)
);


CREATE TABLE REUFAM_HAS_IMPULSO(
	Id_REUFAM int, 
	Id_Impulso int, 
	FOREIGN KEY (Id_REUFAM) REFERENCES REUFAM(Id_REUFAM),
	FOREIGN KEY (Id_impulso) REFERENCES IMPULSO(Id_impulso),
	PRIMARY KEY (Id_REUFAM, id_Impulso)
);


CREATE TABLE REGULARIZACION_MIGRATORIO_HAS_IMPULSO(
	Id_Regularización_Migratoria int, 
	Id_Impulso int, 
	FOREIGN KEY (Id_Regularización_Migratoria) REFERENCES REGULARIZACION_MIGRATORIO(Id_Regularización_Migratoria) ON DELETE CASCADE,
	FOREIGN KEY (Id_impulso) REFERENCES IMPULSO(Id_impulso) ON DELETE CASCADE,
	PRIMARY KEY (Id_Regularización_Migratoria, id_Impulso)
);

CREATE TABLE TIPO_DE_APOYO_PIL(
	Id_Tipo_de_Apoyo int NOT NULL UNIQUE AUTO_INCREMENT,
	Nombre_Tipo_de_Apoyo varchar(50),
	PRIMARY KEY (Id_Tipo_de_Apoyo)


);



CREATE TABLE PROGRAMA_INTEGRACION_LOCAL(
	Id_PIL int NOT NULL UNIQUE AUTO_INCREMENT,
	Persona_Id int, 
	Fecha date,
	Tipo_pil int,
	Fecha_de_registro timestamp,
	PRIMARY KEY (Id_PIL),
	FOREIGN KEY (Persona_Id) REFERENCES PERSONA(Folio) ON DELETE CASCADE,
	FOREIGN KEY (Tipo_pil) REFERENCES TIPO_DE_APOYO_PIL(Id_Tipo_de_Apoyo) ON DELETE CASCADE
);

CREATE TABLE TIPO_DE_APOYO_P(
	Id_Tipo_de_Apoyo int NOT NULL UNIQUE AUTO_INCREMENT,
	Nombre_Tipo_de_Apoyo varchar(50),
	PRIMARY KEY (Id_Tipo_de_Apoyo)

);

INSERT INTO `tipo_de_apoyo_p` (`Id_Tipo_de_Apoyo`, `Nombre_Tipo_de_Apoyo`) VALUES (NULL, 'INTERVENCIÓN PSICOLOGÍA'), (NULL, 'EVALUACIÓN  PSICOLÓGICA'), (NULL, 'INFORME DE EVALUACIÓN'), (NULL, 'ACCESO A LA SALUD FÍSICA'), (NULL, 'ACCESO A LA SALUD MENTAL');

CREATE TABLE ATENCION_PSICOSOCIAL(
	Id_Atencion_Psicologica int NOT NULL UNIQUE AUTO_INCREMENT,
	Persona_Id int, 
	Fecha date,
	Tipo_psicosocial int,
	Formato_de_atencion varchar(25),
	Fecha_de_registro timestamp,
	PRIMARY KEY (Id_Atencion_Psicologica),
	FOREIGN KEY (Persona_Id) REFERENCES PERSONA(Folio) ON DELETE CASCADE,
	FOREIGN KEY (Tipo_psicosocial) REFERENCES TIPO_DE_APOYO_P(Id_Tipo_de_Apoyo) ON DELETE CASCADE
);



CREATE TABLE TIPO_DE_APOYO_S(
	Id_Tipo_de_Apoyo  int NOT NULL UNIQUE AUTO_INCREMENT,
	Nombre_Tipo_de_Apoyo varchar(50),
	PRIMARY KEY (Id_Tipo_de_Apoyo)

);

CREATE TABLE ASISTENCIA_SOCIAL(
	Id_Asistencia_Social int NOT NULL UNIQUE AUTO_INCREMENT,
	Persona_Id int, 
	Fecha date,
	Tipo_social int,
	Formato_de_Atencion varchar(25),
	Fecha_de_registro timestamp,
	PRIMARY KEY (Id_Asistencia_Social),
	FOREIGN KEY (Persona_Id) REFERENCES PERSONA(Folio) ON DELETE CASCADE,
	FOREIGN KEY (Tipo_social) REFERENCES TIPO_DE_APOYO_S(Id_Tipo_de_Apoyo) ON DELETE CASCADE

);

INSERT INTO `tipo_de_apoyo_s` (`Id_Tipo_de_Apoyo`, `Nombre_Tipo_de_Apoyo`) VALUES (NULL, 'ACCESO A LA EDUCACIÓN- REVALIDACIÓN DE ESTUDIOS'), (NULL, 'ACCESO A LA EDUCACIÓN- INCORPORACIÓN'), (NULL, 'ACCESO A OPCIONES DE EMPLEO'), (NULL, 'ACCESO A OPCIONES DE VIVIENDA '), (NULL, 'ACCESO A OPCIONES DE SALUD'), (NULL, 'EDUCACIÓN- REGULARIZACIÓN');

CREATE TABLE ALOJAMIENTO(
	Id_Alojamiento int NOT NULL UNIQUE AUTO_INCREMENT,
	Persona_Id int, 
	Persona_Refugiada varchar(10),
	Miembro_de_la_Estacion_Migratoria varchar(10),
	Uso_de_Cama varchar(10),
	Alojamiento_con_Costo varchar(10),
	MPP varchar(10),
	Fecha date,
	Fecha_de_registro timestamp,
	PRIMARY KEY (Id_Alojamiento),
	FOREIGN KEY (Persona_Id) REFERENCES PERSONA(Folio) ON DELETE CASCADE

);


CREATE TABLE COMUNICACION(
	Id_comunicacion int NOT NULL UNIQUE AUTO_INCREMENT,
	Persona_Id int, 
	Inicio_Servicio varchar(10),
	Carga_de_Bateria varchar(10),
	Uso_de_Wifi varchar(10),
	Fecha date,
	Pais_Destino_de_Llamada varchar(25),
	Completado_de_la_Llamada varchar(10),
	Mantenimiento_del_Contacto_Familiar varchar(10),
	Fecha_de_registro timestamp,
	PRIMARY KEY (Id_comunicacion),
	FOREIGN KEY (Persona_Id) REFERENCES PERSONA(Folio) ON DELETE CASCADE  

);


CREATE TABLE TIPO_DE_PLATILLO(
	Id_Tipo_de_Platillo int PRIMARY KEY,
	Nombre varchar(30)

);


CREATE TABLE TIPO_DE_PERSONA(
	Id_Tipo_de_Persona int NOT NULL UNIQUE AUTO_INCREMENT,
	Nombre varchar(10),
	PRIMARY KEY (Id_Tipo_de_Persona)

);


CREATE TABLE TIPO_DE_PLATILLO(
	Id_Tipo_de_Platillo int NOT NULL UNIQUE AUTO_INCREMENT,
	Nombre varchar(10),
	PRIMARY KEY (Id_Tipo_de_Platillo)
);

CREATE TABLE ALIMENTACION(
	Id_Alimentacion int NOT NULL UNIQUE AUTO_INCREMENT,
	Fecha date,
	Id_Tipo_de_Persona int,
	Id_Tipo_de_Platillo int,
	Fecha_de_registro timestamp,
	PRIMARY KEY (Id_Alimentacion),
	FOREIGN KEY (Id_Tipo_de_Persona) REFERENCES TIPO_DE_PERSONA(Id_Tipo_de_Persona) ON DELETE CASCADE,
	FOREIGN KEY (Id_Tipo_de_Platillo) REFERENCES TIPO_DE_PLATILLO(Id_Tipo_de_Platillo) ON DELETE CASCADE

);


INSERT INTO `tipo_de_persona` (`Id_Tipo_de_Persona`, `Nombre`) VALUES ('1', 'HOSPEDADO'), ('2', 'PERSONAL '), ('3', 'VOLUNTARIO');
INSERT INTO `tipo_de_platillo` (`Id_Tipo_de_Platillo`, `Nombre`) VALUES ('1', 'DESAYUNO'), ('2', 'COMIDA '), ('3', 'CENA');


