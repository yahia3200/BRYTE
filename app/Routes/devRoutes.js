const Router = require('express');
const { isDev } = require("../middleware/authmiddleware");

const controller = require("../Controller/devController");

const router = Router();

router.get("/developer/:id", controller.developerInfo);
router.post("/check_new_user_name", controller.checkNewUser);
router.post('/check_new_email', controller.checkEmail);
router.get('/change-password', isDev, (req, res)=>{res.render('ChangePass', {style : "Login"})});
router.post('/change-password', controller.changePassword);
router.get('/change-settings', isDev, controller.developerSettings);
router.post('/change-settings', controller.updateDevSettings);

module.exports = router;