const Router = require('express');

const controller = require("../Controller/devController");

const router = Router();

router.get("/developer/:id", controller.developerInfo);

module.exports = router;