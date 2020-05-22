-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 05, 2020 at 06:52 AM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mydb`
--
CREATE DATABASE IF NOT EXISTS `mydb` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `mydb`;

-- --------------------------------------------------------

--
-- Table structure for table `add_product`
--

CREATE TABLE `add_product` (
  `Cart_Num` int(11) NOT NULL,
  `Product_ID` int(11) NOT NULL,
  `Qty` int(11) NOT NULL,
  `Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `add_product`
--

INSERT INTO `add_product` (`Cart_Num`, `Product_ID`, `Qty`, `Date`) VALUES
(236, 3, 5, '2019-09-12'),
(376, 1, 1, '2019-10-05'),
(435, 2, 1, '2019-05-17'),
(502, 5, 5, '2020-01-03'),
(756, 4, 1, '2019-07-24');

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

CREATE TABLE `brand` (
  `BrandSerialNum` int(11) NOT NULL,
  `BrandName` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `brand`
--

INSERT INTO `brand` (`BrandSerialNum`, `BrandName`) VALUES
(211, 'NARS'),
(212, 'Charlotte Tilbury'),
(213, 'Sephora Collection'),
(214, 'hue noir'),
(215, 'MAKE'),
(453, 'TooFaced');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `SerialNum` int(11) NOT NULL,
  `Type` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`SerialNum`, `Type`) VALUES
(7, 'Hair'),
(111, 'Eye'),
(112, 'Skin'),
(113, 'Lip');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `CustomerID` int(11) NOT NULL,
  `FName` varchar(200) NOT NULL,
  `LName` varchar(200) NOT NULL,
  `Gender` varchar(45) NOT NULL,
  `DOB` date NOT NULL,
  `Email` varchar(200) NOT NULL,
  `Shipping_Address` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`CustomerID`, `FName`, `LName`, `Gender`, `DOB`, `Email`, `Shipping_Address`) VALUES
(1, 'James ', 'Charles', 'Male', '1999-05-23', 'jc1@hotmail.com', '799 Crescent St. Fremont, CA 94538'),
(2, 'Becky', 'Adams', 'Female', '1994-10-07', 'ba7@gmail.com', '91 Manhattan Court Lynwood, Lebanon'),
(3, 'Alissa', 'Queens', 'Female', '1998-07-05', 'aq98@yahoo.com', '98 Devon St. Union City, CA 94587'),
(4, 'Emma ', 'Taylor', 'Female', '1981-12-18', 'emma_t18@hotmail.com', '54 E. Beach St. El Cajon, CA 92020'),
(5, 'Sarah', 'Jackson', 'Female', '1991-01-30', 's_jackson@gmail.com', '801 Cemetery St. El Cajon, CA 92021'),
(12, 'rami', 'hoteit', 'male', '2020-05-13', '123', 'Lebanon');

-- --------------------------------------------------------

--
-- Table structure for table `discount`
--

CREATE TABLE `discount` (
  `Order_Num` int(11) NOT NULL,
  `DiscountNum` int(11) NOT NULL,
  `DiscountName` varchar(200) NOT NULL,
  `DiscountAmount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `discount`
--

INSERT INTO `discount` (`Order_Num`, `DiscountNum`, `DiscountName`, `DiscountAmount`) VALUES
(3, 725, 'Special Event', 50),
(5, 507, 'Special Event', 20);

-- --------------------------------------------------------

--
-- Table structure for table `in_bulk`
--

CREATE TABLE `in_bulk` (
  `Order_Num` int(11) NOT NULL,
  `SpecialPrice` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `in_bulk`
--

INSERT INTO `in_bulk` (`Order_Num`, `SpecialPrice`) VALUES
(3, 100),
(5, 40);

-- --------------------------------------------------------

--
-- Table structure for table `linked`
--

CREATE TABLE `linked` (
  `Order_Num` int(11) NOT NULL,
  `Cart_Num` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `linked`
--

INSERT INTO `linked` (`Order_Num`, `Cart_Num`) VALUES
(5, 236),
(1, 376),
(2, 435),
(3, 502),
(4, 756);

-- --------------------------------------------------------

--
-- Table structure for table `makeup_product`
--

CREATE TABLE `makeup_product` (
  `ProductID` int(11) NOT NULL,
  `Name` varchar(200) NOT NULL,
  `ProductSerialNum` int(11) NOT NULL,
  `Price` int(11) NOT NULL,
  `Category_SerialNum` int(11) NOT NULL,
  `Brand_SerialNum` int(11) NOT NULL,
  `Supplier_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `makeup_product`
--

INSERT INTO `makeup_product` (`ProductID`, `Name`, `ProductSerialNum`, `Price`, `Category_SerialNum`, `Brand_SerialNum`, `Supplier_ID`) VALUES
(1, 'Skin Deep Eye Palette', 11111, 59, 111, 211, 311),
(2, 'Charlotte Tilbury Wonderglow Primer ', 22222, 55, 112, 212, 312),
(3, 'Ultra Shine Lip Gel', 33333, 12, 113, 213, 313),
(4, 'Perfect Shine Hydrating Lip Gloss', 44444, 12, 113, 214, 313),
(5, 'MAKE Bronzing Bricks', 55555, 30, 112, 215, 312),
(8, 'Eye Cream', 1232, 100, 111, 215, 311),
(9, 'Red Lip', 8978, 65, 113, 453, 313);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `OrderNum` int(11) NOT NULL,
  `Date_Ordered` date NOT NULL,
  `ExpectedRecieveDate` date NOT NULL,
  `Customer_ID` int(11) NOT NULL,
  `Payment_Num` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`OrderNum`, `Date_Ordered`, `ExpectedRecieveDate`, `Customer_ID`, `Payment_Num`) VALUES
