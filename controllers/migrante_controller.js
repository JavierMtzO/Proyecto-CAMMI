
const Persona = require('../models/migrante');

exports.getNuevoMigrante=(request, response, next) => {

	response.render('registro-Migrante');/*,{
         //permisos: request.session.permiso
    });*/

}


exports.postNuevoMigrante=(request, response, next) => {
    console.log(request.body);
    const persona = new Persona(request.body.Nombre, request.body.Rango_de_Edad, request.body.Nacionalidad,request.body.Discapacidad,request.body.Dispositivo_propio, request.body.NSS,request.body.Asesoria,request.body.Edad,request.body.Genero,request.body.Contacto,request.body.LGBT,request.body.RFC,request.body.Acompanado);
    persona.save()
       .then(() => {
         //request.session.ultima_persona = request.body.nombreZona;
         response.redirect('/migrante/migrante');
       }).catch( err => {
            console.log(err);
            response.redirect('/migrante/migrante');    
       });
 }