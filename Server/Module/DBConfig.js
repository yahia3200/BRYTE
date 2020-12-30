const { createPool } = require("mysql2");
const saltRounds = 10;
const bcrypt = require("bcrypt");
const pool = createPool({
  host: 'localhost',
  port: 3306,
  user: 'root',
  password: '14916',
  database: 'BRYTE',
  connectionLimit: 10
});

/**Inserting a new developer in the database */
/*(res,body) are the parameters , callback is the function to be executed when Isertdeveloper finishes*/
/**=>{Here is the Insert_Developer implementation} */
const Insert_Developer = (res, body, callback) => 
{
  /**Reading The JSON data */
  const { Fname, Lname, UserName, Email
    , CreationDate, BirthDate, LastLogin
    , Password, HashToken, Credentials, Age } = body;
  /**The Query to be executed (preventing SQL injection by using ? placeholder as an escape method) */
  const sql = "INSERT INTO developer ( "
    + "  DEV_Fname, "
    + "  DEV_Lname,"
    + "  DEV_User_Name,"
    + "  DEV_Email,"
    + "  DEV_Creation_Date,"
    + "  DEV_Birth_Date,"
    + "  DEV_Last_Login,"
    + "  DEV_Hash,"
    + "  DEV_Hash_Token,"
    + "  DEV_Credentials,"
    + "  DEV_Wallet,"
    + "  DEV_Wining_Count,"
    + "  DEV_Participation_Count,"
    + "  DEV_Pick_Rate,"
    + "  DEV_Bids_Count,"
    + "  DEV_Projects_Count,"
    + "  DEV_Age"
    + " )"
    + " VALUES ("
    + "   ?,"
    + "   ?,"
    + "   ?,"
    + "   ?,"
    + "   ?,"
    + "   ?,"
    + "   ?,"
    + "   ?,"
    + "   ?,"
    + "   ?,"
    + "   0,"
    + "   0,"
    + "   0,"
    + "   0,"
    + "   0,"
    + "   0,"
    + "   ?"
    + " );";
  /**Hashing the password first(there are multiple ways to do this--> refer to bcrypt documentation) */
  bcrypt.genSalt(saltRounds, (salt_err, salt) => {
    /**When the gen salt is finished start this function */
    bcrypt.hash(Password, salt, (hash_err,Hash) => {
    /**When the hash is finished start this function */
      /**!!!!!!!!!!!!Need to handle any errors in the bcrypt hash*/

      /**Execute the insertion Query */
      pool.query(sql,
        [Fname, Lname, UserName, Email
          , CreationDate, BirthDate, LastLogin
          , Hash, HashToken, Credentials, Age
        ]
        , (sql_error,result) => {
          
           /**When the query is executed start this function */
          if (sql_error) {
            /*Here is the return of the callback function that are parameters when Insertdeveloper finishes*/
            return callback(
              -1,
              sql_error.errno,
              sql_error.sqlMessage,
              false
            );
          }
          else {
            /*Here is the return of the callback function that are parameters when Insertdeveloper finishes*/            
            return callback(result.insertId,0, "", true);

          }
        }
      );
    });
  });


}

module.exports =
{
  pool,
  Insert_Developer
}
