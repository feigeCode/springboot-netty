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

insert  into `chat_msg`(`id`,`sender_id`,`receiver_id`,`msg`,`sign_flag`,`is_delete`,`gmt_create`,`gmt_modified`) values ('1258299632228769794','oQyNP5ZQgz7tvjGRlLl0HXJZ6tzA','o_6_25eSOORUoMlCHztvkZDOKTZ8','就哈哈哈哈',1,0,'2020-05-07 15:36:25','2020-05-07 15:36:25'),('1258299633596112898','oQyNP5ZQgz7tvjGRlLl0HXJZ6tzA','o_6_25eSOORUoMlCHztvkZDOKTZ8','就哈哈哈哈',1,0,'2020-05-07 15:36:25','2020-05-07 15:36:25'),('1258299992481734658','oQyNP5ZQgz7tvjGRlLl0HXJZ6tzA','o_6_25eSOORUoMlCHztvkZDOKTZ8','13767594',1,0,'2020-05-07 15:37:50','2020-05-07 15:37:50'),('1258299994482417666','oQyNP5ZQgz7tvjGRlLl0HXJZ6tzA','o_6_25eSOORUoMlCHztvkZDOKTZ8','13767594',1,0,'2020-05-07 15:37:51','2020-05-07 15:37:51'),('1258300029785874435','oQyNP5ZQgz7tvjGRlLl0HXJZ6tzA','o_6_25eSOORUoMlCHztvkZDOKTZ8','我没写你会',1,0,'2020-05-07 15:37:59','2020-05-07 15:37:59'),('1258300031362932739','oQyNP5ZQgz7tvjGRlLl0HXJZ6tzA','o_6_25eSOORUoMlCHztvkZDOKTZ8','我没写你会',1,0,'2020-05-07 15:38:00','2020-05-07 15:38:00'),('1258332492126023682','o_6_25eSOORUoMlCHztvkZDOKTZ8','oQyNP5ZQgz7tvjGRlLl0HXJZ6tzA','哈哈哈哈',0,0,'2020-05-07 17:46:59','2020-05-07 17:46:59'),('1258403271001870339','o_6_25eSOORUoMlCHztvkZDOKTZ8','oQyNP5ZQgz7tvjGRlLl0HXJZ6tzA','哈哈哈',0,0,'2020-05-07 22:28:14','2020-05-07 22:28:14'),('1258403272004308994','o_6_25eSOORUoMlCHztvkZDOKTZ8','oQyNP5ZQgz7tvjGRlLl0HXJZ6tzA','哈哈哈',0,0,'2020-05-07 22:28:14','2020-05-07 22:28:14'),('1258403298424229891','o_6_25eSOORUoMlCHztvkZDOKTZ8','oQyNP5ZQgz7tvjGRlLl0HXJZ6tzA','啦啦啦啦啦',0,0,'2020-05-07 22:28:21','2020-05-07 22:28:21'),('1258403299405697027','o_6_25eSOORUoMlCHztvkZDOKTZ8','oQyNP5ZQgz7tvjGRlLl0HXJZ6tzA','啦啦啦啦啦',0,0,'2020-05-07 22:28:21','2020-05-07 22:28:21'),('1258403322176573443','o_6_25eSOORUoMlCHztvkZDOKTZ8','oQyNP5ZQgz7tvjGRlLl0HXJZ6tzA','呵呵红红火火',0,0,'2020-05-07 22:28:26','2020-05-07 22:28:26'),('1258403323090931715','o_6_25eSOORUoMlCHztvkZDOKTZ8','oQyNP5ZQgz7tvjGRlLl0HXJZ6tzA','呵呵红红火火',0,0,'2020-05-07 22:28:26','2020-05-07 22:28:26'),('1258403353822597122','o_6_25eSOORUoMlCHztvkZDOKTZ8','oQyNP5ZQgz7tvjGRlLl0HXJZ6tzA','啊啊啊啊啊',0,0,'2020-05-07 22:28:34','2020-05-07 22:28:34'),('1258403354544017411','o_6_25eSOORUoMlCHztvkZDOKTZ8','oQyNP5ZQgz7tvjGRlLl0HXJZ6tzA','啊啊啊啊啊',0,0,'2020-05-07 22:28:34','2020-05-07 22:28:34'),('1258403376136294402','o_6_25eSOORUoMlCHztvkZDOKTZ8','oQyNP5ZQgz7tvjGRlLl0HXJZ6tzA','啦咯啦咯啦咯',0,0,'2020-05-07 22:28:39','2020-05-07 22:28:39'),('1258403377235202050','o_6_25eSOORUoMlCHztvkZDOKTZ8','oQyNP5ZQgz7tvjGRlLl0HXJZ6tzA','啦咯啦咯啦咯',0,0,'2020-05-07 22:28:39','2020-05-07 22:28:39'),('1258403397837623299','o_6_25eSOORUoMlCHztvkZDOKTZ8','oQyNP5ZQgz7tvjGRlLl0HXJZ6tzA','红红火火恍恍惚惚',0,0,'2020-05-07 22:28:44','2020-05-07 22:28:44'),('1258403398848450563','o_6_25eSOORUoMlCHztvkZDOKTZ8','oQyNP5ZQgz7tvjGRlLl0HXJZ6tzA','红红火火恍恍惚惚',0,0,'2020-05-07 22:28:44','2020-05-07 22:28:44'),('1258403420306509827','o_6_25eSOORUoMlCHztvkZDOKTZ8','oQyNP5ZQgz7tvjGRlLl0HXJZ6tzA','啦啦啦啦啦啦啦啦',0,0,'2020-05-07 22:28:50','2020-05-07 22:28:50'),('1258403422474964994','o_6_25eSOORUoMlCHztvkZDOKTZ8','oQyNP5ZQgz7tvjGRlLl0HXJZ6tzA','啦啦啦啦啦啦啦啦',0,0,'2020-05-07 22:28:50','2020-05-07 22:28:50'),('1258403446072119299','o_6_25eSOORUoMlCHztvkZDOKTZ8','oQyNP5ZQgz7tvjGRlLl0HXJZ6tzA','哈哈哈哈',0,0,'2020-05-07 22:28:56','2020-05-07 22:28:56'),('1258403447233941507','o_6_25eSOORUoMlCHztvkZDOKTZ8','oQyNP5ZQgz7tvjGRlLl0HXJZ6tzA','哈哈哈哈',0,0,'2020-05-07 22:28:56','2020-05-07 22:28:56'),('1258403472773058562','o_6_25eSOORUoMlCHztvkZDOKTZ8','oQyNP5ZQgz7tvjGRlLl0HXJZ6tzA','呵呵哈哈哈',0,0,'2020-05-07 22:29:02','2020-05-07 22:29:02'),('1258403474043932675','o_6_25eSOORUoMlCHztvkZDOKTZ8','oQyNP5ZQgz7tvjGRlLl0HXJZ6tzA','呵呵哈哈哈',0,0,'2020-05-07 22:29:02','2020-05-07 22:29:02'),('1258405015165440003','o_6_25eSOORUoMlCHztvkZDOKTZ8','oQyNP5ZQgz7tvjGRlLl0HXJZ6tzA','哒哒哒哒哒哒多多多多多',0,0,'2020-05-07 22:35:10','2020-05-07 22:35:10'),('1258429479315902466','o_6_25eSOORUoMlCHztvkZDOKTZ8','oQyNP5ZQgz7tvjGRlLl0HXJZ6tzA','顶顶顶顶',0,0,'2020-05-08 00:12:22','2020-05-08 00:12:22'),('1258430209837830147','o_6_25eSOORUoMlCHztvkZDOKTZ8','oQyNP5ZQgz7tvjGRlLl0HXJZ6tzA','顶顶顶顶',0,0,'2020-05-08 00:15:17','2020-05-08 00:15:17'),('1258431105489506307','o_6_25eSOORUoMlCHztvkZDOKTZ8','oQyNP5ZQgz7tvjGRlLl0HXJZ6tzA','哈哈哈哈哈',0,0,'2020-05-08 00:18:50','2020-05-08 00:18:50'),('1258432967701762050','o_6_25eSOORUoMlCHztvkZDOKTZ8','oQyNP5ZQgz7tvjGRlLl0HXJZ6tzA','顶顶顶顶',0,0,'2020-05-08 00:26:14','2020-05-08 00:26:14'),('1258432982440546307','o_6_25eSOORUoMlCHztvkZDOKTZ8','oQyNP5ZQgz7tvjGRlLl0HXJZ6tzA','灌灌灌灌',0,0,'2020-05-08 00:26:18','2020-05-08 00:26:18'),('1260127922774171650','o_6_25eSOORUoMlCHztvkZDOKTZ8','oQyNP5ZQgz7tvjGRlLl0HXJZ6tzA','哈哈哈',0,0,'2020-05-12 16:41:23','2020-05-12 16:41:23'),('1260127945930924034','o_6_25eSOORUoMlCHztvkZDOKTZ8','oQyNP5ZQgz7tvjGRlLl0HXJZ6tzA','哈哈',0,0,'2020-05-12 16:41:29','2020-05-12 16:41:29'),('1260128010888110082','o_6_25eSOORUoMlCHztvkZDOKTZ8','oQyNP5ZQgz7tvjGRlLl0HXJZ6tzA','哈哈哈',0,0,'2020-05-12 16:41:44','2020-05-12 16:41:44'),('1260128192107208706','o_6_25eSOORUoMlCHztvkZDOKTZ8','oQyNP5ZQgz7tvjGRlLl0HXJZ6tzA','哈哈哈哈',0,0,'2020-05-12 16:42:27','2020-05-12 16:42:27'),('1260128208821510147','o_6_25eSOORUoMlCHztvkZDOKTZ8','oQyNP5ZQgz7tvjGRlLl0HXJZ6tzA','啦啦啦啦啦',0,0,'2020-05-12 16:42:31','2020-05-12 16:42:31'),('1260128731305959427','o_6_25eSOORUoMlCHztvkZDOKTZ8','oQyNP5ZQgz7tvjGRlLl0HXJZ6tzA','嘿嘿嘿嘿',0,0,'2020-05-12 16:44:36','2020-05-12 16:44:36');

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

