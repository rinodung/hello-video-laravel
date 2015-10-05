# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: localhost (MySQL 5.5.42)
# Database: hv
# Generation Time: 2015-05-31 18:19:26 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table favorites
# ------------------------------------------------------------

DROP TABLE IF EXISTS `favorites`;

CREATE TABLE `favorites` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `video_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `favorites` WRITE;
/*!40000 ALTER TABLE `favorites` DISABLE KEYS */;

INSERT INTO `favorites` (`id`, `user_id`, `video_id`, `created_at`, `updated_at`)
VALUES
	(5,1,26,'2015-01-13 15:05:58','2015-01-13 15:05:58'),
	(6,1,27,'2015-01-13 15:36:14','2015-01-13 15:36:14'),
	(7,1,24,'2015-01-13 15:36:18','2015-01-13 15:36:18'),
	(8,1,23,'2015-01-13 15:36:22','2015-01-13 15:36:22'),
	(9,1,22,'2015-01-13 15:36:28','2015-01-13 15:36:28'),
	(10,1,20,'2015-01-13 15:36:34','2015-01-13 15:36:34'),
	(11,1,19,'2015-01-13 15:36:38','2015-01-13 15:36:38'),
	(12,1,18,'2015-01-13 15:36:43','2015-01-13 15:36:43'),
	(13,1,14,'2015-01-13 15:37:02','2015-01-13 15:37:02'),
	(14,1,13,'2015-01-13 15:37:06','2015-01-13 15:37:06'),
	(15,2,29,'2015-01-28 14:43:05','2015-01-28 14:43:05'),
	(19,1,47,'2015-02-27 21:34:09','2015-02-27 21:34:09'),
	(22,2,46,'2015-03-01 05:31:19','2015-03-01 05:31:19'),
	(23,2,30,'2015-03-01 05:31:23','2015-03-01 05:31:23');

/*!40000 ALTER TABLE `favorites` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table menu
# ------------------------------------------------------------

DROP TABLE IF EXISTS `menu`;

CREATE TABLE `menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `type` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;

INSERT INTO `menu` (`id`, `parent_id`, `order`, `name`, `url`, `type`, `created_at`, `updated_at`)
VALUES
	(3,NULL,1,'Home','/','none','2015-01-06 03:52:06','2015-02-05 14:09:07'),
	(4,NULL,6,'Pages','/pages','none','2015-01-06 04:33:01','2015-05-31 16:57:16'),
	(5,4,7,'F.A.Q.s','/page/faq','none','2015-01-07 18:26:13','2015-05-31 16:57:16'),
	(11,NULL,4,'Videos','','videos','2015-01-11 02:14:53','2015-05-31 16:57:16'),
	(12,NULL,5,'Posts','','posts','2015-01-11 02:16:26','2015-05-31 16:57:16');

/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table pages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pages`;

CREATE TABLE `pages` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `slug` varchar(255) NOT NULL DEFAULT '',
  `body` text NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;

INSERT INTO `pages` (`id`, `user_id`, `title`, `slug`, `body`, `active`, `created_at`, `updated_at`)
VALUES
	(1,1,'Frequently Asked Questions','faq','<div style=\"width: 47%; margin-right: 3%; float: left; height: 270px;\">\r\n<p class=\"theme_color_background\" style=\"padding: 10px; color: #fff; border-radius: 5px; font-weight: bold; font-size: 16px; text-align: center;\">What is HelloVideo?</p>\r\n<p style=\"color: #8a929d; font-size: 14px;\">Hello Video is a Premium Video Content Management System. As an admin you\'ll be able to add Videos and Articles to your website. You can choose to make your content available for free or only to subscribers. You can link a <a href=\"http://www.stripe.com\" target=\"_blank\">Stripe</a> account to your site and allow for users to subscribe to your site and unlock the premium content. You add your videos, add your articles, add your price point, and you rake in money from your subscribers</p>\r\n</div>\r\n<div style=\"width: 47%; margin-left: 3%; float: left; height: 270px;\">\r\n<p class=\"theme_color_background\" style=\"padding: 10px 20px; color: #fff; border-radius: 5px; font-weight: bold; font-size: 16px; text-align: center;\">What is HelloVideo?</p>\r\n<p style=\"color: #8a929d; font-size: 14px;\">Hello Video is a Premium Video Content Management System. As an admin you\'ll be able to add Videos and Articles to your website. You can choose to make your content available for free or only to subscribers. You can link a <a href=\"http://www.stripe.com\" target=\"_blank\">Stripe</a> account to your site and allow for users to subscribe to your site and unlock the premium content. You add your videos, add your articles, add your price point, and you rake in money from your subscribers</p>\r\n</div>\r\n<div style=\"width: 47%; margin-right: 3%; float: left; height: 270px;\">\r\n<p class=\"theme_color_background\" style=\"padding: 10px 20px; color: #fff; border-radius: 5px; font-weight: bold; font-size: 16px; text-align: center;\">What is HelloVideo?</p>\r\n<p style=\"color: #8a929d; font-size: 14px;\">Hello Video is a Premium Video Content Management System. As an admin you\'ll be able to add Videos and Articles to your website. You can choose to make your content available for free or only to subscribers. You can link a <a href=\"http://www.stripe.com\" target=\"_blank\">Stripe</a> account to your site and allow for users to subscribe to your site and unlock the premium content. You add your videos, add your articles, add your price point, and you rake in money from your subscribers</p>\r\n</div>\r\n<div style=\"width: 47%; margin-left: 3%; float: left; height: 270px;\">\r\n<p class=\"theme_color_background\" style=\"padding: 10px 20px; color: #fff; border-radius: 5px; font-weight: bold; font-size: 16px; text-align: center;\">What is HelloVideo?</p>\r\n<p style=\"color: #8a929d; font-size: 14px;\">Hello Video is a Premium Video Content Management System. As an admin you\'ll be able to add Videos and Articles to your website. You can choose to make your content available for free or only to subscribers. You can link a <a href=\"http://www.stripe.com\" target=\"_blank\">Stripe</a> account to your site and allow for users to subscribe to your site and unlock the premium content. You add your videos, add your articles, add your price point, and you rake in money from your subscribers</p>\r\n</div>\r\n<div style=\"width: 47%; margin-right: 3%; float: left; height: 270px;\">\r\n<p class=\"theme_color_background\" style=\"padding: 10px 20px; color: #fff; border-radius: 5px; font-weight: bold; font-size: 16px; text-align: center;\">What is HelloVideo?</p>\r\n<p style=\"color: #8a929d; font-size: 14px;\">Hello Video is a Premium Video Content Management System. As an admin you\'ll be able to add Videos and Articles to your website. You can choose to make your content available for free or only to subscribers. You can link a <a href=\"http://www.stripe.com\" target=\"_blank\">Stripe</a> account to your site and allow for users to subscribe to your site and unlock the premium content. You add your videos, add your articles, add your price point, and you rake in money from your subscribers</p>\r\n</div>\r\n<div style=\"width: 47%; margin-left: 3%; float: left; height: 270px;\">\r\n<p class=\"theme_color_background\" style=\"padding: 10px 20px; color: #fff; border-radius: 5px; font-weight: bold; font-size: 16px; text-align: center;\">What is HelloVideo?</p>\r\n<p style=\"color: #8a929d; font-size: 14px;\">Hello Video is a Premium Video Content Management System. As an admin you\'ll be able to add Videos and Articles to your website. You can choose to make your content available for free or only to subscribers. You can link a <a href=\"http://www.stripe.com\" target=\"_blank\">Stripe</a> account to your site and allow for users to subscribe to your site and unlock the premium content. You add your videos, add your articles, add your price point, and you rake in money from your subscribers</p>\r\n</div>',1,'2015-01-10 03:47:27','2015-02-05 14:05:39');

/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table password_resets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table payment_settings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `payment_settings`;

CREATE TABLE `payment_settings` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `live_mode` tinyint(1) NOT NULL DEFAULT '0',
  `test_secret_key` varchar(100) NOT NULL DEFAULT '',
  `test_publishable_key` varchar(100) NOT NULL DEFAULT '',
  `live_secret_key` varchar(100) NOT NULL DEFAULT '',
  `live_publishable_key` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `payment_settings` WRITE;
/*!40000 ALTER TABLE `payment_settings` DISABLE KEYS */;

INSERT INTO `payment_settings` (`id`, `live_mode`, `test_secret_key`, `test_publishable_key`, `live_secret_key`, `live_publishable_key`)
VALUES
	(1,0,'','','','');

/*!40000 ALTER TABLE `payment_settings` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table plugin_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `plugin_data`;

CREATE TABLE `plugin_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `plugin_slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table plugins
# ------------------------------------------------------------

DROP TABLE IF EXISTS `plugins`;

CREATE TABLE `plugins` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table post_categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `post_categories`;

CREATE TABLE `post_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `post_categories` WRITE;
/*!40000 ALTER TABLE `post_categories` DISABLE KEYS */;

INSERT INTO `post_categories` (`id`, `parent_id`, `order`, `name`, `slug`, `created_at`, `updated_at`)
VALUES
	(6,NULL,1,'Example Category 1','example-category-1','2015-01-04 01:15:33','2015-02-05 14:08:36'),
	(7,NULL,3,'Example Category 2','example-category-2','2015-01-04 01:16:27','2015-02-05 14:08:33'),
	(8,6,2,'Example Sub-category 1','example-sub-category-1','2015-01-04 01:16:42','2015-02-05 14:08:36');

