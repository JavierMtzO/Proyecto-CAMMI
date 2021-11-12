
const Reufam = require('../models/reufam');
const Persona = require('../models/migrante');



exports.getNuevoReufam = (request, response, next) => {

     Persona.fetchAll()
          .then(([personas, fieldData]) => {
               response.render('registro-Reufam', {
                    personas: personas
               });

          }).catch(err => {
               console.log(err);
          });


}

/*
exports.postNuevoReufam = (request, response, next) => {
     console.log(request.body);
     const reufam = new Reufam(request.body.Nombre, request.body.Denuncia, request.body.Denuncia_CAMMI, request.body.Victima_de_Delito, request.body.Carpeta_de_Investigacion);
     reufam.save()
          .then(() => {
               //request.session.ultima_persona = request.body.nombreZona;
               response.redirect('/panel/juridico');
          }).catch(err => {
               console.log(err);
               response.redirect('/panel/juridico');
          });
}*/