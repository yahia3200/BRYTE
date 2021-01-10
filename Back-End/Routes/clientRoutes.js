const Router = require('express');

const clientController = require('../Controller/clientController');

const router = Router();

router.post('/client-signup', clientController.signUpPost);
router.post('/client-login', clientController.singInPost);

module.exports = router;