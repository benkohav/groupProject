CREATE TABLE userTable (
  userID SERIAL PRIMARY KEY,
  username VARCHAR(45) NOT NULL,
  password CHAR(60) NOT NULL,
  email VARCHAR(45)
);


CREATE TABLE Category (
  CategoryID SERIAL PRIMARY KEY,
  CategoryName VARCHAR(45),
  CategoryDescription VARCHAR(200),
  Brand VARCHAR(45),
  SubcategoryID INT REFERENCES Category (CategoryID)
);


CREATE TABLE IF NOT EXISTS Item (
  ItemId SERIAL PRIMARY KEY,
  ItemName VARCHAR(45),
  ItemDescription VARCHAR(200),
  Condition VARCHAR(200),
  CategoryID INT NOT NULL REFERENCES Category (CategoryID),
  userID INT NOT NULL REFERENCES userTable (userID),
  timeBorrowed DATETIME,
  timeReturned DATETIME
);

CREATE TABLE IF NOT EXISTS Image (
  ImageID SERIAL PRIMARY KEY,
  URL VARCHAR(45),
  CategoryID INT NOT NULL REFERENCES Category (CategoryID)
);

CREATE TABLE IF NOT EXISTS History (
  userID INT NOT NULL REFERENCES User (userID),
  ItemID INT NOT NULL REFERENCES Item (ItemId),
  timeReturned DATETIME,
  feeOutstanding TINYINT DEFAULT 0,
  feeAmount DECIMAL(7,2),
  payby DATETIME,
  PRIMARY KEY (userID, ItemID)
);