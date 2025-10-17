-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 17, 2025 at 01:44 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mariyamt_accounts`
--

-- --------------------------------------------------------

--
-- Table structure for table `buys`
--

CREATE TABLE `buys` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `supplier_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `payment_id` bigint(20) UNSIGNED DEFAULT NULL,
  `total_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `paid_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `due_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `date` date DEFAULT NULL,
  `supplier_type_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `buys`
--

INSERT INTO `buys` (`id`, `supplier_id`, `created_at`, `updated_at`, `payment_id`, `total_amount`, `paid_amount`, `due_amount`, `date`, `supplier_type_id`) VALUES
(4, 1, '2025-10-17 05:35:14', '2025-10-17 05:35:14', 4, 0.00, 0.00, 0.00, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `buy_items`
--

CREATE TABLE `buy_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `buy_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `note` text DEFAULT NULL,
  `unit_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `buy_items`
--

INSERT INTO `buy_items` (`id`, `buy_id`, `product_id`, `note`, `unit_id`, `amount`, `quantity`, `unit_price`, `created_at`, `updated_at`) VALUES
(3, 4, 1, '3 tay', 1, 1750.00, 5, 350.00, '2025-10-17 05:35:14', '2025-10-17 05:35:14'),
(4, 4, 1, '5 tay', 1, 600.00, 3, 200.00, '2025-10-17 05:35:14', '2025-10-17 05:35:14');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('mariyam-enterprise-cache-admin@gmail.com|127.0.0.1', 'i:1;', 1760699791),
('mariyam-enterprise-cache-admin@gmail.com|127.0.0.1:timer', 'i:1760699791;', 1760699791);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `company_name`, `phone`, `email`, `address`, `created_at`, `updated_at`) VALUES
(1, 'Sobuj', 'Sobuj er Dokan', '01794630640', 'sobuj@gmail.com', 'Bangladesh', '2025-10-17 05:36:10', '2025-10-17 05:36:10');

-- --------------------------------------------------------

--
-- Table structure for table `customer_types`
--

CREATE TABLE `customer_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `number` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer_types`
--

INSERT INTO `customer_types` (`id`, `customer_id`, `number`, `created_at`, `updated_at`) VALUES
(1, 1, 'LC-156792', '2025-10-17 05:36:24', '2025-10-17 05:36:24');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_10_02_075322_add_role_to_users_table', 1),
(5, '2025_10_02_083510_create_products_table', 1),
(6, '2025_10_02_084432_create_units_table', 1),
(7, '2025_10_02_085055_create_customers_table', 1),
(8, '2025_10_02_085712_create_suppliers_table', 1),
(9, '2025_10_02_090359_create_pay_types_table', 1),
(10, '2025_10_02_100637_create_sells_table', 1),
(11, '2025_10_02_100735_create_sell_items_table', 1),
(12, '2025_10_02_100839_create_payments_table', 1),
(13, '2025_10_02_100938_create_payment_items_table', 1),
(14, '2025_10_02_104602_create_buys_table', 1),
(15, '2025_10_02_104659_create_buy_items_table', 1),
(16, '2025_10_02_104700_add_buy_id_to_payments_table', 1),
(17, '2025_10_02_111512_make_sell_id_nullable_in_payments_table', 1),
(18, '2025_10_02_111928_add_payment_id_to_sells_table', 1),
(19, '2025_10_02_112010_add_payment_id_to_buys_table', 1),
(20, '2025_10_02_151435_add_foreign_key_buy_id_to_payments_table', 2),
(21, '2025_10_02_152002_add_amount_fields_to_sells_table', 3),
(22, '2025_10_02_152021_add_amount_fields_to_buys_table', 4),
(23, '2025_10_12_142600_add_date_to_buys_table', 5),
(24, '2025_10_12_143309_update_buys_date_from_created_at', 6),
(25, '2025_10_17_050025_add_company_name_to_suppliers_table', 7),
(26, '2025_10_17_050050_add_company_name_to_customers_table', 8),
(27, '2025_10_17_090719_create_supplier_types_table', 9),
(28, '2025_10_17_091641_create_customer_types_table', 10),
(29, '2025_10_17_092549_add_supplier_type_id_to_buys_table', 11),
(30, '2025_10_17_093208_add_customer_type_id_to_sells_table', 12),
(31, '2025_10_17_112530_add_unit_price_to_buy_items_table', 13),
(32, '2025_10_17_114035_add_unit_price_to_sell_items_table', 14);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sell_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `buy_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `sell_id`, `created_at`, `updated_at`, `buy_id`) VALUES
(1, NULL, '2025-10-17 05:21:07', '2025-10-17 05:21:07', NULL),
(4, NULL, '2025-10-17 05:35:14', '2025-10-17 05:35:14', NULL),
(5, NULL, '2025-10-17 05:37:57', '2025-10-17 05:37:57', NULL),
(6, NULL, '2025-10-17 05:43:40', '2025-10-17 05:43:40', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `payment_items`
--

CREATE TABLE `payment_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payment_id` bigint(20) UNSIGNED NOT NULL,
  `paytype_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_items`
--

INSERT INTO `payment_items` (`id`, `payment_id`, `paytype_id`, `amount`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1500.00, '2025-10-17 05:21:07', '2025-10-17 05:21:07'),
(2, 4, 1, 1350.00, '2025-10-17 05:35:14', '2025-10-17 05:35:14'),
(3, 5, 1, 300.00, '2025-10-17 05:37:57', '2025-10-17 05:37:57'),
(4, 6, 1, 300.00, '2025-10-17 05:43:40', '2025-10-17 05:43:40');

-- --------------------------------------------------------

--
-- Table structure for table `pay_types`
--

CREATE TABLE `pay_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pay_types`
--

INSERT INTO `pay_types` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Cash', '2025-10-17 05:16:42', '2025-10-17 05:16:42');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Dalim', '2025-10-17 05:16:34', '2025-10-17 05:16:34');

