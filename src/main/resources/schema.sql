CREATE TABLE IF NOT EXISTS `core_UserConnection` (userId varchar(255) not null,
	providerId varchar(255) not null,
	providerUserId varchar(255),
	rank int not null,
	displayName varchar(255),
	profileUrl varchar(512),
	imageUrl varchar(512),
	accessToken varchar(512) not null,
	secret varchar(512),
	refreshToken varchar(512),
	expireTime bigint,
	primary key (userId, providerId, providerUserId));
create unique index `UserConnectionRank` on core_UserConnection(userId, providerId, rank);

CREATE TABLE IF NOT EXISTS `core_context` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `context_name` varchar(20) DEFAULT NULL,
  `install_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKmm40fu695mkigd47by3vvm7a3` (`context_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

INSERT IGNORE INTO `core_context` (`id`, `context_name`, `install_date`)
VALUES
	(1, 'DEFAULT', NULL);

CREATE TABLE IF NOT EXISTS `core_state` (
  `id` varchar(32) NOT NULL,
  `context_name` varchar(20) DEFAULT NULL,
  `country_code` varchar(3) DEFAULT NULL,
  `install_date` datetime DEFAULT NULL,
  `priority` char(1) NOT NULL,
  `state_alias` varchar(3) DEFAULT NULL,
  `state_code` varchar(12) DEFAULT NULL,
  `state_name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKee97a7bvckn0mt325v9ixprjy` (`context_name`,`state_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT IGNORE INTO `core_state` (`id`, `context_name`, `country_code`, `install_date`, `priority`, `state_alias`, `state_code`, `state_name`)
VALUES
	('18', 'DEFAULT', 'BRA', '2016-09-26 18:19:42', '\0', 'PR', '41', 'Paraná');

CREATE TABLE IF NOT EXISTS `core_city` (
  `id` varchar(32) NOT NULL,
  `capital` bit(1) NOT NULL,
  `city_code` varchar(12) DEFAULT NULL,
  `city_name` varchar(64) DEFAULT NULL,
  `context_name` varchar(20) DEFAULT NULL,
  `priority` char(1) NOT NULL,
  `state_code` varchar(12) DEFAULT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKmebqf5g1ssdvbtbt9ndiuu8tj` (`context_name`,`state_code`,`city_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT IGNORE INTO `core_city` (`id`, `capital`, `city_code`, `city_name`, `context_name`, `priority`, `state_code`, `version`)
VALUES
	('604ba6a057d144f2bb524a67f8948e95', 1, '4106902', 'Curitiba', 'DEFAULT', '0', '41', 0);

CREATE TABLE IF NOT EXISTS `core_identity` (
  `id` varchar(32) NOT NULL,
  `created` datetime DEFAULT NULL,
  `display_name` varchar(64) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `identity_type` char(1) NOT NULL,
  `notification` char(1) NOT NULL,
  `appellation` char(1) NOT NULL,
  `birth_date` datetime DEFAULT NULL,
  `first_name` varchar(64) DEFAULT NULL,
  `gender` char(1) NOT NULL,
  `image_url` varchar(128) DEFAULT NULL,
  `last_name` varchar(64) DEFAULT NULL,
  `principal` varchar(40) DEFAULT NULL,
  `principal_type` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKpm9p488i3w64g0bytuuq1f1to` (`principal`),
  UNIQUE KEY `UK84qj2njcrmmqm1c5at5ru4deo` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT IGNORE INTO `core_identity` (`id`, `created`, `display_name`, `email`, `identity_type`, `notification`, `appellation`, `birth_date`, `first_name`, `gender`, `image_url`, `last_name`, `principal`, `principal_type`)
VALUES
	('1db6ebcadf5a4617b5e04d71b9a39804', '2016-09-26 18:19:44', 'Maurício', 'b009ee55-48c4-44e8-bbae-1eed95ffe342', 'P', 'P', '_', '1969-12-31 21:00:00', 'Maurício', 'M', '', 'Fernandes de Castro', 'mauricio@iservport.com', NULL);

CREATE TABLE IF NOT EXISTS `core_entity` (
  `type` char(1) NOT NULL,
  `id` varchar(32) NOT NULL,
  `activity_state` char(1) NOT NULL,
  `alias` varchar(64) DEFAULT NULL,
  `city_id` varchar(32) DEFAULT NULL,
  `context_name` varchar(20) DEFAULT NULL,
  `custom_style` varchar(128) DEFAULT NULL,
  `entity_desc` varchar(1024) DEFAULT NULL,
  `entity_domain` varchar(128) DEFAULT NULL,
  `entity_name` varchar(128) DEFAULT NULL,
  `entity_type` char(1) NOT NULL,
  `external_logo_url` varchar(128) DEFAULT NULL,
  `install_date` datetime DEFAULT NULL,
  `locale` varchar(20) DEFAULT NULL,
  `nature` varchar(20) DEFAULT NULL,
  `state_code` varchar(12) DEFAULT NULL,
  `version` int(11) NOT NULL,
  `pun` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK5vc2xi781n0jiriil16g2kkau` (`context_name`,`alias`),
  UNIQUE KEY `UK4m0oau7qnua6qyi44mebr63ay` (`context_name`,`state_code`,`city_id`,`alias`),
  UNIQUE KEY `UK4j24gsobws0ov8prry1nh9hou` (`city_id`,`alias`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT IGNORE INTO `core_entity` (`type`, `id`, `activity_state`, `alias`, `city_id`, `context_name`, `custom_style`, `entity_desc`, `entity_domain`, `entity_name`, `entity_type`, `external_logo_url`, `install_date`, `locale`, `nature`, `state_code`, `version`, `pun`)
VALUES
	('0', 'd13b1c95618648ce815cc6377b2a346b', 'A', 'DEFAULT', '604ba6a057d144f2bb524a67f8948e95', 'DEFAULT', '.png-toolbar-icon{ width: 64px; height: 64px; }', '', '', '', 'C', 'images/favicon.png', '2016-09-26 18:19:44', 'pt_BR', 'ORGANIZATION', '', 0, NULL);

CREATE TABLE IF NOT EXISTS `core_user` (
  `id` varchar(32) NOT NULL,
  `account_non_expired` bit(1) NOT NULL,
  `entity_id` varchar(32) DEFAULT NULL,
  `last_event` datetime DEFAULT NULL,
  `minimal_education_requirement` int(11) NOT NULL,
  `privacy_level` char(1) DEFAULT NULL,
  `script_items` varchar(255) DEFAULT NULL,
  `user_desc` varchar(512) DEFAULT NULL,
  `user_key` varchar(40) DEFAULT NULL,
  `user_name` varchar(64) DEFAULT NULL,
  `user_state` varchar(12) DEFAULT NULL,
  `user_type` int(11) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `identity_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK1mnhxqns2bxyptv1axmvnisbr` (`entity_id`,`user_key`),
  UNIQUE KEY `UKlfdtqwo9qcpjkl6g8onmu9mp2` (`entity_id`,`user_key`),
  KEY `FKhcayxk1v691gycmsq04nkbocb` (`identity_id`),
  CONSTRAINT `FKhcayxk1v691gycmsq04nkbocb` FOREIGN KEY (`identity_id`) REFERENCES `core_identity` (`id`),
  CONSTRAINT `FKagvnuk9xat5yof6ty68snx4pm` FOREIGN KEY (`identity_id`) REFERENCES `core_identity` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT IGNORE INTO `core_user` (`id`, `account_non_expired`, `entity_id`, `last_event`, `minimal_education_requirement`, `privacy_level`, `script_items`, `user_desc`, `user_key`, `user_name`, `user_state`, `user_type`, `version`, `identity_id`)
VALUES
	('9c4281ca59d14f1aae5cd5118a9873e7', 1, 'd13b1c95618648ce815cc6377b2a346b', '2016-09-26 18:19:44', 0, '0', '', '', 'ADMIN', 'SYSTEM_ADMIN', 'ACTIVE', 0, 0, NULL),
	('9e7820dfb6164e26829be0bf54eaa873', 1, 'd13b1c95618648ce815cc6377b2a346b', '2016-09-26 18:19:44', 0, '0', '', '', 'USER', 'SYSTEM_USER', 'ACTIVE', 0, 0, NULL),
	('b9694d307c3445da8ddf186d76d6ad2f', 1, 'd13b1c95618648ce815cc6377b2a346b', '2016-12-12 20:59:32', 0, '0', '', '', 'mauricio@iservport.com', 'Maurício Fernandes de Castro', 'ACTIVE', 5, 133, '1db6ebcadf5a4617b5e04d71b9a39804');

CREATE TABLE IF NOT EXISTS `core_userassoc` (
  `type` char(1) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `association_date` datetime DEFAULT NULL,
  `parsed_content` varchar(512) DEFAULT NULL,
  `resolution` char(1) NOT NULL,
  `sequence` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `child_id` varchar(32) DEFAULT NULL,
  `parent_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKd0jxvaec4ac858biseamk08md` (`parent_id`,`child_id`),
  KEY `FK96acexuks4xddp9ttflarfrsj` (`child_id`),
  CONSTRAINT `FKl7xk48fvsu110m6m9mdnxcnlh` FOREIGN KEY (`parent_id`) REFERENCES `core_user` (`id`),
  CONSTRAINT `FK85ou4i9jd5se62m8fkj2oc31q` FOREIGN KEY (`child_id`) REFERENCES `core_user` (`id`),
  CONSTRAINT `FK96acexuks4xddp9ttflarfrsj` FOREIGN KEY (`child_id`) REFERENCES `core_user` (`id`),
  CONSTRAINT `FKlm1hf0coyu8lv98owsmnjwpsu` FOREIGN KEY (`parent_id`) REFERENCES `core_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

INSERT IGNORE INTO `core_userassoc` (`type`, `id`, `association_date`, `parsed_content`, `resolution`, `sequence`, `version`, `child_id`, `parent_id`)
VALUES
	('A', 1, '2016-09-26 18:19:44', NULL, 'A', 0, 0, 'b9694d307c3445da8ddf186d76d6ad2f', '9c4281ca59d14f1aae5cd5118a9873e7'),
	('A', 2, '2016-09-26 18:19:44', NULL, 'A', 0, 0, 'b9694d307c3445da8ddf186d76d6ad2f', '9e7820dfb6164e26829be0bf54eaa873');

CREATE TABLE IF NOT EXISTS `core_authority` (
  `id` varchar(32) NOT NULL,
  `authority_state` varchar(20) DEFAULT NULL,
  `service_code` varchar(20) DEFAULT NULL,
  `service_extension` varchar(128) DEFAULT NULL,
  `user_id` varchar(32) DEFAULT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKo54iwdpgnish9myswe0r4h061` (`user_id`,`service_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT IGNORE INTO `core_authority` (`id`, `authority_state`, `service_code`, `service_extension`, `user_id`, `version`)
VALUES
	('ed84305e413145f49081c973ab4a847b', 'ACTIVE', 'ADMIN', 'READ,WRITE', '9c4281ca59d14f1aae5cd5118a9873e7', 0),
	('f8f0fc0ea9084c8da65afa0b8a044c4b', 'ACTIVE', 'USER', 'READ', '9e7820dfb6164e26829be0bf54eaa873', 0);

CREATE TABLE IF NOT EXISTS `core_secret` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `credential_state` varchar(20) DEFAULT NULL,
  `expiration_date` datetime DEFAULT NULL,
  `identity_key` varchar(40) DEFAULT NULL,
  `identity_secret` varchar(60) DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `version` int(11) NOT NULL,
  `identity_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKrgpxd0885bjgdrvr80bpi69c0` (`identity_key`),
  KEY `FKef4vc280o5sl3tkep2vxttvwh` (`identity_id`),
  CONSTRAINT `FKef4vc280o5sl3tkep2vxttvwh` FOREIGN KEY (`identity_id`) REFERENCES `core_identity` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

INSERT IGNORE INTO `core_secret` (`id`, `credential_state`, `expiration_date`, `identity_key`, `identity_secret`, `last_modified`, `version`, `identity_id`)
VALUES
	(1, 'ACTIVE', NULL, 'mauricio@iservport.com', '$2a$10$HobRJnGjHis6zV5Cv.MllunoxylMwQGpc.8FjyyzS299kKmHiJ9iu', NULL, 0, '1db6ebcadf5a4617b5e04d71b9a39804');
