require('dotenv').config();

//Require the express module
const express = require('express');

//Import the Routes files
const authRoutes = require('./Routes/authRoutes');
const projectRoutes = require('./Routes/projectRoutes');
const devRoutes = require("./Routes/devRoutes");

//Import Cookies package
const cookieParser = require('cookie-parser');

//import the authentication verification function
const {authVerifier, getUser} = require('./middleware/authmiddleware');

//Create an instance of express object
const app = express();

//this is used to read the json file accompanying the req 
//and convert it to a readable javascript object
app.use(express.json());

//Parse the cookie file using express
app.use(cookieParser());

//start listening for requests on the server
app.listen(process.env.APP_PORT, () => {
    console.log("server is runing at port: ", process.env.APP_PORT);
});



// middleware & static files
app.use(express.static('public'));
app.use(express.urlencoded({ extended: true }));
app.use((req, res, next) => {
    res.locals.path = req.path;
    next();
});
app.set('view engine', 'ejs');


//Routes
app.get('*', getUser);

//Home Route
app.get('/', (req, res)=>{
    res.render('home', {style: "home"})
});
app.get('/bids',(req, res)=>{
    res.render('comingsoon', {style: "comingsoon"});
});

app.get('/gallery',(req, res)=>{
    res.render('comingsoon', {style: "comingsoon"});
});


app.get('/developers',(req, res)=>{
    res.render('comingsoon', {style: "comingsoon"});
});


//Authentication verifecation
//app.get('/Projects_gallery',authVerifier,(req, res) => {res.render('Projects_gallery', {style: "gallery"})});

app.use(authRoutes);
app.use(projectRoutes);

app.use(devRoutes);

app.get('/coming_soon', (req, res)=>{res.render('Comming Soon', {style: "404"})});
app.get('*', (req, res)=>{res.render('404', {style: "404"})});

//Cookies
app.get('/set-cookie', (req, res) => {
    res.cookie('newUser',false, { maxAge:1000*10 , httpOnly:true } );
    res.send("You got the cookies !");
})