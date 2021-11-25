const express = require('express');
const router = express.Router();
const path = require('path');
const comunicacionController = require('../controllers/comunicacion_controller');
const isAuth = require('../util/is-auth');
const albergue = require('../util/albergue');
const juridico = require('../util/juridico');
const psicosocial = require('../util/psicosocial');

router.get('/comunicacion', isAuth, psicosocial, comunicacionController.getNuevoComunicacion);

router.post('/comunicacion', isAuth, psicosocial, comunicacionController.postNuevoComunicacion);



module.exports = router;