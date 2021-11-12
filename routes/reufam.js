const express = require('express');
const router = express.Router();
const path = require('path');
const ReufamController = require('../controllers/reufam_controller');
const isAuth = require('../util/is-auth');


router.get('/reufam', isAuth, ReufamController.getNuevoReufam);

//router.post('/reufam', isAuth, ReufamController.postNuevoReufam);



module.exports = router;