(1, '2019-10-05', '2019-11-05', 3, 4),
(2, '2019-05-17', '2019-06-17', 2, 1),
(3, '2020-01-03', '2020-01-10', 4, 5),
(4, '2019-07-24', '2019-08-05', 1, 2),
(5, '2019-09-12', '2019-09-26', 5, 3),
(6, '2017-09-11', '2020-05-22', 12, 5);

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `DetailNum` int(11) NOT NULL,
  `Date_Shipped` date NOT NULL,
  `Price` int(11) NOT NULL,
  `MakeupProduct_id` int(11) NOT NULL,
  `Order_Num` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`DetailNum`, `Date_Shipped`, `Price`, `MakeupProduct_id`, `Order_Num`) VALUES
(0, '2017-10-10', 100, 9, 6),
(1, '2019-06-01', 55, 2, 2),
(2, '2019-08-01', 12, 4, 4),
(3, '2019-09-20', 60, 3, 5),
(4, '2019-10-31', 59, 1, 1),
(5, '2020-01-05', 150, 5, 3),
(78, '2017-10-10', 100, 9, 6);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `PaymentNum` int(11) NOT NULL,
  `Status` varchar(45) NOT NULL,
  `AmountPaid` int(11) NOT NULL,
  `CreditCardType` varchar(45) NOT NULL,
  `CreditCardNum` int(11) NOT NULL,
  `Customer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`PaymentNum`, `Status`, `AmountPaid`, `CreditCardType`, `CreditCardNum`, `Customer_id`) VALUES
(1, 'Complete', 55, 'Master Card', 2147483647, 2),
(2, 'Complete', 12, 'Visa', 2147483647, 1),
(3, 'Complete', 40, 'American Express', 2147483647, 5),
(4, 'Complete', 59, 'Visa', 2147483647, 3),
(5, 'Complete', 100, 'Master Card', 2147483647, 4);

-- --------------------------------------------------------

--
-- Table structure for table `phonenumber`
--

CREATE TABLE `phonenumber` (
  `SupplierID` int(11) NOT NULL,
  `Phone_Number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `phonenumber`
--

INSERT INTO `phonenumber` (`SupplierID`, `Phone_Number`) VALUES
(311, 1172775),
(312, 1567125),
(313, 1247136);

-- --------------------------------------------------------

--
-- Table structure for table `shopping cart`
--

