const express = require('express');
const router = express.Router();
const path = require('path');
const RegularizacionMigratoriaController = require('../controllers/regularizacion_migratoria_controller');
const isAuth = require('../util/is-auth');
const albergue = require('../util/albergue');
const juridico = require('../util/juridico');
const psicosocial = require('../util/psicosocial');

router.get('/regularizacion_migratoria', isAuth, juridico, RegularizacionMigratoriaController.getNuevoRegularizacionMigratoria);

router.post('/regularizacion_migratoria', isAuth, juridico, RegularizacionMigratoriaController.postNuevoRegularizacionMigratoria);



module.exports = router;