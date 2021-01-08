const poolconnection = require('../Module/Developer');

const developerInfo = async (req, res) => {

    const id = req.params.id

    const dev = await poolconnection.getPortofiloInfo(id);
    res.send(dev);
}

module.exports = {
    developerInfo
}
