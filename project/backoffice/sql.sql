DROP DATABASE IF EXISTS PEPSI2;
CREATE DATABASE PEPSI2;
USE PEPSI2;
-- -----------------------------------------------------
-- Table `customer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `customer` ;

CREATE TABLE IF NOT EXISTS `customer` (
  `id_customer` INT(11) NOT NULL AUTO_INCREMENT,
  `login` VARCHAR(25) NOT NULL,
  `password` VARCHAR(20) NOT NULL,
  `email` VARCHAR(50) NULL,
  `name` VARCHAR(25) NULL,
  `firstname` VARCHAR(45) NULL,
  `phone` INT(20) NULL,
  PRIMARY KEY (`id_customer`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `manufacturer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `manufacturer` ;

CREATE TABLE IF NOT EXISTS `manufacturer` (
  `id_manufacturer` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `adress` VARCHAR(50) NULL,
  `postal_code` VARCHAR(25) NULL,
  `city` VARCHAR(45) NULL,
  `country` INT(11) NULL,
  PRIMARY KEY (`id_manufacturer`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `article_category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `article_category` ;

CREATE TABLE IF NOT EXISTS `article_category` (
  `id_article_category` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id_article_category`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `article`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `article` ;

CREATE TABLE IF NOT EXISTS `article` (
  `id_article` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `reference` VARCHAR(20) NULL,
  `description` LONGTEXT NULL,
  `quantity` INT(3) NOT NULL,
  `weight` FLOAT NULL DEFAULT NULL,
  `dimension` VARCHAR(50) NULL,
  `picture` VARCHAR(50) NULL,
  `manufacturer_id_manufacturer` INT(11) NOT NULL,
  `article_category_id_article_category` INT(11) NOT NULL,
  PRIMARY KEY (`id_article`),
  INDEX `fk_article_manufacturer1_idx` (`manufacturer_id_manufacturer` ASC),
  INDEX `fk_article_article_category1_idx` (`article_category_id_article_category` ASC),
  CONSTRAINT `fk_article_manufacturer1`
    FOREIGN KEY (`manufacturer_id_manufacturer`)
    REFERENCES `manufacturer` (`id_manufacturer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_article_article_category1`
    FOREIGN KEY (`article_category_id_article_category`)
    REFERENCES `article_category` (`id_article_category`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `order`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `order` ;

CREATE TABLE IF NOT EXISTS `order` (
  `id_order` INT(11) NOT NULL AUTO_INCREMENT,
  `date_purchase` DATE NOT NULL,
  PRIMARY KEY (`id_order`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;

-- -----------------------------------------------------
-- Table `type_adress`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `type_adress` ;

CREATE TABLE IF NOT EXISTS `type_adress` (
  `id_type_address` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`id_type_address`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `customer_adress`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `customer_adress` ;

CREATE TABLE IF NOT EXISTS `customer_adress` (
  `id_adress` INT(11) NOT NULL AUTO_INCREMENT,
  `adress` VARCHAR(50) NOT NULL,
  `postal_code` INT(11) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `longitude` FLOAT NULL,
  `latitude` FLOAT NULL,
  `country` VARCHAR(45) NOT NULL,
  `type_adress_id_type_address` INT(11) NOT NULL,
  PRIMARY KEY (`id_adress`),
  INDEX `fk_customer_adress_type_adress1_idx` (`type_adress_id_type_address` ASC),
  CONSTRAINT `fk_customer_adress_type_adress1`
    FOREIGN KEY (`type_adress_id_type_address`)
    REFERENCES `type_adress` (`id_type_address`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `is_located`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `is_located` ;

CREATE TABLE IF NOT EXISTS `is_located` (
  `customer_adress_id_adress` INT(11) NOT NULL,
  `customer_id_customer` INT(11) NOT NULL,
  PRIMARY KEY (`customer_adress_id_adress`, `customer_id_customer`),
  INDEX `fk_is_located_customer_adress1_idx` (`customer_adress_id_adress` ASC),
  INDEX `fk_is_located_customer1_idx` (`customer_id_customer` ASC),
  CONSTRAINT `fk_is_located_customer_adress1`
    FOREIGN KEY (`customer_adress_id_adress`)
    REFERENCES `customer_adress` (`id_adress`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_is_located_customer1`
    FOREIGN KEY (`customer_id_customer`)
    REFERENCES `customer` (`id_customer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `characteristics`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `characteristics` ;

CREATE TABLE IF NOT EXISTS `characteristics` (
  `id_technical` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(30) NOT NULL,
  `value` FLOAT NULL DEFAULT NULL,
  `description` LONGTEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id_technical`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `characteristics_assigned`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `characteristics_assigned` ;

CREATE TABLE IF NOT EXISTS `characteristics_assigned` (
  `characteristics_id_technical` INT(11) NOT NULL,
  `article_id_article` INT(11) NOT NULL,
  PRIMARY KEY (`characteristics_id_technical`, `article_id_article`),
  INDEX `fk_characteristics_assigned_characteristics1_idx` (`characteristics_id_technical` ASC),
  INDEX `fk_characteristics_assigned_article1_idx` (`article_id_article` ASC),
  CONSTRAINT `fk_characteristics_assigned_characteristics1`
    FOREIGN KEY (`characteristics_id_technical`)
    REFERENCES `characteristics` (`id_technical`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_characteristics_assigned_article1`
    FOREIGN KEY (`article_id_article`)
    REFERENCES `article` (`id_article`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Data for table `users`
-- -----------------------------------------------------

INSERT INTO `users` (`id`, `login`, `password`, `name`, `firstname`, `mail`, `phone`) VALUES (1, 'test', 'a94a8fe5ccb19ba61c4c0873d391e987982fbbd3', 'test', 'test', 'test@test.com', '0123456789');
INSERT INTO `users` (`id`, `login`, `password`, `name`, `firstname`, `mail`, `phone`) VALUES (2, 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'admin', 'admin', 'admin@admin.com', '0123456789');
INSERT INTO `users` (`id`, `login`, `password`, `name`, `firstname`, `mail`, `phone`) VALUES (3, 'tony', '39dfa55283318d31afe5a3ff4a0e3253e2045e43', 'evariste', 'tony', 'tony.evariste@gmail.com', '0123456789');
INSERT INTO `users` (`id`, `login`, `password`, `name`, `firstname`, `mail`, `phone`) VALUES (4, 'henri', '39dfa55283318d31afe5a3ff4a0e3253e2045e43', 'terrier', 'henri', 'henri.terrier@gmail.com', '0123456789');




-- -----------------------------------------------------
-- Data for table `article_category`
-- -----------------------------------------------------

INSERT INTO `article_category` (`name`) VALUES ('Enceinte HIFI');
INSERT INTO `article_category` (`name`) VALUES ('Cables Audio');
INSERT INTO `categoriarticle_categorye_product` (`name`) VALUES ('Amplificateurs');
INSERT INTO `article_category` (`name`) VALUES ('Lampes');


-- -----------------------------------------------------
-- Data for table `product`
-- -----------------------------------------------------

INSERT INTO `product` (`id`, `reference`, `name`, `designation`, `designation_complete`, `weight`, `picture`, `delivery`, `feature`, `Dimension`, `stock`, `categorie_product_id`) VALUES (1, 'ENC02', 'KUB', 'caisson de basse haut de gamme', 'Le caisson de basse KUB est un caisson de basses haut de gamme et ultra performant doté d\'un haut-parleur de 30.5cm et d\'une amplification Ultra-Class-D de 300W RMS montant à 900W en crête !', '33', NULL, 15, 'Puissance de sortie:900', '397x563x594', 20, 1);
