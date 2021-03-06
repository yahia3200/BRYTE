const { createPool } = require("mysql2");
const saltRounds = 10;
const bcrypt = require("bcrypt");
const pool = createPool({
  host: process.env.DB_HOST,
  port: process.env.DB_PORT,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWARD,
  database: process.env.MYSQL_DB,
  connectionLimit: 10
});

/**Inserting a new developer in the database */
/*(res,body) are the parameters , callback is the function to be executed when Isertdeveloper finishes*/
/**=>{Here is the Insert_Developer implementation} */
const Insert_Developer = (res, body, callback) => {
  /**Reading The JSON data, Note that it must be with the same names*/
  const  Credentials = "Trial";
  const  {Fname, Lname, UserName, Email, Password,JobTitle, PhoneNumber,BirthDate,Address} = body;
  const  { ProfilePicture, Cover } = body; 

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
    + "  DEV_Phone, DEV_Profile_Picture, DEV_Cover"
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
    + "   ?, ?, ?"
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
          , Hash, Credentials, Age,Address,JobTitle, PhoneNumber, ProfilePicture, Cover
        ]
        , (sql_error, result) => {console.log(sql_error);

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
            return callback(result.insertId, UserName,0, "", true);

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
  const sql = " Select DEV_ID,DEV_Hash,DEV_User_Name from Developer where DEV_Email = ? OR DEV_User_Name = ?";

  //Execute the query
  pool.query(sql, [email, email], (sql_error, result) => {
    //When the query is executed. If there is a row returned, start checking the password.
    //Note: the DEV_Email attribute is unique so there can't be multiple records of it
    if (result.length>0) {
      //We compare the password against the hashed one in the database
      bcrypt.compare(password, result[0].DEV_Hash, (compare_error, compare_result) => {
        //After comparison is finished, we check the result
        if (compare_result) {
        //If it is the same password, return the ID and a success message
          return callback(result[0].DEV_ID, result[0].DEV_User_Name,"Logged In, Welcome back ^_^")
        }
        else //if the password doesn't match, refuse access
          return callback(-1, "Wrong Passward or Email");  
      });
    }
    else //if the email doesn't match, refuse access
      return callback(-1, "Wrong Passward or Email");
  })
}

const getDeveloperById = (id, callback)=>{
  const query = "SELECT DEV_ID, DEV_User_Name FROM DEVELOPER WHERE DEV_ID= ? ";
  pool.query(query, [id], (err, res)=>{
    if (res.length > 0){
      return callback(Object.assign({}, res[0]));
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
  getDeveloperById
}
