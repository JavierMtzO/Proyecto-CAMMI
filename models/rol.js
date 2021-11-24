const db = require('../util/database');

module.exports = class nuevo_rol {

    //Constructor de la clase. Sirve para crear un nuevo objeto, y en él se definen las propiedades del modelo
    constructor(NOMBRE, DESCRIPCION) {
        this.NOMBRE = NOMBRE;
        this.DESCRIPCION = DESCRIPCION;
    }


    static fetchAll() {
        return db.execute('SELECT * FROM ROLES');
    }
    static fetchJoinUser() {
        return db.execute('SELECT U.ID_USUARIO, U.NAME, U.LASTNAME, U.USERNAME, U.EMAIL, R.NOMBRE FROM ROLES R, USUARIOS U WHERE R.ID_ROL = U.ID_ROL;');
    }
    static fetchSpecificJoinUser(id) {
        return db.execute('SELECT U.ID_USUARIO, U.NAME, U.LASTNAME, U.USERNAME, U.EMAIL, R.NOMBRE FROM ROLES R, USUARIOS U WHERE R.ID_ROL = U.ID_ROL AND ID_USUARIO = ?', [id]);
    }

    static getRol(email) {
        return db.execute('SELECT  R.ID_ROL, U.ID_USUARIO, U.NAME, U.LASTNAME, U.USERNAME, U.EMAIL, R.NOMBRE FROM ROLES R, USUARIOS U WHERE R.ID_ROL = U.ID_ROL AND U.EMAIL = ?', [email]);
    }

}