/*!40000 ALTER TABLE `post_categories` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table posts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `posts`;

CREATE TABLE `posts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `post_category_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `slug` varchar(255) NOT NULL DEFAULT '',
  `image` varchar(255) NOT NULL DEFAULT '',
  `body` mediumtext NOT NULL,
  `body_guest` mediumtext,
  `access` varchar(20) NOT NULL DEFAULT 'guest',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;

INSERT INTO `posts` (`id`, `post_category_id`, `user_id`, `title`, `slug`, `image`, `body`, `body_guest`, `access`, `active`, `created_at`, `updated_at`)
VALUES
	(1,6,1,'Example Post 1','example-post-1','January2015/example-post-1.jpg','<p>This is an example post. You can blog about anything related to your video site. You can blog about anything interesting that your audience might find beneficial. You can create new posts from your admin section and add as much text, images, links, and content as you would like.</p>\r\n<p><strong>Here is an example Bold Text Paragraph. And below is an example image :)</strong></p>\r\n<p><img title=\"Example Post 1\" src=\"/content/uploads/images/January2015/FILE-20150103-1715FX2CPTHWAFHR.jpg\" alt=\"\" width=\"100%\" height=\"auto\" /></p>\r\n<p>Add many posts to add value to your site and increase your sites SEO value. Creating new posts is a breeze with our Simple to use WYSIWYG editor and easy to use admin section. Checkout a quick screenshot of this article being created below:</p>\r\n<p><img title=\"Example Post 1\" src=\"/content/uploads/images/January2015/FILE-20150103-18154RYZ152RD692.jpg\" alt=\"\" width=\"100%\" height=\"auto\" /></p>','','guest',1,'2015-01-04 01:10:21','2015-01-10 16:24:23'),
	(2,7,1,'Example Post 2','example-post-2','January2015/example-post-2.jpg','<p>This is yet another example post. In this post I\'ll Show a few more things that can be added to a post. Such as different headers and styled&nbsp;text.</p>\r\n<h2>Here is a larger header.</h2>\r\n<p><span style=\"text-decoration: underline;\">And here is some underlined text as well.</span></p>\r\n<p>Essentially any type of formatting can be done to your posts to make them look as good as you would like them to. Additionally, you can view the full source of a post and edit the HTML if needed :)</p>\r\n<p>&nbsp;<img title=\"My Sample Post 2\" src=\"/content/uploads/images/January2015/FILE-20150104-0812LG5GLGZ9R3L9.jpg\" alt=\"\" width=\"100%\" height=\"auto\" /></p>\r\n<p>The great thing about using the post editor is that you can even upload images directly from the TinyMCE editor window. Checkout the screenshot below:</p>\r\n<p><img title=\"My Sample Post 2\" src=\"/content/uploads/images/January2015/FILE-20150104-0805CSLTTAT75TUW.jpg\" alt=\"\" width=\"100%\" height=\"auto\" /></p>','','guest',1,'2015-01-04 01:00:21','2015-01-04 18:21:19'),
	(3,8,1,'Example Post 3','example-post-3','January2015/example-post-3.jpg','<p>This is yet another example post to show you the power of the built-in blogging platform used for the HelloVideo CMS. We have constructed this product the way that we would want a traditional CMS and Premium Video CMS to function. In fact we use this script for many personal projects ourselves.</p>\r\n<p>Be sure to checkout the live demo of the product so you can see just how easy it is to create/edit/delete posts.</p>\r\n<p><img title=\"Example Post 3\" src=\"/content/uploads/images/January2015/FILE-20150104-0853Q2691CN8KQT1.jpg\" alt=\"\" width=\"100%\" height=\"auto\" /></p>\r\n<p>The powerful thing about the blogging system is that posts can be shown to everyone or just subscribers. This is an example of showing only a portion of the post. In order to view the full post you\'ll have to sign in. So go ahead and signup for an account and checkout the rest of this post. This is very beneficial for SEO purposes, because even your premium content can have some SEO gravity&nbsp;to bring users to your site.</p>\r\n<p>Hey! Welcome to the premium content of this post. Now you can add any other content that you want to show to only subscribers. So, the previous content for non-subscribers may be an introduction into a tutorial or how-to. Then the real content of your post can be available to only subscribers of your site. That\'s pretty powerful!</p>\r\n<p>If your site has good content users will be more than happy to pay a small monthly premium to get access to all your content.</p>\r\n<p>Now, make sure to checkout some of the premium videos that were only available to subscribers :)</p>\r\n<p>Thanks for Reading!!!</p>\r\n<p>&nbsp;</p>','<p>This is yet another example post to show you the power of the built-in blogging platform used for the HelloVideo CMS. We have constructed this product the way that we would want a traditional CMS and Premium Video CMS to function. In fact we use this script for many personal projects ourselves.</p>\r\n<p>Be sure to checkout the live demo of the product so you can see just how easy it is to create/edit/delete posts.</p>\r\n<p><img title=\"Example Post 3\" src=\"/content/uploads/images/January2015/FILE-20150104-0853Q2691CN8KQT1.jpg\" alt=\"\" width=\"100%\" height=\"auto\" /></p>\r\n<p>The powerful thing about the blogging system is that posts can be shown to everyone or just subscribers. This is an example of showing only a portion of the post. In order to view the full post you\'ll have to sign in. So go ahead and signup for an account and checkout the rest of this post.</p>','subscriber',1,'2015-01-03 16:30:04','2015-01-10 18:13:56'),
	(4,6,1,'Sample Post 4','sample-post-4','January2015/sample-post-4.jpg','<p>Jolly boat dead men tell no tales Admiral of the Black lugger fathom Letter of Marque Sink me sloop Buccaneer overhaul. Gabion brigantine hail-shot yardarm Jack Ketch Shiver me timbers broadside yawl smartly rum. Measured fer yer chains cackle fruit man-of-war squiffy red ensign Arr hail-shot gabion Pirate Round spirits.</p>\r\n<p>Plunder me lugsail bucko bilge Chain Shot sutler Pieces of Eight marooned Jolly Roger. Matey mizzenmast black jack gibbet spyglass man-of-war sloop smartly booty pink. Brig Chain Shot provost rum bilged on her anchor case shot hogshead log coffer topmast.</p>\r\n<p>Dead men tell no tales Nelsons folly wench rigging maroon league Privateer hail-shot deadlights scourge of the seven seas. Line cackle fruit long boat weigh anchor overhaul gunwalls Sail ho plunder killick black jack. Fire in the hole Brethren of the Coast tack topmast coffer grapple lee Buccaneer log lass.</p>','','guest',1,'2015-01-02 11:35:50','2015-01-04 18:20:48'),
	(5,6,1,'Sample Post 5','sample-post-5','January2015/sample-post-5.jpg','<p>Come about crow\'s nest Jack Ketch aye Sink me fathom bilge stern fire ship crack Jennys tea cup. Overhaul Arr weigh anchor code of conduct hands ahoy line list matey clap of thunder. Barbary Coast league lad aye Davy Jones\' Locker trysail bilge water hogshead cable Buccaneer.</p>\r\n<p>Draft ho Letter of Marque splice the main brace crack Jennys tea cup tackle me Davy Jones\' Locker league execution dock. Chandler league Pieces of Eight scuppers hands fire ship barque spike ballast stern. Letter of Marque strike colors broadside avast tender warp nipper log skysail mutiny.</p>\r\n<p>Blimey snow Brethren of the Coast hogshead pillage brig lass measured fer yer chains cackle fruit fire in the hole. Sheet topsail pressgang gally belay case shot draft holystone hearties pinnace. Six pounders scuppers spike interloper fore heave to topgallant brigantine wench port.</p>','','guest',1,'2015-01-02 10:36:50','2015-01-04 18:20:36'),
	(6,6,1,'Sample Post 6','sample-post-6','January2015/sample-post-6.jpg','<p>Aye prow Arr Barbary Coast quarterdeck parrel broadside pressgang yardarm Nelsons folly. Broadside aft scurvy measured fer yer chains man-of-war bring a spring upon her cable brig stern aye brigantine. Fire in the hole bilged on her anchor spike take a caulk coxswain line tack grapple Pirate Round ballast.</p>\r\n<p>Lad scurvy piracy crimp quarterdeck doubloon plunder bilge rat aye Spanish Main. Gangplank clap of thunder heave down poop deck execution dock parrel black spot spanker scurvy take a caulk. Topsail measured fer yer chains brig yawl hang the jib scuppers Sail ho mizzenmast Jack Tar yo-ho-ho.</p>\r\n<p>Cutlass haul wind bilge water hands man-of-war swing the lead walk the plank parley dance the hempen jig fluke. Wherry Yellow Jack six pounders lanyard Privateer long boat hulk draft Jack Ketch case shot. Keel sloop prow gangway interloper bucko draught stern galleon mutiny.</p>','','guest',1,'2015-01-01 16:37:33','2015-01-04 18:20:22'),
	(7,6,1,'Sample Post 7','sample-post-7','January2015/sample-post-7.jpg','<p>Chase guns nipper walk the plank grog blossom run a shot across the bow chantey long clothes draught jib pinnace. Swing the lead Sail ho snow tackle mutiny run a shot across the bow rope\'s end piracy long clothes hulk. Poop deck Jolly Roger scurvy bilge rat snow knave carouser booty mizzenmast hulk.</p>\r\n<p>Davy Jones\' Locker Pieces of Eight fluke Cat o\'nine tails mizzen list Jack Ketch cable keelhaul no prey, no pay. Lad pink Jolly Roger draught lee cackle fruit long boat reef sails booty cable. Log execution dock gun chandler Sea Legs Pieces of Eight Plate Fleet interloper aye jolly boat.</p>\r\n<p>Run a rig crow\'s nest six pounders code of conduct long boat bilged on her anchor yo-ho-ho Barbary Coast hogshead warp. Heave down Spanish Main careen list yard Sail ho hulk crow\'s nest Sea Legs knave. Capstan bilge rat driver parrel starboard wench gangplank ye gun belaying pin.</p>','','guest',1,'2015-01-01 15:38:33','2015-01-04 18:20:13'),
	(8,6,1,'Sample Post 8','sample-post-8','January2015/sample-post-8.jpg','<p>Pinnace long clothes doubloon lookout loot gaff spike scourge of the seven seas Barbary Coast fathom. Pirate splice the main brace execution dock fluke poop deck Chain Shot handsomely Jolly Roger Buccaneer Brethren of the Coast. Keelhaul knave Spanish Main boatswain fathom pillage Corsair loaded to the gunwalls brigantine scurvy.</p>\r\n<p>Yo-ho-ho wherry brig topsail stern me Jack Ketch holystone American Main lee. Lee jack parley galleon sutler starboard list black spot Arr bring a spring upon her cable. Walk the plank run a shot across the bow smartly spirits heave down weigh anchor shrouds rum maroon reef.</p>\r\n<p>Transom ahoy jury mast lad Gold Road carouser piracy interloper yo-ho-ho parrel. Warp tackle pillage plunder heave down mutiny Yellow Jack topmast lass reef. Careen bowsprit measured fer yer chains pink bucko knave weigh anchor tender fore port.</p>','','guest',1,'2015-01-01 14:39:00','2015-01-04 18:20:03'),
	(9,6,1,'Sample Post 9','sample-post-9','January2015/sample-post-9.jpg','<p>Belay black jack man-of-war reef swab squiffy driver square-rigged no prey, no pay aft. Hands boatswain parrel Admiral of the Black maroon rigging transom hardtack broadside black spot. Letter of Marque gunwalls coffer starboard lugsail squiffy Jack Tar sheet crack Jennys tea cup Pieces of Eight.</p>\r\n<p>Run a shot across the bow hempen halter ye heave to Sail ho pillage heave down fire ship keel hearties. Prow walk the plank stern yardarm coffer draft knave Admiral of the Black wherry Cat o\'nine tails. Clipper bucko yardarm Brethren of the Coast Arr crimp clap of thunder boatswain pressgang strike colors.</p>\r\n<p>Overhaul barkadeer spirits bounty long clothes transom gibbet pressgang Chain Shot Shiver me timbers. Chain Shot mizzen red ensign Privateer draught jury mast man-of-war run a rig holystone pinnace. Plunder nipper pink rigging log aft hogshead Plate Fleet run a shot across the bow main sheet.</p>','','guest',1,'2015-01-01 13:39:32','2015-01-04 18:19:53'),
	(10,6,1,'Sample Post 10','sample-post-10','January2015/sample-post-10.jpg','<p>Take a caulk Yellow Jack cackle fruit scourge of the seven seas coxswain chase guns Jack Tar lass hulk matey. Black spot handsomely yawl overhaul cable broadside heave down scallywag dead men tell no tales sutler. Rigging aye holystone fluke ye chandler Gold Road gabion Sail ho crimp.</p>\r\n<p>Bilge rat ye reef sails spyglass landlubber or just lubber Plate Fleet Buccaneer walk the plank splice the main brace lateen sail. Holystone prow yo-ho-ho walk the plank bilge water scuppers trysail reef sails measured fer yer chains matey. Marooned red ensign lugsail starboard chase lateen sail scurvy parrel weigh anchor yard.</p>\r\n<p>Draft mutiny provost tender ahoy crow\'s nest schooner carouser reef sails Cat o\'nine tails. Gangplank ballast killick run a rig lanyard Brethren of the Coast case shot weigh anchor jolly boat barque. Squiffy yo-ho-ho belaying pin bowsprit flogging lee lanyard loot knave bring a spring upon her cable.</p>','','guest',1,'2015-01-01 12:40:19','2015-01-04 18:19:43'),
	(11,6,1,'Sample Post 11','sample-post-11','January2015/sample-post-11.jpg','<p>Haul wind quarterdeck mizzen Plate Fleet gally draft grog barque nipper come about. Rigging Chain Shot boatswain gibbet Gold Road jolly boat holystone ballast hempen halter to go on account. Ye rigging Barbary Coast weigh anchor careen black spot mutiny Corsair scourge of the seven seas killick.</p>\r\n<p>Clap of thunder aft Nelsons folly fluke scourge of the seven seas league clipper poop deck Gold Road broadside. Gunwalls yawl hulk Jolly Roger quarterdeck loaded to the gunwalls nipperkin run a rig hearties black jack. Rigging pressgang Privateer fore scourge of the seven seas gabion provost gangway quarterdeck Blimey.</p>\r\n<p>Swing the lead yawl belaying pin cackle fruit driver spirits me gunwalls Pirate Round walk the plank. Matey to go on account quarterdeck deadlights pirate boom chase guns ho yard list. Fathom topgallant smartly yardarm barque spirits scurvy topsail lateen sail ho.</p>','','guest',1,'2015-01-01 11:40:49','2015-02-05 14:08:06'),
	(12,6,1,'Sample Post 12','sample-post-12','January2015/sample-post-12.jpg','<p>Rope\'s end hang the jib belay squiffy hands mizzen crack Jennys tea cup avast snow quarterdeck. Blimey loot Nelsons folly boom run a shot across the bow black jack Plate Fleet interloper hempen halter fire ship. Coffer mizzenmast draft haul wind sheet hempen halter crimp spanker Chain Shot clipper.</p>\r\n<p>Hogshead gaff bilge water Admiral of the Black doubloon fathom galleon hang the jib clap of thunder heave down. Jack Tar bilge spanker swab pirate Nelsons folly spike Barbary Coast Privateer heave down. Cable Blimey Arr wherry long boat spanker gunwalls draft sutler lass.</p>\r\n<p>Ballast reef sails lookout bowsprit snow list doubloon main sheet Davy Jones\' Locker loot. Take a caulk no prey, no pay lad chandler gaff pirate Letter of Marque topsail fluke code of conduct. Reef sails galleon driver tender Plate Fleet gally loaded to the gunwalls stern cable Chain Shot.</p>','','guest',1,'2015-01-01 10:41:13','2015-01-04 18:04:44');

/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table settings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `settings`;

CREATE TABLE `settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `website_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Hello Video',
  `website_description` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Your Premium Video CMS',
  `logo` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'logo.png',
  `favicon` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'favicon.png',
  `system_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'email@domain.com',
  `demo_mode` tinyint(1) NOT NULL DEFAULT '0',
  `enable_https` tinyint(1) NOT NULL DEFAULT '0',
  `theme` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'default',
  `facebook_page_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `google_page_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `twitter_page_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `youtube_page_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `google_tracking_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `google_oauth_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `videos_per_page` int(11) NOT NULL DEFAULT '12',
  `posts_per_page` int(11) NOT NULL DEFAULT '12',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;

INSERT INTO `settings` (`id`, `website_name`, `website_description`, `logo`, `favicon`, `system_email`, `demo_mode`, `enable_https`, `theme`, `facebook_page_id`, `google_page_id`, `twitter_page_id`, `youtube_page_id`, `google_tracking_id`, `google_oauth_key`, `created_at`, `updated_at`, `videos_per_page`, `posts_per_page`)
VALUES
	(1,'Hello Video','Your Online Video Subscription Platform','','','email@email.com',1,0,'default','hellovideoapp','hellovideoapp','hellovideoapp','','','','0000-00-00 00:00:00','2015-05-31 16:00:16',12,12);

/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tag_video
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tag_video`;

CREATE TABLE `tag_video` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `video_id` int(10) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tag_video_video_id_index` (`video_id`),
  KEY `tag_video_tag_id_index` (`tag_id`),
  CONSTRAINT `tag_video_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tag_video_video_id_foreign` FOREIGN KEY (`video_id`) REFERENCES `videos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `tag_video` WRITE;
/*!40000 ALTER TABLE `tag_video` DISABLE KEYS */;

