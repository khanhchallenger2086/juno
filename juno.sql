-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 20, 2020 at 07:10 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.10

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
(16, 'Giày', 'Giay', '0', NULL, '2020-09-20 02:41:35', NULL),
(17, 'Giày Adidas', 'Giay-Adidas', '16', NULL, '2020-09-20 02:44:25', NULL),
(18, 'Giày Cao Gót', 'Giay-Cao Got', '16', NULL, '2020-09-20 02:44:47', NULL),
(19, 'Túi', 'Tui', '0', NULL, '2020-09-20 02:45:05', NULL),
(20, 'Balo', 'Balo', '19', NULL, '2020-09-20 02:45:12', NULL),
(21, 'Ví', 'Vi', '19', NULL, '2020-09-20 02:45:33', NULL);

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
(10, 'Đen Xám', 'IMG166365237.webp', NULL, '2020-09-20 02:39:21', '2020-09-19 19:39:21'),
(11, 'Đen', 'IMG272364105.webp', NULL, '2020-09-20 02:39:30', '2020-09-19 19:39:30'),
(12, 'Đen Đô', 'IMG992779371.webp', NULL, '2020-09-20 02:39:41', '2020-09-19 19:39:41'),
(13, 'Đỏ Đô', 'IMG984336427.webp', NULL, '2020-09-20 02:39:53', '2020-09-19 19:39:53'),
(14, 'Đồng', 'IMG81682197.webp', NULL, '2020-09-20 02:40:00', '2020-09-19 19:40:00'),
(15, 'Kem', 'IMG909133467.webp', NULL, '2020-09-20 02:40:05', '2020-09-19 19:40:05'),
(16, 'Sọc Trắng Đen', 'IMG205913509.webp', NULL, '2020-09-20 02:40:18', '2020-09-19 19:40:18'),
(17, 'Trắng', 'IMG227338585.webp', NULL, '2020-09-20 02:40:26', '2020-09-19 19:40:26'),
(18, 'Vàng', 'IMG416895716.webp', NULL, '2020-09-20 02:40:32', '2020-09-19 19:40:32'),
(19, 'Vàng Đô', 'IMG948767612.jpg', NULL, '2020-09-20 02:40:55', '2020-09-19 19:40:55'),
(20, 'Xanh Nhạt', 'IMG96403804.webp', NULL, '2020-09-20 02:41:03', '2020-09-19 19:41:03'),
(21, 'Xanh', 'IMG669663976.webp', NULL, '2020-09-20 02:41:07', '2020-09-19 19:41:07');

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
(34, '2020_09_03_042938_create_product_categories_table', 6),
(35, '2020_09_17_063627_create_user_table', 7);

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
  `sale` int(50) NOT NULL DEFAULT 0,
  `image_main` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_detail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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

