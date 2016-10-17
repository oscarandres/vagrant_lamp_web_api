SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`user` ;

CREATE TABLE IF NOT EXISTS `mydb`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `picture` VARCHAR(200) NULL,
  `address` TINYTEXT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

insert into user(name,picture,address) values('nombre1','picture1.jpg','address1');
insert into user(name,picture,address) values('nombre2','picture2.jpg','address2');
insert into user(name,picture,address) values('nombre3','picture3.jpg','address3');
insert into user(name,picture,address) values('nombre4','picture4.jpg','address4');
insert into user(name,picture,address) values('nombre5','picture5.jpg','address5');
insert into user(name,picture,address) values('nombre6','picture6.jpg','address6');
insert into user(name,picture,address) values('nombre7','picture7.jpg','address7');
insert into user(name,picture,address) values('nombre8','picture8.jpg','address8');
insert into user(name,picture,address) values('nombre9','picture9.jpg','address9');
insert into user(name,picture,address) values('nombre10','picture10.jpg','address10');
insert into user(name,picture,address) values('nombre11','picture11.jpg','address11');
insert into user(name,picture,address) values('nombre12','picture12.jpg','address12');
insert into user(name,picture,address) values('nombre13','picture13.jpg','address13');
insert into user(name,picture,address) values('nombre14','picture14.jpg','address14');
insert into user(name,picture,address) values('nombre15','picture15.jpg','address15');
insert into user(name,picture,address) values('nombre16','picture16.jpg','address16');
insert into user(name,picture,address) values('nombre17','picture17.jpg','address17');
insert into user(name,picture,address) values('nombre18','picture18.jpg','address18');
insert into user(name,picture,address) values('nombre19','picture19.jpg','address19');
insert into user(name,picture,address) values('nombre20','picture20.jpg','address20');
insert into user(name,picture,address) values('nombre21','picture21.jpg','address21');
insert into user(name,picture,address) values('nombre22','picture22.jpg','address22');
insert into user(name,picture,address) values('nombre23','picture23.jpg','address23');
insert into user(name,picture,address) values('nombre24','picture24.jpg','address24');
insert into user(name,picture,address) values('nombre25','picture25.jpg','address25');
insert into user(name,picture,address) values('nombre26','picture26.jpg','address26');
insert into user(name,picture,address) values('nombre27','picture27.jpg','address27');
insert into user(name,picture,address) values('nombre28','picture28.jpg','address28');
insert into user(name,picture,address) values('nombre29','picture29.jpg','address29');
insert into user(name,picture,address) values('nombre30','picture30.jpg','address30');
insert into user(name,picture,address) values('nombre31','picture31.jpg','address31');
insert into user(name,picture,address) values('nombre32','picture32.jpg','address32');
insert into user(name,picture,address) values('nombre33','picture33.jpg','address33');
insert into user(name,picture,address) values('nombre34','picture34.jpg','address34');
insert into user(name,picture,address) values('nombre35','picture35.jpg','address35');
insert into user(name,picture,address) values('nombre36','picture36.jpg','address36');
insert into user(name,picture,address) values('nombre37','picture37.jpg','address37');
insert into user(name,picture,address) values('nombre38','picture38.jpg','address38');
insert into user(name,picture,address) values('nombre39','picture39.jpg','address39');
insert into user(name,picture,address) values('nombre40','picture40.jpg','address40');
insert into user(name,picture,address) values('nombre41','picture41.jpg','address41');
insert into user(name,picture,address) values('nombre42','picture42.jpg','address42');
insert into user(name,picture,address) values('nombre43','picture43.jpg','address43');
insert into user(name,picture,address) values('nombre44','picture44.jpg','address44');
insert into user(name,picture,address) values('nombre45','picture45.jpg','address45');
insert into user(name,picture,address) values('nombre46','picture46.jpg','address46');
insert into user(name,picture,address) values('nombre47','picture47.jpg','address47');
insert into user(name,picture,address) values('nombre48','picture48.jpg','address48');
insert into user(name,picture,address) values('nombre49','picture49.jpg','address49');
insert into user(name,picture,address) values('nombre50','picture50.jpg','address50');
insert into user(name,picture,address) values('nombre51','picture51.jpg','address51');
insert into user(name,picture,address) values('nombre52','picture52.jpg','address52');
insert into user(name,picture,address) values('nombre53','picture53.jpg','address53');
insert into user(name,picture,address) values('nombre54','picture54.jpg','address54');
insert into user(name,picture,address) values('nombre55','picture55.jpg','address55');
insert into user(name,picture,address) values('nombre56','picture56.jpg','address56');
insert into user(name,picture,address) values('nombre57','picture57.jpg','address57');
insert into user(name,picture,address) values('nombre58','picture58.jpg','address58');
insert into user(name,picture,address) values('nombre59','picture59.jpg','address59');
insert into user(name,picture,address) values('nombre60','picture60.jpg','address60');
insert into user(name,picture,address) values('nombre61','picture61.jpg','address61');
insert into user(name,picture,address) values('nombre62','picture62.jpg','address62');
insert into user(name,picture,address) values('nombre63','picture63.jpg','address63');
insert into user(name,picture,address) values('nombre64','picture64.jpg','address64');
insert into user(name,picture,address) values('nombre65','picture65.jpg','address65');
insert into user(name,picture,address) values('nombre66','picture66.jpg','address66');
insert into user(name,picture,address) values('nombre67','picture67.jpg','address67');
insert into user(name,picture,address) values('nombre68','picture68.jpg','address68');
insert into user(name,picture,address) values('nombre69','picture69.jpg','address69');
insert into user(name,picture,address) values('nombre70','picture70.jpg','address70');
insert into user(name,picture,address) values('nombre71','picture71.jpg','address71');
insert into user(name,picture,address) values('nombre72','picture72.jpg','address72');
insert into user(name,picture,address) values('nombre73','picture73.jpg','address73');
insert into user(name,picture,address) values('nombre74','picture74.jpg','address74');
insert into user(name,picture,address) values('nombre75','picture75.jpg','address75');
insert into user(name,picture,address) values('nombre76','picture76.jpg','address76');
insert into user(name,picture,address) values('nombre77','picture77.jpg','address77');
insert into user(name,picture,address) values('nombre78','picture78.jpg','address78');
insert into user(name,picture,address) values('nombre79','picture79.jpg','address79');
insert into user(name,picture,address) values('nombre80','picture80.jpg','address80');
insert into user(name,picture,address) values('nombre81','picture81.jpg','address81');
insert into user(name,picture,address) values('nombre82','picture82.jpg','address82');
insert into user(name,picture,address) values('nombre83','picture83.jpg','address83');
insert into user(name,picture,address) values('nombre84','picture84.jpg','address84');
insert into user(name,picture,address) values('nombre85','picture85.jpg','address85');
insert into user(name,picture,address) values('nombre86','picture86.jpg','address86');
insert into user(name,picture,address) values('nombre87','picture87.jpg','address87');
insert into user(name,picture,address) values('nombre88','picture88.jpg','address88');
insert into user(name,picture,address) values('nombre89','picture89.jpg','address89');
insert into user(name,picture,address) values('nombre90','picture90.jpg','address90');
insert into user(name,picture,address) values('nombre91','picture91.jpg','address91');
insert into user(name,picture,address) values('nombre92','picture92.jpg','address92');
insert into user(name,picture,address) values('nombre93','picture93.jpg','address93');
insert into user(name,picture,address) values('nombre94','picture94.jpg','address94');
insert into user(name,picture,address) values('nombre95','picture95.jpg','address95');
insert into user(name,picture,address) values('nombre96','picture96.jpg','address96');
insert into user(name,picture,address) values('nombre97','picture97.jpg','address97');
insert into user(name,picture,address) values('nombre98','picture98.jpg','address98');
insert into user(name,picture,address) values('nombre99','picture99.jpg','address99');
insert into user(name,picture,address) values('nombre100','picture100.jpg','address100');



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
