const express = require('express');
const router = express.Router();
const path = require('path');
const migranteController = require('../controllers/migrante_controller');
const isAuth = require('../util/is-auth');

router.get('/migrante', isAuth, migranteController.getMigrantes);
router.post('/migrante', isAuth, migranteController.postMigrantes);

router.get('/migrante/agregar', isAuth, migranteController.getNuevoMigrante);

router.post('/migrante/agregar', isAuth, migranteController.postNuevoMigrante);

router.get('/migrante/ver', isAuth, migranteController.getVerMigrante);

router.get('/migrante/apoyos', isAuth, migranteController.getApoyosAMigrantes);

router.get('/migrante/editar', isAuth, migranteController.getEditarMigrante);
router.post('/migrante/editar', isAuth, migranteController.postEditarMigrante);


module.exports = router;