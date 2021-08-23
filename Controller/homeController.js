const poolconnection = require('../Module/DBHome');
const jwt = require('jsonwebtoken');

/**Age of the token in seconds*/
const mymaxAge = 1 * 24 * 60 * 60;

const get_homepage = async (req, res) =>{

    const projects =await poolconnection.get_homepage_data(3);
    res.render('home' , {style: "home" , projects: projects});
}
module.exports = {
    get_homepage
}
