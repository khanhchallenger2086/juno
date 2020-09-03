-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 03, 2020 at 07:50 AM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `juno`
--

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uri` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `uri`, `parent`, `deleted_at`, `created_at`, `updated_at`) VALUES
(8, '12asđá', NULL, '0', NULL, '2020-08-27 09:50:20', '2020-09-02 06:44:56'),
(9, 'khanh', NULL, '0', '2020-09-02 13:44:58', '2020-08-27 09:50:46', '2020-09-02 06:44:58'),
(10, 's', 's1212', '0', '2020-09-02 13:44:59', '2020-08-27 09:50:58', '2020-09-02 06:44:59'),
(11, '12', '1221', '0', '2020-09-02 13:45:01', '2020-08-28 03:03:48', '2020-09-02 06:45:01'),
(12, '1212', '1212', '8', NULL, NULL, '2020-09-02 14:44:34'),
(14, '1212', '1212', '0', NULL, '2020-09-02 14:55:26', NULL),
(15, 'khanh1', NULL, '9', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `colors`
--

CREATE TABLE `colors` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `colors`
--

INSERT INTO `colors` (`id`, `name`, `image`, `deleted_at`, `created_at`, `updated_at`) VALUES
(5, 'vàng1212', 'IMG61205852.png', NULL, '2020-09-02 15:05:13', '2020-09-03 07:09:28'),
(6, '12', 'IMG99122403.png', NULL, '2020-09-02 15:31:14', '2020-09-02 08:31:14'),
(7, 'hồng', 'IMG490122733.jpg', NULL, '2020-09-02 16:13:24', '2020-09-02 09:13:24'),
(8, '12', 'IMG29167776.png', NULL, '2020-09-02 16:19:29', '2020-09-02 16:27:26'),
(9, '12', 'IMG369739500.png', NULL, '2020-09-03 07:09:04', '2020-09-03 00:09:04');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `address`, `phone`, `email`, `deleted_at`, `created_at`, `updated_at`) VALUES
(7, '', '12', '12', NULL, NULL, NULL, NULL),
(12, 'Khánh', '1', '2', '3', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_08_22_040322_create_product_table', 1),
(5, '2020_08_22_041054_create_productt_table', 2),
(8, '2020_08_22_041225_create_admin_table', 3),
(25, '2020_08_22_092218_create_products_table', 4),
(26, '2020_08_22_093134_create_products_variant_table', 4),
(27, '2020_08_22_094139_create_categories_table', 4),
(28, '2020_08_22_094319_create_customers_table', 4),
(29, '2020_08_22_094437_create_orders_table', 4),
(30, '2020_08_22_095744_create_order_details_table', 4),
(31, '2020_08_22_100259_create_banners_table', 4),
(32, '2020_08_22_100458_create_setting_table', 4),
(33, '2020_09_02_133247_create_colors_table', 5),
(34, '2020_09_03_042938_create_product_categories_table', 6);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(50) NOT NULL,
  `code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_order` int(50) DEFAULT NULL,
  `id_customer` int(11) DEFAULT NULL,
  `payment_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` int(11) DEFAULT NULL,
  `note_from_customer` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_order` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_order` int(11) DEFAULT NULL,
  `id_product` int(11) DEFAULT NULL,
  `price_product` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_product` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_price` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `id_order`, `id_product`, `price_product`, `name_product`, `total_price`, `amount`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 3, 2, '20', 'Sản phẩm a', '50000', 20, NULL, NULL, NULL),
(2, 3, 2, '20', 'Sản phẩm a', '50000', 20, NULL, NULL, NULL),
(3, 3, 3, '20', 'Sản phẩm b', '50000', 20, NULL, NULL, NULL),
(4, 3, 3, '20', 'Sản phẩm b', '50000', 20, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_main` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_detail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `style` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `material` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uri` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `code`, `name`, `image_main`, `image_detail`, `description`, `style`, `material`, `uri`, `deleted_at`, `created_at`, `updated_at`) VALUES
(93, 'DH070344', 'khanh', 'IMG757338434.png;IMG130499952.png;IMG622412810.png;', 'IMG870963542.png;IMG812319483.png;IMG867649799.png;', '<p>1212</p>', '1212', '121212', 'khanh', NULL, '2020-09-03 00:03:44', '2020-09-03 07:05:26'),
(94, 'DH070352', 'khanh1212', 'IMG928905619.png;IMG796879676.png;IMG244128647.png;', 'IMG197943981.png;IMG74223518.png;IMG748444259.png;', '<p>1212</p>', '1212', '121212', 'khanh1212', NULL, '2020-09-03 00:03:52', '2020-09-03 07:05:13'),
(95, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-09-03 00:16:19'),
(96, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-09-03 00:16:19'),
(97, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-09-03 07:49:46', NULL, '2020-09-03 00:49:46'),
(98, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(100, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-09-03 00:16:19'),
(101, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-09-03 07:49:42', NULL, '2020-09-03 00:49:42'),
(102, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-09-03 00:16:19'),
(103, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-09-03 07:49:35', NULL, '2020-09-03 00:49:35'),
(104, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-09-03 07:49:39', NULL, '2020-09-03 00:49:39'),
(105, 'DH073930', '12', 'IMG574910575.png;', 'IMG285689703.png;', '<p>12</p>', '12d12d', '12', '12', NULL, '2020-09-03 00:39:30', '2020-09-03 00:40:48'),
(106, 'DH073938', '12', 'IMG2834206.png;', 'IMG212525911.png;', '<p>12</p>', '12d12d', '12', '12', NULL, '2020-09-03 00:39:38', '2020-09-03 00:40:48');

-- --------------------------------------------------------

--
-- Table structure for table `product_categories`
--

CREATE TABLE `product_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_product` int(11) DEFAULT NULL,
  `id_category` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_categories`
