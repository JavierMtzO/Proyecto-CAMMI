
const Asistencia_social = require('../models/asistencia_social');
const Persona = require('../models/migrante');
const Tipo_de_apoyo_s = require('../models/tipo_de_apoyo_s');



  

exports.getNuevoAsistencia_social=(request, response, next) => {

    Persona.fetchAll()
    .then(([personas, fieldData]) => {
        Tipo_de_apoyo_s.fetchAll()
        .then(([tipos, fieldData]) => {
            response.render('registro-Asistenciasocial',{
                personas:personas , tipos:tipos
            });
        }).catch(err => {
            console.log(err);
        });
       
        
    }).catch(err => {
        console.log(err);
    });

}


exports.postNuevoAsistencia_social=(request, response, next) => {
     console.log(request.body);
     const asistencia_social = new Asistencia_social(request.body.Nombre, request.body.Fecha, request.body.Tipo_social, request.body.Formato_de_Atencion);
     asistencia_social.save()
        .then(() => {
          //request.session.ultima_persona = request.body.nombreZona;
          response.redirect('/asistencia_social/asistencia_social');
        }).catch( err => {
             console.log(err);
             response.redirect('/asistencia_social/asistencia_social');    
        });
 }