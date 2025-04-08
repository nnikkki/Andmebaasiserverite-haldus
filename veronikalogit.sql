-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Loomise aeg: Aprill 08, 2025 kell 01:40 PL
-- Serveri versioon: 10.4.32-MariaDB
-- PHP versioon: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Andmebaas: `veronikalogit`
--

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `auto`
--

CREATE TABLE `auto` (
  `autoID` int(11) NOT NULL,
  `autoNr` varchar(30) DEFAULT NULL,
  `mudell` varchar(30) DEFAULT NULL,
  `mark` varchar(30) DEFAULT NULL,
  `vaasta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `auto`
--

INSERT INTO `auto` (`autoID`, `autoNr`, `mudell`, `mark`, `vaasta`) VALUES
(1, '296YKM', 'Corolla', 'Toyota', 2025),
(2, '123ABC', 'Civic', 'Honda', 2023),
(3, '456DEF', 'Model S', 'Tesla', 2024),
(4, '789GHI', 'F-150', 'Ford', 2022),
(5, '321JKL', 'A4', 'Audi', 2021);

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `elukoht`
--

CREATE TABLE `elukoht` (
  `elukohtID` int(11) NOT NULL,
  `elukoht` varchar(50) DEFAULT NULL,
  `maakond` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `elukoht`
--

INSERT INTO `elukoht` (`elukohtID`, `elukoht`, `maakond`) VALUES
(1, 'Tallinn', 'Harjumaa'),
(2, 'Tartu', 'Tartumaa'),
(3, 'Pärnu', 'Pärnumaa');

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `loom`
--

CREATE TABLE `loom` (
  `loomID` int(11) NOT NULL,
  `nimi` char(30) DEFAULT NULL,
  `kirjeldus` char(40) DEFAULT NULL,
  `kaal` decimal(5,2) DEFAULT NULL,
  `tyypID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `opilane`
--

CREATE TABLE `opilane` (
  `opilaneID` int(11) NOT NULL,
  `eesnimi` varchar(25) DEFAULT NULL,
  `perenimi` varchar(30) DEFAULT NULL,
  `synniaeg` date DEFAULT NULL,
  `aadress` text DEFAULT NULL,
  `opilaskodu` bit(1) DEFAULT NULL,
  `elukohtID` int(11) DEFAULT NULL,
  `autoID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `opilane`
--

INSERT INTO `opilane` (`opilaneID`, `eesnimi`, `perenimi`, `synniaeg`, `aadress`, `opilaskodu`, `elukohtID`, `autoID`) VALUES
(1, 'Andrei', 'Ivanov', '2005-12-05', 'Tallinn', b'1', NULL, NULL),
(2, 'Mati', 'Kask', '2003-12-05', 'Tallinn', b'0', NULL, NULL),
(3, 'Peeter', 'Uus', '2000-10-05', 'Tallinn', b'0', NULL, NULL);

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `tyyp`
--

CREATE TABLE `tyyp` (
  `tyypID` int(11) NOT NULL,
  `tyyp` char(30) DEFAULT NULL,
  `kirjeldus` char(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `tyyp`
--

INSERT INTO `tyyp` (`tyypID`, `tyyp`, `kirjeldus`) VALUES
(1, 'tiiger', 'röövlisarnane'),
(2, 'jõehobu', 'rahulik'),
(3, 'leopard', 'kiire'),
(4, 'jänes', 'arg'),
(5, 'karu', 'tugev');

--
-- Indeksid tõmmistatud tabelitele
--

--
-- Indeksid tabelile `auto`
--
ALTER TABLE `auto`
  ADD PRIMARY KEY (`autoID`),
  ADD UNIQUE KEY `autoNr` (`autoNr`);

--
-- Indeksid tabelile `elukoht`
--
ALTER TABLE `elukoht`
  ADD PRIMARY KEY (`elukohtID`),
  ADD UNIQUE KEY `elukoht` (`elukoht`);

--
-- Indeksid tabelile `loom`
--
ALTER TABLE `loom`
  ADD PRIMARY KEY (`loomID`),
  ADD KEY `fk_tyyp` (`tyypID`);

--
-- Indeksid tabelile `opilane`
--
ALTER TABLE `opilane`
  ADD PRIMARY KEY (`opilaneID`),
  ADD UNIQUE KEY `perenimi` (`perenimi`),
  ADD KEY `fk_elukoht` (`elukohtID`),
  ADD KEY `fk_auto` (`autoID`);

--
-- Indeksid tabelile `tyyp`
--
ALTER TABLE `tyyp`
  ADD PRIMARY KEY (`tyypID`),
  ADD UNIQUE KEY `tyyp` (`tyyp`);

--
-- AUTO_INCREMENT tõmmistatud tabelitele
--

--
-- AUTO_INCREMENT tabelile `auto`
--
ALTER TABLE `auto`
  MODIFY `autoID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT tabelile `elukoht`
--
ALTER TABLE `elukoht`
  MODIFY `elukohtID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT tabelile `loom`
--
ALTER TABLE `loom`
  MODIFY `loomID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT tabelile `opilane`
--
ALTER TABLE `opilane`
  MODIFY `opilaneID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT tabelile `tyyp`
--
ALTER TABLE `tyyp`
  MODIFY `tyypID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Tõmmistatud tabelite piirangud
--

--
-- Piirangud tabelile `loom`
--
ALTER TABLE `loom`
  ADD CONSTRAINT `fk_tyyp` FOREIGN KEY (`tyypID`) REFERENCES `tyyp` (`tyypID`);

--
-- Piirangud tabelile `opilane`
--
ALTER TABLE `opilane`
  ADD CONSTRAINT `fk_auto` FOREIGN KEY (`autoID`) REFERENCES `auto` (`autoID`),
  ADD CONSTRAINT `fk_elukoht` FOREIGN KEY (`elukohtID`) REFERENCES `elukoht` (`elukohtID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
