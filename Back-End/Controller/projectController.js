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
        console.log(err);
        res.render('404',{style:"404"});
  
    }
}


const get_gallery = async function(req, res) {
     const projects = poolconnection.Search_all_Projects(0);
     console.log(projects);
}


module.exports = {
    get_project_by_id,
    get_gallery
}
