const poolconnection = require('../Module/DBBid');
const jwt = require('jsonwebtoken');

/**Age of the token in seconds*/
const mymaxAge = 1 * 24 * 60 * 60;


const get_bid_by_id = async function(req, res) {
    try {
        console.log("Entered Get")
        const id = req.params.id
        const BID_Container = await poolconnection.Search_Single_Bid(id);
        res.render('bid',{style: "bid" , bid_container: BID_Container});
    }
    catch (err) {
        console.log(err);
        res.render('404',{style:"404"});
  
    }
}



const addBid = async(req, res)=> {

    const {bidName, startDate, endDate, description, logo ,  bidFirstImg, bidSecondImg, price} = req.body;

    let date_ob = new Date();

    let date = ("0" + date_ob.getDate()).slice(-2);

    // current month
    let month = ("0" + (date_ob.getMonth() + 1)).slice(-2);

    // current year
    let year = date_ob.getFullYear();

    date = year + "-" + month + "-" + date;
    
    let status = "";
    
    const id = await poolconnection.insertBid(bidName, startDate, endDate, description, logo, price);
    if (id == "error")
        {
            status = "error";
            return {status: status , id: id};
    }

    const { media } = req.body;
    const media_res = await poolconnection.insertToMedia(id, media);
    
    const { fields } = req.body;
    const cat_res = await poolconnection.insertIntoCategory(id, fields);
    status = "Done";

    return {status: status , id: id};
}

module.exports = {
    get_bid_by_id,
    addBid
}
