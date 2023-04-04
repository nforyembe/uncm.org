-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 18, 2023 at 04:14 PM
-- Server version: 5.7.36
-- PHP Version: 8.0.13

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nebafuhsql1`
--

-- --------------------------------------------------------

--
-- Table structure for table `blog_categories`
--

DROP TABLE IF EXISTS `blog_categories`;
CREATE TABLE IF NOT EXISTS `blog_categories` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `is_active` tinyint(1) DEFAULT '1',
  `link` varchar(150) DEFAULT NULL,
  `image` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `link` (`link`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `blog_category_content`
--

DROP TABLE IF EXISTS `blog_category_content`;
CREATE TABLE IF NOT EXISTS `blog_category_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lang_id` int(10) UNSIGNED DEFAULT '1',
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(256) DEFAULT NULL,
  `description` mediumtext,
  `image_caption` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_blog_category_content_to_category_id` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `blog_posts`
--

DROP TABLE IF EXISTS `blog_posts`;
CREATE TABLE IF NOT EXISTS `blog_posts` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `author` int(1) DEFAULT NULL,
  `date` datetime DEFAULT CURRENT_TIMESTAMP,
  `link` varchar(150) DEFAULT NULL,
  `image` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `link` (`link`),
  KEY `fk_blog_to_blog_category_id` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `blog_post_content`
--

DROP TABLE IF EXISTS `blog_post_content`;
CREATE TABLE IF NOT EXISTS `blog_post_content` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `blog_id` int(10) UNSIGNED NOT NULL,
  `last_update` datetime DEFAULT CURRENT_TIMESTAMP,
  `lang_id` int(10) UNSIGNED DEFAULT '1',
  `title` varchar(150) NOT NULL,
  `description` mediumtext,
  `content` text,
  `image_caption` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_blog_postid0_idx` (`blog_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `carousel`
--

DROP TABLE IF EXISTS `carousel`;
CREATE TABLE IF NOT EXISTS `carousel` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_id` int(10) UNSIGNED DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `link` varchar(150) DEFAULT NULL,
  `image` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `link` (`link`),
  KEY `fk_carousel_to_carousel_category` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `carousel`
--

INSERT INTO `carousel` (`id`, `category_id`, `is_active`, `link`, `image`) VALUES
(1, 1, 1, NULL, 'carousel--image-1679121018.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `carousel_categories`
--

DROP TABLE IF EXISTS `carousel_categories`;
CREATE TABLE IF NOT EXISTS `carousel_categories` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `link` varchar(150) DEFAULT NULL,
  `image` varchar(150) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `link` (`link`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `carousel_categories`
--

INSERT INTO `carousel_categories` (`id`, `link`, `image`, `is_active`) VALUES
(1, 'homepage-carousel', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `carousel_category_content`
--

DROP TABLE IF EXISTS `carousel_category_content`;
CREATE TABLE IF NOT EXISTS `carousel_category_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) UNSIGNED DEFAULT NULL,
  `lang_id` int(11) DEFAULT '1',
  `title` varchar(200) DEFAULT NULL,
  `description` longtext,
  `image_caption` varchar(500) DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `fk_caroursel_category_content_to_carousel_category` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `carousel_category_content`
--

