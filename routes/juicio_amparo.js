const express = require('express');
const router = express.Router();
const path = require('path');
const JuicioAmparoController = require('../controllers/juicio_amparo_controller');
const isAuth = require('../util/is-auth');
const albergue = require('../util/albergue');
const juridico = require('../util/juridico');
const psicosocial = require('../util/psicosocial');

router.get('/juicio_amparo', isAuth, juridico, JuicioAmparoController.getNuevoJuicioAmparo);

router.post('/juicio_amparo', isAuth, juridico, JuicioAmparoController.postNuevoJuicioAmparo);



module.exports = router;