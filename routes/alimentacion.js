const express = require('express');
const router = express.Router();

const path = require('path');
const alimentacionController = require('../controllers/alimentacion_controller');
const isAuth = require('../util/is-auth');

router.get('/alimentacion', isAuth, alimentacionController.getNuevoAlimentacion);

router.post('/alimentacion', isAuth, alimentacionController.postNuevoAlimentacion);



module.exports = router;


