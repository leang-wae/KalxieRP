USE `krp-base`;

CREATE TABLE `addon_account` (
	`name` varchar(60) NOT NULL,
	`label` varchar(255) NOT NULL,
	`shared` int(11) NOT NULL,

	PRIMARY KEY (`name`)
);

CREATE TABLE `addon_account_data` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`account_name` varchar(255) DEFAULT NULL,
	`money` double NOT NULL,
	`owner` varchar(255) DEFAULT NULL,

	PRIMARY KEY (`id`)
);
