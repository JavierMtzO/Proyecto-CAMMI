const express = require('express');
const router = express.Router();
const path = require('path');
const atencion_psicosocialController = require('../controllers/atencion_psicosocial_controller');
const isAuth = require('../util/is-auth');
const albergue = require('../util/albergue');
const juridico = require('../util/juridico');
const psicosocial = require('../util/psicosocial');

router.get('/atencion_psicosocial', isAuth, psicosocial, atencion_psicosocialController.getNuevoAtencion_psicosocial);

router.post('/atencion_psicosocial', isAuth, psicosocial, atencion_psicosocialController.postNuevoAtencion_psicosocial);



module.exports = router;