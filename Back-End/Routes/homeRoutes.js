/*Require express module to use for a router*/
const Router = require('express');
/*Require the controller functions for authentication*/
const homeController = require('../Controller/homeController');
/**
 * creating an instance of a router to apply requests to it
 */
const router = Router();

//Home Route
router.get('/', homeController.get_homepage);


module.exports = router;
