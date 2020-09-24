/*
 Navicat Premium Data Transfer

 Source Server         : laragon
 Source Server Type    : MySQL
 Source Server Version : 50724
 Source Host           : localhost:3306
 Source Schema         : juno

 Target Server Type    : MySQL
 Target Server Version : 50724
 File Encoding         : 65001

 Date: 23/09/2020 20:58:13
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for banners
-- ----------------------------
DROP TABLE IF EXISTS `banners`;
CREATE TABLE `banners`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `parent` int(11) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `uri` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `parent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES (16, 'Giày', 'Giay', '0', NULL, '2020-09-19 19:41:35', NULL);
INSERT INTO `categories` VALUES (17, 'Giày Adidas', 'Giay-Adidas', '16', NULL, '2020-09-19 19:44:25', NULL);
INSERT INTO `categories` VALUES (18, 'Giày Cao Gót', 'Giay-Cao Got', '16', NULL, '2020-09-19 19:44:47', NULL);
INSERT INTO `categories` VALUES (19, 'Túi', 'Tui', '0', NULL, '2020-09-19 19:45:05', NULL);
INSERT INTO `categories` VALUES (20, 'Balo', 'Balo', '19', NULL, '2020-09-19 19:45:12', NULL);
INSERT INTO `categories` VALUES (21, 'Ví', 'Vi', '19', NULL, '2020-09-19 19:45:33', NULL);

-- ----------------------------
-- Table structure for colors
-- ----------------------------
DROP TABLE IF EXISTS `colors`;
CREATE TABLE `colors`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of colors
-- ----------------------------
INSERT INTO `colors` VALUES (10, 'Đen Xám', 'IMG166365237.webp', NULL, '2020-09-19 19:39:21', '2020-09-19 12:39:21');
INSERT INTO `colors` VALUES (11, 'Đen', 'IMG272364105.webp', NULL, '2020-09-19 19:39:30', '2020-09-19 12:39:30');
INSERT INTO `colors` VALUES (12, 'Đen Đô', 'IMG992779371.webp', NULL, '2020-09-19 19:39:41', '2020-09-19 12:39:41');
INSERT INTO `colors` VALUES (13, 'Đỏ Đô', 'IMG984336427.webp', NULL, '2020-09-19 19:39:53', '2020-09-19 12:39:53');
INSERT INTO `colors` VALUES (14, 'Đồng', 'IMG81682197.webp', NULL, '2020-09-19 19:40:00', '2020-09-19 12:40:00');
INSERT INTO `colors` VALUES (15, 'Kem', 'IMG909133467.webp', NULL, '2020-09-19 19:40:05', '2020-09-19 12:40:05');
INSERT INTO `colors` VALUES (16, 'Sọc Trắng Đen', 'IMG205913509.webp', NULL, '2020-09-19 19:40:18', '2020-09-19 12:40:18');
INSERT INTO `colors` VALUES (17, 'Trắng', 'IMG227338585.webp', NULL, '2020-09-19 19:40:26', '2020-09-19 12:40:26');
INSERT INTO `colors` VALUES (18, 'Vàng', 'IMG416895716.webp', NULL, '2020-09-19 19:40:32', '2020-09-19 12:40:32');
INSERT INTO `colors` VALUES (19, 'Vàng Đô', 'IMG948767612.jpg', NULL, '2020-09-19 19:40:55', '2020-09-19 12:40:55');
INSERT INTO `colors` VALUES (20, 'Xanh Nhạt', 'IMG96403804.webp', NULL, '2020-09-19 19:41:03', '2020-09-19 12:41:03');
INSERT INTO `colors` VALUES (21, 'Xanh', 'IMG669663976.webp', NULL, '2020-09-19 19:41:07', '2020-09-19 12:41:07');

-- ----------------------------
-- Table structure for contact
-- ----------------------------
DROP TABLE IF EXISTS `contact`;
CREATE TABLE `contact`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of contact
-- ----------------------------
INSERT INTO `contact` VALUES (3, '1', 'khanh@gmail.com', '1231231233', '1', NULL, NULL, '2020-09-23 15:37:22', '2020-09-23 15:37:22');

-- ----------------------------
-- Table structure for customers
-- ----------------------------
DROP TABLE IF EXISTS `customers`;
CREATE TABLE `customers`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of customers
-- ----------------------------
INSERT INTO `customers` VALUES (23, '1', '1', '4', 'khanh@gmail.com', NULL, '2020-09-20 01:21:34', NULL);
INSERT INTO `customers` VALUES (24, '1', '1', '1', 'khanh@gmail.com', NULL, '2020-09-20 01:22:32', NULL);
INSERT INTO `customers` VALUES (25, '1', '3', '4', 'khanh@gmail.com', NULL, '2020-09-20 01:28:13', NULL);
INSERT INTO `customers` VALUES (26, 'Lâm Khánh', '23', '011032156', 'khanh@gmail.com', NULL, '2020-09-20 01:35:25', NULL);
INSERT INTO `customers` VALUES (27, 'Lâm Khánh', '6', '1', 'khanh@gmail.com', NULL, '2020-09-20 01:40:34', NULL);
INSERT INTO `customers` VALUES (28, 'Lâm Khánh', '3', '1', 'khanhchallenger2086@gmail.com', NULL, '2020-09-20 01:53:13', NULL);
INSERT INTO `customers` VALUES (29, 'Lâm Khánh', '3', '4', 'khanhchallenger2086@gmail.com', NULL, '2020-09-20 01:54:14', NULL);
INSERT INTO `customers` VALUES (30, 'Lâm Khánh', '3', '1', 'khanhchallenger2086@gmail.com', NULL, '2020-09-20 01:55:10', NULL);
INSERT INTO `customers` VALUES (31, 'Lâm Khánh', '3', '4', 'khanhchallenger2086@gmail.com', NULL, '2020-09-20 01:55:48', NULL);
INSERT INTO `customers` VALUES (32, 'Lâm Khánh', '6', '4', 'khanhchallenger2086@gmail.com', NULL, '2020-09-20 01:56:52', NULL);
INSERT INTO `customers` VALUES (33, 'Lâm Khánh', '1', '4', 'khanhchallenger2086@gmail.com', NULL, '2020-09-20 01:59:13', NULL);
INSERT INTO `customers` VALUES (34, 'Lâm Khánh', '3', '4', 'khanhchallenger2086@gmail.com', NULL, '2020-09-20 02:01:39', NULL);
INSERT INTO `customers` VALUES (35, 'Lâm Khánh', 'ádasd', '0868672070', 'khanhchallenger2086@gmail.com', NULL, '2020-09-23 23:35:41', NULL);
INSERT INTO `customers` VALUES (36, 'Lâm Khánh', 'ádasd', '0868672070', 'khanhchallenger2086@gmail.com', NULL, '2020-09-23 23:37:09', NULL);
INSERT INTO `customers` VALUES (37, 'Lâm Khánh', 'ádasd', '0868672070', 'khanhchallenger2086@gmail.com', NULL, '2020-09-23 23:41:43', NULL);
INSERT INTO `customers` VALUES (38, 'Lâm Khánh', 'ádasd', '0868672070', 'khanhchallenger2086@gmail.com', NULL, '2020-09-23 23:44:07', NULL);
INSERT INTO `customers` VALUES (39, 'Lâm Khánh', 'ádasd', '1231231233', 'khanhchallenger2086@gmail.com', NULL, '2020-09-24 10:51:50', NULL);
INSERT INTO `customers` VALUES (40, 'Lâm Khánh', 'ádasd', '1231231233', 'khanhchallenger2086@gmail.com', NULL, '2020-09-24 10:53:45', NULL);

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (3, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO `migrations` VALUES (4, '2020_08_22_040322_create_product_table', 1);
INSERT INTO `migrations` VALUES (5, '2020_08_22_041054_create_productt_table', 2);
INSERT INTO `migrations` VALUES (8, '2020_08_22_041225_create_admin_table', 3);
INSERT INTO `migrations` VALUES (25, '2020_08_22_092218_create_products_table', 4);
INSERT INTO `migrations` VALUES (26, '2020_08_22_093134_create_products_variant_table', 4);
INSERT INTO `migrations` VALUES (27, '2020_08_22_094139_create_categories_table', 4);
INSERT INTO `migrations` VALUES (28, '2020_08_22_094319_create_customers_table', 4);
INSERT INTO `migrations` VALUES (29, '2020_08_22_094437_create_orders_table', 4);
INSERT INTO `migrations` VALUES (30, '2020_08_22_095744_create_order_details_table', 4);
INSERT INTO `migrations` VALUES (31, '2020_08_22_100259_create_banners_table', 4);
INSERT INTO `migrations` VALUES (32, '2020_08_22_100458_create_setting_table', 4);
INSERT INTO `migrations` VALUES (33, '2020_09_02_133247_create_colors_table', 5);
INSERT INTO `migrations` VALUES (34, '2020_09_03_042938_create_product_categories_table', 6);
INSERT INTO `migrations` VALUES (35, '2020_09_17_063627_create_user_table', 7);
INSERT INTO `migrations` VALUES (36, '2020_09_21_062226_create_roles_table', 8);
INSERT INTO `migrations` VALUES (37, '2020_09_21_062640_create_roles_table', 9);
INSERT INTO `migrations` VALUES (38, '2020_09_23_152726_create_contact_table', 10);

-- ----------------------------
-- Table structure for order_details
-- ----------------------------
DROP TABLE IF EXISTS `order_details`;
CREATE TABLE `order_details`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_order` int(11) NULL DEFAULT NULL,
  `id_product` int(11) NULL DEFAULT NULL,
  `price_product` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `name_product` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `total_price` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `amount` int(11) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 53 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_details
-- ----------------------------
INSERT INTO `order_details` VALUES (19, 11, 111, '0', 'Giày xăng đan gót vuông 5cm quai ngang 3', '0', 1, NULL, '2020-09-20 01:21:34', '2020-09-19 18:21:34');
INSERT INTO `order_details` VALUES (20, 11, 111, '0', 'Giày xăng đan gót vuông 5cm quai ngang 3', '0', 1, NULL, '2020-09-20 01:21:34', '2020-09-19 18:21:34');
INSERT INTO `order_details` VALUES (21, 12, 111, '0', 'Giày xăng đan gót vuông 5cm quai ngang 3', '0', 1, NULL, '2020-09-20 01:22:32', '2020-09-19 18:22:32');
INSERT INTO `order_details` VALUES (22, 12, 111, '0', 'Giày xăng đan gót vuông 5cm quai ngang 3', '0', 1, NULL, '2020-09-20 01:22:32', '2020-09-19 18:22:32');
INSERT INTO `order_details` VALUES (23, 13, 109, '0', 'Giày xăng đan gót vuông 5cm quai ngang 1', '0', 1, NULL, '2020-09-20 01:28:13', '2020-09-19 18:28:13');
INSERT INTO `order_details` VALUES (24, 13, 111, '0', 'Giày xăng đan gót vuông 5cm quai ngang 3', '0', 2, NULL, '2020-09-20 01:28:13', '2020-09-19 18:28:13');
INSERT INTO `order_details` VALUES (25, 13, 111, '0', 'Giày xăng đan gót vuông 5cm quai ngang 3', '0', 1, NULL, '2020-09-20 01:28:13', '2020-09-19 18:28:13');
INSERT INTO `order_details` VALUES (26, 13, 111, '0', 'Giày xăng đan gót vuông 5cm quai ngang 3', '0', 1, NULL, '2020-09-20 01:28:13', '2020-09-19 18:28:13');
INSERT INTO `order_details` VALUES (27, 14, 111, '0', 'Giày xăng đan gót vuông 5cm quai ngang 3', '0', 3, NULL, '2020-09-20 01:35:25', '2020-09-19 18:35:25');
INSERT INTO `order_details` VALUES (28, 14, 111, '0', 'Giày xăng đan gót vuông 5cm quai ngang 3', '0', 1, NULL, '2020-09-20 01:35:25', '2020-09-19 18:35:25');
INSERT INTO `order_details` VALUES (29, 14, 111, '0', 'Giày xăng đan gót vuông 5cm quai ngang 3', '0', 1, NULL, '2020-09-20 01:35:25', '2020-09-19 18:35:25');
INSERT INTO `order_details` VALUES (30, 15, 110, '0', 'Giày xăng đan gót vuông 5cm quai ngang 2', '0', 1, NULL, '2020-09-20 01:40:34', '2020-09-19 18:40:34');
INSERT INTO `order_details` VALUES (31, 16, 109, '0', 'Giày xăng đan gót vuông 5cm quai ngang 1', '0', 1, NULL, '2020-09-20 01:53:13', '2020-09-19 18:53:13');
INSERT INTO `order_details` VALUES (32, 17, 109, '0', 'Giày xăng đan gót vuông 5cm quai ngang 1', '0', 1, NULL, '2020-09-20 01:54:14', '2020-09-19 18:54:14');
INSERT INTO `order_details` VALUES (33, 18, 109, '0', 'Giày xăng đan gót vuông 5cm quai ngang 1', '0', 1, NULL, '2020-09-20 01:55:10', '2020-09-19 18:55:10');
INSERT INTO `order_details` VALUES (34, 19, 110, '0', 'Giày xăng đan gót vuông 5cm quai ngang 2', '0', 1, NULL, '2020-09-20 01:55:48', '2020-09-19 18:55:48');
INSERT INTO `order_details` VALUES (35, 20, 109, '0', 'Giày xăng đan gót vuông 5cm quai ngang 1', '0', 1, NULL, '2020-09-20 01:56:52', '2020-09-19 18:56:52');
INSERT INTO `order_details` VALUES (36, 21, 110, '0', 'Giày xăng đan gót vuông 5cm quai ngang 2', '0', 1, NULL, '2020-09-20 01:59:13', '2020-09-19 18:59:13');
INSERT INTO `order_details` VALUES (37, 22, 111, '0', 'Giày xăng đan gót vuông 5cm quai ngang 3', '0', 1, NULL, '2020-09-20 02:01:39', '2020-09-19 19:01:39');
INSERT INTO `order_details` VALUES (38, 23, 129, '0', 'Túi cỡ lớn hoạ tiết 3D TXL025', '0', 2, NULL, '2020-09-23 23:35:41', '2020-09-23 16:35:41');
INSERT INTO `order_details` VALUES (39, 23, 129, '0', 'Túi cỡ lớn hoạ tiết 3D TXL025', '0', 2, NULL, '2020-09-23 23:35:41', '2020-09-23 16:35:41');
INSERT INTO `order_details` VALUES (40, 24, 109, '0', 'Giày xăng đan gót vuông 5cm quai ngang 1', '0', 1, NULL, '2020-09-23 23:37:10', '2020-09-23 16:37:10');
INSERT INTO `order_details` VALUES (41, 24, 109, '0', 'Giày xăng đan gót vuông 5cm quai ngang 1', '0', 1, NULL, '2020-09-23 23:37:10', '2020-09-23 16:37:10');
INSERT INTO `order_details` VALUES (42, 25, 109, '0', 'Giày xăng đan gót vuông 5cm quai ngang 1', '0', 6, NULL, '2020-09-23 23:41:43', '2020-09-23 16:41:43');
INSERT INTO `order_details` VALUES (43, 25, 111, '0', 'Giày xăng đan gót vuông 5cm quai ngang 3', '0', 1, NULL, '2020-09-23 23:41:43', '2020-09-23 16:41:43');
INSERT INTO `order_details` VALUES (44, 25, 116, '0', 'Giày xăng đan gót vuông 5cm quai ngang 8', '0', 1, NULL, '2020-09-23 23:41:43', '2020-09-23 16:41:43');
INSERT INTO `order_details` VALUES (45, 25, 116, '0', 'Giày xăng đan gót vuông 5cm quai ngang 8', '0', 1, NULL, '2020-09-23 23:41:43', '2020-09-23 16:41:43');
INSERT INTO `order_details` VALUES (46, 26, 109, '0', 'Giày xăng đan gót vuông 5cm quai ngang 1', '0', 1, NULL, '2020-09-23 23:44:07', '2020-09-23 16:44:07');
INSERT INTO `order_details` VALUES (47, 26, 109, '0', 'Giày xăng đan gót vuông 5cm quai ngang 1', '0', 1, NULL, '2020-09-23 23:44:07', '2020-09-23 16:44:07');
INSERT INTO `order_details` VALUES (48, 26, 109, '0', 'Giày xăng đan gót vuông 5cm quai ngang 1', '0', 1, NULL, '2020-09-23 23:44:07', '2020-09-23 16:44:07');
INSERT INTO `order_details` VALUES (49, 27, 110, '0', 'Giày xăng đan gót vuông 5cm quai ngang 2', '0', 1, NULL, '2020-09-24 10:51:51', '2020-09-24 03:51:51');
INSERT INTO `order_details` VALUES (50, 27, 109, '50000', 'Giày xăng đan gót vuông 5cm quai ngang 1', '850000', 17, NULL, '2020-09-24 10:51:51', '2020-09-24 03:51:51');
INSERT INTO `order_details` VALUES (51, 27, 110, '50000', 'Giày xăng đan gót vuông 5cm quai ngang 2', '50000', 1, NULL, '2020-09-24 10:51:51', '2020-09-24 03:51:51');
INSERT INTO `order_details` VALUES (52, 28, 109, '50000', 'Giày xăng đan gót vuông 5cm quai ngang 1', '50000', 1, NULL, '2020-09-24 10:53:45', '2020-09-24 03:53:45');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `total_order` int(50) NULL DEFAULT NULL,
  `id_customer` int(11) NULL DEFAULT NULL,
  `payment_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `payment_status` int(11) NULL DEFAULT NULL,
  `note_from_customer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `note_order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (14, 'DHL083525', 0, 26, '6381', 1, NULL, NULL, NULL, '2020-09-20 01:35:25', '2020-09-23 14:56:20');
INSERT INTO `orders` VALUES (15, 'DHL084034', 0, 27, 'momo\"', 1, NULL, NULL, NULL, '2020-09-20 01:40:34', '2020-09-23 14:56:22');
INSERT INTO `orders` VALUES (16, 'DHL085313', 0, 28, 'napas', 0, NULL, NULL, NULL, '2020-09-20 01:53:13', NULL);
INSERT INTO `orders` VALUES (17, 'DHL085414', 0, 29, 'napas', 0, NULL, NULL, NULL, '2020-09-20 01:54:14', NULL);
INSERT INTO `orders` VALUES (18, 'DHL085510', 0, 30, '6381', 0, NULL, NULL, NULL, '2020-09-20 01:55:10', NULL);
INSERT INTO `orders` VALUES (19, 'DHL085548', 0, 31, 'momo\"', 0, NULL, NULL, NULL, '2020-09-20 01:55:48', NULL);
INSERT INTO `orders` VALUES (20, 'DHL085652', 0, 32, 'napas', 0, NULL, NULL, NULL, '2020-09-20 01:56:52', NULL);
INSERT INTO `orders` VALUES (21, 'DHL085913', 0, 33, 'napas', 0, NULL, NULL, NULL, '2020-09-20 01:59:13', NULL);
INSERT INTO `orders` VALUES (22, 'DHL090139', 0, 34, 'napas', 0, NULL, NULL, NULL, '2020-09-20 02:01:39', NULL);
INSERT INTO `orders` VALUES (23, 'DHL163541', 0, 35, 'napas', 0, NULL, NULL, NULL, '2020-09-23 23:35:41', NULL);
INSERT INTO `orders` VALUES (24, 'DHL163709', 0, 36, 'napas', 0, NULL, NULL, NULL, '2020-09-23 23:37:09', NULL);
INSERT INTO `orders` VALUES (25, 'DHL164143', 0, 37, '6381', 0, NULL, NULL, NULL, '2020-09-23 23:41:43', NULL);
INSERT INTO `orders` VALUES (26, 'DHL164407', 0, 38, 'napas', 0, NULL, NULL, NULL, '2020-09-23 23:44:07', NULL);
INSERT INTO `orders` VALUES (27, 'DHL035150', 900000, 39, 'napas', 0, NULL, NULL, NULL, '2020-09-24 10:51:50', NULL);
INSERT INTO `orders` VALUES (28, 'DHL035345', 50000, 40, 'napas', 0, NULL, NULL, NULL, '2020-09-24 10:53:45', NULL);

-- ----------------------------
-- Table structure for product_categories
-- ----------------------------
DROP TABLE IF EXISTS `product_categories`;
CREATE TABLE `product_categories`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_product` int(11) NULL DEFAULT NULL,
  `id_category` int(11) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 111 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_categories
-- ----------------------------
INSERT INTO `product_categories` VALUES (62, 109, 16, NULL, '2020-09-19 12:53:26', '2020-09-19 12:53:26');
INSERT INTO `product_categories` VALUES (63, 109, 17, NULL, '2020-09-19 12:53:26', '2020-09-19 12:53:26');
INSERT INTO `product_categories` VALUES (64, 110, 16, NULL, '2020-09-19 12:54:21', '2020-09-19 12:54:21');
INSERT INTO `product_categories` VALUES (65, 110, 17, NULL, '2020-09-19 12:54:21', '2020-09-19 12:54:21');
INSERT INTO `product_categories` VALUES (66, 110, 18, NULL, '2020-09-19 12:54:21', '2020-09-19 12:54:21');
INSERT INTO `product_categories` VALUES (67, 111, 16, NULL, '2020-09-19 12:54:51', '2020-09-19 12:54:51');
INSERT INTO `product_categories` VALUES (68, 111, 17, NULL, '2020-09-19 12:54:51', '2020-09-19 12:54:51');
INSERT INTO `product_categories` VALUES (69, 111, 18, NULL, '2020-09-19 12:54:51', '2020-09-19 12:54:51');
INSERT INTO `product_categories` VALUES (70, 112, 16, NULL, '2020-09-19 12:55:12', '2020-09-19 12:55:12');
INSERT INTO `product_categories` VALUES (71, 112, 17, NULL, '2020-09-19 12:55:12', '2020-09-19 12:55:12');
INSERT INTO `product_categories` VALUES (72, 112, 18, NULL, '2020-09-19 12:55:12', '2020-09-19 12:55:12');
INSERT INTO `product_categories` VALUES (73, 113, 16, NULL, '2020-09-19 12:55:55', '2020-09-19 12:55:55');
INSERT INTO `product_categories` VALUES (74, 113, 17, NULL, '2020-09-19 12:55:55', '2020-09-19 12:55:55');
INSERT INTO `product_categories` VALUES (75, 113, 18, NULL, '2020-09-19 12:55:55', '2020-09-19 12:55:55');
INSERT INTO `product_categories` VALUES (76, 114, 16, NULL, '2020-09-19 12:56:17', '2020-09-19 12:56:17');
INSERT INTO `product_categories` VALUES (77, 114, 18, NULL, '2020-09-19 12:56:17', '2020-09-19 12:56:17');
INSERT INTO `product_categories` VALUES (78, 115, 16, NULL, '2020-09-19 12:56:40', '2020-09-19 12:56:40');
INSERT INTO `product_categories` VALUES (79, 116, 16, NULL, '2020-09-19 12:57:05', '2020-09-19 12:57:05');
INSERT INTO `product_categories` VALUES (80, 116, 17, NULL, '2020-09-19 12:57:05', '2020-09-19 12:57:05');
INSERT INTO `product_categories` VALUES (81, 116, 18, NULL, '2020-09-19 12:57:05', '2020-09-19 12:57:05');
INSERT INTO `product_categories` VALUES (82, 117, 16, NULL, '2020-09-19 12:57:27', '2020-09-19 12:57:27');
INSERT INTO `product_categories` VALUES (83, 117, 18, NULL, '2020-09-19 12:57:27', '2020-09-19 12:57:27');
INSERT INTO `product_categories` VALUES (84, 118, 16, NULL, '2020-09-19 12:57:57', '2020-09-19 12:57:57');
INSERT INTO `product_categories` VALUES (85, 118, 17, NULL, '2020-09-19 12:57:57', '2020-09-19 12:57:57');
INSERT INTO `product_categories` VALUES (88, 129, 19, NULL, '2020-09-19 14:38:17', '2020-09-19 14:38:17');
INSERT INTO `product_categories` VALUES (89, 129, 21, NULL, '2020-09-19 14:38:17', '2020-09-19 14:38:17');
INSERT INTO `product_categories` VALUES (90, 130, 19, NULL, '2020-09-19 14:38:53', '2020-09-19 14:38:53');
INSERT INTO `product_categories` VALUES (91, 130, 20, NULL, '2020-09-19 14:38:53', '2020-09-19 14:38:53');
INSERT INTO `product_categories` VALUES (92, 130, 21, NULL, '2020-09-19 14:38:53', '2020-09-19 14:38:53');
INSERT INTO `product_categories` VALUES (93, 131, 19, NULL, '2020-09-19 14:39:28', '2020-09-19 14:39:28');
INSERT INTO `product_categories` VALUES (94, 131, 20, NULL, '2020-09-19 14:39:28', '2020-09-19 14:39:28');
INSERT INTO `product_categories` VALUES (95, 131, 21, NULL, '2020-09-19 14:39:28', '2020-09-19 14:39:28');
INSERT INTO `product_categories` VALUES (96, 132, 19, NULL, '2020-09-19 14:40:01', '2020-09-19 14:40:01');
INSERT INTO `product_categories` VALUES (97, 132, 20, NULL, '2020-09-19 14:40:01', '2020-09-19 14:40:01');
INSERT INTO `product_categories` VALUES (98, 132, 21, NULL, '2020-09-19 14:40:01', '2020-09-19 14:40:01');
INSERT INTO `product_categories` VALUES (99, 133, 19, NULL, '2020-09-19 14:40:33', '2020-09-19 14:40:33');
INSERT INTO `product_categories` VALUES (100, 133, 20, NULL, '2020-09-19 14:40:33', '2020-09-19 14:40:33');
INSERT INTO `product_categories` VALUES (101, 134, 19, NULL, '2020-09-19 14:41:03', '2020-09-19 14:41:03');
INSERT INTO `product_categories` VALUES (102, 135, 19, NULL, '2020-09-19 14:41:31', '2020-09-19 14:41:31');
INSERT INTO `product_categories` VALUES (103, 135, 20, NULL, '2020-09-19 14:41:31', '2020-09-19 14:41:31');
INSERT INTO `product_categories` VALUES (104, 136, 19, NULL, '2020-09-19 14:42:19', '2020-09-19 14:42:19');
INSERT INTO `product_categories` VALUES (105, 136, 21, NULL, '2020-09-19 14:42:19', '2020-09-19 14:42:19');
INSERT INTO `product_categories` VALUES (106, 137, 19, NULL, '2020-09-19 14:42:45', '2020-09-19 14:42:45');
INSERT INTO `product_categories` VALUES (107, 137, 21, NULL, '2020-09-19 14:42:45', '2020-09-19 14:42:45');
INSERT INTO `product_categories` VALUES (108, 138, 19, NULL, '2020-09-19 14:43:23', '2020-09-19 14:43:23');
INSERT INTO `product_categories` VALUES (109, 138, 20, NULL, '2020-09-19 14:43:23', '2020-09-19 14:43:23');
INSERT INTO `product_categories` VALUES (110, 138, 21, NULL, '2020-09-19 14:43:23', '2020-09-19 14:43:23');

-- ----------------------------
-- Table structure for product_variants
-- ----------------------------
DROP TABLE IF EXISTS `product_variants`;
CREATE TABLE `product_variants`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_product` int(11) NULL DEFAULT NULL,
  `color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `size` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `price_market` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0',
  `price` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0',
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 605 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_variants
-- ----------------------------
INSERT INTO `product_variants` VALUES (445, 109, 'Đen Xám', '35', 'IMG166365237.webp', '0', '50000', NULL, '2020-09-19 12:53:26', NULL);
INSERT INTO `product_variants` VALUES (446, 109, 'Đen Xám', '36', 'IMG166365237.webp', '0', '50000', NULL, '2020-09-19 12:53:26', NULL);
INSERT INTO `product_variants` VALUES (447, 109, 'Đen Xám', '37', 'IMG166365237.webp', '0', '50000', NULL, '2020-09-19 12:53:26', NULL);
INSERT INTO `product_variants` VALUES (448, 109, 'Đen Xám', '38', 'IMG166365237.webp', '0', '50000', NULL, '2020-09-19 12:53:26', NULL);
INSERT INTO `product_variants` VALUES (449, 109, 'Đen Xám', '39', 'IMG166365237.webp', '0', '50000', NULL, '2020-09-19 12:53:26', NULL);
INSERT INTO `product_variants` VALUES (450, 109, 'Đen', '35', 'IMG272364105.webp', '0', '50000', NULL, '2020-09-19 12:53:26', NULL);
INSERT INTO `product_variants` VALUES (451, 109, 'Đen', '36', 'IMG272364105.webp', '0', '50000', NULL, '2020-09-19 12:53:26', NULL);
INSERT INTO `product_variants` VALUES (452, 109, 'Đen', '37', 'IMG272364105.webp', '0', '50000', NULL, '2020-09-19 12:53:26', NULL);
INSERT INTO `product_variants` VALUES (453, 109, 'Đen', '38', 'IMG272364105.webp', '0', '50000', NULL, '2020-09-19 12:53:26', NULL);
INSERT INTO `product_variants` VALUES (454, 109, 'Đen', '39', 'IMG272364105.webp', '0', '50000', NULL, '2020-09-19 12:53:26', NULL);
INSERT INTO `product_variants` VALUES (455, 109, 'Đen Đô', '35', 'IMG992779371.webp', '0', '50000', NULL, '2020-09-19 12:53:26', NULL);
INSERT INTO `product_variants` VALUES (456, 109, 'Đen Đô', '36', 'IMG992779371.webp', '0', '50000', NULL, '2020-09-19 12:53:26', NULL);
INSERT INTO `product_variants` VALUES (457, 109, 'Đen Đô', '37', 'IMG992779371.webp', '0', '50000', NULL, '2020-09-19 12:53:26', NULL);
INSERT INTO `product_variants` VALUES (458, 109, 'Đen Đô', '38', 'IMG992779371.webp', '0', '50000', NULL, '2020-09-19 12:53:26', NULL);
INSERT INTO `product_variants` VALUES (459, 109, 'Đen Đô', '39', 'IMG992779371.webp', '0', '50000', NULL, '2020-09-19 12:53:26', NULL);
INSERT INTO `product_variants` VALUES (460, 110, 'Đỏ Đô', '35', 'IMG984336427.webp', '0', '50000', NULL, '2020-09-19 12:54:21', NULL);
INSERT INTO `product_variants` VALUES (461, 110, 'Đỏ Đô', '36', 'IMG984336427.webp', '0', '50000', NULL, '2020-09-19 12:54:21', NULL);
INSERT INTO `product_variants` VALUES (462, 110, 'Đỏ Đô', '37', 'IMG984336427.webp', '0', '50000', NULL, '2020-09-19 12:54:21', NULL);
INSERT INTO `product_variants` VALUES (463, 110, 'Đồng', '35', 'IMG81682197.webp', '0', '50000', NULL, '2020-09-19 12:54:21', NULL);
INSERT INTO `product_variants` VALUES (464, 110, 'Đồng', '36', 'IMG81682197.webp', '0', '50000', NULL, '2020-09-19 12:54:21', NULL);
INSERT INTO `product_variants` VALUES (465, 110, 'Đồng', '37', 'IMG81682197.webp', '0', '50000', NULL, '2020-09-19 12:54:21', NULL);
INSERT INTO `product_variants` VALUES (466, 110, 'Kem', '35', 'IMG909133467.webp', '0', '50000', NULL, '2020-09-19 12:54:21', NULL);
INSERT INTO `product_variants` VALUES (467, 110, 'Kem', '36', 'IMG909133467.webp', '0', '50000', NULL, '2020-09-19 12:54:21', NULL);
INSERT INTO `product_variants` VALUES (468, 110, 'Kem', '37', 'IMG909133467.webp', '0', '50000', NULL, '2020-09-19 12:54:21', NULL);
INSERT INTO `product_variants` VALUES (469, 111, 'Kem', '35', 'IMG909133467.webp', '0', '50000', NULL, '2020-09-19 12:54:51', NULL);
INSERT INTO `product_variants` VALUES (470, 111, 'Kem', '36', 'IMG909133467.webp', '0', '50000', NULL, '2020-09-19 12:54:51', NULL);
INSERT INTO `product_variants` VALUES (471, 111, 'Kem', '38', 'IMG909133467.webp', '0', '50000', NULL, '2020-09-19 12:54:51', NULL);
INSERT INTO `product_variants` VALUES (472, 111, 'Kem', '39', 'IMG909133467.webp', '0', '50000', NULL, '2020-09-19 12:54:51', NULL);
INSERT INTO `product_variants` VALUES (473, 111, 'Sọc Trắng Đen', '35', 'IMG205913509.webp', '0', '50000', NULL, '2020-09-19 12:54:51', NULL);
INSERT INTO `product_variants` VALUES (474, 111, 'Sọc Trắng Đen', '36', 'IMG205913509.webp', '0', '50000', NULL, '2020-09-19 12:54:51', NULL);
INSERT INTO `product_variants` VALUES (475, 111, 'Sọc Trắng Đen', '38', 'IMG205913509.webp', '0', '50000', NULL, '2020-09-19 12:54:51', NULL);
INSERT INTO `product_variants` VALUES (476, 111, 'Sọc Trắng Đen', '39', 'IMG205913509.webp', '0', '50000', NULL, '2020-09-19 12:54:51', NULL);
INSERT INTO `product_variants` VALUES (477, 111, 'Trắng', '35', 'IMG227338585.webp', '0', '50000', NULL, '2020-09-19 12:54:51', NULL);
INSERT INTO `product_variants` VALUES (478, 111, 'Trắng', '36', 'IMG227338585.webp', '0', '50000', NULL, '2020-09-19 12:54:51', NULL);
INSERT INTO `product_variants` VALUES (479, 111, 'Trắng', '38', 'IMG227338585.webp', '0', '50000', NULL, '2020-09-19 12:54:51', NULL);
INSERT INTO `product_variants` VALUES (480, 111, 'Trắng', '39', 'IMG227338585.webp', '0', '50000', NULL, '2020-09-19 12:54:51', NULL);
INSERT INTO `product_variants` VALUES (481, 112, 'Đen Đô', '36', 'IMG992779371.webp', '0', '50000', NULL, '2020-09-19 12:55:12', NULL);
INSERT INTO `product_variants` VALUES (482, 112, 'Đen Đô', '38', 'IMG992779371.webp', '0', '50000', NULL, '2020-09-19 12:55:12', NULL);
INSERT INTO `product_variants` VALUES (483, 112, 'Đen Đô', '39', 'IMG992779371.webp', '0', '50000', NULL, '2020-09-19 12:55:12', NULL);
INSERT INTO `product_variants` VALUES (484, 112, 'Đỏ Đô', '36', 'IMG984336427.webp', '0', '50000', NULL, '2020-09-19 12:55:12', NULL);
INSERT INTO `product_variants` VALUES (485, 112, 'Đỏ Đô', '38', 'IMG984336427.webp', '0', '50000', NULL, '2020-09-19 12:55:12', NULL);
INSERT INTO `product_variants` VALUES (486, 112, 'Đỏ Đô', '39', 'IMG984336427.webp', '0', '50000', NULL, '2020-09-19 12:55:12', NULL);
INSERT INTO `product_variants` VALUES (487, 112, 'Đồng', '36', 'IMG81682197.webp', '0', '50000', NULL, '2020-09-19 12:55:12', NULL);
INSERT INTO `product_variants` VALUES (488, 112, 'Đồng', '38', 'IMG81682197.webp', '0', '50000', NULL, '2020-09-19 12:55:12', NULL);
INSERT INTO `product_variants` VALUES (489, 112, 'Đồng', '39', 'IMG81682197.webp', '0', '50000', NULL, '2020-09-19 12:55:12', NULL);
INSERT INTO `product_variants` VALUES (490, 113, 'Đen Đô', '36', 'IMG992779371.webp', '0', '50000', NULL, '2020-09-19 12:55:55', NULL);
INSERT INTO `product_variants` VALUES (491, 113, 'Đen Đô', '38', 'IMG992779371.webp', '0', '50000', NULL, '2020-09-19 12:55:55', NULL);
INSERT INTO `product_variants` VALUES (492, 113, 'Đen Đô', '39', 'IMG992779371.webp', '0', '50000', NULL, '2020-09-19 12:55:55', NULL);
INSERT INTO `product_variants` VALUES (493, 113, 'Đỏ Đô', '36', 'IMG984336427.webp', '0', '50000', NULL, '2020-09-19 12:55:55', NULL);
INSERT INTO `product_variants` VALUES (494, 113, 'Đỏ Đô', '38', 'IMG984336427.webp', '0', '50000', NULL, '2020-09-19 12:55:55', NULL);
INSERT INTO `product_variants` VALUES (495, 113, 'Đỏ Đô', '39', 'IMG984336427.webp', '0', '50000', NULL, '2020-09-19 12:55:55', NULL);
INSERT INTO `product_variants` VALUES (496, 113, 'Đồng', '36', 'IMG81682197.webp', '0', '50000', NULL, '2020-09-19 12:55:55', NULL);
INSERT INTO `product_variants` VALUES (497, 113, 'Đồng', '38', 'IMG81682197.webp', '0', '50000', NULL, '2020-09-19 12:55:55', NULL);
INSERT INTO `product_variants` VALUES (498, 113, 'Đồng', '39', 'IMG81682197.webp', '0', '50000', NULL, '2020-09-19 12:55:55', NULL);
INSERT INTO `product_variants` VALUES (499, 114, 'Đỏ Đô', '36', 'IMG984336427.webp', '0', '50000', NULL, '2020-09-19 12:56:17', NULL);
INSERT INTO `product_variants` VALUES (500, 114, 'Đỏ Đô', '38', 'IMG984336427.webp', '0', '50000', NULL, '2020-09-19 12:56:17', NULL);
INSERT INTO `product_variants` VALUES (501, 114, 'Đỏ Đô', '39', 'IMG984336427.webp', '0', '50000', NULL, '2020-09-19 12:56:17', NULL);
INSERT INTO `product_variants` VALUES (502, 114, 'Sọc Trắng Đen', '36', 'IMG205913509.webp', '0', '50000', NULL, '2020-09-19 12:56:17', NULL);
INSERT INTO `product_variants` VALUES (503, 114, 'Sọc Trắng Đen', '38', 'IMG205913509.webp', '0', '50000', NULL, '2020-09-19 12:56:17', NULL);
INSERT INTO `product_variants` VALUES (504, 114, 'Sọc Trắng Đen', '39', 'IMG205913509.webp', '0', '50000', NULL, '2020-09-19 12:56:17', NULL);
INSERT INTO `product_variants` VALUES (505, 114, 'Trắng', '36', 'IMG227338585.webp', '0', '50000', NULL, '2020-09-19 12:56:17', NULL);
INSERT INTO `product_variants` VALUES (506, 114, 'Trắng', '38', 'IMG227338585.webp', '0', '50000', NULL, '2020-09-19 12:56:17', NULL);
INSERT INTO `product_variants` VALUES (507, 114, 'Trắng', '39', 'IMG227338585.webp', '0', '50000', NULL, '2020-09-19 12:56:17', NULL);
INSERT INTO `product_variants` VALUES (508, 114, 'Vàng', '36', 'IMG416895716.webp', '0', '50000', NULL, '2020-09-19 12:56:17', NULL);
INSERT INTO `product_variants` VALUES (509, 114, 'Vàng', '38', 'IMG416895716.webp', '0', '50000', NULL, '2020-09-19 12:56:17', NULL);
INSERT INTO `product_variants` VALUES (510, 114, 'Vàng', '39', 'IMG416895716.webp', '0', '50000', NULL, '2020-09-19 12:56:17', NULL);
INSERT INTO `product_variants` VALUES (511, 115, 'Kem', '38', 'IMG909133467.webp', '0', '50000', NULL, '2020-09-19 12:56:40', NULL);
INSERT INTO `product_variants` VALUES (512, 115, 'Kem', '36', 'IMG909133467.webp', '0', '50000', NULL, '2020-09-19 12:56:40', NULL);
INSERT INTO `product_variants` VALUES (513, 115, 'Trắng', '38', 'IMG227338585.webp', '0', '50000', NULL, '2020-09-19 12:56:40', NULL);
INSERT INTO `product_variants` VALUES (514, 115, 'Trắng', '36', 'IMG227338585.webp', '0', '50000', NULL, '2020-09-19 12:56:40', NULL);
INSERT INTO `product_variants` VALUES (515, 115, 'Vàng', '38', 'IMG416895716.webp', '0', '50000', NULL, '2020-09-19 12:56:40', NULL);
INSERT INTO `product_variants` VALUES (516, 115, 'Vàng', '36', 'IMG416895716.webp', '0', '50000', NULL, '2020-09-19 12:56:40', NULL);
INSERT INTO `product_variants` VALUES (517, 115, 'Xanh Nhạt', '38', 'IMG96403804.webp', '0', '50000', NULL, '2020-09-19 12:56:40', NULL);
INSERT INTO `product_variants` VALUES (518, 115, 'Xanh Nhạt', '36', 'IMG96403804.webp', '0', '50000', NULL, '2020-09-19 12:56:40', NULL);
INSERT INTO `product_variants` VALUES (519, 116, 'Đen Đô', '36', 'IMG992779371.webp', '0', '50000', NULL, '2020-09-19 12:57:05', NULL);
INSERT INTO `product_variants` VALUES (520, 116, 'Đen Đô', '39', 'IMG992779371.webp', '0', '50000', NULL, '2020-09-19 12:57:05', NULL);
INSERT INTO `product_variants` VALUES (521, 116, 'Đỏ Đô', '36', 'IMG984336427.webp', '0', '50000', NULL, '2020-09-19 12:57:05', NULL);
INSERT INTO `product_variants` VALUES (522, 116, 'Đỏ Đô', '39', 'IMG984336427.webp', '0', '50000', NULL, '2020-09-19 12:57:05', NULL);
INSERT INTO `product_variants` VALUES (523, 116, 'Đồng', '36', 'IMG81682197.webp', '0', '50000', NULL, '2020-09-19 12:57:05', NULL);
INSERT INTO `product_variants` VALUES (524, 116, 'Đồng', '39', 'IMG81682197.webp', '0', '50000', NULL, '2020-09-19 12:57:05', NULL);
INSERT INTO `product_variants` VALUES (525, 117, 'Đen Xám', '37', 'IMG166365237.webp', '0', '50000', NULL, '2020-09-19 12:57:27', NULL);
INSERT INTO `product_variants` VALUES (526, 117, 'Đen Xám', '39', 'IMG166365237.webp', '0', '50000', NULL, '2020-09-19 12:57:27', NULL);
INSERT INTO `product_variants` VALUES (527, 117, 'Đen Đô', '37', 'IMG992779371.webp', '0', '50000', NULL, '2020-09-19 12:57:27', NULL);
INSERT INTO `product_variants` VALUES (528, 117, 'Đen Đô', '39', 'IMG992779371.webp', '0', '50000', NULL, '2020-09-19 12:57:27', NULL);
INSERT INTO `product_variants` VALUES (529, 118, 'Đen Đô', '36', 'IMG992779371.webp', '0', '50000', NULL, '2020-09-19 12:57:57', NULL);
INSERT INTO `product_variants` VALUES (530, 118, 'Đen Đô', '38', 'IMG992779371.webp', '0', '50000', NULL, '2020-09-19 12:57:57', NULL);
INSERT INTO `product_variants` VALUES (531, 118, 'Đen Đô', '39', 'IMG992779371.webp', '0', '50000', NULL, '2020-09-19 12:57:57', NULL);
INSERT INTO `product_variants` VALUES (532, 118, 'Đen Đô', '35', 'IMG992779371.webp', '0', '50000', NULL, '2020-09-19 12:57:57', NULL);
INSERT INTO `product_variants` VALUES (533, 118, 'Đen Đô', '40', 'IMG992779371.webp', '0', '50000', NULL, '2020-09-19 12:57:57', NULL);
INSERT INTO `product_variants` VALUES (534, 118, 'Đỏ Đô', '36', 'IMG984336427.webp', '0', '50000', NULL, '2020-09-19 12:57:57', NULL);
INSERT INTO `product_variants` VALUES (535, 118, 'Đỏ Đô', '38', 'IMG984336427.webp', '0', '50000', NULL, '2020-09-19 12:57:57', NULL);
INSERT INTO `product_variants` VALUES (536, 118, 'Đỏ Đô', '39', 'IMG984336427.webp', '0', '50000', NULL, '2020-09-19 12:57:57', NULL);
INSERT INTO `product_variants` VALUES (537, 118, 'Đỏ Đô', '35', 'IMG984336427.webp', '0', '50000', NULL, '2020-09-19 12:57:57', NULL);
INSERT INTO `product_variants` VALUES (538, 118, 'Đỏ Đô', '40', 'IMG984336427.webp', '0', '50000', NULL, '2020-09-19 12:57:57', NULL);
INSERT INTO `product_variants` VALUES (539, 118, 'Sọc Trắng Đen', '36', 'IMG205913509.webp', '0', '50000', NULL, '2020-09-19 12:57:57', NULL);
INSERT INTO `product_variants` VALUES (540, 118, 'Sọc Trắng Đen', '38', 'IMG205913509.webp', '0', '50000', NULL, '2020-09-19 12:57:57', NULL);
INSERT INTO `product_variants` VALUES (541, 118, 'Sọc Trắng Đen', '39', 'IMG205913509.webp', '0', '50000', NULL, '2020-09-19 12:57:57', NULL);
INSERT INTO `product_variants` VALUES (542, 118, 'Sọc Trắng Đen', '35', 'IMG205913509.webp', '0', '50000', NULL, '2020-09-19 12:57:57', NULL);
INSERT INTO `product_variants` VALUES (543, 118, 'Sọc Trắng Đen', '40', 'IMG205913509.webp', '0', '50000', NULL, '2020-09-19 12:57:57', NULL);
INSERT INTO `product_variants` VALUES (548, 129, 'Đen Đô', '20x30', 'IMG992779371.webp', '0', '50000', NULL, '2020-09-19 14:38:17', NULL);
INSERT INTO `product_variants` VALUES (549, 129, 'Đen Đô', '30x40', 'IMG992779371.webp', '0', '50000', NULL, '2020-09-19 14:38:17', NULL);
INSERT INTO `product_variants` VALUES (550, 129, 'Đỏ Đô', '20x30', 'IMG984336427.webp', '0', '50000', NULL, '2020-09-19 14:38:17', NULL);
INSERT INTO `product_variants` VALUES (551, 129, 'Đỏ Đô', '30x40', 'IMG984336427.webp', '0', '50000', NULL, '2020-09-19 14:38:17', NULL);
INSERT INTO `product_variants` VALUES (552, 129, 'Đồng', '20x30', 'IMG81682197.webp', '0', '50000', NULL, '2020-09-19 14:38:17', NULL);
INSERT INTO `product_variants` VALUES (553, 129, 'Đồng', '30x40', 'IMG81682197.webp', '0', '50000', NULL, '2020-09-19 14:38:17', NULL);
INSERT INTO `product_variants` VALUES (554, 130, 'Vàng', '20x30', 'IMG416895716.webp', '0', '50000', NULL, '2020-09-19 14:38:53', NULL);
INSERT INTO `product_variants` VALUES (555, 130, 'Vàng', '30x40', 'IMG416895716.webp', '0', '50000', NULL, '2020-09-19 14:38:53', NULL);
INSERT INTO `product_variants` VALUES (556, 130, 'Vàng Đô', '20x30', 'IMG948767612.jpg', '0', '50000', NULL, '2020-09-19 14:38:53', NULL);
INSERT INTO `product_variants` VALUES (557, 130, 'Vàng Đô', '30x40', 'IMG948767612.jpg', '0', '50000', NULL, '2020-09-19 14:38:53', NULL);
INSERT INTO `product_variants` VALUES (558, 130, 'Xanh Nhạt', '20x30', 'IMG96403804.webp', '0', '50000', NULL, '2020-09-19 14:38:53', NULL);
INSERT INTO `product_variants` VALUES (559, 130, 'Xanh Nhạt', '30x40', 'IMG96403804.webp', '0', '50000', NULL, '2020-09-19 14:38:53', NULL);
INSERT INTO `product_variants` VALUES (560, 131, 'Đen Đô', '30x40', 'IMG992779371.webp', '0', '50000', NULL, '2020-09-19 14:39:28', NULL);
INSERT INTO `product_variants` VALUES (561, 131, 'Đen Đô', '20x30', 'IMG992779371.webp', '0', '50000', NULL, '2020-09-19 14:39:28', NULL);
INSERT INTO `product_variants` VALUES (562, 131, 'Đỏ Đô', '30x40', 'IMG984336427.webp', '0', '50000', NULL, '2020-09-19 14:39:28', NULL);
INSERT INTO `product_variants` VALUES (563, 131, 'Đỏ Đô', '20x30', 'IMG984336427.webp', '0', '50000', NULL, '2020-09-19 14:39:28', NULL);
INSERT INTO `product_variants` VALUES (564, 131, 'Đồng', '30x40', 'IMG81682197.webp', '0', '50000', NULL, '2020-09-19 14:39:28', NULL);
INSERT INTO `product_variants` VALUES (565, 131, 'Đồng', '20x30', 'IMG81682197.webp', '0', '50000', NULL, '2020-09-19 14:39:28', NULL);
INSERT INTO `product_variants` VALUES (566, 132, 'Sọc Trắng Đen', '30x40', 'IMG205913509.webp', '0', '50000', NULL, '2020-09-19 14:40:01', NULL);
INSERT INTO `product_variants` VALUES (567, 132, 'Trắng', '30x40', 'IMG227338585.webp', '0', '50000', NULL, '2020-09-19 14:40:01', NULL);
INSERT INTO `product_variants` VALUES (568, 132, 'Vàng', '30x40', 'IMG416895716.webp', '0', '50000', NULL, '2020-09-19 14:40:01', NULL);
INSERT INTO `product_variants` VALUES (569, 133, 'Đen Đô', '30x40', 'IMG992779371.webp', '0', '50000', NULL, '2020-09-19 14:40:33', NULL);
INSERT INTO `product_variants` VALUES (570, 133, 'Đen Đô', '20x30', 'IMG992779371.webp', '0', '50000', NULL, '2020-09-19 14:40:33', NULL);
INSERT INTO `product_variants` VALUES (571, 133, 'Đỏ Đô', '30x40', 'IMG984336427.webp', '0', '50000', NULL, '2020-09-19 14:40:33', NULL);
INSERT INTO `product_variants` VALUES (572, 133, 'Đỏ Đô', '20x30', 'IMG984336427.webp', '0', '50000', NULL, '2020-09-19 14:40:33', NULL);
INSERT INTO `product_variants` VALUES (573, 133, 'Đồng', '30x40', 'IMG81682197.webp', '0', '50000', NULL, '2020-09-19 14:40:33', NULL);
INSERT INTO `product_variants` VALUES (574, 133, 'Đồng', '20x30', 'IMG81682197.webp', '0', '50000', NULL, '2020-09-19 14:40:33', NULL);
INSERT INTO `product_variants` VALUES (575, 134, 'Đen Đô', '30x40', 'IMG992779371.webp', '0', '50000', NULL, '2020-09-19 14:41:03', NULL);
INSERT INTO `product_variants` VALUES (576, 134, 'Đen Đô', '20x30', 'IMG992779371.webp', '0', '50000', NULL, '2020-09-19 14:41:03', NULL);
INSERT INTO `product_variants` VALUES (577, 134, 'Đồng', '30x40', 'IMG81682197.webp', '0', '50000', NULL, '2020-09-19 14:41:03', NULL);
INSERT INTO `product_variants` VALUES (578, 134, 'Đồng', '20x30', 'IMG81682197.webp', '0', '50000', NULL, '2020-09-19 14:41:03', NULL);
INSERT INTO `product_variants` VALUES (579, 134, 'Vàng Đô', '30x40', 'IMG948767612.jpg', '0', '50000', NULL, '2020-09-19 14:41:03', NULL);
INSERT INTO `product_variants` VALUES (580, 134, 'Vàng Đô', '20x30', 'IMG948767612.jpg', '0', '50000', NULL, '2020-09-19 14:41:03', NULL);
INSERT INTO `product_variants` VALUES (581, 134, 'Xanh Nhạt', '30x40', 'IMG96403804.webp', '0', '50000', NULL, '2020-09-19 14:41:03', NULL);
INSERT INTO `product_variants` VALUES (582, 134, 'Xanh Nhạt', '20x30', 'IMG96403804.webp', '0', '50000', NULL, '2020-09-19 14:41:03', NULL);
INSERT INTO `product_variants` VALUES (583, 135, 'Vàng Đô', '30x40', 'IMG948767612.jpg', '0', '50000', NULL, '2020-09-19 14:41:31', NULL);
INSERT INTO `product_variants` VALUES (584, 135, 'Vàng Đô', '20x30', 'IMG948767612.jpg', '0', '50000', NULL, '2020-09-19 14:41:31', NULL);
INSERT INTO `product_variants` VALUES (585, 135, 'Xanh Nhạt', '30x40', 'IMG96403804.webp', '0', '50000', NULL, '2020-09-19 14:41:31', NULL);
INSERT INTO `product_variants` VALUES (586, 135, 'Xanh Nhạt', '20x30', 'IMG96403804.webp', '0', '50000', NULL, '2020-09-19 14:41:31', NULL);
INSERT INTO `product_variants` VALUES (587, 135, 'Xanh', '30x40', 'IMG669663976.webp', '0', '50000', NULL, '2020-09-19 14:41:31', NULL);
INSERT INTO `product_variants` VALUES (588, 135, 'Xanh', '20x30', 'IMG669663976.webp', '0', '50000', NULL, '2020-09-19 14:41:31', NULL);
INSERT INTO `product_variants` VALUES (589, 136, 'Đen Đô', '30x40', 'IMG992779371.webp', '0', '50000', NULL, '2020-09-19 14:42:19', NULL);
INSERT INTO `product_variants` VALUES (590, 136, 'Đen Đô', '20x30', 'IMG992779371.webp', '0', '50000', NULL, '2020-09-19 14:42:19', NULL);
INSERT INTO `product_variants` VALUES (591, 136, 'Đỏ Đô', '30x40', 'IMG984336427.webp', '0', '50000', NULL, '2020-09-19 14:42:19', NULL);
INSERT INTO `product_variants` VALUES (592, 136, 'Đỏ Đô', '20x30', 'IMG984336427.webp', '0', '50000', NULL, '2020-09-19 14:42:19', NULL);
INSERT INTO `product_variants` VALUES (593, 136, 'Đồng', '30x40', 'IMG81682197.webp', '0', '50000', NULL, '2020-09-19 14:42:19', NULL);
INSERT INTO `product_variants` VALUES (594, 136, 'Đồng', '20x30', 'IMG81682197.webp', '0', '50000', NULL, '2020-09-19 14:42:19', NULL);
INSERT INTO `product_variants` VALUES (595, 137, 'Đỏ Đô', '30x40', 'IMG984336427.webp', '0', '50000', NULL, '2020-09-19 14:42:45', NULL);
INSERT INTO `product_variants` VALUES (596, 137, 'Đỏ Đô', '20x30', 'IMG984336427.webp', '0', '50000', NULL, '2020-09-19 14:42:45', NULL);
INSERT INTO `product_variants` VALUES (597, 137, 'Vàng Đô', '30x40', 'IMG948767612.jpg', '0', '50000', NULL, '2020-09-19 14:42:45', NULL);
INSERT INTO `product_variants` VALUES (598, 137, 'Vàng Đô', '20x30', 'IMG948767612.jpg', '0', '50000', NULL, '2020-09-19 14:42:45', NULL);
INSERT INTO `product_variants` VALUES (599, 137, 'Xanh', '30x40', 'IMG669663976.webp', '0', '50000', NULL, '2020-09-19 14:42:45', NULL);
INSERT INTO `product_variants` VALUES (600, 137, 'Xanh', '20x30', 'IMG669663976.webp', '0', '50000', NULL, '2020-09-19 14:42:45', NULL);
INSERT INTO `product_variants` VALUES (601, 138, 'Đen Đô', '30x40', 'IMG992779371.webp', '0', '50000', NULL, '2020-09-19 14:43:23', NULL);
INSERT INTO `product_variants` VALUES (602, 138, 'Đồng', '30x40', 'IMG81682197.webp', '0', '50000', NULL, '2020-09-19 14:43:23', NULL);
INSERT INTO `product_variants` VALUES (603, 138, 'Vàng Đô', '30x40', 'IMG948767612.jpg', '0', '50000', NULL, '2020-09-19 14:43:23', NULL);
INSERT INTO `product_variants` VALUES (604, 138, 'Xanh Nhạt', '30x40', 'IMG96403804.webp', '0', '50000', NULL, '2020-09-19 14:43:23', NULL);

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `sale` int(50) NOT NULL DEFAULT 0,
  `image_main` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `image_detail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `style` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `material` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `uri` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `code`(`code`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 139 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES (109, 'DH025326', 'Giày xăng đan gót vuông 5cm quai ngang 1', 0, 'IMG33878135.webp;', 'IMG657216662.webp;', '<p style=\"margin-bottom: 10px; padding: 0px; font-family: Quicksand, sans-serif; line-height: 21px; color: rgb(37, 42, 43); font-size: 13px !important;\"><span data-sheets-value=\"{&quot;1&quot;:2,&quot;2&quot;:&quot;- Chất liệu da tổng hợp bền, đẹp.\\n- Quai ngang thiết kế đơn giản, nữ tính.\\n- Quai hậu dán, tiện dụng.&quot;}\" data-sheets-userformat=\"{&quot;2&quot;:929,&quot;3&quot;:[null,0],&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:3}]},&quot;10&quot;:1,&quot;11&quot;:4,&quot;12&quot;:0}\" data-mce-style=\"font-size: 12pt; color: #000000;\" style=\"margin: 0px; padding: 0px; font-size: 12pt; color: rgb(0, 0, 0);\">Chất liệu da tổng hợp bền, đẹp</span></p><p style=\"margin-bottom: 10px; padding: 0px; font-family: Quicksand, sans-serif; line-height: 21px; color: rgb(37, 42, 43); font-size: 13px !important;\"><span data-sheets-value=\"{&quot;1&quot;:2,&quot;2&quot;:&quot;- Chất liệu da tổng hợp bền, đẹp.\\n- Quai ngang thiết kế đơn giản, nữ tính.\\n- Quai hậu dán, tiện dụng.&quot;}\" data-sheets-userformat=\"{&quot;2&quot;:929,&quot;3&quot;:[null,0],&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:3}]},&quot;10&quot;:1,&quot;11&quot;:4,&quot;12&quot;:0}\" data-mce-style=\"font-size: 12pt; color: #000000;\" style=\"margin: 0px; padding: 0px; font-size: 12pt; color: rgb(0, 0, 0);\">Quai ngang thiết kế đơn giản, nữ tính</span></p><p style=\"margin-bottom: 10px; padding: 0px; font-family: Quicksand, sans-serif; line-height: 21px; color: rgb(37, 42, 43); font-size: 13px !important;\"><span data-sheets-value=\"{&quot;1&quot;:2,&quot;2&quot;:&quot;- Chất liệu da tổng hợp bền, đẹp.\\n- Quai ngang thiết kế đơn giản, nữ tính.\\n- Quai hậu dán, tiện dụng.&quot;}\" data-sheets-userformat=\"{&quot;2&quot;:929,&quot;3&quot;:[null,0],&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:3}]},&quot;10&quot;:1,&quot;11&quot;:4,&quot;12&quot;:0}\" data-mce-style=\"font-size: 12pt; color: #000000;\" style=\"margin: 0px; padding: 0px; font-size: 12pt; color: rgb(0, 0, 0);\">Quai hậu dán, tiện dụng</span></p>', 'Giày xăng đan', 'Da tổng hợp', 'Giày-xăng-đan-gót-vuông-5cm-quai-ngang-1', NULL, '2020-09-19 12:53:26', NULL);
INSERT INTO `products` VALUES (110, 'DH025421', 'Giày xăng đan gót vuông 5cm quai ngang 2', 0, 'IMG84919492.webp;', 'IMG142348278.webp;', '<p style=\"margin-bottom: 10px; padding: 0px; font-family: Quicksand, sans-serif; line-height: 21px; color: rgb(37, 42, 43); font-size: 13px !important;\"><span data-sheets-value=\"{&quot;1&quot;:2,&quot;2&quot;:&quot;- Chất liệu da tổng hợp bền, đẹp.\\n- Quai ngang thiết kế đơn giản, nữ tính.\\n- Quai hậu dán, tiện dụng.&quot;}\" data-sheets-userformat=\"{&quot;2&quot;:929,&quot;3&quot;:[null,0],&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:3}]},&quot;10&quot;:1,&quot;11&quot;:4,&quot;12&quot;:0}\" data-mce-style=\"font-size: 12pt; color: #000000;\" style=\"margin: 0px; padding: 0px; font-size: 12pt; color: rgb(0, 0, 0);\">Chất liệu da tổng hợp bền, đẹp</span></p><p style=\"margin-bottom: 10px; padding: 0px; font-family: Quicksand, sans-serif; line-height: 21px; color: rgb(37, 42, 43); font-size: 13px !important;\"><span data-sheets-value=\"{&quot;1&quot;:2,&quot;2&quot;:&quot;- Chất liệu da tổng hợp bền, đẹp.\\n- Quai ngang thiết kế đơn giản, nữ tính.\\n- Quai hậu dán, tiện dụng.&quot;}\" data-sheets-userformat=\"{&quot;2&quot;:929,&quot;3&quot;:[null,0],&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:3}]},&quot;10&quot;:1,&quot;11&quot;:4,&quot;12&quot;:0}\" data-mce-style=\"font-size: 12pt; color: #000000;\" style=\"margin: 0px; padding: 0px; font-size: 12pt; color: rgb(0, 0, 0);\">Quai ngang thiết kế đơn giản, nữ tính</span></p><p style=\"margin-bottom: 10px; padding: 0px; font-family: Quicksand, sans-serif; line-height: 21px; color: rgb(37, 42, 43); font-size: 13px !important;\"><span data-sheets-value=\"{&quot;1&quot;:2,&quot;2&quot;:&quot;- Chất liệu da tổng hợp bền, đẹp.\\n- Quai ngang thiết kế đơn giản, nữ tính.\\n- Quai hậu dán, tiện dụng.&quot;}\" data-sheets-userformat=\"{&quot;2&quot;:929,&quot;3&quot;:[null,0],&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:3}]},&quot;10&quot;:1,&quot;11&quot;:4,&quot;12&quot;:0}\" data-mce-style=\"font-size: 12pt; color: #000000;\" style=\"margin: 0px; padding: 0px; font-size: 12pt; color: rgb(0, 0, 0);\">Quai hậu dán, tiện dụng</span></p>', 'Giày xăng đan', 'Da tổng hợp', 'Giày-xăng-đan-gót-vuông-5cm-quai-ngang-2', NULL, '2020-09-19 12:54:21', NULL);
INSERT INTO `products` VALUES (111, 'DH025451', 'Giày xăng đan gót vuông 5cm quai ngang 3', 0, 'IMG520212698.webp;', 'IMG353307352.webp;', '<p style=\"margin-bottom: 10px; padding: 0px; font-family: Quicksand, sans-serif; line-height: 21px; color: rgb(37, 42, 43); font-size: 13px !important;\"><span data-sheets-value=\"{&quot;1&quot;:2,&quot;2&quot;:&quot;- Chất liệu da tổng hợp bền, đẹp.\\n- Quai ngang thiết kế đơn giản, nữ tính.\\n- Quai hậu dán, tiện dụng.&quot;}\" data-sheets-userformat=\"{&quot;2&quot;:929,&quot;3&quot;:[null,0],&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:3}]},&quot;10&quot;:1,&quot;11&quot;:4,&quot;12&quot;:0}\" data-mce-style=\"font-size: 12pt; color: #000000;\" style=\"margin: 0px; padding: 0px; font-size: 12pt; color: rgb(0, 0, 0);\">Chất liệu da tổng hợp bền, đẹp</span></p><p style=\"margin-bottom: 10px; padding: 0px; font-family: Quicksand, sans-serif; line-height: 21px; color: rgb(37, 42, 43); font-size: 13px !important;\"><span data-sheets-value=\"{&quot;1&quot;:2,&quot;2&quot;:&quot;- Chất liệu da tổng hợp bền, đẹp.\\n- Quai ngang thiết kế đơn giản, nữ tính.\\n- Quai hậu dán, tiện dụng.&quot;}\" data-sheets-userformat=\"{&quot;2&quot;:929,&quot;3&quot;:[null,0],&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:3}]},&quot;10&quot;:1,&quot;11&quot;:4,&quot;12&quot;:0}\" data-mce-style=\"font-size: 12pt; color: #000000;\" style=\"margin: 0px; padding: 0px; font-size: 12pt; color: rgb(0, 0, 0);\">Quai ngang thiết kế đơn giản, nữ tính</span></p><p style=\"margin-bottom: 10px; padding: 0px; font-family: Quicksand, sans-serif; line-height: 21px; color: rgb(37, 42, 43); font-size: 13px !important;\"><span data-sheets-value=\"{&quot;1&quot;:2,&quot;2&quot;:&quot;- Chất liệu da tổng hợp bền, đẹp.\\n- Quai ngang thiết kế đơn giản, nữ tính.\\n- Quai hậu dán, tiện dụng.&quot;}\" data-sheets-userformat=\"{&quot;2&quot;:929,&quot;3&quot;:[null,0],&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:3}]},&quot;10&quot;:1,&quot;11&quot;:4,&quot;12&quot;:0}\" data-mce-style=\"font-size: 12pt; color: #000000;\" style=\"margin: 0px; padding: 0px; font-size: 12pt; color: rgb(0, 0, 0);\">Quai hậu dán, tiện dụng</span></p>', 'Giày xăng đan', 'Da tổng hợp', 'Giày-xăng-đan-gót-vuông-5cm-quai-ngang-3', NULL, '2020-09-19 12:54:51', NULL);
INSERT INTO `products` VALUES (112, 'DH025512', 'Giày xăng đan gót vuông 5cm quai ngang 4', 0, 'IMG9952372.webp;', 'IMG970964599.webp;', '<p style=\"margin-bottom: 10px; padding: 0px; font-family: Quicksand, sans-serif; line-height: 21px; color: rgb(37, 42, 43); font-size: 13px !important;\"><span data-sheets-value=\"{&quot;1&quot;:2,&quot;2&quot;:&quot;- Chất liệu da tổng hợp bền, đẹp.\\n- Quai ngang thiết kế đơn giản, nữ tính.\\n- Quai hậu dán, tiện dụng.&quot;}\" data-sheets-userformat=\"{&quot;2&quot;:929,&quot;3&quot;:[null,0],&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:3}]},&quot;10&quot;:1,&quot;11&quot;:4,&quot;12&quot;:0}\" data-mce-style=\"font-size: 12pt; color: #000000;\" style=\"margin: 0px; padding: 0px; font-size: 12pt; color: rgb(0, 0, 0);\">Chất liệu da tổng hợp bền, đẹp</span></p><p style=\"margin-bottom: 10px; padding: 0px; font-family: Quicksand, sans-serif; line-height: 21px; color: rgb(37, 42, 43); font-size: 13px !important;\"><span data-sheets-value=\"{&quot;1&quot;:2,&quot;2&quot;:&quot;- Chất liệu da tổng hợp bền, đẹp.\\n- Quai ngang thiết kế đơn giản, nữ tính.\\n- Quai hậu dán, tiện dụng.&quot;}\" data-sheets-userformat=\"{&quot;2&quot;:929,&quot;3&quot;:[null,0],&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:3}]},&quot;10&quot;:1,&quot;11&quot;:4,&quot;12&quot;:0}\" data-mce-style=\"font-size: 12pt; color: #000000;\" style=\"margin: 0px; padding: 0px; font-size: 12pt; color: rgb(0, 0, 0);\">Quai ngang thiết kế đơn giản, nữ tính</span></p><p style=\"margin-bottom: 10px; padding: 0px; font-family: Quicksand, sans-serif; line-height: 21px; color: rgb(37, 42, 43); font-size: 13px !important;\"><span data-sheets-value=\"{&quot;1&quot;:2,&quot;2&quot;:&quot;- Chất liệu da tổng hợp bền, đẹp.\\n- Quai ngang thiết kế đơn giản, nữ tính.\\n- Quai hậu dán, tiện dụng.&quot;}\" data-sheets-userformat=\"{&quot;2&quot;:929,&quot;3&quot;:[null,0],&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:3}]},&quot;10&quot;:1,&quot;11&quot;:4,&quot;12&quot;:0}\" data-mce-style=\"font-size: 12pt; color: #000000;\" style=\"margin: 0px; padding: 0px; font-size: 12pt; color: rgb(0, 0, 0);\">Quai hậu dán, tiện dụng</span></p>', 'Giày xăng đan', 'Da tổng hợp', 'Giày-xăng-đan-gót-vuông-5cm-quai-ngang-4', NULL, '2020-09-19 12:55:12', NULL);
INSERT INTO `products` VALUES (113, 'DH025555', 'Giày xăng đan gót vuông 5cm quai ngang 5', 0, 'IMG271112523.webp;', 'IMG724369320.webp;', '<p style=\"margin-bottom: 10px; padding: 0px; font-family: Quicksand, sans-serif; line-height: 21px; color: rgb(37, 42, 43); font-size: 13px !important;\"><span data-sheets-value=\"{&quot;1&quot;:2,&quot;2&quot;:&quot;- Chất liệu da tổng hợp bền, đẹp.\\n- Quai ngang thiết kế đơn giản, nữ tính.\\n- Quai hậu dán, tiện dụng.&quot;}\" data-sheets-userformat=\"{&quot;2&quot;:929,&quot;3&quot;:[null,0],&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:3}]},&quot;10&quot;:1,&quot;11&quot;:4,&quot;12&quot;:0}\" data-mce-style=\"font-size: 12pt; color: #000000;\" style=\"margin: 0px; padding: 0px; font-size: 12pt; color: rgb(0, 0, 0);\">Chất liệu da tổng hợp bền, đẹp</span></p><p style=\"margin-bottom: 10px; padding: 0px; font-family: Quicksand, sans-serif; line-height: 21px; color: rgb(37, 42, 43); font-size: 13px !important;\"><span data-sheets-value=\"{&quot;1&quot;:2,&quot;2&quot;:&quot;- Chất liệu da tổng hợp bền, đẹp.\\n- Quai ngang thiết kế đơn giản, nữ tính.\\n- Quai hậu dán, tiện dụng.&quot;}\" data-sheets-userformat=\"{&quot;2&quot;:929,&quot;3&quot;:[null,0],&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:3}]},&quot;10&quot;:1,&quot;11&quot;:4,&quot;12&quot;:0}\" data-mce-style=\"font-size: 12pt; color: #000000;\" style=\"margin: 0px; padding: 0px; font-size: 12pt; color: rgb(0, 0, 0);\">Quai ngang thiết kế đơn giản, nữ tính</span></p><p style=\"margin-bottom: 10px; padding: 0px; font-family: Quicksand, sans-serif; line-height: 21px; color: rgb(37, 42, 43); font-size: 13px !important;\"><span data-sheets-value=\"{&quot;1&quot;:2,&quot;2&quot;:&quot;- Chất liệu da tổng hợp bền, đẹp.\\n- Quai ngang thiết kế đơn giản, nữ tính.\\n- Quai hậu dán, tiện dụng.&quot;}\" data-sheets-userformat=\"{&quot;2&quot;:929,&quot;3&quot;:[null,0],&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:3}]},&quot;10&quot;:1,&quot;11&quot;:4,&quot;12&quot;:0}\" data-mce-style=\"font-size: 12pt; color: #000000;\" style=\"margin: 0px; padding: 0px; font-size: 12pt; color: rgb(0, 0, 0);\">Quai hậu dán, tiện dụng</span></p>', 'Giày xăng đan', 'Da tổng hợp', 'Giày-xăng-đan-gót-vuông-5cm-quai-ngang-5', NULL, '2020-09-19 12:55:55', NULL);
INSERT INTO `products` VALUES (114, 'DH025617', 'Giày xăng đan gót vuông 5cm quai ngang 6', 0, 'IMG548684853.webp;', 'IMG28108766.webp;', '<p style=\"margin-bottom: 10px; padding: 0px; font-family: Quicksand, sans-serif; line-height: 21px; color: rgb(37, 42, 43); font-size: 13px !important;\"><span data-sheets-value=\"{&quot;1&quot;:2,&quot;2&quot;:&quot;- Chất liệu da tổng hợp bền, đẹp.\\n- Quai ngang thiết kế đơn giản, nữ tính.\\n- Quai hậu dán, tiện dụng.&quot;}\" data-sheets-userformat=\"{&quot;2&quot;:929,&quot;3&quot;:[null,0],&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:3}]},&quot;10&quot;:1,&quot;11&quot;:4,&quot;12&quot;:0}\" data-mce-style=\"font-size: 12pt; color: #000000;\" style=\"margin: 0px; padding: 0px; font-size: 12pt; color: rgb(0, 0, 0);\">Chất liệu da tổng hợp bền, đẹp</span></p><p style=\"margin-bottom: 10px; padding: 0px; font-family: Quicksand, sans-serif; line-height: 21px; color: rgb(37, 42, 43); font-size: 13px !important;\"><span data-sheets-value=\"{&quot;1&quot;:2,&quot;2&quot;:&quot;- Chất liệu da tổng hợp bền, đẹp.\\n- Quai ngang thiết kế đơn giản, nữ tính.\\n- Quai hậu dán, tiện dụng.&quot;}\" data-sheets-userformat=\"{&quot;2&quot;:929,&quot;3&quot;:[null,0],&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:3}]},&quot;10&quot;:1,&quot;11&quot;:4,&quot;12&quot;:0}\" data-mce-style=\"font-size: 12pt; color: #000000;\" style=\"margin: 0px; padding: 0px; font-size: 12pt; color: rgb(0, 0, 0);\">Quai ngang thiết kế đơn giản, nữ tính</span></p><p style=\"margin-bottom: 10px; padding: 0px; font-family: Quicksand, sans-serif; line-height: 21px; color: rgb(37, 42, 43); font-size: 13px !important;\"><span data-sheets-value=\"{&quot;1&quot;:2,&quot;2&quot;:&quot;- Chất liệu da tổng hợp bền, đẹp.\\n- Quai ngang thiết kế đơn giản, nữ tính.\\n- Quai hậu dán, tiện dụng.&quot;}\" data-sheets-userformat=\"{&quot;2&quot;:929,&quot;3&quot;:[null,0],&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:3}]},&quot;10&quot;:1,&quot;11&quot;:4,&quot;12&quot;:0}\" data-mce-style=\"font-size: 12pt; color: #000000;\" style=\"margin: 0px; padding: 0px; font-size: 12pt; color: rgb(0, 0, 0);\">Quai hậu dán, tiện dụng</span></p>', 'Giày xăng đan', 'Da tổng hợp', 'Giày-xăng-đan-gót-vuông-5cm-quai-ngang-6', NULL, '2020-09-19 12:56:17', NULL);
INSERT INTO `products` VALUES (115, 'DH025639', 'Giày xăng đan gót vuông 5cm quai ngang 7', 0, 'IMG477321329.webp;', 'IMG477884825.webp;', '<p style=\"margin-bottom: 10px; padding: 0px; font-family: Quicksand, sans-serif; line-height: 21px; color: rgb(37, 42, 43); font-size: 13px !important;\"><span data-sheets-value=\"{&quot;1&quot;:2,&quot;2&quot;:&quot;- Chất liệu da tổng hợp bền, đẹp.\\n- Quai ngang thiết kế đơn giản, nữ tính.\\n- Quai hậu dán, tiện dụng.&quot;}\" data-sheets-userformat=\"{&quot;2&quot;:929,&quot;3&quot;:[null,0],&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:3}]},&quot;10&quot;:1,&quot;11&quot;:4,&quot;12&quot;:0}\" data-mce-style=\"font-size: 12pt; color: #000000;\" style=\"margin: 0px; padding: 0px; font-size: 12pt; color: rgb(0, 0, 0);\">Chất liệu da tổng hợp bền, đẹp</span></p><p style=\"margin-bottom: 10px; padding: 0px; font-family: Quicksand, sans-serif; line-height: 21px; color: rgb(37, 42, 43); font-size: 13px !important;\"><span data-sheets-value=\"{&quot;1&quot;:2,&quot;2&quot;:&quot;- Chất liệu da tổng hợp bền, đẹp.\\n- Quai ngang thiết kế đơn giản, nữ tính.\\n- Quai hậu dán, tiện dụng.&quot;}\" data-sheets-userformat=\"{&quot;2&quot;:929,&quot;3&quot;:[null,0],&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:3}]},&quot;10&quot;:1,&quot;11&quot;:4,&quot;12&quot;:0}\" data-mce-style=\"font-size: 12pt; color: #000000;\" style=\"margin: 0px; padding: 0px; font-size: 12pt; color: rgb(0, 0, 0);\">Quai ngang thiết kế đơn giản, nữ tính</span></p><p style=\"margin-bottom: 10px; padding: 0px; font-family: Quicksand, sans-serif; line-height: 21px; color: rgb(37, 42, 43); font-size: 13px !important;\"><span data-sheets-value=\"{&quot;1&quot;:2,&quot;2&quot;:&quot;- Chất liệu da tổng hợp bền, đẹp.\\n- Quai ngang thiết kế đơn giản, nữ tính.\\n- Quai hậu dán, tiện dụng.&quot;}\" data-sheets-userformat=\"{&quot;2&quot;:929,&quot;3&quot;:[null,0],&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:3}]},&quot;10&quot;:1,&quot;11&quot;:4,&quot;12&quot;:0}\" data-mce-style=\"font-size: 12pt; color: #000000;\" style=\"margin: 0px; padding: 0px; font-size: 12pt; color: rgb(0, 0, 0);\">Quai hậu dán, tiện dụng</span></p>', 'Giày xăng đan', 'Da tổng hợp', 'Giày-xăng-đan-gót-vuông-5cm-quai-ngang-7', NULL, '2020-09-19 12:56:39', NULL);
INSERT INTO `products` VALUES (116, 'DH025705', 'Giày xăng đan gót vuông 5cm quai ngang 8', 0, 'IMG985471436.webp;', 'IMG247187576.webp;', '<p style=\"margin-bottom: 10px; padding: 0px; font-family: Quicksand, sans-serif; line-height: 21px; color: rgb(37, 42, 43); font-size: 13px !important;\"><span data-sheets-value=\"{&quot;1&quot;:2,&quot;2&quot;:&quot;- Chất liệu da tổng hợp bền, đẹp.\\n- Quai ngang thiết kế đơn giản, nữ tính.\\n- Quai hậu dán, tiện dụng.&quot;}\" data-sheets-userformat=\"{&quot;2&quot;:929,&quot;3&quot;:[null,0],&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:3}]},&quot;10&quot;:1,&quot;11&quot;:4,&quot;12&quot;:0}\" data-mce-style=\"font-size: 12pt; color: #000000;\" style=\"margin: 0px; padding: 0px; font-size: 12pt; color: rgb(0, 0, 0);\">Chất liệu da tổng hợp bền, đẹp</span></p><p style=\"margin-bottom: 10px; padding: 0px; font-family: Quicksand, sans-serif; line-height: 21px; color: rgb(37, 42, 43); font-size: 13px !important;\"><span data-sheets-value=\"{&quot;1&quot;:2,&quot;2&quot;:&quot;- Chất liệu da tổng hợp bền, đẹp.\\n- Quai ngang thiết kế đơn giản, nữ tính.\\n- Quai hậu dán, tiện dụng.&quot;}\" data-sheets-userformat=\"{&quot;2&quot;:929,&quot;3&quot;:[null,0],&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:3}]},&quot;10&quot;:1,&quot;11&quot;:4,&quot;12&quot;:0}\" data-mce-style=\"font-size: 12pt; color: #000000;\" style=\"margin: 0px; padding: 0px; font-size: 12pt; color: rgb(0, 0, 0);\">Quai ngang thiết kế đơn giản, nữ tính</span></p><p style=\"margin-bottom: 10px; padding: 0px; font-family: Quicksand, sans-serif; line-height: 21px; color: rgb(37, 42, 43); font-size: 13px !important;\"><span data-sheets-value=\"{&quot;1&quot;:2,&quot;2&quot;:&quot;- Chất liệu da tổng hợp bền, đẹp.\\n- Quai ngang thiết kế đơn giản, nữ tính.\\n- Quai hậu dán, tiện dụng.&quot;}\" data-sheets-userformat=\"{&quot;2&quot;:929,&quot;3&quot;:[null,0],&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:3}]},&quot;10&quot;:1,&quot;11&quot;:4,&quot;12&quot;:0}\" data-mce-style=\"font-size: 12pt; color: #000000;\" style=\"margin: 0px; padding: 0px; font-size: 12pt; color: rgb(0, 0, 0);\">Quai hậu dán, tiện dụng</span></p>', 'Giày xăng đan', 'Da tổng hợp', 'Giày-xăng-đan-gót-vuông-5cm-quai-ngang-8', NULL, '2020-09-19 12:57:05', NULL);
INSERT INTO `products` VALUES (117, 'DH025727', 'Giày xăng đan gót vuông 5cm quai ngang 9', 0, 'IMG510624191.webp;', 'IMG943563415.webp;', '<p style=\"margin-bottom: 10px; padding: 0px; font-family: Quicksand, sans-serif; line-height: 21px; color: rgb(37, 42, 43); font-size: 13px !important;\"><span data-sheets-value=\"{&quot;1&quot;:2,&quot;2&quot;:&quot;- Chất liệu da tổng hợp bền, đẹp.\\n- Quai ngang thiết kế đơn giản, nữ tính.\\n- Quai hậu dán, tiện dụng.&quot;}\" data-sheets-userformat=\"{&quot;2&quot;:929,&quot;3&quot;:[null,0],&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:3}]},&quot;10&quot;:1,&quot;11&quot;:4,&quot;12&quot;:0}\" data-mce-style=\"font-size: 12pt; color: #000000;\" style=\"margin: 0px; padding: 0px; font-size: 12pt; color: rgb(0, 0, 0);\">Chất liệu da tổng hợp bền, đẹp</span></p><p style=\"margin-bottom: 10px; padding: 0px; font-family: Quicksand, sans-serif; line-height: 21px; color: rgb(37, 42, 43); font-size: 13px !important;\"><span data-sheets-value=\"{&quot;1&quot;:2,&quot;2&quot;:&quot;- Chất liệu da tổng hợp bền, đẹp.\\n- Quai ngang thiết kế đơn giản, nữ tính.\\n- Quai hậu dán, tiện dụng.&quot;}\" data-sheets-userformat=\"{&quot;2&quot;:929,&quot;3&quot;:[null,0],&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:3}]},&quot;10&quot;:1,&quot;11&quot;:4,&quot;12&quot;:0}\" data-mce-style=\"font-size: 12pt; color: #000000;\" style=\"margin: 0px; padding: 0px; font-size: 12pt; color: rgb(0, 0, 0);\">Quai ngang thiết kế đơn giản, nữ tính</span></p><p style=\"margin-bottom: 10px; padding: 0px; font-family: Quicksand, sans-serif; line-height: 21px; color: rgb(37, 42, 43); font-size: 13px !important;\"><span data-sheets-value=\"{&quot;1&quot;:2,&quot;2&quot;:&quot;- Chất liệu da tổng hợp bền, đẹp.\\n- Quai ngang thiết kế đơn giản, nữ tính.\\n- Quai hậu dán, tiện dụng.&quot;}\" data-sheets-userformat=\"{&quot;2&quot;:929,&quot;3&quot;:[null,0],&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:3}]},&quot;10&quot;:1,&quot;11&quot;:4,&quot;12&quot;:0}\" data-mce-style=\"font-size: 12pt; color: #000000;\" style=\"margin: 0px; padding: 0px; font-size: 12pt; color: rgb(0, 0, 0);\">Quai hậu dán, tiện dụng</span></p>', 'Giày xăng đan', 'Da tổng hợp', 'Giày-xăng-đan-gót-vuông-5cm-quai-ngang-9', NULL, '2020-09-19 12:57:27', NULL);
INSERT INTO `products` VALUES (118, 'DH025757', 'Giày xăng đan gót vuông 5cm quai ngang 10', 0, 'IMG134853877.webp;', 'IMG3837127.webp;', '<p style=\"margin-bottom: 10px; padding: 0px; font-family: Quicksand, sans-serif; line-height: 21px; color: rgb(37, 42, 43); font-size: 13px !important;\"><span data-sheets-value=\"{&quot;1&quot;:2,&quot;2&quot;:&quot;- Chất liệu da tổng hợp bền, đẹp.\\n- Quai ngang thiết kế đơn giản, nữ tính.\\n- Quai hậu dán, tiện dụng.&quot;}\" data-sheets-userformat=\"{&quot;2&quot;:929,&quot;3&quot;:[null,0],&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:3}]},&quot;10&quot;:1,&quot;11&quot;:4,&quot;12&quot;:0}\" data-mce-style=\"font-size: 12pt; color: #000000;\" style=\"margin: 0px; padding: 0px; font-size: 12pt; color: rgb(0, 0, 0);\">Chất liệu da tổng hợp bền, đẹp</span></p><p style=\"margin-bottom: 10px; padding: 0px; font-family: Quicksand, sans-serif; line-height: 21px; color: rgb(37, 42, 43); font-size: 13px !important;\"><span data-sheets-value=\"{&quot;1&quot;:2,&quot;2&quot;:&quot;- Chất liệu da tổng hợp bền, đẹp.\\n- Quai ngang thiết kế đơn giản, nữ tính.\\n- Quai hậu dán, tiện dụng.&quot;}\" data-sheets-userformat=\"{&quot;2&quot;:929,&quot;3&quot;:[null,0],&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:3}]},&quot;10&quot;:1,&quot;11&quot;:4,&quot;12&quot;:0}\" data-mce-style=\"font-size: 12pt; color: #000000;\" style=\"margin: 0px; padding: 0px; font-size: 12pt; color: rgb(0, 0, 0);\">Quai ngang thiết kế đơn giản, nữ tính</span></p><p style=\"margin-bottom: 10px; padding: 0px; font-family: Quicksand, sans-serif; line-height: 21px; color: rgb(37, 42, 43); font-size: 13px !important;\"><span data-sheets-value=\"{&quot;1&quot;:2,&quot;2&quot;:&quot;- Chất liệu da tổng hợp bền, đẹp.\\n- Quai ngang thiết kế đơn giản, nữ tính.\\n- Quai hậu dán, tiện dụng.&quot;}\" data-sheets-userformat=\"{&quot;2&quot;:929,&quot;3&quot;:[null,0],&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:3}]},&quot;10&quot;:1,&quot;11&quot;:4,&quot;12&quot;:0}\" data-mce-style=\"font-size: 12pt; color: #000000;\" style=\"margin: 0px; padding: 0px; font-size: 12pt; color: rgb(0, 0, 0);\">Quai hậu dán, tiện dụng</span></p>', 'Giày xăng đan', 'Da tổng hợp', 'Giày-xăng-đan-gót-vuông-5cm-quai-ngang-10', NULL, '2020-09-19 12:57:57', NULL);
INSERT INTO `products` VALUES (129, 'DH043817', 'Túi cỡ lớn hoạ tiết 3D TXL025', 0, 'IMG982923594.webp;', 'IMG4663413.webp;', '<p style=\"margin-bottom: 10px; padding: 0px; font-family: Quicksand, sans-serif; line-height: 21px; color: rgb(37, 42, 43); font-size: 13px !important;\"><span data-sheets-value=\"{&quot;1&quot;:2,&quot;2&quot;:&quot;- Chất liệu da tổng hợp bền, đẹp.\\n- Quai ngang thiết kế đơn giản, nữ tính.\\n- Quai hậu dán, tiện dụng.&quot;}\" data-sheets-userformat=\"{&quot;2&quot;:929,&quot;3&quot;:[null,0],&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:3}]},&quot;10&quot;:1,&quot;11&quot;:4,&quot;12&quot;:0}\" data-mce-style=\"font-size: 12pt; color: #000000;\" style=\"margin: 0px; padding: 0px; font-size: 12pt; color: rgb(0, 0, 0);\">Chất liệu da tổng hợp bền, đẹp</span></p><p style=\"margin-bottom: 10px; padding: 0px; font-family: Quicksand, sans-serif; line-height: 21px; color: rgb(37, 42, 43); font-size: 13px !important;\"><span data-sheets-value=\"{&quot;1&quot;:2,&quot;2&quot;:&quot;- Chất liệu da tổng hợp bền, đẹp.\\n- Quai ngang thiết kế đơn giản, nữ tính.\\n- Quai hậu dán, tiện dụng.&quot;}\" data-sheets-userformat=\"{&quot;2&quot;:929,&quot;3&quot;:[null,0],&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:3}]},&quot;10&quot;:1,&quot;11&quot;:4,&quot;12&quot;:0}\" data-mce-style=\"font-size: 12pt; color: #000000;\" style=\"margin: 0px; padding: 0px; font-size: 12pt; color: rgb(0, 0, 0);\">Quai ngang thiết kế đơn giản, nữ tính</span></p><p style=\"margin-bottom: 10px; padding: 0px; font-family: Quicksand, sans-serif; line-height: 21px; color: rgb(37, 42, 43); font-size: 13px !important;\"><span data-sheets-value=\"{&quot;1&quot;:2,&quot;2&quot;:&quot;- Chất liệu da tổng hợp bền, đẹp.\\n- Quai ngang thiết kế đơn giản, nữ tính.\\n- Quai hậu dán, tiện dụng.&quot;}\" data-sheets-userformat=\"{&quot;2&quot;:929,&quot;3&quot;:[null,0],&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:3}]},&quot;10&quot;:1,&quot;11&quot;:4,&quot;12&quot;:0}\" data-mce-style=\"font-size: 12pt; color: #000000;\" style=\"margin: 0px; padding: 0px; font-size: 12pt; color: rgb(0, 0, 0);\">Quai hậu dán, tiện dụng</span></p>', 'Túi xách thời trang', 'Da tổng hợp', 'Túi-cỡ-lớn-hoạ-tiết-3D-TXL025', NULL, '2020-09-19 14:38:17', NULL);
INSERT INTO `products` VALUES (130, 'DH043853', 'Túi cỡ lớn hoạ tiết 3D TXL025 1', 0, 'IMG125800230.webp;', 'IMG66034993.webp;', '<p style=\"margin-bottom: 10px; padding: 0px; font-family: Quicksand, sans-serif; line-height: 21px; color: rgb(37, 42, 43); font-size: 13px !important;\"><span data-sheets-value=\"{&quot;1&quot;:2,&quot;2&quot;:&quot;- Chất liệu da tổng hợp bền, đẹp.\\n- Quai ngang thiết kế đơn giản, nữ tính.\\n- Quai hậu dán, tiện dụng.&quot;}\" data-sheets-userformat=\"{&quot;2&quot;:929,&quot;3&quot;:[null,0],&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:3}]},&quot;10&quot;:1,&quot;11&quot;:4,&quot;12&quot;:0}\" data-mce-style=\"font-size: 12pt; color: #000000;\" style=\"margin: 0px; padding: 0px; font-size: 12pt; color: rgb(0, 0, 0);\">Chất liệu da tổng hợp bền, đẹp</span></p><p style=\"margin-bottom: 10px; padding: 0px; font-family: Quicksand, sans-serif; line-height: 21px; color: rgb(37, 42, 43); font-size: 13px !important;\"><span data-sheets-value=\"{&quot;1&quot;:2,&quot;2&quot;:&quot;- Chất liệu da tổng hợp bền, đẹp.\\n- Quai ngang thiết kế đơn giản, nữ tính.\\n- Quai hậu dán, tiện dụng.&quot;}\" data-sheets-userformat=\"{&quot;2&quot;:929,&quot;3&quot;:[null,0],&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:3}]},&quot;10&quot;:1,&quot;11&quot;:4,&quot;12&quot;:0}\" data-mce-style=\"font-size: 12pt; color: #000000;\" style=\"margin: 0px; padding: 0px; font-size: 12pt; color: rgb(0, 0, 0);\">Quai ngang thiết kế đơn giản, nữ tính</span></p><p style=\"margin-bottom: 10px; padding: 0px; font-family: Quicksand, sans-serif; line-height: 21px; color: rgb(37, 42, 43); font-size: 13px !important;\"><span data-sheets-value=\"{&quot;1&quot;:2,&quot;2&quot;:&quot;- Chất liệu da tổng hợp bền, đẹp.\\n- Quai ngang thiết kế đơn giản, nữ tính.\\n- Quai hậu dán, tiện dụng.&quot;}\" data-sheets-userformat=\"{&quot;2&quot;:929,&quot;3&quot;:[null,0],&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:3}]},&quot;10&quot;:1,&quot;11&quot;:4,&quot;12&quot;:0}\" data-mce-style=\"font-size: 12pt; color: #000000;\" style=\"margin: 0px; padding: 0px; font-size: 12pt; color: rgb(0, 0, 0);\">Quai hậu dán, tiện dụng</span></p>', 'Túi xách thời trang', 'Da tổng hợp', 'Túi-cỡ-lớn-hoạ-tiết-3D-TXL025-1', NULL, '2020-09-19 14:38:53', NULL);
INSERT INTO `products` VALUES (131, 'DH043928', 'Túi cỡ lớn hoạ tiết 3D TXL025 3', 0, 'IMG359372324.webp;', 'IMG44319109.webp;', '<p style=\"margin-bottom: 10px; padding: 0px; font-family: Quicksand, sans-serif; line-height: 21px; color: rgb(37, 42, 43); font-size: 13px !important;\"><span data-sheets-value=\"{&quot;1&quot;:2,&quot;2&quot;:&quot;- Chất liệu da tổng hợp bền, đẹp.\\n- Quai ngang thiết kế đơn giản, nữ tính.\\n- Quai hậu dán, tiện dụng.&quot;}\" data-sheets-userformat=\"{&quot;2&quot;:929,&quot;3&quot;:[null,0],&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:3}]},&quot;10&quot;:1,&quot;11&quot;:4,&quot;12&quot;:0}\" data-mce-style=\"font-size: 12pt; color: #000000;\" style=\"margin: 0px; padding: 0px; font-size: 12pt; color: rgb(0, 0, 0);\">Chất liệu da tổng hợp bền, đẹp</span></p><p style=\"margin-bottom: 10px; padding: 0px; font-family: Quicksand, sans-serif; line-height: 21px; color: rgb(37, 42, 43); font-size: 13px !important;\"><span data-sheets-value=\"{&quot;1&quot;:2,&quot;2&quot;:&quot;- Chất liệu da tổng hợp bền, đẹp.\\n- Quai ngang thiết kế đơn giản, nữ tính.\\n- Quai hậu dán, tiện dụng.&quot;}\" data-sheets-userformat=\"{&quot;2&quot;:929,&quot;3&quot;:[null,0],&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:3}]},&quot;10&quot;:1,&quot;11&quot;:4,&quot;12&quot;:0}\" data-mce-style=\"font-size: 12pt; color: #000000;\" style=\"margin: 0px; padding: 0px; font-size: 12pt; color: rgb(0, 0, 0);\">Quai ngang thiết kế đơn giản, nữ tính</span></p><p style=\"margin-bottom: 10px; padding: 0px; font-family: Quicksand, sans-serif; line-height: 21px; color: rgb(37, 42, 43); font-size: 13px !important;\"><span data-sheets-value=\"{&quot;1&quot;:2,&quot;2&quot;:&quot;- Chất liệu da tổng hợp bền, đẹp.\\n- Quai ngang thiết kế đơn giản, nữ tính.\\n- Quai hậu dán, tiện dụng.&quot;}\" data-sheets-userformat=\"{&quot;2&quot;:929,&quot;3&quot;:[null,0],&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:3}]},&quot;10&quot;:1,&quot;11&quot;:4,&quot;12&quot;:0}\" data-mce-style=\"font-size: 12pt; color: #000000;\" style=\"margin: 0px; padding: 0px; font-size: 12pt; color: rgb(0, 0, 0);\">Quai hậu dán, tiện dụng</span></p>', 'Túi xách thời trang', 'Da tổng hợp', 'Túi-cỡ-lớn-hoạ-tiết-3D-TXL025-3', NULL, '2020-09-19 14:39:28', NULL);
INSERT INTO `products` VALUES (132, 'DH044001', 'Túi cỡ lớn hoạ tiết 3D TXL025 4', 0, 'IMG756964257.webp;', 'IMG937317566.webp;', '<p style=\"margin-bottom: 10px; padding: 0px; font-family: Quicksand, sans-serif; line-height: 21px; color: rgb(37, 42, 43); font-size: 13px !important;\"><span data-sheets-value=\"{&quot;1&quot;:2,&quot;2&quot;:&quot;- Chất liệu da tổng hợp bền, đẹp.\\n- Quai ngang thiết kế đơn giản, nữ tính.\\n- Quai hậu dán, tiện dụng.&quot;}\" data-sheets-userformat=\"{&quot;2&quot;:929,&quot;3&quot;:[null,0],&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:3}]},&quot;10&quot;:1,&quot;11&quot;:4,&quot;12&quot;:0}\" data-mce-style=\"font-size: 12pt; color: #000000;\" style=\"margin: 0px; padding: 0px; font-size: 12pt; color: rgb(0, 0, 0);\">Chất liệu da tổng hợp bền, đẹp</span></p><p style=\"margin-bottom: 10px; padding: 0px; font-family: Quicksand, sans-serif; line-height: 21px; color: rgb(37, 42, 43); font-size: 13px !important;\"><span data-sheets-value=\"{&quot;1&quot;:2,&quot;2&quot;:&quot;- Chất liệu da tổng hợp bền, đẹp.\\n- Quai ngang thiết kế đơn giản, nữ tính.\\n- Quai hậu dán, tiện dụng.&quot;}\" data-sheets-userformat=\"{&quot;2&quot;:929,&quot;3&quot;:[null,0],&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:3}]},&quot;10&quot;:1,&quot;11&quot;:4,&quot;12&quot;:0}\" data-mce-style=\"font-size: 12pt; color: #000000;\" style=\"margin: 0px; padding: 0px; font-size: 12pt; color: rgb(0, 0, 0);\">Quai ngang thiết kế đơn giản, nữ tính</span></p><p style=\"margin-bottom: 10px; padding: 0px; font-family: Quicksand, sans-serif; line-height: 21px; color: rgb(37, 42, 43); font-size: 13px !important;\"><span data-sheets-value=\"{&quot;1&quot;:2,&quot;2&quot;:&quot;- Chất liệu da tổng hợp bền, đẹp.\\n- Quai ngang thiết kế đơn giản, nữ tính.\\n- Quai hậu dán, tiện dụng.&quot;}\" data-sheets-userformat=\"{&quot;2&quot;:929,&quot;3&quot;:[null,0],&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:3}]},&quot;10&quot;:1,&quot;11&quot;:4,&quot;12&quot;:0}\" data-mce-style=\"font-size: 12pt; color: #000000;\" style=\"margin: 0px; padding: 0px; font-size: 12pt; color: rgb(0, 0, 0);\">Quai hậu dán, tiện dụng</span></p>', 'Túi xách thời trang', 'Da tổng hợp', 'Túi-cỡ-lớn-hoạ-tiết-3D-TXL025-4', NULL, '2020-09-19 14:40:01', NULL);
INSERT INTO `products` VALUES (133, 'DH044033', 'Túi cỡ lớn hoạ tiết 3D TXL025 5', 0, 'IMG739961664.webp;', 'IMG269777523.webp;', '<p style=\"margin-bottom: 10px; padding: 0px; font-family: Quicksand, sans-serif; line-height: 21px; color: rgb(37, 42, 43); font-size: 13px !important;\"><span data-sheets-value=\"{&quot;1&quot;:2,&quot;2&quot;:&quot;- Chất liệu da tổng hợp bền, đẹp.\\n- Quai ngang thiết kế đơn giản, nữ tính.\\n- Quai hậu dán, tiện dụng.&quot;}\" data-sheets-userformat=\"{&quot;2&quot;:929,&quot;3&quot;:[null,0],&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:3}]},&quot;10&quot;:1,&quot;11&quot;:4,&quot;12&quot;:0}\" data-mce-style=\"font-size: 12pt; color: #000000;\" style=\"margin: 0px; padding: 0px; font-size: 12pt; color: rgb(0, 0, 0);\">Chất liệu da tổng hợp bền, đẹp</span></p><p style=\"margin-bottom: 10px; padding: 0px; font-family: Quicksand, sans-serif; line-height: 21px; color: rgb(37, 42, 43); font-size: 13px !important;\"><span data-sheets-value=\"{&quot;1&quot;:2,&quot;2&quot;:&quot;- Chất liệu da tổng hợp bền, đẹp.\\n- Quai ngang thiết kế đơn giản, nữ tính.\\n- Quai hậu dán, tiện dụng.&quot;}\" data-sheets-userformat=\"{&quot;2&quot;:929,&quot;3&quot;:[null,0],&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:3}]},&quot;10&quot;:1,&quot;11&quot;:4,&quot;12&quot;:0}\" data-mce-style=\"font-size: 12pt; color: #000000;\" style=\"margin: 0px; padding: 0px; font-size: 12pt; color: rgb(0, 0, 0);\">Quai ngang thiết kế đơn giản, nữ tính</span></p><p style=\"margin-bottom: 10px; padding: 0px; font-family: Quicksand, sans-serif; line-height: 21px; color: rgb(37, 42, 43); font-size: 13px !important;\"><span data-sheets-value=\"{&quot;1&quot;:2,&quot;2&quot;:&quot;- Chất liệu da tổng hợp bền, đẹp.\\n- Quai ngang thiết kế đơn giản, nữ tính.\\n- Quai hậu dán, tiện dụng.&quot;}\" data-sheets-userformat=\"{&quot;2&quot;:929,&quot;3&quot;:[null,0],&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:3}]},&quot;10&quot;:1,&quot;11&quot;:4,&quot;12&quot;:0}\" data-mce-style=\"font-size: 12pt; color: #000000;\" style=\"margin: 0px; padding: 0px; font-size: 12pt; color: rgb(0, 0, 0);\">Quai hậu dán, tiện dụng</span></p>', 'Túi xách thời trang', 'Da tổng hợp', 'Túi-cỡ-lớn-hoạ-tiết-3D-TXL025-5', NULL, '2020-09-19 14:40:33', NULL);
INSERT INTO `products` VALUES (134, 'DH044103', 'Túi cỡ lớn hoạ tiết 3D TXL025 6', 0, 'IMG20827692.webp;', 'IMG886632469.webp;', '<p style=\"margin-bottom: 10px; padding: 0px; font-family: Quicksand, sans-serif; line-height: 21px; color: rgb(37, 42, 43); font-size: 13px !important;\"><span data-sheets-value=\"{&quot;1&quot;:2,&quot;2&quot;:&quot;- Chất liệu da tổng hợp bền, đẹp.\\n- Quai ngang thiết kế đơn giản, nữ tính.\\n- Quai hậu dán, tiện dụng.&quot;}\" data-sheets-userformat=\"{&quot;2&quot;:929,&quot;3&quot;:[null,0],&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:3}]},&quot;10&quot;:1,&quot;11&quot;:4,&quot;12&quot;:0}\" data-mce-style=\"font-size: 12pt; color: #000000;\" style=\"margin: 0px; padding: 0px; font-size: 12pt; color: rgb(0, 0, 0);\">Chất liệu da tổng hợp bền, đẹp</span></p><p style=\"margin-bottom: 10px; padding: 0px; font-family: Quicksand, sans-serif; line-height: 21px; color: rgb(37, 42, 43); font-size: 13px !important;\"><span data-sheets-value=\"{&quot;1&quot;:2,&quot;2&quot;:&quot;- Chất liệu da tổng hợp bền, đẹp.\\n- Quai ngang thiết kế đơn giản, nữ tính.\\n- Quai hậu dán, tiện dụng.&quot;}\" data-sheets-userformat=\"{&quot;2&quot;:929,&quot;3&quot;:[null,0],&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:3}]},&quot;10&quot;:1,&quot;11&quot;:4,&quot;12&quot;:0}\" data-mce-style=\"font-size: 12pt; color: #000000;\" style=\"margin: 0px; padding: 0px; font-size: 12pt; color: rgb(0, 0, 0);\">Quai ngang thiết kế đơn giản, nữ tính</span></p><p style=\"margin-bottom: 10px; padding: 0px; font-family: Quicksand, sans-serif; line-height: 21px; color: rgb(37, 42, 43); font-size: 13px !important;\"><span data-sheets-value=\"{&quot;1&quot;:2,&quot;2&quot;:&quot;- Chất liệu da tổng hợp bền, đẹp.\\n- Quai ngang thiết kế đơn giản, nữ tính.\\n- Quai hậu dán, tiện dụng.&quot;}\" data-sheets-userformat=\"{&quot;2&quot;:929,&quot;3&quot;:[null,0],&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:3}]},&quot;10&quot;:1,&quot;11&quot;:4,&quot;12&quot;:0}\" data-mce-style=\"font-size: 12pt; color: #000000;\" style=\"margin: 0px; padding: 0px; font-size: 12pt; color: rgb(0, 0, 0);\">Quai hậu dán, tiện dụng</span></p>', 'Túi xách thời trang', 'Da tổng hợp', 'Túi-cỡ-lớn-hoạ-tiết-3D-TXL025-6', NULL, '2020-09-19 14:41:03', NULL);
INSERT INTO `products` VALUES (135, 'DH044131', 'Túi cỡ lớn hoạ tiết 3D TXL025 7', 0, 'IMG714343577.webp;', 'IMG132202810.webp;', '<p style=\"margin-bottom: 10px; padding: 0px; font-family: Quicksand, sans-serif; line-height: 21px; color: rgb(37, 42, 43); font-size: 13px !important;\"><span data-sheets-value=\"{&quot;1&quot;:2,&quot;2&quot;:&quot;- Chất liệu da tổng hợp bền, đẹp.\\n- Quai ngang thiết kế đơn giản, nữ tính.\\n- Quai hậu dán, tiện dụng.&quot;}\" data-sheets-userformat=\"{&quot;2&quot;:929,&quot;3&quot;:[null,0],&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:3}]},&quot;10&quot;:1,&quot;11&quot;:4,&quot;12&quot;:0}\" data-mce-style=\"font-size: 12pt; color: #000000;\" style=\"margin: 0px; padding: 0px; font-size: 12pt; color: rgb(0, 0, 0);\">Chất liệu da tổng hợp bền, đẹp</span></p><p style=\"margin-bottom: 10px; padding: 0px; font-family: Quicksand, sans-serif; line-height: 21px; color: rgb(37, 42, 43); font-size: 13px !important;\"><span data-sheets-value=\"{&quot;1&quot;:2,&quot;2&quot;:&quot;- Chất liệu da tổng hợp bền, đẹp.\\n- Quai ngang thiết kế đơn giản, nữ tính.\\n- Quai hậu dán, tiện dụng.&quot;}\" data-sheets-userformat=\"{&quot;2&quot;:929,&quot;3&quot;:[null,0],&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:3}]},&quot;10&quot;:1,&quot;11&quot;:4,&quot;12&quot;:0}\" data-mce-style=\"font-size: 12pt; color: #000000;\" style=\"margin: 0px; padding: 0px; font-size: 12pt; color: rgb(0, 0, 0);\">Quai ngang thiết kế đơn giản, nữ tính</span></p><p style=\"margin-bottom: 10px; padding: 0px; font-family: Quicksand, sans-serif; line-height: 21px; color: rgb(37, 42, 43); font-size: 13px !important;\"><span data-sheets-value=\"{&quot;1&quot;:2,&quot;2&quot;:&quot;- Chất liệu da tổng hợp bền, đẹp.\\n- Quai ngang thiết kế đơn giản, nữ tính.\\n- Quai hậu dán, tiện dụng.&quot;}\" data-sheets-userformat=\"{&quot;2&quot;:929,&quot;3&quot;:[null,0],&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:3}]},&quot;10&quot;:1,&quot;11&quot;:4,&quot;12&quot;:0}\" data-mce-style=\"font-size: 12pt; color: #000000;\" style=\"margin: 0px; padding: 0px; font-size: 12pt; color: rgb(0, 0, 0);\">Quai hậu dán, tiện dụng</span></p>', 'Túi xách thời trang', 'Da tổng hợp', 'Túi-cỡ-lớn-hoạ-tiết-3D-TXL025-7', NULL, '2020-09-19 14:41:31', NULL);
INSERT INTO `products` VALUES (136, 'DH044219', 'Túi cỡ lớn hoạ tiết 3D TXL025 8', 0, 'IMG419412842.webp;', 'IMG96736682.webp;', '<p style=\"margin-bottom: 10px; padding: 0px; font-family: Quicksand, sans-serif; line-height: 21px; color: rgb(37, 42, 43); font-size: 13px !important;\"><span data-sheets-value=\"{&quot;1&quot;:2,&quot;2&quot;:&quot;- Chất liệu da tổng hợp bền, đẹp.\\n- Quai ngang thiết kế đơn giản, nữ tính.\\n- Quai hậu dán, tiện dụng.&quot;}\" data-sheets-userformat=\"{&quot;2&quot;:929,&quot;3&quot;:[null,0],&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:3}]},&quot;10&quot;:1,&quot;11&quot;:4,&quot;12&quot;:0}\" data-mce-style=\"font-size: 12pt; color: #000000;\" style=\"margin: 0px; padding: 0px; font-size: 12pt; color: rgb(0, 0, 0);\">Chất liệu da tổng hợp bền, đẹp</span></p><p style=\"margin-bottom: 10px; padding: 0px; font-family: Quicksand, sans-serif; line-height: 21px; color: rgb(37, 42, 43); font-size: 13px !important;\"><span data-sheets-value=\"{&quot;1&quot;:2,&quot;2&quot;:&quot;- Chất liệu da tổng hợp bền, đẹp.\\n- Quai ngang thiết kế đơn giản, nữ tính.\\n- Quai hậu dán, tiện dụng.&quot;}\" data-sheets-userformat=\"{&quot;2&quot;:929,&quot;3&quot;:[null,0],&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:3}]},&quot;10&quot;:1,&quot;11&quot;:4,&quot;12&quot;:0}\" data-mce-style=\"font-size: 12pt; color: #000000;\" style=\"margin: 0px; padding: 0px; font-size: 12pt; color: rgb(0, 0, 0);\">Quai ngang thiết kế đơn giản, nữ tính</span></p><p style=\"margin-bottom: 10px; padding: 0px; font-family: Quicksand, sans-serif; line-height: 21px; color: rgb(37, 42, 43); font-size: 13px !important;\"><span data-sheets-value=\"{&quot;1&quot;:2,&quot;2&quot;:&quot;- Chất liệu da tổng hợp bền, đẹp.\\n- Quai ngang thiết kế đơn giản, nữ tính.\\n- Quai hậu dán, tiện dụng.&quot;}\" data-sheets-userformat=\"{&quot;2&quot;:929,&quot;3&quot;:[null,0],&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:3}]},&quot;10&quot;:1,&quot;11&quot;:4,&quot;12&quot;:0}\" data-mce-style=\"font-size: 12pt; color: #000000;\" style=\"margin: 0px; padding: 0px; font-size: 12pt; color: rgb(0, 0, 0);\">Quai hậu dán, tiện dụng</span></p>', 'Túi xách thời trang', 'Da tổng hợp', 'Túi-cỡ-lớn-hoạ-tiết-3D-TXL025-8', NULL, '2020-09-19 14:42:19', NULL);
INSERT INTO `products` VALUES (137, 'DH044245', 'Túi cỡ lớn hoạ tiết 3D TXL025 9', 0, 'IMG44660187.webp;', 'IMG920369205.webp;', '<p style=\"margin-bottom: 10px; padding: 0px; font-family: Quicksand, sans-serif; line-height: 21px; color: rgb(37, 42, 43); font-size: 13px !important;\"><span data-sheets-value=\"{&quot;1&quot;:2,&quot;2&quot;:&quot;- Chất liệu da tổng hợp bền, đẹp.\\n- Quai ngang thiết kế đơn giản, nữ tính.\\n- Quai hậu dán, tiện dụng.&quot;}\" data-sheets-userformat=\"{&quot;2&quot;:929,&quot;3&quot;:[null,0],&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:3}]},&quot;10&quot;:1,&quot;11&quot;:4,&quot;12&quot;:0}\" data-mce-style=\"font-size: 12pt; color: #000000;\" style=\"margin: 0px; padding: 0px; font-size: 12pt; color: rgb(0, 0, 0);\">Chất liệu da tổng hợp bền, đẹp</span></p><p style=\"margin-bottom: 10px; padding: 0px; font-family: Quicksand, sans-serif; line-height: 21px; color: rgb(37, 42, 43); font-size: 13px !important;\"><span data-sheets-value=\"{&quot;1&quot;:2,&quot;2&quot;:&quot;- Chất liệu da tổng hợp bền, đẹp.\\n- Quai ngang thiết kế đơn giản, nữ tính.\\n- Quai hậu dán, tiện dụng.&quot;}\" data-sheets-userformat=\"{&quot;2&quot;:929,&quot;3&quot;:[null,0],&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:3}]},&quot;10&quot;:1,&quot;11&quot;:4,&quot;12&quot;:0}\" data-mce-style=\"font-size: 12pt; color: #000000;\" style=\"margin: 0px; padding: 0px; font-size: 12pt; color: rgb(0, 0, 0);\">Quai ngang thiết kế đơn giản, nữ tính</span></p><p style=\"margin-bottom: 10px; padding: 0px; font-family: Quicksand, sans-serif; line-height: 21px; color: rgb(37, 42, 43); font-size: 13px !important;\"><span data-sheets-value=\"{&quot;1&quot;:2,&quot;2&quot;:&quot;- Chất liệu da tổng hợp bền, đẹp.\\n- Quai ngang thiết kế đơn giản, nữ tính.\\n- Quai hậu dán, tiện dụng.&quot;}\" data-sheets-userformat=\"{&quot;2&quot;:929,&quot;3&quot;:[null,0],&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:3}]},&quot;10&quot;:1,&quot;11&quot;:4,&quot;12&quot;:0}\" data-mce-style=\"font-size: 12pt; color: #000000;\" style=\"margin: 0px; padding: 0px; font-size: 12pt; color: rgb(0, 0, 0);\">Quai hậu dán, tiện dụng</span></p>', 'Túi xách thời trang', 'Da tổng hợp', 'Túi-cỡ-lớn-hoạ-tiết-3D-TXL025-9', NULL, '2020-09-19 14:42:45', NULL);
INSERT INTO `products` VALUES (138, 'DH044323', 'Túi cỡ lớn hoạ tiết 3D TXL025 10', 0, 'IMG28762374.webp;', 'IMG770991354.webp;', '<p style=\"margin-bottom: 10px; padding: 0px; font-family: Quicksand, sans-serif; line-height: 21px; color: rgb(37, 42, 43); font-size: 13px !important;\"><span data-sheets-value=\"{&quot;1&quot;:2,&quot;2&quot;:&quot;- Chất liệu da tổng hợp bền, đẹp.\\n- Quai ngang thiết kế đơn giản, nữ tính.\\n- Quai hậu dán, tiện dụng.&quot;}\" data-sheets-userformat=\"{&quot;2&quot;:929,&quot;3&quot;:[null,0],&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:3}]},&quot;10&quot;:1,&quot;11&quot;:4,&quot;12&quot;:0}\" data-mce-style=\"font-size: 12pt; color: #000000;\" style=\"margin: 0px; padding: 0px; font-size: 12pt; color: rgb(0, 0, 0);\">Chất liệu da tổng hợp bền, đẹp</span></p><p style=\"margin-bottom: 10px; padding: 0px; font-family: Quicksand, sans-serif; line-height: 21px; color: rgb(37, 42, 43); font-size: 13px !important;\"><span data-sheets-value=\"{&quot;1&quot;:2,&quot;2&quot;:&quot;- Chất liệu da tổng hợp bền, đẹp.\\n- Quai ngang thiết kế đơn giản, nữ tính.\\n- Quai hậu dán, tiện dụng.&quot;}\" data-sheets-userformat=\"{&quot;2&quot;:929,&quot;3&quot;:[null,0],&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:3}]},&quot;10&quot;:1,&quot;11&quot;:4,&quot;12&quot;:0}\" data-mce-style=\"font-size: 12pt; color: #000000;\" style=\"margin: 0px; padding: 0px; font-size: 12pt; color: rgb(0, 0, 0);\">Quai ngang thiết kế đơn giản, nữ tính</span></p><p style=\"margin-bottom: 10px; padding: 0px; font-family: Quicksand, sans-serif; line-height: 21px; color: rgb(37, 42, 43); font-size: 13px !important;\"><span data-sheets-value=\"{&quot;1&quot;:2,&quot;2&quot;:&quot;- Chất liệu da tổng hợp bền, đẹp.\\n- Quai ngang thiết kế đơn giản, nữ tính.\\n- Quai hậu dán, tiện dụng.&quot;}\" data-sheets-userformat=\"{&quot;2&quot;:929,&quot;3&quot;:[null,0],&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:3}]},&quot;10&quot;:1,&quot;11&quot;:4,&quot;12&quot;:0}\" data-mce-style=\"font-size: 12pt; color: #000000;\" style=\"margin: 0px; padding: 0px; font-size: 12pt; color: rgb(0, 0, 0);\">Quai hậu dán, tiện dụng</span></p>', 'Túi xách thời trang', 'Da tổng hợp', 'Túi-cỡ-lớn-hoạ-tiết-3D-TXL025-10', NULL, '2020-09-19 14:43:23', NULL);

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `description` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `role` int(11) NULL DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES (1, 'Quản trị viên', 'Phân quyền cao nhất, sử dụng đầy đủ mọi chức năng của hệ thống', 1, NULL, NULL, '2020-09-20 23:28:18', NULL);
INSERT INTO `roles` VALUES (2, 'Quản lý sản phẩm', 'Danh sách sản phẩm;Thêm mới/cập nhật/xóa sản phẩm;Đầy đủ tính năng của sản phẩm', 2, NULL, NULL, '2020-09-20 23:31:12', NULL);
INSERT INTO `roles` VALUES (3, 'Quản lý đơn hàng', 'Quản lý đơn hàng, cập nhật đơn hàng...', 3, NULL, NULL, '2020-09-20 23:31:16', NULL);
INSERT INTO `roles` VALUES (4, 'Quản lý nội dung', 'Cài đặt mặc định; Quản lí danh mục;Thêm,Sửa,Xóa Danh mục', 4, NULL, NULL, '2020-09-20 23:31:18', NULL);
INSERT INTO `roles` VALUES (5, 'Chưa cấp quyền', NULL, 0, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for setting
-- ----------------------------
DROP TABLE IF EXISTS `setting`;
CREATE TABLE `setting`  (
  `setting` int(50) NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `phone_support` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `link_fb` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `link_zalo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `link_youtube` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `link_instagram` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of setting
-- ----------------------------
INSERT INTO `setting` VALUES (1, '21ád', '12ád', '12ádasd', '12', '12ádasd', '12', '1212', '1212', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `id_role` int(20) NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'khanh', 1, 'khanh@gmail.com', '$2y$10$jFPiXjT.X3vQmQ9X7fnfS.6D4qhiFRw0l1grJ7yBr.7xAtpjr2UfO', NULL, NULL, '2020-09-21 11:38:05', NULL);
INSERT INTO `user` VALUES (11, 'khanh1', 1, 'khanh1@gmail.com', '$2y$10$L6t1sarfv0YO1rqWk61oGOSqYAUOk5Jlw8TDIKjGuHRUOAKeVdf9m', NULL, NULL, '2020-09-21 11:40:59', NULL);
INSERT INTO `user` VALUES (17, 'khanh2', 4, 'khanh4@gmail.com', '$2y$10$/sYrjHTpW3uzbVt71HWnNOcuBbjh9q0cg/kalNlUYSeQiX.g.GAYG', NULL, NULL, '2020-09-21 12:08:52', NULL);
INSERT INTO `user` VALUES (19, 'Lâm Khánh', 1, 'khanh11@gmail.com', '$2y$10$I8ca/Ta3hXjYfBQf1qmxU.tb0CsCmcRJWj45MGMdaJYgUBsJCN7je', NULL, NULL, '2020-09-22 16:43:08', '2020-09-22 16:43:08');
INSERT INTO `user` VALUES (20, 'Lâm Khánh', 2, 'khanh111@gmail.com', '$2y$10$QSQcSSA7lsjtV.hgV3Qcju2qrdILlvehC2qHWMBFntzuAXnj5LTm2', NULL, NULL, '2020-09-22 16:59:46', '2020-09-22 16:59:46');

SET FOREIGN_KEY_CHECKS = 1;
