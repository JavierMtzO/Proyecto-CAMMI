
const PerfilRefugio = require('../models/perfil_refugio');
const Persona = require('../models/migrante');



exports.getNuevoPerfilRefugio = (request, response, next) => {

     Persona.fetchAll()
          .then(([personas, fieldData]) => {
               response.render('registro-PerfilRefugio', {
                    personas: personas,
                    permisos: request.session.permisos
               });

          }).catch(err => {
               console.log(err);
          });


}


exports.postNuevoPerfilRefugio = (request, response, next) => {
     console.log(request.body);
     const perfilrefugio = new PerfilRefugio(request.body.Nombre, request.body.Perfil_de_Refugio, request.body.Certificado_de_Nacionalidad_tramitado_CAMMI, request.body.Inicio_con_CAMMI, request.body.Fecha);
     perfilrefugio.save()
          .then(() => {
               //request.session.ultima_persona = request.body.nombreZona;
               response.redirect('/panel/juridico');
          }).catch(err => {
               console.log(err);
               response.redirect('/panel/juridico');
          });
}