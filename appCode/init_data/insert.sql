
-- passwords should be hashed, run the hash and then paste it in, do not try to add it without hashing
-- password: password
INSERT INTO userTable (userName, password, firstName, lastName, email)
VALUES ( 'username', '$2b$10$xhjOIbZoN0z/P4hKl8kwyOsGio8RbixVcOgyAnIiXbMZLhaRVSjua', 'user', 'name', 'username@dummydata.com');

-- password: password1

INSERT INTO userTable (userName, password, firstName, lastName, email, schoolYear)
VALUES ('annasmith01', '$2b$10$IA06IGcYbT9QjJNAlILaMeAEVAmJUIuvsiZK/xAhUDKhu4QYSsnrm', 'Anna', 'Smith', 'anna.smith@colorado.edu', 'Undergraduate, Sophomore');

-- IMPORTANT: search queries only work against lowercase, Update: not anymore
-- Current supercategories: 1-6
INSERT INTO Category (CategoryName, CategoryDescription) VALUES 
('laptops', 'this is a laptop, what else is there to say?'),
('Sound devices', 'Headphones and earbuds and speaker oh my'),
('Chargers', 'chargers for electrical devices'),
('Accessories', 'Accessories for computers'),
('Tablets', 'Tablets including ipads and kindles'),
('Other', 'Oddball items');
-- Current categories: 7-15
INSERT INTO Category (CategoryName, CategoryDescription, Brand, SuperCategoryID, URL) VALUES 
('Framework Computer', 'Repairable laptop', 'Framework', 1, 'https://static.frame.work/x58rdni5eh0cjy7mg7dparafb3g8'),
('Macbook Air', 'This Apple Laptop has a 13 inch retna display, touch bar, 20 hour battery life and 8GB of unified memory', 'Apple', 1, 'https://cdn.pocket-lint.com/r/s/970x/assets/images/161396-laptops-review-hands-on-macbook-air-review-image1-v2jzcb3rqd-jpg.webp'),
('Bose Headphones', 'Headphones by Bose, good sound quality', 'Bose', 2, 'https://m.media-amazon.com/images/I/41jSuUHT8eL._AC_.jpg'),
('Microsoft Ergonomic mouse Right-hand Bluetooth', 'Work in comfort all day with our premium wireless ergonomic mouse. Navigate precisely with detent scrolling and access your most-used features with two programmable buttons.', 'Microsoft', 4, 'https://cdn-dynmedia-1.microsoft.com/is/image/microsoftcorp/PCA21_MSBluetoothErgonomicMouse_Feature_MatteBlack_RGB_740x417?wid=515&hei=293&fit=crop'),
('LG Monitor - Keyboard - Mouse', 'This item includes a monitor, bluetooth mouse, and bluetooth keyboard', 'LG', 4, 'https://i.dell.com/is/image/DellContent//content/dam/ss2/product-images/dell-client-products/desktops/optiplex-desktops/optiplex-3280/media-gallery/aio_optiplex_3280_gallery_4.psd?fmt=pjpg&pscan=auto&scl=1&wid=3345&hei=3067&qlt=100,1&resMode=sharp2&size=3345,3067&chrss=full&imwidth=5000'),
('Stands', 'Stand that allows you to have your device at eye level', 'ZSIMC', 4, 'https://m.media-amazon.com/images/I/31OJZyIDWML._AC_.jpg'),
('USBs', 'USB - 32 GB', 'Sam Data', 4, 'https://m.media-amazon.com/images/I/61sSSHDyuzL.jpg'),
('Brain Cells', 'Community Brain Cells when you are burnt out from finals and need a re boot', 'CU', 6, 'https://www.howtogeek.com/wp-content/uploads/2016/07/is-static-electricity-damage-still-a-huge-problem-with-electronics-now-00.jpg?height=200p&trim=2,2,2,2'),
('Ipad 7', 'Touch screen tablet, 7 in screen, stylus not incuded', 'Apple', 5, 'https://m.media-amazon.com/images/I/41dw1g4jtnS.jpg'),
('Keyboards', 'Bluetooth kayboard, can connect to 1 item at a time, compatable with most software', 'iClever', 4, 'https://m.media-amazon.com/images/I/716R6+OIXML.jpg'),
('Multimeter', 'Used to examine current, voltage, resistance, ect', 'Astroai', 4,'https://m.media-amazon.com/images/I/71jLUk5lNAL.jpg'),
('Power Supply Adapter', '18V 1A AC DC Power Supply Adapter, US Wall Charger, DC Plug 5.5x2.1mm & 2.5mm Compatible with for 18volt (0.1A 0.15A 0.2A 0.25A 0.3A 0.4A 0.5A 0.6A 0.7A 0.8A 0.9A) 100mA~1000mA', 'LitStar', 3, 'https://m.media-amazon.com/images/I/61Qy0zzUtaS._AC_SX466_.jpg');
-- trivial cases
INSERT INTO Item (CategoryID)
VALUES
(7),
(8),
(9),
(10),
(11),
(12),
(13),
(14),
(15);
INSERT INTO Item (CategoryId, userID, Condition, timeBorrowed, timeDue)
VALUES 
(14,1, 'Broken', '2022-10-01 10:10:30', '2022-10-02 20:45:30'),
(7,1, 'As good as new', '2022-11-01 10:10:30', '2022-12-02 20:45:30'),
(12,2, 'As good as new', '2022-9-01 10:10:30', '2022-10-02 20:45:30'),
(7,1, 'As good as new', '2022-8-01 10:10:30', '2022-9-02 20:45:30'),
(10,2, 'As good as new', '2022-10-01 10:10:30', '2022-10-02 20:45:30'),
(12,1, 'Slight wear', '2022-10-01 10:10:30', '2022-10-02 20:45:30');


-- INSERT INTO History (userID, ItemID, timeReturned, payBy)
-- VALUES (2, 2, '2022-12-01 20:10:30', '2022-12-01 20:10:30'),
-- (1, 3, '2022-12-01 10:10:30', '2022-12-02 20:45:30'),
-- (1, 5, '2022-12-01 10:10:30', '2022-12-02 20:45:30'),
-- (1, 12, '2022-12-01 10:10:30', '2022-12-02 20:45:30'),
-- (2, 9, '2022-12-01 10:10:30', '2022-12-02 20:45:30'),
-- (1, 8, '2022-12-01 10:10:30', '2022-12-02 20:45:30'),
-- (2, 9, '2022-12-01 10:10:30', '2022-12-02 20:45:30'),
-- (2, 10, '2022-12-01 10:10:30', '2022-12-02 20:45:30'),
-- (1, 6, '2022-12-01 10:10:30', '2022-12-02 20:45:30'),
-- (1, 12, '2022-12-01 10:10:30', '2022-12-02 20:45:30');
INSERT INTO History (userID, ItemID) VALUES
(1,2),
(1,3),
(1,3),
(2,3);

INSERT INTO Cart(userID, ItemID, Duration, DurationName)
VALUES (1,3,'7 days','7 days'),
(1,4,'1 days 12 hours','1 days 12 hours'),
(1,12,'1 days 12 hours','1 days 12 hours'),
(2,8,'2 days','2 days');
-- INFO

-- INSERT INTO users (username, password, item, timeRent, timeReturn) VALUES
-- ('Roxy', '1', 'Macbook', '10 hours', 'Nov 10 at 11 am');

-- INSERT INTO profile(user_fname, user_lname, username, email, item) VALUES 
-- ('Anna', 'Smith', 'annasmith01', 'anna.smith@colorado.edu', 'Macbook');

-- INFO END
