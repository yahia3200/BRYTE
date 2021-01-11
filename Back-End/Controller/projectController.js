const poolconnection = require('../Module/DBProject');
const jwt = require('jsonwebtoken');

/**Age of the token in seconds*/
const mymaxAge = 1 * 24 * 60 * 60;


const get_project_by_id = async function(req, res) {
    try {
        const id = req.params.id
        const Project_Container = await poolconnection.Search_Single_Project(id);
        console.log(Project_Container);
        res.render('Project',{style: "Project" , project_container: Project_Container});
    }
    catch (err) {
         console.log(err);
        res.render('404',{style:"404"});
  
    }
}


const get_gallery = async function(req, res) {

     const projects = await poolconnection.Search_all_Projects(0);
     res.render('gallery',{style: "gallery" , projects: projects});     

}

const addProject = async(req, res)=>{
    const {projectName, startDate, endDate, description, logo} = req.body;

    let date_ob = new Date();

    let date = ("0" + date_ob.getDate()).slice(-2);

    // current month
    let month = ("0" + (date_ob.getMonth() + 1)).slice(-2);

    // current year
    let year = date_ob.getFullYear();

    date = year + "-" + month + "-" + date;

    const id = await poolconnection.insertProject(projectName, startDate, endDate, description, logo, date);
    if (id == "error")
        res.send("error");

    const { media } = req.body;
    const media_res = await poolconnection.insertToMedia(id, media);
    const {developers} = req.body;
    const devs_res = await poolconnection.insertToWorksOn(id, developers);

    const { category } = req.body;
    const cat_res = await poolconnection.insertIntoCategory(id, category);

    const { timeline } = req.body;
    const timeline_res = await poolconnection.insertIntoTimeline(id, timeline);
    

    res.send(devs_res);

}


const get_gallery_filtered = async function(req, res) {
    const projects = await poolconnection.Search_all_filtered_Projects(req.body);
    res.send(projects);
}


module.exports = {
    get_project_by_id,
    get_gallery,
    get_gallery_filtered,
    addProject
}
