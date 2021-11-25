const express = require('express');
const router = express.Router();
const path = require('path');
const PerfilRefugioController = require('../controllers/perfil_refugio_controller');
const isAuth = require('../util/is-auth');
const albergue = require('../util/albergue');
const juridico = require('../util/juridico');
const psicosocial = require('../util/psicosocial');

router.get('/perfil_refugio', isAuth, juridico, PerfilRefugioController.getNuevoPerfilRefugio);

router.post('/perfil_refugio', isAuth, juridico, PerfilRefugioController.postNuevoPerfilRefugio);



module.exports = router;