-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 11, 2016 at 09:12 AM
-- Server version: 10.1.10-MariaDB
-- PHP Version: 7.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `inventory_tracking`
--

-- --------------------------------------------------------

--
-- Table structure for table `deliveries`
--

CREATE TABLE `deliveries` (
  `deliveryID` int(11) NOT NULL,
  `supplierID` int(11) DEFAULT NULL,
  `type` varchar(45) NOT NULL,
  `status` varchar(45) NOT NULL,
  `requestID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `deliveries`
--

INSERT INTO `deliveries` (`deliveryID`, `supplierID`, `type`, `status`, `requestID`) VALUES
(1, 2, 'Incoming', 'Pending', 9),
(2, NULL, 'Outgoing', 'Finished', 8),
(3, NULL, 'Outgoing', 'Cancelled', 10),
(4, NULL, 'Outgoing', 'In Transit', 7);

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `itemID` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `description` varchar(256) NOT NULL,
  `unit` varchar(45) NOT NULL,
  `isDeleted` char(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`itemID`, `name`, `description`, `unit`, `isDeleted`) VALUES
(1, 'Hammer', 'sledgehammer', 'pc', '0'),
(2, 'Nails', 'Nails (in kg)', 'kg', '0'),
(3, 'Board', '100'''' x 100''''', 'pc', '0'),
(4, 'Cement', '1kg sack', 'kg', '0'),
(5, 'Red Paint', '100L Bucket', 'bucket', '0'),
(6, 'Jolliwings', 'asdf', 'pc', '1'),
(7, 'a', 'asdf', 'ssss', '1'),
(8, 'mcdo', 'asdf', 'pc', '0');

-- --------------------------------------------------------

--
-- Table structure for table `item_of_request`
--

CREATE TABLE `item_of_request` (
  `itemID` int(11) NOT NULL,
  `requestID` int(11) NOT NULL,
  `count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `item_of_request`
--

INSERT INTO `item_of_request` (`itemID`, `requestID`, `count`) VALUES
(1, 6, 5),
(2, 7, 10),
(3, 1, 6),
(3, 9, 7),
(4, 7, 5),
(5, 8, 3),
(5, 10, 3),
(6, 7, 2);

-- --------------------------------------------------------

--
-- Table structure for table `place_of_item`
--

CREATE TABLE `place_of_item` (
  `itemID` int(11) NOT NULL,
  `warehouseID` int(11) NOT NULL,
  `count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `place_of_item`
--

INSERT INTO `place_of_item` (`itemID`, `warehouseID`, `count`) VALUES
(1, 1, 30),
(1, 2, 100),
(2, 3, 10),
(3, 3, 200),
(4, 4, 5),
(5, 5, 15),
(6, 4, 10);

-- --------------------------------------------------------

--
-- Table structure for table `requests`
--

CREATE TABLE `requests` (
  `requestID` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `sourceWarehouseID` int(11) NOT NULL,
  `destWarehouseID` int(11) NOT NULL,
  `startDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `endDate` timestamp NULL DEFAULT NULL,
  `status` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `requests`
--

INSERT INTO `requests` (`requestID`, `name`, `sourceWarehouseID`, `destWarehouseID`, `startDate`, `endDate`, `status`) VALUES
(6, 'JolliTransfer My Hammer!', 3, 2, '2016-06-18 06:00:00', NULL, 'Pending'),
(7, 'JolliTransfer My Nails!', 1, 4, '2016-06-21 09:00:00', NULL, 'In Transit'),
(8, 'JolliTransfer My Paint!', 3, 4, '2016-06-18 07:00:00', '2016-06-18 07:00:00', 'Finished'),
(9, 'JolliTransfer My Board!', 4, 5, '2016-06-23 07:00:00', NULL, 'In Transit - Incomplete'),
(10, 'JolliTransfer My Paint Part 2!', 3, 4, '2016-06-22 07:00:00', NULL, 'Cancelled');

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `supplierID` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `location` varchar(256) NOT NULL,
  `contactNumber` varchar(256) NOT NULL,
  `emailAddress` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`supplierID`, `name`, `location`, `contactNumber`, `emailAddress`) VALUES
(1, 'Cement Producers Inc.', 'Binan, Laguna', '09123456789', 'supplier@cemprod.com.ph'),
(2, 'Wood Choppers Inc.', 'Binan, Laguna', '09321456789', 'supplier@woodchop.com.ph'),
(3, 'JolliSupplier', 'weeland', '123456789', 'JolliSupplier@Jolliweeee.com'),
(4, 'a', 'b', 'c', 'd'),
(5, 'w', 'p', 'o', 'i'),
(6, 'Republic Cement', 'Republic of the Philippines', '8-7000', 'sales@republic.ph');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `supplierID` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `location` varchar(256) NOT NULL,
  `contactNumber` varchar(256) NOT NULL,
  `emailAddress` varchar(256) NOT NULL,
  `contactPerson` varchar(45) NOT NULL DEFAULT 'Juan Dela Cruz',
  `isDeleted` char(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`supplierID`, `name`, `location`, `contactNumber`, `emailAddress`, `contactPerson`, `isDeleted`) VALUES
(1, 'Cement Producers Inc.', 'Binan, Laguna', '09123456789', 'supplier@cemprod.com.ph', 'Juan Dela Cruz', '0'),
(2, 'Wood Choppers Inc.', 'Binan, Laguna', '09321456789', 'supplier@woodchop.com.ph', 'Juan Dela Cruz', '0'),
(3, 'JolliSupplier', 'weeland', '123456789', 'JolliSupplier@Jolliweeee.com', 'Juan Dela Cruz', '0'),
(4, 'a', 'b', 'c', 'd', 'Juan Dela Cruz', '0'),
(5, 'w', 'p', 'o', 'i', 'Juan Dela Cruz', '0');

-- --------------------------------------------------------

--
-- Table structure for table `supplier_of_item`
--

CREATE TABLE `supplier_of_item` (
  `itemID` int(11) NOT NULL,
  `supplierID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `supplier_of_item`
--

INSERT INTO `supplier_of_item` (`itemID`, `supplierID`) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 3),
(2, 4),
(3, 2),
(3, 4),
(4, 1),
(4, 2),
(4, 3),
(5, 1),
(5, 2),
(5, 3),
(5, 4);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `type`) VALUES
(1, 'admin', 'admin', 0),
(2, 'invmanager', 'invmanager', 1),
(3, 'eofficer', 'eofficer', 2);

-- --------------------------------------------------------

--
-- Table structure for table `warehouse`
--

CREATE TABLE `warehouse` (
  `warehouseID` int(11) NOT NULL,
  `location` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `warehouse`
--

INSERT INTO `warehouse` (`warehouseID`, `location`, `name`) VALUES
(1, 'Laguna', 'Joguna House'),
(2, 'Cavite', 'Jovite House'),
(3, 'Batangas', 'Jotangas House'),
(4, 'Manila', 'Jonila House'),
(5, 'weeland', 'Jolliweeeee'),
(6, 'eeeeee', 'ssss'),
(7, 'New Land', 'The New Warehouse');

-- --------------------------------------------------------

--
-- Table structure for table `warehouses`
--

CREATE TABLE `warehouses` (
  `warehouseID` int(11) NOT NULL,
  `location` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `warehouses`
--

INSERT INTO `warehouses` (`warehouseID`, `location`, `name`) VALUES
(1, 'Laguna', 'Joguna House'),
(2, 'Cavite', 'Jovite House'),
(3, 'Batangas', 'Jotangas House'),
(4, 'Manila', 'Jonila House'),
(5, 'weeland', 'Jolliweeeee'),
(6, 'eeeeee', 'ssss'),
(7, 'aaaaaaaaa', 'sssssssssss');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `deliveries`
--
ALTER TABLE `deliveries`
  ADD PRIMARY KEY (`deliveryID`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`itemID`);

--
-- Indexes for table `item_of_request`
--
ALTER TABLE `item_of_request`
  ADD PRIMARY KEY (`itemID`,`requestID`);

--
-- Indexes for table `place_of_item`
--
ALTER TABLE `place_of_item`
  ADD PRIMARY KEY (`itemID`,`warehouseID`);

--
-- Indexes for table `requests`
--
ALTER TABLE `requests`
  ADD PRIMARY KEY (`requestID`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`supplierID`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`supplierID`);

--
-- Indexes for table `supplier_of_item`
--
ALTER TABLE `supplier_of_item`
  ADD PRIMARY KEY (`itemID`,`supplierID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `warehouse`
--
ALTER TABLE `warehouse`
  ADD PRIMARY KEY (`warehouseID`);

--
-- Indexes for table `warehouses`
--
ALTER TABLE `warehouses`
  ADD PRIMARY KEY (`warehouseID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `deliveries`
--
ALTER TABLE `deliveries`
  MODIFY `deliveryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `itemID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `requests`
--
ALTER TABLE `requests`
  MODIFY `requestID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `supplierID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `supplierID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `warehouse`
--
ALTER TABLE `warehouse`
  MODIFY `warehouseID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `warehouses`
--
ALTER TABLE `warehouses`
  MODIFY `warehouseID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