insert  into `comment`(`id`,`dynamic_id`,`parent_id`,`content`,`nickname`,`is_delete`,`gmt_create`,`gmt_modified`,`avatar`,`to_nickname`,`user_id`) values ('1257955277735469059','1257955207271161858',NULL,'啦啦啦啦啦','非哥',0,'2020-05-06 16:47:28','2020-05-06 16:47:28','https://wx.qlogo.cn/mmopen/vi_32/ElMYjXNGfoEE4axqtCFyDctBUNd3Om7x0giaPByXoybCDFYIVVMteAzlRmEdzAGch5ATViclYib28kjGWibdNdtghQ/132','null','o_6_25eSOORUoMlCHztvkZDOKTZ8'),('1257970066046066690','1257966964261789699',NULL,'哈哈哈','非哥',0,'2020-05-06 17:46:50','2020-05-06 17:46:50','https://wx.qlogo.cn/mmopen/vi_32/ElMYjXNGfoEE4axqtCFyDctBUNd3Om7x0giaPByXoybCDFYIVVMteAzlRmEdzAGch5ATViclYib28kjGWibdNdtghQ/132','null','o_6_25eSOORUoMlCHztvkZDOKTZ8'),('1258040064605278210','1257966992380403715',NULL,'搜啊UI和我女年底is看剧v','haha~',0,'2020-05-06 22:24:59','2020-05-06 22:24:59','https://wx.qlogo.cn/mmopen/vi_32/wADIYVRGcBjicPLbhYr9oxEsWB6KfZqywOdP2ibyEKxpYq8KtpBrV3KLrEOib84cAMs1UYCibW4ibgXhko9bEFZkHDA/132','null','undefined'),('1258047156590333955','1257966992380403715','1258040064605278210','啦啦啦啦','非哥',0,'2020-05-06 22:53:10','2020-05-06 22:53:10','https://wx.qlogo.cn/mmopen/vi_32/ElMYjXNGfoEE4axqtCFyDctBUNd3Om7x0giaPByXoybCDFYIVVMteAzlRmEdzAGch5ATViclYib28kjGWibdNdtghQ/132','haha~','o_6_25eSOORUoMlCHztvkZDOKTZ8'),('1258049382952062978','1258041520603385859',NULL,'不健康','浮云白衣',0,'2020-05-06 23:02:00','2020-05-06 23:02:00','https://wx.qlogo.cn/mmopen/vi_32/fqrAbwKqVv4n9z3XwS1hQe9IYXFnRddRyFSOicT9UxFVN6HQKicKCUWicv9uWF6usKy78A9QxatI54bWs4REw6kJA/132','null','undefined'),('1258049528540549122','1257966992380403715',NULL,'火炬计划','浮云白衣',0,'2020-05-06 23:02:35','2020-05-06 23:02:35','https://wx.qlogo.cn/mmopen/vi_32/fqrAbwKqVv4n9z3XwS1hQe9IYXFnRddRyFSOicT9UxFVN6HQKicKCUWicv9uWF6usKy78A9QxatI54bWs4REw6kJA/132','null','undefined'),('1258293488496181251','1258292605792321538',NULL,'哈哈哈哈哈哈','非哥',0,'2020-05-07 15:12:00','2020-05-07 15:12:00','https://wx.qlogo.cn/mmopen/vi_32/ElMYjXNGfoEE4axqtCFyDctBUNd3Om7x0giaPByXoybCDFYIVVMteAzlRmEdzAGch5ATViclYib28kjGWibdNdtghQ/132','null','o_6_25eSOORUoMlCHztvkZDOKTZ8'),('1258293537720532995','1258292605792321538',NULL,'摄入不会','非哥',0,'2020-05-07 15:12:12','2020-05-07 15:12:12','https://wx.qlogo.cn/mmopen/vi_32/ElMYjXNGfoEE4axqtCFyDctBUNd3Om7x0giaPByXoybCDFYIVVMteAzlRmEdzAGch5ATViclYib28kjGWibdNdtghQ/132','null','o_6_25eSOORUoMlCHztvkZDOKTZ8'),('1258299340510732291','1257955207271161858','1257955277735469059','叫姐姐不不不','haha~',0,'2020-05-07 15:35:15','2020-05-07 15:35:15','https://wx.qlogo.cn/mmopen/vi_32/wADIYVRGcBjicPLbhYr9oxEsWB6KfZqywOdP2ibyEKxpYq8KtpBrV3KLrEOib84cAMs1UYCibW4ibgXhko9bEFZkHDA/132','非哥','oQyNP5ZQgz7tvjGRlLl0HXJZ6tzA'),('1258402897666871299','1258402658759315458',NULL,'哈哈哈哈','非哥',0,'2020-05-07 22:26:45','2020-05-07 22:26:45','https://wx.qlogo.cn/mmopen/vi_32/ElMYjXNGfoEE4axqtCFyDctBUNd3Om7x0giaPByXoybCDFYIVVMteAzlRmEdzAGch5ATViclYib28kjGWibdNdtghQ/132','null','o_6_25eSOORUoMlCHztvkZDOKTZ8'),('1258403013391912962','1258041520603385859','1258049382952062978','哈哈哈','非哥',0,'2020-05-07 22:27:13','2020-05-07 22:27:13','https://wx.qlogo.cn/mmopen/vi_32/ElMYjXNGfoEE4axqtCFyDctBUNd3Om7x0giaPByXoybCDFYIVVMteAzlRmEdzAGch5ATViclYib28kjGWibdNdtghQ/132','浮云白衣','o_6_25eSOORUoMlCHztvkZDOKTZ8');

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

