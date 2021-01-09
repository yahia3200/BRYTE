const { pool } = require('./DBConfig');

const getPortofiloInfo = async (id)=>{
    res = {};

    // Get Developers Info
    let query = "SELECT * FROM developer WHERE DEV_ID = ?";
    let [rows] = await pool.promise().query(query, [id]);
    res['dev'] = Object.assign({}, rows[0]);

    // Get Projects that the developer worked on
    query = "SELECT * FROM developer_works_on WHERE DEV_ID = ?";
    [rows] = await pool.promise().query(query, [id]);
    rows = rows.map(v => Object.assign({}, v));

    // Get Projects Info and Categories
    res['projects'] = [];
    for (let index = 0; index < rows.length; index++) {
        const row = rows[index];
        
         // get project info
         query = "SELECT * FROM PROJECT WHERE PRO_ID = ?";
         let [info] = await pool.promise().query(query, [row['PRO_Id']]);
         info = Object.assign({}, info[0]);
 
         // get project fileds
         query = "SELECT DISTINCT PRO_CAT_Field FROM pro_category WHERE CAT_PRO_ID = ?";
         let [fileds] = await pool.promise().query(query, [row['PRO_Id']]);
         fileds = fileds.map(v => Object.assign({}, v));
         fileds = fileds.map(v => v['PRO_CAT_Field']);
         info['fileds'] = fileds;

         // get project skills
         query = "SELECT DISTINCT PRO_CAT_Skill FROM pro_category WHERE CAT_PRO_ID = ?";
         let [skills] = await pool.promise().query(query, [row['PRO_Id']]);
         skills = skills.map(v => Object.assign({}, v));
         skills = skills.map(v => v['PRO_CAT_Skill']);
         info['skills'] = skills;

         
         // change date format
       
            info['PRO_Start_Date'] = (info['PRO_Start_Date'].getDate()-1).toString()+ "/" + (info['PRO_Start_Date'].getMonth()+1).toString() + "/" + (info['PRO_Start_Date'].getFullYear()).toString();
            info['PRO_End_Date'] = (info['PRO_End_Date'].getDate()-1).toString()+ "/" + (info['PRO_End_Date'].getMonth()+1).toString() + "/" + (info['PRO_End_Date'].getFullYear()).toString();
            info['PRO_Creation'] = (info['PRO_Creation'].getDate()-1).toString()+ "/" + (info['PRO_Creation'].getMonth()+1).toString() + "/" + (info['PRO_Creation'].getFullYear()).toString();
 
         res['projects'].push(info);
    }


    // Get Developers Categories and Skills
    query = "SELECT DISTINCT DEV_CAT_Field FROM dev_category WHERE CAT_Developer_Id = ?";
    let [fileds] = await pool.promise().query(query, [id]);
    fileds = fileds.map(v => Object.assign({}, v));
    fileds = fileds.map(v => v['DEV_CAT_Field']);
    res['fileds'] =  fileds;

    query = "SELECT DISTINCT DEV_CAT_Skill FROM dev_category WHERE CAT_Developer_Id = ?";
    let [skills] = await pool.promise().query(query, [id]);
    skills = skills.map(v => Object.assign({}, v));
    skills = skills.map(v => v['DEV_CAT_Skill']);
    res['skills'] =  skills;
    
    // Get developer experince 
    query = "SELECT * FROM dev_working_experince WHERE DEV_WOR_Developer_Id = ?";
    let [experince] = await pool.promise().query(query, [id]);
    experince = experince.map(v => Object.assign({}, v));
    res['experince'] = experince;

    // Get developer degrees 
    query = "SELECT * FROM dev_degree WHERE DEV_DEG_Developer_Id = ?";
    let [degrees] = await pool.promise().query(query, [id]);
    degrees = degrees.map(v => Object.assign({}, v));

    // cahnge foramt of date
    degrees.forEach(degree => {
        degree['DEV_DEG_Start_Date'] = (degree['DEV_DEG_Start_Date'].getDate()-1).toString()+ "/" + (degree['DEV_DEG_Start_Date'].getMonth()+1).toString() + "/" + (degree['DEV_DEG_Start_Date'].getFullYear()).toString();
        degree['DEV_DEG_End_Date'] = (degree['DEV_DEG_End_Date'].getDate()-1).toString()+ "/" + (degree['DEV_DEG_End_Date'].getMonth()+1).toString() + "/" + (degree['DEV_DEG_End_Date'].getFullYear()).toString();
    });
    res['degrees'] = degrees;

    // Get developer links 
    query = "SELECT * FROM dev_links WHERE DEV_LIN_Developer_Id = ?";
    let [links] = await pool.promise().query(query, [id]);
    links = links.map(v => Object.assign({}, v));
    res['links'] = links;

    console.log(res);
    return res;

}

module.exports =
{
    getPortofiloInfo
}