CREATE TABLE `shopping cart` (
  `CartNum` int(11) NOT NULL,
  `Customer_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shopping cart`
--

INSERT INTO `shopping cart` (`CartNum`, `Customer_ID`) VALUES
(756, 1),
(435, 2),
(376, 3),
(502, 4),
(236, 5);

-- --------------------------------------------------------

--
-- Table structure for table `special_event_order`
--

CREATE TABLE `special_event_order` (
  `Order_Num` int(11) NOT NULL,
  `Name` varchar(200) NOT NULL,
  `Type` varchar(45) NOT NULL,
  `SpecialInstructions` varchar(200) NOT NULL,
  `SpecialPrice` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `special_event_order`
--

INSERT INTO `special_event_order` (`Order_Num`, `Name`, `Type`, `SpecialInstructions`, `SpecialPrice`) VALUES
(3, 'The Beauty Experience', 'Make up Event', 'Fast delivery and reduced price', 100),
(5, 'Pure London', 'Fashion Show', 'Reduced price', 40);

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `SupplierID` int(11) NOT NULL,
  `CompanyName` varchar(200) NOT NULL,
  `Email` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`SupplierID`, `CompanyName`, `Email`) VALUES
(311, 'Makeup Ltd', 'mkup@hotmail.com'),
(312, 'Skin Care', 'snc123@gmail.com'),
(313, 'What You Need', 'wyn11@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `add_product`
--
ALTER TABLE `add_product`
  ADD PRIMARY KEY (`Cart_Num`,`Product_ID`),
  ADD KEY `Product_id` (`Product_ID`);

--
-- Indexes for table `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`BrandSerialNum`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`SerialNum`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`CustomerID`);

--
-- Indexes for table `discount`
--
ALTER TABLE `discount`
  ADD PRIMARY KEY (`Order_Num`,`DiscountNum`);

--
-- Indexes for table `in_bulk`
--
ALTER TABLE `in_bulk`
  ADD PRIMARY KEY (`Order_Num`);

--
-- Indexes for table `linked`
--
ALTER TABLE `linked`
  ADD PRIMARY KEY (`Order_Num`),
  ADD KEY `linked_ibfk_1` (`Cart_Num`);

--
-- Indexes for table `makeup_product`
--
ALTER TABLE `makeup_product`
  ADD PRIMARY KEY (`ProductID`),
  ADD KEY `Brand_Serial` (`Brand_SerialNum`),
  ADD KEY `Category_Serial` (`Category_SerialNum`),
  ADD KEY `Supplier_id` (`Supplier_ID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`OrderNum`),
  ADD KEY `orders_ibfk_1` (`Customer_ID`),
  ADD KEY `orders_ibfk_2` (`Payment_Num`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`DetailNum`),
  ADD KEY `MakeupProduct_id` (`MakeupProduct_id`),
  ADD KEY `Order_num` (`Order_Num`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`PaymentNum`),
  ADD KEY `Customer_id` (`Customer_id`);

--
-- Indexes for table `phonenumber`
--
ALTER TABLE `phonenumber`
  ADD PRIMARY KEY (`SupplierID`,`Phone_Number`);

--
-- Indexes for table `shopping cart`
--
ALTER TABLE `shopping cart`
  ADD PRIMARY KEY (`CartNum`),
  ADD KEY `shopping cart_ibfk_1` (`Customer_ID`);

--
-- Indexes for table `special_event_order`
--
ALTER TABLE `special_event_order`
  ADD PRIMARY KEY (`Order_Num`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`SupplierID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `add_product`
--
ALTER TABLE `add_product`
  ADD CONSTRAINT `Cart_num` FOREIGN KEY (`Cart_Num`) REFERENCES `shopping cart` (`CartNum`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Product_id` FOREIGN KEY (`Product_ID`) REFERENCES `makeup_product` (`ProductID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `discount`
--
ALTER TABLE `discount`
  ADD CONSTRAINT `discount_ibfk_1` FOREIGN KEY (`Order_Num`) REFERENCES `orders` (`OrderNum`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `in_bulk`
--
ALTER TABLE `in_bulk`
  ADD CONSTRAINT `in_bulk_ibfk_1` FOREIGN KEY (`Order_Num`) REFERENCES `orders` (`OrderNum`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `linked`
--
ALTER TABLE `linked`
  ADD CONSTRAINT `linked_ibfk_1` FOREIGN KEY (`Cart_Num`) REFERENCES `shopping cart` (`CartNum`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `linked_ibfk_2` FOREIGN KEY (`Order_Num`) REFERENCES `orders` (`OrderNum`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `makeup_product`
--
ALTER TABLE `makeup_product`
  ADD CONSTRAINT `Brand_Serial` FOREIGN KEY (`Brand_SerialNum`) REFERENCES `brand` (`BrandSerialNum`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Category_Serial` FOREIGN KEY (`Category_SerialNum`) REFERENCES `category` (`SerialNum`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Supplier_id` FOREIGN KEY (`Supplier_ID`) REFERENCES `supplier` (`SupplierID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`Customer_ID`) REFERENCES `customer` (`CustomerID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`Payment_Num`) REFERENCES `payment` (`PaymentNum`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `MakeupProduct_id` FOREIGN KEY (`MakeupProduct_id`) REFERENCES `makeup_product` (`ProductID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Order_num` FOREIGN KEY (`Order_Num`) REFERENCES `orders` (`OrderNum`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `Customer_id` FOREIGN KEY (`Customer_id`) REFERENCES `customer` (`CustomerID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `phonenumber`
--
ALTER TABLE `phonenumber`
  ADD CONSTRAINT `SupplierID` FOREIGN KEY (`SupplierID`) REFERENCES `supplier` (`SupplierID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shopping cart`
--
ALTER TABLE `shopping cart`
  ADD CONSTRAINT `shopping cart_ibfk_1` FOREIGN KEY (`Customer_ID`) REFERENCES `customer` (`CustomerID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `special_event_order`
--
ALTER TABLE `special_event_order`
  ADD CONSTRAINT `special_event_order_ibfk_1` FOREIGN KEY (`Order_Num`) REFERENCES `orders` (`OrderNum`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
