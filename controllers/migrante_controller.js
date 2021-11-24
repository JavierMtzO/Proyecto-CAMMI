
const Persona = require('../models/migrante');



exports.getMigrantes = (request, response, next) => {

     Persona.fetchAll()
          .then(([rows, fieldData]) => {
               response.render('migrantes', {
                    migrantes: rows,
                    exito: request.session.ultima_persona === undefined ? false : request.session.ultima_persona
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
     } else if (request.body.apoyos) {
          request.session.folio = request.body.apoyos;
          response.redirect('/migrante/apoyos');
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
               request.session.ultima_persona = request.body.Nombre;
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
exports.getApoyosAMigrantes = (request, response, next) => {
     Persona.fetchAlojamiento(request.session.folio)
          .then(([aloj, fieldData]) => {
               Persona.fetchComunicacion(request.session.folio)
                    .then(([comun, fieldData]) => {
                         Persona.fetchPIL(request.session.folio)
                              .then(([pil, fieldData]) => {
                                   Persona.fetchAtencionPsicosocial(request.session.folio)
                                        .then(([psico, fieldData]) => {
                                             Persona.fetchAtencionSocial(request.session.folio)
                                                  .then(([social, fieldData]) => {
                                                       Persona.fetchDelito(request.session.folio)
                                                            .then(([delito, fieldData]) => {
                                                                 Persona.fetchPerfilRefugio(request.session.folio)
                                                                      .then(([perfref, fieldData]) => {
                                                                           Persona.fetchRetornoAsistido(request.session.folio)
                                                                                .then(([retasis, fieldData]) => {
                                                                                     Persona.fetchJuicioAmparo(request.session.folio)
                                                                                          .then(([juicioamp, fieldData]) => {
                                                                                               Persona.fetchReufam(request.session.folio)
                                                                                                    .then(([reufam, fieldData]) => {
                                                                                                         Persona.fetchRegularizacionMigratoria(request.session.folio)
                                                                                                              .then(([regmig, fieldData]) => {
                                                                                                                   response.render('migrantes-apoyos-recibidos', {
                                                                                                                        alojamientos: aloj,
                                                                                                                        comunicaciones: comun,
                                                                                                                        pils: pil,
                                                                                                                        psicos: psico,
                                                                                                                        sociales: social,
                                                                                                                        delitos: delito,
                                                                                                                        perfiles: perfref,
                                                                                                                        retornos: retasis,
                                                                                                                        juicios: juicioamp,
                                                                                                                        reufams: reufam,
                                                                                                                        regularizaciones: regmig
                                                                                                                   });
                                                                                                              }).catch(err => {
                                                                                                                   console.log(err);
                                                                                                              });
                                                                                                    }).catch(err => {
                                                                                                         console.log(err);
                                                                                                    });
                                                                                          }).catch(err => {
                                                                                               console.log(err);
                                                                                          });
                                                                                }).catch(err => {
                                                                                     console.log(err);
                                                                                });
                                                                      }).catch(err => {
                                                                           console.log(err);
                                                                      });
                                                            }).catch(err => {
                                                                 console.log(err);
                                                            });
                                                  }).catch(err => {
                                                       console.log(err);
                                                  });
                                        }).catch(err => {
                                             console.log(err);
                                        });
                              }).catch(err => {
                                   console.log(err);
                              });
                    }).catch(err => {
                         console.log(err);
                    });
          }).catch(err => {
               console.log(err);
          });
}
