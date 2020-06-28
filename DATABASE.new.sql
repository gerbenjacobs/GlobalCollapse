DROP TABLE IF EXISTS `actions`;
CREATE TABLE `actions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idle` int NOT NULL DEFAULT '1',
  `scavenging` int NOT NULL DEFAULT '0',
  `training` int NOT NULL DEFAULT '0',
  `on_mission` int NOT NULL DEFAULT '0',
  `mission_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `resting` int NOT NULL DEFAULT '0',
  `scavenge_start` datetime DEFAULT NULL,
  `training_end` datetime DEFAULT NULL,
  `mission_end` datetime DEFAULT NULL,
  `resting_start` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `image` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `visible` tinyint(1) DEFAULT '0',
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `article_tag`;
CREATE TABLE `article_tag` (
  `id` int NOT NULL AUTO_INCREMENT,
  `article_id` int DEFAULT NULL,
  `locale` char(2) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `htaccess` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `article_translation`;
CREATE TABLE `article_translation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `article_id` int DEFAULT NULL,
  `locale` char(2) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(512) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `perex` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `text` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `htaccess` varchar(512) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `buildings`;
CREATE TABLE `buildings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(90) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'basic',
  `price` int DEFAULT NULL,
  `max_level` int DEFAULT NULL,
  `base_income` int DEFAULT NULL,
  `unlocked` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `buildings` (`id`, `name`, `type`, `price`, `max_level`, `base_income`, `unlocked`) VALUES
(1,	'weedhouse',	'drugs',	2000,	NULL,	25,	1),
(2,	'meth_lab',	'drugs',	10000,	NULL,	15,	1),
(3,	'ecstasy_lab',	'drugs',	6000,	NULL,	20,	0),
(4,	'poppy_field',	'drugs',	25000,	NULL,	10,	0),
(5,	'coca_plantage',	'drugs',	100000,	NULL,	5,	0);

DROP TABLE IF EXISTS `contact_form`;
CREATE TABLE `contact_form` (
  `id` int NOT NULL AUTO_INCREMENT,
  `data` text NOT NULL,
  `datetime` datetime NOT NULL,
  `ip` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `drugs`;
CREATE TABLE `drugs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int NOT NULL,
  `min` int NOT NULL,
  `max` int NOT NULL,
  `past_price` int NOT NULL,
  `supply_max` int DEFAULT NULL,
  `supply` int DEFAULT NULL,
  `updated` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `drugs` (`id`, `name`, `price`, `min`, `max`, `past_price`, `supply_max`, `supply`, `updated`) VALUES
(1,	'Weed',	3,	3,	20,	10,	NULL,	NULL,	'2020-06-06 13:40:54'),
(2,	'Ecstasy',	16,	5,	25,	22,	NULL,	NULL,	'2020-06-06 13:40:55'),
(3,	'Meth',	54,	25,	85,	67,	NULL,	NULL,	'2020-06-03 00:07:39'),
(4,	'Heroin',	96,	50,	100,	105,	NULL,	NULL,	'2020-06-03 00:07:39'),
(5,	'Coke',	113,	60,	150,	148,	NULL,	NULL,	'2020-06-03 00:07:39');

DROP TABLE IF EXISTS `drugs_inventory`;
CREATE TABLE `drugs_inventory` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `drugs_id` int NOT NULL,
  `quantity` int DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `drugs_id` (`drugs_id`),
  CONSTRAINT `drugs_inventory_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `drugs_inventory_ibfk_2` FOREIGN KEY (`drugs_id`) REFERENCES `drugs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `game_events`;
