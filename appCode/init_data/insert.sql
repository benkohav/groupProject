
-- passwords should be hashed, run the hash and then paste it in, do not try to add it without hashing
-- password: password
INSERT INTO userTable (userName, password, firstName, lastName, email)
VALUES ( 'username', '$2b$10$xhjOIbZoN0z/P4hKl8kwyOsGio8RbixVcOgyAnIiXbMZLhaRVSjua', 'user', 'name', 'username@dummydata.com');

-- password: password1

INSERT INTO userTable (userName, password, firstName, lastName, email, schoolYear)
VALUES ('annasmith01', '$2b$10$IA06IGcYbT9QjJNAlILaMeAEVAmJUIuvsiZK/xAhUDKhu4QYSsnrm', 'Anna', 'Smith', 'anna.smith@colorado.edu', 'Undergraduate, Sophomore');

-- INSERT INTO userTable (userID, userName, password, email)
-- VALUES ('1', '111111111111', 'password2', 'email2');
-- INSERT INTO userTable (userID, userName, password, email)
-- VALUES ('2', '22222222222', 'password3', 'email3');
-- INSERT INTO userTable (userID, userName, password, email)
-- VALUES ('3', '333333333', 'password4', 'email4');
-- INSERT INTO userTable (userID, userName, password, email)
-- VALUES ('4', '4444444444', 'password5', 'email5');
-- INSERT INTO userTable (userID, userName, password, email)
-- VALUES ('5', '555555555555', 'password6', 'email6');
-- INSERT INTO userTable (userID, userName, password, email)
-- VALUES ('6', '6666666666', 'password7', 'email7');
-- INSERT INTO userTable (userID, userName, password, email)
-- VALUES ('7', '77777777777', 'password8', 'email8');
-- INSERT INTO userTable (userID, userName, password, email)
-- VALUES ('8', '88888888', 'password9', 'email9');
-- INSERT INTO userTable (userID, userName, password, email)
-- VALUES ('9', '9999999999', 'password10', 'email10');


-- INSERT INTO checkout (username, password, item, timeRent, timeReturn) VALUES
-- ('Roxy', '1', 'Macbook', '10 hours', 'Nov 10 at 11 am');


-- INSERT INTO Category (CategoryID, CategoryName, CategoryDescription, Brand)
-- VALUES ('70', 'Laptop', 'description1', 'what brand2222');
-- INSERT INTO Category (CategoryID, CategoryName, CategoryDescription, Brand)
-- VALUES ('80', 'Laptop1', 'description2', 'what brand33333');
-- INSERT INTO Category (CategoryID, CategoryName, CategoryDescription, Brand)
-- VALUES ('90', 'Laptop2', 'description3', 'what brand444444');
-- INSERT INTO Category (CategoryID, CategoryName, CategoryDescription, Brand)
-- VALUES ('100', 'Laptop3', 'description4', 'what brand555555');
-- INSERT INTO Category (CategoryID, CategoryName, CategoryDescription, Brand)
-- VALUES ('110', 'Laptop4', 'description5', 'what brand6666666');
-- INSERT INTO Category (CategoryID, CategoryName, CategoryDescription, Brand)
-- VALUES ('120', 'Laptop5', 'description6', 'what brand777777');
-- INSERT INTO Category (CategoryID, CategoryName, CategoryDescription, Brand)
-- VALUES ('130', 'Laptop6', 'description7', 'what brand888888');
-- INSERT INTO Category (CategoryID, CategoryName, CategoryDescription, Brand)
-- VALUES ('140', 'Laptop7', 'description8', 'what brand99999999');
-- INSERT INTO Category (CategoryID, CategoryName, CategoryDescription, Brand)
-- VALUES ('150', 'Laptop8', 'description9', 'what brand1111111111');
-- INSERT INTO Category (CategoryID, CategoryName, CategoryDescription, Brand)
-- VALUES ('160', 'Laptop9', 'description10', 'what brand121212112');

