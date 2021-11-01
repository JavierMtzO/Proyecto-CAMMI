const express = require('express');
const router = express.Router();
path = require('path')

const panelController = require('../controllers/panel_controller');

router.get('/panel/inicio', panelController.getPanelInicio);
router.get('/panel/usuarios', panelController.getPanelUsuarios);
router.post('/panel/usuarios', panelController.postPanelUsuarios);

router.get('/panel/usuarios/crear', panelController.getPanelUsuariosCrear);
router.post('/panel/usuarios/crear', panelController.postPanelUsuariosCrear);

router.get('/panel/usuarios/editar', panelController.getPanelUsuariosEditar);
router.post('/panel/usuarios/editar', panelController.postPanelUsuariosEditar);

module.exports = router;