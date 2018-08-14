-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 13, 2018 at 10:13 AM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 7.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `envato_pos`
--

-- --------------------------------------------------------

--
-- Table structure for table `activities`
--

CREATE TABLE `activities` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `activity` varchar(55) DEFAULT NULL,
  `datetime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `activities`
--

INSERT INTO `activities` (`id`, `user_id`, `activity`, `datetime`) VALUES
(1, 6, 'Logout', '2018-01-20 05:54:34'),
(2, 5, 'Login', '2018-01-20 05:55:06'),
(3, 5, 'Logout', '2018-05-13 03:09:18'),
(4, 5, 'Login', '2018-05-13 03:09:31');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `address` text COLLATE utf8_unicode_ci NOT NULL,
  `neighborhood` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `comments` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `email`, `password`, `phone`, `address`, `neighborhood`, `created_at`, `updated_at`, `deleted_at`, `comments`) VALUES
(1, 'Muhammad Arfan', 'arfan67@gmail.com', NULL, '03005095213', 'this is a address no', 'test', NULL, '2018-02-02 08:58:59', NULL, 'test'),
(2, 'M Arfan', '', NULL, '', '3rd Floor 86', 'Cavalry Ground', NULL, NULL, NULL, 'comment her e');

-- --------------------------------------------------------

--
-- Table structure for table `expense`
--

CREATE TABLE `expense` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `price` double(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `price` double(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `homepage`
--

CREATE TABLE `homepage` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `label` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `homepage`
--

INSERT INTO `homepage` (`id`, `key`, `type`, `label`, `value`, `created_at`, `updated_at`) VALUES
(1, 'story_title', 'text', 'Story Title', '<span>Discover</span>Our Story', NULL, '2017-09-20 16:13:04'),
(2, 'story_desc', 'textarea', 'Story Description', 'accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est.', NULL, '2017-09-20 16:13:04'),
(3, 'menu_title', 'text', 'Menu Title', '<span>Discover</span>Our Menu', NULL, '2017-09-20 16:13:04'),
(4, 'menu_desc', 'textarea', 'Menu Description', 'accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est.', NULL, '2017-09-20 16:13:04'),
(5, 'img_title1', 'text', 'Image Title 1', '<h2><span>We Are Sharing</span></h2>                    <h1>delicious treats</h1>', NULL, '2017-09-25 16:36:13'),
(6, 'img_title2', 'text', 'Image Title 2', '<h2><span>The Perfect</span></h2>                    <h1>Blend</h1>', NULL, '2017-09-25 16:36:13'),
(7, 'category', NULL, 'Home Categories', '', NULL, '2017-09-25 17:16:32');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `menu_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `link` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `order_by` int(11) NOT NULL,
  `translate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`menu_id`, `parent_id`, `link`, `title`, `active`, `order_by`, `translate`) VALUES
(1, 0, 'home', 'Home', 1, 1, 'Home'),
(2, 0, 'map-home', 'Map Home', 1, 2, 'MapHome'),
(3, 0, 'about-us', 'About Us', 1, 3, 'About'),
(4, 3, 'gallery', 'Gallery', 1, 1, 'Gallery'),
(5, 0, 'contact-us', 'Contact', 1, 5, 'Contact'),
(6, 3, 'services', 'Services', 1, 2, 'Services'),
(7, 3, 'listing?type=RENT', 'Rent', 1, 5, 'Rent'),
(8, 3, 'listing?type=SALE', 'Sale', 1, 3, 'Sale'),
(9, 0, 'faq', 'FAQ', 0, 2, 'Faq'),
(10, 3, 'blog', 'Blog', 1, 4, 'Blog'),
(12, 0, 'all-agent', 'Agents', 1, 4, 'Agents'),
(13, 0, 'admin', 'Submit Property', 1, 6, 'Submit_Property'),
(14, 0, 'loan-calculator', 'Calculator', 0, 3, 'Calculator');

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
(1, '2017_10_16_183611_create_categories_table', 0),
(2, '2017_10_16_183611_create_customers_table', 0),
(3, '2017_10_16_183611_create_homepage_table', 0),
(4, '2017_10_16_183611_create_menus_table', 0),
(5, '2017_10_16_183611_create_newsletters_table', 0),
(6, '2017_10_16_183611_create_pages_table', 0),
(7, '2017_10_16_183611_create_password_resets_table', 0),
(8, '2017_10_16_183611_create_permission_role_table', 0),
(9, '2017_10_16_183611_create_permissions_table', 0),
(10, '2017_10_16_183611_create_products_table', 0),
(11, '2017_10_16_183611_create_roles_table', 0),
(12, '2017_10_16_183611_create_sale_items_table', 0),
(13, '2017_10_16_183611_create_sales_table', 0),
(14, '2017_10_16_183611_create_settings_table', 0),
(15, '2017_10_16_183611_create_sliders_table', 0),
(16, '2017_10_16_183611_create_suppliers_table', 0),
(17, '2017_10_16_183611_create_users_table', 0),
(18, '2017_10_23_101103_create_categories_table', 0),
(19, '2017_10_23_101103_create_customers_table', 0),
(20, '2017_10_23_101103_create_homepage_table', 0),
(21, '2017_10_23_101103_create_menus_table', 0),
(22, '2017_10_23_101103_create_newsletters_table', 0),
(23, '2017_10_23_101103_create_pages_table', 0),
(24, '2017_10_23_101103_create_password_resets_table', 0),
(25, '2017_10_23_101103_create_permission_role_table', 0),
(26, '2017_10_23_101103_create_permissions_table', 0),
(27, '2017_10_23_101103_create_products_table', 0),
(28, '2017_10_23_101103_create_roles_table', 0),
(29, '2017_10_23_101103_create_sale_items_table', 0),
(30, '2017_10_23_101103_create_sales_table', 0),
(31, '2017_10_23_101103_create_settings_table', 0),
(32, '2017_10_23_101103_create_sliders_table', 0),
(33, '2017_10_23_101103_create_suppliers_table', 0),
(34, '2017_10_23_101103_create_users_table', 0),
(35, '2017_12_15_163503_entrust_setup_tables', 1);

-- --------------------------------------------------------

--
-- Table structure for table `newsletters`
--

CREATE TABLE `newsletters` (
  `id` int(11) NOT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `newsletters`
--

INSERT INTO `newsletters` (`id`, `email`) VALUES
(5, 'arfan67@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `body` longtext NOT NULL,
  `parent_id` int(11) NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `title`, `slug`, `image`, `body`, `parent_id`, `is_delete`) VALUES
(1, 'Terms & Condition', 'services', '574724_page.jpg', 'Pellentesque pellentesque eget tempor tellus. Fusce lacllentesque eget tempor tellus ellentesque pelleinia tempor malesuada. Pellentesque pellentesque eget tempor tellus ellentesque pellentesque eget tempor tellus. Fusce lacinia tempor malesuada.\r\n\r\n                            <h2>H2 Heading</h2>\r\n                            <p>Pellentesque pellentesque usce lacllentesque eget tempor tellus ellentesque pelleinia tempor malesuada. Pellentesque pellentesque eget tempor tellus ellentesque pellentesque eget tempor tellus.  tellus eget tempor. Fusce lacinia tempor malesuada.</p>\r\n\r\n                            <h3>H3 Heading</h3>\r\n                            <p>Pellentesque tempor tellus eget pellentesque. usce lacllentesque eget tempor tellus ellentesque pelleinia tempor malesuada. Pellentesque pellentesque eget tempor tellus ellentesque pellentesque eget tempor tellus.  Fusce lacinia tempor malesuada.</p>\r\n\r\n                            <h4>H4 Heading</h4>\r\n                            <p>Pellentesque pellentesque tempor tellus eget fermentum. usce lacllentesque eget tempor tellus ellentesque pelleinia tempor malesuada. Pellentesque pellentesque eget tempor tellus ellentesque pellentesque eget tempor tellus. </p>\r\n\r\n                            <h5>H5 Heading</h5><div>this is a test editing </div>\r\n                            <p>Pellentesque pellentesque tempor llentesque pellentesque tempor tellus eget libero llentesque pellentesque tempor tellus eget libero tellus ementellentesque tempor tellus eget fermentum. usce lacllentesque eget tempor tellus ellenellentesque tempor tellus eget fermentum. usce lacllentesque eget tempor tellus ellenum.</p>\r\n\r\n                            <h6>H6 Heading</h6>\r\n                            <p>Pellentesque pellentesque tempor tellus eget libero</p>', 0, 0),
(2, 'FAQ', 'faq', 'page2.jpg', '<div><span style="color: rgb(102, 102, 102); font-family: " varela="" round",="" sans-serif;="" font-size:="" 16px;"="">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sed voluptate nihil eum consectetur similique?</span><span style="font-weight: bold;"><br></span></div><div><span style="color: rgb(102, 102, 102); font-family: " varela="" round",="" sans-serif;="" font-size:="" 16px;"="">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sed voluptate nihil eum consectetur similique?<br></span></div><div><span style="color: rgb(102, 102, 102); font-family: " varela="" round",="" sans-serif;="" font-size:="" 16px;"=""><br></span></div><div><span style="font-weight: bold;">1 : this is a question number 1</span><div><span style="color: rgb(102, 102, 102); font-family: " varela="" round",="" sans-serif;="" font-size:="" 16px;"="">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sed voluptate nihil eum consectetur similique?</span></div></div><div><span style="color: rgb(102, 102, 102); font-family: " varela="" round",="" sans-serif;="" font-size:="" 16px;"=""><br></span></div><div><span style="font-weight: bold;">1 : this is a question number 1</span><div><span style="color: rgb(102, 102, 102); font-family: " varela="" round",="" sans-serif;="" font-size:="" 16px;"="">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sed voluptate nihil eum consectetur similique?</span></div></div><div><span style="color: rgb(102, 102, 102); font-family: " varela="" round",="" sans-serif;="" font-size:="" 16px;"=""><br></span></div><div><span style="color: rgb(102, 102, 102); font-family: " varela="" round",="" sans-serif;="" font-size:="" 16px;"=""><span style="color: rgb(103, 106, 108); font-weight: bold;">1 : this is a question number 1</span><div style="color: rgb(103, 106, 108);"><span varela="" round",="" sans-serif;="" font-size:="" 16px;"="" style="color: rgb(102, 102, 102);">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sed voluptate nihil eum consectetur similique?</span></div><div style="color: rgb(103, 106, 108);"><span varela="" round",="" sans-serif;="" font-size:="" 16px;"="" style="color: rgb(102, 102, 102);"><br></span></div><div style="color: rgb(103, 106, 108);"><span varela="" round",="" sans-serif;="" font-size:="" 16px;"="" style="color: rgb(102, 102, 102);"><span style="color: rgb(103, 106, 108); font-weight: bold;">1 : this is a question number 1</span><div style="color: rgb(103, 106, 108);"><span varela="" round",="" sans-serif;="" font-size:="" 16px;"="" style="color: rgb(102, 102, 102);">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sed voluptate nihil eum consectetur similique?</span></div><div style="color: rgb(103, 106, 108);"><span varela="" round",="" sans-serif;="" font-size:="" 16px;"="" style="color: rgb(102, 102, 102);"><br></span></div><div style="color: rgb(103, 106, 108);"><span varela="" round",="" sans-serif;="" font-size:="" 16px;"="" style="color: rgb(102, 102, 102);"><span style="color: rgb(103, 106, 108); font-weight: bold;">1 : this is a question number 1</span><div style="color: rgb(103, 106, 108);"><span varela="" round",="" sans-serif;="" font-size:="" 16px;"="" style="color: rgb(102, 102, 102);">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sed voluptate nihil eum consectetur similique?</span></div></span></div></span></div></span></div>', 0, 0),
(3, 'About Us', 'about-us', 'page3.jpg', '<p> Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sed voluptate nihil eum consectetur similique? Consectetur, quod, incidunt, harum nisi dolores delectus reprehenderit voluptatem perferendis dicta dolorem non blanditiis ex fugiat. </p>\r\n\r\n\r\n<h2> Heading 2</h2>\r\n\r\n<p> Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sed voluptate nihil eum consectetur similique? Consectetur, quod, incidunt, harum nisi dolores delectus reprehenderit voluptatem perferendis dicta dolorem non blanditiis ex fugiat. </p><p><br></p><h2 style="color: rgb(103, 106, 108);">Heading 2</h2><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sed voluptate nihil eum consectetur similique? Consectetur, quod, incidunt, harum nisi dolores delectus reprehenderit voluptatem perferendis dicta dolorem non blanditiis ex fugiat.</p>', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'view_sale', 'View Sales ', NULL, NULL, NULL),
(2, 'add_sale', 'Add Sales', NULL, NULL, NULL),
(3, 'add_product', 'Add Product ', NULL, NULL, NULL),
(4, 'view_products', 'View Products', NULL, NULL, NULL),
(5, 'edit_products', 'Edit Products', NULL, NULL, NULL),
(6, 'delete_products', 'Delete Products', NULL, NULL, NULL),
(7, 'add_category', 'Add Category ', NULL, NULL, NULL),
(8, 'view_categorys', 'View Categorys', NULL, NULL, NULL),
(9, 'edit_categorys', 'Edit Categorys', NULL, NULL, NULL),
(10, 'delete_categorys', 'Delete Categorys', NULL, NULL, NULL),
(11, 'add_expense', 'Add Expense ', NULL, NULL, NULL),
(12, 'view_expense', 'View Expenses', NULL, NULL, NULL),
(13, 'edit_expense', 'Edit Expenses', NULL, NULL, NULL),
(14, 'delete_expense', 'Delete Expenses', NULL, NULL, NULL),
(15, 'setting', 'Overall Setting', NULL, NULL, NULL),
(16, 'frontend_setting', 'Frontend Setting', NULL, NULL, NULL),
(17, 'reports', 'View Reports ', NULL, NULL, NULL),
(18, 'roles', 'Manage Roles ', NULL, NULL, NULL),
(19, 'dashboard', 'Dasoboard', NULL, NULL, NULL),
(20, 'users', 'Manage Users', NULL, NULL, NULL),
(21, 'Profile', 'View Profile', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 2),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(17, 2),
(18, 1),
(19, 1),
(19, 2),
(20, 1),
(21, 1),
(21, 2);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `barcode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `titles` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prices` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT '0',
  `is_delete` int(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Super Administrator', 'Main Admin', NULL, '2018-01-20 16:07:14'),
(2, 'manager', 'Sales Manager', NULL, NULL, '2017-12-15 12:38:09'),
(3, 'sales_staff', 'Sales Staff', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE `role_user` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_user`
--

