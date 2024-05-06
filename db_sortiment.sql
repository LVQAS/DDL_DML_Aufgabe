-- --------------------------------------------------------------------------------------
-- Speichert aktuelle Einstellungen und setzt temporäre Einstellungen für den Datenimport
-- --------------------------------------------------------------------------------------
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Erstellung Datenbank db_sortiment
-- -----------------------------------------------------
CREATE DATABASE IF NOT EXISTS `db_sortiment` DEFAULT CHARACTER SET utf8 ;
USE `db_sortiment` ;

-- -----------------------------------------------------
-- Erstellung Tabelle `db_sortiment`.`Hersteller`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_sortiment`.`Hersteller` (
  `id_Hersteller` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `ort` VARCHAR(45) NULL,
  PRIMARY KEY (`id_Hersteller`)
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Erstellung Tabelle `db_sortiment`.`Artikel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_sortiment`.`Artikel` (
  `id_Artikel` INT NOT NULL,
  `bezeichnung` VARCHAR(45) NULL,
  `preis` VARCHAR(45) NULL,
  `Hersteller_id_Hersteller` INT NOT NULL,
  PRIMARY KEY (`id_Artikel`),
  INDEX `fk_Artikel_Hersteller_idx` (`Hersteller_id_Hersteller`),
  CONSTRAINT `fk_Artikel_Hersteller`
    FOREIGN KEY (`Hersteller_id_Hersteller`)
    REFERENCES `db_sortiment`.`Hersteller` (`id_Hersteller`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = InnoDB;

-- -------------------------------------------------------------------
-- Stellt die vorherigen Einstellungen nach dem Datenimport wieder her
-- -------------------------------------------------------------------
SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;