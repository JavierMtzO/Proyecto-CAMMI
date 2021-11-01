
const db = require('../util/database');

module.exports = class Programa_integracion_local {

    //Constructor de la clase. Sirve para crear un nuevo objeto, y en él se definen las propiedades del modelo
    constructor(Nombre, Fecha,Tipo_pil ) {
        this.Nombre=Nombre;
        this.Fecha=Fecha;
        this.Tipo_pil=Tipo_pil;

    }

    //Este método servirá para guardar de manera persistente el nuevo objeto. 
    save() {

      return db.execute('INSERT INTO `programa_integracion_local` (`Persona_Id`, `Fecha`, `Tipo_pil`) VALUES ( ?, ?, ?);',
        [this.Nombre, this.Fecha, this.Tipo_pil ]
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