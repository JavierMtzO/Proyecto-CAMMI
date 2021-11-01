
const db = require('../util/database');

module.exports = class Tipo_de_apoyo_pil {
  
    static fetchAll() {

        return db.execute('SELECT * FROM 	tipo_de_apoyo_pil	')
          
        //return personas;
        
    }

  

}