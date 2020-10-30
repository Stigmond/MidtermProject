-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema crescendodb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `crescendodb` ;

-- -----------------------------------------------------
-- Schema crescendodb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `crescendodb` DEFAULT CHARACTER SET utf8 ;
USE `crescendodb` ;

-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(200) NOT NULL,
  `enabled` TINYINT NOT NULL DEFAULT 1,
  `role` VARCHAR(45) NULL,
  `created_at` DATETIME NULL,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `body` TEXT NULL,
  `avatar_url` VARCHAR(5000) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `artist`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `artist` ;

CREATE TABLE IF NOT EXISTS `artist` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `album`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `album` ;

CREATE TABLE IF NOT EXISTS `album` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(225) NOT NULL,
  `cover_url` VARCHAR(5000) NULL,
  `artist_id` INT NOT NULL,
  `description` VARCHAR(2000) NULL,
  `release_year` INT(4) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_album_artist1_idx` (`artist_id` ASC),
  CONSTRAINT `fk_album_artist1`
    FOREIGN KEY (`artist_id`)
    REFERENCES `artist` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `album_comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `album_comment` ;

CREATE TABLE IF NOT EXISTS `album_comment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `body` TEXT NOT NULL,
  `created_at` DATETIME NULL,
  `edited` TINYINT(1) NOT NULL DEFAULT 0,
  `creator_id` INT NOT NULL,
  `album_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_album_comment_user1_idx` (`creator_id` ASC),
  INDEX `fk_album_comment_album1_idx` (`album_id` ASC),
  CONSTRAINT `fk_album_comment_user1`
    FOREIGN KEY (`creator_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_album_comment_album1`
    FOREIGN KEY (`album_id`)
    REFERENCES `album` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `thread`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `thread` ;

CREATE TABLE IF NOT EXISTS `thread` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NULL,
  `creator` INT NULL,
  `created_at` DATETIME NULL,
  `creator_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_thread_user1_idx` (`creator_id` ASC),
  CONSTRAINT `fk_thread_user1`
    FOREIGN KEY (`creator_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `thread_comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `thread_comment` ;

CREATE TABLE IF NOT EXISTS `thread_comment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `body` TEXT NOT NULL,
  `created_at` DATETIME NULL,
  `edited` TINYINT(1) NOT NULL DEFAULT 0,
  `thread_id` INT NOT NULL,
  `creator_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_thread_comment_thread1_idx` (`thread_id` ASC),
  INDEX `fk_thread_comment_user1_idx` (`creator_id` ASC),
  CONSTRAINT `fk_thread_comment_thread1`
    FOREIGN KEY (`thread_id`)
    REFERENCES `thread` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_thread_comment_user1`
    FOREIGN KEY (`creator_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `blog`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `blog` ;

