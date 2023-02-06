SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for dyskusja
-- ----------------------------
DROP TABLE IF EXISTS `dyskusja`;
CREATE TABLE `dyskusja`  (
  `ID_dyskusja` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ID_temat` int(10) UNSIGNED NULL DEFAULT NULL,
  `ID_uzytkownik` int(10) UNSIGNED NULL DEFAULT NULL,
  `ID_do_dyskusji` int(10) UNSIGNED NULL DEFAULT NULL,
  `tresc_dyskusji` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `data_dys` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID_dyskusja`) USING BTREE,
  INDEX `idx1`(`ID_temat`) USING BTREE,
  INDEX `idx2`(`ID_uzytkownik`) USING BTREE,
  INDEX `idx3`(`ID_do_dyskusji`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dyskusja_pojazdy
-- ----------------------------
DROP TABLE IF EXISTS `dyskusja_pojazdy`;
CREATE TABLE `dyskusja_pojazdy`  (
  `ID_dyskusja` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ID_temat` int(10) UNSIGNED NULL DEFAULT NULL,
  `ID_pracownicy` int(10) UNSIGNED NULL DEFAULT NULL,
  `ID_pojazdy` int(10) UNSIGNED NULL DEFAULT NULL,
  `ID_do_dyskusji` int(10) UNSIGNED NULL DEFAULT NULL,
  `tresc_dyskusji` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `data` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID_dyskusja`) USING BTREE,
  INDEX `ID_pojazdy`(`ID_pojazdy`) USING BTREE,
  INDEX `dyskusja_pojazdy_ibfk_2`(`ID_pracownicy`) USING BTREE,
  CONSTRAINT `dyskusja_pojazdy_ibfk_1` FOREIGN KEY (`ID_pojazdy`) REFERENCES `pojazdy` (`ID_pojazdy`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `dyskusja_pojazdy_ibfk_2` FOREIGN KEY (`ID_pracownicy`) REFERENCES `pracownicy` (`ID_pracownicy`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for klienci
-- ----------------------------
DROP TABLE IF EXISTS `klienci`;
CREATE TABLE `klienci`  (
  `ID_klient` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_polish_ci NULL DEFAULT NULL,
  `panstwo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `wojewodztwo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `miasto` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `ulica` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `kod_pocztowy` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_polish_ci NULL DEFAULT NULL,
  `stały_klient` enum('Tak','Nie') CHARACTER SET utf8mb3 COLLATE utf8mb3_polish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_klient`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ladunek
-- ----------------------------
DROP TABLE IF EXISTS `ladunek`;
CREATE TABLE `ladunek`  (
  `ID_ladunek` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `kategoria` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_polish_ci NULL DEFAULT NULL,
  `ADR` enum('Tak','Nie') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_ladunek`) USING BTREE,
  UNIQUE INDEX `kategoria`(`kategoria`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pojazdy
-- ----------------------------
DROP TABLE IF EXISTS `pojazdy`;
CREATE TABLE `pojazdy`  (
  `ID_pojazdy` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ID_typ_pojazdu` int(10) UNSIGNED NULL DEFAULT NULL,
  `marka` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_polish_ci NOT NULL,
  `model` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_polish_ci NULL DEFAULT NULL,
  `numer_vin` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_polish_ci NOT NULL,
  `numer_rejestracyjny` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_polish_ci NULL DEFAULT NULL,
  `numer_ubezpieczenia` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_polish_ci NULL DEFAULT NULL,
  `data_nastepnego_przegladu` date NULL DEFAULT NULL,
  PRIMARY KEY (`ID_pojazdy`) USING BTREE,
  INDEX `ID_typ_pojazdu`(`ID_typ_pojazdu`) USING BTREE,
  INDEX `ID_pojazdy`(`ID_pojazdy`) USING BTREE,
  CONSTRAINT `pojazdy_ibfk_2` FOREIGN KEY (`ID_typ_pojazdu`) REFERENCES `typ_pojazdu` (`ID_typ_pojazdu`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pracownicy
-- ----------------------------
DROP TABLE IF EXISTS `pracownicy`;
CREATE TABLE `pracownicy`  (
  `ID_pracownicy` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `imie` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_polish_ci NOT NULL,
  `nazwisko` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_polish_ci NOT NULL,
  `login` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_polish_ci NULL DEFAULT NULL,
  `haslo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_polish_ci NULL DEFAULT NULL,
  `uprawnienia` set('B','B+E','C','C1','C1+E','C+E','ADR','WJO') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '',
  `data_zatrudnienia` date NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ID_pracownicy`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pracownicy_pojazdy
-- ----------------------------
DROP TABLE IF EXISTS `pracownicy_pojazdy`;
CREATE TABLE `pracownicy_pojazdy`  (
  `ID_pracownicy` int(10) UNSIGNED NOT NULL,
  `ID_pojazdy` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`ID_pracownicy`, `ID_pojazdy`) USING BTREE,
  INDEX `pracownicy_pojazdy_ibfk_2`(`ID_pojazdy`) USING BTREE,
  CONSTRAINT `pracownicy_pojazdy_ibfk_1` FOREIGN KEY (`ID_pracownicy`) REFERENCES `pracownicy` (`ID_pracownicy`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pracownicy_pojazdy_ibfk_2` FOREIGN KEY (`ID_pojazdy`) REFERENCES `pojazdy` (`ID_pojazdy`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pracownicy_stanowisko
-- ----------------------------
DROP TABLE IF EXISTS `pracownicy_stanowisko`;
CREATE TABLE `pracownicy_stanowisko`  (
  `ID_pracownicy` int(10) UNSIGNED NOT NULL,
  `ID_stanowisko` int(10) UNSIGNED NOT NULL,
  `ID_rodzaj_stanowiska` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`ID_pracownicy`, `ID_stanowisko`, `ID_rodzaj_stanowiska`) USING BTREE,
  INDEX `ID_stanowisko`(`ID_stanowisko`) USING BTREE,
  INDEX `ID_rodzaj_stanowiska`(`ID_rodzaj_stanowiska`) USING BTREE,
  CONSTRAINT `pracownicy_stanowisko_ibfk_1` FOREIGN KEY (`ID_pracownicy`) REFERENCES `pracownicy` (`ID_pracownicy`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pracownicy_stanowisko_ibfk_2` FOREIGN KEY (`ID_stanowisko`) REFERENCES `stanowiska` (`ID_stanowisko`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `pracownicy_stanowisko_ibfk_3` FOREIGN KEY (`ID_rodzaj_stanowiska`) REFERENCES `rodzaj_stanowiska` (`ID_rodzaj_stanowiska`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for rodzaj_stanowiska
-- ----------------------------
DROP TABLE IF EXISTS `rodzaj_stanowiska`;
CREATE TABLE `rodzaj_stanowiska`  (
  `ID_rodzaj_stanowiska` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `rodzaj_stanowiska` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_polish_ci NOT NULL,
  PRIMARY KEY (`ID_rodzaj_stanowiska`) USING BTREE,
  UNIQUE INDEX `rodzaj_stanowiska`(`rodzaj_stanowiska`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for stanowiska
-- ----------------------------
DROP TABLE IF EXISTS `stanowiska`;
CREATE TABLE `stanowiska`  (
  `ID_stanowisko` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nazwa_stanowiska` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_polish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_stanowisko`) USING BTREE,
  UNIQUE INDEX `nazwa_stanowiska`(`nazwa_stanowiska`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for typ_pojazdu
-- ----------------------------
DROP TABLE IF EXISTS `typ_pojazdu`;
CREATE TABLE `typ_pojazdu`  (
  `ID_typ_pojazdu` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `rodzaj_pojazdu` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_polish_ci NULL DEFAULT NULL,
  `wymagane_uprawnienia` set('B','B+E','C','C1','C1+E','C+E','WJO') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '',
  PRIMARY KEY (`ID_typ_pojazdu`) USING BTREE,
  UNIQUE INDEX `rodzaj_pojazdu`(`rodzaj_pojazdu`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for urlopy
-- ----------------------------
DROP TABLE IF EXISTS `urlopy`;
CREATE TABLE `urlopy`  (
  `ID_urlop` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ID_pracownicy` int(10) UNSIGNED NOT NULL,
  `data_rozpoczecia` date NOT NULL DEFAULT current_timestamp(),
  `data_zakonczenia` date NULL DEFAULT NULL,
  `liczba_dni` int(10) NULL DEFAULT NULL,
  `argumentacja` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_polish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_urlop`) USING BTREE,
  INDEX `ID_pracownicy`(`ID_pracownicy`) USING BTREE,
  CONSTRAINT `urlopy_ibfk_1` FOREIGN KEY (`ID_pracownicy`) REFERENCES `pracownicy` (`ID_pracownicy`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for zlecenia
-- ----------------------------
DROP TABLE IF EXISTS `zlecenia`;
CREATE TABLE `zlecenia`  (
  `UID_zlecenia` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `ID_klient` int(10) UNSIGNED NOT NULL,
  `nazwa_ladunku` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_polish_ci NULL DEFAULT NULL,
  `ID_miejsce_docelowe` int(10) UNSIGNED NOT NULL,
  `data_odjazdu` datetime NOT NULL DEFAULT current_timestamp(),
  `data_dostarczenia` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ID_kierowca` int(10) UNSIGNED NOT NULL,
  `ID_ladunek` int(10) UNSIGNED NOT NULL,
  `ID_spedytor` int(10) UNSIGNED NOT NULL,
  `priorytet` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_polish_ci NULL DEFAULT NULL,
  `data_modyfikacji` timestamp NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`UID_zlecenia`) USING BTREE,
  INDEX `ID_kierowca`(`ID_kierowca`) USING BTREE,
  INDEX `ID_ladunek`(`ID_ladunek`) USING BTREE,
  INDEX `UID_zlecenia`(`UID_zlecenia`) USING BTREE,
  INDEX `ID_klient`(`ID_klient`) USING BTREE,
  INDEX `ID_spedytor`(`ID_spedytor`) USING BTREE,
  INDEX `ID_miejsce_docelowe`(`ID_miejsce_docelowe`) USING BTREE,
  FULLTEXT INDEX `nazwa_ladunku`(`nazwa_ladunku`),
  FULLTEXT INDEX `nazwa_ladunku_2`(`nazwa_ladunku`),
  FULLTEXT INDEX `nazwa_ladunku_3`(`nazwa_ladunku`),
  FULLTEXT INDEX `nazwa_ladunku_4`(`nazwa_ladunku`),
  FULLTEXT INDEX `nazwa_ladunku_5`(`nazwa_ladunku`),
  FULLTEXT INDEX `nazwa_ladunku_6`(`nazwa_ladunku`),
  FULLTEXT INDEX `nazwa_ladunku_7`(`nazwa_ladunku`),
  FULLTEXT INDEX `nazwa_ladunku_8`(`nazwa_ladunku`),
  FULLTEXT INDEX `nazwa_ladunku_9`(`nazwa_ladunku`),
  FULLTEXT INDEX `nazwa_ladunku_10`(`nazwa_ladunku`),
  FULLTEXT INDEX `nazwa_ladunku_11`(`nazwa_ladunku`),
  FULLTEXT INDEX `nazwa_ladunku_12`(`nazwa_ladunku`),
  FULLTEXT INDEX `nazwa_ladunku_13`(`nazwa_ladunku`),
  CONSTRAINT `zlecenia_ibfk_2` FOREIGN KEY (`ID_ladunek`) REFERENCES `ladunek` (`ID_ladunek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `zlecenia_ibfk_3` FOREIGN KEY (`ID_klient`) REFERENCES `klienci` (`ID_klient`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `zlecenia_ibfk_4` FOREIGN KEY (`ID_kierowca`) REFERENCES `pracownicy` (`ID_pracownicy`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `zlecenia_ibfk_5` FOREIGN KEY (`ID_spedytor`) REFERENCES `pracownicy` (`ID_pracownicy`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `zlecenia_ibfk_6` FOREIGN KEY (`ID_miejsce_docelowe`) REFERENCES `zlecenia_cel` (`ID_miejsce_docelowe`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for zlecenia_arch
-- ----------------------------
DROP TABLE IF EXISTS `zlecenia_arch`;
CREATE TABLE `zlecenia_arch`  (
  `ID_archiwum` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `UID_zlecenia` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `ID_klient` int(10) UNSIGNED NOT NULL,
  `nazwa_ladunku` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_polish_ci NULL DEFAULT NULL,
  `ID_miejsce_docelowe` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `data_odjazdu` datetime NOT NULL,
  `data_dostarczenia` datetime NOT NULL,
  `ID_kierowca` int(10) UNSIGNED NOT NULL,
  `ID_ladunek` int(10) UNSIGNED NOT NULL,
  `ID_spedytor` int(10) UNSIGNED NOT NULL,
  `priorytet` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_polish_ci NULL DEFAULT NULL,
  `data_modyfikacji` timestamp NULL DEFAULT NULL,
  `data_archiwizacji` timestamp NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP,
  `akcja` enum('update','delete') CHARACTER SET utf8mb3 COLLATE utf8mb3_polish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_archiwum`, `data_dostarczenia`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic PARTITION BY LIST (year(`data_dostarczenia`))
PARTITIONS 3
(PARTITION `2020/2019` VALUES IN (2019,2020) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `2022/2021` VALUES IN (2021,2022) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `2024/2023` VALUES IN (2023,2024) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 )
;

-- ----------------------------
-- Table structure for zlecenia_cel
-- ----------------------------
DROP TABLE IF EXISTS `zlecenia_cel`;
CREATE TABLE `zlecenia_cel`  (
  `ID_miejsce_docelowe` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `panstwo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `wojewodztwo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `miasto` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `ulica` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_miejsce_docelowe`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for zlecenia_oczekujace
-- ----------------------------
DROP TABLE IF EXISTS `zlecenia_oczekujace`;
CREATE TABLE `zlecenia_oczekujace`  (
  `ID_zlecenia` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `UID_zlecenia` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `ID_klient` int(10) UNSIGNED NOT NULL,
  `nazwa_ladunku` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_polish_ci NULL DEFAULT NULL,
  `ID_miejsce_docelowe` int(10) UNSIGNED NOT NULL,
  `ID_ladunek` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`ID_zlecenia`) USING BTREE,
  UNIQUE INDEX `UID_zlecenia`(`UID_zlecenia`) USING BTREE,
  INDEX `ID_klient`(`ID_klient`) USING BTREE,
  INDEX `ID_ladunek`(`ID_ladunek`) USING BTREE,
  INDEX `miejsce_docelowe`(`ID_miejsce_docelowe`) USING BTREE,
  CONSTRAINT `zlecenia_oczekujace_ibfk_1` FOREIGN KEY (`ID_klient`) REFERENCES `klienci` (`ID_klient`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `zlecenia_oczekujace_ibfk_2` FOREIGN KEY (`ID_ladunek`) REFERENCES `ladunek` (`ID_ladunek`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `zlecenia_oczekujace_ibfk_3` FOREIGN KEY (`ID_miejsce_docelowe`) REFERENCES `zlecenia_cel` (`ID_miejsce_docelowe`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- View structure for kilku_pracownikow_urlop
-- ----------------------------
DROP VIEW IF EXISTS `kilku_pracownikow_urlop`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `kilku_pracownikow_urlop` AS select monthname(str_to_date(month(`urlopy`.`data_rozpoczecia`),'%m')) AS `Miesiąc`,count(0) AS `Liczba_pracowników` from `urlopy` group by monthname(str_to_date(month(`urlopy`.`data_rozpoczecia`),'%m')) having count(0) > 2;

-- ----------------------------
-- View structure for liczba_pojazdow
-- ----------------------------
DROP VIEW IF EXISTS `liczba_pojazdow`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `liczba_pojazdow` AS select `typ_pojazdu`.`rodzaj_pojazdu` AS `Rodzaj pojazdu`,count(0) AS `Liczba` from (`pojazdy` left join `typ_pojazdu` on(`pojazdy`.`ID_typ_pojazdu` = `typ_pojazdu`.`ID_typ_pojazdu`)) group by `typ_pojazdu`.`rodzaj_pojazdu` order by count(0) desc;

-- ----------------------------
-- View structure for liczba_pracownikow
-- ----------------------------
DROP VIEW IF EXISTS `liczba_pracownikow`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `liczba_pracownikow` AS select `stanowiska`.`nazwa_stanowiska` AS `Nazwa stanowiska`,count(0) AS `Liczba` from (`stanowiska` left join `pracownicy_stanowisko` on(`pracownicy_stanowisko`.`ID_stanowisko` = `stanowiska`.`ID_stanowisko`)) group by `stanowiska`.`nazwa_stanowiska` order by count(0) desc;

-- ----------------------------
-- View structure for pracownicy_urlopy
-- ----------------------------
DROP VIEW IF EXISTS `pracownicy_urlopy`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `pracownicy_urlopy` AS select `pracownicy`.`imie` AS `imie`,`pracownicy`.`nazwisko` AS `nazwisko`,`urlopy`.`data_rozpoczecia` AS `data_rozpoczecia`,`urlopy`.`data_zakonczenia` AS `data_zakonczenia`,`urlopy`.`argumentacja` AS `argumentacja` from (`pracownicy` left join `urlopy` on(`pracownicy`.`ID_pracownicy` = `urlopy`.`ID_pracownicy`)) where `urlopy`.`data_rozpoczecia` is not null;

-- ----------------------------
-- View structure for stali_klienci
-- ----------------------------
DROP VIEW IF EXISTS `stali_klienci`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `stali_klienci` AS select `zlecenia`.`ID_klient` AS `ID_klient`,`klienci`.`nazwa` AS `nazwa`,`zlecenia`.`UID_zlecenia` AS `UID_zlecenia`,`zlecenia`.`nazwa_ladunku` AS `nazwa_ladunku`,`zlecenia`.`data_odjazdu` AS `data_odjazdu`,`zlecenia`.`data_dostarczenia` AS `data_dostarczenia`,`zlecenia`.`priorytet` AS `priorytet` from (`zlecenia` join `klienci` on(`zlecenia`.`ID_klient` = `klienci`.`ID_klient`)) where `klienci`.`stały_klient` = 'Tak' order by `zlecenia`.`ID_klient`;

-- ----------------------------
-- Procedure structure for dodaj_zlecenie
-- ----------------------------
DROP PROCEDURE IF EXISTS `dodaj_zlecenie`;
delimiter ;;
CREATE PROCEDURE `dodaj_zlecenie`(IN `ID` int, IN `data_odj` datetime, IN `data_dost` datetime, IN `ID_kier` int, IN `ID_sped` int)
BEGIN
	
	DECLARE ladunek INT(10) DEFAULT 0;
	DECLARE klient INT(10) DEFAULT 0;
	DECLARE nladunek VARCHAR(255);
	DECLARE UID VARCHAR(255);
	DECLARE cel INT(10) DEFAULT 0;
	
	SET @max = 30;
	SET @licznik = 0;
	
	IF ID IN (SELECT ID_zlecenia FROM zlecenia_oczekujace) THEN
		
		SET SESSION TRANSACTION ISOLATION LEVEL READ COMMITTED;
		START TRANSACTION;	
		
		SELECT COUNT(*) INTO @licznik FROM zlecenia FOR UPDATE;
		
		SET klient = (SELECT ID_klient FROM zlecenia_oczekujace WHERE ID_zlecenia = ID);
		SET ladunek = (SELECT ID_ladunek FROM zlecenia_oczekujace WHERE ID_zlecenia = ID);
		SET nladunek = (SELECT nazwa_ladunku FROM zlecenia_oczekujace WHERE ID_zlecenia = ID);
		SET cel = (SELECT ID_miejsce_docelowe FROM zlecenia_oczekujace WHERE ID_zlecenia = ID);
		SET UID = (SELECT UID_zlecenia FROM zlecenia_oczekujace WHERE ID_zlecenia = ID);
		
		IF @licznik < @max THEN
		
			INSERT INTO zlecenia (`UID_zlecenia`, `ID_klient`, `nazwa_ladunku`, `ID_miejsce_docelowe`, `data_odjazdu`, `data_dostarczenia`, `ID_kierowca`, `ID_ladunek`, `ID_spedytor`) VALUES (UID, klient, nladunek, cel, data_odj, data_dost, ID_kier, ladunek, ID_sped);
			
			DELETE FROM zlecenia_oczekujace WHERE ID_zlecenia = ID;
			COMMIT;
			
		ELSE
			ROLLBACK;
			SIGNAL SQLSTATE '45000' SET MYSQL_ERRNO = 30001, MESSAGE_TEXT = 'Przekroczono dopuszczalny limit zleceń.';
	
		END IF;
		
	ELSE
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Zlecenie o wprowadzonym ID nie istnieje.';
	END IF;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for dyskusja_pojazdy
-- ----------------------------
DROP PROCEDURE IF EXISTS `dyskusja_pojazdy`;
delimiter ;;
CREATE PROCEDURE `dyskusja_pojazdy`(ID_pojazdy int)
BEGIN

	WITH RECURSIVE konwersacja AS (SELECT dyskusja_pojazdy.tresc_dyskusji e, dyskusja_pojazdy.* FROM dyskusja_pojazdy WHERE dyskusja_pojazdy.ID_pojazdy = ID_pojazdy 
	UNION 
	SELECT CONCAT(d.tresc_dyskusji, ' -> ', k.tresc_dyskusji), d.* FROM dyskusja_pojazdy d JOIN konwersacja k ON d.ID_do_dyskusji = k.ID_dyskusja) 	SELECT e AS `tresc -> odpowiedz`, ID_dyskusja, ID_temat, ID_pojazdy, ID_do_dyskusji, tresc_dyskusji FROM konwersacja;
	
END
;;
delimiter ;

-- ----------------------------
-- Function structure for losuj_premie
-- ----------------------------
DROP FUNCTION IF EXISTS `losuj_premie`;
delimiter ;;
CREATE FUNCTION `losuj_premie`(`ID_pracownik` int,`wspolczynnik` double)
 RETURNS double
BEGIN
	
	DECLARE premia DOUBLE DEFAULT 0;
	
	CASE
	
		WHEN ID_pracownik IN (SELECT ID_pracownicy FROM pracownicy_stanowisko WHERE ID_rodzaj_stanowiska = 1)
		THEN SET premia = RAND() * (3000 - 2000 + 1) + 2000;
		
		WHEN ID_pracownik IN (SELECT ID_pracownicy FROM pracownicy_stanowisko WHERE ID_rodzaj_stanowiska = 2)
		THEN SET premia = RAND() * (2000 - 1000 + 1) + 1000;
		
		WHEN ID_pracownik IN (SELECT ID_pracownicy FROM pracownicy_stanowisko WHERE ID_rodzaj_stanowiska = 3)
		THEN SET premia = RAND() * (1000 - 500 + 1) + 500;
		
		WHEN ID_pracownik IN (SELECT ID_pracownicy FROM pracownicy_stanowisko WHERE ID_rodzaj_stanowiska = 4)
		THEN SET premia = RAND() * (500 - 50 + 1) + 50;
		
	END CASE;
	SET premia = premia + premia * wspolczynnik;
	
	RETURN FLOOR(premia);
END
;;
delimiter ;

-- ----------------------------
-- Function structure for urlop_zlicz
-- ----------------------------
DROP FUNCTION IF EXISTS `urlop_zlicz`;
delimiter ;;
CREATE FUNCTION `urlop_zlicz`(`od` date,`do` date)
 RETURNS int(11)
BEGIN

	DECLARE pivot INT DEFAULT 0;
	SET pivot = (SELECT COUNT(*) FROM urlopy WHERE data_rozpoczecia BETWEEN od AND `do` OR data_zakonczenia BETWEEN od AND `do`);

	RETURN pivot;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for wyszukaj_zlecenie
-- ----------------------------
DROP PROCEDURE IF EXISTS `wyszukaj_zlecenie`;
delimiter ;;
CREATE PROCEDURE `wyszukaj_zlecenie`(IN `klucz` varchar(255), IN `opcja` BOOLEAN)
BEGIN
	
	IF opcja THEN
		SELECT MATCH(nazwa_ladunku) AGAINST (klucz IN BOOLEAN MODE) AS i, nazwa_ladunku FROM zlecenia ORDER BY i DESC;
		
	ELSE
		SELECT * FROM zlecenia WHERE MATCH(nazwa_ladunku) AGAINST (klucz IN BOOLEAN MODE);
	END IF;
	
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table pojazdy
-- ----------------------------
DROP TRIGGER IF EXISTS `vin_duplikat_insert`;
delimiter ;;
CREATE TRIGGER `vin_duplikat_insert` BEFORE INSERT ON `pojazdy` FOR EACH ROW BEGIN
IF NEW.numer_vin IN (SELECT numer_vin FROM pojazdy WHERE ID_pojazdy != NEW.ID_pojazdy) THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Pojazd o wskazanym numerze VIN już istnieje.';
END IF;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table pojazdy
-- ----------------------------
DROP TRIGGER IF EXISTS `rejestracja_insert`;
delimiter ;;
CREATE TRIGGER `rejestracja_insert` BEFORE INSERT ON `pojazdy` FOR EACH ROW BEGIN
IF NEW.numer_rejestracyjny IN (SELECT numer_rejestracyjny FROM pojazdy WHERE ID_pojazdy != NEW.ID_pojazdy) THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Pojazd o wskazanym numerze rejestracyjnym już istnieje.';
ELSE
SET NEW.numer_rejestracyjny = UPPER(NEW.numer_rejestracyjny);
END IF;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table pojazdy
-- ----------------------------
DROP TRIGGER IF EXISTS `vin_duplikat_update`;
delimiter ;;
CREATE TRIGGER `vin_duplikat_update` BEFORE UPDATE ON `pojazdy` FOR EACH ROW BEGIN
IF NEW.numer_vin IN (SELECT numer_vin FROM pojazdy WHERE ID_pojazdy != NEW.ID_pojazdy) THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Pojazd o wskazanym numerze VIN już istnieje.';
END IF;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table pojazdy
-- ----------------------------
DROP TRIGGER IF EXISTS `rejestracja_update`;
delimiter ;;
CREATE TRIGGER `rejestracja_update` BEFORE UPDATE ON `pojazdy` FOR EACH ROW BEGIN
IF NEW.numer_rejestracyjny IN (SELECT numer_rejestracyjny FROM pojazdy WHERE ID_pojazdy != NEW.ID_pojazdy) THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Pojazd o wskazanym numerze rejestracyjnym już istnieje.';
ELSE
SET NEW.numer_rejestracyjny = UPPER(NEW.numer_rejestracyjny);
END IF;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table pracownicy
-- ----------------------------
DROP TRIGGER IF EXISTS `haslo_sha_update`;
delimiter ;;
CREATE TRIGGER `haslo_sha_update` BEFORE UPDATE ON `pracownicy` FOR EACH ROW BEGIN
IF LENGTH(NEW.haslo) != 40 THEN
SET NEW.haslo = SHA1(NEW.haslo);
END IF;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table pracownicy
-- ----------------------------
DROP TRIGGER IF EXISTS `login_update`;
delimiter ;;
CREATE TRIGGER `login_update` BEFORE UPDATE ON `pracownicy` FOR EACH ROW BEGIN
IF LENGTH(NEW.login) = 0 OR LENGTH(NEW.login) IS NULL THEN
SET NEW.login = CONCAT(LOWER(LEFT(NEW.imie, 1)), ".", LOWER(NEW.nazwisko));
END IF;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table pracownicy_pojazdy
-- ----------------------------
DROP TRIGGER IF EXISTS `uprawnienia_insert`;
delimiter ;;
CREATE TRIGGER `uprawnienia_insert` BEFORE INSERT ON `pracownicy_pojazdy` FOR EACH ROW BEGIN

DECLARE wzor VARCHAR(255);
SET wzor = CONCAT('%', (SELECT wymagane_uprawnienia FROM pojazdy LEFT JOIN typ_pojazdu USING(ID_typ_pojazdu) WHERE ID_pojazdy = NEW.ID_pojazdy), '%'); 

IF NEW.ID_pracownicy NOT IN (SELECT ID_pracownicy FROM pracownicy WHERE uprawnienia LIKE wzor) THEN
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Wybrany kierowca nie posiada wystarczających uprawnień.';
END IF;

END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table pracownicy_pojazdy
-- ----------------------------
DROP TRIGGER IF EXISTS `uprawnienia_update`;
delimiter ;;
CREATE TRIGGER `uprawnienia_update` BEFORE UPDATE ON `pracownicy_pojazdy` FOR EACH ROW BEGIN

DECLARE wzor VARCHAR(255);
SET wzor = CONCAT('%', (SELECT wymagane_uprawnienia FROM pojazdy LEFT JOIN typ_pojazdu USING(ID_typ_pojazdu) WHERE ID_pojazdy = NEW.ID_pojazdy), '%'); 

IF NEW.ID_pracownicy NOT IN (SELECT ID_pracownicy FROM pracownicy WHERE uprawnienia LIKE wzor) THEN
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Wybrany kierowca nie posiada wystarczających uprawnień.';
END IF;

END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table urlopy
-- ----------------------------
DROP TRIGGER IF EXISTS `urlop_blad_insert`;
delimiter ;;
CREATE TRIGGER `urlop_blad_insert` BEFORE INSERT ON `urlopy` FOR EACH ROW BEGIN
IF NEW.data_zakonczenia < NEW.data_rozpoczecia THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Wprowadzona data jest niepoprawna.';
END IF;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table urlopy
-- ----------------------------
DROP TRIGGER IF EXISTS `liczba_dni_insert`;
delimiter ;;
CREATE TRIGGER `liczba_dni_insert` BEFORE INSERT ON `urlopy` FOR EACH ROW BEGIN
IF NEW.data_zakonczenia IS NOT NULL THEN
SET NEW.liczba_dni = DATEDIFF(NEW.data_zakonczenia, NEW.data_rozpoczecia);
END IF;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table urlopy
-- ----------------------------
DROP TRIGGER IF EXISTS `urlop_blad_update`;
delimiter ;;
CREATE TRIGGER `urlop_blad_update` BEFORE UPDATE ON `urlopy` FOR EACH ROW BEGIN
IF NEW.data_zakonczenia < NEW.data_rozpoczecia THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Wprowadzona data jest niepoprawna.';
END IF;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table urlopy
-- ----------------------------
DROP TRIGGER IF EXISTS `liczba_dni_update`;
delimiter ;;
CREATE TRIGGER `liczba_dni_update` BEFORE UPDATE ON `urlopy` FOR EACH ROW BEGIN
IF NEW.data_zakonczenia IS NOT NULL THEN
SET NEW.liczba_dni = DATEDIFF(NEW.data_zakonczenia, NEW.data_rozpoczecia);
END IF;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table zlecenia
-- ----------------------------
DROP TRIGGER IF EXISTS `UUID_zlecenia_insert`;
delimiter ;;
CREATE TRIGGER `UUID_zlecenia_insert` BEFORE INSERT ON `zlecenia` FOR EACH ROW BEGIN
IF LENGTH(NEW.UID_zlecenia) != 36 THEN
SET NEW.UID_zlecenia = UUID();
END IF;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table zlecenia
-- ----------------------------
DROP TRIGGER IF EXISTS `data_zlecenia_insert`;
delimiter ;;
CREATE TRIGGER `data_zlecenia_insert` BEFORE INSERT ON `zlecenia` FOR EACH ROW BEGIN
IF NEW.data_dostarczenia < NEW.data_odjazdu THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Wprowadzona data jest niepoprawna.';
END IF;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table zlecenia
-- ----------------------------
DROP TRIGGER IF EXISTS `ladunek_zlecenia_insert`;
delimiter ;;
CREATE TRIGGER `ladunek_zlecenia_insert` BEFORE INSERT ON `zlecenia` FOR EACH ROW BEGIN
SET NEW.nazwa_ladunku = LOWER(NEW.nazwa_ladunku);
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table zlecenia
-- ----------------------------
DROP TRIGGER IF EXISTS `priorytet_zlecenia_insert`;
delimiter ;;
CREATE TRIGGER `priorytet_zlecenia_insert` BEFORE INSERT ON `zlecenia` FOR EACH ROW BEGIN
IF NEW.priorytet IS NULL OR LENGTH(NEW.priorytet) = 0 THEN
IF NEW.ID_klient IN (SELECT ID_klient FROM klienci WHERE stały_klient = 'Tak') THEN
SET NEW.priorytet = 'Wysoki';
ELSE
SET NEW.priorytet = 'Normalny';
END IF;
END IF;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table zlecenia
-- ----------------------------
DROP TRIGGER IF EXISTS `spedytor_zlecenia_insert`;
delimiter ;;
CREATE TRIGGER `spedytor_zlecenia_insert` BEFORE INSERT ON `zlecenia` FOR EACH ROW BEGIN
IF NEW.ID_spedytor NOT IN (SELECT ID_pracownicy FROM pracownicy_stanowisko WHERE ID_stanowisko = 3) THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Wybrany pracownik nie jest spedytorem.';
END IF;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table zlecenia
-- ----------------------------
DROP TRIGGER IF EXISTS `kierowca_zlecenia_insert`;
delimiter ;;
CREATE TRIGGER `kierowca_zlecenia_insert` BEFORE INSERT ON `zlecenia` FOR EACH ROW BEGIN
IF NEW.ID_kierowca NOT IN (SELECT ID_pracownicy FROM pracownicy_stanowisko WHERE ID_stanowisko = 1) THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Wybrany pracownik nie jest kierowcą.';
END IF;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table zlecenia
-- ----------------------------
DROP TRIGGER IF EXISTS `urlop_insert`;
delimiter ;;
CREATE TRIGGER `urlop_insert` BEFORE INSERT ON `zlecenia` FOR EACH ROW BEGIN
IF NEW.ID_kierowca IN (SELECT ID_pracownicy FROM urlopy WHERE data_rozpoczecia BETWEEN NEW.data_odjazdu AND NEW.data_dostarczenia OR data_zakonczenia BETWEEN NEW.data_odjazdu AND NEW.data_dostarczenia) THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Wybrany kierowca aktualnie jest na urlopie.';
END IF;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table zlecenia
-- ----------------------------
DROP TRIGGER IF EXISTS `ADR_zlecenia_insert`;
delimiter ;;
CREATE TRIGGER `ADR_zlecenia_insert` BEFORE INSERT ON `zlecenia` FOR EACH ROW BEGIN
IF NEW.ID_ladunek IN (SELECT ID_ladunek FROM ladunek WHERE ADR = 'Tak') AND NEW.ID_kierowca IN (SELECT ID_pracownicy FROM pracownicy WHERE uprawnienia NOT LIKE '%ADR%') THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Wybrany kierowca nie ma uprawnień ADR.';
END IF;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table zlecenia
-- ----------------------------
DROP TRIGGER IF EXISTS `data_zlecenia_update`;
delimiter ;;
CREATE TRIGGER `data_zlecenia_update` BEFORE UPDATE ON `zlecenia` FOR EACH ROW BEGIN
IF NEW.data_dostarczenia < NEW.data_odjazdu THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Wprowadzona data jest niepoprawna.';
END IF;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table zlecenia
-- ----------------------------
DROP TRIGGER IF EXISTS `ladunek_zlecenia_update`;
delimiter ;;
CREATE TRIGGER `ladunek_zlecenia_update` BEFORE UPDATE ON `zlecenia` FOR EACH ROW BEGIN
SET NEW.nazwa_ladunku = LOWER(NEW.nazwa_ladunku);
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table zlecenia
-- ----------------------------
DROP TRIGGER IF EXISTS `priorytet_zlecenia_update`;
delimiter ;;
CREATE TRIGGER `priorytet_zlecenia_update` BEFORE UPDATE ON `zlecenia` FOR EACH ROW BEGIN
IF NEW.priorytet IS NULL OR LENGTH(NEW.priorytet) = 0 THEN
IF NEW.ID_klient IN (SELECT ID_klient FROM klienci WHERE stały_klient = 'Tak') THEN
SET NEW.priorytet = 'Wysoki';
ELSE
SET NEW.priorytet = 'Normalny';
END IF;
END IF;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table zlecenia
-- ----------------------------
DROP TRIGGER IF EXISTS `spedytor_zlecenia_update`;
delimiter ;;
CREATE TRIGGER `spedytor_zlecenia_update` BEFORE UPDATE ON `zlecenia` FOR EACH ROW BEGIN
IF NEW.ID_spedytor NOT IN (SELECT ID_pracownicy FROM pracownicy_stanowisko WHERE ID_stanowisko = 3) THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Wybrany pracownik nie jest spedytorem.';
END IF;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table zlecenia
-- ----------------------------
DROP TRIGGER IF EXISTS `kierowca_zlecenia_update`;
delimiter ;;
CREATE TRIGGER `kierowca_zlecenia_update` BEFORE UPDATE ON `zlecenia` FOR EACH ROW BEGIN
IF NEW.ID_kierowca NOT IN (SELECT ID_pracownicy FROM pracownicy_stanowisko WHERE ID_stanowisko = 1) THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Wybrany pracownik nie jest kierowcą.';
END IF;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table zlecenia
-- ----------------------------
DROP TRIGGER IF EXISTS `urlop_update`;
delimiter ;;
CREATE TRIGGER `urlop_update` BEFORE UPDATE ON `zlecenia` FOR EACH ROW BEGIN
IF NEW.ID_kierowca IN (SELECT ID_pracownicy FROM urlopy WHERE data_rozpoczecia BETWEEN NEW.data_odjazdu AND NEW.data_dostarczenia OR data_zakonczenia BETWEEN NEW.data_odjazdu AND NEW.data_dostarczenia) THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Wybrany kierowca aktualnie jest na urlopie.';
END IF;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table zlecenia
-- ----------------------------
DROP TRIGGER IF EXISTS `ADR_zlecenia_update`;
delimiter ;;
CREATE TRIGGER `ADR_zlecenia_update` BEFORE UPDATE ON `zlecenia` FOR EACH ROW BEGIN
IF NEW.ID_ladunek IN (SELECT ID_ladunek FROM ladunek WHERE ADR = 'Tak') AND NEW.ID_kierowca IN (SELECT ID_pracownicy FROM pracownicy WHERE uprawnienia NOT LIKE '%ADR%') THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Wybrany kierowca nie ma uprawnień ADR.';
END IF;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table zlecenia
-- ----------------------------
DROP TRIGGER IF EXISTS `archiwum_update`;
delimiter ;;
CREATE TRIGGER `archiwum_update` AFTER UPDATE ON `zlecenia` FOR EACH ROW BEGIN

INSERT INTO zlecenia_arch (

UID_zlecenia,
ID_klient,
nazwa_ladunku,
ID_miejsce_docelowe,
data_odjazdu,
data_dostarczenia,
ID_kierowca,
ID_ladunek,
ID_spedytor,
priorytet,
data_modyfikacji,
akcja
)

VALUES (

OLD.UID_zlecenia,
OLD.ID_klient,
OLD.nazwa_ladunku,
OLD.ID_miejsce_docelowe,
OLD.data_odjazdu,
OLD.data_dostarczenia,
OLD.ID_kierowca,
OLD.ID_ladunek,
OLD.ID_spedytor,
OLD.priorytet,
OLD.data_modyfikacji,
'update'
);

END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table zlecenia
-- ----------------------------
DROP TRIGGER IF EXISTS `archiwum_delete`;
delimiter ;;
CREATE TRIGGER `archiwum_delete` AFTER DELETE ON `zlecenia` FOR EACH ROW BEGIN

INSERT INTO zlecenia_arch (

UID_zlecenia,
ID_klient,
nazwa_ladunku,
ID_miejsce_docelowe,
data_odjazdu,
data_dostarczenia,
ID_kierowca,
ID_ladunek,
ID_spedytor,
priorytet,
data_modyfikacji,
akcja
)

VALUES (

OLD.UID_zlecenia,
OLD.ID_klient,
OLD.nazwa_ladunku,
OLD.ID_miejsce_docelowe,
OLD.data_odjazdu,
OLD.data_dostarczenia,
OLD.ID_kierowca,
OLD.ID_ladunek,
OLD.ID_spedytor,
OLD.priorytet,
OLD.data_modyfikacji,
'delete'
);

END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table zlecenia_oczekujace
-- ----------------------------
DROP TRIGGER IF EXISTS `UID_zlecenia_insert`;
delimiter ;;
CREATE TRIGGER `UID_zlecenia_insert` BEFORE INSERT ON `zlecenia_oczekujace` FOR EACH ROW BEGIN
IF LENGTH(NEW.UID_zlecenia) != 36 THEN
SET NEW.UID_zlecenia = UUID();
END IF;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table zlecenia_oczekujace
-- ----------------------------
DROP TRIGGER IF EXISTS `UID_zlecenia_update`;
delimiter ;;
CREATE TRIGGER `UID_zlecenia_update` BEFORE UPDATE ON `zlecenia_oczekujace` FOR EACH ROW BEGIN
IF LENGTH(NEW.UID_zlecenia) != 36 THEN
SET NEW.UID_zlecenia = UUID();
END IF;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
