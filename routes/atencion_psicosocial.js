const express = require('express');
const router = express.Router();
const path = require('path');
const atencion_psicosocialController = require('../controllers/atencion_psicosocial_controller');
//const isAuth = require('../util/is-auth');


router.get('/atencion_psicosocial', /* isAuth,*/atencion_psicosocialController.getNuevoAtencion_psicosocial);

router.post('/atencion_psicosocial',  /*isAuth,*/ atencion_psicosocialController.postNuevoAtencion_psicosocial);



module.exports = router;