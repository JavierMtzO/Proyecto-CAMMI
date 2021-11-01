const express = require('express');
const router = express.Router();
const path = require('path');
const comunicacionController = require('../controllers/comunicacion_controller');
//const isAuth = require('../util/is-auth');


router.get('/comunicacion', /* isAuth,*/comunicacionController.getNuevoComunicacion);

router.post('/comunicacion',  /*isAuth,*/ comunicacionController.postNuevoComunicacion);



module.exports = router;