const db = require('../util/database');


module.exports = class Alojamiento {

    //Constructor de la clase. Sirve para crear un nuevo objeto, y en él se definen las propiedades del modelo
    constructor(Nombre, Persona_Refugiada, Miembro_de_la_Estacion_Migratoria,Uso_de_Cama,Alojamiento_con_Costo, Mpp,Fecha) {
        this.Nombre=Nombre;
        this.Persona_Refugiada=Persona_Refugiada;
        this.Miembro_de_la_Estacion_Migratoria=Miembro_de_la_Estacion_Migratoria;
        this.Uso_de_Cama=Uso_de_Cama;
        this.Alojamiento_con_Costo=Alojamiento_con_Costo; 
        this.Mpp=Mpp; 
        this.Fecha=Fecha; 
        

    }

    //Este método servirá para guardar de manera persistente el nuevo objeto. 
    save() {

      return db.execute('INSERT INTO `alojamiento` ( `Persona_Id`, `Persona_Refugiada`, `Miembro_de_la_Estacion_Migratoria`, `Uso_de_Cama`, `Alojamiento_con_Costo`, `MPP`, `Fecha`) VALUES (?, ?, ?, ?, ?, ?, ?)',
        [this.Nombre, this.Persona_Refugiada, this.Miembro_de_la_Estacion_Migratoria,this.Uso_de_Cama,this.Alojamiento_con_Costo, this.Mpp,this.Fecha]
        );
        
    }

    static fetchAll() {

        return db.execute('SELECT * FROM ALOJAMIENTO	')
          
        //return personas;
        
    }



}