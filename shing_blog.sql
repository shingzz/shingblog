/*
 Navicat Premium Data Transfer

 Source Server         : 47.94.220.84_3306
 Source Server Type    : MySQL
 Source Server Version : 50728
 Source Host           : 47.94.220.84:3306
 Source Schema         : shing_blog

 Target Server Type    : MySQL
 Target Server Version : 50728
 File Encoding         : 65001

 Date: 10/08/2020 09:18:00
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article`  (
  `article_id` int(11) NOT NULL AUTO_INCREMENT,
  `article_user_id` int(11) NULL DEFAULT NULL,
  `article_category_id` int(11) NULL DEFAULT NULL,
  `article_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `article_create_time` datetime NULL DEFAULT NULL,
  `article_update_time` datetime NULL DEFAULT NULL,
  `article_content` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `article_html_content` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `article_view_count` int(11) NULL DEFAULT NULL,
  `article_comment_count` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`article_id`) USING BTREE,
  INDEX `FK_id_user`(`article_user_id`) USING BTREE,
  INDEX `FK_id_category`(`article_category_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES (1, NULL, NULL, '修改', '2020-07-30 21:40:33', '2020-07-30 08:48:04', '委任为', '<p>委任为</p>\r\n', 0, 0);

-- ----------------------------
-- Table structure for authority
-- ----------------------------
DROP TABLE IF EXISTS `authority`;
CREATE TABLE `authority`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `authority_ibfk_2`(`menu_id`) USING BTREE,
  INDEX `authority_ibfk_3`(`role_id`) USING BTREE,
  CONSTRAINT `authority_ibfk_2` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `authority_ibfk_3` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 151 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of authority
-- ----------------------------
INSERT INTO `authority` VALUES (124, 20, 15);
INSERT INTO `authority` VALUES (125, 20, 16);
INSERT INTO `authority` VALUES (126, 20, 24);
INSERT INTO `authority` VALUES (127, 20, 25);
INSERT INTO `authority` VALUES (128, 20, 26);
INSERT INTO `authority` VALUES (129, 20, 27);
INSERT INTO `authority` VALUES (130, 20, 17);
INSERT INTO `authority` VALUES (131, 20, 28);
INSERT INTO `authority` VALUES (132, 20, 29);
INSERT INTO `authority` VALUES (133, 20, 30);
INSERT INTO `authority` VALUES (134, 20, 38);
INSERT INTO `authority` VALUES (135, 20, 39);
INSERT INTO `authority` VALUES (136, 20, 20);
INSERT INTO `authority` VALUES (137, 20, 21);
INSERT INTO `authority` VALUES (138, 20, 31);
INSERT INTO `authority` VALUES (139, 20, 32);
INSERT INTO `authority` VALUES (140, 20, 33);
INSERT INTO `authority` VALUES (141, 20, 34);
INSERT INTO `authority` VALUES (142, 20, 35);
INSERT INTO `authority` VALUES (143, 20, 36);
INSERT INTO `authority` VALUES (144, 20, 37);
INSERT INTO `authority` VALUES (145, 5, 38);
INSERT INTO `authority` VALUES (146, 5, 39);
INSERT INTO `authority` VALUES (147, 5, 32);
INSERT INTO `authority` VALUES (148, 5, 15);
INSERT INTO `authority` VALUES (149, 5, 20);
INSERT INTO `authority` VALUES (150, 5, 21);

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `category_description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `category_parentid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`category_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, 'name1', 'descript1', NULL);
INSERT INTO `category` VALUES (2, 'name2', 'descript2', NULL);

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createTime` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES (1, 'gagds', '2020-03-06 16:59:37');
INSERT INTO `log` VALUES (2, '大大', '2020-03-06 16:59:58');
INSERT INTO `log` VALUES (3, '大大受到法国大使馆 ', '2020-03-06 17:00:03');
INSERT INTO `log` VALUES (4, '字符的个数', '2020-03-06 17:00:09');
INSERT INTO `log` VALUES (5, '岁的法国德国法国', '2020-03-06 17:00:14');
INSERT INTO `log` VALUES (6, '是规范的规定灌水灌水', '2020-03-06 17:00:19');
INSERT INTO `log` VALUES (12, '的萨芬', '2020-03-06 17:22:27');
INSERT INTO `log` VALUES (13, '用户名为admin的用户在登录时输入验证码错误', '2020-03-06 17:42:04');
INSERT INTO `log` VALUES (14, '用户名为admin的用户在登录时输入验证码错误', '2020-03-06 18:07:30');
INSERT INTO `log` VALUES (15, '用户名为admin的用户在登录时输入验证码错误', '2020-03-06 18:07:41');
INSERT INTO `log` VALUES (16, '用户名为admin，角色为{超级管理员}的用户登录成功', '2020-03-06 18:07:53');
INSERT INTO `log` VALUES (17, '用户名为admin，角色为{超级管理员}的用户登录成功', '2020-03-06 18:53:36');
INSERT INTO `log` VALUES (18, '用户名为admin，角色为{超级管理员}的用户登录成功', '2020-03-06 18:57:18');
INSERT INTO `log` VALUES (19, '用户名为admin，角色为{超级管理员}的用户登录成功', '2020-03-06 19:11:51');
INSERT INTO `log` VALUES (20, '用户名为admin的用户在登录时输入验证码错误', '2020-03-06 19:45:29');
INSERT INTO `log` VALUES (21, '用户名为admin，角色为{超级管理员}的用户登录成功', '2020-03-06 19:45:38');
INSERT INTO `log` VALUES (22, '用户名为admin，角色为{超级管理员}的用户登录成功', '2020-03-06 19:48:29');
INSERT INTO `log` VALUES (23, '用户名为admin，角色为{超级管理员}的用户登录成功', '2020-03-06 20:37:54');
INSERT INTO `log` VALUES (24, '用户名为admin的用户修改密码成功', '2020-03-06 20:42:45');
INSERT INTO `log` VALUES (25, '用户名为admin的用户修改密码成功', '2020-03-06 20:51:00');

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES (15, 0, '系统设置', '', 'icon-wrench');
INSERT INTO `menu` VALUES (16, 15, '菜单管理', '../admin/menu/list', 'icon-chart-organisation');
INSERT INTO `menu` VALUES (17, 15, '角色管理', '../admin/role/list', 'icon-user-group');
INSERT INTO `menu` VALUES (20, 0, '用户管理', '', 'icon-group-gear');
INSERT INTO `menu` VALUES (21, 20, '用户列表', '../admin/user/list', 'icon-group');
INSERT INTO `menu` VALUES (24, 16, '添加', 'openMenuAdd()', 'icon-add');
INSERT INTO `menu` VALUES (25, 16, '编辑', 'openMenuEdit()', 'icon-bullet-edit');
INSERT INTO `menu` VALUES (26, 16, '删除', 'menuRemove()', 'icon-cross');
INSERT INTO `menu` VALUES (27, 16, '添加按钮', 'openAddMenu()', 'icon-add');
INSERT INTO `menu` VALUES (28, 17, '添加', 'openRoleAdd()', 'icon-add');
INSERT INTO `menu` VALUES (29, 17, '编辑', 'openRoleEdit()', 'icon-bullet-edit');
INSERT INTO `menu` VALUES (30, 17, '删除', 'roleRemove()', 'icon-cross');
INSERT INTO `menu` VALUES (31, 21, '添加', 'openUserAdd()', 'icon-add');
INSERT INTO `menu` VALUES (32, 21, '编辑', 'openUserEdit()', 'icon-bullet-edit');
INSERT INTO `menu` VALUES (33, 21, '删除', 'userRemove()', 'icon-cross');
INSERT INTO `menu` VALUES (34, 0, '系统日志', '', 'icon-table');
INSERT INTO `menu` VALUES (35, 34, '日志列表', '../admin/log/list', 'icon-page-white-text');
INSERT INTO `menu` VALUES (36, 35, '添加日志', 'openLogAdd()', 'icon-add');
INSERT INTO `menu` VALUES (37, 35, '删除', 'logRemove()', 'icon-delete3');
INSERT INTO `menu` VALUES (38, 15, '修改密码', '../system/edit_password', 'icon-lock-edit');
INSERT INTO `menu` VALUES (39, 38, '修改密码', 'openEditPassword()', 'icon-lock-edit');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `role_remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (5, '普通用户', '普通用户请自由授权！');
INSERT INTO `role` VALUES (20, '超级管理员', '超级管理员拥有一切权限！');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_pass` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_photo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_sex` int(255) NULL DEFAULT NULL,
  `user_age` int(255) NULL DEFAULT NULL,
  `user_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (2, 'admin', '123', '/shingblog/resources/easyui/images/user_photo.jpg', 1, 22, '答复', NULL, NULL, NULL);
INSERT INTO `user` VALUES (17, 'user', '123', '/shingblog/resources/easyui/images/user_photo.jpg', 1, 123, '阿斯弗', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for user_role_ref
-- ----------------------------
DROP TABLE IF EXISTS `user_role_ref`;
CREATE TABLE `user_role_ref`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL,
  `role_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `foreign_user_id`(`user_id`) USING BTREE,
  INDEX `foreign_role_id`(`role_id`) USING BTREE,
  CONSTRAINT `foreign_role_id` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `foreign_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_role_ref
-- ----------------------------
INSERT INTO `user_role_ref` VALUES (1, 2, 20);
INSERT INTO `user_role_ref` VALUES (2, 17, 5);
INSERT INTO `user_role_ref` VALUES (3, 2, 5);

SET FOREIGN_KEY_CHECKS = 1;