-- INSERT INTO Item (ItemId, ItemName, ItemDescription, Condition, CategoryID, userID, rentPerDay, timeBorrowed, timeReturned)
-- VALUES ('6000', 'ItemName1' ,'ItemDescription1', 'Condition1', '110' , '0', '10.00' , '1234', '5678');
-- INSERT INTO Item (ItemId, ItemName, ItemDescription, Condition, CategoryID, userID, rentPerDay, timeBorrowed, timeReturned)
-- VALUES ('7000', 'ItemName2' ,'ItemDescription2', 'Condition2', '80' , '1', '12.00' ,'4321', '3421');
-- INSERT INTO Item (ItemId, ItemName, ItemDescription, Condition, CategoryID, userID, rentPerDay, timeBorrowed, timeReturned)
-- VALUES ('8000', 'ItemName3' ,'ItemDescription3', 'Condition3', '90' , '2', '13.00' ,'1111', '2222');
-- INSERT INTO Item (ItemId, ItemName, ItemDescription, Condition, CategoryID, userID, rentPerDay, timeBorrowed, timeReturned)
-- VALUES ('9000', 'ItemName4' ,'ItemDescription4', 'Condition4', '100' , '3', '16.00' ,'3434', '4545');
-- INSERT INTO Item (ItemId, ItemName, ItemDescription, Condition, CategoryID, userID, rentPerDay, timeBorrowed, timeReturned)
-- VALUES ('10000', 'ItemName5' ,'ItemDescription5', 'Condition5', '90' , '4', '15.00' ,'7777', '1212');
-- INSERT INTO Item (ItemId, ItemName, ItemDescription, Condition, CategoryID, userID, rentPerDay, timeBorrowed, timeReturned)
-- VALUES ('11000', 'ItemName6' ,'ItemDescription6', 'Condition6', '110' , '5', '9.00' , '1234', '5678');
-- INSERT INTO Item (ItemId, ItemName, ItemDescription, Condition, CategoryID, userID, rentPerDay, timeBorrowed, timeReturned)
-- VALUES ('12000', 'ItemName7' ,'ItemDescription7', 'Condition7', '120' , '6', '2.00' ,'4321', '3421');
-- INSERT INTO Item (ItemId, ItemName, ItemDescription, Condition, CategoryID, userID, rentPerDay, timeBorrowed, timeReturned)
-- VALUES ('13000', 'ItemName8' ,'ItemDescription8', 'Condition8', '130' , '7', '83.00' ,'1111', '2222');
-- INSERT INTO Item (ItemId, ItemName, ItemDescription, Condition, CategoryID, userID, rentPerDay, timeBorrowed, timeReturned)
-- VALUES ('14000', 'ItemName9' ,'ItemDescription8', 'Condition9', '140' , '8', '14.00' ,'3434', '4545');
-- INSERT INTO Item (ItemId, ItemName, ItemDescription, Condition, CategoryID, userID, rentPerDay, timeBorrowed, timeReturned)
-- VALUES ('15000', 'ItemName10' ,'ItemDescription10', 'Condition10', '150' , '9','15.00' , '7777', '1212');

