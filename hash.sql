/*
Navicat MySQL Data Transfer

Source Server         : 127.0.01
Source Server Version : 80011
Source Host           : localhost:3306
Source Database       : hash

Target Server Type    : MYSQL
Target Server Version : 80011
File Encoding         : 65001

Date: 2018-12-11 11:28:57
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `b_id` int(8) NOT NULL AUTO_INCREMENT,
  `b_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `b_price` int(50) NOT NULL,
  PRIMARY KEY (`b_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES ('1', '很棒的書', '0');
INSERT INTO `book` VALUES ('5', 'ffff', '23');

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `c_id` int(10) NOT NULL AUTO_INCREMENT,
  `c_name` varchar(10) NOT NULL,
  `c_phone` varchar(20) NOT NULL,
  `c_address` varchar(50) NOT NULL,
  `createtime` datetime NOT NULL,
  `updatetime` datetime NOT NULL,
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES ('1', '王小明2', '1358965525633', '东莞厚街eee', '2018-08-04 11:22:19', '2018-08-04 11:22:22');
INSERT INTO `customer` VALUES ('2', '周小美', '15826697435', '东莞南城', '2018-08-04 11:23:58', '2018-08-04 11:24:01');
INSERT INTO `customer` VALUES ('3', '陈小花', '19552236522', '东莞东城', '2018-08-04 11:24:52', '2018-08-04 11:24:54');
INSERT INTO `customer` VALUES ('4', 'ssss', '025555', '1111111', '2018-08-11 21:43:09', '2018-08-11 21:43:09');
INSERT INTO `customer` VALUES ('5', '123', '3333333', 'scddscsdds', '2018-08-14 09:13:59', '2018-08-14 09:13:59');
INSERT INTO `customer` VALUES ('6', '李小明', '55511224', 'ddsssaaaa', '2018-08-14 19:48:45', '2018-08-14 19:48:45');
INSERT INTO `customer` VALUES ('9', 'axX', '22222', 'xcxcxc', '2018-08-16 16:42:06', '2018-08-16 16:42:06');

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `m_id` int(10) NOT NULL AUTO_INCREMENT,
  `m_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createtime` datetime NOT NULL,
  `updatetime` datetime NOT NULL,
  PRIMARY KEY (`m_id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('1', '叉烧香肠炒蛋', '2018-08-04 10:28:32', '2018-08-04 10:46:04');
INSERT INTO `menu` VALUES ('2', '肉沫炖豆腐', '2018-08-04 10:33:31', '2018-08-04 10:46:04');
INSERT INTO `menu` VALUES ('3', '泰汁鸡条', '2018-08-04 10:33:31', '2018-08-04 10:46:04');
INSERT INTO `menu` VALUES ('4', '黄瓜炒蛋', '2018-08-04 10:33:31', '2018-08-04 10:46:04');
INSERT INTO `menu` VALUES ('6', '麻婆豆腐', '2018-08-04 10:33:31', '2018-08-04 10:46:04');
INSERT INTO `menu` VALUES ('7', '苹果雪梨炖肉uuu', '2018-08-04 10:51:54', '2018-08-04 10:51:54');
INSERT INTO `menu` VALUES ('8', '第一菜12', '2018-08-04 12:26:20', '2018-08-04 12:26:20');
INSERT INTO `menu` VALUES ('9', '第二菜', '2018-08-04 12:26:20', '2018-08-04 12:26:20');
INSERT INTO `menu` VALUES ('10', '第三菜', '2018-08-04 12:26:20', '2018-08-04 12:26:20');
INSERT INTO `menu` VALUES ('11', '第四菜', '2018-08-04 12:26:20', '2018-08-04 12:26:20');
INSERT INTO `menu` VALUES ('23', 'ddddd', '2018-08-11 21:12:02', '2018-08-11 21:12:02');
INSERT INTO `menu` VALUES ('24', 'dddd', '2018-08-11 21:20:11', '2018-08-11 21:20:11');
INSERT INTO `menu` VALUES ('25', 'sssss', '2018-08-11 21:20:14', '2018-08-11 21:20:14');
INSERT INTO `menu` VALUES ('26', 'aaaaaa', '2018-08-11 21:20:19', '2018-08-11 21:20:19');
INSERT INTO `menu` VALUES ('27', 'xxxxxx', '2018-08-11 21:20:49', '2018-08-11 21:20:49');
INSERT INTO `menu` VALUES ('28', 'ddddd', '2018-08-11 21:20:54', '2018-08-11 21:20:54');
INSERT INTO `menu` VALUES ('29', '的点点滴滴', '2018-08-11 21:22:05', '2018-08-11 21:22:05');
INSERT INTO `menu` VALUES ('30', '哒哒哒哒哒哒', '2018-08-11 21:22:12', '2018-08-11 21:22:12');
INSERT INTO `menu` VALUES ('31', 'sssss', '2018-08-14 09:13:41', '2018-08-14 09:13:41');
INSERT INTO `menu` VALUES ('32', 'fffffvvv', '2018-08-14 09:13:46', '2018-08-14 09:13:46');
INSERT INTO `menu` VALUES ('41', 'ddd', '2018-08-16 16:40:41', '2018-08-16 16:40:41');

-- ----------------------------
-- Table structure for order_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail` (
  `d_id` int(10) NOT NULL AUTO_INCREMENT,
  `o_id` int(10) NOT NULL,
  `b_id` int(10) NOT NULL,
  `b_count` int(10) NOT NULL,
  `createtime` datetime NOT NULL,
  `updatetime` datetime NOT NULL,
  PRIMARY KEY (`d_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_detail
-- ----------------------------
INSERT INTO `order_detail` VALUES ('1', '1', '1', '3', '2018-08-04 11:27:09', '2018-08-04 11:27:12');
INSERT INTO `order_detail` VALUES ('2', '1', '4', '2', '2018-08-04 11:27:31', '2018-08-04 11:27:35');
INSERT INTO `order_detail` VALUES ('3', '1', '6', '6', '2018-08-04 11:27:53', '2018-08-04 11:27:56');
INSERT INTO `order_detail` VALUES ('4', '2', '2', '2', '2018-08-04 11:28:14', '2018-08-04 11:28:17');
INSERT INTO `order_detail` VALUES ('5', '2', '3', '3', '2018-08-04 11:28:35', '2018-08-04 11:28:39');
INSERT INTO `order_detail` VALUES ('6', '3', '2', '2', '2018-08-04 11:29:06', '2018-08-04 11:29:09');
INSERT INTO `order_detail` VALUES ('7', '3', '4', '1', '2018-08-04 11:29:29', '2018-08-04 11:29:32');
INSERT INTO `order_detail` VALUES ('8', '3', '6', '4', '2018-08-04 11:29:51', '2018-08-04 11:29:55');
INSERT INTO `order_detail` VALUES ('9', '3', '7', '3', '2018-08-04 11:30:13', '2018-08-04 11:30:16');
INSERT INTO `order_detail` VALUES ('10', '4', '2', '3', '2018-08-17 23:46:18', '2018-08-17 23:46:18');
INSERT INTO `order_detail` VALUES ('11', '4', '3', '5', '2018-08-17 23:46:18', '2018-08-17 23:46:18');
INSERT INTO `order_detail` VALUES ('12', '4', '4', '2', '2018-08-17 23:46:18', '2018-08-17 23:46:18');
INSERT INTO `order_detail` VALUES ('13', '5', '10', '3', '2018-08-17 23:47:14', '2018-08-17 23:47:14');
INSERT INTO `order_detail` VALUES ('14', '5', '11', '3', '2018-08-17 23:47:14', '2018-08-17 23:47:14');
INSERT INTO `order_detail` VALUES ('15', '5', '23', '3', '2018-08-17 23:47:14', '2018-08-17 23:47:14');
INSERT INTO `order_detail` VALUES ('16', '6', '2', '3', '2018-08-18 09:21:26', '2018-08-18 09:21:26');
INSERT INTO `order_detail` VALUES ('17', '6', '3', '2', '2018-08-18 09:21:26', '2018-08-18 09:21:26');
INSERT INTO `order_detail` VALUES ('18', '6', '10', '1', '2018-08-18 09:21:26', '2018-08-18 09:21:26');
INSERT INTO `order_detail` VALUES ('19', '6', '9', '2', '2018-08-18 09:21:26', '2018-08-18 09:21:26');
INSERT INTO `order_detail` VALUES ('20', '7', '2', '4', '2018-08-18 09:33:07', '2018-08-18 09:33:07');
INSERT INTO `order_detail` VALUES ('21', '7', '3', '4', '2018-08-18 09:33:07', '2018-08-18 09:33:07');
INSERT INTO `order_detail` VALUES ('22', '7', '9', '4', '2018-08-18 09:33:07', '2018-08-18 09:33:07');
INSERT INTO `order_detail` VALUES ('23', '8', '1', '10', '2018-12-10 00:00:00', '2018-12-10 00:00:00');
INSERT INTO `order_detail` VALUES ('24', '8', '5', '20', '2018-12-10 00:00:00', '2018-12-10 00:00:00');
INSERT INTO `order_detail` VALUES ('25', '9', '1', '35', '2018-12-10 00:00:00', '2018-12-10 00:00:00');
INSERT INTO `order_detail` VALUES ('26', '9', '5', '20', '2018-12-10 00:00:00', '2018-12-10 00:00:00');
INSERT INTO `order_detail` VALUES ('27', '10', '1', '23', '2018-12-10 00:00:00', '2018-12-10 00:00:00');
INSERT INTO `order_detail` VALUES ('28', '10', '5', '64', '2018-12-10 00:00:00', '2018-12-10 00:00:00');
INSERT INTO `order_detail` VALUES ('29', '11', '1', '34', '2018-12-10 00:00:00', '2018-12-10 00:00:00');
INSERT INTO `order_detail` VALUES ('30', '11', '5', '32', '2018-12-10 00:00:00', '2018-12-10 00:00:00');
INSERT INTO `order_detail` VALUES ('31', '12', '1', '56', '2018-12-10 00:00:00', '2018-12-10 00:00:00');
INSERT INTO `order_detail` VALUES ('32', '12', '5', '21', '2018-12-10 00:00:00', '2018-12-10 00:00:00');
INSERT INTO `order_detail` VALUES ('33', '13', '1', '8', '2018-12-10 00:00:00', '2018-12-10 00:00:00');
INSERT INTO `order_detail` VALUES ('34', '13', '5', '5', '2018-12-10 00:00:00', '2018-12-10 00:00:00');

-- ----------------------------
-- Table structure for order_main
-- ----------------------------
DROP TABLE IF EXISTS `order_main`;
CREATE TABLE `order_main` (
  `o_id` int(10) NOT NULL AUTO_INCREMENT,
  `u_id` int(10) NOT NULL,
  `pay` int(1) NOT NULL DEFAULT '0',
  `createtime` datetime NOT NULL,
  `updatetime` datetime NOT NULL,
  PRIMARY KEY (`o_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_main
-- ----------------------------
INSERT INTO `order_main` VALUES ('1', '1', '0', '2018-08-04 11:25:27', '2018-08-04 11:25:30');
INSERT INTO `order_main` VALUES ('2', '2', '0', '2018-08-04 11:25:42', '2018-08-04 11:25:45');
INSERT INTO `order_main` VALUES ('3', '3', '0', '2018-08-04 11:26:05', '2018-08-04 11:26:08');
INSERT INTO `order_main` VALUES ('4', '2', '0', '2018-08-17 23:46:18', '2018-08-17 23:46:18');
INSERT INTO `order_main` VALUES ('5', '3', '0', '2018-08-17 23:47:14', '2018-08-17 23:47:14');
INSERT INTO `order_main` VALUES ('6', '2', '0', '2018-08-18 09:21:26', '2018-08-18 09:21:26');
INSERT INTO `order_main` VALUES ('7', '2', '0', '2018-08-18 09:33:07', '2018-08-18 09:33:07');
INSERT INTO `order_main` VALUES ('8', '5', '0', '2018-12-10 00:00:00', '2018-12-10 00:00:00');
INSERT INTO `order_main` VALUES ('9', '5', '0', '2018-12-10 00:00:00', '2018-12-10 00:00:00');
INSERT INTO `order_main` VALUES ('10', '5', '0', '2018-12-10 00:00:00', '2018-12-10 00:00:00');
INSERT INTO `order_main` VALUES ('11', '5', '0', '2018-12-10 00:00:00', '2018-12-10 00:00:00');
INSERT INTO `order_main` VALUES ('12', '5', '0', '2018-12-10 00:00:00', '2018-12-10 00:00:00');
INSERT INTO `order_main` VALUES ('13', '5', '0', '2018-12-10 00:00:00', '2018-12-10 00:00:00');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(10) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'john', 'hash');

-- ----------------------------
-- Table structure for user2
-- ----------------------------
DROP TABLE IF EXISTS `user2`;
CREATE TABLE `user2` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `createtime` datetime NOT NULL,
  `updatetime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user2
-- ----------------------------
INSERT INTO `user2` VALUES ('1', '王大明', 'john', 'hash', '2018-08-09 10:37:45', '2018-08-09 10:37:48');
INSERT INTO `user2` VALUES ('2', '梨小美', 'mary', 'ffff', '2018-08-09 10:49:28', '2018-08-09 10:49:31');
INSERT INTO `user2` VALUES ('3', '里大妈', 'spot', 'qqqq', '2018-08-09 10:50:12', '2018-08-09 10:50:15');

-- ----------------------------
-- Table structure for user_t
-- ----------------------------
DROP TABLE IF EXISTS `user_t`;
CREATE TABLE `user_t` (
  `u_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `age` int(10) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  PRIMARY KEY (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_t
-- ----------------------------
INSERT INTO `user_t` VALUES ('5', '222', '3333', '655', '0987855058', '新北市板橋區');
INSERT INTO `user_t` VALUES ('7', 'gfdddd', 'wwww', '45', 'fffff', '11111');
