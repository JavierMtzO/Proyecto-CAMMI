const express = require('express');
const router = express.Router();
const path = require('path');
const ReufamController = require('../controllers/reufam_controller');
const isAuth = require('../util/is-auth');
const albergue = require('../util/albergue');
const juridico = require('../util/juridico');
const psicosocial = require('../util/psicosocial');

router.get('/reufam', isAuth, juridico, ReufamController.getNuevoReufam);

router.post('/reufam', isAuth, juridico, ReufamController.postNuevoReufam);



module.exports = router;