
const Comunicacion = require('../models/comunicacion');
const Persona = require('../models/migrante');



exports.getNuevoComunicacion=(request, response, next) => {

    Persona.fetchAll()
     .then(([personas, fieldData]) => {
        response.render('registro-Comunicacion',{
            personas:personas 
          });
         
     }).catch(err => {
         console.log(err);
     });


}


exports.postNuevoComunicacion=(request, response, next) => {
     console.log(request.body);
     const comunicacion = new Comunicacion(request.body.Fecha,request.body.tipo_de_persona,request.body.tipo_de_platillo);
     comunicacion.save()
        .then(() => {
          //request.session.ultima_persona = request.body.nombreZona;
          response.redirect('/comunicacion/comunicacion');
        }).catch( err => {
             console.log(err);
             response.redirect('/comunicacion/comunicacion');    
        });
 }