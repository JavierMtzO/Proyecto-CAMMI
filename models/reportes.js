const db = require('../util/database');


module.exports = class Reporte { //BETWEEN '2021-11-24' AND '2021-11-1'
    // PSICOSOCIAL
    //Servicis de PIL
    static fetchPIL(fechaInicial, fechaHoy) {
        return db.execute('SELECT COUNT(*) as pil FROM programa_integracion_local WHERE programa_integracion_local.Fecha BETWEEN ? AND ?', [fechaInicial, fechaHoy]);
    }
    //Servicios de Atención psicosocial
    static fetchAtencionPsicosocial(fechaInicial, fechaHoy) {
        return db.execute('SELECT COUNT(*) as atencion_psicosocial FROM atencion_psicosocial WHERE atencion_psicosocial.Fecha BETWEEN ? AND ?', [fechaInicial, fechaHoy]);
    }
    //Servicioos de Asistencia Social
    static fetchAsistenciaSocial(fechaInicial, fechaHoy) {
        return db.execute('SELECT COUNT(*) as asistencia_social FROM asistencia_social WHERE asistencia_social.Fecha BETWEEN ? AND ?', [fechaInicial, fechaHoy]);
    }

    //ALBBERGUE
    //Personas alojadas en el mes
    static fetchAlojamiento(fechaInicial, fechaHoy) {
        return db.execute('SELECT COUNT(*) as alojamiento FROM alojamiento WHERE alojamiento.Fecha BETWEEN ? AND ?', [fechaInicial, fechaHoy]);
    }
    //Servicios de comunicación
    static fetchComunicacion(fechaInicial, fechaHoy) {
        return db.execute('SELECT COUNT(*) as comunicacion FROM comunicacion WHERE comunicacion.Fecha BETWEEN ? AND ?', [fechaInicial, fechaHoy]);
    }
    //Alimentación
    static fetchAlimentacion(fechaInicial, fechaHoy) {
        return db.execute('SELECT COUNT(*) as comidas_totales FROM alimentacion WHERE alimentacion.Fecha BETWEEN ? AND ?', [fechaInicial, fechaHoy]);
    }
    //Desayunos
    static fetchDesayunos(fechaInicial, fechaHoy) {
        return db.execute('SELECT COUNT(*) as desayunos FROM alimentacion WHERE Id_Tipo_de_Platillo = 1 AND alimentacion.Fecha BETWEEN ? AND ?', [fechaInicial, fechaHoy]);
    }
    //Comidas
    static fetchComidas(fechaInicial, fechaHoy) {
        return db.execute('SELECT COUNT(*) as comidas FROM alimentacion WHERE Id_Tipo_de_Platillo = 2 AND alimentacion.Fecha BETWEEN ? AND ?', [fechaInicial, fechaHoy]);
    }
    //Cenas
    static fetchCenas(fechaInicial, fechaHoy) {
        return db.execute('SELECT COUNT(*) as cenas FROM alimentacion WHERE Id_Tipo_de_Platillo = 3 AND alimentacion.Fecha BETWEEN ? AND ?', [fechaInicial, fechaHoy]);
    }
    //Hospedado
    static fetchHospedado(fechaInicial, fechaHoy) {
        return db.execute('SELECT COUNT(*) as hospedado FROM alimentacion WHERE Id_Tipo_de_Persona = 1 AND alimentacion.Fecha BETWEEN ? AND ?', [fechaInicial, fechaHoy]);
    }
    //Personal
    static fetchPersonal(fechaInicial, fechaHoy) {
        return db.execute('SELECT COUNT(*) as personal FROM alimentacion WHERE Id_Tipo_de_Persona = 2 AND alimentacion.Fecha BETWEEN ? AND ?', [fechaInicial, fechaHoy]);
    }
    //Voluntario
    static fetchVoluntario(fechaInicial, fechaHoy) {
        return db.execute('SELECT COUNT(*) as voluntario FROM alimentacion WHERE Id_Tipo_de_Persona = 3 AND alimentacion.Fecha BETWEEN ? AND ?', [fechaInicial, fechaHoy]);
    }

    //JURIDICO
    //Delito
    static fetchDelito(fechaInicial, fechaHoy) {
        return db.execute('SELECT COUNT(*) as delito FROM delito WHERE delito.Denuncia BETWEEN ? AND ?', [fechaInicial, fechaHoy]);
    }
    //Perfil Del Refugiado
    static fetchPerfilDelRefugiado(fechaInicial, fechaHoy) {
        return db.execute('SELECT COUNT(*) as perfil_de_refugio FROM perfil_de_refugio WHERE perfil_de_refugio.Fecha BETWEEN ? AND ?', [fechaInicial, fechaHoy]);
    }
    //Retorno Asistido
    static fetchRetornoAsistido(fechaInicial, fechaHoy) {
        return db.execute('SELECT COUNT(*) as retorno_asistido FROM retorno_asistido WHERE retorno_asistido.Fecha BETWEEN ? AND ?', [fechaInicial, fechaHoy]);
    }
    //Juicio De Amparo
    static fetchJuicioDeAmparo(fechaInicial, fechaHoy) {
        return db.execute('SELECT COUNT(*) as juicio_de_amparo FROM juicio_de_amparo WHERE juicio_de_amparo.Fecha BETWEEN ? AND ?', [fechaInicial, fechaHoy]);
    }
    //REUFAM
    static fetchREUFAM(fechaInicial, fechaHoy) {
        return db.execute('SELECT COUNT(*) as reufam FROM reufam WHERE reufam.Fecha BETWEEN ? AND ?', [fechaInicial, fechaHoy]);
    }
    //Regularización Migratoria
    static fetchRegularizacionMigratoria(fechaInicial, fechaHoy) {
        return db.execute('SELECT COUNT(*) as regularizacion_migratorio FROM regularizacion_migratorio WHERE regularizacion_migratorio.Fecha BETWEEN ? AND ?', [fechaInicial, fechaHoy]);
    }
}