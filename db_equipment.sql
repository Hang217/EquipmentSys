/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80016
 Source Host           : localhost:3306
 Source Schema         : db_equipment

 Target Server Type    : MySQL
 Target Server Version : 80016
 File Encoding         : 65001

 Date: 25/06/2019 15:09:46
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_department
-- ----------------------------
DROP TABLE IF EXISTS `t_department`;
CREATE TABLE `t_department`  (
  `id` int(8) NOT NULL,
  `deptName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_department
-- ----------------------------
INSERT INTO `t_department` VALUES (101, '管理部', '管理公司职员及事务');
INSERT INTO `t_department` VALUES (102, '修理部', '修理设备');
INSERT INTO `t_department` VALUES (103, '销售部', '出售设备');
INSERT INTO `t_department` VALUES (104, '服务部', '服务客户');

-- ----------------------------
-- Table structure for t_equipment
-- ----------------------------
DROP TABLE IF EXISTS `t_equipment`;
CREATE TABLE `t_equipment`  (
  `id` int(8) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `typeId` int(8) NOT NULL,
  `typeName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `state` int(8) NOT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_equipment
-- ----------------------------
INSERT INTO `t_equipment` VALUES (1, '瑞玛', '1001', 1, '鼠标', 2, '点击');
INSERT INTO `t_equipment` VALUES (2, '方正科技', '1002', 2, '键盘', 1, '输入字符');
INSERT INTO `t_equipment` VALUES (3, 'founder', '1003', 3, '显示屏', 1, '输出');
INSERT INTO `t_equipment` VALUES (4, '瑞龙', '1004', 4, '主机', 3, '控制和运算');

-- ----------------------------
-- Table structure for t_equipmenttype
-- ----------------------------
DROP TABLE IF EXISTS `t_equipmenttype`;
CREATE TABLE `t_equipmenttype`  (
  `id` int(8) NOT NULL,
  `typeName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_equipmenttype
-- ----------------------------
INSERT INTO `t_equipmenttype` VALUES (1, '鼠标', '点击');
INSERT INTO `t_equipmenttype` VALUES (2, '键盘', '输入字符');
INSERT INTO `t_equipmenttype` VALUES (3, '显示屏', '输出');
INSERT INTO `t_equipmenttype` VALUES (4, '主机', '控制和运算');

-- ----------------------------
-- Table structure for t_repair
-- ----------------------------
DROP TABLE IF EXISTS `t_repair`;
CREATE TABLE `t_repair`  (
  `id` int(8) NOT NULL,
  `equipmentId` int(8) NOT NULL,
  `equipmentName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `equipmentNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `userMan` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `repairMan` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `repairTime` datetime(0) NOT NULL,
  `finishTime` datetime(0) NOT NULL,
  `state` int(8) NOT NULL,
  `finishState` int(8) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_repair
-- ----------------------------
INSERT INTO `t_repair` VALUES (1, 1, '瑞玛', '1001', 'ty', 'yx', '2019-06-08 08:00:00', '2019-06-26 10:00:00', 1, 2);
INSERT INTO `t_repair` VALUES (2, 1, '瑞玛', '1001', 'ljy', 'yhb', '2019-06-08 10:00:00', '2019-06-26 09:00:00', 1, 1);

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `id` int(8) NOT NULL,
  `userName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trueName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `roleName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `deptId` int(8) NOT NULL,
  `deptName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (1100, 'admin', 'admin', 'adminor', '管理员', 101, '管理部');
INSERT INTO `t_user` VALUES (1101, 'yx', '123', '杨三金', '维修者', 102, '修理部');
INSERT INTO `t_user` VALUES (1102, 'lkm', '123', '李四', '使用者', 103, '销售部');
INSERT INTO `t_user` VALUES (1103, 'ty', '123', '田鸡', '使用者', 104, '服务部');
INSERT INTO `t_user` VALUES (1104, 'yhb', '123', '杨哈皮', '维修者', 102, '修理部');
INSERT INTO `t_user` VALUES (1105, 'ljy', '123', '一加一', '使用者', 103, '销售部');
INSERT INTO `t_user` VALUES (1106, 'lql', '123', '立起来', '使用者', 103, '销售部');
INSERT INTO `t_user` VALUES (1107, 'cp', '123', '陈皮', '使用者', 104, '服务部');
INSERT INTO `t_user` VALUES (1108, 'zyt', '123', '中央台', '使用者', 104, '服务部');

SET FOREIGN_KEY_CHECKS = 1;
