
const db = require('../util/database');

module.exports = class Tipo_de_persona {
  
    static fetchAll() {

        return db.execute('SELECT * FROM 	TIPO_DE_PERSONA	')
          
        //return personas;
        
    }

  

}