CREATE TABLE IF NOT EXISTS `blog` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NOT NULL,
  `creator_id` INT NOT NULL,
  `created_at` DATETIME NULL,
  `body` TEXT NOT NULL,
  `header_media_url` VARCHAR(5000) NULL,
  `edited` TINYINT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  INDEX `creatorId_idx` (`creator_id` ASC),
  CONSTRAINT `fk_blog_user`
    FOREIGN KEY (`creator_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `blog_comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `blog_comment` ;

CREATE TABLE IF NOT EXISTS `blog_comment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `body` TEXT NOT NULL,
  `created_at` DATETIME NULL,
  `edited` TINYINT(1) NOT NULL DEFAULT 0,
  `in_reply_id` INT NULL,
  `creator_id` INT NOT NULL,
  `blog_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_blog_comment_blog_comment1_idx` (`in_reply_id` ASC),
  INDEX `fk_blog_comment_user1_idx` (`creator_id` ASC),
  INDEX `fk_blog_comment_blog1_idx` (`blog_id` ASC),
  CONSTRAINT `fk_blog_comment_blog_comment1`
    FOREIGN KEY (`in_reply_id`)
    REFERENCES `blog_comment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_blog_comment_user1`
    FOREIGN KEY (`creator_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_blog_comment_blog1`
    FOREIGN KEY (`blog_id`)
    REFERENCES `blog` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trade`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `trade` ;

CREATE TABLE IF NOT EXISTS `trade` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `direction` ENUM('buy', 'sell') NOT NULL,
  `good_type` ENUM('record', 'instrument') NOT NULL,
  `body` TEXT NOT NULL,
  `creator_id` INT NOT NULL,
  `title` VARCHAR(225) NOT NULL,
  `created_at` DATETIME NULL,
  `active` TINYINT NULL,
  PRIMARY KEY (`id`),
  INDEX `creatorId_idx` (`creator_id` ASC),
  CONSTRAINT `fk_trade_user`
    FOREIGN KEY (`creator_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `genre`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `genre` ;

CREATE TABLE IF NOT EXISTS `genre` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `album_has_genre`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `album_has_genre` ;

CREATE TABLE IF NOT EXISTS `album_has_genre` (
  `genre_id` INT NOT NULL,
  `album_id` INT NOT NULL,
  PRIMARY KEY (`genre_id`, `album_id`),
  INDEX `fk_genre_has_album_album1_idx` (`album_id` ASC),
  INDEX `fk_genre_has_album_genre1_idx` (`genre_id` ASC),
  CONSTRAINT `fk_genre_has_album_genre1`
    FOREIGN KEY (`genre_id`)
    REFERENCES `genre` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_genre_has_album_album1`
    FOREIGN KEY (`album_id`)
    REFERENCES `album` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `thread_has_genre`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `thread_has_genre` ;

CREATE TABLE IF NOT EXISTS `thread_has_genre` (
  `thread_id` INT NOT NULL,
  `genre_id` INT NOT NULL,
  PRIMARY KEY (`thread_id`, `genre_id`),
  INDEX `fk_thread_has_genre_genre1_idx` (`genre_id` ASC),
  INDEX `fk_thread_has_genre_thread1_idx` (`thread_id` ASC),
  CONSTRAINT `fk_thread_has_genre_thread1`
    FOREIGN KEY (`thread_id`)
    REFERENCES `thread` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_thread_has_genre_genre1`
    FOREIGN KEY (`genre_id`)
    REFERENCES `genre` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `blog_has_genre`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `blog_has_genre` ;

CREATE TABLE IF NOT EXISTS `blog_has_genre` (
  `blog_id` INT NOT NULL,
  `genre_id` INT NOT NULL,
  PRIMARY KEY (`blog_id`, `genre_id`),
  INDEX `fk_blog_has_genre_genre1_idx` (`genre_id` ASC),
  INDEX `fk_blog_has_genre_blog1_idx` (`blog_id` ASC),
  CONSTRAINT `fk_blog_has_genre_blog1`
    FOREIGN KEY (`blog_id`)
    REFERENCES `blog` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_blog_has_genre_genre1`
    FOREIGN KEY (`genre_id`)
    REFERENCES `genre` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS dbaccess@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'dbaccess'@'localhost' IDENTIFIED BY 'dbaccess';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'dbaccess'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `crescendodb`;
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `created_at`, `first_name`, `last_name`, `body`, `avatar_url`) VALUES (1, 'admin', 'admin', 1, 'admin', NULL, 'TEX', 'CONNECTICUT', 'A DUMMY USER RECORD', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `artist`
-- -----------------------------------------------------
START TRANSACTION;
USE `crescendodb`;
INSERT INTO `artist` (`id`, `name`) VALUES (1, 'THE (255,255,255) STRIPES');

COMMIT;


-- -----------------------------------------------------
-- Data for table `album`
-- -----------------------------------------------------
START TRANSACTION;
USE `crescendodb`;
INSERT INTO `album` (`id`, `title`, `cover_url`, `artist_id`, `description`, `release_year`) VALUES (1, 'THE #FFFFFF ALBUM', NULL, 1, 'NOT WORTH LISTENING', 2019);

COMMIT;


-- -----------------------------------------------------
-- Data for table `album_comment`
-- -----------------------------------------------------
START TRANSACTION;
USE `crescendodb`;
INSERT INTO `album_comment` (`id`, `body`, `created_at`, `edited`, `creator_id`, `album_id`) VALUES (1, 'I LIKE THIS ALBUM', NULL, DEFAULT, 1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `thread`
-- -----------------------------------------------------
START TRANSACTION;
USE `crescendodb`;
INSERT INTO `thread` (`id`, `title`, `creator`, `created_at`, `creator_id`) VALUES (1, 'RANDOM DISCUSSION THREAD', 1, NULL, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `thread_comment`
-- -----------------------------------------------------
START TRANSACTION;
USE `crescendodb`;
INSERT INTO `thread_comment` (`id`, `body`, `created_at`, `edited`, `thread_id`, `creator_id`) VALUES (1, 'OH GODS WHY', NULL, DEFAULT, 1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `blog`
-- -----------------------------------------------------
START TRANSACTION;
USE `crescendodb`;
INSERT INTO `blog` (`id`, `title`, `creator_id`, `created_at`, `body`, `header_media_url`, `edited`) VALUES (1, 'BLOGS SUCK', 1, NULL, 'THEY REALLY DO SUCK', 'localhost', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `blog_comment`
-- -----------------------------------------------------
START TRANSACTION;
USE `crescendodb`;
INSERT INTO `blog_comment` (`id`, `body`, `created_at`, `edited`, `in_reply_id`, `creator_id`, `blog_id`) VALUES (1, 'THIS IS A BLOG COMMENT', NULL, 0, NULL, 1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `trade`
-- -----------------------------------------------------
START TRANSACTION;
USE `crescendodb`;
INSERT INTO `trade` (`id`, `direction`, `good_type`, `body`, `creator_id`, `title`, `created_at`, `active`) VALUES (1, 'buy', 'instrument', '$500 OBO', 1, 'Gibson Lucille', NULL, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `genre`
-- -----------------------------------------------------
START TRANSACTION;
USE `crescendodb`;
INSERT INTO `genre` (`id`, `name`) VALUES (1, 'NEO-CLASSICAL POST-METAL');

COMMIT;


-- -----------------------------------------------------
-- Data for table `album_has_genre`
-- -----------------------------------------------------
START TRANSACTION;
USE `crescendodb`;
INSERT INTO `album_has_genre` (`genre_id`, `album_id`) VALUES (1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `thread_has_genre`
-- -----------------------------------------------------
START TRANSACTION;
USE `crescendodb`;
INSERT INTO `thread_has_genre` (`thread_id`, `genre_id`) VALUES (1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `blog_has_genre`
-- -----------------------------------------------------
START TRANSACTION;
USE `crescendodb`;
INSERT INTO `blog_has_genre` (`blog_id`, `genre_id`) VALUES (1, 1);

COMMIT;

