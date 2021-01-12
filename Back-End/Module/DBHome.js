

// const { for } = require("core-js/fn/symbol");
const { pool } = require("./DBConfig");

const get_homepage_data =async (num_of_loads)=>{


        let sql = ` 
        SELECT *
        FROM project
        order by PRO_Rate DESC
        LIMIT ?;`
    let [projects] = await pool.promise().query(sql, [num_of_loads]);
    projects = projects.map(v=> Object.assign({}, v));

    //this is the number of projects
    let i =0;
    for (const project of projects)
    {        

        projects[i].PRO_End_Date = (projects[i].PRO_End_Date.getDate()-1).toString()+ "/" + (projects[i].PRO_End_Date.getMonth()+1).toString() + "/" + (projects[i].PRO_End_Date.getFullYear()).toString();

        sql = "select distinct Cat.* from project as Proj , pro_category as Cat where Proj.PRO_ID = ? and Cat.CAT_PRO_Id = Proj.PRO_ID ; ";
        let [categories] = await pool.promise().query(sql, [project['PRO_ID']]);
        categories = categories.map(v => Object.assign({}, v));
        projects[i]['categories'] = categories;
        
        sql = " select Dev.* from project as Proj , Developer as Dev , developer_works_on as work_on where Proj.PRO_ID = ? and Proj.PRO_ID = work_on.PRO_Id and Dev.DEV_ID = work_on.DEV_Id ;" ;
        let [developers] = await pool.promise().query(sql, [project['PRO_ID']]);
        developers = developers.map(v => Object.assign({}, v));
        projects[i]['developers'] =developers;
        i++;
    }

    return projects;



}

module.exports = {
    get_homepage_data
}