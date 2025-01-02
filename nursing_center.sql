/*
 Navicat Premium Data Transfer

 Source Server         : 云服务器
 Source Server Type    : MySQL
 Source Server Version : 50742
 Source Host           : 82.157.184.186:3306
 Source Schema         : nursing_center

 Target Server Type    : MySQL
 Target Server Version : 50742
 File Encoding         : 65001

 Date: 02/01/2025 09:58:51
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '密码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '姓名',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '头像',
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '角色标识',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '电话',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '邮箱',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '管理员' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'admin', 'admin', '管理员', 'http://localhost:9090/files/1735606064362-u=3900659337,4148274028&fm=253&app=138&size=w931&n=0&f=JPEG&fmt=auto.webp', 'ADMIN', '13677889922', 'admin@xm.com');
INSERT INTO `admin` VALUES (13, '111', '698d51a19d8a121ce581499d7b701668', 'feng', 'http://localhost:9090/files/1735606087498-u=2916309844,203421002&fm=253&app=138&size=w931&n=0&f=JPEG&fmt=auto.webp', 'ADMIN', '12345678900', '1111@qq.com');
INSERT INTO `admin` VALUES (15, '57968', 'e10adc3949ba59abbe56e057f20f883e', '张三', 'http://localhost:9090/files/1735606802175-u=1775724162,4143654705&fm=253&app=138&size=w931&n=0&f=JPEG&fmt=auto.jpg', 'ADMIN', '15885858986', '254877@qq.com');
INSERT INTO `admin` VALUES (16, '93961', 'e10adc3949ba59abbe56e057f20f883e', '李四', 'http://localhost:9090/files/1735606876069-u=3712364398,223648800&fm=253&app=138&size=w931&n=0&f=JPEG&fmt=auto.webp', 'ADMIN', '15885858658', '1255888@qq.com');

-- ----------------------------
-- Table structure for bed_elderly_association
-- ----------------------------
DROP TABLE IF EXISTS `bed_elderly_association`;
CREATE TABLE `bed_elderly_association`  (
  `association_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '关联记录的唯一标识符',
  `bed_id` int(11) NOT NULL COMMENT '与该关联记录关联的床位ID，外键关联到床位表',
  `elderly_id` int(11) NOT NULL COMMENT '与该关联记录关联的老人ID，外键关联到老人表',
  `check_in_date` date NOT NULL COMMENT '老人入住床位的日期',
  `bed_status` int(11) NOT NULL DEFAULT 0 COMMENT '指示老人当前是否在床位上 0 在床 1 离床',
  `leave_bed_start_time` datetime(0) NULL DEFAULT NULL COMMENT '如果老人离床，记录其离床的开始时间',
  `leave_bed_end_time` datetime(0) NULL DEFAULT NULL COMMENT '如果老人返回床位，记录其返回的时间',
  `remarks` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '关于床位与老人关联的额外信息或备注',
  `created_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '记录被添加到表中的时间',
  `updated_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '记录最后一次被修改的时间',
  PRIMARY KEY (`association_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '存储疗养院床位与老人之间的关联信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bed_elderly_association
-- ----------------------------
INSERT INTO `bed_elderly_association` VALUES (1, 1, 1, '2024-12-19', 0, NULL, NULL, NULL, '2024-12-20 16:12:44', '2024-12-20 16:12:44');

-- ----------------------------
-- Table structure for bed_info
-- ----------------------------
DROP TABLE IF EXISTS `bed_info`;
CREATE TABLE `bed_info`  (
  `bed_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '床位唯一标识符',
  `bed_number` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '床位号',
  `bed_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '床位类型',
  `bed_status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '床位状态（1空闲/2离床/3计划内离床/4离床超时/5有人/6外出/7离开/8退住）',
  `floor_number` int(11) NULL DEFAULT NULL COMMENT '楼号',
  `room_number` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '房间号',
  `floor` int(11) NULL DEFAULT NULL COMMENT '楼层',
  `status` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '状态,用于删除,1 可用，0 不可用',
  PRIMARY KEY (`bed_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 636 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '存储床位基本信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bed_info
-- ----------------------------
INSERT INTO `bed_info` VALUES (2, '2', '1', '4', 1, '101', 1, '1');
INSERT INTO `bed_info` VALUES (3, '1', '1', '5', 1, '102', 1, '1');
INSERT INTO `bed_info` VALUES (4, '2', '1', '7', 1, '102', 1, '1');
INSERT INTO `bed_info` VALUES (5, '1', '1', '8', 1, '103', 1, '1');
INSERT INTO `bed_info` VALUES (6, '2', '1', '6', 1, '103', 1, '1');
INSERT INTO `bed_info` VALUES (7, '1', '1', '2', 1, '104', 1, '1');
INSERT INTO `bed_info` VALUES (8, '2', '1', '3', 1, '104', 1, '1');
INSERT INTO `bed_info` VALUES (9, '1', '1', '3', 1, '105', 1, '1');
INSERT INTO `bed_info` VALUES (10, '1', '1', '3', 1, '106', 1, '1');
INSERT INTO `bed_info` VALUES (11, '1', '1', '7', 1, '107', 1, '1');
INSERT INTO `bed_info` VALUES (12, '2', '1', '3', 1, '107', 1, '1');
INSERT INTO `bed_info` VALUES (13, '1', '1', '2', 1, '108', 1, '1');
INSERT INTO `bed_info` VALUES (14, '2', '1', '2', 1, '108', 1, '1');
INSERT INTO `bed_info` VALUES (15, '1', '1', '4', 1, '109', 1, '1');
INSERT INTO `bed_info` VALUES (16, '1', '1', '3', 1, '110', 1, '1');
INSERT INTO `bed_info` VALUES (17, '2', '1', '3', 1, '110', 1, '1');
INSERT INTO `bed_info` VALUES (18, '1', '1', '5', 1, '111', 1, '1');
INSERT INTO `bed_info` VALUES (19, '1', '1', '7', 1, '112', 1, '1');
INSERT INTO `bed_info` VALUES (20, '2', '1', '6', 1, '112', 1, '1');
INSERT INTO `bed_info` VALUES (21, '1', '1', '6', 1, '113', 1, '1');
INSERT INTO `bed_info` VALUES (22, '1', '1', '1', 1, '114', 1, '1');
INSERT INTO `bed_info` VALUES (23, '1', '1', '1', 1, '115', 1, '1');
INSERT INTO `bed_info` VALUES (24, '1', '1', '2', 1, '116', 1, '1');
INSERT INTO `bed_info` VALUES (25, '1', '1', '3', 1, '117', 1, '1');
INSERT INTO `bed_info` VALUES (26, '2', '1', '4', 1, '117', 1, '1');
INSERT INTO `bed_info` VALUES (27, '1', '1', '7', 1, '118', 1, '1');
INSERT INTO `bed_info` VALUES (28, '1', '1', '5', 1, '115', 2, '1');
INSERT INTO `bed_info` VALUES (29, '2', '1', '1', 1, '104', 2, '1');
INSERT INTO `bed_info` VALUES (30, '1', '1', '8', 1, '114', 2, '1');
INSERT INTO `bed_info` VALUES (31, '1', '1', '4', 1, '101', 2, '1');
INSERT INTO `bed_info` VALUES (32, '1', '1', '1', 1, '116', 2, '1');
INSERT INTO `bed_info` VALUES (33, '1', '1', '2', 1, '104', 2, '1');
INSERT INTO `bed_info` VALUES (34, '1', '1', '2', 1, '108', 2, '1');
INSERT INTO `bed_info` VALUES (35, '2', '1', '2', 1, '108', 2, '1');
INSERT INTO `bed_info` VALUES (36, '1', '1', '4', 1, '117', 2, '1');
INSERT INTO `bed_info` VALUES (37, '1', '1', '7', 1, '105', 2, '1');
INSERT INTO `bed_info` VALUES (38, '2', '1', '6', 1, '110', 2, '1');
INSERT INTO `bed_info` VALUES (39, '1', '1', '6', 1, '110', 2, '1');
INSERT INTO `bed_info` VALUES (40, '2', '1', '4', 1, '101', 2, '1');
INSERT INTO `bed_info` VALUES (41, '2', '1', '8', 1, '117', 2, '1');
INSERT INTO `bed_info` VALUES (42, '1', '1', '8', 1, '109', 2, '1');
INSERT INTO `bed_info` VALUES (43, '1', '1', '1', 1, '106', 2, '1');
INSERT INTO `bed_info` VALUES (44, '1', '1', '1', 1, '111', 2, '1');
INSERT INTO `bed_info` VALUES (45, '1', '1', '6', 1, '102', 2, '1');
INSERT INTO `bed_info` VALUES (46, '2', '1', '2', 1, '112', 2, '1');
INSERT INTO `bed_info` VALUES (47, '1', '1', '7', 1, '113', 2, '1');
INSERT INTO `bed_info` VALUES (48, '2', '1', '5', 1, '103', 2, '1');
INSERT INTO `bed_info` VALUES (49, '2', '1', '5', 1, '107', 2, '1');
INSERT INTO `bed_info` VALUES (50, '1', '1', '4', 1, '107', 2, '1');
INSERT INTO `bed_info` VALUES (51, '1', '1', '1', 1, '112', 2, '1');
INSERT INTO `bed_info` VALUES (52, '2', '1', '5', 1, '102', 2, '1');
INSERT INTO `bed_info` VALUES (53, '1', '1', '7', 1, '118', 2, '1');
INSERT INTO `bed_info` VALUES (54, '1', '1', '5', 1, '103', 2, '1');
INSERT INTO `bed_info` VALUES (55, '1', '1', '5', 1, '103', 3, '1');
INSERT INTO `bed_info` VALUES (56, '1', '1', '7', 1, '118', 3, '1');
INSERT INTO `bed_info` VALUES (57, '2', '1', '5', 1, '102', 3, '1');
INSERT INTO `bed_info` VALUES (58, '1', '1', '1', 1, '112', 3, '1');
INSERT INTO `bed_info` VALUES (59, '1', '1', '4', 1, '107', 3, '1');
INSERT INTO `bed_info` VALUES (60, '2', '1', '5', 1, '107', 3, '1');
INSERT INTO `bed_info` VALUES (61, '2', '1', '6', 1, '103', 3, '1');
INSERT INTO `bed_info` VALUES (62, '1', '1', '5', 1, '113', 3, '1');
INSERT INTO `bed_info` VALUES (63, '2', '1', '5', 1, '112', 3, '1');
INSERT INTO `bed_info` VALUES (64, '1', '1', '5', 1, '102', 3, '1');
INSERT INTO `bed_info` VALUES (65, '1', '1', '7', 1, '111', 3, '1');
INSERT INTO `bed_info` VALUES (66, '1', '1', '6', 1, '106', 3, '1');
INSERT INTO `bed_info` VALUES (67, '1', '1', '2', 1, '109', 3, '1');
INSERT INTO `bed_info` VALUES (68, '2', '1', '2', 1, '117', 3, '1');
INSERT INTO `bed_info` VALUES (69, '2', '1', '4', 1, '101', 3, '1');
INSERT INTO `bed_info` VALUES (70, '1', '1', '3', 1, '110', 3, '1');
INSERT INTO `bed_info` VALUES (71, '2', '1', '3', 1, '110', 3, '1');
INSERT INTO `bed_info` VALUES (72, '1', '1', '8', 1, '105', 3, '1');
INSERT INTO `bed_info` VALUES (73, '1', '1', '1', 1, '117', 3, '1');
INSERT INTO `bed_info` VALUES (74, '2', '1', '2', 1, '108', 3, '1');
INSERT INTO `bed_info` VALUES (75, '1', '1', '1', 1, '108', 3, '1');
INSERT INTO `bed_info` VALUES (76, '1', '1', '7', 1, '104', 3, '1');
INSERT INTO `bed_info` VALUES (77, '1', '1', '3', 1, '116', 3, '1');
INSERT INTO `bed_info` VALUES (78, '1', '1', '4', 1, '101', 3, '1');
INSERT INTO `bed_info` VALUES (79, '1', '1', '7', 1, '114', 3, '1');
INSERT INTO `bed_info` VALUES (80, '2', '1', '6', 1, '104', 3, '1');
INSERT INTO `bed_info` VALUES (81, '1', '1', '1', 1, '115', 3, '1');
INSERT INTO `bed_info` VALUES (478, '1', '2', '1', 1, '1', NULL, '1');
INSERT INTO `bed_info` VALUES (479, '1', '2', '1', 1, '1', NULL, '1');
INSERT INTO `bed_info` VALUES (480, '1', '2', '1', 1, '1', NULL, '1');
INSERT INTO `bed_info` VALUES (481, '1', '2', '1', 1, '1', NULL, '1');
INSERT INTO `bed_info` VALUES (482, '1', '2', '1', 1, '1', NULL, '1');
INSERT INTO `bed_info` VALUES (483, '1', '2', '1', 1, '1', NULL, '1');
INSERT INTO `bed_info` VALUES (484, '1', '2', '1', 1, '1', NULL, '1');
INSERT INTO `bed_info` VALUES (485, '1', '2', '1', 1, '1', NULL, '1');
INSERT INTO `bed_info` VALUES (486, '1', '2', '1', 1, '1', NULL, '1');
INSERT INTO `bed_info` VALUES (487, '1', '2', '1', 1, '1', NULL, '1');
INSERT INTO `bed_info` VALUES (488, '1', '2', '1', 1, '1', NULL, '1');
INSERT INTO `bed_info` VALUES (489, '1', '2', '1', 1, '1', NULL, '1');
INSERT INTO `bed_info` VALUES (490, '1', '2', '1', 1, '1', NULL, '1');
INSERT INTO `bed_info` VALUES (491, '1', '2', '1', 1, '1', NULL, '1');
INSERT INTO `bed_info` VALUES (492, '1', '2', '1', 1, '1', NULL, '1');
INSERT INTO `bed_info` VALUES (493, '1', '2', '1', 1, '1', NULL, '1');
INSERT INTO `bed_info` VALUES (494, '1', '2', '1', 1, '1', NULL, '1');
INSERT INTO `bed_info` VALUES (495, '1', '2', '1', 1, '1', NULL, '1');
INSERT INTO `bed_info` VALUES (496, '1', '2', '1', 1, '1', NULL, '1');
INSERT INTO `bed_info` VALUES (497, '1', '2', '1', 1, '1', NULL, '1');
INSERT INTO `bed_info` VALUES (498, '1', '2', '1', 1, '1', NULL, '1');
INSERT INTO `bed_info` VALUES (499, '1', '2', '1', 1, '1', NULL, '1');
INSERT INTO `bed_info` VALUES (500, '1', '2', '1', 1, '1', NULL, '1');
INSERT INTO `bed_info` VALUES (501, '1', '2', '1', 1, '1', NULL, '1');
INSERT INTO `bed_info` VALUES (502, '1', '2', '1', 1, '1', NULL, '1');
INSERT INTO `bed_info` VALUES (503, '1', '2', '1', 1, '1', NULL, '1');
INSERT INTO `bed_info` VALUES (504, '1', '2', '1', 1, '1', NULL, '1');
INSERT INTO `bed_info` VALUES (505, '1', '2', '1', 1, '1', NULL, '1');
INSERT INTO `bed_info` VALUES (506, '1', '2', '1', 1, '1', NULL, '1');
INSERT INTO `bed_info` VALUES (507, '1', '2', '1', 1, '1', NULL, '1');
INSERT INTO `bed_info` VALUES (508, '1', '2', '1', 1, '1', NULL, '1');
INSERT INTO `bed_info` VALUES (509, '1', '2', '1', 1, '1', NULL, '1');
INSERT INTO `bed_info` VALUES (510, '1', '2', '1', 1, '1', NULL, '1');
INSERT INTO `bed_info` VALUES (511, '1', '2', '1', 1, '1', NULL, '1');
INSERT INTO `bed_info` VALUES (512, '1', '2', '1', 1, '1', NULL, '1');
INSERT INTO `bed_info` VALUES (513, '1', '2', '1', 1, '1', NULL, '1');
INSERT INTO `bed_info` VALUES (514, '1', '2', '1', 1, '1', NULL, '1');
INSERT INTO `bed_info` VALUES (515, '1', '2', '1', 1, '1', NULL, '1');
INSERT INTO `bed_info` VALUES (516, '1', '2', '1', 1, '1', NULL, '1');
INSERT INTO `bed_info` VALUES (517, '1', '2', '1', 1, '1', NULL, '1');
INSERT INTO `bed_info` VALUES (518, '1', '2', '1', 1, '1', NULL, '1');
INSERT INTO `bed_info` VALUES (519, '1', '2', '1', 1, '1', NULL, '1');
INSERT INTO `bed_info` VALUES (520, '1', '2', '1', 1, '1', NULL, '1');
INSERT INTO `bed_info` VALUES (521, '1', '2', '1', 1, '1', NULL, '1');
INSERT INTO `bed_info` VALUES (522, '1', '2', '1', 1, '1', NULL, '1');
INSERT INTO `bed_info` VALUES (523, '1', '2', '1', 1, '1', NULL, '1');
INSERT INTO `bed_info` VALUES (524, '1', '2', '1', 1, '1', NULL, '1');
INSERT INTO `bed_info` VALUES (525, '1', '2', '1', 1, '1', NULL, '1');
INSERT INTO `bed_info` VALUES (526, '1', '2', '1', 1, '1', NULL, '1');
INSERT INTO `bed_info` VALUES (527, '1', '2', '1', 1, '1', NULL, '1');
INSERT INTO `bed_info` VALUES (528, '1', '2', '1', 1, '1', NULL, '1');
INSERT INTO `bed_info` VALUES (529, '1', '2', '1', 1, '1', NULL, '1');
INSERT INTO `bed_info` VALUES (530, '1', '2', '1', 1, '1', NULL, '1');
INSERT INTO `bed_info` VALUES (531, '1', '2', '1', 1, '1', NULL, '1');
INSERT INTO `bed_info` VALUES (532, '1', '2', '1', 1, '1', NULL, '1');
INSERT INTO `bed_info` VALUES (533, '1', '2', '1', 1, '1', NULL, '1');
INSERT INTO `bed_info` VALUES (534, '1', '2', '1', 1, '1', NULL, '1');
INSERT INTO `bed_info` VALUES (535, '1', '2', '1', 1, '1', NULL, '1');
INSERT INTO `bed_info` VALUES (536, '1', '2', '1', 1, '1', NULL, '1');
INSERT INTO `bed_info` VALUES (537, '1', '2', '1', 1, '1', NULL, '1');
INSERT INTO `bed_info` VALUES (538, '1', '2', '1', 1, '1', NULL, '1');
INSERT INTO `bed_info` VALUES (539, '1', '2', '1', 1, '1', NULL, '1');
INSERT INTO `bed_info` VALUES (540, '1', '2', '1', 1, '1', NULL, '1');
INSERT INTO `bed_info` VALUES (541, '1', '2', '1', 1, '1', NULL, '1');
INSERT INTO `bed_info` VALUES (542, '1', '2', '1', 1, '1', NULL, '1');
INSERT INTO `bed_info` VALUES (543, '1', '2', '1', 1, '1', NULL, '1');
INSERT INTO `bed_info` VALUES (544, '1', '2', '1', 1, '1', NULL, '1');
INSERT INTO `bed_info` VALUES (545, '1', '2', '1', 1, '1', NULL, '1');
INSERT INTO `bed_info` VALUES (546, '1', '2', '1', 1, '1', NULL, '1');
INSERT INTO `bed_info` VALUES (547, '1', '2', '1', 1, '1', NULL, '1');
INSERT INTO `bed_info` VALUES (548, '1', '2', '1', 1, '1', NULL, '1');
INSERT INTO `bed_info` VALUES (549, '1', '2', '1', 1, '1', NULL, '1');
INSERT INTO `bed_info` VALUES (550, '1', '2', '1', 1, '1', NULL, '1');
INSERT INTO `bed_info` VALUES (551, '1', '2', '1', 1, '1', NULL, '1');
INSERT INTO `bed_info` VALUES (552, '1', '2', '1', 1, '1', NULL, '1');
INSERT INTO `bed_info` VALUES (553, '1', '2', '1', 1, '1', NULL, '1');
INSERT INTO `bed_info` VALUES (554, '1', '2', '1', 1, '1', NULL, '1');
INSERT INTO `bed_info` VALUES (555, '1', '2', '1', 1, '1', NULL, '1');
INSERT INTO `bed_info` VALUES (556, '1', '2', '1', 1, '1', NULL, '1');
INSERT INTO `bed_info` VALUES (557, '1', '2', '1', 1, '1', NULL, '1');
INSERT INTO `bed_info` VALUES (558, '1', '2', '1', 1, '1', NULL, '1');
INSERT INTO `bed_info` VALUES (559, '1', '2', '1', 1, '1', NULL, '1');
INSERT INTO `bed_info` VALUES (560, '1', '2', '1', 1, '1', NULL, '1');
INSERT INTO `bed_info` VALUES (561, '1', '2', '1', 1, '1', NULL, '1');
INSERT INTO `bed_info` VALUES (562, '1', '2', '1', 1, '1', NULL, '1');
INSERT INTO `bed_info` VALUES (563, '1', '2', '1', 1, '1', NULL, '1');
INSERT INTO `bed_info` VALUES (564, '1', '2', '1', 1, '1', NULL, '1');
INSERT INTO `bed_info` VALUES (565, '1', '2', '1', 1, '1', NULL, '1');
INSERT INTO `bed_info` VALUES (566, '1', '2', '1', 1, '1', NULL, '1');
INSERT INTO `bed_info` VALUES (567, '1', '2', '1', 1, '1', NULL, '1');
INSERT INTO `bed_info` VALUES (568, '1', '2', '1', 1, '1', NULL, '1');
INSERT INTO `bed_info` VALUES (569, '1', '2', '1', 1, '1', NULL, '1');
INSERT INTO `bed_info` VALUES (570, '1', '2', '1', 1, '1', NULL, '1');
INSERT INTO `bed_info` VALUES (571, '1', '2', '1', 1, '1', NULL, '1');
INSERT INTO `bed_info` VALUES (572, '1', '2', '1', 1, '1', NULL, '1');
INSERT INTO `bed_info` VALUES (573, '1', '2', '1', 1, '1', NULL, '1');
INSERT INTO `bed_info` VALUES (574, '1', '2', '1', 1, '1', NULL, '1');
INSERT INTO `bed_info` VALUES (575, '1', '2', '1', 1, '1', NULL, '1');
INSERT INTO `bed_info` VALUES (576, '1', '2', '1', 1, '1', NULL, '1');
INSERT INTO `bed_info` VALUES (577, '1', '2', '1', 1, '1', NULL, '1');
INSERT INTO `bed_info` VALUES (578, '1', '2', '1', 1, '1', NULL, '1');
INSERT INTO `bed_info` VALUES (579, '1', '2', '1', 1, '1', NULL, '1');
INSERT INTO `bed_info` VALUES (580, '1', '2', '1', 1, '1', NULL, '1');
INSERT INTO `bed_info` VALUES (581, '1', '2', '1', 1, '1', NULL, '1');
INSERT INTO `bed_info` VALUES (582, '1', '2', '1', 1, '1', NULL, '1');
INSERT INTO `bed_info` VALUES (583, '1', '2', '1', 1, '1', NULL, '1');
INSERT INTO `bed_info` VALUES (607, '1', '2', '1', 1, '2', NULL, '1');
INSERT INTO `bed_info` VALUES (608, '1', '2', '1', 1, '1', NULL, '1');
INSERT INTO `bed_info` VALUES (611, '1', '2', '5', 2, '101', 1, '1');
INSERT INTO `bed_info` VALUES (612, '2', '2', '5', 2, '101', 1, '1');
INSERT INTO `bed_info` VALUES (613, '1', '2', '5', 2, '102', 1, '1');
INSERT INTO `bed_info` VALUES (614, '2', '2', '5', 2, '102', 1, '1');
INSERT INTO `bed_info` VALUES (615, '1', '2', '5', 2, '103', 1, '1');
INSERT INTO `bed_info` VALUES (616, '2', '2', '5', 2, '103', 1, '1');
INSERT INTO `bed_info` VALUES (617, '1', '2', '5', 2, '104', 1, '1');
INSERT INTO `bed_info` VALUES (618, '2', '2', '1', 2, '104', 1, '1');
INSERT INTO `bed_info` VALUES (619, '2', '2', '1', 2, '105', 1, '1');
INSERT INTO `bed_info` VALUES (620, '1', '2', '1', 2, '105', 1, '1');
INSERT INTO `bed_info` VALUES (621, '2', '2', '1', 2, '106', 1, '1');
INSERT INTO `bed_info` VALUES (622, '1', '2', '1', 2, '106', 1, '1');
INSERT INTO `bed_info` VALUES (623, '2', '2', '1', 2, '107', 1, '1');
INSERT INTO `bed_info` VALUES (624, '1', '2', '1', 2, '107', 1, '1');
INSERT INTO `bed_info` VALUES (625, '2', '2', '5', 2, '108', 1, '1');
INSERT INTO `bed_info` VALUES (626, '1', '2', '1', 2, '108', 1, '1');
INSERT INTO `bed_info` VALUES (627, '2', '2', '1', 2, '109', 1, '1');
INSERT INTO `bed_info` VALUES (628, '1', '2', '1', 2, '109', 1, '1');
INSERT INTO `bed_info` VALUES (629, '2', '2', '1', 2, '110', 1, '1');
INSERT INTO `bed_info` VALUES (630, '1', '2', '1', 2, '111', 1, '1');
INSERT INTO `bed_info` VALUES (631, '2', '2', '1', 2, '112', 1, '1');
INSERT INTO `bed_info` VALUES (632, '1', '2', '1', 2, '113', 1, '1');
INSERT INTO `bed_info` VALUES (633, '2', '2', '1', 2, '114', 1, '1');
INSERT INTO `bed_info` VALUES (634, '1', '2', '1', 2, '114', 1, '1');
INSERT INTO `bed_info` VALUES (635, '2', '2', '1', 2, '115', 1, '1');

-- ----------------------------
-- Table structure for care_project
-- ----------------------------
DROP TABLE IF EXISTS `care_project`;
CREATE TABLE `care_project`  (
  `project_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '护理项目唯一标识符',
  `project_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '护理项目名称',
  `description` varchar(3000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '护理项目描述',
  `service_duration` time(0) NULL DEFAULT NULL COMMENT '服务时长',
  `price` decimal(10, 2) NOT NULL COMMENT '服务价格',
  `frequency` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服务频率（如D表示每天，W表示每周，M表示每月等）',
  `nurse_level` int(11) NULL DEFAULT NULL COMMENT '护理等级 1 最高级 ，2 高级，3 中级，4 低级',
  `is_active` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否有效（1表示有效，0表示无效）',
  `created_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '记录创建时间',
  `updated_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '记录更新时间',
  `status` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '状态,用于删除,1 可用，0 不可用',
  PRIMARY KEY (`project_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '存储护理项目信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of care_project
-- ----------------------------
INSERT INTO `care_project` VALUES (1, '按摩', '按摩服务，放松肌肉', '01:00:00', 388.00, 'W', 1, 1, '2024-12-25 11:37:53', '2025-01-01 22:37:31', '0');
INSERT INTO `care_project` VALUES (2, '下棋', '在方寸棋盘中，大战三百回合，感悟人生', '02:00:00', 20.00, 'W', 3, 0, '2024-12-25 16:02:43', '2025-01-01 22:36:32', '1');
INSERT INTO `care_project` VALUES (3, '喝茶', '喝好茶，体验韵味人生', '05:00:00', 50.00, 'W', 2, 1, '2024-12-25 16:02:43', '2024-12-31 09:41:53', '1');
INSERT INTO `care_project` VALUES (4, '打架', '这个年纪，正是需要战斗的年纪', '02:00:21', 20.00, 'D', 1, 1, '2024-12-25 16:02:43', '2024-12-31 09:41:53', '1');
INSERT INTO `care_project` VALUES (5, '睡觉', '好好休息，达到充足的睡眠', '05:00:00', 10.00, 'W', 2, 0, '2024-12-25 16:02:43', '2024-12-31 09:41:53', '1');
INSERT INTO `care_project` VALUES (6, '钓鱼', '带老人钓鱼，放松心情', '03:00:00', 60.00, 'W', 3, 1, '2024-12-25 16:02:43', '2024-12-31 09:37:54', '1');
INSERT INTO `care_project` VALUES (7, '登山', '带老人放松心情，锻炼身体', '17:22:27', 60.00, 'D', 2, 0, '2024-12-30 17:40:04', '2024-12-31 09:37:54', '1');
INSERT INTO `care_project` VALUES (8, '看海', '领略大海的广阔', '17:46:41', 1.00, 'W', 1, 1, '2024-12-30 17:46:55', '2024-12-31 09:41:53', '0');
INSERT INTO `care_project` VALUES (9, '旅游', '体验祖国大好河山', '17:49:39', 1.00, 'W', 1, 1, '2024-12-30 17:49:44', '2024-12-31 09:41:53', '0');
INSERT INTO `care_project` VALUES (10, '看雨', '沉浸体验安静的氛围', '17:50:14', 1.00, 'W', 1, 1, '2024-12-30 17:50:20', '2024-12-31 09:41:53', '0');
INSERT INTO `care_project` VALUES (11, '玩游戏', '陪老人玩游戏', '02:10:44', 30.80, 'W', 1, 1, '2025-01-01 22:37:08', '2025-01-01 22:37:08', '1');

-- ----------------------------
-- Table structure for care_record
-- ----------------------------
DROP TABLE IF EXISTS `care_record`;
CREATE TABLE `care_record`  (
  `record_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '护理记录的唯一标识符',
  `elderly_id` int(11) NOT NULL COMMENT '老人唯一标识符，外键指向elderly_info表',
  `nurse_id` int(11) NOT NULL COMMENT '护工唯一标识符，外键指向nurse_info表',
  `project_id` int(11) NOT NULL COMMENT '护理项目唯一标识符，外键指向care_project表',
  `care_start_time` datetime(0) NOT NULL COMMENT '护理开始时间',
  `care_end_time` datetime(0) NOT NULL COMMENT '护理结束时间',
  `care_content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '护理内容或描述',
  `care_status` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '护理状态（1:到期，0: 欠费，2:数量正常，3: 未到期）',
  `remarks` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注信息（如老人特殊情况等）',
  `created_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '记录创建时间',
  `updated_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '记录最后更新时间',
  `status` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '状态,用于删除,1 可用，0 不可用',
  PRIMARY KEY (`record_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '存储老人护理记录信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of care_record
-- ----------------------------
INSERT INTO `care_record` VALUES (10, 13, 5, 1, '2024-12-24 11:00:00', '2024-12-24 12:00:00', '按摩服务，放松肌肉', '3', '无特殊情况', '2024-12-27 14:53:33', '2024-12-27 14:53:33', '1');
INSERT INTO `care_record` VALUES (12, 19, 6, 3, '2024-12-25 14:00:00', '2024-12-25 19:00:00', '陪伴老人喝茶，交流日常', '3', '无特殊情况', '2024-12-27 14:53:33', '2024-12-27 14:53:33', '1');
INSERT INTO `care_record` VALUES (13, 20, 5, 6, '2024-12-26 09:00:00', '2024-12-26 12:00:00', '带老人钓鱼，放松心情', '1', '无特殊情况', '2024-12-27 14:53:33', '2024-12-27 17:52:57', '1');
INSERT INTO `care_record` VALUES (14, 21, 6, 5, '2024-12-26 22:00:00', '2024-12-27 03:00:00', '帮助老人入睡并确保安全', '2', '无特殊情况', '2024-12-27 14:53:33', '2024-12-27 14:53:33', '1');
INSERT INTO `care_record` VALUES (15, 22, 6, 4, '2024-12-27 14:00:00', '2024-12-27 16:00:00', '陪老人进行适当的打架娱乐', '3', '老人心情愉快', '2024-12-27 14:53:33', '2024-12-27 14:53:33', '1');
INSERT INTO `care_record` VALUES (16, 19, 6, 6, '2024-12-25 14:00:00', '2024-12-25 19:00:00', '带老人钓鱼，放松心情', '1', '无特殊情况', '2024-12-27 14:53:33', '2024-12-28 00:01:34', '1');

-- ----------------------------
-- Table structure for check_out_requests
-- ----------------------------
DROP TABLE IF EXISTS `check_out_requests`;
CREATE TABLE `check_out_requests`  (
  `request_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '退住请求的唯一标识符',
  `elderly_id` int(11) NOT NULL COMMENT '客户的唯一ID（例如，老年人的ID）',
  `bed_id` int(11) NULL DEFAULT NULL COMMENT '外联床位id',
  `phone_number` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '客户的联系电话',
  `property_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '住所地址（可能不是必需的，取决于您的设计）',
  `check_in_date` date NULL DEFAULT NULL COMMENT '入住日期',
  `check_out_date` date NULL DEFAULT NULL COMMENT '计划退住日期（实际退住日期可能有所不同）',
  `checkout_reason` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '退住原因（可选的详细描述）',
  `checkout_type` int(11) NOT NULL COMMENT '退住类型：1-正常退住, 2-死亡退住, 3-保留床位（注意：这里我修改了原始设计中的值以避免重复，因为您原始设计中死亡退住和保留床位都是2）',
  `approval_status` int(11) NULL DEFAULT 1 COMMENT '审核状态：1-未审核, 2-通过, 3-不通过',
  `approval_time` datetime(0) NULL DEFAULT NULL COMMENT '审批时间（仅当审核通过时设置）',
  `approval_person` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审批人（仅当审核通过时设置）',
  `created_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '记录创建时间',
  `updated_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '记录最后更新时间',
  PRIMARY KEY (`request_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 58 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of check_out_requests
-- ----------------------------
INSERT INTO `check_out_requests` VALUES (56, 102, 616, '15885865896', NULL, NULL, NULL, '不行住', 1, 3, '2024-12-31 10:53:44', '1', '2024-12-31 09:24:34', '2024-12-31 10:53:44');
INSERT INTO `check_out_requests` VALUES (57, 103, 617, '1585558258785', NULL, NULL, NULL, '不想住了', 1, 1, NULL, NULL, '2025-01-01 22:30:53', '2025-01-01 22:30:53');

-- ----------------------------
-- Table structure for elderly_and_project
-- ----------------------------
DROP TABLE IF EXISTS `elderly_and_project`;
CREATE TABLE `elderly_and_project`  (
  `elderly_id` int(255) NOT NULL,
  `project_id` int(255) NOT NULL,
  `care_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '(1-到期，2-欠费，3-未到期)',
  `status` int(1) NOT NULL COMMENT '(1-正常，2-删除)'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '这个表是老人持有的护理项目的表，用来让老人和护理项目能对应上的' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of elderly_and_project
-- ----------------------------
INSERT INTO `elderly_and_project` VALUES (18, 2, '1', 0);
INSERT INTO `elderly_and_project` VALUES (18, 4, '3', 1);
INSERT INTO `elderly_and_project` VALUES (18, 1, '2', 1);
INSERT INTO `elderly_and_project` VALUES (19, 1, '1', 0);
INSERT INTO `elderly_and_project` VALUES (19, 3, '2', 1);
INSERT INTO `elderly_and_project` VALUES (22, 6, '2', 1);
INSERT INTO `elderly_and_project` VALUES (22, 4, '2', 1);
INSERT INTO `elderly_and_project` VALUES (22, 5, '3', 1);
INSERT INTO `elderly_and_project` VALUES (22, 1, '1', 1);

-- ----------------------------
-- Table structure for elderly_info
-- ----------------------------
DROP TABLE IF EXISTS `elderly_info`;
CREATE TABLE `elderly_info`  (
  `elderly_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '老人唯一标识符',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '老人姓名',
  `gender` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '老人性别（M/F）',
  `age` int(11) NOT NULL COMMENT '老人年龄',
  `id_number` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '老人身份证号',
  `self_care_status` int(11) NULL DEFAULT NULL COMMENT '自理能力等级，1 不自理，2 部分自理，3 自行disabled',
  `home_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '老人家庭住址',
  `contact_info` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '老人联系方式',
  `family_contact_info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家属联系方式',
  `photo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '老人照片',
  `medical_history` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '病史记录',
  `allergy_history` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '过敏史记录',
  `physical_condition` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '身体状况描述',
  `bed_id` int(11) NULL DEFAULT NULL COMMENT '关联床位信息表的外键',
  `nurse_id` int(11) NULL DEFAULT NULL COMMENT '关联护工信息表的外键',
  `check_in_time` datetime(0) NULL DEFAULT NULL COMMENT '入住时间',
  `check_out_time` datetime(0) NULL DEFAULT NULL COMMENT '离开时间',
  `nurse_level` int(11) NULL DEFAULT NULL COMMENT '护理等级 1 最高级 ，2 高级，3 中级，4 低级',
  `status` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '入住状态,用于删除,1 已入住，0 已离开',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`elderly_id`) USING BTREE,
  UNIQUE INDEX `id_number`(`id_number`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 104 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '存储老人详细信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of elderly_info
-- ----------------------------
INSERT INTO `elderly_info` VALUES (1, '赵强', 'M', 93, '636873885658302096', 3, '山东省济南市', '13785447518', '赵太太:13057429576', NULL, NULL, NULL, '健康状况不稳定', NULL, 5, NULL, NULL, NULL, '1', NULL);
INSERT INTO `elderly_info` VALUES (2, '李娜', 'F', 79, '425598791267746286', 3, '天津市和平区', '13259735183', '王先生:13288928574', NULL, NULL, NULL, '虚弱', NULL, 1, NULL, NULL, NULL, '1', NULL);
INSERT INTO `elderly_info` VALUES (3, '张伟', 'F', 100, '666540570228680155', 1, '上海市浦东新区', '13163987890', '王先生:13857699406', NULL, NULL, NULL, '恢复中', NULL, 5, NULL, NULL, NULL, '1', NULL);
INSERT INTO `elderly_info` VALUES (4, '赵强', 'M', 66, '211315684272633900', 3, '广东省广州市', '13486878918', '李女士:13830653139', NULL, NULL, NULL, '一般', NULL, 5, NULL, NULL, NULL, '1', NULL);
INSERT INTO `elderly_info` VALUES (5, '测试用户', 'M', 65, '205392730903104547', 2, '天津市和平区', '13958445780', '李女士:13961690096', NULL, NULL, NULL, '健康状况不稳定', NULL, 7, NULL, NULL, NULL, '1', NULL);
INSERT INTO `elderly_info` VALUES (6, '王红', 'F', 91, '878679762176391025', 1, '山东省济南市', '13245977742', '王先生:13929630165', NULL, NULL, NULL, '健康状况不稳定', NULL, 4, NULL, NULL, NULL, '1', NULL);
INSERT INTO `elderly_info` VALUES (7, '李华', 'M', 65, '163503792548542326', 3, '上海市浦东新区', '13097738013', '李女士:13275738402', NULL, NULL, NULL, '严重疾病', NULL, 6, NULL, NULL, NULL, '1', NULL);
INSERT INTO `elderly_info` VALUES (8, '张伟', 'F', 99, '519020751086374614', 2, '山东省济南市', '13951814404', '王先生:13098821289', NULL, NULL, NULL, '健康状况不稳定', NULL, NULL, NULL, NULL, NULL, '1', NULL);
INSERT INTO `elderly_info` VALUES (9, '赵强', 'F', 77, '792087744061904570', 1, '天津市和平区', '13054058984', '王先生:13716410668', NULL, NULL, NULL, '虚弱', NULL, 2, NULL, NULL, NULL, '1', NULL);
INSERT INTO `elderly_info` VALUES (10, '李娜', 'F', 70, '940193888513454340', 1, '广东省广州市', '13341859653', '王先生:13523488136', NULL, NULL, NULL, '健康状况不稳定', NULL, 5, NULL, NULL, NULL, '1', NULL);
INSERT INTO `elderly_info` VALUES (11, '王成涛', 'M', 64, '150756400379524361', 2, '天津市和平区', '13218550607', '李女士:13264363814', NULL, NULL, NULL, '恢复中', NULL, 5, NULL, NULL, NULL, '1', NULL);
INSERT INTO `elderly_info` VALUES (12, '陈涛', 'F', 67, '839442874200304101', 3, '山东省济南市', '13814608088', '王先生:13436413020', NULL, NULL, NULL, '虚弱', NULL, 4, NULL, NULL, NULL, '1', NULL);
INSERT INTO `elderly_info` VALUES (13, '刘伟', 'M', 90, '122323344545456767', NULL, NULL, NULL, '18337049186', NULL, NULL, NULL, '一般', 1, 3, '2024-12-24 10:49:45', NULL, NULL, '1', 'http://localhost:9090/files/1735386277256-u=1775724162,4143654705&fm=253&app=138&size=w931&n=0&f=JPEG&fmt=auto.jpg');
INSERT INTO `elderly_info` VALUES (14, '宋琳', 'F', 83, '332280304171340475', 3, '广东省广州市', '13041528956', '李女士:13957703974', NULL, NULL, NULL, '健康状况不稳定', NULL, 2, NULL, NULL, NULL, '1', NULL);
INSERT INTO `elderly_info` VALUES (15, '黄磊', 'M', 72, '748508170001540731', 3, '天津市和平区', '13903002730', '李女士:13004801585', NULL, NULL, NULL, '健康状况不稳定', NULL, 4, NULL, NULL, NULL, '1', NULL);
INSERT INTO `elderly_info` VALUES (16, '李敏', 'F', 89, '751521446166164985', 3, '天津市和平区', '13328727594', '王先生:13836100943', NULL, NULL, NULL, '严重疾病', NULL, 6, NULL, NULL, NULL, '1', NULL);
INSERT INTO `elderly_info` VALUES (17, '张丽', 'F', 77, '937518096098205797', 1, '北京市朝阳区', '13217739876', '赵太太:13716718674', NULL, NULL, NULL, '健康状况不稳定', NULL, 5, NULL, NULL, NULL, '1', NULL);
INSERT INTO `elderly_info` VALUES (18, '王强', 'M', 75, '110101199012345678', 2, '北京市朝阳区', '13812345678', '李女士:13987654321', 'photo_url', '高血压', '无', '恢复中', 101, 5, '2024-11-10 08:00:00', NULL, 2, '1', 'http://localhost:9090/files/1735386277256-u=1775724162,4143654705&fm=253&app=138&size=w931&n=0&f=JPEG&fmt=auto.jpg');
INSERT INTO `elderly_info` VALUES (19, '李军', 'F', 80, '110102198512345678', 1, '上海市浦东新区', '13912345679', '王先生:13876543210', 'photo_url', '糖尿病', '花粉过敏', '虚弱', 102, 4, '2024-11-15 09:30:00', NULL, 3, '1', 'http://localhost:9090/files/1735386277256-u=1775724162,4143654705&fm=253&app=138&size=w931&n=0&f=JPEG&fmt=auto.jpg');
INSERT INTO `elderly_info` VALUES (20, '赵霞', 'M', 60, '110103197301234567', 3, '广东省广州市', '13712345678', '张太太:13698765432', 'photo_url', '心脏病', '对某些食物过敏', '健康状况不稳定', 103, 4, '2024-11-20 10:00:00', NULL, 2, '1', 'http://localhost:9090/files/1735386277256-u=1775724162,4143654705&fm=253&app=138&size=w931&n=0&f=JPEG&fmt=auto.jpg');
INSERT INTO `elderly_info` VALUES (21, '陈丽', 'F', 65, '110104196801234567', 2, '天津市和平区', '13612345678', '李先生:13587654321', 'photo_url', '关节炎', '无', '恢复中', 104, NULL, '2024-11-25 14:00:00', NULL, 1, '1', 'http://localhost:9090/files/1735386277256-u=1775724162,4143654705&fm=253&app=138&size=w931&n=0&f=JPEG&fmt=auto.jpg');
INSERT INTO `elderly_info` VALUES (22, '刘刚', 'M', 85, '110105193412345678', 1, '山东省济南市', '13512345678', '赵太太:13998765432', 'photo_url', '肺部疾病', '花生过敏', '一般', 105, 5, '2024-11-30 16:00:00', NULL, 4, '1', 'http://localhost:9090/files/1735386277256-u=1775724162,4143654705&fm=253&app=138&size=w931&n=0&f=JPEG&fmt=auto.jpg');
INSERT INTO `elderly_info` VALUES (23, '宋慧', 'F', 66, '159994690833120409', 3, '广东省广州市', '13434372687', '李女士:13676397695', NULL, NULL, NULL, '严重疾病', NULL, 2, NULL, NULL, NULL, '1', NULL);
INSERT INTO `elderly_info` VALUES (24, '黄明', 'M', 63, '307959434094640610', 1, '北京市朝阳区', '13256039959', '李女士:13655786179', NULL, NULL, NULL, '健康状况不稳定', NULL, NULL, NULL, NULL, NULL, '1', NULL);
INSERT INTO `elderly_info` VALUES (25, '李涛', 'M', 73, '271385036428033806', 1, '上海市浦东新区', '13578814950', '赵太太:13914941257', NULL, NULL, NULL, '虚弱', NULL, 4, NULL, NULL, NULL, '1', NULL);
INSERT INTO `elderly_info` VALUES (26, '张军', 'F', 71, '989356566251972997', 3, '山东省济南市', '13514415336', '赵太太:13967780622', NULL, NULL, NULL, '健康状况不稳定', NULL, NULL, NULL, NULL, NULL, '1', NULL);
INSERT INTO `elderly_info` VALUES (27, '王鹏', 'F', 85, '571228202597568080', 1, '北京市朝阳区', '13042808570', '赵太太:13394538392', NULL, NULL, NULL, '恢复中', NULL, 4, NULL, NULL, NULL, '1', NULL);
INSERT INTO `elderly_info` VALUES (28, '陈峰', 'F', 77, '714886188359655749', 3, '广东省广州市', '13355113431', '李女士:13448792259', NULL, NULL, NULL, '虚弱', NULL, 4, NULL, NULL, NULL, '1', NULL);
INSERT INTO `elderly_info` VALUES (29, '刘美', 'F', 61, '064784165896647598', 2, '广东省广州市', '13737199969', '王先生:13311328495', NULL, NULL, NULL, '健康状况不稳定', NULL, 4, NULL, NULL, NULL, '1', NULL);
INSERT INTO `elderly_info` VALUES (30, '宋明', 'F', 95, '875761699944865293', 2, '广东省广州市', '13580249409', '李女士:13246919068', NULL, NULL, NULL, '健康状况不稳定', NULL, 5, NULL, NULL, NULL, '1', NULL);
INSERT INTO `elderly_info` VALUES (31, '黄莉', 'F', 98, '669381836685988890', 3, '山东省济南市', '13067664683', '赵太太:13516615032', NULL, NULL, NULL, '严重疾病', NULL, 5, NULL, NULL, NULL, '1', NULL);
INSERT INTO `elderly_info` VALUES (32, '李爽', 'F', 100, '750128404955129958', 2, '天津市和平区', '13976721775', '赵太太:13688318895', NULL, NULL, NULL, '虚弱', NULL, 5, NULL, NULL, NULL, '1', NULL);
INSERT INTO `elderly_info` VALUES (33, '张磊', 'M', 60, '690887161579448512', 2, '天津市和平区', '13352408930', '李女士:13400154772', NULL, NULL, NULL, '恢复中', NULL, 6, NULL, NULL, NULL, '1', NULL);
INSERT INTO `elderly_info` VALUES (34, '王丽', 'F', 98, '321942698931522642', 2, '广东省广州市', '13421669971', '王先生:13678426100', NULL, NULL, NULL, '健康状况不稳定', NULL, 6, NULL, NULL, NULL, '1', NULL);
INSERT INTO `elderly_info` VALUES (35, '李勇', 'F', 68, '721409307638308927', 1, '北京市朝阳区', '13774833827', '王先生:13206072577', NULL, NULL, NULL, '一般', NULL, 5, NULL, NULL, NULL, '1', NULL);
INSERT INTO `elderly_info` VALUES (36, '赵杰', 'M', 64, '070193580265540723', 1, '北京市朝阳区', '13287791674', '赵太太:13296214710', NULL, NULL, NULL, '健康状况不稳定', NULL, 5, NULL, NULL, NULL, '1', NULL);
INSERT INTO `elderly_info` VALUES (37, '陈玲', 'M', 70, '431528694772156708', 2, '广东省广州市', '13307155737', '王先生:13346090240', NULL, NULL, NULL, '虚弱', NULL, 4, NULL, NULL, NULL, '1', NULL);
INSERT INTO `elderly_info` VALUES (38, '刘涛', 'M', 99, '588787855865898858', 1, NULL, NULL, '18556589858', NULL, NULL, NULL, '恢复中', 611, 3, '2024-12-27 09:26:38', NULL, 2, '1', 'http://localhost:9090/files/1735742007416-u=3900659337,4148274028&fm=253&app=138&size=w931&n=0&f=JPEG&fmt=auto.webp');
INSERT INTO `elderly_info` VALUES (39, '宋平', 'M', 88, '488787855898858589', 1, '北京市', NULL, '15889898586', NULL, NULL, NULL, '严重疾病', 612, NULL, '2024-12-27 09:38:04', NULL, 1, '1', 'http://localhost:9090/files/1735386277256-u=1775724162,4143654705&fm=253&app=138&size=w931&n=0&f=JPEG&fmt=auto.jpg');
INSERT INTO `elderly_info` VALUES (40, '黄刚', 'M', 99, '111111111111111111', 2, '北京', NULL, '15889895869', NULL, NULL, NULL, '健康状况不稳定', 614, 2, '2024-12-27 10:00:55', NULL, 1, '1', 'http://localhost:9090/files/1735545112810-u=3712364398,223648800&fm=253&app=138&size=w931&n=0&f=JPEG&fmt=auto.webp');
INSERT INTO `elderly_info` VALUES (41, '李志', 'F', 66, '651651168651', 1, NULL, NULL, NULL, NULL, NULL, NULL, '恢复中', NULL, 7, NULL, NULL, NULL, '1', 'http://localhost:9090/files/1735386277256-u=1775724162,4143654705&fm=253&app=138&size=w931&n=0&f=JPEG&fmt=auto.jpg');
INSERT INTO `elderly_info` VALUES (42, '张浩', 'M', 99, '288383888989898787', 2, '北京市', NULL, '12223232323', NULL, NULL, NULL, '健康状况不稳定', 615, 1, '2024-12-28 19:44:40', NULL, 3, '1', 'http://localhost:9090/files/1735545133772-u=2916309844,203421002&fm=253&app=138&size=w931&n=0&f=JPEG&fmt=auto.webp');
INSERT INTO `elderly_info` VALUES (43, '王静', 'F', 87, '371570884461112505', 1, '天津市和平区', '13732088632', '王先生:13935616809', NULL, NULL, NULL, '虚弱', NULL, NULL, NULL, NULL, NULL, '1', NULL);
INSERT INTO `elderly_info` VALUES (44, '李梅', 'M', 71, '662569962337385138', 3, '北京市朝阳区', '13365843424', '李女士:13615046109', NULL, NULL, NULL, '一般', NULL, 5, NULL, NULL, NULL, '1', NULL);
INSERT INTO `elderly_info` VALUES (45, '赵洋', 'M', 99, '700884874460752234', 1, '上海市浦东新区', '13667740298', '赵太太:13490038900', NULL, NULL, NULL, '健康状况不稳定', NULL, 4, NULL, NULL, NULL, '1', NULL);
INSERT INTO `elderly_info` VALUES (46, '陈亮', 'F', 98, '422190091681317277', 1, '天津市和平区', '13629368542', '王先生:13157641311', NULL, NULL, NULL, '虚弱', NULL, NULL, NULL, NULL, NULL, '1', NULL);
INSERT INTO `elderly_info` VALUES (47, '刘晶', 'M', 76, '953761189150065561', 1, '北京市朝阳区', '13806170822', '李女士:13243975054', NULL, NULL, NULL, '恢复中', NULL, 4, NULL, NULL, NULL, '1', NULL);
INSERT INTO `elderly_info` VALUES (48, '宋辉', 'M', 73, '839179071028210289', 2, '山东省济南市', '13392685907', '李女士:13798388320', NULL, NULL, NULL, '健康状况不稳定', NULL, 6, NULL, NULL, NULL, '1', NULL);
INSERT INTO `elderly_info` VALUES (49, '黄勇', 'F', 72, '703476223672619256', 1, '天津市和平区', '13441187370', '李女士:13895832566', NULL, NULL, NULL, '严重疾病', NULL, 2, NULL, NULL, NULL, '1', NULL);
INSERT INTO `elderly_info` VALUES (50, '李鹏', 'M', 88, '948928159830997003', 2, '天津市和平区', '13501972250', '赵太太:13177454406', NULL, NULL, NULL, '健康状况不稳定', NULL, 4, NULL, NULL, NULL, '1', NULL);
INSERT INTO `elderly_info` VALUES (51, '张娜', 'M', 74, '612025540559289053', 3, '广东省广州市', '13745334323', '赵太太:13296453402', NULL, NULL, NULL, '虚弱', NULL, 4, NULL, NULL, NULL, '1', NULL);
INSERT INTO `elderly_info` VALUES (52, '王雷', 'F', 77, '525493738510162763', 3, '北京市朝阳区', '13825484623', '赵太太:13227377312', NULL, NULL, NULL, '恢复中', NULL, 5, NULL, NULL, NULL, '1', NULL);
INSERT INTO `elderly_info` VALUES (53, '李悦', 'F', 85, '438528439561788087', 3, '北京市朝阳区', '13098241771', '李女士:13385121098', NULL, NULL, NULL, '健康状况不稳定', NULL, 5, NULL, NULL, NULL, '1', NULL);
INSERT INTO `elderly_info` VALUES (54, '赵亮', 'F', 85, '919185575339171208', 3, '广东省广州市', '13308460961', '李女士:13359882915', NULL, NULL, NULL, '严重疾病', NULL, 4, NULL, NULL, NULL, '1', NULL);
INSERT INTO `elderly_info` VALUES (55, '陈华', 'F', 73, '102151665300489619', 1, '广东省广州市', '13031602178', '王先生:13047685716', NULL, NULL, NULL, '虚弱', NULL, 5, NULL, NULL, NULL, '1', NULL);
INSERT INTO `elderly_info` VALUES (56, '刘文', 'M', 94, '652455957126503626', 2, '上海市浦东新区', '13893972140', '赵太太:13348831811', NULL, NULL, NULL, '恢复中', NULL, 5, NULL, NULL, NULL, '1', NULL);
INSERT INTO `elderly_info` VALUES (57, '宋雪', 'F', 97, '242749623420531215', 3, '天津市和平区', '13744819586', '赵太太:13513162385', NULL, NULL, NULL, '健康状况不稳定', NULL, 4, NULL, NULL, NULL, '1', NULL);
INSERT INTO `elderly_info` VALUES (58, '黄超', 'M', 71, '603489924039611512', 1, '广东省广州市', '13161988612', '李女士:13870394855', NULL, NULL, NULL, '虚弱', NULL, 6, NULL, NULL, NULL, '1', NULL);
INSERT INTO `elderly_info` VALUES (59, '李杰', 'M', 71, '686946308094059609', 1, '上海市浦东新区', '13793800623', '王先生:13666982676', NULL, NULL, NULL, '健康状况不稳定', NULL, 2, NULL, NULL, NULL, '1', NULL);
INSERT INTO `elderly_info` VALUES (60, '张珊', 'F', 79, '946522651600011060', 3, '天津市和平区', '13481191237', '李女士:13870044182', NULL, NULL, NULL, '恢复中', NULL, 5, NULL, NULL, NULL, '1', NULL);
INSERT INTO `elderly_info` VALUES (61, '王琪', 'F', 66, '152347900140947888', 3, '北京市朝阳区', '13109518846', '赵太太:13823179503', NULL, NULL, NULL, '虚弱', NULL, 5, NULL, NULL, NULL, '1', NULL);
INSERT INTO `elderly_info` VALUES (62, '李峰', 'M', 92, '081223715221695970', 1, '北京市朝阳区', '13884382163', '赵太太:13325228671', NULL, NULL, NULL, '严重疾病', NULL, 5, NULL, NULL, NULL, '1', NULL);
INSERT INTO `elderly_info` VALUES (63, '赵云', 'F', 87, '445132501457659772', 1, '上海市浦东新区', '13795750631', '王先生:13861427446', NULL, NULL, NULL, '健康状况不稳定', NULL, 5, NULL, NULL, NULL, '1', NULL);
INSERT INTO `elderly_info` VALUES (64, '陈博', 'F', 84, '677735891039840054', 3, '上海市浦东新区', '13321195821', '王先生:13145269304', NULL, NULL, NULL, '恢复中', NULL, 6, NULL, NULL, NULL, '1', NULL);
INSERT INTO `elderly_info` VALUES (65, '刘宇', 'F', 73, '732226800266233688', 3, '天津市和平区', '13518274985', '赵太太:13523508859', NULL, NULL, NULL, '虚弱', NULL, 4, NULL, NULL, NULL, '1', NULL);
INSERT INTO `elderly_info` VALUES (66, '宋涛', 'M', 100, '597295752126105743', 3, '天津市和平区', '13999075297', '李女士:13782031422', NULL, NULL, NULL, '严重疾病', NULL, 5, NULL, NULL, NULL, '1', NULL);
INSERT INTO `elderly_info` VALUES (67, '黄亮', 'F', 75, '977339487638208736', 2, '广东省广州市', '13842442272', '赵太太:13103553079', NULL, NULL, NULL, '健康状况不稳定', NULL, 5, NULL, NULL, NULL, '1', NULL);
INSERT INTO `elderly_info` VALUES (68, '李博', 'F', 97, '540483314168531037', 2, '山东省济南市', '13858147624', '李女士:13125202264', NULL, NULL, NULL, '恢复中', NULL, 6, NULL, NULL, NULL, '1', NULL);
INSERT INTO `elderly_info` VALUES (69, '张婷', 'M', 86, '434005800618545529', 3, '北京市朝阳区', '13671878167', '赵太太:13326946657', NULL, NULL, NULL, '虚弱', NULL, 6, NULL, NULL, NULL, '1', NULL);
INSERT INTO `elderly_info` VALUES (70, '王飞', 'F', 82, '469137323946092404', 3, '山东省济南市', '13725962979', '李女士:13745144052', NULL, NULL, NULL, '健康状况不稳定', NULL, 2, NULL, NULL, NULL, '1', NULL);
INSERT INTO `elderly_info` VALUES (71, '李婷', 'M', 66, '746568547136721986', 2, '上海市浦东新区', '13431562223', '李女士:13606796110', NULL, NULL, NULL, '健康状况不稳定', NULL, 2, NULL, NULL, NULL, '1', NULL);
INSERT INTO `elderly_info` VALUES (72, '赵兰', 'M', 81, '441330931178571017', 3, '北京市朝阳区', '13513952319', '赵太太:13294690734', NULL, NULL, NULL, '虚弱', NULL, 2, NULL, NULL, NULL, '1', NULL);
INSERT INTO `elderly_info` VALUES (73, '陈悦', 'F', 71, '692616424902535408', 3, '广东省广州市', '13711663145', '李女士:13384919876', NULL, NULL, NULL, '严重疾病', NULL, 5, NULL, NULL, NULL, '1', NULL);
INSERT INTO `elderly_info` VALUES (74, '刘晓', 'M', 64, '559513507423660351', 1, '山东省济南市', '13767900243', '王先生:13884356801', NULL, NULL, NULL, '恢复中', NULL, 5, NULL, NULL, NULL, '1', NULL);
INSERT INTO `elderly_info` VALUES (75, '宋薇', 'F', 72, '546694942441318205', 2, '天津市和平区', '13601434839', '赵太太:13306659098', NULL, NULL, NULL, '健康状况不稳定', NULL, 5, NULL, NULL, NULL, '1', NULL);
INSERT INTO `elderly_info` VALUES (76, '黄宇', 'F', 63, '571446371414657962', 3, '天津市和平区', '13695868771', '赵太太:13059107773', NULL, NULL, NULL, '虚弱', NULL, 6, NULL, NULL, NULL, '1', NULL);
INSERT INTO `elderly_info` VALUES (77, '李扬', 'M', 80, '832270243749027065', 3, '天津市和平区', '13321189456', '李女士:13544810763', NULL, NULL, NULL, '健康状况不稳定', NULL, 4, NULL, NULL, NULL, '1', NULL);
INSERT INTO `elderly_info` VALUES (78, '张瑶', 'M', 60, '763181838217922901', 2, '上海市浦东新区', '13724803987', '赵太太:13510627127', NULL, NULL, NULL, '恢复中', NULL, 5, NULL, NULL, NULL, '1', NULL);
INSERT INTO `elderly_info` VALUES (79, '王倩', 'F', 79, '556383067585665438', 2, '山东省济南市', '13224088749', '王先生:13146258305', NULL, NULL, NULL, '虚弱', NULL, 7, NULL, NULL, NULL, '1', NULL);
INSERT INTO `elderly_info` VALUES (80, '李青', 'M', 94, '746813524273265685', 3, '广东省广州市', '13706555907', '王先生:13924006987', NULL, NULL, NULL, '健康状况不稳定', NULL, 4, NULL, NULL, NULL, '1', NULL);
INSERT INTO `elderly_info` VALUES (81, '赵强', 'F', 98, '043833538425837678', 2, '北京市朝阳区', '13220707976', '王先生:13514683335', NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, '1', NULL);
INSERT INTO `elderly_info` VALUES (82, '张伟', 'F', 100, '976025388074373061', 3, '上海市浦东新区', '13472921645', '王先生:13515130152', NULL, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, '1', NULL);
INSERT INTO `elderly_info` VALUES (83, '测试用户', 'M', 73, '179084116141168507', 3, '天津市和平区', '13302832742', '李女士:13987230220', NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, '1', NULL);
INSERT INTO `elderly_info` VALUES (84, '测试用户', 'F', 80, '588258183286971003', 3, '上海市浦东新区', '13785812307', '赵太太:13919302902', NULL, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, '1', NULL);
INSERT INTO `elderly_info` VALUES (85, '王红', 'M', 79, '393028730102459817', 1, '广东省广州市', '13099533842', '李女士:13829282187', NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, '1', NULL);
INSERT INTO `elderly_info` VALUES (86, '软件涛', 'M', 79, '243679162329697245', 3, '天津市和平区', '13349348898', '赵太太:13681908982', NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, '1', NULL);
INSERT INTO `elderly_info` VALUES (87, '李华', 'F', 61, '562312996356795768', 2, '上海市浦东新区', '13653211140', '李女士:13215508129', NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, '1', NULL);
INSERT INTO `elderly_info` VALUES (88, '李华', 'F', 75, '175842300772739158', 3, '北京市朝阳区', '13886619849', '赵太太:13804127727', NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, '1', NULL);
INSERT INTO `elderly_info` VALUES (89, '李娜', 'M', 96, '313033704766675354', 2, '天津市和平区', '13895764005', '赵太太:13166398958', NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, '1', NULL);
INSERT INTO `elderly_info` VALUES (90, '王红', 'M', 63, '304537873033725754', 3, '山东省济南市', '13894474137', '李女士:13903518226', NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, '1', NULL);
INSERT INTO `elderly_info` VALUES (91, '赵强', 'F', 87, '532727508077232855', 2, '上海市浦东新区', '13014373586', '王先生:13303749320', NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, '1', NULL);
INSERT INTO `elderly_info` VALUES (92, '李华', 'F', 82, '105488287914883469', 3, '北京市朝阳区', '13005276212', '赵太太:13710131285', NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, '1', NULL);
INSERT INTO `elderly_info` VALUES (93, '张伟', 'F', 96, '601732325553453065', 2, '上海市浦东新区', '13084602179', '李女士:13170969329', NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, '1', NULL);
INSERT INTO `elderly_info` VALUES (94, '赵强', 'F', 66, '516501470307711077', 2, '上海市浦东新区', '13982259263', '王先生:13184310115', NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, '1', NULL);
INSERT INTO `elderly_info` VALUES (95, '张伟', 'F', 95, '532743451259190193', 2, '山东省济南市', '13982565580', '赵太太:13263772738', NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, '1', NULL);
INSERT INTO `elderly_info` VALUES (96, '软件涛', 'F', 60, '965873386613574057', 2, '上海市浦东新区', '13530246112', '王先生:13417476474', NULL, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, '1', NULL);
INSERT INTO `elderly_info` VALUES (97, '软件涛', 'M', 91, '437413750526024528', 2, '天津市和平区', '13254990850', '赵太太:13014707199', NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, '1', NULL);
INSERT INTO `elderly_info` VALUES (98, '李华', 'F', 79, '466166989522291687', 3, '山东省济南市', '13518672584', '李女士:13635110631', NULL, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, '1', NULL);
INSERT INTO `elderly_info` VALUES (99, '李华', 'M', 79, '782891573765909040', 3, '上海市浦东新区', '13820019556', '王先生:13813243161', NULL, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, '1', NULL);
INSERT INTO `elderly_info` VALUES (100, '李娜', 'F', 95, '982568253438210438', 3, '山东省济南市', '13072247485', '王先生:13843754607', NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, '1', NULL);
INSERT INTO `elderly_info` VALUES (101, '张三', 'F', 88, '411525909089087890', NULL, '翻斗校区', NULL, '13778789898', NULL, NULL, NULL, NULL, 625, 0, '2024-12-30 16:46:06', NULL, 0, '1', 'http://localhost:9090/files/1735605107961-u=2162199340,2168177252&fm=253&app=138&size=w931&n=0&f=JPEG&fmt=auto.webp');
INSERT INTO `elderly_info` VALUES (102, '张三', 'M', 88, '455475878787584758', 1, '北京市', NULL, '15885865896', NULL, NULL, NULL, NULL, 616, NULL, '2024-12-31 09:18:22', NULL, 1, '1', 'http://localhost:9090/files/1735607899769-u=1775724162,4143654705&fm=253&app=138&size=w931&n=0&f=JPEG&fmt=auto.jpg');
INSERT INTO `elderly_info` VALUES (103, '111', 'M', 98, '144587855825258785', 3, '北京', NULL, '1585558258785', NULL, NULL, NULL, NULL, 617, NULL, '2025-01-01 22:29:45', NULL, 1, '1', 'http://localhost:9090/files/1735741781522-u=3712364398,223648800&fm=253&app=138&size=w931&n=0&f=JPEG&fmt=auto.webp');

-- ----------------------------
-- Table structure for financial
-- ----------------------------
DROP TABLE IF EXISTS `financial`;
CREATE TABLE `financial`  (
  `financial_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '财务记录的唯一标识符',
  `type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '财务记录的类型（收入、支出等）',
  `amount` decimal(15, 2) NOT NULL COMMENT '财务记录的金额',
  `date` date NOT NULL COMMENT '财务记录发生的日期',
  `elderly_id` int(11) NULL DEFAULT NULL COMMENT '与该财务记录关联的老人ID，外键关联到老人表',
  `project_id` int(11) NULL DEFAULT NULL COMMENT '与该财务记录关联的护理项目ID，外键关联到护理项目表',
  `invoice_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '与该财务记录关联的发票编号',
  `invoice_date` date NULL DEFAULT NULL COMMENT '发票的日期',
  `payment_party` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '付款或收款方的名称或描述',
  `remarks` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '其他需要记录的备注信息',
  `created_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '记录被添加到表中的时间',
  `updated_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '记录最后一次被修改的时间',
  `status` int(11) NULL DEFAULT 1 COMMENT '状态,用于删除,1 可用，0 不可用',
  PRIMARY KEY (`financial_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1045 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '存储老人项目的财务信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of financial
-- ----------------------------
INSERT INTO `financial` VALUES (1, '收入', 465.00, '2024-12-27', 1, 1, NULL, NULL, '小王', NULL, '2024-12-27 14:48:38', '2024-12-27 14:48:38', 1);
INSERT INTO `financial` VALUES (2, '支出', 300.00, '2024-12-30', 1, 1, NULL, NULL, '小城', NULL, '2024-12-30 08:45:50', '2024-12-30 08:45:57', 1);
INSERT INTO `financial` VALUES (3, '收入', 10.00, '2024-12-30', 1, 1, NULL, NULL, '小', NULL, '2024-12-30 09:10:45', '2024-12-30 09:10:45', 1);
INSERT INTO `financial` VALUES (4, '收入', 146.67, '2011-01-07', 3, 0, NULL, NULL, '梁睿', NULL, '2024-12-30 09:27:10', '2024-12-30 09:27:41', 1);
INSERT INTO `financial` VALUES (5, '支出', 0.20, '2012-01-27', 7, 8, NULL, NULL, '唐杰宏', NULL, '2024-12-30 09:27:10', '2024-12-30 09:28:04', 1);
INSERT INTO `financial` VALUES (6, '收入', 14.72, '2014-09-29', 8, 1, NULL, NULL, '沈詩涵', NULL, '2024-12-30 09:27:10', '2024-12-30 09:27:47', 1);
INSERT INTO `financial` VALUES (7, '支出', 147.30, '2001-09-29', 6, 2, NULL, NULL, '胡秀英', NULL, '2024-12-30 09:27:10', '2024-12-30 09:28:06', 1);
INSERT INTO `financial` VALUES (8, '收入', 88.95, '2020-09-18', 2, 2, NULL, NULL, '郭岚', NULL, '2024-12-30 09:27:10', '2024-12-30 09:27:50', 1);
INSERT INTO `financial` VALUES (9, '收入', 22.98, '2023-10-18', 1, 6, NULL, NULL, '武杰宏', NULL, '2024-12-30 09:27:10', '2024-12-30 09:27:53', 1);
INSERT INTO `financial` VALUES (10, '支出', 17.80, '2003-05-05', 6, 1, NULL, NULL, '叶岚', NULL, '2024-12-30 09:27:10', '2024-12-30 09:28:09', 1);
INSERT INTO `financial` VALUES (11, '收入', 47.87, '2005-04-21', 1, 2, NULL, NULL, '薛杰宏', NULL, '2024-12-30 09:27:10', '2024-12-30 09:27:57', 1);
INSERT INTO `financial` VALUES (12, '支出', 91.06, '2013-12-18', 2, 7, NULL, NULL, '孔岚', NULL, '2024-12-30 09:27:10', '2024-12-30 09:28:16', 1);
INSERT INTO `financial` VALUES (13, '支出', 11.94, '2010-09-03', 1, 10, NULL, NULL, '汪秀英', NULL, '2024-12-30 09:27:10', '2024-12-30 09:29:31', 1);
INSERT INTO `financial` VALUES (14, '收入', 200.00, '2024-01-09', 1, 1, NULL, NULL, '我', NULL, '2024-12-30 10:02:28', '2024-12-30 10:02:28', 1);
INSERT INTO `financial` VALUES (15, '收入', 120.84, '2024-07-26', 1, 6, NULL, NULL, '蔡云熙', NULL, '2024-12-30 14:53:13', '2024-12-30 14:53:13', 1);
INSERT INTO `financial` VALUES (16, '支出', 118.95, '2024-05-05', 3, 1, NULL, NULL, '朱杰宏', NULL, '2024-12-30 14:53:13', '2024-12-30 14:53:13', 1);
INSERT INTO `financial` VALUES (17, '收入', 35.54, '2024-03-15', 10, 9, NULL, NULL, '汤安琪', NULL, '2024-12-30 14:53:13', '2024-12-30 14:53:13', 1);
INSERT INTO `financial` VALUES (18, '支出', 86.15, '2024-01-03', 3, 9, NULL, NULL, '谢子韬', NULL, '2024-12-30 14:53:13', '2024-12-30 14:53:13', 1);
INSERT INTO `financial` VALUES (19, '支出', 133.33, '2024-04-05', 10, 8, NULL, NULL, '何致远', NULL, '2024-12-30 14:53:13', '2024-12-30 14:53:13', 1);
INSERT INTO `financial` VALUES (20, '收入', 185.43, '2024-08-30', 2, 0, NULL, NULL, '江宇宁', NULL, '2024-12-30 14:53:13', '2024-12-30 14:53:13', 1);
INSERT INTO `financial` VALUES (21, '收入', 0.69, '2024-02-22', 5, 1, NULL, NULL, '石安琪', NULL, '2024-12-30 14:53:13', '2024-12-30 14:53:13', 1);
INSERT INTO `financial` VALUES (22, '收入', 192.29, '2024-01-02', 6, 6, NULL, NULL, '韩震南', NULL, '2024-12-30 14:53:13', '2024-12-30 14:53:13', 1);
INSERT INTO `financial` VALUES (23, '支出', 42.98, '2024-11-22', 5, 6, NULL, NULL, '严子异', NULL, '2024-12-30 14:53:13', '2024-12-30 14:53:13', 1);
INSERT INTO `financial` VALUES (24, '支出', 146.38, '2024-06-27', 4, 3, NULL, NULL, '崔晓明', NULL, '2024-12-30 14:53:13', '2024-12-30 14:53:13', 1);
INSERT INTO `financial` VALUES (25, '支出', 106.62, '2024-09-25', 4, 2, NULL, NULL, '龙晓明', NULL, '2024-12-30 14:53:13', '2024-12-30 14:53:13', 1);
INSERT INTO `financial` VALUES (26, '收入', 51.83, '2024-03-14', 1, 5, NULL, NULL, '韩晓明', NULL, '2024-12-30 14:53:13', '2024-12-30 14:53:13', 1);
INSERT INTO `financial` VALUES (27, '支出', 106.30, '2024-12-04', 3, 9, NULL, NULL, '张睿', NULL, '2024-12-30 14:53:13', '2024-12-30 14:53:13', 1);
INSERT INTO `financial` VALUES (28, '收入', 36.93, '2024-12-03', 5, 5, NULL, NULL, '汤子韬', NULL, '2024-12-30 14:53:13', '2024-12-30 14:53:13', 1);
INSERT INTO `financial` VALUES (29, '支出', 1.35, '2024-01-17', 8, 10, NULL, NULL, '汤詩涵', NULL, '2024-12-30 14:53:13', '2024-12-30 14:53:13', 1);
INSERT INTO `financial` VALUES (30, '支出', 115.32, '2024-11-26', 9, 5, NULL, NULL, '余子异', NULL, '2024-12-30 14:53:13', '2024-12-30 14:53:13', 1);
INSERT INTO `financial` VALUES (31, '支出', 26.11, '2024-09-09', 0, 3, NULL, NULL, '薛杰宏', NULL, '2024-12-30 14:53:13', '2024-12-30 14:53:13', 1);
INSERT INTO `financial` VALUES (32, '支出', 114.39, '2024-11-09', 8, 4, NULL, NULL, '周子韬', NULL, '2024-12-30 14:53:13', '2024-12-30 14:53:13', 1);
INSERT INTO `financial` VALUES (33, '收入', 149.94, '2024-05-29', 6, 8, NULL, NULL, '杜安琪', NULL, '2024-12-30 14:53:13', '2024-12-30 14:53:13', 1);
INSERT INTO `financial` VALUES (34, '支出', 178.07, '2023-12-15', 9, 5, NULL, NULL, '何璐', NULL, '2024-12-30 14:53:13', '2024-12-30 14:53:13', 1);
INSERT INTO `financial` VALUES (35, '支出', 190.63, '2024-03-21', 3, 7, NULL, NULL, '阎宇宁', NULL, '2024-12-30 14:53:13', '2024-12-30 14:53:13', 1);
INSERT INTO `financial` VALUES (36, '收入', 27.95, '2024-12-05', 8, 4, NULL, NULL, '许詩涵', NULL, '2024-12-30 14:53:13', '2024-12-30 14:53:13', 1);
INSERT INTO `financial` VALUES (37, '收入', 35.74, '2024-12-19', 3, 9, NULL, NULL, '贾嘉伦', NULL, '2024-12-30 14:53:13', '2024-12-30 14:53:13', 1);
INSERT INTO `financial` VALUES (38, '收入', 104.50, '2024-05-05', 9, 2, NULL, NULL, '廖云熙', NULL, '2024-12-30 14:53:13', '2024-12-30 14:53:13', 1);
INSERT INTO `financial` VALUES (39, '支出', 181.67, '2024-01-31', 8, 0, NULL, NULL, '黄子韬', NULL, '2024-12-30 14:53:13', '2024-12-30 14:53:13', 1);
INSERT INTO `financial` VALUES (40, '收入', 117.47, '2024-04-05', 10, 8, NULL, NULL, '孟璐', NULL, '2024-12-30 14:53:13', '2024-12-30 14:53:13', 1);
INSERT INTO `financial` VALUES (41, '支出', 141.10, '2024-03-05', 9, 10, NULL, NULL, '史岚', NULL, '2024-12-30 14:53:13', '2024-12-30 14:53:13', 1);
INSERT INTO `financial` VALUES (42, '支出', 167.92, '2024-05-06', 10, 6, NULL, NULL, '曹宇宁', NULL, '2024-12-30 14:53:13', '2024-12-30 14:53:13', 1);
INSERT INTO `financial` VALUES (43, '收入', 177.66, '2023-12-16', 6, 2, NULL, NULL, '沈震南', NULL, '2024-12-30 14:53:13', '2024-12-30 14:53:13', 1);
INSERT INTO `financial` VALUES (44, '支出', 150.93, '2024-04-27', 3, 1, NULL, NULL, '沈秀英', NULL, '2024-12-30 14:53:13', '2024-12-30 14:53:13', 1);
INSERT INTO `financial` VALUES (45, '收入', 169.10, '2025-01-12', 1, 7, NULL, NULL, '阎詩涵', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (46, '收入', 147.38, '2025-01-18', 9, 5, NULL, NULL, '金秀英', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (47, '收入', 196.32, '2025-01-23', 6, 2, NULL, NULL, '孔詩涵', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (48, '收入', 95.81, '2025-01-19', 6, 9, NULL, NULL, '梁宇宁', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (49, '支出', 192.24, '2025-01-07', 8, 2, NULL, NULL, '潘詩涵', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (50, '支出', 160.61, '2025-01-21', 5, 3, NULL, NULL, '蔡璐', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (51, '收入', 93.09, '2025-01-30', 3, 8, NULL, NULL, '梁杰宏', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (52, '支出', 105.47, '2025-01-04', 9, 8, NULL, NULL, '徐杰宏', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (53, '支出', 72.66, '2025-01-01', 3, 5, NULL, NULL, '阎震南', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (54, '支出', 172.32, '2025-01-29', 2, 2, NULL, NULL, '雷璐', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (55, '支出', 71.74, '2025-01-07', 8, 6, NULL, NULL, '郭子异', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (56, '支出', 13.02, '2025-01-27', 3, 7, NULL, NULL, '何睿', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (57, '收入', 119.39, '2025-01-14', 3, 7, NULL, NULL, '毛子韬', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (58, '支出', 134.55, '2025-01-30', 8, 8, NULL, NULL, '赵云熙', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (59, '支出', 131.73, '2025-01-10', 1, 4, NULL, NULL, '何安琪', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (60, '收入', 8.85, '2025-01-03', 3, 1, NULL, NULL, '黎晓明', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (61, '收入', 116.55, '2025-01-24', 6, 0, NULL, NULL, '朱安琪', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (62, '收入', 120.17, '2025-01-30', 8, 2, NULL, NULL, '向宇宁', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (63, '支出', 127.58, '2025-01-18', 8, 6, NULL, NULL, '徐睿', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (64, '支出', 86.26, '2025-01-26', 2, 6, NULL, NULL, '莫晓明', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (65, '支出', 63.19, '2025-01-24', 7, 7, NULL, NULL, '郝云熙', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (66, '支出', 135.67, '2025-01-04', 9, 6, NULL, NULL, '卢震南', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (67, '支出', 52.99, '2025-01-28', 8, 1, NULL, NULL, '廖安琪', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (68, '支出', 83.93, '2025-01-01', 1, 4, NULL, NULL, '袁詩涵', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (69, '支出', 36.38, '2025-01-24', 2, 1, NULL, NULL, '史安琪', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (70, '支出', 147.73, '2025-01-09', 1, 5, NULL, NULL, '谭震南', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (71, '收入', 184.71, '2025-01-08', 9, 5, NULL, NULL, '曾云熙', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (72, '收入', 142.02, '2025-01-06', 5, 5, NULL, NULL, '郑詩涵', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (73, '支出', 19.78, '2025-01-01', 1, 7, NULL, NULL, '许璐', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (74, '收入', 85.46, '2025-01-16', 3, 0, NULL, NULL, '任宇宁', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (75, '收入', 88.82, '2025-01-12', 7, 9, NULL, NULL, '陆云熙', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (76, '收入', 149.59, '2025-01-12', 5, 8, NULL, NULL, '莫震南', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (77, '收入', 73.93, '2025-01-31', 2, 7, NULL, NULL, '钟震南', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (78, '支出', 56.67, '2025-01-03', 10, 0, NULL, NULL, '史秀英', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (79, '收入', 19.68, '2025-01-11', 7, 6, NULL, NULL, '张宇宁', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (80, '支出', 91.35, '2025-01-16', 1, 1, NULL, NULL, '段云熙', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (81, '收入', 120.20, '2025-01-29', 7, 2, NULL, NULL, '李致远', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (82, '收入', 118.59, '2025-01-04', 2, 7, NULL, NULL, '龙子韬', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (83, '收入', 142.22, '2025-01-01', 3, 6, NULL, NULL, '刘睿', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (84, '收入', 71.07, '2025-01-28', 6, 9, NULL, NULL, '廖安琪', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (85, '收入', 188.59, '2025-01-18', 6, 10, NULL, NULL, '薛秀英', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (86, '支出', 91.84, '2025-01-23', 5, 6, NULL, NULL, '何詩涵', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (87, '支出', 193.91, '2025-01-13', 7, 5, NULL, NULL, '王子异', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (88, '收入', 42.97, '2025-01-12', 8, 2, NULL, NULL, '莫睿', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (89, '支出', 30.15, '2025-01-08', 1, 5, NULL, NULL, '韩宇宁', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (90, '收入', 100.55, '2025-01-14', 7, 4, NULL, NULL, '董宇宁', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (91, '支出', 3.52, '2025-01-02', 1, 8, NULL, NULL, '龙宇宁', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (92, '支出', 40.83, '2025-01-29', 9, 2, NULL, NULL, '程璐', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (93, '收入', 152.20, '2025-01-18', 4, 4, NULL, NULL, '傅云熙', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (94, '收入', 30.35, '2025-01-07', 3, 9, NULL, NULL, '史宇宁', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (95, '支出', 144.25, '2025-01-18', 0, 10, NULL, NULL, '李致远', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (96, '收入', 126.74, '2025-01-26', 3, 1, NULL, NULL, '任子韬', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (97, '收入', 185.83, '2025-01-29', 6, 1, NULL, NULL, '姜云熙', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (98, '支出', 85.91, '2025-01-29', 2, 3, NULL, NULL, '叶杰宏', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (99, '支出', 112.01, '2025-01-01', 10, 4, NULL, NULL, '郭震南', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (100, '收入', 9.23, '2025-01-31', 8, 10, NULL, NULL, '邵晓明', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (101, '支出', 48.73, '2025-01-05', 5, 5, NULL, NULL, '史云熙', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (102, '支出', 169.18, '2025-01-03', 6, 8, NULL, NULL, '冯璐', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (103, '支出', 133.48, '2025-01-12', 7, 8, NULL, NULL, '任睿', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (104, '支出', 82.94, '2025-01-04', 3, 8, NULL, NULL, '秦晓明', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (105, '收入', 7.45, '2025-01-07', 6, 9, NULL, NULL, '韩嘉伦', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (106, '支出', 109.09, '2025-01-28', 8, 9, NULL, NULL, '薛宇宁', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (107, '支出', 97.70, '2025-01-26', 2, 7, NULL, NULL, '雷宇宁', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (108, '支出', 179.56, '2025-01-25', 3, 4, NULL, NULL, '胡子韬', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (109, '支出', 55.62, '2025-01-20', 4, 9, NULL, NULL, '孟致远', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (110, '收入', 20.36, '2025-01-02', 0, 10, NULL, NULL, '蔡嘉伦', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (111, '支出', 182.87, '2025-01-22', 3, 6, NULL, NULL, '阎震南', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (112, '收入', 12.30, '2025-01-05', 1, 8, NULL, NULL, '梁璐', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (113, '收入', 51.39, '2025-01-23', 7, 1, NULL, NULL, '曾致远', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (114, '收入', 58.18, '2025-01-16', 2, 9, NULL, NULL, '姜岚', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (115, '收入', 184.90, '2025-01-15', 1, 9, NULL, NULL, '李宇宁', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (116, '支出', 1.05, '2025-01-20', 10, 6, NULL, NULL, '龚子韬', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (117, '支出', 104.49, '2025-01-03', 8, 6, NULL, NULL, '张致远', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (118, '收入', 133.49, '2025-01-09', 1, 1, NULL, NULL, '傅子韬', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (119, '支出', 148.99, '2025-01-09', 5, 4, NULL, NULL, '梁詩涵', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (120, '收入', 154.82, '2025-01-17', 8, 3, NULL, NULL, '何秀英', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (121, '收入', 192.49, '2025-01-16', 4, 1, NULL, NULL, '曹睿', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (122, '支出', 39.48, '2025-01-12', 9, 9, NULL, NULL, '姚子韬', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (123, '支出', 103.07, '2025-01-18', 2, 1, NULL, NULL, '张杰宏', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (124, '收入', 50.68, '2025-01-27', 8, 3, NULL, NULL, '蔡震南', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (125, '收入', 55.64, '2025-01-27', 7, 10, NULL, NULL, '韦安琪', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (126, '支出', 131.37, '2025-01-26', 8, 2, NULL, NULL, '黎睿', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (127, '支出', 168.32, '2025-01-26', 6, 6, NULL, NULL, '潘詩涵', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (128, '收入', 47.46, '2025-01-05', 2, 9, NULL, NULL, '赵詩涵', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (129, '收入', 143.06, '2025-01-05', 10, 4, NULL, NULL, '潘致远', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (130, '收入', 142.95, '2025-01-30', 0, 2, NULL, NULL, '苏震南', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (131, '支出', 138.76, '2025-01-23', 7, 5, NULL, NULL, '孙詩涵', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (132, '收入', 179.49, '2025-01-07', 6, 5, NULL, NULL, '唐詩涵', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (133, '支出', 11.77, '2025-01-16', 6, 10, NULL, NULL, '莫震南', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (134, '支出', 190.04, '2025-01-08', 3, 5, NULL, NULL, '马岚', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (135, '收入', 154.97, '2025-01-08', 0, 5, NULL, NULL, '郝安琪', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (136, '收入', 62.88, '2025-01-12', 4, 9, NULL, NULL, '廖致远', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (137, '收入', 147.89, '2025-01-13', 7, 9, NULL, NULL, '薛杰宏', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (138, '支出', 53.41, '2025-01-17', 7, 9, NULL, NULL, '毛致远', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (139, '收入', 54.15, '2025-01-04', 6, 0, NULL, NULL, '顾璐', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (140, '收入', 133.51, '2025-01-17', 10, 5, NULL, NULL, '于岚', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (141, '收入', 162.27, '2025-01-17', 7, 9, NULL, NULL, '刘子异', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (142, '支出', 130.74, '2025-01-24', 9, 2, NULL, NULL, '任岚', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (143, '支出', 77.59, '2025-01-18', 1, 3, NULL, NULL, '史子韬', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (144, '支出', 115.49, '2025-01-03', 7, 4, NULL, NULL, '孟睿', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (145, '支出', 187.49, '2025-01-04', 3, 4, NULL, NULL, '汤嘉伦', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (146, '支出', 25.55, '2025-01-19', 8, 2, NULL, NULL, '江詩涵', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (147, '收入', 73.06, '2025-01-23', 1, 5, NULL, NULL, '许嘉伦', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (148, '支出', 134.80, '2025-01-18', 4, 8, NULL, NULL, '冯睿', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (149, '支出', 8.83, '2025-01-27', 6, 2, NULL, NULL, '贾子韬', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (150, '支出', 50.28, '2025-01-04', 5, 5, NULL, NULL, '崔致远', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (151, '收入', 175.97, '2025-01-28', 8, 7, NULL, NULL, '郭震南', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (152, '支出', 184.80, '2025-01-07', 1, 8, NULL, NULL, '秦秀英', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (153, '支出', 33.11, '2025-01-19', 3, 8, NULL, NULL, '邵致远', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (154, '支出', 18.05, '2025-01-01', 7, 1, NULL, NULL, '范嘉伦', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (155, '支出', 153.80, '2025-01-21', 2, 3, NULL, NULL, '江震南', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (156, '支出', 53.20, '2025-01-22', 9, 4, NULL, NULL, '邹宇宁', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (157, '支出', 109.92, '2025-01-09', 4, 8, NULL, NULL, '徐震南', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (158, '支出', 7.05, '2025-01-21', 8, 7, NULL, NULL, '廖睿', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (159, '支出', 182.46, '2025-01-15', 6, 5, NULL, NULL, '邹子韬', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (160, '支出', 95.76, '2025-01-06', 8, 10, NULL, NULL, '姜子韬', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (161, '支出', 47.78, '2025-01-05', 2, 2, NULL, NULL, '阎子韬', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (162, '支出', 81.69, '2025-01-22', 1, 3, NULL, NULL, '薛子异', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (163, '收入', 85.35, '2025-01-10', 2, 2, NULL, NULL, '吕子异', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (164, '支出', 76.18, '2025-01-11', 2, 1, NULL, NULL, '魏安琪', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (165, '收入', 76.57, '2025-01-23', 1, 9, NULL, NULL, '黄宇宁', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (166, '支出', 13.71, '2025-01-19', 3, 5, NULL, NULL, '刘子异', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (167, '收入', 89.30, '2025-01-03', 0, 9, NULL, NULL, '金安琪', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (168, '收入', 45.62, '2025-01-27', 0, 5, NULL, NULL, '徐晓明', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (169, '收入', 93.78, '2025-01-02', 4, 5, NULL, NULL, '贺致远', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (170, '收入', 130.46, '2025-01-29', 4, 10, NULL, NULL, '沈璐', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (171, '收入', 3.10, '2025-01-04', 1, 4, NULL, NULL, '蔡岚', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (172, '支出', 159.49, '2025-01-28', 4, 7, NULL, NULL, '谢岚', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (173, '收入', 128.04, '2025-01-09', 2, 1, NULL, NULL, '朱震南', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (174, '支出', 88.78, '2025-01-23', 8, 3, NULL, NULL, '莫岚', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (175, '收入', 78.35, '2025-01-19', 1, 5, NULL, NULL, '刘子异', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (176, '收入', 189.30, '2025-01-18', 3, 7, NULL, NULL, '刘云熙', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (177, '支出', 113.09, '2025-01-08', 1, 2, NULL, NULL, '袁詩涵', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (178, '支出', 113.68, '2025-01-15', 4, 8, NULL, NULL, '袁睿', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (179, '支出', 11.60, '2025-01-17', 1, 7, NULL, NULL, '魏安琪', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (180, '收入', 139.44, '2025-01-06', 2, 2, NULL, NULL, '莫安琪', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (181, '支出', 123.69, '2025-01-19', 2, 7, NULL, NULL, '李睿', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (182, '支出', 49.70, '2025-01-14', 7, 10, NULL, NULL, '武睿', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (183, '收入', 9.87, '2025-01-28', 8, 5, NULL, NULL, '陆子韬', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (184, '收入', 168.83, '2025-01-12', 2, 5, NULL, NULL, '何震南', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (185, '收入', 91.33, '2025-01-03', 1, 0, NULL, NULL, '邱詩涵', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (186, '支出', 144.83, '2025-01-26', 4, 1, NULL, NULL, '曾致远', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (187, '支出', 57.24, '2025-01-27', 3, 7, NULL, NULL, '金杰宏', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (188, '收入', 55.39, '2025-01-29', 1, 7, NULL, NULL, '龙致远', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (189, '支出', 157.67, '2025-01-29', 9, 9, NULL, NULL, '林杰宏', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (190, '收入', 174.29, '2025-01-13', 6, 4, NULL, NULL, '薛嘉伦', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (191, '收入', 8.74, '2025-01-22', 10, 4, NULL, NULL, '韦子韬', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (192, '支出', 116.37, '2025-01-14', 3, 1, NULL, NULL, '龙詩涵', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (193, '收入', 160.70, '2025-01-04', 1, 1, NULL, NULL, '戴安琪', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (194, '收入', 198.88, '2025-01-18', 0, 2, NULL, NULL, '杨子异', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (195, '收入', 126.33, '2025-01-20', 10, 3, NULL, NULL, '田云熙', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (196, '支出', 189.27, '2025-01-10', 10, 1, NULL, NULL, '徐安琪', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (197, '支出', 142.48, '2025-01-08', 5, 6, NULL, NULL, '许震南', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (198, '收入', 165.34, '2025-01-08', 10, 4, NULL, NULL, '张子异', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (199, '收入', 40.21, '2025-01-24', 1, 8, NULL, NULL, '贾嘉伦', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (200, '支出', 171.70, '2025-01-18', 3, 8, NULL, NULL, '于安琪', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (201, '收入', 79.27, '2025-01-27', 10, 10, NULL, NULL, '黄睿', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (202, '支出', 67.66, '2025-01-12', 7, 5, NULL, NULL, '曾宇宁', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (203, '支出', 134.24, '2025-01-08', 5, 5, NULL, NULL, '周晓明', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (204, '收入', 29.32, '2025-01-24', 5, 7, NULL, NULL, '于晓明', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (205, '收入', 194.60, '2025-01-04', 9, 4, NULL, NULL, '秦秀英', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (206, '收入', 66.11, '2025-01-06', 8, 2, NULL, NULL, '黎子异', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (207, '收入', 48.66, '2025-01-05', 3, 4, NULL, NULL, '李璐', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (208, '支出', 175.10, '2025-01-06', 6, 5, NULL, NULL, '顾子韬', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (209, '收入', 61.78, '2025-01-10', 2, 9, NULL, NULL, '徐云熙', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (210, '支出', 126.47, '2025-01-10', 8, 1, NULL, NULL, '罗云熙', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (211, '支出', 90.10, '2025-01-22', 8, 6, NULL, NULL, '秦岚', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (212, '收入', 87.68, '2025-01-04', 10, 2, NULL, NULL, '陶璐', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (213, '支出', 47.10, '2025-01-23', 3, 1, NULL, NULL, '杜子异', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (214, '收入', 120.45, '2025-01-06', 1, 6, NULL, NULL, '严睿', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (215, '支出', 21.81, '2025-01-12', 6, 5, NULL, NULL, '李宇宁', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (216, '支出', 174.29, '2025-01-20', 8, 1, NULL, NULL, '冯璐', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (217, '收入', 108.76, '2025-01-14', 2, 9, NULL, NULL, '唐岚', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (218, '收入', 170.23, '2025-01-31', 1, 4, NULL, NULL, '薛岚', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (219, '支出', 146.43, '2025-01-07', 6, 2, NULL, NULL, '林安琪', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (220, '收入', 35.32, '2025-01-01', 6, 6, NULL, NULL, '石云熙', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (221, '收入', 74.95, '2025-01-16', 6, 8, NULL, NULL, '蒋子韬', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (222, '支出', 69.43, '2025-01-18', 9, 5, NULL, NULL, '叶秀英', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (223, '支出', 106.95, '2025-01-03', 3, 3, NULL, NULL, '张安琪', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (224, '收入', 159.47, '2025-01-13', 7, 5, NULL, NULL, '郑震南', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (225, '收入', 187.32, '2025-01-09', 4, 6, NULL, NULL, '梁睿', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (226, '支出', 193.91, '2025-01-19', 10, 8, NULL, NULL, '冯致远', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (227, '收入', 162.37, '2025-01-29', 3, 1, NULL, NULL, '唐子韬', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (228, '支出', 143.09, '2025-01-10', 8, 3, NULL, NULL, '徐致远', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (229, '支出', 129.02, '2025-01-11', 1, 8, NULL, NULL, '汪睿', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (230, '支出', 196.24, '2025-01-06', 1, 8, NULL, NULL, '罗璐', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (231, '收入', 108.00, '2025-01-29', 3, 3, NULL, NULL, '吕致远', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (232, '支出', 175.97, '2025-01-10', 1, 6, NULL, NULL, '黄安琪', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (233, '支出', 22.20, '2025-01-31', 5, 6, NULL, NULL, '袁震南', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (234, '支出', 170.17, '2025-01-29', 10, 2, NULL, NULL, '严詩涵', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (235, '收入', 77.55, '2025-01-09', 3, 3, NULL, NULL, '尹子异', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (236, '支出', 103.35, '2025-01-16', 4, 5, NULL, NULL, '熊云熙', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (237, '支出', 50.77, '2025-01-23', 4, 1, NULL, NULL, '胡云熙', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (238, '支出', 167.32, '2025-01-15', 9, 10, NULL, NULL, '邵子韬', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (239, '支出', 20.78, '2025-01-20', 10, 3, NULL, NULL, '郝岚', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (240, '收入', 14.43, '2025-01-23', 8, 10, NULL, NULL, '陈子异', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (241, '支出', 182.47, '2025-01-22', 3, 8, NULL, NULL, '余安琪', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (242, '支出', 74.28, '2025-01-06', 10, 5, NULL, NULL, '向云熙', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (243, '支出', 12.55, '2025-01-08', 1, 8, NULL, NULL, '夏致远', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (244, '收入', 31.79, '2025-01-17', 2, 2, NULL, NULL, '彭宇宁', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (245, '收入', 89.97, '2025-01-09', 5, 2, NULL, NULL, '崔岚', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (246, '收入', 110.49, '2025-01-29', 3, 4, NULL, NULL, '陆嘉伦', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (247, '支出', 104.62, '2025-01-09', 2, 8, NULL, NULL, '韩宇宁', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (248, '支出', 137.29, '2025-01-30', 7, 0, NULL, NULL, '顾震南', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (249, '收入', 150.59, '2025-01-13', 8, 8, NULL, NULL, '魏致远', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (250, '支出', 194.07, '2025-01-27', 10, 9, NULL, NULL, '雷宇宁', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (251, '支出', 22.53, '2025-01-14', 5, 0, NULL, NULL, '邱杰宏', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (252, '收入', 68.96, '2025-01-31', 4, 1, NULL, NULL, '徐睿', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (253, '支出', 30.94, '2025-01-18', 4, 8, NULL, NULL, '陆岚', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (254, '收入', 144.79, '2025-01-03', 6, 8, NULL, NULL, '段宇宁', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (255, '收入', 103.32, '2025-01-11', 7, 2, NULL, NULL, '陶杰宏', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (256, '收入', 117.61, '2025-01-01', 8, 1, NULL, NULL, '龙岚', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (257, '收入', 185.38, '2025-01-16', 9, 6, NULL, NULL, '孔詩涵', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (258, '收入', 3.78, '2025-01-23', 8, 2, NULL, NULL, '蒋睿', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (259, '支出', 168.75, '2025-01-06', 3, 5, NULL, NULL, '方云熙', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (260, '收入', 164.52, '2025-01-22', 2, 9, NULL, NULL, '夏子韬', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (261, '收入', 177.60, '2025-01-03', 4, 3, NULL, NULL, '程詩涵', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (262, '支出', 171.90, '2025-01-06', 8, 0, NULL, NULL, '周睿', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (263, '支出', 173.35, '2025-01-29', 2, 4, NULL, NULL, '廖云熙', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (264, '收入', 111.66, '2025-01-03', 1, 2, NULL, NULL, '莫致远', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (265, '支出', 30.72, '2025-01-19', 5, 0, NULL, NULL, '金嘉伦', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (266, '支出', 4.25, '2025-01-01', 8, 9, NULL, NULL, '钟安琪', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (267, '收入', 157.76, '2025-01-10', 2, 1, NULL, NULL, '傅致远', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (268, '收入', 117.18, '2025-01-12', 7, 5, NULL, NULL, '曾岚', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (269, '支出', 146.88, '2025-01-27', 8, 5, NULL, NULL, '史云熙', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (270, '支出', 99.95, '2025-01-23', 4, 7, NULL, NULL, '常晓明', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (271, '收入', 177.45, '2025-01-23', 5, 0, NULL, NULL, '廖晓明', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (272, '支出', 140.15, '2025-01-16', 6, 6, NULL, NULL, '王杰宏', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (273, '支出', 37.36, '2025-01-12', 4, 1, NULL, NULL, '马宇宁', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (274, '支出', 178.03, '2025-01-24', 3, 0, NULL, NULL, '武璐', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (275, '收入', 148.16, '2025-01-15', 3, 7, NULL, NULL, '侯嘉伦', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (276, '收入', 26.94, '2025-01-17', 8, 6, NULL, NULL, '钱嘉伦', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (277, '收入', 78.49, '2025-01-21', 8, 1, NULL, NULL, '顾詩涵', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (278, '收入', 141.10, '2025-01-26', 9, 4, NULL, NULL, '陆嘉伦', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (279, '支出', 1.37, '2025-01-20', 10, 1, NULL, NULL, '邹睿', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (280, '支出', 148.64, '2025-01-14', 7, 8, NULL, NULL, '黎璐', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (281, '收入', 7.96, '2025-01-02', 4, 4, NULL, NULL, '程杰宏', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (282, '收入', 29.70, '2025-01-23', 1, 3, NULL, NULL, '阎安琪', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (283, '支出', 63.75, '2025-01-07', 9, 8, NULL, NULL, '夏子异', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (284, '收入', 95.60, '2025-01-12', 2, 0, NULL, NULL, '董安琪', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (285, '支出', 12.92, '2025-01-24', 5, 9, NULL, NULL, '廖秀英', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (286, '支出', 88.58, '2025-01-25', 7, 3, NULL, NULL, '阎震南', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (287, '收入', 94.91, '2025-01-01', 4, 1, NULL, NULL, '程云熙', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (288, '收入', 175.07, '2025-01-12', 1, 4, NULL, NULL, '袁晓明', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (289, '收入', 95.58, '2025-01-23', 3, 4, NULL, NULL, '王云熙', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (290, '支出', 41.73, '2025-01-30', 5, 8, NULL, NULL, '胡安琪', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (291, '收入', 157.10, '2025-01-06', 9, 5, NULL, NULL, '田晓明', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (292, '支出', 183.43, '2025-01-22', 5, 8, NULL, NULL, '吴致远', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (293, '收入', 41.88, '2025-01-31', 1, 7, NULL, NULL, '任子异', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (294, '支出', 181.02, '2025-01-16', 1, 4, NULL, NULL, '于震南', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (295, '支出', 46.91, '2025-01-25', 1, 9, NULL, NULL, '莫宇宁', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (296, '支出', 66.82, '2025-01-09', 9, 5, NULL, NULL, '廖云熙', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (297, '收入', 6.65, '2025-01-21', 8, 3, NULL, NULL, '胡云熙', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (298, '支出', 85.50, '2025-01-14', 0, 1, NULL, NULL, '汤震南', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (299, '支出', 137.21, '2025-01-14', 2, 2, NULL, NULL, '夏岚', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (300, '支出', 192.53, '2025-01-25', 2, 4, NULL, NULL, '汤岚', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (301, '支出', 73.25, '2025-01-16', 8, 5, NULL, NULL, '顾安琪', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (302, '收入', 142.34, '2025-01-15', 4, 2, NULL, NULL, '向致远', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (303, '支出', 71.63, '2025-01-13', 1, 3, NULL, NULL, '孟璐', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (304, '支出', 51.12, '2025-01-15', 5, 4, NULL, NULL, '邵子异', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (305, '收入', 115.12, '2025-01-03', 3, 7, NULL, NULL, '程子韬', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (306, '支出', 139.72, '2025-01-04', 5, 0, NULL, NULL, '余宇宁', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (307, '收入', 51.51, '2025-01-22', 4, 4, NULL, NULL, '唐震南', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (308, '支出', 74.92, '2025-01-07', 10, 8, NULL, NULL, '钟睿', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (309, '支出', 127.81, '2025-01-30', 2, 8, NULL, NULL, '陶晓明', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (310, '收入', 100.34, '2025-01-12', 7, 4, NULL, NULL, '林睿', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (311, '支出', 127.45, '2025-01-18', 1, 9, NULL, NULL, '冯晓明', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (312, '收入', 49.64, '2025-01-10', 1, 10, NULL, NULL, '范致远', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (313, '支出', 170.11, '2025-01-25', 2, 9, NULL, NULL, '胡詩涵', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (314, '支出', 149.18, '2025-01-28', 5, 4, NULL, NULL, '方岚', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (315, '收入', 154.82, '2025-01-21', 2, 5, NULL, NULL, '程璐', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (316, '支出', 30.01, '2025-01-15', 7, 4, NULL, NULL, '侯睿', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (317, '收入', 110.43, '2025-01-27', 9, 7, NULL, NULL, '毛岚', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (318, '收入', 2.92, '2025-01-05', 8, 4, NULL, NULL, '李岚', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (319, '收入', 189.88, '2025-01-31', 2, 6, NULL, NULL, '孟云熙', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (320, '收入', 52.60, '2025-01-10', 9, 4, NULL, NULL, '何杰宏', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (321, '支出', 9.66, '2025-01-23', 9, 9, NULL, NULL, '崔秀英', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (322, '支出', 15.63, '2025-01-02', 1, 5, NULL, NULL, '钟致远', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (323, '支出', 108.52, '2025-01-07', 9, 3, NULL, NULL, '黄致远', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (324, '收入', 84.09, '2025-01-05', 4, 9, NULL, NULL, '刘安琪', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (325, '收入', 119.95, '2025-01-13', 8, 2, NULL, NULL, '龙子韬', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (326, '收入', 193.94, '2025-01-20', 7, 8, NULL, NULL, '贾杰宏', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (327, '收入', 190.37, '2025-01-30', 4, 10, NULL, NULL, '范秀英', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (328, '收入', 21.75, '2025-01-20', 7, 10, NULL, NULL, '潘子异', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (329, '收入', 76.39, '2025-01-20', 7, 4, NULL, NULL, '汪宇宁', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (330, '支出', 56.44, '2025-01-12', 4, 4, NULL, NULL, '许宇宁', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (331, '收入', 195.66, '2025-01-03', 8, 7, NULL, NULL, '李子韬', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (332, '收入', 38.89, '2025-01-09', 2, 8, NULL, NULL, '朱云熙', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (333, '支出', 71.85, '2025-01-27', 1, 4, NULL, NULL, '周岚', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (334, '收入', 134.59, '2025-01-30', 3, 2, NULL, NULL, '赵詩涵', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (335, '支出', 83.99, '2025-01-23', 2, 8, NULL, NULL, '丁晓明', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (336, '收入', 0.32, '2025-01-10', 0, 6, NULL, NULL, '石杰宏', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (337, '支出', 155.24, '2025-01-12', 2, 8, NULL, NULL, '叶睿', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (338, '支出', 139.48, '2025-01-04', 1, 4, NULL, NULL, '邵秀英', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (339, '支出', 116.34, '2025-01-18', 9, 6, NULL, NULL, '邹子韬', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (340, '收入', 165.16, '2025-01-29', 6, 7, NULL, NULL, '魏安琪', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (341, '支出', 148.41, '2025-01-28', 5, 1, NULL, NULL, '林致远', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (342, '支出', 64.87, '2025-01-11', 1, 9, NULL, NULL, '蒋晓明', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (343, '支出', 192.12, '2025-01-25', 8, 2, NULL, NULL, '钱璐', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (344, '支出', 9.61, '2025-01-25', 5, 2, NULL, NULL, '赵璐', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (345, '支出', 166.62, '2025-01-29', 1, 6, NULL, NULL, '徐致远', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (346, '收入', 179.43, '2025-01-04', 0, 1, NULL, NULL, '范子韬', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (347, '收入', 89.89, '2025-01-25', 6, 5, NULL, NULL, '孟震南', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (348, '收入', 114.74, '2025-01-22', 4, 10, NULL, NULL, '余子韬', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (349, '收入', 85.83, '2025-01-19', 6, 1, NULL, NULL, '苏致远', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (350, '支出', 83.10, '2025-01-25', 8, 1, NULL, NULL, '于璐', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (351, '收入', 156.49, '2025-01-24', 5, 4, NULL, NULL, '赵璐', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (352, '收入', 77.61, '2025-01-20', 2, 8, NULL, NULL, '董睿', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (353, '支出', 182.59, '2025-01-15', 8, 7, NULL, NULL, '何安琪', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (354, '支出', 87.86, '2025-01-26', 10, 4, NULL, NULL, '武震南', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (355, '收入', 31.05, '2025-01-04', 1, 4, NULL, NULL, '田震南', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (356, '支出', 58.46, '2025-01-29', 9, 6, NULL, NULL, '钱子异', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (357, '支出', 132.38, '2025-01-03', 10, 1, NULL, NULL, '朱安琪', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (358, '支出', 95.86, '2025-01-08', 3, 7, NULL, NULL, '叶致远', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (359, '支出', 72.07, '2025-01-17', 7, 3, NULL, NULL, '傅安琪', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (360, '支出', 152.75, '2025-01-13', 3, 6, NULL, NULL, '向岚', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (361, '支出', 55.72, '2025-01-24', 4, 6, NULL, NULL, '蒋致远', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (362, '支出', 102.15, '2025-01-17', 0, 7, NULL, NULL, '谢云熙', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (363, '收入', 79.80, '2025-01-05', 7, 9, NULL, NULL, '莫安琪', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (364, '收入', 159.80, '2025-01-31', 2, 5, NULL, NULL, '龚震南', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (365, '收入', 4.17, '2025-01-24', 5, 5, NULL, NULL, '向宇宁', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (366, '支出', 134.67, '2025-01-13', 9, 2, NULL, NULL, '向子异', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (367, '支出', 176.94, '2025-01-20', 8, 2, NULL, NULL, '卢晓明', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (368, '支出', 52.48, '2025-01-20', 3, 3, NULL, NULL, '唐宇宁', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (369, '支出', 170.16, '2025-01-08', 7, 1, NULL, NULL, '阎震南', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (370, '收入', 33.85, '2025-01-31', 9, 1, NULL, NULL, '魏宇宁', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (371, '支出', 144.53, '2025-01-14', 1, 5, NULL, NULL, '袁詩涵', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (372, '收入', 160.37, '2025-01-25', 9, 4, NULL, NULL, '雷子异', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (373, '收入', 14.52, '2025-01-23', 9, 0, NULL, NULL, '严宇宁', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (374, '收入', 119.34, '2025-01-03', 9, 5, NULL, NULL, '田璐', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (375, '支出', 82.15, '2025-01-16', 9, 3, NULL, NULL, '邹安琪', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (376, '收入', 172.50, '2025-01-08', 8, 6, NULL, NULL, '黎嘉伦', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (377, '支出', 101.94, '2025-01-06', 0, 8, NULL, NULL, '蒋嘉伦', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (378, '支出', 141.86, '2025-01-10', 3, 4, NULL, NULL, '姜安琪', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (379, '支出', 49.06, '2025-01-28', 7, 3, NULL, NULL, '谭安琪', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (380, '收入', 130.25, '2025-01-01', 3, 8, NULL, NULL, '林子异', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (381, '支出', 39.51, '2025-01-11', 4, 8, NULL, NULL, '曹致远', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (382, '支出', 8.71, '2025-01-29', 4, 1, NULL, NULL, '韩子异', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (383, '收入', 149.24, '2025-01-07', 8, 1, NULL, NULL, '常詩涵', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (384, '收入', 98.13, '2025-01-07', 3, 5, NULL, NULL, '梁安琪', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (385, '收入', 10.22, '2025-01-12', 1, 3, NULL, NULL, '龚睿', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (386, '收入', 196.54, '2025-01-10', 5, 0, NULL, NULL, '武嘉伦', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (387, '支出', 116.45, '2025-01-28', 1, 0, NULL, NULL, '谭安琪', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (388, '支出', 156.06, '2025-01-03', 7, 7, NULL, NULL, '贾睿', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (389, '收入', 157.56, '2025-01-30', 10, 9, NULL, NULL, '贾子韬', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (390, '收入', 144.02, '2025-01-19', 3, 0, NULL, NULL, '田詩涵', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (391, '支出', 144.28, '2025-01-22', 1, 7, NULL, NULL, '沈岚', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (392, '收入', 182.70, '2025-01-12', 10, 0, NULL, NULL, '任晓明', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (393, '支出', 182.36, '2025-01-14', 1, 2, NULL, NULL, '杨震南', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (394, '收入', 141.74, '2025-01-05', 8, 4, NULL, NULL, '韩震南', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (395, '支出', 55.76, '2025-01-14', 9, 1, NULL, NULL, '雷秀英', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (396, '收入', 31.92, '2025-01-18', 4, 6, NULL, NULL, '郝詩涵', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (397, '支出', 72.82, '2025-01-27', 3, 10, NULL, NULL, '史宇宁', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (398, '支出', 105.88, '2025-01-13', 4, 2, NULL, NULL, '田睿', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (399, '收入', 124.27, '2025-01-15', 3, 2, NULL, NULL, '阎安琪', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (400, '支出', 6.34, '2025-01-05', 4, 1, NULL, NULL, '李嘉伦', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (401, '收入', 195.58, '2025-01-03', 7, 3, NULL, NULL, '郑致远', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (402, '支出', 82.34, '2025-01-28', 9, 5, NULL, NULL, '黎安琪', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (403, '收入', 110.81, '2025-01-13', 7, 9, NULL, NULL, '崔岚', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (404, '支出', 31.20, '2025-01-08', 1, 9, NULL, NULL, '毛晓明', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (405, '支出', 128.82, '2025-01-29', 1, 9, NULL, NULL, '侯璐', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (406, '支出', 81.31, '2025-01-31', 7, 4, NULL, NULL, '贾嘉伦', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (407, '收入', 179.87, '2025-01-24', 6, 1, NULL, NULL, '曾睿', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (408, '支出', 65.58, '2025-01-19', 1, 6, NULL, NULL, '林云熙', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (409, '支出', 113.12, '2025-01-24', 1, 10, NULL, NULL, '戴宇宁', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (410, '收入', 133.11, '2025-01-04', 3, 3, NULL, NULL, '苏安琪', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (411, '收入', 177.30, '2025-01-17', 9, 8, NULL, NULL, '谢致远', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (412, '支出', 106.26, '2025-01-20', 9, 4, NULL, NULL, '丁晓明', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (413, '支出', 180.05, '2025-01-01', 7, 5, NULL, NULL, '张致远', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (414, '收入', 85.89, '2025-01-18', 3, 10, NULL, NULL, '江嘉伦', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (415, '收入', 24.88, '2025-01-15', 8, 1, NULL, NULL, '冯震南', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (416, '支出', 22.24, '2025-01-02', 4, 10, NULL, NULL, '谭秀英', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (417, '支出', 142.52, '2025-01-02', 5, 6, NULL, NULL, '贾云熙', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (418, '收入', 178.26, '2025-01-28', 7, 5, NULL, NULL, '任安琪', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (419, '收入', 150.80, '2025-01-21', 8, 9, NULL, NULL, '任致远', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (420, '支出', 76.40, '2025-01-16', 1, 9, NULL, NULL, '姜璐', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (421, '支出', 139.28, '2025-01-14', 2, 2, NULL, NULL, '沈岚', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (422, '收入', 153.02, '2025-01-08', 1, 6, NULL, NULL, '钟子韬', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (423, '支出', 199.19, '2025-01-28', 5, 9, NULL, NULL, '宋云熙', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (424, '支出', 39.68, '2025-01-11', 5, 2, NULL, NULL, '韦睿', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (425, '收入', 60.13, '2025-01-10', 4, 8, NULL, NULL, '龙睿', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (426, '支出', 18.11, '2025-01-05', 1, 0, NULL, NULL, '龙安琪', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (427, '收入', 121.56, '2025-01-27', 2, 10, NULL, NULL, '黄云熙', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (428, '支出', 115.10, '2025-01-09', 10, 4, NULL, NULL, '赵子异', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (429, '支出', 174.24, '2025-01-17', 2, 3, NULL, NULL, '邱震南', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (430, '支出', 123.48, '2025-01-27', 5, 9, NULL, NULL, '阎云熙', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (431, '收入', 39.40, '2025-01-10', 6, 5, NULL, NULL, '赵子韬', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (432, '收入', 164.82, '2025-01-24', 3, 8, NULL, NULL, '史致远', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (433, '收入', 63.12, '2025-01-24', 1, 1, NULL, NULL, '常晓明', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (434, '收入', 73.58, '2025-01-09', 10, 6, NULL, NULL, '贺杰宏', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (435, '支出', 82.84, '2025-01-20', 3, 9, NULL, NULL, '蒋云熙', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (436, '支出', 182.99, '2025-01-25', 9, 4, NULL, NULL, '孔安琪', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (437, '支出', 76.24, '2025-01-12', 8, 2, NULL, NULL, '侯云熙', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (438, '支出', 177.56, '2025-01-25', 10, 4, NULL, NULL, '邹杰宏', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (439, '收入', 46.41, '2025-01-01', 6, 0, NULL, NULL, '侯秀英', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (440, '收入', 65.81, '2025-01-26', 1, 5, NULL, NULL, '廖璐', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (441, '支出', 43.15, '2025-01-31', 6, 9, NULL, NULL, '蔡璐', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (442, '收入', 198.94, '2025-01-04', 3, 6, NULL, NULL, '孔詩涵', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (443, '支出', 70.07, '2025-01-14', 5, 5, NULL, NULL, '谢詩涵', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (444, '收入', 82.12, '2025-01-26', 5, 8, NULL, NULL, '钱杰宏', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (445, '支出', 120.12, '2025-01-06', 8, 5, NULL, NULL, '萧子韬', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (446, '支出', 68.81, '2025-01-23', 6, 8, NULL, NULL, '方晓明', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (447, '收入', 184.53, '2025-01-20', 3, 9, NULL, NULL, '钱岚', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (448, '收入', 85.77, '2025-01-27', 3, 10, NULL, NULL, '于嘉伦', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (449, '收入', 39.63, '2025-01-29', 1, 9, NULL, NULL, '武安琪', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (450, '支出', 45.31, '2025-01-22', 10, 8, NULL, NULL, '林子韬', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (451, '收入', 14.36, '2025-01-02', 2, 7, NULL, NULL, '沈安琪', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (452, '支出', 195.82, '2025-01-01', 9, 2, NULL, NULL, '彭致远', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (453, '支出', 97.42, '2025-01-23', 7, 9, NULL, NULL, '蔡璐', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (454, '收入', 21.51, '2025-01-03', 3, 5, NULL, NULL, '王致远', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (455, '收入', 136.06, '2025-01-12', 5, 6, NULL, NULL, '邱璐', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (456, '支出', 98.10, '2025-01-19', 7, 3, NULL, NULL, '陶秀英', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (457, '支出', 51.67, '2025-01-31', 8, 4, NULL, NULL, '李宇宁', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (458, '支出', 117.86, '2025-01-13', 4, 4, NULL, NULL, '汤杰宏', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (459, '收入', 67.21, '2025-01-09', 9, 10, NULL, NULL, '罗岚', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (460, '支出', 109.70, '2025-01-16', 2, 2, NULL, NULL, '姚震南', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (461, '支出', 139.97, '2025-01-18', 6, 6, NULL, NULL, '黄宇宁', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (462, '支出', 134.27, '2025-01-10', 0, 8, NULL, NULL, '周璐', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (463, '收入', 128.16, '2025-01-06', 6, 8, NULL, NULL, '魏詩涵', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (464, '支出', 176.83, '2025-01-04', 8, 1, NULL, NULL, '萧安琪', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (465, '支出', 93.25, '2025-01-31', 9, 10, NULL, NULL, '傅子异', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (466, '收入', 103.92, '2025-01-28', 3, 9, NULL, NULL, '赵宇宁', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (467, '收入', 168.98, '2025-01-10', 1, 4, NULL, NULL, '胡致远', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (468, '收入', 97.75, '2025-01-15', 5, 6, NULL, NULL, '姜晓明', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (469, '收入', 77.90, '2025-01-05', 6, 6, NULL, NULL, '何岚', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (470, '收入', 191.49, '2025-01-17', 4, 6, NULL, NULL, '陶嘉伦', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (471, '收入', 191.14, '2025-01-06', 4, 3, NULL, NULL, '段震南', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (472, '收入', 8.07, '2025-01-15', 7, 0, NULL, NULL, '向杰宏', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (473, '支出', 81.65, '2025-01-12', 4, 0, NULL, NULL, '袁岚', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (474, '收入', 102.53, '2025-01-11', 2, 3, NULL, NULL, '孟震南', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (475, '收入', 193.01, '2025-01-18', 7, 8, NULL, NULL, '高宇宁', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (476, '收入', 183.82, '2025-01-22', 3, 2, NULL, NULL, '程秀英', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (477, '收入', 34.67, '2025-01-29', 2, 4, NULL, NULL, '董子异', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (478, '支出', 145.40, '2025-01-01', 8, 5, NULL, NULL, '彭震南', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (479, '支出', 159.24, '2025-01-18', 0, 8, NULL, NULL, '武晓明', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (480, '收入', 107.30, '2025-01-31', 7, 8, NULL, NULL, '苏子韬', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (481, '支出', 80.37, '2025-01-01', 7, 7, NULL, NULL, '吕睿', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (482, '收入', 95.65, '2025-01-08', 3, 1, NULL, NULL, '许睿', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (483, '收入', 44.65, '2025-01-15', 5, 8, NULL, NULL, '刘云熙', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (484, '收入', 179.32, '2025-01-24', 8, 5, NULL, NULL, '常晓明', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (485, '支出', 198.73, '2025-01-24', 8, 2, NULL, NULL, '秦致远', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (486, '收入', 95.70, '2025-01-08', 6, 6, NULL, NULL, '向秀英', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (487, '支出', 92.21, '2025-01-04', 8, 2, NULL, NULL, '许宇宁', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (488, '支出', 67.71, '2025-01-10', 10, 3, NULL, NULL, '何云熙', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (489, '收入', 99.38, '2025-01-19', 8, 5, NULL, NULL, '龚秀英', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (490, '收入', 113.84, '2025-01-17', 1, 8, NULL, NULL, '史璐', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (491, '收入', 74.31, '2025-01-19', 8, 6, NULL, NULL, '姚嘉伦', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (492, '支出', 56.35, '2025-01-31', 1, 9, NULL, NULL, '于璐', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (493, '支出', 174.14, '2025-01-17', 10, 4, NULL, NULL, '张云熙', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (494, '支出', 162.76, '2025-01-21', 1, 5, NULL, NULL, '夏子韬', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (495, '支出', 19.87, '2025-01-31', 5, 8, NULL, NULL, '卢杰宏', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (496, '支出', 60.03, '2025-01-21', 1, 8, NULL, NULL, '汪宇宁', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (497, '收入', 152.59, '2025-01-16', 1, 8, NULL, NULL, '侯云熙', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (498, '收入', 8.75, '2025-01-18', 1, 1, NULL, NULL, '丁睿', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (499, '收入', 74.23, '2025-01-26', 2, 4, NULL, NULL, '梁云熙', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (500, '收入', 22.02, '2025-01-18', 1, 5, NULL, NULL, '邹震南', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (501, '收入', 127.77, '2025-01-23', 0, 7, NULL, NULL, '尹秀英', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (502, '支出', 49.86, '2025-01-15', 0, 0, NULL, NULL, '常子韬', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (503, '支出', 108.75, '2025-01-09', 2, 6, NULL, NULL, '莫嘉伦', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (504, '支出', 90.10, '2025-01-20', 5, 7, NULL, NULL, '廖岚', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (505, '支出', 17.41, '2025-01-05', 7, 5, NULL, NULL, '魏宇宁', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (506, '收入', 41.77, '2025-01-20', 6, 6, NULL, NULL, '孟嘉伦', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (507, '支出', 175.21, '2025-01-24', 7, 0, NULL, NULL, '严晓明', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (508, '支出', 123.92, '2025-01-09', 4, 7, NULL, NULL, '蔡睿', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (509, '支出', 94.84, '2025-01-12', 7, 4, NULL, NULL, '方宇宁', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (510, '支出', 81.19, '2025-01-20', 10, 4, NULL, NULL, '任安琪', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (511, '支出', 114.34, '2025-01-23', 10, 3, NULL, NULL, '夏嘉伦', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (512, '收入', 3.29, '2025-01-28', 0, 6, NULL, NULL, '陶嘉伦', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (513, '收入', 113.23, '2025-01-16', 4, 0, NULL, NULL, '谭璐', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (514, '收入', 17.90, '2025-01-27', 10, 4, NULL, NULL, '赵致远', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (515, '收入', 59.02, '2025-01-04', 7, 6, NULL, NULL, '姜安琪', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (516, '收入', 144.95, '2025-01-28', 2, 1, NULL, NULL, '汤子异', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (517, '支出', 119.02, '2025-01-06', 10, 4, NULL, NULL, '潘宇宁', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (518, '支出', 92.81, '2025-01-28', 4, 7, NULL, NULL, '程璐', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (519, '支出', 52.60, '2025-01-19', 9, 4, NULL, NULL, '郭震南', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (520, '支出', 31.03, '2025-01-06', 10, 2, NULL, NULL, '杜致远', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (521, '支出', 156.49, '2025-01-10', 7, 5, NULL, NULL, '顾云熙', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (522, '收入', 198.12, '2025-01-17', 6, 4, NULL, NULL, '尹安琪', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (523, '收入', 147.55, '2025-01-13', 5, 6, NULL, NULL, '陈致远', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (524, '收入', 165.30, '2025-01-11', 3, 9, NULL, NULL, '龚子异', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (525, '支出', 49.21, '2025-01-03', 9, 9, NULL, NULL, '杜嘉伦', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (526, '收入', 26.19, '2025-01-17', 5, 5, NULL, NULL, '邹致远', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (527, '收入', 110.97, '2025-01-05', 6, 2, NULL, NULL, '孙子异', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (528, '收入', 72.41, '2025-01-27', 7, 2, NULL, NULL, '胡岚', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (529, '支出', 31.51, '2025-01-21', 1, 3, NULL, NULL, '苏睿', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (530, '收入', 118.17, '2025-01-10', 6, 9, NULL, NULL, '杨晓明', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (531, '支出', 48.06, '2025-01-18', 7, 5, NULL, NULL, '石子异', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (532, '支出', 109.82, '2025-01-12', 1, 1, NULL, NULL, '曹嘉伦', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (533, '收入', 91.23, '2025-01-18', 2, 2, NULL, NULL, '邹晓明', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (534, '收入', 138.73, '2025-01-25', 5, 4, NULL, NULL, '江晓明', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (535, '支出', 78.88, '2025-01-01', 2, 6, NULL, NULL, '龙晓明', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (536, '支出', 150.50, '2025-01-01', 1, 1, NULL, NULL, '唐璐', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (537, '支出', 26.26, '2025-01-05', 5, 5, NULL, NULL, '贺子异', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (538, '支出', 136.11, '2025-01-22', 2, 1, NULL, NULL, '丁宇宁', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (539, '支出', 8.15, '2025-01-18', 8, 9, NULL, NULL, '孟致远', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (540, '支出', 97.83, '2025-01-17', 10, 0, NULL, NULL, '魏秀英', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (541, '收入', 168.14, '2025-01-25', 5, 9, NULL, NULL, '熊安琪', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (542, '支出', 79.76, '2025-01-27', 5, 6, NULL, NULL, '戴秀英', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (543, '支出', 22.36, '2025-01-28', 2, 2, NULL, NULL, '陶璐', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (544, '支出', 44.18, '2025-01-30', 7, 3, NULL, NULL, '韦震南', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (545, '支出', 41.53, '2025-01-29', 7, 3, NULL, NULL, '阎杰宏', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (546, '支出', 174.94, '2025-01-13', 10, 9, NULL, NULL, '郭云熙', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (547, '收入', 32.12, '2025-01-28', 6, 0, NULL, NULL, '许晓明', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (548, '收入', 119.88, '2025-01-24', 6, 9, NULL, NULL, '陈晓明', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (549, '支出', 149.22, '2025-01-06', 9, 8, NULL, NULL, '张云熙', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (550, '收入', 35.81, '2025-01-28', 4, 1, NULL, NULL, '林致远', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (551, '支出', 92.86, '2025-01-22', 6, 7, NULL, NULL, '何子韬', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (552, '支出', 166.48, '2025-01-14', 5, 6, NULL, NULL, '吴晓明', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (553, '收入', 4.74, '2025-01-17', 1, 6, NULL, NULL, '袁璐', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (554, '收入', 135.63, '2025-01-16', 0, 5, NULL, NULL, '林安琪', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (555, '支出', 75.44, '2025-01-27', 5, 5, NULL, NULL, '贺震南', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (556, '支出', 58.24, '2025-01-27', 1, 5, NULL, NULL, '贺晓明', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (557, '支出', 66.18, '2025-01-26', 2, 9, NULL, NULL, '郭子韬', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (558, '支出', 186.01, '2025-01-30', 2, 9, NULL, NULL, '范宇宁', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (559, '支出', 165.77, '2025-01-30', 3, 0, NULL, NULL, '戴秀英', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (560, '支出', 114.90, '2025-01-14', 10, 2, NULL, NULL, '董宇宁', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (561, '支出', 187.01, '2025-01-30', 6, 10, NULL, NULL, '罗睿', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (562, '支出', 89.24, '2025-01-30', 0, 2, NULL, NULL, '彭杰宏', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (563, '收入', 183.38, '2025-01-27', 0, 4, NULL, NULL, '段秀英', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (564, '支出', 15.38, '2025-01-25', 7, 4, NULL, NULL, '常杰宏', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (565, '收入', 51.57, '2025-01-18', 9, 0, NULL, NULL, '郭璐', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (566, '收入', 11.20, '2025-01-02', 4, 4, NULL, NULL, '贾睿', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (567, '支出', 173.84, '2025-01-27', 9, 3, NULL, NULL, '蒋安琪', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (568, '收入', 66.73, '2025-01-19', 8, 1, NULL, NULL, '周宇宁', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (569, '收入', 29.10, '2025-01-27', 4, 3, NULL, NULL, '贺子异', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (570, '支出', 29.93, '2025-01-06', 6, 5, NULL, NULL, '陆子韬', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (571, '收入', 161.17, '2025-01-22', 5, 6, NULL, NULL, '谭晓明', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (572, '收入', 128.26, '2025-01-13', 1, 5, NULL, NULL, '杨秀英', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (573, '支出', 121.58, '2025-01-17', 9, 2, NULL, NULL, '谭秀英', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (574, '收入', 134.50, '2025-01-15', 9, 5, NULL, NULL, '崔云熙', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (575, '收入', 48.29, '2025-01-14', 1, 4, NULL, NULL, '郑云熙', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (576, '收入', 124.87, '2025-01-25', 7, 9, NULL, NULL, '夏璐', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (577, '收入', 81.18, '2025-01-05', 3, 9, NULL, NULL, '邹震南', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (578, '支出', 137.16, '2025-01-14', 7, 9, NULL, NULL, '龚安琪', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (579, '收入', 7.91, '2025-01-24', 6, 7, NULL, NULL, '韦璐', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (580, '支出', 174.13, '2025-01-27', 3, 8, NULL, NULL, '贾璐', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (581, '收入', 110.34, '2025-01-25', 1, 7, NULL, NULL, '方詩涵', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (582, '收入', 97.76, '2025-01-15', 2, 4, NULL, NULL, '姜震南', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (583, '收入', 179.18, '2025-01-29', 0, 8, NULL, NULL, '魏杰宏', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (584, '支出', 44.37, '2025-01-03', 2, 1, NULL, NULL, '严岚', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (585, '支出', 167.13, '2025-01-20', 0, 9, NULL, NULL, '冯震南', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (586, '支出', 123.98, '2025-01-11', 5, 6, NULL, NULL, '范宇宁', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (587, '收入', 29.63, '2025-01-18', 6, 6, NULL, NULL, '沈宇宁', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (588, '支出', 34.94, '2025-01-25', 1, 4, NULL, NULL, '卢致远', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (589, '收入', 15.10, '2025-01-03', 1, 8, NULL, NULL, '潘睿', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (590, '支出', 169.65, '2025-01-01', 0, 2, NULL, NULL, '孟杰宏', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (591, '收入', 41.14, '2025-01-27', 7, 0, NULL, NULL, '沈子韬', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (592, '支出', 189.95, '2025-01-18', 9, 1, NULL, NULL, '钱震南', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (593, '支出', 182.21, '2025-01-31', 8, 3, NULL, NULL, '彭致远', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (594, '收入', 78.58, '2025-01-06', 3, 8, NULL, NULL, '苏云熙', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (595, '支出', 144.02, '2025-01-22', 9, 1, NULL, NULL, '潘子异', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (596, '支出', 95.85, '2025-01-30', 9, 8, NULL, NULL, '高震南', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (597, '支出', 60.63, '2025-01-16', 6, 9, NULL, NULL, '贺璐', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (598, '收入', 193.89, '2025-01-25', 3, 3, NULL, NULL, '史震南', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (599, '支出', 152.93, '2025-01-08', 9, 8, NULL, NULL, '夏宇宁', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (600, '支出', 102.04, '2025-01-23', 10, 5, NULL, NULL, '秦子异', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (601, '支出', 121.37, '2025-01-07', 6, 6, NULL, NULL, '叶子韬', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (602, '收入', 11.83, '2025-01-31', 1, 8, NULL, NULL, '谭詩涵', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (603, '收入', 174.40, '2025-01-03', 2, 6, NULL, NULL, '程子异', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (604, '收入', 114.63, '2025-01-19', 4, 7, NULL, NULL, '贺杰宏', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (605, '支出', 149.23, '2025-01-20', 1, 8, NULL, NULL, '唐安琪', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (606, '收入', 67.77, '2025-01-12', 0, 5, NULL, NULL, '范璐', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (607, '收入', 193.80, '2025-01-31', 9, 1, NULL, NULL, '任秀英', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (608, '支出', 161.71, '2025-01-16', 7, 8, NULL, NULL, '侯致远', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (609, '支出', 152.91, '2025-01-03', 0, 3, NULL, NULL, '叶睿', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (610, '收入', 0.44, '2025-01-17', 9, 3, NULL, NULL, '陆璐', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (611, '收入', 144.36, '2025-01-16', 6, 6, NULL, NULL, '薛岚', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (612, '支出', 48.15, '2025-01-24', 6, 8, NULL, NULL, '谢致远', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (613, '支出', 96.82, '2025-01-22', 3, 10, NULL, NULL, '孟岚', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (614, '支出', 52.29, '2025-01-21', 4, 10, NULL, NULL, '金岚', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (615, '收入', 192.39, '2025-01-05', 2, 6, NULL, NULL, '刘震南', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (616, '支出', 35.01, '2025-01-05', 1, 4, NULL, NULL, '武晓明', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (617, '收入', 126.80, '2025-01-05', 10, 10, NULL, NULL, '赵子韬', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (618, '支出', 96.77, '2025-01-10', 6, 1, NULL, NULL, '梁嘉伦', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (619, '收入', 34.27, '2025-01-21', 4, 2, NULL, NULL, '莫子异', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (620, '支出', 95.48, '2025-01-02', 2, 4, NULL, NULL, '贾秀英', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (621, '收入', 16.39, '2025-01-03', 7, 10, NULL, NULL, '薛杰宏', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (622, '收入', 43.80, '2025-01-03', 7, 4, NULL, NULL, '宋嘉伦', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (623, '收入', 132.87, '2025-01-03', 3, 7, NULL, NULL, '谭睿', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (624, '支出', 170.58, '2025-01-09', 7, 3, NULL, NULL, '贺璐', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (625, '收入', 125.82, '2025-01-28', 2, 9, NULL, NULL, '段子韬', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (626, '收入', 108.19, '2025-01-24', 6, 9, NULL, NULL, '宋晓明', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (627, '支出', 118.47, '2025-01-15', 6, 3, NULL, NULL, '姜震南', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (628, '支出', 96.86, '2025-01-29', 3, 2, NULL, NULL, '崔晓明', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (629, '支出', 171.66, '2025-01-31', 3, 5, NULL, NULL, '朱安琪', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (630, '收入', 146.72, '2025-01-19', 9, 6, NULL, NULL, '孙子异', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (631, '收入', 166.70, '2025-01-25', 9, 1, NULL, NULL, '谢詩涵', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (632, '支出', 47.24, '2025-01-11', 1, 0, NULL, NULL, '雷宇宁', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (633, '收入', 136.96, '2025-01-01', 1, 3, NULL, NULL, '熊嘉伦', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (634, '收入', 140.45, '2025-01-07', 5, 9, NULL, NULL, '郭璐', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (635, '支出', 25.70, '2025-01-25', 6, 4, NULL, NULL, '邹致远', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (636, '收入', 187.57, '2025-01-24', 8, 8, NULL, NULL, '邓詩涵', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (637, '收入', 160.88, '2025-01-28', 3, 1, NULL, NULL, '高璐', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (638, '支出', 43.03, '2025-01-08', 10, 0, NULL, NULL, '李杰宏', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (639, '收入', 160.33, '2025-01-28', 0, 3, NULL, NULL, '彭嘉伦', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (640, '支出', 12.91, '2025-01-23', 6, 4, NULL, NULL, '任睿', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (641, '支出', 13.76, '2025-01-16', 5, 10, NULL, NULL, '马安琪', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (642, '支出', 158.59, '2025-01-10', 4, 8, NULL, NULL, '叶子异', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (643, '支出', 149.45, '2025-01-25', 3, 7, NULL, NULL, '孔子异', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (644, '支出', 24.80, '2025-01-05', 8, 0, NULL, NULL, '叶云熙', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (645, '支出', 166.68, '2025-01-11', 4, 9, NULL, NULL, '莫子韬', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (646, '收入', 22.71, '2025-01-13', 4, 4, NULL, NULL, '郭詩涵', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (647, '收入', 35.14, '2025-01-30', 4, 8, NULL, NULL, '吕子韬', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (648, '支出', 56.24, '2025-01-28', 2, 5, NULL, NULL, '林宇宁', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (649, '收入', 199.57, '2025-01-21', 1, 7, NULL, NULL, '王致远', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (650, '收入', 160.03, '2025-01-31', 3, 4, NULL, NULL, '胡子韬', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (651, '收入', 176.22, '2025-01-14', 5, 8, NULL, NULL, '傅睿', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (652, '收入', 139.81, '2025-01-26', 7, 10, NULL, NULL, '薛震南', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (653, '支出', 17.79, '2025-01-10', 5, 7, NULL, NULL, '徐杰宏', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (654, '收入', 19.81, '2025-01-10', 1, 7, NULL, NULL, '赵安琪', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (655, '支出', 187.33, '2025-01-29', 5, 6, NULL, NULL, '丁云熙', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (656, '收入', 175.52, '2025-01-29', 3, 4, NULL, NULL, '罗詩涵', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (657, '收入', 127.21, '2025-01-27', 1, 7, NULL, NULL, '王晓明', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (658, '支出', 197.94, '2025-01-15', 7, 1, NULL, NULL, '邹震南', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (659, '收入', 119.47, '2025-01-03', 0, 2, NULL, NULL, '阎致远', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (660, '收入', 183.07, '2025-01-20', 5, 5, NULL, NULL, '孟子韬', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (661, '收入', 156.44, '2025-01-24', 2, 10, NULL, NULL, '唐岚', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (662, '收入', 110.99, '2025-01-08', 1, 8, NULL, NULL, '阎震南', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (663, '收入', 176.70, '2025-01-23', 3, 0, NULL, NULL, '任晓明', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (664, '支出', 60.10, '2025-01-18', 4, 3, NULL, NULL, '段詩涵', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (665, '收入', 168.36, '2025-01-31', 7, 4, NULL, NULL, '阎嘉伦', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (666, '收入', 156.15, '2025-01-11', 3, 4, NULL, NULL, '段璐', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (667, '收入', 46.35, '2025-01-20', 3, 3, NULL, NULL, '阎嘉伦', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (668, '支出', 63.72, '2025-01-05', 8, 8, NULL, NULL, '傅致远', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (669, '收入', 177.45, '2025-01-22', 2, 2, NULL, NULL, '顾云熙', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (670, '支出', 182.48, '2025-01-18', 3, 5, NULL, NULL, '潘致远', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (671, '支出', 125.65, '2025-01-04', 3, 4, NULL, NULL, '刘岚', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (672, '支出', 81.94, '2025-01-09', 8, 0, NULL, NULL, '萧晓明', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (673, '支出', 128.28, '2025-01-19', 8, 4, NULL, NULL, '彭子韬', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (674, '支出', 89.48, '2025-01-31', 4, 1, NULL, NULL, '侯秀英', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (675, '收入', 134.11, '2025-01-27', 10, 1, NULL, NULL, '雷安琪', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (676, '支出', 162.81, '2025-01-09', 3, 3, NULL, NULL, '崔嘉伦', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (677, '支出', 49.64, '2025-01-17', 8, 8, NULL, NULL, '傅子异', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (678, '收入', 84.90, '2025-01-23', 1, 0, NULL, NULL, '曹安琪', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (679, '支出', 6.27, '2025-01-21', 7, 7, NULL, NULL, '孙詩涵', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (680, '收入', 119.37, '2025-01-23', 0, 0, NULL, NULL, '唐晓明', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (681, '支出', 166.07, '2025-01-22', 1, 7, NULL, NULL, '钟璐', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (682, '收入', 112.55, '2025-01-01', 4, 7, NULL, NULL, '侯睿', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (683, '收入', 12.71, '2025-01-20', 1, 1, NULL, NULL, '陆致远', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (684, '支出', 22.57, '2025-01-16', 6, 3, NULL, NULL, '范子异', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (685, '支出', 102.66, '2025-01-06', 2, 9, NULL, NULL, '廖子韬', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (686, '支出', 9.43, '2025-01-12', 4, 3, NULL, NULL, '萧子韬', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (687, '收入', 52.85, '2025-01-23', 1, 4, NULL, NULL, '顾詩涵', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (688, '支出', 149.72, '2025-01-02', 4, 6, NULL, NULL, '李晓明', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (689, '支出', 57.58, '2025-01-07', 4, 5, NULL, NULL, '李詩涵', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (690, '收入', 102.24, '2025-01-16', 6, 5, NULL, NULL, '钟致远', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (691, '支出', 158.87, '2025-01-16', 3, 7, NULL, NULL, '秦晓明', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (692, '支出', 148.34, '2025-01-20', 1, 10, NULL, NULL, '朱嘉伦', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (693, '收入', 68.34, '2025-01-28', 6, 7, NULL, NULL, '史震南', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (694, '收入', 76.75, '2025-01-20', 8, 5, NULL, NULL, '罗致远', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (695, '支出', 167.52, '2025-01-05', 5, 4, NULL, NULL, '蔡秀英', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (696, '收入', 11.89, '2025-01-05', 9, 3, NULL, NULL, '蒋晓明', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (697, '收入', 156.04, '2025-01-10', 3, 3, NULL, NULL, '姜震南', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (698, '收入', 118.51, '2025-01-18', 6, 5, NULL, NULL, '董杰宏', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (699, '收入', 9.29, '2025-01-07', 7, 8, NULL, NULL, '孟詩涵', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (700, '收入', 38.25, '2025-01-26', 0, 3, NULL, NULL, '邓安琪', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (701, '支出', 14.40, '2025-01-31', 1, 1, NULL, NULL, '郑安琪', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (702, '支出', 9.65, '2025-01-29', 1, 3, NULL, NULL, '梁嘉伦', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (703, '收入', 175.04, '2025-01-01', 4, 6, NULL, NULL, '冯子异', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (704, '收入', 76.35, '2025-01-22', 6, 0, NULL, NULL, '汤云熙', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (705, '支出', 154.75, '2025-01-16', 8, 6, NULL, NULL, '冯杰宏', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (706, '支出', 96.15, '2025-01-13', 7, 1, NULL, NULL, '贾睿', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (707, '支出', 51.91, '2025-01-04', 5, 6, NULL, NULL, '丁致远', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (708, '支出', 92.83, '2025-01-01', 1, 4, NULL, NULL, '董震南', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (709, '收入', 168.39, '2025-01-28', 3, 6, NULL, NULL, '莫震南', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (710, '收入', 107.66, '2025-01-29', 4, 2, NULL, NULL, '向秀英', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (711, '收入', 199.16, '2025-01-27', 8, 6, NULL, NULL, '戴子异', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (712, '收入', 174.09, '2025-01-07', 3, 9, NULL, NULL, '段子异', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (713, '收入', 49.01, '2025-01-27', 2, 5, NULL, NULL, '罗子韬', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (714, '支出', 148.90, '2025-01-10', 7, 5, NULL, NULL, '石晓明', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (715, '支出', 59.10, '2025-01-26', 4, 3, NULL, NULL, '袁秀英', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (716, '支出', 46.83, '2025-01-17', 4, 0, NULL, NULL, '金子异', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (717, '支出', 184.30, '2025-01-11', 5, 8, NULL, NULL, '朱詩涵', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (718, '收入', 34.14, '2025-01-12', 2, 5, NULL, NULL, '陶嘉伦', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (719, '收入', 185.95, '2025-01-06', 10, 2, NULL, NULL, '邱震南', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (720, '收入', 45.32, '2025-01-25', 3, 7, NULL, NULL, '刘安琪', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (721, '支出', 130.48, '2025-01-13', 10, 3, NULL, NULL, '龙安琪', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (722, '支出', 88.45, '2025-01-02', 2, 1, NULL, NULL, '萧子异', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (723, '收入', 142.38, '2025-01-21', 9, 9, NULL, NULL, '陈嘉伦', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (724, '收入', 31.76, '2025-01-11', 4, 2, NULL, NULL, '吴秀英', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (725, '收入', 27.30, '2025-01-16', 2, 2, NULL, NULL, '宋詩涵', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (726, '收入', 181.66, '2025-01-02', 8, 6, NULL, NULL, '袁安琪', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (727, '支出', 5.88, '2025-01-11', 8, 0, NULL, NULL, '梁子韬', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (728, '支出', 16.79, '2025-01-16', 0, 6, NULL, NULL, '程嘉伦', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (729, '支出', 148.63, '2025-01-19', 5, 1, NULL, NULL, '蒋岚', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (730, '支出', 191.74, '2025-01-01', 6, 4, NULL, NULL, '唐子异', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (731, '支出', 169.08, '2025-01-18', 5, 9, NULL, NULL, '高子异', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (732, '收入', 16.96, '2025-01-08', 1, 1, NULL, NULL, '冯震南', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (733, '收入', 64.36, '2025-01-10', 9, 6, NULL, NULL, '姜杰宏', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (734, '收入', 121.88, '2025-01-24', 7, 6, NULL, NULL, '许震南', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (735, '收入', 55.82, '2025-01-29', 1, 4, NULL, NULL, '阎晓明', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (736, '收入', 83.65, '2025-01-16', 3, 8, NULL, NULL, '魏安琪', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (737, '支出', 177.24, '2025-01-08', 5, 6, NULL, NULL, '彭璐', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (738, '收入', 125.27, '2025-01-09', 4, 2, NULL, NULL, '张嘉伦', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (739, '收入', 140.58, '2025-01-20', 8, 4, NULL, NULL, '汤子韬', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (740, '收入', 192.41, '2025-01-11', 9, 1, NULL, NULL, '邹嘉伦', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (741, '支出', 66.33, '2025-01-08', 5, 0, NULL, NULL, '朱致远', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (742, '支出', 182.35, '2025-01-18', 9, 3, NULL, NULL, '熊晓明', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (743, '收入', 92.35, '2025-01-21', 5, 8, NULL, NULL, '韩璐', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (744, '收入', 144.67, '2025-01-31', 5, 5, NULL, NULL, '吕嘉伦', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (745, '收入', 16.18, '2025-01-02', 2, 9, NULL, NULL, '宋璐', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (746, '收入', 157.50, '2025-01-28', 7, 4, NULL, NULL, '莫云熙', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (747, '支出', 82.98, '2025-01-28', 4, 5, NULL, NULL, '范嘉伦', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (748, '支出', 159.33, '2025-01-18', 10, 1, NULL, NULL, '刘詩涵', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (749, '支出', 126.83, '2025-01-21', 3, 9, NULL, NULL, '王致远', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (750, '收入', 125.33, '2025-01-28', 4, 5, NULL, NULL, '冯璐', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (751, '收入', 66.62, '2025-01-13', 4, 7, NULL, NULL, '何致远', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (752, '收入', 189.84, '2025-01-31', 8, 6, NULL, NULL, '廖震南', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (753, '支出', 151.18, '2025-01-21', 5, 0, NULL, NULL, '宋岚', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (754, '支出', 143.16, '2025-01-31', 6, 5, NULL, NULL, '卢岚', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (755, '收入', 142.98, '2025-01-03', 6, 7, NULL, NULL, '陆詩涵', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (756, '收入', 41.71, '2025-01-24', 2, 0, NULL, NULL, '任岚', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (757, '收入', 32.55, '2025-01-21', 6, 9, NULL, NULL, '陆晓明', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (758, '支出', 173.24, '2025-01-07', 2, 3, NULL, NULL, '韦璐', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (759, '收入', 191.35, '2025-01-28', 7, 4, NULL, NULL, '姜詩涵', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (760, '收入', 47.09, '2025-01-13', 5, 9, NULL, NULL, '毛安琪', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (761, '支出', 100.70, '2025-01-01', 3, 1, NULL, NULL, '韩致远', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (762, '支出', 24.90, '2025-01-14', 3, 6, NULL, NULL, '李安琪', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (763, '支出', 50.42, '2025-01-14', 0, 2, NULL, NULL, '姜子韬', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (764, '支出', 162.13, '2025-01-12', 6, 7, NULL, NULL, '向岚', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (765, '收入', 65.51, '2025-01-10', 7, 1, NULL, NULL, '廖詩涵', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (766, '收入', 187.28, '2025-01-06', 9, 9, NULL, NULL, '邱安琪', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (767, '收入', 163.07, '2025-01-31', 6, 1, NULL, NULL, '傅璐', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (768, '支出', 124.49, '2025-01-09', 7, 6, NULL, NULL, '苏子韬', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (769, '收入', 182.12, '2025-01-22', 8, 2, NULL, NULL, '邓杰宏', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (770, '收入', 131.23, '2025-01-26', 6, 6, NULL, NULL, '潘子异', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (771, '支出', 33.57, '2025-01-20', 1, 6, NULL, NULL, '贺杰宏', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (772, '收入', 17.72, '2025-01-23', 7, 4, NULL, NULL, '邹璐', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (773, '支出', 176.80, '2025-01-17', 9, 2, NULL, NULL, '贺子韬', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (774, '支出', 198.70, '2025-01-22', 2, 3, NULL, NULL, '曹宇宁', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (775, '支出', 41.93, '2025-01-14', 2, 6, NULL, NULL, '高致远', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (776, '收入', 148.66, '2025-01-31', 6, 4, NULL, NULL, '严秀英', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (777, '支出', 96.27, '2025-01-30', 6, 0, NULL, NULL, '钱睿', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (778, '收入', 73.93, '2025-01-15', 4, 1, NULL, NULL, '汪杰宏', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (779, '收入', 59.63, '2025-01-31', 2, 6, NULL, NULL, '姜云熙', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (780, '收入', 73.33, '2025-01-14', 2, 3, NULL, NULL, '方致远', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (781, '收入', 13.17, '2025-01-21', 7, 8, NULL, NULL, '秦宇宁', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (782, '收入', 42.62, '2025-01-16', 8, 5, NULL, NULL, '何晓明', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (783, '支出', 145.40, '2025-01-14', 10, 2, NULL, NULL, '龚詩涵', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (784, '支出', 138.35, '2025-01-23', 5, 7, NULL, NULL, '石睿', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (785, '支出', 86.69, '2025-01-04', 6, 10, NULL, NULL, '李璐', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (786, '收入', 56.13, '2025-01-27', 3, 9, NULL, NULL, '萧嘉伦', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (787, '收入', 199.68, '2025-01-22', 3, 4, NULL, NULL, '周晓明', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (788, '收入', 53.55, '2025-01-22', 1, 8, NULL, NULL, '严杰宏', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (789, '收入', 114.46, '2025-01-05', 5, 3, NULL, NULL, '萧杰宏', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (790, '收入', 25.19, '2025-01-20', 9, 6, NULL, NULL, '莫宇宁', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (791, '支出', 89.76, '2025-01-17', 8, 6, NULL, NULL, '吕云熙', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (792, '支出', 175.85, '2025-01-14', 0, 2, NULL, NULL, '段杰宏', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (793, '收入', 108.48, '2025-01-01', 4, 9, NULL, NULL, '韩璐', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (794, '收入', 38.26, '2025-01-17', 6, 8, NULL, NULL, '龙璐', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (795, '支出', 38.02, '2025-01-07', 8, 2, NULL, NULL, '戴璐', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (796, '支出', 146.16, '2025-01-30', 3, 1, NULL, NULL, '赵睿', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (797, '支出', 195.33, '2025-01-04', 6, 9, NULL, NULL, '钟嘉伦', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (798, '支出', 195.45, '2025-01-16', 4, 3, NULL, NULL, '莫宇宁', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (799, '支出', 175.22, '2025-01-05', 5, 7, NULL, NULL, '王子异', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (800, '支出', 107.88, '2025-01-26', 5, 7, NULL, NULL, '熊子韬', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (801, '收入', 40.41, '2025-01-10', 9, 1, NULL, NULL, '刘璐', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (802, '收入', 91.64, '2025-01-14', 7, 5, NULL, NULL, '杜震南', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (803, '支出', 83.63, '2025-01-27', 8, 8, NULL, NULL, '邱云熙', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (804, '收入', 11.39, '2025-01-24', 5, 1, NULL, NULL, '林致远', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (805, '收入', 71.60, '2025-01-01', 4, 0, NULL, NULL, '龚璐', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (806, '支出', 130.48, '2025-01-04', 9, 2, NULL, NULL, '莫子异', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (807, '收入', 185.84, '2025-01-29', 3, 4, NULL, NULL, '陆子异', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (808, '支出', 141.32, '2025-01-02', 7, 9, NULL, NULL, '钱晓明', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (809, '支出', 159.00, '2025-01-13', 2, 3, NULL, NULL, '余睿', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (810, '收入', 18.49, '2025-01-08', 7, 2, NULL, NULL, '石宇宁', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (811, '支出', 135.80, '2025-01-11', 1, 5, NULL, NULL, '林震南', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (812, '支出', 136.52, '2025-01-14', 5, 6, NULL, NULL, '秦岚', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (813, '收入', 22.89, '2025-01-04', 6, 0, NULL, NULL, '孟睿', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (814, '收入', 175.95, '2025-01-04', 4, 7, NULL, NULL, '孟震南', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (815, '收入', 95.45, '2025-01-09', 7, 5, NULL, NULL, '何子异', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (816, '支出', 173.09, '2025-01-21', 4, 5, NULL, NULL, '卢致远', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (817, '收入', 69.52, '2025-01-10', 4, 1, NULL, NULL, '韩杰宏', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (818, '收入', 181.46, '2025-01-05', 6, 10, NULL, NULL, '黄子异', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (819, '收入', 129.22, '2025-01-08', 1, 1, NULL, NULL, '姜晓明', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (820, '收入', 41.62, '2025-01-27', 5, 4, NULL, NULL, '熊晓明', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (821, '收入', 155.95, '2025-01-01', 9, 4, NULL, NULL, '贾云熙', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (822, '支出', 194.21, '2025-01-13', 10, 0, NULL, NULL, '何嘉伦', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (823, '支出', 100.65, '2025-01-10', 1, 6, NULL, NULL, '郭嘉伦', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (824, '收入', 160.76, '2025-01-31', 9, 9, NULL, NULL, '邱震南', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (825, '支出', 109.76, '2025-01-24', 2, 6, NULL, NULL, '许晓明', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (826, '收入', 153.40, '2025-01-25', 7, 6, NULL, NULL, '钱子韬', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (827, '支出', 183.51, '2025-01-14', 7, 6, NULL, NULL, '林致远', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (828, '支出', 156.07, '2025-01-05', 9, 0, NULL, NULL, '郝詩涵', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (829, '支出', 111.82, '2025-01-01', 5, 4, NULL, NULL, '任子韬', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (830, '支出', 104.80, '2025-01-19', 9, 10, NULL, NULL, '余子韬', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (831, '收入', 187.56, '2025-01-20', 7, 4, NULL, NULL, '吴致远', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (832, '支出', 152.11, '2025-01-04', 4, 6, NULL, NULL, '郭致远', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (833, '支出', 195.43, '2025-01-24', 1, 4, NULL, NULL, '薛岚', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (834, '收入', 86.34, '2025-01-03', 1, 8, NULL, NULL, '莫宇宁', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (835, '收入', 12.46, '2025-01-16', 5, 1, NULL, NULL, '史子韬', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (836, '支出', 9.50, '2025-01-30', 3, 6, NULL, NULL, '张杰宏', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (837, '收入', 12.57, '2025-01-26', 5, 2, NULL, NULL, '赵杰宏', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (838, '支出', 63.54, '2025-01-25', 5, 6, NULL, NULL, '何震南', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (839, '支出', 28.82, '2025-01-10', 1, 2, NULL, NULL, '王安琪', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (840, '收入', 133.18, '2025-01-22', 3, 6, NULL, NULL, '黄子异', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (841, '支出', 43.42, '2025-01-02', 4, 4, NULL, NULL, '徐宇宁', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (842, '支出', 121.24, '2025-01-17', 4, 4, NULL, NULL, '戴詩涵', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (843, '收入', 100.79, '2025-01-13', 8, 8, NULL, NULL, '金岚', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (844, '支出', 143.55, '2025-01-09', 8, 2, NULL, NULL, '何云熙', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (845, '支出', 64.16, '2025-01-29', 5, 6, NULL, NULL, '魏詩涵', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (846, '支出', 27.33, '2025-01-21', 5, 4, NULL, NULL, '陆子异', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (847, '收入', 72.57, '2025-01-20', 6, 5, NULL, NULL, '林晓明', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (848, '支出', 124.68, '2025-01-04', 6, 8, NULL, NULL, '曾杰宏', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (849, '支出', 16.74, '2025-01-16', 1, 4, NULL, NULL, '余宇宁', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (850, '支出', 114.29, '2025-01-13', 9, 3, NULL, NULL, '武云熙', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (851, '支出', 31.64, '2025-01-24', 3, 5, NULL, NULL, '叶岚', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (852, '支出', 154.58, '2025-01-21', 9, 5, NULL, NULL, '熊睿', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (853, '支出', 156.15, '2025-01-14', 7, 0, NULL, NULL, '邵子异', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (854, '支出', 188.77, '2025-01-27', 8, 5, NULL, NULL, '顾睿', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (855, '支出', 37.52, '2025-01-27', 1, 7, NULL, NULL, '黄岚', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (856, '收入', 188.23, '2025-01-12', 0, 6, NULL, NULL, '朱杰宏', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (857, '支出', 152.58, '2025-01-03', 8, 8, NULL, NULL, '何睿', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (858, '支出', 87.35, '2025-01-31', 1, 9, NULL, NULL, '孙安琪', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (859, '收入', 28.72, '2025-01-27', 0, 7, NULL, NULL, '孔岚', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (860, '收入', 68.54, '2025-01-21', 5, 7, NULL, NULL, '雷杰宏', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (861, '收入', 102.13, '2025-01-29', 4, 9, NULL, NULL, '程安琪', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (862, '支出', 36.56, '2025-01-06', 9, 3, NULL, NULL, '常岚', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (863, '收入', 97.20, '2025-01-31', 3, 1, NULL, NULL, '熊云熙', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (864, '收入', 164.95, '2025-01-09', 3, 5, NULL, NULL, '彭云熙', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (865, '收入', 74.00, '2025-01-30', 8, 7, NULL, NULL, '侯震南', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (866, '收入', 187.86, '2025-01-22', 8, 4, NULL, NULL, '邓安琪', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (867, '收入', 44.98, '2025-01-12', 10, 3, NULL, NULL, '贺晓明', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (868, '收入', 151.86, '2025-01-24', 4, 4, NULL, NULL, '邵晓明', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (869, '收入', 176.61, '2025-01-28', 6, 2, NULL, NULL, '阎宇宁', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (870, '支出', 164.58, '2025-01-07', 9, 8, NULL, NULL, '秦嘉伦', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (871, '收入', 89.65, '2025-01-23', 5, 7, NULL, NULL, '卢璐', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (872, '支出', 161.98, '2025-01-08', 6, 7, NULL, NULL, '黎安琪', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (873, '收入', 126.14, '2025-01-08', 6, 9, NULL, NULL, '赵秀英', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (874, '支出', 106.22, '2025-01-07', 8, 7, NULL, NULL, '邵子异', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (875, '支出', 46.43, '2025-01-12', 2, 4, NULL, NULL, '吕璐', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (876, '收入', 4.29, '2025-01-17', 4, 1, NULL, NULL, '阎秀英', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (877, '收入', 164.38, '2025-01-19', 2, 1, NULL, NULL, '胡嘉伦', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (878, '支出', 61.92, '2025-01-22', 5, 10, NULL, NULL, '邹云熙', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (879, '收入', 27.41, '2025-01-05', 7, 2, NULL, NULL, '方宇宁', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (880, '支出', 70.27, '2025-01-13', 9, 5, NULL, NULL, '潘杰宏', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (881, '收入', 0.02, '2025-01-16', 9, 1, NULL, NULL, '朱嘉伦', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (882, '支出', 14.01, '2025-01-26', 10, 10, NULL, NULL, '潘睿', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (883, '收入', 79.77, '2025-01-11', 4, 8, NULL, NULL, '尹詩涵', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (884, '收入', 16.85, '2025-01-10', 2, 1, NULL, NULL, '陶秀英', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (885, '收入', 9.76, '2025-01-15', 2, 0, NULL, NULL, '姜晓明', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (886, '收入', 62.26, '2025-01-04', 2, 9, NULL, NULL, '姚嘉伦', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (887, '收入', 129.46, '2025-01-16', 7, 7, NULL, NULL, '邓子异', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (888, '支出', 148.68, '2025-01-15', 8, 9, NULL, NULL, '孙秀英', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (889, '支出', 39.59, '2025-01-01', 6, 8, NULL, NULL, '郑晓明', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (890, '收入', 85.80, '2025-01-02', 8, 4, NULL, NULL, '徐子韬', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (891, '收入', 12.84, '2025-01-29', 5, 7, NULL, NULL, '罗璐', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (892, '支出', 176.10, '2025-01-28', 4, 7, NULL, NULL, '严詩涵', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (893, '收入', 152.18, '2025-01-28', 9, 4, NULL, NULL, '董致远', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (894, '收入', 194.81, '2025-01-06', 0, 5, NULL, NULL, '江詩涵', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (895, '支出', 98.17, '2025-01-02', 9, 6, NULL, NULL, '郭睿', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (896, '支出', 67.24, '2025-01-25', 4, 8, NULL, NULL, '吕岚', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (897, '支出', 77.78, '2025-01-10', 8, 4, NULL, NULL, '雷秀英', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (898, '支出', 85.79, '2025-01-29', 3, 7, NULL, NULL, '刘璐', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (899, '支出', 24.45, '2025-01-23', 6, 10, NULL, NULL, '严璐', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (900, '收入', 113.19, '2025-01-05', 3, 7, NULL, NULL, '常嘉伦', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (901, '收入', 140.20, '2025-01-16', 6, 0, NULL, NULL, '朱宇宁', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (902, '收入', 114.70, '2025-01-27', 2, 6, NULL, NULL, '王詩涵', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (903, '支出', 86.44, '2025-01-23', 4, 9, NULL, NULL, '邹秀英', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (904, '支出', 20.15, '2025-01-14', 7, 8, NULL, NULL, '石詩涵', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (905, '支出', 100.79, '2025-01-15', 7, 9, NULL, NULL, '韩子韬', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (906, '收入', 104.85, '2025-01-02', 8, 3, NULL, NULL, '胡云熙', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (907, '支出', 86.07, '2025-01-15', 8, 5, NULL, NULL, '贾詩涵', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (908, '收入', 20.01, '2025-01-21', 4, 10, NULL, NULL, '梁子异', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (909, '支出', 101.99, '2025-01-19', 8, 4, NULL, NULL, '郝晓明', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (910, '支出', 81.89, '2025-01-09', 4, 5, NULL, NULL, '钟杰宏', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (911, '支出', 23.07, '2025-01-15', 7, 7, NULL, NULL, '田宇宁', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (912, '支出', 114.38, '2025-01-20', 7, 4, NULL, NULL, '向杰宏', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (913, '支出', 65.23, '2025-01-14', 9, 3, NULL, NULL, '秦秀英', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (914, '支出', 125.42, '2025-01-07', 2, 8, NULL, NULL, '毛震南', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (915, '支出', 147.04, '2025-01-12', 8, 5, NULL, NULL, '段云熙', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (916, '收入', 34.50, '2025-01-17', 9, 0, NULL, NULL, '董震南', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (917, '收入', 59.85, '2025-01-25', 9, 9, NULL, NULL, '向宇宁', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (918, '收入', 79.01, '2025-01-01', 4, 7, NULL, NULL, '郭晓明', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (919, '收入', 26.91, '2025-01-24', 4, 6, NULL, NULL, '姜秀英', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (920, '支出', 184.48, '2025-01-29', 2, 1, NULL, NULL, '段子韬', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (921, '支出', 16.75, '2025-01-26', 9, 5, NULL, NULL, '孟安琪', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (922, '收入', 195.72, '2025-01-28', 9, 0, NULL, NULL, '潘嘉伦', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (923, '收入', 1.66, '2025-01-18', 7, 10, NULL, NULL, '崔睿', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (924, '支出', 178.97, '2025-01-09', 1, 8, NULL, NULL, '邱云熙', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (925, '支出', 154.34, '2025-01-09', 3, 4, NULL, NULL, '林子韬', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (926, '支出', 4.56, '2025-01-05', 3, 0, NULL, NULL, '苏晓明', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (927, '支出', 42.96, '2025-01-05', 0, 10, NULL, NULL, '向致远', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (928, '收入', 149.97, '2025-01-27', 10, 3, NULL, NULL, '沈震南', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (929, '支出', 69.95, '2025-01-07', 4, 5, NULL, NULL, '赵秀英', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (930, '收入', 48.10, '2025-01-12', 4, 6, NULL, NULL, '戴致远', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (931, '支出', 78.13, '2025-01-10', 5, 10, NULL, NULL, '夏詩涵', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (932, '收入', 15.03, '2025-01-23', 8, 3, NULL, NULL, '叶子异', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (933, '收入', 8.17, '2025-01-04', 5, 10, NULL, NULL, '薛璐', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (934, '收入', 182.98, '2025-01-31', 7, 8, NULL, NULL, '钱詩涵', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (935, '收入', 49.84, '2025-01-26', 4, 5, NULL, NULL, '梁嘉伦', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (936, '支出', 68.78, '2025-01-08', 1, 4, NULL, NULL, '黎杰宏', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (937, '收入', 76.67, '2025-01-04', 6, 2, NULL, NULL, '吴嘉伦', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (938, '收入', 181.55, '2025-01-01', 8, 1, NULL, NULL, '蔡安琪', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (939, '收入', 180.82, '2025-01-04', 2, 1, NULL, NULL, '龚云熙', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (940, '支出', 101.74, '2025-01-29', 4, 4, NULL, NULL, '余云熙', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (941, '收入', 90.15, '2025-01-24', 4, 0, NULL, NULL, '姚岚', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (942, '收入', 139.67, '2025-01-10', 5, 5, NULL, NULL, '余子异', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (943, '支出', 51.25, '2025-01-31', 8, 5, NULL, NULL, '金安琪', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (944, '支出', 148.71, '2025-01-28', 1, 1, NULL, NULL, '徐秀英', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (945, '收入', 100.51, '2025-01-30', 0, 5, NULL, NULL, '姜詩涵', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (946, '收入', 184.76, '2025-01-18', 10, 2, NULL, NULL, '赵詩涵', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (947, '收入', 83.76, '2025-01-15', 10, 3, NULL, NULL, '尹云熙', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (948, '收入', 170.11, '2025-01-11', 5, 10, NULL, NULL, '卢杰宏', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (949, '支出', 18.24, '2025-01-14', 9, 2, NULL, NULL, '汪震南', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (950, '收入', 79.34, '2025-01-06', 3, 9, NULL, NULL, '汪詩涵', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (951, '收入', 27.36, '2025-01-11', 1, 1, NULL, NULL, '郭秀英', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (952, '支出', 138.95, '2025-01-22', 10, 8, NULL, NULL, '贺杰宏', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (953, '收入', 163.64, '2025-01-27', 0, 2, NULL, NULL, '汤子韬', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (954, '支出', 103.55, '2025-01-02', 4, 6, NULL, NULL, '石致远', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (955, '收入', 195.37, '2025-01-06', 9, 7, NULL, NULL, '林杰宏', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (956, '支出', 80.83, '2025-01-02', 6, 9, NULL, NULL, '张震南', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (957, '收入', 187.87, '2025-01-16', 5, 8, NULL, NULL, '戴震南', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (958, '支出', 13.40, '2025-01-08', 5, 4, NULL, NULL, '郑嘉伦', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (959, '支出', 88.44, '2025-01-11', 2, 3, NULL, NULL, '梁致远', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (960, '支出', 172.17, '2025-01-24', 6, 2, NULL, NULL, '贺嘉伦', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (961, '收入', 107.39, '2025-01-07', 2, 9, NULL, NULL, '邵秀英', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (962, '支出', 27.36, '2025-01-15', 7, 6, NULL, NULL, '陈宇宁', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (963, '收入', 73.32, '2025-01-10', 4, 8, NULL, NULL, '武嘉伦', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (964, '支出', 142.94, '2025-01-11', 9, 6, NULL, NULL, '薛杰宏', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (965, '支出', 188.36, '2025-01-27', 0, 7, NULL, NULL, '王安琪', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (966, '支出', 54.32, '2025-01-30', 3, 2, NULL, NULL, '向詩涵', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (967, '收入', 50.19, '2025-01-26', 10, 10, NULL, NULL, '胡宇宁', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (968, '支出', 184.06, '2025-01-26', 5, 9, NULL, NULL, '苏嘉伦', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (969, '支出', 56.22, '2025-01-19', 2, 2, NULL, NULL, '苏晓明', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (970, '收入', 78.49, '2025-01-10', 4, 4, NULL, NULL, '严安琪', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (971, '支出', 190.50, '2025-01-16', 1, 8, NULL, NULL, '韩安琪', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (972, '支出', 62.10, '2025-01-07', 4, 9, NULL, NULL, '史岚', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (973, '收入', 114.93, '2025-01-03', 4, 2, NULL, NULL, '彭睿', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (974, '收入', 125.51, '2025-01-04', 10, 4, NULL, NULL, '马嘉伦', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (975, '收入', 98.58, '2025-01-09', 5, 8, NULL, NULL, '梁璐', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (976, '收入', 186.11, '2025-01-04', 9, 8, NULL, NULL, '郝璐', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (977, '支出', 198.74, '2025-01-10', 3, 5, NULL, NULL, '向岚', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (978, '支出', 72.77, '2025-01-25', 7, 4, NULL, NULL, '汪安琪', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (979, '收入', 93.66, '2025-01-23', 7, 4, NULL, NULL, '邹安琪', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (980, '收入', 109.42, '2025-01-11', 8, 3, NULL, NULL, '陆云熙', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (981, '支出', 15.68, '2025-01-01', 5, 4, NULL, NULL, '孟致远', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (982, '收入', 71.68, '2025-01-11', 6, 6, NULL, NULL, '任安琪', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (983, '收入', 77.38, '2025-01-06', 10, 3, NULL, NULL, '黄安琪', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (984, '收入', 25.67, '2025-01-31', 7, 7, NULL, NULL, '韦震南', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (985, '支出', 166.38, '2025-01-06', 5, 3, NULL, NULL, '徐安琪', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (986, '收入', 166.53, '2025-01-02', 10, 9, NULL, NULL, '蔡晓明', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (987, '收入', 35.18, '2025-01-20', 10, 6, NULL, NULL, '李杰宏', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (988, '收入', 87.21, '2025-01-20', 9, 5, NULL, NULL, '邓杰宏', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (989, '收入', 8.66, '2025-01-03', 5, 2, NULL, NULL, '陶詩涵', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (990, '支出', 29.22, '2025-01-24', 9, 5, NULL, NULL, '石安琪', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (991, '支出', 177.74, '2025-01-07', 0, 2, NULL, NULL, '夏嘉伦', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (992, '收入', 110.38, '2025-01-02', 4, 3, NULL, NULL, '邹秀英', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (993, '收入', 144.42, '2025-01-24', 4, 7, NULL, NULL, '陶詩涵', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (994, '支出', 39.74, '2025-01-18', 8, 8, NULL, NULL, '徐云熙', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (995, '收入', 76.50, '2025-01-25', 6, 0, NULL, NULL, '许睿', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (996, '支出', 108.44, '2025-01-05', 10, 9, NULL, NULL, '黎致远', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (997, '支出', 30.48, '2025-01-28', 8, 9, NULL, NULL, '秦岚', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (998, '收入', 126.37, '2025-01-25', 4, 6, NULL, NULL, '梁嘉伦', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (999, '收入', 35.68, '2025-01-31', 3, 3, NULL, NULL, '叶震南', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (1000, '支出', 72.74, '2025-01-17', 8, 6, NULL, NULL, '罗晓明', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (1001, '收入', 182.99, '2025-01-16', 4, 5, NULL, NULL, '许睿', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (1002, '支出', 178.06, '2025-01-02', 9, 6, NULL, NULL, '黄嘉伦', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (1003, '支出', 174.73, '2025-01-06', 7, 0, NULL, NULL, '向璐', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (1004, '支出', 25.76, '2025-01-08', 3, 2, NULL, NULL, '汤致远', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (1005, '支出', 17.98, '2025-01-19', 1, 7, NULL, NULL, '侯晓明', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (1006, '收入', 189.90, '2025-01-06', 3, 6, NULL, NULL, '吴宇宁', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (1007, '收入', 41.03, '2025-01-30', 6, 3, NULL, NULL, '贺晓明', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (1008, '支出', 163.99, '2025-01-08', 2, 5, NULL, NULL, '常秀英', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (1009, '支出', 82.19, '2025-01-26', 2, 9, NULL, NULL, '石詩涵', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (1010, '支出', 92.19, '2025-01-21', 10, 8, NULL, NULL, '魏云熙', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (1011, '支出', 83.88, '2025-01-02', 4, 2, NULL, NULL, '薛嘉伦', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (1012, '收入', 56.36, '2025-01-25', 7, 7, NULL, NULL, '武宇宁', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (1013, '收入', 57.91, '2025-01-28', 5, 10, NULL, NULL, '段震南', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (1014, '收入', 45.22, '2025-01-06', 2, 3, NULL, NULL, '郭詩涵', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (1015, '支出', 84.03, '2025-01-20', 3, 1, NULL, NULL, '雷宇宁', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (1016, '收入', 177.17, '2025-01-23', 2, 4, NULL, NULL, '杨嘉伦', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (1017, '支出', 120.85, '2025-01-21', 3, 0, NULL, NULL, '韩致远', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (1018, '支出', 7.63, '2025-01-01', 1, 7, NULL, NULL, '侯嘉伦', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (1019, '收入', 148.27, '2025-01-10', 3, 6, NULL, NULL, '苏安琪', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (1020, '收入', 112.26, '2025-01-04', 6, 4, NULL, NULL, '贾杰宏', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (1021, '收入', 85.40, '2025-01-26', 7, 1, NULL, NULL, '贾杰宏', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (1022, '支出', 97.86, '2025-01-31', 1, 3, NULL, NULL, '廖睿', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (1023, '支出', 153.03, '2025-01-27', 2, 3, NULL, NULL, '龙睿', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (1024, '收入', 111.29, '2025-01-09', 3, 9, NULL, NULL, '韦震南', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (1025, '支出', 81.69, '2025-01-27', 3, 3, NULL, NULL, '熊晓明', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (1026, '支出', 44.27, '2025-01-20', 10, 2, NULL, NULL, '陈子异', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (1027, '支出', 21.51, '2025-01-23', 0, 8, NULL, NULL, '邓子韬', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (1028, '支出', 130.59, '2025-01-14', 2, 5, NULL, NULL, '蔡嘉伦', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (1029, '支出', 41.69, '2025-01-24', 3, 4, NULL, NULL, '朱安琪', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (1030, '收入', 7.76, '2025-01-18', 9, 5, NULL, NULL, '陈詩涵', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (1031, '收入', 49.64, '2025-01-01', 5, 1, NULL, NULL, '苏岚', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (1032, '收入', 184.02, '2025-01-21', 9, 4, NULL, NULL, '钱安琪', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (1033, '收入', 185.36, '2025-01-30', 8, 6, NULL, NULL, '汪岚', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (1034, '收入', 74.49, '2025-01-09', 7, 10, NULL, NULL, '方宇宁', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (1035, '支出', 24.09, '2025-01-22', 3, 6, NULL, NULL, '陶秀英', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (1036, '支出', 148.90, '2025-01-11', 7, 7, NULL, NULL, '毛璐', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (1037, '支出', 89.96, '2025-01-09', 8, 6, NULL, NULL, '田宇宁', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (1038, '支出', 162.31, '2025-01-28', 5, 7, NULL, NULL, '董安琪', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (1039, '支出', 128.86, '2025-01-03', 6, 9, NULL, NULL, '廖子异', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (1040, '收入', 189.55, '2025-01-20', 2, 0, NULL, NULL, '陆致远', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (1041, '支出', 10.97, '2025-01-20', 9, 2, NULL, NULL, '罗岚', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (1042, '支出', 180.88, '2025-01-29', 10, 6, NULL, NULL, '张晓明', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (1043, '支出', 27.86, '2025-01-20', 2, 2, NULL, NULL, '孟震南', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);
INSERT INTO `financial` VALUES (1044, '收入', 3.24, '2025-01-13', 2, 3, NULL, NULL, '邱子异', NULL, '2025-01-02 08:02:28', '2025-01-02 08:02:28', 1);

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '标题',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '内容',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建时间',
  `user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '公告信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES (1, '今天系统正式上线，开始内测', '今天系统正式上线，开始内测', '2023-09-05', 'admin');
INSERT INTO `notice` VALUES (2, '所有功能都已完成，可以正常使用', '所有功能都已完成，可以正常使用', '2023-09-05', 'admin');
INSERT INTO `notice` VALUES (3, '今天天气很不错，可以出去一起玩了', '今天天气很不错，可以出去一起玩了', '2023-09-05', 'admin');

-- ----------------------------
-- Table structure for nurse_info
-- ----------------------------
DROP TABLE IF EXISTS `nurse_info`;
CREATE TABLE `nurse_info`  (
  `nurse_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '护工唯一标识符',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '护工姓名',
  `gender` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '护工性别（M/F）',
  `age` int(11) NOT NULL COMMENT '护工年龄',
  `contact_info` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '护工联系方式',
  `photo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '护工照片',
  `work_experience` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '工作经验描述',
  `professional_certificate` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '专业证书',
  `nurse_level` int(11) NULL DEFAULT NULL COMMENT '护理等级 1 最高级 ，2 高级，3 中级，4 低级',
  `service_evaluation` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '服务评价',
  `status` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '状态,用于删除,1 可用，0 不可用',
  `id_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`nurse_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '存储护工基本信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of nurse_info
-- ----------------------------
INSERT INTO `nurse_info` VALUES (1, '小明', 'M', 10, '158858658986', NULL, '没有', 'http://localhost:9090/files/1735387343334-u=3900659337,4148274028&fm=253&app=138&size=w931&n=0&f=JPEG&fmt=auto.webp', 1, '厉害', '1', '1234567891011121', 'http://localhost:9090/files/1735387343334-u=3900659337,4148274028&fm=253&app=138&size=w931&n=0&f=JPEG&fmt=auto.webp');
INSERT INTO `nurse_info` VALUES (2, '路人甲', 'F', 21, '65165561', NULL, '1', 'http://localhost:9090/files/1735387343334-u=3900659337,4148274028&fm=253&app=138&size=w931&n=0&f=JPEG&fmt=auto.webp', 2, '超级耐心', '1', '+26984968', 'http://localhost:9090/files/1735387343334-u=3900659337,4148274028&fm=253&app=138&size=w931&n=0&f=JPEG&fmt=auto.webp');
INSERT INTO `nurse_info` VALUES (4, '李四', 'M', 31, '854984614984', NULL, '1', 'http://localhost:9090/files/1735387343334-u=3900659337,4148274028&fm=253&app=138&size=w931&n=0&f=JPEG&fmt=auto.webp', 4, '脾气优点冲', '1', '+561651651', 'http://localhost:9090/files/1735387343334-u=3900659337,4148274028&fm=253&app=138&size=w931&n=0&f=JPEG&fmt=auto.webp');
INSERT INTO `nurse_info` VALUES (5, '护工', 'F', 28, '5181316896', NULL, '1', 'http://localhost:9090/files/1735387343334-u=3900659337,4148274028&fm=253&app=138&size=w931&n=0&f=JPEG&fmt=auto.webp', 3, '有爱心', '1', '232216851', 'http://localhost:9090/files/1735387343334-u=3900659337,4148274028&fm=253&app=138&size=w931&n=0&f=JPEG&fmt=auto.webp');
INSERT INTO `nurse_info` VALUES (6, '涛哥', 'M', 18, '58585858585', NULL, '未知', 'http://localhost:9090/files/1735387343334-u=3900659337,4148274028&fm=253&app=138&size=w931&n=0&f=JPEG&fmt=auto.webp', 1, '认真', '1', '588585855858585858', 'http://localhost:9090/files/1735387343334-u=3900659337,4148274028&fm=253&app=138&size=w931&n=0&f=JPEG&fmt=auto.webp');
INSERT INTO `nurse_info` VALUES (7, '妹妹', 'M', 18, '12334343432', NULL, '无', 'http://localhost:9090/files/1735387343334-u=3900659337,4148274028&fm=253&app=138&size=w931&n=0&f=JPEG&fmt=auto.webp', 2, '负责', '1', '122121233232323232', 'http://localhost:9090/files/1735387343334-u=3900659337,4148274028&fm=253&app=138&size=w931&n=0&f=JPEG&fmt=auto.webp');
INSERT INTO `nurse_info` VALUES (10, '软件涛哥', 'M', 22, '45225458754', NULL, '无', 'http://localhost:9090/files/1735742544946-Snipaste_2024-12-02_08-30-46.png', 1, NULL, '1', '544857855825258585', 'http://localhost:9090/files/1735742517431-u=4058056957,4016577730&fm=253&app=138&size=w931&n=0&f=JPEG&fmt=auto.jpg');

-- ----------------------------
-- Table structure for outing_registration
-- ----------------------------
DROP TABLE IF EXISTS `outing_registration`;
CREATE TABLE `outing_registration`  (
  `outing_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '外出记录的唯一标识符',
  `elderly_id` int(11) NOT NULL COMMENT '外出老人的唯一标识符，外键关联到老人表',
  `outing_date` date NOT NULL COMMENT '外出的日期',
  `outing_time` time(0) NOT NULL COMMENT '外出的具体时间',
  `destination` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '外出的目的地描述',
  `purpose` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '外出的目的或活动描述',
  `accompanying_person` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '陪同老人的人员姓名或身份描述',
  `contact_info` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '外出时可用于联系的电话号码',
  `remarks` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '其他需要记录的备注信息',
  `created_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '记录被添加到表中的时间',
  `updated_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '记录最后一次被修改的时间',
  `review_status` int(11) NULL DEFAULT 0 COMMENT '审核状态，默认为0（未审核） 1表示已审核，-1表示审核未通过',
  `status` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '状态,用于删除,1 可用，0 不可用',
  PRIMARY KEY (`outing_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 614 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '存储老人外出登记信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of outing_registration
-- ----------------------------
INSERT INTO `outing_registration` VALUES (609, 29, '2024-12-28', '21:07:20', '王成涛宿舍', '出去玩', '111', '1111234', '111', '2024-12-25 21:07:20', '2024-12-25 21:07:20', 0, '1');
INSERT INTO `outing_registration` VALUES (610, 40, '2024-12-28', '10:02:16', '网吧', '网吧', '软件涛哥', '11111111111', '111', '2024-12-27 10:02:15', '2024-12-27 10:02:15', 0, '1');
INSERT INTO `outing_registration` VALUES (611, 40, '2024-12-28', '10:02:16', 'KTV', '唱歌', '软件涛哥', '11111111111', '111', '2024-12-27 10:02:15', '2024-12-27 10:02:15', 0, '1');
INSERT INTO `outing_registration` VALUES (612, 40, '2024-12-28', '10:02:16', '喝酒', '喝酒', '软件涛哥', '11111111111', '111', '2024-12-27 10:02:15', '2024-12-27 10:02:15', 0, '1');
INSERT INTO `outing_registration` VALUES (613, 103, '2025-01-02', '22:32:48', '公园', '放松身心', '小奥', '1158858585878', '该老人身患多种疾病', '2025-01-01 22:32:49', '2025-01-01 22:32:49', 0, '1');

-- ----------------------------
-- View structure for elderly_and_nurse
-- ----------------------------
DROP VIEW IF EXISTS `elderly_and_nurse`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `elderly_and_nurse` AS select `elderly_info`.`elderly_id` AS `elderly_id`,`elderly_info`.`name` AS `name`,`elderly_info`.`gender` AS `gender`,`elderly_info`.`age` AS `age`,`elderly_info`.`id_number` AS `id_number`,`elderly_info`.`nurse_id` AS `nurse_id`,`nurse_info`.`name` AS `nurse_name` from (`elderly_info` join `nurse_info` on((`elderly_info`.`nurse_id` = `nurse_info`.`nurse_id`)));

-- ----------------------------
-- View structure for elderly_and_nurse_plus
-- ----------------------------
DROP VIEW IF EXISTS `elderly_and_nurse_plus`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `elderly_and_nurse_plus` AS select `elderly_and_nurse`.`elderly_id` AS `elderly_id`,`elderly_and_nurse`.`name` AS `name`,`elderly_and_nurse`.`gender` AS `gender`,`elderly_and_nurse`.`age` AS `age`,`elderly_and_nurse`.`id_number` AS `id_number`,`elderly_and_nurse`.`nurse_id` AS `nurse_id`,`elderly_and_nurse`.`nurse_name` AS `nurse_name`,`elderly_and_project`.`project_id` AS `project_id`,`elderly_and_project`.`care_status` AS `care_status`,`elderly_and_project`.`status` AS `status` from (`elderly_and_nurse` join `elderly_and_project` on((`elderly_and_nurse`.`elderly_id` = `elderly_and_project`.`elderly_id`)));

-- ----------------------------
-- View structure for service_concern_and_record
-- ----------------------------
DROP VIEW IF EXISTS `service_concern_and_record`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `service_concern_and_record` AS select `elderly_and_nurse_plus`.`elderly_id` AS `elderly_id`,`elderly_and_nurse_plus`.`name` AS `name`,`elderly_and_nurse_plus`.`gender` AS `gender`,`elderly_and_nurse_plus`.`age` AS `age`,`elderly_and_nurse_plus`.`id_number` AS `id_number`,`elderly_and_nurse_plus`.`nurse_id` AS `nurse_id`,`elderly_and_nurse_plus`.`nurse_name` AS `nurse_name`,`elderly_and_nurse_plus`.`project_id` AS `project_id`,`elderly_and_nurse_plus`.`care_status` AS `care_status`,`elderly_and_nurse_plus`.`status` AS `status`,`care_project`.`project_name` AS `project_name`,`care_project`.`description` AS `description`,`care_project`.`price` AS `price`,`care_project`.`service_duration` AS `service_duration`,`care_project`.`nurse_level` AS `nurse_level` from (`elderly_and_nurse_plus` join `care_project` on((`elderly_and_nurse_plus`.`project_id` = `care_project`.`project_id`)));

SET FOREIGN_KEY_CHECKS = 1;
