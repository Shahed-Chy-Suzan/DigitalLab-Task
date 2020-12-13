-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 13, 2020 at 08:15 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `digitallab`
--

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(111) NOT NULL,
  `name` varchar(111) NOT NULL,
  `phone` int(111) NOT NULL,
  `email` varchar(121) NOT NULL,
  `address` varchar(121) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `phone`, `email`, `address`, `created_at`, `updated_at`) VALUES
(1, 'sajjad hossen', 1815406312, 'sajjad@gmail.com', 'kadalpur, raozan, chattogram', '2020-12-12 19:24:35', '2020-12-12 19:24:35'),
(2, 'jahedul islam', 1815406313, 'jahed@gmail.com', 'muradpur, chattogram', '2020-12-12 19:24:35', '2020-12-12 19:24:35'),
(3, 'Arman alam', 1815406314, 'arman@gmail.com', 'Dhanmondi 10, Dhaka', '2020-12-12 19:24:35', '2020-12-12 19:24:35');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(121) NOT NULL,
  `customer_id` int(121) DEFAULT NULL,
  `qty` int(111) NOT NULL,
  `sub_total` varchar(121) NOT NULL,
  `vat` int(121) DEFAULT NULL,
  `discount` varchar(121) DEFAULT NULL,
  `total` varchar(121) NOT NULL,
  `deposit` varchar(121) NOT NULL,
  `due` varchar(121) NOT NULL,
  `pay_by` varchar(121) DEFAULT NULL,
  `month` varchar(121) DEFAULT NULL,
  `year` varchar(121) DEFAULT NULL,
  `date` varchar(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `customer_id`, `qty`, `sub_total`, `vat`, `discount`, `total`, `deposit`, `due`, `pay_by`, `month`, `year`, `date`, `created_at`, `updated_at`) VALUES
(1, 2, 2, '1000', NULL, NULL, '1000', '900', '100', 'Cash', NULL, NULL, NULL, '2020-12-12 19:31:48', '2020-12-12 19:31:48'),
(2, 1, 1, '800', NULL, NULL, '800', '500', '300', 'bKash', NULL, NULL, NULL, '2020-12-12 19:37:49', '2020-12-12 19:37:49'),
(3, 3, 4, '1600', NULL, NULL, '1600', '1200', '400', 'Rocket', NULL, NULL, NULL, '2020-12-12 19:39:08', '2020-12-12 19:39:08'),
(4, NULL, 4, '2000', NULL, '5', '1900', '555', '1345.00', 'Cheaque', 'December', '2020', '13/12/2020', '2020-12-13 12:16:15', '2020-12-13 12:16:15'),
(5, NULL, 4, '2000', NULL, '4', '1920', '555', '1365.00', 'Cheaque', 'December', '2020', '13/12/2020', '2020-12-13 12:38:03', '2020-12-13 12:38:03'),
(6, NULL, 5, '2800', NULL, '3', '2716', '333', '2383.00', 'HandCash', 'December', '2020', '13/12/2020', '2020-12-13 12:42:38', '2020-12-13 12:42:38'),
(7, NULL, 3, '2000', NULL, NULL, '2000', '333', '1667.00', NULL, 'December', '2020', '13/12/2020', '2020-12-13 12:48:29', '2020-12-13 12:48:29'),
(8, NULL, 4, '2400', NULL, NULL, '2400', '555', '1845.00', NULL, 'December', '2020', '13/12/2020', '2020-12-13 12:50:43', '2020-12-13 12:50:43'),
(9, NULL, 4, '2400', NULL, '4', '2304', '44', '2260.00', NULL, 'December', '2020', '13/12/2020', '2020-12-13 13:03:57', '2020-12-13 13:03:57'),
(10, NULL, 4, '2400', NULL, NULL, '2400', '666', '1734.00', NULL, 'December', '2020', '13/12/2020', '2020-12-13 13:05:41', '2020-12-13 13:05:41'),
(11, NULL, 3, '1600', NULL, NULL, '1600', '555', '1045.00', NULL, 'December', '2020', '13/12/2020', '2020-12-13 13:06:52', '2020-12-13 13:06:52'),
(12, NULL, 3, '1600', NULL, NULL, '1600', '44', '1556.00', NULL, 'December', '2020', '13/12/2020', '2020-12-13 13:08:52', '2020-12-13 13:08:52'),
(13, NULL, 4, '2400', NULL, '5', '2280', '666', '1614.00', 'Cheaque', 'December', '2020', '13/12/2020', '2020-12-13 13:10:04', '2020-12-13 13:10:04'),
(14, NULL, 4, '2400', NULL, '7', '2232', '555', '1677.00', 'HandCash', 'December', '2020', '13/12/2020', '2020-12-13 13:10:32', '2020-12-13 13:10:32'),
(15, NULL, 4, '2400', NULL, '7', '2232', '555', '1677.00', 'HandCash', 'December', '2020', '13/12/2020', '2020-12-13 13:22:10', '2020-12-13 13:22:10'),
(16, NULL, 3, '1300', NULL, '9', '1183', '83', '1100.00', 'Cheaque', 'December', '2020', '13/12/2020', '2020-12-13 13:38:06', '2020-12-13 13:38:06'),
(17, NULL, 3, '1400', NULL, NULL, '1400', '444', '956.00', 'HandCash', 'December', '2020', '13/12/2020', '2020-12-13 14:09:34', '2020-12-13 14:09:34'),
(18, NULL, 1, '12000', NULL, NULL, '12000', '444', '11556.00', NULL, 'December', '2020', '13/12/2020', '2020-12-13 14:50:31', '2020-12-13 14:50:31');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pos`
--

CREATE TABLE `pos` (
  `id` bigint(121) NOT NULL,
  `pro_id` int(11) NOT NULL,
  `pro_name` varchar(121) DEFAULT NULL,
  `pro_quantity` varchar(121) DEFAULT NULL,
  `product_price` varchar(121) DEFAULT NULL,
  `sub_total` varchar(111) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pos`
