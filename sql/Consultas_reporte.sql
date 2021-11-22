-----  Asistencia Social
SELECT SA.Fecha, P.Nombre, P.Genero, P.Rango_de_Edad, P.Nacionalidad , SA.Inicio,TS.Nombre_Tipo_de_Apoyo, SA.Formato_de_Atencion, SA.Canalizacion
FROM persona P, asistencia_social SA,tipo_de_apoyo_s TS
WHERE P.Folio=SA.Persona_Id AND SA.Tipo_social= TS.Id_Tipo_de_Apoyo
ORDER BY SA.Fecha DESC;
-----  Asistencia social primera vez
SELECT SA.Fecha, P.Nombre, P.Genero, P.Rango_de_Edad, P.Nacionalidad, TS.Nombre_Tipo_de_Apoyo, SA.Formato_de_Atencion, SA.Canalizacion
FROM persona P, asistencia_social SA,tipo_de_apoyo_s TS
WHERE P.Folio=SA.Persona_Id AND SA.Tipo_social= TS.Id_Tipo_de_Apoyo AND SA.Inicio= 'Si' 
ORDER BY SA.Fecha DESC;

-----  Atención Psicosocial

SELECT AP.Fecha, P.Nombre, P.Genero, P.Rango_de_Edad, P.Nacionalidad , AP.Inicio,TP.Nombre_Tipo_de_Apoyo, AP.Formato_de_Atencion
FROM persona P, atencion_psicosocial AP,tipo_de_apoyo_p TP
WHERE P.Folio=AP.Persona_Id AND AP.Tipo_psicosocial= TP.Id_Tipo_de_Apoyo
ORDER BY AP.Fecha DESC;

-----  Atención Psicosocial primera vez
SELECT AP.Fecha, P.Nombre, P.Genero, P.Rango_de_Edad, P.Nacionalidad , AP.Inicio,TP.Nombre_Tipo_de_Apoyo, AP.Formato_de_Atencion
FROM persona P, atencion_psicosocial AP,tipo_de_apoyo_p TP
WHERE P.Folio=AP.Persona_Id AND AP.Tipo_psicosocial= TP.Id_Tipo_de_Apoyo  AND AP.Inicio= 'Si' 
ORDER BY AP.Fecha DESC;

 
-----  Total Atencion Psicosocial primera vez
SELECT COUNT(DISTINCT  P.Folio) as "Total Primera vez"
FROM persona P, atencion_psicosocial AP,tipo_de_apoyo_p TP
WHERE P.Folio=AP.Persona_Id AND AP.Tipo_psicosocial= TP.Id_Tipo_de_Apoyo  AND AP.Inicio= 'Si' 
ORDER BY Fecha DESC;



-----  PIL 
SELECT PIL.Fecha, P.Nombre, P.Genero, P.Edad, P.Nacionalidad , PIL.Inicio,TPI.Nombre_Tipo_de_Apoyo, P.Contacto
FROM persona P, programa_integracion_local PIL,tipo_de_apoyo_pil TPI
WHERE P.Folio=PIL.Persona_Id AND PIL.Tipo_pil= TPI.Id_Tipo_de_Apoyo
ORDER BY PIL.Fecha DESC;

-----  PIL primera vez 
SELECT PIL.Fecha, P.Nombre, P.Genero, P.Edad, P.Nacionalidad , PIL.Inicio,TPI.Nombre_Tipo_de_Apoyo, P.Contacto
FROM persona P, programa_integracion_local PIL,tipo_de_apoyo_pil TPI
WHERE P.Folio=PIL.Persona_Id AND PIL.Tipo_pil= TPI.Id_Tipo_de_Apoyo AND PIL.Inicio= 'Si' 
ORDER BY PIL.Fecha DESC;

-----  Delito

SELECT D.Denuncia, P.Nombre, P.Genero, P.Rango_de_Edad, P.Nacionalidad , D.Denuncia_CAMMI,D.Victima_de_Delito, D.Carpeta_de_Investigacion
FROM persona P, delito D
WHERE P.Folio=D.Persona_Id
ORDER BY D.Denuncia DESC;


-----  Perfil de refugio

SELECT PR.Fecha, P.Nombre, P.Genero, P.Rango_de_Edad, P.Nacionalidad , PR.Perfil_de_Refugio,PR.Certificado_de_Nacionalidad_tramitado_CAMMI, PR.Inicio_con_CAMMI
FROM persona P, perfil_de_refugio PR
WHERE P.Folio=PR.Persona_Id
ORDER BY PR.Fecha DESC;


-----   Retorno Asistido

SELECT RA.Fecha, P.Nombre, P.Genero, P.Rango_de_Edad, P.Nacionalidad , RA.Asesoría_CAMMI,RA.Acompañamiento_CAMMI
FROM persona P, retorno_asistido RA
WHERE P.Folio=RA.Persona_Id
ORDER BY RA.Fecha DESC;
