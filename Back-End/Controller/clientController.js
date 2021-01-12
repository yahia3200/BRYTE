const poolconnection = require('../Module/DBClient');
const jwt = require('jsonwebtoken');

/**Age of the token in seconds*/
const mymaxAge = 1 * 24 * 60 * 60;
const createToken = (id, userName, role) => {
    /**ًWhen this is released to production, 'BRYTE Secret should be not uploaded to public' */
    return jwt.sign({ id, userName, role }, 'BRYTE Secret', { expiresIn: mymaxAge });
}

const signUpPost = (req, res)=>{
    try {
        poolconnection.insertClient(req.body, (result)=>{
            if (result['error'])
            {
                res.send({error : "not inserted"});
            }
            else
            {
                const token = createToken(result['id'], result["userName"] , "client");
                res.locals.user = result["userName"];
                res.locals.role = "client";
                res.cookie('jwt', token, { httpOnly: true, maxAge: mymaxAge * 1000 });/*maxAge is in milliseconds , mymaxAge is in seconds*/
                res.status(201).json({ user: result['id'] });
            }
            
        })
    } catch (error) {
        res.send(error);
    }
}

const singInPost = (req, res)=>{
    const { email, password } = req.body;
    
    poolconnection.clientLogin(email, password, (result)=>{
        if (result['error'])
        {
            console.log(result['error']);
            res.status(400).json({error : "error while loging in"});
        }
        else
        {
            const token = createToken(result['id'], result['userName'], 'client');
            res.cookie('jwt', token, { httpOnly: true, maxAge: mymaxAge * 1000 });
            res.status(201).json({ user: result['id']});

        }
    });
}

const checkNewUser = async(req, res)=>{
    try {
        const userName = req.body.UserName;
        const found =  await poolconnection.isUsedUserName(userName);
        res.send({found});
        
    } catch (error) {
        res.send('error');
    }
}

const checkEmail = async (req, res)=>{
    try {
        const email = req.body.Email;
        const found =  await poolconnection.isUsedEmail(email);
        res.send({found});
        
    } catch (error) {
        res.send('error');
    }

}
module.exports = {
    signUpPost,
    singInPost,
    checkNewUser,
    checkEmail
}