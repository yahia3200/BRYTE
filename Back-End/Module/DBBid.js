// const { for } = require("core-js/fn/symbol");
const { pool } = require("./DBConfig");

const Search_Single_Bid = async (id) => {
  container = {};
  let sql = "Select * from BID where BID_Id = ?;";
  let [rows, fields, sql_error] = await pool.promise().query(sql, [id]);
  
  var start = rows[0].BID_Start_Date;
  var end = rows[0].BID_End_Date;
  var current = new Date();
  if(current < end && current > start)
  {
    rows[0].BID_Status = 'On Going';
    let sql2 = "Update BID set BID_Status = 'On Going' where BID_Id = ? ; ";
    let [rows2, fields2, sql_error2] = await pool.promise().query(sql2, [id]);
  }
  else if (current < start)
  { 
    rows[0].BID_Status = 'For Later';
    let sql2 = "Update BID set BID_Status = 'For Later' where BID_Id = ?; ";
    let [rows2, fields2, sql_error2] = await pool.promise().query(sql2, [id]);

  }
  else if (current > end)
  { 
    rows[0].BID_Status = 'Closed';
    let sql2 = "Update BID set BID_Status = 'Closed' where BID_Id = ? ; ";
    let [rows2, fields2, sql_error2] = await pool.promise().query(sql2, [id]);
  }



  rows[0].BID_Start_Date =  (rows[0].BID_Start_Date.getDate() - 1).toString() + "/" + (rows[0].BID_Start_Date.getMonth() + 1).toString() + "/" + rows[0].BID_Start_Date.getFullYear().toString();



  rows[0].BID_End_Date = (rows[0].BID_End_Date.getDate() - 1).toString() + "/" + (rows[0].BID_End_Date.getMonth() + 1).toString() +  "/" + rows[0].BID_End_Date.getFullYear().toString();  
  container["BID"] = Object.assign({}, rows[0]);

  
  sql = "Select distinct BID_CAT_Field from BID_CATEGORY where CAT_BID_ID=?;";
  [rows, fields, sql_error] = await pool.promise().query(sql, [id]);
  rows = rows.map((v) => Object.assign({}, v));
  let i = 0;
  for (const row of rows) {
    rows[i].BID_CAT_Field = rows[i].BID_CAT_Field.replace(/_/g, " ");
    i++;
  }
  container["Fields"] = Object.assign({}, rows);

  
  sql = "Select distinct BID_CAT_Skill from BID_CATEGORY where CAT_BID_ID=?;";
  [rows, fields, sql_error] = await pool.promise().query(sql, [id]);
  rows = rows.map((v) => Object.assign({}, v));
  i = 0;
  for (const row of rows) {
    rows[i].BID_CAT_Skill = rows[i].BID_CAT_Skill.replace(/_/g, " ");
    i++;
  }
  container["Skills"] = Object.assign({}, rows);
  
  
  sql = "Select * from BID_ATTACHEMENTS where BID_ATT_ID= ? ;";
  [rows, fields, sql_error] = await pool.promise().query(sql, [id]);
  rows = rows.map((v) => Object.assign({}, v));
  container["media"] = Object.assign({}, rows);

  
  sql = "select DEV.* from developer as DEV , DEVELOPER_APPLY as apply where apply.BID_Id = ? and apply.DEV_Id = DEV.DEV_ID;";
  [rows, fields, sql_error] = await pool.promise().query(sql, [id]);
  rows = rows.map((v) => Object.assign({}, v));
  container["applicants"] = Object.assign({}, rows);
  console.log(container);
  return container;
};




const insertBid = async(BidName, startDate, endDate, description, logo,price) =>{
  const query = `insert into 
  bryte.bid ( 
    BID_Name, 
    BID_Start_Date, 
    BID_End_Date, 
    BID_Description,
    BID_Price,  
    BID_Thumbnail
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

  const [res] = await await pool.promise().query(query, [BidName, startDate, endDate, description,price ,logo]);
  if (res.insertId)
      return res.insertId;
  else
      return "error";

}

const insertToMedia = async(id, media)=>{

  const query = `insert into 
  bryte.bid_attachements (
    BID_ATT_ID, 
    BID_ATT_Link, 
    BID_ATT_Link_Description
  )
values
  (
    ?, 
    ?, 
    ?
  );`

  for (let index = 0; index < media.length; index++) {
      const [result] = await  pool.promise().query(query, [id, media[index]['link'], media[index]['name']]);
      
      if (result.affectedRows < 1){
          return false;
      }
  }

  return true;
}

const insertIntoCategory = async(id, category)=>{
  const query = `insert into 
  bryte.bid_category (
    BID_CAT_Field, 
    BID_CAT_Skill, 
    CAT_BID_Id
  )
values
  (
    ?, 
    ?, 
    ?
  );`

      
  for (let index = 0; index < category.length; index++) {
      
    const [result] = await  pool.promise().query(query, [category[index]['category'], category[index]['skill'], id]);
      
      if (result.affectedRows < 1){
          return false;
      }
  }

  return true;
}



module.exports = {
    Search_Single_Bid,
    insertBid,
    insertToMedia,
    insertIntoCategory
};
