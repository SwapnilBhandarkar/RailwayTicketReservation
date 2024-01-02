-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 07, 2023 at 04:02 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `swap1`
--

-- --------------------------------------------------------

--
-- Table structure for table `trains`
--

CREATE TABLE `trains` (
  `PNR` int(11) NOT NULL,
  `Name of Train` varchar(20) NOT NULL,
  `Starting_point` varchar(20) NOT NULL,
  `Destination` varchar(20) NOT NULL,
  `Ticket_1` int(11) NOT NULL,
  `Ticket_2` int(11) NOT NULL,
  `Ticket_3` int(11) NOT NULL,
  `Ticket_l` int(11) NOT NULL,
  `price_1` int(11) NOT NULL,
  `price_2` int(11) NOT NULL,
  `price_3` int(11) NOT NULL,
  `price_l` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `trains`
--

INSERT INTO `trains` (`PNR`, `Name of Train`, `Starting_point`, `Destination`, `Ticket_1`, `Ticket_2`, `Ticket_3`, `Ticket_l`, `price_1`, `price_2`, `price_3`, `price_l`) VALUES
(12833, 'Howrah SF Express', 'AHM', 'KOL', 60, 90, 120, 150, 3000, 2800, 2400, 2000),
(12932, 'Double Decker Expres', 'AHM', 'BOM', 40, 70, 130, 110, 1200, 990, 780, 650),
(12937, 'Garba SF Express', 'AHM', 'KOL', 50, 70, 90, 110, 2800, 2400, 2000, 1890),
(12957, ' Rajdhani Express', 'AHM', 'DEL', 30, 40, 50, 95, 2800, 2500, 2000, 1850),
(19016, 'Saurastra', 'AHM', 'BOM', 10, 22, 42, 94, 3000, 2500, 1800, 800),
(19031, 'Yoga Express', 'AHM', 'DEL', 50, 70, 90, 110, 3000, 2700, 2400, 2100),
(19578, 'Tirunelveli Express', 'AHM', 'BOM', 60, 100, 150, 120, 1600, 1300, 1000, 700),
(20902, 'Vande Bharat Express', 'AHM', 'BOM', 30, 60, 90, 120, 2500, 2200, 1900, 1600),
(57006, 'Satapdi', 'AHM', 'DEL', 8, 108, 269, 384, 1200, 850, 600, 250),
(82902, ' IRCTC Tejas Express', 'AHM', 'BOM', 80, 97, 50, 90, 2600, 2000, 1500, 1250);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `trains`
--
ALTER TABLE `trains`
  ADD PRIMARY KEY (`PNR`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
