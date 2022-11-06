-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 06, 2022 at 04:38 PM
-- Server version: 8.0.17
-- PHP Version: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` int(11) NOT NULL,
  `product_data` json NOT NULL,
  `per_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `order_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `product_data`, `per_email`, `order_time`) VALUES
(15, '[{\"p_id\": \"KCK1000\", \"p_lang\": \"Thai\", \"p_name\": \"Keychron K10\", \"p_color\": \"DarkGray\", \"p_image\": \"https://cdn.shopify.com/s/files/1/0328/6034/0364/products/1200x1200_K10-1-cover_360x.jpg?v=1638690632\", \"p_price\": 4390, \"p_switch\": \"Red\", \"p_quatity\": 1}]', 'yannabhat@gmail.com', '2022-11-06 23:33:53'),
(16, '[{\"p_id\": \"KCK1000\", \"p_lang\": \"Thai\", \"p_name\": \"Keychron K10\", \"p_color\": \"DarkGray\", \"p_image\": \"https://cdn.shopify.com/s/files/1/0328/6034/0364/products/1200x1200_K10-1-cover_360x.jpg?v=1638690632\", \"p_price\": 4390, \"p_switch\": \"Red\", \"p_quatity\": 1}]', 'yannabhat@gmail.com', '2022-11-06 23:37:07');

-- --------------------------------------------------------

--
-- Table structure for table `order_product`
--

CREATE TABLE `order_product` (
  `id` int(11) NOT NULL,
  `fname` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `lname` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `address` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `order_product`
--

INSERT INTO `order_product` (`id`, `fname`, `lname`, `date`, `address`, `phone`) VALUES
(3, 'yannabhat', 'pliensak', '2022-09-14 03:16:28', 'a', '0657166468'),
(4, 'yannabhat', 'pliensak', '2022-09-30 18:54:45', 'a', '+10800570775');

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE `person` (
  `id` int(11) NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `person`
--

INSERT INTO `person` (`id`, `email`, `password`, `fname`, `lname`, `address`) VALUES
(1, 'yannabhat@gmail.com', '123456', 'yannabhat', 'pliensak', 'a');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `price` float NOT NULL DEFAULT '0',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `description`, `price`, `image`) VALUES
('KCK100', 'Keychron K1', 'default slim', 4390, 'https://cdn.shopify.com/s/files/1/0328/6034/0364/products/K1-SE-TH-cover_360x.jpg?v=1656300214'),
('KCK1000', 'Keychron K10', 'default', 4390, 'https://cdn.shopify.com/s/files/1/0328/6034/0364/products/1200x1200_K10-1-cover_360x.jpg?v=1638690632'),
('KCK1200', 'Keychron K12', 'default', 3890, 'https://cdn.shopify.com/s/files/1/0328/6034/0364/products/1200x1200_K6-cover_856b2357-b768-463a-8b0a-454c97d80775_360x.jpg?v=1637211083'),
('KCK200', 'Keychron K2', 'default', 3890, 'https://cdn.shopify.com/s/files/1/0328/6034/0364/products/1200x1200_K2-cover_360x.jpg?v=1623919536'),
('KCK300', 'Keychron K3', 'default slim', 3890, 'https://cdn.shopify.com/s/files/1/0328/6034/0364/products/1200x1200_K3-cover_360x.jpg?v=1623919911'),
('KCK400', 'Keychron K4', 'default', 4390, 'https://cdn.shopify.com/s/files/1/0328/6034/0364/products/1200x1200_K4-cover_360x.jpg?v=1623920422'),
('KCK500', 'Keychron K5', 'default slim', 4390, 'https://cdn.shopify.com/s/files/1/0328/6034/0364/products/cover_9b810fbc-68b7-4032-928d-02efcfe14e20_360x.jpg?v=1662531985'),
('KCK600', 'Keychron K6', 'default', 3890, 'https://cdn.shopify.com/s/files/1/0328/6034/0364/products/1200x1200_K6-cover_360x.jpg?v=1623920781'),
('KCK700', 'Keychron K7', 'default slim', 3890, 'https://cdn.shopify.com/s/files/1/0328/6034/0364/products/1200x1200_K7-cover_360x.jpg?v=1633582027'),
('KCK800', 'Keychron K8', 'default', 4090, 'https://cdn.shopify.com/s/files/1/0328/6034/0364/products/1200x1200_K8-cover_360x.jpg?v=1623921356'),
('KCQ100', 'Keychron Q1', 'default', 6190, 'https://cdn.shopify.com/s/files/1/0328/6034/0364/products/cover_d271f9ea-e473-4077-9482-2e9a1811959b_360x.jpg?v=1637055661'),
('KCQ111', 'Keychron Q1 CB BrS', 'default Q1-series', 6190, 'image/Q-series/Q1-series/Keychron Q1 CB BrS.jpg'),
('KCQ112', 'Keychron Q1 CB BS', 'default Q1-series', 6190, 'image/Q-series/Q1-series/Keychron Q1 CB BS.jpg'),
('KCQ113', 'Keychron Q1 CB RS', 'default Q1-series', 6190, 'image/Q-series/Q1-series/Keychron Q1 CB RS.jpg'),
('KCQ114', 'Keychron Q1 MG BrS', 'default Q1-series', 6190, 'image/Q-series/Q1-series/Keychron Q1 MG BrS.jpg'),
('KCQ115', 'Keychron Q1 MG BS', 'default Q1-series', 6190, 'image/Q-series/Q1-series/Keychron Q1 MG BS.jpg'),
('KCQ116', 'Keychron Q1 MG RS', 'default Q1-series', 6190, 'image/Q-series/Q1-series/Keychron Q1 MG RS.jpg'),
('KCQ117', 'Keychron Q1 NB BrS', 'default Q1-series', 6190, 'image/Q-series/Q1-series/Keychron Q1 NB BrS.jpg'),
('KCQ118', 'Keychron Q1 NB BS', 'default Q1-series', 6190, 'image/Q-series/Q1-series/Keychron Q1 NB BS.jpg'),
('KCQ119', 'Keychron Q1 NB RS', 'default Q1-series', 6190, 'image/Q-series/Q1-series/Keychron Q1 NB RS.jpg'),
('KCQ120', 'Keychron Q1 SG BrS', 'default Q1-series', 6190, 'image/Q-series/Q1-series/Keychron Q1 SG BrS.jpg'),
('KCQ121', 'Keychron Q1 SG BS', 'default Q1-series', 6190, 'image/Q-series/Q1-series/Keychron Q1 SG BS.jpg'),
('KCQ122', 'Keychron Q1 SG RS', 'default Q1-series', 6190, 'image/Q-series/Q1-series/Keychron Q1 SG RS.jpg'),
('KCQ123', 'Keychron Q1 SW BrS', 'default Q1-series', 6190, 'image/Q-series/Q1-series/Keychron Q1 SW BrS.jpg'),
('KCQ124', 'Keychron Q1 SW BS', 'default Q1-series', 6190, 'image/Q-series/Q1-series/Keychron Q1 SW BS.jpg'),
('KCQ125', 'Keychron Q1 SW RS', 'default Q1-series', 6190, 'image/Q-series/Q1-series/Keychron Q1 SW RS.jpg'),
('KCQ200', 'Keychron Q2', 'default', 6190, 'https://cdn.shopify.com/s/files/1/0328/6034/0364/products/cover_3bea37a6-c461-42aa-a527-d543b710454d_360x.jpg?v=1652411698'),
('KCQ211', 'Keychron Q2 CB-A BrS', 'default Q2-series', 6190, 'image/Q-series/Q2-series/Keychron Q2 CB-A BrS.jpg'),
('KCQ212', 'Keychron Q2 CB-A BS', 'default Q2-series', 6190, 'image/Q-series/Q2-series/Keychron Q2 CB-A BS.jpg'),
('KCQ213', 'Keychron Q2 CB-A RS', 'default Q2-series', 6190, 'image/Q-series/Q2-series/Keychron Q2 CB-A RS.jpg'),
('KCQ214', 'Keychron Q2 CB-B BrS', 'default Q2-series', 6190, 'image/Q-series/Q2-series/Keychron Q2 CB-B BrS.jpg'),
('KCQ215', 'Keychron Q2 CB-B BS', 'default Q2-series', 6190, 'image/Q-series/Q2-series/Keychron Q2 CB-B BS.jpg'),
('KCQ216', 'Keychron Q2 CB-B RS', 'default Q2-series', 6190, 'image/Q-series/Q2-series/Keychron Q2 CB-B RS.jpg'),
('KCQ217', 'Keychron Q2 NB-A BrS', 'default Q2-series', 6190, 'imageQ-series/Q2-series/Keychron Q2 NB-A BrS.jpg'),
('KCQ218', 'Keychron Q2 NB-A BS', 'default Q2-series', 6190, 'image/Q-series/Q2-series/Keychron Q2 NB-A BS.jpg'),
('KCQ219', 'Keychron Q2 NB-A RS', 'default Q2-series', 6190, 'image/Q-series/Q2-series/Keychron Q2 NB-A RS.jpg'),
('KCQ220', 'Keychron Q2 NB-B BrS', 'default Q2-series', 6190, 'image/Q-series/Q2-series/Keychron Q2 NB-B BrS.jpg'),
('KCQ221', 'Keychron Q2 NB-B BS', 'default Q2-series', 6190, 'image/Q-series/Q2-series/Keychron Q2 NB-B BS.jpg'),
('KCQ222', 'Keychron Q2 NB-B RS', 'default Q2-series', 6190, 'image/Q-series/Q2-series/Keychron Q2 NB-B RS.jpg'),
('KCQ223', 'Keychron Q2 SG-A BrS', 'default Q2-series', 6190, 'image/Q-series/Q2-series/Keychron Q2 SG-A BrS.jpg'),
('KCQ224', 'Keychron Q2 SG-A BS', 'default Q2-series', 6190, 'image/Q-series/Q2-series/Keychron Q2 SG-A BS.jpg'),
('KCQ225', 'Keychron Q2 SG-A RS', 'default Q2-series', 6190, 'image/Q-series/Q2-series/Keychron Q2 SG-A RS.jpg'),
('KCQ226', 'Keychron Q2 SG-B BrS', 'default Q2-series', 6190, 'image/Q-series/Q2-series/Keychron Q2 SG-B BrS.jpg'),
('KCQ227', 'Keychron Q2 SG-B BS', 'default Q2-series', 6190, 'image/Q-series/Q2-series/Keychron Q2 SG-B BS.jpg'),
('KCQ228', 'Keychron Q2 SG-B RS', 'default Q2-series', 6190, 'image/Q-series/Q2-series/Keychron Q2 SG-B RS.jpg'),
('KCQ300', 'Keychron Q3', 'default', 6190, 'https://cdn.shopify.com/s/files/1/0328/6034/0364/products/cover_dc60b8f2-1cce-47f1-acdd-3a27bfa1056f_360x.jpg?v=1652412413'),
('KCQ311', 'Keychron Q3 CB-A BrS', 'default Q3-series', 6190, 'image/Q-series/Q3-series/Keychron Q3 CB-A BrS.jpg'),
('KCQ312', 'Keychron Q3 CB-A BS', 'default Q3-series', 6190, 'image/Q-series/Q3-series/Keychron Q3 CB-A BS.jpg'),
('KCQ313', 'Keychron Q3 CB-A RS', 'default Q3-series', 6190, 'image/Q-series/Q3-series/Keychron Q3 CB-A RS.jpg'),
('KCQ314', 'Keychron Q3 CB-B BrS', 'default Q3-series', 6190, 'image/Q-series/Q3-series/Keychron Q3 CB-B BrS.jpg'),
('KCQ315', 'Keychron Q3 CB-B BS', 'default Q3-series', 6190, 'image/Q-series/Q3-series/Keychron Q3 CB-B BS.jpg'),
('KCQ316', 'Keychron Q3 CB-B RS', 'default Q3-series', 6190, 'image/Q-series/Q3-series/Keychron Q3 CB-B RS.jpg'),
('KCQ317', 'Keychron Q3 NB-A BrS', 'default Q3-series', 6190, 'image/Q-series/Q3-series/Keychron Q3 NB-A BrS.jpg'),
('KCQ318', 'Keychron Q3 NB-A BS', 'default Q3-series', 6190, 'image/Q-series/Q3-series/Keychron Q3 NB-A BS.jpg'),
('KCQ319', 'Keychron Q3 NB-A RS', 'default Q3-series', 6190, 'image/Q-series/Q3-series/Keychron Q3 NB-A RS.jpg'),
('KCQ320', 'Keychron Q3 NB-B BrS', 'default Q3-series', 6190, 'image/Q-series/Q3-series/Keychron Q3 NB-B BrS.jpg'),
('KCQ321', 'Keychron Q3 NB-B BS', 'default Q3-series', 6190, 'image/Q-series/Q3-series/Keychron Q3 NB-B BS.jpg'),
('KCQ322', 'Keychron Q3 NB-B RS', 'default Q3-series', 6190, 'image/Q-series/Q3-series/Keychron Q3 NB-B RS.jpg'),
('KCQ323', 'Keychron Q3 SG-A BrS', 'default Q3-series', 6190, 'image/Q-series/Q3-series/Keychron Q3 SG-A BrS.jpg'),
('KCQ324', 'Keychron Q3 SG-A BS', 'default Q3-series', 6190, 'image/Q-series/Q3-series/Keychron Q3 SG-A BS.jpg'),
('KCQ325', 'Keychron Q3 SG-A RS', 'default Q3-series', 6190, 'image/Q-series/Q3-series/Keychron Q3 SG-A RS.jpg'),
('KCQ326', 'Keychron Q3 SG-B BrS', 'default Q3-series', 6190, 'image/Q-series/Q3-series/Keychron Q3 SG-B BrS.jpg'),
('KCQ327', 'Keychron Q3 SG-B BS', 'default Q3-series', 6190, 'image/Q-series/Q3-series/Keychron Q3 SG-B BS.jpg'),
('KCQ328', 'Keychron Q3 SG-B RS', 'default Q3-series', 6190, 'image/Q-series/Q3-series/Keychron Q3 SG-B RS.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_product`
--
ALTER TABLE `order_product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `order_product`
--
ALTER TABLE `order_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `person`
--
ALTER TABLE `person`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
