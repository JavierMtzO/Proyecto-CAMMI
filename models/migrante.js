const db = require('../util/database');


module.exports = class Persona {

    //Constructor de la clase. Sirve para crear un nuevo objeto, y en él se definen las propiedades del modelo
    constructor(Nombre, Edad, Rango_de_Edad, Genero, Nacionalidad, Discapacidad, Contacto, Lgbt, Dispositivo_propio, Rfc, Nss, Asesoria, Acompanado) {
        this.Nombre = Nombre;
        this.Edad = Edad;
        this.Rango_de_Edad = Rango_de_Edad;
        this.Genero = Genero;
        this.Nacionalidad = Nacionalidad;
        this.Discapacidad = Discapacidad;
        this.Contacto = Contacto;
        this.Lgbt = Lgbt;
        this.Dispositivo_propio = Dispositivo_propio;
        this.Rfc = Rfc;
        this.Nss = Nss;
        this.Asesoria = Asesoria;
        this.Acompanado = Acompanado;


    }

    //Este método servirá para guardar de manera persistente el nuevo objeto. 
    save() {
        return db.execute('INSERT INTO `persona` ( `Nombre`, `Edad`, `Rango_de_Edad`, `Genero`, `Nacionalidad`, `Discapacidad`, `Contacto`, `LGBT`, `Dispositivo_propio`,  `RFC`, `NSS`, `Asesoria`, `Acompanado`) VALUES ( ?, ?, ?, ?, ?, ?, ?, ?, ?,  ?, ?, ?, ?)',
            [this.Nombre, this.Edad, this.Rango_de_Edad, this.Genero, this.Nacionalidad, this.Discapacidad, this.Contacto, this.Lgbt, this.Dispositivo_propio, this.Rfc, this.Nss, this.Asesoria, this.Acompanado]
        );

    }

    static update(Nombre, Edad, Rango_de_Edad, Genero, Nacionalidad, Discapacidad, Contacto, LGBT, Dispositivo_propio, RFC, NSS, Asesoria, Acompanado, Folio) {
        return db.execute('UPDATE PERSONA SET Nombre = ?, Edad = ?, Rango_de_Edad = ?, Genero = ?, Nacionalidad = ?, Discapacidad = ?, Contacto = ?, LGBT = ?, Dispositivo_propio = ?, RFC = ?, NSS = ?, Asesoria = ?, Acompanado = ? WHERE Folio = ?',
            [Nombre, Edad, Rango_de_Edad, Genero, Nacionalidad, Discapacidad, Contacto, LGBT, Dispositivo_propio, RFC, NSS, Asesoria, Acompanado, Folio]
        );
    }

    static fetchAll() {

        return db.execute('SELECT * FROM   persona	')

    }

    static fetchOne(folio) {
        return db.execute('SELECT * FROM PERSONA WHERE Folio = ? ', [folio]);
    }

    static delete(folio) {
        return db.execute('DELETE FROM PERSONA WHERE Folio = ?', [folio]);
    }



}