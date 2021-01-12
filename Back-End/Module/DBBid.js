// const { for } = require("core-js/fn/symbol");
const { pool } = require("./DBConfig");

const Search_Single_Bid = async (id) => {
  container = {};
  let sql = "Select * from BID where BID_Id = ?;";
  let [rows, fields, sql_error] = await pool.promise().query(sql, [id]);

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

module.exports = {
    Search_Single_Bid
};
