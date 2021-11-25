module.exports = (request, response, next) => {
    if ((request.session.rol !== 1)) {
        return response.redirect('/panel/inicio');
    }
    next();
}