INSERT INTO `role_user` (`user_id`, `role_id`) VALUES
(5, 1),
(6, 2);

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(11) DEFAULT '0',
  `cashier_id` int(11) DEFAULT NULL,
  `comments` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1' COMMENT '1:completed, 0 canceled',
  `amount` double(10,2) NOT NULL DEFAULT '0.00',
  `discount` double(10,2) DEFAULT '0.00',
  `vat` double(10,2) DEFAULT '0.00',
  `delivery_cost` double(10,2) DEFAULT '0.00',
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(10) COLLATE utf8_unicode_ci DEFAULT 'pos',
  `payment_with` enum('card','cash') COLLATE utf8_unicode_ci DEFAULT 'cash',
  `total_given` double(10,2) DEFAULT NULL,
  `change` double(10,2) NOT NULL DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sale_items`
--

CREATE TABLE `sale_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `sale_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `p_qty` int(11) NOT NULL DEFAULT '0',
  `size` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `label`, `value`, `created_at`, `updated_at`) VALUES
(1, 'title', 'Site Title', 'Haze Store', NULL, '2017-12-05 21:50:56'),
(2, 'phone', 'Phone', '', NULL, '2018-01-08 06:59:30'),
(3, 'email', 'Email', 'admin@hazestore.ca', NULL, '2017-11-24 23:08:07'),
(4, 'address', 'Address', '1917 King St. E, Hamilton, ON. L8K 1V9', NULL, '2017-12-05 22:30:59'),
(5, 'country', 'Country', 'Canada', NULL, '2017-11-24 23:08:07'),
(6, 'timing1', 'Monday To Saturday', '8am to 9pm', NULL, '2017-11-25 00:42:30'),
(7, 'sunday', 'Sunday', 'Closed', NULL, '2017-09-18 18:19:34'),
(8, 'facebook', 'Facebook', '', NULL, '2018-01-08 06:59:30'),
(9, 'twitter', 'Twitter', '', NULL, '2018-01-08 06:59:30'),
(10, 'vat', 'VAT', '10', NULL, '2017-12-26 18:22:29'),
(11, 'delivery_cost', 'Delivery Cost', '0', NULL, '2017-11-29 22:47:39'),
(12, 'currency', 'Currency', '$', NULL, '2017-10-03 17:00:43'),
(13, 'lng', 'Longitude', '', NULL, '2018-01-08 06:59:30'),
(14, 'lat', 'Latitude', '', NULL, '2018-01-08 06:59:30'),
(15, 'stripe', 'Stripe Payment', 'no', NULL, '2017-11-24 23:08:07'),
(16, 'frontend', 'Hide Frontend', 'yes', NULL, NULL),
(17, 'promotions', 'Receipt Message', 'this is a receipt message edit', NULL, '2017-12-13 23:02:56'),
(18, 'discount', 'Discount ($)', '3', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `image` varchar(500) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `title`, `image`, `created_at`, `updated_at`) VALUES
(6, 'Slider Image', '333296.jpg', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `company_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `role_id` int(11) NOT NULL DEFAULT '0',
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role_id`, `remember_token`, `created_at`, `updated_at`) VALUES
(5, 'Admin', 'admin@example.com', '$2y$10$NDJ8GvTAdoJ/uG0AQ2Y.9ucXwjy75NVf.VgFnSZDSakRRvrEyAlMq', 1, 'KRF0HVSsgQD2AWiHoB26JRJ7UZvVgjH4O99GkYkiSRfigvVKhvejJtc1OZ9b', NULL, '2017-12-05 04:48:48'),
(6, 'Sale Manger', 'sales@manager.com', '$2y$10$iYBfnTfkOkgHohZFTErZEOahsjR9LSTWyiWBb07mXBVOLTEvUN/qG', 2, '4n7V8mO4Dh0Q3ztxF58HVnxZWDjOmZ7gtodRLEFBnQ675YE9yZK8Lkuuhsm3', NULL, NULL),
(8, 'sales Staff', 'sales@staff.com', '$2y$10$ECyLt77HNGdp26Bj1pVLAOL7Z.cGQFthiYuKJXtLQohq8B.rm/Qsu', 3, 'Y57WxOGxfrPy9PEiSyzmuo9z3CBYEHdOHva6mvM9tSPofMTQ69TUDJtomFzQ', '2017-11-29 23:15:39', '2017-11-29 23:15:39');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activities`
--
ALTER TABLE `activities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `customers_email_unique` (`email`);

--
-- Indexes for table `expense`
--
ALTER TABLE `expense`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `homepage`
--
ALTER TABLE `homepage`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`menu_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `newsletters`
--
ALTER TABLE `newsletters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_role_id_foreign` (`role_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `role_user_role_id_foreign` (`role_id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sale_items`
--
ALTER TABLE `sale_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `suppliers_email_unique` (`email`);

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
-- AUTO_INCREMENT for table `activities`
--
ALTER TABLE `activities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `expense`
--
ALTER TABLE `expense`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `homepage`
--
ALTER TABLE `homepage`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `menu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT for table `newsletters`
--
ALTER TABLE `newsletters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sale_items`
--
ALTER TABLE `sale_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
