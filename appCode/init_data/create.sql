DROP TABLE IF EXISTS userTable;
CREATE TABLE userTable (
    userID SERIAL PRIMARY KEY,
    userName VARCHAR(45) NOT NULL,
    password CHAR(60) NOT NULL,
    firstName VARCHAR(60),
    lastName VARCHAR(60),
    email VARCHAR(60),
    schoolYear VARCHAR(60)
);

DROP TABLE IF EXISTS Category ;
CREATE TABLE Category (
  CategoryID SERIAL PRIMARY KEY,
  CategoryName VARCHAR(45),
  CategoryDescription VARCHAR(200),
  SuperCategoryID INT REFERENCES Category (CategoryID),
  Brand VARCHAR(45)
);
-- INSERT INTO Category (CategoryID, CategoryName, CategoryDescription, Brand)
-- VALUES ('70', 'Laptop', 'description', 'what brand');

DROP TABLE IF EXISTS Item ;
CREATE TABLE IF NOT EXISTS Item (
  ItemId SERIAL PRIMARY KEY,
  ItemName VARCHAR(45),
  ItemDescription VARCHAR(200),
  Condition VARCHAR(200),
  CategoryID INT NOT NULL REFERENCES Category (CategoryID),
  userID INT REFERENCES userTable (userID),
  rentPerDay DECIMAL(10,2),
  timeBorrowed INT,
  timeReturned INT
);

DROP TABLE IF EXISTS Image ;
CREATE TABLE IF NOT EXISTS Image (
  ImageID SERIAL PRIMARY KEY,
  URL VARCHAR,
  CategoryID INT NOT NULL REFERENCES Category (CategoryID)
);
-- INSERT INTO Image (ImageID, URL, CategoryID)
-- VALUES ('1200', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.science.org%2Fcontent%2Farticle%2Fthese-adorable-puppies-may-help-explain-why-dogs-understand-our-body-language&psig=AOvVaw24OXFHBDcLqoDqDU5bIuIN&ust=1668149428389000&source=images&cd=vfe&ved=0CBAQjhxqFwoTCIjpsIODo_sCFQAAAAAdAAAAABAE', '70');

DROP TABLE IF EXISTS History ;
CREATE TABLE IF NOT EXISTS History (
  userID INT NOT NULL REFERENCES userTable (userID),
  ItemID INT NOT NULL REFERENCES Item (ItemId),
  timeReturned TIME,
  payBy DATE

);

-- INSERT INTO Image (userID, ItemID, timeReturned, payBy, histPK)
-- VALUES ('1', '6000', '20:12:30', '2022-12-011', '16000');










-- DROP TABLE IF EXISTS users CASCADE;
-- CREATE TABLE users(
--   userID INT NOT NULL,
--   username VARCHAR(45) NULL,
--   password CHAR(60) NULL,
--   email VARCHAR(45) NULL,
--   phone VARCHAR(10) NULL,
--   PRIMARY KEY (userID)
-- );
-- 



--  INFO BEGIN
-- CREATE TABLE users(
--   username VARCHAR(50) PRIMARY KEY,   /* the primary key for each entry */
--   password CHAR(60) NOT NULL,
--   item CHAR(60),
--   timeRent CHAR(60),
--   timeReturn CHAR(60)
-- );

-- -- table for the profile page !! --
-- CREATE TABLE profile(
--     user_fname CHAR(50) PRIMARY KEY,
--     user_lname CHAR(50) NOT NULL,
--     username VARCHAR(15),
--     email VARCHAR(60),
--     item CHAR(60)
-- );

-- INFO END

-- CREATE TABLE users(
--   userID PRIMARY KEY,
--   username VARCHAR(45) NOT NULL,
--   password CHAR(60) NOT NULL,
--   email VARCHAR(45),
--   phone INT(10)
-- );

-- DROP TABLE IF EXISTS Category ;
-- CREATE TABLE Category (
--   CategoryID SERIAL PRIMARY KEY,
--   CategoryName VARCHAR(45),
--   CategoryDescription VARCHAR(200),
--   Brand VARCHAR(45)
-- );
-- INSERT INTO Category (CategoryID, CategoryName, CategoryDescription, Brand)
-- VALUES ('70', 'Laptop', 'description', 'what brand');

-- -- DROP TABLE IF EXISTS Item ;
-- CREATE TABLE IF NOT EXISTS Item (
--   ItemId SERIAL PRIMARY KEY,
--   ItemName VARCHAR(45),
--   ItemDescription VARCHAR(200),
--   Condition VARCHAR(200),
--   CategoryID INT NOT NULL REFERENCES Category (CategoryID),
--   userID INT NOT NULL REFERENCES userTable (userID),
--   rentPerDay DECIMAL(10,2),
--   timeBorrowed INT,
--   timeReturned INT
-- );

-- DROP TABLE IF EXISTS Image ;
-- CREATE TABLE IF NOT EXISTS Image (
--   ImageID SERIAL PRIMARY KEY,
--   URL VARCHAR,
--   CategoryID INT NOT NULL REFERENCES Category (CategoryID)
-- );
-- INSERT INTO Image (ImageID, URL, CategoryID)
-- VALUES ('1200', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.science.org%2Fcontent%2Farticle%2Fthese-adorable-puppies-may-help-explain-why-dogs-understand-our-body-language&psig=AOvVaw24OXFHBDcLqoDqDU5bIuIN&ust=1668149428389000&source=images&cd=vfe&ved=0CBAQjhxqFwoTCIjpsIODo_sCFQAAAAAdAAAAABAE', '70');

-- DROP TABLE IF EXISTS History ;
-- CREATE TABLE IF NOT EXISTS History (
--   userID INT NOT NULL REFERENCES userTable (userID),
--   ItemID INT NOT NULL REFERENCES Item (ItemId),
--   timeReturned TIME,
--   payBy DATE
-- );

-- INSERT INTO Image (userID, ItemID, timeReturned, payBy, histPK)
-- VALUES ('1', '6000', '20:12:30', '2022-12-011', '16000');
