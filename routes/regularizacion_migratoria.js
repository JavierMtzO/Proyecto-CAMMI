const express = require('express');
const router = express.Router();
const path = require('path');
const RegularizacionMigratoriaController = require('../controllers/regularizacion_migratoria_controller');
const isAuth = require('../util/is-auth');


router.get('/regularizacion_migratoria', isAuth, RegularizacionMigratoriaController.getNuevoRegularizacionMigratoria);

//router.post('/regularizacion_migratoria', isAuth, RegularizacionMigratoriaController.postNuevoRegularizacionMigratoria);



module.exports = router;