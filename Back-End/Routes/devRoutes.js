const Router = require('express');

const controller = require("../Controller/devController");

const router = Router();

router.get("/developer/:id", controller.developerInfo);
router.post("/check_new_user_name", controller.checkNewUser);
router.post('/check_new_email', controller.checkEmail);

module.exports = router;