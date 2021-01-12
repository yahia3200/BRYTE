/*Require express module to use for a router*/
const Router = require('express');
/*Require the controller functions for authentication*/
const bidController = require('../Controller/bidController');
/**
 * creating an instance of a router to apply requests to it
 */
const router = Router();


//Single bid Route
router.get('/bid/:id',bidController.get_bid_by_id)

router.get('/addBid',(req,res) => {
    res.render('AddBid',{style:"AddBid"})
})

router.post('/addBid', async (req,res) => {
    const {status , id } = await bidController.addBid(req,res);
    if (status == "Done") {
        
        console.log(id);
        res.redirect('/bid/'+id);
        
    } else {
      res.send("error"); 
    }
});



module.exports = router;
