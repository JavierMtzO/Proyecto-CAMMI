
const Programa_integracion_local = require('../models/programas_integracion_local');
const Persona = require('../models/migrante');
const Tipo_de_apoyo_pil = require('../models/tipo_de_apoyo_pil');





exports.getNuevoProgramas_integracion_local = (request, response, next) => {

    Persona.fetchAll()
        .then(([personas, fieldData]) => {
            Tipo_de_apoyo_pil.fetchAll()
                .then(([tipos, fieldData]) => {
                    response.render('registro-PIL', {
                        personas: personas, tipos: tipos
                    });
                }).catch(err => {
                    console.log(err);
                });


        }).catch(err => {
            console.log(err);
        });

}


exports.postNuevoProgramas_integracion_local = (request, response, next) => {
    console.log(request.body);
    const programa_integracion_local = new Programa_integracion_local(request.body.Nombre, request.body.Fecha, request.body.Tipo_pil, request.body.Inicio);
    programa_integracion_local.save()
        .then(() => {
            //request.session.ultima_persona = request.body.nombreZona;
            response.redirect('/panel/psicosocial');
        }).catch(err => {
            console.log(err);
            response.redirect('/panel/psicosocial');
        });
}