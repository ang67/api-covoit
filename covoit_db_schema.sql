-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 01, 2022 at 11:05 PM
-- Server version: 8.0.21
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `covoit`
--

-- --------------------------------------------------------

--
-- Table structure for table `alerts`
--

DROP TABLE IF EXISTS `alerts`;
CREATE TABLE IF NOT EXISTS `alerts` (
  `AlertID` int NOT NULL AUTO_INCREMENT,
  `UserID` int NOT NULL,
  `DateAlert` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Departure` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `DepartureAddress` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `DepartureTime` datetime NOT NULL,
  `Destination` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `DestinationAddress` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `RequestedPlace` int DEFAULT NULL,
  PRIMARY KEY (`AlertID`),
  KEY `UserID` (`UserID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `alerts`
--

INSERT INTO `alerts` (`AlertID`, `UserID`, `DateAlert`, `Departure`, `DepartureAddress`, `DepartureTime`, `Destination`, `DestinationAddress`, `RequestedPlace`) VALUES
(1, 3, '2022-02-01 23:59:09', 'Abidjan', 'Yopougon Palais', '2022-03-01 10:00:00', 'Bouaké', 'Hotel éléphant', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `OrderID` int NOT NULL AUTO_INCREMENT,
  `UserID` int NOT NULL,
  `TripID` int NOT NULL,
  `DateOrder` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `RequestedPlace` int NOT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `UserID` (`UserID`),
  KEY `TripID` (`TripID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`OrderID`, `UserID`, `TripID`, `DateOrder`, `RequestedPlace`) VALUES
(1, 2, 1, '2022-02-01 23:53:07', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

DROP TABLE IF EXISTS `ratings`;
CREATE TABLE IF NOT EXISTS `ratings` (
  `RatingID` int NOT NULL AUTO_INCREMENT,
  `RatedID` int DEFAULT NULL,
  `RaterID` int DEFAULT NULL,
  `Comment` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `RatingScore` decimal(2,1) DEFAULT NULL,
  `DateRated` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`RatingID`),
  KEY `RatedID` (`RatedID`),
  KEY `RaterID` (`RaterID`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ratings`
--

INSERT INTO `ratings` (`RatingID`, `RatedID`, `RaterID`, `Comment`, `RatingScore`, `DateRated`) VALUES
(1, 1, 2, 'Good driver', '4.5', '2022-02-01 23:30:46'),
(2, 1, 3, 'Good driver, but he drives too fast', '4.0', '2022-02-01 23:40:14'),
(3, 1, 4, 'Very Good driver', '5.0', '2022-02-01 23:40:14');

-- --------------------------------------------------------

--
-- Table structure for table `trips`
--

DROP TABLE IF EXISTS `trips`;
CREATE TABLE IF NOT EXISTS `trips` (
  `TripID` int NOT NULL AUTO_INCREMENT,
  `UserID` int DEFAULT NULL,
  `Departure` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `DepartureAddress` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `DepartureLatitude` decimal(15,10) NOT NULL,
  `DepartureLongitude` decimal(15,10) NOT NULL,
  `Destination` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `DestinationAddress` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `DestinationLatitude` decimal(15,10) NOT NULL,
  `DestinationLongitude` decimal(15,10) NOT NULL,
  `DepartureTime` datetime DEFAULT NULL,
  `ArrivalTime` datetime DEFAULT NULL,
  `Description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `Price` decimal(19,4) DEFAULT NULL,
  `PassagersNumber` int NOT NULL,
  `Max2Back` tinyint(1) DEFAULT '1',
  `AcceptSmokers` tinyint(1) DEFAULT '0',
  `AcceptAnimals` tinyint(1) DEFAULT '0',
  `AirConditioner` tinyint(1) DEFAULT '0',
  `AutomaticAcceptation` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`TripID`),
  KEY `UserID` (`UserID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `trips`
--

INSERT INTO `trips` (`TripID`, `UserID`, `Departure`, `DepartureAddress`, `DepartureLatitude`, `DepartureLongitude`, `Destination`, `DestinationAddress`, `DestinationLatitude`, `DestinationLongitude`, `DepartureTime`, `ArrivalTime`, `Description`, `Price`, `PassagersNumber`, `Max2Back`, `AcceptSmokers`, `AcceptAnimals`, `AirConditioner`, `AutomaticAcceptation`) VALUES
(1, 1, 'Abidjan', 'Youpogon figayo Abidjan', '5.3503060000', '-4.0730630000', 'Bouaké', 'Hotel éléphant', '7.6627140000', '-5.0211440000', '2022-03-01 09:30:00', '2022-03-01 12:00:00', 'Voyagez paisiblement avec moi jusqu\'à Bouaké', '2000.0000', 0, 1, 0, 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `UserID` int NOT NULL AUTO_INCREMENT,
  `Firstname` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Lastname` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Mail` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `DateOfBirth` date DEFAULT NULL,
  `Bio` varchar(800) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `CarModel` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `CarDescription` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `PhotoRef` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `DocsRef` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `IDChecked` tinyint(1) DEFAULT NULL,
  `Password` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`UserID`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UserID`, `Firstname`, `Lastname`, `Mail`, `DateOfBirth`, `Bio`, `CarModel`, `CarDescription`, `PhotoRef`, `DocsRef`, `IDChecked`, `Password`) VALUES
(1, 'Bini', 'Angui', 'Bini@gmail.com', '1994-01-11', 'bio Bini Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'Peugeot 405', 'Une version coupé rallye-raid prototype nommée 405 Turbo 16 et dérivée de la berline a remporté deux fois le rallye Paris-Dakar en 1989 et 1990. Elle avait comme base la mécanique de la 205 Turbo 16.', NULL, NULL, NULL, 'azerty'),
(2, 'Eli', 'Muler', 'eli@gmail.com', '1997-02-02', 'Bio Eli Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL, NULL, NULL, NULL, NULL, 'azerty'),
(3, 'Ben', 'Agar', 'ben@gmail.com', '1998-03-03', 'Bio Ben Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL, NULL, NULL, NULL, NULL, 'azerty'),
(4, 'Jean', 'Greot', 'jean@gmail.com', '2000-04-04', '', NULL, NULL, NULL, NULL, NULL, 'azerty');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
