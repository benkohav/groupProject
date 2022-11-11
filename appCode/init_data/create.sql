<<<<<<< HEAD
<<<<<<< HEAD
-- DROP TABLE userTable
CREATE TABLE userTable (
    userID SERIAL PRIMARY KEY,
    userName varchar(45) NOT NULL,
    password CHAR(60) NOT NULL,
    email varchar(45)
=======
-- DROP TABLE IF EXISTS users CASCADE;
-- CREATE TABLE users(
--   userID INT NOT NULL,
--   username VARCHAR(45) NULL,
--   password CHAR(60) NULL,
--   email VARCHAR(45) NULL,
--   phone VARCHAR(10) NULL,
--   PRIMARY KEY (userID)
-- );
=======

-- -----------------------------------------------------
-- Table 'mydb'.'customerDimension'
-- -----------------------------------------------------
DROP TABLE IF EXISTS 'mydb'.'customerDimension' ;

CREATE TABLE IF NOT EXISTS 'mydb'.'customerDimension' (
  'customer_ID' INT NOT NULL,
  'username' VARCHAR(45) NOT NULL,
  'email' VARCHAR(45) NULL,
  PRIMARY KEY ('customer_ID'))


-- -----------------------------------------------------
-- Table 'mydb'.'dateDimension'
-- -----------------------------------------------------
DROP TABLE IF EXISTS 'mydb'.'dateDimension' ;

CREATE TABLE IF NOT EXISTS 'mydb'.'dateDimension' (
  'time_ID' INT NOT NULL,
  'date' DATE NULL,
  'day' INT NULL,
  'month' INT NULL,
  'year' INT NULL,
  PRIMARY KEY ('time_ID'))


-- -----------------------------------------------------
-- Table 'mydb'.'imageOfCategory'
-- -----------------------------------------------------
DROP TABLE IF EXISTS 'mydb'.'imageOfCategory' ;

CREATE TABLE IF NOT EXISTS 'mydb'.'imageOfCategory' (
  'type_ID' INT NOT NULL,
  'imageURL' VARCHAR(45) NULL,
  PRIMARY KEY ('type_ID'))


-- -----------------------------------------------------
-- Table 'mydb'.'categoryDimension'
-- -----------------------------------------------------
DROP TABLE IF EXISTS 'mydb'.'categoryDimension' ;

CREATE TABLE IF NOT EXISTS 'mydb'.'categoryDimension' (
  'category_ID' INT NOT NULL,
  'type_ID' INT NOT NULL,
  PRIMARY KEY ('category_ID'),
  INDEX 'fk_categoryDimension_imageOfCategory1_idx' ('type_ID' ASC) VISIBLE,
  CONSTRAINT 'fk_categoryDimension_imageOfCategory1'
    FOREIGN KEY ('type_ID')
    REFERENCES 'mydb'.'imageOfCategory' ('type_ID')
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)


-- -----------------------------------------------------
-- Table 'mydb'.'productDimension'
-- -----------------------------------------------------
DROP TABLE IF EXISTS 'mydb'.'productDimension' ;

CREATE TABLE IF NOT EXISTS 'mydb'.'productDimension' (
  'product_ID' INT NOT NULL,
  'quantity' INT NULL,
  'unit_price' DECIMAL(10,2) NULL,
  'description' VARCHAR(90) NULL,
  PRIMARY KEY ('product_ID'))


-- -----------------------------------------------------
-- Table 'mydb'.'Fact Table'
-- -----------------------------------------------------
DROP TABLE IF EXISTS 'mydb'.'Fact Table' ;

CREATE TABLE IF NOT EXISTS 'mydb'.'Fact Table' (
  'Transaction_ID' INT NOT NULL,
  'customer_ID' INT NOT NULL,
  'product_ID' INT NOT NULL,
  'time_ID' INT NOT NULL,
  'product_ID' INT NOT NULL,
  'order_ID' INT NOT NULL,
  'totalPrice' DECIMAL(10,2) NULL,
  'timeRented' INT NULL,
  PRIMARY KEY ('Transaction_ID'),
  INDEX 'fk_Fact Table_customerDimension_idx' ('customer_ID' ASC) VISIBLE,
  INDEX 'fk_Fact Table_dateDimension1_idx' ('product_ID' ASC) VISIBLE,
  INDEX 'fk_Fact Table_categoryDimension1_idx' ('time_ID' ASC) VISIBLE,
  INDEX 'fk_Fact Table_productDimension1_idx' ('product_ID' ASC) VISIBLE,
  CONSTRAINT 'fk_Fact Table_customerDimension'
    FOREIGN KEY ('customer_ID')
    REFERENCES 'mydb'.'customerDimension' ('customer_ID')
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT 'fk_Fact Table_dateDimension1'
    FOREIGN KEY ('product_ID')
    REFERENCES 'mydb'.'dateDimension' ('time_ID')
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT 'fk_Fact Table_categoryDimension1'
    FOREIGN KEY ('time_ID')
    REFERENCES 'mydb'.'categoryDimension' ('category_ID')
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT 'fk_Fact Table_productDimension1'
    FOREIGN KEY ('product_ID')
    REFERENCES 'mydb'.'productDimension' ('product_ID')
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)


-- SET SQL_MODE=@OLD_SQL_MODE;
-- SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
-- SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
=======
DROP TABLE IF EXISTS User ;
CREATE TABLE IF NOT EXISTS User (
  userID SERIAL PRIMARY KEY,
  username VARCHAR(45) NOT NULL,
  password CHAR(60) NOT NULL,
  email VARCHAR(45),
  phone BIGINT(10)
);
>>>>>>> main

CREATE TABLE users(
  username VARCHAR(50) PRIMARY KEY,   /* the primary key for each entry */
  password CHAR(60) NOT NULL,
  item CHAR(60),
  timeRent CHAR(60),
  timeReturn CHAR(60)
>>>>>>> origin
);
-- INSERT INTO userTable (userID, userName, password, email)
-- VALUES ('0', 'Tom B. Erichsen', 'password', 'email');

<<<<<<< HEAD
-- DROP TABLE IF EXISTS Category ;
CREATE TABLE Category (
  CategoryID SERIAL PRIMARY KEY,
  CategoryName VARCHAR(45),
  CategoryDescription VARCHAR(200),
  Brand VARCHAR(45)
);
-- INSERT INTO Category (CategoryID, CategoryName, CategoryDescription, Brand)
-- VALUES ('70', 'Laptop', 'description', 'what brand');

-- -- DROP TABLE IF EXISTS Item ;
CREATE TABLE IF NOT EXISTS Item (
  ItemId SERIAL PRIMARY KEY,
  ItemName VARCHAR(45),
  ItemDescription VARCHAR(200),
  Condition VARCHAR(200),
  CategoryID INT NOT NULL REFERENCES Category (CategoryID),
  userID INT NOT NULL REFERENCES userTable (userID),
  rentPerDay DECIMAL(10,2),
  timeBorrowed INT,
  timeReturned INT
);

-- DROP TABLE IF EXISTS Image ;
CREATE TABLE IF NOT EXISTS Image (
  ImageID SERIAL PRIMARY KEY,
  URL VARCHAR,
  CategoryID INT NOT NULL REFERENCES Category (CategoryID)
);
-- INSERT INTO Image (ImageID, URL, CategoryID)
-- VALUES ('1200', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.science.org%2Fcontent%2Farticle%2Fthese-adorable-puppies-may-help-explain-why-dogs-understand-our-body-language&psig=AOvVaw24OXFHBDcLqoDqDU5bIuIN&ust=1668149428389000&source=images&cd=vfe&ved=0CBAQjhxqFwoTCIjpsIODo_sCFQAAAAAdAAAAABAE', '70');

-- DROP TABLE IF EXISTS History ;
CREATE TABLE IF NOT EXISTS History (
  userID INT NOT NULL REFERENCES userTable (userID),
  ItemID INT NOT NULL REFERENCES Item (ItemId),
<<<<<<< HEAD
  timeReturned TIME,
  payBy DATE
);

-- INSERT INTO Image (userID, ItemID, timeReturned, payBy, histPK)
-- VALUES ('1', '6000', '20:12:30', '2022-12-011', '16000');
=======
-- CREATE TABLE users(
--   userID PRIMARY KEY,
--   username VARCHAR(45) NOT NULL,
--   password CHAR(60) NOT NULL,
--   email VARCHAR(45),
--   phone INT(10)
-- );

-- DROP TABLE IF EXISTS Category ;
-- CREATE TABLE IF NOT EXISTS Category (
--   CategoryID SERIAL PRIMARY KEY,
--   CategoryName VARCHAR(45),
--   CategoryDescription VARCHAR(200),
--   Brand VARCHAR(45),
--   SubcategoryID INT REFERENCES Category (CategoryID)
-- );


-- DROP TABLE IF EXISTS Item ;
-- CREATE TABLE IF NOT EXISTS Item (
--   ItemId SERIAL PRIMARY KEY,
--   ItemName VARCHAR(45),
--   ItemDescription VARCHAR(200),
--   Condition VARCHAR(200),
--   CategoryID INT NOT NULL REFERENCES Category (CategoryID),
--   userID INT NOT NULL REFERENCES User (userID),
--   timeBorrowed DATETIME,
--   timeReturned DATETIME
-- );

-- DROP TABLE IF EXISTS Image ;
-- CREATE TABLE IF NOT EXISTS Image (
--   ImageID SERIAL PRIMARY KEY,
--   URL VARCHAR(45),
--   CategoryID INT NOT NULL REFERENCES Category (CategoryID)
-- );

-- DROP TABLE IF EXISTS History ;
-- CREATE TABLE IF NOT EXISTS History (
--   userID INT NOT NULL REFERENCES User (userID),
--   ItemID INT NOT NULL REFERENCES Item (ItemId),
--   timeReturned DATETIME,
--   feeOutstanding TINYINT DEFAULT 0,
--   feeAmount DECIMAL(7,2),
--   payby DATETIME,
--   PRIMARY KEY (userID, ItemID)
-- );
>>>>>>> origin
=======
  timeReturned DATETIME,
  feeOutstanding TINYINT DEFAULT 0,
  feeAmount DECIMAL(7,2),
  payby DATETIME,
  PRIMARY KEY (userID, ItemID)
);
>>>>>>> e1739b91e038fb65233772ee1b65c06520a6ec26
>>>>>>> main
