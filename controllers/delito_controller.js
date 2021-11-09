
const Delito = require('../models/delito');
const Persona = require('../models/migrante');



exports.getNuevoDelito = (request, response, next) => {

     Persona.fetchAll()
          .then(([personas, fieldData]) => {
               response.render('registro-Delito', {
                    personas: personas
               });

          }).catch(err => {
               console.log(err);
          });


}

/*
exports.postNuevoDelito = (request, response, next) => {
     console.log(request.body);
     const delito = new Delito(request.body.Nombre, request.body.Inicio_Servicio, request.body.Carga_de_Bateria, request.body.Uso_de_Wifi, request.body.Fecha, request.body.Pais_Destino_de_Llamada, request.body.Completado_de_la_Llamada, request.body.Mantenimiento_del_Contacto_Familiar);
     delito.save()
          .then(() => {
               //request.session.ultima_persona = request.body.nombreZona;
               response.redirect('/panel/juridico');
          }).catch(err => {
               console.log(err);
               response.redirect('/panel/juridico');
          });
}*/