-- --------------------------------------------------------

--
-- Table structure for table `sells`
--

CREATE TABLE `sells` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `payment_id` bigint(20) UNSIGNED DEFAULT NULL,
  `total_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `paid_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `due_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `customer_type_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sells`
--

INSERT INTO `sells` (`id`, `customer_id`, `created_at`, `updated_at`, `payment_id`, `total_amount`, `paid_amount`, `due_amount`, `customer_type_id`) VALUES
(2, 1, '2025-10-17 05:43:40', '2025-10-17 05:43:40', 6, 0.00, 0.00, 0.00, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sell_items`
--

CREATE TABLE `sell_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sell_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `note` text DEFAULT NULL,
  `unit_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sell_items`
--

INSERT INTO `sell_items` (`id`, `sell_id`, `product_id`, `note`, `unit_id`, `amount`, `quantity`, `unit_price`, `created_at`, `updated_at`) VALUES
(2, 2, 1, '3', 1, 400.00, 1, 400.00, '2025-10-17 05:43:40', '2025-10-17 05:43:40');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('Q0URCzXyj4wzwJWoHdraH9PsqY35b2aNvrkNifn4', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoic0kzMDBYRldheExjSUUzM1AxUnNoMWs3T1U4cFJ5b0VxMk94QzlabSI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozNjoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL3N1cHBsaWVyX3R5cGVzIjt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9zZWxscy8yIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTt9', 1760701423);

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `name`, `company_name`, `phone`, `email`, `address`, `created_at`, `updated_at`) VALUES
(1, 'Rahim', 'Rahim Traders LTD', '01632109022', 'rahim@gmail.com', 'India', '2025-10-17 05:17:02', '2025-10-17 05:17:02'),
(2, 'Karim', 'Karim Limited', '01908549453', 'karim@gmail.com', 'Pakistan', '2025-10-17 05:18:22', '2025-10-17 05:18:22');

-- --------------------------------------------------------

--
-- Table structure for table `supplier_types`
--

CREATE TABLE `supplier_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `supplier_id` bigint(20) UNSIGNED NOT NULL,
  `number` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `supplier_types`
--