--

INSERT INTO `pos` (`id`, `pro_id`, `pro_name`, `pro_quantity`, `product_price`, `sub_total`, `created_at`, `updated_at`) VALUES
(22, 10, 'Samsung Galaxy 1', '1', '12000', '12000', '2020-12-13 14:32:39', '2020-12-13 14:32:39'),
(23, 9, 'Printer', '2', '2000', '4000', '2020-12-13 14:50:45', '2020-12-13 14:50:45');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(121) NOT NULL,
  `product_name` varchar(121) NOT NULL,
  `product_price` varchar(121) NOT NULL,
  `discount` varchar(121) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `product_name`, `product_price`, `discount`, `created_at`, `updated_at`) VALUES
(1, 'T-Shirt', '500', NULL, '2020-12-12 19:42:52', '2020-12-12 19:42:52'),
(2, 'Watch', '400', NULL, '2020-12-12 19:43:34', '2020-12-12 19:43:34'),
(3, 'Panjabi', '800', '4', '2020-12-12 19:44:06', '2020-12-12 19:44:06'),
(4, 'HP Laptop', '58000', NULL, '2020-12-12 20:29:25', '2020-12-12 20:29:25'),
(5, 'Mouse', '400', NULL, '2020-12-12 20:29:47', '2020-12-12 20:29:47'),
(6, 'Keyboard', '600', NULL, '2020-12-12 20:30:10', '2020-12-12 20:30:10'),
(7, 'Data Cable', '50', NULL, '2020-12-12 20:30:40', '2020-12-12 20:30:40'),
(8, 'Samsung Galaxy', '15000', '2', '2020-12-12 20:31:10', '2020-12-12 20:31:10'),
(9, 'Printer', '2000', NULL, '2020-12-13 06:05:11', '2020-12-13 06:05:11'),
(10, 'Samsung Galaxy 1', '12000', NULL, '2020-12-13 14:15:21', '2020-12-13 14:15:21');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `pos`
--
ALTER TABLE `pos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(111) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(121) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `pos`
--
ALTER TABLE `pos`
  MODIFY `id` bigint(121) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(121) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
