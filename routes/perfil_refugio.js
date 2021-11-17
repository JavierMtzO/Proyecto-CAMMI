const express = require('express');
const router = express.Router();
const path = require('path');
const PerfilRefugioController = require('../controllers/perfil_refugio_controller');
const isAuth = require('../util/is-auth');


router.get('/perfil_refugio', isAuth, PerfilRefugioController.getNuevoPerfilRefugio);

router.post('/perfil_refugio', isAuth, PerfilRefugioController.postNuevoPerfilRefugio);



module.exports = router;