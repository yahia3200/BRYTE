const poolconnection = require('../Module/Developer');
const jwt = require('jsonwebtoken');

const developerInfo = async (req, res) => {

    try {
        const id = req.params.id
        const dev = await poolconnection.getPortofiloInfo(id);
        res.render('Portfolio', {style: "Portfolio", devCont : dev});

    } catch (error) {
        res.render('404',{style:"404"});
    }
    
}

const developerSettings = async(req, res)=>{

    try {
        const id = res.locals.id;
        const dev = await poolconnection.getPortofiloInfo(id);
        res.render('AddInfo', {style: "AddInfo", devCont : dev});

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

const changePassword = async(req, res)=>{
    try {
        const token = req.cookies.jwt;
        if (token) {
            jwt.verify(token, 'BRYTE Secret', async (err, decodedToken) => {
                if (err) {
                    return "error";
                }
                else {
                    const {newPass, oldPass} = req.body;
                    user = decodedToken.userName;
                    const res2 = await poolconnection.changeDevPass(user, oldPass, newPass);
                    console.log(res2);
                    res.send(res2);
                }
            });
        }

    } catch (error) {
        res.send("error");
    }
}

const updateDevSettings = async(req, res)=>{

    try {
        const token = req.cookies.jwt;
        if (token) {
            jwt.verify(token, 'BRYTE Secret', async (err, decodedToken) => {
                if (err) {
                    res.send(false);
                }
                else {
        
                    const { fname, lname, phone, address } = req.body;
                    const { birthdate, description, logo, coverPicture } = req.body;
                    userName = decodedToken.userName;
                    id = decodedToken.id;

                    const res1 = await poolconnection.updatDevInfo(userName, fname, lname, phone, address,
                        birthdate, description, logo, coverPicture);

                    const { working } = req.body;
                    const res2 = await poolconnection.addWork(id, working);

                    const { category } = req.body
                    const res3 = await poolconnection.addCats(id, category);

                    const { degrees } = req.body
                    const res4 = await poolconnection.addDegrees(id, degrees);

                    const { links } = req.body
                    const res5 = await poolconnection.addlinks(id, links);
                
                    res.send({ editInfo : res1, addwork : res2, addcat : res3,
                    addDegree : res4, addlink : res5});
                }
            });
        }

    } catch (error) {
        console.log(error)
        res.send(false);
    }

    

}

module.exports = {
    developerInfo,
    checkNewUser,
    checkEmail,
    changePassword,
    developerSettings,
    updateDevSettings
}
