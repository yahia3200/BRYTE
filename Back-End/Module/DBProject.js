const { pool } = require('./DBConfig');


const Search_Single_Project = async (id)=>{

container = {};
let sql = 'Select * from project where PRO_Id = ?;';
let [rows, fields,sql_error] = await pool.promise().query(sql, [id]);
rows[0].PRO_Start_Date = (rows[0].PRO_Start_Date.getDate()-1).toString()+ "/" + (rows[0].PRO_Start_Date.getMonth()+1).toString() + "/" + (rows[0].PRO_Start_Date.getFullYear()).toString();
rows[0].PRO_End_Date = (rows[0].PRO_End_Date.getDate()-1).toString()+ "/" + (rows[0].PRO_End_Date.getMonth()+1).toString() + "/" + (rows[0].PRO_End_Date.getFullYear()).toString();
rows[0].PRO_Creation = (rows[0].PRO_Creation.getDate()-1).toString()+ "/" + (rows[0].PRO_Creation.getMonth()+1).toString() + "/" + (rows[0].PRO_Creation.getFullYear()).toString();
container['project'] = Object.assign({}, rows[0]);

sql = 'Select distinct PRO_CAT_Field from pro_category where CAT_PRO_Id=1;';
[rows, fields,sql_error] = await pool.promise().query(sql, [id]);
rows = rows.map(v => Object.assign({}, v));
container['Fields'] = Object.assign({}, rows);

sql = 'Select distinct PRO_CAT_Skill from pro_category where CAT_PRO_Id=1;';
[rows, fields,sql_error] = await pool.promise().query(sql, [id]);
rows = rows.map(v => Object.assign({}, v));
container['Skills'] = Object.assign({}, rows);


sql = 'Select * from pro_multimedia where PRO_MUL_ID= ? ;';
[rows, fields,sql_error] = await pool.promise().query(sql, [id]);
rows = rows.map(v => Object.assign({}, v));
container['media']= Object.assign({}, rows);

sql = 'select DEV.* , working.DEV_Role from developer as DEV , developer_works_on as working where working.PRO_ID = ? and working.DEV_ID = DEV.DEV_ID;';
[rows, fields,sql_error] = await pool.promise().query(sql, [id]);
rows = rows.map(v => Object.assign({}, v));
container['devs'] = Object.assign({}, rows);



sql = 'select * from timeline where PRO_TIM_ID = ? order by PRO_TIM_Phase_Start_Date;';
[rows, fields,sql_error] = await pool.promise().query(sql, [id]);
rows = rows.map(v => Object.assign({}, v));
for(phase in rows) {
rows[phase].PRO_TIM_Phase_Start_Date = (rows[phase].PRO_TIM_Phase_Start_Date.getDate()-1).toString()+ "/" + (rows[phase].PRO_TIM_Phase_Start_Date.getMonth()+1).toString() + "/" + (rows[phase].PRO_TIM_Phase_Start_Date.getFullYear()).toString();
rows[phase].PRO_TIM_Phase_End_Date = (rows[phase].PRO_TIM_Phase_End_Date.getDate()-1).toString()+ "/" + (rows[phase].PRO_TIM_Phase_End_Date.getMonth()+1).toString() + "/" + (rows[phase].PRO_TIM_Phase_End_Date.getFullYear()).toString();
}
container['timeline'] = Object.assign({}, rows);



sql = 'select expert.* , review.REV_Rating, review.REV_Description , review.REV_Title, review.REV_Date from expert as expert , expert_review_project as review where review.PRO_ID = ? and review.EXP_ID = expert.EXP_ID;';
[rows, fields,sql_error] = await pool.promise().query(sql, [id]);
rows = rows.map(v => Object.assign({}, v));
for(phase in rows) {
    rows[phase].REV_Date = (rows[phase].REV_Date.getDate()-1).toString()+ "/" + (rows[phase].REV_Date.getMonth()+1).toString() + "/" + (rows[phase].REV_Date.getFullYear()).toString();
}
container['reviews'] = Object.assign({}, rows);



sql = 'select * from BID where BID_Accepted_Participation = ? ;';
[rows, fields,sql_error] = await pool.promise().query(sql, [id]);
if (rows.length>0) {
    container['Is_Bid'] = true;    
}
else {

    container['Is_Bid'] = false;        
}


sql = 'select * from submission where PRO_Id = ? ;';
[rows, fields,sql_error] = await pool.promise().query(sql, [id]);
if (rows.length>0) {
    container['Is_Comp'] = true;    
}
else {

    container['Is_Comp'] = false;        
}

return container;
}

/************************ Searching All projects for the gallery   ****************************************** */

const Search_all_Projects = async(num_of_loads)=>{
    let sql = "select distinct Proj.* from project as Proj where Proj.PRO_ID >= 1+9* ? and Proj.PRO_ID <= 9+9* ? ; ";
    let [projects] = await pool.promise().query(sql, [num_of_loads,num_of_loads]);
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
module.exports =
{
    Search_Single_Project,
    Search_all_Projects
}