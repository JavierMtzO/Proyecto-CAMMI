const db = require('../util/database');


module.exports = class Delito {

    //Constructor de la clase. Sirve para crear un nuevo objeto, y en él se definen las propiedades del modelo
    constructor(Nombre, Inicio_Servicio, Carga_de_Bateria,Uso_de_Wifi,Fecha, Pais_Destino_de_Llamada,Completado_de_la_Llamada,Mantenimiento_del_Contacto_Familiar) {
        this.Nombre=Nombre;
        this.Inicio_Servicio=Inicio_Servicio;
        this.Carga_de_Bateria=Carga_de_Bateria;
        this.Uso_de_Wifi=Uso_de_Wifi;
        this.Fecha=Fecha; 
        this.Pais_Destino_de_Llamada=Pais_Destino_de_Llamada; 
        this.Completado_de_la_Llamada=Completado_de_la_Llamada; 
        this.Mantenimiento_del_Contacto_Familiar=Mantenimiento_del_Contacto_Familiar; 
        

    }

    //Este método servirá para guardar de manera persistente el nuevo objeto. 
    save() {

      return db.execute('INSERT INTO `comunicacion` (`Persona_Id`, `Inicio_Servicio`, `Carga_de_Bateria`, `Uso_de_Wifi`, `Fecha`, `Pais_Destino_de_Llamada`, `Completado_de_la_Llamada`, `Mantenimiento_del_Contacto_Familiar`) VALUES (?, ?, ?, ?, ?, ?, ?, ?)',
        [this.Nombre,this.Inicio_Servicio,this.Carga_de_Bateria,this.Uso_de_Wifi,this.Fecha, this.Pais_Destino_de_Llamada, this.Completado_de_la_Llamada,this.Mantenimiento_del_Contacto_Familiar]
        );
        
    }

    static fetchAll() {

        return db.execute('SELECT * FROM delito	')
          
        //return personas;
        
    }



}