INSERT INTO `tag_video` (`id`, `video_id`, `tag_id`)
VALUES
	(5,1,3),
	(6,1,4),
	(10,1,7),
	(11,1,8),
	(14,1,10),
	(16,2,10),
	(17,2,11),
	(19,2,13),
	(27,11,21),
	(28,11,22),
	(29,11,23),
	(30,11,24),
	(31,11,25),
	(32,11,26),
	(33,11,27),
	(34,12,28),
	(35,12,29),
	(36,12,30),
	(37,12,31),
	(38,12,32),
	(39,12,33),
	(40,12,34),
	(41,12,35),
	(42,12,36),
	(43,13,37),
	(44,13,38),
	(45,13,39),
	(46,13,40),
	(47,13,41),
	(48,14,42),
	(49,14,43),
	(50,14,44),
	(51,15,45),
	(52,15,46),
	(53,16,47),
	(54,16,48),
	(55,16,49),
	(56,16,50),
	(58,17,10),
	(59,17,52),
	(60,17,53),
	(61,17,54),
	(62,17,55),
	(63,17,56),
	(64,18,57),
	(65,18,58),
	(66,18,59),
	(67,18,60),
	(68,19,61),
	(69,19,62),
	(70,19,63),
	(71,19,64),
	(72,19,65),
	(73,20,66),
	(74,20,67),
	(75,20,68),
	(76,20,69),
	(78,22,70),
	(79,22,71),
	(80,22,72),
	(81,22,73),
	(82,23,74),
	(83,23,75),
	(84,23,76),
	(85,24,77),
	(86,24,78),
	(87,24,79),
	(88,25,42),
	(89,25,80),
	(90,25,81),
	(91,25,82),
	(92,26,83),
	(93,26,84),
	(94,26,85),
	(95,26,86),
	(96,26,67),
	(97,27,87),
	(98,27,88),
	(99,27,89),
	(100,27,80),
	(101,27,81),
	(102,28,90),
	(103,28,85),
	(104,28,79),
	(105,28,91),
	(106,29,85),
	(107,29,92),
	(108,29,93),
	(109,30,94),
	(110,30,95),
	(111,30,96),
	(112,30,80),
	(113,30,81),
	(114,30,97),
	(115,30,98),
	(116,31,99),
	(117,31,100),
	(118,31,101),
	(119,32,102),
	(120,32,103),
	(121,32,104),
	(122,32,105),
	(123,33,106),
	(124,33,107),
	(125,33,108),
	(126,33,109),
	(127,34,110),
	(128,34,75),
	(129,34,111),
	(130,34,112),
	(131,34,113),
	(132,9,51),
	(136,36,117),
	(137,36,118),
	(138,36,119),
	(139,36,120),
	(140,36,121),
	(141,37,122),
	(142,37,123),
	(143,37,124),
	(144,37,125),
	(145,37,126),
	(146,38,80),
	(147,38,81),
	(148,38,127),
	(149,38,128),
	(150,39,129),
	(151,39,130),
	(152,39,131),
	(153,39,80),
	(154,40,132),
	(155,40,133),
	(156,41,134),
	(157,41,132),
	(158,41,135),
	(159,41,136),
	(160,42,137),
	(161,42,138),
	(162,42,139),
	(163,42,140),
	(164,43,141),
	(165,43,140),
	(166,43,139),
	(167,44,137),
	(168,44,142),
	(169,44,143),
	(170,45,144),
	(171,45,145),
	(172,45,146),
	(173,45,147),
	(174,46,148),
	(175,46,149),
	(176,46,150),
	(177,46,151),
	(178,46,152),
	(179,46,153),
	(180,46,154),
	(181,47,11),
	(182,47,155),
	(183,47,85);

/*!40000 ALTER TABLE `tag_video` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tags
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tags`;

CREATE TABLE `tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tags_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;

INSERT INTO `tags` (`id`, `name`, `created_at`, `updated_at`)
VALUES
	(3,'gmail','2014-10-04 16:31:57','2014-10-04 16:31:57'),
	(4,'techzilla','2014-10-04 16:31:57','2014-10-04 16:31:57'),
	(7,'organized','2014-10-08 15:45:48','2014-10-08 15:45:48'),
	(8,'chrome','2014-10-08 15:49:01','2014-10-08 15:49:01'),
	(10,'revision3','2014-10-09 02:01:56','2014-10-09 02:01:56'),
	(11,'tmnt','2014-10-09 14:33:28','2014-10-09 14:33:28'),
	(13,'teenage mutant ninja turtles','2014-10-09 14:39:58','2014-10-09 14:39:58'),
	(21,'top 5','2014-10-10 18:57:51','2014-10-10 18:57:51'),
	(22,'glitch','2014-10-10 18:57:51','2014-10-10 18:57:51'),
	(23,'mario','2014-10-10 18:57:51','2014-10-10 18:57:51'),
	(24,'zelda','2014-10-10 18:57:51','2014-10-10 18:57:51'),
	(25,'yoshi','2014-10-10 18:57:51','2014-10-10 18:57:51'),
	(26,'link','2014-10-10 18:57:51','2014-10-10 18:57:51'),
	(27,'nintendo','2014-10-10 18:57:51','2014-10-10 18:57:51'),
	(28,'nes','2014-10-10 19:09:30','2014-10-10 19:09:30'),
	(29,'gameboy','2014-10-10 19:09:30','2014-10-10 19:09:30'),
	(30,'gaming','2014-10-10 19:09:30','2014-10-10 19:09:30'),
	(31,'retro','2014-10-10 19:09:30','2014-10-10 19:09:30'),
	(32,'classic','2014-10-10 19:09:30','2014-10-10 19:09:30'),
	(33,'tech','2014-10-10 19:09:30','2014-10-10 19:09:30'),
	(34,'review','2014-10-10 19:09:30','2014-10-10 19:09:30'),
	(35,'video games','2014-10-10 19:09:30','2014-10-10 19:09:30'),
	(36,'super nintendo','2014-10-10 19:09:30','2014-10-10 19:09:30'),
	(37,'programming','2014-10-10 19:26:43','2014-10-10 19:26:43'),
	(38,'education','2014-10-10 19:26:43','2014-10-10 19:26:43'),
	(39,'mark zuckerberg','2014-10-10 19:26:43','2014-10-10 19:26:43'),
	(40,'bill gates','2014-10-10 19:26:43','2014-10-10 19:26:43'),
	(41,'code','2014-10-10 19:26:43','2014-10-10 19:26:43'),
	(42,'jimmy fallon','2014-10-10 20:15:05','2014-10-10 20:15:05'),
	(43,'latenight','2014-10-10 20:15:05','2014-10-10 20:15:05'),
	(44,'late-night','2014-10-10 20:15:05','2014-10-10 20:15:05'),
	(45,'carrot','2014-10-10 20:25:33','2014-10-10 20:25:33'),
	(46,'introducing carrot','2014-10-10 20:25:33','2014-10-10 20:25:33'),
	(47,'time-lapse','2014-10-10 20:37:54','2014-10-10 20:37:54'),
	(48,'time lapse','2014-10-10 20:37:54','2014-10-10 20:37:54'),
	(49,'lapse','2014-10-10 20:37:54','2014-10-10 20:37:54'),
	(50,'norway','2014-10-10 20:37:54','2014-10-10 20:37:54'),
	(51,'','2014-12-21 01:08:48','2014-12-21 01:08:48'),
	(52,'android','2014-12-26 15:53:47','2014-12-26 15:53:47'),
	(53,'tablets','2014-12-26 15:53:47','2014-12-26 15:53:47'),
	(54,'electronics','2014-12-26 15:53:47','2014-12-26 15:53:47'),
	(55,'gadgets','2014-12-26 15:53:47','2014-12-26 15:53:47'),
	(56,'android authority','2014-12-26 15:53:47','2014-12-26 15:53:47'),
	(57,'foundation','2014-12-27 03:06:32','2014-12-27 03:06:32'),
	(58,'kevin rose','2014-12-27 03:06:32','2014-12-27 03:06:32'),
	(59,'tim ferris','2014-12-27 03:06:32','2014-12-27 03:06:32'),
	(60,'author','2014-12-27 03:06:32','2014-12-27 03:06:32'),
	(61,'treehouse show','2014-12-27 15:20:31','2014-12-27 15:20:31'),
	(62,'team treehouse','2014-12-27 15:20:31','2014-12-27 15:20:31'),
	(63,'gulpjs','2014-12-27 15:20:31','2014-12-27 15:20:31'),
	(64,'gulp js','2014-12-27 15:20:31','2014-12-27 15:20:31'),
	(65,'sketch 3','2014-12-27 15:20:31','2014-12-27 15:20:31'),
	(66,'alma','2014-12-27 15:42:34','2014-12-27 15:42:34'),
	(67,'short film','2014-12-27 15:42:34','2014-12-27 15:42:34'),
	(68,'pixar animator','2014-12-27 15:42:34','2014-12-27 15:42:34'),
	(69,'fantastic fest awards','2014-12-27 15:42:34','2014-12-27 15:42:34'),
	(70,'ae tuts','2014-12-27 18:55:31','2014-12-27 18:55:31'),
	(71,'short video','2014-12-27 18:55:31','2014-12-27 18:55:31'),
	(72,'logo sting','2014-12-27 18:55:31','2014-12-27 18:55:31'),
	(73,'logo reveal','2014-12-27 18:55:31','2014-12-27 18:55:31'),
	(74,'coast','2015-01-08 01:31:28','2015-01-08 01:31:28'),
	(75,'scenery','2015-01-08 01:31:28','2015-01-08 01:31:28'),
	(76,'vimeo','2015-01-08 01:31:28','2015-01-08 01:31:28'),
	(77,'hug it out','2015-01-08 02:02:15','2015-01-08 02:02:15'),
	(78,'characters','2015-01-08 02:02:15','2015-01-08 02:02:15'),
	(79,'animation','2015-01-08 02:02:15','2015-01-08 02:02:15'),
	(80,'funny','2015-01-08 02:11:47','2015-01-08 02:11:47'),
	(81,'comedy','2015-01-08 02:11:47','2015-01-08 02:11:47'),
	(82,'nick offerman','2015-01-08 02:11:47','2015-01-08 02:11:47'),
	(83,'inside out','2015-01-08 02:52:48','2015-01-08 02:52:48'),
	(84,'disney','2015-01-08 02:52:48','2015-01-08 02:52:48'),
	(85,'trailer','2015-01-08 02:52:48','2015-01-08 02:52:48'),
	(86,'pixar','2015-01-08 02:52:48','2015-01-08 02:52:48'),
	(87,'gru','2015-01-08 03:16:37','2015-01-08 03:16:37'),
	(88,'minions','2015-01-08 03:16:37','2015-01-08 03:16:37'),
	(89,'dispicable me','2015-01-08 03:16:37','2015-01-08 03:16:37'),
	(90,'big buck bunny','2015-01-22 14:41:28','2015-01-22 14:41:28'),
	(91,'blender','2015-01-22 14:41:28','2015-01-22 14:41:28'),
	(92,'hobbit','2015-01-24 08:08:05','2015-01-24 08:08:05'),
	(93,'lord of the rings','2015-01-24 08:08:05','2015-01-24 08:08:05'),
	(94,'johnnyexpress','2015-01-25 06:24:36','2015-01-25 06:24:36'),
	(95,'johnny','2015-01-25 06:24:36','2015-01-25 06:24:36'),
	(96,'express','2015-01-25 06:24:36','2015-01-25 06:24:36'),
	(97,'space','2015-01-25 06:24:36','2015-01-25 06:24:36'),
	(98,'astronaut','2015-01-25 06:24:36','2015-01-25 06:24:36'),
	(99,'crashes','2015-01-29 15:21:35','2015-01-29 15:21:35'),
	(100,'fails','2015-01-29 15:21:35','2015-01-29 15:21:35'),
	(101,'sports','2015-01-29 15:21:35','2015-01-29 15:21:35'),
	(102,'dogs','2015-01-29 15:48:07','2015-01-29 15:48:07'),
	(103,'pbs','2015-01-29 15:48:07','2015-01-29 15:48:07'),
	(104,'learn','2015-01-29 15:48:07','2015-01-29 15:48:07'),
	(105,'educational','2015-01-29 15:48:07','2015-01-29 15:48:07'),
	(106,'trailers','2015-01-29 16:07:19','2015-01-29 16:07:19'),
	(107,'jurassic world','2015-01-29 16:07:19','2015-01-29 16:07:19'),
	(108,'jurassic park','2015-01-29 16:07:19','2015-01-29 16:07:19'),
	(109,'steven spielberg','2015-01-29 16:07:19','2015-01-29 16:07:19'),
	(110,'biking','2015-01-30 16:30:59','2015-01-30 16:30:59'),
	(111,'woods','2015-01-30 16:30:59','2015-01-30 16:30:59'),
	(112,'mud','2015-01-30 16:30:59','2015-01-30 16:30:59'),
	(113,'bike','2015-01-30 16:30:59','2015-01-30 16:30:59'),
	(117,'supply','2015-02-15 06:59:44','2015-02-15 06:59:44'),
	(118,'demand','2015-02-15 06:59:44','2015-02-15 06:59:44'),
	(119,'theory','2015-02-15 06:59:44','2015-02-15 06:59:44'),
	(120,'marketing','2015-02-15 06:59:44','2015-02-15 06:59:44'),
	(121,'strategy','2015-02-15 06:59:44','2015-02-15 06:59:44'),
	(122,'football','2015-02-18 06:03:31','2015-02-18 06:03:31'),
	(123,'soccer','2015-02-18 06:03:31','2015-02-18 06:03:31'),
	(124,'hockey','2015-02-18 06:03:31','2015-02-18 06:03:31'),
	(125,'top 10','2015-02-18 06:03:31','2015-02-18 06:03:31'),
	(126,'sports center','2015-02-18 06:03:31','2015-02-18 06:03:31'),
	(127,'lines','2015-02-20 14:41:57','2015-02-20 14:41:57'),
	(128,'borders','2015-02-20 14:41:57','2015-02-20 14:41:57'),
	(129,'harvard sailing team','2015-02-20 15:00:35','2015-02-20 15:00:35'),
	(130,'harvard','2015-02-20 15:00:35','2015-02-20 15:00:35'),
	(131,'biggest loser','2015-02-20 15:00:35','2015-02-20 15:00:35'),
	(132,'how to','2015-02-21 02:39:42','2015-02-21 02:39:42'),
	(133,'surf','2015-02-21 02:39:42','2015-02-21 02:39:42'),
	(134,'dslr','2015-02-21 02:52:15','2015-02-21 02:52:15'),
	(135,'how-to','2015-02-21 02:52:15','2015-02-21 02:52:15'),
	(136,'learn about dslr','2015-02-21 02:52:15','2015-02-21 02:52:15'),
	(137,'cooking','2015-02-22 02:35:01','2015-02-22 02:35:01'),
	(138,'salmon','2015-02-22 02:35:01','2015-02-22 02:35:01'),
	(139,'food','2015-02-22 02:35:01','2015-02-22 02:35:01'),
	(140,'nutrition','2015-02-22 02:35:01','2015-02-22 02:35:01'),
	(141,'greens','2015-02-22 02:39:08','2015-02-22 02:39:08'),
	(142,'pancakes','2015-02-22 14:56:01','2015-02-22 14:56:01'),
	(143,'pancake day','2015-02-22 14:56:01','2015-02-22 14:56:01'),
	(144,'spiderman','2015-02-23 16:32:01','2015-02-23 16:32:01'),
	(145,'spider-man','2015-02-23 16:32:01','2015-02-23 16:32:01'),
	(146,'spider-man 2','2015-02-23 16:32:01','2015-02-23 16:32:01'),
	(147,'the amazing spider-man','2015-02-23 16:32:01','2015-02-23 16:32:01'),
	(148,'avengers','2015-02-23 16:50:43','2015-02-23 16:50:43'),
	(149,'marvel','2015-02-23 16:50:43','2015-02-23 16:50:43'),
	(150,'thor','2015-02-23 16:50:43','2015-02-23 16:50:43'),
	(151,'iron man','2015-02-23 16:50:43','2015-02-23 16:50:43'),
	(152,'the hulk','2015-02-23 16:50:43','2015-02-23 16:50:43'),
	(153,'captain america','2015-02-23 16:50:43','2015-02-23 16:50:43'),
	(154,'the avengers','2015-02-23 16:50:43','2015-02-23 16:50:43'),
	(155,'ninja turtles','2015-02-26 02:06:05','2015-02-26 02:06:05');

/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table theme_settings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `theme_settings`;

CREATE TABLE `theme_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `theme_slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table themes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `themes`;

CREATE TABLE `themes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `themes` WRITE;
/*!40000 ALTER TABLE `themes` DISABLE KEYS */;