-- INSERT INTO Image (ImageID, URL, CategoryID)
-- VALUES ('1200', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.science.org%2Fcontent%2Farticle%2Fthese-adorable-puppies-may-help-explain-why-dogs-understand-our-body-language&psig=AOvVaw24OXFHBDcLqoDqDU5bIuIN&ust=1668149428389000&source=images&cd=vfe&ved=0CBAQjhxqFwoTCIjpsIODo_sCFQAAAAAdAAAAABAE', '70');
-- INSERT INTO Image (ImageID, URL, CategoryID)
-- VALUES ('1300', 'https://www.google.com/imgres?imgurl=https%3A%2F%2Fstatic.frame.work%2F92cqdkoguwxj1a5w5ks5rnjs7nl8&imgrefurl=https%3A%2F%2Fframe.work%2Fproducts%2Flaptop-12-gen-intel&tbnid=eGpp_UKaouDw7M&vet=12ahUKEwjgiMGHhaP7AhXrkWoFHS7gD9EQMygGegUIARD_Ag..i&docid=sVHyzJUbQD-XuM&w=838&h=1024&q=laptop&ved=2ahUKEwjgiMGHhaP7AhXrkWoFHS7gD9EQMygGegUIARD_Ag', '80');
-- INSERT INTO Image (ImageID, URL, CategoryID)
-- VALUES ('1400', 'https://www.google.com/imgres?imgurl=https%3A%2F%2Fm.media-amazon.com%2Fimages%2FI%2F41jSuUHT8eL._AC_.jpg&imgrefurl=https%3A%2F%2Fwww.amazon.com%2FBose-QuietComfort-Wireless-Headphones-Cancelling%2Fdp%2FB0756CYWWD&tbnid=jaTF7DY6gkf9NM&vet=12ahUKEwjEqoTAhaP7AhWjkmoFHTNCAJMQMygoegUIARD4Aw..i&docid=Sill-3jjDDRaBM&w=288&h=464&q=headphones%20images&ved=2ahUKEwjEqoTAhaP7AhWjkmoFHTNCAJMQMygoegUIARD4Aw', '90');
-- INSERT INTO Image (ImageID, URL, CategoryID)
-- VALUES ('1500', 'https://www.google.com/imgres?imgurl=https%3A%2F%2Fcdn-dynmedia-1.microsoft.com%2Fis%2Fimage%2Fmicrosoftcorp%2FPCA21_MSBluetoothErgonomicMouse_Feature_MatteBlack_RGB_740x417%3Fwid%3D515%26hei%3D293%26fit%3Dcrop&imgrefurl=https%3A%2F%2Fwww.microsoft.com%2Fen%2Faccessories%2Fmice&tbnid=1jWEeOlvOW2DTM&vet=12ahUKEwiMsJPThaP7AhWfnGoFHd4gCYsQMygWegUIARChAw..i&docid=IEBSx4E7LpDcLM&w=515&h=293&q=mouse%20computer&ved=2ahUKEwiMsJPThaP7AhWfnGoFHd4gCYsQMygWegUIARChAw', '100');
-- INSERT INTO Image (ImageID, URL, CategoryID)
-- VALUES ('1600', 'https://www.google.com/imgres?imgurl=https%3A%2F%2Fi.dell.com%2Fis%2Fimage%2FDellContent%2F%2Fcontent%2Fdam%2Fss2%2Fproduct-images%2Fdell-client-products%2Fdesktops%2Foptiplex-desktops%2Foptiplex-3280%2Fmedia-gallery%2Faio_optiplex_3280_gallery_4.psd%3Ffmt%3Dpjpg%26pscan%3Dauto%26scl%3D1%26wid%3D3345%26hei%3D3067%26qlt%3D100%2C1%26resMode%3Dsharp2%26size%3D3345%2C3067%26chrss%3Dfull%26imwidth%3D5000&imgrefurl=https%3A%2F%2Fwww.dell.com%2Fen-us%2Fshop%2Fdesktop-computers%2Foptiplex-3280-all-in-one-desktop%2Fspd%2Foptiplex-3280-aio&tbnid=CiWJd9fhQUgU-M&vet=12ahUKEwjahffhhaP7AhUzomoFHcjNANkQMyhBegQIARB2..i&docid=HqkCGhABi0-G_M&w=3345&h=3067&q=mouse%20monitor&ved=2ahUKEwjahffhhaP7AhUzomoFHcjNANkQMyhBegQIARB2', '110');
-- INSERT INTO Image (ImageID, URL, CategoryID)
-- VALUES ('1700', 'https://www.google.com/aclk?sa=l&ai=DChcSEwjG_MD0haP7AhWqFNQBHS4xDZwYABADGgJvYQ&sig=AOD64_0LBxM_U9FZQJyNDpxSpp4bHgOuSw&adurl&ctype=5&ved=2ahUKEwix47X0haP7AhVsg2oFHRZUDOcQvhd6BAgBEHg', '120');
-- INSERT INTO Image (ImageID, URL, CategoryID)
-- VALUES ('1800', 'https://www.google.com/imgres?imgurl=https%3A%2F%2Fm.media-amazon.com%2Fimages%2FI%2F71jLUk5lNAL.jpg&imgrefurl=https%3A%2F%2Fwww.amazon.com%2FAstroAI-Multimeter-Ohmmeter-Voltmeter-Non-Contact%2Fdp%2FB0842HTN8C&tbnid=Qu1GxKlGxWxpAM&vet=12ahUKEwjaqNWFhqP7AhU1k2oFHfW2DU0QMygBegUIARDuAg..i&docid=VMfNYJ0hSb5MOM&w=1500&h=1500&q=voltmeter&ved=2ahUKEwjaqNWFhqP7AhU1k2oFHfW2DU0QMygBegUIARDuAg', '130');
-- INSERT INTO Image (ImageID, URL, CategoryID)
-- VALUES ('1900', 'https://www.google.com/imgres?imgurl=https%3A%2F%2Fwww.howtogeek.com%2Fwp-content%2Fuploads%2F2016%2F07%2Fis-static-electricity-damage-still-a-huge-problem-with-electronics-now-00.jpg%3Fheight%3D200p%26trim%3D2%2C2%2C2%2C2&imgrefurl=https%3A%2F%2Fwww.howtogeek.com%2F262313%2Fis-static-electricity-damage-still-a-huge-problem-with-electronics%2F&tbnid=dFPopLqtM8kUkM&vet=12ahUKEwiq_KCdhqP7AhWDomoFHYIBDusQMygKegUIARDBAg..i&docid=n5zhNWTRUKVL3M&w=1292&h=592&q=static%20for%20eletronics&ved=2ahUKEwiq_KCdhqP7AhWDomoFHYIBDusQMygKegUIARDBAg', '140');
-- INSERT INTO Image (ImageID, URL, CategoryID)
-- VALUES ('2000', 'https://www.google.com/imgres?imgurl=https%3A%2F%2Fm.media-amazon.com%2Fimages%2FI%2F41dw1g4jtnS.jpg&imgrefurl=https%3A%2F%2Fwww.amazon.com%2FFire-HD-10-tablet%2Fdp%2FB08BX7FV5L&tbnid=nJSbQIB6fvz4UM&vet=12ahUKEwioiYGxhqP7AhUXlWoFHSG1DwEQ94IIKAZ6BQgBEK8D..i&docid=O50p3Mt606ILmM&w=500&h=500&q=tablet&ved=2ahUKEwioiYGxhqP7AhUXlWoFHSG1DwEQ94IIKAZ6BQgBEK8D', '150');
-- INSERT INTO Image (ImageID, URL, CategoryID)
-- VALUES ('2100', 'https://www.google.com/imgres?imgurl=https%3A%2F%2Fm.media-amazon.com%2Fimages%2FI%2F31OJZyIDWML._AC_.jpg&imgrefurl=https%3A%2F%2Fwww.amazon.com%2FMoKo-Tablet-Foldable-Multi-Angle-Holder%2Fdp%2FB017TU5KMQ&tbnid=rRJTbEdI4NFY5M&vet=12ahUKEwjv38LahqP7AhWrnWoFHdQ9CLIQMygOegUIARCGAw..i&docid=8QvOSHHhkErf6M&w=494&h=308&q=phone%20tablet&ved=2ahUKEwjv38LahqP7AhWrnWoFHdQ9CLIQMygOegUIARCGAw', '160');


-- INSERT INTO History (userID, ItemID, timeReturned, payBy)
-- VALUES ('0', '6000', '20:10:30', '2022-12-01');
-- INSERT INTO History (userID, ItemID, timeReturned, payBy)
-- VALUES ('1', '7000', '20:12:30', '2022-12-02');
-- INSERT INTO History (userID, ItemID, timeReturned, payBy)
-- VALUES ('2', '8000', '10:12:30', '2022-12-03');
-- INSERT INTO History (userID, ItemID, timeReturned, payBy)
-- VALUES ('3', '9000', '10:42:30', '2022-12-04');
-- INSERT INTO History (userID, ItemID, timeReturned, payBy)
-- VALUES ('4', '10000', '20:12:30', '2022-12-05');
-- INSERT INTO History (userID, ItemID, timeReturned, payBy)
-- VALUES ('5', '11000', '10:52:30', '2022-12-06');
-- INSERT INTO History (userID, ItemID, timeReturned, payBy)
-- VALUES ('6', '12000', '20:32:30', '2022-12-07');
-- INSERT INTO History (userID, ItemID, timeReturned, payBy)
-- VALUES ('7', '13000', '10:12:30', '2022-12-08');
-- INSERT INTO History (userID, ItemID, timeReturned, payBy)
-- VALUES ('8', '14000', '20:02:30', '2022-12-09');
-- INSERT INTO History (userID, ItemID, timeReturned, payBy)
-- VALUES ('9', '15000', '10:22:30', '2022-12-10');


-- IMPORTANT: search queries only work against lowercase
INSERT INTO Category (CategoryName, CategoryDescription)
VALUES ('laptop', 'this is a laptop, what else is there to say?');
INSERT INTO Category (CategoryName, CategoryDescription)
VALUES ('Sound devices', 'Headphones and earbuds and speaker oh my');
INSERT INTO Category (CategoryName, CategoryDescription)
VALUES ('Chargers', 'chargers');
INSERT INTO Category (CategoryName, CategoryDescription, Brand, SuperCategoryID)
VALUES ('laptop1', 'description2', 'what brand33333', 1);
INSERT INTO Category (CategoryName, CategoryDescription, Brand, SuperCategoryID)
VALUES ('laptop2', 'description3', 'what brand444444', 2);
INSERT INTO Category (CategoryName, CategoryDescription, Brand, SuperCategoryID)
VALUES ('laptop3', 'description4', 'what brand555555', 3);
INSERT INTO Category (CategoryName, CategoryDescription, Brand, SuperCategoryID)
VALUES ('laptop4', 'description5', 'what brand6666666', 1),
('laptop5', 'description6', 'what brand777777', 2),
('laptop6', 'description7', 'what brand888888', 3),
('laptop7', 'description8', 'what brand99999999', 2),
('laptop8', 'description9', 'what brand1111111111', 1),
('laptop9', 'description10', 'what brand121212112', 2);
-- INSERT INTO Category (CategoryName, CategoryDescription, Brand, SubcategoryID) VALUES
-- -- ('iPad', 'A tablet manufactured by Apple', 'Apple', 2),
-- -- ('Tablet', 'A flat screen', NULL, NULL);

-- INSERT INTO Item (ItemId, ItemName, ItemDescription, Condition, CategoryID, userID, rentPerDay, timeBorrowed, timeReturned)
-- VALUES ('6000', 'ItemName1' ,'ItemDescription1', 'Condition1', '110' , '0', '10.00' , '1234', '5678');
-- INSERT INTO Item (ItemId, ItemName, ItemDescription, Condition, CategoryID, userID, rentPerDay, timeBorrowed, timeReturned)
-- VALUES ('7000', 'ItemName2' ,'ItemDescription2', 'Condition2', '80' , '1', '12.00' ,'4321', '3421');
-- INSERT INTO Item (ItemId, ItemName, ItemDescription, Condition, CategoryID, userID, rentPerDay, timeBorrowed, timeReturned)
-- VALUES ('8000', 'ItemName3' ,'ItemDescription3', 'Condition3', '90' , '2', '13.00' ,'1111', '2222');
-- INSERT INTO Item (ItemId, ItemName, ItemDescription, Condition, CategoryID, userID, rentPerDay, timeBorrowed, timeReturned)
-- VALUES ('9000', 'ItemName4' ,'ItemDescription4', 'Condition4', '100' , '3', '16.00' ,'3434', '4545');
-- INSERT INTO Item (ItemId, ItemName, ItemDescription, Condition, CategoryID, userID, rentPerDay, timeBorrowed, timeReturned)
-- VALUES ('10000', 'ItemName5' ,'ItemDescription5', 'Condition5', '90' , '4', '15.00' ,'7777', '1212');
-- INSERT INTO Item (ItemId, ItemName, ItemDescription, Condition, CategoryID, userID, rentPerDay, timeBorrowed, timeReturned)
-- VALUES ('11000', 'ItemName6' ,'ItemDescription6', 'Condition6', '110' , '5', '9.00' , '1234', '5678');
-- INSERT INTO Item (ItemId, ItemName, ItemDescription, Condition, CategoryID, userID, rentPerDay, timeBorrowed, timeReturned)
-- VALUES ('12000', 'ItemName7' ,'ItemDescription7', 'Condition7', '120' , '6', '2.00' ,'4321', '3421');
-- INSERT INTO Item (ItemId, ItemName, ItemDescription, Condition, CategoryID, userID, rentPerDay, timeBorrowed, timeReturned)
-- VALUES ('13000', 'ItemName8' ,'ItemDescription8', 'Condition8', '130' , '7', '83.00' ,'1111', '2222');
-- INSERT INTO Item (ItemId, ItemName, ItemDescription, Condition, CategoryID, userID, rentPerDay, timeBorrowed, timeReturned)
-- VALUES ('14000', 'ItemName9' ,'ItemDescription8', 'Condition9', '140' , '8', '14.00' ,'3434', '4545');
-- INSERT INTO Item (ItemId, ItemName, ItemDescription, Condition, CategoryID, userID, rentPerDay, timeBorrowed, timeReturned)
-- VALUES ('15000', 'ItemName10' ,'ItemDescription10', 'Condition10', '150' , '9','15.00' , '7777', '1212');
-- trivial cases
INSERT INTO Item (CategoryID)
VALUES
(11),
(12),
(4),
(5),
(6),
(7),
(8),
(9),
(10);
INSERT INTO Item (CategoryId, userID, Condition)
VALUES 
(4,1, 'Broken'),
(7,1, 'As good as new'),
(6,2, 'As good as new'),
(7,1, 'As good as new'),
(10,2, 'As good as new');

-- Note for inserting future images: please link to image directly not google page, I had to change all of these
INSERT INTO Image (URL, CategoryID)
VALUES ('https://www.science.org/do/10.1126/science.abi5787/full/main_puppies_1280p.jpg', 1);
INSERT INTO Image (URL, CategoryID)
VALUES ('https://static.frame.work/x58rdni5eh0cjy7mg7dparafb3g8', 4);
INSERT INTO Image (URL, CategoryID)
VALUES ('https://m.media-amazon.com/images/I/41jSuUHT8eL._AC_.jpg', 5);
INSERT INTO Image (URL, CategoryID)
VALUES ('https://cdn-dynmedia-1.microsoft.com/is/image/microsoftcorp/PCA21_MSBluetoothErgonomicMouse_Feature_MatteBlack_RGB_740x417?wid=515&hei=293&fit=crop', 6);
INSERT INTO Image (URL, CategoryID)
VALUES ('https://i.dell.com/is/image/DellContent//content/dam/ss2/product-images/dell-client-products/desktops/optiplex-desktops/optiplex-3280/media-gallery/aio_optiplex_3280_gallery_4.psd?fmt=pjpg&pscan=auto&scl=1&wid=3345&hei=3067&qlt=100,1&resMode=sharp2&size=3345,3067&chrss=full&imwidth=5000', 7);
INSERT INTO Image (URL, CategoryID)
VALUES ('https://m.media-amazon.com/images/I/61Qy0zzUtaS._AC_SX466_.jpg', 8);
INSERT INTO Image (URL, CategoryID)
VALUES ('https://m.media-amazon.com/images/I/71jLUk5lNAL.jpg', 9);
INSERT INTO Image (URL, CategoryID)
VALUES ('https://www.howtogeek.com/wp-content/uploads/2016/07/is-static-electricity-damage-still-a-huge-problem-with-electronics-now-00.jpg?height=200p&trim=2,2,2,2', 10);
INSERT INTO Image (URL, CategoryID)
VALUES ('https://m.media-amazon.com/images/I/41dw1g4jtnS.jpg', 11);
INSERT INTO Image (URL, CategoryID)
VALUES ('https://m.media-amazon.com/images/I/31OJZyIDWML._AC_.jpg', 12);


INSERT INTO History (userID, ItemID, timeReturned, payBy)
VALUES (2, 2, '2022-12-01 20:10:30', '2022-12-01 20:10:30');
INSERT INTO History (userID, ItemID, timeReturned, payBy)
VALUES (1, 3, '2022-12-01 10:10:30', '2022-12-02 20:45:30');
INSERT INTO History (userID, ItemID, timeReturned, payBy)
VALUES (1, 5, '2022-12-01 10:10:30', '2022-12-02 20:45:30');
INSERT INTO History (userID, ItemID, timeReturned, payBy)
VALUES (1, 12, '2022-12-01 10:10:30', '2022-12-02 20:45:30');
INSERT INTO History (userID, ItemID, timeReturned, payBy)
VALUES (2, 9, '2022-12-01 10:10:30', '2022-12-02 20:45:30');
INSERT INTO History (userID, ItemID, timeReturned, payBy)
VALUES (1, 8, '2022-12-01 10:10:30', '2022-12-02 20:45:30');
INSERT INTO History (userID, ItemID, timeReturned, payBy)
VALUES (2, 9, '2022-12-01 10:10:30', '2022-12-02 20:45:30');
INSERT INTO History (userID, ItemID, timeReturned, payBy)
VALUES (2, 10, '2022-12-01 10:10:30', '2022-12-02 20:45:30');
INSERT INTO History (userID, ItemID, timeReturned, payBy)
VALUES (1, 6, '2022-12-01 10:10:30', '2022-12-02 20:45:30');
INSERT INTO History (userID, ItemID, timeReturned, payBy)
VALUES (1, 12, '2022-12-01 10:10:30', '2022-12-02 20:45:30');


INSERT INTO Cart(userID, ItemID, Duration, DurationName)
VALUES (1,3,'7 days','7 days'),
(1,4,'1 days 12 hours','1 days 12 hours'),
(2,8,'2 days','2 days');
-- INFO

-- INSERT INTO users (username, password, item, timeRent, timeReturn) VALUES
-- ('Roxy', '1', 'Macbook', '10 hours', 'Nov 10 at 11 am');

-- INSERT INTO profile(user_fname, user_lname, username, email, item) VALUES 
-- ('Anna', 'Smith', 'annasmith01', 'anna.smith@colorado.edu', 'Macbook');

-- INFO END
