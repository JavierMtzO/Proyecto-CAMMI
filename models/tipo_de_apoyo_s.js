
const db = require('../util/database');

module.exports = class Tipo_de_apoyo_s {
  
    static fetchAll() {

        return db.execute('SELECT * FROM 	tipo_de_apoyo_s	')
          
        //return personas;
        
    }

  

}