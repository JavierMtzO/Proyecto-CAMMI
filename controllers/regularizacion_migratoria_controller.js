
const RegularizacionMigratoria = require('../models/regularizacion_migratoria');
const Persona = require('../models/migrante');



exports.getNuevoRegularizacionMigratoria = (request, response, next) => {

     Persona.fetchAll()
          .then(([personas, fieldData]) => {
               response.render('registro-RegularizacionMigratoria', {
                    personas: personas,
                    permisos: request.session.permisos
               });

          }).catch(err => {
               console.log(err);
          });


}


exports.postNuevoRegularizacionMigratoria = (request, response, next) => {
     console.log(request.body);
     const retornoasistido = new RegularizacionMigratoria(request.body.Nombre, request.body.Tipo, request.body.Inicio, request.body.Resolucion, request.body.Fecha);
     retornoasistido.save()
          .then(() => {
               //request.session.ultima_persona = request.body.nombreZona;
               response.redirect('/panel/juridico');
          }).catch(err => {
               console.log(err);
               response.redirect('/panel/juridico');
          });
}