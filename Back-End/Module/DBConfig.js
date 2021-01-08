const { createPool } = require("mysql2");
const saltRounds = 10;
const bcrypt = require("bcrypt");
const pool = createPool({
  host: 'localhost',
  port: 3306,
  user: 'root',
  password: '01229767345Yahia',
  database: 'BRYTE',
  connectionLimit: 10
});

/**Inserting a new developer in the database */
/*(res,body) are the parameters , callback is the function to be executed when Isertdeveloper finishes*/
/**=>{Here is the Insert_Developer implementation} */
const Insert_Developer = (res, body, callback) => {
  /**Reading The JSON data, Note that it must be with the same names*/
  const  Credentials = "Trial";
  const  {Fname, Lname, UserName, Email, Password,JobTitle, PhoneNumber,BirthDate,Address} = body;

  const Age =20;
  const LastLogin = BirthDate;
  const CreationDate =BirthDate;
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
    + "  DEV_Credentials,"
    + "  DEV_Wallet,"
    + "  DEV_Wining_Count,"
    + "  DEV_Participation_Count,"
    + "  DEV_Pick_Rate,"
    + "  DEV_Bids_Count,"
    + "  DEV_Projects_Count,"
    + "  DEV_Age,"
    + "  DEV_Address,"
    + "  DEV_Job_Title,"
    + "  DEV_Phone"
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
    + "   0,"
    + "   0,"
    + "   0,"
    + "   0,"
    + "   0,"
    + "   0,"
    + "   ?,"
    + "   ?,"
    + "   ?,"
    + "   ?"
    + " );";
  /**Hashing the password first(there are multiple ways to do this--> refer to bcrypt documentation) */
  bcrypt.genSalt(saltRounds, (salt_err, salt) => {
    /**When the gen salt is finished start this function */
    bcrypt.hash(Password, salt, (hash_err, Hash) => {
      /**When the hash is finished start this function */
      /**!!!!!!!!!!!!Need to handle any errors in the bcrypt hash*/

      /**Execute the insertion Query */
      pool.query(sql,
        [Fname, Lname, UserName, Email
          , CreationDate, BirthDate, LastLogin
          , Hash, Credentials, Age,Address,JobTitle, PhoneNumber
        ]
        , (sql_error, result) => {

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
            return callback(result.insertId, 0, "", true);

          }
        }
      );
    });
  });


}



/**
 * 
 * @param {The Email Entered By the user to login} email 
 * @param {The input value for the password to be compared with the hashed one in the database} password 
 * @param {a callback function that returns the ID of the user if he is logged in, -1 if not } callback 
 * 
 */
const Login_Developer = (email, password, callback) => {
  //Select the Developer with that mail, take only the ID and Password
  const sql = " Select DEV_ID,DEV_Hash from Developer where DEV_Email= ?";

  //Execute the query
  pool.query(sql, [email], (sql_error, result) => {
    //When the query is executed. If there is a row returned, start checking the password.
    //Note: the DEV_Email attribute is unique so there can't be multiple records of it
    if (result) {
      //We compare the password against the hashed one in the database
      bcrypt.compare(password, result[0].DEV_Hash, (compare_error, compare_result) => {
        //After comparison is finished, we check the result
        if (compare_result) {
        //If it is the same password, return the ID and a success message
          return callback(result[0].DEV_ID, "Logged In, Welcome back ^_^")
        }
        else //if the password doesn't match, refuse access
          return callback(-1, "Wrong Passward or Email");  
      });
    }
    else //if the email doesn't match, refuse access
      return callback(-1, "Wrong Passward or Email");
  })
}


const Search_Single_Project = (id, callback)=>{
  const sql = "SELECT * FROM project WHERE PRO_ID = ?";
  pool.query(sql,[id],(sql_error, result)=>{
    if(result.length>0){
      const Is_Error = false;
      const normalObj = Object.assign({}, result[0]);
      return callback(Is_Error,normalObj);
    }
    else{
      const Is_Error = true;
      return callback(Is_Error,result);
    }
  })
}

const getDeveloperById = (id, callback)=>{
  const query = "SELECT DEV_Fname FROM DEVELOPER WHERE DEV_ID= ? ";
  pool.query(query, [id], (err, res)=>{
    if (res.length > 0){
      return callback({UserName :res[0].DEV_Fname});
    }
    else{
      return callback({errpe : "No Developer Found"});
    }
  })
}

module.exports =
{
  pool,
  Insert_Developer,
  Login_Developer,
  getDeveloperById,
  Search_Single_Project

}
