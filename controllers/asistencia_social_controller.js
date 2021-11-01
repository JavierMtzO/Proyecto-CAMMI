
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
     const asistencia_social = new Asistencia_social(request.body.Nombre, request.body.Inicio_Servicio, request.body.Carga_de_Bateria,request.body.Uso_de_Wifi,request.body.Fecha, request.body.Pais_Destino_de_Llamada,request.body.Completado_de_la_Llamada,request.body.Mantenimiento_del_Contacto_Familiar);
     asistencia_social.save()
        .then(() => {
          //request.session.ultima_persona = request.body.nombreZona;
          response.redirect('/asistencia_social/asistencia_social');
        }).catch( err => {
             console.log(err);
             response.redirect('/asistencia_social/asistencia_social');    
        });
 }