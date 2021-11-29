const db = require('../util/database');


module.exports = class RetornoAsistido {

    //Constructor de la clase. Sirve para crear un nuevo objeto, y en él se definen las propiedades del modelo
    constructor(Nombre, Asesoría_CAMMI, Acompañamiento_CAMMI, Fecha) {
        this.Nombre = Nombre;
        this.Asesoría_CAMMI = Asesoría_CAMMI;
        this.Acompañamiento_CAMMI = Acompañamiento_CAMMI;
        this.Fecha = Fecha;



    }

    //Este método servirá para guardar de manera persistente el nuevo objeto. 
    save() {

        return db.execute('INSERT INTO retorno_asistido ( `Persona_Id`, `Asesoría_CAMMI`, `Acompañamiento_CAMMI`, `Fecha`) VALUES ( ?, ?, ?, ?)',
            [this.Nombre, this.Asesoría_CAMMI, this.Acompañamiento_CAMMI, this.Fecha]
        );

    }

    static fetchAll() {

        return db.execute('SELECT * FROM retorno_asistido')

        //return personas;

    }



}