-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ConsultorioMedico
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ConsultorioMedico
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ConsultorioMedico` DEFAULT CHARACTER SET utf8 ;
USE `ConsultorioMedico` ;

-- -----------------------------------------------------
-- Table `ConsultorioMedico`.`Afiliados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ConsultorioMedico`.`Afiliados` (
  `idAfiliados` INT NOT NULL AUTO_INCREMENT,
  `nombreAfiliado` VARCHAR(45) NULL,
  `docAfiliado` VARCHAR(45) NULL,
  `fechaNacimiento` DATE NULL,
  `edad` INT NULL,
  `celular` INT NULL,
  `dirAfiliado` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `genero` VARCHAR(45) NULL,
  `tipoAfiliado` VARCHAR(45) NULL,
  `nota` VARCHAR(45) NULL,
  PRIMARY KEY (`idAfiliados`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ConsultorioMedico`.`Medicos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ConsultorioMedico`.`Medicos` (
  `idMedicos` INT NOT NULL AUTO_INCREMENT,
  `nombreMedico` VARCHAR(45) NULL,
  `docMedico` VARCHAR(45) NULL,
  `fechaNacimiento` DATE NULL,
  `edad` INT NULL,
  `celular` INT NULL,
  `dirMedico` VARCHAR(45) NULL,
  `especialidad` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `genero` VARCHAR(45) NULL,
  `nota` INT NULL,
  PRIMARY KEY (`idMedicos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ConsultorioMedico`.`Administrador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ConsultorioMedico`.`Administrador` (
  `idAdministrador` INT NOT NULL AUTO_INCREMENT,
  `usuario` VARCHAR(45) NULL,
  `password` VARCHAR(45) NULL,
  `nombreAdministrador` VARCHAR(45) NULL,
  `dirAdministrador` VARCHAR(45) NULL,
  `tipoAdministrador` VARCHAR(45) NULL,
  `celular` VARCHAR(45) NULL,
  `emailAdministrador` VARCHAR(45) NULL,
  `nota` VARCHAR(45) NULL,
  PRIMARY KEY (`idAdministrador`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ConsultorioMedico`.`Consultorio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ConsultorioMedico`.`Consultorio` (
  `idConsultorio` INT NOT NULL AUTO_INCREMENT,
  `consultorio` VARCHAR(45) NULL,
  PRIMARY KEY (`idConsultorio`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ConsultorioMedico`.`Citas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ConsultorioMedico`.`Citas` (
  `idCitas` INT NOT NULL AUTO_INCREMENT,
  `nombreCita` VARCHAR(45) NULL,
  `fechaCita` DATE NULL,
  `horaCita` VARCHAR(45) NULL,
  `tipoCita` VARCHAR(45) NULL,
  `lugarCita` VARCHAR(45) NULL,
  `recomendaciones` VARCHAR(45) NULL,
  `idAfiliados` INT NOT NULL,
  `idMedicos` INT NOT NULL,
  `idAdministrador` INT NOT NULL,
  `idConsultorio` INT NOT NULL,
  PRIMARY KEY (`idCitas`),
  INDEX `fk_Citas_Afiliados_idx` (`idAfiliados` ASC) VISIBLE,
  INDEX `fk_Citas_Medicos1_idx` (`idMedicos` ASC) VISIBLE,
  INDEX `fk_Citas_Administrador1_idx` (`idAdministrador` ASC) VISIBLE,
  INDEX `fk_Citas_Consultorio1_idx` (`idConsultorio` ASC) VISIBLE,
  CONSTRAINT `fk_Citas_Afiliados`
    FOREIGN KEY (`idAfiliados`)
    REFERENCES `ConsultorioMedico`.`Afiliados` (`idAfiliados`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Citas_Medicos1`
    FOREIGN KEY (`idMedicos`)
    REFERENCES `ConsultorioMedico`.`Medicos` (`idMedicos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Citas_Administrador1`
    FOREIGN KEY (`idAdministrador`)
    REFERENCES `ConsultorioMedico`.`Administrador` (`idAdministrador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Citas_Consultorio1`
    FOREIGN KEY (`idConsultorio`)
    REFERENCES `ConsultorioMedico`.`Consultorio` (`idConsultorio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ConsultorioMedico`.`Consultas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ConsultorioMedico`.`Consultas` (
  `idConsultas` INT NOT NULL AUTO_INCREMENT,
  `medico` VARCHAR(45) NULL,
  `paciente` VARCHAR(45) NULL,
  `hora` VARCHAR(45) NULL,
  `formula` VARCHAR(45) NULL,
  `dictamenMedico` VARCHAR(45) NULL,
  `idMedicos` INT NOT NULL,
  PRIMARY KEY (`idConsultas`),
  INDEX `fk_Consultas_Medicos1_idx` (`idMedicos` ASC) VISIBLE,
  CONSTRAINT `fk_Consultas_Medicos1`
    FOREIGN KEY (`idMedicos`)
    REFERENCES `ConsultorioMedico`.`Medicos` (`idMedicos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
