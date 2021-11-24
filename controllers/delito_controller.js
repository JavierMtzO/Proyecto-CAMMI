
const Delito = require('../models/delito');
const Persona = require('../models/migrante');



exports.getNuevoDelito = (request, response, next) => {

     Persona.fetchAll()
          .then(([personas, fieldData]) => {
               response.render('registro-Delito', {
                    personas: personas,
                    permisos: request.session.permisos
               });

          }).catch(err => {
               console.log(err);
          });


}


exports.postNuevoDelito = (request, response, next) => {
     console.log(request.body);
     const delito = new Delito(request.body.Nombre, request.body.Denuncia, request.body.Denuncia_CAMMI, request.body.Victima_de_Delito, request.body.Carpeta_de_Investigacion);
     delito.save()
          .then(() => {
               //request.session.ultima_persona = request.body.nombreZona;
               response.redirect('/panel/juridico');
          }).catch(err => {
               console.log(err);
               response.redirect('/panel/juridico');
          });
}