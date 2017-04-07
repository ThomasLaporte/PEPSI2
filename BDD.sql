create database pepsi2 DEFAULT CHARACTER SET utf8  DEFAULT COLLATE utf8_unicode_ci ;


SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Table `parameters`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `parameters` (
  `id_parameters` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `value` VARCHAR(45) NULL,
  PRIMARY KEY (`id_parameters`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;

-- -----------------------------------------------------
-- Table `customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `customer` (
  `id_customer` INT(11) NOT NULL AUTO_INCREMENT,
  `login` VARCHAR(50) CHARACTER SET 'utf8' NOT NULL,
  `password` VARCHAR(50) CHARACTER SET 'utf8' NOT NULL,
  `customer_name` VARCHAR(50) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `email` VARCHAR(50) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `name` VARCHAR(50) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `phone` INT(20) NULL DEFAULT NULL,
  `mobile` INT(20) NULL DEFAULT NULL,
  `fax` INT(20) NULL DEFAULT NULL,
  `function` VARCHAR(25) CHARACTER SET 'utf8' NOT NULL,
  `admin` INT(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_customer`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `manufacturer`
-- -----------------------------------------------------
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
-- Table `language`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `language` (
  `id_language` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  PRIMARY KEY (`id_language`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `article_category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `article_category` (
  `code` INT(11) NOT NULL,
  `name` VARCHAR(50) CHARACTER SET 'utf8' NOT NULL,
  `description` LONGTEXT CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `language_id_language` INT(11) NOT NULL,
  PRIMARY KEY (`code`, `language_id_language`),
  INDEX `fk_article_category_language1_idx` (`language_id_language` ASC),
  CONSTRAINT `fk_article_category_language1`
    FOREIGN KEY (`language_id_language`)
    REFERENCES `language` (`id_language`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `article`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `article` (
  `id_article` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) CHARACTER SET 'utf8' NOT NULL,
  `reference` VARCHAR(20) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `quantity` INT(3) NOT NULL,
  `public_price` INT(6) NOT NULL,
  `weight` FLOAT NULL DEFAULT NULL,
  `dimension` VARCHAR(50) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `picture` VARCHAR(50) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `manufacturer_id_manufacturer` INT(11) NOT NULL,
  `article_category_code` INT(11) NOT NULL,
  `article_category_language_id_language` INT(11) NOT NULL,
  PRIMARY KEY (`id_article`),
  INDEX `fk_article_manufacturer1_idx` (`manufacturer_id_manufacturer` ASC),
  INDEX `fk_article_article_category1_idx` (`article_category_code` ASC, `article_category_language_id_language` ASC),
  CONSTRAINT `fk_article_manufacturer1`
    FOREIGN KEY (`manufacturer_id_manufacturer`)
    REFERENCES `manufacturer` (`id_manufacturer`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_article_article_category1`
    FOREIGN KEY (`article_category_code` , `article_category_language_id_language`)
    REFERENCES `article_category` (`code` , `language_id_language`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `price`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `price` (
  `fixe` FLOAT NOT NULL,
  `pourcentage` FLOAT NOT NULL,
  `customer_id_customer` INT(11) NOT NULL,
  `article_id_article` INT(11) NOT NULL,
  PRIMARY KEY (`customer_id_customer`, `article_id_article`),
  INDEX `fk_price_article1_idx` (`article_id_article` ASC),
  CONSTRAINT `fk_price_customer1`
    FOREIGN KEY (`customer_id_customer`)
    REFERENCES `customer` (`id_customer`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_price_article1`
    FOREIGN KEY (`article_id_article`)
    REFERENCES `article` (`id_article`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `characteristics`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `characteristics` (
  `id_characteristics` INT(11) NOT NULL AUTO_INCREMENT,
  `article_id_article` INT(11) NOT NULL,
  `description` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `specification` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `language_id_language` INT(11) NOT NULL,
  PRIMARY KEY (`id_characteristics`, `article_id_article`),
  INDEX `fk_characteristics_article1_idx` (`article_id_article` ASC),
  INDEX `fk_characteristics_language1_idx` (`language_id_language` ASC),
  CONSTRAINT `fk_characteristics_article1`
    FOREIGN KEY (`article_id_article`)
    REFERENCES `article` (`id_article`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_characteristics_language1`
    FOREIGN KEY (`language_id_language`)
    REFERENCES `language` (`id_language`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `type_adress`
-- -----------------------------------------------------
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
CREATE TABLE IF NOT EXISTS `customer_adress` (
  `id_adress` INT(11) NOT NULL AUTO_INCREMENT,
  `adress` VARCHAR(80) CHARACTER SET 'utf8' NOT NULL,
  `postal_code` INT(11) NOT NULL,
  `city` VARCHAR(50) CHARACTER SET 'utf8' NOT NULL,
  `longitude` VARCHAR(50) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `latitude` VARCHAR(50) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `country` INT(5) NOT NULL,
  `type_adress_id_type_address` INT(11) NOT NULL,
  `customer_id_customer` INT(11) NOT NULL,
  PRIMARY KEY (`id_adress`),
  INDEX `fk_customer_adress_type_adress1_idx` (`type_adress_id_type_address` ASC),
  INDEX `fk_customer_adress_customer1_idx` (`customer_id_customer` ASC),
  CONSTRAINT `fk_customer_adress_customer1`
    FOREIGN KEY (`customer_id_customer`)
    REFERENCES `customer` (`id_customer`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_customer_adress_type_adress1`
    FOREIGN KEY (`type_adress_id_type_address`)
    REFERENCES `type_adress` (`id_type_address`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `purchase`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `purchase` (
  `id_purchase` INT(11) NOT NULL AUTO_INCREMENT,
  `date_purchase` DATE NOT NULL,
  `customer_id_customer` INT(11) NOT NULL,
  PRIMARY KEY (`id_purchase`),
  INDEX `fk_purchase_customer1_idx` (`customer_id_customer` ASC),
  CONSTRAINT `fk_purchase_customer1`
    FOREIGN KEY (`customer_id_customer`)
    REFERENCES `customer` (`id_customer`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `purchase_detail`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `purchase_detail` (
  `id_purchase_detail` INT(11) NOT NULL AUTO_INCREMENT,
  `purchase_id_purchase` INT(11) NOT NULL,
  `article_id_article` INT(11) NOT NULL,
  `quantity` INT(11) NOT NULL,
  PRIMARY KEY (`id_purchase_detail`, `purchase_id_purchase`),
  INDEX `fk_order_detail_article1_idx` (`article_id_article` ASC),
  INDEX `fk_purchase_detail_purchase1_idx` (`purchase_id_purchase` ASC),
  CONSTRAINT `fk_order_detail_article1`
    FOREIGN KEY (`article_id_article`)
    REFERENCES `article` (`id_article`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_purchase_detail_purchase1`
    FOREIGN KEY (`purchase_id_purchase`)
    REFERENCES `purchase` (`id_purchase`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `pays`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pays` (
  `id` SMALLINT(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `code` INT(3) NOT NULL,
  `alpha2` VARCHAR(2) NOT NULL,
  `alpha3` VARCHAR(3) NOT NULL,
  `nom_en_gb` VARCHAR(45) NOT NULL,
  `nom_fr_fr` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `alpha2` (`alpha2` ASC),
  UNIQUE INDEX `alpha3` (`alpha3` ASC),
  UNIQUE INDEX `code_unique` (`code` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


INSERT INTO `pays` (`id`, `code`, `alpha2`, `alpha3`, `nom_en_gb`, `nom_fr_fr`) VALUES
(1, 4, 'AF', 'AFG', 'Afghanistan', 'Afghanistan'),
(2, 8, 'AL', 'ALB', 'Albania', 'Albanie'),
(3, 10, 'AQ', 'ATA', 'Antarctica', 'Antarctique'),
(4, 12, 'DZ', 'DZA', 'Algeria', 'Algérie'),
(5, 16, 'AS', 'ASM', 'American Samoa', 'Samoa Américaines'),
(6, 20, 'AD', 'AND', 'Andorra', 'Andorre'),
(7, 24, 'AO', 'AGO', 'Angola', 'Angola'),
(8, 28, 'AG', 'ATG', 'Antigua and Barbuda', 'Antigua-et-Barbuda'),
(9, 31, 'AZ', 'AZE', 'Azerbaijan', 'Azerbaïdjan'),
(10, 32, 'AR', 'ARG', 'Argentina', 'Argentine'),
(11, 36, 'AU', 'AUS', 'Australia', 'Australie'),
(12, 40, 'AT', 'AUT', 'Austria', 'Autriche'),
(13, 44, 'BS', 'BHS', 'Bahamas', 'Bahamas'),
(14, 48, 'BH', 'BHR', 'Bahrain', 'Bahreïn'),
(15, 50, 'BD', 'BGD', 'Bangladesh', 'Bangladesh'),
(16, 51, 'AM', 'ARM', 'Armenia', 'Arménie'),
(17, 52, 'BB', 'BRB', 'Barbados', 'Barbade'),
(18, 56, 'BE', 'BEL', 'Belgium', 'Belgique'),
(19, 60, 'BM', 'BMU', 'Bermuda', 'Bermudes'),
(20, 64, 'BT', 'BTN', 'Bhutan', 'Bhoutan'),
(21, 68, 'BO', 'BOL', 'Bolivia', 'Bolivie'),
(22, 70, 'BA', 'BIH', 'Bosnia and Herzegovina', 'Bosnie-Herzégovine'),
(23, 72, 'BW', 'BWA', 'Botswana', 'Botswana'),
(24, 74, 'BV', 'BVT', 'Bouvet Island', 'Île Bouvet'),
(25, 76, 'BR', 'BRA', 'Brazil', 'Brésil'),
(26, 84, 'BZ', 'BLZ', 'Belize', 'Belize'),
(27, 86, 'IO', 'IOT', 'British Indian Ocean Territory', 'Territoire Britannique de l''Océan Indien'),
(28, 90, 'SB', 'SLB', 'Solomon Islands', 'Îles Salomon'),
(29, 92, 'VG', 'VGB', 'British Virgin Islands', 'Îles Vierges Britanniques'),
(30, 96, 'BN', 'BRN', 'Brunei Darussalam', 'Brunéi Darussalam'),
(31, 100, 'BG', 'BGR', 'Bulgaria', 'Bulgarie'),
(32, 104, 'MM', 'MMR', 'Myanmar', 'Myanmar'),
(33, 108, 'BI', 'BDI', 'Burundi', 'Burundi'),
(34, 112, 'BY', 'BLR', 'Belarus', 'Bélarus'),
(35, 116, 'KH', 'KHM', 'Cambodia', 'Cambodge'),
(36, 120, 'CM', 'CMR', 'Cameroon', 'Cameroun'),
(37, 124, 'CA', 'CAN', 'Canada', 'Canada'),
(38, 132, 'CV', 'CPV', 'Cape Verde', 'Cap-vert'),
(39, 136, 'KY', 'CYM', 'Cayman Islands', 'Îles Caïmanes'),
(40, 140, 'CF', 'CAF', 'Central African', 'République Centrafricaine'),
(41, 144, 'LK', 'LKA', 'Sri Lanka', 'Sri Lanka'),
(42, 148, 'TD', 'TCD', 'Chad', 'Tchad'),
(43, 152, 'CL', 'CHL', 'Chile', 'Chili'),
(44, 156, 'CN', 'CHN', 'China', 'Chine'),
(45, 158, 'TW', 'TWN', 'Taiwan', 'Taïwan'),
(46, 162, 'CX', 'CXR', 'Christmas Island', 'Île Christmas'),
(47, 166, 'CC', 'CCK', 'Cocos (Keeling) Islands', 'Îles Cocos (Keeling)'),
(48, 170, 'CO', 'COL', 'Colombia', 'Colombie'),
(49, 174, 'KM', 'COM', 'Comoros', 'Comores'),
(50, 175, 'YT', 'MYT', 'Mayotte', 'Mayotte'),
(51, 178, 'CG', 'COG', 'Republic of the Congo', 'République du Congo'),
(52, 180, 'CD', 'COD', 'The Democratic Republic Of The Congo', 'République Démocratique du Congo'),
(53, 184, 'CK', 'COK', 'Cook Islands', 'Îles Cook'),
(54, 188, 'CR', 'CRI', 'Costa Rica', 'Costa Rica'),
(55, 191, 'HR', 'HRV', 'Croatia', 'Croatie'),
(56, 192, 'CU', 'CUB', 'Cuba', 'Cuba'),
(57, 196, 'CY', 'CYP', 'Cyprus', 'Chypre'),
(58, 203, 'CZ', 'CZE', 'Czech Republic', 'République Tchèque'),
(59, 204, 'BJ', 'BEN', 'Benin', 'Bénin'),
(60, 208, 'DK', 'DNK', 'Denmark', 'Danemark'),
(61, 212, 'DM', 'DMA', 'Dominica', 'Dominique'),
(62, 214, 'DO', 'DOM', 'Dominican Republic', 'République Dominicaine'),
(63, 218, 'EC', 'ECU', 'Ecuador', 'Équateur'),
(64, 222, 'SV', 'SLV', 'El Salvador', 'El Salvador'),
(65, 226, 'GQ', 'GNQ', 'Equatorial Guinea', 'Guinée Équatoriale'),
(66, 231, 'ET', 'ETH', 'Ethiopia', 'Éthiopie'),
(67, 232, 'ER', 'ERI', 'Eritrea', 'Érythrée'),
(68, 233, 'EE', 'EST', 'Estonia', 'Estonie'),
(69, 234, 'FO', 'FRO', 'Faroe Islands', 'Îles Féroé'),
(70, 238, 'FK', 'FLK', 'Falkland Islands', 'Îles (malvinas) Falkland'),
(71, 239, 'GS', 'SGS', 'South Georgia and the South Sandwich Islands', 'Géorgie du Sud et les Îles Sandwich du Sud'),
(72, 242, 'FJ', 'FJI', 'Fiji', 'Fidji'),
(73, 246, 'FI', 'FIN', 'Finland', 'Finlande'),
(74, 248, 'AX', 'ALA', 'Åland Islands', 'Îles Åland'),
(75, 250, 'FR', 'FRA', 'France', 'France'),
(76, 254, 'GF', 'GUF', 'French Guiana', 'Guyane Française'),
(77, 258, 'PF', 'PYF', 'French Polynesia', 'Polynésie Française'),
(78, 260, 'TF', 'ATF', 'French Southern Territories', 'Terres Australes Françaises'),
(79, 262, 'DJ', 'DJI', 'Djibouti', 'Djibouti'),
(80, 266, 'GA', 'GAB', 'Gabon', 'Gabon'),
(81, 268, 'GE', 'GEO', 'Georgia', 'Géorgie'),
(82, 270, 'GM', 'GMB', 'Gambia', 'Gambie'),
(83, 275, 'PS', 'PSE', 'Occupied Palestinian Territory', 'Territoire Palestinien Occupé'),
(84, 276, 'DE', 'DEU', 'Germany', 'Allemagne'),
(85, 288, 'GH', 'GHA', 'Ghana', 'Ghana'),
(86, 292, 'GI', 'GIB', 'Gibraltar', 'Gibraltar'),
(87, 296, 'KI', 'KIR', 'Kiribati', 'Kiribati'),
(88, 300, 'GR', 'GRC', 'Greece', 'Grèce'),
(89, 304, 'GL', 'GRL', 'Greenland', 'Groenland'),
(90, 308, 'GD', 'GRD', 'Grenada', 'Grenade'),
(91, 312, 'GP', 'GLP', 'Guadeloupe', 'Guadeloupe'),
(92, 316, 'GU', 'GUM', 'Guam', 'Guam'),
(93, 320, 'GT', 'GTM', 'Guatemala', 'Guatemala'),
(94, 324, 'GN', 'GIN', 'Guinea', 'Guinée'),
(95, 328, 'GY', 'GUY', 'Guyana', 'Guyana'),
(96, 332, 'HT', 'HTI', 'Haiti', 'Haïti'),
(97, 334, 'HM', 'HMD', 'Heard Island and McDonald Islands', 'Îles Heard et Mcdonald'),
(98, 336, 'VA', 'VAT', 'Vatican City State', 'Saint-Siège (état de la Cité du Vatican)'),
(99, 340, 'HN', 'HND', 'Honduras', 'Honduras'),
(100, 344, 'HK', 'HKG', 'Hong Kong', 'Hong-Kong'),
(101, 348, 'HU', 'HUN', 'Hungary', 'Hongrie'),
(102, 352, 'IS', 'ISL', 'Iceland', 'Islande'),
(103, 356, 'IN', 'IND', 'India', 'Inde'),
(104, 360, 'ID', 'IDN', 'Indonesia', 'Indonésie'),
(105, 364, 'IR', 'IRN', 'Islamic Republic of Iran', 'République Islamique d''Iran'),
(106, 368, 'IQ', 'IRQ', 'Iraq', 'Iraq'),
(107, 372, 'IE', 'IRL', 'Ireland', 'Irlande'),
(108, 376, 'IL', 'ISR', 'Israel', 'Israël'),
(109, 380, 'IT', 'ITA', 'Italy', 'Italie'),
(110, 384, 'CI', 'CIV', 'Côte d''Ivoire', 'Côte d''Ivoire'),
(111, 388, 'JM', 'JAM', 'Jamaica', 'Jamaïque'),
(112, 392, 'JP', 'JPN', 'Japan', 'Japon'),
(113, 398, 'KZ', 'KAZ', 'Kazakhstan', 'Kazakhstan'),
(114, 400, 'JO', 'JOR', 'Jordan', 'Jordanie'),
(115, 404, 'KE', 'KEN', 'Kenya', 'Kenya'),
(116, 408, 'KP', 'PRK', 'Democratic People''s Republic of Korea', 'République Populaire Démocratique de Corée'),
(117, 410, 'KR', 'KOR', 'Republic of Korea', 'République de Corée'),
(118, 414, 'KW', 'KWT', 'Kuwait', 'Koweït'),
(119, 417, 'KG', 'KGZ', 'Kyrgyzstan', 'Kirghizistan'),
(120, 418, 'LA', 'LAO', 'Lao People''s Democratic Republic', 'République Démocratique Populaire Lao'),
(121, 422, 'LB', 'LBN', 'Lebanon', 'Liban'),
(122, 426, 'LS', 'LSO', 'Lesotho', 'Lesotho'),
(123, 428, 'LV', 'LVA', 'Latvia', 'Lettonie'),
(124, 430, 'LR', 'LBR', 'Liberia', 'Libéria'),
(125, 434, 'LY', 'LBY', 'Libyan Arab Jamahiriya', 'Jamahiriya Arabe Libyenne'),
(126, 438, 'LI', 'LIE', 'Liechtenstein', 'Liechtenstein'),
(127, 440, 'LT', 'LTU', 'Lithuania', 'Lituanie'),
(128, 442, 'LU', 'LUX', 'Luxembourg', 'Luxembourg'),
(129, 446, 'MO', 'MAC', 'Macao', 'Macao'),
(130, 450, 'MG', 'MDG', 'Madagascar', 'Madagascar'),
(131, 454, 'MW', 'MWI', 'Malawi', 'Malawi'),
(132, 458, 'MY', 'MYS', 'Malaysia', 'Malaisie'),
(133, 462, 'MV', 'MDV', 'Maldives', 'Maldives'),
(134, 466, 'ML', 'MLI', 'Mali', 'Mali'),
(135, 470, 'MT', 'MLT', 'Malta', 'Malte'),
(136, 474, 'MQ', 'MTQ', 'Martinique', 'Martinique'),
(137, 478, 'MR', 'MRT', 'Mauritania', 'Mauritanie'),
(138, 480, 'MU', 'MUS', 'Mauritius', 'Maurice'),
(139, 484, 'MX', 'MEX', 'Mexico', 'Mexique'),
(140, 492, 'MC', 'MCO', 'Monaco', 'Monaco'),
(141, 496, 'MN', 'MNG', 'Mongolia', 'Mongolie'),
(142, 498, 'MD', 'MDA', 'Republic of Moldova', 'République de Moldova'),
(143, 500, 'MS', 'MSR', 'Montserrat', 'Montserrat'),
(144, 504, 'MA', 'MAR', 'Morocco', 'Maroc'),
(145, 508, 'MZ', 'MOZ', 'Mozambique', 'Mozambique'),
(146, 512, 'OM', 'OMN', 'Oman', 'Oman'),
(147, 516, 'NA', 'NAM', 'Namibia', 'Namibie'),
(148, 520, 'NR', 'NRU', 'Nauru', 'Nauru'),
(149, 524, 'NP', 'NPL', 'Nepal', 'Népal'),
(150, 528, 'NL', 'NLD', 'Netherlands', 'Pays-Bas'),
(151, 530, 'AN', 'ANT', 'Netherlands Antilles', 'Antilles Néerlandaises'),
(152, 533, 'AW', 'ABW', 'Aruba', 'Aruba'),
(153, 540, 'NC', 'NCL', 'New Caledonia', 'Nouvelle-Calédonie'),
(154, 548, 'VU', 'VUT', 'Vanuatu', 'Vanuatu'),
(155, 554, 'NZ', 'NZL', 'New Zealand', 'Nouvelle-Zélande'),
(156, 558, 'NI', 'NIC', 'Nicaragua', 'Nicaragua'),
(157, 562, 'NE', 'NER', 'Niger', 'Niger'),
(158, 566, 'NG', 'NGA', 'Nigeria', 'Nigéria'),
(159, 570, 'NU', 'NIU', 'Niue', 'Niué'),
(160, 574, 'NF', 'NFK', 'Norfolk Island', 'Île Norfolk'),
(161, 578, 'NO', 'NOR', 'Norway', 'Norvège'),
(162, 580, 'MP', 'MNP', 'Northern Mariana Islands', 'Îles Mariannes du Nord'),
(163, 581, 'UM', 'UMI', 'United States Minor Outlying Islands', 'Îles Mineures Éloignées des États-Unis'),
(164, 583, 'FM', 'FSM', 'Federated States of Micronesia', 'États Fédérés de Micronésie'),
(165, 584, 'MH', 'MHL', 'Marshall Islands', 'Îles Marshall'),
(166, 585, 'PW', 'PLW', 'Palau', 'Palaos'),
(167, 586, 'PK', 'PAK', 'Pakistan', 'Pakistan'),
(168, 591, 'PA', 'PAN', 'Panama', 'Panama'),
(169, 598, 'PG', 'PNG', 'Papua New Guinea', 'Papouasie-Nouvelle-Guinée'),
(170, 600, 'PY', 'PRY', 'Paraguay', 'Paraguay'),
(171, 604, 'PE', 'PER', 'Peru', 'Pérou'),
(172, 608, 'PH', 'PHL', 'Philippines', 'Philippines'),
(173, 612, 'PN', 'PCN', 'Pitcairn', 'Pitcairn'),
(174, 616, 'PL', 'POL', 'Poland', 'Pologne'),
(175, 620, 'PT', 'PRT', 'Portugal', 'Portugal'),
(176, 624, 'GW', 'GNB', 'Guinea-Bissau', 'Guinée-Bissau'),
(177, 626, 'TL', 'TLS', 'Timor-Leste', 'Timor-Leste'),
(178, 630, 'PR', 'PRI', 'Puerto Rico', 'Porto Rico'),
(179, 634, 'QA', 'QAT', 'Qatar', 'Qatar'),
(180, 638, 'RE', 'REU', 'Réunion', 'Réunion'),
(181, 642, 'RO', 'ROU', 'Romania', 'Roumanie'),
(182, 643, 'RU', 'RUS', 'Russian Federation', 'Fédération de Russie'),
(183, 646, 'RW', 'RWA', 'Rwanda', 'Rwanda'),
(184, 654, 'SH', 'SHN', 'Saint Helena', 'Sainte-Hélène'),
(185, 659, 'KN', 'KNA', 'Saint Kitts and Nevis', 'Saint-Kitts-et-Nevis'),
(186, 660, 'AI', 'AIA', 'Anguilla', 'Anguilla'),
(187, 662, 'LC', 'LCA', 'Saint Lucia', 'Sainte-Lucie'),
(188, 666, 'PM', 'SPM', 'Saint-Pierre and Miquelon', 'Saint-Pierre-et-Miquelon'),
(189, 670, 'VC', 'VCT', 'Saint Vincent and the Grenadines', 'Saint-Vincent-et-les Grenadines'),
(190, 674, 'SM', 'SMR', 'San Marino', 'Saint-Marin'),
(191, 678, 'ST', 'STP', 'Sao Tome and Principe', 'Sao Tomé-et-Principe'),
(192, 682, 'SA', 'SAU', 'Saudi Arabia', 'Arabie Saoudite'),
(193, 686, 'SN', 'SEN', 'Senegal', 'Sénégal'),
(194, 690, 'SC', 'SYC', 'Seychelles', 'Seychelles'),
(195, 694, 'SL', 'SLE', 'Sierra Leone', 'Sierra Leone'),
(196, 702, 'SG', 'SGP', 'Singapore', 'Singapour'),
(197, 703, 'SK', 'SVK', 'Slovakia', 'Slovaquie'),
(198, 704, 'VN', 'VNM', 'Vietnam', 'Viet Nam'),
(199, 705, 'SI', 'SVN', 'Slovenia', 'Slovénie'),
(200, 706, 'SO', 'SOM', 'Somalia', 'Somalie'),
(201, 710, 'ZA', 'ZAF', 'South Africa', 'Afrique du Sud'),
(202, 716, 'ZW', 'ZWE', 'Zimbabwe', 'Zimbabwe'),
(203, 724, 'ES', 'ESP', 'Spain', 'Espagne'),
(204, 732, 'EH', 'ESH', 'Western Sahara', 'Sahara Occidental'),
(205, 736, 'SD', 'SDN', 'Sudan', 'Soudan'),
(206, 740, 'SR', 'SUR', 'Suriname', 'Suriname'),
(207, 744, 'SJ', 'SJM', 'Svalbard and Jan Mayen', 'Svalbard etÎle Jan Mayen'),
(208, 748, 'SZ', 'SWZ', 'Swaziland', 'Swaziland'),
(209, 752, 'SE', 'SWE', 'Sweden', 'Suède'),
(210, 756, 'CH', 'CHE', 'Switzerland', 'Suisse'),
(211, 760, 'SY', 'SYR', 'Syrian Arab Republic', 'République Arabe Syrienne'),
(212, 762, 'TJ', 'TJK', 'Tajikistan', 'Tadjikistan'),
(213, 764, 'TH', 'THA', 'Thailand', 'Thaïlande'),
(214, 768, 'TG', 'TGO', 'Togo', 'Togo'),
(215, 772, 'TK', 'TKL', 'Tokelau', 'Tokelau'),
(216, 776, 'TO', 'TON', 'Tonga', 'Tonga'),
(217, 780, 'TT', 'TTO', 'Trinidad and Tobago', 'Trinité-et-Tobago'),
(218, 784, 'AE', 'ARE', 'United Arab Emirates', 'Émirats Arabes Unis'),
(219, 788, 'TN', 'TUN', 'Tunisia', 'Tunisie'),
(220, 792, 'TR', 'TUR', 'Turkey', 'Turquie'),
(221, 795, 'TM', 'TKM', 'Turkmenistan', 'Turkménistan'),
(222, 796, 'TC', 'TCA', 'Turks and Caicos Islands', 'Îles Turks et Caïques'),
(223, 798, 'TV', 'TUV', 'Tuvalu', 'Tuvalu'),
(224, 800, 'UG', 'UGA', 'Uganda', 'Ouganda'),
(225, 804, 'UA', 'UKR', 'Ukraine', 'Ukraine'),
(226, 807, 'MK', 'MKD', 'The Former Yugoslav Republic of Macedonia', 'L''ex-République Yougoslave de Macédoine'),
(227, 818, 'EG', 'EGY', 'Egypt', 'Égypte'),
(228, 826, 'GB', 'GBR', 'United Kingdom', 'Royaume-Uni'),
(229, 833, 'IM', 'IMN', 'Isle of Man', 'Île de Man'),
(230, 834, 'TZ', 'TZA', 'United Republic Of Tanzania', 'République-Unie de Tanzanie'),
(231, 840, 'US', 'USA', 'United States', 'États-Unis'),
(232, 850, 'VI', 'VIR', 'U.S. Virgin Islands', 'Îles Vierges des États-Unis'),
(233, 854, 'BF', 'BFA', 'Burkina Faso', 'Burkina Faso'),
(234, 858, 'UY', 'URY', 'Uruguay', 'Uruguay'),
(235, 860, 'UZ', 'UZB', 'Uzbekistan', 'Ouzbékistan'),
(236, 862, 'VE', 'VEN', 'Venezuela', 'Venezuela'),
(237, 876, 'WF', 'WLF', 'Wallis and Futuna', 'Wallis et Futuna'),
(238, 882, 'WS', 'WSM', 'Samoa', 'Samoa'),
(239, 887, 'YE', 'YEM', 'Yemen', 'Yémen'),
(240, 891, 'CS', 'SCG', 'Serbia and Montenegro', 'Serbie-et-Monténégro'),
(241, 894, 'ZM', 'ZMB', 'Zambia', 'Zambie');

INSERT INTO `language` (`id_language`, `name`) VALUES ('1', 'Français');
INSERT INTO `language` (`id_language`, `name`) VALUES ('2', 'English');

INSERT INTO `article_category` (`name`, `code`, `description`, `language_id_language`) VALUES ('Amplificateurs', '1', 'La réputation de notre gamme d\'amplificateurs n\'est plus à démontrer. Elle a marqué le siècle dernier et aborde le nouveau avec optimisme ! Vous êtes un(e) puriste, un(e) passionné(e)? Rejoignez la communauté des passionnés de la HIFI à son plus haut niveau et goûtez à l\'essence même du son le plus parfait.', '1');
INSERT INTO `article_category` (`name`, `code`, `description`, `language_id_language`) VALUES ('Amplifiers', '1', 'The reputation of our range of amplifiers is no longer to be demonstrated. She marked the last century and approaches the new with optimism! You are a purist, an enthusiast? Join the community of HIFI enthusiasts at its highest level and experience the essence of the most perfect sound.', '2');
INSERT INTO `article_category` (`name`, `code`, `description`, `language_id_language`) VALUES ('Enceintes', '2', 'Que ce soit pour de la Haute Fidélité ou dans une configuration Home Cinéma, le choix des enceintes est tout simplement primordial. Sans écarter l\'idée de les associer à d\'autres composants électroniques (en particulier l\'amplificateur), tous les spécialistes sont unanimes : les enceintes ont une durée de vie optimale.', '1');
INSERT INTO `article_category` (`name`, `code`, `description`, `language_id_language`) VALUES ('Speakers', '2', 'Whether for high fidelity or in a home cinema configuration, the choice of speakers is simply paramount. While the idea of combining them with other electronic components (in particular the amplifier), all specialists are unanimous: the speakers have an optimal life span.', '2');
INSERT INTO `article_category` (`name`, `code`, `description`, `language_id_language`) VALUES ('Câbles', '3', 'Les cables Spectasonic, ainsi que ceux fabriqués par nos confrères et disponibles sur notre site, ont été rigoureusement testé par nos techniciens avant leur commercialisation. Ils fournissent la qualité optimale sans nécessairement alourdir votre budget hifi.', '1');
INSERT INTO `article_category` (`name`, `code`, `description`, `language_id_language`) VALUES ('Cables', '3', 'Spectasonic cables, as well as those manufactured by our colleagues and available on our site, have been rigorously tested by our technicians before their commercialization. They provide the optimal quality without necessarily increasing your hifi budget.', '2');
INSERT INTO `article_category` (`name`, `code`, `description`, `language_id_language`) VALUES ('Lampes', '4', 'Les lampes d\'amplificateurs ont une certaine durée de vie. Nous vous proposons de bénéficier d\'une sélection de lampes définie par nos experts en fonction de leur rapport qualité / prix.', '1');
INSERT INTO `article_category` (`name`, `code`, `description`, `language_id_language`) VALUES ('Lamps', '4', 'Amplifier lamps have a certain lifespan. We offer you a selection of lamps defined by our experts according to their value for money.', '2');

INSERT INTO `manufacturer` (`name`, `adress`, `postal_code`, `city`, `country`) VALUES ('SPECTASONIC', '18 B Rue Gambetta', '59320', 'EMMERIN', '75');
INSERT INTO `manufacturer` (`name`, `country`) VALUES ('Chord Electronics', '228');
INSERT INTO `manufacturer` (`name`, `city`, `country`) VALUES ('SOVTEK', 'Saratov', '182');
INSERT INTO `manufacturer` (`name`, `city`, `country`) VALUES ('NORDOST', 'Holliston', '231');

INSERT INTO `article` (`id_article`,`name`,`reference`,`quantity`,`public_price`,`weight`,`dimension`,`picture`,`manufacturer_id_manufacturer`,`article_category_code`,`article_category_language_id_language`) VALUES (1,'SPECTALIZER','SPZ1',10,7657,NULL,'44 x 37 x 10',NULL,1,1,1);
INSERT INTO `article` (`id_article`,`name`,`reference`,`quantity`,`public_price`,`weight`,`dimension`,`picture`,`manufacturer_id_manufacturer`,`article_category_code`,`article_category_language_id_language`) VALUES (2,'SPECTALIZERII','SPZ2',10,10257,NULL,'45 x 39 x 15',NULL,1,1,1);
INSERT INTO `article` (`id_article`,`name`,`reference`,`quantity`,`public_price`,`weight`,`dimension`,`picture`,`manufacturer_id_manufacturer`,`article_category_code`,`article_category_language_id_language`) VALUES (3,'SPECTALIZERIII','SPZ3',10,5880,NULL,'40 x 32 x 12',NULL,1,1,1);
INSERT INTO `article` (`id_article`,`name`,`reference`,`quantity`,`public_price`,`weight`,`dimension`,`picture`,`manufacturer_id_manufacturer`,`article_category_code`,`article_category_language_id_language`) VALUES (4,'ALTABOR','ENC01',10,6242,NULL,' 22 x 99 x 35',NULL,1,2,1);
INSERT INTO `article` (`id_article`,`name`,`reference`,`quantity`,`public_price`,`weight`,`dimension`,`picture`,`manufacturer_id_manufacturer`,`article_category_code`,`article_category_language_id_language`) VALUES (5,'KUB','ENC02',10,3055,NULL,'',NULL,1,2,1);
INSERT INTO `article` (`id_article`,`name`,`reference`,`quantity`,`public_price`,`weight`,`dimension`,`picture`,`manufacturer_id_manufacturer`,`article_category_code`,`article_category_language_id_language`) VALUES (6,'ANTHEM 12','CANT10',10,283,NULL,'2 x 1m',NULL,2,3,1);
INSERT INTO `article` (`id_article`,`name`,`reference`,`quantity`,`public_price`,`weight`,`dimension`,`picture`,`manufacturer_id_manufacturer`,`article_category_code`,`article_category_language_id_language`) VALUES (7,'ANTHEM 11','CANT11',10,232,NULL,'2 x 1m',NULL,2,3,1);
INSERT INTO `article` (`id_article`,`name`,`reference`,`quantity`,`public_price`,`weight`,`dimension`,`picture`,`manufacturer_id_manufacturer`,`article_category_code`,`article_category_language_id_language`) VALUES (8,'ANTHEM 10','CANT12',10,241,NULL,'2 x 2m',NULL,2,3,1);
INSERT INTO `article` (`id_article`,`name`,`reference`,`quantity`,`public_price`,`weight`,`dimension`,`picture`,`manufacturer_id_manufacturer`,`article_category_code`,`article_category_language_id_language`) VALUES (9,'WILDLIGHT','CAB11',10,113,NULL,'2 X 2m',NULL,4,3,1);
INSERT INTO `article` (`id_article`,`name`,`reference`,`quantity`,`public_price`,`weight`,`dimension`,`picture`,`manufacturer_id_manufacturer`,`article_category_code`,`article_category_language_id_language`) VALUES (10,'CM07','CAB01',10,290,NULL,'2 x 1m',NULL,1,3,1);
INSERT INTO `article` (`id_article`,`name`,`reference`,`quantity`,`public_price`,`weight`,`dimension`,`picture`,`manufacturer_id_manufacturer`,`article_category_code`,`article_category_language_id_language`) VALUES (11,'CM04','CAB02',10,120,NULL,'2 X 2m',NULL,1,3,1);
INSERT INTO `article` (`id_article`,`name`,`reference`,`quantity`,`public_price`,`weight`,`dimension`,`picture`,`manufacturer_id_manufacturer`,`article_category_code`,`article_category_language_id_language`) VALUES (12,'SPECTACNX','CAB03',10,280,NULL,'2 x 8m',NULL,1,3,1);
INSERT INTO `article` (`id_article`,`name`,`reference`,`quantity`,`public_price`,`weight`,`dimension`,`picture`,`manufacturer_id_manufacturer`,`article_category_code`,`article_category_language_id_language`) VALUES (13,'SOV12AX7WA','SOV2A3',10,21,NULL,'',NULL,3,4,1);
INSERT INTO `article` (`id_article`,`name`,`reference`,`quantity`,`public_price`,`weight`,`dimension`,`picture`,`manufacturer_id_manufacturer`,`article_category_code`,`article_category_language_id_language`) VALUES (14,'OV6550WE','SOV2AOV',10,51,NULL,'',NULL,3,4,1);

INSERT INTO `characteristics` (`id_characteristics`,`article_id_article`,`description`,`specification`,`language_id_language`) VALUES (1,1,'Plus petit, plus fort, plus que parfait et moins cher ! Le tout nouvel amplificateur multimédia, la puissance de la gamme Spectalizer alliée aux nouveautés les plus en point du moment.\nL\'architecture Push Pull UHC MOS a été améliorée faisant de notre nouvel ampli le phare de notre gamme. Du côté connectique: rien à redire puisque tous les types de connexion sont présents.\nEnfin, le design n\'a pas été oublié et l\'on ne pourra plus rien reprocher à Spectasonic sur ce point.',NULL,1);
INSERT INTO `characteristics` (`id_characteristics`,`article_id_article`,`description`,`specification`,`language_id_language`) VALUES (2,2,'Le SPECTALIZER II est le produit phase de SPECTASONIC.\nVéritable légende de la stéréo, l\'ampli intégré PMA-2010AE est équipé d\'un circuit d\'alimentation surdimensionné et se dote de diodes de redressement Schottky associées à des condensateurs de forte capacité pour un stockage et un transfert d\'énergie considérables. Avec ses étages de puissance simple Push-Pull UHC-MOS, le SPECTALIZER II restitue aussi bien le plus subtil solo de violon que le fortissimo le plus grandiose, point culminant d\'une oeuvre symphonique.',NULL,1);
INSERT INTO `characteristics` (`id_characteristics`,`article_id_article`,`description`,`specification`,`language_id_language`) VALUES (3,3,'Le SPECTALIZER III est le nouveau bébé de Marc Poinson, ingénieur et magicien du son.\nQualité de fabrication, finition exemplaire, composants de très haute volée, le SPECTALIZER III répond aux exigences des audiophiles les plus intransigeants en leur offrant un amplificateur très abouti digne des meilleures productions. A associer de préférence avec des enceintes haut de gamme au rendement élevé.\n\nDans sa version SPECTALIZER III E, notre amplificateur est dôté de deux sorties SPDIF pour l\'intégrer dans votre chaine de home cinéma.',NULL,1);
INSERT INTO `characteristics` (`id_characteristics`,`article_id_article`,`description`,`specification`,`language_id_language`) VALUES (4,4,'L\'enceinte haut de gamme ALTABOR se distingue grâce à  la conception de son tweeter débafflé. Le tweeter, ainsi isolé, offre une image sonore améliorée, une meilleure dispersion, et un son plus ample et plus naturel.\nLa conception exclusive dite « double dôme » du tweeter limite les distorsions provenant de la bobine dans les plus hautes fréquences. Le résultat élève le niveau de détail et de précision dans les fréquences les plus élevées, mais aussi, et surtout, dans la gamme de spectre audible.\nDéplacer ainsi le tweeter à l\'extérieur du coffret  offre plus d\'espace intérieur pour un troisième haut-parleur de graves. Ce haut-parleur supplémentaire permet à l\'ALTABOR d\'avoir des basses plus puissantes, de réduire la distorsion et d\'étendre la réponse dans le grave - quel que soit le niveau sonore auquel vous aimez écouter.',NULL,1);
INSERT INTO `characteristics` (`id_characteristics`,`article_id_article`,`description`,`specification`,`language_id_language`) VALUES (5,5,'Le caisson de basse KUB est un caisson de basses haut de gamme et ultra performant doté d\'un haut-parleur de 30.5cm et d\'une amplification Ultra-Class-D de 300W RMS montant à 900W en crête !',NULL,1);
INSERT INTO `characteristics` (`id_characteristics`,`article_id_article`,`description`,`specification`,`language_id_language`) VALUES (6,6,'Crimson câble VEE 3 est une conception de câble pseudo-balanced/symmetrical. Il existe deux ensembles de multi-brins oxygène conducteurs en cuivre libres, un ensemble utilisé pour le signal et l\'autre ensemble pour le retour. Le conducteurs sont torsadés et sont isolés avec une faible densité, le polyéthylène à faible perte. Jaquette utiliser la configuration pseudo-équilibrée parce qu\'il porte des signaux de plus de précision que d\'un câble coaxial ou asymétrique simple. Le conducteurs sont maintenus en place avec deux vibrations entretoises de coton d\'amortissement. Réduire les vibrations internes et externes est extrêmement important pour la qualité du signal.',NULL,1);
INSERT INTO `characteristics` (`id_characteristics`,`article_id_article`,`description`,`specification`,`language_id_language`) VALUES (7,7,'Crimson câble VEE 3 est une conception de câble pseudo-balanced/symmetrical. Il existe deux ensembles de multi-brins oxygène conducteurs en cuivre libres, un ensemble utilisé pour le signal et l\'autre ensemble pour le retour. Le conducteurs sont torsadés et sont isolés avec une faible densité, le polyéthylène à faible perte. Jaquette utiliser la configuration pseudo-équilibrée parce qu\'il porte des signaux de plus de précision que d\'un câble coaxial ou asymétrique simple. Le conducteurs sont maintenus en place avec deux vibrations entretoises de coton d\'amortissement. Réduire les vibrations internes et externes est extrêmement important pour la qualité du signal.',NULL,1);
INSERT INTO `characteristics` (`id_characteristics`,`article_id_article`,`description`,`specification`,`language_id_language`) VALUES (8,8,'Crimson câble VEE 3 est une conception de câble pseudo-balanced/symmetrical. Il existe deux ensembles de multi-brins oxygène conducteurs en cuivre libres, un ensemble utilisé pour le signal et l\'autre ensemble pour le retour. Le conducteurs sont torsadés et sont isolés avec une faible densité, le polyéthylène à faible perte. Jaquette utiliser la configuration pseudo-équilibrée parce qu\'il porte des signaux de plus de précision que d\'un câble coaxial ou asymétrique simple. Le conducteurs sont maintenus en place avec deux vibrations entretoises de coton d\'amortissement. Réduire les vibrations internes et externes est extrêmement important pour la qualité du signal.',NULL,1);
INSERT INTO `characteristics` (`id_characteristics`,`article_id_article`,`description`,`specification`,`language_id_language`) VALUES (9,9,'Câble de modulation à gde vitesse de transmission, RCA plaqués or',NULL,1);
INSERT INTO `characteristics` (`id_characteristics`,`article_id_article`,`description`,`specification`,`language_id_language`) VALUES (10,10,'Conduction en fils de litz OFC RCA plaqués or ',NULL,1);
INSERT INTO `characteristics` (`id_characteristics`,`article_id_article`,`description`,`specification`,`language_id_language`) VALUES (11,11,'Conduction en fils de litz OFC RCA plaqués or ',NULL,1);
INSERT INTO `characteristics` (`id_characteristics`,`article_id_article`,`description`,`specification`,`language_id_language`) VALUES (12,12,'Conduction en fils de litz OFC RCA plaqués or ',NULL,1);
INSERT INTO `characteristics` (`id_characteristics`,`article_id_article`,`description`,`specification`,`language_id_language`) VALUES (13,13,'8 amplis sur 10 utilisent cette lampe qui bien qu\'économique n´en est pas moins efficace. Lampe multi-usage par définition, elle atteindra ses limites quand on lui demandera une grosse saturation.',NULL,1);
INSERT INTO `characteristics` (`id_characteristics`,`article_id_article`,`description`,`specification`,`language_id_language`) VALUES (14,14,'Si vous voulez upgrader votre ampli sur base EL34, n´hésitez pas une seconde :\nvous allez gagner en définition, graves plus précis, dynamique plus grande.\nInconvénients: ces lampes chauffent beaucoup, il faut les isoler. Des modifications importantes doivent être réalisées par un technicien agrée car ici nous sortons d´un simple réglage de bias.',NULL,1);
INSERT INTO `characteristics` (`id_characteristics`,`article_id_article`,`description`,`specification`,`language_id_language`) VALUES (15,1,'Smaller, stronger, more perfect and cheaper! The newest multimedia amplifier, the power of the Spectalizer range combined with the latest innovations of the moment.\nThe Push Pull UHC MOS architecture has been upgraded making our new amp the flagship of our range. On the connection side: nothing to complain about since all types of connection are present.\nFinally, the design has not been forgotten and we can no longer blame Spectasonic on this point.',NULL,2);
INSERT INTO `characteristics` (`id_characteristics`,`article_id_article`,`description`,`specification`,`language_id_language`) VALUES (16,2,'SPECTALIZER II is the phase product of SPECTASONIC.\nA true legend of stereo, the PMA-2010AE\'s built-in amplifier is equipped with an oversized power supply circuit and is equipped with Schottky rectifier diodes and high capacitance capacitors for considerable energy storage and transfer. With its single UHC-MOS Push-Pull power stages, the SPECTALIZER II brings together the finest violin solo as well as the most magnificent fortissimo, the culmination of a symphonic work.',NULL,2);
INSERT INTO `characteristics` (`id_characteristics`,`article_id_article`,`description`,`specification`,`language_id_language`) VALUES (17,3,'The SPECTALIZER III is the new baby of Marc Poinson, engineer and sound magician.\nQuality of manufacture, exemplary finishing, components of very high flight, the SPECTALIZER III meets the requirements of the most intransigent audiophiles by offering them a very successful amplifier worthy of the best productions. To be combined with high-end, high-performance speakers.\n\nIn its SPECTALIZER III E version, our amplifier is equipped with two SPDIF outputs to integrate it into your home theater system.',NULL,2);
INSERT INTO `characteristics` (`id_characteristics`,`article_id_article`,`description`,`specification`,`language_id_language`) VALUES (18,4,'The high-end ALTABOR speaker is distinguished by the design of its tweeter unfolded. The tweeter, thus isolated, offers an improved sound image, better dispersion, and a more ample and natural sound.\nThe tweeter\'s exclusive \"double dome\"\" design limits distortions from the coil in the highest frequencies. The result raises the level of detail and precision in the highest frequencies',NULL,2);
INSERT INTO `characteristics` (`id_characteristics`,`article_id_article`,`description`,`specification`,`language_id_language`) VALUES (19,5,'The KUB subwoofer is a high-end, high-performance subwoofer with a 30.5cm loudspeaker and 300W RMS Ultra-Class-D amplification up to 900W peak!',NULL,2);
INSERT INTO `characteristics` (`id_characteristics`,`article_id_article`,`description`,`specification`,`language_id_language`) VALUES (20,6,'Crimson cable VEE 3 is a pseudo-balanced / symmetrical cable design. There are two sets of free copper conductor oxygen strands, one set used for the signal and the other set for the return. The conductors are twisted and are insulated with low density, low loss polyethylene. Jacket use the pseudo-balanced configuration because it carries signals more accurate than a single coaxial or asymmetric cable. The conductors are held in place with two damping cotton spacers vibrations. Reducing internal and external vibration is extremely important for signal quality.',NULL,2);
INSERT INTO `characteristics` (`id_characteristics`,`article_id_article`,`description`,`specification`,`language_id_language`) VALUES (21,7,'Crimson cable VEE 3 is a pseudo-balanced / symmetrical cable design. There are two sets of free copper conductor oxygen strands, one set used for the signal and the other set for the return. The conductors are twisted and are insulated with low density, low loss polyethylene. Jacket use the pseudo-balanced configuration because it carries signals more accurate than a single coaxial or asymmetric cable. The conductors are held in place with two damping cotton spacers vibrations. Reducing internal and external vibration is extremely important for signal quality.',NULL,2);
INSERT INTO `characteristics` (`id_characteristics`,`article_id_article`,`description`,`specification`,`language_id_language`) VALUES (22,8,'Crimson cable VEE 3 is a pseudo-balanced / symmetrical cable design. There are two sets of free copper conductor oxygen strands, one set used for the signal and the other set for the return. The conductors are twisted and are insulated with low density, low loss polyethylene. Jacket use the pseudo-balanced configuration because it carries signals more accurate than a single coaxial or asymmetric cable. The conductors are held in place with two damping cotton spacers vibrations. Reducing internal and external vibration is extremely important for signal quality.',NULL,2);
INSERT INTO `characteristics` (`id_characteristics`,`article_id_article`,`description`,`specification`,`language_id_language`) VALUES (23,9,'High-speed transmission modulation cable, RCA gold-plated',NULL,2);
INSERT INTO `characteristics` (`id_characteristics`,`article_id_article`,`description`,`specification`,`language_id_language`) VALUES (24,10,'Conduction in gold plated RCA RCA wire',NULL,2);
INSERT INTO `characteristics` (`id_characteristics`,`article_id_article`,`description`,`specification`,`language_id_language`) VALUES (25,11,'Conduction in gold plated RCA RCA wire',NULL,2);
INSERT INTO `characteristics` (`id_characteristics`,`article_id_article`,`description`,`specification`,`language_id_language`) VALUES (26,12,'Conduction in gold plated RCA RCA wire',NULL,2);
INSERT INTO `characteristics` (`id_characteristics`,`article_id_article`,`description`,`specification`,`language_id_language`) VALUES (27,13,'8 out of 10 amps use this lamp which, although economical, is no less effective. Multi-purpose lamp by definition, it will reach its limits when it will be asked a big saturation.',NULL,2);
INSERT INTO `characteristics` (`id_characteristics`,`article_id_article`,`description`,`specification`,`language_id_language`) VALUES (28,14,'If you want to upgrade your amp on base EL34, do not hesitate a second:\nYou will win in definition, bass more accurate, bigger dynamic.\nDisadvantages: these lamps heat a lot, they must be isolated. Important modifications must be made by a certified technician because here we come out of a simple bias setting.',NULL,2);


INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (1,'vier.guillaume@enterprise.fr','0000','PASSION SON TELEVOG','vier.guillaume@enterprise.fr','VIER Guillaume',468420811,657574002,0,'Technicien',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (2,'drevon.nathan@free.fr','0000','MUSICSTOCK','drevon.nathan@free.fr','DREVON Nathan',186652832,637933258,0,'Commercial',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (3,'defecheureux.bernard@free.fr','0000','PINK NOISE','defecheureux.bernard@free.fr','DEFECHEUREUX Bernard',0,644459177,0,'Commercial',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (4,'bruyere.kathleen@free.fr','0000','SUNSET MUSIC','bruyere.kathleen@free.fr','BRUYERE kathleen ',456828716,634475995,0,'Commercial',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (5,'houlet.corne.anne.sophie@gmail.com','0000','AIX MUSIQUE','houlet.corne.anne.sophie@gmail.com','HOULET CORNE Anne Sophie',0,630760080,0,'Directeur',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (6,'huang.zhuoming@gmail.com','0000','HOMNI-MÉDIA','huang.zhuoming@gmail.com','HUANG Zhuoming',412555129,0,0,'Directeur',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (7,'cogez.diane@free.fr','0000','SAMBA MUSIQUE','cogez.diane@free.fr','COGEZ Diane',559589222,643632141,0,'Commercial',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (8,'bechet.christina@orange.fr','0000','AUDIO TECHNIQUE SERVICES','bechet.christina@orange.fr','BECHET Christina',351868669,675550438,0,'Responsable',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (9,'vimenet.joel@enterprise.fr','0000','PASSION SON S.D.E.L','vimenet.joel@enterprise.fr','VIMENET Joël',444810574,0,0,'Technicien',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (10,'bielokopitoff.elodie@orange.fr','0000','ASL FRANCE','bielokopitoff.elodie@orange.fr','BIELOKOPITOFF Elodie',0,645268020,0,'Responsable',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (11,'jacobi-delaine.edwige@gmail.com','0000','HOME CINÉ','jacobi-delaine.edwige@gmail.com','JACOBI-DELAINE Edwige',0,667457952,0,'Directeur',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (12,'insausti.jean-noel@gmail.com','0000','HOME CINÉMA VALENTIN','insausti.jean-noel@gmail.com','INSAUSTI Jean-Noël',276727876,0,0,'Directeur',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (13,'infante.celia@gmail.com','0000','HOME SOUND BEST','infante.celia@gmail.com','INFANTE Célia',231941772,630894020,0,'Directeur',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (14,'icard.rebecca@gmail.com','0000','HOMECINESON','icard.rebecca@gmail.com','ICARD Rébecca',0,0,0,'Directeur',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (15,'benard.soline@orange.fr','0000','AUDIO 2','benard.soline@orange.fr','BENARD Soline',224990534,0,0,'Responsable',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (16,'griot.emmanuelle@free.fr','0000','LA MAISON DU BATTEUR ROCK','griot.emmanuelle@free.fr','GRIOT Emmanuelle',324515607,0,0,'Directeur',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (17,'fialaire.clementine@free.fr','0000','MAGMA','fialaire.clementine@free.fr','FIALAIRE Clémentine',124436849,687890064,0,'Directeur',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (18,'ferre.michel@free.fr','0000','MATOS PRO ST REMY','ferre.michel@free.fr','FERRE Michel',166445427,686003636,0,'Commercial',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (19,'ferrard.caroline@free.fr','0000','MBS PRODUCTION','ferrard.caroline@free.fr','FERRARD Caroline',120769015,673295454,0,'Commercial',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (20,'ferlin.jean.michel@free.fr','0000','MEDIATONE','ferlin.jean.michel@free.fr','FERLIN JEAN MICHEL',174049959,0,0,'Commercial',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (21,'faraj.noura@free.fr','0000','MG CONCEPT','faraj.noura@free.fr','FARAJ Noura',127932149,622004455,0,'Commercial',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (22,'fabrizi.justine@free.fr','0000','MICHEL MUSIQUE','fabrizi.justine@free.fr','FABRIZI Justine',128887692,633152158,0,'Commercial',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (23,'eme.charlene@free.fr','0000','MK2 AUDIO','eme.charlene@free.fr','EME Charlène',151927303,0,0,'Commercial',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (24,'el.bannoudi.leila@free.fr','0000','MSCI','el.bannoudi.leila@free.fr','EL BANNOUDI Leila',153231073,683443204,0,'Commercial',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (25,'yu.fang@enterprise.fr','0000','PASSION SON CHARVET','yu.fang@enterprise.fr','YU Fang',447218035,678600600,0,'Technicien',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (26,'varambon.nicolas@enterprise.fr','0000','HOME CINE AVEC','varambon.nicolas@enterprise.fr','VARAMBON Nicolas',430936795,619079293,0,'Technicien',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (27,'jacquemn.bruno@gmail.com','0000','HITECH AUDIO VIDÉO','jacquemn.bruno@gmail.com','JACQUEMN Bruno',328796151,624051315,0,'Directeur',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (28,'jacquard.sophie@gmail.com','0000','HMP AUDIO','jacquard.sophie@gmail.com','JACQUARD Sophie',362827024,685523927,0,'Directeur',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (29,'hinaut.joel@gmail.com','0000','VIDÉO LASER MAX','hinaut.joel@gmail.com','HINAUT JOEL',364939235,615011299,0,'Directeur',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (30,'bienaime.lucas@orange.fr','0000','ASL ELECTRO','bienaime.lucas@orange.fr','BIENAIME Lucas',188703410,650713813,0,'Responsable',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (31,'jacquet.guillaume@gmail.com','0000','HIFISSIMO','jacquet.guillaume@gmail.com','JACQUET Guillaume',0,641264072,0,'Directeur',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (32,'dehu.gerard@free.fr','0000','PAVILLON MUSICAL','dehu.gerard@free.fr','DEHU Gerard',125689760,659736411,0,'Commercial',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (33,'jager.caroline@gmail.com','0000','HIFIMAGE','jager.caroline@gmail.com','JAGER Caroline',376132652,0,0,'Directeur',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (34,'turra.marine@enterprise.fr','0000','HOME CINE DIGIPRO','turra.marine@enterprise.fr','TURRA Marine',480791980,0,0,'Technicien',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (35,'vinant.emmanuel@enterprise.fr','0000','PASSION SON NOUVELEC','vinant.emmanuel@enterprise.fr','VINANT Emmanuel',453193308,0,0,'Technicien',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (36,'young.louise@enterprise.fr','0000','PASSION SON COMPTOIR ELECTRONIQUE D\'ARMOR','young.louise@enterprise.fr','YOUNG Louise',441141372,0,449496363,'Technicien',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (37,'joao.laura@gmail.com','0000','HIFI-A-TUBES','joao.laura@gmail.com','JOAO Laura',312551665,0,0,'Directeur',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (38,'danh.thi.mam@free.fr','0000','PLAY','danh.thi.mam@free.fr','DANH Thi Mam',138069349,0,0,'Commercial',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (39,'cartry.laura@free.fr','0000','SONOVENTE','cartry.laura@free.fr','CARTRY Laura',125319503,0,0,'Commercial',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (40,'begel.aurelien@orange.fr','0000','AUDIO 49','begel.aurelien@orange.fr','BEGEL Aurélien',0,686905634,0,'Responsable',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (41,'forcisi.julien@free.fr','0000','LYRIQUE','forcisi.julien@free.fr','FORCISI Julien',226108338,0,0,'Directeur',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (42,'bigot.marine@orange.fr','0000','ARIANE','bigot.marine@orange.fr','BIGOT Marine',117836747,0,0,'Responsable',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (43,'gaget.cosette@free.fr','0000','LOUISE VIDÉO','gaget.cosette@free.fr','GAGET Cosette',282635036,613701268,0,'Directeur',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (44,'corzetto.marina@free.fr','0000','QUATUOR MUSIC','corzetto.marina@free.fr','CORZETTO Marina',154627607,651737569,130553697,'Commercial',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (45,'chevillon.mireille@free.fr','0000','SENSATIONS','chevillon.mireille@free.fr','CHEVILLON Mireille',149078207,680540684,162032603,'Commercial',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (46,'jolas.joanny@gmail.com','0000','HIFI VAUDAIN','jolas.joanny@gmail.com','JOLAS Joanny',350601448,634792470,347785261,'Directeur',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (47,'tifest.samia@enterprise.fr','0000','HOME CINE ILLEL','tifest.samia@enterprise.fr','TIFEST Samia',459415021,0,429720568,'Technicien',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (48,'caillot.emmanuelle@free.fr','0000','BOURG HOME CINEMA','caillot.emmanuelle@free.fr','CAILLOT Emmanuelle',149078302,0,0,'Commercial',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (49,'bejuy.florence@orange.fr','0000','AUDIO PLUS SERVICES','bejuy.florence@orange.fr','BEJUY Florence',188960112,679266819,0,'Responsable',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (50,'bekkadja.salima@orange.fr','0000','AUDIO MARKETING FRANCE','bekkadja.salima@orange.fr','BEKKADJA Salima',124266502,0,0,'Responsable',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (51,'julliard.chloe@gmail.com','0000','HIFI KENMOGNE','julliard.chloe@gmail.com','JULLIARD Chloé',321294338,653656543,0,'Directeur',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (52,'joubert.celine@gmail.com','0000','HIFI RADIO MONTP\'S','joubert.celine@gmail.com','JOUBERT Céline',365533927,643461164,0,'Directeur',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (53,'cooke.vincent@free.fr','0000','RESONANCE','cooke.vincent@free.fr','COOKE  Vincent',186568218,631091386,0,'Commercial',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (54,'theves.marie@enterprise.fr','0000','HOME CINE MUSIKIT','theves.marie@enterprise.fr','THEVES Marie',0,655322509,0,'Technicien',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (55,'cassar.elke@free.fr','0000','SONOR PLUS','cassar.elke@free.fr','CASSAR Elke',0,611110881,0,'Commercial',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (56,'kali.ali.latifa@gmail.com','0000','HIFI CORNER','kali.ali.latifa@gmail.com','KALI ALI Latifa',366977702,671454198,0,'Directeur',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (57,'jung.martin@gmail.com','0000','HIFI HOUSE','jung.martin@gmail.com','JUNG MARTIN',359112151,0,0,'Directeur',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (58,'gouteux.damien@free.fr','0000','GOUTEUX - EXPERT','gouteux.damien@free.fr','GOUTEUX Damien',350916839,669712855,0,'Directeur',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (59,'karaca.aysu@gmail.com','0000','HIFI ALPES','karaca.aysu@gmail.com','KARACA Aysu',474733510,638647897,0,'Directeur',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (60,'dereydet.peggy@free.fr','0000','PLANET SONO','dereydet.peggy@free.fr','DE REYDET Peggy',168511306,0,0,'Commercial',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (61,'bissiere.sebastien@orange.fr','0000','AREITEC','bissiere.sebastien@orange.fr','BISSIERE Sébastien',177662233,657125817,127831519,'Responsable',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (62,'karakaya.goneil@gmail.com','0000','HIFI 38','karakaya.goneil@gmail.com','KARAKAYA Goneil',0,633119842,0,'Directeur',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (63,'ben.roger@orange.fr','0000','AUDIO ADDICT','ben.roger@orange.fr','BEN Roger',125493678,664622650,0,'Responsable',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (64,'berthet.lisa@orange.fr','0000','ATELIER HOPP','berthet.lisa@orange.fr','BERTHET Lisa',131095712,0,0,'Responsable',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (65,'terence.isabelle@enterprise.fr','0000','HOME CINE MUSIQUE ET TECHNIQUE','terence.isabelle@enterprise.fr','TERENCE Isabelle',436820799,0,0,'Technicien',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (66,'dubois.roger@free.fr','0000','MUSICAL SHOP','dubois.roger@free.fr','DUBOIS Roger',112381065,0,0,'Commercial',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (67,'vincent.eric@enterprise.fr','0000','PASSION SON NEHLIG','vincent.eric@enterprise.fr','VINCENT Eric',469715643,625858669,0,'Technicien',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (68,'thil.claude@enterprise.fr','0000','HOME CINE LTC INTERNATIONAL','thil.claude@enterprise.fr','THIL CLAUDE',0,630128957,0,'Technicien',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (69,'volat.eric@enterprise.fr','0000','PASSION SON LE GALL','volat.eric@enterprise.fr','VOLAT Eric',0,685311387,0,'Technicien',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (70,'carpentier.zohra@free.fr','0000','SOUND AND QUALITY','carpentier.zohra@free.fr','CARPENTIER Zohra',0,677202215,131454559,'Commercial',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (71,'kenmogne.loic@gmail.com','0000','HIFI 3000','kenmogne.loic@gmail.com','KENMOGNE Loïc',475057955,670224823,0,'Directeur',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (72,'ekholdt.fredrik@free.fr','0000','MUSIC 3000','ekholdt.fredrik@free.fr','EKHOLDT Fredrik',112439349,624964304,0,'Commercial',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (73,'durrenmath.delphine@free.fr','0000','MUSIC AUDIO SHOP','durrenmath.delphine@free.fr','DURRENMATH Delphine',168546590,0,0,'Commercial',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (74,'dumont.emilie@free.fr','0000','MUSIC HALL','dumont.emilie@free.fr','DUMONT Emilie',114044193,0,0,'Commercial',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (75,'dumazel.silvere@free.fr','0000','MUSIC HALL','dumazel.silvere@free.fr','DUMAZEL Silvère',170161445,653266673,180364964,'Commercial',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (76,'wingering.tharsice@enterprise.fr','0000','PASSION SON HALL DU MÉNAGER','wingering.tharsice@enterprise.fr','WINGERING THARSICE',477979047,0,0,'Technicien',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (77,'kerivel.jean.marc@gmail.com','0000','HDM CONNEXION','kerivel.jean.marc@gmail.com','KERIVEL Jean Marc',484564773,0,0,'Directeur',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (78,'allouchery.jean.claude@orange.fr','0000','AVANCE TECHNOLOGIES','allouchery.jean.claude@orange.fr','ALLOUCHERY JEAN CLAUDE',115790927,650813599,0,'Responsable',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (79,'coudurier.aveline@free.fr','0000','QUALITÉ SON ET VIDÉO','coudurier.aveline@free.fr','COUDURIER Aveline',177955371,621690395,126846748,'Commercial',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (80,'klimek.fanny@gmail.com','0000','HD LAND','klimek.fanny@gmail.com','KLIMEK Fanny',444081583,656305258,435873806,'Directeur',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (81,'barbier.marie.france@orange.fr','0000','AUDIO-TECHNICA SAS','barbier.marie.france@orange.fr','BARBIER Marie France',140103066,0,0,'Responsable',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (82,'blanc.camille@orange.fr','0000','ARECO','blanc.camille@orange.fr','BLANC Camille',147908102,0,0,'Responsable',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (83,'kluka.peter@gmail.com','0000','HAUTE QUALITÉ','kluka.peter@gmail.com','KLUKA Peter',425220278,0,476393590,'Directeur',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (84,'villette.max@enterprise.fr','0000','PASSION SON TEDDCFI','villette.max@enterprise.fr','VILLETTE MAX',462424956,685916169,466386304,'Technicien',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (85,'kolbasi.sandy.@gmail.com','0000','HAUTE DÉFINITION','kolbasi.sandy.@gmail.com','KOLBASI Sandy ',0,628717152,0,'Directeur',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (86,'guibert.guy@free.fr','0000','LA MAISON DE LA HAUTE FIDELITE','guibert.guy@free.fr','GUIBERT Guy',364405971,628871483,0,'Directeur',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (87,'blanchard.franck@orange.fr','0000','WOODBRASS','blanchard.franck@orange.fr','BLANCHARD Franck',118643326,0,0,'Commercial',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (88,'kreiss.patrick@gmail.com','0000','GUITARSHOP','kreiss.patrick@gmail.com','KREISS PATRICK',413313851,0,479862003,'Directeur',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (89,'davoine.claudine@free.fr','0000','PLATINE CENTER','davoine.claudine@free.fr','DAVOINE Claudine',141126967,676886674,120981765,'Commercial',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (90,'henot.sophie@gmail.com','0000','JM AUDIO','henot.sophie@gmail.com','HENOT Sophie',341346636,612610357,356763015,'Directeur',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (91,'ghareb.salima@free.fr','0000','LE STUDIO HIFI','ghareb.salima@free.fr','GHAREB Salima',230742150,0,236209434,'Directeur',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (92,'gaillet.mathlide@free.fr','0000','LINK HD','gaillet.mathlide@free.fr','GAILLET Mathlide',283114813,0,216590678,'Directeur',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (93,'heraney.alain@gmail.com','0000','LASER MUSIQUE','heraney.alain@gmail.com','HERANEY Alain',324720456,0,337760648,'Directeur',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (94,'langevin.marion@gmail.com','0000','FORUM ACOUSTIK','langevin.marion@gmail.com','LANGEVIN Marion',449032452,684704762,0,'Directeur',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (95,'lambepthod.laura@gmail.com','0000','GROUP DIGISON','lambepthod.laura@gmail.com','LAMBEPTHOD Laura',0,664603341,453057177,'Directeur',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (96,'lafosse.annick@gmail.com','0000','GROUP DIGISON','lafosse.annick@gmail.com','LAFOSSE Annick',470591465,0,433725559,'Directeur',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (97,'lafont-chevalier.jeanni@gmail.com','0000','GROUP DIGISON','lafont-chevalier.jeanni@gmail.com','LAFONT-CHEVALIER Jeanni',478109431,628101047,0,'Directeur',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (98,'laffitte.rigaud.aurelia@gmail.com','0000','GUITAR CENTER','laffitte.rigaud.aurelia@gmail.com','LAFFITTE RIGAUD Aurélia',464287915,617797416,0,'Directeur',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (99,'labat.veronique@gmail.com','0000','GUITAR LEGEND','labat.veronique@gmail.com','LABAT Véronique',419361210,669244036,0,'Directeur',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (100,'flores.sandoval.samuel.@free.fr','0000','MA HIFI','flores.sandoval.samuel.@free.fr','FLORES SANDOVAL Samuel ',140064544,649413040,0,'Directeur',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (101,'aubin.camille@orange.fr','0000','AUDISTRIB','aubin.camille@orange.fr','AUBIN Camille',116833980,610558039,0,'Responsable',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (102,'lapeyre.jean@gmail.com','0000','FOCAL SOLUTION','lapeyre.jean@gmail.com','LAPEYRE Jean',468635219,672839389,0,'Directeur',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (103,'lathuiliere.catherine@gmail.com','0000','FND POITIERS','lathuiliere.catherine@gmail.com','LATHUILIERE Catherine',483095971,644419867,448416739,'Directeur',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (104,'yang.fan.@enterprise.fr','0000','PASSION SON GUELEC','yang.fan.@enterprise.fr','YANG Fan ',454755884,676134249,478370538,'Technicien',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (105,'blassel.jean.claude@free.fr','0000','VOLUMES','blassel.jean.claude@free.fr','BLASSEL JEAN CLAUDE',0,643487243,167111391,'Commercial',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (106,'calluela.prescilia@free.fr','0000','STAR\'S MUSIC','calluela.prescilia@free.fr','CALLUELA Prescilia',143289939,662427445,0,'Commercial',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (107,'grizard.emmanuelle@free.fr','0000','LA MAISON DE LA HIFI','grizard.emmanuelle@free.fr','GRIZARD Emmanuelle',327026136,0,0,'Directeur',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (108,'benazet.melanie@orange.fr','0000','AUDIA/ ALGAM','benazet.melanie@orange.fr','BENAZET Mélanie',165576736,676874484,0,'Responsable',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (109,'thuraisingham.seth@enterprise.fr','0000','HOME CINE JEAMCO','thuraisingham.seth@enterprise.fr','THURAISINGHAM Seth ',464846075,638490878,418015553,'Technicien',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (110,'dumas.jean.luc@free.fr','0000','MUSIC HALL CENTER','dumas.jean.luc@free.fr','DUMAS JEAN LUC',0,628387070,176610164,'Commercial',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (111,'ducreux.sarah@free.fr','0000','MUSIC PRIVILÈGE','ducreux.sarah@free.fr','DUCREUX Sarah',0,611412616,143800341,'Commercial',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (112,'coppard.coralie@free.fr','0000','RESONANCE','coppard.coralie@free.fr','COPPARD Coralie',169497454,620945849,0,'Commercial',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (113,'charlier.sevim@free.fr','0000','SON ET MUSIQUE','charlier.sevim@free.fr','CHARLIER Sevim',136575395,629625765,129241958,'Commercial',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (114,'blanchon.loris@free.fr','0000','VOLUMES AUDIO VISUEL','blanchon.loris@free.fr','BLANCHON Loris',175171186,684460115,111755762,'Commercial',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (115,'lavorel.magaly@gmail.com','0000','FND DIGITALE','lavorel.magaly@gmail.com','LAVOREL Magaly',436777217,675161648,439230170,'Directeur',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (116,'benhami.raoudha@orange.fr','0000','AUDAX','benhami.raoudha@orange.fr','BENHAMI Raoudha',185061461,634242997,152130410,'Responsable',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (117,'le.bas.kristell@gmail.com','0000','FND DES TERNES','le.bas.kristell@gmail.com','LE BAS Kristell',0,0,0,'Directeur',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (118,'benkhacifa.amelle@orange.fr','0000','ATOMIX PRODUCTION','benkhacifa.amelle@orange.fr','BENKHACIFA Amelle',166779226,651037135,0,'Responsable',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (119,'vallee.eric@enterprise.fr','0000','HOME CINE DEHAN','vallee.eric@enterprise.fr','VALLEE Eric',472361005,653067155,425072571,'Technicien',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (120,'aubert.lucas@orange.fr','0000','AUVI ONE','aubert.lucas@orange.fr','AUBERT Lucas',157690167,636296408,175974047,'Responsable',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (121,'le.roux.lucien@gmail.com','0000','FEEL MUSIC','le.roux.lucien@gmail.com','LE ROUX Lucien',480669626,677571067,0,'Directeur',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (122,'le.gallo.jean.pierre@gmail.com','0000','FERRARD & CPIE','le.gallo.jean.pierre@gmail.com','LE GALLO JEAN PIERRE',462080931,0,0,'Directeur',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (123,'le.gallo.jean.pierre@gmail.com','0000','FIRODIL AUDIO PASSION','le.gallo.jean.pierre@gmail.com','LE GALLO JEAN PIERRE',0,652893873,478606986,'Directeur',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (124,'le.coz.guy@gmail.com','0000','FLOREL MUSIQUE','le.coz.guy@gmail.com','LE COZ Guy',446586571,656499666,418559185,'Directeur',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (125,'le.bonniec.alice@gmail.com','0000','PURE VIDEO PASSION','le.bonniec.alice@gmail.com','LE BONNIEC Alice',470625812,0,464936364,'Directeur',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (126,'gil.bejarano.julian.@free.fr','0000','LE PASSAGE','gil.bejarano.julian.@free.fr','GIL BEJARANO Julian ',232397045,677836709,0,'Directeur',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (127,'cordier.marie.françoise@free.fr','0000','RENAISSENS','cordier.marie.françoise@free.fr','CORDIER Marie Françoise',146188363,626052704,0,'Commercial',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (128,'boudot.frederic@free.fr','0000','LONGUENESSE VIDÉO','boudot.frederic@free.fr','BOUDOT Frédéric',116359940,0,174556117,'Commercial',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (129,'lecointre.michel@gmail.com','0000','DOREMI','lecointre.michel@gmail.com','LECOINTRE Michel',488327627,611239686,460181625,'Directeur',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (130,'lebon.gaelle@gmail.com','0000','DOREMI','lebon.gaelle@gmail.com','LEBON Gaelle',463424813,639989768,0,'Directeur',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (131,'lefebvre.florent@gmail.com','0000','EXPERT LE ROUX','lefebvre.florent@gmail.com','LEFEBVRE Florent',0,682069385,475214935,'Directeur',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (132,'trefel.maeva@enterprise.fr','0000','HOME CINE ELECTRONIQUE','trefel.maeva@enterprise.fr','TREFEL Maéva',0,673264563,443643045,'Technicien',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (133,'gazet.alexandre@free.fr','0000','LES ARTISANS DU SON','gazet.alexandre@free.fr','GAZET Alexandre',215661713,0,0,'Directeur',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (134,'leveques.sebastien@gmail.com','0000','ESPACE CANNEBIERE','leveques.sebastien@gmail.com','LEVEQUES Sébastien',458931845,636687495,0,'Directeur',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (135,'lhuillery.olivier@gmail.com','0000','ESPACE SON & LUMIERE','lhuillery.olivier@gmail.com','LHUILLERY Olivier',429591575,0,435515083,'Directeur',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (136,'letesse.pascal@gmail.com','0000','EVAS-SONO','letesse.pascal@gmail.com','LETESSE PASCAL',417928589,0,0,'Directeur',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (137,'lefevre.julie@gmail.com','0000','EXCEPTION MUSICALE','lefevre.julie@gmail.com','LEFEVRE Julie',428365499,0,0,'Directeur',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (138,'caudron.herve@free.fr','0000','SONO SHOP','caudron.herve@free.fr','CAUDRON Herve',476695020,0,0,'Commercial',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (139,'garcia.pascal@free.fr','0000','LINK HD','garcia.pascal@free.fr','GARCIA Pascal',0,621740218,0,'Directeur',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (140,'tombe.moulomno.flora@enterprise.fr','0000','HOME CINE HIFI MADONES','tombe.moulomno.flora@enterprise.fr','TOMBE MOULOMNO Flora',450119383,659767641,0,'Technicien',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (141,'colomies.audrey@free.fr','0000','MÉRIGNAC HIFI','colomies.audrey@free.fr','COLOMIES Audrey',189485885,621965667,0,'Commercial',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (142,'bleses.sandrine@free.fr','0000','VOIR & EMOUVOIR','bleses.sandrine@free.fr','BLESES Sandrine',188784535,0,148541599,'Commercial',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (143,'bury.albert@free.fr','0000','SUD MUSIQUE','bury.albert@free.fr','BURY Albert',0,620222448,118788210,'Commercial',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (144,'biensan.cecile.@orange.fr','0000','ASD','biensan.cecile.@orange.fr','BIENSAN Cécile ',169782213,633725609,161278077,'Responsable',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (145,'betaille.roger@orange.fr','0000','ATELIER 76','betaille.roger@orange.fr','BETAILLE Roger',124292074,618370450,0,'Responsable',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (146,'tourel.veronique@enterprise.fr','0000','HOME CINE GUYO','tourel.veronique@enterprise.fr','TOUREL Véronique',456120052,0,0,'Technicien',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (147,'llambi.camille@gmail.com','0000','ESPACE HIFI','llambi.camille@gmail.com','LLAMBI Camille',469538646,636103762,0,'Directeur',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (148,'li.jun@gmail.com','0000','ESPACE PIONEER','li.jun@gmail.com','LI Jun',481286083,681080231,478334486,'Directeur',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (149,'gomes.jose@free.fr','0000','LE MICROPHONE','gomes.jose@free.fr','GOMES JOSE',472335859,0,0,'Directeur',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (150,'locascio.gladys@gmail.com','0000','ESPACE CLAVIERS','locascio.gladys@gmail.com','LO CASCIO Gladys',0,0,431672029,'Directeur',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (151,'buissou.piotaz.charlene@free.fr','0000','SUD VIDÉO','buissou.piotaz.charlene@free.fr','BUISSOU PIOTAZ Charlène',171579513,0,0,'Commercial',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (152,'chambard.maxime@free.fr','0000','SON VIDÉO','chambard.maxime@free.fr','CHAMBARD Maxime',171777641,0,0,'Commercial',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (153,'guillon.christelle@gmail.com','0000','L\'AUDITORIUM EDEN','guillon.christelle@gmail.com','GUILLON Christelle',361252352,613751400,0,'Directeur',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (154,'bogossian.josephine@free.fr','0000','VISION SONORE','bogossian.josephine@free.fr','BOGOSSIAN Joséphine',154288089,659783034,169582703,'Commercial',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (155,'mago.justine@gmail.com','0000','EMPIRE-SONO','mago.justine@gmail.com','MAGO Justine',454755884,676134249,478370538,'Directeur',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (156,'magnenat.caroline@gmail.com','0000','ENERGYSON','magnenat.caroline@gmail.com','MAGNENAT Caroline',277979047,0,416093240,'Directeur',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (157,'madjere.claire@gmail.com','0000','ERIC HIFI','madjere.claire@gmail.com','MADJERE CLAIRE',277979047,651228123,444587401,'Directeur',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (158,'loyacono.laetitia@gmail.com','0000','ESPACE CINÉMA','loyacono.laetitia@gmail.com','LOYACONO Laetitia',437753704,685311387,0,'Directeur',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (159,'loisel.michele@gmail.com','0000','ESPACE CINÉMA LOISEL','loisel.michele@gmail.com','LOISEL Michèle',0,625858669,451805696,'Directeur',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (160,'viersac.cecilia@enterprise.fr','0000','PASSION SON TELE STEIN','viersac.cecilia@enterprise.fr','VIERSAC Cécilia',471720480,0,455836461,'Technicien',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (161,'maniglier.fabienne@gmail.com','0000','EFFECT ON LINE','maniglier.fabienne@gmail.com','MANIGLIER Fabienne',487428757,0,0,'Directeur',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (162,'manivil.priscillia.@gmail.com','0000','ECLIPSE','manivil.priscillia.@gmail.com','MANIVIL Priscillia ',447218035,678600600,455033731,'Directeur',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (163,'manijean.anne.laure@gmail.com','0000','ECRAN LOUNGE','manijean.anne.laure@gmail.com','MANIJEAN Anne Laure',0,671167049,449496363,'Directeur',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (164,'chamssidine.faino@free.fr','0000','SON ET VIDÉO','chamssidine.faino@free.fr','CHAMSSIDINE faîno',0,0,0,'Commercial',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (165,'mansion.matthieu@gmail.com','0000','DISTRIZIC','mansion.matthieu@gmail.com','MANSION Matthieu',182395664,628347064,0,'Directeur',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (166,'beaumel.jean.claude@orange.fr','0000','AUDIO TUBE TECH','beaumel.jean.claude@orange.fr','BEAUMEL Jean Claude',0,675601213,179490683,'Responsable',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (167,'barbet.cindy@orange.fr','0000','AUDIOCOM','barbet.cindy@orange.fr','BARBET Cindy',178144338,661366140,0,'Responsable',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (168,'dalloyeau.aude@free.fr','0000','PLAY','dalloyeau.aude@free.fr','DALLOYEAU Aude',0,613930815,117478920,'Commercial',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (169,'wattelier.emilie@enterprise.fr','0000','PASSION SON LABAT LIONEL','wattelier.emilie@enterprise.fr','WATTELIER Emilie',483797585,651228123,444587401,'Technicien',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (170,'berbagui.amir@orange.fr','0000','ATHOM','berbagui.amir@orange.fr','BERBAGUI Amir',210156332,0,0,'Responsable',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (171,'mantilliet.gael@gmail.com','0000','DISTRIBUTION MUSIC','mantilliet.gael@gmail.com','MANTILLIET Gael',219710570,616479457,426576493,'Directeur',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (172,'tirilly.florence@enterprise.fr','0000','HOME CINE HIFISSIMO','tirilly.florence@enterprise.fr','TIRILLY Florence',0,633687442,0,'Technicien',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (173,'auroux.sebastien@orange.fr','0000','AUDIOPOLE','auroux.sebastien@orange.fr','AUROUX Sébastien',0,0,172763083,'Responsable',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (174,'hogi.camille@gmail.com','0000','MUSIQUE PASSION','hogi.camille@gmail.com','HOGI Camille',349874769,0,0,'Directeur',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (175,'da.silva.teiga.sylvie@free.fr','0000','POINT FINAL','da.silva.teiga.sylvie@free.fr','DA SILVA TEIGA Sylvie',140477941,0,186887850,'Commercial',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (176,'zerroukhi.maurane@enterprise.fr','0000','CERTIFIE ISF PASSION CINÉMA CONCEPT','zerroukhi.maurane@enterprise.fr','ZERROUKHI Maurane',119710570,616479457,0,'Technicien',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (177,'ruchier.isabelle@enterprise.fr','0000','AUDIO IMAGE & ACOUSTIQUE','ruchier.isabelle@enterprise.fr','RUCHIER Isabelle',0,612086687,0,'Technicien',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (178,'rossignol.clement.@enterprise.fr','0000','AUDIO IMAGES & CIE','rossignol.clement.@enterprise.fr','ROSSIGNOL Clément ',133775928,679635215,0,'Technicien',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (179,'raynaud.valerie@enterprise.fr','0000','7EME SENS','raynaud.valerie@enterprise.fr','RAYNAUD Valérie',139754148,655388737,0,'Technicien',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (180,'ray.monique@enterprise.fr','0000','7ÈME SENS CINE','ray.monique@enterprise.fr','RAY Monique',128497692,614447294,0,'Technicien',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (181,'raulin.morgane@enterprise.fr','0000','A L\'UNISSON ELECTRONIQUE','raulin.morgane@enterprise.fr','RAULIN Morgane ',0,618351989,0,'Technicien',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (182,'rapin.marie.line@enterprise.fr','0000','ACOUSTIQUE SYSTEME','rapin.marie.line@enterprise.fr','RAPIN Marie Line',157170912,637811465,0,'Technicien',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (183,'ramassawmy.rubenarrio@enterprise.fr','0000','ADAM AUDIO CENTER','ramassawmy.rubenarrio@enterprise.fr','RAMASSAWMY Rubenarrio',188162841,0,466917035,'Technicien',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (184,'rahaoui.ahlame@enterprise.fr','0000','AFFIRMATIF','rahaoui.ahlame@enterprise.fr','RAHAOUI Ahlame',151120591,628832128,465241134,'Technicien',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (185,'raffin.florence@enterprise.fr','0000','ALPHA RADIOTÉLÉPHONIE','raffin.florence@enterprise.fr','RAFFIN Florence',153457854,660828813,427459460,'Technicien',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (186,'quelard.nicolas@enterprise.fr','0000','AMBOISE TECHNOLOGIES','quelard.nicolas@enterprise.fr','QUELARD Nicolas',116337443,670136473,478946562,'Technicien',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (187,'prome.christophe@enterprise.fr','0000','AMP-HD','prome.christophe@enterprise.fr','PROME Christophe',0,657374851,455995664,'Technicien',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (188,'privat.vincent@enterprise.fr','0000','AMPL\'HIFI','privat.vincent@enterprise.fr','PRIVAT Vincent',121567201,633988627,0,'Technicien',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (189,'pressiat.camille@enterprise.fr','0000','AMPLITUDE','pressiat.camille@enterprise.fr','PRESSIAT Camille',0,676020347,0,'Technicien',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (190,'pradat.geraldine@enterprise.fr','0000','ANNEMASSE MUSIQUE','pradat.geraldine@enterprise.fr','PRADAT Géraldine',150133058,649074857,462685720,'Technicien',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (191,'pomi.julien.@enterprise.fr','0000','ARCHITECTURE VISUELLE ET SONORE','pomi.julien.@enterprise.fr','POMI Julien ',157472198,0,452668092,'Technicien',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (192,'pill.anne.sophie@enterprise.fr','0000','ART IS','pill.anne.sophie@enterprise.fr','PILL Anne Sophie',0,626199906,0,'Technicien',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (193,'perrichot.carole@enterprise.fr','0000','AU COEUR DU SON','perrichot.carole@enterprise.fr','PERRICHOT Carole',183835956,610081955,430688680,'Technicien',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (194,'permale.beguene@enterprise.fr','0000','AUDIO FIDELITE','permale.beguene@enterprise.fr','PERMALE Béguène',130524778,641510267,0,'Technicien',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (195,'pereira.sandra@enterprise.fr','0000','AUDIO LABO','pereira.sandra@enterprise.fr','PEREIRA Sandra',112555014,0,446361619,'Technicien',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (196,'perbet.eva@enterprise.fr','0000','AUDIO PROJECTION','perbet.eva@enterprise.fr','PERBET Eva',154017822,630164353,449579132,'Technicien',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (197,'pelnier.clement@enterprise.fr','0000','AUDIO PROJECTION','pelnier.clement@enterprise.fr','PELNIER Clément',0,617517235,0,'Technicien',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (198,'pellerin.gaelle@enterprise.fr','0000','AUDIO SYNTHÈSE','pellerin.gaelle@enterprise.fr','PELLERIN Gaelle',126995545,617158027,0,'Technicien',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (199,'pedrocchi.nicolas@enterprise.fr','0000','AUDIO TOP','pedrocchi.nicolas@enterprise.fr','PEDROCCHI Nicolas',164686338,655359610,0,'Technicien',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (200,'payet.floriane@enterprise.fr','0000','AUDIO TOP','payet.floriane@enterprise.fr','PAYET Floriane',117970918,0,0,'Technicien',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (201,'patron.francoise@enterprise.fr','0000','AUDIOCONTACT','patron.francoise@enterprise.fr','PATRON Francoise',174781698,649817638,0,'Technicien',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (202,'papon.melanie@enterprise.fr','0000','AUDIOSOLUTIONS','papon.melanie@enterprise.fr','PAPON mélanie',135170967,0,0,'Technicien',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (203,'panczyk.amelie@enterprise.fr','0000','AUDIOSON','panczyk.amelie@enterprise.fr','PANCZYK Amélie',146800956,688678376,447208915,'Technicien',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (204,'palluau.bouvet.gerard-antoine@enterprise.fr','0000','AUDIOTEL','palluau.bouvet.gerard-antoine@enterprise.fr','PALLUAU BOUVET Gérard-Antoine',124085662,0,471476832,'Technicien',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (205,'ozanne.pascal@enterprise.fr','0000','AUDIOVENTE','ozanne.pascal@enterprise.fr','OZANNE Pascal',136568001,0,464001506,'Technicien',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (206,'otando.animbogo.johan@enterprise.fr','0000','AUDITORIUM DIJON','otando.animbogo.johan@enterprise.fr','OTANDO ANIMBOGO Johan',120318890,0,0,'Technicien',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (207,'olivier.julie@enterprise.fr','0000','AUDITORIUM EPINAY','olivier.julie@enterprise.fr','OLIVIER Julie',131847989,642764283,0,'Technicien',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (208,'offrant.lev.arcady@enterprise.fr','0000','AVANT PREMIERE','offrant.lev.arcady@enterprise.fr','OFFRANT Lev Arcady',187219000,652410454,0,'Technicien',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (209,'odobel.franck@enterprise.fr','0000','AVEC','odobel.franck@enterprise.fr','ODOBEL Franck',149765489,656376472,0,'Technicien',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (210,'occelly.emilie@enterprise.fr','0000','AVLS','occelly.emilie@enterprise.fr','OCCELLY Emilie',188006401,640351265,0,'Technicien',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (211,'nozay.damien@enterprise.fr','0000','BERLIOZ','nozay.damien@enterprise.fr','NOZAY Damien',182085751,615834899,461567128,'Technicien',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (212,'nigoul.elisa.@enterprise.fr','0000','BERLIOZ AUDIO CONSEIL','nigoul.elisa.@enterprise.fr','NIGOUL Elisa ',180890102,628831208,458270442,'Technicien',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (213,'nersessian.nathalie@enterprise.fr','0000','BEST HIFI MUSIC','nersessian.nathalie@enterprise.fr','NERSESSIAN Nathalie',175230202,0,0,'Technicien',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (214,'navarro.pierre@enterprise.fr','0000','BEST VIDEO','navarro.pierre@enterprise.fr','NAVARRO Pierre',0,656141691,0,'Technicien',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (215,'nasri.elodie@enterprise.fr','0000','BOOSTERPRICE','nasri.elodie@enterprise.fr','NASRI Elodie',176675820,665077855,476618875,'Technicien',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (216,'muriariu.anca@enterprise.fr','0000','BTG IMAGE & SON','muriariu.anca@enterprise.fr','Muriariu Anca',0,628200291,0,'Technicien',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (217,'mounier.anne.sophie@enterprise.fr','0000','CACTUS','mounier.anne.sophie@enterprise.fr','MOUNIER Anne Sophie',127191617,610702610,481558983,'Technicien',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (218,'motheau.nicolas@enterprise.fr','0000','CARREFOUR DU SON','motheau.nicolas@enterprise.fr','MOTHEAU Nicolas',113350326,672138335,0,'Technicien',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (219,'morisse.matilde@enterprise.fr','0000','CÉLIÉ TECHNIQUES','morisse.matilde@enterprise.fr','MORISSE Matilde',137623921,672478311,0,'Technicien',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (220,'moret.olivia@enterprise.fr','0000','CINE COURCHEVELE','moret.olivia@enterprise.fr','MORET Olivia',174891290,687309584,440123316,'Technicien',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (221,'moreno.antoine@enterprise.fr','0000','CINEMA PRO CONCEPT','moreno.antoine@enterprise.fr','MORENO Antoine',0,620041193,0,'Technicien',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (222,'morel.maelle@enterprise.fr','0000','CINEPASSION','morel.maelle@enterprise.fr','MOREL MAELLE',188009212,0,0,'Technicien',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (223,'morales.abaelle@enterprise.fr','0000','CLES MUSICALES','morales.abaelle@enterprise.fr','MORALES Abaelle',149370718,680074491,0,'Technicien',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (224,'moktdri.manon@gmail.com','0000','CNARIO','moktdri.manon@gmail.com','MOKTDRI Manon',188018400,610579248,484205965,'Technicien',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (225,'guyotot.thibaut@gmail.com','0000','COBRA AUDIO','guyotot.thibaut@gmail.com','GUYOTOT  Thibaut',0,665795707,322671087,'Directeur',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (226,'merchier.alain@gmail.com','0000','CTA','merchier.alain@gmail.com','MERCHIER ALAIN',139926063,0,454069693,'Technicien',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (227,'menard.regis@gmail.com','0000','DAILY MUSIC','menard.regis@gmail.com','MENARD Regis',137442498,680513262,0,'Technicien',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (228,'mclouglhin.malcom@gmail.com','0000','DAM ELECTRONICS','mclouglhin.malcom@gmail.com','Mc LOUGLHIN Malcom',180180693,0,0,'Technicien',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (229,'masson.pascal@gmail.com','0000','DB ACOUSTIQUE','masson.pascal@gmail.com','MASSON Pascal',135010196,0,417261649,'Technicien',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (230,'massez.elodie@gmail.com','0000','DECIBEL','massez.elodie@gmail.com','MASSEZ Elodie',122813423,614993137,440219889,'Directeur',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (231,'martin.laurie@gmail.com','0000','DECIBEL MEGAPRO','martin.laurie@gmail.com','MARTIN Laurie',133479300,652623426,0,'Directeur',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (232,'maroua.juliette@gmail.com','0000','DECIBEL MUSIQUE','maroua.juliette@gmail.com','MAROUA Juliette',169425315,653012168,437948108,'Directeur',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (233,'marin.alain@gmail.com','0000','DECORUM CINEMA','marin.alain@gmail.com','MARIN ALAIN',141736609,675788494,0,'Directeur',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (234,'margris.alexandre@gmail.com','0000','DEROUET','margris.alexandre@gmail.com','MARGRIS ALEXANDRE',158730660,638961109,441683879,'Directeur',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (235,'guizzardi.aline@gmail.com','0000','KOMPAKT HIFI','guizzardi.aline@gmail.com','GUIZZARDI Aline',315434331,658883639,325367141,'Directeur',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (236,'gouget.rachel@free.fr','0000','LASER EXPERIENCE','gouget.rachel@free.fr','GOUGET Rachel',373290952,659873991,355270894,'Directeur',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (237,'philipeau.aurelie@enterprise.fr','0000','MUSIC SERVICE','philipeau.aurelie@enterprise.fr','PHILIPEAU Aurélie',0,661853385,0,'Technicien',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (238,'ocampo.laetitia@enterprise.fr','0000','OCAMPO AUDIO','ocampo.laetitia@enterprise.fr','OCAMPO Laetitia',141063435,660619601,437622066,'Technicien',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (239,'gautry.simon@free.fr','0000','LINK HD','gautry.simon@free.fr','GAUTRY Simon',280856488,628114478,289325853,'Directeur',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (240,'herviou.david@gmail.com','0000','IN FINE AUDIO','herviou.david@gmail.com','HERVIOU David',337281230,685528340,0,'Directeur',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (241,'guillaumee.mathilde@free.fr','0000','L\'AUDITORIUM TOULOUSAIN','guillaumee.mathilde@free.fr','GUILLAUMEE Mathilde',321296395,666479053,312065132,'Directeur',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (242,'cazeaux.florent@free.fr','0000','SON VIDEO','cazeaux.florent@free.fr','CAZEAUX Florent',143859428,681903996,180672087,'Commercial',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (243,'creix.eniko@free.fr','0000','PROMOMUSIC','creix.eniko@free.fr','CREIX Enikö',180889245,662595763,0,'Commercial',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (244,'bermond.clara@orange.fr','0000','ATEX','bermond.clara@orange.fr','BERMOND Clara',146568368,647326862,121907231,'Responsable',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (245,'tardy.gaelle@enterprise.fr','0000','HOME CINE PILOTE ELECTRONIQUE','tardy.gaelle@enterprise.fr','TARDY Gaelle',445797084,611082082,415354572,'Technicien',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (246,'boubet.michel@free.fr','0000','UNIVERS SONS','boubet.michel@free.fr','BOUBET MICHEL',0,0,0,'Commercial',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (247,'delon.angelique@free.fr','0000','NEXT VISION','delon.angelique@free.fr','DELON Angélique',163688195,622666749,155837329,'Commercial',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (248,'bensalah.athini@orange.fr','0000','ATM MACHINERY','bensalah.athini@orange.fr','BENSALAH Athini',164643659,668582422,181015055,'Responsable',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (249,'dorlancourt.claude@free.fr','0000','MUSIK','dorlancourt.claude@free.fr','DORLANCOURT CLAUDE',175077493,667924959,0,'Commercial',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (250,'desplanques.françois-maxence@free.fr','0000','NEW MUSIC','desplanques.françois-maxence@free.fr','DESPLANQUES François-Maxence',127168007,0,166789300,'Commercial',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (251,'banz.lydie@orange.fr','0000','AUDIOPLANET','banz.lydie@orange.fr','BANZ LYDIE',120944006,0,183961631,'Responsable',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (252,'vermillon.marie.-.amandine@enterprise.fr','0000','CONNEXION VIDEOSON','vermillon.marie.-.amandine@enterprise.fr','VERMILLON Marie - Amandine',440324942,0,451176969,'Technicien',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (253,'cuffel.antonina@free.fr','0000','PROFIL SON','cuffel.antonina@free.fr','CUFFEL Antonina',129953712,630735921,0,'Commercial',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (254,'soubelet.emmanuelle@enterprise.fr','0000','EXPERT ODIELEC','soubelet.emmanuelle@enterprise.fr','SOUBELET Emmanuelle',418792718,0,0,'Technicien',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (255,'flandrin.vargnot.celine@free.fr','0000','MA HIFI','flandrin.vargnot.celine@free.fr','FLANDRIN  VARGNOT Céline',0,689869007,136380106,'Directeur',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (256,'soudan.fanny@enterprise.fr','0000','EXPERT MAGMA DISTRIBUTION','soudan.fanny@enterprise.fr','SOUDAN Fanny',285316066,689457382,472474828,'Technicien',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (257,'gorizian.meline@free.fr','0000','LASER EXPERIENCE','gorizian.meline@free.fr','GORIZIAN Meline',364476665,617567682,378708232,'Directeur',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (258,'antoine.christophe@orange.fr','0000','AUVITRAN SARL','antoine.christophe@orange.fr','ANTOINE Christophe',156153616,623536560,0,'Responsable',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (259,'ame.fabrice@orange.fr','0000','AVAB TRANSTECHNIK FRANCE','ame.fabrice@orange.fr','AME FABRICE',171072881,618897425,0,'Responsable',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (260,'donat.magnin.christine@free.fr','0000','NEW LOOP AUDIO','donat.magnin.christine@free.fr','DONAT MAGNIN Christine',182870774,618696164,186790922,'Commercial',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (261,'beurrier.fanny@orange.fr','0000','ATEIS','beurrier.fanny@orange.fr','BEURRIER Fanny',146386669,0,138823821,'Responsable',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (262,'belghafour.hadjira@orange.fr','0000','AUDIO LIGHT SYTEMS','belghafour.hadjira@orange.fr','BELGHAFOUR Hadjira',139708927,611025896,0,'Responsable',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (263,'hanzekovic.croatia@gmail.com','0000','KS AUDIOVISUEL','hanzekovic.croatia@gmail.com','HANZEKOVIC Croatia',0,679626983,310477432,'Directeur',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (264,'chandeze.jean.pierre@free.fr','0000','SON ET TECHNIQUE','chandeze.jean.pierre@free.fr','CHANDEZE Jean Pierre',188685539,689485457,111124725,'Commercial',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (265,'vandersippe.jean.marie@enterprise.fr','0000','HOME CINE COBRA SON','vandersippe.jean.marie@enterprise.fr','VANDERSIPPE JEAN MARIE',416845645,621371053,486084426,'Technicien',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (266,'biard.france@orange.fr','0000','ATARI','biard.france@orange.fr','BIARD France',133130140,635367299,176073544,'Responsable',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (267,'chaomleffel.cedric@free.fr','0000','SON ET TECHNIQUE','chaomleffel.cedric@free.fr','CHAOMLEFFEL Cédric',130717623,0,0,'Commercial',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (268,'bezzi.sonia@orange.fr','0000','ATC','bezzi.sonia@orange.fr','BEZZI Sonia',183597013,665245344,115090629,'Responsable',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (269,'dalboussiere.yoan@free.fr','0000','PLUGSQUARE','dalboussiere.yoan@free.fr','DALBOUSSIERE Yoan',120393326,617901935,113738742,'Commercial',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (270,'bourlet.jezabelle@free.fr','0000','TERRE DE SON','bourlet.jezabelle@free.fr','BOURLET Jézabelle',154581129,674321941,118640443,'Commercial',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (271,'verger.marie@enterprise.fr','0000','HOME CINE AUDIO VIDEO ELECTRONIQUE','verger.marie@enterprise.fr','VERGER Marie',428771165,669766234,0,'Technicien',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (272,'zeghida.soumia@enterprise.fr','0000','PASSION SON CELLIER (ETS)','zeghida.soumia@enterprise.fr','ZEGHIDA Soumia',482395664,628347064,447594585,'Technicien',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (273,'dubois.olivier@free.fr','0000','MUSICAVISION','dubois.olivier@free.fr','DUBOIS OLIVIER',178934043,0,183375429,'Commercial',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (274,'casabella.marie@free.fr','0000','SONOR PLUS','casabella.marie@free.fr','CASABELLA Marie',184027556,670702995,183744339,'Commercial',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (275,'coicaud.yann@free.fr','0000','SALON ACOUSTIQUE','coicaud.yann@free.fr','COICAUD Yann',169907917,673275966,130484723,'Commercial',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (276,'duchene.sebastien@free.fr','0000','MUSIC-SHOPPING','duchene.sebastien@free.fr','DUCHENE Sébastien',180607440,613971692,0,'Commercial',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (277,'germain.cedric@free.fr','0000','LECOINTRE SON','germain.cedric@free.fr','GERMAIN Cedric',273677804,0,234574829,'Directeur',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (278,'suaton.nicolas@enterprise.fr','0000','EXPERT COTTEL ELECTRONIQUE','suaton.nicolas@enterprise.fr','SUATON Nicolas',0,0,0,'Technicien',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (279,'story.thibaut@enterprise.fr','0000','EXPERT FONTANELLA','story.thibaut@enterprise.fr','STORY Thibaut',455386324,0,410100574,'Technicien',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (280,'stephan.martin@enterprise.fr','0000','EXPERT JAD','stephan.martin@enterprise.fr','STEPHAN Martin',489701503,619981467,473208862,'Technicien',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (281,'steckmeyer.ludmila@enterprise.fr','0000','EXPERT L.2.L. AUDIO VIDÉO','steckmeyer.ludmila@enterprise.fr','STECKMEYER Ludmila',412789020,640562043,0,'Technicien',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (282,'soulier.eva@enterprise.fr','0000','EXPERT L\'TUB VIDEO','soulier.eva@enterprise.fr','SOULIER Eva',466285119,662209520,0,'Technicien',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (283,'gomot.pascal@free.fr','0000','LE MARCHAND DE SONS','gomot.pascal@free.fr','GOMOT Pascal',254562996,665564306,0,'Directeur',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (284,'frezouls.valentin@free.fr','0000','LPM','frezouls.valentin@free.fr','FREZOULS Valentin',214322886,678121924,279956332,'Directeur',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (285,'bourdoiseau.daniel@free.fr','0000','TOULLIC FRERES','bourdoiseau.daniel@free.fr','BOURDOISEAU DANIEL',182378310,659406217,158989919,'Commercial',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (286,'sukhaseum.jeremie@enterprise.fr','0000','EXPERT BERSOULT & FILS','sukhaseum.jeremie@enterprise.fr','SUKHASEUM Jérémie',486850537,646267803,488299127,'Technicien',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (287,'thomas.marion@enterprise.fr','0000','HOME CINE JMB PRO','thomas.marion@enterprise.fr','THOMAS Marion',474861272,620837593,0,'Technicien',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (288,'suze.helene.@enterprise.fr','0000','HOME CINE TELE MENAGER','suze.helene.@enterprise.fr','SUZE Hélène ',448055220,632252971,465934235,'Technicien',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (289,'vilo.antoine@enterprise.fr','0000','PASSION SON SUD 4 ABADIE','vilo.antoine@enterprise.fr','VILO Antoine',429656957,680464549,431674045,'Technicien',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (290,'guilloux.yoan@gmail.com','0000','L\'AUDITORIUM','guilloux.yoan@gmail.com','GUILLOUX Yoan',386248135,646183450,384839085,'Directeur',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (291,'curioz.damien@free.fr','0000','PRÉSENCE AUDIO CONSEIL','curioz.damien@free.fr','CURIOZ Damien',185658306,628956658,0,'Commercial',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (292,'cuillerat.audrey@free.fr','0000','PRESENCE AUDIO CONSEIL','cuillerat.audrey@free.fr','CUILLERAT Audrey',528181773,626799458,111108407,'Commercial',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (293,'guiraud.helene@gmail.com','0000','L\'AMPLI À LAMPES','guiraud.helene@gmail.com','GUIRAUD Hélène',310911556,0,314954448,'Directeur',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (294,'suze.helene.@enterprise.fr','0000','DIGITAL TELE ONDAINE','suze.helene.@enterprise.fr','SUZE Hélène ',416781162,687711941,413422549,'Technicien',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (295,'taine.severine@enterprise.fr','0000','HOME CINE TELE DISCOUNT','taine.severine@enterprise.fr','TAINE Séverine',419258539,663339604,0,'Technicien',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (296,'grapeloup.loren@free.fr','0000','LA MUSIQUE DU SON','grapeloup.loren@free.fr','GRAPELOUP Loren',0,0,345831347,'Directeur',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (297,'baps.marion@orange.fr','0000','AUDIOLAND','baps.marion@orange.fr','BAPS Marion ',118972979,0,0,'Responsable',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (298,'chavantre.dominique@free.fr','0000','SILENCES','chavantre.dominique@free.fr','CHAVANTRE DOMINIQUE',121508759,657834344,0,'Commercial',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (299,'branche.lise@free.fr','0000','TECH SONO','branche.lise@free.fr','BRANCHE Lise',171173568,0,149651577,'Commercial',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (300,'bonnin.geraldine@free.fr','0000','VICTOR HUGO SYMPHONIE','bonnin.geraldine@free.fr','BONNIN Géraldine',145554025,0,156491755,'Commercial',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (301,'biard.michael@orange.fr','0000','AT 56','biard.michael@orange.fr','BIARD Michael',163788766,638688584,0,'Responsable',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (302,'cabrol.slyvain@free.fr','0000','STUDIO 108','cabrol.slyvain@free.fr','CABROL Slyvain',111471395,682625301,0,'Commercial',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (303,'yanni.elsa@enterprise.fr','0000','PASSION SON DIGI7','yanni.elsa@enterprise.fr','YANNI Elsa',487428757,647057681,412532691,'Technicien',0);
INSERT INTO `customer` (`id_customer`,`login`,`password`,`customer_name`,`email`,`name`,`phone`,`mobile`,`fax`,`function`,`admin`) VALUES (304,'chevillon.bernard@free.fr','0000','SENSITIF PASSION','chevillon.bernard@free.fr','CHEVILLON Bernard',0,0,0,'Commercial',0);

INSERT INTO `type_adress` (`id_type_address`, `name`) VALUES ('1', 'delivery');



INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (1,'L\'ECLIMONT FONTENETTE',91150,'ABBEVILLE LA RIVIERE',NULL,NULL,75,1,1);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (2,'22 GRANDE RUE  ',16140,'AIGRE',NULL,NULL,75,1,2);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (3,'City Parc - 36  rue de la Tuilerie',13857,'AIX EN PROVENCE ',NULL,NULL,75,1,3);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (4,'Immeuble CREA PLUS',13799,'AIX EN PROVENCE',NULL,NULL,75,1,4);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (5,'33  rue Lieutaud',13100,'AIX-EN-PROVENCE',NULL,NULL,75,1,5);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (6,'1  rue Bruyès',13100,'AIX-EN-PROVENCE',NULL,NULL,75,1,6);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (7,'Immeuble Farman sud - 1er étage',81000,'ALBI',NULL,NULL,75,1,7);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (8,'ZA du Buisson de la Couldre - Bât B',61003,'ALENCON ',NULL,NULL,75,1,8);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (9,'19 RUE GUYNEMER',30100,'ALES',NULL,NULL,75,1,9);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (10,'4 Rue Blaise Pascal',80000,'AMIENS ',NULL,NULL,75,1,10);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (11,'50  rue Parcheminerie',49100,'ANGERS',NULL,NULL,75,1,11);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (12,'7  rue Savary',49000,'ANGERS',NULL,NULL,75,1,12);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (13,'10  rue Boisnet',49100,'ANGERS',NULL,NULL,75,1,13);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (14,'56  boulevard du Maréchal Foch',49100,'ANGERS',NULL,NULL,75,1,14);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (15,'Immeuble le Michel Ange',27930,'ANGERVILLE LA CAMPAGNE',NULL,NULL,75,1,15);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (16,'43  Av. Jean-Leon Laporte',64600,'ANGLET',NULL,NULL,75,1,16);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (17,'4 RUE DE LA PLACE DU CHAMP DE MARS ',16000,'ANGOULEME',NULL,NULL,75,1,17);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (18,'14 RUE MARAL PAUL  ',16000,'ANGOULEME',NULL,NULL,75,1,18);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (19,'RUE  LOUISE LERIGET LYCEE JEAN ROSTAND ',16000,'ANGOULEME',NULL,NULL,75,1,19);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (20,'21 RUE DE BEAULIEU  ',16000,'ANGOULEME',NULL,NULL,75,1,20);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (21,'38 - 40 RUE DE BEAULIEU  ',16000,'ANGOULEME',NULL,NULL,75,1,21);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (22,'20 RUE BAPTISTE GUILLET ',16000,'ANGOULEME',NULL,NULL,75,1,22);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (23,'6 RUE TAILLEFER  ',16000,'ANGOULEME',NULL,NULL,75,1,23);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (24,'PLACE BEAULIEU',16016,'ANGOULEME ',NULL,NULL,75,1,24);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (25,'16 AVENUE DE GENEVE',74000,'ANNECY',NULL,NULL,75,1,25);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (26,'38   RUE DES TOURNELLES',74100,'ANNEMASSE',NULL,NULL,75,1,26);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (27,'34  avenue Jules Ferry',74100,'ANNEMASSE',NULL,NULL,75,1,27);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (28,'2  rue des Cottages',74100,'ANNEMASSE',NULL,NULL,75,1,28);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (29,'11 rue Jean Clavel',11120,'ARGELIERS',NULL,NULL,75,1,29);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (30,'Rue de Melleville',62000,'ARRAS',NULL,NULL,75,1,30);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (31,'9  rue des Balances',62000,'ARRAS',NULL,NULL,75,1,31);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (32,'Europarc du Chêne',62000,'ARRAS',NULL,NULL,75,1,32);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (33,'36  avenue d\'Argenteuil',92600,'ASNIERES-SUR-SEINE',NULL,NULL,75,1,33);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (34,'88  AVENUE ERNEST CRISTAL',63170,'AUBIERE',NULL,NULL,75,1,34);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (35,'ROUTE DE TOULOUSE',32000,'AUCH',NULL,NULL,75,1,35);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (36,'1 Bis  rue de la vieille halle',71400,'AUTUN',NULL,NULL,75,1,36);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (37,'6  rue du Rempart du Rhône',84000,'AVIGNON',NULL,NULL,75,1,37);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (38,'La Pardieu',97122,'BAIE-MAHAULT',NULL,NULL,75,1,38);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (39,'7  avenue des Montboucons',20289,'BASTIA ',NULL,NULL,75,1,39);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (40,'2  allée des Aulnes',49070,'BEAUCOUZE',NULL,NULL,75,1,40);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (41,'Rue Norman King  BP 453',60031,'BEAUVAIS ',NULL,NULL,75,1,41);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (42,'22 Impasse Jeanne Dieulafoy',25000,'BESANCON',NULL,NULL,75,1,42);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (43,'PARC LAFAYETTE 25 rue Clément Marot',25000,'BESANCON',NULL,NULL,75,1,43);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (44,'27  Avenue du Général Horne',64140,'BILLERE',NULL,NULL,75,1,44);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (45,'Rue Maurice Hollande',47550,'BOE',NULL,NULL,75,1,45);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (46,'30  rue Ha',33000,'BORDEAUX',NULL,NULL,75,1,46);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (47,'ZONE DE LA BRETONNIERE - 2  RUE AUGUSTIN FRESNEL',85600,'BOUFFERE',NULL,NULL,75,1,47);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (48,'57  rue de Grigny',1000,'BOURG EN BRESSE',NULL,NULL,75,1,48);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (49,'Immeuble le Michel Ange',18000,'BOURGES ',NULL,NULL,75,1,49);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (50,'19 Bd du Mont d\'Est',29803,'BREST',NULL,NULL,75,1,50);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (51,'8  place de la Liberté',29200,'BREST',NULL,NULL,75,1,51);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (52,'256  rue Jean Jaurès',29200,'BREST',NULL,NULL,75,1,52);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (53,'27  rue du Rhône',19316,'BRIVE ',NULL,NULL,75,1,53);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (54,'AVENUE JOHN KENNEDY ',19100,'BRIVE LA GAILLARDE',NULL,NULL,75,1,54);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (55,'Parc d\'activités des bords de Saône',69671,'BRON ',NULL,NULL,75,1,55);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (56,'7  rue Laplace',14000,'CAEN',NULL,NULL,75,1,56);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (57,'9  place Jean Letellier',14000,'CAEN',NULL,NULL,75,1,57);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (58,'58 av de Valenciennes',59400,'CAMBRAI',NULL,NULL,75,1,58);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (59,'61  la Croisette',6400,'CANNES',NULL,NULL,75,1,59);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (60,'5  rue de l\'Impératrice Eugénie',97300,'CAYENNE',NULL,NULL,75,1,60);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (61,'7  rue de la Commune',71100,'CHALON S/SAONE',NULL,NULL,75,1,61);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (62,'152  rue de Paris',94220,'CHARENTON-LE-PONT',NULL,NULL,75,1,62);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (63,'CS 60 0001',28000,'CHARTRES',NULL,NULL,75,1,63);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (64,'68  av. du Baron Lacrosse',35131,'CHARTRES DE BRETAGNE',NULL,NULL,75,1,64);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (65,'PARC COMMERCIAL LE FIEF DU ROY',16100,'CHATEAUBERNARD',NULL,NULL,75,1,65);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (66,'7 RUE BERTHE ET JULES NOBLET  ',16120,'CHATEAUNEUF SUR CHARENTE',NULL,NULL,75,1,66);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (67,'CENTRE COMMERCIAL DU MOULIN NEUF',52000,'CHAUMONT',NULL,NULL,75,1,67);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (68,'132 AV. ROLAND CARRAZ',21300,'CHENOVE',NULL,NULL,75,1,68);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (69,'AVENUE ERNEST CRYSTAL',63000,'CLERMONT FERRAND',NULL,NULL,75,1,69);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (70,'Rue de la Chapelle - RdC',63063,'CLERMONT-FERRAND',NULL,NULL,75,1,70);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (71,'89  rue Henri Barbusse',92110,'CLICHY',NULL,NULL,75,1,71);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (72,'26 BOULEVARD DENFERT ROCHEREAU  ',16100,'COGNAC',NULL,NULL,75,1,72);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (73,'26 BOULEVARD DENFERT ROCHEREAU  ',16100,'COGNAC',NULL,NULL,75,1,73);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (74,'2 RUE NEUVE DES REMPARTS  ',16100,'COGNAC',NULL,NULL,75,1,74);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (75,'17 RUE HENRI FICHON  ',16100,'COGNAC',NULL,NULL,75,1,75);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (76,'73 ROUTE DE NEUF BRISACH',68000,'COLMAR',NULL,NULL,75,1,76);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (77,'19  rue Stanislas',68000,'COLMAR',NULL,NULL,75,1,77);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (78,'5 ter  rue Clément Ader - Zac de Mercières',60200,'COMPIEGNE',NULL,NULL,75,1,78);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (79,'Le Tritium - Bât B',24660,'COULOUNIEIX CHAMIERS ',NULL,NULL,75,1,79);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (80,'57  avenue Gambetta',92400,'COURBEVOIE',NULL,NULL,75,1,80);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (81,'IMMEUBLE LE CESAR - 12  Chaussée Jules César',94046,'CRETEIL ',NULL,NULL,75,1,81);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (82,'27 rue Jean Grémillon',21000,'DIJON',NULL,NULL,75,1,82);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (83,'116  rue Berbisey',21000,'DIJON',NULL,NULL,75,1,83);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (84,'1 RUE SALINES -  CHAIGNAT FRANCOIS',25480,'ECOLE VALENTIN',NULL,NULL,75,1,84);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (85,'4  rue Isidore Lecerf',76500,'ELBEUF',NULL,NULL,75,1,85);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (86,'34 Rue Porte Lucas',51200,'EPERNAY',NULL,NULL,75,1,86);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (87,'3 rue Jules Verne ',88000,'EPINAL',NULL,NULL,75,1,87);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (88,'17  avenue de la République ',93800,'EPINAY-SUR-SEINE',NULL,NULL,75,1,88);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (89,'3 rue Condorcet',97200,'FORT DE FRANCE',NULL,NULL,75,1,89);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (90,'15 rue des Onze Arpents',95130,'FRANCONVILLE',NULL,NULL,75,1,90);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (91,'805 avenue de latte de tassigny',83600,'FRÉJUS',NULL,NULL,75,1,91);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (92,'BP 310',5006,'GAP ',NULL,NULL,75,1,92);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (93,'137 AV. P.V. couturier',94250,'GENTILLY',NULL,NULL,75,1,93);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (94,'19  rue de Turenne',38000,'GRENOBLE',NULL,NULL,75,1,94);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (95,'50  quai Xavier Jouvin',38000,'GRENOBLE',NULL,NULL,75,1,95);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (96,'16  rue Gabriel Péri',38000,'GRENOBLE',NULL,NULL,75,1,96);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (97,'8  rue Barnave',38000,'GRENOBLE',NULL,NULL,75,1,97);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (98,'4  rue Lazare Carnot',38000,'GRENOBLE',NULL,NULL,75,1,98);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (99,'7  rue Abel Servien',38000,'GRENOBLE',NULL,NULL,75,1,99);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (100,'1251 rue léon foucault',14202,'HEROUVILLE-ST-CLAIR',NULL,NULL,75,1,100);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (101,'',92130,'ISSY-LES-MOULINEAUX',NULL,NULL,75,1,101);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (102,'40 bis  rue Ernest Renan',92130,'ISSY-LES-MOULINEAUX',NULL,NULL,75,1,102);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (103,'3  rue Robespierre ',94200,'IVRY-SUR-SEINE',NULL,NULL,75,1,103);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (104,'18 RUE GRIOTTE',68260,'KINGERSHEIM',NULL,NULL,75,1,104);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (105,'ZAC des Châteliers',59564,'LA MADELEINE ',NULL,NULL,75,1,105);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (106,'Parc d\'activité de la Chapelle',73291,'LA MOTTE SERVOLEX ',NULL,NULL,75,1,106);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (107,'36/34 rue du général de gaulle',94510,'LA QUEUE EN BRIE',NULL,NULL,75,1,107);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (108,'17 Bd du Mont d\'Est',85000,'LA ROCHE S/YON ',NULL,NULL,75,1,108);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (109,'1 RUE KLEPER',85000,'LA ROCHE SUR YON',NULL,NULL,75,1,109);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (110,'31 R DES HALLES  ',16110,'LA ROCHEFOUCAULD',NULL,NULL,75,1,110);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (111,'7 PLACE GOURVILLE  ',16110,'LA ROCHEFOUCAULD',NULL,NULL,75,1,111);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (112,'6 rue Jean Monnet',17000,'LA ROCHELLE',NULL,NULL,75,1,112);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (113,'3  rue Marconi',83160,'LA VALETTE',NULL,NULL,75,1,113);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (114,'5 rue Augustin Bernard Mouchot',2000,'LAON',NULL,NULL,75,1,114);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (115,'79  rue de Versailles',78150,'LE CHESNAY',NULL,NULL,75,1,115);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (116,'ZI Nord - Rue Nicolas Appert',76620,'LE HAVRE',NULL,NULL,75,1,116);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (117,'110  rue Jules Siegfried',76600,'LE HAVRE',NULL,NULL,75,1,117);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (118,'VALFRAMBERT',72100,'LE MANS',NULL,NULL,75,1,118);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (119,'ALLEE DES JONCS',69210,'LENTILLY',NULL,NULL,75,1,119);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (120,'6 rue Eugène et Armand Peugeot',77564,'LIEUSAINT ',NULL,NULL,75,1,120);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (121,'73  rue de l\'Hopital Militaire',59800,'LILLE',NULL,NULL,75,1,121);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (122,'32  rue d\'Artois',59000,'LILLE',NULL,NULL,75,1,122);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (123,'67  rue Basse',59000,'LILLE',NULL,NULL,75,1,123);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (124,'230  rue de Paris',59000,'LILLE',NULL,NULL,75,1,124);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (125,'127  rue des Postes',59000,'LILLE',NULL,NULL,75,1,125);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (126,'8 rue du Maréchal De Lattre De Tassignit',59800,'LILLES',NULL,NULL,75,1,126);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (127,'Le Jardin des Royes',87069,'LIMOGES ',NULL,NULL,75,1,127);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (128,'69 rue Chaptal - RdC',62219,'LONGUENESSE',NULL,NULL,75,1,128);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (129,'49  rue de la Charité',69002,'LYON',NULL,NULL,75,1,129);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (130,'21  rue Terme',69001,'LYON',NULL,NULL,75,1,130);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (131,'19  rue Mercière',69002,'LYON',NULL,NULL,75,1,131);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (132,'',57210,'MAIZIERES LES METZ',NULL,NULL,75,1,132);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (133,'9  Rue Louis Lumières',21160,'MARSANNAY LA COTE',NULL,NULL,75,1,133);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (134,'40  cours Julien',13006,'MARSEILLE',NULL,NULL,75,1,134);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (135,'12 & 30  rue des Trois Rois',13006,'MARSEILLE',NULL,NULL,75,1,135);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (136,'21  rue Sainte',13001,'MARSEILLE',NULL,NULL,75,1,136);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (137,'25  rue Adolphe Thiers',13001,'MARSEILLE',NULL,NULL,75,1,137);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (138,'4 rue Edouard Baldus',13008,'MARSEILLE',NULL,NULL,75,1,138);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (139,'Bd Du 14 Juillet - Le Prado',13500,'MARTIGUES',NULL,NULL,75,1,139);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (140,'8  RUE GUTENBERG',33700,'MERIGNAC',NULL,NULL,75,1,140);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (141,'1 rue des Bruyères',33700,'MERIGNAC',NULL,NULL,75,1,141);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (142,'11  Allée de la Providence',57070,'METZ',NULL,NULL,75,1,142);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (143,'Avenue Georges Pompidou',74370,'METZ TESSY',NULL,NULL,75,1,143);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (144,'Les Espaces Graham Bell',89470,'MONETEAU',NULL,NULL,75,1,144);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (145,'ZAC de Kergaradec à Gouesnou',76824,'MONT ST AIGNAN ',NULL,NULL,75,1,145);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (146,'CENTRE CHANTRAN',39570,'MONTMOROT',NULL,NULL,75,1,146);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (147,'4  rue du Clos René',34000,'MONTPELLIER',NULL,NULL,75,1,147);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (148,'19  rue Durand',34000,'MONTPELLIER',NULL,NULL,75,1,148);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (149,'708 av Marché Gare',34000,'MONTPELLIER',NULL,NULL,75,1,149);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (150,'6  boulevard de Chanzy ',93100,'MONTREUIL-SOUS-BOIS',NULL,NULL,75,1,150);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (151,'Parc Pompidou - Bat. 1',6250,'MOUGINS',NULL,NULL,75,1,151);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (152,'23  avenue des Templiers',3000,'MOULINS',NULL,NULL,75,1,152);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (153,'30  avenue Aristide Briand',68200,'MULHOUSE',NULL,NULL,75,1,153);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (154,'ZAC de la Conterie',68200,'MULHOUSE',NULL,NULL,75,1,154);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (155,'11  rue Léon Blum',44000,'NANTES',NULL,NULL,75,1,155);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (156,'3  rue des Vieilles Douves',44000,'NANTES',NULL,NULL,75,1,156);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (157,'20  rue Kervégan',44000,'NANTES',NULL,NULL,75,1,157);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (158,'22  rue Armand Brossard',44000,'NANTES',NULL,NULL,75,1,158);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (159,'1  rue du Gué-Robert',44000,'NANTES',NULL,NULL,75,1,159);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (160,'13  RUE DE STRASBOURG',68600,'NEUF BRISACH',NULL,NULL,75,1,160);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (161,'14  rue de Longchamp ',92200,'NEUILLY-SUR-SEINE',NULL,NULL,75,1,161);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (162,'9  rue de la Préfecture',6300,'NICE',NULL,NULL,75,1,162);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (163,'7  avenue de Suède',6000,'NICE',NULL,NULL,75,1,163);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (164,'42  rue Jean Garel',30908,'NIMES',NULL,NULL,75,1,164);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (165,'2  place de l\'Ancien Marché ',94130,'NOGENT-SUR-MARNE',NULL,NULL,75,1,165);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (166,'79  Rte de Grigny \"Les Iris\"\"\"',93192,'NOISY LE GRAND ',NULL,NULL,75,1,166);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (167,'34-36 Rue Guynemer',93192,'NOISY LE GRAND ',NULL,NULL,75,1,167);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (168,'ZI de l\'Erier - 949  rue Denis Papin',98846,'NOUMEA ',NULL,NULL,75,1,168);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (169,'89 RTE DE LOURDES',65310,'ODOS',NULL,NULL,75,1,169);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (170,'ZAC de l\'Echangeur',45000,'ORLEANS',NULL,NULL,75,1,170);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (171,'175  rue de Bourgogne',45000,'ORLEANS',NULL,NULL,75,1,171);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (172,'17  RUE LEON GAUMONT',44700,'ORVAULT',NULL,NULL,75,1,172);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (173,'ZAC du Carré',95520,'OSNY',NULL,NULL,75,1,173);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (174,'102 rue Voltaire',1100,'OYONNAX',NULL,NULL,75,1,174);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (175,'LE PONTET ',98713,'PAPEETE',NULL,NULL,75,1,175);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (176,'160  RUE DE GRENELLE',75007,'PARIS',NULL,NULL,75,1,176);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (177,'10  rue Jean Jacques Rousseau ',75001,'PARIS',NULL,NULL,75,1,177);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (178,'',75000,'PARIS',NULL,NULL,75,1,178);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (179,'100  boulevard de Ménilmontant',75020,'PARIS',NULL,NULL,75,1,179);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (180,'80  rue de Belleville ',75020,'PARIS',NULL,NULL,75,1,180);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (181,'58  rue de l\'Ourcq',75019,'PARIS',NULL,NULL,75,1,181);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (182,'15  rue de la Villette ',75019,'PARIS',NULL,NULL,75,1,182);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (183,'234  rue Championnet',75018,'PARIS',NULL,NULL,75,1,183);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (184,'76  rue des Martyrs',75018,'PARIS',NULL,NULL,75,1,184);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (185,'86  rue des Martyrs',75018,'PARIS',NULL,NULL,75,1,185);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (186,'54  rue Championnet',75018,'PARIS',NULL,NULL,75,1,186);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (187,'94  boulevard Malesherbes ',75017,'PARIS',NULL,NULL,75,1,187);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (188,'106  rue Saussure',75017,'PARIS',NULL,NULL,75,1,188);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (189,'10  rue Mignard',75016,'PARIS',NULL,NULL,75,1,189);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (190,'14  rue Gustave Courbet',75016,'PARIS',NULL,NULL,75,1,190);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (191,'59  rue Boulainvilliers',75016,'PARIS',NULL,NULL,75,1,191);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (192,'12  rue des Volontaires',75015,'PARIS',NULL,NULL,75,1,192);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (193,'54  rue Cambronne',75015,'PARIS',NULL,NULL,75,1,193);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (194,'291  rue de Vaugirard ',75015,'PARIS',NULL,NULL,75,1,194);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (195,'215  rue de la Croix Nivert',75015,'PARIS',NULL,NULL,75,1,195);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (196,'81  rue Olivier de Serres',75015,'PARIS',NULL,NULL,75,1,196);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (197,'76  rue de la Procession ',75015,'PARIS',NULL,NULL,75,1,197);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (198,'15  rue Ferdinand Fabre',75015,'PARIS',NULL,NULL,75,1,198);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (199,'8  rue de Lourmel',75015,'PARIS',NULL,NULL,75,1,199);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (200,'166  boulevard de Grenelle',75015,'PARIS',NULL,NULL,75,1,200);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (201,'16  rue Frémicourt',75015,'PARIS',NULL,NULL,75,1,201);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (202,'46  rue Falguière',75015,'PARIS',NULL,NULL,75,1,202);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (203,'75  avenue Emile Zola',75015,'PARIS',NULL,NULL,75,1,203);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (204,'5  avenue du Maine',75015,'PARIS',NULL,NULL,75,1,204);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (205,'74  rue de la Croix Nivert',75015,'PARIS',NULL,NULL,75,1,205);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (206,'161  rue de Vaugirard',75015,'PARIS',NULL,NULL,75,1,206);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (207,'38  rue de l\'Ouest',75014,'PARIS',NULL,NULL,75,1,207);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (208,'143  rue du Château',75014,'PARIS',NULL,NULL,75,1,208);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (209,'6  rue d\'Alésia',75014,'PARIS',NULL,NULL,75,1,209);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (210,'210  rue du Faubourg Saint Antoine',75012,'PARIS',NULL,NULL,75,1,210);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (211,'50  cours de Vincennes',75012,'PARIS',NULL,NULL,75,1,211);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (212,'176  rue du Faubourg Saint Antoine',75012,'PARIS',NULL,NULL,75,1,212);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (213,'42  rue de Malte',75011,'PARIS',NULL,NULL,75,1,213);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (214,'21  rue Daval ',75011,'PARIS',NULL,NULL,75,1,214);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (215,'56  rue de Lancry',75010,'PARIS',NULL,NULL,75,1,215);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (216,'153  rue La Fayette',75010,'PARIS',NULL,NULL,75,1,216);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (217,'16  rue Mazagran',75010,'PARIS',NULL,NULL,75,1,217);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (218,'6  rue Pierre Chausson',75010,'PARIS',NULL,NULL,75,1,218);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (219,'28  rue de la tour d\'Auvergne ',75009,'PARIS',NULL,NULL,75,1,219);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (220,'23  rue Blanche',75009,'PARIS',NULL,NULL,75,1,220);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (221,'32  rue du Faubourg Montmartre',75009,'PARIS',NULL,NULL,75,1,221);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (222,'13  rue de Rochechouart',75009,'PARIS',NULL,NULL,75,1,222);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (223,'17  rue de la Fontaine ',75009,'PARIS',NULL,NULL,75,1,223);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (224,'13  rue Notre-Dame de Lorette',75009,'PARIS',NULL,NULL,75,1,224);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (225,'23 boulevard de l\'Yser',75017,'PARIS',NULL,NULL,75,1,225);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (226,'17  rue de Constantinople',75008,'PARIS',NULL,NULL,75,1,226);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (227,'3  rue de Washington',75008,'PARIS',NULL,NULL,75,1,227);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (228,'1  rue Lincoln ',75008,'PARIS',NULL,NULL,75,1,228);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (229,'29  rue Dauphine',75006,'PARIS',NULL,NULL,75,1,229);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (230,'121  boulevard du Montparnasse',75006,'PARIS',NULL,NULL,75,1,230);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (231,'8  rue Sainte Beuve',75006,'PARIS',NULL,NULL,75,1,231);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (232,'1  rue des Fossés Saint-Bernard ',75005,'PARIS',NULL,NULL,75,1,232);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (233,'2  rue Blainville',75005,'PARIS',NULL,NULL,75,1,233);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (234,'103  rue Monge',75005,'PARIS',NULL,NULL,75,1,234);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (235,'25 rue Hérold',75001,'PARIS',NULL,NULL,75,1,235);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (236,'6 rue de St Quentin',75010,'PARIS',NULL,NULL,75,1,236);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (237,'153  rue de Lourmel',75015,'PARIS',NULL,NULL,75,1,237);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (238,'11  rue du Baron Le Roy',75012,'PARIS',NULL,NULL,75,1,238);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (239,'avenue du parc',60400,'PASSEL',NULL,NULL,75,1,239);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (240,'11 Rue RENE CASSIN',64000,'PAU',NULL,NULL,75,1,240);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (241,'32  Rue Wilson',24000,'PERIGUEUX',NULL,NULL,75,1,241);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (242,'5  Allée André Bourland',34470,'PEROLS',NULL,NULL,75,1,242);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (243,'355 Rue Louis de Broglie',66100,'PERPIGNAN',NULL,NULL,75,1,243);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (244,'14 Allée Charles Pathé - Bât C',86000,'POITIERS',NULL,NULL,75,1,244);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (245,'PLACE LAURENT FERRAND',1160,'PRIAY',NULL,NULL,75,1,245);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (246,'17  rue Alfred Kastler',51100,'REIMS',NULL,NULL,75,1,246);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (247,'13  rue Edison',92500,'REUIL MALMAISON ',NULL,NULL,75,1,247);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (248,'2 Avenue de la Fontaine - 1er étage',44005,'REZE',NULL,NULL,75,1,248);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (249,'Parc de l\'Aéroport - Le Forum',44005,'REZE',NULL,NULL,75,1,249);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (250,'6  Avenue du parc Borely',44400,'REZE',NULL,NULL,75,1,250);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (251,'Immeuble La Croix du Sud',91136,'RIS ORANGIS ',NULL,NULL,75,1,251);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (252,'53  RUE ST ALBAN',42300,'ROANNE',NULL,NULL,75,1,252);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (253,'1056  Chemin des Campelières',12000,'RODEZ ',NULL,NULL,75,1,253);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (254,'11  rue de Paris ',93230,'ROMAINVILLE',NULL,NULL,75,1,254);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (255,'ZAC de l\'Orée du Golf  16  rue Jules Verne',59790,'RONCHIN',NULL,NULL,75,1,255);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (256,'60  rue Fontenelle',76000,'ROUEN',NULL,NULL,75,1,256);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (257,'61  RUE GANTERIE',76000,'ROUEN',NULL,NULL,75,1,257);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (258,'Bât. B - 4ème Etage',92508,'RUEIL MALMAISON ',NULL,NULL,75,1,258);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (259,'6 rue Eugène et Armand Peugeot',92508,'RUEIL MALMAISON ',NULL,NULL,75,1,259);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (260,'70 rue Joseph Alouis Champeter',92508,'RUEIL MALMAISON ',NULL,NULL,75,1,260);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (261,'Parc Athena-Immeuble Thema',22000,'SAINT BRIEUC',NULL,NULL,75,1,261);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (262,'135 Chemin des Bassins - Hameau B',14280,'SAINT CONTEST',NULL,NULL,75,1,262);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (263,'18 place Jacquard',42000,'SAINT ETIENNE',NULL,NULL,75,1,263);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (264,'1  rue des Promenades',69230,'SAINT GENIS LAVAL',NULL,NULL,75,1,264);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (265,' 22 ROUTE DE LYON ',71100,'SAINT REMY',NULL,NULL,75,1,265);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (266,'Zac du Parc d\'Archevilliers',37550,'SAINT-AVERTIN',NULL,NULL,75,1,266);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (267,'Immeuble le Tertial',42000,'SAINT-ETIENNE ',NULL,NULL,75,1,267);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (268,'10 rue Jane Addams',50000,'SAINT-LO',NULL,NULL,75,1,268);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (269,'231 avenue Parme - BAT A',97438,'SAINT-MARIE',NULL,NULL,75,1,269);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (270,'140 rue Alexis de Tocqueville',10300,'SAINTE SAVINE',NULL,NULL,75,1,270);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (271,'ZA M3 C.CIAL BOIS SENART - MAVACA',77176,'SAVIGNY LE TEMPLE ',NULL,NULL,75,1,271);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (272,'ZA M3 C.CIAL BOIS SENART - MAVACA',77176,'SAVIGNY LE TEMPLE ',NULL,NULL,75,1,272);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (273,'1 RUE DES MALASTIERS  ',16130,'SEGONZAC',NULL,NULL,75,1,273);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (274,'Temis Center 5',38171,'SEYSSINET ',NULL,NULL,75,1,274);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (275,'Site Europcap',64990,'ST PIERRE D\'IRUBE',NULL,NULL,75,1,275);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (276,'CHEMIN DE LA CARTE  ',16110,'ST PROJET',NULL,NULL,75,1,276);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (277,'9 place de la resistance',93200,'ST-DENIS',NULL,NULL,75,1,277);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (278,'39  route du Polygone',67100,'STRASBOURG',NULL,NULL,75,1,278);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (279,'22  rue Ernest Munch',67000,'STRASBOURG',NULL,NULL,75,1,279);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (280,'1  rue Saint Gothard',67000,'STRASBOURG',NULL,NULL,75,1,280);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (281,'7  rue des Serruriers',67000,'STRASBOURG',NULL,NULL,75,1,281);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (282,'14  route du Polygone',67000,'STRASBOURG',NULL,NULL,75,1,282);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (283,'64 rue de BALBRONN',67200,'STRASBOURG',NULL,NULL,75,1,283);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (284,'R Charles PEGUY',67200,'STRASBOURG',NULL,NULL,75,1,284);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (285,'Parc d\'Activités du Golf',67100,'STRASBOURG',NULL,NULL,75,1,285);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (286,'32  rue Polinaires',31000,'TOULOUSE',NULL,NULL,75,1,286);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (287,'286   ROUTE DE REVEL',31400,'TOULOUSE',NULL,NULL,75,1,287);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (288,'9  rue Gambetta',31000,'TOULOUSE',NULL,NULL,75,1,288);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (289,'286  ROUTE DE REVEL',31400,'TOULOUSE',NULL,NULL,75,1,289);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (290,'30 r Languedoc',31000,'TOULOUSE',NULL,NULL,75,1,290);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (291,'93  avenue Charles de Gaulle',31500,'TOULOUSE',NULL,NULL,75,1,291);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (292,'Le Parc des Longeray - Le Boréal',31094,'TOULOUSE',NULL,NULL,75,1,292);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (293,'27  Bvd. De Genève BP 2335',31021,'TOULOUSE',NULL,NULL,75,1,293);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (294,'80  rue Colbert',37000,'TOURS',NULL,NULL,75,1,294);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (295,'112  rue Edouard Vaillant',37000,'TOURS',NULL,NULL,75,1,295);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (296,'5  Place des Halles BP 5964',37059,'TOURS',NULL,NULL,75,1,296);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (297,'2 allée de la Mixité',78190,'TRAPPES',NULL,NULL,75,1,297);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (298,'10 rue des Castors',26000,'VALENCE',NULL,NULL,75,1,298);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (299,'28 rue des Granges Galand',59300,'VALENCIENNES ',NULL,NULL,75,1,299);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (300,'7 rue Léo Lagrange',54500,'VANDOEUVRE LES NANCY',NULL,NULL,75,1,300);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (301,'Les Jardins d\'Entreprise - Bât B',56034,'VANNES',NULL,NULL,75,1,301);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (302,'3  avenue du pays d\'Auge',84275,'VEDENE ',NULL,NULL,75,1,302);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (303,'267  BD PINEL',69200,'VENISSIEUX',NULL,NULL,75,1,303);
INSERT INTO `customer_adress` (`id_adress`,`adress`,`postal_code`,`city`,`longitude`,`latitude`,`country`,`type_adress_id_type_address`,`customer_id_customer`) VALUES (304,'14  rue du Bois de la Champelle',69400,'VILLEFRANCHE S/SAÔNE',NULL,NULL,75,1,304);