insert  into `dynamic`(`id`,`content`,`is_draft`,`is_audit`,`user_id`,`school`,`is_delete`,`gmt_create`,`gmt_modified`,`forwarding`,`good`,`image`) values ('1257955207271161858','啦啦啦',0,0,'o_6_25eSOORUoMlCHztvkZDOKTZ8',NULL,0,'2020-05-06 16:47:28','2020-05-06 16:47:28',0,0,'https://www.pyfeige.com/group1/M00/00/00/rBEAAl6yXtiAHpHZAAAWMEtAw4k538.png,https://www.pyfeige.com/group1/M00/00/00/rBEAAl6yXtiAarTtAAAQg9ci7ck503.png'),('1257964984923693058','哈哈，终于把发动态写好了',0,0,'o_6_25eSOORUoMlCHztvkZDOKTZ8',NULL,0,'2020-05-06 17:23:05','2020-05-06 17:23:05',0,0,'https://www.pyfeige.com/group1/M00/00/00/rBEAAl6yXtiAHpHZAAAWMEtAw4k538.png,https://www.pyfeige.com/group1/M00/00/00/rBEAAl6yXtiAarTtAAAQg9ci7ck503.png'),('1257965372540297218','测试一下',0,0,'o_6_25eSOORUoMlCHztvkZDOKTZ8',NULL,0,'2020-05-06 17:23:05','2020-05-06 17:23:05',0,0,'https://www.pyfeige.com/group1/M00/00/00/rBEAAl6yXtiAHpHZAAAWMEtAw4k538.png,https://www.pyfeige.com/group1/M00/00/00/rBEAAl6yXtiAarTtAAAQg9ci7ck503.png'),('1257965848820211715','再测试',0,0,'o_6_25eSOORUoMlCHztvkZDOKTZ8',NULL,0,'2020-05-06 17:29:31','2020-05-06 17:29:31',0,0,'https://www.pyfeige.com/group1/M00/00/00/rBEAAl6yXtiAHpHZAAAWMEtAw4k538.png,https://www.pyfeige.com/group1/M00/00/00/rBEAAl6yXtiAarTtAAAQg9ci7ck503.png'),('1257966015346663426','哈哈哈哈',0,0,'o_6_25eSOORUoMlCHztvkZDOKTZ8',NULL,0,'2020-05-06 17:29:31','2020-05-06 17:29:31',0,0,'https://www.pyfeige.com/group1/M00/00/00/rBEAAl6yXtiAHpHZAAAWMEtAw4k538.png,https://www.pyfeige.com/group1/M00/00/00/rBEAAl6yXtiAarTtAAAQg9ci7ck503.png'),('1257966964261789699','刚刚',0,0,'o_6_25eSOORUoMlCHztvkZDOKTZ8',NULL,0,'2020-05-06 17:34:30','2020-05-06 21:47:42',0,1,'https://www.pyfeige.com/group1/M00/00/00/rBEAAl6yXtiAHpHZAAAWMEtAw4k538.png,https://www.pyfeige.com/group1/M00/00/00/rBEAAl6yXtiAarTtAAAQg9ci7ck503.png'),('1257966992380403715','现在',0,0,'o_6_25eSOORUoMlCHztvkZDOKTZ8',NULL,0,'2020-05-06 17:34:37','2020-05-06 23:02:27',0,3,'https://www.pyfeige.com/group1/M00/00/00/rBEAAl6yXtiAHpHZAAAWMEtAw4k538.png,https://www.pyfeige.com/group1/M00/00/00/rBEAAl6yXtiAarTtAAAQg9ci7ck503.png'),('1258041378835910658','哈哈哈哈哈哈',0,0,'o_6_25eSOORUoMlCHztvkZDOKTZ8',NULL,0,'2020-05-06 22:30:12','2020-05-06 22:30:12',0,0,'https://www.pyfeige.com/group1/M00/00/00/rBEAAl6yySCAaXzNAAAfkbrr43M460.png'),('1258041520603385859','坎坎坷坷扩',0,0,'o_6_25eSOORUoMlCHztvkZDOKTZ8',NULL,0,'2020-05-06 22:30:46','2020-05-07 22:27:23',0,2,'https://www.pyfeige.com/group1/M00/00/00/rBEAAl6yyfSATNBYAAAfkbrr43M173.png'),('1258266675120230402','哈哈哈哈哈哈哈',0,0,'o_6_25eSOORUoMlCHztvkZDOKTZ8',NULL,0,'2020-05-07 13:25:27','2020-05-07 22:27:32',0,1,'https://www.pyfeige.com/group1/M00/00/00/rBEAAl6yyhaAYQE_AAAYM6zmHQE986.png'),('1258276121225498627','啦啦啦啦啦',0,0,'o_6_25eSOORUoMlCHztvkZDOKTZ8',NULL,0,'2020-05-07 14:02:59','2020-05-07 14:02:59',0,0,'https://www.pyfeige.com/group1/M00/00/00/rBEAAl6zotOAG2DvAABlB-Nol8o302.jpg,https://www.pyfeige.com/group1/M00/00/00/rBEAAl6zotOAXeAuAAN9LZkLyJU772.jpg,https://www.pyfeige.com/group1/M00/00/00/rBEAAl6zotOAF3MFAAJzD3s6bu8557.jpg,https://www.pyfeige.com/group1/M00/00/00/rBEAAl6zotOARCtJAABGAXhesaE823.jpg'),('1258287511185162242','得到的',0,0,'o_6_25eSOORUoMlCHztvkZDOKTZ8',NULL,0,'2020-05-07 14:48:15','2020-05-07 14:48:15',0,0,'https://www.pyfeige.com/group1/M00/00/00/rBEAAl6zry6AKwyeAAJzD3s6bu8914.jpg'),('1258292234252484610','分别给他人',0,0,'o_6_25eSOORUoMlCHztvkZDOKTZ8',NULL,0,'2020-05-07 15:07:01','2020-05-07 15:07:01',0,0,'https://www.pyfeige.com/group1/M00/00/00/rBEAAl6zs2-ABIIWAAIhUe5uig8255.jpg'),('1258292605792321538','的办法当然不会',0,0,'o_6_25eSOORUoMlCHztvkZDOKTZ8',NULL,0,'2020-05-07 15:08:29','2020-05-07 15:11:51',0,1,'https://www.pyfeige.com/group1/M00/00/00/rBEAAl6zs5WAMB9lAAGZQkUXqtM110.jpg'),('1258298404023312386','',0,0,'oQyNP5ZQgz7tvjGRlLl0HXJZ6tzA',NULL,0,'2020-05-07 15:31:32','2020-05-07 15:32:47',0,1,'https://www.pyfeige.com/group1/M00/00/00/rBEAAl6zuS-AWwwjAAGZQkUXqtM115.jpg,https://www.pyfeige.com/group1/M00/00/00/rBEAAl6zuS-AUbWRAAAgD3FnKJM475.png,https://www.pyfeige.com/group1/M00/00/00/rBEAAl6zuS-ALk7XAAFhd1lAFVw439.jpg,https://www.pyfeige.com/group1/M00/00/00/rBEAAl6zuS-ANLQ2AAIhUe5uig8096.jpg'),('1258299464427249666','几句话vVB你',0,0,'oQyNP5ZQgz7tvjGRlLl0HXJZ6tzA',NULL,0,'2020-05-07 15:35:45','2020-05-07 15:35:45',0,0,'https://www.pyfeige.com/group1/M00/00/00/rBEAAl6zuVSAN3adAAGZQkUXqtM483.jpg'),('1258333694565871618','哈哈哈哈哈哈',0,0,'o_6_25eSOORUoMlCHztvkZDOKTZ8',NULL,0,'2020-05-07 17:51:46','2020-05-10 14:00:44',0,1,'https://www.pyfeige.com/group1/M00/00/00/rBEAAl6ztuuAfMT5AAGZQkUXqtM137.jpg'),('1258333815764480003','哈哈哈',0,0,'o_6_25eSOORUoMlCHztvkZDOKTZ8',NULL,0,'2020-05-07 17:52:15','2020-05-07 17:52:15',0,0,NULL),('1258333895674359810','哈哈哈',0,0,'o_6_25eSOORUoMlCHztvkZDOKTZ8',NULL,0,'2020-05-07 17:52:34','2020-05-07 17:52:34',0,0,'https://www.pyfeige.com/group1/M00/00/00/rBEAAl6z2k-AeU33AABGAXhesaE576.jpg'),('1258336042147180547','反反复复',0,0,'o_6_25eSOORUoMlCHztvkZDOKTZ8',NULL,0,'2020-05-07 18:01:05','2020-05-07 18:01:05',0,0,NULL),('1258338651771826179','顶顶顶顶',0,0,'o_6_25eSOORUoMlCHztvkZDOKTZ8',NULL,0,'2020-05-07 18:11:28','2020-05-07 18:11:28',0,0,'https://www.pyfeige.com/group1/M00/00/00/rBEAAl6z3GKATxDtAABlB-Nol8o370.jpg'),('1258388979733078019','',0,0,'o_6_25eSOORUoMlCHztvkZDOKTZ8',NULL,0,'2020-05-07 21:31:27','2020-05-07 21:31:27',0,0,'https://www.pyfeige.com/group1/M00/00/00/rBEAAl60CXyAXY7_AAN9LZkLyJU672.jpg,https://www.pyfeige.com/group1/M00/00/00/rBEAAl60DHqAInjKAABlB-Nol8o004.jpg,https://www.pyfeige.com/group1/M00/00/00/rBEAAl60DHuAAPKmAABGAXhesaE164.jpg,https://www.pyfeige.com/group1/M00/00/00/rBEAAl60DHyAAtKqAAJzD3s6bu8649.jpg,https://www.pyfeige.com/group1/M00/00/00/rBEAAl60DHyADOZvAAN9LZkLyJU985.jpg'),('1258390018376966146','哈哈哈哈哈哈哈',0,0,'o_6_25eSOORUoMlCHztvkZDOKTZ8',NULL,0,'2020-05-07 21:35:34','2020-05-07 21:35:34',0,0,'https://www.pyfeige.com/group1/M00/00/00/rBEAAl60Da-Ae9fbAABlB-Nol8o978.jpg,https://www.pyfeige.com/group1/M00/00/00/rBEAAl60Da-APau_AABGAXhesaE875.jpg,https://www.pyfeige.com/group1/M00/00/00/rBEAAl60DbCAMybfAAJzD3s6bu8088.jpg,https://www.pyfeige.com/group1/M00/00/00/rBEAAl60DbCABV9qAAN9LZkLyJU550.jpg,https://www.pyfeige.com/group1/M00/00/00/rBEAAl60DqWAb7paAABlB-Nol8o059.jpg,https://www.pyfeige.com/group1/M00/00/00/rBEAAl60DqWAeP9YAABGAXhesaE768.jpg,https://www.pyfeige.com/group1/M00/00/00/rBEAAl60DqaAVW6vAAJzD3s6bu8062.jpg,https://www.pyfeige.com/group1/M00/00/00/rBEAAl60DqaAV7WKAAN9LZkLyJU707.jpg'),('1258390430953873411','嘎嘎嘎嘎嘎过过过过过过',0,0,'o_6_25eSOORUoMlCHztvkZDOKTZ8',NULL,0,'2020-05-07 21:37:13','2020-05-07 21:37:13',0,0,'https://www.pyfeige.com/group1/M00/00/00/rBEAAl60DwiABF6sAABlB-Nol8o112.jpg'),('1258397516202872834','反反复复付付付付付付付付',0,0,'o_6_25eSOORUoMlCHztvkZDOKTZ8',NULL,0,'2020-05-07 22:05:22','2020-05-07 22:05:22',0,0,'https://www.pyfeige.com/group1/M00/00/00/rBEAAl60FZ-AcRSHAABlB-Nol8o273.jpg,https://www.pyfeige.com/group1/M00/00/00/rBEAAl60FaGALIL9AABGAXhesaE406.jpg,https://www.pyfeige.com/group1/M00/00/00/rBEAAl60FaGAMlqiAAJzD3s6bu8861.jpg,https://www.pyfeige.com/group1/M00/00/00/rBEAAl60FaKAMRABAAN9LZkLyJU191.jpg'),('1258400042230845443','',0,0,'o_6_25eSOORUoMlCHztvkZDOKTZ8',NULL,0,'2020-05-07 22:15:24','2020-05-07 22:15:24',0,0,'https://www.pyfeige.com/group1/M00/00/00/rBEAAl60F_uAbJKNAABlB-Nol8o668.jpg,https://www.pyfeige.com/group1/M00/00/00/rBEAAl60F_uAQFsBAABGAXhesaE602.jpg,https://www.pyfeige.com/group1/M00/00/00/rBEAAl60F_uAKeKaAAJzD3s6bu8075.jpg,https://www.pyfeige.com/group1/M00/00/00/rBEAAl60F_yABBY7AAN9LZkLyJU299.jpg'),('1258402658759315458','哈哈哈哈',0,0,'o_6_25eSOORUoMlCHztvkZDOKTZ8',NULL,0,'2020-05-07 22:25:48','2020-05-07 22:27:42',0,1,'https://www.pyfeige.com/group1/M00/00/00/rBEAAl60GmWAMn5SAAF0tF8Kb-M521.jpg,https://www.pyfeige.com/group1/M00/00/00/rBEAAl60GmaAMmyEAAJbrSOUROo383.jpg,https://www.pyfeige.com/group1/M00/00/00/rBEAAl60GmeAW9gzAAGmmP1HC4U741.jpg,https://www.pyfeige.com/group1/M00/00/00/rBEAAl60GmiAdiNlAAGdBAndzNE452.jpg,https://www.pyfeige.com/group1/M00/00/00/rBEAAl60GmiAZ5VZAAGdeegc8fs242.jpg,https://www.pyfeige.com/group1/M00/00/00/rBEAAl60GmmACw79AAHp2uqOuaA346.jpg,https://www.pyfeige.com/group1/M00/00/00/rBEAAl60GmqAA8Q7AAH_LoWKuQQ156.jpg,https://www.pyfeige.com/group1/M00/00/00/rBEAAl60GmuAA8pKAAJreCGsqKY647.jpg,https://www.pyfeige.com/group1/M00/00/00/rBEAAl60GmyAFbpRAAR0v-MtWSs387.jpg');

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

