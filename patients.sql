-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 07, 2020 at 12:59 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `patients`
--

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `patientID` int(11) NOT NULL,
  `patientName` varchar(30) NOT NULL,
  `patientAddress` varchar(30) NOT NULL,
  `patientAge` varchar(10) NOT NULL,
  `patientPhone` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`patientID`, `patientName`, `patientAddress`, `patientAge`, `patientPhone`) VALUES
(1, 'GayaniKarunaratne', 'Matara', '30', '0712377767'),
(2, 'Nilakshi Karunaratne', 'Colombo', '29', '0711445576'),
(3, 'Uyagodage Karunaratne', 'Jaffna', '50', '0711445576'),
(6, 'Kevin Dias', 'Jaffna', '29', '0717693876'),
(7, 'Sheril Decker', 'Colombo', '30', '0719876543'),
(9, 'Ishara Karunaratne', 'Nugegoda', '29', '0712345578'),
(10, 'Mangalika Jinadaree', 'Colombo', '50', '0711445576');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`patientID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `patientID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
