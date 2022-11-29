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

    //Rendering profile page
    app.get("/profile", (req, res) => {
      if(!req.session.user)
      {
        res.render('pages/login',{message: 'Error. No user logged in currently.'} );
      }
      var profileQuery = "SELECT * FROM userTable WHERE userTable.userID = $1";
      var itemsCheckedOutQuery = `SELECT ItemID, EXTRACT(day FROM timeDue-NOW()) as day, ABS(EXTRACT(hour FROM timeDue-NOW())) as hour, ABS(EXTRACT(minute FROM timeDue-NOW())) as minute, CategoryName, CategoryDescription, URL
          FROM (SELECT * FROM Item WHERE Item.UserID = $1) AS userItems
          INNER JOIN Category ON userItems.CategoryID = Category.CategoryID;`;
      // console.log('Testing');
      db.any(profileQuery, [
        req.session.user.userid
      ])
      .then(data => 
        {
          // console.log(data);
          username = data[0].username;
          firstName = data[0].firstname;
          lastName = data[0].lastname;
          email = data[0].email;
          schoolYear =  data[0].schoolyear;

          db.any(itemsCheckedOutQuery, [
            req.session.user.userid
          ])
          .then(Items => 
            {
              // console.log(Items);
              res.render("pages/profile", {
                username,
                firstName,
                lastName,
                email,
                schoolYear,
                Items
              });
            })
            .catch((err) => {
              res.render("pages/profile", {
                  Items: [],
                  error: true,
                  message: err.message,
              });
          });
        // res.render("pages/profile", {
        //   username,
        //   firstName,
        //   lastName,
        //   email,
        //   schoolYear,
        // });
      })
      .catch(function (err) {
        res.render('pages/login',{message: 'Error. This user is not found.'} );
      })
    });


