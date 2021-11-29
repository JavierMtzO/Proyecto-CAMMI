const db = require('../util/database');
const bcrypt = require('bcryptjs');

module.exports = class nuevo_usuario {

    //Constructor de la clase. Sirve para crear un nuevo objeto, y en él se definen las propiedades del modelo
    constructor(NAME, LASTNAME, USERNAME, EMAIL, PASSWORD, ID_ROL) {
        this.NAME = NAME;
        this.LASTNAME = LASTNAME;
        this.USERNAME = USERNAME;
        this.EMAIL = EMAIL;
        this.PASSWORD = PASSWORD;
        this.ID_ROL = ID_ROL;
    }

    //Este método servirá para guardar de manera persistente el nuevo objeto. 
    save() {
        //Dentro del método del modelo que crea el usuario
        //El segundo argumento es el número de veces que se aplica el algoritmo, actualmente 12 se considera un valor seguro
        //El código es asíncrono, por lo que hay que regresar la promesa
        return bcrypt.hash(this.PASSWORD, 12)
            .then((PASSWORD) => {
                return db.execute('INSERT INTO usuarios (NAME, LASTNAME, USERNAME, EMAIL, PASSWORD, ID_ROL) VALUES (?, ?, ?, ?, ?, ?)',
                    [this.NAME, this.LASTNAME, this.USERNAME, this.EMAIL, PASSWORD, this.ID_ROL]
                );
            })
            .catch(err => {
                console.log(err);
                throw Error("El correo electrónico ingresado ya está registrado como administrador.");
            });


    }

    //Este método servirá para devolver los objetos del almacenamiento persistente.
    static fetchAll() {
        return db.execute('SELECT * FROM usuarios');
    }

    static updateNoPassword(name, lastname, username, email, id_rol, id_usuario) {
        return db.execute('UPDATE usuarios SET NAME = ?, LASTNAME = ?, USERNAME = ?, EMAIL = ?, ID_ROL = ? WHERE ID_USUARIO = ?',
            [name, lastname, username, email, id_rol, id_usuario]
        );
    }

    static update(password, name, lastname, username, email, id_rol, id_usuario) {
        return bcrypt.hash(password, 12)
            .then((password) => {
                return db.execute('UPDATE usuarios SET PASSWORD = ?, NAME = ?, LASTNAME = ?, USERNAME = ?, EMAIL = ?, ID_ROL = ? WHERE ID_USUARIO = ?',
                    [password, name, lastname, username, email, id_rol, id_usuario]
                );
            })
            .catch(err => {
                console.log(err);
            });
    }

    static delete(id) {
        return db.execute('DELETE FROM usuarios WHERE ID_USUARIO = ?', [id]);
    }

    static fetchOne(EMAIL) {
        return db.execute('SELECT * FROM usuarios WHERE EMAIL = ? ', [EMAIL]);
    }
    static fetchPerfil(id) {
        return db.execute('SELECT * FROM usuarios WHERE ID_USUARIO = ?', [id]);
    }
    static login(correoElectronico, password) {
        return db.execute('SELECT * FROM admin WHERE ');
    }

}