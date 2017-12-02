-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 02, 2017 at 09:17 AM
-- Server version: 10.1.25-MariaDB
-- PHP Version: 7.1.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bytetrello`
--

-- --------------------------------------------------------

--
-- Table structure for table `boards`
--

CREATE TABLE `boards` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `boards`
--

INSERT INTO `boards` (`id`, `user_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 1, 'new board', '2017-11-04 06:31:52', '2017-11-04 13:02:36'),
(2, 2, 'newest board', '2017-11-04 06:39:52', '2017-11-04 13:03:12'),
(3, 1, 'programming board', '2017-11-04 15:54:57', '2017-11-04 15:54:57'),
(5, 1, 'java board', '2017-11-04 15:58:07', '2017-11-04 15:58:07'),
(14, 1, 'php board', '2017-11-07 05:01:36', '2017-11-07 05:01:41'),
(15, 1, 'laravel board', '2017-11-07 05:02:10', '2017-11-07 05:02:14');

-- --------------------------------------------------------

--
-- Table structure for table `cards`
--

CREATE TABLE `cards` (
  `id` int(10) UNSIGNED NOT NULL,
  `lists_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `priority` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cards`
--

INSERT INTO `cards` (`id`, `lists_id`, `name`, `description`, `created_at`, `updated_at`, `priority`) VALUES
(2, 2, 'list3 card2', 'new cards', '2017-11-05 09:08:19', '2017-11-27 19:32:06', 2),
(3, 1, 'third card', '', '2017-11-06 04:10:42', '2017-11-09 21:49:14', 2),
(4, 1, 'fourh card', '', '2017-11-08 17:40:08', '2017-11-09 21:49:14', 1),
(5, 4, 'java card', '', '2017-11-08 17:40:32', '2017-11-10 05:34:11', 1),
(6, 3, 'php card', '', '2017-11-08 17:40:53', '2017-11-08 17:40:58', NULL),
(7, 4, 'node card', '', '2017-11-09 11:42:23', '2017-11-18 10:16:26', 2),
(8, 6, 'jquery card', '', '2017-11-09 11:42:50', '2017-11-18 10:16:21', 1),
(9, 5, 'power card', '', '2017-11-09 11:43:29', '2017-11-18 10:16:50', 2),
(10, 13, 'hhghhghgg', '', '2017-11-09 16:35:50', '2017-11-12 08:55:12', 2),
(11, 11, 'gghghhhgg', '', '2017-11-09 16:36:51', '2017-11-18 10:15:59', 2),
(12, 13, 'ggggggg', '', '2017-11-09 16:40:42', '2017-11-12 08:55:12', 1),
(13, 11, 'gyhh', '', '2017-11-09 16:44:31', '2017-11-18 10:15:59', 3),
(14, 10, 'jdjdjdjdjd', '', '2017-11-09 16:47:32', '2017-11-09 21:50:47', 2),
(15, 11, 'klklllaa', '', '2017-11-09 16:51:32', '2017-11-18 10:16:00', 1),
(16, 10, 'jjajajjajaja', '', '2017-11-09 16:55:06', '2017-11-09 21:50:47', 1),
(17, 5, 'favout', '', '2017-11-09 16:55:30', '2017-11-18 10:16:50', 3),
(18, 2, 'great', '', '2017-11-09 16:59:57', '2017-11-27 19:32:06', 4),
(19, 2, 'awesome', '', '2017-11-09 20:58:38', '2017-11-27 19:32:06', 3),
(20, 7, 'blue world', '', '2017-11-09 21:49:48', '2017-11-18 10:16:21', 1),
(21, 1, 'money', '', '2017-11-09 21:50:17', '2017-11-09 21:50:28', 3),
(22, 5, 'nodejs card', '', '2017-11-18 10:16:41', '2017-11-18 10:16:50', 1),
(23, 14, 'single', '', '2017-11-18 10:17:07', '2017-11-27 19:41:37', 2),
(24, 2, 'new card', '', '2017-11-27 19:32:02', '2017-11-27 19:32:06', 1),
(25, 12, 'latest card', '', '2017-11-27 19:41:08', '2017-11-27 19:41:37', 1),
(26, 14, 'real card', '', '2017-11-27 19:41:33', '2017-11-27 19:41:37', 1);

-- --------------------------------------------------------

--
-- Table structure for table `lists`
--

CREATE TABLE `lists` (
  `id` int(10) UNSIGNED NOT NULL,
  `board_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `lists`
--

INSERT INTO `lists` (`id`, `board_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 1, 'Vuejs list', '2017-11-05 09:03:46', '2017-11-09 07:27:03'),
(2, 1, 'board1 new list', '2017-11-05 09:04:30', '2017-11-05 09:04:34'),
(4, 1, 'newest list', '2017-11-08 22:34:08', '2017-11-08 22:34:08'),
(5, 1, 'frame list', '2017-11-08 22:41:48', '2017-11-08 22:41:48'),
(6, 1, 'world list', '2017-11-08 22:44:31', '2017-11-08 22:44:31'),
(7, 1, 'business', '2017-11-08 22:45:56', '2017-11-09 07:39:44'),
(10, 3, 'first programming list', '2017-11-08 22:53:39', '2017-11-08 22:53:39'),
(11, 3, 'objects', '2017-11-09 07:29:42', '2017-11-09 07:29:52'),
(12, 5, 'new structures', '2017-11-09 07:40:25', '2017-11-09 07:40:46'),
(13, 3, 'strings', '2017-11-12 08:51:08', '2017-11-12 08:51:08'),
(14, 5, 'algorithms', '2017-11-18 10:17:21', '2017-11-18 10:17:21');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(2, '2017_11_04_060547_create_users_table', 1),
(3, '2017_11_04_062102_create_boards_table', 2),
(4, '2017_11_05_073526_create_lists_table', 3),
(5, '2017_11_05_082533_create_cards_table', 3),
(6, '2017_11_09_210239_add_priority_field_to_cards_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `api_token` text COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `api_token`, `password`, `created_at`, `updated_at`) VALUES
(1, 'chidough', 'chidough14@gmail.com', 'ZoOSTrjwqR0iJpEjIq9z9p8lbMO1J1c11THFMkrdeP2oiDF9Pu', '$2y$10$VoZ9Ic9pR5.Rt4XEbbMQq..dzUdcDVFPCMrcgu1T2D2BagRb.U2zK', '2017-11-04 10:15:22', '2017-11-18 10:15:48'),
(2, 'frank', 'frank@gmail.com', '', '$2y$10$X6AXULy7wTIJJA8119GhgeHoeDfjAEivl8OrMzzt1kemiVG0cnrAe', '2017-11-04 12:52:11', '2017-11-04 15:48:00'),
(81, 'Naomi', 'naomi@www.com', 'rhc7jc94FOD1Pq3mPM9Eg0GbGO0i1revBH23kDOZiMMJIA8IKc', '$2y$10$Je/vP2LAigjjXz9EOSI.euNj0Q42ekz0Od7LG15hCkYMLxT88Exfi', '2017-11-06 09:50:46', '2017-11-06 09:50:46'),
(82, 'banke', 'banky@www.com', 'fAo4xV1yUXLvZy7uFcAJKpGce9vyuSg4z1aXjmh0a86vCxvImz', '$2y$10$EP2syDfk0Uif1Q9YntwM5eQgeFzUaxj2Y0hN.4LB5rKagNkmvs/Gu', '2017-11-06 09:56:13', '2017-11-06 18:24:32'),
(83, 'tyronne', 'tyronne@www.com', '', '$2y$10$Yd7Slrhzg/GZK5QBB8DXrekjCiDbq4CpDfF8z.sPlpU5C6VhrpG1e', '2017-11-06 17:49:13', '2017-11-08 06:37:33');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `boards`
--
ALTER TABLE `boards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cards`
--
ALTER TABLE `cards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lists`
--
ALTER TABLE `lists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `boards`
--
ALTER TABLE `boards`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `cards`
--
ALTER TABLE `cards`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `lists`
--
ALTER TABLE `lists`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
