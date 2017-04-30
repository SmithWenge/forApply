/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : application

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2017-04-30 17:45:33
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
  `adminUserTel` varchar(20) NOT NULL,
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
  `jiedaibaoLimit` varchar(20) NOT NULL DEFAULT '无' COMMENT '借贷宝额度',
  `deleteFlag` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`creditListId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='贷款清单';

-- ----------------------------
-- Records of apply_creditlist
-- ----------------------------
INSERT INTO `apply_creditlist` VALUES ('a05805bf-e85b-434a-a966-ca3effe03ac1', '1000', '史汉文', '18632239374', '1', '21', '大连交通', '学生', '6593399', '100', '100', '', '', '', '0');

-- ----------------------------
-- Table structure for lgb_dictionary
-- ----------------------------
DROP TABLE IF EXISTS `lgb_dictionary`;
CREATE TABLE `lgb_dictionary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupKey` int(11) NOT NULL,
  `groupValue` varchar(45) NOT NULL,
  `itemKey` int(11) NOT NULL,
  `itemValue` varchar(45) NOT NULL,
  `status` int(11) NOT NULL,
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COMMENT='数据字典';

-- ----------------------------
-- Records of lgb_dictionary
-- ----------------------------
INSERT INTO `lgb_dictionary` VALUES ('1', '1', 'deleteFlag', '1', '已删除', '1', '1');
INSERT INTO `lgb_dictionary` VALUES ('2', '1', 'deleteFlag', '0', '未删除', '1', '1');
INSERT INTO `lgb_dictionary` VALUES ('4', '2', 'userSex', '1', '男', '1', '1');
INSERT INTO `lgb_dictionary` VALUES ('5', '2', 'userSex', '2', '女', '1', '1');
INSERT INTO `lgb_dictionary` VALUES ('6', '3', 'logAction', '1', '检索', '1', '1');
INSERT INTO `lgb_dictionary` VALUES ('7', '3', 'logAction', '2', '删除', '1', '1');
INSERT INTO `lgb_dictionary` VALUES ('8', '3', 'logAction', '3', '添加', '1', '1');
INSERT INTO `lgb_dictionary` VALUES ('9', '3', 'logAction', '4', '修改', '1', '1');
INSERT INTO `lgb_dictionary` VALUES ('10', '3', 'logAction', '5', '其他', '1', '1');
INSERT INTO `lgb_dictionary` VALUES ('11', '4', 'logLevel', '1', '用户', '1', '1');
INSERT INTO `lgb_dictionary` VALUES ('12', '4', 'logLevel', '2', '管理员', '1', '1');

-- ----------------------------
-- Table structure for lgb_log
-- ----------------------------
DROP TABLE IF EXISTS `lgb_log`;
CREATE TABLE `lgb_log` (
  `logId` int(11) NOT NULL AUTO_INCREMENT,
  `logAction` tinyint(2) NOT NULL COMMENT '操作：1：检索 2：删除 3：添加 4：修改 5：其他',
  `logLevel` tinyint(2) NOT NULL COMMENT '人员类型：1：用户;2：管理员',
  `logContent` varchar(255) NOT NULL COMMENT '内容',
  `logUser` varchar(45) NOT NULL COMMENT '操作者',
  `logTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleteFlag` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否删除：0：否1：删除',
  PRIMARY KEY (`logId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COMMENT='日志表\r\n';

-- ----------------------------
-- Records of lgb_log
-- ----------------------------
INSERT INTO `lgb_log` VALUES ('1', '3', '1', '提交申请贷款1000', '史汉文', '2017-04-30 16:56:35', '0');
INSERT INTO `lgb_log` VALUES ('2', '3', '1', '提交申请贷款1000', '', '2017-04-30 17:26:00', '0');
INSERT INTO `lgb_log` VALUES ('3', '3', '1', '提交申请贷款1000', '', '2017-04-30 17:27:48', '0');
INSERT INTO `lgb_log` VALUES ('4', '3', '1', '提交申请贷款1000', '', '2017-04-30 17:30:09', '0');
INSERT INTO `lgb_log` VALUES ('5', '3', '1', '提交申请贷款1000', '', '2017-04-30 17:32:51', '0');
INSERT INTO `lgb_log` VALUES ('6', '3', '1', '提交申请贷款1000', '', '2017-04-30 17:34:43', '0');
