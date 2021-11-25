

const nuevo_usuario = require('../models/usuario')
const bcrypt = require('bcryptjs');

exports.get = (request, response, next) => {
    request.session.rol = 0;
    response.redirect('login');
};

exports.getLogin = (request, response, next) => {
    request.session.rol = 0;
    response.render('login', {
        error: request.session.error === undefined ? false : request.session.error
    });
};

exports.postLogin = (request, response, next) => {
    request.session.error = undefined;
    request.session.email = request.body.email;
    nuevo_usuario.fetchOne(request.session.email)
        .then(([rows_usuario, fieldData]) => {
            bcrypt.compare(request.body.password, rows_usuario[0].PASSWORD)
                .then(doMatch => {
                    if (doMatch) {
                        request.session.isLoggedIn = true;
                        request.session.user = rows_usuario[0].NAME;
                        return request.session.save(err => {
                            request.session.rol = rows_usuario[0].ID_ROL;
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
};

exports.logout = (request, response, next) => {
    request.session.destroy(() => {
        response.redirect('/login'); //Este código se ejecuta cuando la sesión se elimina.
    });
};

