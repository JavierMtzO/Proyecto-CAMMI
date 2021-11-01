const express = require('express');
const router = express.Router();
path = require('path')
const userController = require('../controllers/user_controller');

router.get('/login', userController.getLogin);
router.post('/login', userController.postLogin);

router.get('/logout', userController.logout);

module.exports = router;