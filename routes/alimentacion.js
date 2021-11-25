const express = require('express');
const router = express.Router();

const path = require('path');
const alimentacionController = require('../controllers/alimentacion_controller');
const isAuth = require('../util/is-auth');
const albergue = require('../util/albergue');
const juridico = require('../util/juridico');
const psicosocial = require('../util/psicosocial');

router.get('/alimentacion', isAuth, albergue, alimentacionController.getNuevoAlimentacion);

router.post('/alimentacion', isAuth, albergue, alimentacionController.postNuevoAlimentacion);



module.exports = router;


