-- DROP TABLE IF EXISTS users CASCADE;
-- CREATE TABLE users(
--   userID INT NOT NULL,
--   username VARCHAR(45) NULL,
--   password CHAR(60) NULL,
--   email VARCHAR(45) NULL,
--   phone VARCHAR(10) NULL,
--   PRIMARY KEY (userID)
-- );

CREATE TABLE users(
  userID SERIAL UNIQUE,
  username VARCHAR(50) PRIMARY KEY,   /* the primary key for each entry */
  password CHAR(60) NOT NULL,
  item CHAR(60),
  timeRent CHAR(60),
  timeReturn CHAR(60)
);

CREATE TABLE Item(
  ItemID SERIAL UNIQUE,
  name VARCHAR(45),
  URL VARCHAR(100),
  Brand VARCHAR(45)
);

CREATE TABLE UsersToItem(
  ItemID INT REFERENCES Item (ItemID),
  userID INT REFERENCES users (userID)
);



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