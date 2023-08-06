

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
-- Records of oper_log
-- ----------------------------
BEGIN;
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1587, '操作日志管理', 'list', '查询', '查询操作日志', 'GET', '{page=1}', '127.0.0.1', '/operLog/list', 'admin', '2023-06-08 16:56:11');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1588, '登陆日志管理', 'list', '查询', '查询登陆日志信息', 'GET', '{page=1}', '127.0.0.1', '/loginfo/list', 'admin', '2023-06-08 16:56:12');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1589, '操作日志管理', 'list', '查询', '查询操作日志', 'GET', '{page=1}', '127.0.0.1', '/operLog/list', 'admin', '2023-06-08 16:56:12');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1590, '登陆日志管理', 'list', '查询', '查询登陆日志信息', 'GET', '{page=1}', '127.0.0.1', '/loginfo/list', 'admin', '2023-06-08 16:56:15');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1591, '手机管理', 'toEcharts', '跳转', '跳转到手机价格统计页面', 'GET', 'null', '127.0.0.1', '/phone/toEcharts', 'admin', '2023-06-08 16:56:19');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1592, '手机管理', 'toEcharts', '跳转', '跳转到手机价格统计页面', 'GET', 'null', '127.0.0.1', '/phone/toEcharts', 'admin', '2023-06-08 16:56:27');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1593, '手机管理', 'list', '查询', '查询手机信息', 'GET', '{page=1}', '127.0.0.1', '/phone/list', 'admin', '2023-06-08 16:56:30');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1594, '手机管理', 'list', '查询', '查询手机信息', 'GET', '{page=2}', '127.0.0.1', '/phone/list', 'admin', '2023-06-08 16:56:32');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1595, '手机管理', 'toEcharts', '跳转', '跳转到手机价格统计页面', 'GET', 'null', '127.0.0.1', '/phone/toEcharts', 'admin', '2023-06-08 16:58:57');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1610, '手机管理', 'list', '查询', '查询手机信息', 'GET', '{page=1}', '127.0.0.1', '/phone/list', 'admin', '2023-06-08 17:02:18');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1611, '订单管理', 'index', '查询', '查询销售信息', 'GET', '{page=1}', '127.0.0.1', '/sales/list', 'admin', '2023-06-08 17:02:19');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1612, '库存管理', 'list', '查询', '查询库存信息', 'GET', '{page=1}', '127.0.0.1', '/repertory/list', 'admin', '2023-06-08 17:02:19');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1613, '品牌管理', 'index', '查询', '查询品牌信息', 'GET', '{page=1}', '127.0.0.1', '/brand/list', 'admin', '2023-06-08 17:02:20');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1614, '供应商管理', 'index', '查询', '查询供应商信息', 'GET', '{page=1}', '127.0.0.1', '/vendor/list', 'admin', '2023-06-08 17:02:20');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1615, '订单管理', 'index', '查询', '查询销售信息', 'GET', '{page=1}', '127.0.0.1', '/sales/list', 'admin', '2023-06-08 17:02:22');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1616, '库存管理', 'list', '查询', '查询库存信息', 'GET', '{page=1}', '127.0.0.1', '/repertory/list', 'admin', '2023-06-08 17:02:23');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1617, '订单管理', 'index', '查询', '查询销售信息', 'GET', '{page=1}', '127.0.0.1', '/sales/list', 'admin', '2023-06-08 17:02:23');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1618, '手机管理', 'list', '查询', '查询手机信息', 'GET', '{page=1}', '127.0.0.1', '/phone/list', 'admin', '2023-06-08 17:02:24');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1619, '手机管理', 'list', '查询', '查询手机信息', 'GET', '{page=1}', '127.0.0.1', '/phone/list', 'admin', '2023-06-08 17:02:25');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1620, '订单管理', 'index', '查询', '查询销售信息', 'GET', '{page=1}', '127.0.0.1', '/sales/list', 'admin', '2023-06-08 17:02:26');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1621, '库存管理', 'list', '查询', '查询库存信息', 'GET', '{page=1}', '127.0.0.1', '/repertory/list', 'admin', '2023-06-08 17:02:27');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1622, '品牌管理', 'index', '查询', '查询品牌信息', 'GET', '{page=1}', '127.0.0.1', '/brand/list', 'admin', '2023-06-08 17:02:28');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1623, '供应商管理', 'index', '查询', '查询供应商信息', 'GET', '{page=1}', '127.0.0.1', '/vendor/list', 'admin', '2023-06-08 17:02:29');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1624, '操作日志管理', 'list', '查询', '查询操作日志', 'GET', '{page=1}', '127.0.0.1', '/operLog/list', 'admin', '2023-06-08 17:02:30');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1625, '操作日志管理', 'list', '查询', '查询操作日志', 'GET', '{page=2}', '127.0.0.1', '/operLog/list', 'admin', '2023-06-08 17:02:32');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1626, '操作日志管理', 'list', '查询', '查询操作日志', 'GET', '{page=8}', '127.0.0.1', '/operLog/list', 'admin', '2023-06-08 17:02:33');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1627, '操作日志管理', 'list', '查询', '查询操作日志', 'GET', '{page=10}', '127.0.0.1', '/operLog/list', 'admin', '2023-06-08 17:02:35');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1628, '操作日志管理', 'list', '查询', '查询操作日志', 'GET', '{page=17}', '127.0.0.1', '/operLog/list', 'admin', '2023-06-08 17:02:36');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1629, '操作日志管理', 'list', '查询', '查询操作日志', 'GET', '{page=21}', '127.0.0.1', '/operLog/list', 'admin', '2023-06-08 17:02:36');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1630, '操作日志管理', 'list', '查询', '查询操作日志', 'GET', '{page=25}', '127.0.0.1', '/operLog/list', 'admin', '2023-06-08 17:02:36');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1631, '操作日志管理', 'list', '查询', '查询操作日志', 'GET', '{page=27}', '127.0.0.1', '/operLog/list', 'admin', '2023-06-08 17:02:37');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1632, '手机管理', 'list', '查询', '查询手机信息', 'GET', '{page=1}', '127.0.0.1', '/phone/list', 'admin', '2023-06-08 17:03:54');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1675, '手机管理', 'list', '查询', '查询手机信息', 'GET', '{page=1}', '127.0.0.1', '/phone/list', 'admin', '2023-06-08 17:32:24');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1676, '订单管理', 'index', '查询', '查询销售信息', 'GET', '{page=1}', '127.0.0.1', '/sales/list', 'admin', '2023-06-08 17:32:25');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1677, '库存管理', 'list', '查询', '查询库存信息', 'GET', '{page=1}', '127.0.0.1', '/repertory/list', 'admin', '2023-06-08 17:32:26');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1692, '手机管理', 'list', '查询', '查询手机信息', 'GET', '{page=1}', '127.0.0.1', '/phone/list', 'admin', '2023-06-08 19:51:01');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1693, '订单管理', 'index', '查询', '查询销售信息', 'GET', '{page=1}', '127.0.0.1', '/sales/list', 'admin', '2023-06-08 19:51:01');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1694, '库存管理', 'list', '查询', '查询库存信息', 'GET', '{page=1}', '127.0.0.1', '/repertory/list', 'admin', '2023-06-08 19:51:02');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1695, '品牌管理', 'index', '查询', '查询品牌信息', 'GET', '{page=1}', '127.0.0.1', '/brand/list', 'admin', '2023-06-08 19:51:02');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1696, '供应商管理', 'index', '查询', '查询供应商信息', 'GET', '{page=1}', '127.0.0.1', '/vendor/list', 'admin', '2023-06-08 19:51:03');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1697, '订单管理', 'index', '查询', '查询销售信息', 'GET', '{page=1}', '127.0.0.1', '/sales/list', 'admin', '2023-06-08 19:51:04');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1698, '订单管理', 'toUpdate', '跳转', '跳转到销售信息修改页面', 'GET', '{id=1}', '127.0.0.1', '/sales/toUpdate', 'admin', '2023-06-08 19:51:05');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1699, '操作日志管理', 'list', '查询', '查询操作日志', 'GET', '{page=1}', '127.0.0.1', '/operLog/list', 'admin', '2023-06-08 19:51:10');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1714, '手机管理', 'list', '查询', '查询手机信息', 'GET', '{page=1}', '127.0.0.1', '/phone/list', 'admin', '2023-06-08 20:22:35');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1715, '订单管理', 'index', '查询', '查询销售信息', 'GET', '{page=1}', '127.0.0.1', '/sales/list', 'admin', '2023-06-08 20:22:35');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1716, '库存管理', 'list', '查询', '查询库存信息', 'GET', '{page=1}', '127.0.0.1', '/repertory/list', 'admin', '2023-06-08 20:22:35');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1717, '品牌管理', 'index', '查询', '查询品牌信息', 'GET', '{page=1}', '127.0.0.1', '/brand/list', 'admin', '2023-06-08 20:22:36');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1718, '供应商管理', 'index', '查询', '查询供应商信息', 'GET', '{page=1}', '127.0.0.1', '/vendor/list', 'admin', '2023-06-08 20:22:36');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1806, '操作日志管理', 'list', '查询', '查询操作日志', 'GET', '{page=1}', '127.0.0.1', '/operLog/list', 'admin', '2023-06-08 20:42:43');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1807, '手机管理', 'list', '查询', '查询手机信息', 'GET', '{page=1}', '127.0.0.1', '/phone/list', 'admin', '2023-06-08 20:42:46');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1808, '手机管理', 'list', '查询', '查询手机信息', 'GET', '{page=2}', '127.0.0.1', '/phone/list', 'admin', '2023-06-08 20:43:08');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1809, '手机管理', 'list', '查询', '查询手机信息', 'GET', '{page=3}', '127.0.0.1', '/phone/list', 'admin', '2023-06-08 20:43:10');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1811, '手机管理', 'list', '查询', '查询手机信息', 'GET', '{page=1}', '127.0.0.1', '/phone/list', 'admin', '2023-06-08 20:45:01');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1812, '手机管理', 'list', '查询', '查询手机信息', 'GET', '{page=1}', '127.0.0.1', '/phone/list', 'admin', '2023-06-08 20:45:03');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1813, '操作日志管理', 'list', '查询', '查询操作日志', 'GET', '{page=1}', '127.0.0.1', '/operLog/list', 'admin', '2023-06-08 20:45:07');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1814, '登陆日志管理', 'list', '查询', '查询登陆日志信息', 'GET', '{page=1}', '127.0.0.1', '/loginfo/list', 'admin', '2023-06-08 20:45:09');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1815, '手机管理', 'toEcharts', '跳转', '跳转到手机价格统计页面', 'GET', 'null', '127.0.0.1', '/phone/toEcharts', 'admin', '2023-06-08 20:45:22');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1875, '操作日志管理', 'list', '查询', '查询操作日志', 'GET', '{page=1}', '127.0.0.1', '/operLog/list', 'admin', '2023-06-08 21:25:04');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1876, '操作日志管理', 'list', '查询', '查询操作日志', 'GET', '{page=21}', '127.0.0.1', '/operLog/list', 'admin', '2023-06-08 21:25:07');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1877, '操作日志管理', 'list', '查询', '查询操作日志', 'GET', '{page=30}', '127.0.0.1', '/operLog/list', 'admin', '2023-06-08 21:25:09');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1878, '操作日志管理', 'list', '查询', '查询操作日志', 'GET', '{page=33}', '127.0.0.1', '/operLog/list', 'admin', '2023-06-08 21:25:09');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1879, '操作日志管理', 'list', '查询', '查询操作日志', 'GET', '{page=34}', '127.0.0.1', '/operLog/list', 'admin', '2023-06-08 21:25:10');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1880, '操作日志管理', 'list', '查询', '查询操作日志', 'GET', '{page=20}', '127.0.0.1', '/operLog/list', 'admin', '2023-06-08 21:25:11');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1881, '操作日志管理', 'list', '查询', '查询操作日志', 'GET', '{page=12}', '127.0.0.1', '/operLog/list', 'admin', '2023-06-08 21:25:12');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1882, '操作日志管理', 'list', '查询', '查询操作日志', 'GET', '{page=7}', '127.0.0.1', '/operLog/list', 'admin', '2023-06-08 21:25:12');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1883, '操作日志管理', 'list', '查询', '查询操作日志', 'GET', '{page=5}', '127.0.0.1', '/operLog/list', 'admin', '2023-06-08 21:25:13');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1884, '操作日志管理', 'list', '查询', '查询操作日志', 'GET', '{page=3}', '127.0.0.1', '/operLog/list', 'admin', '2023-06-08 21:25:14');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1885, '操作日志管理', 'list', '查询', '查询操作日志', 'GET', '{page=8}', '127.0.0.1', '/operLog/list', 'admin', '2023-06-08 21:25:14');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1886, '操作日志管理', 'list', '查询', '查询操作日志', 'GET', '{page=3}', '127.0.0.1', '/operLog/list', 'admin', '2023-06-08 21:25:15');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1887, '操作日志管理', 'list', '查询', '查询操作日志', 'GET', '{page=1}', '127.0.0.1', '/operLog/list', 'admin', '2023-06-08 21:25:16');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1888, '操作日志管理', 'list', '查询', '查询操作日志', 'GET', '{page=4}', '127.0.0.1', '/operLog/list', 'admin', '2023-06-08 21:25:16');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1889, '操作日志管理', 'list', '查询', '查询操作日志', 'GET', '{page=7}', '127.0.0.1', '/operLog/list', 'admin', '2023-06-08 21:25:17');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1890, '操作日志管理', 'list', '查询', '查询操作日志', 'GET', '{page=11}', '127.0.0.1', '/operLog/list', 'admin', '2023-06-08 21:25:17');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1891, '登陆日志管理', 'list', '查询', '查询登陆日志信息', 'GET', '{page=1}', '127.0.0.1', '/loginfo/list', 'admin', '2023-06-08 21:25:18');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1892, '登陆日志管理', 'list', '查询', '查询登陆日志信息', 'GET', '{page=1}', '127.0.0.1', '/loginfo/list', 'admin', '2023-06-08 21:25:20');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1893, '操作日志管理', 'list', '查询', '查询操作日志', 'GET', '{page=1}', '127.0.0.1', '/operLog/list', 'admin', '2023-06-08 21:25:21');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1908, '手机管理', 'list', '查询', '查询手机信息', 'GET', '{page=1}', '127.0.0.1', '/phone/list', 'admin', '2023-06-08 21:41:36');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1909, '手机管理', 'list', '查询', '查询手机信息', 'GET', '{page=1}', '127.0.0.1', '/phone/list', 'admin', '2023-06-08 21:41:52');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1910, '操作日志管理', 'list', '查询', '查询操作日志', 'GET', '{page=1}', '127.0.0.1', '/operLog/list', 'admin', '2023-06-08 21:41:59');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1911, '操作日志管理', 'list', '查询', '查询操作日志', 'GET', '{page=2}', '127.0.0.1', '/operLog/list', 'admin', '2023-06-08 21:42:01');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1912, '操作日志管理', 'list', '查询', '查询操作日志', 'GET', '{page=4}', '127.0.0.1', '/operLog/list', 'admin', '2023-06-08 21:42:01');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1913, '操作日志管理', 'list', '查询', '查询操作日志', 'GET', '{page=7}', '127.0.0.1', '/operLog/list', 'admin', '2023-06-08 21:42:03');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1914, '操作日志管理', 'list', '查询', '查询操作日志', 'GET', '{page=10}', '127.0.0.1', '/operLog/list', 'admin', '2023-06-08 21:42:04');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1915, '操作日志管理', 'list', '查询', '查询操作日志', 'GET', '{page=13}', '127.0.0.1', '/operLog/list', 'admin', '2023-06-08 21:42:05');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1916, '操作日志管理', 'list', '查询', '查询操作日志', 'GET', '{page=18}', '127.0.0.1', '/operLog/list', 'admin', '2023-06-08 21:42:05');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1917, '操作日志管理', 'list', '查询', '查询操作日志', 'GET', '{page=24}', '127.0.0.1', '/operLog/list', 'admin', '2023-06-08 21:42:06');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1918, '操作日志管理', 'list', '查询', '查询操作日志', 'GET', '{page=27}', '127.0.0.1', '/operLog/list', 'admin', '2023-06-08 21:42:06');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1919, '操作日志管理', 'list', '查询', '查询操作日志', 'GET', '{page=30}', '127.0.0.1', '/operLog/list', 'admin', '2023-06-08 21:42:07');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1920, '操作日志管理', 'list', '查询', '查询操作日志', 'GET', '{page=33}', '127.0.0.1', '/operLog/list', 'admin', '2023-06-08 21:42:07');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1921, '操作日志管理', 'list', '查询', '查询操作日志', 'GET', '{page=14}', '127.0.0.1', '/operLog/list', 'admin', '2023-06-08 21:42:09');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1922, '操作日志管理', 'list', '查询', '查询操作日志', 'GET', '{page=12}', '127.0.0.1', '/operLog/list', 'admin', '2023-06-08 21:42:10');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1923, '操作日志管理', 'list', '查询', '查询操作日志', 'GET', '{page=15}', '127.0.0.1', '/operLog/list', 'admin', '2023-06-08 21:42:11');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1938, '操作日志管理', 'list', '查询', '查询操作日志', 'GET', '{page=1}', '127.0.0.1', '/operLog/list', 'admin', '2023-06-08 21:45:36');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1939, '操作日志管理', 'list', '查询', '查询操作日志', 'GET', '{page=2}', '127.0.0.1', '/operLog/list', 'admin', '2023-06-08 21:45:40');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1940, '操作日志管理', 'list', '查询', '查询操作日志', 'GET', '{page=3}', '127.0.0.1', '/operLog/list', 'admin', '2023-06-08 21:45:40');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1941, '操作日志管理', 'list', '查询', '查询操作日志', 'GET', '{page=6}', '127.0.0.1', '/operLog/list', 'admin', '2023-06-08 21:45:41');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1942, '操作日志管理', 'list', '查询', '查询操作日志', 'GET', '{page=9}', '127.0.0.1', '/operLog/list', 'admin', '2023-06-08 21:45:42');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1943, '操作日志管理', 'list', '查询', '查询操作日志', 'GET', '{page=14}', '127.0.0.1', '/operLog/list', 'admin', '2023-06-08 21:45:42');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1944, '操作日志管理', 'list', '查询', '查询操作日志', 'GET', '{page=16}', '127.0.0.1', '/operLog/list', 'admin', '2023-06-08 21:45:43');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1945, '操作日志管理', 'list', '查询', '查询操作日志', 'GET', '{page=20}', '127.0.0.1', '/operLog/list', 'admin', '2023-06-08 21:45:43');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1946, '操作日志管理', 'list', '查询', '查询操作日志', 'GET', '{page=25}', '127.0.0.1', '/operLog/list', 'admin', '2023-06-08 21:45:44');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1947, '操作日志管理', 'list', '查询', '查询操作日志', 'GET', '{page=28}', '127.0.0.1', '/operLog/list', 'admin', '2023-06-08 21:45:44');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1948, '操作日志管理', 'list', '查询', '查询操作日志', 'GET', '{page=32}', '127.0.0.1', '/operLog/list', 'admin', '2023-06-08 21:45:45');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1949, '操作日志管理', 'list', '查询', '查询操作日志', 'GET', '{page=34}', '127.0.0.1', '/operLog/list', 'admin', '2023-06-08 21:45:45');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1950, '操作日志管理', 'list', '查询', '查询操作日志', 'GET', '{page=32}', '127.0.0.1', '/operLog/list', 'admin', '2023-06-08 21:45:46');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1951, '操作日志管理', 'list', '查询', '查询操作日志', 'GET', '{page=29}', '127.0.0.1', '/operLog/list', 'admin', '2023-06-08 21:45:47');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1966, '操作日志管理', 'list', '查询', '查询操作日志', 'GET', '{page=1}', '127.0.0.1', '/operLog/list', 'admin', '2023-06-08 21:48:18');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1967, '操作日志管理', 'list', '查询', '查询操作日志', 'GET', '{page=2}', '127.0.0.1', '/operLog/list', 'admin', '2023-06-08 21:48:20');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1968, '操作日志管理', 'list', '查询', '查询操作日志', 'GET', '{page=3}', '127.0.0.1', '/operLog/list', 'admin', '2023-06-08 21:48:21');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1969, '操作日志管理', 'list', '查询', '查询操作日志', 'GET', '{page=5}', '127.0.0.1', '/operLog/list', 'admin', '2023-06-08 21:48:21');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1970, '操作日志管理', 'list', '查询', '查询操作日志', 'GET', '{page=9}', '127.0.0.1', '/operLog/list', 'admin', '2023-06-08 21:48:22');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1971, '操作日志管理', 'list', '查询', '查询操作日志', 'GET', '{page=11}', '127.0.0.1', '/operLog/list', 'admin', '2023-06-08 21:48:22');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1972, '操作日志管理', 'list', '查询', '查询操作日志', 'GET', '{page=13}', '127.0.0.1', '/operLog/list', 'admin', '2023-06-08 21:48:22');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1973, '操作日志管理', 'list', '查询', '查询操作日志', 'GET', '{page=8}', '127.0.0.1', '/operLog/list', 'admin', '2023-06-08 21:48:23');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1974, '操作日志管理', 'list', '查询', '查询操作日志', 'GET', '{page=4}', '127.0.0.1', '/operLog/list', 'admin', '2023-06-08 21:48:23');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1975, '操作日志管理', 'list', '查询', '查询操作日志', 'GET', '{page=2}', '127.0.0.1', '/operLog/list', 'admin', '2023-06-08 21:48:24');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1976, '操作日志管理', 'list', '查询', '查询操作日志', 'GET', '{page=6}', '127.0.0.1', '/operLog/list', 'admin', '2023-06-08 21:48:30');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1977, '操作日志管理', 'list', '查询', '查询操作日志', 'GET', '{page=1}', '127.0.0.1', '/operLog/list', 'admin', '2023-06-08 21:48:32');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1978, '操作日志管理', 'list', '查询', '查询操作日志', 'GET', '{page=2}', '127.0.0.1', '/operLog/list', 'admin', '2023-06-08 21:48:40');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1979, '操作日志管理', 'list', '查询', '查询操作日志', 'GET', '{page=1}', '127.0.0.1', '/operLog/list', 'admin', '2023-06-08 21:48:41');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1980, '操作日志管理', 'list', '查询', '查询操作日志', 'GET', '{page=7}', '127.0.0.1', '/operLog/list', 'admin', '2023-06-08 21:48:41');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1981, '操作日志管理', 'list', '查询', '查询操作日志', 'GET', '{page=9}', '127.0.0.1', '/operLog/list', 'admin', '2023-06-08 21:48:42');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1982, '操作日志管理', 'list', '查询', '查询操作日志', 'GET', '{page=1}', '127.0.0.1', '/operLog/list', 'admin', '2023-06-08 21:48:53');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1983, '手机管理', 'list', '查询', '查询手机信息', 'GET', '{page=1}', '127.0.0.1', '/phone/list', 'admin', '2023-06-08 21:48:57');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (1984, '库存管理', 'list', '查询', '查询库存信息', 'GET', '{page=1}', '127.0.0.1', '/repertory/list', 'admin', '2023-06-08 21:49:02');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2267, '手机管理', 'list', '查询', '查询手机信息', 'GET', '{page=1}', '127.0.0.1', '/phone/list', 'admin', '2023-06-09 11:29:55');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2268, '手机管理', 'toEcharts', '跳转', '跳转到手机价格统计页面', 'GET', 'null', '127.0.0.1', '/phone/toEcharts', 'admin', '2023-06-09 11:30:06');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2269, '手机管理', 'list', '查询', '查询手机信息', 'GET', '{page=1}', '127.0.0.1', '/phone/list', 'admin', '2023-06-09 11:30:08');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2270, '库存管理', 'list', '查询', '查询库存信息', 'GET', '{page=1}', '127.0.0.1', '/repertory/list', 'admin', '2023-06-09 11:34:54');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2271, '库存管理', 'list', '查询', '查询库存信息', 'GET', '{page=2}', '127.0.0.1', '/repertory/list', 'admin', '2023-06-09 11:34:58');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2272, '库存管理', 'list', '查询', '查询库存信息', 'GET', '{page=1}', '127.0.0.1', '/repertory/list', 'admin', '2023-06-09 11:34:58');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2273, '库存管理', 'list', '查询', '查询库存信息', 'GET', '{page=2}', '127.0.0.1', '/repertory/list', 'admin', '2023-06-09 11:34:59');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2274, '库存管理', 'list', '查询', '查询库存信息', 'GET', '{page=3}', '127.0.0.1', '/repertory/list', 'admin', '2023-06-09 11:34:59');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2275, '库存管理', 'list', '查询', '查询库存信息', 'GET', '{page=1}', '127.0.0.1', '/repertory/list', 'admin', '2023-06-09 11:35:01');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2335, '登陆日志管理', 'list', '查询', '查询登陆日志信息', 'GET', '{page=1}', '127.0.0.1', '/loginfo/list', 'admin', '2023-06-09 12:05:38');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2336, '操作日志管理', 'list', '查询', '查询操作日志', 'GET', '{page=1}', '127.0.0.1', '/operLog/list', 'admin', '2023-06-09 12:05:39');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2337, '操作日志管理', 'list', '查询', '查询操作日志', 'GET', '{page=8}', '127.0.0.1', '/operLog/list', 'admin', '2023-06-09 12:05:45');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2338, '操作日志管理', 'list', '查询', '查询操作日志', 'GET', '{page=16}', '127.0.0.1', '/operLog/list', 'admin', '2023-06-09 12:05:48');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2339, '操作日志管理', 'list', '查询', '查询操作日志', 'GET', '{page=15}', '127.0.0.1', '/operLog/list', 'admin', '2023-06-09 12:05:48');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2340, '操作日志管理', 'list', '查询', '查询操作日志', 'GET', '{page=14}', '127.0.0.1', '/operLog/list', 'admin', '2023-06-09 12:05:49');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2341, '操作日志管理', 'list', '查询', '查询操作日志', 'GET', '{page=13}', '127.0.0.1', '/operLog/list', 'admin', '2023-06-09 12:05:50');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2342, '操作日志管理', 'list', '查询', '查询操作日志', 'GET', '{page=14}', '127.0.0.1', '/operLog/list', 'admin', '2023-06-09 12:05:50');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2343, '操作日志管理', 'list', '查询', '查询操作日志', 'GET', '{page=16}', '127.0.0.1', '/operLog/list', 'admin', '2023-06-09 12:05:51');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2506, '登陆日志管理', 'list', '查询', '查询登陆日志信息', 'GET', '{page=1}', '127.0.0.1', '/loginfo/list', 'admin', '2023-06-09 13:07:34');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2507, '登陆日志管理', 'list', '查询', '查询登陆日志信息', 'GET', '{page=1}', '127.0.0.1', '/loginfo/list', 'admin', '2023-06-09 13:07:36');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2508, '登陆日志管理', 'list', '查询', '查询登陆日志信息', 'GET', '{page=1}', '127.0.0.1', '/loginfo/list', 'admin', '2023-06-09 13:07:37');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2509, '登陆日志管理', 'list', '查询', '查询登陆日志信息', 'GET', '{page=1}', '127.0.0.1', '/loginfo/list', 'admin', '2023-06-09 13:07:55');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2510, '操作日志管理', 'list', '查询', '查询操作日志', 'GET', '{page=1}', '127.0.0.1', '/operLog/list', 'admin', '2023-06-09 13:07:55');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2511, '登陆日志管理', 'list', '查询', '查询登陆日志信息', 'GET', '{page=1}', '127.0.0.1', '/loginfo/list', 'admin', '2023-06-09 13:07:56');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2565, '操作日志管理', 'list', '查询', '查询操作日志', 'GET', '{page=1}', '127.0.0.1', '/operLog/list', 'admin', '2023-06-09 13:18:11');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2566, '登陆日志管理', 'list', '查询', '查询登陆日志信息', 'GET', '{page=1}', '127.0.0.1', '/loginfo/list', 'admin', '2023-06-09 13:18:15');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2582, '供应商管理', 'index', '查询', '查询供应商信息', 'GET', '{page=1}', '127.0.0.1', '/vendor/list', 'admin', '2023-06-09 13:21:26');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2583, '登陆日志管理', 'list', '查询', '查询登陆日志信息', 'GET', '{page=1}', '127.0.0.1', '/loginfo/list', 'admin', '2023-06-09 13:21:28');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2584, '操作日志管理', 'list', '查询', '查询操作日志', 'GET', '{page=1}', '127.0.0.1', '/operLog/list', 'admin', '2023-06-09 13:21:28');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2585, '登陆日志管理', 'list', '查询', '查询登陆日志信息', 'GET', '{page=1}', '127.0.0.1', '/loginfo/list', 'admin', '2023-06-09 13:21:29');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2586, '登陆日志管理', 'list', '查询', '查询登陆日志信息', 'GET', '{page=2}', '127.0.0.1', '/loginfo/list', 'admin', '2023-06-09 13:21:33');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2587, '登陆日志管理', 'list', '查询', '查询登陆日志信息', 'GET', '{page=2}', '127.0.0.1', '/loginfo/list', 'admin', '2023-06-09 13:21:34');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2588, '登陆日志管理', 'list', '查询', '查询登陆日志信息', 'GET', '{page=4}', '127.0.0.1', '/loginfo/list', 'admin', '2023-06-09 13:21:34');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2589, '登陆日志管理', 'list', '查询', '查询登陆日志信息', 'GET', '{page=8}', '127.0.0.1', '/loginfo/list', 'admin', '2023-06-09 13:21:35');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2590, '登陆日志管理', 'list', '查询', '查询登陆日志信息', 'GET', '{page=7}', '127.0.0.1', '/loginfo/list', 'admin', '2023-06-09 13:21:36');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2591, '登陆日志管理', 'list', '查询', '查询登陆日志信息', 'GET', '{page=1}', '127.0.0.1', '/loginfo/list', 'admin', '2023-06-09 13:21:37');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2610, '手机管理', 'list', '查询', '查询手机信息', 'GET', '{page=1}', '127.0.0.1', '/phone/list', 'admin', '2023-06-09 13:32:00');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2611, '订单管理', 'index', '查询', '查询销售信息', 'GET', '{page=1}', '127.0.0.1', '/sales/list', 'admin', '2023-06-09 13:32:01');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2612, '库存管理', 'list', '查询', '查询库存信息', 'GET', '{page=1}', '127.0.0.1', '/repertory/list', 'admin', '2023-06-09 13:32:01');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2613, '品牌管理', 'index', '查询', '查询品牌信息', 'GET', '{page=1}', '127.0.0.1', '/brand/list', 'admin', '2023-06-09 13:32:02');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2614, '操作日志管理', 'list', '查询', '查询操作日志', 'GET', '{page=1}', '127.0.0.1', '/operLog/list', 'admin', '2023-06-09 13:32:04');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2615, '登陆日志管理', 'list', '查询', '查询登陆日志信息', 'GET', '{page=1}', '127.0.0.1', '/loginfo/list', 'admin', '2023-06-09 13:32:04');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2704, '手机管理', 'list', '查询', '查询手机信息', 'GET', '{page=1}', '127.0.0.1', '/phone/list', 'admin', '2023-06-09 14:01:10');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2705, '订单管理', 'index', '查询', '查询销售信息', 'GET', '{page=1}', '127.0.0.1', '/sales/list', 'admin', '2023-06-09 14:01:10');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2706, '库存管理', 'list', '查询', '查询库存信息', 'GET', '{page=1}', '127.0.0.1', '/repertory/list', 'admin', '2023-06-09 14:01:11');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2707, '品牌管理', 'index', '查询', '查询品牌信息', 'GET', '{page=1}', '127.0.0.1', '/brand/list', 'admin', '2023-06-09 14:01:11');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2708, '供应商管理', 'index', '查询', '查询供应商信息', 'GET', '{page=1}', '127.0.0.1', '/vendor/list', 'admin', '2023-06-09 14:01:12');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2709, '操作日志管理', 'list', '查询', '查询操作日志', 'GET', '{page=1}', '127.0.0.1', '/operLog/list', 'admin', '2023-06-09 14:01:14');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2710, '登陆日志管理', 'list', '查询', '查询登陆日志信息', 'GET', '{page=1}', '127.0.0.1', '/loginfo/list', 'admin', '2023-06-09 14:01:14');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2711, '手机管理', 'toEcharts', '跳转', '跳转到手机价格统计页面', 'GET', 'null', '127.0.0.1', '/phone/toEcharts', 'admin', '2023-06-09 14:01:19');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2797, '登陆日志管理', 'list', '查询', '查询登陆日志信息', 'GET', '{page=1}', '127.0.0.1', '/loginfo/list', 'admin', '2023-06-09 14:17:19');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2798, '登陆日志管理', 'list', '查询', '查询登陆日志信息', 'GET', '{page=1}', '127.0.0.1', '/loginfo/list', 'admin', '2023-06-09 14:17:25');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2799, '登陆日志管理', 'list', '查询', '查询登陆日志信息', 'GET', '{page=1}', '127.0.0.1', '/loginfo/list', 'admin', '2023-06-09 14:17:26');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2800, '登陆日志管理', 'list', '查询', '查询登陆日志信息', 'GET', '{page=1}', '127.0.0.1', '/loginfo/list', 'admin', '2023-06-09 14:17:27');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2801, '登陆日志管理', 'list', '查询', '查询登陆日志信息', 'GET', '{page=1}', '127.0.0.1', '/loginfo/list', 'admin', '2023-06-09 14:17:28');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2811, '', '', '', '', '', '', '', '', '', '2023-06-09 15:10:25');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2812, '', '', '', '', '', '', '', '', '', '2023-06-09 15:10:25');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2813, '', '', '', '', '', '', '', '', '', '2023-06-09 15:10:25');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2814, '', '', '', '', '', '', '', '', '', '2023-06-09 15:10:25');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2815, '', '', '', '', '', '', '', '', '', '2023-06-09 15:10:26');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2816, '操作日志管理', 'list', '查询', '查询操作日志', 'GET', '{page=1}', '127.0.0.1', '/operLog/list', 'admin', '2023-06-09 15:11:22');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2817, '登陆日志管理', 'list', '查询', '查询登陆日志信息', 'GET', '{page=1}', '127.0.0.1', '/loginfo/list', 'admin', '2023-06-09 15:11:23');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2818, '手机管理', 'list', '查询', '查询手机信息', 'GET', '{page=1}', '127.0.0.1', '/phone/list', 'admin', '2023-06-09 15:11:24');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2819, '订单管理', 'index', '查询', '查询销售信息', 'GET', '{page=1}', '127.0.0.1', '/sales/list', 'admin', '2023-06-09 15:11:25');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2820, '订单管理', 'toUpdate', '跳转', '跳转到销售信息修改页面', 'GET', '{id=1}', '127.0.0.1', '/sales/toUpdate', 'admin', '2023-06-09 15:11:27');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2821, '', '', '', '', '', '', '', '', '', '2023-06-09 15:11:32');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2822, '', '', '', '', '', '', '', '', '', '2023-06-09 15:11:39');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2823, '', '', '', '', '', '', '', '', '', '2023-06-09 15:55:01');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2824, '', '', '', '', '', '', '', '', '', '2023-06-09 15:55:02');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2825, '', '', '', '', '', '', '', '', '', '2023-06-09 15:55:02');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2826, '', '', '', '', '', '', '', '', '', '2023-06-09 15:55:02');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2827, '', '', '', '', '', '', '', '', '', '2023-06-09 15:55:02');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2828, '', '', '', '', '', '', '', '', '', '2023-06-09 15:55:02');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2829, '', '', '', '', '', '', '', '', '', '2023-06-09 15:55:02');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2830, '', '', '', '', '', '', '', '', '', '2023-06-09 15:55:02');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2831, '', '', '', '', '', '', '', '', '', '2023-06-09 15:55:03');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2832, '', '', '', '', '', '', '', '', '', '2023-06-09 15:55:03');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2833, '', '', '', '', '', '', '', '', '', '2023-06-09 15:55:03');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2834, '', '', '', '', '', '', '', '', '', '2023-06-09 15:55:03');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2835, '', '', '', '', '', '', '', '', '', '2023-06-09 15:55:03');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2836, '手机管理', 'list', '查询', '查询手机信息', 'GET', '{page=1}', '127.0.0.1', '/phone/list', 'admin', '2023-06-09 15:59:23');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2837, '手机管理', 'toUpdate', '跳转', '跳转到手机信息修改页面', 'GET', '{id=2}', '127.0.0.1', '/phone/toUpdate', 'admin', '2023-06-09 15:59:35');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2838, '操作日志管理', 'list', '查询', '查询操作日志', 'GET', '{page=1}', '127.0.0.1', '/operLog/list', 'admin', '2023-06-09 16:04:30');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2839, '登陆日志管理', 'list', '查询', '查询登陆日志信息', 'GET', '{page=1}', '127.0.0.1', '/loginfo/list', 'admin', '2023-06-09 16:04:31');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2840, '', '', '', '', '', '', '', '', '', '2023-06-09 16:29:19');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2841, '', '', '', '', '', '', '', '', '', '2023-06-18 14:39:59');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2842, '', '', '', '', '', '', '', '', '', '2023-06-18 14:39:59');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2843, '', '', '', '', '', '', '', '', '', '2023-06-18 14:39:59');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2844, '', '', '', '', '', '', '', '', '', '2023-06-18 14:39:59');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2845, '', '', '', '', '', '', '', '', '', '2023-06-18 14:39:59');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2846, '', '', '', '', '', '', '', '', '', '2023-06-18 14:39:59');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2847, '', '', '', '', '', '', '', '', '', '2023-06-18 14:39:59');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2848, '', '', '', '', '', '', '', '', '', '2023-06-18 14:39:59');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2849, '', '', '', '', '', '', '', '', '', '2023-06-18 14:39:59');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2850, '', '', '', '', '', '', '', '', '', '2023-06-18 14:39:59');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2851, '', '', '', '', '', '', '', '', '', '2023-06-18 14:39:59');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2852, '', '', '', '', '', '', '', '', '', '2023-06-18 14:39:59');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2853, '', '', '', '', '', '', '', '', '', '2023-06-18 14:40:28');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2854, '', '', '', '', '', '', '', '', '', '2023-06-18 14:40:29');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2855, '', '', '', '', '', '', '', '', '', '2023-06-18 14:40:29');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2856, '', '', '', '', '', '', '', '', '', '2023-06-18 14:40:29');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2857, '', '', '', '', '', '', '', '', '', '2023-06-18 14:40:29');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2858, '', '', '', '', '', '', '', '', '', '2023-06-18 14:40:29');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2859, '', '', '', '', '', '', '', '', '', '2023-06-18 14:40:29');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2860, '', '', '', '', '', '', '', '', '', '2023-06-18 14:40:29');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2861, '', '', '', '', '', '', '', '', '', '2023-06-18 14:40:29');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2862, '', '', '', '', '', '', '', '', '', '2023-06-18 14:40:29');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2863, '', '', '', '', '', '', '', '', '', '2023-06-18 14:40:29');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2864, '', '', '', '', '', '', '', '', '', '2023-06-18 14:40:29');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2865, '', '', '', '', '', '', '', '', '', '2023-06-18 14:42:31');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2866, '', '', '', '', '', '', '', '', '', '2023-06-18 14:42:31');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2867, '', '', '', '', '', '', '', '', '', '2023-06-18 14:42:31');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2868, '', '', '', '', '', '', '', '', '', '2023-06-18 14:42:31');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2869, '', '', '', '', '', '', '', '', '', '2023-06-18 14:42:31');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2870, '', '', '', '', '', '', '', '', '', '2023-06-18 14:42:31');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2871, '', '', '', '', '', '', '', '', '', '2023-06-18 14:42:31');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2872, '', '', '', '', '', '', '', '', '', '2023-06-18 14:42:31');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2873, '', '', '', '', '', '', '', '', '', '2023-06-18 14:42:32');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2874, '', '', '', '', '', '', '', '', '', '2023-06-18 14:42:32');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2875, '', '', '', '', '', '', '', '', '', '2023-06-18 14:42:32');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2876, '', '', '', '', '', '', '', '', '', '2023-06-18 14:42:32');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2877, '', '', '', '', '', '', '', '', '', '2023-06-18 14:42:33');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2878, '手机管理', 'list', '查询', '查询手机信息', 'GET', '{page=1}', '127.0.0.1', '/phone/list', 'admin', '2023-06-18 14:43:41');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2879, '订单管理', 'index', '查询', '查询销售信息', 'GET', '{page=1}', '127.0.0.1', '/sales/list', 'admin', '2023-06-18 14:43:42');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2880, '库存管理', 'list', '查询', '查询库存信息', 'GET', '{page=1}', '127.0.0.1', '/repertory/list', 'admin', '2023-06-18 14:43:45');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2881, '品牌管理', 'index', '查询', '查询品牌信息', 'GET', '{page=1}', '127.0.0.1', '/brand/list', 'admin', '2023-06-18 14:43:46');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2882, '供应商管理', 'index', '查询', '查询供应商信息', 'GET', '{page=1}', '127.0.0.1', '/vendor/list', 'admin', '2023-06-18 14:43:47');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2883, '供应商管理', 'search', '查询', '模糊查询供应商信息', 'GET', '{name=美}', '127.0.0.1', '/vendor/search', 'admin', '2023-06-18 14:44:04');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2884, '', '', '', '', '', '', '', '', '', '2023-06-18 14:44:04');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2885, '操作日志管理', 'list', '查询', '查询操作日志', 'GET', '{page=1}', '127.0.0.1', '/operLog/list', 'admin', '2023-06-18 14:44:07');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2886, '登陆日志管理', 'list', '查询', '查询登陆日志信息', 'GET', '{page=1}', '127.0.0.1', '/loginfo/list', 'admin', '2023-06-18 14:44:08');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2887, '手机管理', 'toEcharts', '跳转', '跳转到手机价格统计页面', 'GET', 'null', '127.0.0.1', '/phone/toEcharts', 'admin', '2023-06-18 14:44:13');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2888, '手机管理', 'list', '查询', '查询手机信息', 'GET', '{page=1}', '127.0.0.1', '/phone/list', 'admin', '2023-06-18 14:45:09');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2889, '订单管理', 'index', '查询', '查询销售信息', 'GET', '{page=1}', '127.0.0.1', '/sales/list', 'admin', '2023-06-18 14:45:09');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2890, '手机管理', 'list', '查询', '查询手机信息', 'GET', '{page=1}', '127.0.0.1', '/phone/list', 'admin', '2023-06-18 14:45:13');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2891, '订单管理', 'index', '查询', '查询销售信息', 'GET', '{page=1}', '127.0.0.1', '/sales/list', 'admin', '2023-06-18 14:45:13');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2892, '订单管理', 'index', '查询', '查询销售信息', 'GET', '{page=1}', '127.0.0.1', '/sales/list', 'admin', '2023-06-18 14:45:14');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2893, '库存管理', 'list', '查询', '查询库存信息', 'GET', '{page=1}', '127.0.0.1', '/repertory/list', 'admin', '2023-06-18 14:45:14');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2894, '品牌管理', 'index', '查询', '查询品牌信息', 'GET', '{page=1}', '127.0.0.1', '/brand/list', 'admin', '2023-06-18 14:45:15');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2895, '品牌管理', 'index', '查询', '查询品牌信息', 'GET', '{page=1}', '127.0.0.1', '/brand/list', 'admin', '2023-06-18 14:45:15');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2896, '订单管理', 'index', '查询', '查询销售信息', 'GET', '{page=1}', '127.0.0.1', '/sales/list', 'admin', '2023-06-18 14:45:16');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2897, '手机管理', 'list', '查询', '查询手机信息', 'GET', '{page=1}', '127.0.0.1', '/phone/list', 'admin', '2023-06-18 14:45:17');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2898, '手机管理', 'list', '查询', '查询手机信息', 'GET', '{page=1}', '127.0.0.1', '/phone/list', 'admin', '2023-06-18 14:45:17');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2899, '', '', '', '', '', '', '', '', '', '2023-06-18 15:42:33');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2900, '', '', '', '', '', '', '', '', '', '2023-06-18 15:42:33');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2901, '', '', '', '', '', '', '', '', '', '2023-06-18 16:42:33');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2902, '', '', '', '', '', '', '', '', '', '2023-06-18 16:42:33');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2903, '', '', '', '', '', '', '', '', '', '2023-06-18 18:51:56');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2904, '', '', '', '', '', '', '', '', '', '2023-06-27 17:55:49');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2905, '', '', '', '', '', '', '', '', '', '2023-06-27 17:55:49');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2906, '', '', '', '', '', '', '', '', '', '2023-06-27 17:55:49');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2907, '', '', '', '', '', '', '', '', '', '2023-06-27 17:55:49');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2908, '', '', '', '', '', '', '', '', '', '2023-06-27 17:55:49');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2909, '', '', '', '', '', '', '', '', '', '2023-06-27 17:55:49');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2910, '', '', '', '', '', '', '', '', '', '2023-06-27 17:55:49');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2911, '', '', '', '', '', '', '', '', '', '2023-06-27 17:55:49');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2912, '', '', '', '', '', '', '', '', '', '2023-06-27 17:55:50');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2913, '', '', '', '', '', '', '', '', '', '2023-06-27 17:55:50');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2914, '', '', '', '', '', '', '', '', '', '2023-06-27 17:55:50');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2915, '', '', '', '', '', '', '', '', '', '2023-06-27 17:55:51');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2916, '', '', '', '', '', '', '', '', '', '2023-06-27 17:55:51');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2917, '手机管理', 'list', '查询', '查询手机信息', 'GET', '{page=1}', '127.0.0.1', '/phone/list', 'admin', '2023-06-27 18:00:13');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2918, '订单管理', 'index', '查询', '查询销售信息', 'GET', '{page=1}', '127.0.0.1', '/sales/list', 'admin', '2023-06-27 18:00:35');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2919, '库存管理', 'list', '查询', '查询库存信息', 'GET', '{page=1}', '127.0.0.1', '/repertory/list', 'admin', '2023-06-27 18:00:36');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2920, '品牌管理', 'index', '查询', '查询品牌信息', 'GET', '{page=1}', '127.0.0.1', '/brand/list', 'admin', '2023-06-27 18:00:37');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2921, '供应商管理', 'index', '查询', '查询供应商信息', 'GET', '{page=1}', '127.0.0.1', '/vendor/list', 'admin', '2023-06-27 18:00:38');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2922, '手机管理', 'list', '查询', '查询手机信息', 'GET', '{page=1}', '127.0.0.1', '/phone/list', 'admin', '2023-06-27 18:00:38');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2923, '手机管理', 'list', '查询', '查询手机信息', 'GET', '{page=1}', '127.0.0.1', '/phone/list', 'admin', '2023-06-27 18:03:47');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2924, '手机管理', 'toUpdate', '跳转', '跳转到手机信息修改页面', 'GET', '{id=4}', '127.0.0.1', '/phone/toUpdate', 'admin', '2023-06-27 18:03:54');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2925, '手机管理', 'update', '更新', '更新手机信息', 'POST', 'null', '127.0.0.1', '/phone/update', 'admin', '2023-06-27 18:04:02');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2926, '手机管理', 'list', '查询', '查询手机信息', 'GET', '{page=2}', '127.0.0.1', '/phone/list', 'admin', '2023-06-27 18:04:06');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2927, '手机管理', 'list', '查询', '查询手机信息', 'GET', '{page=1}', '127.0.0.1', '/phone/list', 'admin', '2023-06-27 18:04:07');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2928, '手机管理', 'list', '查询', '查询手机信息', 'GET', '{page=2}', '127.0.0.1', '/phone/list', 'admin', '2023-06-27 18:04:07');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2929, '手机管理', 'list', '查询', '查询手机信息', 'GET', '{page=1}', '127.0.0.1', '/phone/list', 'admin', '2023-06-27 18:04:08');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2930, '手机管理', 'toUpdate', '跳转', '跳转到手机信息修改页面', 'GET', '{id=1}', '127.0.0.1', '/phone/toUpdate', 'admin', '2023-06-27 18:04:11');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2931, '手机管理', 'update', '更新', '更新手机信息', 'POST', 'null', '127.0.0.1', '/phone/update', 'admin', '2023-06-27 18:04:14');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2932, '手机管理', 'toUpdate', '跳转', '跳转到手机信息修改页面', 'GET', '{id=2}', '127.0.0.1', '/phone/toUpdate', 'admin', '2023-06-27 18:04:15');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2933, '手机管理', 'update', '更新', '更新手机信息', 'POST', 'null', '127.0.0.1', '/phone/update', 'admin', '2023-06-27 18:04:18');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2934, '手机管理', 'toUpdate', '跳转', '跳转到手机信息修改页面', 'GET', '{id=3}', '127.0.0.1', '/phone/toUpdate', 'admin', '2023-06-27 18:04:21');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2935, '手机管理', 'update', '更新', '更新手机信息', 'POST', 'null', '127.0.0.1', '/phone/update', 'admin', '2023-06-27 18:04:24');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2936, '手机管理', 'toUpdate', '跳转', '跳转到手机信息修改页面', 'GET', '{id=5}', '127.0.0.1', '/phone/toUpdate', 'admin', '2023-06-27 18:04:25');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2937, '手机管理', 'update', '更新', '更新手机信息', 'POST', 'null', '127.0.0.1', '/phone/update', 'admin', '2023-06-27 18:04:27');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2938, '手机管理', 'list', '查询', '查询手机信息', 'GET', '{page=1}', '127.0.0.1', '/phone/list', 'admin', '2023-06-27 18:05:27');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2939, '手机管理', 'list', '查询', '查询手机信息', 'GET', '{page=2}', '127.0.0.1', '/phone/list', 'admin', '2023-06-27 18:05:29');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2940, '手机管理', 'list', '查询', '查询手机信息', 'GET', '{page=3}', '127.0.0.1', '/phone/list', 'admin', '2023-06-27 18:05:30');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2941, '手机管理', 'list', '查询', '查询手机信息', 'GET', '{page=2}', '127.0.0.1', '/phone/list', 'admin', '2023-06-27 18:05:31');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2942, '', '', '', '', '', '', '', '', '', '2023-06-27 18:55:51');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2943, '', '', '', '', '', '', '', '', '', '2023-06-27 18:55:51');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2944, '手机管理', 'list', '查询', '查询手机信息', 'GET', '{page=1}', '127.0.0.1', '/phone/list', 'admin', '2023-06-27 19:24:52');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2945, '订单管理', 'index', '查询', '查询销售信息', 'GET', '{page=1}', '127.0.0.1', '/sales/list', 'admin', '2023-06-27 19:25:13');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2946, '订单管理', 'index', '查询', '查询销售信息', 'GET', '{page=1}', '127.0.0.1', '/sales/list', 'admin', '2023-06-27 19:25:29');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2947, '库存管理', 'list', '查询', '查询库存信息', 'GET', '{page=1}', '127.0.0.1', '/repertory/list', 'admin', '2023-06-27 19:25:30');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2948, '品牌管理', 'index', '查询', '查询品牌信息', 'GET', '{page=1}', '127.0.0.1', '/brand/list', 'admin', '2023-06-27 19:25:46');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2949, '供应商管理', 'index', '查询', '查询供应商信息', 'GET', '{page=1}', '127.0.0.1', '/vendor/list', 'admin', '2023-06-27 19:25:58');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2950, '手机管理', 'list', '查询', '查询手机信息', 'GET', '{page=1}', '127.0.0.1', '/phone/list', 'admin', '2023-06-27 19:26:18');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2951, '手机管理', 'toUpdate', '跳转', '跳转到手机信息修改页面', 'GET', '{id=1}', '127.0.0.1', '/phone/toUpdate', 'admin', '2023-06-27 19:26:19');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2952, '订单管理', 'index', '查询', '查询销售信息', 'GET', '{page=1}', '127.0.0.1', '/sales/list', 'admin', '2023-06-27 19:26:43');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2953, '订单管理', 'toUpdate', '跳转', '跳转到销售信息修改页面', 'GET', '{id=1}', '127.0.0.1', '/sales/toUpdate', 'admin', '2023-06-27 19:26:44');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2954, '库存管理', 'list', '查询', '查询库存信息', 'GET', '{page=1}', '127.0.0.1', '/repertory/list', 'admin', '2023-06-27 19:27:00');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2955, '库存管理', 'toUpdate', '跳转', '跳转到库存信息修改页面', 'GET', '{id=3}', '127.0.0.1', '/repertory/toUpdate', 'admin', '2023-06-27 19:27:02');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2956, '', '', '', '', '', '', '', '', '', '2023-06-27 19:27:02');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2957, '订单管理', 'index', '查询', '查询销售信息', 'GET', '{page=1}', '127.0.0.1', '/sales/list', 'admin', '2023-06-27 19:27:04');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2958, '库存管理', 'list', '查询', '查询库存信息', 'GET', '{page=1}', '127.0.0.1', '/repertory/list', 'admin', '2023-06-27 19:27:04');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2959, '库存管理', 'toUpdate', '跳转', '跳转到库存信息修改页面', 'GET', '{id=5}', '127.0.0.1', '/repertory/toUpdate', 'admin', '2023-06-27 19:27:05');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2960, '', '', '', '', '', '', '', '', '', '2023-06-27 19:27:05');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2961, '库存管理', 'list', '查询', '查询库存信息', 'GET', '{page=1}', '127.0.0.1', '/repertory/list', 'admin', '2023-06-27 19:27:07');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2962, '库存管理', 'list', '查询', '查询库存信息', 'GET', '{page=2}', '127.0.0.1', '/repertory/list', 'admin', '2023-06-27 19:27:08');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2963, '库存管理', 'toUpdate', '跳转', '跳转到库存信息修改页面', 'GET', '{id=10}', '127.0.0.1', '/repertory/toUpdate', 'admin', '2023-06-27 19:27:10');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2964, '', '', '', '', '', '', '', '', '', '2023-06-27 19:27:10');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2965, '操作日志管理', 'list', '查询', '查询操作日志', 'GET', '{page=1}', '127.0.0.1', '/operLog/list', 'admin', '2023-06-27 19:28:12');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2966, '操作日志管理', 'list', '查询', '查询操作日志', 'GET', '{page=18}', '127.0.0.1', '/operLog/list', 'admin', '2023-06-27 19:28:20');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2967, '操作日志管理', 'list', '查询', '查询操作日志', 'GET', '{page=19}', '127.0.0.1', '/operLog/list', 'admin', '2023-06-27 19:28:21');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2968, '操作日志管理', 'list', '查询', '查询操作日志', 'GET', '{page=27}', '127.0.0.1', '/operLog/list', 'admin', '2023-06-27 19:28:22');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2969, '登陆日志管理', 'list', '查询', '查询登陆日志信息', 'GET', '{page=1}', '127.0.0.1', '/loginfo/list', 'admin', '2023-06-27 19:30:56');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2970, '操作日志管理', 'list', '查询', '查询操作日志', 'GET', '{page=1}', '127.0.0.1', '/operLog/list', 'admin', '2023-06-27 19:31:00');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2971, '登陆日志管理', 'list', '查询', '查询登陆日志信息', 'GET', '{page=1}', '127.0.0.1', '/loginfo/list', 'admin', '2023-06-27 19:32:46');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2972, '手机管理', 'toEcharts', '跳转', '跳转到手机价格统计页面', 'GET', 'null', '127.0.0.1', '/phone/toEcharts', 'admin', '2023-06-27 19:34:13');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2973, '手机管理', 'toEcharts', '跳转', '跳转到手机价格统计页面', 'GET', 'null', '127.0.0.1', '/phone/toEcharts', 'admin', '2023-06-27 19:34:15');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2974, '', '', '', '', '', '', '', '', '', '2023-06-27 19:39:30');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2975, '', '', '', '', '', '', '', '', '', '2023-06-27 19:54:23');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2976, '', '', '', '', '', '', '', '', '', '2023-06-28 15:44:45');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2977, '', '', '', '', '', '', '', '', '', '2023-06-28 15:44:45');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2978, '', '', '', '', '', '', '', '', '', '2023-06-28 15:44:45');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2979, '', '', '', '', '', '', '', '', '', '2023-06-28 15:44:45');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2980, '', '', '', '', '', '', '', '', '', '2023-06-28 15:44:45');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2981, '', '', '', '', '', '', '', '', '', '2023-06-28 15:44:45');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2982, '', '', '', '', '', '', '', '', '', '2023-06-28 15:44:45');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2983, '', '', '', '', '', '', '', '', '', '2023-06-28 15:44:45');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2984, '', '', '', '', '', '', '', '', '', '2023-06-28 15:44:46');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2985, '', '', '', '', '', '', '', '', '', '2023-06-28 15:44:46');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2986, '', '', '', '', '', '', '', '', '', '2023-06-28 15:44:46');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2987, '', '', '', '', '', '', '', '', '', '2023-06-28 15:44:46');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2988, '', '', '', '', '', '', '', '', '', '2023-06-28 15:44:47');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2989, '', '', '', '', '', '', '', '', '', '2023-06-28 15:47:10');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2990, '', '', '', '', '', '', '', '', '', '2023-06-28 15:47:27');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2991, '', '', '', '', '', '', '', '', '', '2023-06-28 15:47:27');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2992, '', '', '', '', '', '', '', '', '', '2023-06-28 15:47:27');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2993, '', '', '', '', '', '', '', '', '', '2023-06-28 15:47:27');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2994, '', '', '', '', '', '', '', '', '', '2023-06-28 15:47:27');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2995, '', '', '', '', '', '', '', '', '', '2023-06-28 15:47:27');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2996, '', '', '', '', '', '', '', '', '', '2023-06-28 15:47:27');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2997, '', '', '', '', '', '', '', '', '', '2023-06-28 15:47:27');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2998, '', '', '', '', '', '', '', '', '', '2023-06-28 15:47:28');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (2999, '', '', '', '', '', '', '', '', '', '2023-06-28 15:47:28');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3000, '', '', '', '', '', '', '', '', '', '2023-06-28 15:47:28');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3001, '', '', '', '', '', '', '', '', '', '2023-06-28 15:47:28');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3002, '', '', '', '', '', '', '', '', '', '2023-06-28 15:47:29');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3003, '', '', '', '', '', '', '', '', '', '2023-06-28 15:49:51');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3004, '', '', '', '', '', '', '', '', '', '2023-06-28 15:50:08');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3005, '', '', '', '', '', '', '', '', '', '2023-06-28 15:50:08');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3006, '', '', '', '', '', '', '', '', '', '2023-06-28 15:50:08');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3007, '', '', '', '', '', '', '', '', '', '2023-06-28 15:50:08');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3008, '', '', '', '', '', '', '', '', '', '2023-06-28 15:50:08');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3009, '', '', '', '', '', '', '', '', '', '2023-06-28 15:50:08');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3010, '', '', '', '', '', '', '', '', '', '2023-06-28 15:50:08');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3011, '', '', '', '', '', '', '', '', '', '2023-06-28 15:50:08');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3012, '', '', '', '', '', '', '', '', '', '2023-06-28 15:50:09');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3013, '', '', '', '', '', '', '', '', '', '2023-06-28 15:50:09');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3014, '', '', '', '', '', '', '', '', '', '2023-06-28 15:50:09');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3015, '', '', '', '', '', '', '', '', '', '2023-06-28 15:50:09');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3016, '', '', '', '', '', '', '', '', '', '2023-06-28 15:50:10');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3017, '', '', '', '', '', '', '', '', '', '2023-06-28 15:52:32');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3018, '', '', '', '', '', '', '', '', '', '2023-06-28 15:52:49');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3019, '', '', '', '', '', '', '', '', '', '2023-06-28 15:52:50');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3020, '', '', '', '', '', '', '', '', '', '2023-06-28 15:52:50');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3021, '', '', '', '', '', '', '', '', '', '2023-06-28 15:52:50');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3022, '', '', '', '', '', '', '', '', '', '2023-06-28 15:52:50');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3023, '', '', '', '', '', '', '', '', '', '2023-06-28 15:52:50');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3024, '', '', '', '', '', '', '', '', '', '2023-06-28 15:52:50');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3025, '', '', '', '', '', '', '', '', '', '2023-06-28 15:52:50');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3026, '', '', '', '', '', '', '', '', '', '2023-06-28 15:52:51');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3027, '', '', '', '', '', '', '', '', '', '2023-06-28 15:52:51');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3028, '', '', '', '', '', '', '', '', '', '2023-06-28 15:52:51');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3029, '', '', '', '', '', '', '', '', '', '2023-06-28 15:52:51');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3030, '', '', '', '', '', '', '', '', '', '2023-06-28 15:52:51');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3031, '', '', '', '', '', '', '', '', '', '2023-06-28 15:55:14');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3032, '', '', '', '', '', '', '', '', '', '2023-06-28 15:55:31');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3033, '', '', '', '', '', '', '', '', '', '2023-06-28 15:55:32');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3034, '', '', '', '', '', '', '', '', '', '2023-06-28 15:55:32');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3035, '', '', '', '', '', '', '', '', '', '2023-06-28 15:55:32');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3036, '', '', '', '', '', '', '', '', '', '2023-06-28 15:55:32');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3037, '', '', '', '', '', '', '', '', '', '2023-06-28 15:55:32');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3038, '', '', '', '', '', '', '', '', '', '2023-06-28 15:55:32');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3039, '', '', '', '', '', '', '', '', '', '2023-06-28 15:55:32');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3040, '', '', '', '', '', '', '', '', '', '2023-06-28 15:55:33');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3041, '', '', '', '', '', '', '', '', '', '2023-06-28 15:55:33');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3042, '', '', '', '', '', '', '', '', '', '2023-06-28 15:55:33');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3043, '', '', '', '', '', '', '', '', '', '2023-06-28 15:55:33');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3044, '', '', '', '', '', '', '', '', '', '2023-06-28 15:55:33');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3045, '', '', '', '', '', '', '', '', '', '2023-06-28 16:55:33');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3046, '', '', '', '', '', '', '', '', '', '2023-06-28 16:55:33');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3047, '', '', '', '', '', '', '', '', '', '2023-06-28 17:55:33');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3048, '', '', '', '', '', '', '', '', '', '2023-06-28 17:55:33');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3049, '', '', '', '', '', '', '', '', '', '2023-06-28 18:27:51');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3050, '', '', '', '', '', '', '', '', '', '2023-06-28 18:28:09');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3051, '', '', '', '', '', '', '', '', '', '2023-06-28 18:28:09');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3052, '', '', '', '', '', '', '', '', '', '2023-06-28 18:28:09');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3053, '', '', '', '', '', '', '', '', '', '2023-06-28 18:28:09');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3054, '', '', '', '', '', '', '', '', '', '2023-06-28 18:28:09');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3055, '', '', '', '', '', '', '', '', '', '2023-06-28 18:28:09');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3056, '', '', '', '', '', '', '', '', '', '2023-06-28 18:28:09');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3057, '', '', '', '', '', '', '', '', '', '2023-06-28 18:28:09');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3058, '', '', '', '', '', '', '', '', '', '2023-06-28 18:28:11');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3059, '', '', '', '', '', '', '', '', '', '2023-06-28 18:28:11');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3060, '', '', '', '', '', '', '', '', '', '2023-06-28 18:28:11');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3061, '', '', '', '', '', '', '', '', '', '2023-06-28 18:28:11');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3062, '', '', '', '', '', '', '', '', '', '2023-06-28 18:28:12');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3063, '', '', '', '', '', '', '', '', '', '2023-06-28 18:31:02');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3064, '', '', '', '', '', '', '', '', '', '2023-06-28 18:31:20');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3065, '', '', '', '', '', '', '', '', '', '2023-06-28 18:31:20');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3066, '', '', '', '', '', '', '', '', '', '2023-06-28 18:31:20');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3067, '', '', '', '', '', '', '', '', '', '2023-06-28 18:31:20');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3068, '', '', '', '', '', '', '', '', '', '2023-06-28 18:31:21');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3069, '', '', '', '', '', '', '', '', '', '2023-06-28 18:31:21');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3070, '', '', '', '', '', '', '', '', '', '2023-06-28 18:31:21');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3071, '', '', '', '', '', '', '', '', '', '2023-06-28 18:31:21');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3072, '', '', '', '', '', '', '', '', '', '2023-06-28 18:31:21');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3073, '', '', '', '', '', '', '', '', '', '2023-06-28 18:31:22');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3074, '', '', '', '', '', '', '', '', '', '2023-06-28 18:31:22');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3075, '', '', '', '', '', '', '', '', '', '2023-06-28 18:31:22');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3076, '', '', '', '', '', '', '', '', '', '2023-06-28 18:31:22');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3077, '', '', '', '', '', '', '', '', '', '2023-06-28 18:34:07');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3078, '', '', '', '', '', '', '', '', '', '2023-06-28 18:34:24');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3079, '', '', '', '', '', '', '', '', '', '2023-06-28 18:34:24');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3080, '', '', '', '', '', '', '', '', '', '2023-06-28 18:34:24');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3081, '', '', '', '', '', '', '', '', '', '2023-06-28 18:34:24');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3082, '', '', '', '', '', '', '', '', '', '2023-06-28 18:34:24');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3083, '', '', '', '', '', '', '', '', '', '2023-06-28 18:34:24');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3084, '', '', '', '', '', '', '', '', '', '2023-06-28 18:34:24');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3085, '', '', '', '', '', '', '', '', '', '2023-06-28 18:34:25');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3086, '', '', '', '', '', '', '', '', '', '2023-06-28 18:34:25');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3087, '', '', '', '', '', '', '', '', '', '2023-06-28 18:34:25');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3088, '', '', '', '', '', '', '', '', '', '2023-06-28 18:34:25');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3089, '', '', '', '', '', '', '', '', '', '2023-06-28 18:34:25');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3090, '', '', '', '', '', '', '', '', '', '2023-06-28 18:34:26');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3091, '', '', '', '', '', '', '', '', '', '2023-06-28 18:35:45');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3092, '', '', '', '', '', '', '', '', '', '2023-06-28 18:36:02');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3093, '', '', '', '', '', '', '', '', '', '2023-06-28 18:36:02');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3094, '', '', '', '', '', '', '', '', '', '2023-06-28 18:36:02');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3095, '', '', '', '', '', '', '', '', '', '2023-06-28 18:36:02');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3096, '', '', '', '', '', '', '', '', '', '2023-06-28 18:36:02');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3097, '', '', '', '', '', '', '', '', '', '2023-06-28 18:36:03');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3098, '', '', '', '', '', '', '', '', '', '2023-06-28 18:36:03');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3099, '', '', '', '', '', '', '', '', '', '2023-06-28 18:36:03');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3100, '', '', '', '', '', '', '', '', '', '2023-06-28 18:36:04');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3101, '', '', '', '', '', '', '', '', '', '2023-06-28 18:36:04');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3102, '', '', '', '', '', '', '', '', '', '2023-06-28 18:36:04');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3103, '', '', '', '', '', '', '', '', '', '2023-06-28 18:36:04');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3104, '', '', '', '', '', '', '', '', '', '2023-06-28 18:36:04');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3105, '', '', '', '', '', '', '', '', '', '2023-06-28 18:39:48');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3106, '', '', '', '', '', '', '', '', '', '2023-06-28 18:40:05');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3107, '', '', '', '', '', '', '', '', '', '2023-06-28 18:40:05');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3108, '', '', '', '', '', '', '', '', '', '2023-06-28 18:40:05');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3109, '', '', '', '', '', '', '', '', '', '2023-06-28 18:40:05');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3110, '', '', '', '', '', '', '', '', '', '2023-06-28 18:40:05');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3111, '', '', '', '', '', '', '', '', '', '2023-06-28 18:40:05');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3112, '', '', '', '', '', '', '', '', '', '2023-06-28 18:40:05');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3113, '', '', '', '', '', '', '', '', '', '2023-06-28 18:40:05');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3114, '', '', '', '', '', '', '', '', '', '2023-06-28 18:40:06');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3115, '', '', '', '', '', '', '', '', '', '2023-06-28 18:40:06');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3116, '', '', '', '', '', '', '', '', '', '2023-06-28 18:40:06');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3117, '', '', '', '', '', '', '', '', '', '2023-06-28 18:40:06');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3118, '', '', '', '', '', '', '', '', '', '2023-06-28 18:40:07');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3119, '', '', '', '', '', '', '', '', '', '2023-06-28 19:38:45');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3120, '', '', '', '', '', '', '', '', '', '2023-06-28 19:42:29');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3121, '', '', '', '', '', '', '', '', '', '2023-06-28 19:42:29');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3122, '', '', '', '', '', '', '', '', '', '2023-06-28 19:42:29');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3123, '', '', '', '', '', '', '', '', '', '2023-06-28 19:42:29');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3124, '', '', '', '', '', '', '', '', '', '2023-06-28 19:42:29');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3125, '', '', '', '', '', '', '', '', '', '2023-06-28 19:42:29');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3126, '', '', '', '', '', '', '', '', '', '2023-06-28 19:42:29');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3127, '', '', '', '', '', '', '', '', '', '2023-06-28 19:42:29');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3128, '', '', '', '', '', '', '', '', '', '2023-06-28 19:42:30');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3129, '', '', '', '', '', '', '', '', '', '2023-06-28 19:42:30');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3130, '', '', '', '', '', '', '', '', '', '2023-06-28 19:42:30');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3131, '', '', '', '', '', '', '', '', '', '2023-06-28 19:42:30');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3132, '', '', '', '', '', '', '', '', '', '2023-06-28 19:42:31');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3133, '', '', '', '', '', '', '', '', '', '2023-06-28 19:53:36');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3134, '', '', '', '', '', '', '', '', '', '2023-06-28 19:53:56');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3135, '', '', '', '', '', '', '', '', '', '2023-06-28 19:53:56');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3136, '', '', '', '', '', '', '', '', '', '2023-06-28 19:53:56');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3137, '', '', '', '', '', '', '', '', '', '2023-06-28 19:53:56');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3138, '', '', '', '', '', '', '', '', '', '2023-06-28 19:53:56');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3139, '', '', '', '', '', '', '', '', '', '2023-06-28 19:53:56');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3140, '', '', '', '', '', '', '', '', '', '2023-06-28 19:53:56');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3141, '', '', '', '', '', '', '', '', '', '2023-06-28 19:53:56');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3142, '', '', '', '', '', '', '', '', '', '2023-06-28 19:53:57');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3143, '', '', '', '', '', '', '', '', '', '2023-06-28 19:53:57');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3144, '', '', '', '', '', '', '', '', '', '2023-06-28 19:53:57');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3145, '', '', '', '', '', '', '', '', '', '2023-06-28 19:53:57');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3146, '', '', '', '', '', '', '', '', '', '2023-06-28 19:53:58');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3147, '', '', '', '', '', '', '', '', '', '2023-06-28 19:58:46');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3148, '', '', '', '', '', '', '', '', '', '2023-06-28 19:59:06');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3149, '', '', '', '', '', '', '', '', '', '2023-06-28 19:59:06');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3150, '', '', '', '', '', '', '', '', '', '2023-06-28 19:59:06');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3151, '', '', '', '', '', '', '', '', '', '2023-06-28 19:59:06');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3152, '', '', '', '', '', '', '', '', '', '2023-06-28 19:59:06');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3153, '', '', '', '', '', '', '', '', '', '2023-06-28 19:59:06');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3154, '', '', '', '', '', '', '', '', '', '2023-06-28 19:59:06');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3155, '', '', '', '', '', '', '', '', '', '2023-06-28 19:59:06');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3156, '', '', '', '', '', '', '', '', '', '2023-06-28 19:59:07');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3157, '', '', '', '', '', '', '', '', '', '2023-06-28 19:59:07');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3158, '', '', '', '', '', '', '', '', '', '2023-06-28 19:59:07');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3159, '', '', '', '', '', '', '', '', '', '2023-06-28 19:59:07');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3160, '', '', '', '', '', '', '', '', '', '2023-06-28 19:59:08');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3161, '', '', '', '', '', '', '', '', '', '2023-06-28 20:03:38');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3162, '', '', '', '', '', '', '', '', '', '2023-06-28 20:03:56');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3163, '', '', '', '', '', '', '', '', '', '2023-06-28 20:03:57');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3164, '', '', '', '', '', '', '', '', '', '2023-06-28 20:03:57');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3165, '', '', '', '', '', '', '', '', '', '2023-06-28 20:03:57');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3166, '', '', '', '', '', '', '', '', '', '2023-06-28 20:03:57');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3167, '', '', '', '', '', '', '', '', '', '2023-06-28 20:03:57');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3168, '', '', '', '', '', '', '', '', '', '2023-06-28 20:03:57');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3169, '', '', '', '', '', '', '', '', '', '2023-06-28 20:03:57');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3170, '', '', '', '', '', '', '', '', '', '2023-06-28 20:03:58');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3171, '', '', '', '', '', '', '', '', '', '2023-06-28 20:03:58');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3172, '', '', '', '', '', '', '', '', '', '2023-06-28 20:03:58');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3173, '', '', '', '', '', '', '', '', '', '2023-06-28 20:03:58');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3174, '', '', '', '', '', '', '', '', '', '2023-06-28 20:03:58');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3175, '', '', '', '', '', '', '', '', '', '2023-06-28 20:08:54');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3176, '', '', '', '', '', '', '', '', '', '2023-06-28 20:09:11');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3177, '', '', '', '', '', '', '', '', '', '2023-06-28 20:09:12');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3178, '', '', '', '', '', '', '', '', '', '2023-06-28 20:09:12');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3179, '', '', '', '', '', '', '', '', '', '2023-06-28 20:09:12');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3180, '', '', '', '', '', '', '', '', '', '2023-06-28 20:09:12');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3181, '', '', '', '', '', '', '', '', '', '2023-06-28 20:09:12');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3182, '', '', '', '', '', '', '', '', '', '2023-06-28 20:09:12');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3183, '', '', '', '', '', '', '', '', '', '2023-06-28 20:09:12');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3184, '', '', '', '', '', '', '', '', '', '2023-06-28 20:09:13');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3185, '', '', '', '', '', '', '', '', '', '2023-06-28 20:09:13');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3186, '', '', '', '', '', '', '', '', '', '2023-06-28 20:09:13');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3187, '', '', '', '', '', '', '', '', '', '2023-06-28 20:09:13');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3188, '', '', '', '', '', '', '', '', '', '2023-06-28 20:09:13');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3189, '', '', '', '', '', '', '', '', '', '2023-06-28 20:09:52');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3190, '', '', '', '', '', '', '', '', '', '2023-06-28 20:10:11');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3191, '', '', '', '', '', '', '', '', '', '2023-06-28 20:10:11');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3192, '', '', '', '', '', '', '', '', '', '2023-06-28 20:10:11');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3193, '', '', '', '', '', '', '', '', '', '2023-06-28 20:10:11');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3194, '', '', '', '', '', '', '', '', '', '2023-06-28 20:10:11');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3195, '', '', '', '', '', '', '', '', '', '2023-06-28 20:10:11');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3196, '', '', '', '', '', '', '', '', '', '2023-06-28 20:10:11');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3197, '', '', '', '', '', '', '', '', '', '2023-06-28 20:10:11');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3198, '', '', '', '', '', '', '', '', '', '2023-06-28 20:10:12');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3199, '', '', '', '', '', '', '', '', '', '2023-06-28 20:10:12');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3200, '', '', '', '', '', '', '', '', '', '2023-06-28 20:10:12');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3201, '', '', '', '', '', '', '', '', '', '2023-06-28 20:10:12');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3202, '', '', '', '', '', '', '', '', '', '2023-06-28 20:10:13');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3203, '', '', '', '', '', '', '', '', '', '2023-06-28 20:12:16');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3204, '', '', '', '', '', '', '', '', '', '2023-06-28 20:12:35');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3205, '', '', '', '', '', '', '', '', '', '2023-06-28 20:12:35');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3206, '', '', '', '', '', '', '', '', '', '2023-06-28 20:12:35');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3207, '', '', '', '', '', '', '', '', '', '2023-06-28 20:12:36');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3208, '', '', '', '', '', '', '', '', '', '2023-06-28 20:12:36');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3209, '', '', '', '', '', '', '', '', '', '2023-06-28 20:12:36');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3210, '', '', '', '', '', '', '', '', '', '2023-06-28 20:12:36');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3211, '', '', '', '', '', '', '', '', '', '2023-06-28 20:12:36');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3212, '', '', '', '', '', '', '', '', '', '2023-06-28 20:12:37');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3213, '', '', '', '', '', '', '', '', '', '2023-06-28 20:12:37');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3214, '', '', '', '', '', '', '', '', '', '2023-06-28 20:12:37');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3215, '', '', '', '', '', '', '', '', '', '2023-06-28 20:12:37');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3216, '', '', '', '', '', '', '', '', '', '2023-06-28 20:12:37');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3217, '', '', '', '', '', '', '', '', '', '2023-06-28 20:13:51');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3218, '', '', '', '', '', '', '', '', '', '2023-06-28 21:21:47');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3219, '', '', '', '', '', '', '', '', '', '2023-06-28 21:21:47');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3220, '', '', '', '', '', '', '', '', '', '2023-06-28 21:21:47');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3221, '', '', '', '', '', '', '', '', '', '2023-06-28 21:21:47');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3222, '', '', '', '', '', '', '', '', '', '2023-06-28 21:21:47');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3223, '', '', '', '', '', '', '', '', '', '2023-06-28 21:21:47');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3224, '', '', '', '', '', '', '', '', '', '2023-06-28 21:21:47');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3225, '', '', '', '', '', '', '', '', '', '2023-06-28 21:21:47');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3226, '', '', '', '', '', '', '', '', '', '2023-06-28 21:21:49');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3227, '', '', '', '', '', '', '', '', '', '2023-06-28 21:21:49');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3228, '', '', '', '', '', '', '', '', '', '2023-06-28 21:21:49');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3229, '', '', '', '', '', '', '', '', '', '2023-06-28 21:21:49');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3230, '', '', '', '', '', '', '', '', '', '2023-06-28 21:21:49');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3231, '', '', '', '', '', '', '', '', '', '2023-06-28 21:25:08');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3232, '', '', '', '', '', '', '', '', '', '2023-06-28 21:25:25');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3233, '', '', '', '', '', '', '', '', '', '2023-06-28 21:25:26');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3234, '', '', '', '', '', '', '', '', '', '2023-06-28 21:25:26');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3235, '', '', '', '', '', '', '', '', '', '2023-06-28 21:25:26');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3236, '', '', '', '', '', '', '', '', '', '2023-06-28 21:25:26');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3237, '', '', '', '', '', '', '', '', '', '2023-06-28 21:25:26');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3238, '', '', '', '', '', '', '', '', '', '2023-06-28 21:25:26');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3239, '', '', '', '', '', '', '', '', '', '2023-06-28 21:25:26');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3240, '', '', '', '', '', '', '', '', '', '2023-06-28 21:25:27');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3241, '', '', '', '', '', '', '', '', '', '2023-06-28 21:25:27');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3242, '', '', '', '', '', '', '', '', '', '2023-06-28 21:25:27');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3243, '', '', '', '', '', '', '', '', '', '2023-06-28 21:25:27');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3244, '', '', '', '', '', '', '', '', '', '2023-06-28 21:25:28');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3245, '', '', '', '', '', '', '', '', '', '2023-06-28 21:27:23');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3246, '', '', '', '', '', '', '', '', '', '2023-06-28 21:27:42');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3247, '', '', '', '', '', '', '', '', '', '2023-06-28 21:27:42');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3248, '', '', '', '', '', '', '', '', '', '2023-06-28 21:27:42');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3249, '', '', '', '', '', '', '', '', '', '2023-06-28 21:27:42');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3250, '', '', '', '', '', '', '', '', '', '2023-06-28 21:27:42');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3251, '', '', '', '', '', '', '', '', '', '2023-06-28 21:27:42');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3252, '', '', '', '', '', '', '', '', '', '2023-06-28 21:27:42');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3253, '', '', '', '', '', '', '', '', '', '2023-06-28 21:27:42');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3254, '', '', '', '', '', '', '', '', '', '2023-06-28 21:27:43');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3255, '', '', '', '', '', '', '', '', '', '2023-06-28 21:27:43');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3256, '', '', '', '', '', '', '', '', '', '2023-06-28 21:27:43');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3257, '', '', '', '', '', '', '', '', '', '2023-06-28 21:27:43');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3258, '', '', '', '', '', '', '', '', '', '2023-06-28 21:27:44');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3259, '', '', '', '', '', '', '', '', '', '2023-06-28 23:17:15');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3260, '', '', '', '', '', '', '', '', '', '2023-06-28 23:17:15');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3261, '', '', '', '', '', '', '', '', '', '2023-06-29 06:10:27');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3262, '', '', '', '', '', '', '', '', '', '2023-06-29 06:10:28');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3263, '', '', '', '', '', '', '', '', '', '2023-06-29 09:32:53');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3264, '', '', '', '', '', '', '', '', '', '2023-08-06 16:23:24');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3265, '', '', '', '', '', '', '', '', '', '2023-08-06 16:23:24');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3266, '', '', '', '', '', '', '', '', '', '2023-08-06 16:23:24');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3267, '', '', '', '', '', '', '', '', '', '2023-08-06 16:23:24');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3268, '', '', '', '', '', '', '', '', '', '2023-08-06 16:23:24');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3269, '', '', '', '', '', '', '', '', '', '2023-08-06 16:23:24');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3270, '', '', '', '', '', '', '', '', '', '2023-08-06 16:23:24');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3271, '', '', '', '', '', '', '', '', '', '2023-08-06 16:23:24');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3272, '', '', '', '', '', '', '', '', '', '2023-08-06 16:23:25');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3273, '', '', '', '', '', '', '', '', '', '2023-08-06 16:23:25');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3274, '', '', '', '', '', '', '', '', '', '2023-08-06 16:23:25');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3275, '', '', '', '', '', '', '', '', '', '2023-08-06 16:23:25');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3276, '', '', '', '', '', '', '', '', '', '2023-08-06 16:23:26');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3277, '', '', '', '', '', '', '', '', '', '2023-08-06 16:25:30');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3278, '', '', '', '', '', '', '', '', '', '2023-08-06 16:25:48');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3279, '', '', '', '', '', '', '', '', '', '2023-08-06 16:25:49');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3280, '', '', '', '', '', '', '', '', '', '2023-08-06 16:25:49');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3281, '', '', '', '', '', '', '', '', '', '2023-08-06 16:25:49');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3282, '', '', '', '', '', '', '', '', '', '2023-08-06 16:25:49');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3283, '', '', '', '', '', '', '', '', '', '2023-08-06 16:25:49');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3284, '', '', '', '', '', '', '', '', '', '2023-08-06 16:25:49');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3285, '', '', '', '', '', '', '', '', '', '2023-08-06 16:25:49');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3286, '', '', '', '', '', '', '', '', '', '2023-08-06 16:25:50');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3287, '', '', '', '', '', '', '', '', '', '2023-08-06 16:25:50');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3288, '', '', '', '', '', '', '', '', '', '2023-08-06 16:25:50');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3289, '', '', '', '', '', '', '', '', '', '2023-08-06 16:25:50');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3290, '', '', '', '', '', '', '', '', '', '2023-08-06 16:25:50');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3291, '', '', '', '', '', '', '', '', '', '2023-08-06 16:27:45');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3292, '', '', '', '', '', '', '', '', '', '2023-08-06 16:28:03');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3293, '', '', '', '', '', '', '', '', '', '2023-08-06 16:28:03');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3294, '', '', '', '', '', '', '', '', '', '2023-08-06 16:28:03');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3295, '', '', '', '', '', '', '', '', '', '2023-08-06 16:28:03');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3296, '', '', '', '', '', '', '', '', '', '2023-08-06 16:28:03');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3297, '', '', '', '', '', '', '', '', '', '2023-08-06 16:28:03');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3298, '', '', '', '', '', '', '', '', '', '2023-08-06 16:28:03');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3299, '', '', '', '', '', '', '', '', '', '2023-08-06 16:28:03');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3300, '', '', '', '', '', '', '', '', '', '2023-08-06 16:28:04');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3301, '', '', '', '', '', '', '', '', '', '2023-08-06 16:28:04');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3302, '', '', '', '', '', '', '', '', '', '2023-08-06 16:28:04');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3303, '', '', '', '', '', '', '', '', '', '2023-08-06 16:28:04');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3304, '', '', '', '', '', '', '', '', '', '2023-08-06 16:28:05');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3305, '手机管理', 'list', '查询', '查询手机信息', 'GET', '{page=1}', '127.0.0.1', '/phone/list', 'admin', '2023-08-06 16:28:37');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3306, '订单管理', 'index', '查询', '查询销售信息', 'GET', '{page=1}', '127.0.0.1', '/sales/list', 'admin', '2023-08-06 16:28:42');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3307, '库存管理', 'list', '查询', '查询库存信息', 'GET', '{page=1}', '127.0.0.1', '/repertory/list', 'admin', '2023-08-06 16:28:43');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3308, '品牌管理', 'index', '查询', '查询品牌信息', 'GET', '{page=1}', '127.0.0.1', '/brand/list', 'admin', '2023-08-06 16:28:44');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3309, '供应商管理', 'index', '查询', '查询供应商信息', 'GET', '{page=1}', '127.0.0.1', '/vendor/list', 'admin', '2023-08-06 16:28:44');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3310, '手机管理', 'list', '查询', '查询手机信息', 'GET', '{page=1}', '127.0.0.1', '/phone/list', 'admin', '2023-08-06 16:28:46');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3311, '手机管理', 'toEcharts', '跳转', '跳转到手机价格统计页面', 'GET', 'null', '127.0.0.1', '/phone/toEcharts', 'admin', '2023-08-06 16:29:10');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3312, '订单管理', 'index', '查询', '查询销售信息', 'GET', '{page=1}', '127.0.0.1', '/sales/list', 'admin', '2023-08-06 16:29:32');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3313, '订单管理', 'index', '查询', '查询销售信息', 'GET', '{page=1}', '127.0.0.1', '/sales/list', 'admin', '2023-08-06 16:29:32');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3314, '库存管理', 'list', '查询', '查询库存信息', 'GET', '{page=1}', '127.0.0.1', '/repertory/list', 'admin', '2023-08-06 16:29:47');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3315, '库存管理', 'list', '查询', '查询库存信息', 'GET', '{page=1}', '127.0.0.1', '/repertory/list', 'admin', '2023-08-06 16:29:47');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3316, '库存管理', 'list', '查询', '查询库存信息', 'GET', '{page=1}', '127.0.0.1', '/repertory/list', 'admin', '2023-08-06 16:30:00');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3317, '品牌管理', 'index', '查询', '查询品牌信息', 'GET', '{page=1}', '127.0.0.1', '/brand/list', 'admin', '2023-08-06 16:30:01');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3318, '供应商管理', 'index', '查询', '查询供应商信息', 'GET', '{page=1}', '127.0.0.1', '/vendor/list', 'admin', '2023-08-06 16:30:16');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3319, '供应商管理', 'index', '查询', '查询供应商信息', 'GET', '{page=1}', '127.0.0.1', '/vendor/list', 'admin', '2023-08-06 16:30:16');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3320, '操作日志管理', 'list', '查询', '查询操作日志', 'GET', '{page=1}', '127.0.0.1', '/operLog/list', 'admin', '2023-08-06 16:30:31');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3321, '登陆日志管理', 'list', '查询', '查询登陆日志信息', 'GET', '{page=1}', '127.0.0.1', '/loginfo/list', 'admin', '2023-08-06 16:30:54');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3322, '登陆日志管理', 'list', '查询', '查询登陆日志信息', 'GET', '{page=1}', '127.0.0.1', '/loginfo/list', 'admin', '2023-08-06 16:30:54');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3323, '手机管理', 'list', '查询', '查询手机信息', 'GET', '{page=1}', '127.0.0.1', '/phone/list', 'admin', '2023-08-06 16:35:16');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3324, '手机管理', 'toUpdate', '跳转', '跳转到手机信息修改页面', 'GET', '{id=1}', '127.0.0.1', '/phone/toUpdate', 'admin', '2023-08-06 16:35:17');
INSERT INTO `oper_log` (`id`, `oper_module`, `oper_method`, `oper_type`, `oper_desc`, `req_method`, `oper_param`, `oper_ip`, `oper_url`, `oper_user`, `create_time`) VALUES (3325, '', '', '', '', '', '', '', '', '', '2023-08-06 16:36:08');
COMMIT;

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
