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
  
module.exports =
{
    Search_Single_Project
}