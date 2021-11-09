const express = require('express');
const router = express.Router();
const path = require('path');
const delitoController = require('../controllers/delito_controller');
//const isAuth = require('../util/is-auth');


router.get('/delito', /* isAuth,*/delitoController.getNuevoDelito);

//router.post('/delito',  /*isAuth,*/ delitoController.postNuevoDelito);



module.exports = router;