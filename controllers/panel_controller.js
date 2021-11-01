const nuevo_usuario = require('../models/usuario')
const nuevo_rol = require('../models/rol')


exports.getPanelInicio = (request, response, next) => {
    response.render('inicio');
};
exports.getPanelUsuarios = (request, response, next) => {
    request.session.id_usuario = 0;
    nuevo_rol.fetchJoinUser()
        .then(([userrows, fieldData]) => {
            response.render('usuarios', {
                users: userrows
            });
        }).catch(err => {
            console.log(err);
        });
};
exports.postPanelUsuarios = (request, response, next) => {
    request.session.id_usuario = request.body.editar;
    response.redirect('/panel/usuarios/editar');
};
exports.getPanelUsuariosCrear = (request, response, next) => {
    nuevo_rol.fetchAll()
        .then(([rows, fieldData]) => {
            response.render('crear-Usuario', {
                roles: rows
            });
        }).catch(err => {
            console.log(err);
        });
};
exports.postPanelUsuariosCrear = (request, response, next) => {
    const usuario_creado = new nuevo_usuario(
        request.body.nombre,
        request.body.apellidos,
        request.body.username,
        request.body.email,
        request.body.password,
        request.body.rol
    );

    usuario_creado.save()
        .then(([rows, fieldData]) => {
            response.redirect('/panel/usuarios')
        }).catch(err => {
            console.log(err);
        });
};

exports.getPanelUsuariosEditar = (request, response, next) => {
    nuevo_rol.fetchAll()
        .then(([rowsrol, fieldData]) => {
            nuevo_usuario.fetchPerfil(request.session.id_usuario)
                .then(([rowsuser, fieldData]) => {
                    nuevo_rol.fetchSpecificJoinUser(request.session.id_usuario)
                        .then(([rowsroluser, fieldData]) => {
                            response.render('editar-Usuario', {
                                roles: rowsrol,
                                user: rowsuser,
                                roleuser: rowsroluser
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
};

exports.postPanelUsuariosEditar = (request, response, next) => {
    if (request.body.submit == 'Hacer cambios') {
        nuevo_usuario.fetchPerfil(request.session.id_usuario)
            .then(([rows, fieldData]) => {
                if (request.body.password === rows[0].PASSWORD.toString()) {
                    nuevo_usuario.updateNoPassword(request.body.nombre, request.body.apellidos, request.body.username, request.body.email, request.body.rol, request.session.id_usuario)
                        .then(([rowsroluser, fieldData]) => {
                            response.redirect('/panel/usuarios');
                        }).catch(err => {
                            console.log(err);
                        });
                } else {
                    nuevo_usuario.update(request.body.password, request.body.nombre, request.body.apellidos, request.body.username, request.body.email, request.body.rol, request.session.id_usuario)
                        .then(([rowsroluser, fieldData]) => {
                            response.redirect('/panel/usuarios');
                        }).catch(err => {
                            console.log(err);
                        });
                }
            }).catch(err => {
                console.log(err);
            });
    } else if (request.body.submit == 'Eliminar') {
        nuevo_usuario.delete(request.session.id_usuario)
            .then(([rowsroluser, fieldData]) => {
                response.redirect('/panel/usuarios');
            }).catch(err => {
                console.log(err);
            });
    }

};

exports.getPanelJuridico = (request, response, next) => {
    response.render('panel-Juridico');
};

exports.getPanelPsicosocial = (request, response, next) => {
    response.render('panel-Psicosocial');
};

exports.getPanelAlbergue = (request, response, next) => {
    response.render('panel-Albergue');
};