// updates the database after fields in profile page have been edited --> updating user variable is needed 
    app.post('/profile/username', async (req, res) => {
      // const hash = await bcrypt.hash(req.body.password, 10);

      var query1 = "UPDATE userTable SET username = $1 WHERE userTable.username = $2;";

      db.any(query1, [ 
      req.body.username,
      // hash,
      // req.body.firstName,
      // req.body.lastName,
      // req.body.email,
      // req.body.schoolYear,

      req.session.user.username,
    ])
      .then(function (data) {
          // console.log(req.body.schoolYear);
          req.session.user.username = req.body.username;
          // res.render('pages/profile',{message: 'Username successfully updated.'} );
          res.redirect('/profile');

      })
      .catch(function (err) {
        res.render('pages/profile',{message: 'Error. Please try updating username again.'} );
      })
    });

    // updates the database after fields in profile page have been edited --> updating user variable is needed 
    app.post('/profile/firstName', async (req, res) => {
      // const hash = await bcrypt.hash(req.body.password, 10);

      var query1 = "UPDATE userTable SET firstName = $1 WHERE userTable.username = $2;";

      db.any(query1, [ 
      req.body.firstName,
      req.session.user.username,
    ])
      .then(function (data) {
          // console.log(req.body.schoolYear);
          // res.render('pages/profile',{message: 'Username successfully updated.'} );
          res.redirect('/profile');

      })
      .catch(function (err) {
        res.render('pages/profile',{message: 'Error. Please try updating first name again.'} );
      })
    });

    // updates the database after fields in profile page have been edited --> updating user variable is needed 
    app.post('/profile/lastName', async (req, res) => {

      var query1 = "UPDATE userTable SET lastName = $1 WHERE userTable.username = $2;";

      db.any(query1, [ 
      req.body.lastName,
      req.session.user.username,
    ])
      .then(function (data) {
          res.redirect('/profile');

      })
      .catch(function (err) {
        res.render('pages/profile',{message: 'Error. Please try updating last name again.'} );
      })
    });

    // updates the database after fields in profile page have been edited --> updating user variable is needed 
    app.post('/profile/email', async (req, res) => {

      var query1 = "UPDATE userTable SET email = $1 WHERE userTable.username = $2;";

      db.any(query1, [ 
      req.body.email,
      req.session.user.username,
    ])
      .then(function (data) {
          res.redirect('/profile');

      })
      .catch(function (err) {
        res.render('pages/profile',{message: 'Error. Please try updating email again.'} );
      })
    });

    // updates the database after fields in profile page have been edited --> updating user variable is needed 
    app.post('/profile/schoolYear', async (req, res) => {

      var query1 = "UPDATE userTable SET schoolYear = $1 WHERE userTable.username = $2;";

      db.any(query1, [ 
      req.body.schoolYear,
      req.session.user.username,
    ])
      .then(function (data) {
          res.redirect('/profile');

      })
      .catch(function (err) {
        res.render('pages/profile',{message: 'Error. Please try updating email again.'} );
      })
    });


    //Rendering home
    app.get('/home', (req, res) => {
      if(!req.session.user)
      {
        res.render('pages/login',{message: 'Error. No user logged in currently.'} );
      }
      const ITEMS = `SELECT COUNT(*) as num, Category.CategoryName, Category.Brand, URL 
      FROM History
      RIGHT OUTER JOIN Item ON History.ItemID = Item.ItemID
      JOIN Category ON Item.CategoryID = Category.CategoryID 
      GROUP By Category.CategoryID, URL
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
      else{
        var query = `SELECT Item.ItemID, CategoryName, CategoryDescription, DurationName, URL, Item.userID
          FROM (SELECT * FROM Cart WHERE userID = $1) AS usercart
          INNER JOIN Item ON usercart.ItemID = Item.ItemID
          INNER JOIN Category ON Item.CategoryID = Category.CategoryID ;`

          db.any(query, [ 
            req.session.user.userid
          ])
          .then(cart => {
            // console.log(cart)
            res.render('pages/cart', {username: req.session.user.username, cart:cart});
            //print out/present the results etc
          })
          .catch(error => {
          // Handle errors
            res.render('pages/cart', {username: req.session.user.username, message:error})
      });
      }
    });
  
    //Rendering search
    app.get('/search', (req, res) => {
      if(!req.session.user)
      {
        res.render('pages/login',{message: 'Error. No user logged in currently.'} );
      }
      else if(!req.query.search){ //if there is no search given...
        // const search = "";
        res.render('pages/search',{query: "", filter: req.query.filter, userid: req.session.user.userid});
      }
      else{
        const search = req.query.search.toLowerCase();;
        var query = `SELECT Item.userID as userid, Item.ItemID, Item.Condition, SubCategory.CategoryName as subcatname, SuperCategory.CategoryName as catname, SuperCategory.CategoryDescription as catdesc, SubCategory.CategoryDescription as subcatdesc, SubCategory.Brand, SubCategory.URL, usercart.userID AS incart, COUNT(*) as uses
        FROM Item 
        INNER JOIN Category SubCategory ON Item.CategoryID = SubCategory.CategoryID 
        LEFT OUTER JOIN Category SuperCategory ON SubCategory.SuperCategoryID = SuperCategory.CategoryID 
        LEFT OUTER JOIN (SELECT * FROM Cart WHERE UserID = $2) AS usercart ON usercart.ItemID = Item.ItemID
        LEFT OUTER JOIN History ON History.ItemID = Item.ItemID
          WHERE (LOWER(SubCategory.Brand) LIKE $1
          OR LOWER(SubCategory.CategoryName) LIKE $1
          OR LOWER(SubCategory.CategoryDescription) LIKE $1
          OR LOWER(SuperCategory.CategoryDescription) LIKE $1
          OR LOWER(SuperCategory.CategoryName) LIKE $1)
        `
        if(req.query.available == "available"){
          console.log("entered available");
          query += `AND Item.userID IS NULL
          `;
        }
        query+= `GROUP BY Item.ItemID, Item.userID, Item.Condition, SubCategory.CategoryName, SuperCategory.CategoryName, SuperCategory.CategoryDescription, SubCategory.CategoryDescription, SubCategory.Brand, SubCategory.URL, usercart.userID`
        query += `;`;
        db.any(query, [ 
          '%' + search + '%',
          req.session.user.userid
        ])
        .then(results => {
            // console.log(results); // the results will be displayed on the terminal if the docker containers are running
          // Send some parameters
          res.render('pages/search', {query: search, results: results, available: req.query.available, userid: req.session.user.userid});
          //print out/present the results etc
        })
        .catch(error => {
        // Handle errors
        res.render('pages/search', {query: search, results: [], message: 'Error'}); //{<JSON data required to render the page, if applicable>}
        });
      };
  });


    //Register logic 
    app.post('/register', async (req, res) => {
        const hash = await bcrypt.hash(req.body.password, 10);
        console.log(hash);
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
                    username: u_name,
                    search: ""
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
      //check if user has overdue items
      var itemcheck = "SELECT EXTRACT(day FROM timeDue-NOW()) as day FROM Item WHERE Item.UserID = $1";
      db.any(itemcheck, [req.session.user.userid])
      .then(async function (times) {
        var overdue = 0;
        times.forEach(function(Item){
          if(Item.day < 0){
            // console.log(Item.day)
            overdue += 1;
          }
        });
        if(overdue > 0){
          res.render('pages/checkout',{message: 'You have ' + overdue + ' overdue items. Please return them or mark as missing and try again'} );
        }
        else{
          var query = `Update Item 
          SET UserID = $1, timeBorrowed = NOW(), timeDue = NOW()+usercart.Duration
          FROM (SELECT * FROM Cart WHERE userID = $1) AS usercart
          WHERE Item.ItemID = usercart.ItemID
          AND Item.userID IS NULL;
          DELETE FROM Cart WHERE userID = $1;`
          db.any(query, [req.session.user.userid])
          .then(async function (user) {
            res.render('pages/checkout',{message: 'Checkout Successful'} );
          })
          .catch(function (err) {
              res.render('pages/checkout',{message: 'Checkout failed'} );
          })
        }
      })
      .catch(function (err) {
          res.render('pages/checkout',{message: 'Checkout failed'} );
      })
// check if items are available
      
    });


    app.post("/cart/add", (req, res) => {
      if(!req.session.user)
      {
        res.render('pages/login',{message: 'Error. No user logged in currently.'} );
      }
      var query = "INSERT INTO Cart (userID, ItemID, Duration, DurationName) VALUES ($1, $2, $3, $3)"
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
        res.render('pages/checkout',{message: 'Added to Cart'} );
        }
      })
      .catch(function (err) {
          res.render('pages/search',{message: 'Not Added'} );
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
          res.render('pages/checkout',{message: 'Item Removed'} );
        }
      })
      .catch(function (err) {
          res.render('pages/search',{message: 'Not Removed'} );
      })
    });

    app.post('/return', async (req, res) => {
      //the logic goes here
      // check if items are available
      var query = `INSERT INTO History (userID, ItemID, timeBorrowed, timeReturned)
      SELECT userID, ItemID, timeBorrowed, NOW() FROM Item WHERE ItemID = $1;
      UPDATE Item SET userID = NULL, timeBorrowed = NULL, timeDue = NULL WHERE ItemID = $1;`
      db.any(query, [req.body.itemid])
      .then(async function (user) {
        res.redirect('/profile');
      })
      .catch(function (err) {
          res.render('pages/checkout',{message: 'Return failed'} );
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
