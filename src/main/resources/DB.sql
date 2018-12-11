/*
SQLyog Community v13.1.1 (64 bit)
MySQL - 5.5.62 : Database - businessreg
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`businessreg` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `businessreg`;

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `status` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `role` */

insert  into `role`(`id`,`name`,`status`,`created_by`,`updated_by`,`created_on`,`updated_on`) values 
(1,'SUPER_ADMIN',1,1,1,'2018-11-25 20:06:56','2018-11-25 20:06:59'),
(2,'ADMIN',1,1,1,'2018-11-25 20:46:19','2018-11-25 20:46:21');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` char(20) NOT NULL,
  `last_name` char(20) DEFAULT NULL,
  `email_id` char(50) NOT NULL,
  `password` char(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `user` */

insert  into `user`(`id`,`first_name`,`last_name`,`email_id`,`password`,`status`,`created_by`,`updated_by`,`created_on`,`updated_on`) values 
(1,'test','ltest','mailstochandraprakash@gmail.com','$2a$10$NDpmGNrX06NW/C3.cFeU4uGOUaR7FLIPrKoqT6Zr5s1znt6tgiLQe',1,NULL,NULL,'2018-11-21 18:31:19','2018-11-21 18:31:19'),
(2,'test','ltest','mailstochandra.prakash@gmail.com','$2a$10$Rq5rGJrxtVbOdb6QPI1LSeqK5qbQctVmuYUCA9KwM33uMdlMSfaqO',1,NULL,NULL,'2018-11-21 18:31:57','2018-11-21 18:31:57');

/*Table structure for table `user_roles` */

DROP TABLE IF EXISTS `user_roles`;

CREATE TABLE `user_roles` (
  `user_id` bigint(20) NOT NULL,
  `roles_id` bigint(20) NOT NULL,
  UNIQUE KEY `UK_amwlmdeik2qdnksxgd566knop` (`roles_id`),
  KEY `FK55itppkw3i07do3h7qoclqd4k` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `user_roles` */

insert  into `user_roles`(`user_id`,`roles_id`) values 
(1,1),
(2,2);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
