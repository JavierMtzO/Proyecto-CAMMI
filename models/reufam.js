const db = require('../util/database');


module.exports = class Reufam {

    //Constructor de la clase. Sirve para crear un nuevo objeto, y en él se definen las propiedades del modelo
    constructor(Nombre, Inicio_CAMMI, Asesoria, Fecha) {
        this.Nombre=Nombre;
        this.Inicio_CAMMI=Inicio_CAMMI;
        this.Asesoria=Asesoria;
        this.Fecha=Fecha;        
        

    }

    //Este método servirá para guardar de manera persistente el nuevo objeto. 
    save() {

      return db.execute('INSERT INTO `reufam` ( `Persona_Id`, `Inicio_CAMMI`, `Asesoria`, `Fecha`) VALUES ( ?, ?, ?, ?)',
        [this.Nombre,this.Inicio_CAMMI,this.Asesoria,this.Fecha]
        );
        
    }

    static fetchAll() {

        return db.execute('SELECT * FROM reufam	')
          
        //return personas;
        
    }



}