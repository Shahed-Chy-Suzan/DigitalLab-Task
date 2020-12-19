-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 19, 2020 at 07:40 AM
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
(19, NULL, 4, '16050', NULL, '6', '15087', '10000', '5087.00', 'HandCash', 'December', '2020', '13/12/2020', '2020-12-13 19:59:27', '2020-12-13 19:59:27'),
(20, NULL, 2, '30000', NULL, '8', '27600', '7600', '20000.00', 'HandCash', 'December', '2020', '15/12/2020', '2020-12-15 05:28:37', '2020-12-15 05:28:37'),
(21, NULL, 4, '60000', NULL, '1', '59400', '59000', '400.00', 'Cheaque', 'December', '2020', '15/12/2020', '2020-12-15 06:39:18', '2020-12-15 06:39:18'),
(22, NULL, 2, '900', NULL, '9', '819', '800', '19.00', 'GiftCard', 'December', '2020', '15/12/2020', '2020-12-15 09:41:41', '2020-12-15 09:41:41');

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

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(121) NOT NULL,
  `product_name` varchar(121) NOT NULL,
  `product_price` varchar(121) NOT NULL,
  `product_quantity` int(121) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `product_name`, `product_price`, `product_quantity`, `created_at`, `updated_at`) VALUES
(1, 'T-Shirt', '500', 1, '2020-12-12 19:42:52', '2020-12-12 19:42:52'),
(2, 'Watch', '400', 1, '2020-12-12 19:43:34', '2020-12-12 19:43:34'),
(3, 'Panjabi', '800', 1, '2020-12-12 19:44:06', '2020-12-12 19:44:06'),
(4, 'HP Laptop', '58000', 1, '2020-12-12 20:29:25', '2020-12-12 20:29:25'),
(5, 'Mouse', '400', 1, '2020-12-12 20:29:47', '2020-12-12 20:29:47'),
(6, 'Keyboard', '600', 1, '2020-12-12 20:30:10', '2020-12-12 20:30:10'),
(7, 'Data Cable', '50', 1, '2020-12-12 20:30:40', '2020-12-12 20:30:40'),
(8, 'Samsung Galaxy', '15000', 1, '2020-12-12 20:31:10', '2020-12-12 20:31:10'),
(9, 'Printer', '2000', 1, '2020-12-13 06:05:11', '2020-12-13 06:05:11'),
(10, 'Samsung Galaxy 1', '12000', 1, '2020-12-13 14:15:21', '2020-12-13 14:15:21'),
(11, 'CPU', '13000', 1, '2020-12-15 20:20:11', '2020-12-15 20:20:11');

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
  MODIFY `id` bigint(121) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `pos`
--
ALTER TABLE `pos`
  MODIFY `id` bigint(121) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(121) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
