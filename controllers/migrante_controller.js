
const Persona = require('../models/migrante');



exports.getMigrantes = (request, response, next) => {

     Persona.fetchAll()
          .then(([rows, fieldData]) => {
               response.render('migrantes', {
                    migrantes: rows
               });
          }).catch(err => {
               console.log(err);
          });
}
exports.postMigrantes = (request, response, next) => {
     request.session.folio = request.body.editar;
     if (request.body.editar) {
          request.session.folio = request.body.editar;
          response.redirect('/migrante/editar');
     } else if (request.body.ver) {
          request.session.folio = request.body.ver;
          response.redirect('/migrante/ver');
     }

}

exports.getNuevoMigrante = (request, response, next) => {

     response.render('registro-Migrante');/*,{
         //permisos: request.session.permiso
    });*/

}

exports.postNuevoMigrante = (request, response, next) => {
     console.log(request.body);
     const persona = new Persona(request.body.Nombre, request.body.Edad, request.body.Rango_de_Edad, request.body.Genero, request.body.Nacionalidad, request.body.Discapacidad, request.body.Contacto, request.body.Lgbt, request.body.Dispositivo_propio, request.body.Rfc, request.body.Nss, request.body.Asesoria, request.body.Acompanado);
     persona.save()
          .then(() => {
               //request.session.ultima_persona = request.body.nombreZona;
               response.redirect('/migrante');
          }).catch(err => {
               console.log(err);
               response.redirect('/migrante');
          });
}

exports.getVerMigrante = (request, response, next) => {

     Persona.fetchOne(request.session.folio)
          .then(([rows, fieldData]) => {
               response.render('ver-Migrante', {
                    migrante: rows[0]
               });
          }).catch(err => {
               console.log(err);
          });
}
exports.getEditarMigrante = (request, response, next) => {

     Persona.fetchOne(request.session.folio)
          .then(([rows, fieldData]) => {
               response.render('editar-Migrante', {
                    migrante: rows[0]
               });
          }).catch(err => {
               console.log(err);
          });
}
// exports.postEditarMigrante = (request, response, next) => {

//      Persona.update(request.body.Nombre, request.body.Edad, request.body.Rango_de_Edad, request.body.Genero, request.body.Nacionalidad, request.body.Discapacidad, request.body.Contacto, request.body.Lgbt, request.body.Dispositivo_propio, request.body.Rfc, request.body.Nss, request.body.Asesoria, request.body.Acompanado, request.session.folio)
//           .then(([rows, fieldData]) => {
//                response.redirect('/migrante');
//           }).catch(err => {
//                console.log(err);
//           });

// }
exports.postEditarMigrante = (request, response, next) => {
     if (request.body.submit == 'Guardar cambios') {
          Persona.update(request.body.Nombre, request.body.Edad, request.body.Rango_de_Edad, request.body.Genero, request.body.Nacionalidad, request.body.Discapacidad, request.body.Contacto, request.body.Lgbt, request.body.Dispositivo_propio, request.body.Rfc, request.body.Nss, request.body.Asesoria, request.body.Acompanado, request.session.folio)
               .then(([rows, fieldData]) => {
                    response.redirect('/migrante');
               }).catch(err => {
                    console.log(err);
               });
     } else if (request.body.submit == 'Eliminar') {
          Persona.delete(request.session.folio)
               .then(([rows, fieldData]) => {
                    response.redirect('/migrante');
               }).catch(err => {
                    console.log(err);
               });
     }
}
