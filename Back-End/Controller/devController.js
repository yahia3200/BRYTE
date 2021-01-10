const poolconnection = require('../Module/Developer');

const developerInfo = async (req, res) => {

    try {
        const id = req.params.id
        const dev = await poolconnection.getPortofiloInfo(id);
        res.render('Portfolio', {style: "Portfolio", devCont : dev});

    } catch (error) {
        res.render('404',{style:"404"});
    }
    
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
    developerInfo,
    checkNewUser,
    checkEmail
}
