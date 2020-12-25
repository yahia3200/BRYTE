const { createPool } = require("mysql2");

const pool = createPool({
  host: 'localhost',
  port: 3306,
  user: 'root',
  password: '01229767345Yahia',
  database: 'BRYTE',
  connectionLimit: 10
});

module.exports = pool;