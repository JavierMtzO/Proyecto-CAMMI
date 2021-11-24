

const nuevo_usuario = require('../models/usuario')
const rol = require('../models/rol')
const bcrypt = require('bcryptjs');

exports.getLogin = (request, response, next) => {
    response.render('login', {  
        error: request.session.error === undefined ? false : request.session.error 
    });
};

exports.postLogin = (request, response, next) => {
    request.session.error = undefined;
    request.session.email = request.body.email;
    nuevo_usuario.fetchOne(request.session.email)
        .then(([rows_usuario, fieldData]) => {
            rol.getRol(request.session.email)
            .then(([rows_usuario_rol, fieldData]) => {
                bcrypt.compare(request.body.password, rows_usuario[0].PASSWORD)
                    .then(doMatch => {
                        if (doMatch) {
                            request.session.isLoggedIn = true;
                            request.session.user = rows_usuario[0].NAME;
                            request.session.permisos =rows_usuario_rol[0].ID_ROL;
                             console.log(request.session.permisos);
                            return request.session.save(err => {
                                response.redirect('/panel/inicio');
                            });
                        }
                        request.session.error = "Usuario y/o contraseña incorrectos";
                        response.redirect('login');
                    }).catch(err => {
                        console.log(err);
                        request.session.error = "Usuario y/o contraseña incorrectos";
                        response.redirect('login');
                    });
                }).catch(err => {
                    console.log(err);
                    request.session.error = "Usuario y/o contraseña incorrectos";
                    response.redirect('login');
                });
        }).catch(err => {
            console.log(err);
            request.session.error = "Usuario y/o contraseña incorrectos";
            response.redirect('login');
        });
};

exports.logout = (request, response, next) => {
    request.session.destroy(() => {
        response.redirect('/login'); //Este código se ejecuta cuando la sesión se elimina.
    });
};

