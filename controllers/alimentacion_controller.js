
const Alimentacion = require('../models/alimentacion');

exports.getNuevoAlimentacion=(request, response, next) => {

	response.render('registro-Migrante');/*,{
         //permisos: request.session.permiso
    });*/

}


exports.postNuevoAlimentacion=(request, response, next) => {
    console.log(request.body);
    const persona = new Persona(request.body.Nombre, request.body.Edad, request.body.Rango_de_Edad,request.body.Genero,request.body.Nacionalidad, request.body.Discapacidad,request.body.Contacto,request.body.Lgbt,request.body.Dispositivo_propio,request.body.Rfc,request.body.Nss,request.body.Asesoria,request.body.Acompanado);
    persona.save()
       .then(() => {
         //request.session.ultima_persona = request.body.nombreZona;
         response.redirect('/migrante/migrante');
       }).catch( err => {
            console.log(err);
            response.redirect('/migrante/migrante');    
       });
 }