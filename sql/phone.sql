SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for brand
-- ----------------------------
DROP TABLE IF EXISTS `brand`;
CREATE TABLE `brand` (
  `b_id` int NOT NULL AUTO_INCREMENT COMMENT '品牌ID',
  `b_name` varchar(50) DEFAULT NULL COMMENT '品牌名称',
  PRIMARY KEY (`b_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='品牌信息表';

-- ----------------------------
-- Records of brand
-- ----------------------------
BEGIN;
INSERT INTO `brand` (`b_id`, `b_name`) VALUES (1, '苹果');
INSERT INTO `brand` (`b_id`, `b_name`) VALUES (2, '华为');
INSERT INTO `brand` (`b_id`, `b_name`) VALUES (3, '小米');
INSERT INTO `brand` (`b_id`, `b_name`) VALUES (4, '荣耀');
COMMIT;

-- ----------------------------
-- Table structure for loginfo
-- ----------------------------
DROP TABLE IF EXISTS `loginfo`;
CREATE TABLE `loginfo` (
  `logid` int NOT NULL AUTO_INCREMENT COMMENT '登陆日志ID',
  `userid` int DEFAULT NULL COMMENT '登陆用户ID\n',
  `logintime` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '登陆时间',
  PRIMARY KEY (`logid`)
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=utf8mb3 COMMENT='登陆日志表\n';

-- ----------------------------
-- Records of loginfo
-- ----------------------------
BEGIN;
INSERT INTO `loginfo` (`logid`, `userid`, `logintime`) VALUES (129, 1, '2023-06-09 13:13:45');
INSERT INTO `loginfo` (`logid`, `userid`, `logintime`) VALUES (130, 1, '2023-06-09 13:17:52');
INSERT INTO `loginfo` (`logid`, `userid`, `logintime`) VALUES (131, 1, '2023-06-09 13:21:20');
COMMIT;

-- ----------------------------
-- Table structure for module
-- ----------------------------
DROP TABLE IF EXISTS `module`;
CREATE TABLE `module` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '权限ID',
  `p_id` int DEFAULT NULL COMMENT '父节点',
  `name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT '权限名称',
  `url` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT '访问url',
  `perms` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '权限标识',
  `target` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT '窗口',
  `type` int DEFAULT NULL COMMENT '类型',
  `order_num` int DEFAULT '0' COMMENT '排序',
  `status` tinyint DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci COMMENT='权限信息表';

-- ----------------------------
-- Records of module
-- ----------------------------
BEGIN;
INSERT INTO `module` (`id`, `p_id`, `name`, `url`, `perms`, `target`, `type`, `order_num`, `status`) VALUES (1, 0, '手机管理', '#', NULL, NULL, 0, 0, 1);
INSERT INTO `module` (`id`, `p_id`, `name`, `url`, `perms`, `target`, `type`, `order_num`, `status`) VALUES (2, 0, '日志管理', '#', NULL, NULL, 0, 0, 1);
INSERT INTO `module` (`id`, `p_id`, `name`, `url`, `perms`, `target`, `type`, `order_num`, `status`) VALUES (3, 0, '数据管理', '#', NULL, NULL, 0, 0, 1);
INSERT INTO `module` (`id`, `p_id`, `name`, `url`, `perms`, `target`, `type`, `order_num`, `status`) VALUES (4, 0, '系统管理', '#', NULL, NULL, 0, 0, 1);
INSERT INTO `module` (`id`, `p_id`, `name`, `url`, `perms`, `target`, `type`, `order_num`, `status`) VALUES (5, 4, '权限管理', '/module/toList', NULL, NULL, 1, 0, 1);
INSERT INTO `module` (`id`, `p_id`, `name`, `url`, `perms`, `target`, `type`, `order_num`, `status`) VALUES (6, 1, '信息管理', '/phone/list', NULL, NULL, 1, 0, 1);
INSERT INTO `module` (`id`, `p_id`, `name`, `url`, `perms`, `target`, `type`, `order_num`, `status`) VALUES (7, 1, '销售管理', '/sales/list', NULL, NULL, 1, 0, 1);
INSERT INTO `module` (`id`, `p_id`, `name`, `url`, `perms`, `target`, `type`, `order_num`, `status`) VALUES (8, 1, '库存管理', '/repertory/list', NULL, NULL, 1, 0, 1);
INSERT INTO `module` (`id`, `p_id`, `name`, `url`, `perms`, `target`, `type`, `order_num`, `status`) VALUES (9, 1, '品牌管理', '/brand/list', NULL, NULL, 1, 0, 1);
INSERT INTO `module` (`id`, `p_id`, `name`, `url`, `perms`, `target`, `type`, `order_num`, `status`) VALUES (10, 1, '供应商管理', '/vendor/list', NULL, NULL, 1, 0, 1);
INSERT INTO `module` (`id`, `p_id`, `name`, `url`, `perms`, `target`, `type`, `order_num`, `status`) VALUES (11, 2, '操作日志查询', '/operLog/list', 'operLog:list', 'main', 2, 0, 1);
INSERT INTO `module` (`id`, `p_id`, `name`, `url`, `perms`, `target`, `type`, `order_num`, `status`) VALUES (12, 2, '登陆日志查询', '/loginfo/list', 'loginfo:list', 'main', 2, 0, 1);
INSERT INTO `module` (`id`, `p_id`, `name`, `url`, `perms`, `target`, `type`, `order_num`, `status`) VALUES (13, 3, '上传', '/update', 'admin:update', 'main', 2, 0, 1);
INSERT INTO `module` (`id`, `p_id`, `name`, `url`, `perms`, `target`, `type`, `order_num`, `status`) VALUES (14, 3, '下载', '/down', 'admin:down', 'main', 2, 0, 1);
INSERT INTO `module` (`id`, `p_id`, `name`, `url`, `perms`, `target`, `type`, `order_num`, `status`) VALUES (15, 3, '导入', '/write', 'admin:write', 'main', 2, 0, 1);
INSERT INTO `module` (`id`, `p_id`, `name`, `url`, `perms`, `target`, `type`, `order_num`, `status`) VALUES (16, 3, '导出', '/read', 'admin:read', 'main', 2, 0, 1);
INSERT INTO `module` (`id`, `p_id`, `name`, `url`, `perms`, `target`, `type`, `order_num`, `status`) VALUES (17, 3, '图表', '/phone/toEcharts', 'phone:echarts', 'main', 2, 0, 1);
INSERT INTO `module` (`id`, `p_id`, `name`, `url`, `perms`, `target`, `type`, `order_num`, `status`) VALUES (18, 6, '添加手机信息', '/phone/toAdd', 'phone:add', 'main', 2, 0, 1);
INSERT INTO `module` (`id`, `p_id`, `name`, `url`, `perms`, `target`, `type`, `order_num`, `status`) VALUES (19, 6, '删除手机信息', '/phone/delete', 'phone:delete', 'main', 2, 0, 1);
INSERT INTO `module` (`id`, `p_id`, `name`, `url`, `perms`, `target`, `type`, `order_num`, `status`) VALUES (20, 6, '修改手机信息', '/phone/toUpdate', 'phone:update', 'main', 2, 0, 1);
INSERT INTO `module` (`id`, `p_id`, `name`, `url`, `perms`, `target`, `type`, `order_num`, `status`) VALUES (21, 6, '查询手机信息', '', 'phone:list', 'main', 2, 0, 1);
INSERT INTO `module` (`id`, `p_id`, `name`, `url`, `perms`, `target`, `type`, `order_num`, `status`) VALUES (22, 7, '添加销售信息', '/sales/toAdd', 'sales:add', 'main', 2, 0, 1);
INSERT INTO `module` (`id`, `p_id`, `name`, `url`, `perms`, `target`, `type`, `order_num`, `status`) VALUES (23, 7, '删除销售信息', '/sales/delete', 'sales:delete', 'main', 2, 0, 1);
INSERT INTO `module` (`id`, `p_id`, `name`, `url`, `perms`, `target`, `type`, `order_num`, `status`) VALUES (24, 7, '修改销售信息', '/sales/toUpdate', 'sales:update', 'main', 2, 0, 1);
INSERT INTO `module` (`id`, `p_id`, `name`, `url`, `perms`, `target`, `type`, `order_num`, `status`) VALUES (25, 7, '查询销售信息', '', 'sales:list', 'main', 2, 0, 1);
INSERT INTO `module` (`id`, `p_id`, `name`, `url`, `perms`, `target`, `type`, `order_num`, `status`) VALUES (26, 8, '添加库存信息', '/repertory/toAdd', 'repertory:add', 'main', 2, 0, 1);
INSERT INTO `module` (`id`, `p_id`, `name`, `url`, `perms`, `target`, `type`, `order_num`, `status`) VALUES (27, 8, '删除库存信息', '/repertory/delete', 'repertory:delete', 'main', 2, 0, 1);
INSERT INTO `module` (`id`, `p_id`, `name`, `url`, `perms`, `target`, `type`, `order_num`, `status`) VALUES (28, 8, '修改库存信息', '/repertory/toUpdate', 'repertory:update', 'main', 2, 0, 1);
INSERT INTO `module` (`id`, `p_id`, `name`, `url`, `perms`, `target`, `type`, `order_num`, `status`) VALUES (29, 8, '查询库存信息', '', 'repertory:list', 'main', 2, 0, 1);
INSERT INTO `module` (`id`, `p_id`, `name`, `url`, `perms`, `target`, `type`, `order_num`, `status`) VALUES (30, 9, '添加品牌信息', '/brand/toAdd', 'brand:add', 'main', 2, 0, 1);
INSERT INTO `module` (`id`, `p_id`, `name`, `url`, `perms`, `target`, `type`, `order_num`, `status`) VALUES (31, 9, '删除品牌信息', '/brand/delete', 'brand:delete', 'main', 2, 0, 1);
INSERT INTO `module` (`id`, `p_id`, `name`, `url`, `perms`, `target`, `type`, `order_num`, `status`) VALUES (32, 9, '修改品牌信息', '/brand/toUpdate', 'brand:update', 'main', 2, 0, 1);
INSERT INTO `module` (`id`, `p_id`, `name`, `url`, `perms`, `target`, `type`, `order_num`, `status`) VALUES (33, 9, '查询品牌信息', '', 'brand:list', 'main', 2, 0, 1);
INSERT INTO `module` (`id`, `p_id`, `name`, `url`, `perms`, `target`, `type`, `order_num`, `status`) VALUES (34, 10, '添加供应商信息', '/vendor/toAdd', 'vendor:add', 'main', 2, 0, 1);
INSERT INTO `module` (`id`, `p_id`, `name`, `url`, `perms`, `target`, `type`, `order_num`, `status`) VALUES (35, 10, '删除供应商信息', '/vendor/delete', 'vendor:delete', 'main', 2, 0, 1);
INSERT INTO `module` (`id`, `p_id`, `name`, `url`, `perms`, `target`, `type`, `order_num`, `status`) VALUES (36, 10, '修改供应商信息', '/vendor/toUpdate', 'vendor:update', 'main', 2, 0, 1);
INSERT INTO `module` (`id`, `p_id`, `name`, `url`, `perms`, `target`, `type`, `order_num`, `status`) VALUES (37, 10, '查询供应商信息', '', 'vendor:list', 'main', 2, 0, 1);
INSERT INTO `module` (`id`, `p_id`, `name`, `url`, `perms`, `target`, `type`, `order_num`, `status`) VALUES (38, 11, '查询操作日志', '/operLog/list', 'operLog:list', 'main', 2, 0, 1);
INSERT INTO `module` (`id`, `p_id`, `name`, `url`, `perms`, `target`, `type`, `order_num`, `status`) VALUES (39, 12, '查询登陆日志', '/loginfo/list', 'loginfo:list', 'main', 2, 0, 1);
INSERT INTO `module` (`id`, `p_id`, `name`, `url`, `perms`, `target`, `type`, `order_num`, `status`) VALUES (40, 48, '添加角色', '/role/toAdd', 'role:add', 'main', 2, 0, 1);
INSERT INTO `module` (`id`, `p_id`, `name`, `url`, `perms`, `target`, `type`, `order_num`, `status`) VALUES (41, 48, '删除角色', '/role/delete', 'role:delete', 'main', 2, 0, 1);
INSERT INTO `module` (`id`, `p_id`, `name`, `url`, `perms`, `target`, `type`, `order_num`, `status`) VALUES (42, 48, '修改角色', '/role/toUpdate', 'role:update', 'main', 2, 0, 1);
INSERT INTO `module` (`id`, `p_id`, `name`, `url`, `perms`, `target`, `type`, `order_num`, `status`) VALUES (43, 48, '查询角色', '', 'role:list', 'main', 2, 0, 1);
INSERT INTO `module` (`id`, `p_id`, `name`, `url`, `perms`, `target`, `type`, `order_num`, `status`) VALUES (44, 5, '添加权限', '/module/toAdd', 'moudle:add', 'main', 2, 0, 1);
INSERT INTO `module` (`id`, `p_id`, `name`, `url`, `perms`, `target`, `type`, `order_num`, `status`) VALUES (45, 5, '删除权限', '/module/delete', 'moudle:delete', 'main', 2, 0, 1);
INSERT INTO `module` (`id`, `p_id`, `name`, `url`, `perms`, `target`, `type`, `order_num`, `status`) VALUES (46, 5, '修改权限', '/module/toUpdate', 'moudle:update', 'main', 2, 0, 1);
INSERT INTO `module` (`id`, `p_id`, `name`, `url`, `perms`, `target`, `type`, `order_num`, `status`) VALUES (47, 5, '查询权限', '', 'moudle:list', 'main', 2, 0, 1);
INSERT INTO `module` (`id`, `p_id`, `name`, `url`, `perms`, `target`, `type`, `order_num`, `status`) VALUES (48, 4, '角色管理', '/role/list', 'role:list', 'main', 2, 0, 1);
INSERT INTO `module` (`id`, `p_id`, `name`, `url`, `perms`, `target`, `type`, `order_num`, `status`) VALUES (49, 4, '用户管理', '/user/list', 'user:list', 'main', 2, 0, 1);
COMMIT;

-- ----------------------------
-- Table structure for oper_log
-- ----------------------------
DROP TABLE IF EXISTS `oper_log`;
CREATE TABLE `oper_log` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '操作日志ID\n',
  `oper_module` varchar(100) DEFAULT NULL COMMENT '操作模块',
  `oper_method` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '操作方法',
  `oper_type` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '操作类型',
  `oper_desc` varchar(500) DEFAULT NULL COMMENT '操作描述',
  `req_method` varchar(100) DEFAULT NULL COMMENT '请求方法',
  `oper_param` varchar(500) DEFAULT NULL COMMENT '请求参数',
  `oper_ip` varchar(100) DEFAULT NULL COMMENT '请求IP',
  `oper_url` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '请求地址',
  `oper_user` varchar(100) DEFAULT NULL COMMENT '操作人',
  `create_time` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3326 DEFAULT CHARSET=utf8mb3 COMMENT='操作日志表';


-- ----------------------------
-- Table structure for phone
-- ----------------------------
DROP TABLE IF EXISTS `phone`;
CREATE TABLE `phone` (
  `p_id` int NOT NULL AUTO_INCREMENT COMMENT '手机ID',
  `p_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '手机名称',
  `b_id` int DEFAULT NULL COMMENT '品牌ID',
  `p_color` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '手机颜色',
  `p_memory` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '手机内存',
  `p_price` double DEFAULT NULL COMMENT '手机售价',
  PRIMARY KEY (`p_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='手机信息表';

-- ----------------------------
-- Records of phone
-- ----------------------------
BEGIN;
INSERT INTO `phone` (`p_id`, `p_name`, `b_id`, `p_color`, `p_memory`, `p_price`) VALUES (1, 'Marilyn Butler', 1, '白色', '12', 930.07);
INSERT INTO `phone` (`p_id`, `p_name`, `b_id`, `p_color`, `p_memory`, `p_price`) VALUES (2, 'Okada Seiko', 1, '白色', '2', 396.38);
INSERT INTO `phone` (`p_id`, `p_name`, `b_id`, `p_color`, `p_memory`, `p_price`) VALUES (3, 'Dong Xiuying', 1, '白色', '12', 921.2);
INSERT INTO `phone` (`p_id`, `p_name`, `b_id`, `p_color`, `p_memory`, `p_price`) VALUES (4, 'Randall Patterson', 1, '白色', '12', 227.4);
INSERT INTO `phone` (`p_id`, `p_name`, `b_id`, `p_color`, `p_memory`, `p_price`) VALUES (5, 'Lu Xiuying', 1, '白色', '12', 10.47);
INSERT INTO `phone` (`p_id`, `p_name`, `b_id`, `p_color`, `p_memory`, `p_price`) VALUES (6, 'Nishimura Eita', 1, '白色', '12', 370.8);
INSERT INTO `phone` (`p_id`, `p_name`, `b_id`, `p_color`, `p_memory`, `p_price`) VALUES (7, 'Cheng Ho Yin', 1, '白色', '12', 880.86);
INSERT INTO `phone` (`p_id`, `p_name`, `b_id`, `p_color`, `p_memory`, `p_price`) VALUES (8, 'Cindy Garcia', 1, '白色', '12', 244.86);
INSERT INTO `phone` (`p_id`, `p_name`, `b_id`, `p_color`, `p_memory`, `p_price`) VALUES (9, 'Frances Hamilton', 1, '白色', '12', 772.19);
INSERT INTO `phone` (`p_id`, `p_name`, `b_id`, `p_color`, `p_memory`, `p_price`) VALUES (10, 'Terry Fox', 1, '白色', '12', 980.68);
INSERT INTO `phone` (`p_id`, `p_name`, `b_id`, `p_color`, `p_memory`, `p_price`) VALUES (11, '122', 1, '白色', '123', 123);
COMMIT;

-- ----------------------------
-- Table structure for repertory
-- ----------------------------
DROP TABLE IF EXISTS `repertory`;
CREATE TABLE `repertory` (
  `r_id` int NOT NULL AUTO_INCREMENT COMMENT '库存ID',
  `p_id` int DEFAULT NULL COMMENT '手机ID',
  `r_quantity` int DEFAULT NULL COMMENT '库存数量',
  `r_price` double DEFAULT NULL COMMENT '进货价格',
  `v_id` int DEFAULT NULL COMMENT '供应商ID',
  PRIMARY KEY (`r_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='库存信息表';

-- ----------------------------
-- Records of repertory
-- ----------------------------
BEGIN;
INSERT INTO `repertory` (`r_id`, `p_id`, `r_quantity`, `r_price`, `v_id`) VALUES (1, 1, 30, 30.15, 1);
INSERT INTO `repertory` (`r_id`, `p_id`, `r_quantity`, `r_price`, `v_id`) VALUES (2, 2, 30, 420.63, 2);
INSERT INTO `repertory` (`r_id`, `p_id`, `r_quantity`, `r_price`, `v_id`) VALUES (3, 2, 30, 526.03, 2);
INSERT INTO `repertory` (`r_id`, `p_id`, `r_quantity`, `r_price`, `v_id`) VALUES (4, 2, 30, 520.66, 2);
INSERT INTO `repertory` (`r_id`, `p_id`, `r_quantity`, `r_price`, `v_id`) VALUES (5, 2, 30, 934.18, 2);
INSERT INTO `repertory` (`r_id`, `p_id`, `r_quantity`, `r_price`, `v_id`) VALUES (6, 2, 30, 189.7, 2);
INSERT INTO `repertory` (`r_id`, `p_id`, `r_quantity`, `r_price`, `v_id`) VALUES (7, 2, 30, 41.06, 2);
INSERT INTO `repertory` (`r_id`, `p_id`, `r_quantity`, `r_price`, `v_id`) VALUES (8, 2, 30, 707.48, 2);
INSERT INTO `repertory` (`r_id`, `p_id`, `r_quantity`, `r_price`, `v_id`) VALUES (9, 2, 30, 919.52, 2);
INSERT INTO `repertory` (`r_id`, `p_id`, `r_quantity`, `r_price`, `v_id`) VALUES (10, 2, 30, 246.15, 2);
INSERT INTO `repertory` (`r_id`, `p_id`, `r_quantity`, `r_price`, `v_id`) VALUES (11, 2, 30, 623.36, 2);
INSERT INTO `repertory` (`r_id`, `p_id`, `r_quantity`, `r_price`, `v_id`) VALUES (12, 2, 30, 952.35, 2);
INSERT INTO `repertory` (`r_id`, `p_id`, `r_quantity`, `r_price`, `v_id`) VALUES (13, 2, 30, 551.4, 2);
INSERT INTO `repertory` (`r_id`, `p_id`, `r_quantity`, `r_price`, `v_id`) VALUES (14, 2, 30, 742.12, 2);
INSERT INTO `repertory` (`r_id`, `p_id`, `r_quantity`, `r_price`, `v_id`) VALUES (15, 2, 30, 421.13, 2);
INSERT INTO `repertory` (`r_id`, `p_id`, `r_quantity`, `r_price`, `v_id`) VALUES (16, 21, 111, 111, 2);
COMMIT;

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `role_id` int NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT '角色名称',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci COMMENT='角色信息表';

-- ----------------------------
-- Records of role
-- ----------------------------
BEGIN;
INSERT INTO `role` (`role_id`, `role_name`) VALUES (1, 'admin');
INSERT INTO `role` (`role_id`, `role_name`) VALUES (2, 'user');
COMMIT;

-- ----------------------------
-- Table structure for role_module
-- ----------------------------
DROP TABLE IF EXISTS `role_module`;
CREATE TABLE `role_module` (
  `role_id` int NOT NULL DEFAULT '0' COMMENT '角色ID',
  `module_id` int NOT NULL DEFAULT '0' COMMENT '权限ID',
  PRIMARY KEY (`role_id`,`module_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci COMMENT='角色权限关联表';

-- ----------------------------
-- Records of role_module
-- ----------------------------
BEGIN;
INSERT INTO `role_module` (`role_id`, `module_id`) VALUES (1, 1);
INSERT INTO `role_module` (`role_id`, `module_id`) VALUES (1, 2);
INSERT INTO `role_module` (`role_id`, `module_id`) VALUES (1, 3);
INSERT INTO `role_module` (`role_id`, `module_id`) VALUES (1, 4);
INSERT INTO `role_module` (`role_id`, `module_id`) VALUES (1, 5);
INSERT INTO `role_module` (`role_id`, `module_id`) VALUES (1, 6);
INSERT INTO `role_module` (`role_id`, `module_id`) VALUES (1, 7);
INSERT INTO `role_module` (`role_id`, `module_id`) VALUES (1, 8);
INSERT INTO `role_module` (`role_id`, `module_id`) VALUES (1, 9);
INSERT INTO `role_module` (`role_id`, `module_id`) VALUES (1, 10);
INSERT INTO `role_module` (`role_id`, `module_id`) VALUES (1, 11);
INSERT INTO `role_module` (`role_id`, `module_id`) VALUES (1, 12);
INSERT INTO `role_module` (`role_id`, `module_id`) VALUES (1, 13);
INSERT INTO `role_module` (`role_id`, `module_id`) VALUES (1, 14);
INSERT INTO `role_module` (`role_id`, `module_id`) VALUES (1, 15);
INSERT INTO `role_module` (`role_id`, `module_id`) VALUES (1, 16);
INSERT INTO `role_module` (`role_id`, `module_id`) VALUES (1, 17);
INSERT INTO `role_module` (`role_id`, `module_id`) VALUES (1, 18);
INSERT INTO `role_module` (`role_id`, `module_id`) VALUES (1, 19);
INSERT INTO `role_module` (`role_id`, `module_id`) VALUES (1, 20);
INSERT INTO `role_module` (`role_id`, `module_id`) VALUES (1, 21);
INSERT INTO `role_module` (`role_id`, `module_id`) VALUES (1, 22);
INSERT INTO `role_module` (`role_id`, `module_id`) VALUES (1, 23);
INSERT INTO `role_module` (`role_id`, `module_id`) VALUES (1, 24);
INSERT INTO `role_module` (`role_id`, `module_id`) VALUES (1, 25);
INSERT INTO `role_module` (`role_id`, `module_id`) VALUES (1, 26);
INSERT INTO `role_module` (`role_id`, `module_id`) VALUES (1, 27);
INSERT INTO `role_module` (`role_id`, `module_id`) VALUES (1, 28);
INSERT INTO `role_module` (`role_id`, `module_id`) VALUES (1, 29);
INSERT INTO `role_module` (`role_id`, `module_id`) VALUES (1, 30);
INSERT INTO `role_module` (`role_id`, `module_id`) VALUES (1, 31);
INSERT INTO `role_module` (`role_id`, `module_id`) VALUES (1, 32);
INSERT INTO `role_module` (`role_id`, `module_id`) VALUES (1, 33);
INSERT INTO `role_module` (`role_id`, `module_id`) VALUES (1, 34);
INSERT INTO `role_module` (`role_id`, `module_id`) VALUES (1, 35);
INSERT INTO `role_module` (`role_id`, `module_id`) VALUES (1, 36);
INSERT INTO `role_module` (`role_id`, `module_id`) VALUES (1, 37);
INSERT INTO `role_module` (`role_id`, `module_id`) VALUES (1, 38);
INSERT INTO `role_module` (`role_id`, `module_id`) VALUES (1, 39);
INSERT INTO `role_module` (`role_id`, `module_id`) VALUES (1, 40);
INSERT INTO `role_module` (`role_id`, `module_id`) VALUES (1, 41);
INSERT INTO `role_module` (`role_id`, `module_id`) VALUES (1, 42);
INSERT INTO `role_module` (`role_id`, `module_id`) VALUES (1, 43);
INSERT INTO `role_module` (`role_id`, `module_id`) VALUES (1, 44);
INSERT INTO `role_module` (`role_id`, `module_id`) VALUES (1, 45);
INSERT INTO `role_module` (`role_id`, `module_id`) VALUES (1, 46);
INSERT INTO `role_module` (`role_id`, `module_id`) VALUES (1, 47);
INSERT INTO `role_module` (`role_id`, `module_id`) VALUES (1, 48);
INSERT INTO `role_module` (`role_id`, `module_id`) VALUES (1, 49);
INSERT INTO `role_module` (`role_id`, `module_id`) VALUES (2, 1);
INSERT INTO `role_module` (`role_id`, `module_id`) VALUES (2, 2);
COMMIT;

-- ----------------------------
-- Table structure for sales
-- ----------------------------
DROP TABLE IF EXISTS `sales`;
CREATE TABLE `sales` (
  `s_id` int NOT NULL AUTO_INCREMENT COMMENT '销售ID',
  `p_id` int DEFAULT NULL COMMENT '手机ID',
  `s_date` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '销售日期',
  `s_quantity` int DEFAULT NULL COMMENT '销售数量\n',
  `s_price` double DEFAULT NULL COMMENT '销售价格',
  `customer_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '顾客姓名',
  `customer_tel` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '顾客电话',
  PRIMARY KEY (`s_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='销售信息表';

-- ----------------------------
-- Records of sales
-- ----------------------------
BEGIN;
INSERT INTO `sales` (`s_id`, `p_id`, `s_date`, `s_quantity`, `s_price`, `customer_name`, `customer_tel`) VALUES (1, 1, '2023', 11, 111, '113', '1231');
COMMIT;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '密码',
  `salt` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '盐值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COMMENT='用户信息表';

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` (`id`, `username`, `password`, `salt`) VALUES (1, 'zjj', 'a3300fc7dd445a64b73f205f5cfc285c', '5bda5dd6');
INSERT INTO `user` (`id`, `username`, `password`, `salt`) VALUES (7, '123', '5d839605adc0612b8e13f8096b695ea2', 'cad89b59');
COMMIT;

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='用户角色关联表';

-- ----------------------------
-- Records of user_role
-- ----------------------------
BEGIN;
INSERT INTO `user_role` (`user_id`, `role_id`) VALUES (1, 1);
INSERT INTO `user_role` (`user_id`, `role_id`) VALUES (1, 2);
COMMIT;

-- ----------------------------
-- Table structure for vendor
-- ----------------------------
DROP TABLE IF EXISTS `vendor`;
CREATE TABLE `vendor` (
  `v_id` int NOT NULL AUTO_INCREMENT COMMENT '供应商ID',
  `v_name` varchar(50) DEFAULT NULL COMMENT '供应商名称',
  `v_tel` varchar(50) DEFAULT NULL COMMENT '供应商电话',
  PRIMARY KEY (`v_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='供应商信息表';

-- ----------------------------
-- Records of vendor
-- ----------------------------
BEGIN;
INSERT INTO `vendor` (`v_id`, `v_name`, `v_tel`) VALUES (1, '中国供应商', '1234');
INSERT INTO `vendor` (`v_id`, `v_name`, `v_tel`) VALUES (2, '美国供应商', '232332');
INSERT INTO `vendor` (`v_id`, `v_name`, `v_tel`) VALUES (3, '富士康', '222');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
