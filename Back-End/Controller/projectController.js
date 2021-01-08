const poolconnection = require('../Module/DBProject');
const jwt = require('jsonwebtoken');

/**Age of the token in seconds*/
const mymaxAge = 1 * 24 * 60 * 60;


const get_project_by_id = async function(req, res) {
    try {
        const id = req.params.id
        const Project_Container = await poolconnection.Search_Single_Project(id);
        res.render('Project',{style: "Project" , project_container: Project_Container});
    }
    catch (err) {
        res.render('LogIn');
  
    }
}


module.exports = {
    get_project_by_id
}
