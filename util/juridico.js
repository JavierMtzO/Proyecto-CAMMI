module.exports = (request, response, next) => {
    if ((request.session.rol === 2) || (request.session.rol === 4) || (request.session.rol === 5)) {
        return response.redirect('/panel/inicio');
    }
    next();
}