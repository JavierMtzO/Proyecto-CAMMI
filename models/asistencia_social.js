
const db = require('../util/database');

module.exports = class Asistencia_social {

    //Constructor de la clase. Sirve para crear un nuevo objeto, y en él se definen las propiedades del modelo
    constructor(Nombre, Fecha, Tipo_social, Formato_de_Atencion) {
        this.Nombre=Nombre;
        this.Fecha=Fecha;
        this.Tipo_social=Tipo_social;
        this.Formato_de_Atencion=Formato_de_Atencion;

    }

    //Este método servirá para guardar de manera persistente el nuevo objeto. 
    save() {

      return db.execute('INSERT INTO `asistencia_social` ( `Persona_Id`, `Fecha`, `Tipo_social`, `Formato_de_Atencion`) VALUES ( ?, ?, ?, ?)',
        [this.Nombre, this.Fecha, this.Tipo_social, this.Formato_de_Atencion ]
        );
        
    }
/*
    //Este método servirá para devolver los objetos del almacenamiento persistente.
    static fetchAll() {
        return db.execute('SELECT * FROM incidente')
          
        //return personas;
        
    }

    static fetchOne(incidenteId ) {
        return db.execute('SELECT * FROM incidente WHERE incidenteId  = ?', [incidenteId]);
    }

    static delete(incidenteId ) {
        return db.execute('DELETE FROM incidente WHERE incidenteId = ?', [incidenteId]);
    }

    static fetch(criterio) {
        return db.execute('SELECT * FROM incidente WHERE lugarIncidente  LIKE ? OR tipoIncidente LIKE ?' , ['%'+criterio+'%','%'+criterio+'%']);
    }*/

}