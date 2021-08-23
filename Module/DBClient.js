const { pool } = require('./DBConfig');
const saltRounds = 10;
const bcrypt = require("bcrypt");

const insertClient = (body, callback) => {
    const { name, userName, email, profilePicture } = body;
    const { phone, password, foundedDate, location } = body;

    let date_ob = new Date();

    let date = ("0" + date_ob.getDate()).slice(-2);

    // current month
    let month = ("0" + (date_ob.getMonth() + 1)).slice(-2);

    // current year
    let year = date_ob.getFullYear();

    let currentDate = year + "-" + month + "-" + date;

    //console.log(year + "-" + month + "-" + date);

    const query = "insert into "
        + "bryte.client ("
        + "CLI_Name, "
        + "CLI_User_Name,"
        + "CLI_Email, "
        + "CLI_Profile_Picture,"
        + "CLI_Phone,"
        + "CLI_Creation_Date,"
        + "CLI_Founded_Date,"
        + "CLI_Last_Login,"
        + "CLI_Hash,"
        + "CLI_Location) "
        + " values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?);"

    bcrypt.genSalt(saltRounds, (salt_err, salt) => {

        bcrypt.hash(password, salt, (hash_err, hash) => {
            pool.query(query, [name, userName, email, profilePicture,
                phone, currentDate, foundedDate, currentDate,
                hash, location], (sql_err, sql_res) => {
                    if (sql_err) {
                        console.log(sql_err);
                        return callback({ error: sql_err });
                    }

                    else {
                        return callback({ id: sql_res.insertId , userName});
                    }

                });
        });
    });

}

const clientLogin = (email, password, callback) => {
    const query = "SELECT CLI_User_Name, CLI_ID, CLI_Hash from client where CLI_Email = ? or CLI_User_Name = ?";

    pool.query(query, [email, email], (sql_err, sql_res)=>{
        if (sql_res.length > 0)
        {
            bcrypt.compare(password, sql_res[0].CLI_Hash, (compare_error, compare_res)=>{
                if (compare_res)
                    return callback({userName : sql_res[0].CLI_User_Name, id : sql_res[0].CLI_ID});
                else
                    return callback({error : "wrong password"});
            })
        }
        else
            return callback({error : "wrong email"});

    });
}

const isUsedUserName = async(userName)=>{
    const query = "SELECT * FROM client WHERE CLI_User_Name = ?";
    const [res] = await pool.promise().query(query, [userName]);

    if (res.length > 0)
    {
        return true;
    }

    else
        return false;
}

const isUsedEmail = async(email)=>{
    const query = "SELECT * FROM client WHERE CLI_Email = ?";
    const [res] = await pool.promise().query(query, [email]);

    if (res.length > 0)
    {
        return true;
    }

    else
        return false;
}

const changeClientPass = async(user, oldPass, newPass)=>{
    const query1 = "Select CLI_Hash from client where CLI_User_Name = ? "
    const res1 = await pool.promise().query(query1, [user]);
    if (res1[0].length > 0)
    {
        const match = await bcrypt.compare(oldPass, res1[0][0].CLI_Hash);
        if (match)
        {
            try {

                const salt = await bcrypt.genSalt(saltRounds);
                const Hash = await bcrypt.hash(newPass, salt);

                const query2 = "update client set CLI_Hash = ? where CLI_User_Name = ?";
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

module.exports = {
    insertClient,
    clientLogin,
    isUsedUserName,
    isUsedEmail,
    changeClientPass
}