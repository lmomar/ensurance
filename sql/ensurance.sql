-- phpMyAdmin SQL Dump
-- version 4.4.15.5
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Mar 17, 2017 at 06:10 PM
-- Server version: 5.5.49-log
-- PHP Version: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ensurance`
--

-- --------------------------------------------------------

--
-- Table structure for table `fos_group`
--

CREATE TABLE IF NOT EXISTS `fos_group` (
  `id` int(11) NOT NULL,
  `name` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fos_user`
--

CREATE TABLE IF NOT EXISTS `fos_user` (
  `id` int(11) NOT NULL,
  `username` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `username_canonical` varchar(155) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `email_canonical` varchar(155) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `confirmation_token` varchar(180) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `created` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `fos_user`
--

INSERT INTO `fos_user` (`id`, `username`, `username_canonical`, `email`, `email_canonical`, `enabled`, `salt`, `password`, `last_login`, `confirmation_token`, `password_requested_at`, `roles`, `created`) VALUES
(1, 'admin', 'admin', 'admin@yahoo.fr', 'admin@yahoo.fr', 1, NULL, '$2y$13$84bwT.KR15x5vx59Eo/XEekXge/7HTDgwnRJ48co3swL.osxnIWVG', '2017-03-13 11:48:57', NULL, NULL, 'a:1:{i:0;s:10:"ROLE_ADMIN";}', '2017-03-13 11:36:45'),
(2, 'matko', 'matko', 'matko@gmail.com', 'matko@gmail.com', 0, NULL, '$2y$13$BBGIa1l7mvObWjD9YuFkT.jRkP/y2didaP2lCT9/D5OXpIS/6pguK', NULL, NULL, NULL, 'a:0:{}', '2017-03-17 16:50:26'),
(3, 'matko1', 'matko1', 'matko1@gmail.com', 'matko1@gmail.com', 0, NULL, '$2y$13$7BdItln6H2IE6f/iL.CYOuEDu4R9ewGqx/bb4MhwIqmvBkgDuJ49y', NULL, NULL, NULL, 'a:0:{}', '2017-03-17 16:53:44');

-- --------------------------------------------------------

--
-- Table structure for table `fos_user_user_group`
--

CREATE TABLE IF NOT EXISTS `fos_user_user_group` (
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `fos_group`
--
ALTER TABLE `fos_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_4B019DDB5E237E06` (`name`);

--
-- Indexes for table `fos_user`
--
ALTER TABLE `fos_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_957A6479C05FB297` (`confirmation_token`);

--
-- Indexes for table `fos_user_user_group`
--
ALTER TABLE `fos_user_user_group`
  ADD PRIMARY KEY (`user_id`,`group_id`),
  ADD KEY `IDX_B3C77447A76ED395` (`user_id`),
  ADD KEY `IDX_B3C77447FE54D947` (`group_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `fos_group`
--
ALTER TABLE `fos_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `fos_user`
--
ALTER TABLE `fos_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `fos_user_user_group`
--
ALTER TABLE `fos_user_user_group`
  ADD CONSTRAINT `FK_B3C77447A76ED395` FOREIGN KEY (`user_id`) REFERENCES `fos_user` (`id`),
  ADD CONSTRAINT `FK_B3C77447FE54D947` FOREIGN KEY (`group_id`) REFERENCES `fos_group` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
