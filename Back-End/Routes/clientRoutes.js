const Router = require('express');

const clientController = require('../Controller/clientController');

const router = Router();

router.post('/client-signup', clientController.signUpPost);
router.post('/client-login', clientController.singInPost);
router.post('/client-check_new_user_name', clientController.checkNewUser);
router.post('/client-check_new_email', clientController.checkEmail);

module.exports = router;