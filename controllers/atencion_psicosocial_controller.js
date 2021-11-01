
const Atencion_psicosocial = require('../models/atencion_psicosocial');
const Persona = require('../models/migrante');
const Tipo_de_apoyo_p = require('../models/tipo_de_apoyo_p');





exports.getNuevoAtencion_psicosocial = (request, response, next) => {

    Persona.fetchAll()
        .then(([personas, fieldData]) => {
            Tipo_de_apoyo_p.fetchAll()
                .then(([tipos, fieldData]) => {
                    response.render('registro-Atencionpsicosocial', {
                        personas: personas, tipos: tipos
                    });
                }).catch(err => {
                    console.log(err);
                });


        }).catch(err => {
            console.log(err);
        });

}


exports.postNuevoAtencion_psicosocial = (request, response, next) => {
    console.log(request.body);
    const atencion_psicosocial = new Atencion_psicosocial(request.body.Nombre, request.body.Fecha, request.body.Tipo_psicosocial, request.body.Formato_de_Atencion);
    atencion_psicosocial.save()
        .then(() => {
            //request.session.ultima_persona = request.body.nombreZona;
            response.redirect('/panel/psicosocial');
        }).catch(err => {
            console.log(err);
            response.redirect('/panel/psicosocial');
        });
}