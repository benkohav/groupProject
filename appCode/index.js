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
    userid: undefined,
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


    //Rendering checkout
    app.get("/checkout", (req, res) => {
      if(!req.session.user)
      {
        res.render('pages/login',{message: 'Error. No user logged in currently.'} );
      }
      var profileQuery = "SELECT * FROM userTable WHERE userTable.userID = $1";
      console.log(req.session.user.username);
      console.log('Testing');
      db.any(profileQuery, [
        req.session.user.userid
      ])
      .then(data => 
        {
          // console.log(data.firstname);
          username = data[0].username;
        res.render("pages/checkout", {
          username,
        });
      })
      .catch(function (err) {
        res.render('pages/login',{message: 'Error. No user logged in currently.'} );
      })
    });
    
    //Rendering profile page
    app.get("/profile", (req, res) => {
      if(!req.session.user)
      {
        res.render('pages/login',{message: 'Error. No user logged in currently.'} );
      }
      var profileQuery = "SELECT * FROM userTable WHERE userTable.userID = $1";
      console.log(req.session.user.userid);
      // console.log('Testing');
      db.any(profileQuery, [
        req.session.user.userid
      ])
      .then(data => 
        {
          // console.log(data.firstname);
          username = data[0].username;
          firstName = data[0].firstname;
          lastName = data[0].lastname;
          email = data[0].email;
          schoolYear =  data[0].schoolyear;
        res.render("pages/profile", {
          username,
          firstName,
          lastName,
          email,
          schoolYear,
        });
      })
      .catch(function (err) {
        res.render('pages/login',{message: 'Error. No user logged in currently.'} );
      })
    });

    // updates the database after fields in profile page have been edited --> updating user variable is needed 
    app.post('/profile', async (req, res) => {
      const hash = await bcrypt.hash(req.body.password, 10);

      var query1 = "UPDATE userTable SET username = $1, password = $2, firstName = $3, lastName = $4, email = $5, schoolYear = $6 where username =$7;";

      db.any(query1, [ 
      req.body.username,
      hash,
      req.body.firstName,
      req.body.lastName,
      req.body.email,
      req.body.schoolYear,
      req.session.user.username,
    ])
      .then(function (data) {
          console.log(req.body.schoolYear);
          res.redirect('/profile');
      })
      .catch(function (err) {
        res.render('pages/profile',{message: 'Error. Please try registering again.'} );
      })
    });

    //Rendering home
    app.get('/home', (req, res) => {
      if(!req.session.user)
      {
        res.render('pages/login',{message: 'Error. No user logged in currently.'} );
      }
      const ITEMS = `SELECT COUNT(*) as num, Category.CategoryName, Category.Brand, Image.URL 
      FROM History
      RIGHT OUTER JOIN Item ON History.ItemID = Item.ItemID
      JOIN Category ON Item.CategoryID = Category.CategoryID 
      LEFT OUTER JOIN Image ON Category.CategoryID = Image.CategoryID 
      GROUP By Category.CategoryID, Image.URL
      ORDER BY COUNT(*) DESC LIMIT 5;`;
      db.query(ITEMS)
        .then((Items) => {
          // console.log(Items)
            res.render("pages/home", { Items });
        })
        .catch((err) => {
            res.render("pages/home", {
                Item: [],
                error: true,
                message: err.message,
            });
        });
    });

    //Rendering Cart
    app.get('/cart', (req, res) => {
      if(!req.session.user)
      {
        res.render('pages/login',{message: 'Error. No user logged in currently.'} );
      }
      const ITEMS = 'SELECT Category.CategoryName, Category.Brand, Image.URL, Item.ItemID FROM Item JOIN Category ON Item.CategoryID = Category.CategoryID JOIN Image ON Category.CategoryID = Image.CategoryID Group By Category.CategoryName, Item.ItemDescription, Category.Brand, Image.URL, Item.ItemID ORDER BY COUNT(Item.userID) DESC LIMIT 10;';
      db.query(ITEMS)
        .then((Item) => {
            res.render("pages/cart", { Item });
        })
        .catch((err) => {
            res.render("pages/cart", {
                Item: [],
                error: true,
                message: err.message,
            });
        });
    });

    //Rendering checkout
    app.get('/checkout', (req, res) => {
      if(!req.session.user)
      {
        res.render('pages/login',{message: 'Error. No user logged in currently.'} );
      }
      else{
        var query = `SELECT Item.ItemID, CategoryName, CategoryDescription, Duration, URL
          FROM Cart
          INNER JOIN Item ON Cart.ItemID = Item.ItemID
          INNER JOIN Category ON Item.CategoryID = Category.CategoryID 
            WHERE ItemID IN $1;`

          db.any(query, [ 
            req.body.cart
          ])
          .then(results => {
            res.render('pages/checkout', {results:results});
            //print out/present the results etc
          })
          .catch(error => {
          // Handle errors
            res.render('pages/checkout', {message:error})
      });
      }
    });
    

    //Rendering search
    app.get('/search', (req, res) => {
      const search = "";
      if(!req.session.user)
      {
        res.render('pages/login',{message: 'Error. No user logged in currently.'} );
      }
      else if(!req.query.search){
        // const search = "";
        res.render('pages/search');
      }
      else{
        const search = req.query.search.toLowerCase();
      // console.log(req.query)
      // console.log(search);
      console.log('Searching for ' + search + ' ... ');
          var query = `SELECT Item.userID as userid, Item.ItemID, SubCategory.CategoryName as subcatname, SuperCategory.CategoryName as catname, SuperCategory.CategoryDescription, SubCategory.Brand, URL, usercart.userID AS incart
          FROM Item 
          INNER JOIN Category SubCategory ON Item.CategoryID = SubCategory.CategoryID 
          LEFT OUTER JOIN Category SuperCategory ON SubCategory.SuperCategoryID = SuperCategory.CategoryID 
          LEFT OUTER JOIN Image ON SubCategory.CategoryID = Image.CategoryID
          LEFT OUTER JOIN (SELECT * FROM Cart WHERE UserID = $2) AS usercart ON usercart.ItemID = Item.ItemID
            WHERE SubCategory.Brand LIKE $1
            OR SubCategory.CategoryName LIKE $1
            OR SuperCategory.CategoryName LIKE $1;`
          db.any(query, [ 
            '%' + search + '%',
            req.session.user.userid
          ])

          .then(results => {
              // console.log(results); // the results will be displayed on the terminal if the docker containers are running
            // Send some parameters
            res.render('pages/search', {query: search, results: results});
            //print out/present the results etc
          })
          .catch(error => {
          // Handle errors
      res.render('pages/search', {query: search, results: [], message: 'Error'}); //{<JSON data required to render the page, if applicable>}
      });
    }
  });

    //Register logic 
    app.post('/register', async (req, res) => {
        const hash = await bcrypt.hash(req.body.password, 10);

        var query = "INSERT INTO userTable (username, password, firstName, lastName, email, schoolYear) values ($1, $2, $3, $4, $5, $6);";


    db.any(query, [
        req.body.username,
        hash,
        req.body.firstName,
        req.body.lastName,
        req.body.email,
        req.body.schoolYear
      ])
        .then(function (data) {
            console.log(req.body.schoolYear);
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

    var query = "SELECT password, userID FROM userTable WHERE userName = $1 LIMIT 1;"

    db.any(query, [
        req.body.username
    ])
        .then(async function (user) {
            // res.redirect('/login');
            const match = await bcrypt.compare(req.body.password, user[0].password);
            var u_name = req.body.username;

            if(match)
            {
                req.session.user = {
                    userid: user[0].userid,
                    username: u_name
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
            res.render('pages/register', { message: 'This username does not exist. Please register.' });
        })
      });

    //Rendering home again when you checkout 
    app.post('/checkout', async (req, res) => {
      //the logic goes here
// check if items are available
      var query = "Update Item SET UserID = $1, timeBorrowed = NOW(), timeReturned = DATE_ADD(NOW(),INTERVAL) WHERE ItemID = "
      db.any(query, [req.session.userid
    ])
      .then(async function (user) {
        res.render('pages/home',{message: 'Checkout Successful'} );
      })
      .catch(function (err) {
          res.render('pages/home',{message: 'Checkout failed'} );
      })
    });
    app.post("/cart/add", (req, res) => {
      if(!req.session.user)
      {
        res.render('pages/login',{message: 'Error. No user logged in currently.'} );
      }
      var query = "INSERT INTO Cart (userID, ItemID, Duration) VALUES ($1, $2, $3)"
      db.any(query, [
      req.session.user.userid,
      req.body.itemid,
      req.body.duration
    ])
      .then(async function (user) {
        if(req.body.returnto){
          res.redirect(req.body.returnto)
        }
        else{
        res.render('pages/search',{message: 'Added to Cart'} );
        }
      })
      .catch(function (err) {
          res.render('pages/home',{message: 'Not Added'} );
      })
    });
    
    app.post("/cart/delete", (req, res) => {
      if(!req.session.user)
      {
        res.render('pages/login',{message: 'Error. No user logged in currently.'} );
      }
      var query = "DELETE FROM Cart WHERE userID = $1 and ItemID = $2"
      db.any(query, [
      req.session.user.userid,
      req.body.itemid
    ])
      .then(async function (user) {
        if(req.body.returnto){
          res.redirect(req.body.returnto)
        }
        else{
          res.render('pages/search',{message: 'Removed'} );
        }
      })
      .catch(function (err) {
          res.render('pages/home',{message: 'Not Added'} );
      })
    });
    app.post('/return', async (req, res) => {
      //the logic goes here
      // check if items are available
      var query = ""
      req.body.items.forEach(function(item){
        query += "Update Item SET UserID = $1, timeBorrowed = CURDATE(), timeReturned = DATE_ADD(CURDATE(),INTERVAL " + item.length + " DAY) WHERE ItemID = " + item.itemid;
      });
      db.any(query, [req.session.userid
    ])
      .then(async function (user) {
        res.render('pages/home',{message: 'Checkout Successful'} );
      })
      .catch(function (err) {
          res.render('pages/home',{message: 'Checkout failed'} );
      })
    });
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

