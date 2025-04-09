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
INSERT INTO elukoht(elukoht, maakond)
VALUES ('Tallinn', 'Harjumaa'),
('Tartu', 'Tartumaa'),
('Pärnu', 'Pärnumaa');

ALTER TABLE opilane ADD elukohtID int;
SELECT * FROM opilane;
ALTER TABLE opilane
ADD CONSTRAINT fk_elukoht
FOREIGN KEY (elukohtID)
references elukoht(elukohtID);

Select * from opilane;
Select * from elukoht;
INSERT INTO opilane
(nimi, synniaeg, telefon, pikkus, opilaskodu, elukohtID)
VALUES ('Peeter Vana', '2021-12-30', '2568952', 90.5, 0,1);

select * from opilane join elukoht
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

INSERT INTO auto
(autoNr, mudell, mark, vaasta)
VALUES ('512ABC', 'Civic', 'Honda', 2023);

INSERT INTO auto
(autoNr, mudell, mark, vaasta)
VALUES ('834XYZ', 'Model 3', 'Tesla', 2024);

INSERT INTO auto
(autoNr, mudell, mark, vaasta)
VALUES ('178MKL', 'Octavia', 'Škoda', 2022);

INSERT INTO auto
(autoNr, mudell, mark, vaasta)
VALUES ('909DFG', 'Mustang', 'Ford', 2021);

ALTER TABLE opilane
ADD Constraint fk_auto
FOREIGN KEY (autoID)
references auto(autoID);

select * from opilane;
select * from auto;

INSERT INTO opilane
(eesnimi, synniaeg, opilaskodu, pikkus, elukohtID, autoID)
VALUES ('Veronika Hahan', '2021-12-4' , '543678', 170.2, 0, 2, 1);

SELECT * from opilane join auto
ON opilane.autoID=auto.autoID;  



