--Xampp control panel
--Conect TO:
--server name: localhost -127.0.0.1
--Authentification:
--kasutaja: root
--paroot: ei ole
CREATE DATABASE VeronikaLOGIT;
USE VeronikaLOGIT;

--tabeli loomine
--AUTO_INCREMENT - ise täidab tabeli 1,2,3,...
CREATE TABLE opilane(
inimeneID int Primary Key AUTO_INCREMENT,
nimi varchar(50) unique,
synniaeg date,
telefon char(12),
pikkus decimal(5,2),
opilaskodu bit
);
SELECT * FROM opilane;

--tabeli kustutamine
DROP table opilane;
SELECT * FROM opilane;

--tabeli kustutamine
DROP table opilane;

--andmete lisamine
--DDL - data definition language
--DML -data manipulation language

INSERT INTO opilane
(nimi, synniaeg, telefon, pikkus, opilaskodu)
VALUES
('Peeter Uus', '2021-12-30', '2568952', 90.5, 0),
('Kaarel Oja', '2000-12-30', '2568952', 90.5, 0),
('Kask Mati', '1983-12-30', '33333', 140.5, 0),
('Peeter Oja', '2021-12-30', '333333', 190.5, 0)
;
SELECT * FROM opilane;
--tabel elukoht
CREATE TABLE elukoht(
elukohtID int PRIMARY KEY AUTO_INCREMENT,
elukoht varchar(50) UNIQUE,
maakond varchar(50)
);
SELECT * FROM elukoht;
--andmete lisamine tabeli elukoht
INSERT INTO elukoht(elukoht, maakond)
VALUES ('Tallinn', 'Harjumaa'),
('Tartu', 'Tartumaa'),
('Pärnu', 'Pärnumaa');
--taabeli muutmine uue veergu lisamine
ALTER TABLE opilane ADD elukohtID int;
SELECT * FROM opilane;
-- foreign key lisamine
ALTER TABLE opilane
ADD Constraint fk_elukoht
FOREIGN KEY (elukohtID)
references elukoht(elukohtID);

Select * from opilane;
Select * from elukoht;

INSERT INTO opilane
(nimi, synniaeg, telefon, pikkus, opilaskodu, elukohtID)
VALUES ('Danila Ivanov', '2021-12-4' , '543678', 170.1, 0, 3);

SELECT opilane.nimi, opilane.synniaeg, elukoht.elukoht from opilane join elukoht
ON opilane.elukohtID=elukoht.elukohtID;
--tabel auto loomine
CREATE TABLE auto(
autoID int PRIMARY KEY AUTO_INCREMENT,
autoNr varchar(30) UNIQUE,
mudell varchar(30),
mark varchar(30),
vaasta int
);

select * from auto;
--andmete lisamine tabeli auto
INSERT INTO auto
(autoNr, mudell, mark, vaasta)
VALUES ('296YKM', 'Corolla', 'Toyota', 2025);
--taabeli muutmine uue veergu lisamine
ALTER TABLE inimene ADD autoID int;
-- foreign key lisamine
ALTER TABLE inimene
ADD Constraint fk_auto
FOREIGN KEY (autoID)
references auto(autoID);

select * from inimene;
select * from auto;

INSERT INTO opilane
(nimi, synniaeg, telefon, pikkus, opilaskodu, elukohtID, autoID)
VALUES ('Veronika Hahan', '2021-12-4' , '543678', 170.2, 0, 2, 1);

SELECT * from opilane join auto
ON opilane.autoID=auto.autoID;

INSERT INTO elukoht(elukoht, maakond)
VALUES ('Narva', 'Ida-Virumaa'),
       ('Viljandi', 'Viljandimaa'),
       ('Rakvere', 'Lääne-Virumaa');

INSERT INTO auto
(autoNr, mudell, mark, vaasta)
VALUES ('296YKM', 'Corolla', 'Toyota', 2025);

INSERT INTO auto
(autoNr, mudell, mark, vaasta)
VALUES ('123ABC', 'Civic', 'Honda', 2023);

INSERT INTO auto
(autoNr, mudell, mark, vaasta)
VALUES ('456DEF', 'Model S', 'Tesla', 2024);

INSERT INTO auto
(autoNr, mudell, mark, vaasta)
VALUES ('789GHI', 'F-150', ' 	Ford', 2022);

INSERT INTO auto
(autoNr, mudell, mark, vaasta)
VALUES ('321JKL', ' 	A4', 'Audi', 2021);



CREATE TABLE tyyp
( tyypID int PRIMARY KEY AUTO_INCREMENT,
tyyp char(30) UNIQUE,
kirjeldus char(40)
);

INSERT INTO tyyp
(tyyp, kirjeldus)
VALUES ('kass', 'must'),
('koer', 'valge'),
('kilpkonn', 'aeglane'),
('sisalik', 'kiire'),
('kapübara', 'lahke'),
('põder', 'kuri');

CREATE TABLE loom
( loomID int PRIMARY KEY AUTO_INCREMENT,
nimi char(30),
kirjeldus char(40),
kaal decimal(5,2)
);

ALTER TABLE loom ADD tyypID int;

ALTER TABLE loom
ADD Constraint fk_tyyp
FOREIGN KEY (tyypID)
references tyyp(tyypID);

