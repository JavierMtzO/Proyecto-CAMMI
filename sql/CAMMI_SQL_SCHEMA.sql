DROP DATABASE IF EXISTS CAMMI;
CREATE DATABASE CAMMI;
USE CAMMI;

CREATE TABLE PERSONA (

	Folio int PRIMARY KEY,                     
	Nombre varchar(50),	
	Edad int,
	Rango_de_Edad varchar(50),
	Genero varchar(20),
	Nacionalidad varchar(25),
	Discapacidad varchar(10),
	Contacto varchar(20),
	LGBT varchar(10),
	Dispositivo_propio varchar(10),
	Fecha_de_registro timestamp,
	RFC varchar(12),
	NSS	varchar(11),
	Asesoria varchar(50),
	Acompañado varchar(10)

);


CREATE TABLE DELITO (
	Id_Delito int NOT NULL UNIQUE AUTO_INCREMENT,
	Persona_Id int, 
	Denuncia datetime,
	Denuncia_CAMMI varchar(10),
	Victima_de_Delito varchar(10),
	Carpeta_de_Investigacion varchar(10),
	Fecha_de_registro timestamp,
    PRIMARY KEY (Id_Delito),
	FOREIGN KEY (Persona_Id) REFERENCES PERSONA(Folio)
);


CREATE TABLE PERFIL_DE_REFUGIO(
	Id_Perfil_de_Refugio int NOT NULL UNIQUE AUTO_INCREMENT, 
	Persona_Id int, 
	Perfil_de_Refugio varchar(10),
	Certificado_de_Nacionalidad_tramitado_CAMMI bool,
	Inicio_con_CAMMI varchar(10), 
	Fecha_de_registro timestamp,
	PRIMARY KEY (Id_Perfil_de_Refugio),
	FOREIGN KEY (Persona_Id) REFERENCES PERSONA(Folio)

);


CREATE TABLE RETORNO_ASISTIDO(
	Id_Retorno_Asistido int NOT NULL UNIQUE AUTO_INCREMENT, 
	Persona_Id int, 
	Asesoría_CAMMI varchar(10),
	Acompañamiento_CAMMI varchar(10),
	Fecha_de_registro timestamp,
	PRIMARY KEY (Id_Retorno_Asistido),
	FOREIGN KEY (Persona_Id) REFERENCES PERSONA(Folio)

);


CREATE TABLE JUICIO_DE_AMPARO(
	Id_Juicio_de_Amparo int NOT NULL UNIQUE AUTO_INCREMENT, 
	Persona_Id int, 
	Inicio varchar(10),
	Inicio_CAMMI varchar(10),
	Resolución varchar(10),
	Fecha_de_registro timestamp,
	PRIMARY KEY (Id_Juicio_de_Amparo),
	FOREIGN KEY (Persona_Id) REFERENCES PERSONA(Folio)

);


CREATE TABLE REUFAM(
	Id_REUFAM  int NOT NULL UNIQUE AUTO_INCREMENT, 
	Persona_Id int, 
	Inicio_CAMMI varchar(10),
	Asesoria varchar(10),
	Fecha_de_registro timestamp,
	PRIMARY KEY (Id_REUFAM),
	FOREIGN KEY (Persona_Id) REFERENCES PERSONA(Folio)

);


CREATE TABLE REGULARIZACION_MIGRATORIO(
	Id_Regularización_Migratoria  int NOT NULL UNIQUE AUTO_INCREMENT, 
	Persona_Id int,
	Tipo varchar(10),
	Inicio varchar(10),
	Resolución varchar(10), 
	Fecha_de_registro timestamp,
	PRIMARY KEY (Id_Regularización_Migratoria),
	FOREIGN KEY (Persona_Id) REFERENCES PERSONA(Folio)


);


CREATE TABLE TIPO_IMPULSO(
	Id_tipo_impulso int NOT NULL UNIQUE AUTO_INCREMENT, 
	Nombre varchar(50),
	Tipo_de_tramite varchar(10),
	Fecha_de_registro timestamp,
	PRIMARY KEY (Id_tipo_impulso)
	

);


CREATE TABLE IMPULSO(
	Id_Impulso int NOT NULL UNIQUE AUTO_INCREMENT, 
	Descripcion longtext,
	Estatus varchar(20),
	Fecha date,
	Tipo_Impulso int,
	Fecha_de_registro timestamp,
	PRIMARY KEY (Id_Impulso),
	FOREIGN KEY (Tipo_Impulso) REFERENCES TIPO_IMPULSO(Id_tipo_impulso)

);


CREATE TABLE PERFIL_DE_REFUGIO_HAS_IMPULSO(
	Id_Perfil_de_Refugio int, 
	Id_Impulso int, 
	Fecha_de_registro timestamp,
	FOREIGN KEY (Id_Perfil_de_Refugio) REFERENCES PERFIL_DE_REFUGIO(Id_Perfil_de_Refugio),
	FOREIGN KEY (Id_impulso) REFERENCES IMPULSO(Id_impulso),
	PRIMARY KEY (Id_Perfil_de_Refugio, id_Impulso)
);


CREATE TABLE RETORNO_ASISTIDO_HAS_IMPULSO(
	Id_Retorno_Asistido int, 
	Id_Impulso int, 
	Fecha_de_registro timestamp,
	FOREIGN KEY (Id_Retorno_Asistido) REFERENCES RETORNO_ASISTIDO(Id_Retorno_Asistido),
	FOREIGN KEY (Id_impulso) REFERENCES IMPULSO(Id_impulso),
	PRIMARY KEY (Id_Retorno_Asistido, id_Impulso)
);


