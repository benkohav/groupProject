<<<<<<< HEAD
CREATE TABLE userTable (
  userID SERIAL PRIMARY KEY,
  username VARCHAR(45) NOT NULL,
  password CHAR(60) NOT NULL,
  email VARCHAR(45)
=======
-- DROP TABLE userTable
CREATE TABLE userTable (
    userID SERIAL PRIMARY KEY,
    userName varchar(45) NOT NULL,
    password CHAR(60) NOT NULL,
    email varchar(45)
>>>>>>> e67aa68572f3ace0f006b7228c5b9ce47a4e11ac
);
-- INSERT INTO userTable (userID, userName, password, email)
-- VALUES ('0', 'Tom B. Erichsen', 'password', 'email');

<<<<<<< HEAD

=======
-- DROP TABLE IF EXISTS Category ;
>>>>>>> e67aa68572f3ace0f006b7228c5b9ce47a4e11ac
CREATE TABLE Category (
  CategoryID SERIAL PRIMARY KEY,
  CategoryName VARCHAR(45),
  CategoryDescription VARCHAR(200),
  Brand VARCHAR(45)
);
-- INSERT INTO Category (CategoryID, CategoryName, CategoryDescription, Brand)
-- VALUES ('70', 'Laptop', 'description', 'what brand');

<<<<<<< HEAD

=======
-- -- DROP TABLE IF EXISTS Item ;
>>>>>>> e67aa68572f3ace0f006b7228c5b9ce47a4e11ac
CREATE TABLE IF NOT EXISTS Item (
  ItemId SERIAL PRIMARY KEY,
  ItemName VARCHAR(45),
  ItemDescription VARCHAR(200),
  Condition VARCHAR(200),
  CategoryID INT NOT NULL REFERENCES Category (CategoryID),
  userID INT NOT NULL REFERENCES userTable (userID),
<<<<<<< HEAD
  timeBorrowed DATETIME,
  timeReturned DATETIME
);

=======
  rentPerDay DECIMAL(10,2),
  timeBorrowed INT,
  timeReturned INT
);

-- DROP TABLE IF EXISTS Image ;
>>>>>>> e67aa68572f3ace0f006b7228c5b9ce47a4e11ac
CREATE TABLE IF NOT EXISTS Image (
  ImageID SERIAL PRIMARY KEY,
  URL VARCHAR,
  CategoryID INT NOT NULL REFERENCES Category (CategoryID)
);
-- INSERT INTO Image (ImageID, URL, CategoryID)
-- VALUES ('1200', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.science.org%2Fcontent%2Farticle%2Fthese-adorable-puppies-may-help-explain-why-dogs-understand-our-body-language&psig=AOvVaw24OXFHBDcLqoDqDU5bIuIN&ust=1668149428389000&source=images&cd=vfe&ved=0CBAQjhxqFwoTCIjpsIODo_sCFQAAAAAdAAAAABAE', '70');

<<<<<<< HEAD
=======
-- DROP TABLE IF EXISTS History ;
>>>>>>> e67aa68572f3ace0f006b7228c5b9ce47a4e11ac
CREATE TABLE IF NOT EXISTS History (
  userID INT NOT NULL REFERENCES userTable (userID),
  ItemID INT NOT NULL REFERENCES Item (ItemId),
  timeReturned TIME,
  payBy DATE
);

-- INSERT INTO Image (userID, ItemID, timeReturned, payBy, histPK)
-- VALUES ('1', '6000', '20:12:30', '2022-12-011', '16000');