const Router = require('express');
const { isClient } = require("../middleware/authmiddleware");
const clientController = require('../Controller/clientController');

const router = Router();

router.post('/client-signup', clientController.signUpPost);
router.post('/client-login', clientController.singInPost);
router.post('/client-check_new_user_name', clientController.checkNewUser);
router.post('/client-check_new_email', clientController.checkEmail);
router.get('/client-change-password', isClient, (req, res)=>{res.render('ChangePass', {style : "Login"})});
router.post('/client-change-password', clientController.changePassword);

module.exports = router;