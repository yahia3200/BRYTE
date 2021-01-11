/*Require express module to use for a router*/
const Router = require('express');
/*Require the controller functions for authentication*/
const bidController = require('../Controller/bidController');
/**
 * creating an instance of a router to apply requests to it
 */
const router = Router();


//Single bid Route
router.get('/bid/:id',bidController.get_bid_by_id)


module.exports = router;