INSERT INTO `carousel_category_content` (`id`, `category_id`, `lang_id`, `title`, `description`, `image_caption`) VALUES
(1, 1, 1, 'Homepage Carousel', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `carousel_content`
--

DROP TABLE IF EXISTS `carousel_content`;
CREATE TABLE IF NOT EXISTS `carousel_content` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `lang_id` int(10) UNSIGNED DEFAULT '1',
  `carousel_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(150) DEFAULT NULL,
  `content` mediumtext,
  `image_caption` text,
  PRIMARY KEY (`id`),
  KEY `fk_bannerid0_idx` (`carousel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `carousel_content`
--

INSERT INTO `carousel_content` (`id`, `lang_id`, `carousel_id`, `title`, `content`, `image_caption`) VALUES
(1, 1, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `contact_form_messages`
--

DROP TABLE IF EXISTS `contact_form_messages`;
CREATE TABLE IF NOT EXISTS `contact_form_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `names` varchar(300) DEFAULT NULL,
  `email` varchar(300) NOT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `address` longtext,
  `file` varchar(300) DEFAULT NULL,
  `subject` varchar(300) DEFAULT NULL,
  `message` text NOT NULL,
  `contact_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(11) DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `email_subscriptions`
--

DROP TABLE IF EXISTS `email_subscriptions`;
CREATE TABLE IF NOT EXISTS `email_subscriptions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(300) DEFAULT NULL,
  `last_name` varchar(300) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `address` text,
  `city` varchar(100) DEFAULT NULL,
  `country` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
CREATE TABLE IF NOT EXISTS `events` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `status` int(11) DEFAULT '1',
  `from_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `to_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `link` varchar(150) DEFAULT NULL,
  `venue` varchar(150) DEFAULT NULL,
  `image` varchar(150) DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `link` (`link`),
  KEY `fk_event_to_event_category` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `event_categories`
--

DROP TABLE IF EXISTS `event_categories`;
CREATE TABLE IF NOT EXISTS `event_categories` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `status` int(11) NOT NULL DEFAULT '1',
  `link` varchar(150) NOT NULL,
  `image` varchar(150) DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `link` (`link`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `event_category_content`
--

DROP TABLE IF EXISTS `event_category_content`;
CREATE TABLE IF NOT EXISTS `event_category_content` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `lang_id` int(10) UNSIGNED DEFAULT '1',
  `category_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(300) DEFAULT NULL,
  `description` text,
  `image_caption` mediumtext,
  PRIMARY KEY (`id`),
  KEY `fk_category_content_to_category` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `event_content`
--

DROP TABLE IF EXISTS `event_content`;
CREATE TABLE IF NOT EXISTS `event_content` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `lang_id` int(10) UNSIGNED DEFAULT '1',
  `event_id` int(10) UNSIGNED NOT NULL,
  `last_update` varchar(150) DEFAULT NULL,
  `title` varchar(300) DEFAULT NULL,
  `description` mediumtext,
  `content` text,
  `image_caption` mediumtext,
  PRIMARY KEY (`id`),
  KEY `fk_event_content_to_event` (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `gallery`
--

DROP TABLE IF EXISTS `gallery`;
CREATE TABLE IF NOT EXISTS `gallery` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `album_id` int(10) UNSIGNED DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `image` varchar(150) DEFAULT NULL,
  `image_tags` mediumtext,
  PRIMARY KEY (`id`),
  KEY `fk_gallery_to_gallery_category` (`album_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `gallery_albums`
--

DROP TABLE IF EXISTS `gallery_albums`;
CREATE TABLE IF NOT EXISTS `gallery_albums` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` int(10) UNSIGNED DEFAULT '0',
  `is_active` tinyint(1) DEFAULT '1',
  `link` varchar(150) DEFAULT NULL,
  `image` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `link` (`link`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `gallery_album_content`
--

DROP TABLE IF EXISTS `gallery_album_content`;
CREATE TABLE IF NOT EXISTS `gallery_album_content` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `album_id` int(10) UNSIGNED NOT NULL,
  `lang_id` int(10) UNSIGNED DEFAULT '1',
  `title` varchar(300) DEFAULT NULL,
  `description` text,
  `image_caption` mediumtext,
  PRIMARY KEY (`id`),
  KEY `fk_gallery_album_content_to_gallery_album` (`album_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `gallery_content`
--

DROP TABLE IF EXISTS `gallery_content`;
CREATE TABLE IF NOT EXISTS `gallery_content` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `gallery_id` int(10) UNSIGNED DEFAULT NULL,
  `lang_id` int(11) DEFAULT '1',
  `title` varchar(300) DEFAULT NULL,
  `image_caption` text,
  PRIMARY KEY (`id`),
  KEY `fk_gallery_content_to_gallery` (`gallery_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
CREATE TABLE IF NOT EXISTS `languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` varchar(150) NOT NULL,
  `locale` varchar(7) DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `locale` (`locale`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `language`, `locale`) VALUES
(1, 'English (US)', 'en_us'),
(2, 'French', 'fre');

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
CREATE TABLE IF NOT EXISTS `locations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lang_id` int(11) NOT NULL DEFAULT '1',
  `title` varchar(300) DEFAULT NULL,
  `description` text,
  `image` varchar(150) DEFAULT NULL,
  `image_caption` mediumtext,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `navs`
--

DROP TABLE IF EXISTS `navs`;
CREATE TABLE IF NOT EXISTS `navs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `link` varchar(150) DEFAULT NULL,
  `title` varchar(300) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `navs`
--

INSERT INTO `navs` (`id`, `link`, `title`, `description`) VALUES
(1, NULL, 'Main Menu', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `nav_links`
--

DROP TABLE IF EXISTS `nav_links`;
CREATE TABLE IF NOT EXISTS `nav_links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nav_id` int(11) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `position` int(11) DEFAULT NULL,
  `parent` int(11) DEFAULT NULL,
  `link_type` int(11) DEFAULT '1',
  `link` varchar(300) DEFAULT NULL,
  `image` varchar(300) DEFAULT NULL,
  `icon` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_nav_link_to_nav_link_parent` (`parent`),
  KEY `fk_nav_link_to_nav` (`nav_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `nav_links`
--

INSERT INTO `nav_links` (`id`, `nav_id`, `is_active`, `position`, `parent`, `link_type`, `link`, `image`, `icon`) VALUES
(1, 1, 1, NULL, NULL, 1, '', NULL, NULL),
(2, 1, 1, NULL, NULL, 1, 'about', NULL, NULL),
(3, 1, 1, 6, NULL, 1, 'contact', NULL, NULL),
(4, 1, 1, NULL, NULL, 1, 'our-work', NULL, NULL),
(5, 1, 1, NULL, NULL, 1, 'memorial', NULL, NULL),
(6, 1, 1, NULL, NULL, 1, 'museum', NULL, NULL),
(7, 1, 1, NULL, NULL, 1, 'get-involved', NULL, NULL),
(8, 1, 1, NULL, 2, 1, 'background', NULL, NULL),
(9, 1, 1, NULL, 2, 1, 'historical-perspective', NULL, NULL),
(10, 1, 1, NULL, 2, 1, 'status', NULL, NULL),
(11, 1, 1, NULL, 2, 1, 'the-choice-houston', NULL, NULL),
(12, 1, 1, NULL, 2, 1, 'uncm-logo', NULL, NULL),
(13, 1, 1, NULL, 4, 1, 'soil-collection-project', NULL, NULL),
(14, 1, 1, NULL, 4, 1, 'national-historic-markers-program', NULL, NULL),
(15, 1, 1, NULL, 4, 1, 'wreath-laying-ceremonies', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `nav_link_content`
--

DROP TABLE IF EXISTS `nav_link_content`;
CREATE TABLE IF NOT EXISTS `nav_link_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nav_link_id` int(11) NOT NULL,
  `lang_id` int(11) NOT NULL DEFAULT '1',
  `title` varchar(300) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`),
  KEY `fk_nav_link_content_to_nav_link` (`nav_link_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `nav_link_content`
--

INSERT INTO `nav_link_content` (`id`, `nav_link_id`, `lang_id`, `title`, `description`) VALUES
(1, 1, 1, 'Welcome', NULL),
(2, 2, 1, 'About Us', NULL),
(3, 3, 1, 'Contact Us', NULL),
(4, 4, 1, 'Our Work', NULL),
(5, 5, 1, 'Memorial', NULL),
(6, 6, 1, 'Museum', NULL),
(7, 7, 1, 'Get Involved', NULL),
(8, 8, 1, 'Background', NULL),
(9, 9, 1, 'Historical Perspective', NULL),
(10, 10, 1, 'Status', NULL),
(11, 11, 1, 'The Choice Houston', NULL),
(12, 12, 1, 'UNCM Logo', NULL),
(13, 13, 1, 'Soil Collection Project', NULL),
(14, 14, 1, 'National Historic Markers Program', NULL),
(15, 15, 1, 'Wreath Laying Ceremonies', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
CREATE TABLE IF NOT EXISTS `news` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `author` int(11) UNSIGNED DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `date` datetime DEFAULT CURRENT_TIMESTAMP,
  `link` varchar(150) DEFAULT NULL,
  `image` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `link` (`link`),
  KEY `fk_news_to_category` (`category_id`),
  KEY `fk_news_author_to_users` (`author`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `news_categories`
--

DROP TABLE IF EXISTS `news_categories`;
CREATE TABLE IF NOT EXISTS `news_categories` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `is_active` tinyint(1) DEFAULT '1',
  `link` varchar(150) DEFAULT NULL,
  `image` varchar(150) DEFAULT NULL,
  `status` int(11) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `link` (`link`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `news_category_content`
--

DROP TABLE IF EXISTS `news_category_content`;
CREATE TABLE IF NOT EXISTS `news_category_content` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `lang_id` int(10) UNSIGNED DEFAULT '1',
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(300) DEFAULT NULL,
  `description` text,
  `image_caption` mediumtext,
  PRIMARY KEY (`id`),
  KEY `fk_news_category_content_to_category` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `news_content`
--

DROP TABLE IF EXISTS `news_content`;
CREATE TABLE IF NOT EXISTS `news_content` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `news_id` int(10) UNSIGNED NOT NULL,
  `last_update` datetime DEFAULT NULL,
  `lang_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(300) NOT NULL,
  `description` mediumtext,
  `content` text,
  `image_caption` mediumtext,
  PRIMARY KEY (`id`),
  KEY `fk_news_content_to_news` (`news_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
CREATE TABLE IF NOT EXISTS `pages` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `parent` int(10) UNSIGNED DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `layout` int(11) DEFAULT '1',
  `template` int(11) DEFAULT NULL,
  `controller` varchar(50) DEFAULT 'standard',
  `link` varchar(150) DEFAULT NULL,
  `image` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `link` (`link`),
  KEY `fk_page_to_category` (`category_id`),
  KEY `fk_page_to_template` (`template`),
  KEY `fk_page_to_layout` (`layout`),
  KEY `fk_page_to_parent` (`parent`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `category_id`, `parent`, `is_active`, `layout`, `template`, `controller`, `link`, `image`) VALUES
(1, NULL, NULL, 1, 5, NULL, 'standard', '', NULL),
(2, NULL, NULL, 1, 1, NULL, 'standard', 'about', NULL),
(3, NULL, NULL, 1, 1, 2, 'standard', 'contact', NULL),
(4, NULL, NULL, 1, 1, NULL, 'standard', 'our-work', NULL),
(5, NULL, NULL, 1, 1, NULL, 'standard', 'memorial', 'page-memorial-image-1679134076.jpg'),
(6, NULL, NULL, 1, 1, NULL, 'standard', 'museum', 'page-museum-image-1679134456.jpg'),
(7, NULL, NULL, 1, 1, NULL, 'standard', 'get-involved', NULL),
(8, NULL, 2, 1, 1, NULL, 'standard', 'background', 'page-background-image-1679132345.jpg'),
(9, NULL, 2, 1, 1, NULL, 'standard', 'historical-perspective', 'page-historical-perspecti1679133187.jpg'),
(10, NULL, 2, 1, 1, NULL, 'standard', 'status', 'page-status-image-1679133299.jpg'),
(11, NULL, 2, 1, 1, NULL, 'standard', 'the-choice-houston', 'page-the-choice-houston-i1679133424.jpg'),
(12, NULL, 2, 1, 1, NULL, 'standard', 'uncm-logo', NULL),
(13, NULL, 4, 1, 1, NULL, 'standard', 'soil-collection-project', 'page-soil-collection-proj1679133793.jpg'),
(14, NULL, 4, 1, 1, NULL, 'standard', 'national-historic-markers-program', 'page-national-historic-ma1679133898.jpg'),
(15, NULL, 4, 1, 1, NULL, 'standard', 'wreath-laying-ceremonies', 'page-wreath-laying-ceremo1679133934.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `page_categories`
--

DROP TABLE IF EXISTS `page_categories`;
CREATE TABLE IF NOT EXISTS `page_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `link` varchar(50) NOT NULL,
  `image` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `link` (`link`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `page_category_content`
--

DROP TABLE IF EXISTS `page_category_content`;
CREATE TABLE IF NOT EXISTS `page_category_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `lang_id` int(11) DEFAULT NULL,
  `title` varchar(300) NOT NULL,
  `description` text,
  `content` text,
  `image_caption` text,
  PRIMARY KEY (`id`),
  KEY `fk_page_category_content_to_category` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `page_content`
--

DROP TABLE IF EXISTS `page_content`;
CREATE TABLE IF NOT EXISTS `page_content` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `lang_id` int(10) UNSIGNED DEFAULT '1',
  `page_id` int(10) UNSIGNED DEFAULT NULL,
  `nav_title` varchar(300) DEFAULT NULL,
  `title` varchar(300) DEFAULT NULL,
  `description` mediumtext,
  `content` mediumtext,
  `image_caption` text,
  `last_update` varchar(150) DEFAULT NULL,
  `last_update_by` int(11) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_page_content_to_page` (`page_id`),
  KEY `fk_page_content_author_to_users` (`last_update_by`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `page_content`
--

INSERT INTO `page_content` (`id`, `lang_id`, `page_id`, `nav_title`, `title`, `description`, `content`, `image_caption`, `last_update`, `last_update_by`) VALUES
(1, 1, 1, NULL, 'Welcome', NULL, '<p>An initiative of <a href=\"https://racialhealinginternational.org/\" target=\"_blank\">Racial Healing International</a>, United Nations Colonization Memorial (UNCM) is a tribute of remembrance to honor millions of people killed around the world during the horrific chapter of colonization, a dark period of racial terrorism in our past that though most people would rather forget, casts a shadow across the world and compromise our commitment to the Sustainable Development Goals, and a more inclusive world.</p>\n<p>Across the world, there is a reckoning taking place over how we remember our history. Though much of the focus has been to take down monuments that celebrate racist historical figures, UNCM is about a new monument going up in Houston, Texas. It will document mass atrocities and invite the international community to acknowledgement and repentance. We believe that publicly confronting the truth about our history is the first step towards recovery and reconciliation.</p>\n<p>A global champion for voices that cannot be heard, UNCM was established to reverse cultures of denial, and advance a new era of truth to accelerate the pace of UNâ€™s action towards transformative change for racial justice and equality. It is the one place where the world\'s nations can gather to lay wreaths for victims of colonization, atone for the atrocities of a bygone era, appropriately address an overdue reckoning, and heal the emotional wounds of descendant communities. </p>', NULL, '2023-03-18', NULL),
(2, 1, 2, NULL, 'About', NULL, NULL, NULL, NULL, NULL),
(3, 1, 3, NULL, 'Contact', NULL, NULL, NULL, NULL, NULL),
(4, 1, 4, NULL, 'Our Work', NULL, NULL, NULL, NULL, NULL),
(5, 1, 5, NULL, 'Memorial', NULL, '<p>United Nations Colonization Memorial is the worldâ€™s first and only international memorial dedicated to victims of colonization around the world. Through the lens of nations and territories that were colonized and victimsâ€™ descendants, the Memorial will be a sacred space for truth-telling, and reflection about racial terror by means of colonization and its legacy. Mindful that colonization stretched around the globe and across time, the Memorial will be divided into five separate but interlinked sections:Â </p>\r\n<h3>Victims of Colonization in AfricaÂ  Â Â </h3>\r\n<p>This section will include victims of the Transatlantic Slave Trade in Africa, victims of Belgian genocidal crimes in the Congo, victims of the Angloâ€“Boer Wars, victims of French colonial conquest of Africa including French massacres in Madagascar, Algeria and Cameroun; victims of German colonial conquest of Africa including serious crimes in Kamerun (Cameroun) and German South-West Africa (Namibia); victims of Italian colonial conquest of Africa including grave crimes in Libya and Ethiopia; victims of British colonial conquest of Africa including wanton crimes in the Kingdom of Benin (Nigeria), and Mau Mau (Kenya); victims of Apartheid in South Africa, victims of the Nigeria-Biafra war; victims of Portuguese colonial conquest of Africa including serious crimes in Guinea-Bissau, Angola and Mozambique; victims of French Atomic Bomb Test in Africa; pro-independence African leaders including Ruben Um Nyobe, FÃ©lix-Roland MoumiÃ©, Castor OsendÃ© Afana, Ernest OuandiÃ©, Patrice Lumumba the first democratically elected Prime Minister of Congo; BarthÃ©lemy Boganda, Mehdi Ben Barka, Amilcar Costa Cabral, Eduardo Mondlane, Steve Biko, Henri Curiel, and Thomas Sankara etc., who were killed under the watchful eyes of the United Nations Trusteeship Council including UN Chief, Secretary General- Dag HammarskjÃ¶ld, and victims of the Rwandan genocide (not exclusively), where the United Nations failed to halt the slaughter of over a million people. This section will also include victims of the different wars of independence across Africa which resulted in countless deaths (not exclusively).Â </p>\r\n<p><img src=\"/content/library/images/dag-congo.jpg\" width=\"25%\" />In summer 1960, then Secretary-General Dag HammarskjÃ¶ld welcomed a smiling Patrice Lumumba, the first Prime Minister of the Congo, to the United Nations. Here the two leaders shaking hands, united in their view that the UN must â€˜actâ€™ to protect the sovereignty of newly decolonized nations. They could not have known that their efforts to realize the promise of the UN through the peacekeeping mission in the Congo would destroy them both. Just two years later, Lumumba had been murdered by his political enemies, in collusion with Belgian and British secret forces. HammarskjÃ¶ld was killed in mysterious circumstances when his plane crashed en route to negotiate a peace settlement for the Congo.Â </p>\r\n<h3>Victims of Colonization in the Americas</h3>\r\n<p>This section will cover victims of the Age of Discovery in the Americas when Portugal and Spain conquered the New World, including the forceful annexation of the Caribbean and North America by England (British Empire), Kingdom of France, and the Dutch Republic (not exclusively). The section will cover victims of the bloody wars of independence that ejected Europeans from the mainland of the Americas including those of independent republics that stretched from Chile and Argentina in the south to Mexico in the north, unsung heroes of the American War of Independence from Britain and the Saint-Domingue revolution leaders who established Haiti as a free Black republic, the first of its kind. It will also cover Indian men, women and children who were killed during the dispossession of Native Americans and the relegation of many to reservations. This will also include victims of racial terrorism in the US from the Transatlantic Slave Trade through the Domestic Slave Trade, Reconstruction and Jim Crow segregation where countless African American men, women, and children were hanged, burned alive, shot, drowned, and beaten to death by white mobs. Mindful that the routes of the slave ships became the burial sites of those who were thrown overboard, killed themselves or drowned when ships sank, there will be a giant pool at the center of the memorial to contextualize slaves at the depths of the Atlantic ocean - to underscore the tragic legacy the trade, which for over four centuries abused and robbed over 12 million Africans of their human rights and dignity. The Memorial will be the first of its kind to honor the estimated 1.8 million Africans who died at sea during the Transatlantic Slave Trade. This section will also include victims of the different wars of independence across Latin America and the Caribbean which resulted in countless deaths (not exclusively).Â </p>\r\n<h3>The Victims of Colonization in Asia</h3>\r\n<p>This section will include victims of French colonial conquest of Asia including French massacres in Indochina; victims of the Amritsar, India massacre when peaceful protesters were fired upon by Gurkha soldiers under the orders of Brigadier Reginald Dyer. The soldiers kept firing until they ran out of ammunition. Victims of British partitioning of India along religious lines, uprooting over 10 million people. Hindus in Pakistan and Muslims in India were forced to escape their homes as the situation quickly descended into violence, with over one million people losing their lives in sectarian killings. Victims of the Bengal famine in India, where millions of Bengalis were starved to death when Winston Churchill diverted food to British soldiers and countries such as Greece while a deadly famine swept through Bengal. Victims of Netherlandsâ€™ conquest of Indonesia (Dutch East Indies) who died from serious crimes ranging from mass detentions, torture, burning of kampongs (villages), executions and the massacre of civilians, including victims of the Rawagede massacre. Victims of Japanâ€™s brutal occupation of Indonesia which witnessed an extensive pantheon of war crimes. Victims of the Haiphong Massacre in Vietnam by the French army; Victims of Japanese colonial crimes in China, including the Nanjing Massacre or the Rape of Nanjing by the Imperial Japanese Army. Victims of the St Petersburgâ€™s Bloody Sunday, where unarmed demonstrators were fired upon by soldiers of the Imperial Guard as they marched towards the Winter Palace to present a petition to Tsar Nicholas II of Russia. Victims of the Vietnam War, a two-decade Cold War-era proxy conflict in Vietnam, Laos, and Cambodia that was fought between North Vietnam and South Vietnam, with the Soviet Union, China and other communist states supporting the North, while the South was supported by the United States and other anti-communist allies. victims of the Má»¹ Lai massacre, the mass murder of unarmed South Vietnamese civilians by United States troops in the SÆ¡n Tá»‹nh district of South Vietnam. Victims of the Laotian and Cambodian Civil Wars that were exacerbated by the Vietnam War that spilled over. This section will also include victims of the different wars of independence across Asia which resulted in countless deaths (not exclusively).Â </p>\r\n<h3>Victims of Colonization in the Middle East</h3>\r\n<p>This section will include victims of the Ottoman Empire (Turkish) colonial conquest of the Middle East including the genocidal massacre/ physical annihilation of ethnic Armenian Christian people living in the Ottoman Empire.Â  As many as 1.2 million men, women, and children died during mass deportations due to starvation, dehydration, exposure, and disease. In addition, tens of thousands of Armenian children were forcibly removed from their families and converted to Islam. Armenians call these events Medz Yeghern (the great crime) or Aghet (catastrophe). Countless Arab Muslims and others who died from politically organized enslavement expeditions in the Caucasus, Eastern Europe, Southern Europe, the Balkans, and Africa will be remembered in this section. Slavery in the Ottoman Empire was a lawful institution and a significant part of the Ottoman Empire\'s traditional society. Also, victims of French conquest of Syria and Lebanon; victims of the Persian famine, a period of widespread mass starvation and disease in Persia (Iran) that killed close to 10 million people when the territory was occupied by the forces of British. British prevented imports of wheat and other food grains into Iran from Mesopotamia, Asia, and other areas. Ships loaded with wheat were not allowed to unload at the port of Bushehr in the Persian Gulf, thereby contributing to the famine. In addition, victims of Palestinian quest for recognition/independence (not exclusively) will be covered in this section. This section will also include victims of the different wars of independence across the Middle East which resulted in countless deaths (not exclusively).Â </p>\r\n<h3>Victims of Colonization in Europe</h3>\r\n<p>This section will include victims of the Finnish War of Independence. Finland was a Grand Duchy of the Russian Empire when WWI broke out. The Russian Revolution left a power vacuum in Finland and a struggle ensued between the conservative Whites who wanted independence from Soviet Russia and the socialist Reds who opposed the separation. Although the Whites defeated the Reds and Finland became a republic, many thousands of Finns died in the fighting.Â  Victims of the German revolution - Angry at being ordered to fight a desperate last battle against the British Navy, German sailors revolted, and the civil unrest spread throughout Germany as people blamed their leaders for Germanyâ€™s defeat and the suffering they had endured during the war. The German Republic was proclaimed in November; the Kaiser abdicated and went into exile in the Netherlands. Victims of the Estonian War of Independence. Estonia was part of the Russian Empire when WWI began. Estonia became an independent state following the Russian Revolution and the defeat of Germany. Victims of the Latvian War of Independence. Like Estonia, Latvia gained independence from Russia shortly after WWI. Victims of Polish War of Independence and the Polish Ukrainian War. Poland re-established itself as an independent state at the end WWI, encompassing parts of the former German, Austro-Hungarian, and Russian empires. Victims of the Lithuanian War of Independence. Part of the Russian Empire before WWI and occupied by Germany during the war, it became an independent state following the Russian Revolution and the defeat of Germany. Victims of the Greco-Turkish War. The Allies promised Greece that it would receive territory when the defeated Ottoman Empire was broken up after WWI. Greek forces seized parts of Anatolia, and though Turkish nationalists objected to the partitioning of Turkish lands and the presence of occupying forces; the boundaries of modern Turkey were established. Many civilians were killed, and settlements destroyed by both sides during the conflict. Victims of the Irish War of Independence. Ireland became part of the United Kingdom at the beginning of the nineteenth century. The failed Easter Rising in 1916 and the strong British response to it increased sympathy for the independence movement. Sinn FÃ©in gained much support in the 1918 General Election and declared an Irish Republic the following year. A guerrilla war ensued between the Irish Republican Army and British forces in which ambushes played a large part. The result was the 1921 Anglo-Irish Treaty which confirmed the partitioning of Ireland, the south becoming an autonomous Dominion of the British Empire and the north remaining in the United Kingdom. The treaty did not bring peace to Ireland but sparked a civil war between the pro-treaty Nationalists and the anti-treaty Republicans, which was eventually won by the Nationalists. This section will include victims of Northern Ireland conflict (The Troubles), a violent sectarian conflict in Northern Ireland between the overwhelmingly Protestant unionists (loyalists), who desired the province to remain part of the United Kingdom, and the overwhelmingly Roman Catholic nationalists (republicans), who wanted Northern Ireland to become part of the republic of Ireland.</p>\r\n<p>This section will include the Forgotten Colonial victims of WWI and WWII who under the yoke of colonial rule fought on both sides in every theater of the wars from North Africa to Europe and as far east as Hong Kong. The largest volunteer force in history, they died, went missing in the tens of thousands, but their contributions were/are not often recognized. Despite their sacrifices, these troops were never treated as equals. They were largely under the command of European or American officers, although they were skilled fighters. It was difficult for them to rise-up the ranks and become officers. Their compensation was far less than that of their white peers, and it worsened the darker their skin was. As poorly as Indian soldiers were treated, their African peers fared far worse.</p>\r\n<p>In addition, this section will cover Victims of the Holocaust. While most victims of the Holocaust were Jews, many other minority groups were targeted as well. Slavs (e.g. Russians, Belarusians, Poles, Ukrainians and Serbs), Romanis (gypsies), homosexual men, the mentally or physically disabled, mentally ill, Soviet POWs, Roman Catholics, Protestants, Jehovah\'s Witnesses, Spanish Republicans, Freemasons, Black Europeans (especially the Afro-German Mischlinge, called \"Rhineland Bastards\" by Hitler and the Nazi regime), and other minorities not considered Aryan (Herrenvolk, or part of the \"master race\"), leftists, communists, trade unionists, capitalists, social democrats, socialists, anarchists, and other dissidents who disagreed with the Nazi regime. In total, the Nazis systematically murdered an estimated six million Jews and an additional 11 million people during the war.Â </p>', NULL, '2023-03-18', NULL),
(6, 1, 6, NULL, 'Museum', NULL, '<p>The mission of the Colonization Museum is to restore and make visible suppressed, destroyed, or underrepresented histories relating to colonization around the world. It will provide a comprehensive compilation of world history with a focus on the legacy of colonization.&nbsp;</p>\r\n<p>From the brutal Age of Exploration and its impact across the globe, the Transatlantic Slave Trade, and its impact in Africa, Europe, the United States, and the Caribbean, and the various genocidal wars of independence (not exclusively), the museum will provide detailed interactive content, compelling narratives and colonization will be examined in depth and brought to life through film, images, and first-person narratives.&nbsp;</p>\r\n<p>Situated on a site where indigenous tribal Indian men, women, and children were slaughtered and enslaved Black people were forced to labor in bondage, UNCM Museum will offer an immersive experience with cutting-edge technology, world-class art, and critically important scholarship about world history.&nbsp;&nbsp;</p>\r\n<p>&nbsp;Along with the world&rsquo;s first and only international memorial dedicated to victims of colonization around the world, the museum will present a unique opportunity for visitors to reckon with challenging aspects of our past. Colonization in Americas, Africa, Asia, the Middle East, and Europe - the five separate but interlinked wings of the Museum will include hundreds of sculptures and original animated short films narrated by award-winning artists from around the world.&nbsp;</p>\r\n<p>An entire wing of the museum will explore the economics of colonization, the role of the League of Nations, and subsequently the United Nations Trusteeship Council in the violent enslavement of indigenous peoples of the Trust Territories, sexual violence against women and children in the colonies, the commodification of people, and the desperate efforts colonized people made to gain independence.</p>\r\n<p>An expansive exhibit on the brutal assassination, of prominent pro-independence leaders around the world will document in detail timeline, short films, and first-person narrative accounts.</p>\r\n<p>The museum\'s expansive content on the various wars of independence will be housed in a wing that examines the role of media during the era of racial terror by means of colonization. The last words of dying war victims will dramatize the suffering colonization imposed on entire communities. Facts about the starving to death of children will also help visitors understand the scale of terror and violence many families endured.&nbsp;</p>\r\n<p>Visitors will hear first-person accounts from descendants of murdered pro-independence leaders and descendants of victims of some of the worst wars of independence, and learn about the heroic effort to challenge colonization that was led by legendary decolonization activists, including Mohandas Karamchand Gandhi an Indian lawyer, anti-colonial nationalist and political ethicist who employed nonviolent resistance to lead the successful campaign for India\'s independence from British rule, Dr William Edward Burghardt Du Bois (W.E.B. Du Bois), and Kwame Nkrumah the father of modern Pan-Africanism.&nbsp;</p>\r\n<p>The museum will bring to light various courageous decolonization movements that confronted colonization and eventually made new superpowers, the U.S. and the Soviet Union, to finally take positions against colonization.&nbsp;</p>\r\n<p>Instrumental campaigns that confronted colonization, including Apartheid and Racial Segregation will be presented with an extensive exploration of the boycott campaigns and the Anti-Apartheid Movements. The Montgomery Bus Boycott and the work of legendary civil rights activists will be showcased.&nbsp;&nbsp;</p>\r\n<p>The iconography of colonization as the global face of racism will be dramatically presented in a collection of actual signs and notices collected from around the world. RHI will compile colonial laws and statutes that codified racism worldwide for visitors to read and experience.</p>\r\n<p>A wing on the disenfranchisement of Black Soldiers will feature the Forgotten Colonial Forces of World War II for example that the Allied powers relied on to defeat the Axis but were never recognized. This wing will feature in the museum as a central component of how equal rights were undermined throughout the colonization era.&nbsp;</p>\r\n<p>Colonial forces fought in every theater of World War II - from North Africa to Europe, and as far east as Hong Kong. They died and went missing in the tens of thousands, but despite their sacrifices, they were never treated as equals. These colored forces were largely under the command of White officers, although they were skilled fighters and even helped patrol the streets of London, Paris, Brussels etc. It was difficult for them to move up the ranks and become officers. Their compensation was far less than that of their White peers, and it worsened the darker their skin was.&nbsp;</p>\r\n<p>Visitors will learn about some of the worst civil wars/conflicts around the world and how their origin is embedded in the way colonial powers drew national boundaries, forcefully merging peoples of different religions and ethnic groups together.&nbsp;&nbsp;</p>\r\n<p>The Reflection Space will honor hundreds of people who worked throughout their lives to challenge colonization (racial injustice). In a grand space that will feature world music and powerful images, the history of struggle will inspire all to reflect on what we can do to make a difference.</p>\r\n<p>The Museum will include a world-class art gallery with major works from some of the most celebrated artists from around the world. The gallery will include pieces created specifically for the UNCM Museum, and its entire collection will be curated in dialogue with the museum\'s historical narrative.&nbsp;</p>\r\n<p>Collaborations with Western and non-Western world music - quasi-traditional, intercultural, and traditional music will explore the role of music and dance in understanding our world\'s history and the role of the arts.</p>\r\n<p>As a physical site and an outreach program, the Museum will be an engine for education about the legacy of colonization and racial inequality and for the truth and reconciliation that will lead to real solutions to contemporary problems.</p>', 'Starving children of the Biafran war', '2023-03-18', NULL),
(7, 1, 7, NULL, 'Get Involved', 'You can apply and become a volunteer, or an intern. You can connect with us on social media and join the global conversation on colonization (racial injustice) and other issues facing humanity. You can affiliate your NGO with the UNCM. You can conduct research for UNCM on colonization or cover our work as a journalist.', '<p>Do you or anyone you know speak English, Spanish, French, Dutch, or Portuguese language? Are you aware that these languages which carry culture, and embody the beliefs, values, and identity of European nations were imposed on conquered populations around the world that were disproportionately of color?Â </p>\r\n<p>Are you conversant with the fact that across Africa, the Americas, Asia, and the Middle East, colonization was not solely economic and linguistic imperialism but the global face of racism - a brutal and nefarious public crime witnessed, even celebrated by millions of White folks?Â </p>\r\n<p>Do you realize that the United Nations Trusteeship Council which was assigned under the UN Charter to supervise and promote the advancement of Trust Territories towards self-independence swiftly became the primary colonization machinery - sending a message to folks of color that if they try to resist enslavement, if they try to prevent the partition of their kingdoms, deny their masterâ€™s language, or insist on gaining independence - in other words, if they do anything that upsets or complicates White supremacy, White dominance, and political power they will be killed?Â </p>\r\n<p>Are you aware that under the watchful eye of the Trusteeship Council, Trust Territories across the world were drenched in the blood of their revolutionary heroes, who were killed in the worst of circumstances - from targeted assassinations to extrajudicial executions, massacres, and genocide?Â </p>\r\n<p>Are you conscious that colonization was not just an uncomfortable footnote in history but reflected the belief in racial differences that reinforced Apartheid, Jim Crow Segregation, and systemic racism that has done real psychic damage not just to Black people, but to White people too?Â </p>\r\n<p>Do you believe that the killing of men, women, and children under the banner of colonization was wrong, unjust, and though most people would rather forget, this dark period of racial terrorism in our past casts a shadow across the world and compromise our commitment to reconciliation and healing?Â </p>\r\n<p>Regardless of direct impact, if you could, would you do something to commemorate victims of colonization and help the world recover from centuries of racial injustice? If you answer yes to one of the above, you are exactly who we are looking for to join us and to get involved.</p>\r\n<p>You can apply and become a volunteer, or an intern. You can connect with us on social media and join the global conversation on colonization (racial injustice) and other issues facing humanity. You can affiliate your NGO with the UNCM. You can conduct research for UNCM on colonization or cover our work as a journalist.</p>\r\n<h3>Partner With Us</h3>\r\n<p><strong>Business</strong>:<br />The international business community is embracing corporate responsibility and can work side by side with us to heal racism and make the world a better place. Partnering with the international community to help tackle racial injustice is good global citizenship, and good business. Please contact us: info@uncm.orgÂ </p>\r\n<p><strong>Civil Society</strong>:<br />UNCM recognizes the importance of partnering with civil society/non-profits and will are inviting you to join us in building a better, safer, equitable and more sustainable world. Please contact us: info@uncm.org</p>\r\n<p><strong>Donate</strong>:<br />Do you want to contribute towards the worldâ€™s first and only colonization memorial? You can support us by donating to Racial Healing International, the 501(c)(3) IRS public charity EIN 86-3844927 that initiated UNCM.Â </p>\r\n<p><strong>Connect With Us<br /></strong>Social Media: For the social-media inclined, please share on any of our platforms - Facebook, Twitter, YouTube, Instagram, LinkedIn, or just say hello!Â </p>', NULL, '2023-03-18', NULL),
(8, 1, 8, NULL, 'Background', NULL, '<p>For most of our history, from the age of discovery, conquest of the Americas, Africa, the Middle East, Asia, leading to the Berlin Conference, establishment of the League of Nations and subsequently the United Nations - the very category &lsquo;human&rsquo; has not embraced Black people and people of color. Through the distorted veil of racism, a white supremacy ideological driven narrative that framed indigenous folks of color as inferior, racial hierarchy entered European vernacular and became a voice in their collective heads that says it makes civilized sense that one group of people get to annihilate, enslave, incarcerate, brainwash, torture, sterilize, breed, and terrorize other people through colonization.&nbsp;</p>\r\n<p>Colonization was not solely economic and linguistic imperialism. It was the global face of racism, a brutal and nefarious public crime witnessed, even celebrated by millions of White folks.</p>\r\n<p>Through colonization, European powers held vast colonies around the world which they frequently controlled with ferocious military force. In fact, by 1914, most populations that were disproportionately color had been colonized, and the expansion of European nations as empires resulted in increased militarism and tensions that led to the First World War.&nbsp;</p>\r\n<p>Around the world, the call to arms to defend empire coexisted with the inferior status of non-white people within the imperial hierarchy. Colonial powers could not prosecute a successful war without Black labor and troops - who were sometimes used to fight against their own countrymen.&nbsp;&nbsp;</p>\r\n<p>However - World War I was regretted and whatever frantic efforts were made to avert another major war, the Second World War broke out. It witnessed fighting and devastation on a scale unknown before and one of its very first casualties was the international colonization system of the time.&nbsp;</p>\r\n<p>As the dust of the war settled, a new international system emerged with much the same goals as its predecessor, but with a wider membership and a more complex structure. The headquarters of that new system significantly moved from the Old World &ndash; Europe (Geneva) to the New World - America (New York).</p>\r\n<p>The United Nations Organization, around which the new system was built, inherited most of the colonization framework of the defunct League of Nations, and the only way European colonial powers could maintain political control on indigenous territories even though they were in debt from the war and could no longer afford colonies was to impede their freedom.</p>\r\n<p>Not only was colonization a source of military and economic power and of pride for European nations, but it also provided many individual Europeans with a good income, with outlets for their energy and with opportunities for their careers. There developed in Europe a strong emotional attachment to the idea of colonization, which led them to regard the subject of decolonization with suspicion and often with systematic opposition.&nbsp;</p>\r\n<p>Based on the racist belief that Black people and people of color were inferior and hence not ripe for independence, it was only natural that colonial powers under the cover of the United Nations mutually supported each other in a collective effort to resist the decolonization ambitions of the Trust Territories.</p>\r\n<p>Suspicious of the ever-increasing decolonization ambitions of the UN General Assembly, colonial powers effectively hijacked the United Nations Trusteeship Council, one of the six principal organs of the United Nations assigned under Chapter XII of the UN Charter to supervise and promote the advancement of the inhabitants of Trust Territories and their progressive development towards self-independence.&nbsp;</p>\r\n<p>Mindful of colonized peoples\' thirst for independence, and the way the General Assembly inadvertently some would suggest, pressed forward decolonization, the UN Trusteeship Council swiftly became a voice for colonial masters and the main colonization machinery around the world.&nbsp;</p>\r\n<p>Under the watchful eye of the Trusteeship Council, Trust Territories across the world were drenched in the blood of their revolutionary heroes, who were killed in the worst of circumstances. From targeted assassinations to extrajudicial executions, massacres, and genocide, Black and Brown people&rsquo;s quest for decolonization brought loss and grief on a scale never known.&nbsp;</p>\r\n<p>Through the Trusteeship Council, colonial powers made it clear to folks of color that if they try to resist enslavement, if they try to prevent the partition of their kingdoms, deny their master&rsquo;s language, or insist on gaining independence - in other words, if they do anything that upsets or complicates White supremacy, White dominance, and political power they will be killed.</p>\r\n<p>Though on November 1, 1994, the UN Trusteeship Council suspended its operation, colonization under its authority or previously the League of Nations and the General Act of the Berlin Conference were not just brutal footnotes in history. It reflected a belief in racial differences that reinforced Apartheid, Jim Crow Segregation, and systemic racism that is an all-too-present reality. An ugly past that never passed, colonization did real psychic damage not just to Black people, but to White people too. It resulted in the pattern of racial discrimination today that is define in far too many ways by prejudice and overt bias. It also strengthened tribalism that has resulted in some of the world&rsquo;s most violent conflicts crippling developing countries, with the effects still visible.</p>', 'Herero and Nama villagers in the German Southwest Africa (Namibia) concentration camps', '2023-03-18', NULL),
(9, 1, 9, NULL, 'Historical Perspective', 'United Nations Colonization Memorial is an initiative of Racial Healing International (RHI), a Houston base 501(c)(3) public charity devoted exclusively to addressing historic and contemporary effects of colonization.', '<p>United Nations Colonization Memorial is an initiative of Racial Healing International (RHI), a Houston base 501(c)(3) public charity devoted exclusively to addressing historic and contemporary effects of colonization.&nbsp;</p>\r\n<p>RHI recognize that the world can still be a better place even though there was colonization, but if we don\'t speak the truth, acknowledge the dark parts of our history, and commit to reconciliation and healing, we\'re not going to get there.&nbsp;</p>\r\n<p>that was wrong and unjust, and too few people have talked about it. And so, we want to acknowledge the wrong that happened to millions of people - men, women, and children under the banner of colonization.&nbsp;</p>\r\n<p>To help the international community to have a sense of the scale of what the dark chapter of colonization was, and the role of the United Nations in some of the most heinous crimes against humanity, RHI took on a bold project - to construct a United Nations Colonization Memorial (UNCM), a sacred space for truth-telling and reflection about colonization and its legacy.</p>', 'French colonial soldiers pose with the decapitated heads of indigenous Cameroun nationalists in 1955.', '2023-03-18', NULL),
(10, 1, 10, NULL, 'Status', 'United Nations Colonization Memorial is proclaimed in recognition of the inherent dignity and worth of the blood of generations of men, women and children of every race, faith, language, culture, and drawn from every end of the earth - killed during the horrific chapter of colonization', '<p>Whereas the peoples of the United Nations have in the Charter reaffirmed their faith in fundamental human rights, in the dignity and worth of the human person and in the equal rights of men, women and children, placing those responsible for murder, torture, and other historical crimes above the law and beyond accountability is a flagrant violation of international obligations, and undermines the rule of law.</p>\r\n<p>Whereas recognition of the inherent dignity and of the equal and inalienable rights of all members of the human family is the foundation of freedom, justice, and peace in the world, most of the peoples of the United Nations are on record as wishing colonization victims and their descendants&rsquo; questions answered.&nbsp;</p>\r\n<p>Whereas the peoples of the world have pledged themselves to achieve, in co-operation with the United Nations, the promotion of universal respect for and observance of human rights and fundamental freedoms, denial of responsibility - by those who profited significantly from the deplorable practice of colonization - in the face of legitimate accusations is an utter betrayal of the people, prolongs division, and a divided world cannot look to the future if it cannot agree at all about its past.&nbsp;</p>\r\n<p>Whereas the United Nations General Assembly proclaimed the Universal Declaration of Human Rights as a common standard of achievement for all peoples, both among the peoples of Member States and among the peoples of territories under their jurisdiction including every individual and every organ of society, refusing to address unatoned-for crimes or evasion from acknowledging their role in historical oppression, bear resemblance to complicity, foreclose the pursuit of justice and accountability, delegitimizes the emotional wounds of victims&rsquo; descendants and thwart their rights to truth and effective remedy.</p>\r\n<p>Whereas disregard and contempt for human rights have resulted in barbarous acts which have outraged the conscience of mankind, responding to historical crimes, or trying to resolve the legacy of colonization is an integral part of peace-making and a fiduciary and moral duty.&nbsp; &nbsp;</p>\r\n<p>Now, therefore, bearing in mind the Universal Declaration of Human Rights as a common standard of achievement for all peoples and all nations, United Nations Colonization Memorial is proclaimed in recognition of the inherent dignity and worth of the blood of generations of men, women and children of every race, faith, language, culture, and drawn from every end of the earth - killed during the horrific chapter of colonization.</p>', 'UN General Assembly adopts Universal Declaration of Human Rights, Palais de Chaillot Paris, 12/10/1948', '2023-03-18', NULL),
(11, 1, 11, NULL, 'The Choice Houston', 'Envisaged to bring together over 170 countries - including diplomats and world leaders to the shores of Houston, UNCM will set the tone for racial healing, provide Houston an international tourist destination and add to its status as the city of legendary hospitality, where more than 145 languages are spoken by residents.', '<p>Cognizance that the very first victims of colonization &ndash; tribal Indian men, women, and children were slaughtered in the Spanish colonies of the New World - when Texas was part of Mexico, it is only befitting that UNCM be constructed in Houston which served as the temporary capital of the Republic of Texas before it was formally annexed by the United States.&nbsp;</p>\r\n<p>Envisaged to bring together over 170 countries - including diplomats and world leaders to the shores of Houston, UNCM will set the tone for racial healing, provide Houston an international tourist destination and add to its status as the city of legendary hospitality, where more than 145 languages are spoken by residents.</p>', 'Downtown Houston skyline 2017', '2023-03-18', NULL),
(12, 1, 12, NULL, 'UNCM Logo', NULL, NULL, NULL, NULL, NULL),
(13, 1, 13, NULL, 'Soil Collection Project', NULL, '<p>Dag Hammarskj&ouml;ld &ndash; the second Secretary-General of the United Nations was killed on September 18, 1961, in mysterious circumstances when his plane crashed en route to negotiate a peace settlement for the Congo. Combined with internal Congolese politics, this crisis with the overarching process of decolonization against the backdrop of the Cold War drew the super-powers into Africa, propelling the Congo into a devastating spiral of corruption, collusion, and catastrophe from which it has arguably never recovered.</p>\r\n<p>A fierce defender of the UN Charter, Hammarskj&ouml;ld legacy in the words of the current UN Chief Ant&oacute;nio Guterres &ldquo;shapes our United Nations to this day &ndash; as a force for peace, an impartial broker, a guardian of human rights, and a beacon of hope.&rdquo; With the likes of Patrice Lumumba, the first Prime Minister of the Congo, human rights activist Malcolm X, anti-imperialism icon Ernesto \"Che\" Guevara, Kwame Nkrumah the first Prime Minister and President of Ghana, and civil rights leader Martin Luther King Jr., (not exclusively), which Hammarskj&ouml;ld knew and personally met, these giant anti-colonization leaders and many others around the world who died in mysterious circumstances had a common political agenda based on national dignity, were the embodiment of the ideals of the United Nations, and united in their view that the UN must &lsquo;act&rsquo; to protect the sovereignty of newly decolonized nations.</p>\r\n<p>Cognizant that UNCM was conceived with the hope of creating a sober, meaningful site where people of all races, colors, and creeds can gather and reflect on colonization, its history of racial inequality and the limitations of the UN agency in protecting the most vulnerable defenders of its ideals, the Soil Collection Project was initiated as part of a larger movement to create an era of restorative truth-telling that will offer a new perspective on the UN.</p>\r\n<p>As part of the project, UNCM will identifying the different pro-independence leaders around the world that were killed for standing up against colonization, and soil from where they were killed or buried will be collected and transferred in special jars to the Memorial to help raise international consciousness of the critical work of the UN, and the need for innovation and vigor to its role. To develop a communal identity that prioritizes historical truth-telling and healing, the soil collection will be done during special ceremonies through community-led efforts.</p>', 'Officials search the crash site after the plane carrying UN Chief Dag Hammarskjold came down near Ndola in Northern Rhodesia (later Zambia)', '2023-03-18', NULL),
(14, 1, 14, NULL, 'National Historic Markers Program', 'We are committed to advance truth and reconciliation around race internationally and to confront the legacy of colonization - slavery, genocides, massacres, apartheid, and segregation more honestly.', '<p>Colonization (racial injustice) casts a shadow across our landscape, and that shadow cannot be lifted until we shine the light of truth on the destructive violence that shaped the United Nations, most of its member states, traumatized people of color, and compromised our commitment to the rule of law and to equal justice.Â </p>\r\n<p>The international community cannot pretend that racism borne of colonization didnâ€™t happen, or just play it off. It is like a disease, and we must treat it. We strongly believe that the sins of colonization must be acknowledged, and mass atrocities and abuse must be recognized and remembered before a society can recover and heal.Â </p>\r\n<p>We are committed to advance truth and reconciliation around race internationally and to confront the legacy of colonization - slavery, genocides, massacres, apartheid, and segregation more honestly.</p>\r\n<p>Through our National Historical Markers Program, we will work with nations around the world to erect historical markers in places where some of the worst crimes of colonization took place to support the development of both local (community) and national (government) led efforts to engage with and discuss past and present issues of colonization (racial injustice).</p>\r\n<p>We believe that historical markers memorializing victims of colonization will help transform national landscapes into a more honest reflection of the inherent dignity and of the equal and inalienable rights of all members of the human family, which is the foundation of freedom, justice, and peace in the world.Â </p>\r\n<p>The markers will stand as symbolic reminders of the countryâ€™s continuing efforts to truthfully grapple with painful colonization history, challenge injustice wherever it exists, and vow never to repeat the terror and violence of the past.</p>\r\n<p>Through the National Historical Markers Program, we will encourage governments around the world to engage in genuine and sustained work that advances a new era of truth and justice by confronting colonization in a way most communities have never done.</p>', 'French soldiers stand in front of the many Algerians they massacred in 1945', '2023-03-18', NULL),
(15, 1, 15, NULL, 'Wreath Laying Ceremonies', 'UNCM will use its social media platforms to highlight and publicize the countryâ€™s history of colonization, with emphasizes on decolonization, the victimsâ€™ legacy and how it shapes the country celebrating the National Day and the United Nations to this day.', '<p>The brutal killing of millions of people - men, women, and children under the banner of colonization was wrong, unjust, and though most people would rather forget, this dark period of racial terrorism in our past casts a shadow across the world and compromise our commitment to reconciliation and healing.</p>\r\n<p>We strongly believe that public commemorations can play a significant role in prompting community-wide reconciliation.</p>\r\n<p>To commemorate victims of colonization and help the world recover from centuries of racial injustice, UNCM in liaison with the Diplomatic Representation of countries that were colonized will organize annual National Day wreath-laying ceremonies at the Memorial. This formal public event aimed at giving a sense of dignity to the victims will involve high ranking dignitaries with the flag of the country celebrating the National Day lowered to half-staff.</p>\r\n<p>UNCM will use its social media platforms to highlight and publicize the countryâ€™s history of colonization, with emphasizes on decolonization, the victimsâ€™ legacy and how it shapes the country celebrating the National Day and the United Nations to this day.</p>', 'Quietly paying respects, the Executive Director of Dag HammarskjÃ¶ldâ€™s Foundation laid flowers on his grave on 18 September 2022 to commemorate the death of the second UN chief to the United Nations', '2023-03-18', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `partners`
--

DROP TABLE IF EXISTS `partners`;
CREATE TABLE IF NOT EXISTS `partners` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `is_active` tinyint(1) DEFAULT '1',
  `priority` int(10) UNSIGNED DEFAULT NULL,
  `link` varchar(150) DEFAULT NULL,
  `image` varchar(150) DEFAULT NULL,
  `url` mediumtext,
  `title` varchar(150) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `poems`
--

DROP TABLE IF EXISTS `poems`;
CREATE TABLE IF NOT EXISTS `poems` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `author` int(11) UNSIGNED DEFAULT '1',
  `is_active` tinyint(1) DEFAULT '1',
  `date` datetime DEFAULT CURRENT_TIMESTAMP,
  `link` varchar(150) DEFAULT NULL,
  `image` varchar(150) DEFAULT NULL,
  `image_share` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `link` (`link`),
  KEY `fk_poems_to_category` (`category_id`),
  KEY `fk_poem_author_to_users` (`author`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `poem_categories`
--

DROP TABLE IF EXISTS `poem_categories`;
CREATE TABLE IF NOT EXISTS `poem_categories` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `is_active` tinyint(1) DEFAULT '1',
  `link` varchar(150) DEFAULT NULL,
  `image` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `link` (`link`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `poem_category_content`
--

DROP TABLE IF EXISTS `poem_category_content`;
CREATE TABLE IF NOT EXISTS `poem_category_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lang_id` int(10) UNSIGNED DEFAULT '1',
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(256) DEFAULT NULL,
  `description` text,
  `image_caption` mediumtext,
  PRIMARY KEY (`id`),
  KEY `fk_poem_category_content_to_category` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `poem_content`
--

DROP TABLE IF EXISTS `poem_content`;
CREATE TABLE IF NOT EXISTS `poem_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `poem_id` int(10) UNSIGNED DEFAULT NULL,
  `lang_id` int(11) DEFAULT '1',
  `last_update` varchar(150) DEFAULT NULL,
  `last_update_by` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(300) DEFAULT NULL,
  `description` mediumtext,
  `content` text,
  `image_caption` mediumtext,
  PRIMARY KEY (`id`),
  KEY `fk_poem_content_to_poem` (`poem_id`),
  KEY `fk_poem_content_update_to_author` (`last_update_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `programs`
--

DROP TABLE IF EXISTS `programs`;
CREATE TABLE IF NOT EXISTS `programs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `link` varchar(50) NOT NULL,
  `image` varchar(50) DEFAULT NULL,
  `icon` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `link` (`link`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `program_content`
--

DROP TABLE IF EXISTS `program_content`;
CREATE TABLE IF NOT EXISTS `program_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `program_id` int(11) NOT NULL,
  `lang_id` int(11) DEFAULT NULL,
  `title` varchar(300) NOT NULL,
  `description` mediumtext,
  `content` text,
  `image_caption` text,
  PRIMARY KEY (`id`),
  KEY `fk_program_content_to_program` (`program_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `site_options`
--

DROP TABLE IF EXISTS `site_options`;
CREATE TABLE IF NOT EXISTS `site_options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `image` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `site_options`
--

INSERT INTO `site_options` (`id`, `name`, `image`) VALUES
(1, 'ORG_ACRONYM', NULL),
(2, 'ORG_TITLE', NULL),
(3, 'ORG_DESCRIPTION', NULL),
(4, 'ORG_TAG', NULL),
(5, 'ORG_LOGO', 'option--image-1679120233.png'),
(6, 'ORG_ADDRESS', NULL),
(7, 'ORG_EMAIL', NULL),
(8, 'ORG_NUMBER', NULL),
(9, 'DOMAIN', NULL),
(10, 'THEME', NULL),
(12, 'ORG_ICON', 'favicon.png');

-- --------------------------------------------------------

--
-- Table structure for table `site_options_content`
--

DROP TABLE IF EXISTS `site_options_content`;
CREATE TABLE IF NOT EXISTS `site_options_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `option_id` int(11) DEFAULT NULL,
  `lang_id` int(11) DEFAULT '1',
  `title` varchar(300) DEFAULT NULL,
  `description` mediumtext,
  `content` text,
  PRIMARY KEY (`id`),
  KEY `fk_options_content_to_options` (`option_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `site_options_content`
--

INSERT INTO `site_options_content` (`id`, `option_id`, `lang_id`, `title`, `description`, `content`) VALUES
(1, 1, 1, 'Acronym', 'define the acronym for the organisation', 'UNCM'),
(2, 2, 1, 'Name of Organisation', 'Defines the name to be used for the organisation throughout the Website', 'United Nations Colonization Memorial'),
(3, 3, 1, 'Description', 'Defines a brief introduction (Pitch) for your organisation used for Meta Information.', 'An initiative of Racial Healing International, United Nations Colonization Memorial (UNCM) is a tribute of remembrance to honor millions of people killed around the world during the horrific chapter of colonization, a dark period of racial terrorism in our past that though most people would rather forget, casts a shadow across the world and compromise our commitment to the Sustainable Development Goals, and a more inclusive world'),
(4, 4, 1, 'Tagline', 'Defines the tag line for the organisation', NULL),
(5, 5, 1, 'Organisation\'s Logo', 'Defines the logo for the organisation.', NULL),
(6, 6, 1, 'Organisation\'s Address', 'Defines the Organisation\'s main Physical Address', '5614 W Grand Pkwy S Ste 102 #164\r\nRichmond, TX 77406'),
(7, 7, 1, 'Email', 'Defines Organisation\'s main Email address', 'info@uncm.org'),
(8, 8, 1, 'Organisation\'s Phone Number', 'Defines Organisation\'s Primary Phone Number', '+1 (240) 528-0360'),
(9, 9, 1, 'Organisation\'s DOMAIN', 'defines Organisation\'s Domain name without http(s)://', 'uncm.org'),
(10, 10, 1, 'Site Theme', 'Defines the Design theme which the site uses', 'bootstrap_child'),
(12, 12, 1, 'Favicon', 'Icon displayed on the address bar of browser', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `social_networks`
--

DROP TABLE IF EXISTS `social_networks`;
CREATE TABLE IF NOT EXISTS `social_networks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` int(11) DEFAULT '1',
  `link` varchar(100) DEFAULT NULL,
  `title` varchar(150) DEFAULT NULL,
  `url` varchar(300) DEFAULT NULL,
  `icon` varchar(150) DEFAULT 'far fa-share-square',
  `image` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `link` (`link`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `spotlight`
--

DROP TABLE IF EXISTS `spotlight`;
CREATE TABLE IF NOT EXISTS `spotlight` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `link` varchar(150) NOT NULL,
  `image` varchar(100) NOT NULL,
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `link` (`link`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `spotlight_content`
--

DROP TABLE IF EXISTS `spotlight_content`;
CREATE TABLE IF NOT EXISTS `spotlight_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `spotlight_id` int(11) NOT NULL,
  `lang_id` int(11) DEFAULT '1',
  `title` varchar(150) NOT NULL,
  `description` mediumtext,
  `image_caption` varchar(300) DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `fk_spotlight_content_to_spotlight` (`spotlight_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `stories`
--

DROP TABLE IF EXISTS `stories`;
CREATE TABLE IF NOT EXISTS `stories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_active` tinyint(1) DEFAULT '1',
  `link` varchar(50) NOT NULL,
  `image` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `link` (`link`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `story_content`
--

DROP TABLE IF EXISTS `story_content`;
CREATE TABLE IF NOT EXISTS `story_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `story_id` int(11) NOT NULL,
  `lang_id` int(11) DEFAULT NULL,
  `title` varchar(300) NOT NULL,
  `description` mediumtext,
  `content` text,
  `image_caption` text,
  PRIMARY KEY (`id`),
  KEY `fk_story_content_to_story` (`story_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
CREATE TABLE IF NOT EXISTS `team` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_id` int(11) UNSIGNED DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `location_id` int(11) DEFAULT NULL,
  `link` varchar(150) DEFAULT NULL,
  `title` varchar(300) DEFAULT NULL,
  `image` varchar(150) DEFAULT NULL,
  `from_date` datetime DEFAULT NULL,
  `to_date` datetime DEFAULT NULL,
  `facebook` longtext,
  `twitter` longtext,
  `youtube` longtext,
  `linkedin` longtext,
  `email` longtext,
  `url` longtext,
  PRIMARY KEY (`id`),
  KEY `fk_team_to_location` (`location_id`),
  KEY `fk_team_to_category` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `team_categories`
--

DROP TABLE IF EXISTS `team_categories`;
CREATE TABLE IF NOT EXISTS `team_categories` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `link` varchar(150) DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL,
  `status` int(11) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `link` (`link`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `team_category_content`
--

DROP TABLE IF EXISTS `team_category_content`;
CREATE TABLE IF NOT EXISTS `team_category_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) UNSIGNED DEFAULT NULL,
  `lang_id` int(11) DEFAULT '1',
  `title` varchar(300) DEFAULT NULL,
  `description` text,
  `image_caption` mediumtext,
  PRIMARY KEY (`id`),
  KEY `fk_team_category_content_to_category` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `team_content`
--

DROP TABLE IF EXISTS `team_content`;
CREATE TABLE IF NOT EXISTS `team_content` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `team_id` int(11) UNSIGNED NOT NULL,
  `lang_id` int(10) UNSIGNED NOT NULL,
  `position` mediumtext,
  `content` text,
  `image_caption` text,
  PRIMARY KEY (`id`),
  KEY `fk_team_content_to_team` (`team_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `test_features`
--

DROP TABLE IF EXISTS `test_features`;
CREATE TABLE IF NOT EXISTS `test_features` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `name` varchar(50) NOT NULL,
  `link` varchar(50) NOT NULL,
  `image` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `link` (`link`),
  KEY `fk_test_feature_to_category` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `test_feature_categories`
--

DROP TABLE IF EXISTS `test_feature_categories`;
CREATE TABLE IF NOT EXISTS `test_feature_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `link` varchar(50) NOT NULL,
  `image` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `link` (`link`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `test_feature_category_content`
--

DROP TABLE IF EXISTS `test_feature_category_content`;
CREATE TABLE IF NOT EXISTS `test_feature_category_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `lang_id` int(11) DEFAULT NULL,
  `title` varchar(300) NOT NULL,
  `description` text,
  `content` text,
  `image_caption` text,
  PRIMARY KEY (`id`),
  KEY `fk_test_feature_category_content_to_category` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `test_feature_content`
--

DROP TABLE IF EXISTS `test_feature_content`;
CREATE TABLE IF NOT EXISTS `test_feature_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `test_feature_id` int(11) DEFAULT NULL,
  `lang_id` int(11) DEFAULT NULL,
  `title` varchar(300) NOT NULL,
  `description` mediumtext,
  `content` text,
  `image_caption` text,
  PRIMARY KEY (`id`),
  KEY `fk_test_feature_content_to_test_feature` (`test_feature_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `themes`
--

DROP TABLE IF EXISTS `themes`;
CREATE TABLE IF NOT EXISTS `themes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `link` varchar(32) DEFAULT NULL,
  `image` varchar(32) DEFAULT NULL,
  `title` varchar(300) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `themes`
--

INSERT INTO `themes` (`id`, `link`, `image`, `title`, `description`) VALUES
(1, NULL, NULL, 'Default', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `theme_layouts`
--

DROP TABLE IF EXISTS `theme_layouts`;
CREATE TABLE IF NOT EXISTS `theme_layouts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `theme_id` int(11) DEFAULT NULL,
  `link` varchar(32) DEFAULT NULL,
  `image` varchar(32) DEFAULT NULL,
  `title` varchar(300) NOT NULL,
  `description` text,
  `filename` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_theme_layouts_to_them` (`theme_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `theme_layouts`
--

INSERT INTO `theme_layouts` (`id`, `theme_id`, `link`, `image`, `title`, `description`, `filename`) VALUES
(1, 1, NULL, NULL, 'Default', NULL, 'default.php'),
(2, 1, NULL, NULL, 'Full Page', NULL, 'full-page.php'),
(3, 1, NULL, NULL, 'Blank Page', NULL, 'blank-page.php'),
(4, NULL, NULL, NULL, 'Variable Data', NULL, 'variable-data.php'),
(5, 1, 'home', NULL, 'Homepage', NULL, 'home.php');

-- --------------------------------------------------------

--
-- Table structure for table `theme_templates`
--

DROP TABLE IF EXISTS `theme_templates`;
CREATE TABLE IF NOT EXISTS `theme_templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `theme_id` int(11) DEFAULT NULL,
  `link` varchar(32) DEFAULT NULL,
  `image` varchar(32) DEFAULT NULL,
  `title` varchar(300) NOT NULL,
  `description` text,
  `filename` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_theme_templates_to_thems` (`theme_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `theme_templates`
--

INSERT INTO `theme_templates` (`id`, `theme_id`, `link`, `image`, `title`, `description`, `filename`) VALUES
(1, 1, NULL, NULL, 'Default', NULL, 'default.html'),
(2, 1, NULL, NULL, 'Contact', NULL, 'contact.html');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `role` int(11) DEFAULT '2',
  `is_active` tinyint(1) DEFAULT '1',
  `username` varchar(150) NOT NULL,
  `email` varchar(150) DEFAULT NULL,
  `hashed_password` varchar(255) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `profile` text,
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role`, `is_active`, `username`, `email`, `hashed_password`, `first_name`, `last_name`, `profile`, `image`) VALUES
(1, 2, NULL, 'trevor@yems.group', 'trevor@yems.group', 'efacc4001e857f7eba4ae781c2932dedf843865e', 'Trevor @ Y\'G', NULL, NULL, NULL);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `blog_category_content`
--
ALTER TABLE `blog_category_content`
  ADD CONSTRAINT `fk_blog_category_content_to_category_id` FOREIGN KEY (`category_id`) REFERENCES `blog_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `blog_posts`
--
ALTER TABLE `blog_posts`
  ADD CONSTRAINT `fk_blog_to_blog_category_id` FOREIGN KEY (`category_id`) REFERENCES `blog_categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `blog_post_content`
--
ALTER TABLE `blog_post_content`
  ADD CONSTRAINT `fk_blog_content_to_blog_id` FOREIGN KEY (`blog_id`) REFERENCES `blog_posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `carousel`
--
ALTER TABLE `carousel`
  ADD CONSTRAINT `fk_carousel_to_carousel_category` FOREIGN KEY (`category_id`) REFERENCES `carousel_categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `carousel_category_content`
--
ALTER TABLE `carousel_category_content`
  ADD CONSTRAINT `fk_caroursel_category_content_to_carousel_category` FOREIGN KEY (`category_id`) REFERENCES `carousel_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `carousel_content`
--
ALTER TABLE `carousel_content`
  ADD CONSTRAINT `fk_carousel_content_to_carousel` FOREIGN KEY (`carousel_id`) REFERENCES `carousel` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `fk_event_to_event_category` FOREIGN KEY (`category_id`) REFERENCES `event_categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `event_category_content`
--
ALTER TABLE `event_category_content`
  ADD CONSTRAINT `fk_category_content_to_category` FOREIGN KEY (`category_id`) REFERENCES `event_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `event_content`
--
ALTER TABLE `event_content`
  ADD CONSTRAINT `fk_event_content_to_event` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `gallery`
--
ALTER TABLE `gallery`
  ADD CONSTRAINT `fk_gallery_to_gallery_category` FOREIGN KEY (`album_id`) REFERENCES `gallery_albums` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `gallery_album_content`
--
ALTER TABLE `gallery_album_content`
  ADD CONSTRAINT `fk_gallery_album_content_to_gallery_album` FOREIGN KEY (`album_id`) REFERENCES `gallery_albums` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `gallery_content`
--
ALTER TABLE `gallery_content`
  ADD CONSTRAINT `fk_gallery_content_to_gallery` FOREIGN KEY (`gallery_id`) REFERENCES `gallery` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `nav_links`
--
ALTER TABLE `nav_links`
  ADD CONSTRAINT `fk_nav_link_to_nav` FOREIGN KEY (`nav_id`) REFERENCES `navs` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_nav_link_to_nav_link_parent` FOREIGN KEY (`parent`) REFERENCES `nav_links` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `nav_link_content`
--
ALTER TABLE `nav_link_content`
  ADD CONSTRAINT `fk_nav_link_content_to_nav_link` FOREIGN KEY (`nav_link_id`) REFERENCES `nav_links` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `news`
--
ALTER TABLE `news`
  ADD CONSTRAINT `fk_news_author_to_users` FOREIGN KEY (`author`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_news_to_category` FOREIGN KEY (`category_id`) REFERENCES `news_categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `news_category_content`
--
ALTER TABLE `news_category_content`
  ADD CONSTRAINT `fk_news_category_content_to_category` FOREIGN KEY (`category_id`) REFERENCES `news_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `news_content`
--
ALTER TABLE `news_content`
  ADD CONSTRAINT `fk_news_content_to_news` FOREIGN KEY (`news_id`) REFERENCES `news` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pages`
--
ALTER TABLE `pages`
  ADD CONSTRAINT `fk_page_to_category` FOREIGN KEY (`category_id`) REFERENCES `page_categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_page_to_layout` FOREIGN KEY (`layout`) REFERENCES `theme_layouts` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_page_to_parent` FOREIGN KEY (`parent`) REFERENCES `pages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_page_to_template` FOREIGN KEY (`template`) REFERENCES `theme_templates` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `page_category_content`
--
ALTER TABLE `page_category_content`
  ADD CONSTRAINT `fk_page_category_content_to_category` FOREIGN KEY (`category_id`) REFERENCES `page_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `page_content`
--
ALTER TABLE `page_content`
  ADD CONSTRAINT `fk_page_content_author_to_users` FOREIGN KEY (`last_update_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_page_content_to_page` FOREIGN KEY (`page_id`) REFERENCES `pages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `poems`
--
ALTER TABLE `poems`
  ADD CONSTRAINT `fk_poem_author_to_users` FOREIGN KEY (`author`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_poems_to_category` FOREIGN KEY (`category_id`) REFERENCES `poem_categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `poem_category_content`
--
ALTER TABLE `poem_category_content`
  ADD CONSTRAINT `fk_poem_category_content_to_category` FOREIGN KEY (`category_id`) REFERENCES `poem_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `poem_content`
--
ALTER TABLE `poem_content`
  ADD CONSTRAINT `fk_poem_content_to_poem` FOREIGN KEY (`poem_id`) REFERENCES `poems` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_poem_content_update_to_author` FOREIGN KEY (`last_update_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `program_content`
--
ALTER TABLE `program_content`
  ADD CONSTRAINT `fk_program_content_to_program` FOREIGN KEY (`program_id`) REFERENCES `programs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `site_options_content`
--
ALTER TABLE `site_options_content`
  ADD CONSTRAINT `fk_options_content_to_options` FOREIGN KEY (`option_id`) REFERENCES `site_options` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `spotlight_content`
--
ALTER TABLE `spotlight_content`
  ADD CONSTRAINT `fk_spotlight_content_to_spotlight` FOREIGN KEY (`spotlight_id`) REFERENCES `spotlight` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `story_content`
--
ALTER TABLE `story_content`
  ADD CONSTRAINT `fk_story_content_to_story` FOREIGN KEY (`story_id`) REFERENCES `stories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `team`
--
ALTER TABLE `team`
  ADD CONSTRAINT `fk_team_to_category` FOREIGN KEY (`category_id`) REFERENCES `team_categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_team_to_location` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `team_category_content`
--
ALTER TABLE `team_category_content`
  ADD CONSTRAINT `fk_team_category_content_to_category` FOREIGN KEY (`category_id`) REFERENCES `team_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `team_content`
--
ALTER TABLE `team_content`
  ADD CONSTRAINT `fk_team_content_to_team` FOREIGN KEY (`team_id`) REFERENCES `team` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `test_features`
--
ALTER TABLE `test_features`
  ADD CONSTRAINT `fk_test_feature_to_category` FOREIGN KEY (`category_id`) REFERENCES `test_feature_categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `test_feature_category_content`
--
ALTER TABLE `test_feature_category_content`
  ADD CONSTRAINT `fk_test_feature_category_content_to_category` FOREIGN KEY (`category_id`) REFERENCES `test_feature_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `test_feature_content`
--
ALTER TABLE `test_feature_content`
  ADD CONSTRAINT `fk_test_feature_content_to_test_feature` FOREIGN KEY (`test_feature_id`) REFERENCES `test_features` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `theme_layouts`
--
ALTER TABLE `theme_layouts`
  ADD CONSTRAINT `fk_theme_layouts_to_them` FOREIGN KEY (`theme_id`) REFERENCES `themes` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `theme_templates`
--
ALTER TABLE `theme_templates`
  ADD CONSTRAINT `fk_theme_templates_to_thems` FOREIGN KEY (`theme_id`) REFERENCES `themes` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
SET FOREIGN_KEY_CHECKS=1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
