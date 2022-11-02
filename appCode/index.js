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

    //A, Part 4

      app.get('/', (req, res) =>{
        res.redirect('/login'); //this will call the /anotherRoute route in the API
      });


    //A, Part 5

    app.get('/register', (req, res) => {
        res.render('pages/register'); //{<JSON data required to render the page, if applicable>}
      });

    //A, Part 6

    app.post('/register', async (req, res) => {
        //the logic goes here
        const hash = await bcrypt.hash(req.body.password, 10);
        var query = "INSERT INTO users (username,password) values ($1, $2);";

        db.any(query, [ 
        req.body.username,
        hash
      ])
        .then(function (data) {
            res.redirect('/login');
        })
        .catch(function (err) {
            res.redirect('/register');
        })

      });

    //A, Part 7

    app.get('/login', (req, res) => {
        res.render('pages/login'); //{<JSON data required to render the page, if applicable>}
      });

    //A, Part 8

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
                res.redirect('/discover');
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


    app.get('/discover', (req, res) => {
        axios({
            url: `https://app.ticketmaster.com/discovery/v2/events.json`,
                method: 'GET',
                dataType:'json',
                params: {
                    "apikey": req.session.user.api_key,
                    "keyword": "Coldplay", //you can choose any artist/event here
                    "size": 11,
                }
            })
            .then(results => {
                console.log(results.data); // the results will be displayed on the terminal if the docker containers are running
             // Send some parameters
             res.render('pages/discover', {results: results.data});
             //print out/present the results etc
            })
            .catch(error => {
            // Handle errors
            res.render('pages/discover', {results: []});
            })
      });


      app.get("/logout", (req, res) => {
        req.session.destroy();
        res.render("pages/login", {message: 'Logged out Successfully'});
      });



      app.listen(3000);
console.log('Server is listening on port 3000');