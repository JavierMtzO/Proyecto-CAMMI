module.exports = (request, response, next) => {
    response.locals.rolId = request.session.rol;
    next();
};