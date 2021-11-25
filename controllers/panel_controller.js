const nuevo_usuario = require('../models/usuario')
const nuevo_rol = require('../models/rol')
const reporte = require('../models/reportes')

var today = new Date();
var dd = String(today.getDate()).padStart(2, '0');
var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
var yyyy = today.getFullYear();



today = yyyy + '-' + mm + '-' + dd;
firstDay = yyyy + '-' + mm + '-' + 01;
hoy = today.toString();
primerDia = firstDay.toString();

exports.getPanelInicio = (request, response, next) => {
    var today = new Date();
    const monthNames = ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio",
        "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"
    ];
    let nombremes = monthNames[today.getMonth()];
    let totalalbergue = 0;
    let totalpsicoscial = 0;
    let totaljuridico = 0;
    let total;
    reporte.fetchPIL(primerDia, hoy)
        .then(([pil, fieldData]) => {
            reporte.fetchAtencionPsicosocial(primerDia, hoy)
                .then(([atpsi, fieldData]) => {
                    reporte.fetchAsistenciaSocial(primerDia, hoy)
                        .then(([asisoc, fieldData]) => {
                            reporte.fetchAlojamiento(primerDia, hoy)
                                .then(([aloj, fieldData]) => {
                                    reporte.fetchComunicacion(primerDia, hoy)
                                        .then(([comun, fieldData]) => {
                                            reporte.fetchAlimentacion(primerDia, hoy)
                                                .then(([alim, fieldData]) => {
                                                    reporte.fetchDesayunos(primerDia, hoy)
                                                        .then(([desa, fieldData]) => {
                                                            reporte.fetchComidas(primerDia, hoy)
                                                                .then(([comi, fieldData]) => {
                                                                    reporte.fetchCenas(primerDia, hoy)
                                                                        .then(([cen, fieldData]) => {
                                                                            reporte.fetchDelito(primerDia, hoy)
                                                                                .then(([deli, fieldData]) => {
                                                                                    reporte.fetchPerfilDelRefugiado(primerDia, hoy)
                                                                                        .then(([perfref, fieldData]) => {
                                                                                            reporte.fetchRetornoAsistido(primerDia, hoy)
                                                                                                .then(([retasis, fieldData]) => {
                                                                                                    reporte.fetchJuicioDeAmparo(primerDia, hoy)
                                                                                                        .then(([juic, fieldData]) => {
                                                                                                            reporte.fetchREUFAM(primerDia, hoy)
                                                                                                                .then(([reuf, fieldData]) => {
                                                                                                                    reporte.fetchRegularizacionMigratoria(primerDia, hoy)
                                                                                                                        .then(([regmig, fieldData]) => {
                                                                                                                            reporte.fetchHospedado(primerDia, hoy)
                                                                                                                                .then(([hosp, fieldData]) => {
                                                                                                                                    reporte.fetchPersonal(primerDia, hoy)
                                                                                                                                        .then(([pers, fieldData]) => {
                                                                                                                                            reporte.fetchVoluntario(primerDia, hoy)
                                                                                                                                                .then(([volun, fieldData]) => {
                                                                                                                                                    totalalbergue += aloj[0].alojamiento + comun[0].comunicacion;
                                                                                                                                                    totalpsicoscial += pil[0].pil + atpsi[0].atencion_psicosocial + asisoc[0].asistencia_social;
                                                                                                                                                    totaljuridico += deli[0].delito + perfref[0].perfil_de_refugio + retasis[0].retorno_asistido + juic[0].juicio_de_amparo + reuf[0].reufam + regmig[0].regularizacion_migratorio;
                                                                                                                                                    total = totalalbergue + totalpsicoscial + totaljuridico;

                                                                                                                                                    response.render('inicio', {
                                                                                                                                                        mes: nombremes,
                                                                                                                                                        servicios: total,
                                                                                                                                                        albergue: totalalbergue,
                                                                                                                                                        psicosocial: totalpsicoscial,
                                                                                                                                                        juridico: totaljuridico,
                                                                                                                                                        pils: pil[0],
                                                                                                                                                        atenciones: atpsi[0],
                                                                                                                                                        asistencias: asisoc[0],
                                                                                                                                                        alojamientos: aloj[0],
                                                                                                                                                        comunicaciones: comun[0],
                                                                                                                                                        alimentos: alim[0],
                                                                                                                                                        desayunos: desa[0],
                                                                                                                                                        comidas: comi[0],
                                                                                                                                                        cenas: cen[0],
                                                                                                                                                        hospedados: hosp[0],
                                                                                                                                                        personal: pers[0],
                                                                                                                                                        voluntarios: volun[0],
                                                                                                                                                        delitos: deli[0],
                                                                                                                                                        perfiles: perfref[0],
                                                                                                                                                        retornos: retasis[0],
                                                                                                                                                        juicios: juic[0],
                                                                                                                                                        reufams: reuf[0],
                                                                                                                                                        regularizaciones: regmig[0]
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

};
exports.getPanelUsuarios = (request, response, next) => {
    request.session.id_usuario = 0;
    nuevo_rol.fetchJoinUser()
        .then(([userrows, fieldData]) => {
            response.render('usuarios', {
                users: userrows,
                exito_usuario: request.session.ultimo_personal === undefined ? false : request.session.ultimo_personal
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
            request.session.ultimo_personal = request.body.nombre;
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