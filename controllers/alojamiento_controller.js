
const Alojamiento = require('../models/alojamiento');
const Persona = require('../models/migrante');



exports.getNuevoAlojamiento = (request, response, next) => {

     Persona.fetchAll()
          .then(([personas, fieldData]) => {
               response.render('registro-Alojamiento', {
                    personas: personas
               });

          }).catch(err => {
               console.log(err);
          });


}


exports.postNuevoAlojamiento = (request, response, next) => {
     console.log(request.body);
     const alojamiento = new Alojamiento(request.body.Nombre, request.body.Persona_Refugiada, request.body.Miembro_de_la_Estacion_Migratoria, request.body.Uso_de_Cama, request.body.Alojamiento_con_Costo, request.body.Mpp, request.body.Fecha);
     alojamiento.save()
          .then(() => {
               //request.session.ultima_persona = request.body.nombreZona;
               response.redirect('/panel/albergue');
          }).catch(err => {
               console.log(err);
               response.redirect('/panel/albergue');
          });
}