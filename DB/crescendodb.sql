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
  `created_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
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
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP(),
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
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP(),
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
  `created_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP(),
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
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP(),
  `body` TEXT NOT NULL,
  `header_media_url` VARCHAR(5000) NULL,
  `edited` TINYINT NOT NULL DEFAULT 0,
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
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP(),
  `edited` TINYINT(1) NOT NULL DEFAULT 0,
  `creator_id` INT NOT NULL,
  `blog_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_blog_comment_user1_idx` (`creator_id` ASC),
  INDEX `fk_blog_comment_blog1_idx` (`blog_id` ASC),
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
  `direction` ENUM('buy', 'sell', 'trade') NOT NULL,
  `good_type` ENUM('record', 'instrument') NOT NULL,
  `body` TEXT NOT NULL,
  `creator_id` INT NOT NULL,
  `title` VARCHAR(225) NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP(),
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
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `created_at`, `first_name`, `last_name`, `body`, `avatar_url`) VALUES (1, 'admin', 'admin', 1, 'admin', NULL, 'TEX', 'CONNECTICUT', 'A DUMMY USER RECORD', 'https://cdn.cnn.com/cnnnext/dam/assets/191024091949-02-foster-cat-exlarge-169.jpg');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `created_at`, `first_name`, `last_name`, `body`, `avatar_url`) VALUES (2, 'b_e_n_d_e_r', 'bender', 1, 'commenter', NULL, 'BENDER', 'RODRIGUEZ', 'ROBOT', 'https://www.treehugger.com/thmb/Ey4GhFRzgX7R409EL0Eglha4kG0=/768x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/__opt__aboutcom__coeus__resources__content_migration__mnn__images__2019__12__KittenYawnsAndStretches-4f31069c48c24834aa823548ce0925b0.jpg');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `created_at`, `first_name`, `last_name`, `body`, `avatar_url`) VALUES (3, 'FryDay', 'fryday', 1, 'robot', NULL, 'PHILIP', 'FRY', 'DUDE', 'https://www.treehugger.com/thmb/a1w1uE6C-bPc3LwgoVEdvycKmUc=/500x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/__opt__aboutcom__coeus__resources__content_migration__mnn__images__2013__06__jump-play-kitty-43c1ce37ade24c71a7b91b0f6439cfa8.jpg');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `created_at`, `first_name`, `last_name`, `body`, `avatar_url`) VALUES (4, 'BugZapper', 'bugzapper', 1, 'monkey', NULL, 'ZAPP', 'BRANNIGAN', 'DUMBER DUDE', 'https://www.treehugger.com/thmb/6mt20Bvjmht6MMVGWJcDVVCJo0Q=/500x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/__opt__aboutcom__coeus__resources__content_migration__mnn__images__2013__06__halp-cat-5c5f3c0727e5442ea7f6282872836556.jpg');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `created_at`, `first_name`, `last_name`, `body`, `avatar_url`) VALUES (5, 'pr0f3ss0r', 'professor', 1, 'pirate', NULL, 'HUBERT', 'FARNSWORTH', 'PROFESSORIAL', 'https://www.treehugger.com/thmb/a3oTmwAmQp9FyXOrrp3cujYn7w8=/300x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/__opt__aboutcom__coeus__resources__content_migration__mnn__images__2013__06__cat-show-jump-0269d247e8cf410080310381a68a7cc3.jpg');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `created_at`, `first_name`, `last_name`, `body`, `avatar_url`) VALUES (6, 'richerthanYOU', 'richerthanyou', 0, 'zombie', NULL, 'AMY', 'WONG', 'OF THE MARS WONGS', 'https://www.treehugger.com/thmb/Ou0mrX8wJe9caroDda1NC_C4-fg=/300x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/__opt__aboutcom__coeus__resources__content_migration__mnn__images__2013__06__sphinx-cat-show-d966e6c083eb4fc3892bc580d1109dd5.jpg');

COMMIT;


-- -----------------------------------------------------
-- Data for table `artist`
-- -----------------------------------------------------
START TRANSACTION;
USE `crescendodb`;
INSERT INTO `artist` (`id`, `name`) VALUES (1, 'THE (255,255,255) STRIPES');
INSERT INTO `artist` (`id`, `name`) VALUES (2, 'FEAR OF A #000000 PLANET');
INSERT INTO `artist` (`id`, `name`) VALUES (3, 'GURGLING NOISE');
INSERT INTO `artist` (`id`, `name`) VALUES (4, 'DEMON CAMERA');

COMMIT;


-- -----------------------------------------------------
-- Data for table `album`
-- -----------------------------------------------------
START TRANSACTION;
USE `crescendodb`;
INSERT INTO `album` (`id`, `title`, `cover_url`, `artist_id`, `description`, `release_year`) VALUES (1, 'THE #FFFFFF ALBUM', 'https://cms-assets.tutsplus.com/uploads/users/114/posts/34296/final_image/Final-image.jpg', 1, 'IT\'S WHITE', 2019);
INSERT INTO `album` (`id`, `title`, `cover_url`, `artist_id`, `description`, `release_year`) VALUES (2, 'AQUAMARINE DREAMS', 'https://images-na.ssl-images-amazon.com/images/I/717VbeZb0bL._AC_SX679_.jpg', 3, 'RED SEEMS PRETTY SUS', 2002);
INSERT INTO `album` (`id`, `title`, `cover_url`, `artist_id`, `description`, `release_year`) VALUES (3, 'VIRGIN SACRIFICE', 'https://glide-assets-media.s3.amazonaws.com/wp-content/uploads/2013/10/21170545/Radiohead-Pablo-Honey-575x575.jpg', 2, 'WHY WOULD YOU CARE?', 2014);
INSERT INTO `album` (`id`, `title`, `cover_url`, `artist_id`, `description`, `release_year`) VALUES (4, 'TANGERINE FLAVORED', 'https://glide-assets-media.s3.amazonaws.com/wp-content/uploads/2013/10/21170554/AFI-The-Art-of-Drowning.jpg', 3, 'INSERT DESCRIPTION HERE', 2008);
INSERT INTO `album` (`id`, `title`, `cover_url`, `artist_id`, `description`, `release_year`) VALUES (5, 'ROSES ARE #FF0000', 'https://glide-assets-media.s3.amazonaws.com/wp-content/uploads/2013/10/21170602/Led-Zeppelin-III.jpg', 1, 'COLOR CODED', 1989);
INSERT INTO `album` (`id`, `title`, `cover_url`, `artist_id`, `description`, `release_year`) VALUES (6, 'FLOWER CANNIBAL', 'https://glide-assets-media.s3.amazonaws.com/wp-content/uploads/2013/10/21170536/Steve-Hackett-Defector.jpg', 2, 'NEGATIVE FEEDBACK', 1995);
INSERT INTO `album` (`id`, `title`, `cover_url`, `artist_id`, `description`, `release_year`) VALUES (7, 'FAILURE TRACE', 'https://glide-assets-media.s3.amazonaws.com/wp-content/uploads/2013/10/21170613/Outkast-Southern-301x300.jpg', 4, 'INTENTIONALLY LEFT BLANK', 2012);
INSERT INTO `album` (`id`, `title`, `cover_url`, `artist_id`, `description`, `release_year`) VALUES (8, 'THE #0000FF ALBUM', 'https://glide-assets-media.s3.amazonaws.com/wp-content/uploads/2013/10/21170807/Stevie-Wonder-In-Square-Circle.jpg', 1, 'IT\'S BLUE. NO, REALLY', 2001);
INSERT INTO `album` (`id`, `title`, `cover_url`, `artist_id`, `description`, `release_year`) VALUES (9, 'FORGOT TO GIVE THIS A TITLE', 'https://glide-assets-media.s3.amazonaws.com/wp-content/uploads/2013/10/21170622/The-Black-Keys-Brothers.jpg', 1, 'HAS ANYONE REALLY EVER BEEN FAR...', 2020);
INSERT INTO `album` (`id`, `title`, `cover_url`, `artist_id`, `description`, `release_year`) VALUES (10, 'HELP, I\'M TRAPPED IN A CD FACTORY', 'https://glide-assets-media.s3.amazonaws.com/wp-content/uploads/2013/10/21170626/The-Rolling-Stones-Dirty-Work-360x360.jpg', 2, 'KLAATU BARATA NICTO', 2009);

COMMIT;