--

INSERT INTO `product_categories` (`id`, `id_product`, `id_category`, `deleted_at`, `created_at`, `updated_at`) VALUES
(47, 94, 8, NULL, '2020-09-03 00:05:13', '2020-09-03 00:05:13'),
(48, 94, 12, NULL, '2020-09-03 00:05:14', '2020-09-03 00:05:14'),
(49, 94, 9, NULL, '2020-09-03 00:05:14', '2020-09-03 00:05:14'),
(50, 93, 8, NULL, '2020-09-03 00:05:26', '2020-09-03 00:05:26'),
(51, 93, 12, NULL, '2020-09-03 00:05:26', '2020-09-03 00:05:26'),
(52, 93, 9, NULL, '2020-09-03 00:05:26', '2020-09-03 00:05:26'),
(53, 93, 10, NULL, '2020-09-03 00:05:26', '2020-09-03 00:05:26'),
(54, 105, 12, NULL, '2020-09-03 00:39:31', '2020-09-03 00:40:48'),
(55, 105, 9, NULL, '2020-09-03 00:39:31', '2020-09-03 00:40:48'),
(56, 106, 12, NULL, '2020-09-03 00:39:38', '2020-09-03 00:40:48'),
(57, 106, 9, NULL, '2020-09-03 00:39:38', '2020-09-03 00:40:48');

-- --------------------------------------------------------

--
-- Table structure for table `product_variants`
--

CREATE TABLE `product_variants` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_product` int(11) DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price_market` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `price` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_variants`
--

INSERT INTO `product_variants` (`id`, `id_product`, `color`, `size`, `price_market`, `price`, `deleted_at`, `created_at`, `updated_at`) VALUES
(420, 93, '12', '121', '0', '0', NULL, '2020-09-03 00:03:45', NULL),
(421, 93, 'hồng', '121', '0', '0', NULL, '2020-09-03 00:03:45', NULL),
(422, 93, '12', '121', '0', '0', NULL, '2020-09-03 00:03:45', NULL),
(423, 94, '12', '1221', '0', '0', NULL, '2020-09-03 00:03:53', NULL),
(424, 94, 'hồng', '1221', '0', '0', NULL, '2020-09-03 00:03:53', NULL),
(425, 94, '12', '1221', '0', '0', NULL, '2020-09-03 00:03:53', NULL),
(426, 105, '12', '12', '0', '0', NULL, '2020-09-03 00:39:31', '2020-09-03 00:40:48'),
(427, 105, 'hồng', '12', '0', '0', NULL, '2020-09-03 00:39:31', '2020-09-03 00:40:48'),
(428, 106, '12', '12', '0', '0', NULL, '2020-09-03 00:39:38', '2020-09-03 00:40:48'),
(429, 106, 'hồng', '12', '0', '0', NULL, '2020-09-03 00:39:38', '2020-09-03 00:40:48');

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

CREATE TABLE `setting` (
  `setting` int(50) DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_support` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link_fb` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link_zalo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link_youtube` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link_instagram` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `setting`
--

INSERT INTO `setting` (`setting`, `phone`, `phone_support`, `name`, `address`, `link_fb`, `link_zalo`, `link_youtube`, `link_instagram`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, '21ád', '12ád', '12ádasd', '12', '12ádasd', '12', '1212', '1212', NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_variants`
--
ALTER TABLE `product_variants`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `colors`
--
ALTER TABLE `colors`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- AUTO_INCREMENT for table `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `product_variants`
--
ALTER TABLE `product_variants`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=430;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
