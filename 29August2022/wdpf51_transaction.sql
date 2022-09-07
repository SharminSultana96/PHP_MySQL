-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 28, 2022 at 06:44 PM
-- Server version: 8.0.29
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wdpf51_transaction`
--

-- --------------------------------------------------------

--
-- Table structure for table `education`
--

CREATE TABLE `education` (
  `id` tinyint NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `education`
--

INSERT INTO `education` (`id`, `name`) VALUES
(1, 'BSc'),
(2, 'MSc'),
(3, 'PhD');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `id` int NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `job_title` varchar(100) DEFAULT NULL,
  `salary` double DEFAULT NULL,
  `notes` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `first_name`, `last_name`, `job_title`, `salary`, `notes`) VALUES
(1, 'Robin', 'Jackman', 'Software Engineer', 5500, NULL),
(2, 'Taylor', 'Edward', 'Software Architect', 7200, NULL),
(3, 'Vivian', 'Dickens', 'Database Administrator', 6000, NULL),
(4, 'Harry', 'Clifford', 'Database Administrator', 6800, NULL),
(5, 'Eliza', 'Clifford', 'Software Engineer', 4750, NULL),
(6, 'Nancy', 'Newman', 'Software Engineer', 5100, NULL),
(7, 'Melinda', 'Clifford', 'Project Manager', 8500, NULL),
(8, 'Harley', 'Gilbert', 'Software Architect', 8000, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `employee_education`
--

CREATE TABLE `employee_education` (
  `employee_id` int NOT NULL,
  `education_id` tinyint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `employee_education`
--

INSERT INTO `employee_education` (`employee_id`, `education_id`) VALUES
(1, 1),
(2, 1),
(3, 2),
(3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `leave_type`
--

CREATE TABLE `leave_type` (
  `id` tinyint NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `leave_type`
--

INSERT INTO `leave_type` (`id`, `name`) VALUES
(1, 'Casual'),
(2, 'Medical');

-- --------------------------------------------------------

--
-- Table structure for table `meeting_user`
--

CREATE TABLE `meeting_user` (
  `id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `meeting_user`
--

INSERT INTO `meeting_user` (`id`, `user_id`, `username`, `password`) VALUES
(1, NULL, 'm_admin', 'm_admin'),
(2, 3, 'm_taylor', 'm_taylor'),
(3, 4, 'm_vivian', 'm_vivian'),
(4, 6, 'm_melinda', 'm_melinda'),
(5, 7, 'm_harley', 'm_harley');

-- --------------------------------------------------------

--
-- Table structure for table `telephone`
--

CREATE TABLE `telephone` (
  `id` int NOT NULL,
  `employee_id` int DEFAULT NULL,
  `type` varchar(20) NOT NULL,
  `no` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `telephone`
--

INSERT INTO `telephone` (`id`, `employee_id`, `type`, `no`) VALUES
(1, 1, 'mobile', '245-249697'),
(2, 2, 'mobile', '270-235969'),
(3, 2, 'land', '325-888885'),
(4, 3, 'mobile', '270-684972'),
(5, 4, 'mobile', '245-782365'),
(6, 4, 'land', '325-888886'),
(7, 5, 'mobile', '245-537891'),
(8, 6, 'mobile', '270-359457'),
(9, 7, 'mobile', '245-436589'),
(10, 7, 'land', '325-888887'),
(11, 8, 'mobile', '245-279164'),
(12, 8, 'land', '325-888888');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `employee_id` int DEFAULT NULL,
  `user_type` varchar(50) DEFAULT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `employee_id`, `user_type`, `username`, `password`) VALUES
(1, NULL, 'SUPER ADMIN', 'admin', 'admin'),
(2, 1, 'NORMAL', 'robin', 'robin'),
(3, 2, 'ADMIN', 'taylor', 'taylor'),
(4, 3, 'ADMIN', 'vivian', 'vivian'),
(5, 4, 'NORMAL', 'harry', 'harry'),
(6, 7, 'ADMIN', 'melinda', 'melinda'),
(7, 8, 'NORMAL', 'harley', 'harley');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `education`
--
ALTER TABLE `education`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leave_type`
--
ALTER TABLE `leave_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `meeting_user`
--
ALTER TABLE `meeting_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `telephone`
--
ALTER TABLE `telephone`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `education`
--
ALTER TABLE `education`
  MODIFY `id` tinyint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `leave_type`
--
ALTER TABLE `leave_type`
  MODIFY `id` tinyint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `meeting_user`
--
ALTER TABLE `meeting_user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `telephone`
--
ALTER TABLE `telephone`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
