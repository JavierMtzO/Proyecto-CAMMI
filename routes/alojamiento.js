const express = require('express');
const router = express.Router();
const path = require('path');
const alojamientoController = require('../controllers/alojamiento_controller');
const isAuth = require('../util/is-auth');


router.get('/alojamiento', isAuth, alojamientoController.getNuevoAlojamiento);

router.post('/alojamiento', isAuth, alojamientoController.postNuevoAlojamiento);



module.exports = router;