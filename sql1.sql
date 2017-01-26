-- -----------------------------------------------------
-- Table `users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `users` ;

CREATE TABLE IF NOT EXISTS `users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `login` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `name` VARCHAR(45) NULL,
  `firstname` VARCHAR(45) NULL,
  `mail` VARCHAR(45) NULL,
  `phone` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `categorie_product`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `categorie_product` ;

CREATE TABLE IF NOT EXISTS `categorie_product` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `product`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `product` ;

CREATE TABLE IF NOT EXISTS `product` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `reference` VARCHAR(45) NOT NULL,
  `name` VARCHAR(45) NULL,
  `designation` VARCHAR(45) NULL,
  `designation_complete` LONGTEXT NULL,
  `weight` VARCHAR(45) NULL,
  `picture` VARCHAR(45) NULL,
  `delivery` INT NULL,
  `feature` LONGTEXT NULL,
  `Dimension` VARCHAR(45) NULL,
  `stock` INT NULL,
  `categorie_product_id` INT NOT NULL,
  PRIMARY KEY (`id`, `categorie_product_id`),
  INDEX `fk_product_categorie_product_idx` (`categorie_product_id` ASC),
  CONSTRAINT `fk_product_categorie_product`
    FOREIGN KEY (`categorie_product_id`)
    REFERENCES `categorie_product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `price`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `price` ;

CREATE TABLE IF NOT EXISTS `price` (
  `users_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  `price` INT NULL,
  PRIMARY KEY (`users_id`, `product_id`),
  INDEX `fk_users_has_product_product1_idx` (`product_id` ASC, `price` ASC),
  INDEX `fk_users_has_product_users1_idx` (`users_id` ASC),
  CONSTRAINT `fk_users_has_product_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_has_product_product1`
    FOREIGN KEY (`product_id` , `price`)
    REFERENCES `product` (`id` , `categorie_product_id`)
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
-- Data for table `categorie_product`
-- -----------------------------------------------------

INSERT INTO `categorie_product` (`id`, `name`) VALUES (1, 'Enceinte HIFI');
INSERT INTO `categorie_product` (`id`, `name`) VALUES (2, 'Cables Audio');
INSERT INTO `categorie_product` (`id`, `name`) VALUES (3, 'Amplificateurs');
INSERT INTO `categorie_product` (`id`, `name`) VALUES (4, 'Lampes');


-- -----------------------------------------------------
-- Data for table `product`
-- -----------------------------------------------------

INSERT INTO `product` (`id`, `reference`, `name`, `designation`, `designation_complete`, `weight`, `picture`, `delivery`, `feature`, `Dimension`, `stock`, `categorie_product_id`) VALUES (1, 'ENC02', 'KUB', 'caisson de basse haut de gamme', 'Le caisson de basse KUB est un caisson de basses haut de gamme et ultra performant doté d\'un haut-parleur de 30.5cm et d\'une amplification Ultra-Class-D de 300W RMS montant à 900W en crête !', '33', NULL, 15, 'Puissance de sortie:900', '397x563x594', 20, 1);

-- -----------------------------------------------------
-- Data for table `price`
-- -----------------------------------------------------

INSERT INTO `price` (`users_id`, `product_id`, `price`) VALUES (1, 1, 3000);
INSERT INTO `price` (`users_id`, `product_id`, `price`) VALUES (4, 1, 2000);

