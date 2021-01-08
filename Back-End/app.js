
//Require the express module
const express = require('express');

//Import the Routes files
const authRoutes = require('./Routes/authRoutes');
const projectRoutes = require('./Routes/projectRoutes');

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
app.use(express.static('public'));
app.use(express.urlencoded({ extended: true }));
app.use((req, res, next) => {
    res.locals.path = req.path;
    next();
});
app.set('view engine', 'ejs');


//Routes 
//Home Route
app.get('/', (req, res)=>{
    res.render('home')
});

//Authentication verifecation
app.get('/Projects_gallery',authVerifier,(req, res) => {res.render('Projects_gallery')});

app.use(authRoutes);
app.use(projectRoutes);



//Cookies
app.get('/set-cookie', (req, res) => {
    res.cookie('newUser',false, { maxAge:1000*10 , httpOnly:true } );
    res.send("You got the cookies !");
})