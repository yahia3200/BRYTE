const poolconnection = require('../Module/DBConfig');
const jwt = require('jsonwebtoken');

/**Age of the token in seconds*/
const mymaxAge = 1 * 24 * 60 * 60;


const get_project_by_id = function(req, res) {
    try {
        const id = req.params.id
        poolconnection.Search_Single_Project(id,(Is_Error,result)=>{
           if (Is_Error) 
           {
               res.render('LogIn');
           }
           else
            {
                res.render('Project', {project:result})
            } 
        })
    } 
    catch (err) {
        res.render('LogIn');
  
    }
}


module.exports = {
    get_project_by_id
}
