const db = require('../util/database');


module.exports = class PerfilRefugio {

    //Constructor de la clase. Sirve para crear un nuevo objeto, y en él se definen las propiedades del modelo
    constructor(Nombre, Perfil_de_Refugio, Certificado_de_Nacionalidad_tramitado_CAMMI, Inicio_con_CAMMI, Fecha) {
        this.Nombre=Nombre;
        this.Perfil_de_Refugio=Perfil_de_Refugio;
        this.Certificado_de_Nacionalidad_tramitado_CAMMI=Certificado_de_Nacionalidad_tramitado_CAMMI;
        this.Inicio_con_CAMMI=Inicio_con_CAMMI;
        this.Fecha=Fecha; 
        
        

    }

    //Este método servirá para guardar de manera persistente el nuevo objeto. 
    save() {

      return db.execute('INSERT INTO `perfil_de_refugio` ( `Persona_Id`, `Perfil_de_Refugio`, `Certificado_de_Nacionalidad_tramitado_CAMMI`, `Inicio_con_CAMMI`, `Fecha`) VALUES ( ?, ?, ?, ?, ?)',
        [this.Nombre,this.Perfil_de_Refugio,this.Certificado_de_Nacionalidad_tramitado_CAMMI,this.Inicio_con_CAMMI,this.Fecha]
        );
        
    }

    static fetchAll() {

        return db.execute('SELECT * FROM perfil_de_refugio	')
          
        //return personas;
        
    }



}