/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50640
Source Host           : localhost:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50640
File Encoding         : 65001

Date: 2018-07-31 09:45:46
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for privilege
-- ----------------------------
DROP TABLE IF EXISTS `privilege`;
CREATE TABLE `privilege` (
  `id` int(11) NOT NULL,
  `privilegeName` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of privilege
-- ----------------------------
INSERT INTO `privilege` VALUES ('1', '查看');
INSERT INTO `privilege` VALUES ('2', '修改');
INSERT INTO `privilege` VALUES ('3', '添加');
INSERT INTO `privilege` VALUES ('4', '删除');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `rolename` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rolename` (`rolename`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('2', '普通用户');
INSERT INTO `role` VALUES ('1', '管理员');

-- ----------------------------
-- Table structure for role_privilege
-- ----------------------------
DROP TABLE IF EXISTS `role_privilege`;
CREATE TABLE `role_privilege` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleId` int(11) DEFAULT NULL,
  `privilegeId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `roleId` (`roleId`),
  KEY `privilegeId` (`privilegeId`),
  CONSTRAINT `role_privilege_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`),
  CONSTRAINT `role_privilege_ibfk_2` FOREIGN KEY (`privilegeId`) REFERENCES `privilege` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of role_privilege
-- ----------------------------
INSERT INTO `role_privilege` VALUES ('1', '1', '1');
INSERT INTO `role_privilege` VALUES ('2', '1', '2');
INSERT INTO `role_privilege` VALUES ('3', '1', '3');
INSERT INTO `role_privilege` VALUES ('4', '1', '4');
INSERT INTO `role_privilege` VALUES ('5', '2', '3');
INSERT INTO `role_privilege` VALUES ('7', '2', '4');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `realname` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `password` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('0', 'aa', 'aa', null, '23456345');
INSERT INTO `user` VALUES ('1', 'bb', 'bb', null, '123445');
INSERT INTO `user` VALUES ('2', 'wangwu', '王五', '15965754654', '666666');
INSERT INTO `user` VALUES ('3', 'yty', 'xcdsf', null, '1234546');
INSERT INTO `user` VALUES ('4', 'cc', 'cc', null, '2345656');

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `id` int(11) NOT NULL,
  `userId` int(255) DEFAULT NULL,
  `roleId` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  KEY `roleId` (`roleId`),
  CONSTRAINT `user_role_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`),
  CONSTRAINT `user_role_ibfk_2` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('1', '2', '1');
INSERT INTO `user_role` VALUES ('2', '3', '2');
INSERT INTO `user_role` VALUES ('3', '1', '1');
INSERT INTO `user_role` VALUES ('4', '4', '2');
INSERT INTO `user_role` VALUES ('5', '0', '2');
INSERT INTO `user_role` VALUES ('6', '2', '2');
