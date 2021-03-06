const poolconnection = require('../Module/DBConfig');
const jwt = require('jsonwebtoken');

/**Age of the token in seconds*/
const mymaxAge = 1 * 24 * 60 * 60;
const createToken = (id, userName, role) => {
    /**ًWhen this is released to production, 'BRYTE Secret should be not uploaded to public' */
    return jwt.sign({ id, userName, role }, 'BRYTE Secret', { expiresIn: mymaxAge });
}


const signup_get = function (req, res) {
    res.render('SignUp', {style: "SignUp"});

}

const signup_post = async function (req, res) {
    try {
        poolconnection.Insert_Developer(res, req.body, (id, userName ,sql_errornumber, sql_errorMessage, compleated) => {
            if (compleated) {
                const token = createToken(id, userName, "dev");
                res.locals.user = userName;
                res.locals.role = "Dev";
                res.cookie('jwt', token, { httpOnly: true, maxAge: mymaxAge * 1000 });/*maxAge is in milliseconds , mymaxAge is in seconds*/
                res.status(201).json({ user: id });
            }
            else {
                console.log(sql_errorMessage);
                if (sql_errornumber == 1062 && sql_errorMessage.includes("Email")) {
                    res.status(400).json({errorcause:'email' , message:"Email is already in use"});
                }
                else if (sql_errornumber == 1062 && sql_errorMessage.includes("User_Name")) {
                    res.status(400).json({errorcause:'username', message:"Username is already in use"});
                }
                else
                {
                    res.status(400).json({errorcause:'data', message:"You entered an invalid data"});
                }
            }
        });
    }

    catch (err) {
        console.log(err);
    }

}

const login_get = function (req, res) {
    res.render('LogIn', {style: "Login"});
}

const login_post = async function (req, res) {
    const { email, password } = req.body;
    poolconnection.Login_Developer(email, password, (result, userName,result_message) => {

        if (result > -1) {
            const token = createToken(result, userName, "dev");
            res.cookie('jwt', token, { httpOnly: true, maxAge: mymaxAge * 1000 });/*maxAge is in milliseconds , mymaxAge is in seconds*/
            res.status(200).json({result , userName});
        } else {
            console.log()
            res.status(400).json({result , userName});
        }


    });
}

const logout_get = (req, res) =>{
    //We can't really delete the jwt from the server side but we can override it with the same name and a very short age to be automatically expired
    //Also set the content to an empty string
    res.cookie('jwt', '' , { maxAge: 1});
    res.redirect('/');
}

module.exports = {
    signup_get,
    signup_post,
    login_get,
    login_post,
    logout_get,
}