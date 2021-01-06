const poolconnection = require('../Module/DBConfig');
const jwt = require('jsonwebtoken');

/**Age of the token in seconds*/
const mymaxAge = 1 * 24 * 60 * 60;
const createToken = (id) => {
    /**ًWhen this is released to production, 'BRYTE Secret should be not uploaded to public' */
    return jwt.sign({ id }, 'BRYTE Secret', { expiresIn: mymaxAge });
}


const signup_get = function (req, res) {
    console.log("Fuck you");
    res.send("Getting the signup page");

}

const signup_post = async function (req, res) {
    try {
        poolconnection.Insert_Developer(res, req.body, (id, sql_errornumber, sql_errorMessage, compleated) => {
            if (compleated) {
                const token = createToken(id);
                res.cookie('jwt', token, { httpOnly: true, maxAge: mymaxAge * 1000 });/*maxAge is in milliseconds , mymaxAge is in seconds*/
                res.status(201).json({ user: id });
            }
            else {
                console.log(sql_errorMessage);
                if (sql_errornumber == 1062 && sql_errorMessage.includes("Email")) {
                    res.send('Email is already in use');
                }
                else if (sql_errornumber == 1062 && sql_errorMessage.includes("User_Name")) {
                    res.send('User Name is already in use');
                }
                else
                {
                    res.send('Invalid Data')
                }
            }
        });
    }

    catch (err) {
        console.log(err);
    }

}

const login_get = function (req, res) {


}

const login_post = async function (req, res) {
    const { email, password } = req.body;
    poolconnection.Login_Developer(email, password, (result, result_message) => {

        if (result > -1) {
            const token = createToken(result);
            res.cookie('jwt', token, { httpOnly: true, maxAge: mymaxAge * 1000 });/*maxAge is in milliseconds , mymaxAge is in seconds*/
            res.status(200).json({result , result_message});
        } else {
            res.status(400).json({result , result_message});
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