-- -----------------------------------------------------
-- Data for table `album_comment`
-- -----------------------------------------------------
START TRANSACTION;
USE `crescendodb`;
INSERT INTO `album_comment` (`id`, `body`, `created_at`, `edited`, `creator_id`, `album_id`) VALUES (1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', DEFAULT, DEFAULT, 1, 1);
INSERT INTO `album_comment` (`id`, `body`, `created_at`, `edited`, `creator_id`, `album_id`) VALUES (2, 'Nam fermentum, diam eget semper pharetra, enim enim interdum leo, sed suscipit lorem erat eu lorem.', DEFAULT, DEFAULT, 2, 2);
INSERT INTO `album_comment` (`id`, `body`, `created_at`, `edited`, `creator_id`, `album_id`) VALUES (3, 'Cras dapibus aliquam augue sit amet posuere.', DEFAULT, DEFAULT, 3, 2);
INSERT INTO `album_comment` (`id`, `body`, `created_at`, `edited`, `creator_id`, `album_id`) VALUES (4, 'Curabitur in commodo felis.', DEFAULT, DEFAULT, 4, 3);
INSERT INTO `album_comment` (`id`, `body`, `created_at`, `edited`, `creator_id`, `album_id`) VALUES (5, 'Maecenas eget lacus suscipit nunc placerat pretium.', DEFAULT, DEFAULT, 5, 3);
INSERT INTO `album_comment` (`id`, `body`, `created_at`, `edited`, `creator_id`, `album_id`) VALUES (6, 'Curabitur purus massa, rhoncus sed gravida non, tristique sed ex.', DEFAULT, DEFAULT, 4, 3);
INSERT INTO `album_comment` (`id`, `body`, `created_at`, `edited`, `creator_id`, `album_id`) VALUES (7, 'Morbi scelerisque tortor ut dictum ullamcorper.', DEFAULT, DEFAULT, 1, 4);
INSERT INTO `album_comment` (`id`, `body`, `created_at`, `edited`, `creator_id`, `album_id`) VALUES (8, 'Suspendisse ornare lectus ut magna ornare viverra.', DEFAULT, DEFAULT, 3, 5);
INSERT INTO `album_comment` (`id`, `body`, `created_at`, `edited`, `creator_id`, `album_id`) VALUES (9, 'Donec gravida, nisi sit amet mattis interdum, orci neque porta lorem, eget venenatis ipsum diam at quam.', DEFAULT, DEFAULT, 5, 7);
INSERT INTO `album_comment` (`id`, `body`, `created_at`, `edited`, `creator_id`, `album_id`) VALUES (10, 'Duis iaculis blandit ex sed euismod. Vivamus sed faucibus arcu. Suspendisse nibh magna, vestibulum quis varius ac, faucibus sit amet mi.', DEFAULT, DEFAULT, 2, 7);
INSERT INTO `album_comment` (`id`, `body`, `created_at`, `edited`, `creator_id`, `album_id`) VALUES (11, 'Nulla facilisi. Suspendisse eu eleifend turpis, sed ultrices dui. Proin mollis, arcu at facilisis feugiat, augue leo tempus libero, in interdum metus ligula et mauris. Vestibulum vehicula neque sed mauris tempor, a mollis sem scelerisque. Maecenas nunc enim, hendrerit pellentesque lacinia vel, molestie id erat. Praesent vitae ultrices est. Nulla quis est nunc. Aenean nunc mauris, pellentesque eget risus eget, tincidunt euismod urna.', DEFAULT, DEFAULT, 2, 10);
INSERT INTO `album_comment` (`id`, `body`, `created_at`, `edited`, `creator_id`, `album_id`) VALUES (12, 'Phasellus in quam ut erat efficitur commodo vel a quam. Ut ultricies justo at eros blandit, vel consectetur ex suscipit. Donec eu metus ligula. Aliquam lacinia pellentesque fermentum. Fusce massa ligula, condimentum a lectus eu, convallis lobortis sapien. Vestibulum consequat pulvinar mauris sit amet tincidunt. Nam ultrices condimentum nunc eu tempor. Phasellus aliquam magna eget quam pulvinar dignissim.', DEFAULT, DEFAULT, 3, 1);
INSERT INTO `album_comment` (`id`, `body`, `created_at`, `edited`, `creator_id`, `album_id`) VALUES (13, 'Nulla ac lorem at orci pulvinar feugiat vitae eget mi. Sed eget tortor at odio tincidunt malesuada. Cras consectetur, neque eget vestibulum condimentum, sem tellus auctor nulla, id laoreet tortor massa tincidunt tortor. Suspendisse potenti.', DEFAULT, DEFAULT, 4, 2);
INSERT INTO `album_comment` (`id`, `body`, `created_at`, `edited`, `creator_id`, `album_id`) VALUES (14, 'Curabitur sagittis magna sapien. Morbi tincidunt libero nisi, ac laoreet metus fringilla tempor. Vivamus vel gravida risus.', DEFAULT, DEFAULT, 1, 2);
INSERT INTO `album_comment` (`id`, `body`, `created_at`, `edited`, `creator_id`, `album_id`) VALUES (15, 'Mauris condimentum nisl ut ex porta rhoncus.', DEFAULT, DEFAULT, 5, 3);
INSERT INTO `album_comment` (`id`, `body`, `created_at`, `edited`, `creator_id`, `album_id`) VALUES (16, 'Curabitur pulvinar felis eget dolor vestibulum rhoncus. Praesent non enim urna. Morbi rutrum dui at dolor feugiat cursus. Morbi bibendum, nunc a porttitor varius, augue dolor semper diam, sed dignissim sem lectus a tellus. Quisque egestas egestas dolor sit amet porttitor. Suspendisse potenti.', DEFAULT, DEFAULT, 3, 3);
INSERT INTO `album_comment` (`id`, `body`, `created_at`, `edited`, `creator_id`, `album_id`) VALUES (17, 'In non est ac sapien interdum aliquet. Ut ut urna id risus molestie sollicitudin. Aenean in vestibulum mi. Sed vel porttitor dui, nec dignissim massa. Donec mauris velit, accumsan ac mauris in, condimentum rutrum est. Fusce tincidunt feugiat lectus sit amet imperdiet. Sed rhoncus neque in mauris placerat sollicitudin.', DEFAULT, DEFAULT, 2, 4);
INSERT INTO `album_comment` (`id`, `body`, `created_at`, `edited`, `creator_id`, `album_id`) VALUES (18, 'Aliquam erat volutpat. Morbi pellentesque nisl velit, a dictum magna fermentum mattis. Aliquam ac faucibus ligula. Proin vitae diam facilisis, ornare lectus sollicitudin, volutpat nulla. ', DEFAULT, DEFAULT, 1, 5);
INSERT INTO `album_comment` (`id`, `body`, `created_at`, `edited`, `creator_id`, `album_id`) VALUES (19, 'Nulla posuere ornare condimentum. Nam vel elit neque. Mauris blandit, turpis eu hendrerit blandit, arcu erat rhoncus velit, ut imperdiet nisi arcu ut nibh.', DEFAULT, DEFAULT, 4, 5);
INSERT INTO `album_comment` (`id`, `body`, `created_at`, `edited`, `creator_id`, `album_id`) VALUES (20, 'Aenean lorem diam, laoreet vel laoreet et, rutrum eget nisl. Ut sit amet turpis magna. Integer ullamcorper ac diam a consequat. Quisque ante urna, imperdiet ac tellus in, porta aliquet sem. Morbi velit arcu, laoreet at faucibus at, porta mattis nulla.', DEFAULT, DEFAULT, 5, 4);

COMMIT;


-- -----------------------------------------------------
-- Data for table `thread`
-- -----------------------------------------------------
START TRANSACTION;
USE `crescendodb`;
INSERT INTO `thread` (`id`, `title`, `created_at`, `creator_id`) VALUES (1, 'RANDOM DISCUSSION THREAD', DEFAULT, 1);
INSERT INTO `thread` (`id`, `title`, `created_at`, `creator_id`) VALUES (2, 'WHY DID SNAPE KILL DUMBLEDORE? (SPOILERS)', DEFAULT, 2);
INSERT INTO `thread` (`id`, `title`, `created_at`, `creator_id`) VALUES (3, 'HAMMING ORACLE', DEFAULT, 2);
INSERT INTO `thread` (`id`, `title`, `created_at`, `creator_id`) VALUES (4, 'DIRT FARM', DEFAULT, 4);
INSERT INTO `thread` (`id`, `title`, `created_at`, `creator_id`) VALUES (5, 'JESUS DIES AT THE END (SPOILERS)', DEFAULT, 6);

COMMIT;


-- -----------------------------------------------------
-- Data for table `thread_comment`
-- -----------------------------------------------------
START TRANSACTION;
USE `crescendodb`;
INSERT INTO `thread_comment` (`id`, `body`, `created_at`, `edited`, `thread_id`, `creator_id`) VALUES (1, 'OH GODS WHY', NULL, DEFAULT, 1, 1);
INSERT INTO `thread_comment` (`id`, `body`, `created_at`, `edited`, `thread_id`, `creator_id`) VALUES (2, 'In sit amet aliquet tellus. Vestibulum auctor vulputate massa, a venenatis leo dapibus sed. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Pellentesque finibus sapien sit amet tempus posuere. Aenean eget semper neque. Sed accumsan laoreet lacinia. Duis rhoncus sem nulla, eget laoreet leo porta id. Mauris ante lacus, pharetra tincidunt odio at, maximus fermentum erat. Sed pharetra, magna in vulputate aliquet, mauris sem tempus urna, ac lacinia justo odio et mauris. Vestibulum faucibus est vel porta auctor. Nullam non feugiat arcu. Nam ac nisi bibendum, fringilla leo ut, pretium augue.', NULL, DEFAULT, 1, 2);
INSERT INTO `thread_comment` (`id`, `body`, `created_at`, `edited`, `thread_id`, `creator_id`) VALUES (3, 'Proin pulvinar sem tristique tellus euismod aliquam. Etiam in interdum turpis, a luctus tellus. Sed id erat tincidunt, egestas massa et, euismod metus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vivamus ut augue molestie, posuere eros ut, ornare turpis. Aliquam luctus justo vitae mollis egestas. Curabitur molestie quam augue, nec lobortis ex malesuada eu. Mauris eget felis a eros commodo lacinia. Morbi porttitor eu arcu et faucibus. Sed faucibus erat quis enim elementum iaculis. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean vel quam libero. Curabitur enim augue, gravida ut diam ac, vulputate rhoncus velit. Donec sodales viverra libero et luctus.', NULL, DEFAULT, 1, 3);
INSERT INTO `thread_comment` (`id`, `body`, `created_at`, `edited`, `thread_id`, `creator_id`) VALUES (4, 'Sed eu ipsum id tortor fermentum tempus. Duis efficitur augue id velit commodo, eu consequat nulla consectetur. Vestibulum ut tortor laoreet, mollis sem non, sagittis dui. Etiam et auctor diam. Proin nulla dui, commodo quis auctor non, dictum ac neque. Ut eget eleifend massa, nec ornare ipsum. Mauris quis facilisis mauris, ullamcorper vulputate orci. Sed in venenatis nulla, vitae malesuada mauris.', NULL, DEFAULT, 1, 4);
INSERT INTO `thread_comment` (`id`, `body`, `created_at`, `edited`, `thread_id`, `creator_id`) VALUES (5, 'Aliquam vehicula lorem ac sollicitudin vehicula. Ut posuere ultricies est eu vestibulum. Aliquam non ullamcorper dolor. Ut volutpat turpis sit amet lacus bibendum finibus at sed purus. Maecenas ultricies nisi urna, non tempor augue feugiat sit amet. Pellentesque ut mauris vel sapien commodo mollis ac ac leo. Curabitur tristique id metus finibus faucibus. Duis elementum mauris vel libero molestie, sit amet dictum erat pharetra.', NULL, DEFAULT, 1, 5);
INSERT INTO `thread_comment` (`id`, `body`, `created_at`, `edited`, `thread_id`, `creator_id`) VALUES (6, 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Donec est purus, tempus id diam vel, aliquet finibus enim. Etiam in tempus dui. Curabitur a tincidunt libero, eleifend faucibus lorem. Pellentesque id urna nibh. Nunc pulvinar venenatis risus, vitae finibus ex aliquet ac. Praesent ultrices finibus nibh ac molestie. Mauris ac tristique ipsum, sed tempus nulla. Morbi congue nulla purus, at finibus augue aliquam eu. Vestibulum ac efficitur mi, at fringilla orci. Ut vel vestibulum nulla. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Cras ac tempor mauris. Donec lacinia nec odio vitae malesuada.', NULL, DEFAULT, 2, 6);
INSERT INTO `thread_comment` (`id`, `body`, `created_at`, `edited`, `thread_id`, `creator_id`) VALUES (7, 'Proin lobortis eu sem a dignissim. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent et arcu aliquet, pulvinar erat sit amet, sollicitudin nisl. Vivamus aliquam pellentesque metus eu suscipit. Aenean ac odio non augue volutpat laoreet. Donec sed odio at lectus ultrices feugiat vel a elit. Sed non est elementum, viverra eros vel, consectetur ipsum. Proin tincidunt mi blandit mauris rutrum, id venenatis sem varius. Vestibulum in mi at libero suscipit rhoncus a vel lectus. Integer eget turpis a est interdum volutpat nec a libero.', NULL, DEFAULT, 2, 1);
INSERT INTO `thread_comment` (`id`, `body`, `created_at`, `edited`, `thread_id`, `creator_id`) VALUES (8, 'Cras eleifend volutpat diam, a vulputate libero imperdiet eu. Nulla tincidunt venenatis odio, eget rutrum lacus varius ut. Sed varius odio non nisi volutpat, vel porta metus facilisis. Donec sed gravida lectus. Duis et velit volutpat, iaculis erat sed, commodo sem. Interdum et malesuada fames ac ante ipsum primis in faucibus. Nulla eleifend, nisi et aliquet placerat, lacus justo venenatis ipsum, sed feugiat risus dui ac tortor. Pellentesque sollicitudin augue ut elit pharetra, et gravida risus scelerisque. Phasellus aliquet pulvinar ligula, et fermentum nibh dignissim eget. Phasellus rhoncus lorem at posuere convallis. Duis quam leo, mattis vitae aliquam in, mollis at nibh. Aenean feugiat porta tellus, a tempor est finibus at. Vivamus pretium risus et augue consequat, sit amet pretium nisl lacinia. Praesent est erat, efficitur ut nulla non, sollicitudin faucibus odio.', NULL, DEFAULT, 2, 2);
INSERT INTO `thread_comment` (`id`, `body`, `created_at`, `edited`, `thread_id`, `creator_id`) VALUES (9, 'Pellentesque a eleifend orci. Vestibulum bibendum posuere libero eu varius. Fusce vel augue sed mi scelerisque condimentum. Nullam ligula nisi, euismod ut risus eu, venenatis faucibus odio. Vestibulum ac auctor leo. Mauris orci lectus, hendrerit in mollis in, lobortis ac metus. Donec dictum velit ut vehicula malesuada. Pellentesque ex felis, tempor non metus et, finibus blandit libero. Praesent tristique blandit nisl, ut ullamcorper velit lobortis eu. Vivamus aliquet justo eu pellentesque pretium. Nunc eget scelerisque nunc. Phasellus accumsan dictum sapien at tristique. Proin a ex sapien. Pellentesque pretium congue ipsum ac ultrices. In a sagittis risus, in luctus nunc. Duis cursus ac metus vel aliquet.', NULL, DEFAULT, 2, 3);
INSERT INTO `thread_comment` (`id`, `body`, `created_at`, `edited`, `thread_id`, `creator_id`) VALUES (10, 'Nulla faucibus mauris sed mi sollicitudin posuere. Donec ac sapien molestie augue lacinia viverra vitae et nibh. Phasellus a massa varius, fermentum sapien vel, eleifend odio. Integer interdum, magna elementum auctor ornare, est magna pulvinar leo, ut pulvinar tellus massa eu augue. Etiam pharetra eu neque id maximus. Morbi laoreet fermentum eleifend. Praesent felis diam, pellentesque a diam non, rutrum sodales arcu. Ut lacinia placerat ligula at placerat. Praesent eget sagittis nisl, ac varius mauris. Praesent consectetur gravida consequat. Vestibulum dui tellus, pretium sed est at, dignissim euismod eros. Morbi pulvinar libero sit amet velit viverra, quis tempus tortor porttitor. Vivamus id nisl lorem. Ut tellus nulla, porttitor ultrices leo non, viverra dignissim odio. Nunc suscipit cursus nulla, mollis condimentum leo congue maximus.\n', NULL, DEFAULT, 2, 4);
INSERT INTO `thread_comment` (`id`, `body`, `created_at`, `edited`, `thread_id`, `creator_id`) VALUES (11, 'Aenean posuere eleifend diam. Curabitur neque ex, finibus et ullamcorper sed, congue at ante. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nullam sit amet ex porta nisi faucibus fermentum. Curabitur sed porta turpis, et fermentum leo. Nam purus mi, semper ut imperdiet ac, efficitur vel dolor. Nulla eu ex ornare, venenatis risus eget, ullamcorper diam.', NULL, DEFAULT, 3, 5);
INSERT INTO `thread_comment` (`id`, `body`, `created_at`, `edited`, `thread_id`, `creator_id`) VALUES (12, 'Ut nibh nisi, scelerisque ut pharetra eu, gravida eu eros. Phasellus in augue ex. Curabitur dignissim, tellus id varius ultrices, est felis fermentum urna, vestibulum tempor dui magna ac nulla. Vestibulum aliquam ipsum quis massa gravida gravida. Aenean nec pretium est. Maecenas ac est mauris. Cras sagittis eu ante venenatis lacinia. Duis non neque scelerisque, euismod diam at, accumsan felis. Integer dapibus lectus urna, vel accumsan metus feugiat eu. Curabitur tempor libero fringilla lacus sollicitudin, a elementum neque semper.', NULL, DEFAULT, 3, 6);
INSERT INTO `thread_comment` (`id`, `body`, `created_at`, `edited`, `thread_id`, `creator_id`) VALUES (13, 'Sed eget varius elit. Ut consequat eros sed diam posuere, id molestie augue bibendum. Fusce nisi nisi, faucibus vel iaculis quis, rhoncus dignissim ex. Ut felis elit, imperdiet et nibh gravida, vehicula elementum nibh. Vivamus facilisis arcu eget dolor tempus, nec iaculis augue accumsan. Sed suscipit ac quam at pulvinar. Ut semper ut lorem quis efficitur. Nam blandit in ligula eu finibus. Morbi sed laoreet risus. Vivamus vestibulum posuere gravida. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque sodales volutpat purus sed porta.\n', NULL, DEFAULT, 3, 1);
INSERT INTO `thread_comment` (`id`, `body`, `created_at`, `edited`, `thread_id`, `creator_id`) VALUES (14, 'Proin iaculis fermentum tortor, vitae commodo nunc molestie sit amet. Sed fermentum vestibulum tempor. Quisque viverra nibh et velit vulputate facilisis. Phasellus ut mollis lorem, porttitor pretium velit. Maecenas vel aliquam nunc. Vestibulum aliquam purus non commodo fermentum. Morbi a felis in urna tincidunt maximus id eget diam. Nunc fermentum consequat nunc, vitae lacinia sem egestas eu. Phasellus fringilla arcu nec bibendum venenatis. Suspendisse id finibus metus. Nullam erat erat, varius eleifend convallis sed, ullamcorper et nibh. Duis condimentum dolor nisi, vitae placerat nunc aliquam id. Fusce a mi porttitor, egestas velit non, vestibulum tellus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.\n', NULL, DEFAULT, 3, 2);
INSERT INTO `thread_comment` (`id`, `body`, `created_at`, `edited`, `thread_id`, `creator_id`) VALUES (15, 'In et maximus metus, eu pretium justo. Aliquam erat volutpat. Suspendisse risus massa, tempus quis mi maximus, consectetur euismod ligula. Nam quis ligula ac nibh faucibus vehicula. Aenean ipsum ipsum, aliquam a congue sit amet, hendrerit quis lacus. Pellentesque tellus neque, egestas at ante nec, lacinia tristique erat. Nulla condimentum elit quis arcu venenatis, ac consequat neque feugiat.', NULL, DEFAULT, 3, 3);
INSERT INTO `thread_comment` (`id`, `body`, `created_at`, `edited`, `thread_id`, `creator_id`) VALUES (16, 'Cras volutpat, turpis ac condimentum venenatis, est urna sodales augue, non fermentum eros orci vitae risus. Curabitur maximus, lacus vitae suscipit venenatis, justo nisi posuere justo, sit amet euismod massa lorem nec enim. Donec elementum, lorem ut rutrum placerat, ligula mauris placerat metus, ornare sollicitudin diam risus sit amet lectus. Etiam suscipit bibendum dolor, ut vestibulum justo tempor a. Curabitur ut finibus nibh. Donec mollis, nisl vitae gravida vulputate, ligula nisi luctus mi, et facilisis nisi ante vitae diam. Fusce quis iaculis sem, eu faucibus odio. Aliquam consequat magna eros, ut congue urna malesuada ac. Maecenas fermentum ornare nisl accumsan tristique. Suspendisse imperdiet velit nibh, ac vehicula nunc scelerisque vitae. Maecenas suscipit tempus accumsan. Etiam ornare augue blandit ornare maximus.', NULL, DEFAULT, 4, 4);
INSERT INTO `thread_comment` (`id`, `body`, `created_at`, `edited`, `thread_id`, `creator_id`) VALUES (17, 'Nunc vehicula felis eu leo iaculis, at convallis nibh imperdiet. Integer lacinia augue felis, sit amet ornare metus semper ut. Proin finibus efficitur metus vel porta. Donec consectetur porttitor scelerisque. Aenean lacinia scelerisque lorem, porttitor molestie erat egestas ac. Integer suscipit mauris sem, at ultricies neque volutpat a. Cras auctor orci a varius accumsan. Maecenas rutrum mi eget urna cursus, id condimentum diam mollis. Donec eget ornare risus. Maecenas eu neque malesuada ligula ultrices luctus a quis massa. Nullam nibh dolor, finibus vel condimentum et, blandit at risus. Quisque sit amet massa sit amet ipsum tincidunt viverra et vitae libero. Sed blandit ultricies metus vel porttitor.', NULL, DEFAULT, 4, 5);
INSERT INTO `thread_comment` (`id`, `body`, `created_at`, `edited`, `thread_id`, `creator_id`) VALUES (18, 'Donec faucibus, nunc in tincidunt molestie, libero dolor vehicula lectus, nec consectetur nunc lectus tempor lectus. Duis bibendum erat ut justo elementum, quis malesuada diam eleifend. Aliquam imperdiet dui eu ullamcorper accumsan. Etiam semper tortor at enim interdum interdum. Etiam pretium vel ligula et rhoncus. Morbi ipsum nulla, gravida nec libero sit amet, feugiat iaculis lacus. Maecenas ut varius lectus, eget varius urna. Morbi tortor nulla, fermentum eu quam pellentesque, laoreet semper dui. Vivamus ultricies vulputate tortor ac hendrerit.', NULL, DEFAULT, 4, 6);
INSERT INTO `thread_comment` (`id`, `body`, `created_at`, `edited`, `thread_id`, `creator_id`) VALUES (19, 'In sed eleifend eros. Mauris odio odio, vehicula ac euismod eu, malesuada id urna. Suspendisse at metus nec mi sollicitudin tempor vel vitae ante. Nam sapien nulla, volutpat ac mollis a, sodales id nulla. Duis sed velit id erat rhoncus rhoncus eget sed mi. Integer consequat risus nec lectus lacinia consectetur. Ut pharetra orci lectus, nec imperdiet nulla pulvinar et. Nullam non ullamcorper magna. Aliquam eget rhoncus urna. Maecenas imperdiet sapien ac malesuada blandit. Curabitur tempus mattis nulla ac eleifend. Nullam scelerisque pellentesque lacinia. Quisque nec metus eu lorem facilisis suscipit. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Sed efficitur nisi vel imperdiet tincidunt. Nulla fringilla metus quis turpis congue ultrices.', NULL, DEFAULT, 4, 1);
INSERT INTO `thread_comment` (`id`, `body`, `created_at`, `edited`, `thread_id`, `creator_id`) VALUES (20, 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Vestibulum consequat, nisi eleifend lobortis consequat, ex sapien tempor ipsum, congue efficitur metus ipsum vitae massa. Etiam venenatis urna a quam congue, a semper leo ornare. Fusce pharetra ex nec justo ornare sagittis. Donec ut enim mauris. Donec dignissim orci quis justo ultrices, eu tincidunt dui pellentesque. Ut consectetur ex eget erat dignissim lacinia. Praesent ut magna vitae nisi vulputate convallis eu at neque. In lacus felis, viverra et venenatis eu, tempus ac ante.', NULL, DEFAULT, 4, 2);
INSERT INTO `thread_comment` (`id`, `body`, `created_at`, `edited`, `thread_id`, `creator_id`) VALUES (21, 'Praesent dictum efficitur massa, in laoreet justo suscipit sit amet. Morbi at metus consectetur, mattis tortor ut, fringilla justo. Aliquam laoreet auctor semper. Curabitur lobortis euismod commodo. In vitae erat ligula. Sed mollis massa id elit imperdiet imperdiet. Nulla viverra lacus quis risus laoreet cursus. Donec sit amet leo est. Morbi interdum tempor finibus. Suspendisse fermentum lectus eu eros semper aliquet. Etiam et dui ac libero vulputate congue id non ligula. Integer in tortor a lacus cursus aliquam.', NULL, DEFAULT, 5, 3);
INSERT INTO `thread_comment` (`id`, `body`, `created_at`, `edited`, `thread_id`, `creator_id`) VALUES (22, 'Curabitur enim libero, vestibulum sit amet nibh eu, interdum scelerisque risus. Sed dignissim tellus finibus ante gravida, nec sodales nibh maximus. Curabitur ullamcorper pellentesque mi at ultrices. Nulla facilisi. Nunc velit urna, venenatis in magna et, malesuada molestie nunc. Mauris eu vestibulum ante. Suspendisse dictum ultrices finibus. Nam ac enim sit amet lectus auctor blandit eu laoreet felis.', NULL, DEFAULT, 5, 4);
INSERT INTO `thread_comment` (`id`, `body`, `created_at`, `edited`, `thread_id`, `creator_id`) VALUES (23, 'In eleifend, orci non ornare convallis, ex nulla condimentum enim, eu rutrum mauris dolor ac ipsum. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nulla at mi malesuada, blandit elit ut, pulvinar orci. Praesent gravida nulla et lorem congue posuere. Maecenas ornare consectetur eros, eget luctus odio efficitur non. Aenean aliquet ac lacus posuere semper. Praesent dapibus massa sit amet feugiat lacinia. Ut et nunc varius, blandit dui tincidunt, sodales ex. Nam eu augue risus.', NULL, DEFAULT, 5, 5);
INSERT INTO `thread_comment` (`id`, `body`, `created_at`, `edited`, `thread_id`, `creator_id`) VALUES (24, 'Curabitur leo elit, bibendum vel nunc eget, pellentesque accumsan est. Donec lobortis luctus ullamcorper. Integer vitae elit non nisi scelerisque commodo. Mauris laoreet nec magna in maximus. Integer mattis metus sed mattis hendrerit. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Pellentesque consectetur volutpat elit non sodales. Sed porttitor velit at magna lacinia volutpat scelerisque nec nibh. Sed ante lectus, bibendum sit amet egestas sed, commodo eget tortor. Mauris ultrices tristique placerat. Cras id nibh in velit laoreet ornare. Nam bibendum urna porta pharetra volutpat. Maecenas eleifend sollicitudin turpis consectetur tempor. Nunc vitae erat purus. Vestibulum fermentum ut mi non efficitur. Donec vestibulum turpis ac ante vestibulum, sed bibendum urna blandit.', NULL, DEFAULT, 5, 6);

COMMIT;


-- -----------------------------------------------------
-- Data for table `blog`
-- -----------------------------------------------------
START TRANSACTION;
USE `crescendodb`;
INSERT INTO `blog` (`id`, `title`, `creator_id`, `created_at`, `body`, `header_media_url`, `edited`) VALUES (1, 'BLOGS SUCK', 1, DEFAULT, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam pellentesque nisl diam, eget rutrum est faucibus id. Integer aliquam sodales fermentum. Pellentesque a dolor sed felis venenatis feugiat. Fusce commodo felis ut viverra sollicitudin. Sed egestas vestibulum magna ut placerat. Pellentesque consequat nisi in sapien finibus malesuada. Curabitur quis rutrum tortor, vitae porta lorem. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Nunc porttitor justo eget pellentesque venenatis. Pellentesque vel enim imperdiet, laoreet nunc at, consequat quam. Nullam eget sapien sem. Maecenas luctus arcu sed maximus maximus. Vivamus sagittis turpis id orci porta, sit amet aliquet mauris convallis.', 'https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/04/12185602/Lagotto-Romangolo-Tongue-Out.jpg', DEFAULT);
INSERT INTO `blog` (`id`, `title`, `creator_id`, `created_at`, `body`, `header_media_url`, `edited`) VALUES (2, 'HOW TO TELL IF YOU SPEND TOO MUCH ON PINEAPPLES', 2, DEFAULT, 'Etiam tempus ante eget auctor lacinia. Nulla elit eros, ultricies quis aliquet eget, suscipit ac tellus. Maecenas pulvinar, ante eu mollis eleifend, dolor ligula euismod urna, ut suscipit ipsum enim tincidunt nibh. Quisque et orci ac dui aliquam rutrum et at dui. Mauris quis molestie dui, sed iaculis justo. Aenean nec sem non nulla sodales luctus et ut felis. Quisque a vulputate odio, ac lacinia purus.\n\nUt ut lorem rhoncus, laoreet lacus ac, auctor sem. Curabitur porttitor viverra tortor, vel tincidunt mauris pulvinar in. Nam eget rutrum nunc, id egestas enim. Fusce dictum efficitur diam, at posuere lorem elementum pretium. Duis id nunc porttitor sem condimentum convallis ut molestie arcu. Ut elementum purus velit, at fermentum massa tempor eu. Nunc eu justo non velit aliquam congue. Quisque finibus consectetur porta. Integer id augue lacus. Aenean maximus aliquam justo et tristique. Mauris facilisis odio at diam tincidunt, a malesuada massa fermentum. Sed mollis est quis eros consequat, eget tincidunt dui laoreet. Nulla suscipit a ante efficitur dapibus.', 'http://cdn.akc.org/content/article-body-image/keeshond_dog_pictures.jpg', DEFAULT);
INSERT INTO `blog` (`id`, `title`, `creator_id`, `created_at`, `body`, `header_media_url`, `edited`) VALUES (3, 'ACADEMY DINOSAUR AND FREEFORM JAZZ IN CINEMA', 3, DEFAULT, 'In vehicula turpis vel lacus viverra, ac tempor odio iaculis. Nam non luctus lacus. Proin risus nibh, lacinia in ex eget, congue malesuada libero. Duis vulputate tempus orci in tempor. Etiam vitae hendrerit massa. Nunc consectetur ipsum quis pretium iaculis. Aenean ultrices, odio eget faucibus porttitor, eros odio pharetra arcu, sit amet cursus nisi leo eu dolor. In scelerisque molestie velit non congue. Nulla facilisi. Donec pharetra consectetur orci quis tincidunt. Nam vulputate, massa vitae sodales pulvinar, ante augue suscipit sem, ac euismod elit massa vel nunc.', 'http://cdn.akc.org/content/article-body-image/newfoundland_dog_pictures.jpg', DEFAULT);
INSERT INTO `blog` (`id`, `title`, `creator_id`, `created_at`, `body`, `header_media_url`, `edited`) VALUES (4, 'THE JAZZ MONSTER', 4, DEFAULT, 'Vivamus molestie tincidunt magna non ultrices. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc magna ligula, gravida ac scelerisque a, finibus sit amet dolor. In varius scelerisque est ut semper. Phasellus ligula lectus, dignissim eu magna quis, condimentum accumsan ipsum. Donec lectus elit, gravida vitae nunc a, convallis auctor tortor. Sed blandit turpis augue, nec pretium est euismod ac. Praesent at porta tellus, in vulputate dolor.\n\nNam viverra velit et nisi pharetra fringilla. Quisque sed urna lectus. Proin laoreet mauris felis, sed euismod mauris hendrerit eget. Integer tincidunt dolor leo, eget interdum quam dictum sed. Suspendisse potenti. Suspendisse tristique ipsum id nisi porttitor, in congue libero egestas. Vestibulum imperdiet lectus eros, ut viverra lacus dictum at. Donec vitae massa venenatis, mattis libero quis, tincidunt justo. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas venenatis tortor vitae lobortis feugiat. Sed at erat gravida, lobortis augue eget, vehicula ex. Aliquam ut varius odio. Nam et urna quis nisl vestibulum suscipit nec a libero. Praesent placerat ut tortor eu hendrerit.', 'http://cdn.akc.org/content/article-body-image/golden_puppy_dog_pictures.jpg', DEFAULT);
INSERT INTO `blog` (`id`, `title`, `creator_id`, `created_at`, `body`, `header_media_url`, `edited`) VALUES (5, 'THIS BLOG POST IS FULL OF SPIDERS', 5, DEFAULT, 'Nam iaculis dolor et porta bibendum. Curabitur ac molestie neque. Duis ut rhoncus nibh, et lobortis felis. Vestibulum facilisis et lacus dignissim fermentum. Aliquam laoreet eleifend bibendum. Aenean pulvinar fermentum nibh eget imperdiet. Donec lacus enim, molestie at mauris vitae, luctus euismod tellus. Quisque in lectus consectetur, iaculis odio vulputate, volutpat nulla. Morbi volutpat hendrerit est ac faucibus. Curabitur vel ultrices eros. Suspendisse facilisis quis augue in interdum. Nunc luctus, metus eget elementum varius, est magna iaculis enim, id efficitur purus est sit amet ex.\n\nDonec quis diam nibh. Proin ac metus placerat, posuere est non, pharetra nulla. Proin lobortis felis tortor, eu lacinia arcu rhoncus a. Integer nec nibh sapien. Integer scelerisque quam nec rutrum interdum. In porttitor lectus velit, non aliquet neque aliquam vitae. Proin eget dolor tincidunt, vulputate massa at, luctus nunc. Nulla hendrerit, sem suscipit tristique vestibulum, risus leo tincidunt nulla, in cursus eros lacus vel justo. Nam pulvinar purus odio, bibendum pretium nibh euismod convallis. Mauris a scelerisque eros, ut mollis quam. Nullam posuere tellus luctus justo semper, eu ornare lectus mattis. Vestibulum mattis fringilla lobortis. Suspendisse ac lobortis risus. Pellentesque interdum magna libero, porta consequat orci porttitor efficitur.\n\nPhasellus cursus nulla turpis, id ullamcorper purus dictum sed. Nunc bibendum nulla augue. Praesent rutrum nisi ornare finibus sagittis. Nunc commodo varius felis sed venenatis. Donec ac tempor tellus. Sed neque libero, tempor ac tempus eget, laoreet in nisl. Mauris mollis viverra accumsan.', 'http://cdn.akc.org/content/article-body-image/schipperke_dog_pictures.jpg', DEFAULT);
INSERT INTO `blog` (`id`, `title`, `creator_id`, `created_at`, `body`, `header_media_url`, `edited`) VALUES (6, 'GUITAR SMUGGLING IN SOMALIA', 6, DEFAULT, 'Vestibulum ullamcorper semper vulputate. Duis et magna auctor, aliquam ipsum eget, mollis neque. Vivamus condimentum dignissim convallis. Suspendisse vel dui nunc. Vestibulum sit amet tincidunt nibh. Pellentesque varius nisi sit amet arcu elementum placerat. Nam nec elit ut dui viverra auctor. Donec massa odio, pulvinar ut placerat non, ultricies quis risus. Maecenas egestas gravida ex, nec blandit sem pharetra eget. Fusce sodales lobortis justo viverra venenatis. Pellentesque eget convallis ante, et tincidunt tortor. Cras aliquam, ipsum id varius venenatis, nunc est pellentesque nulla, vel pellentesque ipsum nisl ac neque.\n\nDuis cursus, est vel pretium mollis, arcu orci porttitor erat, sit amet rhoncus neque sapien condimentum sem. Proin malesuada libero enim, in maximus ex mollis quis. Aenean vitae dui ac mi rhoncus ultricies quis eget enim. Phasellus interdum est id nisl commodo, vel tincidunt velit maximus. Cras tincidunt arcu vitae eleifend semper. Ut id enim a justo laoreet ultrices vel sit amet lacus. Quisque eu nibh tincidunt, porttitor velit vel, porta turpis. Integer turpis augue, tincidunt sed nulla at, tincidunt accumsan tortor. Maecenas eu risus vitae mauris congue dictum. Donec ac massa ac ex laoreet pellentesque. Vivamus eu nunc a ex gravida faucibus sit amet in turpis. In lobortis massa hendrerit turpis volutpat, vel molestie nisl mollis. Sed malesuada lacinia risus, sit amet pretium elit euismod bibendum.', 'http://cdn.akc.org/content/article-body-image/great_pyr_puppy_dog_pictures_.jpg', DEFAULT);
INSERT INTO `blog` (`id`, `title`, `creator_id`, `created_at`, `body`, `header_media_url`, `edited`) VALUES (7, 'HOW I ALMOST DIED IN A BLOGGING ACCIDENT', 5, DEFAULT, 'Aliquam fringilla, velit non mattis porta, urna ipsum pretium lectus, id interdum enim metus vel ex. Integer faucibus, metus eget cursus ullamcorper, urna dui dictum urna, eget blandit nisi urna a odio. Donec vel ligula lorem. Phasellus ipsum velit, interdum vel condimentum in, congue non augue. In felis magna, bibendum et dignissim et, gravida in turpis. Morbi in est diam. Nullam pulvinar rutrum nibh sit amet dictum. Phasellus vulputate, tortor faucibus laoreet convallis, nunc nisl semper massa, at lobortis elit diam eget est. Sed eu libero aliquet, tincidunt est pulvinar, dapibus urna. Nullam iaculis mi suscipit lacinia pharetra. Donec dignissim mi a pharetra sagittis. Vivamus vitae arcu nunc. Vestibulum at velit sit amet lorem aliquam condimentum id non metus. Quisque iaculis, felis a gravida pharetra, turpis metus posuere sapien, nec mollis lacus lorem eu augue.\n\nIn hac habitasse platea dictumst. Nullam ac tellus non libero porttitor dapibus eu a quam. Duis nisl tellus, tempus vel dictum et, scelerisque at tortor. Cras scelerisque augue a luctus ornare. Etiam consequat tortor in magna malesuada sodales. Nunc tempor enim massa, id venenatis erat venenatis at. Quisque vulputate arcu eu auctor auctor. Phasellus dapibus scelerisque dapibus. Sed dignissim neque et elit condimentum, id fermentum sem interdum. Donec eget felis mi. Duis fermentum massa vitae turpis hendrerit mollis. Sed consequat sodales dui, et dignissim turpis rhoncus at. Nunc consectetur dapibus ligula vitae suscipit. Cras sagittis velit nunc, sed fermentum odio imperdiet sed. Phasellus porttitor sem neque, finibus aliquet lectus facilisis eu.\n\nDonec scelerisque nibh lorem, nec iaculis ex scelerisque in. Cras volutpat nec ligula eget dignissim. Nullam nisl nunc, hendrerit vitae euismod ut, pharetra tristique turpis. Vivamus ac pretium nulla. Integer accumsan eleifend lacus, ut pulvinar lorem vulputate a. Vivamus interdum sagittis nisl a varius. Integer ut eros ut enim imperdiet fermentum aliquet posuere metus. Cras in mi et nisi volutpat fringilla. Mauris eget risus nec ante malesuada molestie eu at arcu. Aenean quis erat eget erat ultricies feugiat ut at ipsum. Vestibulum mollis imperdiet lectus maximus varius. Nullam eget velit quis leo feugiat rutrum. Etiam aliquet mattis elit, non vulputate tortor tincidunt vitae.', 'http://cdn.akc.org/content/article-body-image/rottweiler_dog_pictures.jpg', DEFAULT);
INSERT INTO `blog` (`id`, `title`, `creator_id`, `created_at`, `body`, `header_media_url`, `edited`) VALUES (8, 'UNTITLED', 4, DEFAULT, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus pellentesque neque tincidunt leo maximus, ac mollis odio congue. Donec at quam felis. Donec sem est, dapibus eget est et, consequat egestas augue. Sed laoreet maximus tortor, nec tincidunt diam mattis ac. Sed nec condimentum enim. Maecenas sollicitudin sem eget lacus porta, in elementum erat posuere. Suspendisse potenti. Cras quis nisl congue, molestie augue at, egestas felis. Etiam hendrerit odio vel ligula accumsan, id faucibus urna porta. Suspendisse lorem arcu, luctus in interdum quis, convallis ut sem. Vivamus accumsan quis nunc vitae fringilla. Morbi elementum turpis quis odio fermentum, sed tincidunt risus sodales. Morbi malesuada efficitur ornare.\n\nAliquam erat volutpat. Morbi facilisis nulla eu vehicula sagittis. Cras in gravida ante. Integer porta, nisi vitae placerat egestas, justo turpis ultricies neque, eu bibendum sem turpis eget turpis. Nunc ac libero tortor. Quisque in sem nulla. Etiam fermentum metus eget felis aliquet auctor. Morbi feugiat, eros ac malesuada luctus, mi neque condimentum mi, vel mollis quam felis vitae nisi. Nunc vel malesuada metus. Sed mollis augue et ornare tristique.\n\nAliquam porta neque et tellus sagittis tincidunt. Nulla rhoncus id dui ut cursus. Nullam vulputate eros magna, commodo rhoncus neque hendrerit ac. Pellentesque placerat metus iaculis eros fringilla dapibus. Cras semper tincidunt est eu finibus. Nunc tortor dui, convallis a pharetra ut, pretium vel velit. Ut dignissim quam pellentesque hendrerit finibus. Praesent dapibus consectetur purus nec suscipit.', 'http://cdn.akc.org/content/article-body-image/Finnishlapphundpuppies_dog_pictures.jpg', DEFAULT);
INSERT INTO `blog` (`id`, `title`, `creator_id`, `created_at`, `body`, `header_media_url`, `edited`) VALUES (9, 'THIS ONE DOES HAVE A TITLE THOUGH', 3, DEFAULT, 'Curabitur risus ex, pharetra et dapibus id, congue vitae ex. Nullam et condimentum tortor, vel vulputate urna. Maecenas dapibus mattis malesuada. Nulla ultricies justo sit amet eleifend aliquam. Mauris vel leo mi. Phasellus mattis eu nisl in aliquet. Pellentesque quis est id velit dictum placerat. Mauris accumsan est non scelerisque dapibus. Donec in auctor est, in fermentum lectus. In quis dapibus sem. Cras viverra tellus eget enim congue fermentum. Duis tempus lobortis nulla, vitae auctor metus placerat nec. Pellentesque imperdiet, est ut lobortis elementum, dolor purus lacinia odio, eget lacinia velit tellus at massa. Pellentesque turpis arcu, dignissim vitae aliquet varius, ullamcorper ac augue. Aliquam vitae varius ante, a efficitur velit.\n\nProin tempus, massa in commodo egestas, urna odio semper erat, sollicitudin placerat neque ipsum eget nunc. Aliquam a posuere eros. Aenean ante metus, efficitur vitae vehicula non, molestie non diam. Mauris quis quam id ipsum porttitor auctor eu sed turpis. Vivamus ullamcorper convallis urna, in rutrum turpis dictum sed. Sed euismod lectus ut dictum maximus. Phasellus nec facilisis nibh. Sed elementum at nibh eget egestas. Proin ullamcorper tortor maximus magna porttitor, nec porta enim dapibus. Etiam dolor tellus, volutpat id dolor eget, mollis dictum est. Nulla ligula magna, tempus non enim in, ultricies feugiat quam. In elementum massa sed justo varius, a cursus orci tincidunt. Nam rhoncus efficitur nulla sit amet sodales.', 'http://cdn.akc.org/content/article-body-image/pumi_dog_pictures.jpg', DEFAULT);
INSERT INTO `blog` (`id`, `title`, `creator_id`, `created_at`, `body`, `header_media_url`, `edited`) VALUES (10, 'MANTIS HUG', 2, DEFAULT, 'Cras blandit felis non enim tempor, vitae pulvinar odio condimentum. Nullam quis ornare tortor, at commodo diam. Nunc interdum cursus metus nec feugiat. Curabitur sit amet tempus magna. Nunc pulvinar dui eget varius ullamcorper. Cras mollis scelerisque turpis eu placerat. Sed non nulla commodo, dignissim velit nec, gravida tortor. Maecenas tortor leo, mattis at porta et, venenatis quis neque. In maximus velit at velit pretium, non maximus nunc ultrices. Donec eget tortor eget justo egestas varius sodales eget arcu. Quisque mollis egestas euismod. Proin luctus purus purus, lacinia varius nisl molestie a.\n\nFusce eu sapien aliquet, venenatis metus non, cursus leo. Cras ac erat at ex ultricies lobortis vel in ipsum. Sed vitae mauris aliquet, volutpat arcu quis, congue quam. Suspendisse varius risus sit amet ligula faucibus interdum. Praesent pulvinar blandit eros, in rutrum arcu sodales a. Nullam elit dui, fermentum ac lobortis fermentum, rhoncus vel enim. Sed risus massa, mattis et consectetur tincidunt, egestas vitae est. Sed id efficitur magna, quis euismod turpis. Curabitur tempus, magna id congue vulputate, mauris lectus gravida ante, eget posuere diam enim eu mi. Mauris maximus, ipsum ut pulvinar congue, est ipsum scelerisque lorem, eu cursus leo felis ac leo. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Duis neque augue, tincidunt nec pharetra a, mollis in risus.\n\nSed ut enim nec risus pellentesque molestie. Maecenas vel dolor dignissim, sollicitudin quam sit amet, dapibus sapien. Maecenas elementum semper egestas. Morbi dolor odio, euismod ut fringilla ac, vehicula in ipsum. Quisque sed mi nunc. Vestibulum eu mauris non ligula egestas convallis. Pellentesque vel ante commodo, gravida sem quis, posuere nibh. Ut sed turpis finibus, vestibulum ligula in, pretium diam.', 'http://cdn.akc.org/content/article-body-image/lab_puppy_dog_pictures.jpg', DEFAULT);

COMMIT;


-- -----------------------------------------------------
-- Data for table `blog_comment`
-- -----------------------------------------------------
START TRANSACTION;
USE `crescendodb`;
INSERT INTO `blog_comment` (`id`, `body`, `created_at`, `edited`, `creator_id`, `blog_id`) VALUES (1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur est quam, sollicitudin non consectetur eu, iaculis id leo. Phasellus sed arcu nibh. Praesent sed est tortor. Morbi sodales nisi nec leo commodo, ac fringilla nisi varius. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.', DEFAULT, DEFAULT, 1, 1);
INSERT INTO `blog_comment` (`id`, `body`, `created_at`, `edited`, `creator_id`, `blog_id`) VALUES (2, 'Suspendisse eget orci nec diam elementum bibendum sit amet ac enim. Pellentesque at ipsum non est sagittis pretium ut eget justo. Nulla varius velit sed eros dapibus, non viverra massa viverra.', DEFAULT, DEFAULT, 6, 2);
INSERT INTO `blog_comment` (`id`, `body`, `created_at`, `edited`, `creator_id`, `blog_id`) VALUES (3, 'Sed pellentesque neque sit amet elit fringilla luctus nec id ante. Pellentesque tincidunt scelerisque neque id eleifend. Aenean a tincidunt massa. Aenean augue diam, volutpat eu pretium quis, condimentum id nisi. Maecenas nec erat porttitor, sollicitudin est quis, consequat ante. Suspendisse potenti. Sed facilisis leo vel interdum feugiat. Sed sollicitudin enim sed blandit fermentum. Phasellus at diam ligula. Nam elit nunc, pulvinar a sem at, ullamcorper pulvinar lacus.', DEFAULT, DEFAULT, 5, 3);
INSERT INTO `blog_comment` (`id`, `body`, `created_at`, `edited`, `creator_id`, `blog_id`) VALUES (4, 'Maecenas rhoncus, dolor ut ultrices lacinia, nulla lacus rhoncus nibh, sed efficitur nibh odio in erat. Nam ultrices feugiat ante, at volutpat odio hendrerit vel.', DEFAULT, DEFAULT, 4, 4);
INSERT INTO `blog_comment` (`id`, `body`, `created_at`, `edited`, `creator_id`, `blog_id`) VALUES (5, 'Nunc scelerisque velit ut justo feugiat, ac faucibus nisi lobortis. Sed non ipsum elit. Cras vel neque et leo mollis laoreet. Vestibulum elit tortor, elementum ut dictum ac, ultricies id ligula. Sed euismod nec lectus ut ullamcorper.', DEFAULT, DEFAULT, 3, 5);
INSERT INTO `blog_comment` (`id`, `body`, `created_at`, `edited`, `creator_id`, `blog_id`) VALUES (6, 'Nam quis elit eu purus tristique bibendum vel at purus. Aliquam a dui ut orci laoreet dapibus.', DEFAULT, DEFAULT, 2, 6);
INSERT INTO `blog_comment` (`id`, `body`, `created_at`, `edited`, `creator_id`, `blog_id`) VALUES (7, 'Ut rhoncus ligula sem. Donec ornare non mi vel interdum. Donec rhoncus dictum metus et sollicitudin. Aliquam sed orci consectetur, rhoncus massa vitae, auctor massa. Etiam vel varius nibh, nec sagittis augue. Nunc luctus dui at mattis sagittis. Fusce vitae lorem a ligula feugiat fringilla.', DEFAULT, DEFAULT, 1, 7);
INSERT INTO `blog_comment` (`id`, `body`, `created_at`, `edited`, `creator_id`, `blog_id`) VALUES (8, 'Quisque purus leo, lacinia at neque eu, dignissim volutpat sem. Nunc dictum non lorem vitae sagittis. Nam ullamcorper venenatis felis, ac tincidunt felis pharetra non. Nullam scelerisque ligula ac ultricies pretium.', DEFAULT, DEFAULT, 6, 8);
INSERT INTO `blog_comment` (`id`, `body`, `created_at`, `edited`, `creator_id`, `blog_id`) VALUES (9, 'Proin bibendum eros at maximus iaculis. In vitae condimentum orci, id tincidunt orci. Sed volutpat, magna ac mattis fermentum, tortor nisl tempor mi, et dictum magna sem maximus odio. Nunc consequat mi sapien, vel elementum felis viverra ac. Nam turpis nulla, lacinia vitae dui a, viverra vestibulum enim. Donec commodo ultrices enim sit amet facilisis. Curabitur eget mauris ut ex pulvinar finibus sit amet a metus. Ut nec orci tempor diam semper blandit. Maecenas vestibulum lobortis nulla. Nullam justo tortor, volutpat at rutrum a, pharetra a erat. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. In volutpat sem quis neque volutpat dapibus. Aenean pharetra odio sed est vestibulum, ac pulvinar arcu vehicula. In ultricies nisl sed pharetra finibus.\nDonec a viverra orci. Suspendisse potenti. Aenean non lacus elit. Aenean in lobortis felis, a dapibus neque. Curabitur at elit lacus. Vestibulum commodo quis lacus non euismod. Aenean in quam nisl.', DEFAULT, DEFAULT, 5, 9);
INSERT INTO `blog_comment` (`id`, `body`, `created_at`, `edited`, `creator_id`, `blog_id`) VALUES (10, 'Mauris porttitor eget lacus sed pretium. Nulla porta sit amet leo ut pellentesque. Aenean porttitor elit ut arcu tempus, ac blandit lectus malesuada. Maecenas viverra et diam vitae porta. Fusce varius sed lorem nec hendrerit. Quisque vel ligula ligula. Fusce dolor ipsum, dictum at pellentesque et, fermentum varius velit.', DEFAULT, DEFAULT, 4, 10);
INSERT INTO `blog_comment` (`id`, `body`, `created_at`, `edited`, `creator_id`, `blog_id`) VALUES (11, 'Nulla eget diam quis lorem suscipit laoreet tempus at dui. Nam ut purus mauris. Vestibulum libero dolor, dictum ut magna id, porta posuere quam. Nullam volutpat elit velit, at ornare nunc vehicula a. Suspendisse at lacus vel dui tincidunt tempus. Aenean ornare tempor interdum. Donec consectetur auctor tempus.', DEFAULT, DEFAULT, 3, 9);
INSERT INTO `blog_comment` (`id`, `body`, `created_at`, `edited`, `creator_id`, `blog_id`) VALUES (12, 'Fusce vitae enim maximus, interdum mi eu, euismod libero. Duis eget porttitor mi. Ut egestas risus vitae nunc luctus, ac tincidunt magna malesuada. Pellentesque at fermentum nulla. Sed hendrerit volutpat neque non mattis. Curabitur malesuada lectus nec diam tristique, non elementum turpis bibendum. Donec bibendum ipsum sit amet diam pharetra pretium. Aliquam vulputate dictum quam, eu eleifend mi eleifend non. Maecenas sed augue ipsum. Phasellus a scelerisque odio. Cras vitae mauris sapien.', DEFAULT, DEFAULT, 2, 8);
INSERT INTO `blog_comment` (`id`, `body`, `created_at`, `edited`, `creator_id`, `blog_id`) VALUES (13, 'Morbi ultrices iaculis nisi, sit amet tincidunt mauris aliquet at. Nam sollicitudin libero ut sem aliquet, at venenatis leo congue. Nulla finibus fermentum magna iaculis auctor. Nunc sed varius leo. Suspendisse blandit faucibus nisl, ut consectetur velit dignissim eu. Integer a est bibendum, dictum velit vitae, aliquet mi. Proin tempor turpis vel diam convallis sollicitudin. Fusce gravida urna ac interdum hendrerit.', DEFAULT, DEFAULT, 1, 7);
INSERT INTO `blog_comment` (`id`, `body`, `created_at`, `edited`, `creator_id`, `blog_id`) VALUES (14, 'Duis a porttitor nisl, ac fermentum orci. Nullam in porttitor ex. Suspendisse nulla elit, convallis eu placerat in, gravida ac dui. Fusce turpis eros, vestibulum eget urna vel, efficitur bibendum ante. Aenean placerat dui quis nunc efficitur, mattis fermentum neque finibus. Curabitur consequat risus eget nunc venenatis tempus. Morbi vestibulum, ex eget aliquet dapibus, felis libero bibendum sem, id posuere enim lectus at tellus. Phasellus elementum interdum lorem, sodales gravida diam accumsan et. Aliquam porta diam justo, vel scelerisque neque dapibus eu.', DEFAULT, DEFAULT, 6, 6);
INSERT INTO `blog_comment` (`id`, `body`, `created_at`, `edited`, `creator_id`, `blog_id`) VALUES (15, 'Pellentesque sit amet felis mauris. Sed condimentum pulvinar sapien in sodales. Praesent pretium quam convallis leo finibus, et facilisis turpis rutrum. Nulla in sapien eget quam convallis hendrerit eu sed lectus. In eget lacus ac sapien tempor posuere. Quisque suscipit hendrerit nisl, vitae ultricies diam consectetur at. Quisque tincidunt, augue nec sodales imperdiet, nisi purus commodo massa, eu ultricies leo magna at mauris.', DEFAULT, DEFAULT, 5, 5);
INSERT INTO `blog_comment` (`id`, `body`, `created_at`, `edited`, `creator_id`, `blog_id`) VALUES (16, 'Morbi volutpat facilisis fermentum. Quisque mattis luctus metus ut aliquet. Proin lobortis dignissim ultricies. Quisque pharetra mi metus, ac blandit nibh molestie vitae. Maecenas justo dui, scelerisque nec arcu a, aliquam mattis magna. Etiam velit erat, commodo eu augue vel, dictum consectetur orci. Nulla facilisi.', DEFAULT, DEFAULT, 4, 4);
INSERT INTO `blog_comment` (`id`, `body`, `created_at`, `edited`, `creator_id`, `blog_id`) VALUES (17, 'Donec vel tellus ac velit sagittis imperdiet. Sed non tellus a mi pellentesque elementum. Aliquam ultricies ultrices odio id maximus. Donec mollis lacus a purus gravida, in faucibus nisi commodo. Nulla sit amet enim cursus, auctor magna in, tristique arcu. Nulla sed elementum nisl. Sed varius ex odio, id lacinia sapien pellentesque vel. Fusce tempus in turpis nec aliquet.', DEFAULT, DEFAULT, 3, 3);
INSERT INTO `blog_comment` (`id`, `body`, `created_at`, `edited`, `creator_id`, `blog_id`) VALUES (18, 'Proin nec augue porta, sodales nibh eget, egestas mauris. Aliquam hendrerit pharetra leo, ut consectetur diam lobortis id. Suspendisse eget felis lectus. Etiam in neque diam. Aliquam viverra ac ligula vitae finibus. Vestibulum at nisl at sapien suscipit tempor ut a elit. Sed congue bibendum augue. Vivamus neque velit, dignissim a leo et, ornare condimentum erat. Nunc feugiat lacinia neque, id pharetra ante elementum non. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nunc semper porta nisl, vel sollicitudin lorem cursus sit amet. Cras nec est id tortor varius placerat nec eget eros.', DEFAULT, DEFAULT, 2, 2);
INSERT INTO `blog_comment` (`id`, `body`, `created_at`, `edited`, `creator_id`, `blog_id`) VALUES (19, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin tempor viverra condimentum. Sed sed elementum orci. Pellentesque sed dignissim augue. Mauris leo ligula, consequat eu leo gravida, viverra tempor turpis. Etiam lacinia suscipit leo, non suscipit nibh varius sagittis. Duis euismod lacinia posuere. Pellentesque commodo et metus iaculis porta. Donec sit amet blandit augue, eu finibus ante.', DEFAULT, DEFAULT, 1, 1);
INSERT INTO `blog_comment` (`id`, `body`, `created_at`, `edited`, `creator_id`, `blog_id`) VALUES (20, 'Cras vulputate ipsum nec semper condimentum. Curabitur suscipit purus ut leo volutpat, congue aliquam nulla dapibus. Mauris id turpis sapien. Duis maximus lacus id erat tempus aliquam. Cras laoreet sed libero quis fermentum. Nulla sit amet rutrum diam, sit amet egestas ipsum. Integer auctor eros vel magna varius, sed consequat elit pharetra. Duis in est fringilla, placerat est eget, sagittis nulla. Fusce eget fringilla tellus, quis facilisis est.', DEFAULT, DEFAULT, 6, 2);
INSERT INTO `blog_comment` (`id`, `body`, `created_at`, `edited`, `creator_id`, `blog_id`) VALUES (21, 'Nulla facilisi. Nulla facilisi. In orci ipsum, vestibulum id nisl id, sollicitudin mollis metus. Mauris ut nisl in lacus venenatis vestibulum. Quisque viverra placerat volutpat. Integer laoreet vehicula lorem non rutrum. Nam nec vehicula lacus. Praesent non lobortis nibh. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Donec vitae sodales metus. Pellentesque feugiat lacus ullamcorper interdum congue. Nam iaculis mauris id sem rutrum accumsan.\nNam porta volutpat tincidunt. Nulla feugiat eget dui in viverra. Integer rhoncus aliquam convallis. Maecenas mattis risus a velit molestie, a posuere ipsum egestas. Etiam justo turpis, efficitur non tristique vel, aliquam vitae est. Sed dapibus elit mauris, vel maximus ligula tempus vitae. Suspendisse vel erat eu odio facilisis maximus non ut mi. Morbi commodo elit ullamcorper lacus varius semper. Etiam fringilla libero non est vulputate, a ultricies tellus malesuada. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sodales odio non metus lacinia, eu ullamcorper lorem semper.\n', DEFAULT, DEFAULT, 5, 3);
INSERT INTO `blog_comment` (`id`, `body`, `created_at`, `edited`, `creator_id`, `blog_id`) VALUES (22, 'Vestibulum tincidunt facilisis mauris. Suspendisse elementum pellentesque massa, vel consequat turpis ullamcorper quis. Donec lacus nunc, pellentesque quis ultricies at, egestas at justo. Nunc magna nulla, venenatis a nunc sed, scelerisque lacinia nibh. Morbi et condimentum justo. Fusce vitae faucibus enim. Nunc sit amet turpis sit amet purus porttitor molestie quis ac est. Nulla sodales molestie semper. Ut facilisis magna at neque ornare scelerisque. Donec vel sollicitudin sapien, eget mattis purus. Donec quis porttitor erat.\n', DEFAULT, DEFAULT, 4, 4);
INSERT INTO `blog_comment` (`id`, `body`, `created_at`, `edited`, `creator_id`, `blog_id`) VALUES (23, 'Nullam eget dolor eu tellus faucibus condimentum id vitae justo. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. In gravida dapibus risus. Nam convallis metus vitae nulla finibus interdum. Mauris tristique id est et consequat. Nam nec massa placerat, hendrerit ligula pretium, consectetur dui. Quisque vitae neque lectus. Cras imperdiet sollicitudin odio tempus rhoncus. Fusce iaculis neque non faucibus placerat. Pellentesque at urna a quam rutrum suscipit.\nDonec in rutrum lectus. Curabitur ut blandit massa. Nam commodo maximus augue in condimentum. Fusce cursus quis lacus at fringilla. Nullam ex orci, egestas ut mollis eu, auctor vitae erat. Cras pellentesque, est sed ullamcorper rutrum, dolor ex euismod velit, ut viverra magna sem et ex. Mauris sodales justo porttitor odio egestas, ornare ultrices sapien dictum. Morbi bibendum ut leo at congue. Etiam gravida convallis hendrerit. Donec accumsan vel metus ac lobortis. Fusce pulvinar metus faucibus nisl posuere, quis condimentum sem vestibulum.', DEFAULT, DEFAULT, 3, 5);
INSERT INTO `blog_comment` (`id`, `body`, `created_at`, `edited`, `creator_id`, `blog_id`) VALUES (24, 'Duis dapibus tincidunt metus. Duis eget arcu aliquet, feugiat magna in, ornare nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Proin et imperdiet magna, pulvinar egestas lectus. Praesent dolor lectus, convallis quis libero eu, tempus facilisis enim. Vestibulum nec nunc justo. Cras ac tincidunt nisi. Sed blandit mauris nec tellus hendrerit congue. Suspendisse interdum mattis tempor. Aliquam erat volutpat. Curabitur gravida tincidunt est. Proin lacinia nibh nibh, a posuere neque lacinia in. Suspendisse id fringilla nibh, in varius sem. Fusce sollicitudin urna magna, non facilisis quam tempus eget. Cras id odio blandit, cursus metus ac, cursus sem.', DEFAULT, DEFAULT, 2, 6);
INSERT INTO `blog_comment` (`id`, `body`, `created_at`, `edited`, `creator_id`, `blog_id`) VALUES (25, 'Donec maximus, nisi non porttitor dapibus, dui purus posuere tellus, ac tincidunt erat lorem sed nisi. Aliquam molestie nulla felis, sed feugiat orci ultricies non. In eleifend augue libero, aliquet egestas magna auctor a. Ut sollicitudin ex eu tristique molestie. Aenean convallis elit at mauris elementum, a varius risus feugiat. Donec tincidunt hendrerit convallis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Maecenas rutrum risus diam, ut fermentum nulla tincidunt a. Nam et enim enim.', DEFAULT, DEFAULT, 1, 7);
INSERT INTO `blog_comment` (`id`, `body`, `created_at`, `edited`, `creator_id`, `blog_id`) VALUES (26, 'Nam sapien justo, semper eu ipsum sit amet, suscipit accumsan arcu. Proin interdum interdum felis bibendum ultricies. Integer in dolor tempor nibh ornare dapibus id non justo. Etiam ut porta lorem, a imperdiet est. Sed convallis sed mi vel vestibulum. Ut condimentum efficitur justo ac tincidunt. Cras et ante eu enim semper tristique ac eu dui. Aliquam ultrices viverra orci a imperdiet.', DEFAULT, DEFAULT, 6, 8);
INSERT INTO `blog_comment` (`id`, `body`, `created_at`, `edited`, `creator_id`, `blog_id`) VALUES (27, 'Quisque quam ipsum, fermentum sed sagittis et, luctus id urna. Maecenas semper quam vel aliquet porta. Fusce pretium, urna ac tincidunt consectetur, ante magna semper enim, ut dictum eros libero vestibulum nulla.', DEFAULT, DEFAULT, 5, 9);
INSERT INTO `blog_comment` (`id`, `body`, `created_at`, `edited`, `creator_id`, `blog_id`) VALUES (28, 'Vivamus gravida scelerisque tortor, et ornare lectus feugiat non. Nunc efficitur fermentum est eu malesuada. Sed ultrices faucibus sapien.', DEFAULT, DEFAULT, 4, 10);
INSERT INTO `blog_comment` (`id`, `body`, `created_at`, `edited`, `creator_id`, `blog_id`) VALUES (29, 'Quisque in turpis porttitor, finibus est egestas, lacinia leo. Praesent hendrerit justo massa, ut dapibus enim convallis vitae. Ut ut ex a nulla tincidunt consequat. Morbi et quam mollis, porta libero id, venenatis sem.', DEFAULT, DEFAULT, 3, 9);
INSERT INTO `blog_comment` (`id`, `body`, `created_at`, `edited`, `creator_id`, `blog_id`) VALUES (30, 'Duis quis suscipit ipsum. Morbi vestibulum ex vitae nibh finibus commodo. Curabitur eu orci sit amet neque consectetur imperdiet. Nullam vehicula lacinia augue in vulputate. Fusce suscipit, nulla eget lobortis viverra, ante mi vulputate odio, vitae tristique quam lorem ut libero. Etiam bibendum dui id enim aliquam condimentum. Fusce augue orci, euismod eget mauris ac, aliquet euismod eros. Ut rutrum enim elit, sit amet laoreet lacus auctor ac.', DEFAULT, DEFAULT, 2, 8);
INSERT INTO `blog_comment` (`id`, `body`, `created_at`, `edited`, `creator_id`, `blog_id`) VALUES (31, 'Sed sollicitudin eros at quam euismod, sit amet dictum mi egestas. Pellentesque eu orci placerat, ornare purus sit amet, ultrices mauris. Praesent orci tellus, ullamcorper et est eget, sodales malesuada metus. Sed consectetur erat dui, id maximus quam ornare vel. Curabitur consectetur sapien et ipsum aliquet, quis dignissim ligula interdum. In interdum lectus ut aliquam semper. Sed tortor sapien, tincidunt eu ultricies eu, rutrum vitae nibh. Sed molestie lectus in ultrices pulvinar. Vestibulum feugiat feugiat laoreet. Sed libero justo, auctor quis tortor non, tristique consequat odio.', DEFAULT, DEFAULT, 1, 7);
INSERT INTO `blog_comment` (`id`, `body`, `created_at`, `edited`, `creator_id`, `blog_id`) VALUES (32, 'Sed quis nunc et magna congue suscipit in at nisl. Nunc magna nunc, dignissim eget tristique id, auctor non est. Maecenas vestibulum turpis sed lacus rhoncus fermentum. Vivamus congue leo tincidunt augue dapibus varius. Quisque ac consectetur nisl. Vestibulum at elementum diam, non pretium dolor. Praesent a urna ac lacus dapibus mollis.', DEFAULT, DEFAULT, 6, 6);
INSERT INTO `blog_comment` (`id`, `body`, `created_at`, `edited`, `creator_id`, `blog_id`) VALUES (33, 'Curabitur vulputate nisl sed nibh malesuada interdum. Fusce sem sem, tempor vitae tellus vel, lacinia congue quam. Sed quis dui a orci pellentesque ullamcorper ut id tortor. Curabitur egestas nulla ac erat gravida iaculis. Cras non augue id dolor condimentum accumsan a ac nisl. Donec porttitor sed tellus a sollicitudin. Mauris elit est, elementum a velit eget, interdum euismod ipsum.', DEFAULT, DEFAULT, 5, 5);
INSERT INTO `blog_comment` (`id`, `body`, `created_at`, `edited`, `creator_id`, `blog_id`) VALUES (34, 'Morbi convallis enim quis odio sollicitudin, in commodo elit scelerisque. Nam vitae lectus eu ligula luctus lacinia. Nam vel ex odio. In hac habitasse platea dictumst. Proin lobortis et risus sed egestas. Duis posuere vel massa eu luctus. Interdum et malesuada fames ac ante ipsum primis in faucibus. Phasellus imperdiet dui tristique nibh dignissim, ac porta nibh volutpat. Maecenas hendrerit tincidunt ligula consequat maximus. Nam odio dui, ultrices et justo non, hendrerit efficitur erat. Sed placerat, orci nec laoreet lobortis, arcu lacus finibus ante, ac dapibus nisi enim vel magna. Ut ex orci, aliquam at nibh ac, bibendum facilisis enim. Suspendisse ipsum libero, auctor in arcu non, sollicitudin pretium nibh. Integer vel maximus leo. Quisque interdum, sapien vel pulvinar vestibulum, velit eros venenatis ipsum, nec pharetra orci nibh vitae erat.', DEFAULT, DEFAULT, 4, 4);
INSERT INTO `blog_comment` (`id`, `body`, `created_at`, `edited`, `creator_id`, `blog_id`) VALUES (35, 'Maecenas aliquam nec metus at cursus. Praesent vel pulvinar dui, non mattis est. Morbi viverra viverra semper. Quisque consectetur, risus nec vulputate faucibus, tellus orci vestibulum velit, eget accumsan ante lacus at mi. Quisque sodales, nunc eu facilisis pulvinar, felis sem porttitor nulla, luctus vestibulum dui velit vitae leo. In luctus nulla quis ligula posuere placerat ac ac ante. Duis id magna nec metus porttitor ornare. Praesent varius, orci facilisis dictum rhoncus, dolor nisl aliquet risus, dictum viverra purus erat in eros.', DEFAULT, DEFAULT, 3, 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `trade`
-- -----------------------------------------------------
START TRANSACTION;
USE `crescendodb`;
INSERT INTO `trade` (`id`, `direction`, `good_type`, `body`, `creator_id`, `title`, `created_at`, `active`) VALUES (1, 'buy', 'instrument', '$500 OBO', 1, 'Gibson Lucille', DEFAULT, 1);
INSERT INTO `trade` (`id`, `direction`, `good_type`, `body`, `creator_id`, `title`, `created_at`, `active`) VALUES (2, 'sell', 'record', '$10 OR TRADE FOR CLAMZORIAN XYLOPHONE', 2, 'WTS: AQUAMARINE DREAMS', DEFAULT, 1);
INSERT INTO `trade` (`id`, `direction`, `good_type`, `body`, `creator_id`, `title`, `created_at`, `active`) VALUES (3, 'buy', 'record', 'WANT TO BUY ORIGINAL PRESSING, OFFERING $100', 2, 'VIRGIN SACRIFICE (WTB)', DEFAULT, 1);
INSERT INTO `trade` (`id`, `direction`, `good_type`, `body`, `creator_id`, `title`, `created_at`, `active`) VALUES (4, 'trade', 'instrument', 'ANTIQUE CLAMZORIAN XYLOPHONE, NEAR PERFECT CONDITION. $25 OBO OR TRADE FOR AQUAMARINE DREAMS', 3, 'UNBELIEVABLE how does he play it?', DEFAULT, 1);
INSERT INTO `trade` (`id`, `direction`, `good_type`, `body`, `creator_id`, `title`, `created_at`, `active`) VALUES (5, 'sell', 'instrument', '$50. Maecenas elementum, ex nec cursus sagittis, libero felis lobortis mi, a eleifend libero velit quis turpis. Fusce quis ullamcorper lacus. Sed id mi pellentesque, posuere enim sed, tempor purus. Morbi eu erat ante. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque non tincidunt lectus. Donec quis hendrerit odio. Suspendisse non blandit eros. Pellentesque venenatis urna sed augue dapibus fringilla. Suspendisse dui nulla, semper ac malesuada sit amet, porta vitae augue. Aenean aliquam velit neque, sed porttitor justo iaculis feugiat. Mauris feugiat erat non erat consequat ullamcorper. Nunc rutrum malesuada posuere. Praesent id cursus nulla. Etiam malesuada in arcu nec bibendum.', 3, 'MANTIS RELIGIOSA', DEFAULT, 1);
INSERT INTO `trade` (`id`, `direction`, `good_type`, `body`, `creator_id`, `title`, `created_at`, `active`) VALUES (6, 'trade', 'instrument', 'Duis blandit scelerisque volutpat. Aliquam eu eros et elit interdum finibus a elementum libero. Quisque imperdiet et mauris ac pellentesque. Mauris euismod quam lacus, quis tristique ipsum ullamcorper sit amet. Vestibulum tristique enim non tellus sollicitudin auctor. Vestibulum lobortis turpis nisi, in rutrum magna dapibus at. Mauris ultrices ante sapien, aliquam iaculis enim convallis ut. Nullam ut tincidunt diam, porta maximus eros. Pellentesque a tincidunt sem, nec tempus libero. Aliquam egestas odio a metus elementum, id sagittis velit vestibulum.', 3, 'Theraphosa blondi', DEFAULT, 1);
INSERT INTO `trade` (`id`, `direction`, `good_type`, `body`, `creator_id`, `title`, `created_at`, `active`) VALUES (7, 'buy', 'record', 'Duis vehicula dolor eget ex vehicula laoreet. Morbi massa arcu, iaculis vitae metus et, molestie blandit justo. Sed commodo sed ante sed commodo. Nulla a ipsum ut erat sodales viverra. Integer pharetra interdum lobortis. Pellentesque suscipit arcu sit amet mauris ornare, a vulputate nisi tincidunt. Pellentesque eu felis ut dui mollis semper ac eu magna.\n', 4, 'Mola mola', DEFAULT, 1);
INSERT INTO `trade` (`id`, `direction`, `good_type`, `body`, `creator_id`, `title`, `created_at`, `active`) VALUES (8, 'sell', 'record', 'Praesent venenatis est a lacinia imperdiet. Nam rhoncus ullamcorper consectetur. Fusce dignissim ultricies lacus eget ultrices. Phasellus ac purus nec sem mollis porttitor vitae vel sapien. Duis id odio luctus, elementum leo sed, semper metus. Sed condimentum sapien condimentum ullamcorper malesuada. Donec cursus in ex id tempus. Sed scelerisque porta varius. Aliquam quis ultrices odio, a lacinia est. Morbi et nunc vehicula, fringilla urna eu, tristique ante. Ut ornare nibh quis mauris tristique tincidunt quis non urna. Phasellus mauris erat, pellentesque nec tincidunt sit amet, tincidunt in arcu. Nam vitae mattis nulla. Aenean volutpat rhoncus ligula id maximus.', 4, 'Batrachochytrium DENDROBATIDIS', DEFAULT, 1);
INSERT INTO `trade` (`id`, `direction`, `good_type`, `body`, `creator_id`, `title`, `created_at`, `active`) VALUES (9, 'trade', 'instrument', 'Nam ut tincidunt velit. Praesent rutrum ornare pellentesque. Aliquam suscipit massa quis lobortis convallis. Aenean ipsum augue, ullamcorper sed est sed, accumsan imperdiet urna. Donec blandit metus nibh, sit amet ullamcorper purus interdum in. Nam accumsan vitae ante eget sodales. Donec quis quam vestibulum, interdum nisl in, porttitor elit. Quisque a consectetur neque, eget placerat purus. Sed in odio et justo rutrum posuere feugiat vestibulum mi.', 2, 'Oxyuranus scutellatus', DEFAULT, 1);
INSERT INTO `trade` (`id`, `direction`, `good_type`, `body`, `creator_id`, `title`, `created_at`, `active`) VALUES (10, 'trade', 'record', 'Nam ut tincidunt velit. Praesent rutrum ornare pellentesque. Aliquam suscipit massa quis lobortis convallis. Aenean ipsum augue, ullamcorper sed est sed, accumsan imperdiet urna. Donec blandit metus nibh, sit amet ullamcorper purus interdum in. Nam accumsan vitae ante eget sodales. Donec quis quam vestibulum, interdum nisl in, porttitor elit. Quisque a consectetur neque, eget placerat purus. Sed in odio et justo rutrum posuere feugiat vestibulum mi.', 3, 'Yersinia pestis', DEFAULT, 1);
INSERT INTO `trade` (`id`, `direction`, `good_type`, `body`, `creator_id`, `title`, `created_at`, `active`) VALUES (11, 'trade', 'instrument', 'Nam finibus, dui sed tincidunt porta, enim felis viverra metus, ut blandit ex nunc eget eros. Proin lobortis erat nunc, at convallis turpis aliquet nec. Morbi ultricies porttitor lacus, ut congue quam pulvinar non. Phasellus ut ullamcorper lorem. Praesent imperdiet enim quis ornare consectetur. Vestibulum ultricies ipsum et elit ultrices, sed lacinia risus hendrerit. Nunc ac suscipit orci. Sed semper, justo ut posuere dapibus, est mi facilisis ex, lacinia tincidunt urna eros ut ipsum. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 1, 'Naja naja', DEFAULT, 1);
INSERT INTO `trade` (`id`, `direction`, `good_type`, `body`, `creator_id`, `title`, `created_at`, `active`) VALUES (12, 'trade', 'record', 'Vivamus elementum luctus vulputate. Phasellus euismod commodo varius. Curabitur nec dui ut tortor volutpat maximus. Mauris eget velit tortor. Phasellus gravida felis erat, consequat auctor tellus malesuada id. In sem est, feugiat et congue finibus, imperdiet in urna. Aliquam ultricies interdum diam in fermentum. Morbi et mollis neque. Nulla nec diam sed neque vulputate tristique at non elit. Donec in auctor odio, eu auctor lorem. Vestibulum mi enim, dictum ut imperdiet at, pharetra id eros.', 1, 'Bungarus fasciatura', DEFAULT, 1);
INSERT INTO `trade` (`id`, `direction`, `good_type`, `body`, `creator_id`, `title`, `created_at`, `active`) VALUES (13, 'sell', 'record', 'Quisque ac turpis molestie, malesuada dolor non, tristique sapien. Integer arcu libero, congue vel dolor eget, tempor convallis libero. Mauris sollicitudin nibh urna, eu gravida magna lacinia sit amet. Quisque eu sapien eu quam finibus tristique. Pellentesque ut ipsum ut nisl cursus faucibus. Mauris eu arcu interdum, tincidunt libero in, maximus dolor. Pellentesque feugiat blandit neque in pellentesque. Curabitur in justo erat. Etiam blandit mi in sapien sollicitudin, vel ornare eros laoreet. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Curabitur pellentesque ante quam, id accumsan diam tempus quis. Nullam odio ipsum, facilisis sed luctus sagittis, luctus a orci.', 1, 'Rhodiola rosea', DEFAULT, 1);
INSERT INTO `trade` (`id`, `direction`, `good_type`, `body`, `creator_id`, `title`, `created_at`, `active`) VALUES (14, 'buy', 'record', 'Nam cursus facilisis sem eget imperdiet. In consectetur lorem metus, vitae molestie mi maximus id. Donec ac fermentum erat. Phasellus quis vehicula metus. Etiam pulvinar rhoncus massa sed pharetra. Etiam sodales fermentum neque, hendrerit tincidunt erat rutrum sit amet. Sed dictum est laoreet odio tempus accumsan.', 5, 'Lanius exubitor', DEFAULT, 1);
INSERT INTO `trade` (`id`, `direction`, `good_type`, `body`, `creator_id`, `title`, `created_at`, `active`) VALUES (15, 'buy', 'record', 'Donec pharetra faucibus lectus, non mattis ipsum semper ut. Sed eu consequat neque. Proin fringilla tincidunt semper. Vivamus lacinia purus et aliquet ornare. Donec placerat felis ut nibh condimentum pharetra.', 5, 'Strix nebulosa', DEFAULT, 1);
INSERT INTO `trade` (`id`, `direction`, `good_type`, `body`, `creator_id`, `title`, `created_at`, `active`) VALUES (16, 'trade', 'instrument', 'Morbi at facilisis nulla, sit amet tempus nisl. Curabitur eget accumsan nisl. Phasellus ut lacus et sapien tempor rutrum. Etiam ut lacinia nisi. Etiam tincidunt non metus ut ultrices. Fusce vel odio dignissim, tempus est sed, rutrum ante. Aliquam sed accumsan dui. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vivamus in ligula non dolor dapibus viverra. Pellentesque eget lorem dui.', 5, 'Corvus corax', DEFAULT, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `genre`
-- -----------------------------------------------------
START TRANSACTION;
USE `crescendodb`;
INSERT INTO `genre` (`id`, `name`) VALUES (1, 'NEO-CLASSICAL POST-METAL');
INSERT INTO `genre` (`id`, `name`) VALUES (2, 'PROGRESSIVE POST-ELECTRONIC ANTI-GRUNGE');
INSERT INTO `genre` (`id`, `name`) VALUES (3, 'ALTERNATIVE NEO-JAZZ');
INSERT INTO `genre` (`id`, `name`) VALUES (4, 'POST-DECONSTRUCTIVE IMPRESSIONIST ANTI-ROCK');

COMMIT;


-- -----------------------------------------------------
-- Data for table `album_has_genre`
-- -----------------------------------------------------
START TRANSACTION;
USE `crescendodb`;
INSERT INTO `album_has_genre` (`genre_id`, `album_id`) VALUES (1, 1);
INSERT INTO `album_has_genre` (`genre_id`, `album_id`) VALUES (2, 2);
INSERT INTO `album_has_genre` (`genre_id`, `album_id`) VALUES (2, 5);
INSERT INTO `album_has_genre` (`genre_id`, `album_id`) VALUES (3, 3);
INSERT INTO `album_has_genre` (`genre_id`, `album_id`) VALUES (3, 7);
INSERT INTO `album_has_genre` (`genre_id`, `album_id`) VALUES (3, 4);
INSERT INTO `album_has_genre` (`genre_id`, `album_id`) VALUES (4, 4);
INSERT INTO `album_has_genre` (`genre_id`, `album_id`) VALUES (4, 6);
INSERT INTO `album_has_genre` (`genre_id`, `album_id`) VALUES (4, 5);
INSERT INTO `album_has_genre` (`genre_id`, `album_id`) VALUES (4, 1);
INSERT INTO `album_has_genre` (`genre_id`, `album_id`) VALUES (1, 6);
INSERT INTO `album_has_genre` (`genre_id`, `album_id`) VALUES (2, 3);
INSERT INTO `album_has_genre` (`genre_id`, `album_id`) VALUES (2, 6);
INSERT INTO `album_has_genre` (`genre_id`, `album_id`) VALUES (3, 8);
INSERT INTO `album_has_genre` (`genre_id`, `album_id`) VALUES (3, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `thread_has_genre`
-- -----------------------------------------------------
START TRANSACTION;
USE `crescendodb`;
INSERT INTO `thread_has_genre` (`thread_id`, `genre_id`) VALUES (1, 1);
INSERT INTO `thread_has_genre` (`thread_id`, `genre_id`) VALUES (2, 2);
INSERT INTO `thread_has_genre` (`thread_id`, `genre_id`) VALUES (2, 3);
INSERT INTO `thread_has_genre` (`thread_id`, `genre_id`) VALUES (3, 4);
INSERT INTO `thread_has_genre` (`thread_id`, `genre_id`) VALUES (4, 3);
INSERT INTO `thread_has_genre` (`thread_id`, `genre_id`) VALUES (4, 2);
INSERT INTO `thread_has_genre` (`thread_id`, `genre_id`) VALUES (5, 1);
INSERT INTO `thread_has_genre` (`thread_id`, `genre_id`) VALUES (5, 2);
INSERT INTO `thread_has_genre` (`thread_id`, `genre_id`) VALUES (5, 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `blog_has_genre`
-- -----------------------------------------------------
START TRANSACTION;
USE `crescendodb`;
INSERT INTO `blog_has_genre` (`blog_id`, `genre_id`) VALUES (1, 1);
INSERT INTO `blog_has_genre` (`blog_id`, `genre_id`) VALUES (2, 2);
INSERT INTO `blog_has_genre` (`blog_id`, `genre_id`) VALUES (2, 3);
INSERT INTO `blog_has_genre` (`blog_id`, `genre_id`) VALUES (4, 4);
INSERT INTO `blog_has_genre` (`blog_id`, `genre_id`) VALUES (5, 1);
INSERT INTO `blog_has_genre` (`blog_id`, `genre_id`) VALUES (5, 2);
INSERT INTO `blog_has_genre` (`blog_id`, `genre_id`) VALUES (7, 3);
INSERT INTO `blog_has_genre` (`blog_id`, `genre_id`) VALUES (8, 4);
INSERT INTO `blog_has_genre` (`blog_id`, `genre_id`) VALUES (8, 1);
INSERT INTO `blog_has_genre` (`blog_id`, `genre_id`) VALUES (10, 2);

COMMIT;

