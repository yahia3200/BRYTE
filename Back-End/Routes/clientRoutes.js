const Router = require('express');

const clientController = require('../Controller/clientController');

const router = Router();

router.post('/client-signup', clientController.signUpPost);

module.exports = router;