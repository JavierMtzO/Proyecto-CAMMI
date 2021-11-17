
const JuicioAmparo = require('../models/juicio_amparo');
const Persona = require('../models/migrante');



exports.getNuevoJuicioAmparo = (request, response, next) => {

     Persona.fetchAll()
          .then(([personas, fieldData]) => {
               response.render('registro-JuicioAmparo', {
                    personas: personas
               });

          }).catch(err => {
               console.log(err);
          });


}


exports.postNuevoJuicioAmparo = (request, response, next) => {
     console.log(request.body);
     const juicioamparo = new JuicioAmparo(request.body.Nombre, request.body.Inicio, request.body.Inicio_CAMMI, request.body.Resolucion, request.body.Fecha);
     juicioamparo.save()
          .then(() => {
               //request.session.ultima_persona = request.body.nombreZona;
               response.redirect('/panel/juridico');
          }).catch(err => {
               console.log(err);
               response.redirect('/panel/juridico');
          });
}