INSERT INTO `themes` (`id`, `name`, `description`, `version`, `slug`, `active`, `created_at`, `updated_at`)
VALUES
	(1,'Default Theme','This is the default theme that comes packaged with HelloVideo','1.0','default',1,'2015-01-04 01:10:21','2015-01-04 01:10:21');

/*!40000 ALTER TABLE `themes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'default.jpg',
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'subscriber',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `activation_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `stripe_active` tinyint(4) NOT NULL DEFAULT '0',
  `stripe_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `stripe_subscription` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `stripe_plan` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_four` varchar(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  `subscription_ends_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique` (`username`),
  KEY `uniuqe_email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `username`, `email`, `avatar`, `password`, `role`, `active`, `created_at`, `updated_at`, `activation_code`, `remember_token`, `stripe_active`, `stripe_id`, `stripe_subscription`, `stripe_plan`, `last_four`, `trial_ends_at`, `subscription_ends_at`)
VALUES
	(1,'admin','admin@admin.com','default.jpg','$2y$08$g4myZ8.7hTXlGE6zG53qx.YBchpFxHwxQVs/jnS.UCQ2fa3IM7h8.','admin',1,'2014-08-26 23:43:33','2015-05-31 18:11:58',NULL,'YFQUREx0XbZKBYISjMnVsvVYfwcB4pXlAVs0RdtxvQwZ82hUBcVT4y8K5Uw8',1,NULL,NULL,NULL,NULL,NULL,NULL),
	(2,'demo','demo@demo.com','default.jpg','$2y$10$ltJIM5z0dHJalcAYIS5OduHzsmVEGO9rhaSStTu8fBdZPTw82BhVK','demo',1,'2014-12-21 19:26:04','2015-03-01 20:20:39',NULL,'LWDA7RwFkDqodPXC1VLsxR4rBP1PRfSC92HeqmQW5lWpxbSMsxl7Yyx0lk6J',0,NULL,NULL,NULL,NULL,NULL,NULL);

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table video_categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `video_categories`;

CREATE TABLE `video_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `video_categories` WRITE;
/*!40000 ALTER TABLE `video_categories` DISABLE KEYS */;

INSERT INTO `video_categories` (`id`, `parent_id`, `order`, `name`, `slug`, `created_at`, `updated_at`)
VALUES
	(11,NULL,1,'Animation','animation','2015-01-11 05:32:27','2015-02-04 14:47:23'),
	(13,NULL,3,'Sports','sports','2015-01-30 16:34:33','2015-02-04 14:47:23'),
	(14,19,10,'Trailers','trailers','2015-01-30 16:34:50','2015-02-04 14:47:23'),
	(15,NULL,4,'Comedy','comedy','2015-02-04 14:16:23','2015-02-20 14:37:54'),
	(17,23,6,'How-to & DIY','how-to-diy','2015-02-04 14:21:14','2015-02-05 13:52:31'),
	(18,NULL,8,'Tech','tech','2015-02-04 14:21:40','2015-02-04 14:47:23'),
	(19,NULL,9,'Movies','movies','2015-02-04 14:22:07','2015-02-04 14:47:23'),
	(20,NULL,11,'TV Shows','tv-shows','2015-02-04 14:22:15','2015-02-04 14:46:49'),
	(21,NULL,2,'Education','education','2015-02-04 14:23:03','2015-02-04 14:47:23'),
	(22,23,7,'Cooking & Health','cooking-and-health','2015-02-04 14:23:42','2015-02-04 14:47:23'),
	(23,NULL,5,'Lifestyle','lifestyle','2015-02-04 14:25:37','2015-02-05 13:52:31');

/*!40000 ALTER TABLE `video_categories` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table videos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `videos`;

CREATE TABLE `videos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `video_category_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `access` varchar(20) NOT NULL DEFAULT 'guest',
  `details` text NOT NULL,
  `description` text NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `duration` int(11) DEFAULT NULL,
  `views` int(11) NOT NULL DEFAULT '0',
  `image` varchar(255) DEFAULT NULL,
  `embed_code` text,
  `mp4_url` varchar(255) DEFAULT NULL,
  `webm_url` varchar(255) DEFAULT NULL,
  `ogg_url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `videos` WRITE;
/*!40000 ALTER TABLE `videos` DISABLE KEYS */;

