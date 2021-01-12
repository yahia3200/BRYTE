const { pool } = require('./DBConfig');

const saltRounds = 10;
const bcrypt = require("bcrypt");

const getPortofiloInfo = async (id)=>{
    res = {};

    // Get Developers Info
    let query = "SELECT * FROM developer WHERE DEV_ID = ?";
    let [rows] = await pool.promise().query(query, [id]);
    res['dev'] = Object.assign({}, rows[0]);

    let date = ("0" + res['dev']['DEV_Birth_Date'].getDate()).slice(-2);

    // current month
    let month = ("0" + (res['dev']['DEV_Birth_Date'].getMonth() + 1)).slice(-2);

    // current year
    let year = res['dev']['DEV_Birth_Date'].getFullYear();

    let Date = year + "-" + month + "-" + date;

    res['dev']['DEV_Birth_Date'] = Date

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

    // change format of date
    experince.forEach(exp => {
        exp['DEV_WOR_Start_Date'] = (exp['DEV_WOR_Start_Date'].getDate()-1).toString()+ "/" + (exp['DEV_WOR_Start_Date'].getMonth()+1).toString() + "/" + (exp['DEV_WOR_Start_Date'].getFullYear()).toString();
        exp['DEV_WOR_End_Date'] = (exp['DEV_WOR_End_Date'].getDate()-1).toString()+ "/" + (exp['DEV_WOR_End_Date'].getMonth()+1).toString() + "/" + (exp['DEV_WOR_End_Date'].getFullYear()).toString();
    });

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

    return res;

}

const isUsedUserName = async(userName)=>{
    const query = "SELECT * FROM DEVELOPER WHERE DEV_User_Name = ?";
    const [res] = await pool.promise().query(query, [userName]);

    if (res.length > 0)
    {
        return true;
    }

    else
        return false;
}

const isUsedEmail = async(email)=>{
    const query = "SELECT * FROM DEVELOPER WHERE DEV_Email = ?";
    const [res] = await pool.promise().query(query, [email]);

    if (res.length > 0)
    {
        return true;
    }

    else
        return false;
}

const changeDevPass = async(user, oldPass, newPass)=>{
    const query1 = "Select DEV_Hash from developer where DEV_User_Name = ? "
    const res1 = await pool.promise().query(query1, [user]);
    if (res1[0].length > 0)
    {
        const match = await bcrypt.compare(oldPass, res1[0][0].DEV_Hash);
        if (match)
        {
            try {

                const salt = await bcrypt.genSalt(saltRounds);
                const Hash = await bcrypt.hash(newPass, salt);

                const query2 = "update developer set DEV_Hash = ? where DEV_User_Name = ?";
                const res2 = await pool.promise().query(query2, [Hash,user]);
                return true;
                
            } 
            catch (error) {
                console.log(error);
                return false;
            }

        }

        else
            return false;
        
    }

    else
        return false;
}

const updatDevInfo = async( userName, fname, lname, phone, address, birthdate, description, logo, coverPicture)=>{
    const query = `update 
    developer 
  set 
    DEV_Fname = ?,
    DEV_Lname = ?,
    DEV_Profile_Picture = ?,
    DEV_Cover = ?,
    DEV_Phone = ?,
    DEV_Birth_Date = ?,
    DEV_Address = ?,
    DEV_About = ?
  where 
    DEV_User_Name = ?`

    try {
        const res = await pool.promise().query(query, [fname, lname, logo, coverPicture, phone, 
            birthdate, address, description, userName]);
            return true;

    } catch (error) {
        console.log(error);
        return false;
    }
}

const addWork = async(id, working)=>{

    const query = `insert into 
    bryte.dev_working_experince (
      DEV_WOR_Title, 
      DEV_WOR_Descreption, 
      DEV_WOR_Start_Date, 
      DEV_WOR_End_Date, 
      DEV_WOR_Developer_Id, 
      DEV_WOR_Place
    )
  values
    (
      ?, 
      ?, 
      ?, 
      ?, 
      ?, 
      ?
    );`

    try {
        
        for (let index = 0; index < working.length; index++) {
        
            const res = pool.promise().query(query, [working[index]['role'] , working[index]['desc'], 
            working[index]['start'], working[index]['end'], id, working[index]['company']]);
    
            
        }
    
        return true;

    } catch (error) {
        console.log(error);
        return false;
        
    }
}

const addCats = async(id, category)=>{
    const query = `insert into 
    bryte.dev_category (
      DEV_CAT_Field, 
      DEV_CAT_Skill, 
      CAT_Developer_Id, 
      DEV_CAT_Verified
    )
  values
    (
      ?, 
      ?, 
      ?, 
      false
    );`

    try {
        for (let i = 0; i < category.length; i++) {
            const res = pool.promise().query(query, [category[i]['field'] , category[i]['skill'], id]);    
            
        }
        
    } catch (error) {
        console.log(error)
        return false;
    }

    return true;
}

const addDegrees = (id, degrees)=>{
    const query = `insert into 
    bryte.dev_degree (
      DEV_DEG_Field, 
      DEV_DEG_Faculty, 
      DEV_DEG_University, 
      DEV_DEG_Developer_Id, 
      DEV_DEG_Start_Date, 
      DEV_DEG_End_Date, 
      DEV_DEG_Title
    )
  values
    (
      ?, 
      ?, 
      ?, 
      ?, 
      ?, 
      ?, 
      ?
    );`

    try {
        for (let i = 0; i < degrees.length; i++) {
            const res = pool.promise().query(query, [ degrees[i]['field'], degrees[i]['faculty'],
            degrees[i]['university'], id, degrees[i]['start'], degrees[i]['end'], degrees[i]['degreeType']]);    
            
        }
        
    } catch (error) {
        console.log(error)
        return false;
    }

    return true
}

const addlinks = async(id , links)=>{
    const query = `insert into 
    bryte.dev_links (
      DEV_LIN_Name, 
      DEV_LIN_Link, 
      DEV_LIN_Developer_Id
    )
  values
    (
      ?, 
      ?, 
      ?
    );`

    try {
        for (let i = 0; i < links.length; i++) {
            const res = pool.promise().query(query, [ links[i]['name'], links[i]['link'], id ]);    
            
        }
        
    } catch (error) {
        console.log(error)
        return false;
    }

    return true

}

module.exports =
{
    getPortofiloInfo,
    isUsedUserName,
    isUsedEmail,
    changeDevPass,
    updatDevInfo,
    addWork,
    addCats,
    addDegrees,
    addlinks
}