CREATE TABLE `game_events` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` int NOT NULL DEFAULT '0',
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `game_events` (`id`, `name`, `slug`, `active`, `start_date`, `end_date`) VALUES
(1,	'social distancing',	'social-distancing',	0,	'2020-04-07 08:21:48',	'2020-04-17 08:21:48');

DROP TABLE IF EXISTS `items`;
CREATE TABLE `items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `item` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `items_inventory`;
CREATE TABLE `items_inventory` (
  `id` int NOT NULL AUTO_INCREMENT,
  `item_id` int NOT NULL,
  `user_id` int NOT NULL,
  `quantity` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `item_id` (`item_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `items_inventory_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE CASCADE,
  CONSTRAINT `items_inventory_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `page`;
CREATE TABLE `page` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parent_id` int NOT NULL DEFAULT '0',
  `level` int NOT NULL DEFAULT '0',
  `order` int NOT NULL DEFAULT '9999',
  `type` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'content',
  `image` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `visible` tinyint(1) DEFAULT '0',
  `url` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `page_image`;
CREATE TABLE `page_image` (
  `id` int NOT NULL AUTO_INCREMENT,
  `page_id` int NOT NULL,
  `filename` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `page_translation`;
CREATE TABLE `page_translation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `page_id` int DEFAULT NULL,
  `locale` char(2) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(512) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `perex` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `text` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `htaccess` varchar(512) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `player_buildings`;
CREATE TABLE `player_buildings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `buildings_id` int NOT NULL,
  `player_land_id` int NOT NULL,
  `level` int DEFAULT '0',
  `income` int DEFAULT NULL,
  `is_upgrading` int NOT NULL DEFAULT '0',
  `upgrade_end` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `buildings_id` (`buildings_id`),
  KEY `player_land_id` (`player_land_id`),
  CONSTRAINT `player_buildings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `player_buildings_ibfk_2` FOREIGN KEY (`buildings_id`) REFERENCES `buildings` (`id`) ON DELETE CASCADE,
  CONSTRAINT `player_buildings_ibfk_3` FOREIGN KEY (`player_land_id`) REFERENCES `player_lands` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `player_income`;
CREATE TABLE `player_income` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `money` int DEFAULT '0',
  `weed` int DEFAULT '0',
  `ecstasy` int DEFAULT '0',
  `meth` int DEFAULT '0',
  `heroin` int DEFAULT '0',
  `coke` int DEFAULT '0',
  `last_collection` datetime DEFAULT NULL,
  `paused` int DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `player_income_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `player_lands`;
CREATE TABLE `player_lands` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `level` int NOT NULL DEFAULT '1',
  `slots` int NOT NULL DEFAULT '3',
  `free_slots` int NOT NULL DEFAULT '3',
  `is_upgrading` int DEFAULT '0',
  `upgrade_end` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `player_lands_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `player_stats`;
CREATE TABLE `player_stats` (
  `id` int NOT NULL AUTO_INCREMENT,
  `level` int NOT NULL DEFAULT '1',
  `strength` int NOT NULL DEFAULT '3',
  `stamina` int NOT NULL DEFAULT '7',
  `speed` int NOT NULL DEFAULT '2',
  `energy` int NOT NULL DEFAULT '100',
  `energy_max` int NOT NULL DEFAULT '100',
  `xp` int NOT NULL DEFAULT '0',
  `xp_min` int NOT NULL DEFAULT '0',
  `xp_max` int NOT NULL DEFAULT '50',
  `power` int NOT NULL DEFAULT '12',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `player_unlocked`;
CREATE TABLE `player_unlocked` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `unlockables_id` int NOT NULL,
  `quantity` int NOT NULL DEFAULT '1',
  `unlocked_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `unlockables_id` (`unlockables_id`),
  CONSTRAINT `player_unlocked_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `player_unlocked_ibfk_2` FOREIGN KEY (`unlockables_id`) REFERENCES `unlockables` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `unlockables`;
CREATE TABLE `unlockables` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unlocks` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `buildings_id` int DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `unlock_at` int NOT NULL DEFAULT '10',
  PRIMARY KEY (`id`),
  KEY `buildings_id` (`buildings_id`),
  CONSTRAINT `unlockables_ibfk_1` FOREIGN KEY (`buildings_id`) REFERENCES `buildings` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `unlockables` (`id`, `type`, `unlocks`, `buildings_id`, `amount`, `unlock_at`) VALUES
(1,	'level',	'building',	3,	NULL,	10),
(2,	'stats',	'max_energy',	NULL,	250,	30);

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_log` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `registration` datetime NOT NULL,
  `role` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'u',
  `avatar` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '3',
  `money` int NOT NULL DEFAULT '25',
  `skillpoints` int NOT NULL DEFAULT '4',
  `tutorial` int NOT NULL DEFAULT '0',
  `player_stats_id` int DEFAULT NULL,
  `actions_id` int DEFAULT NULL,
  `last_active` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `player_stats_id` (`player_stats_id`),
  KEY `actions_id` (`actions_id`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`player_stats_id`) REFERENCES `player_stats` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_ibfk_2` FOREIGN KEY (`actions_id`) REFERENCES `actions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `user` (`id`, `username`, `email`, `ip`, `password`, `date_log`, `registration`, `role`, `avatar`, `money`, `skillpoints`, `tutorial`, `player_stats_id`, `actions_id`, `last_active`) VALUES
(1,	'matronator',	'info@matronator.com',	'127.0.0.1',	'$2y$10$ttxpvkn7uKZDLgo4NdX1/OzcevLAYU4IB4tdA7kBig2aIpzLMVM0m',	'2020-06-20 10:55:40',	'2020-03-27 12:31:51',	'a',	'6',	591776460,	0,	1,	1,	1,	'2020-06-20 12:55:40');


DROP TABLE IF EXISTS `user_settings`;
CREATE TABLE `user_settings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `timezone` int NOT NULL DEFAULT '0',
  `dst` int DEFAULT NULL,
  `custom_avatar` int DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_settings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `assault_replays`;
CREATE TABLE `assault_replays` (
  `id` int NOT NULL AUTO_INCREMENT,
  `assault_id` int NOT NULL,
  `data` json NOT NULL,
  PRIMARY KEY (`id`),
  KEY `assault_id` (`assault_id`),
  CONSTRAINT `assault_replays_ibfk_1` FOREIGN KEY (`assault_id`) REFERENCES `assaults` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `assaults`;
CREATE TABLE `assaults` (
  `id` int NOT NULL AUTO_INCREMENT,
  `attacker` int NOT NULL,
  `defender` int NOT NULL,
  `result` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attacker_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `victim_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `attacker` (`attacker`),
  KEY `defender` (`defender`),
  CONSTRAINT `assaults_ibfk_1` FOREIGN KEY (`attacker`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `assaults_ibfk_2` FOREIGN KEY (`defender`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `vendor_offers`;
CREATE TABLE `vendor_offers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `vendor_id` int NOT NULL,
  `drug_id` int NOT NULL,
  `quantity` int NOT NULL DEFAULT '1000',
  `limit` int NOT NULL DEFAULT '0',
  `active` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `drug_id` (`drug_id`),
  KEY `vendor_id` (`vendor_id`),
  CONSTRAINT `vendor_offers_ibfk_1` FOREIGN KEY (`drug_id`) REFERENCES `drugs` (`id`) ON DELETE CASCADE,
  CONSTRAINT `vendor_offers_ibfk_2` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `vendors`;
CREATE TABLE `vendors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `money` int NOT NULL DEFAULT '10000',
  `base_money` int NOT NULL DEFAULT '10000',
  `level` int NOT NULL DEFAULT '1',
  `active` int NOT NULL DEFAULT '0',
  `charge` decimal(7,3) DEFAULT '0.050',
  `active_since` datetime DEFAULT NULL,
  `active_until` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Darknet starting data

INSERT INTO `vendor_offers` (`id`, `vendor_id`, `drug_id`, `quantity`, `limit`, `active`) VALUES
(1,	1,	5,	819,	82,	1),
(2,	2,	1,	1742,	174,	1),
(3,	3,	2,	873,	87,	1),
(4,	4,	4,	1976,	198,	1),
(5,	5,	3,	4705,	471,	1),
(6,	6,	3,	1728,	173,	1),
(7,	7,	1,	6566,	657,	1),
(8,	8,	4,	7816,	782,	1),
(9,	4,	2,	1926,	193,	1),
(10,	10,	1,	6390,	639,	1),
(11,	1,	1,	860,	86,	1),
(12,	2,	2,	926,	93,	1),
(13,	3,	4,	633,	63,	1),
(14,	9,	3,	1160,	116,	1),
(15,	5,	2,	1175,	118,	1),
(16,	6,	5,	1674,	167,	1),
(17,	7,	4,	5908,	591,	1),
(18,	8,	3,	5744,	574,	1),
(19,	8,	1,	3348,	335,	1),
(20,	10,	5,	2170,	217,	1),
(21,	1,	2,	991,	99,	1),
(22,	2,	5,	490,	49,	1),
(23,	3,	1,	2313,	231,	1),
(24,	4,	3,	2016,	202,	1),
(25,	5,	1,	1390,	139,	1),
(26,	6,	2,	4692,	469,	1),
(27,	7,	3,	2303,	230,	1),
(28,	9,	4,	2992,	299,	1),
(29,	9,	5,	8496,	850,	1),
(30,	10,	4,	6960,	696,	1);

INSERT INTO `vendors` (`id`, `name`, `money`, `base_money`, `level`, `active`, `charge`, `active_since`, `active_until`) VALUES
(1,	'HeisenbergDE',	500000,	500000,	1,	1,	0.050,	NULL,	NULL),
(2,	'happypillz',	500000,	500000,	2,	1,	0.050,	NULL,	NULL),
(3,	'DutchDeal',	5000456,	50000,	3,	1,	0.050,	NULL,	NULL),
(4,	'StealthPharmacyUK',	10000,	50000,	4,	1,	0.020,	'2020-06-28 21:57:20',	NULL),
(5,	'Apocalypse_drugs',	250000,	250000,	5,	1,	0.030,	'2020-06-28 21:59:23',	NULL),
(6,	'HeisenbergDE',	600000,	600000,	6,	1,	0.060,	NULL,	NULL),
(7,	'happypillz',	500000,	600000,	7,	1,	0.050,	NULL,	NULL),
(8,	'DutchDeal',	1000000,	1000000,	8,	1,	0.080,	NULL,	NULL),
(9,	'StealthPharmacyUK',	10000,	150000,	9,	1,	0.020,	'2020-06-28 21:57:20',	NULL),
(10,	'Apocalypse_drugs',	250000,	350000,	10,	1,	0.025,	'2020-06-28 21:59:23',	NULL);