INSERT INTO `videos` (`id`, `user_id`, `video_category_id`, `title`, `type`, `access`, `details`, `description`, `active`, `featured`, `duration`, `views`, `image`, `embed_code`, `mp4_url`, `webm_url`, `ogg_url`, `created_at`, `updated_at`)
VALUES
	(1,1,18,'4 Handy Tools to Make Gmail Better','embed','guest','<p>A video originally by Revision3 talking about 4 awesome tools and chrome extensions to make gmail better. Here are the tools below:</p>\r\n<ul>\r\n<li><a href=\"https://chrome.google.com/webstore/detail/sndlatr-beta-for-gmail/nfddgbpdnaeliohhkbdbcmenpnkepkgn\" target=\"_blank\">Sndlatr Beta</a></li>\r\n<li><a href=\"https://chrome.google.com/webstore/detail/right-inbox-for-gmail/mflnemhkomgploogccdmcloekbloobgb\" target=\"_blank\">Right Inbox</a></li>\r\n<li><a href=\"https://chrome.google.com/webstore/detail/streak-for-gmail/pnnfemgpilpdaojpnkjdgfgbnnjojfik\" target=\"_blank\">Streak</a></li>\r\n<li><a href=\"https://chrome.google.com/webstore/detail/send-from-gmail-by-google/pgphcomnlaojlmmcjmiddhdapjpbgeoc\" target=\"_blank\">Send From Gmail</a></li>\r\n</ul>\r\n<p>View the original source here:&nbsp;<a href=\"https://revision3.com/tekzillabites/4-handy-tools-to-make-gmail-better/\" target=\"_blank\">https://revision3.com/tekzillabites/4-handy-tools-to-make-gmail-better/</a></p>','Checkout this short video talking about some Chrome extensions to make Gmail better.',1,0,200,0,'October2014/4-handy-tools-to-make-gmail-better.jpg','<iframe src=\"https://embed.revision3.com/player/embed?videoId=35835&external=true&width=640&height=360\" width=\"640\" height=\"360\" allowFullScreen webkitallowfullscreen mozallowfullscreen oallowfullscreen msallowfullscreen></iframe>','','','','2014-10-03 03:02:12','2015-02-04 14:40:04'),
	(2,1,0,'History of TMNT!','embed','subscriber','<p>You remember that beloved show Teenage Mutant Ninja Turtles. In this video you will get a brief run down of the history of Teenage Mutant Ninja Turtles. The Teenage Mutant Ninja Turtles originated from a Comic Book back in 1984. This beloved comic book then evolved into the loved cartoon show that many people still remember. The famous cartoon show began in 1986 and lasted for 10 years. Since then there have been many remakes of the Teenage Mutant Ninja Turtles that still air on TV today.</p>\r\n<p>Learn More about the Ninja Turtles on their <a href=\"http://en.wikipedia.org/wiki/Teenage_Mutant_Ninja_Turtles\" target=\"_blank\">Wikipedia Page</a>.</p>\r\n<p><a href=\"http://revision3.com/variant/history-of-tmnt/\" target=\"_blank\">View the original source of this video here.</a></p>','Today Arris tells you all you need to know about the Teenage Mutant Ninja Turtles!',1,0,0,0,'October2014/history-of-tmnt.jpg','<iframe src=\"http://embed.revision3.com/player/embed?videoId=37113&external=true&width=640&height=360\" width=\"640\" height=\"360\" allowFullScreen webkitallowfullscreen mozallowfullscreen oallowfullscreen msallowfullscreen></iframe>','','','','2014-10-04 16:31:57','2015-02-28 15:26:59'),
	(9,1,18,'Getting Started With The HackRF','embed','guest','<p>Shannon starts up the HackRF to show some of it\'s capabilities. Follow along and learn about this new software defined radio peripheral capable of transmission or reception of radio signals!</p>\r\n<p>&nbsp;</p>\r\n<p><strong>HackRF - Getting Started and 2 Radio Frequencies at Once</strong>&nbsp;Pentoo, a Linux distribution with full support for HackRF and GNU Radio. Download the latest Pentoo .iso image from one of the mirrors listed at<a class=\"autolink\" href=\"http://pentoo.ch/download/\">http://pentoo.ch/download/</a>. Then burn the .iso to a DVD or use UNetbootin to install the .iso on a USB flash drive. Boot your computer using the DVD or USB flash drive to run Pentoo. Once Pentoo is running, type startx at the command line to launch the desktop environment. Accept the \"default config\" in the first dialog box and then launch a Terminal Emulator window using the icon at the bottom of the screen. At the time of writing, the current Pentoo .iso (2014.0-RC3) has a minor bug that you need to work around by typing \"eselect lapack set 1\" at the command line in the terminal window before trying to use GNU Radio. You only need to do this once after starting up Pentoo, but you\'ll have to do it every time you boot an unmodified .iso. To verify that your HackRF is detected, type \"hackrf_info\" at the command line. It should produce a few lines of output including \"Found HackRF board.\" The 3V3, 1V8, RF, and USB LEDs should all be illuminated and are various colors. Now you can use programs such as gnuradio-companion or gqrx to start experimenting with your HackRF. Open GNu-radio companion via terminal and open the first HackRF map file.</p>','Shannon starts up the HackRF to show some of it\'s capabilities. Follow along and learn about this new software defined radio peripheral capable of transmission or reception of radio signals!',1,0,0,0,'October2014/getting-started-with-the-hackrf.jpg','<iframe src=\"http://embed.revision3.com/player/embed?videoId=40322&external=true&width=640&height=360\" width=\"640\" height=\"360\" allowFullScreen webkitallowfullscreen mozallowfullscreen oallowfullscreen msallowfullscreen></iframe>','','','','2014-10-08 02:07:13','2015-02-04 14:39:19'),
	(11,1,18,'Top 5 Super Smash Bros 3DS Glitches!','embed','guest','<p><strong>Reina runs down the top 5 glitches for Super Smash Bros 3DS!</strong></p>\r\n<p>Super Smash Bros. 3DS is not without it\'s flaws. Reina Scully breaks down the top five glitches of the 3DS\'s featured fighter.</p>','Reina runs down the top 5 glitches for Super Smash Bros 3DS!',1,0,170,0,'October2014/top-5-super-smash-bros-glitches.jpg','<iframe src=\"http://embed.revision3.com/player/embed?videoId=48086&external=true&width=640&height=360\" width=\"640\" height=\"360\" allowFullScreen webkitallowfullscreen mozallowfullscreen oallowfullscreen msallowfullscreen></iframe>','','','','2014-10-10 18:57:51','2015-02-04 14:39:09'),
	(12,1,18,'Going Retro with the RetroN 5!','embed','subscriber','<h3>The Sourcefed office plays its favorite classic games with the RetroN5.</h3>\r\n<p>The RetroN 5 is a revolutionary new way to play all of your old cartridges for Nintendo, Super Nintendo, Sega Genesis, Game Boy, and Game Boy Advance. It even has a built in Game Genie, so you can cheat as much as you want! Just plug it into your television and play the classics in HD!<br /><br /></p>\r\n<h3>More About the RetroN 5!</h3>\r\n<p>Check out RetroN\'s website:&nbsp;<a href=\"http://www.retron5.com/\" target=\"_blank\"><strong>retron5.com</strong></a></p>','The Sourcefed office plays it\'s favorite classic games with the RetroN5.',1,0,465,0,'October2014/going-retro-with-the-retron-5.jpg','<iframe src=\"http://embed.revision3.com/player/embed?videoId=48225&external=true&width=640&height=360\" width=\"640\" height=\"360\" allowFullScreen webkitallowfullscreen mozallowfullscreen oallowfullscreen msallowfullscreen></iframe>','','','','2014-10-10 19:09:30','2015-02-28 15:29:05'),
	(13,1,18,'What Most Schools Don\'t Teach','embed','guest','<p>Knowing how to code is like knowing how to read and write was in medival times. You can certainly get along without it, but you do so by living in ignorance of many of the wonders around you.&nbsp;<br /><br />Learn about a new \"superpower\" that isn\'t being taught in in 90% of US schools.<br /><br />Starring Bill Gates, Mark Zuckerberg, will.i.am, Chris Bosh, Jack Dorsey, Tony Hsieh, Drew Houston, Gabe Newell, Ruchi Sanghvi, Elena Silenok, Vanessa Hurst, and Hadi Partovi. Directed by Lesley Chilcott.</p>','Knowing how to code is like knowing how to read and write was in medival times. You can certainly get along without it, but you do so by living in ignorance of many of the wonders around you. ',1,0,343,1,'October2014/what-most-schools-dont-teach-you.jpg','<iframe width=\"640\" height=\"360\" src=\"//www.youtube.com/embed/Q0z-C8Ke2FQ\" frameborder=\"0\" allowfullscreen></iframe>','','','','2014-10-10 19:26:43','2015-02-04 14:38:44'),
	(14,1,20,'Tonight Show with Jimmy Fallon','embed','guest','<p><em><strong>The Tonight Show Starring Jimmy Fallon</strong></em>&nbsp;is an American&nbsp;late-night&nbsp;talk show&nbsp;hosted by&nbsp;Jimmy&nbsp;Fallon on NBC. The show premiered on February 17, 2014 and is produced by Broadway Video and Universal Television. It is the seventh incarnation of NBC\'s long-running Tonight Show franchise, with Fallon serving as the sixth host. The show also stars sidekick and announcer Steve Higgins and house band The Roots.The Tonight Show is produced by former Daily Show executive producer Josh Lieb and executive produced by Lorne Michaels. The show records from Studio 6B in Rockefeller Center, New York City.</p>\r\n<p>The program airs weeknights at 11:34 p.m. ET/PT. The show opens with Fallon\'s topical monologue, then transitions into comedic sketches/games, concluding with a guest interview and musical performance. The show\'s debut episode attracted positive reviews from professional television critics, and received 11.3 million viewers in the United States.</p>\r\n<p>Check out more of Jimmy Fallon on his Youtube channel at:&nbsp;<a href=\"https://www.youtube.com/user/latenight\" target=\"_blank\">https://www.youtube.com/user/latenight</a></p>','The Tonight Show Starring Jimmy Fallon is an American late-night talk show hosted by Jimmy Fallon on NBC.',1,0,55,2,'October2014/tonight-show-with-jimmy-fallon.jpg','<iframe width=\"640\" height=\"360\" src=\"//www.youtube.com/embed/UnAUk2Gb2dI\" frameborder=\"0\" allowfullscreen></iframe>','','','','2014-10-10 20:15:05','2015-02-25 05:29:32'),
	(15,1,0,'Introducing Carrot','embed','subscriber','<h2 class=\"text-align-center\"><strong>EASY TO USE. EASIER TO LOVE.</strong></h2>\r\n<p id=\"yui_3_17_2_1_1412972453252_476\">You shouldn&rsquo;t have to fumble around with juicers or peelers to get a great vegetable experience. With Carrot, simply lift and chew. That&rsquo;s it. Carrot works with your body to do all the hard stuff, so you can get back to doing what you love.</p>\r\n<p>&nbsp;</p>\r\n<p><img src=\"/content/uploads//images/October2014/introducing-carrot-1.png\" alt=\"Introducing Carrot\" width=\"500\" height=\"281\" /></p>\r\n<p>&nbsp;</p>\r\n<h2 class=\"text-align-center\"><strong>ROOTED IN DESIGN.</strong></h2>\r\n<p>From the moment you pick up your Carrot, you&rsquo;ll notice the care and attention that went into every detail. The unique texture, the striking colors and the pleasing crunch provide a world class experience for each of your senses.&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<h2 class=\"text-align-center\"><strong>THE EASY WAY. YOUR WAY.</strong></h2>\r\n<p>You\'re unique. Your Carrot should be too. Carrot can be prepared in an unlimited number of ways. Carrot can be boiled, cooked, or even baked into a cake. You can even hold Carrot in your mouth and pretend it&rsquo;s a long cigar. Carrot is made for anything, leaving you ready to take on everything.</p>\r\n<p>&nbsp;</p>\r\n<h2 class=\"text-align-center\"><strong>ANTIOXIDANT. PRO HEALTH.</strong></h2>\r\n<p>Carrot doesn&rsquo;t just taste great. Carrot also provides an array of powerful nutrients, including Beta Carotene, Vitamin A, and Vitamin K. Carrot has even been shown to reduce the risk of colon cancer.* With Carrot, you won&rsquo;t just be feeling&nbsp;great. You&rsquo;ll be feeling your best.</p>','Carrot is designed with you in mind. It\'s a seamless experience, meticulously crafted, from beginning to end. It\'s not just a vegetable, it\'s what a vegetable should be.',1,0,75,1,'October2014/introducing-carrot.jpg','<iframe src=\"//player.vimeo.com/video/108138933\" width=\"500\" height=\"281\" frameborder=\"0\" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>','','','','2014-10-10 20:25:33','2015-02-28 15:26:44'),
	(16,1,0,'NORWAY - A Time-Lapse Adventure','embed','subscriber','<h1>Awesome Time-Lapse</h1>\r\n<p>This is a time-lapse video resulting from a 15,000 km (almost 10,000 miles) long road trip and tens of thousands of images taken along the way over the last 5 months. The journey has covered all of Norway&rsquo;s 19 counties, from the far south to the Russian border in the Northeast.</p>\r\n<p>The aim of this 5 minute short film is to show the variety of Norway, everything from the deep fjords in the Southwest, to the moon landscape in the North, the Aurora Borealis (Nothern Lights) and the settlements and cities around the country, both in summer and wintertime. The video shows some of the most scenic places in Norway, such as Lofoten, Senja, Helgelandskysten, Geirangerfjorden, N&aelig;r&oslash;yfjorden and Preikestolen.</p>\r\n<p>If you are interested in reading the tales, seeing behind-the-scenes photos from the journey and a map of the route driven, head over to rustadmedia.com</p>\r\n<p>The soundtrack is custom-made for this film by the very talented fellow Norwegian Jogeir Daae M&aelig;land.<br />You can buy the song on iTunes:&nbsp;<a href=\"http://bit.ly/1pCQSLd\" target=\"_blank\" rel=\"nofollow\">bit.ly/1pCQSLd</a><br />Listen to more of his music here:&nbsp;<a href=\"https://soundcloud.com/j-daae-maeland\" target=\"_blank\" rel=\"nofollow\">soundcloud.com/j-daae-maeland</a></p>\r\n<p>All the locations in the video are to be found at&nbsp;<a href=\"http://www.rustadmedia.com/locations\" target=\"_blank\" rel=\"nofollow\">rustadmedia.com/locations</a><br />The gear used is listed on the front page of rustadmedia.com<br />The project is supported with gear from Syrp&nbsp;<a href=\"http://www.syrp.co.nz/\" target=\"_blank\" rel=\"nofollow\">syrp.co.nz</a></p>','Short 5-minute time-lapse film in Norway. Breathtaking scenery in this awesome video.',1,0,333,2,'October2014/norway-timelapse.jpg','<iframe src=\"//player.vimeo.com/video/107469289\" width=\"500\" height=\"281\" frameborder=\"0\" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>','','','','2014-10-10 20:37:54','2015-02-28 15:28:55'),
	(17,1,18,'Best Android Tablets 2014','embed','guest','<p>In this quick video you can learn find out about the best Android Tablets of 2014. Get an in-depth review of the top tablets to find out which tablet fits you best. You can checkout the original source from the Revision3 article here:&nbsp;http://revision3.com/androidauthority/best-android-tablets-2014/</p>','Check out the Best Android Tablets of 2014!  Find out the tablet that fits you best.',1,0,476,0,'December2014/best-android-tables-2014.jpg','<iframe src=\"http://embed.revision3.com/player/embed?videoId=58793&external=true&width=640&height=360\" width=\"640\" height=\"360\" allowFullScreen webkitallowfullscreen mozallowfullscreen oallowfullscreen msallowfullscreen></iframe>','','','','2014-12-26 15:53:47','2015-02-04 14:38:15'),
	(18,1,18,'Foundation with Tim Ferris','embed','subscriber','<p>In this episode 15 of Foundation Kevin interviews one of his friends and well-known author&nbsp;Tim Ferris. Checkout more foundation videos from Foundations website at http://foundation.bz</p>','Kevin interviews one of his friends and well-known author Tim Ferris. Checkout this interview to learn more about Tim Ferris and how he became who he is today.',1,0,3250,0,'December2014/foundation-with-tim-ferris.jpg','<iframe width=\"560\" height=\"315\" src=\"//www.youtube.com/embed/ccFYnEGWoOc\" frameborder=\"0\" allowfullscreen></iframe>','','','','2014-12-27 03:06:32','2015-02-28 15:26:30'),
	(19,1,18,'The Treehouse Show - Episode 88','embed','guest','<p>In this episode of The Treehouse Show, Nick Pettit (@nickrp) and Jason Seifer (@jseifer) talk about the latest in web design, web development, HTML5, front end development and more. In episode 88 you will learn about Gulp JS, Sketch 3, Bud, and much more.</p>\r\n<p>Here are the links for the week:<br /><br />gulp.js - the streaming build system<br /><a class=\"yt-uix-redirect-link\" dir=\"ltr\" title=\"http://gulpjs.com/\" href=\"http://gulpjs.com/\" target=\"_blank\" rel=\"nofollow\">http://gulpjs.com/</a><br /><br />What is new in Sketch 3&nbsp; &mdash; Medium<br /><a class=\"yt-uix-redirect-link\" dir=\"ltr\" title=\"http://medium.com/p/4b92d8b25f3\" href=\"http://medium.com/p/4b92d8b25f3\" target=\"_blank\" rel=\"nofollow\">http://medium.com/p/4b92d8b25f3</a><br /><br />azer/bud<br /><a class=\"yt-uix-redirect-link\" dir=\"ltr\" title=\"http://github.com/azer/bud\" href=\"http://github.com/azer/bud\" target=\"_blank\" rel=\"nofollow\">http://github.com/azer/bud</a><br /><br />qrohlf/trianglify<br /><a class=\"yt-uix-redirect-link\" dir=\"ltr\" title=\"http://github.com/qrohlf/trianglify\" href=\"http://github.com/qrohlf/trianglify\" target=\"_blank\" rel=\"nofollow\">http://github.com/qrohlf/trianglify</a><br /><br />sindresorhus/multiline<br /><a class=\"yt-uix-redirect-link\" dir=\"ltr\" title=\"http://github.com/sindresorhus/multiline\" href=\"http://github.com/sindresorhus/multiline\" target=\"_blank\" rel=\"nofollow\">http://github.com/sindresorhus/multiline</a><br /><br />How to Use steps() in CSS Animations - Designmodo<br /><a class=\"yt-uix-redirect-link\" dir=\"ltr\" title=\"http://designmodo.com/steps-css-animations/\" href=\"http://designmodo.com/steps-css-animations/\" target=\"_blank\" rel=\"nofollow\">http://designmodo.com/steps-css-anima...</a><br /><br />PACE &mdash; Automatic page load progress bars<br /><a class=\"yt-uix-redirect-link\" dir=\"ltr\" title=\"http://github.hubspot.com/pace/docs/welcome/\" href=\"http://github.hubspot.com/pace/docs/welcome/\" target=\"_blank\" rel=\"nofollow\">http://github.hubspot.com/pace/docs/w...</a><br /><br />Pesticide - Kill Your Css Layout Bugs<br /><a class=\"yt-uix-redirect-link\" dir=\"ltr\" title=\"http://pesticide.io/\" href=\"http://pesticide.io/\" target=\"_blank\" rel=\"nofollow\">http://pesticide.io/</a></p>','In this episode of The Treehouse Show, Nick Pettit (@nickrp) and Jason Seifer (@jseifer) talk about the latest in web design, web development, HTML5, front end development and more.',1,0,909,0,'December2014/treehouse-show.jpg','<iframe width=\"560\" height=\"315\" src=\"//www.youtube.com/embed/82urkb3mJaQ?list=PLFDA5B0CD72326128\" frameborder=\"0\" allowfullscreen></iframe>','','','','2015-02-23 16:04:01','2015-02-28 15:22:23'),
	(20,1,11,'Alma','embed','guest','<p>On a snowy day in Barcelona, a girl named Alma is wandering a street. Encountering a chalkboard inscribed with the countless given names of various children, she includes her own name. Before continuing her stroll, where she is suddenly captivated by a toy store overflowing with dolls across from the chalkboard. Taking notice of a doll physically identical to her through a window that resembles the mouth of a monster, she tries to enter the vacant, deserted, silent shop to retrieve the toy for herself. But the front door is locked. After giving up trying to open it, Alma begins to walk away, only for the door to mysteriously open. She returns and enters the store.</p>\r\n<p><img style=\"float: right; margin-left: 20px;\" title=\"Alma\" src=\"/content/uploads/images/January2015/FILE-20150103-16126JMX6QC73F42.jpg\" alt=\"\" width=\"500\" height=\"251\" />Alma tries to retrieve the doll but nearly steps on a small toy boy riding a bike who tries to escape but the door closes in front of him. As Alma starts to climb a shelf the doll somehow moved to, the eyes of the other children dolls suddenly start moving and watching her. While trying to snatch it off of the shelf, the moment she touches it a fast sequence of various brief, quick clips of petrifying footage flashes across the screen before suddenly taking focus on the entire shop from Alma\'s perspective on the shelf-top.</p>\r\n<p>Afterwards, it is revealed that Alma\'s inner consciousness has somehow been withdrawn from her body into that of the doll resembling her. As all of the other dolls sitting atop the shelf suddenly roll their eyes, focusing on her (in revelation of the dark, true intentions of that particular store), a different doll is raised to the shop window bearing resemblance to another child, implying that the cycle will continue on another victim.</p>','Alma is a short film produced by ex-Pixar animator Rodrigo Blaas. It was received notable recognition at the Fantastic Fest awards.',1,1,329,1683,'December2014/alma-short-film.jpg','<iframe src=\"//player.vimeo.com/video/4749536\" width=\"500\" height=\"281\" frameborder=\"0\" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>','','','','2015-02-23 16:22:01','2015-05-31 18:17:50'),
	(22,1,18,'AE Tuts Logo Reveal','embed','guest','<p>This is a quick AE Tuts logo reveal created in After Effects. Using After Effects you can use a ton of presets and effects to make the logo reveal that fits you best.</p>','This is a quick AE Tuts logo reveal created in After Effects. Using After Effects you can use a ton of presets and effects to make the logo reveal that fits you best.',1,0,9,0,'December2014/ae-tuts.jpg','<iframe width=\"560\" height=\"315\" src=\"//www.youtube.com/embed/nYzoQVea1NI\" frameborder=\"0\" allowfullscreen></iframe>','','','','2014-12-27 18:55:31','2015-02-04 14:37:14'),
	(23,1,0,'The Coast','embed','guest','<p class=\"first\">Borderlands. The bridge between two worlds. Where the known meets mystery. Powerful, unforgiving&ndash;and exactly what Hayden Peters was looking for.</p>\r\n<p>Trading the city for the daily sting of salt water on his skin, Hayden reveals how life on the coast brings him balance like no other place on earth could.</p>\r\n<p>From&nbsp;<a href=\"http://www.wazeemotionpictures.com/\" target=\"_blank\" rel=\"nofollow\">wazeemotionpictures.com</a>, makers of the award-winning films Of Souls + Water, Dream and Nobody\'s River.<br />Presented By NRS&nbsp;<a href=\"http://www.nrs.com/\" target=\"_blank\" rel=\"nofollow\">nrs.com</a><br />Directed by Skip Armstrong</p>\r\n<p>Music by Ben Lukas Boysen<br /><a href=\"https://itunes.apple.com/us/album/gravity/id659491608\" target=\"_blank\" rel=\"nofollow\">itunes.apple.com/us/album/gravity/id659491608</a></p>\r\n<p>Inquiries<br />Skip Armstrong - skip@wazeemotionpictures.com</p>','Borderlands. The bridge between two worlds. Where the known meets mystery. Powerful, unforgiving–and exactly what Hayden Peters was looking for.',1,0,403,4,'January2015/the-coast-video.jpg','<iframe src=\"//player.vimeo.com/video/115014610\" width=\"500\" height=\"281\" frameborder=\"0\" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>','','','','2015-02-23 16:05:01','2015-02-28 15:21:55'),
	(24,1,11,'Hug It Out','embed','subscriber','<p class=\"first\">More at&nbsp;<a href=\"http://alepixel.tv/\" target=\"_blank\" rel=\"nofollow\">alepixel.tv</a>&nbsp;&amp;&nbsp;<a href=\"https://www.behance.net/gallery/21854313/Hug-it-Out\" target=\"_blank\" rel=\"nofollow\">behance.net/gallery/21854313/Hug-it-Out</a></p>\r\n<p>Our good friends at Demo Duck (<a href=\"http://vimeo.com/demoduck\">vimeo.com/demoduck</a>) asked us to make a video about the health benefits of hugging. So we proposed writing a catchy song and telling the story through a set of fun characters: a depressed clown, a stressed out worker, and a very distracted teen.</p>\r\n<p>We all collaborated on the lyrics, lead by Justin from Diamond Youth who did all the music and singing. Then for character design and illustration we had the pleasure to collaborate with the great Ana Sanfelippo and Eugenia Mello who did an awesome job. Finally we had a crazy but fun ride rigging and animating all of the very different 14 characters to fully bring them to life.<br />It was an ideal project and we all had a lot of fun making it happen. So share it and spread the word if you like it! :)</p>','A catchy song telling the story through a set of fun characters: a depressed clown, a stressed out worker, and a very distracted teen.',1,0,92,4,'January2015/hug-it-out.jpg','<iframe src=\"//player.vimeo.com/video/113336111?color=3be6c3\" width=\"500\" height=\"281\" frameborder=\"0\" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>','','','','2015-02-23 16:08:01','2015-02-28 15:21:11'),
	(25,1,20,'Nick Offerman Reads \'Twas the Night Before Christmas','embed','guest','<p>Jimmy runs out of time to read \'Twas the Night Before Christmas, so Nick Offerman tells a shortened, more casual rendition.<br /><br />Subscribe NOW to The Tonight Show Starring Jimmy Fallon:&nbsp;<a class=\"yt-uix-redirect-link\" dir=\"ltr\" title=\"http://bit.ly/1nwT1aN\" href=\"http://bit.ly/1nwT1aN\" target=\"_blank\" rel=\"nofollow\">http://bit.ly/1nwT1aN</a><br /><br />Watch The Tonight Show Starring Jimmy Fallon Weeknights&nbsp;<a href=\"https://www.youtube.com/watch?v=i8KF6-VuIQk\">11:35</a>/10:35c<br />Get more Jimmy Fallon:&nbsp;<br />Follow Jimmy:&nbsp;<a class=\"yt-uix-redirect-link\" dir=\"ltr\" title=\"http://Twitter.com/JimmyFallon\" href=\"http://twitter.com/JimmyFallon\" target=\"_blank\" rel=\"nofollow\">http://Twitter.com/JimmyFallon</a><br />Like Jimmy:&nbsp;<a class=\"yt-uix-redirect-link\" dir=\"ltr\" title=\"https://Facebook.com/JimmyFallon\" href=\"https://facebook.com/JimmyFallon\" target=\"_blank\" rel=\"nofollow\">https://Facebook.com/JimmyFallon</a><br /><br />Get more The Tonight Show Starring Jimmy Fallon:&nbsp;<br />Follow The Tonight Show:&nbsp;<a class=\"yt-uix-redirect-link\" dir=\"ltr\" title=\"http://Twitter.com/FallonTonight\" href=\"http://twitter.com/FallonTonight\" target=\"_blank\" rel=\"nofollow\">http://Twitter.com/FallonTonight</a><br />Like The Tonight Show:&nbsp;<a class=\"yt-uix-redirect-link\" dir=\"ltr\" title=\"https://Facebook.com/FallonTonight\" href=\"https://facebook.com/FallonTonight\" target=\"_blank\" rel=\"nofollow\">https://Facebook.com/FallonTonight</a><br />The Tonight Show Tumblr:&nbsp;<a class=\"yt-uix-redirect-link\" dir=\"ltr\" title=\"http://fallontonight.tumblr.com/\" href=\"http://fallontonight.tumblr.com/\" target=\"_blank\" rel=\"nofollow\">http://fallontonight.tumblr.com/</a><br /><br />Get more NBC:&nbsp;<br />NBC YouTube:&nbsp;<a class=\"yt-uix-redirect-link\" dir=\"ltr\" title=\"http://bit.ly/1dM1qBH\" href=\"http://bit.ly/1dM1qBH\" target=\"_blank\" rel=\"nofollow\">http://bit.ly/1dM1qBH</a><br />Like NBC:&nbsp;<a class=\"yt-uix-redirect-link\" dir=\"ltr\" title=\"http://Facebook.com/NBC\" href=\"http://facebook.com/NBC\" target=\"_blank\" rel=\"nofollow\">http://Facebook.com/NBC</a><br />Follow NBC:&nbsp;<a class=\"yt-uix-redirect-link\" dir=\"ltr\" title=\"http://Twitter.com/NBC\" href=\"http://twitter.com/NBC\" target=\"_blank\" rel=\"nofollow\">http://Twitter.com/NBC</a><br />NBC Tumblr:&nbsp;<a class=\"yt-uix-redirect-link\" dir=\"ltr\" title=\"http://nbctv.tumblr.com/\" href=\"http://nbctv.tumblr.com/\" target=\"_blank\" rel=\"nofollow\">http://nbctv.tumblr.com/</a><br />NBC Google+:&nbsp;<a class=\"yt-uix-redirect-link\" dir=\"ltr\" title=\"https://plus.google.com/+NBC/posts\" href=\"https://plus.google.com/+NBC/posts\" target=\"_blank\" rel=\"nofollow\">https://plus.google.com/+NBC/posts</a><br /><br />The Tonight Show Starring Jimmy Fallon features hilarious highlights from the show including: comedy sketches, music parodies, celebrity interviews, ridiculous games, and, of course, Jimmy\'s Thank You Notes and hashtags! You\'ll also find behind the scenes videos and other great web exclusives.<br /><br />Nick Offerman Reads \'Twas the Night Before Christmas<br /><a class=\"yt-uix-redirect-link\" dir=\"ltr\" title=\"http://www.youtube.com/fallontonight\" href=\"http://www.youtube.com/fallontonight\" target=\"_blank\" rel=\"nofollow\">http://www.youtube.com/fallontonight</a></p>','Jimmy runs out of time to read \'Twas the Night Before Christmas, so Nick Offerman tells a shortened, more casual rendition.',1,0,83,1,'January2015/nick-offerman.jpg','<iframe width=\"560\" height=\"315\" src=\"//www.youtube.com/embed/i8KF6-VuIQk\" frameborder=\"0\" allowfullscreen></iframe>','','','','2014-10-01 03:02:12','2015-02-28 15:23:55'),
	(26,1,11,'Inside Out Trailer','embed','guest','<p>From Pixar Animation Studios, &ldquo;Inside Out&rdquo; opens in UK cinemas on July 24, 2015.<br /><br />From an adventurous balloon ride above the clouds to a monster-filled metropolis, Academy Award&reg;-winning director Pete Docter (&ldquo;Monsters, Inc.,&rdquo; &ldquo;Up&rdquo;) has taken audiences to unique and imaginative places. In Disney&bull;Pixar&rsquo;s original movie &ldquo; Inside Out,&rdquo; he will take us to the most extraordinary location of all&mdash;inside the mind.&nbsp;<br /><br />Growing up can be a bumpy road, and it\'s no exception for Riley, who is uprooted from her Midwest life when her father starts a new job in San Francisco. Like all of us, Riley is guided by her emotions &ndash; Joy (Amy Poehler), Fear (Bill Hader), Anger (Lewis Black), Disgust (Mindy Kaling) and Sadness (Phyllis Smith). The emotions live in Headquarters, the control center inside Riley&rsquo;s mind, where they help advise her through everyday life. As Riley and her emotions struggle to adjust to a new life in San Francisco, turmoil ensues in Headquarters. Although Joy, Riley\'s main and most important emotion, tries to keep things positive, the emotions conflict on how best to navigate a new city, house and school.</p>\r\n<p>Checkout the original trailer below:</p>\r\n<p>&nbsp;</p>\r\n<p><iframe style=\"float: left; margin-right: 10px;\" src=\"//www.youtube.com/embed/MIGECPlJPqg\" width=\"560\" height=\"315\" frameborder=\"0\" allowfullscreen=\"\"></iframe></p>','Growing up can be a bumpy road, and it\'s no exception for Riley, who is uprooted from her Midwest life when her father starts a new job in San Francisco...',1,0,130,0,'January2015/inside-out.jpg','<iframe width=\"560\" height=\"315\" src=\"//www.youtube.com/embed/_MC3XuMvsDI\" frameborder=\"0\" allowfullscreen></iframe>','','','','2015-02-23 16:10:01','2015-02-28 15:20:27'),
	(27,1,11,'Minions Movie','embed','subscriber','<p>Gru is recruited by an organization to stop Scarlet Overkill, a super-villain who, alongside her inventor husband Herb, hatches a plot to take over the world.<br /><br />The Movieclips Trailers channel is your destination for the hottest new trailers the second they drop. Whether it\'s the latest studio release, an indie horror flick, an evocative documentary, or that new RomCom you\'ve been waiting for, the Movieclips team is here day and night to make sure all the best new movie trailers are here for you the moment they\'re released.<br /><br />In addition to being the #1 Movie Trailers Channel on YouTube, we deliver amazing and engaging original videos each week. Watch our exclusive Ultimate Trailers, Showdowns, Instant Trailer Reviews, Monthly MashUps, Movie News, and so much more to keep you in the know.</p>','Gru is recruited by an organization to stop Scarlet Overkill, a super-villain who, alongside her inventor husband Herb, hatches a plot to take over the world.',1,0,167,7,'January2015/minions.jpg','<iframe width=\"560\" height=\"315\" src=\"//www.youtube.com/embed/eisKxhjBnZ0\" frameborder=\"0\" allowfullscreen></iframe>','','','','2015-02-23 16:07:01','2015-03-04 01:04:04'),
	(28,1,11,'Big Buck Bunny','file','guest','<p><img style=\"margin-right: 15px; float: left;\" title=\"Big Buck Bunny\" src=\"/content/uploads/images/January2015/FILE-20150122-06546DBSQ4HQT5HR.jpg\" alt=\"\" width=\"150\" height=\"auto\" />The plot follows a day of the life of Big Buck Bunny when he meets three bullying rodents, Frank (the leader of the rodents), Rinky and Gamera. The rodents amuse themselves by harassing helpless creatures of the forest by throwing fruits, nuts and rocks at them.</p>\r\n<p>After the deaths of two of Bunny\'s favorite butterflies and an offensive attack on Bunny himself, Bunny sets aside his gentle nature and orchestrates a complex plan to avenge the two butterflies.</p>\r\n<p>Checkout the original page here:&nbsp;<a href=\"https://peach.blender.org/\">https://peach.blender.org/</a></p>\r\n<p>And find out more on their IMDB page here:&nbsp;<a href=\"http://www.imdb.com/title/tt1254207/\">http://www.imdb.com/title/tt1254207/</a></p>\r\n<p>&nbsp;</p>','Big Buck Bunny (code-named Peach) is a short computer-animated comedy film by the Blender Institute, part of the Blender Foundation. Like the foundation\'s previous film Elephants Dream, the film was made using Blender, a free software application for animation made by the same foundation.',1,0,33,7,'January2015/big-buck-bunny.jpg','','https://s3.amazonaws.com/hellovideo/demo-site/videos/big-buck-bunny.mp4','https://s3.amazonaws.com/hellovideo/demo-site/videos/big-buck-bunny.webm','https://s3.amazonaws.com/hellovideo/demo-site/videos/big-buck-bunny.ogv','2015-02-23 16:24:01','2015-02-28 15:19:10'),
	(29,1,14,'The Hobbit: The Battle of the Five Armies','file','guest','<p>From Academy Award&reg;-winning filmmaker Peter Jackson comes \"The Hobbit: The Battle of the Five Armies,\" the third in a trilogy of films adapting the enduringly popular masterpiece The Hobbit, by J.R.R. Tolkien.&nbsp;<br /><br />\"The Hobbit: The Battle of the Five Armies\" brings to an epic conclusion the adventures of Bilbo Baggins, Thorin Oakenshield and the Company of Dwarves. Having reclaimed their homeland from the Dragon Smaug, the Company has unwittingly unleashed a deadly force into the world. Enraged, Smaug rains his fiery wrath down upon the defenseless men, women and children of Lake-town.&nbsp;<br /><br />Obsessed above all else with his reclaimed treasure, Thorin sacrifices friendship and honor to hoard it as Bilbo&rsquo;s frantic attempts to make him see reason drive the Hobbit towards a desperate and dangerous choice. But there are even greater dangers ahead. Unseen by any but the Wizard Gandalf, the great enemy Sauron has sent forth legions of Orcs in a stealth attack upon the Lonely Mountain.&nbsp;<br /><br />As darkness converges on their escalating conflict, the races of Dwarves, Elves and Men must decide &ndash; unite or be destroyed. Bilbo finds himself fighting for his life and the lives of his friends in the epic Battle of the Five Armies, as the future of Middle-earth hangs in the balance.</p>\r\n<p>Be sure to checkout more at:&nbsp;<a class=\"yt-uix-redirect-link\" dir=\"ltr\" title=\"https://www.facebook.com/TheHobbitMovie\" href=\"https://www.facebook.com/TheHobbitMovie\" target=\"_blank\" rel=\"nofollow\">https://www.facebook.com/TheHobbitMovie</a></p>','“The Hobbit: The Battle of the Five Armies” brings to an epic conclusion the adventures of Bilbo Baggins, Thorin Oakenshield and the Company of Dwarves. Having reclaimed their homeland from the Dragon Smaug, the Company has unwittingly unleashed a deadly force into the world. Enraged, Smaug rains his fiery wrath down upon the defenseless men, women and children of Lake-town. ',1,1,123,9,'February2015/the-hobbit.jpg','','https://s3.amazonaws.com/hellovideo/demo-site/videos/the-hobbit.mp4','https://s3.amazonaws.com/hellovideo/demo-site/videos/the-hobbit.webm','https://s3.amazonaws.com/hellovideo/demo-site/videos/the-hobbit.ogv','2015-02-23 16:09:01','2015-03-01 20:41:05'),
	(30,1,11,'Johnny Express','embed','subscriber','<h2 class=\"first\">It\'s 2150</h2>\r\n<p>There are all sorts of Aliens living throughout space.</p>\r\n<p>Johnny is a Space Delivery Man who travels to different planets to deliver packages.&nbsp;Johnny is lazy and his only desire is to sleep in his autopilot spaceship.&nbsp;When the spaceship arrives at the destination, all he has to do is simply deliver the box,&nbsp;however, it never goes as planned. Johnny encounters strange and bizarre planets&nbsp;and always seems to cause trouble on his delivery route.<br /><br />Will he be able to finish his mission without trouble?</p>\r\n<p>Checkout the original here:&nbsp;http://vimeo.com/94502406</p>','Johnny is a Space Delivery Man who travels to different planets to deliver packages. Johnny is lazy and his only desire is to sleep in his autopilot spaceship.',1,0,327,8,'January2015/johnny-express.jpg','<iframe src=\"//player.vimeo.com/video/94502406\" width=\"500\" height=\"281\" frameborder=\"0\" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>','','','','2015-02-23 16:33:01','2015-03-01 21:10:07'),
	(31,1,13,'DevinSupertramp\'s Biggest Fails','embed','subscriber','<h2><img style=\"float: left; margin-right: 20px;\" title=\"DevinSupertramp\'s Biggest Fails\" src=\"/content/uploads/images/January2015/FILE-20150129-0704KXS1CLX5QGP8.jpg\" alt=\"\" width=\"280\" height=\"auto\" />Biggest Fails!</h2>\r\n<p>Crashes, bumps, and bruises! Checkout this awesome compilation of ground-hitting fails. This video contains biking, wheelchair stunts, scooter tricks, wakeboarding fun, various watersports, and much more awesome and epic fails!</p>\r\n<p>You can checkout more awesome crashes in more videos. Click on the tags below to find similar videos :)</p>','This video contains some awesome crashes and fails.',1,0,261,4,'January2015/devin-super-tramp-biggest-fails.jpg','<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/bILjxXw8dwc\" frameborder=\"0\" allowfullscreen></iframe>','','','','2015-01-29 15:21:35','2015-02-28 15:25:55'),
	(32,1,21,'Does My Dog Know What I\'m Thinking?','embed','guest','<p>Do you ever talk to your dog? Do they ever talk back? Humans and dogs have a truly amazing relationship, developed along an evolutionary journey that goes back nearly 10,000 years. Do they really understand what we say, think, and feel? Recent research suggests dogs know more about our language and emotions than you might think.<br /><br />CORRECTION: Chaser is a she. Oops!<br /><br />Meet Chaser the border collie:&nbsp;<a class=\"yt-uix-redirect-link\" dir=\"ltr\" title=\"http://www.nytimes.com/2011/01/18/science/18dog.html?pagewanted=all&amp;_r=1&amp;\" href=\"http://www.nytimes.com/2011/01/18/science/18dog.html?pagewanted=all&amp;_r=1&amp;\" target=\"_blank\" rel=\"nofollow\">http://www.nytimes.com/2011/01/18/sci...</a>&nbsp;<br />See Chaser in action:&nbsp;<a class=\"yt-uix-redirect-link\" dir=\"ltr\" title=\"https://www.youtube.com/user/pilleyjw\" href=\"https://www.youtube.com/user/pilleyjw\" target=\"_blank\" rel=\"nofollow\">https://www.youtube.com/user/pilleyjw</a>&nbsp;<br /><br />Dogs can process words&rsquo; emotion separate from meaning:&nbsp;<a class=\"yt-uix-redirect-link\" dir=\"ltr\" title=\"http://www.cell.com/current-biology/pdf/S0960-9822(14)01339-6.pdf\" href=\"http://www.cell.com/current-biology/pdf/S0960-9822(14)01339-6.pdf\" target=\"_blank\" rel=\"nofollow\">http://www.cell.com/current-biology/p...</a>&nbsp;<br /><br />Left-gaze bias in dogs and humans:&nbsp;<a class=\"yt-uix-redirect-link\" dir=\"ltr\" title=\"http://www.plosone.org/article/info%3Adoi%2F10.1371%2Fjournal.pone.0036076\" href=\"http://www.plosone.org/article/info%3Adoi%2F10.1371%2Fjournal.pone.0036076\" target=\"_blank\" rel=\"nofollow\">http://www.plosone.org/article/info%3...</a>&nbsp;<br /><br />Charles Darwin&rsquo;s &ldquo;Expression of the Emotions in Man and Animals&rdquo;&nbsp;<a class=\"yt-uix-redirect-link\" dir=\"ltr\" title=\"https://archive.org/details/expressionofemot1872darw\" href=\"https://archive.org/details/expressionofemot1872darw\" target=\"_blank\" rel=\"nofollow\">https://archive.org/details/expressio...</a>&nbsp;<br /><br />Decoding dog barks:&nbsp;<a class=\"yt-uix-redirect-link\" dir=\"ltr\" title=\"http://www.apa.org/monitor/may05/dogs.aspx\" href=\"http://www.apa.org/monitor/may05/dogs.aspx\" target=\"_blank\" rel=\"nofollow\">http://www.apa.org/monitor/may05/dogs...</a>&nbsp;<br /><br />Have an idea for an episode or an amazing science question you want answered? Leave a comment below!</p>','Do you ever talk to your dog? Do they ever talk back? Humans and dogs have a truly amazing relationship, developed along an evolutionary journey that goes back nearly 10,000 years. Do they really understand what we say, think, and feel? Recent research suggests dogs know more about our language and emotions than you might think.',1,0,393,2,'January2015/does-my-dog-know-what-im-thinking.jpg','<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/UnMULQDHIjk\" frameborder=\"0\" allowfullscreen></iframe>','','','','2015-01-29 15:48:07','2015-02-04 14:34:17'),
	(33,1,14,'Jurassic World Trailer','embed','guest','<p>Steven Spielberg returns to executive produce the long-awaited next installment of his groundbreaking Jurassic Park series, Jurassic World. Colin Trevorrow directs the epic action-adventure from a screenplay he wrote with Derek Connolly. Frank Marshall and Patrick Crowley join the team as producers.<br /><br />Jurassic World will be released in 3D by Universal Pictures on June 12, 2015.</p>\r\n<p>Checkout the movie website here:&nbsp;<a class=\"yt-uix-redirect-link\" dir=\"ltr\" title=\"http://www.jurassicworldmovie.com/\" href=\"http://www.jurassicworldmovie.com/\" target=\"_blank\" rel=\"nofollow\">http://www.jurassicworldmovie.com/</a></p>','Steven Spielberg returns to executive produce the long-awaited next installment of his groundbreaking Jurassic Park series, Jurassic World. Colin Trevorrow directs the epic action-adventure from a screenplay he wrote with Derek Connolly. Frank Marshall and Patrick Crowley join the team as producers.',1,1,160,5,'January2015/jurassic-world.jpg','<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/RFinNxS5KN4\" frameborder=\"0\" allowfullscreen></iframe>','','','','2015-02-23 16:03:01','2015-03-01 18:55:28'),
	(34,1,13,'The Coastal Crew - Wetness','embed','guest','<p class=\"first\">The only thing you hear going down the trail is your bike, you\'re tuned into every sound it makes. One of the most satisfying things is a tire pattering down the trail, squashing muck, sliding over roots and smashing puddles. Unfortunately this lush, raw sound is often lost in most videos, overtaken by the music. Curtis Robinson takes advantage of winter conditions and makes some noise with his Stumpjumper FSR EVO.</p>\r\n<p><a href=\"http://www.specialized.com/stumpjumper-fsr\" target=\"_blank\" rel=\"nofollow\">specialized.com/stumpjumper-fsr</a><br /><a href=\"http://www.iamspecialized.com/\" target=\"_blank\" rel=\"nofollow\">iamspecialized.com</a></p>\r\n<p>&nbsp;</p>\r\n<p>Checkout the official page on vimeo here:&nbsp;<a href=\"http://vimeo.com/112233728\">http://vimeo.com/112233728</a></p>\r\n<p>&nbsp;</p>','The only thing you hear going down the trail is your bike, you\'re tuned into every sound it makes. One of the most satisfying things is a tire pattering down the trail, squashing muck, sliding over roots and smashing puddles. Unfortunately this lush, raw sound is often lost in most videos, overtaken by the music. Curtis Robinson takes advantage of winter conditions and makes some noise with his Stumpjumper FSR EVO.',1,0,128,8,'January2015/wetness-video.jpg','<iframe src=\"//player.vimeo.com/video/112233728\" width=\"500\" height=\"281\" frameborder=\"0\" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>','','','','2015-02-23 16:15:01','2015-02-28 15:20:04'),
	(36,1,21,'Theory of supply & demand','embed','guest','<p class=\"first\">Educational and lagged short movie which explain supply &amp; demand to students from an American university.</p>\r\n<p>Directed, designed &amp; animated by Cyril Izarn (<a href=\"http://www.cyrilizarn.com/\" target=\"_blank\" rel=\"nofollow\">cyrilizarn.com</a>) &amp; Pat Grivet (<a href=\"http://www.hellopoyt.com/\" target=\"_blank\" rel=\"nofollow\">hellopoyt.com/</a>)<br />Script, production: Demoduck (<a href=\"http://www.demoduck.com/\" target=\"_blank\" rel=\"nofollow\">demoduck.com</a>)</p>','Educational and lagged short movie which explain supply & demand to students from an American university.',1,0,172,1,'February2015/supply-and-demand.jpg','<iframe src=\"//player.vimeo.com/video/95757264\" width=\"500\" height=\"281\" frameborder=\"0\" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>','','','','2015-02-15 06:59:44','2015-02-16 22:08:19'),
	(37,1,13,'Sports Center Top 10 - Unexpected Sports Moments','embed','guest','<p>Amazing Goals, Outstanding Plays, and Incredible Moments. You\'ve got to checkout these&nbsp;Sports Center top 10 Moments. There\'s Hockey, Football, Soccer and much more. Checkout the original video here:&nbsp;https://www.youtube.com/watch?v=qvBsvjs9SB8</p>','Checkout these Sports Center top 10 Moments. There\'s Hockey, Football, Soccer and much more',1,0,221,2,'February2015/sports-center-top-10.jpg','<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/qvBsvjs9SB8\" frameborder=\"0\" allowfullscreen></iframe>','','','','2014-10-02 03:02:12','2015-02-28 15:23:40'),
	(38,1,15,'Border','embed','guest','<p class=\"first\">An exploration of the absurdity of the lines created by human beings called \'borders\'. Two people meet on such a line. One takes this more seriously than the other but, step-by-step, they find a peaceful solution.</p>\r\n<p class=\"first\">Part of the 12 Minutes About Peace project.</p>\r\n<p>By plan78 animation studio.<br />Production : S.O.I.L.</p>\r\n<p>12 Minutes About Peace:<br />One of the most imaginative projects to mark the centenary of the First World War is 12 Minutes About Peace, a collection of 12 one-minute animated shorts on the theme of peace. They were made by both emerging as well as established talents in Flemish animation.</p>\r\n<p>Peace was chosen as a theme in order to encourage contemporary perspectives and also to accentuate the positive, rather than focus exclusively on the negatives of war. Nevertheless, animators were allowed to address the theme in the way they wanted and with a free choice in form and technique. Films could benarrative or abstract, with or without dialogue, and draw on the widest range of animation styles. However, each film could only be one minute in length.</p>','An exploration of the absurdity of the lines created by human beings called \'borders\'. Two people meet on such a line. One takes this more seriously than the other but, step-by-step, they find a peaceful solution.',1,0,67,2,'February2015/borders.jpg','<iframe src=\"//player.vimeo.com/video/119107623?color=ff9933&title=0&byline=0&portrait=0\" width=\"500\" height=\"281\" frameborder=\"0\" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>','','','','2015-02-20 14:41:57','2015-03-01 21:17:31'),
	(39,1,15,'Harvard Sailing Team - Boys Will Be Girls','embed','subscriber','<p>Boys Will Be Girls - Harvard Sailing Team\'s #1 sketch comedy video! From watching The Biggest Loser, to eating Pinkberry, to deciding \"Our Diet Starts Tomorrow\" - don\'t you test these besties!</p>\r\n<p>Checkout this hilarious video of what it would be like if boys acted more like girls.</p>\r\n<p>A skit by Untucked films.</p>','Boys Will Be Girls - Harvard Sailing Team\'s #1 sketch comedy video! From watching The Biggest Loser, to eating Pinkberry, to deciding \"Our Diet Starts Tomorrow\" - don\'t you test these besties!',1,0,249,2,'February2015/harvard-sailing-team.jpg','<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/gspaoaecNAg\" frameborder=\"0\" allowfullscreen></iframe>','','','','2015-02-20 15:00:35','2015-02-28 15:30:11'),
	(40,1,17,'How To Make A Surf Video','embed','guest','<p>Learn how to capture sweet surf action with aesthetic grace in this collaboration between Vimeo Video School and Korduroy.tv</p>\r\n<p>Check out the full lesson here&ndash;&nbsp;<a href=\"https://vimeo.com/videoschool/lesson/256/how-to-make-a-surf-video\">vimeo.com/videoschool/lesson/256/how-to-make-a-surf-video</a></p>','Learn how to capture sweet surf action with aesthetic grace in this collaboration between Vimeo Video School and Korduroy.tv.',1,0,247,1,'February2015/how-to-make-a-surf-video.jpg','<iframe src=\"//player.vimeo.com/video/47658794\" width=\"500\" height=\"281\" frameborder=\"0\" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>','','','','2015-02-21 02:39:42','2015-02-21 17:56:14'),
	(41,1,17,'Do More With Your DSLR','embed','guest','<p class=\"first\">Introducing the first installment in our new video series: Do More With Your DSLR.</p>\r\n<p>This in-depth tutorial shows you how to make the most of the lighting conditions in your shooting environment. For anyone wondering about white balance, in search of ISO info, or freaked out by f-stops, this one\'s for you.</p>\r\n<p>Read the full Video School lesson here:&nbsp;<a href=\"https://vimeo.com/videoschool/lesson/174/do-more-with-your-dslr-working-with-available-light\">vimeo.com/videoschool/lesson/174/do-more-with-your-dslr-working-with-available-light</a></p>\r\n<p>Check out the other lesson in the series as well:<br /><a href=\"https://vimeo.com/videoschool/lesson/175/do-more-with-your-dslr-ii-building-a-rig\">vimeo.com/videoschool/lesson/175/do-more-with-your-dslr-ii-building-a-rig</a></p>','This in-depth tutorial shows you how to make the most of the lighting conditions in your shooting environment. For anyone wondering about white balance, in search of ISO info, or freaked out by f-stops, this one\'s for you.',1,0,395,6,'February2015/do-more-with-your-dslr.jpg','<iframe src=\"//player.vimeo.com/video/36557938?color=ffffff\" width=\"500\" height=\"281\" frameborder=\"0\" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>','','','','2014-09-28 03:02:12','2015-02-28 22:16:36'),
	(42,1,22,'All-in-one Salmon Pockets','embed','guest','<p>Checkout this all-in-one Salmon Pockets. Healthy, nutritious and easy to make in 25-minutes. Annessa Chumbley walks us through the 6 ingredients needed for this delicious and healthy fast food meal. You can find more videos from their Vimeo Channel Here&nbsp;<a href=\"https://vimeo.com/tdgmotion\" target=\"_blank\">https://vimeo.com/tdgmotion</a>.</p>\r\n<p>Additionally, checkout other cooking tags below to find more delicious meals that you can cook up.</p>','All-in-one Salmon Pockets. Healthy, nutritious and easy to make in 25-minutes. Annessa Chumbley walks us through the 6 ingredients needed for this delicious and healthy fast food meal.',1,0,68,0,'February2015/all-in-one-salmon-pockets.jpg','<iframe src=\"//player.vimeo.com/video/120092061\" width=\"500\" height=\"281\" frameborder=\"0\" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>','','','','2015-02-22 02:35:01','2015-02-22 02:35:01'),
	(43,1,22,'Quick Tip: Garbage Greens','embed','guest','<p>Next time you\'re about to throw away those beet greens, think again! You can use these greens for all sorts of things. Here are just a few health benefits of eating these greens.</p>\r\n<ol>\r\n<li>Stay Young</li>\r\n<li>Lower Your Cholesterol</li>\r\n<li>Preserve Vision Health</li>\r\n<li>Boost Bone Health</li>\r\n<li>Prevent Colon Cancer</li>\r\n</ol>\r\n<p>And so much more :)</p>','Next time you\'re about to throw away those beet greens, think again!',1,0,30,0,'February2015/quick-tip-garbage-greens.jpg','<iframe src=\"//player.vimeo.com/video/118735934?color=f0f2f2&portrait=0\" width=\"500\" height=\"281\" frameborder=\"0\" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>','','','','2015-02-22 02:39:08','2015-02-22 02:39:08'),
	(44,1,22,'Pancake Day','embed','guest','<p>Who doesn\'t love pancakes?! Here\'s a little video to show how great they are. This short film is created by the team at&nbsp;thevisualsteam.com.</p>\r\n<p>Be sure to checkout their channel for more awesome videos.</p>','Who doesn\'t love pancakes?! Here\'s a little video to show how great they are.',1,0,16,1,'February2015/pancake-day.jpg','<iframe src=\"//player.vimeo.com/video/119866125\" width=\"500\" height=\"281\" frameborder=\"0\" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>','','','','2015-02-22 14:56:01','2015-02-23 01:47:02'),
	(45,1,14,'The Amazing Spider-man 2 Trailer','file','subscriber','<p><img style=\"margin-right: 15px; float: left;\" title=\"The Amazing Spider-man 2 Trailer\" src=\"/content/uploads/images/February2015/FILE-20150223-08314JKSGW6PC9J9.jpg\" alt=\"\" width=\"120\" height=\"auto\" />For Peter Parker, life is busy. Between taking out the bad guys as Spider-Man and spending time with the person he loves, Gwen Stacy, high school graduation cannot come quickly enough. Peter has not forgotten about the promise he made to Gwen&rsquo;s father to protect her by staying away, but that is a promise he cannot keep. Things will change for Peter when a new villain, Electro, emerges, an old friend, Harry Osborn, returns, and Peter uncovers new clues about his past.</p>','It\'s great to be Spider-Man. For Peter Parker, there\'s no feeling quite like swinging between skyscrapers, embracing being the hero, and spending time with Gwen. But being Spider-Man comes at a price: only Spider-Man can protect his fellow New Yorkers from the formidable villains that threaten the city. With the emergence of Electr, Peter must confront a foe far more powerful than he. And as his old friend, Harry Osborn, returns, Peter comes to realize that all of his enemies have one thing in common: OsCorp.',1,1,168,9,'February2015/the-amazing-spiderman-2.jpg','<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/DlM2CWNTQ84\" frameborder=\"0\" allowfullscreen></iframe>','https://s3.amazonaws.com/hellovideo/demo-site/videos/the-amazing-spiderman-2.mp4','https://s3.amazonaws.com/hellovideo/demo-site/videos/the-amazing-spiderman-2.webm','https://s3.amazonaws.com/hellovideo/demo-site/videos/the-amazing-spiderman-2.ogv','2015-02-23 16:32:01','2015-03-01 20:01:51'),
	(46,1,14,'The Avengers Age of Ultron Trailer','file','guest','<p>With S.H.I.E.L.D. destroyed and the Avengers needing a hiatus from stopping threats, Tony Stark jumpstarts a dormant peacekeeping program, Ultron: a self-aware, self-teaching, artificial intelligence. However, his plan backfires when Ultron decides that humans are the main enemy and sets out to eradicate them from Earth, leaving it up to Iron Man, Captain America, Thor, the Hulk, Black Widow and Hawkeye, along with support from Nick Fury and Maria Hill, to stop him. Along the way the Avengers encounter the powerful twins Pietro and Wanda Maximoff, as well as the familiar Vision.</p>\r\n<p>The sequel was announced in May 2012, after the successful release of The Avengers. Whedon, the director of the first film, was brought back on board in August and a release date was set. By April 2013, Whedon had completed a draft of the script, and casting began in June with the re-signing of Downey. Second unit filming began in February 2014 in South Africa with principal photography taking place between March and August 2014. The film was primarily shot at Shepperton Studios in Surrey, with additional footage filmed in Italy, South Korea, Bangladesh, New York, and various locations around England.</p>\r\n<p>Avengers: Age of Ultron is scheduled for release on May 1, 2015 in North America, in 3D and IMAX 3D. Two sequels, Avengers: Infinity War Part 1 and Avengers: Infinity War Part 2, are scheduled to be released on May 4, 2018 and May 3, 2019, respectively.</p>','With S.H.I.E.L.D. destroyed and the Avengers needing a hiatus from stopping threats, Tony Stark tries to jumpstart a dormant peacekeeping program, things go awry and it is up to the Avengers to stop the villainous Ultron from enacting his terrible plans. ',1,1,100,10,'February2015/avengers.jpg','<iframe src=\"//player.vimeo.com/video/109787436\" width=\"500\" height=\"209\" frameborder=\"0\" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>','https://s3.amazonaws.com/hellovideo/demo-site/videos/avengers-age-of-ultron.mp4','https://s3.amazonaws.com/hellovideo/demo-site/videos/avengers-age-of-ultron.webm','https://s3.amazonaws.com/hellovideo/demo-site/videos/avengers-age-of-ultron.ogv','2015-02-23 16:50:43','2015-03-04 01:13:44'),
	(47,1,19,'Teenage Mutant Ninja Turtles','file','subscriber','<p>April O\'Neil is a news reporter for Channel 6 Eyewitness News in New York City investigating a crime wave by a clan of thieves called the Foot Clan. After her latest lead; a dock worker, refuses to give her information, she returns to the dock at night only to witness the Foot raiding the cargo containers. They are attacked by an unseen vigilante, which April fails to capture on her phone\'s camera but notices a symbol left behind. However, April\'s supervisor Bernadette Thompson and her co-workers are oblivious to her beliefs of the vigilante\'s existence. At a charity event she is covering for the company Sacks Industries, she expresses her gratitude to her father\'s lab partner before he died, Eric Sacks.</p>\r\n<p>Frustrated by the vigilante, the Foot Clan\'s leader Shredder has them hold a subway station of people hostage in order to draw him out. April goes to the scene, for evidence but ends up becoming a hostage herself. The lights go out, and four figures appear to face the clan, taking them out and freeing the hostages. April tracks them to a rooftop, and manages to take their picture, but she passes out when she is confronted with four anthropomorphic mutant turtles. When she comes to, she finds that they had wiped her phone and advise her not to tell anyone of them before leaving. As they leave, she manages to hear Raphael and Leonardo\'s names. She returns to her apartment and remembers a project her father was working on in 1999; \"Project Renaissance\" involving four turtles named Leonardo, Donatello, Michaelangelo, Raphael, and a rat she called Splinter. Unable to convince Bernadette of the turtles\' existence, April is dismissed. April has her coworker Vern Fenwick drive her out to Eric Sacks\' estate where she confides in him about what she has discovered. Eric believes her and reveals that he hopes they can unlock the secrets of a mutagen they had been experimenting with to cure disease in the populace thought lost in the fire.</p>\r\n<p>Punishing them for venturing to the surface, Splinter goads Mikey into revealing they met April, and he demands to have her meet them. When they bring her to their sewer lair, Splinter explains that April had saved them all from the fire and freed them into the sewers. The mutagen being experimented upon them caused the five of them to grow into more humanoid attributes, and Splinter took on the role of their father, using April\'s father as an example. After finding a book on Ninjitsu in a storm drain, he proceeded to teach himself, then the turtles in the fighting style. April reveals that she told Sacks, whom Splinter says betrayed her father and killed him, just then, the Foot attacks. They fight valiantly until Shredder arrives, who defeats Splinter as he is trying to keep his turtles from entering a fight with Shredder, knowing Shredder is a far superior warrior than the four mutants. A series of explosives bury Raph in rubble while the other turtles are captured. April comes out of hiding and she and Raph decide they need to save the others. Finally convincing Vern of the turtles\' existence, he drives them to Sacks\' estate and break in as the others are being drained of their blood in order to create an antidote to a deadly virus that Sacks hopes to flood New York with, in order to become rich from all the people seeking his cure. Raph is beaten down by Shredder while April and Vern free the others by injecting them with adrenaline. They escape the compound in pursuit of Sacks, but are followed by heavy machines and trucks. The group manages to survive the onslaught through teamwork, though Vern\'s van is destroyed.</p>\r\n<p>In the city, Sacks and Shredder plant a device on a high radio tower to flood the city. April and Vern face Sacks in the lab, while the turtles fight Shredder on the roof. During the fight, the support for the tower collapses and the turtles try to hold it up and keep it from falling and infecting the city. April arrives and confronts Shredder with the mutagen, in the struggle, the tower collapses and the turtles pull April onto it with them as Shredder falls to the streets. Believing they\'re about to be destroyed, the turtles confess their innermost secrets, Raph gives an impassioned speech of his love for his brothers before they land harmlessly on the street. They vanish before the humans find them and return to the sewers, where they give Splinter the mutagen and he begins to recover.</p>\r\n<p>Sometime later, April meets with Vern who has a new loaner car from the news station, he tries and fails once again to ask April out on a date. The turtles appear in a special modified \"Turtle Van\" and Mikey accidentally blows up Vern\'s new car with a rocket. As the police respond to the explosion, the turtles leave, but not before Mikey tries to serenade April with \"Happy Together\".</p>','When a kingpin threatens New York City, a group of mutated turtle warriors must emerge from the shadows to protect their home.',1,0,60,8,'February2015/tmnt.jpg','','https://s3.amazonaws.com/hellovideo/demo-site/videos/tmnt.mp4','https://s3.amazonaws.com/hellovideo/demo-site/videos/tmnt.webm','https://s3.amazonaws.com/hellovideo/demo-site/videos/tmnt.ogv','2015-02-26 02:06:05','2015-05-31 14:56:15');

/*!40000 ALTER TABLE `videos` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
