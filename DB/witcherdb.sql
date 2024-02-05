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
  `user_id` INT NOT NULL,
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
  `id` INT NOT NULL,
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
INSERT INTO `location` (`id`, `name`, `description`, `image_url`) VALUES (1, 'Kaer Seren', 'coastal gryphon witcher training academy', 'data:image/jpeg;base64,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');

COMMIT;


-- -----------------------------------------------------
-- Data for table `player`
-- -----------------------------------------------------
START TRANSACTION;
USE `witcherdb`;
INSERT INTO `player` (`id`, `name`, `description`, `current_health`, `max_health`, `experience_level`, `image_url`, `location_id`, `user_id`) VALUES (1, 'Isabella', 'Gryphon Academy graduate', 20, 20, 3, 'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxAPDw8PEBAPEBUPDw8QDw8PFQ8VDw8VFRUWFxUVFRUYHSggGBolHRUVITEhJSkrLi4uFx8zODMsNygtLisBCgoKDg0OGxAQGi0lHyYtKzAvKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLS0tLS0tLS0rLf/AABEIASAArwMBIgACEQEDEQH/xAAcAAACAgMBAQAAAAAAAAAAAAABAgADBQYHBAj/xAA+EAACAgEDAgMFBQUHAwUAAAABAgARAwQSIQUxE0FRBiJhcYEHFDKRsRVCUqHBIzNicoLR4UNTwiWSorLx/8QAGAEBAQEBAQAAAAAAAAAAAAAAAAECAwT/xAAdEQEBAAMBAQEBAQAAAAAAAAAAAQIRMSFBEgNh/9oADAMBAAIRAxEAPwDpkaSECAIYYagLJUapCICVFqORARAQiIRLDFq+B58CBSwlZjNmSyu5bBoix39JCIFZEQyxojQKzEMsMUwK2iGWGVmApimMYpgKYITBA2YQiQRhAgENSCNUBakjVJUBKikSwiKRArqeTUuo1CC7GLHkYAXw/C7zXkLavl8J7waDsO642I+c1zpPVcLKiNqMB1GREynFvx+JbLvC7LugDt+QPxmsfD8/q6e/WqiYSq13Jb+L6j/eYzpHUNzHEWBr8PrUxnX+qYSHXDmXegFIltkx2eFIUE1dj6eU1rpetZMpzk7zjJZlFBj6jnzmr6THTprCVmTT6hcqLkQ2rqGBhacwhiGWGI0BIjiWRHECsxTGMUwEMBjGCBs4jCARhAIEIEgjVAFSVDUkBSIpEeKYACkh1H7yOPzHE1HRdN0F4eo5UG7FgxUxs7Xx49jE1ySCGHNgUPSbcDRBE0TM2RX1ujTMdPT58+DIG2hcbtudSQCeGLNQqw3wlnG/53WTG5uj6V8D6rYvvq1AhguS3awVPcHvNdXR/ezkGJdrvkUY9vGy1Hu/Lg/zjdb6q2IeAdV97ZjYKksPzIsfUmZz7OMIDAv+JvFZb8iKH6M0Yu39tabl0jR+Bp8OEmzjxqpPqa5/nPS0saVmR5iGIY5iNAWKYxikQKzFMsrz/l5xHrygIYsYwQNnEcRBHEBhCIBCIBkkkgAwFeCfIecJlXW9UMKKpBojnaCzMasIigEljTHtwBA17qXtL92ygZsOVMb0FzHYUB8/wkkfWa51A7tZ4w25MWoQjeOQCQOL9Pd/MyvrPtfhxbsOpwtjGTdtD+GwPNe8FZq+YM17IMuPTnV6J2fGT/aaZ/xY743We62RfY16yTbcsnq/W+zg8bdjANm78z8JkPZZMuLM77SdmTIFBsBg3x+sxOg9tihAz4grKaYHjZ2/eqq5mc0PtTp8xCK21iTtX+LueCL/AKS+x2/WGc0b2h6vqxkRhkOPG2RFxYcIAfISNw3v37A2BQ9eLm1aDXLlDAAhkoOp7i+xB8waP5TVtd1TCmLKcrgGg2Ne+TxMbWBtHvAFbUtVUzS3RdZQDT6hCSuXjIKNFbAZqHYL3v6Q4Z63qNsMUw7gQCCCDyCOxEUwwUxTGMUwpDEMcxTAUxYxggbMsYRBHBgOIYoMMBpIJIEM1j266suIKXYgjE7JiVWbJmCbfEK8bVAvHbNYHnVTZiZoXXkOuHWXXGCdNg/ZulYf3pzMC+Yg+SnfjWvPaYGg9Y8PWYvHIxH3GcKg3EEX7rZG94m74NV5CYToftB9zDKPwk1tpqF2GX/j9J5V1LAjE1DaTvRtwViONrV5d+Z0P2R9kMGpVc2rUEFQVwKax4VrhW2/jY9yOw7V5xrS279Y7S9H02t0zahSFdcbeGQdrmjYDD97z7g/TzxebLm03vMQxohXWu6+5R9D/v5zedX0LSYlVcAbADvZmxu6+FtBNjmgLA47TRxmx5DkQt/djl0oqysO7L8a5Hlz8otJL8ToIwDJtzrS5dyg37ou6/4+YiZl+6f2Ktkc49wwMzFcQx2dvA5JtiCAV58zc8mDFmx5WxptKWD7zECmW1a9pJHPYg9vrPZ1bWuEbdjUlV3B1KNur3SQCTRFMLr1l4nW1ewPXWGnc67V4EXxFxabG5xoVUIDe4myDfAPPun1m8I4YBlIYMLDKQQR6gjvOG4sTEg51yjFmYAjGS7oCRudFoguBX0sc3Ouey+g0un0wTSP4mMuzF924s/Zr9DY5FCvSQZYxTGMUwFMQxjBAUxY0EDYwYwiAxhAsEMQGG4DyXFuS4FWqzMikqu9uAqWBuJ7WfIeZPoJqraZ+m9MyvndC+TX/eczJu2A5c6kgE8kANV/CbcTK8oDABqIB3bSARfkYHH/ALXOj4sObFlSl8c5XX+EZGbHu/Pv8dx9BWM0HtJm0rIGbhQFbHRbECQCVteN4sX5i51T206Bj6hpjjawcTHLjK99wUgivOwTx616ThGrzpjLYHe2wjg25x4jVsmPGp/tHLfidvS5uXbOrONh6p7XYcoK5MrBDycOEHc1fuluwFzVX6ijZmOFXxLtN7ipLAeTVxVEip4cmvDcbe/4t1WZ595B7elkdzXa5LF3Ww5MOfLWQZQpKYwqjdZU9ub78jj5mAaMJtZsj5AG3bCQPf7fkRQ7zGafXste8RXbjtPauLMyY83h5PCyZhjGXa3hlieVDdv/AMmfdaX62TBq1QrlVlZ0HuKrApjJXn8Jq+am3ew3tBi1L5caIql1GdiorcwpGJ8v4B9DOWoz5cuXGMD6h+39krk+gNKOx45nSfsv9mM2ixZcuoQpkylVTGSCUQcm67EnmvgJnHHUazy/VbxFMJgM0wUxYxiwAYsYwQrPgxgYgMIMCwGG4gMNwHuS4lyXAJMUmAmLcDVftC9ocuiwBcAV8uoD4sSj3squ1BGVf3h3HY8lZgcPQtN90wYvuBSgWL6nGo1Wc7LbLk/eW8hqj2935ROrdLz9V6hk1GNS+HROuPE6ZMeJsbJsd8gfcCOxC8H8RP7ovS8uTV6fU5Mt5UJJG5H8QAEj3bBPHA/KdcZJHLK23UZTqHsvpXCt4TYy2RVpAyMwsXSsOO9du4Pea5quhqmQJe0EiiLJ2k8d/Pynp1ftZqd4c7GZLpttMCQV97mrAPoPK7qYzH1d33MyqxC7iRY7VyfXsB+UthKoyaIqAaI3Albo38jO59DxYNZ03CjadEx5MW1tOPwrRINVR/ELB7+fecPVMpxplKnw2LKpO0qGqyOGJB+Bqdy9jMQTp2kAYNeLfa2B75L1z5jdX0nO6dHv0OiTAiolnYiY970cjKnChm7tQ9ZcY5imZUpiGMYphAghgMAGCEwQM2DCDKwYwMKsuS4lw3Aa5LiXJcBrmle0XtW6DOMY8NU340JVjnzOGKHaKpFsNRss23gAUTuGbLtVmIJ2qWIUWxoXQHmZxvXe0WTVdR0zHFvYajC66bmvEJAxY2/y+4SfW+01jEtbz1Jf2X0tNMKGTN72cg8tkYWw+Q4X5CaLrHC6dt3JyI4HzINH86H1nq9pvaTU63U02kCjCzIUDUSRwSbP9Jg/aHqCnbjZMmEqoveCO3Yc8nkqbr9wSZ43bX8spMf9rG9QZXs1YJNE9wL45mIzYGAO3hWoNxyACD9e1/Se/uBRBr4ylj/KSLl68OpdcexMb79oJZ1DqCzHy3AHgBRdes6t9lvtKr400DjlQ74XvhgTuKV5EWx+XynLtXitL/xEfG4/SWbGWyIxR8ZUo44KsOQf0m9Mdr6PMBmP9nupfe9Lhz9i6DeOKDjhwPhYMyBmFIYITBAWAxoIQsEaCBlQYbiXCDCnENxLkuA9wXFuC4FWu8U4nGEquQqRjZ7KIx4DEDvXevOq4mqL7BaTBqMetTJmQ6dMmTIC1jKwxODkv8SvZ3WD38h3m4EyvPiORMiA0XxZEB9Nykf1lnWcuVxvBlrOx5G5mPxAvgfp+U83tdnJ293od8lWPgKkzZKykjkb355F+8eaIFCDrXvYySfIcn+Q/kJvfh8aQwpj3F+hMZczDsx+ss+7vkyrixqXd8gRFHdixoAQ6XAAx33amivxHHNyQWIWOLISppSmS/S2C8+gsj85Smd1B27T4h20OWvyod7mQYAA1R3IyNVkAGuOAfQH6TwabKMWVXN0rqexvhgfn5S0ld0+z7S5cPTsWPMCrq2Xcp7p75IX6CuJsRi4dtWoFP7/AB57ubjGc2iwGNAYCwQmCECSoZIHvBkuV7pN0KtuS4gaS4FkFxS0FwHhVqIPobldwXA457VYBp9bnx8UMpZf8rUw/WU62jgPIFgGyOJmftY0+zUYM1cZcZUn/EhF/wAmX8prDZ92H1+H/M6Rmc0x3swf/VtB8dTh/XiZT7Ruj/depZGCjZqR46cCgxJ3j87P1mG6U2zqOhbj3dXp+3I/vV8/PznXPtL6QNRo/EA9/TtuU+e08MP0P0mfp8cw6SbVgao2KrtMX1DBywnt6Vlpqo8n+IAfltP6xuo4SrEEV9bnT4y7J7E6zx+m6PITZ8BUY+pT3D/NZmjNO+ynLfTtn/b1GZfldP8A+c3Cca6IYDJJABghkgCSSSBbcO6V3JcCzdDulVyXAu3SbpVclwLd0G6IDBcDUftV0niaAZPPT5kf/S1ow/8Akp/0zmmge8ZX4mp2vr2h+86XUYPPLidVPo1Wp/MCcM6Y/IPr5GbxZrxs/hZ8Ln/p58bfkymfRmpxrkV0bkOrKfkeJ88dfxj3iPg07/0zUeLgw5B/1MON/wD3KDJlPTFwzVYDp9VlxEUceRl/n/tL9e28BpmPtR0ITXLkHAz4wx4/eX3f9pgVxg4ybUEKG951HHFcE2bsfnN43xK3v7JM39nq8f8ADkx5K/zKR/4Cb/OZfZM9ajVqf3sOEj/SzA//AGE6ZOeXWoMkEkipJJJAkkkkAXJcEkBpIJIBhiyQGkuC4LgMGo/KcF6hjGPX6rGL2rqs6qPQeI23+U7wTOE9fyKddqcgZNr58jKQyNYLWD7pI57zWKV4eu0ARXFAf1ncPZXGyaDRK3ddLgB+HuDicQ1ZGozYcCmhly48d+fvMFv+c+gVUABRwAAAPQDtGRGh/axo3dNLkRHco2RTsUkgUDzXymh4cuTY1bq9AhP9ROqfaDqMa6HKrPtZ1vGvvW5HcAAi+/nwJyjpWsK+7Vg+s1ilbD9mmqK9S2mh4uDKvxsbW/RTOuXOPewuLd1bDR/u0z5D8thX9WE7Bczl1ZwbkiyXMqaSLclwGki3JcAyRbkuA0kFyXAMkFyQDJcW4CYGE9s+pajT6YPplBc5FVmIvYp7lR5tdVfHf5TjrY094nxLBO6ltyfO907X7Tkfs/X7gCPuefg9r28H5g0R8ROMap3wqAzDMpAoP+Mcdt3f9R8JLdVrHHc2x+h1vharBmXGH8HKjojkDewI2gkduan0HoMuV8atmxLhc/ixq4yBf9QAufOuqzYwwfGpoD96x73p9PhPovASEQE2Qq2fU1yZqstA+0vKMmZMA7rivcO6EsGr4AgKT58LNDTIwBvJkBFjgg9vie82r22zM2t1e4hgH8NSu0FAg2p278efeafmzYwhXktShTfCAeQEmOXrWWHkrM/Z/wBTbBr1yFd65KwO57rvZaI+tTttzQvsoXAdJlpsb5WzFsq8bkUUMYr04JB9SZvVxes/D7pLiXBcCy4CYtwEwG3SbpWTBugXQxLhuA8kW4bgGCS4LgGAyQEwMb7SZ8ePR6psvCeCytQJ/FwO3xInE83UVVhtxrm2i/7Q+58OB3+s7tr8HiYsuP8A7mN0H+pSP6zhWqXbS5EC0ApcBaDAmwSK4vz78+fnmyb9bxtk8eHqmvbVMp2BSiEbUACgDkmgO07T0Dr/AN66f96RQcmPG6vjNhfFRbI452ng8eRnLfYrIV6lptg3rlZsORWAIKOpDA38LP0nY9NoMWnwtiw41xpTkIg4trJmuTTG93dcd1/WMz5cmbKuK8p3EYloL/lB8uPX85hnKnnkAk36957tJjc4VPDqBRXzUj59/rzMbrQTydoNhQiigJMW8uN0+znpGTPmGpxZVxLp8lZD3y5bAtCvkhHmf1E6zc1HSew+nwZsWo0uTLp2TbuUEumQcFlIY3z86+E2vdKwe5LiboN0B7kuJcFwGJi3BcUmBdujBp5BkjjJA9O6TdKPEh8SBfug3SnfJvgXFopaVb4C8C3dOO+0LFNbq8WHZlVcuUP3OMbua7dwTVC51svOae3mjI125TtGoxKxCmja+6Sfn7v85nJrDrwfZvpB+01v/pYc2QD0Y0vby4czrb5QoLMQAoJYngADkkziPRtc+k1iZkHO7Zs8mDGitfp9J2DqmRfAz7qI8HLd8gjaZdpZpx/PkvNmbEQfEzZnUp2IZiR270DF6foXz63T6Zq9/MpcDyUe8/1oGAa3IvvbSpr0XZ+agUPQUJ7/AGITd1HTve9rzO4Wz4Y8NxZPzKj6yRvLWnYt0m6Ub4Q805rt0m6U75N8C7dBulW+AvAsLRd0rLQFoFYeOHlQWOBAsDw+JEAk2wLN8G+Ltk2wG8SKckFQEQCXmm/aPh3Jp3BorkZSRQO1ls/P8I4m37ZqP2g6csunYeTOL8rNEcevElXHrSQgDJkBe1dScjXwVIPF+k6n17VINFqch5DYdmOuztl91PpyT8lM5nr9I2JRucm1uhVfpzNo60h/ZOkKcqp07tZNn+zcA/Hlj+ckvjplPY1BchA8Mnb6M3I+hE2b7O0rPqSatcSAEdiCx8/oPzmr4tSGO08Wamb9i9R4Ov8ADJNZ8bIp/wAQ94fyBEk6ZcdK3yb4u2SptyPvk3RKhgPug3RakgHdBcFQhYF/hw7Z6SkUpAoqGpbtg2wK5I+2ArAWCNtg2wEqaz7bcjSrVg5iaHc0v/Jm0FZrvtZ0/UZFxZNNXiYHLBSQCQR+6Txdgd5Ksuq0TreTxCSL4AAFNxXy4mUTrGNulLpmJGRF20f8LcfyqeTUYepHcG07ix5rjNH4ETHfsXWHlsZX13lf0BjTVv1h7J3Nf4W+tG/0/rPdiztvx5k3F8ZV1A9VN8/Ces9By/w0ZXj6JqFNrY+RMaSZOi9K9qdPqQADserbE/Dj1r+IfETKLrUPnOXYukassrFqKng+Ymw6HT5x+NifpKy3Rc6mWBgZgNNjf4zLabG3nA9YEYJDjQy5UgVDHGXHLwkdVgOVgIltQEQKtsXbLSIKgVbZNstqCoFWyTZLagqBXsgOOXVJUDznAD5Ss6JT5CeypKgeA9OT0EX9lp6CZGoagY79mJ6CMvT0HkJ76kgeVdKo8pYMQl1SVArCQ7Y8kAARhBJA/9k=', 1, 1);

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
INSERT INTO `monster` (`id`, `name`, `health`, `damage`, `experience_reward`) VALUES (1, 'Ekimmara', 12, 3, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `monster_location`
-- -----------------------------------------------------
START TRANSACTION;
USE `witcherdb`;
INSERT INTO `monster_location` (`monster_id`, `location_id`) VALUES (1, 1);

COMMIT;

