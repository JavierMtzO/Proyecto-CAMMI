const db = require('../util/database');


module.exports = class Persona {

    //Constructor de la clase. Sirve para crear un nuevo objeto, y en él se definen las propiedades del modelo
    constructor(Nombre, Rango_de_Edad, Nacionalidad,Discapacidad,Dispositivo_propio, NSS,Asesoria,Edad,Genero,Contacto,LGBT,RFC,Acompanado) {
        this.Nombre;
        this.Edad;
        this.Rango_de_Edad;
        this.Genero;
        this.Nacionalidad; 
        this.Discapacidad; 
        this.Contacto; 
        this.LGBT; 
        this.Dispositivo_propio;
        this.RFC;
        this.NSS;
        this.Asesoria;
        this.Acompanado;
        

    }

    //Este método servirá para guardar de manera persistente el nuevo objeto. 
    save() {

      return db.execute('INSERT INTO persona (Folio,Nombre,Edad,Rango_de_Edad,Genero,Nacionalidad, Discapacidad, Contacto,LGBT, Dispositivo_propio, RFC,NSS,Asesoria,Acompanado) VALUES (1,?,?,?,?,?,?,?,?,?,?,?,?,?)',
        [this.Nombre,this.Edad,this.Rango_de_Edad,this.Genero,this.Nacionalidad, this.Discapacidad, this.Contacto,this.LGBT, this.Dispositivo_propio, this.RFC,this.NSS,this.Asesoria,this.Acompanado]
        );
        
    }


}