/*
Navicat MySQL Data Transfer

Source Server         : wenge
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : application

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2017-04-21 10:20:32
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for apply_admin
-- ----------------------------
DROP TABLE IF EXISTS `apply_admin`;
CREATE TABLE `apply_admin` (
  `adminId` varchar(50) NOT NULL COMMENT '用户Id',
  `adminUserName` varchar(45) NOT NULL COMMENT '用户姓名',
  `adminPassWord` varchar(45) NOT NULL COMMENT '用户登录密码',
  `adminLoginName` varchar(45) NOT NULL COMMENT '用户登录名',
  `deleteFlag` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`adminId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理员信息表';

-- ----------------------------
-- Records of apply_admin
-- ----------------------------

-- ----------------------------
-- Table structure for apply_creditlist
-- ----------------------------
DROP TABLE IF EXISTS `apply_creditlist`;
CREATE TABLE `apply_creditlist` (
  `creditListId` varchar(45) NOT NULL COMMENT '账单Id',
  `creditAmount` varchar(20) NOT NULL COMMENT '贷款数额',
  `userName` varchar(20) NOT NULL COMMENT '用户姓名',
  `userTel` varchar(20) NOT NULL COMMENT '用户电话',
  `userSex` tinyint(2) NOT NULL COMMENT '用户性别',
  `userAge` varchar(4) NOT NULL COMMENT '用户年龄',
  `workUnit` varchar(45) NOT NULL COMMENT '工作单位',
  `userPost` varchar(45) NOT NULL COMMENT '工作岗位',
  `unitTel` varchar(20) DEFAULT '无' COMMENT '工作电话',
  `zhimaNum` varchar(20) NOT NULL COMMENT '芝麻信用积分',
  `huabeiLimit` varchar(20) NOT NULL COMMENT '花呗额度',
  `jiebeiLimit` varchar(20) DEFAULT '无' COMMENT '借呗额度',
  `creditCardLimit` varchar(20) DEFAULT '无' COMMENT '信用卡额度',
  `jiedaibaoLimit` varchar(20) DEFAULT '无' COMMENT '借贷宝额度',
  PRIMARY KEY (`creditListId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='贷款清单';

-- ----------------------------
-- Records of apply_creditlist
-- ----------------------------

-- ----------------------------
-- Table structure for common_dictionary
-- ----------------------------
DROP TABLE IF EXISTS `common_dictionary`;
CREATE TABLE `common_dictionary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupKey` int(11) NOT NULL,
  `groupValue` varchar(20) CHARACTER SET utf8 NOT NULL,
  `itemKey` int(11) NOT NULL,
  `itemValue` varchar(20) CHARACTER SET utf8 NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='数据字典';

-- ----------------------------
-- Records of common_dictionary
-- ----------------------------
