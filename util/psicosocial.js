module.exports = (request, response, next) => {
    if ((request.session.rol === 3) || (request.session.rol === 4) || (request.session.rol === 7)) {
        return response.redirect('/panel/inicio');
    }
    next();
}