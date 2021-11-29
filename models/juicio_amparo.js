const db = require('../util/database');


module.exports = class JuicioAmparo {

    //Constructor de la clase. Sirve para crear un nuevo objeto, y en él se definen las propiedades del modelo
    constructor(Nombre, Inicio, Inicio_CAMMI, Resolucion, Fecha) {
        this.Nombre = Nombre;
        this.Inicio = Inicio;
        this.Inicio_CAMMI = Inicio_CAMMI;
        this.Resolucion = Resolucion;
        this.Fecha = Fecha;



    }

    //Este método servirá para guardar de manera persistente el nuevo objeto. 
    save() {

        return db.execute('INSERT INTO juicio_de_amparo ( `Persona_Id`, `Inicio`, `Inicio_CAMMI`, `Resolucion`, `Fecha`) VALUES ( ?, ?, ?, ?, ?)',
            [this.Nombre, this.Inicio, this.Inicio_CAMMI, this.Resolucion, this.Fecha]
        );

    }

    static fetchAll() {

        return db.execute('SELECT * FROM juicio_de_amparo	')

        //return personas;

    }



}