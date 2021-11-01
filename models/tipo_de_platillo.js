
const db = require('../util/database');

module.exports = class Tipo_de_platillo {

    static fetchAll() {

        return db.execute('SELECT * FROM TIPO_DE_PLATILLO')

        //return personas;

    }



}