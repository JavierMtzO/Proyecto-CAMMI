const express = require('express');
const router = express.Router();
path = require('path')

const panelController = require('../controllers/panel_controller');
const isAuth = require('../util/is-auth');
const albergue = require('../util/albergue');
const juridico = require('../util/juridico');
const psicosocial = require('../util/psicosocial');
const admin = require('../util/admin');


router.get('/panel/inicio', isAuth, panelController.getPanelInicio);
router.get('/panel/usuarios', isAuth, admin, panelController.getPanelUsuarios);
router.post('/panel/usuarios', isAuth, admin, panelController.postPanelUsuarios);

router.get('/panel/usuarios/crear', isAuth, admin, panelController.getPanelUsuariosCrear);
router.post('/panel/usuarios/crear', isAuth, admin, panelController.postPanelUsuariosCrear);

router.get('/panel/usuarios/editar', isAuth, admin, panelController.getPanelUsuariosEditar);
router.post('/panel/usuarios/editar', isAuth, admin, panelController.postPanelUsuariosEditar);

router.get('/panel/juridico', isAuth, juridico, panelController.getPanelJuridico);

router.get('/panel/psicosocial', isAuth, psicosocial, panelController.getPanelPsicosocial);

router.get('/panel/albergue', isAuth, albergue, panelController.getPanelAlbergue);

module.exports = router;