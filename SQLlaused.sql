CREATE DATABASE VeronikaLOGIT;
USE VeronikaLOGI;

CREATE TABLE opilane(
opilaneID int Primary Key identity(1,1),
eesnimi varchar(25),
perenimi varchar(30) Unique,
synniaeg date,
aadress TEXT,
opilaskodu bit
);
SELECT * FROM opilane;

DROP table opilane;

INSERT INTO opilane(eesnimi, perenimi, synniaeg, aadress, opilaskodu)
VALUES ('Andrei', 'Ivanov', '2005-12-5', 'Tallinn', 1),
('Mati', 'Kask', '2003-12-5', 'Tallinn', 0),
('Peeter', 'Uus', '2000-10-5', 'Tallinn', 0);

CREATE TABLE elukoht(
elukohtID int PRIMARY KEY identity(1,1),
elukoht varchar(50) UNIQUE,
maakond varchar(50)
);
SELECT * FROM elukoht;
--andmete lisamine tabeli elukoht
INSERT INTO elukoht(elukoht, maakond)
VALUES ('Tallinn', 'Harjumaa'),
('Tartu', 'Tartumaa'),
('Pärnu', 'Pärnumaa');

--tabeli muutmine uue veergu lisamine
ALTER TABLE opilane ADD elukohtID int;
SELECT * FROM opilane;
--foreign key lisamine
ALTER TABLE opilane
ADD CONSTRAINT fk_elukoht
FOREIGN KEY (elukohtID)
references elukoht(elukohtID);

Select * from VeronikaLOGIT;
Select * from elukoht;
INSERT INTO VeronikaLOGIT
(nimi, synniaeg, telefon, pikkus, opilaskodu, elukohtID)
VALUES ('Peeter Vana', '2021-12-30', '2568952', 90.5, 0,1);

select * from VeronikaLOGIT join elukoht
ON opilane.elukohtID=elukoht.elukohtID;
  

SELECT v.eesnimi, v.


CREATE TABLE auto(
autoID int PRIMARY KEY identity(1,1),
autoNr varchar(30) UNIQUE,
mudell varchar(30),
mark varchar(30),
vaasta int
);
select * from auto;

INSERT INTO auto
(autoNr, mudell, mark, vaasta)
VALUES ('296YKM', 'Corolla', 'Toyota', 2025);

ALTER TABLE opilane ADD autoID int;

ALTER TABLE opilane
ADD Constraint fk_auto
FOREIGN KEY (autoID)
references auto(autoID);

select * from opilane;
select * from auto;

INSERT INTO opilane
(eesnimi, synniaeg, opilaskodu, elukohtID, autoID)
VALUES ('Veronika Hahan', '2021-12-4' , '543678', 170.2, 0, 2, 1);

SELECT * from opilane join auto
ON opilane.autoID=auto.autoID;  
