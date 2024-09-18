# Host: localhost  (Version 5.7.19-log)
# Date: 2024-09-18 09:15:04
# Generator: MySQL-Front 6.0  (Build 2.20)


#
# Structure for table "college"
#

CREATE TABLE `college` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `college_name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

#
# Data for table "college"
#

INSERT INTO `college` VALUES (1,'软件学院'),(2,'测试学院'),(3,'前端学院');

#
# Structure for table "inspection_record"
#

CREATE TABLE `inspection_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(20) DEFAULT NULL,
  `laboratory_id` varchar(64) DEFAULT NULL,
  `door` varchar(64) DEFAULT NULL,
  `device` varchar(64) DEFAULT NULL,
  `fire_facilities` varchar(64) DEFAULT NULL,
  `inspection_date` date DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `term_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='巡查记录表';

#
# Data for table "inspection_record"
#

INSERT INTO `inspection_record` VALUES (1,1,'1','正常','正常','正常','2024-06-18',1,1),(2,2,'2','正常','正常','不正常','2024-06-18',2,2),(3,3,'3','正常','正常','正常','2024-06-18',1,3),(4,2,'2','正常','正常','正常','2024-06-18',1,2);

#
# Structure for table "laboratory"
#

CREATE TABLE `laboratory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(20) DEFAULT NULL,
  `laboratory_name` varchar(64) DEFAULT NULL,
  `laboratory_location` varchar(64) DEFAULT NULL,
  `college_id` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

#
# Data for table "laboratory"
#

INSERT INTO `laboratory` VALUES (1,1,'软件开发实验室','7401',1),(2,2,'前端开发实验室','7402',3),(3,3,'软件测试实验室','7403',2),(4,4,'软件开发实验室','7404',1),(5,5,'软件开发实验室','7405',1),(6,7,'123','1234',2);

#
# Structure for table "term"
#

CREATE TABLE `term` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `term_name` varchar(64) DEFAULT NULL,
  `record_id` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

#
# Data for table "term"
#

INSERT INTO `term` VALUES (1,'2023-2024第一学期',1),(2,'2023-2024第二学期',2),(3,'2024-2025第一学期',3);

#
# Structure for table "user"
#

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(64) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `college_id` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

#
# Data for table "user"
#

INSERT INTO `user` VALUES (1,'admin1','123','superadmin',1),(2,'user1','123','admin',1),(3,'user2','123','admin',2),(4,'user3','123','admin',3),(5,'admin2','123','superadmin',1),(6,'123456','123','superadmin',3),(7,'1','1','admin',2),(8,'dtz','123','admin',3),(9,'dtz2','123','admin',2);
