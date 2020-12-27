const poolconnection = require('../Module/DBConfig');
const jwt = require('jsonwebtoken');

/**Age of the token in seconds*/
const mymaxAge = 1 * 24 * 60 * 60;
const createToken = (id) => {
    return jwt.sign({ id }, 'BRYTE Secret', { expiresIn:mymaxAge});
}


const signup_get = function (req, res) {
    console.log("Fuck you");
    res.send("Getting the signup page");

}

const signup_post = async function (req, res) {
    try {
        poolconnection.Insert_Developer(res, req.body, (id,sql_errornumber, sql_errorMessage, compleated) => {
            if (compleated) {
                const token = createToken(id);
                res.cookie('jwt', token , {httpOnly:true , maxAge:mymaxAge*1000});
                res.status(201).json({id});
            }
            else {
                console.log(sql_errorMessage);
                if (sql_errornumber == 1062 && sql_errorMessage.includes("Email")) {
                    res.send('Email is already in use');
                }
                else if (sql_errornumber == 1062 && sql_errorMessage.includes("User_Name")) {
                    res.send('User Name is already in use');
                }
            }
        });
    }

    catch (err) {
        console.log(err);
    }

}


module.exports = {
    signup_get,
    signup_post
}