INSERT INTO `supplier_types` (`id`, `supplier_id`, `number`, `created_at`, `updated_at`) VALUES
(1, 1, 'LC-234324', '2025-10-17 05:17:13', '2025-10-17 05:17:13'),
(2, 1, 'TT-348721', '2025-10-17 05:17:23', '2025-10-17 05:17:23'),
(3, 1, '3rd-LC-352619', '2025-10-17 05:17:43', '2025-10-17 05:17:43'),
(4, 2, 'LC-129845', '2025-10-17 05:18:34', '2025-10-17 05:18:34');

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'KG', '2025-10-17 05:16:27', '2025-10-17 05:16:27');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role` varchar(255) DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `role`) VALUES
(1, 'Admin', 'admin@gmail.com', NULL, '$2y$12$puNSI4JxgrLOs42BO15Y1OLPeg1cOEpyByTdzIDRWB7lRIL/UPuJe', NULL, '2025-10-17 05:15:56', '2025-10-17 05:15:56', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `buys`
--
ALTER TABLE `buys`
  ADD PRIMARY KEY (`id`),
  ADD KEY `buys_supplier_id_foreign` (`supplier_id`),
  ADD KEY `buys_payment_id_foreign` (`payment_id`),
  ADD KEY `buys_supplier_type_id_foreign` (`supplier_type_id`);

--
-- Indexes for table `buy_items`
--
ALTER TABLE `buy_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `buy_items_buy_id_foreign` (`buy_id`),
  ADD KEY `buy_items_product_id_foreign` (`product_id`),
  ADD KEY `buy_items_unit_id_foreign` (`unit_id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_types`
--
ALTER TABLE `customer_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_types_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payments_sell_id_foreign` (`sell_id`),
  ADD KEY `payments_buy_id_foreign` (`buy_id`);

--
-- Indexes for table `payment_items`
--
ALTER TABLE `payment_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payment_items_payment_id_foreign` (`payment_id`),
  ADD KEY `payment_items_paytype_id_foreign` (`paytype_id`);

--
-- Indexes for table `pay_types`
--
ALTER TABLE `pay_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sells`
--
ALTER TABLE `sells`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sells_customer_id_foreign` (`customer_id`),
  ADD KEY `sells_payment_id_foreign` (`payment_id`),
  ADD KEY `sells_customer_type_id_foreign` (`customer_type_id`);

--
-- Indexes for table `sell_items`
--
ALTER TABLE `sell_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sell_items_sell_id_foreign` (`sell_id`),
  ADD KEY `sell_items_product_id_foreign` (`product_id`),
  ADD KEY `sell_items_unit_id_foreign` (`unit_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supplier_types`
--
ALTER TABLE `supplier_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `supplier_types_supplier_id_foreign` (`supplier_id`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
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
-- AUTO_INCREMENT for table `buys`
--
ALTER TABLE `buys`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `buy_items`
--
ALTER TABLE `buy_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `customer_types`
--
ALTER TABLE `customer_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `payment_items`
--
ALTER TABLE `payment_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pay_types`
--
ALTER TABLE `pay_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sells`
--
ALTER TABLE `sells`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sell_items`
--
ALTER TABLE `sell_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `supplier_types`
--
ALTER TABLE `supplier_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `buys`
--
ALTER TABLE `buys`
  ADD CONSTRAINT `buys_payment_id_foreign` FOREIGN KEY (`payment_id`) REFERENCES `payments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `buys_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `buys_supplier_type_id_foreign` FOREIGN KEY (`supplier_type_id`) REFERENCES `supplier_types` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `buy_items`
--
ALTER TABLE `buy_items`
  ADD CONSTRAINT `buy_items_buy_id_foreign` FOREIGN KEY (`buy_id`) REFERENCES `buys` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `buy_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `buy_items_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `customer_types`
--
ALTER TABLE `customer_types`
  ADD CONSTRAINT `customer_types_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_buy_id_foreign` FOREIGN KEY (`buy_id`) REFERENCES `buys` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `payments_sell_id_foreign` FOREIGN KEY (`sell_id`) REFERENCES `sells` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `payment_items`
--
ALTER TABLE `payment_items`
  ADD CONSTRAINT `payment_items_payment_id_foreign` FOREIGN KEY (`payment_id`) REFERENCES `payments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `payment_items_paytype_id_foreign` FOREIGN KEY (`paytype_id`) REFERENCES `pay_types` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sells`
--
ALTER TABLE `sells`
  ADD CONSTRAINT `sells_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sells_customer_type_id_foreign` FOREIGN KEY (`customer_type_id`) REFERENCES `customer_types` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `sells_payment_id_foreign` FOREIGN KEY (`payment_id`) REFERENCES `payments` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sell_items`
--
ALTER TABLE `sell_items`
  ADD CONSTRAINT `sell_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sell_items_sell_id_foreign` FOREIGN KEY (`sell_id`) REFERENCES `sells` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sell_items_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `supplier_types`
--
ALTER TABLE `supplier_types`
  ADD CONSTRAINT `supplier_types_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
