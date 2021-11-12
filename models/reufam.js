const db = require('../util/database');

/*
module.exports = class Reufam {

    //Constructor de la clase. Sirve para crear un nuevo objeto, y en él se definen las propiedades del modelo
    constructor(Nombre, Denuncia, Denuncia_CAMMI,Victima_de_Delito,Carpeta_de_Investigacion) {
        this.Nombre=Nombre;
        this.Denuncia=Denuncia;
        this.Denuncia_CAMMI=Denuncia_CAMMI;
        this.Victima_de_Delito=Victima_de_Delito;
        this.Carpeta_de_Investigacion=Carpeta_de_Investigacion; 
        
        

    }

    //Este método servirá para guardar de manera persistente el nuevo objeto. 
    save() {

      return db.execute('INSERT INTO `delito` ( `Persona_Id`, `Denuncia`, `Denuncia_CAMMI`, `Victima_de_Delito`, `Carpeta_de_Investigacion`) VALUES ( ?, ?, ?, ?, ?)',
        [this.Nombre,this.Denuncia,this.Denuncia_CAMMI,this.Victima_de_Delito,this.Carpeta_de_Investigacion]
        );
        
    }

    static fetchAll() {

        return db.execute('SELECT * FROM delito	')
          
        //return personas;
        
    }



}*/