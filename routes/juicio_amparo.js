const express = require('express');
const router = express.Router();
const path = require('path');
const JuicioAmparoController = require('../controllers/juicio_amparo_controller');
const isAuth = require('../util/is-auth');


router.get('/juicio_amparo', isAuth, JuicioAmparoController.getNuevoJuicioAmparo);

router.post('/juicio_amparo', isAuth, JuicioAmparoController.postNuevoJuicioAmparo);



module.exports = router;