INSERT INTO `products` (`id`, `code`, `name`, `sale`, `image_main`, `image_detail`, `description`, `style`, `material`, `uri`, `deleted_at`, `created_at`, `updated_at`) VALUES
(109, 'DH025326', 'Giày xăng đan gót vuông 5cm quai ngang 1', 0, 'IMG33878135.webp;', 'IMG657216662.webp;', '<p style=\"margin-bottom: 10px; padding: 0px; font-family: Quicksand, sans-serif; line-height: 21px; color: rgb(37, 42, 43); font-size: 13px !important;\"><span data-sheets-value=\"{&quot;1&quot;:2,&quot;2&quot;:&quot;- Chất liệu da tổng hợp bền, đẹp.\\n- Quai ngang thiết kế đơn giản, nữ tính.\\n- Quai hậu dán, tiện dụng.&quot;}\" data-sheets-userformat=\"{&quot;2&quot;:929,&quot;3&quot;:[null,0],&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:3}]},&quot;10&quot;:1,&quot;11&quot;:4,&quot;12&quot;:0}\" data-mce-style=\"font-size: 12pt; color: #000000;\" style=\"margin: 0px; padding: 0px; font-size: 12pt; color: rgb(0, 0, 0);\">Chất liệu da tổng hợp bền, đẹp</span></p><p style=\"margin-bottom: 10px; padding: 0px; font-family: Quicksand, sans-serif; line-height: 21px; color: rgb(37, 42, 43); font-size: 13px !important;\"><span data-sheets-value=\"{&quot;1&quot;:2,&quot;2&quot;:&quot;- Chất liệu da tổng hợp bền, đẹp.\\n- Quai ngang thiết kế đơn giản, nữ tính.\\n- Quai hậu dán, tiện dụng.&quot;}\" data-sheets-userformat=\"{&quot;2&quot;:929,&quot;3&quot;:[null,0],&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:3}]},&quot;10&quot;:1,&quot;11&quot;:4,&quot;12&quot;:0}\" data-mce-style=\"font-size: 12pt; color: #000000;\" style=\"margin: 0px; padding: 0px; font-size: 12pt; color: rgb(0, 0, 0);\">Quai ngang thiết kế đơn giản, nữ tính</span></p><p style=\"margin-bottom: 10px; padding: 0px; font-family: Quicksand, sans-serif; line-height: 21px; color: rgb(37, 42, 43); font-size: 13px !important;\"><span data-sheets-value=\"{&quot;1&quot;:2,&quot;2&quot;:&quot;- Chất liệu da tổng hợp bền, đẹp.\\n- Quai ngang thiết kế đơn giản, nữ tính.\\n- Quai hậu dán, tiện dụng.&quot;}\" data-sheets-userformat=\"{&quot;2&quot;:929,&quot;3&quot;:[null,0],&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:3}]},&quot;10&quot;:1,&quot;11&quot;:4,&quot;12&quot;:0}\" data-mce-style=\"font-size: 12pt; color: #000000;\" style=\"margin: 0px; padding: 0px; font-size: 12pt; color: rgb(0, 0, 0);\">Quai hậu dán, tiện dụng</span></p>', 'Giày xăng đan', 'Da tổng hợp', 'Giày-xăng-đan-gót-vuông-5cm-quai-ngang-1', NULL, '2020-09-19 19:53:26', NULL),
(110, 'DH025421', 'Giày xăng đan gót vuông 5cm quai ngang 2', 0, 'IMG84919492.webp;', 'IMG142348278.webp;', NULL, 'Giày xăng đan', 'Da tổng hợp', 'Giày-xăng-đan-gót-vuông-5cm-quai-ngang-2', NULL, '2020-09-19 19:54:21', NULL),
(111, 'DH025451', 'Giày xăng đan gót vuông 5cm quai ngang 3', 0, 'IMG520212698.webp;', 'IMG353307352.webp;', NULL, 'Giày xăng đan', 'Da tổng hợp', 'Giày-xăng-đan-gót-vuông-5cm-quai-ngang-3', NULL, '2020-09-19 19:54:51', NULL),
(112, 'DH025512', 'Giày xăng đan gót vuông 5cm quai ngang 4', 0, 'IMG9952372.webp;', 'IMG970964599.webp;', NULL, 'Giày xăng đan', 'Da tổng hợp', 'Giày-xăng-đan-gót-vuông-5cm-quai-ngang-4', NULL, '2020-09-19 19:55:12', NULL),
(113, 'DH025555', 'Giày xăng đan gót vuông 5cm quai ngang 5', 0, 'IMG271112523.webp;', 'IMG724369320.webp;', NULL, 'Giày xăng đan', 'Da tổng hợp', 'Giày-xăng-đan-gót-vuông-5cm-quai-ngang-5', NULL, '2020-09-19 19:55:55', NULL),
(114, 'DH025617', 'Giày xăng đan gót vuông 5cm quai ngang 6', 0, 'IMG548684853.webp;', 'IMG28108766.webp;', NULL, 'Giày xăng đan', 'Da tổng hợp', 'Giày-xăng-đan-gót-vuông-5cm-quai-ngang-6', NULL, '2020-09-19 19:56:17', NULL),
(115, 'DH025639', 'Giày xăng đan gót vuông 5cm quai ngang 7', 0, 'IMG477321329.webp;', 'IMG477884825.webp;', NULL, 'Giày xăng đan', 'Da tổng hợp', 'Giày-xăng-đan-gót-vuông-5cm-quai-ngang-7', NULL, '2020-09-19 19:56:39', NULL),
(116, 'DH025705', 'Giày xăng đan gót vuông 5cm quai ngang 8', 0, 'IMG985471436.webp;', 'IMG247187576.webp;', NULL, 'Giày xăng đan', 'Da tổng hợp', 'Giày-xăng-đan-gót-vuông-5cm-quai-ngang-8', NULL, '2020-09-19 19:57:05', NULL),
(117, 'DH025727', 'Giày xăng đan gót vuông 5cm quai ngang 9', 0, 'IMG510624191.webp;', 'IMG943563415.webp;', NULL, 'Giày xăng đan', 'Da tổng hợp', 'Giày-xăng-đan-gót-vuông-5cm-quai-ngang-9', NULL, '2020-09-19 19:57:27', NULL),
(118, 'DH025757', 'Giày xăng đan gót vuông 5cm quai ngang 10', 0, 'IMG134853877.webp;', 'IMG3837127.webp;', NULL, 'Giày xăng đan', 'Da tổng hợp', 'Giày-xăng-đan-gót-vuông-5cm-quai-ngang-10', NULL, '2020-09-19 19:57:57', NULL),
(129, 'DH043817', 'Túi cỡ lớn hoạ tiết 3D TXL025', 0, 'IMG982923594.webp;', 'IMG4663413.webp;', NULL, 'Túi xách thời trang', 'Da tổng hợp', 'Túi-cỡ-lớn-hoạ-tiết-3D-TXL025', NULL, '2020-09-19 21:38:17', NULL),
(130, 'DH043853', 'Túi cỡ lớn hoạ tiết 3D TXL025 1', 0, 'IMG125800230.webp;', 'IMG66034993.webp;', '<p><br></p>', 'Túi xách thời trang', 'Da tổng hợp', 'Túi-cỡ-lớn-hoạ-tiết-3D-TXL025-1', NULL, '2020-09-19 21:38:53', NULL),
(131, 'DH043928', 'Túi cỡ lớn hoạ tiết 3D TXL025 3', 0, 'IMG359372324.webp;', 'IMG44319109.webp;', NULL, 'Túi xách thời trang', 'Da tổng hợp', 'Túi-cỡ-lớn-hoạ-tiết-3D-TXL025-3', NULL, '2020-09-19 21:39:28', NULL),
(132, 'DH044001', 'Túi cỡ lớn hoạ tiết 3D TXL025 4', 0, 'IMG756964257.webp;', 'IMG937317566.webp;', NULL, 'Túi xách thời trang', 'Da tổng hợp', 'Túi-cỡ-lớn-hoạ-tiết-3D-TXL025-4', NULL, '2020-09-19 21:40:01', NULL),
(133, 'DH044033', 'Túi cỡ lớn hoạ tiết 3D TXL025 5', 0, 'IMG739961664.webp;', 'IMG269777523.webp;', NULL, 'Túi xách thời trang', 'Da tổng hợp', 'Túi-cỡ-lớn-hoạ-tiết-3D-TXL025-5', NULL, '2020-09-19 21:40:33', NULL),
(134, 'DH044103', 'Túi cỡ lớn hoạ tiết 3D TXL025 6', 0, 'IMG20827692.webp;', 'IMG886632469.webp;', NULL, 'Túi xách thời trang', 'Da tổng hợp', 'Túi-cỡ-lớn-hoạ-tiết-3D-TXL025-6', NULL, '2020-09-19 21:41:03', NULL),
(135, 'DH044131', 'Túi cỡ lớn hoạ tiết 3D TXL025 7', 0, 'IMG714343577.webp;', 'IMG132202810.webp;', NULL, 'Túi xách thời trang', 'Da tổng hợp', 'Túi-cỡ-lớn-hoạ-tiết-3D-TXL025-7', NULL, '2020-09-19 21:41:31', NULL),
(136, 'DH044219', 'Túi cỡ lớn hoạ tiết 3D TXL025 8', 0, 'IMG419412842.webp;', 'IMG96736682.webp;', NULL, 'Túi xách thời trang', 'Da tổng hợp', 'Túi-cỡ-lớn-hoạ-tiết-3D-TXL025-8', NULL, '2020-09-19 21:42:19', NULL),
(137, 'DH044245', 'Túi cỡ lớn hoạ tiết 3D TXL025 9', 0, 'IMG44660187.webp;', 'IMG920369205.webp;', NULL, 'Túi xách thời trang', 'Da tổng hợp', 'Túi-cỡ-lớn-hoạ-tiết-3D-TXL025-9', NULL, '2020-09-19 21:42:45', NULL),
(138, 'DH044323', 'Túi cỡ lớn hoạ tiết 3D TXL025 10', 0, 'IMG28762374.webp;', 'IMG770991354.webp;', '<p style=\"margin-bottom: 10px; padding: 0px; font-family: Quicksand, sans-serif; line-height: 21px; color: rgb(37, 42, 43); font-size: 13px !important;\"><span data-sheets-value=\"{&quot;1&quot;:2,&quot;2&quot;:&quot;HOẠ TIẾT NỔI BẬT\\n\\n- Túi xách cỡ lớn với hoạ tiết dập nổi 3D lạ mắt, nổi bật.\\n- Chất liệu da tổng hợp sang trọng, dễ vệ sinh.\\n- Bên trong nhiều ngăn đa dụng, với dây đeo rời linh hoạt.&quot;}\" data-sheets-userformat=\"{&quot;2&quot;:13249,&quot;3&quot;:[null,0],&quot;9&quot;:0,&quot;10&quot;:2,&quot;11&quot;:4,&quot;12&quot;:0,&quot;15&quot;:&quot;Times New Roman&quot;,&quot;16&quot;:12}\" data-mce-style=\"font-size: 12pt; color: #000000;\" style=\"margin: 0px; padding: 0px; font-size: 12pt; color: rgb(0, 0, 0);\">Túi xách cỡ lớn với hoạ tiết dập nổi 3D lạ mắt, nổi bật</span></p><p style=\"margin-bottom: 10px; padding: 0px; font-family: Quicksand, sans-serif; line-height: 21px; color: rgb(37, 42, 43); font-size: 13px !important;\"><span data-sheets-value=\"{&quot;1&quot;:2,&quot;2&quot;:&quot;HOẠ TIẾT NỔI BẬT\\n\\n- Túi xách cỡ lớn với hoạ tiết dập nổi 3D lạ mắt, nổi bật.\\n- Chất liệu da tổng hợp sang trọng, dễ vệ sinh.\\n- Bên trong nhiều ngăn đa dụng, với dây đeo rời linh hoạt.&quot;}\" data-sheets-userformat=\"{&quot;2&quot;:13249,&quot;3&quot;:[null,0],&quot;9&quot;:0,&quot;10&quot;:2,&quot;11&quot;:4,&quot;12&quot;:0,&quot;15&quot;:&quot;Times New Roman&quot;,&quot;16&quot;:12}\" data-mce-style=\"font-size: 12pt; color: #000000;\" style=\"margin: 0px; padding: 0px; font-size: 12pt; color: rgb(0, 0, 0);\">Chất liệu da tổng hợp sang trọng, dễ vệ sinh</span></p><p style=\"margin-bottom: 10px; padding: 0px; font-family: Quicksand, sans-serif; line-height: 21px; color: rgb(37, 42, 43); font-size: 13px !important;\"><span data-sheets-value=\"{&quot;1&quot;:2,&quot;2&quot;:&quot;HOẠ TIẾT NỔI BẬT\\n\\n- Túi xách cỡ lớn với hoạ tiết dập nổi 3D lạ mắt, nổi bật.\\n- Chất liệu da tổng hợp sang trọng, dễ vệ sinh.\\n- Bên trong nhiều ngăn đa dụng, với dây đeo rời linh hoạt.&quot;}\" data-sheets-userformat=\"{&quot;2&quot;:13249,&quot;3&quot;:[null,0],&quot;9&quot;:0,&quot;10&quot;:2,&quot;11&quot;:4,&quot;12&quot;:0,&quot;15&quot;:&quot;Times New Roman&quot;,&quot;16&quot;:12}\" data-mce-style=\"font-size: 12pt; color: #000000;\" style=\"margin: 0px; padding: 0px; font-size: 12pt; color: rgb(0, 0, 0);\">Bên trong nhiều ngăn đa dụng, với dây đeo rời linh hoạt</span></p>', 'Túi xách thời trang', 'Da tổng hợp', 'Túi-cỡ-lớn-hoạ-tiết-3D-TXL025-10', NULL, '2020-09-19 21:43:23', NULL);

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
(62, 109, 16, NULL, '2020-09-19 19:53:26', '2020-09-19 19:53:26'),
(63, 109, 17, NULL, '2020-09-19 19:53:26', '2020-09-19 19:53:26'),
(64, 110, 16, NULL, '2020-09-19 19:54:21', '2020-09-19 19:54:21'),
(65, 110, 17, NULL, '2020-09-19 19:54:21', '2020-09-19 19:54:21'),
(66, 110, 18, NULL, '2020-09-19 19:54:21', '2020-09-19 19:54:21'),
(67, 111, 16, NULL, '2020-09-19 19:54:51', '2020-09-19 19:54:51'),
(68, 111, 17, NULL, '2020-09-19 19:54:51', '2020-09-19 19:54:51'),
(69, 111, 18, NULL, '2020-09-19 19:54:51', '2020-09-19 19:54:51'),
(70, 112, 16, NULL, '2020-09-19 19:55:12', '2020-09-19 19:55:12'),
(71, 112, 17, NULL, '2020-09-19 19:55:12', '2020-09-19 19:55:12'),
(72, 112, 18, NULL, '2020-09-19 19:55:12', '2020-09-19 19:55:12'),
(73, 113, 16, NULL, '2020-09-19 19:55:55', '2020-09-19 19:55:55'),
(74, 113, 17, NULL, '2020-09-19 19:55:55', '2020-09-19 19:55:55'),
(75, 113, 18, NULL, '2020-09-19 19:55:55', '2020-09-19 19:55:55'),
(76, 114, 16, NULL, '2020-09-19 19:56:17', '2020-09-19 19:56:17'),
(77, 114, 18, NULL, '2020-09-19 19:56:17', '2020-09-19 19:56:17'),
(78, 115, 16, NULL, '2020-09-19 19:56:40', '2020-09-19 19:56:40'),
(79, 116, 16, NULL, '2020-09-19 19:57:05', '2020-09-19 19:57:05'),
(80, 116, 17, NULL, '2020-09-19 19:57:05', '2020-09-19 19:57:05'),
(81, 116, 18, NULL, '2020-09-19 19:57:05', '2020-09-19 19:57:05'),
(82, 117, 16, NULL, '2020-09-19 19:57:27', '2020-09-19 19:57:27'),
(83, 117, 18, NULL, '2020-09-19 19:57:27', '2020-09-19 19:57:27'),
(84, 118, 16, NULL, '2020-09-19 19:57:57', '2020-09-19 19:57:57'),
(85, 118, 17, NULL, '2020-09-19 19:57:57', '2020-09-19 19:57:57'),
(88, 129, 19, NULL, '2020-09-19 21:38:17', '2020-09-19 21:38:17'),
(89, 129, 21, NULL, '2020-09-19 21:38:17', '2020-09-19 21:38:17'),
(90, 130, 19, NULL, '2020-09-19 21:38:53', '2020-09-19 21:38:53'),
(91, 130, 20, NULL, '2020-09-19 21:38:53', '2020-09-19 21:38:53'),
(92, 130, 21, NULL, '2020-09-19 21:38:53', '2020-09-19 21:38:53'),
(93, 131, 19, NULL, '2020-09-19 21:39:28', '2020-09-19 21:39:28'),
(94, 131, 20, NULL, '2020-09-19 21:39:28', '2020-09-19 21:39:28'),
(95, 131, 21, NULL, '2020-09-19 21:39:28', '2020-09-19 21:39:28'),
(96, 132, 19, NULL, '2020-09-19 21:40:01', '2020-09-19 21:40:01'),
(97, 132, 20, NULL, '2020-09-19 21:40:01', '2020-09-19 21:40:01'),
(98, 132, 21, NULL, '2020-09-19 21:40:01', '2020-09-19 21:40:01'),
(99, 133, 19, NULL, '2020-09-19 21:40:33', '2020-09-19 21:40:33'),
(100, 133, 20, NULL, '2020-09-19 21:40:33', '2020-09-19 21:40:33'),
(101, 134, 19, NULL, '2020-09-19 21:41:03', '2020-09-19 21:41:03'),
(102, 135, 19, NULL, '2020-09-19 21:41:31', '2020-09-19 21:41:31'),
(103, 135, 20, NULL, '2020-09-19 21:41:31', '2020-09-19 21:41:31'),
(104, 136, 19, NULL, '2020-09-19 21:42:19', '2020-09-19 21:42:19'),
(105, 136, 21, NULL, '2020-09-19 21:42:19', '2020-09-19 21:42:19'),
(106, 137, 19, NULL, '2020-09-19 21:42:45', '2020-09-19 21:42:45'),
(107, 137, 21, NULL, '2020-09-19 21:42:45', '2020-09-19 21:42:45'),
(108, 138, 19, NULL, '2020-09-19 21:43:23', '2020-09-19 21:43:23'),
(109, 138, 20, NULL, '2020-09-19 21:43:23', '2020-09-19 21:43:23'),
(110, 138, 21, NULL, '2020-09-19 21:43:23', '2020-09-19 21:43:23');

