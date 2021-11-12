
const PerfilRefugio = require('../models/perfil_refugio');
const Persona = require('../models/migrante');



exports.getNuevoPerfilRefugio = (request, response, next) => {

     Persona.fetchAll()
          .then(([personas, fieldData]) => {
               response.render('registro-PerfilRefugio', {
                    personas: personas
               });

          }).catch(err => {
               console.log(err);
          });


}

/*
exports.postNuevoPerfilRefugio = (request, response, next) => {
     console.log(request.body);
     const perfilrefugio = new PerfilRefugio(request.body.Nombre, request.body.Denuncia, request.body.Denuncia_CAMMI, request.body.Victima_de_Delito, request.body.Carpeta_de_Investigacion);
     perfilrefugio.save()
          .then(() => {
               //request.session.ultima_persona = request.body.nombreZona;
               response.redirect('/panel/juridico');
          }).catch(err => {
               console.log(err);
               response.redirect('/panel/juridico');
          });
}*/