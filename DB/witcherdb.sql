-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema witcherdb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `witcherdb` ;

-- -----------------------------------------------------
-- Schema witcherdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `witcherdb` DEFAULT CHARACTER SET utf8 ;
USE `witcherdb` ;

-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(200) NOT NULL,
  `email` VARCHAR(200) NULL,
  `password` VARCHAR(200) NOT NULL,
  `role` VARCHAR(45) NOT NULL,
  `enabled` TINYINT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`username` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `location`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `location` ;

CREATE TABLE IF NOT EXISTS `location` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(200) NOT NULL,
  `description` TEXT NOT NULL,
  `image_url` TEXT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `player`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `player` ;

CREATE TABLE IF NOT EXISTS `player` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(200) NOT NULL,
  `description` TEXT NOT NULL,
  `current_health` INT NOT NULL,
  `max_health` INT NOT NULL,
  `experience_level` INT NOT NULL,
  `image_url` TEXT NULL,
  `location_id` INT NULL DEFAULT 1,
  `user_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_player_location1_idx` (`location_id` ASC),
  INDEX `fk_player_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_player_location1`
    FOREIGN KEY (`location_id`)
    REFERENCES `location` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_player_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `weapon`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `weapon` ;

CREATE TABLE IF NOT EXISTS `weapon` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(200) NOT NULL,
  `damage` INT UNSIGNED NOT NULL,
  `description` VARCHAR(2000) NOT NULL,
  `tier` INT NOT NULL,
  `player_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_weapon_player1_idx` (`player_id` ASC),
  CONSTRAINT `fk_weapon_player1`
    FOREIGN KEY (`player_id`)
    REFERENCES `player` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `armor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `armor` ;

CREATE TABLE IF NOT EXISTS `armor` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(200) NOT NULL,
  `defense` INT UNSIGNED NOT NULL,
  `description` VARCHAR(2000) NOT NULL,
  `tier` INT NOT NULL,
  `player_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_armor_player1_idx` (`player_id` ASC),
  CONSTRAINT `fk_armor_player1`
    FOREIGN KEY (`player_id`)
    REFERENCES `player` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `monster`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `monster` ;

CREATE TABLE IF NOT EXISTS `monster` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(200) NOT NULL,
  `health` INT NOT NULL,
  `damage` INT UNSIGNED NOT NULL,
  `experience_reward` INT NOT NULL,
  `image_url` TEXT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `monster_location`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `monster_location` ;

CREATE TABLE IF NOT EXISTS `monster_location` (
  `monster_id` INT NOT NULL,
  `location_id` INT NOT NULL,
  PRIMARY KEY (`monster_id`, `location_id`),
  INDEX `fk_monster_has_location_location1_idx` (`location_id` ASC),
  INDEX `fk_monster_has_location_monster1_idx` (`monster_id` ASC),
  CONSTRAINT `fk_monster_has_location_monster1`
    FOREIGN KEY (`monster_id`)
    REFERENCES `monster` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_monster_has_location_location1`
    FOREIGN KEY (`location_id`)
    REFERENCES `location` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS witcheruser@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'witcheruser'@'localhost' IDENTIFIED BY 'witcheruser';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'witcheruser'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `witcherdb`;
INSERT INTO `user` (`id`, `username`, `email`, `password`, `role`, `enabled`) VALUES (1, 'walkerjohnelle', 'johnellewalker@gmail.com', '9ol.)P:?', 'admin', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `location`
-- -----------------------------------------------------
START TRANSACTION;
USE `witcherdb`;
INSERT INTO `location` (`id`, `name`, `description`, `image_url`) VALUES (1, 'Kaer Seren', 'coastal gryphon witcher training academy', 'https://preview.redd.it/q7jujbxva7w21.jpg?width=1536&format=pjpg&auto=webp&s=469929c701dfd8fb17f2a8841945c635d9aa545f');

COMMIT;


-- -----------------------------------------------------
-- Data for table `player`
-- -----------------------------------------------------
START TRANSACTION;
USE `witcherdb`;
INSERT INTO `player` (`id`, `name`, `description`, `current_health`, `max_health`, `experience_level`, `image_url`, `location_id`, `user_id`) VALUES (1, 'Isabella', 'Gryphon Academy graduate', 20, 20, 3, 'https://www.gamespot.com/a/uploads/original/1179/11799911/2758965-witcher3.jpg', 1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `weapon`
-- -----------------------------------------------------
START TRANSACTION;
USE `witcherdb`;
INSERT INTO `weapon` (`id`, `name`, `damage`, `description`, `tier`, `player_id`) VALUES (1, 'silver sword', 5, 'sword for slicing through monster flesh', 1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `armor`
-- -----------------------------------------------------
START TRANSACTION;
USE `witcherdb`;
INSERT INTO `armor` (`id`, `name`, `defense`, `description`, `tier`, `player_id`) VALUES (1, 'leather boots', 1, 'worn leather boots from witcher training', 1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `monster`
-- -----------------------------------------------------
START TRANSACTION;
USE `witcherdb`;
INSERT INTO `monster` (`id`, `name`, `health`, `damage`, `experience_reward`, `image_url`) VALUES (1, 'Ekimmara', 12, 3, 1, 'https://64.media.tumblr.com/d42f61f2edc8ad906bc47e6d85c86c9f/tumblr_oxbl75ESDt1sn3ne4o1_500.jpg');

COMMIT;


-- -----------------------------------------------------
-- Data for table `monster_location`
-- -----------------------------------------------------
START TRANSACTION;
USE `witcherdb`;
INSERT INTO `monster_location` (`monster_id`, `location_id`) VALUES (1, 1);

COMMIT;

