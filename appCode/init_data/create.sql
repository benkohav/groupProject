
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
