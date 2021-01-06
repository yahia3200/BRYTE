const jwt = require('jsonwebtoken');


//This function is called when you need to confirm that the user is authenticated
const authVerifier = (req, res,next)=> {
    //This needs to be accompanied with require cookie-parser in the app.js
    const token = req.cookies.jwt;

    // check json web token exists & is verified
    if (token) {
        jwt.verify(token,'BRYTE Secret',(err,decodedToken)=>{
                if (err)
                {
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

module.exports ={
    authVerifier
}; 