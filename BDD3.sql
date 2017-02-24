-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Table `language`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `language` ;

CREATE TABLE IF NOT EXISTS `language` (
  `idlanguage` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idlanguage`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `article_category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `article_category` ;

CREATE TABLE IF NOT EXISTS `article_category` (
  `id_article_category` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) CHARACTER SET 'utf8' NOT NULL,
  `code` INT(11) NOT NULL,
  `language_idlanguage` INT NOT NULL,
  PRIMARY KEY (`id_article_category`),
  INDEX `fk_article_category_language1_idx` (`language_idlanguage` ASC),
  CONSTRAINT `fk_article_category_language1`
    FOREIGN KEY (`language_idlanguage`)
    REFERENCES `language` (`idlanguage`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;



-- -----------------------------------------------------
-- Table `manufacturer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `manufacturer` ;

CREATE TABLE IF NOT EXISTS `manufacturer` (
  `id_manufacturer` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) CHARACTER SET 'utf8' NOT NULL,
  `adress` VARCHAR(50) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `postal_code` VARCHAR(25) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `city` VARCHAR(45) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `country` INT(5) NULL DEFAULT NULL,
  PRIMARY KEY (`id_manufacturer`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `article`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `article` ;

CREATE TABLE IF NOT EXISTS `article` (
  `id_article` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) CHARACTER SET 'utf8' NOT NULL,
  `reference` VARCHAR(20) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `description` LONGTEXT CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `quantity` INT(3) NOT NULL,
  `weight` FLOAT NULL DEFAULT NULL,
  `dimension` VARCHAR(50) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `picture` VARCHAR(50) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `manufacturer_id_manufacturer` INT(11) NOT NULL,
  `article_category_id_article_category` INT(11) NOT NULL,
  PRIMARY KEY (`id_article`),
  INDEX `fk_article_manufacturer1_idx` (`manufacturer_id_manufacturer` ASC),
  INDEX `fk_article_article_category1_idx` (`article_category_id_article_category` ASC),
  CONSTRAINT `fk_article_article_category1`
    FOREIGN KEY (`article_category_id_article_category`)
    REFERENCES `article_category` (`id_article_category`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_article_manufacturer1`
    FOREIGN KEY (`manufacturer_id_manufacturer`)
    REFERENCES `manufacturer` (`id_manufacturer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `customer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `customer` ;

CREATE TABLE IF NOT EXISTS `customer` (
  `id_customer` INT(11) NOT NULL AUTO_INCREMENT,
  `login` VARCHAR(25) CHARACTER SET 'utf8' NOT NULL,
  `password` VARCHAR(50) CHARACTER SET 'utf8' NOT NULL,
  `customer_name` VARCHAR(45) NULL,
  `email` VARCHAR(50) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `name` VARCHAR(25) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `firstname` VARCHAR(45) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `phone` INT(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id_customer`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `Price`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Price` ;

CREATE TABLE IF NOT EXISTS `Price` (
  `Price` INT NOT NULL,
  `article_id_article` INT(11) NOT NULL,
  `customer_id_customer` INT(11) NOT NULL,
  PRIMARY KEY (`article_id_article`, `customer_id_customer`),
  INDEX `fk_Price_customer1_idx` (`customer_id_customer` ASC),
  CONSTRAINT `fk_Price_article1`
    FOREIGN KEY (`article_id_article`)
    REFERENCES `article` (`id_article`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Price_customer1`
    FOREIGN KEY (`customer_id_customer`)
    REFERENCES `customer` (`id_customer`)
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
  `customer_id_customer` INT(11) NOT NULL,
  PRIMARY KEY (`id_order`),
  INDEX `fk_order_customer1_idx` (`customer_id_customer` ASC),
  CONSTRAINT `fk_order_customer1`
    FOREIGN KEY (`customer_id_customer`)
    REFERENCES `customer` (`id_customer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `order_detail`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `order_detail` ;

CREATE TABLE IF NOT EXISTS `order_detail` (
  `idorder_detail` INT NOT NULL,
  `order_id_order` INT(11) NOT NULL,
  `article_id_article` INT(11) NOT NULL,
  `quantity` INT(11) NOT NULL,
  PRIMARY KEY (`idorder_detail`, `order_id_order`),
  INDEX `fk_order_detail_article1_idx` (`article_id_article` ASC),
  INDEX `fk_order_detail_order1_idx` (`order_id_order` ASC),
  CONSTRAINT `fk_order_detail_article1`
    FOREIGN KEY (`article_id_article`)
    REFERENCES `article` (`id_article`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_detail_order1`
    FOREIGN KEY (`order_id_order`)
    REFERENCES `order` (`id_order`)
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
  `value` FLOAT NULL DEFAULT NULL,
  `article_id_article` INT(11) NOT NULL,
  PRIMARY KEY (`id_technical`),
  INDEX `fk_characteristics_article1_idx` (`article_id_article` ASC),
  CONSTRAINT `fk_characteristics_article1`
    FOREIGN KEY (`article_id_article`)
    REFERENCES `article` (`id_article`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `translate_characteristics`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `translate_characteristics` ;

CREATE TABLE IF NOT EXISTS `translate_characteristics` (
  `idtranslate_characteristics` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(45) NOT NULL,
  `characteristics_id_technical` INT(11) NOT NULL,
  `language_idlanguage` INT NOT NULL,
  PRIMARY KEY (`idtranslate_characteristics`, `language_idlanguage`),
  INDEX `fk_translate_characteristics_characteristics1_idx` (`characteristics_id_technical` ASC),
  INDEX `fk_translate_characteristics_language1_idx` (`language_idlanguage` ASC),
  CONSTRAINT `fk_translate_characteristics_characteristics1`
    FOREIGN KEY (`characteristics_id_technical`)
    REFERENCES `characteristics` (`id_technical`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_translate_characteristics_language1`
    FOREIGN KEY (`language_idlanguage`)
    REFERENCES `language` (`idlanguage`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `type_adress`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `type_adress` ;

CREATE TABLE IF NOT EXISTS `type_adress` (
  `id_type_address` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(25) CHARACTER SET 'utf8' NOT NULL,
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
  `adress` VARCHAR(50) CHARACTER SET 'utf8' NOT NULL,
  `postal_code` INT(11) NOT NULL,
  `city` VARCHAR(45) CHARACTER SET 'utf8' NOT NULL,
  `longitude` FLOAT NULL,
  `latitude` FLOAT NULL,
  `country` INT(5) NOT NULL,
  `type_adress_id_type_address` INT(11) NOT NULL,
  `customer_id_customer` INT(11) NOT NULL,
  PRIMARY KEY (`id_adress`),
  INDEX `fk_customer_adress_type_adress1_idx` (`type_adress_id_type_address` ASC),
  INDEX `fk_customer_adress_customer1_idx` (`customer_id_customer` ASC),
  CONSTRAINT `fk_customer_adress_type_adress1`
    FOREIGN KEY (`type_adress_id_type_address`)
    REFERENCES `type_adress` (`id_type_address`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_customer_adress_customer1`
    FOREIGN KEY (`customer_id_customer`)
    REFERENCES `customer` (`id_customer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;