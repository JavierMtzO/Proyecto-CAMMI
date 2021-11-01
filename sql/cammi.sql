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
	FOREIGN KEY (Persona_Id) REFERENCES PERSONA(Folio) ON DELETE CASCADE,
	FOREIGN KEY (Tipo_pil) REFERENCES TIPO_DE_APOYO_PIL(Id_Tipo_de_Apoyo) ON DELETE CASCADE
);


CREATE TABLE ATENCION_PSICOSOCIAL(
	Id_Atencion_Psicologica int PRIMARY KEY,
	Fecha date,
	Formato_de_atención varchar(25),
	Persona_Id int, 
	Tipo_psicosocial int,
	FOREIGN KEY (Persona_Id) REFERENCES PERSONA(Folio) ON DELETE CASCADE,
	FOREIGN KEY (Tipo_psicosocial) REFERENCES TIPO_DE_APOYO_P(Id_Tipo_de_Apoyo) ON DELETE CASCADE
);


CREATE TABLE ASISTENCIA_SOCIAL(
	Id_Asistencia_Social int PRIMARY KEY,
	Formato_de_Atención varchar(25),
	Fecha date,
	Persona_Id int, 
	Tipo_social int,
	FOREIGN KEY (Persona_Id) REFERENCES PERSONA(Folio) ON DELETE CASCADE,
	FOREIGN KEY (Tipo_social) REFERENCES TIPO_DE_APOYO_S(Id_Tipo_de_Apoyo) ON DELETE CASCADE

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
	FOREIGN KEY (Persona_Id) REFERENCES PERSONA(Folio) ON DELETE CASCADE

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

CREATE TABLE PRIVILEGIOS (
	ID_PRIVILEGIO int NOT NULL UNIQUE AUTO_INCREMENT,
	NOMBRE varchar(255),
	DESCRIPCION varchar(255),
	PRIMARY KEY(ID_PRIVILEGIO) 
);

INSERT INTO PRIVILEGIOS () VALUES 
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

CREATE TABLE ROLES (
	ID_ROL int NOT NULL UNIQUE AUTO_INCREMENT,
	NOMBRE varchar(255),
	DESCRIPCION varchar(255),
	PRIMARY KEY(ID_ROL) 
);

INSERT INTO ROLES () VALUES 
(1, 'administrador', 'Administrador de todo el sistema. Tiene todos los privilegios'),
(2, 'psicosocial', 'Area psicoscocial, tiene los privilegios de es área'),
(3, 'juridico', 'Area jurídica, tiene los privilegios de esa área'),
(4, 'albergue', 'Area albergue, tiene los privilegios de esa área'),
(5, 'psicosocial-albergue', 'Area psicoscocial y albergue, tiene los privilegios de ambas áreas'),
(6, 'psicosocial-juridico', 'Area psicoscocial y jurídica, tiene los privilegios de ambas áreas'),
(7, 'albergue-juridico', 'Area albergue y jurídica, tiene los privilegios de ambas áreas');



CREATE TABLE ROLES_PRIVILEGIOS(
	ID_ROLES_PRIVILEGIOS int NOT NULL UNIQUE AUTO_INCREMENT,
	ID_ROL int,
	ID_PRIVILEGIO int,
	PRIMARY KEY(ID_ROLES_PRIVILEGIOS),
	FOREIGN KEY(ID_ROL) REFERENCES ROLES(ID_ROL) ON DELETE CASCADE,
	FOREIGN KEY(ID_PRIVILEGIO) REFERENCES PRIVILEGIOS(ID_PRIVILEGIO) ON DELETE CASCADE
);

INSERT INTO ROLES_PRIVILEGIOS () VALUES 
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


CREATE TABLE USUARIOS(
	ID_USUARIO int NOT NULL UNIQUE AUTO_INCREMENT,
	NAME varchar(255),
	LASTNAME varchar(255),
	USERNAME varchar(255) ,
	EMAIL varchar(255) ,
	PASSWORD varchar(255),
	ID_ROL int,
	PRIMARY KEY(ID_USUARIO),
	FOREIGN KEY (ID_ROL) REFERENCES ROLES(ID_ROL) ON DELETE CASCADE
);

INSERT INTO USUARIOS () VALUES (1, 'Javier', 'Martinez', 'javiermtzo', 'javier@itesm.mx', 'javier', 1);