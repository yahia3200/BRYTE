const poolconnection = require('../Module/Developer');

const developerInfo = async (req, res) => {

    try {
        const id = req.params.id
        const dev = await poolconnection.getPortofiloInfo(id);
        console.log(dev);
        res.render('Portfolio', {style: "Portfolio", devCont : dev});

    } catch (error) {
        res.render('404',{style:"404"});
    }
    
}

module.exports = {
    developerInfo
}
