/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : application

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2017-05-05 12:41:50
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for apply_admin
-- ----------------------------
DROP TABLE IF EXISTS `apply_admin`;
CREATE TABLE `apply_admin` (
  `adminId` varchar(50) NOT NULL COMMENT '用户Id',
  `adminUserName` varchar(45) NOT NULL COMMENT '用户姓名',
  `adminPassWord` varchar(255) NOT NULL COMMENT '用户登录密码',
  `adminUserTel` varchar(20) NOT NULL,
  `adminLoginName` varchar(45) NOT NULL COMMENT '用户登录名',
  `deleteFlag` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`adminId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理员信息表';

-- ----------------------------
-- Records of apply_admin
-- ----------------------------
INSERT INTO `apply_admin` VALUES ('1111', '史汉文', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', '18632239374', 'admin', '0');

-- ----------------------------
-- Table structure for apply_creditlist
-- ----------------------------
DROP TABLE IF EXISTS `apply_creditlist`;
CREATE TABLE `apply_creditlist` (
  `creditListId` varchar(45) NOT NULL COMMENT '账单Id',
  `creditAmount` varchar(20) NOT NULL COMMENT '贷款数额',
  `userName` varchar(20) NOT NULL COMMENT '用户姓名',
  `userTel` varchar(20) NOT NULL COMMENT '用户电话',
  `userSex` tinyint(4) NOT NULL COMMENT '用户性别',
  `userAge` varchar(4) NOT NULL COMMENT '用户年龄',
  `workUnit` varchar(45) NOT NULL COMMENT '工作单位',
  `userPost` varchar(45) NOT NULL COMMENT '工作岗位',
  `unitTel` varchar(20) DEFAULT '无' COMMENT '工作电话',
  `zhimaNum` varchar(20) NOT NULL COMMENT '芝麻信用积分',
  `huabeiLimit` varchar(20) NOT NULL COMMENT '花呗额度',
  `jiebeiLimit` varchar(20) DEFAULT '无' COMMENT '借呗额度',
  `creditCardLimit` varchar(20) DEFAULT '无' COMMENT '信用卡额度',
  `jiedaibaoLimit` varchar(20) NOT NULL DEFAULT '无' COMMENT '借贷宝额度',
  `listState` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1:未审核;2:审核通过;3:审核未通过',
  `listDate` date NOT NULL,
  `listTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleteFlag` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`creditListId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='贷款清单';

-- ----------------------------
-- Records of apply_creditlist
-- ----------------------------
INSERT INTO `apply_creditlist` VALUES ('63a4bf63-4047-4c58-8382-3e36cc64e205', '1000', 'shi', '18632239374', '1', '19', 'sdaf', 'xuesheng', '6593399', '100', '100', '', '', '', '3', '2017-05-03', '2017-05-03 16:09:19', '0');
INSERT INTO `apply_creditlist` VALUES ('a05805bf-e85b-434a-a966-ca3effe03ac1', '1000', '史汉文', '18632239374', '1', '21', '大连交通', '学生', '6593399', '100', '100', '', '', '', '1', '2017-05-02', '2017-05-02 19:32:38', '0');
INSERT INTO `apply_creditlist` VALUES ('e9f4a538-1796-4225-9cc4-0fe0fa1c24d7', '1000', '史汉文', '18632239374', '1', '18', '大连交大', '学生', '659359', '100', '100', '', '', '', '1', '2017-05-03', '2017-05-03 13:37:29', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COMMENT='数据字典';

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
INSERT INTO `lgb_dictionary` VALUES ('13', '5', 'listState', '1', '未审核', '0', '0');
INSERT INTO `lgb_dictionary` VALUES ('14', '5', 'listState', '2', '审核通过', '0', '0');
INSERT INTO `lgb_dictionary` VALUES ('15', '5', 'listState', '3', '审核未通过', '0', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COMMENT='日志表\r\n';

-- ----------------------------
-- Records of lgb_log
-- ----------------------------
INSERT INTO `lgb_log` VALUES ('1', '3', '1', '提交申请贷款1000', '史汉文', '2017-04-30 16:56:35', '0');
INSERT INTO `lgb_log` VALUES ('7', '5', '1', '登陆系统', 'admin', '2017-05-03 11:51:18', '0');
INSERT INTO `lgb_log` VALUES ('8', '4', '1', '更改密码', 'admin', '2017-05-03 11:51:34', '0');
INSERT INTO `lgb_log` VALUES ('9', '5', '1', '登陆系统', 'admin', '2017-05-03 11:54:10', '0');
INSERT INTO `lgb_log` VALUES ('10', '4', '1', '更改密码', 'admin', '2017-05-03 11:54:25', '0');
INSERT INTO `lgb_log` VALUES ('11', '5', '1', '登陆系统', 'admin', '2017-05-03 11:54:28', '0');
INSERT INTO `lgb_log` VALUES ('12', '5', '1', '登陆系统', 'admin', '2017-05-03 11:54:34', '0');
INSERT INTO `lgb_log` VALUES ('13', '5', '1', '登陆系统', 'admin', '2017-05-03 13:24:25', '0');
INSERT INTO `lgb_log` VALUES ('14', '3', '1', '提交申请贷款1000', '史汉文', '2017-05-03 13:37:29', '0');
INSERT INTO `lgb_log` VALUES ('15', '5', '2', '登陆系统', 'admin', '2017-05-03 13:38:20', '0');
INSERT INTO `lgb_log` VALUES ('16', '5', '2', '登陆系统', 'admin', '2017-05-03 15:33:13', '0');
INSERT INTO `lgb_log` VALUES ('17', '5', '2', '登陆系统', 'admin', '2017-05-03 15:42:09', '0');
INSERT INTO `lgb_log` VALUES ('18', '5', '2', '登陆系统', 'admin', '2017-05-03 15:45:48', '0');
INSERT INTO `lgb_log` VALUES ('19', '5', '2', '登陆系统', 'admin', '2017-05-03 16:07:36', '0');
INSERT INTO `lgb_log` VALUES ('20', '3', '1', '提交申请贷款1000', 'shi', '2017-05-03 16:09:18', '0');
INSERT INTO `lgb_log` VALUES ('21', '5', '2', '登陆系统', 'admin', '2017-05-03 16:20:47', '0');
INSERT INTO `lgb_log` VALUES ('22', '5', '2', '登陆系统', 'admin', '2017-05-03 18:13:23', '0');
INSERT INTO `lgb_log` VALUES ('23', '5', '2', '登陆系统', 'admin', '2017-05-03 18:40:41', '0');
INSERT INTO `lgb_log` VALUES ('24', '5', '2', '登陆系统', 'admin', '2017-05-03 18:59:13', '0');
INSERT INTO `lgb_log` VALUES ('25', '5', '2', '登陆系统', 'admin', '2017-05-03 19:05:09', '0');
INSERT INTO `lgb_log` VALUES ('26', '5', '2', '登陆系统', 'admin', '2017-05-03 19:57:43', '0');
INSERT INTO `lgb_log` VALUES ('27', '5', '2', '登陆系统', 'admin', '2017-05-03 19:57:47', '0');
INSERT INTO `lgb_log` VALUES ('28', '5', '2', '登陆系统', 'admin', '2017-05-03 19:59:08', '0');
INSERT INTO `lgb_log` VALUES ('29', '5', '2', '登陆系统', 'admin', '2017-05-03 20:00:16', '0');
INSERT INTO `lgb_log` VALUES ('30', '5', '2', '登陆系统', 'admin', '2017-05-03 20:00:20', '0');
INSERT INTO `lgb_log` VALUES ('31', '5', '2', '登陆系统', 'admin', '2017-05-03 20:06:22', '0');
INSERT INTO `lgb_log` VALUES ('32', '5', '2', '登陆系统', 'admin', '2017-05-03 20:08:01', '0');
INSERT INTO `lgb_log` VALUES ('33', '5', '2', '登陆系统', 'admin', '2017-05-03 20:15:14', '0');
INSERT INTO `lgb_log` VALUES ('34', '5', '2', '登陆系统', 'admin', '2017-05-03 20:47:09', '0');
INSERT INTO `lgb_log` VALUES ('35', '5', '2', '登陆系统', 'admin', '2017-05-03 20:50:40', '0');
INSERT INTO `lgb_log` VALUES ('36', '5', '2', '登陆系统', 'admin', '2017-05-03 21:30:59', '0');
INSERT INTO `lgb_log` VALUES ('37', '5', '2', '登陆系统', 'admin', '2017-05-03 23:02:18', '0');
INSERT INTO `lgb_log` VALUES ('38', '5', '2', '登陆系统', '史汉文', '2017-05-03 23:22:24', '0');
INSERT INTO `lgb_log` VALUES ('39', '2', '1', '删除贷款单ID为63a4bf63-4047-4c58-8382-3e36cc64e205', '史汉文', '2017-05-03 23:23:37', '0');
INSERT INTO `lgb_log` VALUES ('40', '5', '2', '登陆系统', '史汉文', '2017-05-03 23:28:05', '0');
INSERT INTO `lgb_log` VALUES ('41', '2', '1', '删除贷款单ID为e9f4a538-1796-4225-9cc4-0fe0fa1c24d7', '史汉文', '2017-05-03 23:29:14', '0');
INSERT INTO `lgb_log` VALUES ('42', '5', '2', '登陆系统', '史汉文', '2017-05-04 00:42:32', '0');
INSERT INTO `lgb_log` VALUES ('43', '4', '2', '编辑贷款单，其ID为63a4bf63-4047-4c58-8382-3e36cc64e205', '史汉文', '2017-05-04 00:42:48', '0');
INSERT INTO `lgb_log` VALUES ('44', '4', '2', '编辑贷款单，其ID为63a4bf63-4047-4c58-8382-3e36cc64e205', '史汉文', '2017-05-04 00:42:58', '0');
INSERT INTO `lgb_log` VALUES ('45', '5', '2', '登陆系统', '史汉文', '2017-05-04 01:00:46', '0');
INSERT INTO `lgb_log` VALUES ('46', '5', '2', '登陆系统', '史汉文', '2017-05-05 10:25:35', '0');
INSERT INTO `lgb_log` VALUES ('47', '5', '2', '登陆系统', '史汉文', '2017-05-05 11:58:05', '0');
INSERT INTO `lgb_log` VALUES ('48', '5', '2', '登陆系统', '史汉文', '2017-05-05 12:05:25', '0');
INSERT INTO `lgb_log` VALUES ('49', '5', '2', '登陆系统', '史汉文', '2017-05-05 12:14:12', '0');
INSERT INTO `lgb_log` VALUES ('50', '5', '2', '登陆系统', '史汉文', '2017-05-05 12:20:07', '0');
INSERT INTO `lgb_log` VALUES ('51', '5', '2', '登陆系统', '史汉文', '2017-05-05 12:39:55', '0');