insert  into `friend`(`id`,`my_id`,`teacher_id`) values ('1','oQyNP5ZQgz7tvjGRlLl0HXJZ6tzA','o_6_25eSOORUoMlCHztvkZDOKTZ8'),('2','o_6_25eSOORUoMlCHztvkZDOKTZ8','oQyNP5ZQgz7tvjGRlLl0HXJZ6tzA');

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

/*Table structure for table `post` */

DROP TABLE IF EXISTS `post`;

CREATE TABLE `post` (
  `id` varchar(100) COLLATE utf8_bin NOT NULL,
  `category` varchar(100) COLLATE utf8_bin NOT NULL,
  `title` varchar(50) COLLATE utf8_bin NOT NULL,
  `content` text COLLATE utf8_bin NOT NULL,
  `author` varchar(20) COLLATE utf8_bin NOT NULL,
  `good` int(11) NOT NULL DEFAULT '0',
  `gmt_create` datetime NOT NULL,
  `gmt_modified` datetime NOT NULL,
  `is_delete` tinyint(1) DEFAULT '0',
  `view` int(11) DEFAULT '0',
  `img_addr` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `post` */

insert  into `post`(`id`,`category`,`title`,`content`,`author`,`good`,`gmt_create`,`gmt_modified`,`is_delete`,`view`,`img_addr`) values ('1260073581442846722','随笔','哈哈哈哈','<p>前几天看了一场电视直播求职节目，其中的一位女性求职者令我印象深刻：本科、硕士都是物理学专业，硕士是985院校。毕业后在一家大型教育培训机构当物理老师，每周只上星期六、星期天两天，可以说是钱多事少时间多。</p>\r\n<p>&nbsp;</p>\r\n<p>离职原因是跟小朋友们上课，沟通的比较少，这次想找一份人事工作。</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>就这样放弃了7年的专业确实是有点可惜，但实在不喜欢啊。现在放弃只是浪费了7年的时间，如果一直坚持下去就是一辈子，想想如果做一个自己不喜欢的事情一辈子其实蛮痛苦的。</p>\r\n<p>&nbsp;</p>\r\n<p>主持人继续问：那你怎么知道人事是你喜欢的工作？</p>\r\n<p>&nbsp;</p>\r\n<p>求职者回答说：我用的是排除法，把我不喜欢的工作大类除去，剩下行政、人事，我觉得人事挺适合我的。所以这次求职的是人事工作。</p>\r\n<p>&nbsp;</p>\r\n<p>看了上面一段文字描述，朋友们，你们是不是也跟主持人一样对这位求职者感到些惋惜。如果她在大学专业上的选择能再慎重些，或者在读研究生时考虑改为其他她感兴趣的专业，或许，能够节约一些时间成本。</p>\r\n<p>&nbsp;</p>\r\n<p>有没有什么办法，能在高考选择大学专业的时候就可以一步到位，选择适合自己的专业，让大学生毕业后的职业生涯规划少走弯路呢？</p>\r\n<p>&nbsp;</p>\r\n<p>有的，方法就是职业心理测试。职业心理测试作为企业招聘的一个重要流程，在人才选拔上发挥很重要的作用。求职者也可以利用心理测试作为职业生涯规划的重要手段。职业心理测试能前置到高考填志愿选专业的话，会使很多人少走很多弯路。</p>\r\n<p>                 </p>\r\n<p><img src=\"https://ossimg.xinli001.com/20200512/25b7809853baa1d8b05ba8cc35aeb6ba.png?x-oss-process=image/quality,Q_80\" referrerpolicy=\"no-referrer\" alt=\"img\"></p>\r\n<p>&nbsp;</p>\r\n<p><strong>为什么提倡高考填志愿选专业时做一下职业心理测试</strong></p>\r\n<p>**\r\n**</p>\r\n<p>现在高中生填志愿表时一小半同学会有自己明确的目标，知道自己喜欢什么，适合什么，在填报志愿的时候是很明确的。</p>\r\n<p>&nbsp;</p>\r\n<p>大概一半的同学会根据目前比较热门的专业来填报志愿。因为填一个比较热门的专业意味着较高的就业率；同级别大学毕业生中比较热门的专业的学生会拿到更有竞争力的薪资。</p>\r\n<p>&nbsp;</p>\r\n<p>当然，会有一小部分高中学生在填志愿表时不知道自己应该填哪个专业更好，或者因为学习成绩不太好的原因，只能在一小部分范围内随便填一下。</p>\r\n<p>&nbsp;</p>\r\n<p>正因为目前在高考填报志愿的这些情况，造成了一些同学大学毕业工作后发现专业是自己不喜欢的。一部分人不得不尴尬的继续自己不喜欢的职业；一部分人忠于自己的内心转行到自己喜欢的专业，但浪费了不少时间。</p>\r\n<p>&nbsp;</p>\r\n<p>因此，我建议高考填志愿的同学可以根据情况做一下职业心理测试，了解自己跟所选专业的适合度。</p>\r\n<p>                               </p>\r\n<p><img src=\"https://ossimg.xinli001.com/20200512/474667762955e892b52ad61eb6f13481.png?x-oss-process=image/quality,Q_80\" referrerpolicy=\"no-referrer\" alt=\"img\"></p>\r\n<p>&nbsp;</p>\r\n<p><strong>职业心理测试在大学专业选择上的运用</strong></p>\r\n<p>**\r\n**</p>\r\n<p>职业心理测试是通过一系列手段，将人的某些心理特征数量化，以测量应聘者的智力水平和个性方面差异的一种科学测量方法，其结果是对应聘者的能力和发展潜力的一种评定。</p>\r\n<p>&nbsp;</p>\r\n<p>常用的职业心理测试有学业成就测试、职业兴趣测试、职业能力测试、职业人格测试和投射试验。</p>\r\n<p>&nbsp;</p>\r\n<p>本文介绍的是在职业指导中影响最大、得到普遍承认的职业人格测试量表：美国心理学家霍兰德的“霍兰德职业倾向问卷”。此量表属于人格测试中的一种，人格测试是对人的稳定态度和习惯化的行为方式的测试，试题标准化，因此应用较广泛。</p>\r\n<p>&nbsp;</p>\r\n<p>通过量表的测试，将人格分为：常规型（C)、现实型（R）、研究型（I)、艺术型（A）、管理型（B）、社会型（S）六种类型，并提出了相对应的6种职业类型。每种人格特征对应6种职业特征。</p>\r\n<p>&nbsp;</p>\r\n<p>在高考填报志愿时，可作一下职业心理测试，测试一下自己个性与所选专业的契合度，这个心理测试的结果可作为填报志愿的参考。</p>\r\n<p>&nbsp;</p>\r\n<p>写在后面：</p>\r\n<p>&nbsp;</p>\r\n<p>进行职业心理测试时，需保证量表的信度、效度及测试环境等影响因素的可靠性；对职业心理测试结果的解释应由专业人员进行；职业心理测试的结果只能作为高考填报专业的参考因素之一，不能把职业心理测试的结果作为唯一的考虑</p>\r\n','飞哥',100,'2020-05-12 13:05:27','2020-05-12 13:05:27',0,100,'https://ossimg.xinli001.com/20200512/cc31dd536df152bf25a684b0e0bb931e.jpeg?x-oss-process=image/quality,Q_80'),('1260073654146912257','随笔','啦啦啦啦','<p>前几天看了一场电视直播求职节目，其中的一位女性求职者令我印象深刻：本科、硕士都是物理学专业，硕士是985院校。毕业后在一家大型教育培训机构当物理老师，每周只上星期六、星期天两天，可以说是钱多事少时间多。</p>\r\n<p>&nbsp;</p>\r\n<p>离职原因是跟小朋友们上课，沟通的比较少，这次想找一份人事工作。</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>就这样放弃了7年的专业确实是有点可惜，但实在不喜欢啊。现在放弃只是浪费了7年的时间，如果一直坚持下去就是一辈子，想想如果做一个自己不喜欢的事情一辈子其实蛮痛苦的。</p>\r\n<p>&nbsp;</p>\r\n<p>主持人继续问：那你怎么知道人事是你喜欢的工作？</p>\r\n<p>&nbsp;</p>\r\n<p>求职者回答说：我用的是排除法，把我不喜欢的工作大类除去，剩下行政、人事，我觉得人事挺适合我的。所以这次求职的是人事工作。</p>\r\n<p>&nbsp;</p>\r\n<p>看了上面一段文字描述，朋友们，你们是不是也跟主持人一样对这位求职者感到些惋惜。如果她在大学专业上的选择能再慎重些，或者在读研究生时考虑改为其他她感兴趣的专业，或许，能够节约一些时间成本。</p>\r\n<p>&nbsp;</p>\r\n<p>有没有什么办法，能在高考选择大学专业的时候就可以一步到位，选择适合自己的专业，让大学生毕业后的职业生涯规划少走弯路呢？</p>\r\n<p>&nbsp;</p>\r\n<p>有的，方法就是职业心理测试。职业心理测试作为企业招聘的一个重要流程，在人才选拔上发挥很重要的作用。求职者也可以利用心理测试作为职业生涯规划的重要手段。职业心理测试能前置到高考填志愿选专业的话，会使很多人少走很多弯路。</p>\r\n<p>                 </p>\r\n<p><img src=\"https://ossimg.xinli001.com/20200512/25b7809853baa1d8b05ba8cc35aeb6ba.png?x-oss-process=image/quality,Q_80\" referrerpolicy=\"no-referrer\" alt=\"img\"></p>\r\n<p>&nbsp;</p>\r\n<p><strong>为什么提倡高考填志愿选专业时做一下职业心理测试</strong></p>\r\n<p>**\r\n**</p>\r\n<p>现在高中生填志愿表时一小半同学会有自己明确的目标，知道自己喜欢什么，适合什么，在填报志愿的时候是很明确的。</p>\r\n<p>&nbsp;</p>\r\n<p>大概一半的同学会根据目前比较热门的专业来填报志愿。因为填一个比较热门的专业意味着较高的就业率；同级别大学毕业生中比较热门的专业的学生会拿到更有竞争力的薪资。</p>\r\n<p>&nbsp;</p>\r\n<p>当然，会有一小部分高中学生在填志愿表时不知道自己应该填哪个专业更好，或者因为学习成绩不太好的原因，只能在一小部分范围内随便填一下。</p>\r\n<p>&nbsp;</p>\r\n<p>正因为目前在高考填报志愿的这些情况，造成了一些同学大学毕业工作后发现专业是自己不喜欢的。一部分人不得不尴尬的继续自己不喜欢的职业；一部分人忠于自己的内心转行到自己喜欢的专业，但浪费了不少时间。</p>\r\n<p>&nbsp;</p>\r\n<p>因此，我建议高考填志愿的同学可以根据情况做一下职业心理测试，了解自己跟所选专业的适合度。</p>\r\n<p>                               </p>\r\n<p><img src=\"https://ossimg.xinli001.com/20200512/474667762955e892b52ad61eb6f13481.png?x-oss-process=image/quality,Q_80\" referrerpolicy=\"no-referrer\" alt=\"img\"></p>\r\n<p>&nbsp;</p>\r\n<p><strong>职业心理测试在大学专业选择上的运用</strong></p>\r\n<p>**\r\n**</p>\r\n<p>职业心理测试是通过一系列手段，将人的某些心理特征数量化，以测量应聘者的智力水平和个性方面差异的一种科学测量方法，其结果是对应聘者的能力和发展潜力的一种评定。</p>\r\n<p>&nbsp;</p>\r\n<p>常用的职业心理测试有学业成就测试、职业兴趣测试、职业能力测试、职业人格测试和投射试验。</p>\r\n<p>&nbsp;</p>\r\n<p>本文介绍的是在职业指导中影响最大、得到普遍承认的职业人格测试量表：美国心理学家霍兰德的“霍兰德职业倾向问卷”。此量表属于人格测试中的一种，人格测试是对人的稳定态度和习惯化的行为方式的测试，试题标准化，因此应用较广泛。</p>\r\n<p>&nbsp;</p>\r\n<p>通过量表的测试，将人格分为：常规型（C)、现实型（R）、研究型（I)、艺术型（A）、管理型（B）、社会型（S）六种类型，并提出了相对应的6种职业类型。每种人格特征对应6种职业特征。</p>\r\n<p>&nbsp;</p>\r\n<p>在高考填报志愿时，可作一下职业心理测试，测试一下自己个性与所选专业的契合度，这个心理测试的结果可作为填报志愿的参考。</p>\r\n<p>&nbsp;</p>\r\n<p>写在后面：</p>\r\n<p>&nbsp;</p>\r\n<p>进行职业心理测试时，需保证量表的信度、效度及测试环境等影响因素的可靠性；对职业心理测试结果的解释应由专业人员进行；职业心理测试的结果只能作为高考填报专业的参考因素之一，不能把职业心理测试的结果作为唯一的考虑</p>\r\n','飞哥',100,'2020-05-12 13:05:44','2020-05-12 13:05:44',0,100,'https://ossimg.xinli001.com/20200512/cc31dd536df152bf25a684b0e0bb931e.jpeg?x-oss-process=image/quality,Q_80'),('1260073697297911810','随笔','呵呵呵呵','<p>前几天看了一场电视直播求职节目，其中的一位女性求职者令我印象深刻：本科、硕士都是物理学专业，硕士是985院校。毕业后在一家大型教育培训机构当物理老师，每周只上星期六、星期天两天，可以说是钱多事少时间多。</p>\r\n<p>&nbsp;</p>\r\n<p>离职原因是跟小朋友们上课，沟通的比较少，这次想找一份人事工作。</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>就这样放弃了7年的专业确实是有点可惜，但实在不喜欢啊。现在放弃只是浪费了7年的时间，如果一直坚持下去就是一辈子，想想如果做一个自己不喜欢的事情一辈子其实蛮痛苦的。</p>\r\n<p>&nbsp;</p>\r\n<p>主持人继续问：那你怎么知道人事是你喜欢的工作？</p>\r\n<p>&nbsp;</p>\r\n<p>求职者回答说：我用的是排除法，把我不喜欢的工作大类除去，剩下行政、人事，我觉得人事挺适合我的。所以这次求职的是人事工作。</p>\r\n<p>&nbsp;</p>\r\n<p>看了上面一段文字描述，朋友们，你们是不是也跟主持人一样对这位求职者感到些惋惜。如果她在大学专业上的选择能再慎重些，或者在读研究生时考虑改为其他她感兴趣的专业，或许，能够节约一些时间成本。</p>\r\n<p>&nbsp;</p>\r\n<p>有没有什么办法，能在高考选择大学专业的时候就可以一步到位，选择适合自己的专业，让大学生毕业后的职业生涯规划少走弯路呢？</p>\r\n<p>&nbsp;</p>\r\n<p>有的，方法就是职业心理测试。职业心理测试作为企业招聘的一个重要流程，在人才选拔上发挥很重要的作用。求职者也可以利用心理测试作为职业生涯规划的重要手段。职业心理测试能前置到高考填志愿选专业的话，会使很多人少走很多弯路。</p>\r\n<p>                 </p>\r\n<p><img src=\"https://ossimg.xinli001.com/20200512/25b7809853baa1d8b05ba8cc35aeb6ba.png?x-oss-process=image/quality,Q_80\" referrerpolicy=\"no-referrer\" alt=\"img\"></p>\r\n<p>&nbsp;</p>\r\n<p><strong>为什么提倡高考填志愿选专业时做一下职业心理测试</strong></p>\r\n<p>**\r\n**</p>\r\n<p>现在高中生填志愿表时一小半同学会有自己明确的目标，知道自己喜欢什么，适合什么，在填报志愿的时候是很明确的。</p>\r\n<p>&nbsp;</p>\r\n<p>大概一半的同学会根据目前比较热门的专业来填报志愿。因为填一个比较热门的专业意味着较高的就业率；同级别大学毕业生中比较热门的专业的学生会拿到更有竞争力的薪资。</p>\r\n<p>&nbsp;</p>\r\n<p>当然，会有一小部分高中学生在填志愿表时不知道自己应该填哪个专业更好，或者因为学习成绩不太好的原因，只能在一小部分范围内随便填一下。</p>\r\n<p>&nbsp;</p>\r\n<p>正因为目前在高考填报志愿的这些情况，造成了一些同学大学毕业工作后发现专业是自己不喜欢的。一部分人不得不尴尬的继续自己不喜欢的职业；一部分人忠于自己的内心转行到自己喜欢的专业，但浪费了不少时间。</p>\r\n<p>&nbsp;</p>\r\n<p>因此，我建议高考填志愿的同学可以根据情况做一下职业心理测试，了解自己跟所选专业的适合度。</p>\r\n<p>                               </p>\r\n<p><img src=\"https://ossimg.xinli001.com/20200512/474667762955e892b52ad61eb6f13481.png?x-oss-process=image/quality,Q_80\" referrerpolicy=\"no-referrer\" alt=\"img\"></p>\r\n<p>&nbsp;</p>\r\n<p><strong>职业心理测试在大学专业选择上的运用</strong></p>\r\n<p>**\r\n**</p>\r\n<p>职业心理测试是通过一系列手段，将人的某些心理特征数量化，以测量应聘者的智力水平和个性方面差异的一种科学测量方法，其结果是对应聘者的能力和发展潜力的一种评定。</p>\r\n<p>&nbsp;</p>\r\n<p>常用的职业心理测试有学业成就测试、职业兴趣测试、职业能力测试、职业人格测试和投射试验。</p>\r\n<p>&nbsp;</p>\r\n<p>本文介绍的是在职业指导中影响最大、得到普遍承认的职业人格测试量表：美国心理学家霍兰德的“霍兰德职业倾向问卷”。此量表属于人格测试中的一种，人格测试是对人的稳定态度和习惯化的行为方式的测试，试题标准化，因此应用较广泛。</p>\r\n<p>&nbsp;</p>\r\n<p>通过量表的测试，将人格分为：常规型（C)、现实型（R）、研究型（I)、艺术型（A）、管理型（B）、社会型（S）六种类型，并提出了相对应的6种职业类型。每种人格特征对应6种职业特征。</p>\r\n<p>&nbsp;</p>\r\n<p>在高考填报志愿时，可作一下职业心理测试，测试一下自己个性与所选专业的契合度，这个心理测试的结果可作为填报志愿的参考。</p>\r\n<p>&nbsp;</p>\r\n<p>写在后面：</p>\r\n<p>&nbsp;</p>\r\n<p>进行职业心理测试时，需保证量表的信度、效度及测试环境等影响因素的可靠性；对职业心理测试结果的解释应由专业人员进行；职业心理测试的结果只能作为高考填报专业的参考因素之一，不能把职业心理测试的结果作为唯一的考虑</p>\r\n','飞哥',100,'2020-05-12 13:05:55','2020-05-12 13:05:55',0,100,'https://ossimg.xinli001.com/20200512/cc31dd536df152bf25a684b0e0bb931e.jpeg?x-oss-process=image/quality,Q_80'),('1260073758354395138','随笔','嘿嘿嘿嘿','<p>前几天看了一场电视直播求职节目，其中的一位女性求职者令我印象深刻：本科、硕士都是物理学专业，硕士是985院校。毕业后在一家大型教育培训机构当物理老师，每周只上星期六、星期天两天，可以说是钱多事少时间多。</p>\r\n<p>&nbsp;</p>\r\n<p>离职原因是跟小朋友们上课，沟通的比较少，这次想找一份人事工作。</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>就这样放弃了7年的专业确实是有点可惜，但实在不喜欢啊。现在放弃只是浪费了7年的时间，如果一直坚持下去就是一辈子，想想如果做一个自己不喜欢的事情一辈子其实蛮痛苦的。</p>\r\n<p>&nbsp;</p>\r\n<p>主持人继续问：那你怎么知道人事是你喜欢的工作？</p>\r\n<p>&nbsp;</p>\r\n<p>求职者回答说：我用的是排除法，把我不喜欢的工作大类除去，剩下行政、人事，我觉得人事挺适合我的。所以这次求职的是人事工作。</p>\r\n<p>&nbsp;</p>\r\n<p>看了上面一段文字描述，朋友们，你们是不是也跟主持人一样对这位求职者感到些惋惜。如果她在大学专业上的选择能再慎重些，或者在读研究生时考虑改为其他她感兴趣的专业，或许，能够节约一些时间成本。</p>\r\n<p>&nbsp;</p>\r\n<p>有没有什么办法，能在高考选择大学专业的时候就可以一步到位，选择适合自己的专业，让大学生毕业后的职业生涯规划少走弯路呢？</p>\r\n<p>&nbsp;</p>\r\n<p>有的，方法就是职业心理测试。职业心理测试作为企业招聘的一个重要流程，在人才选拔上发挥很重要的作用。求职者也可以利用心理测试作为职业生涯规划的重要手段。职业心理测试能前置到高考填志愿选专业的话，会使很多人少走很多弯路。</p>\r\n<p>                 </p>\r\n<p><img src=\"https://ossimg.xinli001.com/20200512/25b7809853baa1d8b05ba8cc35aeb6ba.png?x-oss-process=image/quality,Q_80\" referrerpolicy=\"no-referrer\" alt=\"img\"></p>\r\n<p>&nbsp;</p>\r\n<p><strong>为什么提倡高考填志愿选专业时做一下职业心理测试</strong></p>\r\n<p>**\r\n**</p>\r\n<p>现在高中生填志愿表时一小半同学会有自己明确的目标，知道自己喜欢什么，适合什么，在填报志愿的时候是很明确的。</p>\r\n<p>&nbsp;</p>\r\n<p>大概一半的同学会根据目前比较热门的专业来填报志愿。因为填一个比较热门的专业意味着较高的就业率；同级别大学毕业生中比较热门的专业的学生会拿到更有竞争力的薪资。</p>\r\n<p>&nbsp;</p>\r\n<p>当然，会有一小部分高中学生在填志愿表时不知道自己应该填哪个专业更好，或者因为学习成绩不太好的原因，只能在一小部分范围内随便填一下。</p>\r\n<p>&nbsp;</p>\r\n<p>正因为目前在高考填报志愿的这些情况，造成了一些同学大学毕业工作后发现专业是自己不喜欢的。一部分人不得不尴尬的继续自己不喜欢的职业；一部分人忠于自己的内心转行到自己喜欢的专业，但浪费了不少时间。</p>\r\n<p>&nbsp;</p>\r\n<p>因此，我建议高考填志愿的同学可以根据情况做一下职业心理测试，了解自己跟所选专业的适合度。</p>\r\n<p>                               </p>\r\n<p><img src=\"https://ossimg.xinli001.com/20200512/474667762955e892b52ad61eb6f13481.png?x-oss-process=image/quality,Q_80\" referrerpolicy=\"no-referrer\" alt=\"img\"></p>\r\n<p>&nbsp;</p>\r\n<p><strong>职业心理测试在大学专业选择上的运用</strong></p>\r\n<p>**\r\n**</p>\r\n<p>职业心理测试是通过一系列手段，将人的某些心理特征数量化，以测量应聘者的智力水平和个性方面差异的一种科学测量方法，其结果是对应聘者的能力和发展潜力的一种评定。</p>\r\n<p>&nbsp;</p>\r\n<p>常用的职业心理测试有学业成就测试、职业兴趣测试、职业能力测试、职业人格测试和投射试验。</p>\r\n<p>&nbsp;</p>\r\n<p>本文介绍的是在职业指导中影响最大、得到普遍承认的职业人格测试量表：美国心理学家霍兰德的“霍兰德职业倾向问卷”。此量表属于人格测试中的一种，人格测试是对人的稳定态度和习惯化的行为方式的测试，试题标准化，因此应用较广泛。</p>\r\n<p>&nbsp;</p>\r\n<p>通过量表的测试，将人格分为：常规型（C)、现实型（R）、研究型（I)、艺术型（A）、管理型（B）、社会型（S）六种类型，并提出了相对应的6种职业类型。每种人格特征对应6种职业特征。</p>\r\n<p>&nbsp;</p>\r\n<p>在高考填报志愿时，可作一下职业心理测试，测试一下自己个性与所选专业的契合度，这个心理测试的结果可作为填报志愿的参考。</p>\r\n<p>&nbsp;</p>\r\n<p>写在后面：</p>\r\n<p>&nbsp;</p>\r\n<p>进行职业心理测试时，需保证量表的信度、效度及测试环境等影响因素的可靠性；对职业心理测试结果的解释应由专业人员进行；职业心理测试的结果只能作为高考填报专业的参考因素之一，不能把职业心理测试的结果作为唯一的考虑</p>\r\n','飞哥',100,'2020-05-12 13:06:09','2020-05-12 13:06:09',0,0,'https://ossimg.xinli001.com/20200512/cc31dd536df152bf25a684b0e0bb931e.jpeg?x-oss-process=image/quality,Q_80');

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

insert  into `user`(`uid`,`nickname`,`phone`,`email`,`sex`,`age`,`detailed_address`,`school`,`is_delete`,`gmt_create`,`gmt_modified`,`avatar`,introduce) values ('oQyNP5ZQgz7tvjGRlLl0HXJZ6tzA','haha~',NULL,NULL,0,0,'',NULL,0,'2020-05-07 15:29:21','2020-05-07 15:29:21','https://wx.qlogo.cn/mmopen/vi_32/wADIYVRGcBjicPLbhYr9oxEsWB6KfZqywOdP2ibyEKxpYq8KtpBrV3KLrEOib84cAMs1UYCibW4ibgXhko9bEFZkHDA/132','null'),('o_6_25eSOORUoMlCHztvkZDOKTZ8','非哥',NULL,NULL,0,0,'YunnanWenshan',NULL,0,'2020-05-04 23:32:43','2020-05-04 23:32:43','https://wx.qlogo.cn/mmopen/vi_32/ElMYjXNGfoEE4axqtCFyDctBUNd3Om7x0giaPByXoybCDFYIVVMteAzlRmEdzAGch5ATViclYib28kjGWibdNdtghQ/132','1');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
