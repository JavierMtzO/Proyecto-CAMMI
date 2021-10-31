const express = require('express');
const router = express.Router();
const path = require('path');
const migranteController = require('../controllers/migrante_controller');
//const isAuth = require('../util/is-auth');


router.get('/migrante', /* isAuth,*/migranteController.getNuevoMigrante);

router.post('/migrante',  /*isAuth,*/ migranteController.postNuevoMigrante);



module.exports = router;