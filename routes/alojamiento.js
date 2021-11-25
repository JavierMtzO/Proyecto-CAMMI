const express = require('express');
const router = express.Router();
const path = require('path');
const alojamientoController = require('../controllers/alojamiento_controller');
const isAuth = require('../util/is-auth');
const albergue = require('../util/albergue');
const juridico = require('../util/juridico');
const psicosocial = require('../util/psicosocial');


router.get('/alojamiento', isAuth, albergue, alojamientoController.getNuevoAlojamiento);

router.post('/alojamiento', isAuth, albergue, alojamientoController.postNuevoAlojamiento);



module.exports = router;