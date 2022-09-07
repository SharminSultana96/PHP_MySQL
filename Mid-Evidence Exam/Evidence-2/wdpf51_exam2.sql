-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 03, 2022 at 07:00 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wdpf51_exam2`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_students` (IN `st_name` VARCHAR(50), IN `st_address` VARCHAR(100), IN `st_mobile` VARCHAR(20))   INSERT INTO students VALUES(NULL, st_name, st_address, st_mobile)$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `results`
--

CREATE TABLE `results` (
  `r_id` int(11) NOT NULL,
  `module_name` varchar(20) NOT NULL,
  `total_marks` int(5) NOT NULL,
  `rstudent_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `results`
--

INSERT INTO `results` (`r_id`, `module_name`, `total_marks`, `rstudent_id`) VALUES
(1, 'HTML', 60, 1),
(2, 'JavaScript', 70, 1),
(3, 'CSS', 75, 2),
(4, 'JavaScript', 70, 2),
(5, 'Bootstrap', 80, 3),
(6, 'HTML', 76, 3),
(7, 'PHP', 90, 4),
(8, 'MySQL', 85, 4);

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `st_id` int(11) NOT NULL,
  `st_name` varchar(50) NOT NULL,
  `st_address` varchar(100) NOT NULL,
  `st_mobile` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`st_id`, `st_name`, `st_address`, `st_mobile`) VALUES
(1, 'sharmin', 'Basabo', '01976364346'),
(2, 'Aklima', 'Mirpur/11', '01849876857'),
(3, 'Jannat', 'Jatrabari', '09892734735'),
(4, 'Tanjina', 'Dhanmondi/32', '0286475456');

--
-- Triggers `students`
--
DELIMITER $$
CREATE TRIGGER `students_delete` AFTER DELETE ON `students` FOR EACH ROW DELETE FROM results WHERE rstudent_id = OLD.st_id
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `students_results_view`
-- (See below for the actual view)
--
CREATE TABLE `students_results_view` (
`st_id` int(11)
,`st_name` varchar(50)
,`st_mobile` varchar(20)
,`module_name` varchar(20)
,`total_marks` int(5)
);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(20) NOT NULL,
  `password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`) VALUES
(1, 'admin@admin.com', 'abcde12345'),
(2, 'sharmin1111@gmail.co', '1111');

-- --------------------------------------------------------

--
-- Structure for view `students_results_view`
--
DROP TABLE IF EXISTS `students_results_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `students_results_view`  AS SELECT `students`.`st_id` AS `st_id`, `students`.`st_name` AS `st_name`, `students`.`st_mobile` AS `st_mobile`, `results`.`module_name` AS `module_name`, `results`.`total_marks` AS `total_marks` FROM (`students` join `results`) WHERE `students`.`st_id` = `results`.`rstudent_id` ORDER BY `students`.`st_name` ASC  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `results`
--
ALTER TABLE `results`
  ADD PRIMARY KEY (`r_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`st_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `results`
--
ALTER TABLE `results`
  MODIFY `r_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `st_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
