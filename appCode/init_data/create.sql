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
  username VARCHAR(50) PRIMARY KEY,   /* the primary key for each entry */
  password CHAR(60) NOT NULL
);