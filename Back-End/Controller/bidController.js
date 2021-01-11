const poolconnection = require('../Module/DBBid');
const jwt = require('jsonwebtoken');

/**Age of the token in seconds*/
const mymaxAge = 1 * 24 * 60 * 60;


const get_bid_by_id = async function(req, res) {
    try {
        const id = req.params.id
        const BID_Container = await poolconnection.Search_Single_Bid(id);
        res.render('bid',{style: "bid" , bid_container: BID_Container});
    }
    catch (err) {
        console.log(err);
        res.render('404',{style:"404"});
  
    }
}

module.exports = {
    get_bid_by_id
}
