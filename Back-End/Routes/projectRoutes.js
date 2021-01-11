/*Require express module to use for a router*/
const Router = require('express');

/*Require the controller functions for authentication*/
const projectController = require('../Controller/projectController');
/**
 * creating an instance of a router to apply requests to it
 */
const router = Router();


//Single Project Route
router.get('/project/:id',projectController.get_project_by_id)


//Projects Gallery Route
router.get('/gallery',projectController.get_gallery);

router.get('/add-project', (req, res)=>{res.render('AddProject', {style:"AddProject"})});


module.exports = router;
