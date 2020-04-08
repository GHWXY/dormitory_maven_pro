/*
 Navicat Premium Data Transfer

 Source Server         : MySQL5.7
 Source Server Type    : MySQL
 Source Server Version : 50723
 Source Host           : localhost:3307
 Source Schema         : dormitory

 Target Server Type    : MySQL
 Target Server Version : 50723
 File Encoding         : 65001

 Date: 26/03/2020 08:40:22
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for d_admin
-- ----------------------------
DROP TABLE IF EXISTS `d_admin`;
CREATE TABLE `d_admin`  (
  `a_id` int(11) NOT NULL AUTO_INCREMENT,
  `a_username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `a_password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `a_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `a_phone` bigint(20) NULL DEFAULT NULL,
  `a_power` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `a_describe` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`a_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of d_admin
-- ----------------------------
INSERT INTO `d_admin` VALUES (1, '王鑫钰', '696E25FDACEE8106BC5232AFC69155D6', '王鑫钰', 138138138, '1', '高');
INSERT INTO `d_admin` VALUES (2, 'zj', '696E25FDACEE8106BC5232AFC69155D6', '张杰', 138138138, '2', '低');
INSERT INTO `d_admin` VALUES (4, 'zk', '696E25FDACEE8106BC5232AFC69155D6', '赵凯', 138138138, '2', '低');
INSERT INTO `d_admin` VALUES (5, 'ywj', '696E25FDACEE8106BC5232AFC69155D6', '杨雯雯', 138138138, '1', '高');
INSERT INTO `d_admin` VALUES (6, 'wh', '696E25FDACEE8106BC5232AFC69155D6', '王皓', 138138138, '1', '高');
INSERT INTO `d_admin` VALUES (8, 'zj', '696E25FDACEE8106BC5232AFC69155D6', '赵佳', 138138138, '2', '低');
INSERT INTO `d_admin` VALUES (9, 'wf', '696E25FDACEE8106BC5232AFC69155D6', '王凡', 138138138, '1', '高');
INSERT INTO `d_admin` VALUES (10, 'zn', '696E25FDACEE8106BC5232AFC69155D6', '张娜', 138138138, '1', '高');
INSERT INTO `d_admin` VALUES (11, 'jzh', '696E25FDACEE8106BC5232AFC69155D6', '蒋子华', 138138138, '2', '低');
INSERT INTO `d_admin` VALUES (12, 'xl', '696E25FDACEE8106BC5232AFC69155D6', '薛磊', 138138138, '2', '低');

-- ----------------------------
-- Table structure for d_class
-- ----------------------------
DROP TABLE IF EXISTS `d_class`;
CREATE TABLE `d_class`  (
  `c_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_classid` int(11) NULL DEFAULT NULL,
  `c_classname` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `c_counsellor` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`c_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of d_class
-- ----------------------------
INSERT INTO `d_class` VALUES (1, 141, '生物', '徐超');
INSERT INTO `d_class` VALUES (2, 151, '应化', '刘晨');
INSERT INTO `d_class` VALUES (3, 142, '土木', '孙玲');
INSERT INTO `d_class` VALUES (4, 161, '物流', '刘阳');
INSERT INTO `d_class` VALUES (5, 153, '数师', '张宇');
INSERT INTO `d_class` VALUES (6, 162, '物流', '刘阳');
INSERT INTO `d_class` VALUES (7, 171, '自动化', '周涵涵');
INSERT INTO `d_class` VALUES (8, 154, '土木', '孙玲');
INSERT INTO `d_class` VALUES (9, 151, '纺织', '赵凯');
INSERT INTO `d_class` VALUES (10, 153, '金融', '刘培');
INSERT INTO `d_class` VALUES (14, NULL, NULL, NULL);
INSERT INTO `d_class` VALUES (15, NULL, NULL, NULL);
INSERT INTO `d_class` VALUES (16, NULL, NULL, NULL);
INSERT INTO `d_class` VALUES (17, 85, '的说法', '发的');
INSERT INTO `d_class` VALUES (18, 28, 'java1', '王鑫钰');

-- ----------------------------
-- Table structure for d_dormgrade
-- ----------------------------
DROP TABLE IF EXISTS `d_dormgrade`;
CREATE TABLE `d_dormgrade`  (
  `g_id` int(11) NOT NULL AUTO_INCREMENT,
  `d_id` int(11) NOT NULL,
  `d_dormbuilding` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `d_grade` int(11) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`g_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of d_dormgrade
-- ----------------------------
INSERT INTO `d_dormgrade` VALUES (1, 301, '24号楼', 10, '2019-04-25 10:51:17', '2020-02-08 21:05:27');
INSERT INTO `d_dormgrade` VALUES (2, 302, '24号楼', 7, '2019-05-01 16:36:47', '2019-05-01 16:36:55');
INSERT INTO `d_dormgrade` VALUES (3, 322, '24号楼', 8, '2019-05-04 16:37:42', '2019-05-04 16:37:47');
INSERT INTO `d_dormgrade` VALUES (4, 602, '23号楼', 7, '2019-05-08 16:38:25', '2019-05-08 16:38:30');
INSERT INTO `d_dormgrade` VALUES (5, 112, '22号楼', 7, '2019-05-12 16:38:53', '2019-05-12 16:39:00');
INSERT INTO `d_dormgrade` VALUES (6, 222, '27号楼', 9, '2019-05-09 16:39:37', '2019-05-09 16:39:41');
INSERT INTO `d_dormgrade` VALUES (7, 213, '27号楼', 8, '2019-05-10 16:40:02', '2019-05-10 16:40:08');
INSERT INTO `d_dormgrade` VALUES (8, 824, '5', 3, '2020-03-16 23:54:25', '2020-03-16 23:54:25');
INSERT INTO `d_dormgrade` VALUES (9, 822, '6', 10, '2020-03-17 21:13:00', '2020-03-17 21:13:00');
INSERT INTO `d_dormgrade` VALUES (10, 456, '6', 8, '2020-03-18 00:31:37', '2020-03-18 00:31:37');
INSERT INTO `d_dormgrade` VALUES (11, 456, '8', 100, '2020-03-18 22:47:26', '2020-03-18 22:47:26');

-- ----------------------------
-- Table structure for d_dormitoryinfo
-- ----------------------------
DROP TABLE IF EXISTS `d_dormitoryinfo`;
CREATE TABLE `d_dormitoryinfo`  (
  `d_id` int(11) NOT NULL AUTO_INCREMENT,
  `s_dormitoryid` int(11) NOT NULL,
  `d_dormbuilding` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `d_bedtotal` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `d_bed` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `a_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`d_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of d_dormitoryinfo
-- ----------------------------
INSERT INTO `d_dormitoryinfo` VALUES (1, 311, '24号楼', '4', '6', '周荀凯2');
INSERT INTO `d_dormitoryinfo` VALUES (2, 322, '24号楼', '4', '4', '周荀凯');
INSERT INTO `d_dormitoryinfo` VALUES (3, 601, '23号楼', '6', '6', '张杰');
INSERT INTO `d_dormitoryinfo` VALUES (4, 602, '23号楼', '6', '5', '张杰');
INSERT INTO `d_dormitoryinfo` VALUES (5, 111, '22号楼', '4', '4', '杨雯雯');
INSERT INTO `d_dormitoryinfo` VALUES (6, 112, '22号楼', '4', '3', '杨雯雯');
INSERT INTO `d_dormitoryinfo` VALUES (7, 222, '27号楼', '6', '6', '张伟');
INSERT INTO `d_dormitoryinfo` VALUES (8, 213, '27号楼', '4', '4', '张伟');
INSERT INTO `d_dormitoryinfo` VALUES (9, 312, '26号楼', '6', '6', '薛磊');
INSERT INTO `d_dormitoryinfo` VALUES (10, 313, '22号楼', '4', '4', '张磊');
INSERT INTO `d_dormitoryinfo` VALUES (11, 323, '22号楼', '6', '5', '张磊');
INSERT INTO `d_dormitoryinfo` VALUES (12, 301, '24号楼', '6', '6', '周荀凯');
INSERT INTO `d_dormitoryinfo` VALUES (13, 302, '24号楼', '6', '6', '周荀凯');
INSERT INTO `d_dormitoryinfo` VALUES (14, 423, '29号楼', '4', '3', '郭浩然');
INSERT INTO `d_dormitoryinfo` VALUES (15, 520, '10', '10', '9', '王鑫钰');

-- ----------------------------
-- Table structure for d_dormrepair
-- ----------------------------
DROP TABLE IF EXISTS `d_dormrepair`;
CREATE TABLE `d_dormrepair`  (
  `r_id` int(11) NOT NULL AUTO_INCREMENT,
  `d_id` int(11) NOT NULL,
  `d_dormbuilding` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `r_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `reason` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`r_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of d_dormrepair
-- ----------------------------
INSERT INTO `d_dormrepair` VALUES (1, 301, '24号楼', '王涛', '水池', '2019-05-13 22:39:58', '2019-05-13 22:39:58');
INSERT INTO `d_dormrepair` VALUES (2, 322, '24号楼', '王涛', '灯管', '2019-05-11 16:29:20', '2019-05-14 16:29:35');
INSERT INTO `d_dormrepair` VALUES (3, 601, '23号楼', '冯军', '水龙头', '2019-05-15 16:31:14', '2019-05-14 16:31:20');
INSERT INTO `d_dormrepair` VALUES (4, 601, '23号楼', '冯军', '插孔', '2019-05-15 16:31:56', '2019-05-15 16:32:04');
INSERT INTO `d_dormrepair` VALUES (5, 213, '27号楼', '冯军', '排风扇', '2019-05-18 16:32:54', '2019-05-14 16:33:00');
INSERT INTO `d_dormrepair` VALUES (6, 312, '26号楼', '彭建国', '空调', '2019-05-20 16:33:56', '2019-05-20 16:34:01');
INSERT INTO `d_dormrepair` VALUES (7, 824, '5', '哇嘎', '反对法', '2020-03-18 23:26:49', '2020-03-18 23:26:49');

-- ----------------------------
-- Table structure for d_stgrade
-- ----------------------------
DROP TABLE IF EXISTS `d_stgrade`;
CREATE TABLE `d_stgrade`  (
  `g_id` int(11) NOT NULL AUTO_INCREMENT,
  `s_studentid` int(11) NOT NULL,
  `s_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `s_grade` int(11) NULL DEFAULT NULL,
  `s_classid` int(11) NULL DEFAULT NULL,
  `s_dormitoryid` int(11) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`g_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of d_stgrade
-- ----------------------------
INSERT INTO `d_stgrade` VALUES (1, 1413032001, '张杰', 6, 141, 301, '2019-04-26 09:56:51', '2019-04-26 11:02:13');
INSERT INTO `d_stgrade` VALUES (2, 1413032002, '赵凯', 7, 141, 301, '2019-05-01 17:00:05', '2019-05-01 17:00:13');
INSERT INTO `d_stgrade` VALUES (3, 1413032003, '许文文', 6, 141, 301, '2019-05-06 17:00:54', '2019-05-06 17:01:01');
INSERT INTO `d_stgrade` VALUES (4, 1413032003, '许文文', 7, 141, 301, '2019-05-16 17:01:33', '2019-05-16 17:02:15');
INSERT INTO `d_stgrade` VALUES (5, 1413032004, '王浩', 7, 141, 301, '2019-05-10 17:03:03', '2019-05-10 17:03:09');
INSERT INTO `d_stgrade` VALUES (6, 1413032005, '张伟', 8, 141, 301, '2019-05-14 17:03:53', '2019-05-14 17:03:56');
INSERT INTO `d_stgrade` VALUES (7, 1513112412, '赵跃', 9, 151, 112, '2019-05-08 17:05:04', '2019-05-08 17:05:07');
INSERT INTO `d_stgrade` VALUES (8, 1513112412, '赵跃', 9, 151, 112, '2019-05-17 17:05:34', '2019-05-17 17:05:39');
INSERT INTO `d_stgrade` VALUES (9, 1513122418, '田野', 8, 151, 213, '2019-05-15 17:06:28', '2019-05-15 17:06:35');
INSERT INTO `d_stgrade` VALUES (10, 1513122419, '张嘉佳', 8, 151, 213, '2019-05-15 17:07:09', '2019-05-15 17:07:13');
INSERT INTO `d_stgrade` VALUES (11, 1850412808, '向凯', 100, 141, 309, '2020-03-18 22:48:03', '2020-03-18 22:48:03');

-- ----------------------------
-- Table structure for d_student
-- ----------------------------
DROP TABLE IF EXISTS `d_student`;
CREATE TABLE `d_student`  (
  `s_id` int(11) NOT NULL AUTO_INCREMENT,
  `s_studentid` int(11) NULL DEFAULT NULL,
  `s_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `s_sex` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `s_age` int(11) NULL DEFAULT NULL,
  `s_phone` bigint(20) NULL DEFAULT NULL,
  `s_classid` int(11) NULL DEFAULT NULL,
  `s_classname` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `s_dormitoryid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`s_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of d_student
-- ----------------------------
INSERT INTO `d_student` VALUES (2, 1413032002, '王鑫钰', '男', 24, 138138138, 141, '生物', 824);
INSERT INTO `d_student` VALUES (3, 1413032003, '许文', '男', 21, 138138138, 141, '生物', 301);
INSERT INTO `d_student` VALUES (4, 1413032004, '王浩', '男', 22, 138138138, 141, '生物', 301);
INSERT INTO `d_student` VALUES (5, 1413032005, '张伟', '男', 22, 138138138, 141, '土木', 301);
INSERT INTO `d_student` VALUES (6, 1413032006, '郭顶', '男', 21, 138138138, 141, '土木', 301);
INSERT INTO `d_student` VALUES (8, 1513112412, '赵跃', '男', 21, 138138138, 151, '纺织', 112);
INSERT INTO `d_student` VALUES (9, 1513112413, '孙畅', '男', 21, 138138138, 151, '纺织', 112);
INSERT INTO `d_student` VALUES (10, 1513122417, '周帆', '男', 21, 138138138, 161, '物流', 213);
INSERT INTO `d_student` VALUES (11, 1513122418, '田野', '男', 21, 138138138, 153, '数师', 213);
INSERT INTO `d_student` VALUES (12, 1513122419, '张嘉佳', '男', 20, 138138138, 153, '金融', 213);
INSERT INTO `d_student` VALUES (13, 1513122420, '陈昊', '男', 21, 138138138, 153, '金融', 213);
INSERT INTO `d_student` VALUES (14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `d_student` VALUES (15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `d_student` VALUES (16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `d_student` VALUES (17, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `d_student` VALUES (18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `d_student` VALUES (19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `d_student` VALUES (20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `d_student` VALUES (21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `d_student` VALUES (22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `d_student` VALUES (23, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `d_student` VALUES (24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `d_student` VALUES (25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `d_student` VALUES (26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for d_visitor
-- ----------------------------
DROP TABLE IF EXISTS `d_visitor`;
CREATE TABLE `d_visitor`  (
  `v_id` int(11) NOT NULL AUTO_INCREMENT,
  `v_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `v_phone` bigint(20) NULL DEFAULT NULL,
  `v_dormitoryid` int(11) NULL DEFAULT NULL,
  `v_dormbuilding` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`v_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of d_visitor
-- ----------------------------
INSERT INTO `d_visitor` VALUES (1, '郑杰', 138138138, 301, '24号楼', '2019-05-14 13:26:13');
INSERT INTO `d_visitor` VALUES (2, '李博', 138138138, 322, '24号楼', '2019-05-12 19:36:23');
INSERT INTO `d_visitor` VALUES (3, '张盈盈', 138138138, 601, '23号楼', '2019-05-13 19:37:11');
INSERT INTO `d_visitor` VALUES (4, '王涛', 138138138, 111, '22号楼', '2019-05-15 19:37:46');
INSERT INTO `d_visitor` VALUES (5, '胡浩', 138138138, 222, '27号楼', '2019-05-16 19:38:27');
INSERT INTO `d_visitor` VALUES (6, '陈昊', 138138138, 213, '27号楼', '2019-05-18 19:39:03');
INSERT INTO `d_visitor` VALUES (7, '刘军', 138138138, 213, '27号楼', '2019-05-20 19:39:42');
INSERT INTO `d_visitor` VALUES (8, '黄智', 138138138, 312, '26号楼', '2019-05-22 19:46:38');
INSERT INTO `d_visitor` VALUES (9, '郑杰', 123123123, 311, '24号楼', '2019-05-16 16:59:06');
INSERT INTO `d_visitor` VALUES (10, NULL, NULL, NULL, NULL, '2020-03-19 00:10:36');

-- ----------------------------
-- Table structure for leavemsg
-- ----------------------------
DROP TABLE IF EXISTS `leavemsg`;
CREATE TABLE `leavemsg`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stuid` varchar(8) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL COMMENT '学号',
  `name` varchar(5) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL COMMENT '请假人',
  `firsttime` datetime(0) NULL DEFAULT NULL COMMENT '请假开始时间  ',
  `lasttime` datetime(0) NULL DEFAULT NULL COMMENT '请假结束时间',
  `leavereason` varchar(30) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL COMMENT '请假理由',
  `address` varchar(8) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL COMMENT '请假去向',
  `studentphone` varchar(11) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL COMMENT '联系方式',
  `parentsphone` varchar(11) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL COMMENT '家长联系方式',
  `state` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = gbk COLLATE = gbk_chinese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of leavemsg
-- ----------------------------
INSERT INTO `leavemsg` VALUES (1, '04140826', '余伟靖', '2017-03-11 00:00:00', '2017-04-08 00:00:00', '有事', '吉珠外', '13631260350', '12345678910', '已结束');
INSERT INTO `leavemsg` VALUES (6, '04140819', '唐建章', '2017-04-14 00:00:00', '2017-04-18 00:00:00', '11', '11', '13631260350', '13631260350', '已拒绝');
INSERT INTO `leavemsg` VALUES (9, '02140801', '张三', '2017-04-06 00:00:00', '2017-04-11 00:00:00', '有事', '吉珠外', '12345678911', '98765432101', '已审批');

-- ----------------------------
-- Table structure for login
-- ----------------------------
DROP TABLE IF EXISTS `login`;
CREATE TABLE `login`  (
  `l_id` int(11) NOT NULL AUTO_INCREMENT,
  `l_username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ll_password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`l_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission`  (
  `pid` bigint(20) NOT NULL,
  `pname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `presource` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`pid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `pid` int(10) NOT NULL AUTO_INCREMENT,
  `pname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pprice` double(10, 0) NULL DEFAULT NULL,
  `ptotal` int(5) NULL DEFAULT NULL,
  PRIMARY KEY (`pid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (1, '灯泡', 22, 1010);
INSERT INTO `product` VALUES (2, '水龙头', 15, 890);
INSERT INTO `product` VALUES (3, '凳子', 30, 600);
INSERT INTO `product` VALUES (4, '门锁', 45, 290);
INSERT INTO `product` VALUES (5, '窗帘', 30, 99);
INSERT INTO `product` VALUES (6, '风扇', 100, 48);
INSERT INTO `product` VALUES (7, '灯管', 20, 298);
INSERT INTO `product` VALUES (8, '电胶布', 5, 300);
INSERT INTO `product` VALUES (10, '21', 1, 1);
INSERT INTO `product` VALUES (11, '2121', 1, 1);
INSERT INTO `product` VALUES (12, '2121', 1, 1);
INSERT INTO `product` VALUES (13, '23', 1, 1);
INSERT INTO `product` VALUES (14, '321', 1, 1);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `rid` bigint(20) NOT NULL AUTO_INCREMENT,
  `rnum` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `rname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`rid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for role_permission_rel
-- ----------------------------
DROP TABLE IF EXISTS `role_permission_rel`;
CREATE TABLE `role_permission_rel`  (
  `rid` bigint(20) NOT NULL,
  `pid` bigint(20) NOT NULL,
  PRIMARY KEY (`rid`, `pid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for stu_login
-- ----------------------------
DROP TABLE IF EXISTS `stu_login`;
CREATE TABLE `stu_login`  (
  `sl_id` int(10) NOT NULL AUTO_INCREMENT,
  `sl_username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sl_password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sl_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stu_login
-- ----------------------------
INSERT INTO `stu_login` VALUES (1, '王鑫钰', '696E25FDACEE8106BC5232AFC69155D6');

-- ----------------------------
-- Table structure for wrongmsg
-- ----------------------------
DROP TABLE IF EXISTS `wrongmsg`;
CREATE TABLE `wrongmsg`  (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `stuid` bigint(8) NULL DEFAULT NULL,
  `stuname` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `wrongday` date NULL DEFAULT NULL,
  `wrongreason` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `result` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 75 CHARACTER SET = gbk COLLATE = gbk_chinese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wrongmsg
-- ----------------------------
INSERT INTO `wrongmsg` VALUES (13, 4140826, '余伟靖', '2017-03-22', '外网', '外网');
INSERT INTO `wrongmsg` VALUES (19, 4140826, '余伟靖', '2017-04-07', '1', '1');
INSERT INTO `wrongmsg` VALUES (20, 2140801, '张三', '2017-04-07', '唔知', '唔知');
INSERT INTO `wrongmsg` VALUES (21, 11, 'fd', '2020-03-25', '1', '1');
INSERT INTO `wrongmsg` VALUES (65, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `wrongmsg` VALUES (66, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `wrongmsg` VALUES (67, 1850412808, '对方的', '2020-03-09', '', '');
INSERT INTO `wrongmsg` VALUES (68, 1850412808, '王鑫钰', '2020-03-17', '早退', '扣分');
INSERT INTO `wrongmsg` VALUES (69, 1850412803, '静思', '2020-03-18', '得到', '得到');
INSERT INTO `wrongmsg` VALUES (70, 1850412808, 'test', '2020-03-18', 'test', 'tset');
INSERT INTO `wrongmsg` VALUES (71, 18504128, 'test2', '2020-03-20', 'test2', 'test2');
INSERT INTO `wrongmsg` VALUES (72, 18504128, '第三方', '2020-03-31', '', '');
INSERT INTO `wrongmsg` VALUES (73, 1850412808, '对方的', '2020-03-30', '', '');
INSERT INTO `wrongmsg` VALUES (74, 1850412801, '杨凯', '2020-03-01', '骚', '骚');

SET FOREIGN_KEY_CHECKS = 1;
