const express = require('express');
const router = express.Router();
const path = require('path');
const programas_integracion_localController = require('../controllers/programas_integracion_local');
//const isAuth = require('../util/is-auth');


router.get('/programas_integracion_local', /* isAuth,*/programas_integracion_localController.getNuevoProgramas_integracion_local);

router.post('/programas_integracion_local',  /*isAuth,*/ programas_integracion_localController.postNuevoProgramas_integracion_local);



module.exports = router;