CREATE TABLE JUICIO_DE_AMPARO_HAS_IMPULSO(
	Id_Juicio_de_Amparo int, 
	Id_Impulso int, 
	Fecha_de_registro timestamp,
	FOREIGN KEY (Id_Juicio_de_Amparo) REFERENCES JUICIO_DE_AMPARO(Id_Juicio_de_Amparo),
	FOREIGN KEY (Id_impulso) REFERENCES IMPULSO(Id_impulso),
	PRIMARY KEY (Id_Juicio_de_Amparo, id_Impulso)
);


CREATE TABLE REUFAM_HAS_IMPULSO(
	Id_REUFAM int, 
	Id_Impulso int, 
	Fecha_de_registro timestamp,
	FOREIGN KEY (Id_REUFAM) REFERENCES REUFAM(Id_REUFAM),
	FOREIGN KEY (Id_impulso) REFERENCES IMPULSO(Id_impulso),
	PRIMARY KEY (Id_REUFAM, id_Impulso)
);


CREATE TABLE REGULARIZACION_MIGRATORIO_HAS_IMPULSO(
	Id_Regularización_Migratoria int, 
	Id_Impulso int, 
	Fecha_de_registro timestamp,
	FOREIGN KEY (Id_Regularización_Migratoria) REFERENCES REGULARIZACION_MIGRATORIO(Id_Regularización_Migratoria),
	FOREIGN KEY (Id_impulso) REFERENCES IMPULSO(Id_impulso),
	PRIMARY KEY (Id_Regularización_Migratoria, id_Impulso)
);











CREATE TABLE TIPO_DE_APOYO_PIL(
	Id_Tipo_de_Apoyo int PRIMARY KEY,
	Nombre_Tipo_de_Apoyo varchar(50)


);


CREATE TABLE TIPO_DE_APOYO_P(
	Id_Tipo_de_Apoyo int PRIMARY KEY,
	Nombre_Tipo_de_Apoyo varchar(30)

);


CREATE TABLE TIPO_DE_APOYO_S(
	Id_Tipo_de_Apoyo int PRIMARY KEY,
	Nombre_Tipo_de_Apoyo varchar(30)

);


CREATE TABLE PROGRAMA_INTEGRACION_LOCAL(
	Id_PIL int PRIMARY KEY,
	Fecha date,
	Persona_Id int, 
	Tipo_pil int,
	FOREIGN KEY (Persona_Id) REFERENCES PERSONA(Folio),
	FOREIGN KEY (Tipo_pil) REFERENCES TIPO_DE_APOYO_PIL(Id_Tipo_de_Apoyo)
);


CREATE TABLE ATENCION_PSICOSOCIAL(
	Id_Atencion_Psicologica int PRIMARY KEY,
	Fecha date,
	Formato_de_atención varchar(25),
	Persona_Id int, 
	Tipo_psicosocial int,
	FOREIGN KEY (Persona_Id) REFERENCES PERSONA(Folio),
	FOREIGN KEY (Tipo_psicosocial) REFERENCES TIPO_DE_APOYO_P(Id_Tipo_de_Apoyo)
);


CREATE TABLE ASISTENCIA_SOCIAL(
	Id_Asistencia_Social int PRIMARY KEY,
	Formato_de_Atención varchar(25),
	Fecha date,
	Persona_Id int, 
	Tipo_social int,
	FOREIGN KEY (Persona_Id) REFERENCES PERSONA(Folio),
	FOREIGN KEY (Tipo_social) REFERENCES TIPO_DE_APOYO_S(Id_Tipo_de_Apoyo)

);


CREATE TABLE ALOJAMIENTO(
	Id_Alojamiento int PRIMARY KEY,
	Persona_Refugiada varchar(10),
	Miembro_de_la_Estacion_Migratoria varchar(10),
	Uso_de_Cama varchar(10),
	Alojamiento_con_Costo varchar(10),
	MPP varchar(10),
	Fecha date,
	Persona_Id int, 
	FOREIGN KEY (Persona_Id) REFERENCES PERSONA(Folio)

);


CREATE TABLE COMUNICACION(
	Id_comunicacion int PRIMARY KEY,
	Inicio_Servicio varchar(10),
	Carga_de_Bateria varchar(10),
	Uso_de_Wifi varchar(10),
	Fecha date,
	Pais_Destino_de_Llamada varchar(25),
	Completado_de_la_Llamada varchar(10),
	Mantenimiento_del_Contacto_Familiar varchar(10),
	Persona_Id int, 
	FOREIGN KEY (Persona_Id) REFERENCES PERSONA(Folio)

);


CREATE TABLE TIPO_DE_PLATILLO(
	Id_Tipo_de_Platillo int PRIMARY KEY,
	Nombre varchar(30)

);


CREATE TABLE TIPO_DE_PERSONA(
	Id_Tipo_de_Persona int PRIMARY KEY,
	Nombre varchar(10)

);


CREATE TABLE ALIMENTACION(
	Id_Alimentacion int PRIMARY KEY,
	Fecha date,
	Id_Tipo_de_Persona int,
	FOREIGN KEY (Id_Tipo_de_Persona) REFERENCES TIPO_DE_PERSONA(Id_Tipo_de_Persona)

);


CREATE TABLE TIPO_DE_PLATILLO_HAS_ALIMENTACION(
	Id_Tipo_de_Platillo int,
	Id_Alimentacion int,
	FOREIGN KEY (Id_Tipo_de_platillo) REFERENCES TIPO_DE_PLATILLO(Id_Tipo_de_Platillo),
	FOREIGN KEY (Id_Alimentacion) REFERENCES ALIMENTACION(Id_Alimentacion),
	PRIMARY KEY (Id_Tipo_de_Platillo, Id_Alimentacion)
);

