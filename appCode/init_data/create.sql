-- DROP TABLE userTable
CREATE TABLE userTable (
    userID SERIAL PRIMARY KEY,
    userName varchar(45) NOT NULL,
    password CHAR(60) NOT NULL,
    email CHAR(60)
);
-- INSERT INTO userTable (userID, userName, password, email)
-- VALUES ('0', 'Tom B. Erichsen', 'password', 'email');

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
  timeReturned TIME,
  payBy DATE
);

-- INSERT INTO Image (userID, ItemID, timeReturned, payBy, histPK)
-- VALUES ('1', '6000', '20:12:30', '2022-12-011', '16000');