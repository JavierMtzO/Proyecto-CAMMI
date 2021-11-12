const express = require('express');
const router = express.Router();
const path = require('path');
const RetornoAsistidoController = require('../controllers/retorno_asistido_controller');
const isAuth = require('../util/is-auth');


router.get('/retorno_asistido', isAuth, RetornoAsistidoController.getNuevoRetornoAsistido);

//router.post('/retorno_asistido', isAuth, RetornoAsistidoController.postNuevoRetornoAsistido);



module.exports = router;