-- --------------------------------------------------------

--
-- Table structure for table `product_variants`
--

CREATE TABLE `product_variants` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_product` int(11) DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price_market` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `price` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_variants`
--

INSERT INTO `product_variants` (`id`, `id_product`, `color`, `size`, `image`, `price_market`, `price`, `deleted_at`, `created_at`, `updated_at`) VALUES
(445, 109, 'Đen Xám', '35', 'IMG166365237.webp', '0', '0', NULL, '2020-09-19 19:53:26', NULL),
(446, 109, 'Đen Xám', '36', 'IMG166365237.webp', '0', '0', NULL, '2020-09-19 19:53:26', NULL),
(447, 109, 'Đen Xám', '37', 'IMG166365237.webp', '0', '0', NULL, '2020-09-19 19:53:26', NULL),
(448, 109, 'Đen Xám', '38', 'IMG166365237.webp', '0', '0', NULL, '2020-09-19 19:53:26', NULL),
(449, 109, 'Đen Xám', '39', 'IMG166365237.webp', '0', '0', NULL, '2020-09-19 19:53:26', NULL),
(450, 109, 'Đen', '35', 'IMG272364105.webp', '0', '0', NULL, '2020-09-19 19:53:26', NULL),
(451, 109, 'Đen', '36', 'IMG272364105.webp', '0', '0', NULL, '2020-09-19 19:53:26', NULL),
(452, 109, 'Đen', '37', 'IMG272364105.webp', '0', '0', NULL, '2020-09-19 19:53:26', NULL),
(453, 109, 'Đen', '38', 'IMG272364105.webp', '0', '0', NULL, '2020-09-19 19:53:26', NULL),
(454, 109, 'Đen', '39', 'IMG272364105.webp', '0', '0', NULL, '2020-09-19 19:53:26', NULL),
(455, 109, 'Đen Đô', '35', 'IMG992779371.webp', '0', '0', NULL, '2020-09-19 19:53:26', NULL),
(456, 109, 'Đen Đô', '36', 'IMG992779371.webp', '0', '0', NULL, '2020-09-19 19:53:26', NULL),
(457, 109, 'Đen Đô', '37', 'IMG992779371.webp', '0', '0', NULL, '2020-09-19 19:53:26', NULL),
(458, 109, 'Đen Đô', '38', 'IMG992779371.webp', '0', '0', NULL, '2020-09-19 19:53:26', NULL),
(459, 109, 'Đen Đô', '39', 'IMG992779371.webp', '0', '0', NULL, '2020-09-19 19:53:26', NULL),
(460, 110, 'Đỏ Đô', '35', 'IMG984336427.webp', '0', '0', NULL, '2020-09-19 19:54:21', NULL),
(461, 110, 'Đỏ Đô', '36', 'IMG984336427.webp', '0', '0', NULL, '2020-09-19 19:54:21', NULL),
(462, 110, 'Đỏ Đô', '37', 'IMG984336427.webp', '0', '0', NULL, '2020-09-19 19:54:21', NULL),
(463, 110, 'Đồng', '35', 'IMG81682197.webp', '0', '0', NULL, '2020-09-19 19:54:21', NULL),
(464, 110, 'Đồng', '36', 'IMG81682197.webp', '0', '0', NULL, '2020-09-19 19:54:21', NULL),
(465, 110, 'Đồng', '37', 'IMG81682197.webp', '0', '0', NULL, '2020-09-19 19:54:21', NULL),
(466, 110, 'Kem', '35', 'IMG909133467.webp', '0', '0', NULL, '2020-09-19 19:54:21', NULL),
(467, 110, 'Kem', '36', 'IMG909133467.webp', '0', '0', NULL, '2020-09-19 19:54:21', NULL),
(468, 110, 'Kem', '37', 'IMG909133467.webp', '0', '0', NULL, '2020-09-19 19:54:21', NULL),
(469, 111, 'Kem', '35', 'IMG909133467.webp', '0', '0', NULL, '2020-09-19 19:54:51', NULL),
(470, 111, 'Kem', '36', 'IMG909133467.webp', '0', '0', NULL, '2020-09-19 19:54:51', NULL),
(471, 111, 'Kem', '38', 'IMG909133467.webp', '0', '0', NULL, '2020-09-19 19:54:51', NULL),
(472, 111, 'Kem', '39', 'IMG909133467.webp', '0', '0', NULL, '2020-09-19 19:54:51', NULL),
(473, 111, 'Sọc Trắng Đen', '35', 'IMG205913509.webp', '0', '0', NULL, '2020-09-19 19:54:51', NULL),
(474, 111, 'Sọc Trắng Đen', '36', 'IMG205913509.webp', '0', '0', NULL, '2020-09-19 19:54:51', NULL),
(475, 111, 'Sọc Trắng Đen', '38', 'IMG205913509.webp', '0', '0', NULL, '2020-09-19 19:54:51', NULL),
(476, 111, 'Sọc Trắng Đen', '39', 'IMG205913509.webp', '0', '0', NULL, '2020-09-19 19:54:51', NULL),
(477, 111, 'Trắng', '35', 'IMG227338585.webp', '0', '0', NULL, '2020-09-19 19:54:51', NULL),
(478, 111, 'Trắng', '36', 'IMG227338585.webp', '0', '0', NULL, '2020-09-19 19:54:51', NULL),
(479, 111, 'Trắng', '38', 'IMG227338585.webp', '0', '0', NULL, '2020-09-19 19:54:51', NULL),
(480, 111, 'Trắng', '39', 'IMG227338585.webp', '0', '0', NULL, '2020-09-19 19:54:51', NULL),
(481, 112, 'Đen Đô', '36', 'IMG992779371.webp', '0', '0', NULL, '2020-09-19 19:55:12', NULL),
(482, 112, 'Đen Đô', '38', 'IMG992779371.webp', '0', '0', NULL, '2020-09-19 19:55:12', NULL),
(483, 112, 'Đen Đô', '39', 'IMG992779371.webp', '0', '0', NULL, '2020-09-19 19:55:12', NULL),
(484, 112, 'Đỏ Đô', '36', 'IMG984336427.webp', '0', '0', NULL, '2020-09-19 19:55:12', NULL),
(485, 112, 'Đỏ Đô', '38', 'IMG984336427.webp', '0', '0', NULL, '2020-09-19 19:55:12', NULL),
(486, 112, 'Đỏ Đô', '39', 'IMG984336427.webp', '0', '0', NULL, '2020-09-19 19:55:12', NULL),
(487, 112, 'Đồng', '36', 'IMG81682197.webp', '0', '0', NULL, '2020-09-19 19:55:12', NULL),
(488, 112, 'Đồng', '38', 'IMG81682197.webp', '0', '0', NULL, '2020-09-19 19:55:12', NULL),
(489, 112, 'Đồng', '39', 'IMG81682197.webp', '0', '0', NULL, '2020-09-19 19:55:12', NULL),
(490, 113, 'Đen Đô', '36', 'IMG992779371.webp', '0', '0', NULL, '2020-09-19 19:55:55', NULL),
(491, 113, 'Đen Đô', '38', 'IMG992779371.webp', '0', '0', NULL, '2020-09-19 19:55:55', NULL),
(492, 113, 'Đen Đô', '39', 'IMG992779371.webp', '0', '0', NULL, '2020-09-19 19:55:55', NULL),
(493, 113, 'Đỏ Đô', '36', 'IMG984336427.webp', '0', '0', NULL, '2020-09-19 19:55:55', NULL),
(494, 113, 'Đỏ Đô', '38', 'IMG984336427.webp', '0', '0', NULL, '2020-09-19 19:55:55', NULL),
(495, 113, 'Đỏ Đô', '39', 'IMG984336427.webp', '0', '0', NULL, '2020-09-19 19:55:55', NULL),
(496, 113, 'Đồng', '36', 'IMG81682197.webp', '0', '0', NULL, '2020-09-19 19:55:55', NULL),
(497, 113, 'Đồng', '38', 'IMG81682197.webp', '0', '0', NULL, '2020-09-19 19:55:55', NULL),
(498, 113, 'Đồng', '39', 'IMG81682197.webp', '0', '0', NULL, '2020-09-19 19:55:55', NULL),
(499, 114, 'Đỏ Đô', '36', 'IMG984336427.webp', '0', '0', NULL, '2020-09-19 19:56:17', NULL),
(500, 114, 'Đỏ Đô', '38', 'IMG984336427.webp', '0', '0', NULL, '2020-09-19 19:56:17', NULL),
(501, 114, 'Đỏ Đô', '39', 'IMG984336427.webp', '0', '0', NULL, '2020-09-19 19:56:17', NULL),
(502, 114, 'Sọc Trắng Đen', '36', 'IMG205913509.webp', '0', '0', NULL, '2020-09-19 19:56:17', NULL),
(503, 114, 'Sọc Trắng Đen', '38', 'IMG205913509.webp', '0', '0', NULL, '2020-09-19 19:56:17', NULL),
(504, 114, 'Sọc Trắng Đen', '39', 'IMG205913509.webp', '0', '0', NULL, '2020-09-19 19:56:17', NULL),
(505, 114, 'Trắng', '36', 'IMG227338585.webp', '0', '0', NULL, '2020-09-19 19:56:17', NULL),
(506, 114, 'Trắng', '38', 'IMG227338585.webp', '0', '0', NULL, '2020-09-19 19:56:17', NULL),
(507, 114, 'Trắng', '39', 'IMG227338585.webp', '0', '0', NULL, '2020-09-19 19:56:17', NULL),
(508, 114, 'Vàng', '36', 'IMG416895716.webp', '0', '0', NULL, '2020-09-19 19:56:17', NULL),
(509, 114, 'Vàng', '38', 'IMG416895716.webp', '0', '0', NULL, '2020-09-19 19:56:17', NULL),
(510, 114, 'Vàng', '39', 'IMG416895716.webp', '0', '0', NULL, '2020-09-19 19:56:17', NULL),
(511, 115, 'Kem', '38', 'IMG909133467.webp', '0', '0', NULL, '2020-09-19 19:56:40', NULL),
(512, 115, 'Kem', '36', 'IMG909133467.webp', '0', '0', NULL, '2020-09-19 19:56:40', NULL),
(513, 115, 'Trắng', '38', 'IMG227338585.webp', '0', '0', NULL, '2020-09-19 19:56:40', NULL),
(514, 115, 'Trắng', '36', 'IMG227338585.webp', '0', '0', NULL, '2020-09-19 19:56:40', NULL),
(515, 115, 'Vàng', '38', 'IMG416895716.webp', '0', '0', NULL, '2020-09-19 19:56:40', NULL),
(516, 115, 'Vàng', '36', 'IMG416895716.webp', '0', '0', NULL, '2020-09-19 19:56:40', NULL),
(517, 115, 'Xanh Nhạt', '38', 'IMG96403804.webp', '0', '0', NULL, '2020-09-19 19:56:40', NULL),
(518, 115, 'Xanh Nhạt', '36', 'IMG96403804.webp', '0', '0', NULL, '2020-09-19 19:56:40', NULL),
(519, 116, 'Đen Đô', '36', 'IMG992779371.webp', '0', '0', NULL, '2020-09-19 19:57:05', NULL),
(520, 116, 'Đen Đô', '39', 'IMG992779371.webp', '0', '0', NULL, '2020-09-19 19:57:05', NULL),
(521, 116, 'Đỏ Đô', '36', 'IMG984336427.webp', '0', '0', NULL, '2020-09-19 19:57:05', NULL),
(522, 116, 'Đỏ Đô', '39', 'IMG984336427.webp', '0', '0', NULL, '2020-09-19 19:57:05', NULL),
(523, 116, 'Đồng', '36', 'IMG81682197.webp', '0', '0', NULL, '2020-09-19 19:57:05', NULL),
(524, 116, 'Đồng', '39', 'IMG81682197.webp', '0', '0', NULL, '2020-09-19 19:57:05', NULL),
(525, 117, 'Đen Xám', '37', 'IMG166365237.webp', '0', '0', NULL, '2020-09-19 19:57:27', NULL),
(526, 117, 'Đen Xám', '39', 'IMG166365237.webp', '0', '0', NULL, '2020-09-19 19:57:27', NULL),
(527, 117, 'Đen Đô', '37', 'IMG992779371.webp', '0', '0', NULL, '2020-09-19 19:57:27', NULL),
(528, 117, 'Đen Đô', '39', 'IMG992779371.webp', '0', '0', NULL, '2020-09-19 19:57:27', NULL),
(529, 118, 'Đen Đô', '36', 'IMG992779371.webp', '0', '0', NULL, '2020-09-19 19:57:57', NULL),
(530, 118, 'Đen Đô', '38', 'IMG992779371.webp', '0', '0', NULL, '2020-09-19 19:57:57', NULL),
(531, 118, 'Đen Đô', '39', 'IMG992779371.webp', '0', '0', NULL, '2020-09-19 19:57:57', NULL),
(532, 118, 'Đen Đô', '35', 'IMG992779371.webp', '0', '0', NULL, '2020-09-19 19:57:57', NULL),
(533, 118, 'Đen Đô', '40', 'IMG992779371.webp', '0', '0', NULL, '2020-09-19 19:57:57', NULL),
(534, 118, 'Đỏ Đô', '36', 'IMG984336427.webp', '0', '0', NULL, '2020-09-19 19:57:57', NULL),
(535, 118, 'Đỏ Đô', '38', 'IMG984336427.webp', '0', '0', NULL, '2020-09-19 19:57:57', NULL),
(536, 118, 'Đỏ Đô', '39', 'IMG984336427.webp', '0', '0', NULL, '2020-09-19 19:57:57', NULL),
(537, 118, 'Đỏ Đô', '35', 'IMG984336427.webp', '0', '0', NULL, '2020-09-19 19:57:57', NULL),
(538, 118, 'Đỏ Đô', '40', 'IMG984336427.webp', '0', '0', NULL, '2020-09-19 19:57:57', NULL),
(539, 118, 'Sọc Trắng Đen', '36', 'IMG205913509.webp', '0', '0', NULL, '2020-09-19 19:57:57', NULL),
(540, 118, 'Sọc Trắng Đen', '38', 'IMG205913509.webp', '0', '0', NULL, '2020-09-19 19:57:57', NULL),
(541, 118, 'Sọc Trắng Đen', '39', 'IMG205913509.webp', '0', '0', NULL, '2020-09-19 19:57:57', NULL),
(542, 118, 'Sọc Trắng Đen', '35', 'IMG205913509.webp', '0', '0', NULL, '2020-09-19 19:57:57', NULL),
(543, 118, 'Sọc Trắng Đen', '40', 'IMG205913509.webp', '0', '0', NULL, '2020-09-19 19:57:57', NULL),
(548, 129, 'Đen Đô', '20x30', 'IMG992779371.webp', '0', '0', NULL, '2020-09-19 21:38:17', NULL),
(549, 129, 'Đen Đô', '30x40', 'IMG992779371.webp', '0', '0', NULL, '2020-09-19 21:38:17', NULL),
(550, 129, 'Đỏ Đô', '20x30', 'IMG984336427.webp', '0', '0', NULL, '2020-09-19 21:38:17', NULL),
(551, 129, 'Đỏ Đô', '30x40', 'IMG984336427.webp', '0', '0', NULL, '2020-09-19 21:38:17', NULL),
(552, 129, 'Đồng', '20x30', 'IMG81682197.webp', '0', '0', NULL, '2020-09-19 21:38:17', NULL),
(553, 129, 'Đồng', '30x40', 'IMG81682197.webp', '0', '0', NULL, '2020-09-19 21:38:17', NULL),
(554, 130, 'Vàng', '20x30', 'IMG416895716.webp', '0', '0', NULL, '2020-09-19 21:38:53', NULL),
(555, 130, 'Vàng', '30x40', 'IMG416895716.webp', '0', '0', NULL, '2020-09-19 21:38:53', NULL),
(556, 130, 'Vàng Đô', '20x30', 'IMG948767612.jpg', '0', '0', NULL, '2020-09-19 21:38:53', NULL),
(557, 130, 'Vàng Đô', '30x40', 'IMG948767612.jpg', '0', '0', NULL, '2020-09-19 21:38:53', NULL),
(558, 130, 'Xanh Nhạt', '20x30', 'IMG96403804.webp', '0', '0', NULL, '2020-09-19 21:38:53', NULL),
(559, 130, 'Xanh Nhạt', '30x40', 'IMG96403804.webp', '0', '0', NULL, '2020-09-19 21:38:53', NULL),
(560, 131, 'Đen Đô', '30x40', 'IMG992779371.webp', '0', '0', NULL, '2020-09-19 21:39:28', NULL),
(561, 131, 'Đen Đô', '20x30', 'IMG992779371.webp', '0', '0', NULL, '2020-09-19 21:39:28', NULL),
(562, 131, 'Đỏ Đô', '30x40', 'IMG984336427.webp', '0', '0', NULL, '2020-09-19 21:39:28', NULL),
(563, 131, 'Đỏ Đô', '20x30', 'IMG984336427.webp', '0', '0', NULL, '2020-09-19 21:39:28', NULL),
(564, 131, 'Đồng', '30x40', 'IMG81682197.webp', '0', '0', NULL, '2020-09-19 21:39:28', NULL),
(565, 131, 'Đồng', '20x30', 'IMG81682197.webp', '0', '0', NULL, '2020-09-19 21:39:28', NULL),
(566, 132, 'Sọc Trắng Đen', '30x40', 'IMG205913509.webp', '0', '0', NULL, '2020-09-19 21:40:01', NULL),
(567, 132, 'Trắng', '30x40', 'IMG227338585.webp', '0', '0', NULL, '2020-09-19 21:40:01', NULL),
(568, 132, 'Vàng', '30x40', 'IMG416895716.webp', '0', '0', NULL, '2020-09-19 21:40:01', NULL),
(569, 133, 'Đen Đô', '30x40', 'IMG992779371.webp', '0', '0', NULL, '2020-09-19 21:40:33', NULL),
(570, 133, 'Đen Đô', '20x30', 'IMG992779371.webp', '0', '0', NULL, '2020-09-19 21:40:33', NULL),
(571, 133, 'Đỏ Đô', '30x40', 'IMG984336427.webp', '0', '0', NULL, '2020-09-19 21:40:33', NULL),
(572, 133, 'Đỏ Đô', '20x30', 'IMG984336427.webp', '0', '0', NULL, '2020-09-19 21:40:33', NULL),
(573, 133, 'Đồng', '30x40', 'IMG81682197.webp', '0', '0', NULL, '2020-09-19 21:40:33', NULL),
(574, 133, 'Đồng', '20x30', 'IMG81682197.webp', '0', '0', NULL, '2020-09-19 21:40:33', NULL),
(575, 134, 'Đen Đô', '30x40', 'IMG992779371.webp', '0', '0', NULL, '2020-09-19 21:41:03', NULL),
(576, 134, 'Đen Đô', '20x30', 'IMG992779371.webp', '0', '0', NULL, '2020-09-19 21:41:03', NULL),
(577, 134, 'Đồng', '30x40', 'IMG81682197.webp', '0', '0', NULL, '2020-09-19 21:41:03', NULL),
(578, 134, 'Đồng', '20x30', 'IMG81682197.webp', '0', '0', NULL, '2020-09-19 21:41:03', NULL),
(579, 134, 'Vàng Đô', '30x40', 'IMG948767612.jpg', '0', '0', NULL, '2020-09-19 21:41:03', NULL),
(580, 134, 'Vàng Đô', '20x30', 'IMG948767612.jpg', '0', '0', NULL, '2020-09-19 21:41:03', NULL),
(581, 134, 'Xanh Nhạt', '30x40', 'IMG96403804.webp', '0', '0', NULL, '2020-09-19 21:41:03', NULL),
(582, 134, 'Xanh Nhạt', '20x30', 'IMG96403804.webp', '0', '0', NULL, '2020-09-19 21:41:03', NULL),
(583, 135, 'Vàng Đô', '30x40', 'IMG948767612.jpg', '0', '0', NULL, '2020-09-19 21:41:31', NULL),
(584, 135, 'Vàng Đô', '20x30', 'IMG948767612.jpg', '0', '0', NULL, '2020-09-19 21:41:31', NULL),
(585, 135, 'Xanh Nhạt', '30x40', 'IMG96403804.webp', '0', '0', NULL, '2020-09-19 21:41:31', NULL),
(586, 135, 'Xanh Nhạt', '20x30', 'IMG96403804.webp', '0', '0', NULL, '2020-09-19 21:41:31', NULL),
(587, 135, 'Xanh', '30x40', 'IMG669663976.webp', '0', '0', NULL, '2020-09-19 21:41:31', NULL),
(588, 135, 'Xanh', '20x30', 'IMG669663976.webp', '0', '0', NULL, '2020-09-19 21:41:31', NULL),
(589, 136, 'Đen Đô', '30x40', 'IMG992779371.webp', '0', '0', NULL, '2020-09-19 21:42:19', NULL),
(590, 136, 'Đen Đô', '20x30', 'IMG992779371.webp', '0', '0', NULL, '2020-09-19 21:42:19', NULL),
(591, 136, 'Đỏ Đô', '30x40', 'IMG984336427.webp', '0', '0', NULL, '2020-09-19 21:42:19', NULL),
(592, 136, 'Đỏ Đô', '20x30', 'IMG984336427.webp', '0', '0', NULL, '2020-09-19 21:42:19', NULL),
(593, 136, 'Đồng', '30x40', 'IMG81682197.webp', '0', '0', NULL, '2020-09-19 21:42:19', NULL),
(594, 136, 'Đồng', '20x30', 'IMG81682197.webp', '0', '0', NULL, '2020-09-19 21:42:19', NULL),
(595, 137, 'Đỏ Đô', '30x40', 'IMG984336427.webp', '0', '0', NULL, '2020-09-19 21:42:45', NULL),
(596, 137, 'Đỏ Đô', '20x30', 'IMG984336427.webp', '0', '0', NULL, '2020-09-19 21:42:45', NULL),
(597, 137, 'Vàng Đô', '30x40', 'IMG948767612.jpg', '0', '0', NULL, '2020-09-19 21:42:45', NULL),
(598, 137, 'Vàng Đô', '20x30', 'IMG948767612.jpg', '0', '0', NULL, '2020-09-19 21:42:45', NULL),
(599, 137, 'Xanh', '30x40', 'IMG669663976.webp', '0', '0', NULL, '2020-09-19 21:42:45', NULL),
(600, 137, 'Xanh', '20x30', 'IMG669663976.webp', '0', '0', NULL, '2020-09-19 21:42:45', NULL),
(601, 138, 'Đen Đô', '30x40', 'IMG992779371.webp', '0', '0', NULL, '2020-09-19 21:43:23', NULL),
(602, 138, 'Đồng', '30x40', 'IMG81682197.webp', '0', '0', NULL, '2020-09-19 21:43:23', NULL),
(603, 138, 'Vàng Đô', '30x40', 'IMG948767612.jpg', '0', '0', NULL, '2020-09-19 21:43:23', NULL),
(604, 138, 'Xanh Nhạt', '30x40', 'IMG96403804.webp', '0', '0', NULL, '2020-09-19 21:43:23', NULL);

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

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `password`, `remember_token`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, NULL, 'khanh@gmail.com', '$2y$10$FaCjamej9s0l.ugBnFukSeU2GthNkw9LaPIIq7Ikn3X2qiSIM1qIu', NULL, NULL, '2020-09-19 19:18:46', NULL),
(2, NULL, 'khanh1@gmail.com', '123456', NULL, NULL, NULL, NULL);

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
  ADD UNIQUE KEY `code` (`code`),
  ADD UNIQUE KEY `name` (`name`);

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
-- Indexes for table `user`
--
ALTER TABLE `user`
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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `colors`
--
ALTER TABLE `colors`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=139;

--
-- AUTO_INCREMENT for table `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT for table `product_variants`
--
ALTER TABLE `product_variants`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=605;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
