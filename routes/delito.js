const express = require('express');
const router = express.Router();
const path = require('path');
const delitoController = require('../controllers/delito_controller');
const isAuth = require('../util/is-auth');
const albergue = require('../util/albergue');
const juridico = require('../util/juridico');
const psicosocial = require('../util/psicosocial');


router.get('/delito', isAuth, juridico, delitoController.getNuevoDelito);

router.post('/delito', isAuth, juridico, delitoController.postNuevoDelito);



module.exports = router;