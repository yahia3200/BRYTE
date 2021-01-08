const { pool } = require('./DBConfig');

const getPortofiloInfo = async (id)=>{
    res = {};
    let query = "SELECT * FROM developer WHERE DEV_ID = ?";
    const [rows, fields] = await pool.promise().query(query, [id]);
    res['dev'] = Object.assign({}, rows[0]);
    query = "SELECT * "; 
    console.log(res);
    return Object.assign({}, rows[0]);

}

module.exports =
{
    getPortofiloInfo
}