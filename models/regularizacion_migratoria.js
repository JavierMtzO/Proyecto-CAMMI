const db = require('../util/database');


module.exports = class RegularizacionMigratoria {

    //Constructor de la clase. Sirve para crear un nuevo objeto, y en él se definen las propiedades del modelo
    constructor(Nombre, Tipo, Inicio, Resolucion, Fecha) {
        this.Nombre = Nombre;
        this.Tipo = Tipo;
        this.Inicio = Inicio;
        this.Resolucion = Resolucion;
        this.Fecha = Fecha;



    }

    //Este método servirá para guardar de manera persistente el nuevo objeto. 
    save() {

        return db.execute('INSERT INTO regularizacion_migratorio ( `Persona_Id`, `Tipo`, `Inicio`, `Resolucion`, `Fecha`) VALUES ( ?, ?, ?, ?, ?)',
            [this.Nombre, this.Tipo, this.Inicio, this.Resolucion, this.Fecha]
        );

    }

    static fetchAll() {

        return db.execute('SELECT * FROM regularizacion_migratorio	')

        //return personas;

    }



}