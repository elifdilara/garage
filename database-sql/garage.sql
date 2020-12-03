-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema garage
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema garage
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `garage` DEFAULT CHARACTER SET utf8 ;
USE `garage` ;

-- -----------------------------------------------------
-- Table `garage`.`status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `garage`.`status` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `status` VARCHAR(12) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `garage`.`type_app`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `garage`.`type_app` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(14) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `garage`.`engine_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `garage`.`engine_type` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(10) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `garage`.`type_car`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `garage`.`type_car` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `garage`.`type_user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `garage`.`type_user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(5) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `garage`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `garage`.`user` (
  `email` VARCHAR(50) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  `mobilePhone` VARCHAR(20) NULL DEFAULT NULL,
  `type_user_id` INT NOT NULL,
  `plateNumber` VARCHAR(15) NULL DEFAULT NULL,
  `make` VARCHAR(30) NULL DEFAULT NULL,
  `engine_type_id` INT NOT NULL,
  `type_car_id` INT NOT NULL,
  PRIMARY KEY (`email`),
  INDEX `fk_user_type_user1_idx` (`type_user_id` ASC) VISIBLE,
  INDEX `fk_user_engine_type1_idx` (`engine_type_id` ASC) VISIBLE,
  INDEX `fk_user_type_car1_idx` (`type_car_id` ASC) VISIBLE,
  CONSTRAINT `fk_user_engine_type1`
    FOREIGN KEY (`engine_type_id`)
    REFERENCES `garage`.`engine_type` (`id`),
  CONSTRAINT `fk_user_type_car1`
    FOREIGN KEY (`type_car_id`)
    REFERENCES `garage`.`type_car` (`id`),
  CONSTRAINT `fk_user_type_user1`
    FOREIGN KEY (`type_user_id`)
    REFERENCES `garage`.`type_user` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `garage`.`appoinment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `garage`.`appoinment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_email` VARCHAR(50) NOT NULL,
  `date` DATE NULL DEFAULT NULL,
  `comment` VARCHAR(200) NULL DEFAULT NULL,
  `status_id` INT NOT NULL,
  `type_app_id` INT NOT NULL,
  PRIMARY KEY (`id`, `user_email`),
  INDEX `fk_Appoinment_status1_idx` (`status_id` ASC) VISIBLE,
  INDEX `fk_Appoinment_type_app1_idx` (`type_app_id` ASC) VISIBLE,
  INDEX `fk_Appoinments_user1` (`user_email` ASC) VISIBLE,
  CONSTRAINT `fk_Appoinment_status1`
    FOREIGN KEY (`status_id`)
    REFERENCES `garage`.`status` (`id`),
  CONSTRAINT `fk_Appoinment_type_app1`
    FOREIGN KEY (`type_app_id`)
    REFERENCES `garage`.`type_app` (`id`),
  CONSTRAINT `fk_Appoinments_user1`
    FOREIGN KEY (`user_email`)
    REFERENCES `garage`.`user` (`email`))
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `garage`.`shift`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `garage`.`shift` (
  `id` INT NOT NULL,
  `time` TIME NULL DEFAULT NULL,
  `description` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `garage`.`appoinment_has_shift`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `garage`.`appoinment_has_shift` (
  `appoinment_id` INT NOT NULL,
  `appoinment_user_email` VARCHAR(50) NOT NULL,
  `shift_id` INT NOT NULL,
  PRIMARY KEY (`appoinment_id`, `appoinment_user_email`, `shift_id`),
  INDEX `fk_appoinment_has_shift_shift1_idx` (`shift_id` ASC) VISIBLE,
  INDEX `fk_appoinment_has_shift_appoinment1_idx` (`appoinment_id` ASC, `appoinment_user_email` ASC) VISIBLE,
  CONSTRAINT `fk_appoinment_has_shift_appoinment1`
    FOREIGN KEY (`appoinment_id` , `appoinment_user_email`)
    REFERENCES `garage`.`appoinment` (`id` , `user_email`),
  CONSTRAINT `fk_appoinment_has_shift_shift1`
    FOREIGN KEY (`shift_id`)
    REFERENCES `garage`.`shift` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `garage`.`cost`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `garage`.`cost` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT 'It could be the invoice number',
  `Appoinment_user_email` VARCHAR(50) NOT NULL,
  `Appoinment_id` INT NOT NULL,
  `total` DECIMAL(15,2) NOT NULL,
  `currency` VARCHAR(3) NOT NULL,
  `date` DATETIME NOT NULL,
  PRIMARY KEY (`id`, `Appoinment_user_email`, `Appoinment_id`),
  INDEX `fk_Cost_Appoinment1` (`Appoinment_user_email` ASC, `Appoinment_id` ASC) VISIBLE,
  CONSTRAINT `fk_Cost_Appoinment1`
    FOREIGN KEY (`Appoinment_user_email` , `Appoinment_id`)
    REFERENCES `garage`.`appoinment` (`user_email` , `id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `garage`.`item`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `garage`.`item` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `price` DECIMAL(15,2) NULL DEFAULT NULL,
  `currency` VARCHAR(3) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `garage`.`detail`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `garage`.`detail` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Cost_Appoinment_user_email` VARCHAR(50) NOT NULL,
  `Cost_Appoinment_id` INT NOT NULL,
  `Cost_id` INT NOT NULL,
  `amount` DECIMAL(15,2) NULL DEFAULT NULL,
  `task` VARCHAR(50) NULL DEFAULT NULL,
  `Item_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`, `Cost_Appoinment_user_email`, `Cost_Appoinment_id`, `Cost_id`),
  INDEX `fk_Detail_Item1_idx` (`Item_id` ASC) VISIBLE,
  INDEX `fk_Detail_Cost1` (`Cost_Appoinment_user_email` ASC, `Cost_Appoinment_id` ASC, `Cost_id` ASC) VISIBLE,
  CONSTRAINT `fk_Detail_Cost1`
    FOREIGN KEY (`Cost_Appoinment_user_email` , `Cost_Appoinment_id` , `Cost_id`)
    REFERENCES `garage`.`cost` (`Appoinment_user_email` , `Appoinment_id` , `id`),
  CONSTRAINT `fk_Detail_Item1`
    FOREIGN KEY (`Item_id`)
    REFERENCES `garage`.`item` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `garage`.`make`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `garage`.`make` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `make` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 18
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `garage`.`mechanic`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `garage`.`mechanic` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `garage`.`shift_has_mechanic`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `garage`.`shift_has_mechanic` (
  `shift_id` INT NOT NULL,
  `Mechanic_id` INT NOT NULL,
  PRIMARY KEY (`shift_id`, `Mechanic_id`),
  INDEX `fk_shift_has_Mechanic_Mechanic1_idx` (`Mechanic_id` ASC) VISIBLE,
  INDEX `fk_shift_has_Mechanic_shift1_idx` (`shift_id` ASC) VISIBLE,
  CONSTRAINT `fk_shift_has_Mechanic_Mechanic1`
    FOREIGN KEY (`Mechanic_id`)
    REFERENCES `garage`.`mechanic` (`id`),
  CONSTRAINT `fk_shift_has_Mechanic_shift1`
    FOREIGN KEY (`shift_id`)
    REFERENCES `garage`.`shift` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
