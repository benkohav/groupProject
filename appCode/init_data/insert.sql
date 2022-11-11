-- -- INSERT INTO Category (CategoryName, CategoryDescription, Brand, SubcategoryID) VALUES
-- -- ('iPad', 'A tablet manufactured by Apple', 'Apple', 2),
-- -- ('Tablet', 'A flat screen', NULL, NULL);


-- INSERT INTO users (userID, username, password, email, phone) VALUES
-- ('1100123333', 'Roxy', '1', 'rsmanthy@gmail.com', 303999999);

INSERT INTO users (username, password, item, timeRent, timeReturn) VALUES
('a', '1', 'Macbook', '10 hours', 'Nov 10 at 11 am');

INSERT INTO users (username, password, item, timeRent, timeReturn) VALUES
('b', '1', 'Macbook', '10 hours', 'Nov 10 at 11 am');

INSERT INTO users (username, password, item, timeRent, timeReturn) VALUES
('c', '1', 'Macbook', '10 hours', 'Nov 10 at 11 am');

INSERT INTO Item (name, URL, Brand) VALUES ('USBc','https://m.media-amazon.com/images/I/71dwdN77AXS._AC_SX466_.jpg', 'Samsung');

INSERT INTO Item (name,URL,Brand) VALUES ('Free Iphone','https://m.media-amazon.com/images/I/71dwdN77AXS._AC_SX466_.jpg', 'Samsung');

INSERT INTO Item (name,URL, Brand) VALUES ('Fan', 'https://m.media-amazon.com/images/I/71dwdN77AXS._AC_SX466_.jpg', 'Samsung');

INSERT INTO UsersToItem(ItemID,userID) VALUES (1,3);

INSERT INTO UsersToItem(ItemID,userID) VALUES (2,1);

INSERT INTO UsersToItem(ItemID,userID) VALUES (2,2);

INSERT INTO UsersToItem(ItemID,userID) VALUES (3,1);

INSERT INTO UsersToItem(ItemID,userID) VALUES (3,2);

INSERT INTO UsersToItem(ItemID,userID) VALUES (3,3);