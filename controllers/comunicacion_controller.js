
const Comunicacion = require('../models/comunicacion');
const Persona = require('../models/migrante');



exports.getNuevoComunicacion = (request, response, next) => {

     Persona.fetchAll()
          .then(([personas, fieldData]) => {
               response.render('registro-Comunicacion', {
                    personas: personas
               });

          }).catch(err => {
               console.log(err);
          });


}


exports.postNuevoComunicacion = (request, response, next) => {
     console.log(request.body);
     const comunicacion = new Comunicacion(request.body.Nombre, request.body.Inicio_Servicio, request.body.Carga_de_Bateria, request.body.Uso_de_Wifi, request.body.Fecha, request.body.Pais_Destino_de_Llamada, request.body.Completado_de_la_Llamada, request.body.Mantenimiento_del_Contacto_Familiar);
     comunicacion.save()
          .then(() => {
               //request.session.ultima_persona = request.body.nombreZona;
               response.redirect('/panel/albergue');
          }).catch(err => {
               console.log(err);
               response.redirect('/panel/albergue');
          });
}