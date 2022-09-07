-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 03, 2022 at 12:07 AM
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
-- Database: `company`
--

-- --------------------------------------------------------

--
-- Table structure for table `manufacturer`
--

CREATE TABLE `manufacturer` (
  `id` int(5) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `contact_no` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `manufacturer`
--

INSERT INTO `manufacturer` (`id`, `name`, `address`, `contact_no`) VALUES
(1, 'LG', 'Mirpur/1,Dhaka', '01865323177'),
(2, 'Walton', 'Uttora/11,Dhaka', '01986532347');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(5) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `price` int(5) DEFAULT NULL,
  `manufacturer_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `price`, `manufacturer_id`) VALUES
(1, 'LG 32 inch TV', 32000, 1),
(2, 'LG Washing Machine', 30000, 1),
(3, 'LG Freeze', 40000, 1),
(4, 'Walton AC', 35000, 2),
(5, 'Walton Mobile', 20000, 2),
(6, 'Walton Mixer Grainder', 8000, 2);

-- --------------------------------------------------------

--
-- Stand-in structure for view `product_list_view`
-- (See below for the actual view)
--
CREATE TABLE `product_list_view` (
`id` int(5)
,`product_name` varchar(50)
,`price` int(5)
,`manufacturer_id` varchar(50)
);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `username` varchar(20) NOT NULL,
  `password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`username`, `password`) VALUES
('Sharmin', 'sharmin123'),
('Sultana', 'sultana9888');

-- --------------------------------------------------------

--
-- Structure for view `product_list_view`
--
DROP TABLE IF EXISTS `product_list_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `product_list_view`  AS SELECT `p`.`id` AS `id`, `p`.`name` AS `product_name`, `p`.`price` AS `price`, `m`.`name` AS `manufacturer_id` FROM (`manufacturer` `m` join `product` `p`) WHERE `m`.`id` = `p`.`manufacturer_id` AND `p`.`price` > 50005000  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `manufacturer`
--
ALTER TABLE `manufacturer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
