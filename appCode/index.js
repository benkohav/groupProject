const express = require('express');
const app = express();
const pgp = require('pg-promise')();
const bodyParser = require('body-parser');
const session = require('express-session');
const bcrypt = require('bcrypt');
const axios = require('axios');
const { response } = require('express');

app.set('view engine', 'ejs');

app.use(bodyParser.json());

// database configuration
const dbConfig = {
    host: 'db',
    port: 5432,
    database: process.env.POSTGRES_DB,
    user: process.env.POSTGRES_USER,
    password: process.env.POSTGRES_PASSWORD,
  };

  const user = {
    username: undefined,
    password: undefined,
    item: undefined,
    timeRent: undefined,
    timeReturn: undefined,
  };
  
  const db = pgp(dbConfig);
  
  // test your database
  db.connect()
    .then(obj => {
      console.log('Database connection successful'); // you can view this message in the docker compose logs
      obj.done(); // success, release the connection;
    })
    .catch(error => {
      console.log('ERROR:', error.message || error);
    });

    app.use(
        session({
          secret: process.env.SESSION_SECRET,
          saveUninitialized: false,
          resave: false,
        })
      );
      
      app.use(
        bodyParser.urlencoded({
          extended: true,
        })
      );

    //Rendering login
    app.get('/', (req, res) =>{
      res.redirect('/login'); //this will call the /anotherRoute route in the API
    });

    //Rendering register
    app.get('/register', (req, res) => {
        res.render('pages/register'); //{<JSON data required to render the page, if applicable>}
      });

    //Rendering register
    app.get('/profile', (req, res) => {
      res.render('pages/profile'); //{<JSON data required to render the page, if applicable>}
    });

    //Rendering home
    app.get('/home', (req, res) => {
      res.render('pages/home'); //{<JSON data required to render the page, if applicable>}
    });

    //Rendering help page
    app.get('/help', (req, res) => {
      res.render('pages/help'); //{<JSON data required to render the page, if applicable>}
    });

    //Rendering checkout
    app.get('/checkout', (req, res) => {
      res.render('pages/checkout'); //{<JSON data required to render the page, if applicable>}
    });

    //Register logic 
    app.post('/register', async (req, res) => {
        const hash = await bcrypt.hash(req.body.password, 10);
        var query = "INSERT INTO users (username, password, firstName, lastName, email, schoolYear) values ($1, $2, $3, $4, $5, $6);";

        db.any(query, [ 
        req.body.username,
        hash,
        req.body.firstName,
        req.body.lastName,
        req.body.email,
        req.body.schoolYear
      ])
        .then(function (data) {
            res.redirect('/login');
        })
        .catch(function (err) {
          res.render('pages/register',{message: 'Error. Please try registering again.'} );
        })

      });

    //Render of Login from pages 
    app.get('/login', (req, res) => {
        res.render('pages/login'); //{<JSON data required to render the page, if applicable>}
      });

    
    //Login logic
    app.post('/login', async (req, res) => {
        //the logic goes here
        // const match = await bcrypt.compare(req.body.password, user.password); //await is explained in #8

        var query = "SELECT password FROM users WHERE username = $1 LIMIT 1;"

        db.any(query, [ 
        req.body.username
      ])
        .then(async function (user) {
            // res.redirect('/login');
            const match = await bcrypt.compare(req.body.password, user[0].password);

            if(match)
            {
                req.session.user = {
                    api_key: process.env.API_KEY,
                  };
                  req.session.save();
                res.redirect('/home');
            }
            else{
              //{message: 'Password incorrect. Please try again.'}
              res.render('pages/login',{message: 'Password incorrect. Please try again.'} );
              

            }

        })
        .catch(function (err) {
          //{message: 'This username does not exist. Please register.'}
            // res.redirect('/register');
            res.render('pages/register',{message: 'This username does not exist. Please register.'} );
        })

      });

    //Rendering home again when you checkout 

    app.get("/logout", (req, res) => {
      req.session.destroy();
      res.render("pages/login", {message: 'Logged out Successfully'});
    });



      app.listen(3000);
console.log('Server is listening on port 3000');






     // Authentication Middleware.
    // const auth = (req, res, next) => {
    //     if (!req.session.user) {
    //     // Default to register page.
    //     return res.redirect('/register');
    //     }
    //     next();
    // };
    
    // Authentication Required
    // app.use(auth);


    // app.get('/discover', (req, res) => {
    //     axios({
    //         url: `https://app.ticketmaster.com/discovery/v2/events.json`,
    //             method: 'GET',
    //             dataType:'json',
    //             params: {
    //                 "apikey": req.session.user.api_key,
    //                 "keyword": "Coldplay", //you can choose any artist/event here
    //                 "size": 11,
    //             }
    //         })
    //         .then(results => {
    //             console.log(results.data); // the results will be displayed on the terminal if the docker containers are running
    //          // Send some parameters
    //          res.render('pages/discover', {results: results.data});
    //          //print out/present the results etc
    //         })
    //         .catch(error => {
    //         // Handle errors
    //         res.render('pages/discover', {results: []});
    //         })
    //   });