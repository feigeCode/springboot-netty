/*
SQLyog Ultimate v12.08 (64 bit)
MySQL - 5.7.27-log : Database - springboot_netty
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`springboot_netty` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `springboot_netty`;

/*Table structure for table `category` */

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `id` varchar(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `is_delete` tinyint(1) DEFAULT '0',
  `gmt_create` datetime NOT NULL,
  `gmt_modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `category` */

insert  into `category`(`id`,`name`,`is_delete`,`gmt_create`,`gmt_modified`) values ('1','找女朋友',0,'2020-03-27 14:44:36','2020-03-27 14:44:39'),('2','失物招领',0,'2020-03-27 14:44:48','2020-03-27 14:44:52'),('3','找男朋友',0,'2020-03-27 14:45:09','2020-03-27 14:45:12');

/*Table structure for table `chat_msg` */

DROP TABLE IF EXISTS `chat_msg`;

CREATE TABLE `chat_msg` (
  `id` varchar(100) NOT NULL,
  `sender_id` varchar(100) NOT NULL,
  `receiver_id` varchar(100) NOT NULL,
  `msg` text NOT NULL,
  `sign_flag` tinyint(1) DEFAULT '0',
  `is_delete` tinyint(1) DEFAULT '0',
  `gmt_create` datetime NOT NULL,
  `gmt_modified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sender` (`sender_id`),
  KEY `receiver` (`receiver_id`),
  CONSTRAINT `receiver` FOREIGN KEY (`receiver_id`) REFERENCES `user` (`uid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `sender` FOREIGN KEY (`sender_id`) REFERENCES `user` (`uid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `chat_msg` */

/*Table structure for table `comment` */

DROP TABLE IF EXISTS `comment`;

CREATE TABLE `comment` (
  `id` varchar(100) NOT NULL,
  `dynamic_id` varchar(100) NOT NULL,
  `parent_id` varchar(100) DEFAULT NULL,
  `content` text NOT NULL,
  `nickname` varchar(20) NOT NULL,
  `is_delete` tinyint(1) DEFAULT '0',
  `gmt_create` datetime NOT NULL,
  `gmt_modified` datetime NOT NULL,
  `avatar` text NOT NULL,
  `to_nickname` varchar(20) DEFAULT NULL,
  `user_id` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dynamic` (`dynamic_id`),
  CONSTRAINT `dynamic` FOREIGN KEY (`dynamic_id`) REFERENCES `dynamic` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `comment` */

insert  into `comment`(`id`,`dynamic_id`,`parent_id`,`content`,`nickname`,`is_delete`,`gmt_create`,`gmt_modified`,`avatar`,`to_nickname`,`user_id`) values ('1257955277735469059','1257955207271161858',NULL,'啦啦啦啦啦','非哥',0,'2020-05-06 16:47:28','2020-05-06 16:47:28','https://wx.qlogo.cn/mmopen/vi_32/ElMYjXNGfoEE4axqtCFyDctBUNd3Om7x0giaPByXoybCDFYIVVMteAzlRmEdzAGch5ATViclYib28kjGWibdNdtghQ/132','null','o_6_25eSOORUoMlCHztvkZDOKTZ8'),('1257970066046066690','1257966964261789699',NULL,'哈哈哈','非哥',0,'2020-05-06 17:46:50','2020-05-06 17:46:50','https://wx.qlogo.cn/mmopen/vi_32/ElMYjXNGfoEE4axqtCFyDctBUNd3Om7x0giaPByXoybCDFYIVVMteAzlRmEdzAGch5ATViclYib28kjGWibdNdtghQ/132','null','o_6_25eSOORUoMlCHztvkZDOKTZ8');

/*Table structure for table `dynamic` */

DROP TABLE IF EXISTS `dynamic`;

CREATE TABLE `dynamic` (
  `id` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `is_draft` tinyint(1) DEFAULT '0',
  `is_audit` tinyint(1) DEFAULT '0',
  `user_id` varchar(100) NOT NULL,
  `school` varchar(20) DEFAULT NULL,
  `is_delete` tinyint(1) DEFAULT '0',
  `gmt_create` datetime NOT NULL,
  `gmt_modified` datetime NOT NULL,
  `forwarding` int(11) DEFAULT '0',
  `good` int(11) DEFAULT '0',
  `image` text,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`uid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `dynamic` */

insert  into `dynamic`(`id`,`content`,`is_draft`,`is_audit`,`user_id`,`school`,`is_delete`,`gmt_create`,`gmt_modified`,`forwarding`,`good`,`image`) values ('1257955207271161858','啦啦啦',0,0,'o_6_25eSOORUoMlCHztvkZDOKTZ8',NULL,0,'2020-05-06 16:47:28','2020-05-06 16:47:28',0,0,'https://www.pyfeige.com/group1/M00/00/00/rBEAAl6yXtiAHpHZAAAWMEtAw4k538.png,https://www.pyfeige.com/group1/M00/00/00/rBEAAl6yXtiAarTtAAAQg9ci7ck503.png'),('1257964984923693058','哈哈，终于把发动态写好了',0,0,'o_6_25eSOORUoMlCHztvkZDOKTZ8',NULL,0,'2020-05-06 17:23:05','2020-05-06 17:23:05',0,0,'https://www.pyfeige.com/group1/M00/00/00/rBEAAl6yXtiAHpHZAAAWMEtAw4k538.png,https://www.pyfeige.com/group1/M00/00/00/rBEAAl6yXtiAarTtAAAQg9ci7ck503.png'),('1257965372540297218','测试一下',0,0,'o_6_25eSOORUoMlCHztvkZDOKTZ8',NULL,0,'2020-05-06 17:23:05','2020-05-06 17:23:05',0,0,'https://www.pyfeige.com/group1/M00/00/00/rBEAAl6yXtiAHpHZAAAWMEtAw4k538.png,https://www.pyfeige.com/group1/M00/00/00/rBEAAl6yXtiAarTtAAAQg9ci7ck503.png'),('1257965848820211715','再测试',0,0,'o_6_25eSOORUoMlCHztvkZDOKTZ8',NULL,0,'2020-05-06 17:29:31','2020-05-06 17:29:31',0,0,'https://www.pyfeige.com/group1/M00/00/00/rBEAAl6yXtiAHpHZAAAWMEtAw4k538.png,https://www.pyfeige.com/group1/M00/00/00/rBEAAl6yXtiAarTtAAAQg9ci7ck503.png'),('1257966015346663426','哈哈哈哈',0,0,'o_6_25eSOORUoMlCHztvkZDOKTZ8',NULL,0,'2020-05-06 17:29:31','2020-05-06 17:29:31',0,0,'https://www.pyfeige.com/group1/M00/00/00/rBEAAl6yXtiAHpHZAAAWMEtAw4k538.png,https://www.pyfeige.com/group1/M00/00/00/rBEAAl6yXtiAarTtAAAQg9ci7ck503.png'),('1257966964261789699','刚刚',0,0,'o_6_25eSOORUoMlCHztvkZDOKTZ8',NULL,0,'2020-05-06 17:34:30','2020-05-06 21:47:42',0,1,'https://www.pyfeige.com/group1/M00/00/00/rBEAAl6yXtiAHpHZAAAWMEtAw4k538.png,https://www.pyfeige.com/group1/M00/00/00/rBEAAl6yXtiAarTtAAAQg9ci7ck503.png'),('1257966992380403715','现在',0,0,'o_6_25eSOORUoMlCHztvkZDOKTZ8',NULL,0,'2020-05-06 17:34:37','2020-05-06 21:47:04',0,1,'https://www.pyfeige.com/group1/M00/00/00/rBEAAl6yXtiAHpHZAAAWMEtAw4k538.png,https://www.pyfeige.com/group1/M00/00/00/rBEAAl6yXtiAarTtAAAQg9ci7ck503.png');

/*Table structure for table `friend` */

DROP TABLE IF EXISTS `friend`;

CREATE TABLE `friend` (
  `id` varchar(100) NOT NULL,
  `my_id` varchar(100) NOT NULL,
  `teacher_id` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `my_id` (`my_id`),
  KEY `teacher_id` (`teacher_id`),
  CONSTRAINT `my_id` FOREIGN KEY (`my_id`) REFERENCES `user` (`uid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `user` (`uid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `friend` */

/*Table structure for table `introduce` */

DROP TABLE IF EXISTS `introduce`;

CREATE TABLE `introduce` (
  `id` varchar(100) NOT NULL,
  `certificate` varchar(100) NOT NULL,
  `self_introduce` varchar(200) NOT NULL,
  `other` varchar(200) DEFAULT NULL,
  `is_delete` tinyint(1) DEFAULT '0',
  `gmt_create` datetime NOT NULL,
  `gmt_modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `introduce` */

insert  into `introduce`(`id`,`certificate`,`self_introduce`,`other`,`is_delete`,`gmt_create`,`gmt_modified`) values ('1','https://www.pyfeige.com/static/img/login.png','ddd ','dd',0,'2020-04-22 18:15:43','2020-04-22 18:15:46');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `uid` varchar(100) NOT NULL,
  `nickname` varchar(20) NOT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `sex` tinyint(1) DEFAULT '1',
  `age` int(11) DEFAULT '0',
  `detailed_address` varchar(100) DEFAULT NULL,
  `school` varchar(20) DEFAULT NULL,
  `is_delete` tinyint(1) DEFAULT '0',
  `gmt_create` datetime NOT NULL,
  `gmt_modified` datetime NOT NULL,
  `avatar` varchar(1000) NOT NULL,
  `introduce_id` varchar(100) DEFAULT 'null',
  PRIMARY KEY (`uid`),
  KEY `introduce_id` (`introduce_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`uid`,`nickname`,`phone`,`email`,`sex`,`age`,`detailed_address`,`school`,`is_delete`,`gmt_create`,`gmt_modified`,`avatar`,`introduce_id`) values ('o_6_25eSOORUoMlCHztvkZDOKTZ8','非哥',NULL,NULL,0,0,'YunnanWenshan',NULL,0,'2020-05-04 23:32:43','2020-05-04 23:32:43','https://wx.qlogo.cn/mmopen/vi_32/ElMYjXNGfoEE4axqtCFyDctBUNd3Om7x0giaPByXoybCDFYIVVMteAzlRmEdzAGch5ATViclYib28kjGWibdNdtghQ/132','1');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
