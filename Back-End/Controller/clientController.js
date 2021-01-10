const poolconnection = require('../Module/DBClient');

const signUpPost = (req, res)=>{
    try {
        poolconnection.insertClient(req.body, (sql_res)=>{
            if (sql_res['error'])
            {
                res.send('not inserted');
            }
            else
            {
                res.send(sql_res);
            }
            
        })
    } catch (error) {
        res.send('error');
    }
}

module.exports = {
    signUpPost
}