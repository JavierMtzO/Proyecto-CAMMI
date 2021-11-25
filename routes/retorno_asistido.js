const express = require('express');
const router = express.Router();
const path = require('path');
const RetornoAsistidoController = require('../controllers/retorno_asistido_controller');
const isAuth = require('../util/is-auth');
const albergue = require('../util/albergue');
const juridico = require('../util/juridico');
const psicosocial = require('../util/psicosocial');

router.get('/retorno_asistido', isAuth, juridico, RetornoAsistidoController.getNuevoRetornoAsistido);

router.post('/retorno_asistido', isAuth, juridico, RetornoAsistidoController.postNuevoRetornoAsistido);



module.exports = router;