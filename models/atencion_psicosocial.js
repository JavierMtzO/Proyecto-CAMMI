
const db = require('../util/database');

module.exports = class Atencion_psicosocial {

    //Constructor de la clase. Sirve para crear un nuevo objeto, y en él se definen las propiedades del modelo
    constructor(Nombre, Fecha, Tipo_psicosocial, Formato_de_Atencion, Inicio) {
        this.Nombre = Nombre;
        this.Fecha = Fecha;
        this.Tipo_psicosocial = Tipo_psicosocial;
        this.Formato_de_Atencion = Formato_de_Atencion;
        this.Inicio = Inicio;

    }

    //Este método servirá para guardar de manera persistente el nuevo objeto. 
    save() {

        return db.execute('INSERT INTO atencion_psicosocial ( `Persona_Id`, `Fecha`, `Tipo_psicosocial`, `Formato_de_atencion`, `Inicio`) VALUES ( ?, ?, ?, ?, ?)',
            [this.Nombre, this.Fecha, this.Tipo_psicosocial, this.Formato_de_Atencion, this.Inicio]
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