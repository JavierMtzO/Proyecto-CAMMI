
const RetornoAsistido = require('../models/retorno_asistido');
const Persona = require('../models/migrante');



exports.getNuevoRetornoAsistido = (request, response, next) => {

     Persona.fetchAll()
          .then(([personas, fieldData]) => {
               response.render('registro-RetornoAsistido', {
                    personas: personas
               });

          }).catch(err => {
               console.log(err);
          });


}

/*
exports.postNuevoRetornoAsistido = (request, response, next) => {
     console.log(request.body);
     const retornoasistido = new RetornoAsistido(request.body.Nombre, request.body.Denuncia, request.body.Denuncia_CAMMI, request.body.Victima_de_Delito, request.body.Carpeta_de_Investigacion);
     retornoasistido.save()
          .then(() => {
               //request.session.ultima_persona = request.body.nombreZona;
               response.redirect('/panel/juridico');
          }).catch(err => {
               console.log(err);
               response.redirect('/panel/juridico');
          });
}*/