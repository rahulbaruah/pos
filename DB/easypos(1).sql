-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 16, 2018 at 03:01 PM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 7.1.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `easypos`
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
(4, 5, 'Login', '2018-05-13 03:09:31'),
(5, 5, 'Login', '2018-08-11 04:03:05'),
(6, 5, 'Logout', '2018-08-11 04:05:20'),
(7, 5, 'Login', '2018-08-11 04:05:23'),
(8, 5, 'Login', '2018-08-11 06:42:21'),
(9, 5, 'Login', '2018-08-12 02:46:41'),
(10, 5, 'Logout', '2018-08-12 03:57:21'),
(11, 6, 'Login', '2018-08-12 03:57:28'),
(12, 6, 'Logout', '2018-08-12 03:57:48'),
(13, 5, 'Login', '2018-08-12 03:58:00'),
(14, 5, 'Logout', '2018-08-12 03:58:13'),
(15, 6, 'Login', '2018-08-12 04:30:14'),
(16, 6, 'Login', '2018-08-14 01:22:43'),
(17, 6, 'Logout', '2018-08-14 01:22:57'),
(18, 5, 'Login', '2018-08-14 01:23:58'),
(19, 5, 'Login', '2018-08-14 05:09:24'),
(20, 5, 'Logout', '2018-08-14 05:14:01'),
(21, 5, 'Login', '2018-08-14 05:15:04'),
(22, 9, 'Login', '2018-08-14 05:24:00'),
(23, 5, 'Login', '2018-08-14 10:43:07'),
(24, 9, 'Login', '2018-08-14 10:53:32'),
(25, 5, 'Login', '2018-08-14 10:58:59'),
(26, 5, 'Login', '2018-08-15 02:02:11'),
(27, 5, 'Login', '2018-08-15 09:46:07'),
(28, 9, 'Logout', '2018-08-16 01:55:49'),
(29, 5, 'Login', '2018-08-16 01:56:40'),
(30, 5, 'Login', '2018-08-16 02:37:36'),
(31, 5, 'Login', '2018-08-16 04:44:34'),
(32, 5, 'Logout', '2018-08-16 04:44:40'),
(33, 5, 'Logout', '2018-08-16 04:45:13'),
(34, 5, 'Login', '2018-08-16 04:45:40'),
(35, 5, 'Login', '2018-08-16 05:29:01'),
(36, 5, 'Login', '2018-08-16 05:47:41'),
(37, 5, 'Logout', '2018-08-16 05:49:43'),
(38, 11, 'Login', '2018-08-16 05:50:02'),
(39, 11, 'Logout', '2018-08-16 05:50:29'),
(40, 5, 'Login', '2018-08-16 05:56:26');

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

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `updated_at`, `created_at`) VALUES
(1, 'Snacks', '2018-08-11 21:20:24', '2018-08-11 21:20:24'),
(2, 'Boil Veg', '2018-08-16 06:53:12', '2018-08-16 06:53:12'),
(3, 'Boil Non Veg', '2018-08-16 06:53:24', '2018-08-16 06:53:24'),
(4, 'Patot Diya Non Veg', '2018-08-16 06:54:56', '2018-08-16 06:54:56'),
(5, 'Salad Non Veg', '2018-08-16 06:55:10', '2018-08-16 06:55:10'),
(6, 'Bamboo Tube Non Veg', '2018-08-16 06:55:25', '2018-08-16 06:55:25'),
(7, 'Singpho Thali Veg', '2018-08-16 06:55:54', '2018-08-16 06:55:54'),
(8, 'Singpho Thali Non Veg', '2018-08-16 06:56:08', '2018-08-16 06:56:08'),
(9, 'Singpho Rice Veg', '2018-08-16 06:56:22', '2018-08-16 06:56:22'),
(10, 'Singpho Roasts Non Veg', '2018-08-16 06:56:35', '2018-08-16 06:56:35'),
(11, 'Soup Veg', '2018-08-16 06:56:45', '2018-08-16 06:56:45'),
(12, 'Main Course Veg', '2018-08-16 06:57:12', '2018-08-16 06:57:12'),
(13, 'Go Light Veg', '2018-08-16 06:57:33', '2018-08-16 06:57:33'),
(14, 'Biryani Rice Veg', '2018-08-16 06:57:45', '2018-08-16 06:57:45'),
(15, 'Tandoori Bread Veg', '2018-08-16 06:58:00', '2018-08-16 06:58:00'),
(16, 'Beverages', '2018-08-16 06:58:09', '2018-08-16 06:58:09'),
(17, 'Deserts', '2018-08-16 06:58:17', '2018-08-16 06:58:17'),
(18, 'Salad Veg', '2018-08-16 06:58:48', '2018-08-16 06:58:48'),
(19, 'Lunch Break Snacks Veg', '2018-08-16 06:59:04', '2018-08-16 06:59:04'),
(20, 'Lunch Break Snacks Non Veg', '2018-08-16 06:59:14', '2018-08-16 06:59:14'),
(21, 'Starter Veg', '2018-08-16 06:59:25', '2018-08-16 06:59:25'),
(22, 'Indian Combo Veg', '2018-08-16 06:59:34', '2018-08-16 06:59:34'),
(23, 'Indian Combo Non Veg', '2018-08-16 06:59:48', '2018-08-16 06:59:48'),
(24, 'Soup Non Veg', '2018-08-16 07:00:02', '2018-08-16 07:00:02'),
(25, 'Main Course Non Veg', '2018-08-16 07:00:28', '2018-08-16 07:00:28'),
(26, 'Go Light Non Veg', '2018-08-16 07:00:58', '2018-08-16 07:00:58'),
(27, 'Biryani Rice Non Veg', '2018-08-16 07:01:20', '2018-08-16 07:01:20'),
(28, 'Starter Non Veg', '2018-08-16 07:01:50', '2018-08-16 07:01:50'),
(29, 'Singpho Youth Thali', '2018-08-16 07:02:05', '2018-08-16 07:02:05');

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
(2, 'FAQ', 'faq', 'page2.jpg', '<div><span style=\"color: rgb(102, 102, 102); font-family: \" varela=\"\" round\",=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sed voluptate nihil eum consectetur similique?</span><span style=\"font-weight: bold;\"><br></span></div><div><span style=\"color: rgb(102, 102, 102); font-family: \" varela=\"\" round\",=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sed voluptate nihil eum consectetur similique?<br></span></div><div><span style=\"color: rgb(102, 102, 102); font-family: \" varela=\"\" round\",=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\"><br></span></div><div><span style=\"font-weight: bold;\">1 : this is a question number 1</span><div><span style=\"color: rgb(102, 102, 102); font-family: \" varela=\"\" round\",=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sed voluptate nihil eum consectetur similique?</span></div></div><div><span style=\"color: rgb(102, 102, 102); font-family: \" varela=\"\" round\",=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\"><br></span></div><div><span style=\"font-weight: bold;\">1 : this is a question number 1</span><div><span style=\"color: rgb(102, 102, 102); font-family: \" varela=\"\" round\",=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sed voluptate nihil eum consectetur similique?</span></div></div><div><span style=\"color: rgb(102, 102, 102); font-family: \" varela=\"\" round\",=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\"><br></span></div><div><span style=\"color: rgb(102, 102, 102); font-family: \" varela=\"\" round\",=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\"><span style=\"color: rgb(103, 106, 108); font-weight: bold;\">1 : this is a question number 1</span><div style=\"color: rgb(103, 106, 108);\"><span varela=\"\" round\",=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\" style=\"color: rgb(102, 102, 102);\">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sed voluptate nihil eum consectetur similique?</span></div><div style=\"color: rgb(103, 106, 108);\"><span varela=\"\" round\",=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\" style=\"color: rgb(102, 102, 102);\"><br></span></div><div style=\"color: rgb(103, 106, 108);\"><span varela=\"\" round\",=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\" style=\"color: rgb(102, 102, 102);\"><span style=\"color: rgb(103, 106, 108); font-weight: bold;\">1 : this is a question number 1</span><div style=\"color: rgb(103, 106, 108);\"><span varela=\"\" round\",=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\" style=\"color: rgb(102, 102, 102);\">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sed voluptate nihil eum consectetur similique?</span></div><div style=\"color: rgb(103, 106, 108);\"><span varela=\"\" round\",=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\" style=\"color: rgb(102, 102, 102);\"><br></span></div><div style=\"color: rgb(103, 106, 108);\"><span varela=\"\" round\",=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\" style=\"color: rgb(102, 102, 102);\"><span style=\"color: rgb(103, 106, 108); font-weight: bold;\">1 : this is a question number 1</span><div style=\"color: rgb(103, 106, 108);\"><span varela=\"\" round\",=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\" style=\"color: rgb(102, 102, 102);\">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sed voluptate nihil eum consectetur similique?</span></div></span></div></span></div></span></div>', 0, 0),
(3, 'About Us', 'about-us', 'page3.jpg', '<p> Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sed voluptate nihil eum consectetur similique? Consectetur, quod, incidunt, harum nisi dolores delectus reprehenderit voluptatem perferendis dicta dolorem non blanditiis ex fugiat. </p>\r\n\r\n\r\n<h2> Heading 2</h2>\r\n\r\n<p> Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sed voluptate nihil eum consectetur similique? Consectetur, quod, incidunt, harum nisi dolores delectus reprehenderit voluptatem perferendis dicta dolorem non blanditiis ex fugiat. </p><p><br></p><h2 style=\"color: rgb(103, 106, 108);\">Heading 2</h2><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sed voluptate nihil eum consectetur similique? Consectetur, quod, incidunt, harum nisi dolores delectus reprehenderit voluptatem perferendis dicta dolorem non blanditiis ex fugiat.</p>', 0, 0);

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

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `barcode`, `name`, `description`, `titles`, `prices`, `quantity`, `is_delete`, `created_at`, `updated_at`, `deleted_at`) VALUES
(3, 26, NULL, 'Chicken Roll', NULL, '[\"140\"]', '[\"140\"]', 0, 0, '2018-08-11 21:26:59', '2018-08-16 09:33:45', NULL),
(4, 1, NULL, 'Chicken Hakka Noodles', 'Chicken Hakka Noodles', '[\"Chicken Hakka Noodles\"]', '[\"100\"]', 0, 0, '2018-08-11 21:32:21', '2018-08-15 16:46:43', '2018-08-15 16:46:43'),
(5, 2, NULL, 'Mix Vegie', NULL, '[\"80\"]', '[\"80\"]', 0, 0, '2018-08-16 07:34:41', '2018-08-16 07:45:57', NULL),
(6, 2, NULL, 'Banana Flower', NULL, '[\"100\"]', '[\"100\"]', 0, 0, '2018-08-16 07:48:05', '2018-08-16 07:48:05', NULL),
(7, 3, NULL, 'Boiled Fish', NULL, '[\"180\"]', '[\"180\"]', 0, 0, '2018-08-16 07:49:53', '2018-08-16 07:49:53', NULL),
(8, 3, NULL, 'Boiled Chicken', NULL, '[\"200\"]', '[\"200\"]', 0, 0, '2018-08-16 07:50:53', '2018-08-16 07:50:53', NULL),
(9, 3, NULL, 'Boiled Pork', NULL, '[\"250\"]', '[\"250\"]', 0, 0, '2018-08-16 07:51:36', '2018-08-16 07:51:36', NULL),
(10, 4, NULL, 'Fish (Patot Diya)', NULL, '[\"350\"]', '[\"350\"]', 0, 0, '2018-08-16 07:52:15', '2018-08-16 07:52:15', NULL),
(11, 4, NULL, 'Chicken (Patot Diya)', NULL, '[\"410\"]', '[\"410\"]', 0, 0, '2018-08-16 07:53:00', '2018-08-16 07:53:00', NULL),
(12, 4, NULL, 'Pork (Patot Diya)', NULL, '[\"480\"]', '[\"480\"]', 0, 0, '2018-08-16 07:54:03', '2018-08-16 07:54:03', NULL),
(13, 5, NULL, 'Fish Salad', NULL, '[\"280\"]', '[\"280\"]', 0, 0, '2018-08-16 07:54:38', '2018-08-16 07:54:38', NULL),
(14, 5, NULL, 'Chicken Salad', NULL, '[\"360\"]', '[\"360\"]', 0, 0, '2018-08-16 07:54:59', '2018-08-16 07:54:59', NULL),
(15, 5, NULL, 'Pork Salad', NULL, '[\"410\"]', '[\"410\"]', 0, 0, '2018-08-16 07:55:39', '2018-08-16 07:55:39', NULL),
(16, 6, NULL, 'Fish in Tube', NULL, '[\"350\"]', '[\"350\"]', 0, 0, '2018-08-16 07:56:09', '2018-08-16 07:56:09', NULL),
(17, 6, NULL, 'Chicken in Tube', NULL, '[\"410\"]', '[\"410\"]', 0, 0, '2018-08-16 07:56:32', '2018-08-16 07:56:32', NULL),
(18, 6, NULL, 'Pork in Tube', NULL, '[\"480\"]', '[\"480\"]', 0, 0, '2018-08-16 07:56:55', '2018-08-16 07:56:55', NULL),
(19, 7, NULL, 'Singpho Thali Veg', NULL, '[\"140\"]', '[\"140\"]', 0, 0, '2018-08-16 07:58:43', '2018-08-16 07:58:43', NULL),
(20, 8, NULL, 'Singpho Thali Non Veg', NULL, '[\"240\"]', '[\"240\"]', 0, 0, '2018-08-16 07:59:26', '2018-08-16 07:59:26', NULL),
(21, 9, NULL, 'Myalong Rice', NULL, '[\"45\"]', '[\"45\"]', 0, 0, '2018-08-16 08:33:03', '2018-08-16 08:33:03', NULL),
(22, 29, NULL, 'Singpho Youth Thali', NULL, '[\"100\"]', '[\"100\"]', 0, 0, '2018-08-16 08:57:19', '2018-08-16 08:57:19', NULL),
(23, 16, NULL, 'Sweet Lassi', NULL, '[\"40\"]', '[\"40\"]', 0, 0, '2018-08-16 09:12:35', '2018-08-16 09:12:35', NULL),
(24, 16, NULL, 'Mango Lassi', NULL, '[\"60\"]', '[\"60\"]', 0, 0, '2018-08-16 09:14:35', '2018-08-16 09:14:35', NULL),
(25, 16, NULL, 'Salty Lassi', NULL, '[\"35\"]', '[\"35\"]', 0, 0, '2018-08-16 09:15:38', '2018-08-16 09:15:38', NULL),
(26, 16, NULL, 'Butter Masala Milk', NULL, '[\"45\"]', '[\"45\"]', 0, 0, '2018-08-16 09:16:14', '2018-08-16 09:16:14', NULL),
(27, 16, NULL, 'Cold Coffee', NULL, '[\"50\"]', '[\"50\"]', 0, 0, '2018-08-16 09:16:54', '2018-08-16 09:16:54', NULL),
(28, 16, NULL, 'Sweet Lime Soda', NULL, '[\"45\"]', '[\"45\"]', 0, 0, '2018-08-16 09:18:27', '2018-08-16 09:18:27', NULL),
(29, 16, NULL, 'Milk Shake With Ice Cream', NULL, '[\"250\"]', '[\"250\"]', 0, 0, '2018-08-16 09:19:24', '2018-08-16 09:19:24', NULL),
(30, 16, NULL, 'Coffee', NULL, '[\"25\"]', '[\"25\"]', 0, 0, '2018-08-16 09:21:06', '2018-08-16 09:21:06', NULL),
(31, 16, NULL, 'Tea', NULL, '[\"15\"]', '[\"15\"]', 0, 0, '2018-08-16 09:21:22', '2018-08-16 09:21:22', NULL),
(32, 13, NULL, 'Veg  Burger', NULL, '[\"50\"]', '[\"50\"]', 0, 0, '2018-08-16 09:23:50', '2018-08-16 09:23:50', NULL),
(33, 13, NULL, 'Veg Chow Mein', NULL, '[\"130\"]', '[\"130\"]', 0, 0, '2018-08-16 09:24:22', '2018-08-16 09:24:22', NULL),
(34, 13, NULL, 'Veg Roll', NULL, '[\"50\"]', '[\"50\"]', 0, 0, '2018-08-16 09:25:09', '2018-08-16 09:25:59', NULL),
(35, 13, NULL, 'Paneer Roll', NULL, '[\"95\"]', '[\"95\"]', 0, 0, '2018-08-16 09:25:45', '2018-08-16 09:25:45', NULL),
(36, 13, NULL, 'Mix Veg Roll', NULL, '[\"85\"]', '[\"85\"]', 0, 0, '2018-08-16 09:26:53', '2018-08-16 09:26:53', NULL),
(37, 13, NULL, 'Pasneer Tikka Roll', NULL, '[\"95\"]', '[\"95\"]', 0, 0, '2018-08-16 09:28:02', '2018-08-16 09:28:02', NULL),
(38, 26, NULL, 'Chicken Burger', NULL, '[\"120\"]', '[\"120\"]', 0, 0, '2018-08-16 09:28:48', '2018-08-16 09:28:48', NULL),
(39, 26, NULL, 'Pork Burger', NULL, '[\"180\"]', '[\"180\"]', 0, 0, '2018-08-16 09:29:23', '2018-08-16 09:29:23', NULL),
(40, 26, NULL, 'Chicken Chow Mein', NULL, '[\"170\"]', '[\"170\"]', 0, 0, '2018-08-16 09:29:57', '2018-08-16 09:29:57', NULL),
(41, 26, NULL, 'Mix Chow Mein', NULL, '[\"220\"]', '[\"220\"]', 0, 0, '2018-08-16 09:30:21', '2018-08-16 09:30:21', NULL),
(42, 26, NULL, 'Egg Chow Mein', NULL, '[\"150\"]', '[\"150\"]', 0, 0, '2018-08-16 09:30:59', '2018-08-16 09:30:59', NULL),
(43, 26, NULL, 'Chicken Kathi Roll', NULL, '[\"145\"]', '[\"145\"]', 0, 0, '2018-08-16 09:34:57', '2018-08-16 09:34:57', NULL),
(44, 26, NULL, 'Chicken Cheese Roll', NULL, '[\"150\"]', '[\"150\"]', 0, 0, '2018-08-16 09:35:57', '2018-08-16 09:35:57', NULL),
(45, 26, NULL, 'Egg Roll', NULL, '[\"130\"]', '[\"130\"]', 0, 0, '2018-08-16 09:36:25', '2018-08-16 09:36:25', NULL),
(46, 26, NULL, 'Tandoori Chicken', NULL, '[\"150\"]', '[\"150\"]', 0, 0, '2018-08-16 09:39:33', '2018-08-16 09:39:33', NULL),
(47, 26, NULL, 'French Fries', NULL, '[\"100\"]', '[\"100\"]', 0, 0, '2018-08-16 09:41:53', '2018-08-16 09:41:53', NULL),
(48, 26, NULL, 'Chicken Fingers', NULL, '[\"140\"]', '[\"140\"]', 0, 0, '2018-08-16 09:43:18', '2018-08-16 09:43:18', NULL),
(49, 26, NULL, 'Grilled Fish Fry', NULL, '[\"200\"]', '[\"200\"]', 0, 0, '2018-08-16 09:44:00', '2018-08-16 09:44:00', NULL),
(50, 26, NULL, 'Crispy Chicken', NULL, '[\"185\"]', '[\"185\"]', 0, 0, '2018-08-16 09:44:42', '2018-08-16 09:44:42', NULL),
(51, 26, NULL, 'Roasted Pork Indian Style', NULL, '[\"200\"]', '[\"200\"]', 0, 0, '2018-08-16 09:46:12', '2018-08-16 09:46:12', NULL),
(52, 26, NULL, 'Crispy Pork', NULL, '[\"210\"]', '[\"210\"]', 0, 0, '2018-08-16 09:46:46', '2018-08-16 09:46:46', NULL),
(53, 9, NULL, 'General Rice', NULL, '[\"35\"]', '[\"35\"]', 0, 0, '2018-08-16 09:50:02', '2018-08-16 09:50:02', NULL),
(54, 10, NULL, 'Fish (8 Piece)', NULL, '[\"150\"]', '[\"150\"]', 0, 0, '2018-08-16 09:50:42', '2018-08-16 09:50:42', NULL),
(55, 10, NULL, 'Chicken (8 Piece)', NULL, '[\"170\"]', '[\"170\"]', 0, 0, '2018-08-16 09:51:16', '2018-08-16 09:51:16', NULL),
(56, 10, NULL, 'Pork (8 Piece)', NULL, '[\"200\"]', '[\"200\"]', 0, 0, '2018-08-16 09:51:53', '2018-08-16 09:51:53', NULL),
(57, 11, NULL, 'Daal Shorba', NULL, '[\"145\"]', '[\"145\"]', 0, 0, '2018-08-16 09:53:45', '2018-08-16 09:53:45', NULL),
(58, 11, NULL, 'Tomato Dhaniya Shorba', NULL, '[\"130\"]', '[\"130\"]', 0, 0, '2018-08-16 09:54:29', '2018-08-16 09:54:29', NULL),
(59, 11, NULL, 'Corn Palak Galouti', NULL, '[\"145\"]', '[\"145\"]', 0, 0, '2018-08-16 09:54:57', '2018-08-16 09:54:57', NULL),
(60, 24, NULL, 'Chicken Shorba', NULL, '[\"145\"]', '[\"145\"]', 0, 0, '2018-08-16 09:55:47', '2018-08-16 09:55:47', NULL),
(61, 24, NULL, 'Chicken Bacon Soup', NULL, '[\"130\"]', '[\"130\"]', 0, 0, '2018-08-16 09:56:39', '2018-08-16 09:56:39', NULL),
(62, 24, NULL, 'Grilled Mutton Soup', NULL, '[\"145\"]', '[\"145\"]', 0, 0, '2018-08-16 09:57:14', '2018-08-16 09:57:14', NULL),
(63, 24, NULL, 'Sea Food Soup', NULL, '[\"170\"]', '[\"170\"]', 0, 0, '2018-08-16 09:57:40', '2018-08-16 09:57:40', NULL),
(64, 21, NULL, 'Paneer Lal Mirch Tika', NULL, '[\"240\"]', '[\"240\"]', 0, 0, '2018-08-16 09:58:39', '2018-08-16 09:58:39', NULL),
(65, 21, NULL, 'Mushroom Banno Kabab', NULL, '[\"220\"]', '[\"220\"]', 0, 0, '2018-08-16 09:59:33', '2018-08-16 09:59:33', NULL),
(66, 21, NULL, 'Tandoori Laccha Aloo', NULL, '[\"140\"]', '[\"140\"]', 0, 0, '2018-08-16 10:00:04', '2018-08-16 10:00:04', NULL),
(67, 21, NULL, 'Seekh Kabab', NULL, '[\"135\"]', '[\"135\"]', 0, 0, '2018-08-16 10:00:33', '2018-08-16 10:00:33', NULL),
(68, 21, NULL, 'Tandoori Malai Chaap', NULL, '[\"155\"]', '[\"155\"]', 0, 0, '2018-08-16 10:00:58', '2018-08-16 10:00:58', NULL),
(69, 28, NULL, 'Classic Tandoori Chicken (4 Piece)', NULL, '[\"400\"]', '[\"400\"]', 0, 0, '2018-08-16 10:04:41', '2018-08-16 10:04:41', NULL),
(70, 28, NULL, 'Classic Tandoori Chicken (2 Piece)', NULL, '[\"250\"]', '[\"250\"]', 0, 0, '2018-08-16 10:05:19', '2018-08-16 10:05:19', NULL),
(71, 28, NULL, 'Lasooni Murgh Tikka', NULL, '[\"300\"]', '[\"300\"]', 0, 0, '2018-08-16 10:54:48', '2018-08-16 10:54:48', NULL),
(72, 28, NULL, 'Mithi Murgh Tikka', NULL, '[\"205\"]', '[\"205\"]', 0, 0, '2018-08-16 10:56:34', '2018-08-16 10:56:34', NULL),
(73, 28, NULL, 'Reshmi Kabab', NULL, '[\"300\"]', '[\"300\"]', 0, 0, '2018-08-16 11:00:50', '2018-08-16 11:00:50', NULL),
(74, 28, NULL, 'Tulsi Tangri Kabab', NULL, '[\"300\"]', '[\"300\"]', 0, 0, '2018-08-16 11:01:30', '2018-08-16 11:01:30', NULL),
(75, 28, NULL, 'Chicken Seekh Kabab', NULL, '[\"250\"]', '[\"250\"]', 0, 0, '2018-08-16 11:02:55', '2018-08-16 11:02:55', NULL),
(76, 16, NULL, 'Water Bottle', NULL, '[\"19.05\"]', '[\"19.05\"]', 0, 0, '2018-08-16 11:07:28', '2018-08-16 11:53:54', NULL),
(77, 28, NULL, 'Koffta Sekh Kabab (Mutton)', NULL, '[\"300\"]', '[\"300\"]', 0, 0, '2018-08-16 11:14:05', '2018-08-16 11:14:05', NULL),
(78, 28, NULL, 'Mutton Glouti Kabab', NULL, '[\"340\"]', '[\"340\"]', 0, 0, '2018-08-16 11:14:35', '2018-08-16 11:14:35', NULL),
(79, 18, NULL, 'Garden Fresh', NULL, '[\"150\"]', '[\"150\"]', 0, 0, '2018-08-16 11:15:47', '2018-08-16 11:22:27', NULL),
(80, 18, NULL, 'Pineapple Salad', NULL, '[\"150\"]', '[\"150\"]', 0, 0, '2018-08-16 11:19:21', '2018-08-16 11:19:21', NULL),
(81, 18, NULL, 'Chef Special Veg Salad', NULL, '[\"150\"]', '[\"150\"]', 0, 0, '2018-08-16 11:20:00', '2018-08-16 11:20:00', NULL),
(82, 5, NULL, 'Chef Special  Non Veg Salad', NULL, '[\"170\"]', '[\"170\"]', 0, 0, '2018-08-16 11:20:51', '2018-08-16 11:20:51', NULL),
(83, 27, NULL, 'Lucknowi Biryani', NULL, '[\"250\"]', '[\"250\"]', 0, 0, '2018-08-16 11:25:57', '2018-08-16 11:25:57', NULL),
(84, 27, NULL, 'Peshawari Biryani', NULL, '[\"240\"]', '[\"240\"]', 0, 0, '2018-08-16 11:26:41', '2018-08-16 11:26:41', NULL),
(85, 27, NULL, 'Muradabadi Biryani', NULL, '[\"320\"]', '[\"320\"]', 0, 0, '2018-08-16 11:27:47', '2018-08-16 11:27:47', NULL),
(86, 27, NULL, 'Traditional Chicken Biryani', NULL, '[\"200\"]', '[\"200\"]', 0, 0, '2018-08-16 11:29:03', '2018-08-16 11:29:03', NULL),
(87, 27, NULL, 'Traditional Egg Biryani', NULL, '[\"195\"]', '[\"195\"]', 0, 0, '2018-08-16 11:31:30', '2018-08-16 11:31:30', NULL),
(88, 27, NULL, 'Traditional Fish Biryani', NULL, '[\"186\"]', '[\"186\"]', 0, 0, '2018-08-16 11:33:07', '2018-08-16 11:33:07', NULL),
(89, 14, NULL, 'Lucknowi Biryani Veg', NULL, '[\"250\"]', '[\"250\"]', 0, 0, '2018-08-16 11:38:24', '2018-08-16 11:38:24', NULL),
(90, 14, NULL, 'Peshawari Biryani Veg', NULL, '[\"240\"]', '[\"240\"]', 0, 0, '2018-08-16 11:38:49', '2018-08-16 11:38:49', NULL),
(91, 14, NULL, 'Paneer Biryani', NULL, '[\"220\"]', '[\"220\"]', 0, 0, '2018-08-16 11:43:02', '2018-08-16 11:43:02', NULL),
(92, 14, NULL, 'Kashmir Pulao', NULL, '[\"90\"]', '[\"90\"]', 0, 0, '2018-08-16 12:00:40', '2018-08-16 12:00:40', NULL),
(93, 14, NULL, 'Mix Veg Pulao', NULL, '[\"100\"]', '[\"100\"]', 0, 0, '2018-08-16 12:01:25', '2018-08-16 12:01:47', NULL),
(94, 14, NULL, 'Steamed Rice', NULL, '[\"60\"]', '[\"60\"]', 0, 0, '2018-08-16 12:03:05', '2018-08-16 12:03:05', NULL),
(95, 14, NULL, 'Jeers Rice', NULL, '[\"230\"]', '[\"230\"]', 0, 0, '2018-08-16 12:04:08', '2018-08-16 12:04:08', NULL),
(96, 15, NULL, 'Roti (Plain/Butter)', NULL, '[\"20\"]', '[\"20\"]', 0, 0, '2018-08-16 12:12:49', '2018-08-16 12:12:49', NULL),
(97, 15, NULL, 'Latccha Paratha', NULL, '[\"25\"]', '[\"25\"]', 0, 0, '2018-08-16 12:19:09', '2018-08-16 12:19:34', NULL),
(98, 15, NULL, 'Laccha Butter Naan', NULL, '[\"35\"]', '[\"35\"]', 0, 0, '2018-08-16 12:20:34', '2018-08-16 12:20:34', NULL),
(99, 1, NULL, 'Laborious Naan', NULL, '[\"35\"]', '[\"35\"]', 0, 0, '2018-08-16 12:21:21', '2018-08-16 12:21:21', NULL),
(100, 15, NULL, 'Pudina Laccha paratha', NULL, '[\"30\"]', '[\"30\"]', 0, 0, '2018-08-16 12:24:33', '2018-08-16 12:24:33', NULL),
(101, 15, NULL, 'Kulcha Amritsari', NULL, '[\"40\"]', '[\"40\"]', 0, 0, '2018-08-16 12:25:09', '2018-08-16 12:25:09', NULL),
(102, 12, NULL, 'Paneer Lababdar', NULL, '[\"240\"]', '[\"240\"]', 0, 0, '2018-08-16 12:27:08', '2018-08-16 12:27:08', NULL),
(103, 12, NULL, 'Malai Kofta', NULL, '[\"230\"]', '[\"230\"]', 0, 0, '2018-08-16 12:27:28', '2018-08-16 12:27:28', NULL),
(104, 12, NULL, 'Sabzi Panch Puran', NULL, '[\"235\"]', '[\"235\"]', 0, 0, '2018-08-16 12:30:04', '2018-08-16 12:30:04', NULL),
(105, 12, NULL, 'Paneer Khatta', NULL, '[\"240\"]', '[\"240\"]', 0, 0, '2018-08-16 12:30:32', '2018-08-16 12:30:32', NULL),
(106, 12, NULL, 'Paneer Do Pyaza', NULL, '[\"240\"]', '[\"240\"]', 0, 0, '2018-08-16 12:30:50', '2018-08-16 12:30:50', NULL),
(107, 12, NULL, 'Dal Makhani', NULL, '[\"190\"]', '[\"190\"]', 0, 0, '2018-08-16 12:31:07', '2018-08-16 12:31:07', NULL),
(108, 12, NULL, 'Dal Tadka', NULL, '[\"120\"]', '[\"120\"]', 0, 0, '2018-08-16 12:31:24', '2018-08-16 12:31:24', NULL),
(109, 12, NULL, 'Methi Matar Masala', NULL, '[\"180\"]', '[\"180\"]', 0, 0, '2018-08-16 12:34:42', '2018-08-16 12:34:42', NULL),
(110, 12, NULL, 'Kashmiri Dum Aloo', NULL, '[\"195\"]', '[\"195\"]', 0, 0, '2018-08-16 12:39:24', '2018-08-16 12:39:24', NULL),
(111, 12, NULL, 'Diwani Handi', NULL, '[\"200\"]', '[\"200\"]', 0, 0, '2018-08-16 12:41:45', '2018-08-16 12:41:45', NULL),
(112, 25, NULL, 'Delhi Ki Nihari', NULL, '[\"410\"]', '[\"410\"]', 0, 0, '2018-08-16 12:42:29', '2018-08-16 12:42:29', NULL),
(113, 25, NULL, 'Prawns Masala Chef Choice', NULL, '[\"300\"]', '[\"300\"]', 0, 0, '2018-08-16 12:43:36', '2018-08-16 12:43:36', NULL),
(114, 25, NULL, 'Goan Fish Curry', NULL, '[\"320\"]', '[\"320\"]', 0, 0, '2018-08-16 12:45:33', '2018-08-16 12:45:33', NULL),
(115, 25, NULL, 'Sarso Wali Machi', NULL, '[\"300\"]', '[\"300\"]', 0, 0, '2018-08-16 12:46:02', '2018-08-16 12:46:02', NULL),
(116, 25, NULL, 'Tandoori Prawn', NULL, '[\"295\"]', '[\"295\"]', 0, 0, '2018-08-16 12:46:32', '2018-08-16 12:46:32', NULL),
(117, 25, NULL, 'Egg Curry', NULL, '[\"165\"]', '[\"165\"]', 0, 0, '2018-08-16 12:47:01', '2018-08-16 12:47:01', NULL),
(118, 25, NULL, 'Chicken Raraha', NULL, '[\"290\"]', '[\"290\"]', 0, 0, '2018-08-16 12:47:30', '2018-08-16 12:47:30', NULL),
(119, 25, NULL, 'Chicken Dhaniwal (Kashmiri)', NULL, '[\"300\"]', '[\"300\"]', 0, 0, '2018-08-16 12:48:10', '2018-08-16 12:48:10', NULL),
(120, 25, NULL, 'Mutton Rogan Josh', NULL, '[\"320\"]', '[\"320\"]', 0, 0, '2018-08-16 12:48:37', '2018-08-16 12:48:37', NULL),
(121, 25, NULL, 'Mutton Yakhini (Kashmiri)', NULL, '[\"300\"]', '[\"300\"]', 0, 0, '2018-08-16 12:49:14', '2018-08-16 12:49:14', NULL),
(122, 25, NULL, 'Afghani Murgh Masala', NULL, '[\"300\"]', '[\"300\"]', 0, 0, '2018-08-16 12:49:40', '2018-08-16 12:49:40', NULL),
(123, 25, NULL, 'Butter Chicken', NULL, '[\"300\"]', '[\"300\"]', 0, 0, '2018-08-16 12:50:05', '2018-08-16 12:50:05', NULL),
(124, 25, NULL, 'Kadai Chicken', NULL, '[\"320\"]', '[\"320\"]', 0, 0, '2018-08-16 12:50:28', '2018-08-16 12:50:28', NULL),
(125, 25, NULL, 'Chicken Lababdar', NULL, '[\"300\"]', '[\"300\"]', 0, 0, '2018-08-16 12:51:09', '2018-08-16 12:51:09', NULL),
(126, 25, NULL, 'Chicken Korma', NULL, '[\"190\"]', '[\"190\"]', 0, 0, '2018-08-16 12:51:29', '2018-08-16 12:51:29', NULL),
(127, 22, NULL, 'Indian Combo Veg', NULL, '[\"110\"]', '[\"110\"]', 0, 0, '2018-08-16 12:52:12', '2018-08-16 12:52:12', NULL),
(128, 23, NULL, 'Indian Combo (Chicken)', NULL, '[\"130\"]', '[\"130\"]', 0, 0, '2018-08-16 12:52:51', '2018-08-16 12:53:27', NULL),
(129, 23, NULL, 'Indian Combo (Pork)', NULL, '[\"140\"]', '[\"140\"]', 0, 0, '2018-08-16 12:53:15', '2018-08-16 12:53:15', NULL),
(130, 23, NULL, 'Indian Combo (Fish)', NULL, '[\"125\"]', '[\"125\"]', 0, 0, '2018-08-16 12:55:16', '2018-08-16 12:55:42', NULL),
(131, 19, NULL, 'Veg Momo', NULL, '[\"85\"]', '[\"85\"]', 0, 0, '2018-08-16 12:56:11', '2018-08-16 12:56:11', NULL),
(132, 20, NULL, 'Chicken Momo', NULL, '[\"130\"]', '[\"130\"]', 0, 0, '2018-08-16 12:58:13', '2018-08-16 12:58:13', NULL),
(133, 20, NULL, 'Pork Momo', NULL, '[\"140\"]', '[\"140\"]', 0, 0, '2018-08-16 12:58:29', '2018-08-16 12:58:29', NULL),
(134, 20, NULL, 'Mutton Momo', NULL, '[\"180\"]', '[\"180\"]', 0, 0, '2018-08-16 12:58:52', '2018-08-16 12:58:52', NULL),
(135, 20, NULL, 'Sea Food Momo', NULL, '[\"140\"]', '[\"140\"]', 0, 0, '2018-08-16 12:59:13', '2018-08-16 12:59:13', NULL),
(136, 17, NULL, 'Gulab Jamun with Ice Cream', NULL, '[\"400\"]', '[\"400\"]', 0, 0, '2018-08-16 12:59:44', '2018-08-16 12:59:44', NULL),
(137, 17, NULL, 'Phirni', NULL, '[\"250\"]', '[\"250\"]', 0, 0, '2018-08-16 12:59:59', '2018-08-16 12:59:59', NULL),
(138, 17, NULL, 'Banana Payasam', NULL, '[\"320\"]', '[\"320\"]', 0, 0, '2018-08-16 13:00:18', '2018-08-16 13:00:18', NULL);

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
(10, 3),
(11, 2);

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

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `customer_id`, `cashier_id`, `comments`, `created_at`, `updated_at`, `status`, `amount`, `discount`, `vat`, `delivery_cost`, `name`, `email`, `phone`, `address`, `comment`, `type`, `payment_with`, `total_given`, `change`) VALUES
(10, NULL, 5, NULL, '2018-08-16 09:10:06', '2018-08-16 09:10:06', 2, 216.00, 0.00, 16.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'pos', 'cash', 0.00, -216.00),
(11, NULL, 5, NULL, '2018-08-16 11:10:32', '2018-08-16 11:10:32', 2, 776.00, 0.00, 57.48, 0.00, NULL, NULL, NULL, NULL, NULL, 'pos', 'cash', 776.00, 0.00),
(12, NULL, 5, NULL, '2018-08-16 12:28:55', '2018-08-16 12:28:55', 2, 538.97, 0.00, 39.92, 0.00, NULL, NULL, NULL, NULL, NULL, 'pos', 'cash', 0.00, -538.97);

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

