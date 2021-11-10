const express = require('express');
const router = express.Router();
path = require('path')

const panelController = require('../controllers/panel_controller');
const isAuth = require('../util/is-auth');


router.get('/panel/inicio', isAuth, panelController.getPanelInicio);
router.get('/panel/usuarios', isAuth, panelController.getPanelUsuarios);
router.post('/panel/usuarios', isAuth, panelController.postPanelUsuarios);

router.get('/panel/usuarios/crear', isAuth, panelController.getPanelUsuariosCrear);
router.post('/panel/usuarios/crear', isAuth, panelController.postPanelUsuariosCrear);

router.get('/panel/usuarios/editar', isAuth, panelController.getPanelUsuariosEditar);
router.post('/panel/usuarios/editar', isAuth, panelController.postPanelUsuariosEditar);

router.get('/panel/juridico', isAuth, panelController.getPanelJuridico);

router.get('/panel/psicosocial', isAuth, panelController.getPanelPsicosocial);

router.get('/panel/albergue', isAuth, panelController.getPanelAlbergue);

module.exports = router;