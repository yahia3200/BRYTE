/*Require express module to use for a router*/
const Router = require('express');

/*Require the controller functions for authentication*/
const authController = require('../Controller/authController');
/**
 * creating an instance of a router to apply requests to it
 */
const router = Router();


router.get('/signup', authController.signup_get);

router.post('/signup', authController.signup_post);


/**
 * Exporting the whole instance
 */
module.exports = router;
