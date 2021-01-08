const jwt = require('jsonwebtoken');
const poolconnection = require('../Module/DBConfig');

//This function is called when you need to confirm that the user is authenticated
const authVerifier = (req, res, next) => {
    //This needs to be accompanied with require cookie-parser in the app.js
    const token = req.cookies.jwt;

    // check json web token exists & is verified
    if (token) {
        jwt.verify(token, 'BRYTE Secret', (err, decodedToken) => {
            if (err) {
                console.log(err);
                res.redirect('/login');
            }
            else //the token is verified 
            {
                console.log(decodedToken);
                //next() will make you apple to porceed with the function called this Auth confirmation
                next();
            }
        })

    }
    else //There is no token 
    {
        res.redirect('/login');
    }
}

const getUser = (req, res, next) => {
    const token = req.cookies.jwt;
    if (token) {
        jwt.verify(token, 'BRYTE Secret', async (err, decodedToken) => {
            if (err) {
                res.locals.user = null;
                next();
            } else {
                let user = await poolconnection.getDeveloperById(decodedToken.id);
                res.locals.user = user;
                next();
            }
        });
    } else {
        res.locals.user = null;
        next();
    }

}

module.exports = {
    authVerifier,
    getUser
}; 