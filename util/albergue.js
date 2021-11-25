module.exports = (request, response, next) => {
    if ((request.session.rol === 2) || (request.session.rol === 3) || (request.session.rol === 6)) {
        return response.redirect('/panel/inicio');
    }
    next();
}