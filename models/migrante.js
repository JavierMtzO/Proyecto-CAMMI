const db = require('../util/database');


module.exports = class Persona {

    //Constructor de la clase. Sirve para crear un nuevo objeto, y en él se definen las propiedades del modelo
    constructor(Nombre, Edad, Rango_de_Edad, Genero, Nacionalidad, Discapacidad, Contacto, Lgbt, Dispositivo_propio, Rfc, Nss, Asesoria, Acompanado) {
        this.Nombre = Nombre;
        this.Edad = Edad;
        this.Rango_de_Edad = Rango_de_Edad;
        this.Genero = Genero;
        this.Nacionalidad = Nacionalidad;
        this.Discapacidad = Discapacidad;
        this.Contacto = Contacto;
        this.Lgbt = Lgbt;
        this.Dispositivo_propio = Dispositivo_propio;
        this.Rfc = Rfc;
        this.Nss = Nss;
        this.Asesoria = Asesoria;
        this.Acompanado = Acompanado;


    }

    //Este método servirá para guardar de manera persistente el nuevo objeto. 
    save() {
        return db.execute('INSERT INTO `persona` ( `Nombre`, `Edad`, `Rango_de_Edad`, `Genero`, `Nacionalidad`, `Discapacidad`, `Contacto`, `LGBT`, `Dispositivo_propio`,  `RFC`, `NSS`, `Asesoria`, `Acompanado`) VALUES ( ?, ?, ?, ?, ?, ?, ?, ?, ?,  ?, ?, ?, ?)',
            [this.Nombre, this.Edad, this.Rango_de_Edad, this.Genero, this.Nacionalidad, this.Discapacidad, this.Contacto, this.Lgbt, this.Dispositivo_propio, this.Rfc, this.Nss, this.Asesoria, this.Acompanado]
        );

    }

    static update(Nombre, Edad, Rango_de_Edad, Genero, Nacionalidad, Discapacidad, Contacto, LGBT, Dispositivo_propio, RFC, NSS, Asesoria, Acompanado, Folio) {
        return db.execute('UPDATE PERSONA SET Nombre = ?, Edad = ?, Rango_de_Edad = ?, Genero = ?, Nacionalidad = ?, Discapacidad = ?, Contacto = ?, LGBT = ?, Dispositivo_propio = ?, RFC = ?, NSS = ?, Asesoria = ?, Acompanado = ? WHERE Folio = ?',
            [Nombre, Edad, Rango_de_Edad, Genero, Nacionalidad, Discapacidad, Contacto, LGBT, Dispositivo_propio, RFC, NSS, Asesoria, Acompanado, Folio]
        );
    }

    static fetchAll() {

        return db.execute('SELECT * FROM   persona	')

    }

    static fetchOne(folio) {
        return db.execute('SELECT * FROM PERSONA WHERE Folio = ? ', [folio]);
    }

    static delete(folio) {
        return db.execute('DELETE FROM PERSONA WHERE Folio = ?', [folio]);
    }

    static fetchAlojamiento(folio) {
        return db.execute('SELECT Persona_Refugiada, Miembro_de_la_Estacion_Migratoria, Uso_de_Cama, Alojamiento_con_Costo, MPP, DATE_FORMAT(Fecha, "%W %M %e %Y") as Fecha FROM alojamiento a, persona p WHERE a.Persona_Id = p.Folio AND p.Folio = ? ORDER BY date(Fecha)', [folio]);
    }

    static fetchComunicacion(folio) {
        return db.execute('SELECT Inicio_Servicio, Carga_de_Bateria, Uso_de_Wifi, Pais_Destino_de_Llamada, Completado_de_la_Llamada, Mantenimiento_del_Contacto_Familiar, DATE_FORMAT(Fecha, "%W %M %e %Y") as Fecha FROM comunicacion c, persona p WHERE c.Persona_Id = p.Folio AND p.Folio = ? ORDER BY date(Fecha)', [folio]);
    }
    static fetchPIL(folio) {
        return db.execute('SELECT Nombre_Tipo_de_Apoyo, DATE_FORMAT(Fecha, "%W %M %e %Y") as Fecha FROM programa_integracion_local pil, persona p, tipo_de_apoyo_pil t WHERE pil.Persona_Id = p.Folio AND pil.Tipo_pil = t.Id_Tipo_de_Apoyo AND p.Folio = ? ORDER BY date(Fecha)', [folio]);
    }
    static fetchAtencionPsicosocial(folio) {
        return db.execute('SELECT Nombre_Tipo_de_Apoyo, Formato_de_atencion, DATE_FORMAT(Fecha, "%W %M %e %Y") as Fecha FROM atencion_psicosocial a, tipo_de_apoyo_p t, persona p WHERE a.Persona_Id = p.Folio AND a.Tipo_psicosocial = t.Id_Tipo_de_Apoyo AND p.Folio = ? ORDER BY date(Fecha)', [folio]);
    }
    static fetchAtencionSocial(folio) {
        return db.execute('SELECT Nombre_Tipo_de_Apoyo, Formato_de_atencion, DATE_FORMAT(Fecha, "%W %M %e %Y") as Fecha FROM asistencia_social a, tipo_de_apoyo_s t, persona p WHERE a.Persona_Id = p.Folio AND a.Tipo_social = t.Id_Tipo_de_Apoyo AND p.Folio = ? ORDER BY date(Fecha)', [folio]);
    }
}