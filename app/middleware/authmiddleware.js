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
                res.locals.id = null;
                res.locals.role = null;
                next();
            }
            else {

                res.locals.user = decodedToken.userName;
                res.locals.id = decodedToken.id;
                res.locals.role = decodedToken.role;
                next();

            }
        });
    } else {
        res.locals.user = null;
        res.locals.id = null;
        res.locals.role = null;
        next();
    }

}

const isDev = async (req, res, next) => {

    const token = req.cookies.jwt;
    if (token) {
        jwt.verify(token, 'BRYTE Secret', async (err, decodedToken) => {
            if (err) {
                res.redirect('/signup')
            }
            else if (decodedToken.role != "dev") {
                res.redirect('/404')
            }

            else
            {
                res.locals.user = decodedToken.userName;
                res.locals.id = decodedToken.id;
                res.locals.role = decodedToken.role;
                next();
            }
                
        });
    } 
    else {

        res.redirect('/signup')
    }
}

const isClient = async (req, res, next) => {

    const token = req.cookies.jwt;
    if (token) {
        jwt.verify(token, 'BRYTE Secret', async (err, decodedToken) => {
            if (err) {
                res.redirect('/signup')
            }

            else if (decodedToken.role != "client") {
                res.redirect('/404')
            }

            else
            {   
                res.locals.user = decodedToken.userName;
                res.locals.id = decodedToken.id;
                res.locals.role = decodedToken.role;
                next();
            }
                
        });
    } 
    else {

        res.redirect('/signup')
    }
}

module.exports = {
    authVerifier,
    getUser,
    isDev,
    isClient
}; 