
const Alimentacion = require('../models/alimentacion');
const Tipo_de_persona = require('../models/tipo_de_persona');
const Tipo_de_platillo = require('../models/tipo_de_platillo');

exports.getNuevoAlimentacion = (request, response, next) => {

  Tipo_de_persona.fetchAll()
    .then(([tipo_de_personas, fieldData]) => {
      Tipo_de_platillo.fetchAll()
        .then(([tipo_de_platillos, fieldData]) => {
          response.render('registro-Alimentacion', {
            tipo_de_personas: tipo_de_personas, tipo_de_platillos: tipo_de_platillos,
            permisos: request.session.permisos
          });
        }).catch(err => {
          console.log(err);
        });


    }).catch(err => {
      console.log(err);
    });


}


exports.postNuevoAlimentacion = (request, response, next) => {
  console.log(request.body);
  const alimentacion = new Alimentacion(request.body.Fecha, request.body.tipo_de_persona, request.body.tipo_de_platillo);
  alimentacion.save()
    .then(() => {
      //request.session.ultima_persona = request.body.nombreZona;
      response.redirect('/panel/albergue');
    }).catch(err => {
      console.log(err);
      response.redirect('/panel/albergue');
    });
}