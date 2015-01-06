--
-- Скрипт сгенерирован Devart dbForge Studio for MySQL, Версия 6.3.325.0
-- Домашняя страница продукта: http://www.devart.com/ru/dbforge/mysql/studio
-- Дата скрипта: 06.01.2015 16:07:15
-- Версия сервера: 5.5.25
-- Версия клиента: 4.1
--


USE `web-animals`;

CREATE TABLE animal_type (
  id_animal_type mediumint(9) NOT NULL AUTO_INCREMENT,
  name varchar(50) NOT NULL,
  PRIMARY KEY (id_animal_type),
  UNIQUE INDEX id_animal_type (id_animal_type)
)
ENGINE = INNODB
AUTO_INCREMENT = 4
AVG_ROW_LENGTH = 5461
CHARACTER SET utf8
COLLATE utf8_general_ci;

CREATE TABLE event (
  id_event mediumint(9) NOT NULL AUTO_INCREMENT,
  text varchar(1000) NOT NULL,
  date datetime NOT NULL,
  PRIMARY KEY (id_event)
)
ENGINE = INNODB
AUTO_INCREMENT = 9
AVG_ROW_LENGTH = 8192
CHARACTER SET utf8
COLLATE utf8_general_ci;

CREATE TABLE found_request (
  id_found_request mediumint(9) NOT NULL AUTO_INCREMENT,
  foto longblob DEFAULT NULL,
  latitude decimal(10, 3) NOT NULL,
  longitude decimal(10, 3) NOT NULL,
  first_name varchar(50) NOT NULL,
  last_name varchar(50) NOT NULL,
  phone varchar(10) NOT NULL,
  date_message datetime NOT NULL,
  comment varchar(1000) DEFAULT NULL,
  PRIMARY KEY (id_found_request)
)
ENGINE = INNODB
AUTO_INCREMENT = 12
AVG_ROW_LENGTH = 53833
CHARACTER SET utf8
COLLATE utf8_general_ci;

CREATE TABLE vallere_type (
  id_vallere_type mediumint(9) NOT NULL,
  name varchar(50) DEFAULT NULL,
  PRIMARY KEY (id_vallere_type)
)
ENGINE = INNODB
AVG_ROW_LENGTH = 8192
CHARACTER SET utf8
COLLATE utf8_general_ci;

CREATE TABLE animal (
  id_animal mediumint(9) NOT NULL AUTO_INCREMENT,
  name char(30) NOT NULL,
  id_animal_type mediumint(9) DEFAULT NULL,
  comment varchar(255) DEFAULT NULL,
  foto longblob DEFAULT NULL,
  PRIMARY KEY (id_animal),
  CONSTRAINT FK_animal_animal_type_id_animal_type FOREIGN KEY (id_animal_type)
  REFERENCES animal_type (id_animal_type) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE = INNODB
AUTO_INCREMENT = 13
AVG_ROW_LENGTH = 178176
CHARACTER SET utf8
COLLATE utf8_general_ci;

CREATE TABLE vallere (
  id_vallere mediumint(9) NOT NULL AUTO_INCREMENT,
  label varchar(255) NOT NULL,
  id_vallere_type mediumint(9) NOT NULL,
  foto longblob DEFAULT NULL,
  PRIMARY KEY (id_vallere),
  CONSTRAINT FK_vallere_vallere_type_id_vallere_type FOREIGN KEY (id_vallere_type)
  REFERENCES vallere_type (id_vallere_type) ON DELETE NO ACTION ON UPDATE NO ACTION
)
ENGINE = INNODB
AUTO_INCREMENT = 28
AVG_ROW_LENGTH = 172032
CHARACTER SET utf8
COLLATE utf8_general_ci;

CREATE TABLE animal_in_vallere (
  id_animal_in_vallere mediumint(9) NOT NULL AUTO_INCREMENT,
  id_animal mediumint(9) NOT NULL,
  id_vallere mediumint(9) NOT NULL,
  start_date datetime NOT NULL,
  end_date datetime DEFAULT NULL,
  PRIMARY KEY (id_animal_in_vallere),
  CONSTRAINT FK_animal_in_vallere_animal_id FOREIGN KEY (id_animal)
  REFERENCES animal (id_animal) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT FK_animal_in_vallere_vallere_id_vallere FOREIGN KEY (id_vallere)
  REFERENCES vallere (id_vallere) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE = INNODB
AUTO_INCREMENT = 6
AVG_ROW_LENGTH = 3276
CHARACTER SET utf8
COLLATE utf8_general_ci;

CREATE TABLE animal_request (
  id_animal_request mediumint(9) NOT NULL AUTO_INCREMENT,
  request_date datetime NOT NULL,
  first_name varchar(50) NOT NULL,
  last_name varchar(50) NOT NULL,
  contact_phone varchar(9) NOT NULL,
  id_animal mediumint(9) DEFAULT NULL,
  PRIMARY KEY (id_animal_request),
  CONSTRAINT FK_animal_request_animal_id_animal FOREIGN KEY (id_animal)
  REFERENCES animal (id_animal) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE = INNODB
AUTO_INCREMENT = 27
AVG_ROW_LENGTH = 1365
CHARACTER SET utf8
COLLATE utf8_general_ci;

CREATE TABLE hotel_registrate (
  id_hotel_registrate mediumint(9) NOT NULL AUTO_INCREMENT,
  wish_start_date datetime NOT NULL,
  id_vallere mediumint(9) NOT NULL,
  wish_end_date datetime NOT NULL,
  first_name varchar(50) NOT NULL,
  last_name varchar(50) NOT NULL,
  comment varchar(255) NOT NULL,
  contact_phone varchar(10) NOT NULL,
  PRIMARY KEY (id_hotel_registrate),
  CONSTRAINT FK_hotel_registrate_vallere_id_vallere FOREIGN KEY (id_vallere)
  REFERENCES vallere (id_vallere) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE = INNODB
AUTO_INCREMENT = 19
AVG_ROW_LENGTH = 8192
CHARACTER SET utf8
COLLATE utf8_general_ci;

CREATE OR REPLACE
DEFINER = 'root'@'localhost'
VIEW v_curent_animals
AS
SELECT
  `a`.`id_animal` AS `id_animal`,
  `a`.`name` AS `name`,
  `a`.`comment` AS `comment`,
  `at`.`name` AS `type_name`,
  `v`.`label` AS `label`,
  `aiv`.`start_date` AS `start_date`,
  `a`.`foto` AS `foto`
FROM (((`animal_in_vallere` `aiv`
  JOIN `vallere` `v`
    ON ((`v`.`id_vallere` = `aiv`.`id_vallere`)))
  JOIN `animal` `a`
    ON ((`a`.`id_animal` = `aiv`.`id_animal`)))
  JOIN `animal_type` `at`
    ON ((`at`.`id_animal_type` = `a`.`id_animal_type`)))
WHERE ((`aiv`.`start_date` <= (SYSDATE() + INTERVAL -(0) DAY))
AND ((`aiv`.`end_date` > (SYSDATE() + INTERVAL -(0) DAY))
OR ISNULL(`aiv`.`end_date`))
AND (`v`.`id_vallere_type` = 1));