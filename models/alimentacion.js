
const db = require('../util/database');

module.exports = class Alimentacion {

    //Constructor de la clase. Sirve para crear un nuevo objeto, y en él se definen las propiedades del modelo
    constructor(Fecha, tipo_de_persona, tipo_de_platillo) {
        this.Fecha = Fecha;
        this.tipo_de_persona = tipo_de_persona;
        this.tipo_de_platillo = tipo_de_platillo;

    }

    //Este método servirá para guardar de manera persistente el nuevo objeto. 
    save() {

        return db.execute('INSERT INTO alimentacion (Fecha,Id_Tipo_de_Persona,Id_Tipo_de_Platillo) VALUES (?,?,?)',
            [this.Fecha, this.tipo_de_persona, this.tipo_de_platillo]
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