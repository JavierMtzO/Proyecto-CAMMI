const express = require('express');
const router = express.Router();
const path = require('path');
const asistencia_socialController = require('../controllers/asistencia_social_controller');
const isAuth = require('../util/is-auth');
const albergue = require('../util/albergue');
const juridico = require('../util/juridico');
const psicosocial = require('../util/psicosocial');

router.get('/asistencia_social', isAuth, psicosocial, asistencia_socialController.getNuevoAsistencia_social);

router.post('/asistencia_social', isAuth, psicosocial, asistencia_socialController.postNuevoAsistencia_social);



module.exports = router;