
//Require the express module
const express = require('express');

//Import the authRoutes file
const authRoutes = require('./Routes/authRoutes');

//Import Cookies package
const cookieParser = require('cookie-parser');

//import the authentication verification function
const {authVerifier} = require('./middleware/authmiddleware');

//Create an instance of express object
const app = express();

//this is used to read the json file accompanying the req 
//and convert it to a readable javascript object
app.use(express.json());

//Parse the cookie file using express
app.use(cookieParser());

//start listening for requests on the server
app.listen(3000, () => {
    console.log("server is runing at port 3000")
});



// middleware & static files
app.use(express.static('../public'));
app.use(express.urlencoded({ extended: true }));
app.use((req, res, next) => {
    res.locals.path = req.path;
    next();
});



//Routes 
app.get('/Projects_gallery',authVerifier,(req, res) => {res.render('Projects_gallery')});
app.use(authRoutes);



//Cookies
app.get('/set-cookie', (req, res) => {
    res.cookie('newUser',false, { maxAge:1000*10 , httpOnly:true } );
    res.send("You got the cookies !");
})