--
-- Dumping data for table `sale_items`
--

INSERT INTO `sale_items` (`id`, `sale_id`, `product_id`, `price`, `quantity`, `p_qty`, `size`, `created_at`, `updated_at`) VALUES
(15, 10, 22, '100.00', 2, 0, '100', '2018-08-16 09:10:06', '2018-08-16 09:10:06'),
(16, 11, 76, '18.52', 1, 0, '18.52', '2018-08-16 11:10:32', '2018-08-16 11:10:32'),
(17, 11, 22, '100.00', 7, 0, '100', '2018-08-16 11:10:32', '2018-08-16 11:10:32'),
(18, 12, 20, '240.00', 2, 0, '240', '2018-08-16 12:28:55', '2018-08-16 12:28:55'),
(19, 12, 76, '19.05', 1, 0, '19.05', '2018-08-16 12:28:55', '2018-08-16 12:28:55');

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
(1, 'title', 'Site Title', 'The Singpho Kitchen', NULL, '2018-08-11 23:35:30'),
(2, 'phone', 'Phone', '6001021071', NULL, '2018-08-16 07:40:51'),
(3, 'email', 'Email', 'info@xcraft.co', NULL, '2018-08-10 22:35:04'),
(4, 'address', 'Address', 'Zoo Road Tiniali, Guwahati - 24', NULL, '2018-08-11 23:35:30'),
(5, 'country', 'Country', 'India', NULL, '2018-08-10 22:35:04'),
(6, 'timing1', 'Monday To Saturday', '8am to 9pm', NULL, '2017-11-25 00:42:30'),
(7, 'sunday', 'Sunday', 'Closed', NULL, '2017-09-18 18:19:34'),
(8, 'facebook', 'Facebook', '', NULL, '2018-08-16 08:33:44'),
(9, 'twitter', 'Twitter', '', NULL, '2018-08-16 08:33:44'),
(10, 'vat', 'Service Tax & GST (%)', '8', NULL, '2018-08-15 16:23:35'),
(11, 'delivery_cost', 'Delivery Cost', '0', NULL, '2017-11-29 22:47:39'),
(12, 'currency', 'Currency', 'Rs.', NULL, '2018-08-11 23:47:25'),
(13, 'lng', 'Longitude', '', NULL, '2018-08-16 08:33:44'),
(14, 'lat', 'Latitude', '', NULL, '2018-08-16 08:33:44'),
(15, 'stripe', 'Stripe Payment', 'no', NULL, '2017-11-24 23:08:07'),
(16, 'frontend', 'Hide Frontend', 'yes', NULL, NULL),
(17, 'promotions', 'Receipt Message', 'this is a receipt message edit', NULL, '2018-08-15 16:28:33'),
(18, 'discount', 'Discount', '0', NULL, '2018-08-10 22:35:04'),
(19, 'printer1', 'Printer 1', 'smb://user-PC/POS1', NULL, '2018-08-16 08:33:44'),
(20, 'printer2', 'Printer 2', 'smb://user-PC/POS2', NULL, '2018-08-16 08:33:44');

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
(5, 'Admin', 'admin@xcraft.co', '$2y$10$NDJ8GvTAdoJ/uG0AQ2Y.9ucXwjy75NVf.VgFnSZDSakRRvrEyAlMq', 1, 'pEBxU2or0G9iUsdilfUu9A7PROTCkveMYgD8NMz9sE30WsSgBVCb7TitBFBG', NULL, '2018-08-12 10:23:03'),
(10, 'Sales', 'sales@singphokitchen.com', '$2y$10$.7IpNioxE1ownrSuLR1qTeGNv8zkEBHYtUj6pqvUVzHLsL856Cnuq', 3, NULL, '2018-08-16 12:18:36', '2018-08-16 12:18:36'),
(11, 'Manager', 'manager@singphokitchen.com', '$2y$10$UtY1GTWgj6foA2Caogavjuy0zQp29/hXJfIMYSlC.UfgrdK9oiz06', 2, 'RiuBb7sfNhREidkiA6Qdfg1okOTigw7Bja4LEZIkJqrHIxRwvE4xCmWdsPoz', '2018-08-16 12:19:40', '2018-08-16 12:19:40');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=139;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `sale_items`
--
ALTER TABLE `sale_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
