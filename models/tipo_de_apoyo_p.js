
const db = require('../util/database');

module.exports = class Tipo_de_apoyo_p {
  
    static fetchAll() {

        return db.execute('SELECT * FROM 	tipo_de_apoyo_p	')
          
        //return personas;
        
    }

  

}