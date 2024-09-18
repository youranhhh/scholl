/*
 Navicat Premium Data Transfer

 Source Server         : MySQL-8
 Source Server Type    : MySQL
 Source Server Version : 80023
 Source Host           : 127.0.0.1:3306
 Source Schema         : youran

 Target Server Type    : MySQL
 Target Server Version : 80023
 File Encoding         : 65001

 Date: 23/06/2024 11:53:07
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for QRTZ_BLOB_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_BLOB_TRIGGERS`;
CREATE TABLE `QRTZ_BLOB_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_BLOB_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_BLOB_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_CALENDARS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CALENDARS`;
CREATE TABLE `QRTZ_CALENDARS`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '日历信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_CALENDARS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_CRON_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CRON_TRIGGERS`;
CREATE TABLE `QRTZ_CRON_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_CRON_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_CRON_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_FIRED_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_FIRED_TRIGGERS`;
CREATE TABLE `QRTZ_FIRED_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint NOT NULL COMMENT '触发的时间',
  `sched_time` bigint NOT NULL COMMENT '定时器制定的时间',
  `priority` int NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '已触发的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_FIRED_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_JOB_DETAILS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_JOB_DETAILS`;
CREATE TABLE `QRTZ_JOB_DETAILS`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '任务详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_JOB_DETAILS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_LOCKS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_LOCKS`;
CREATE TABLE `QRTZ_LOCKS`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_LOCKS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_PAUSED_TRIGGER_GRPS`;
CREATE TABLE `QRTZ_PAUSED_TRIGGER_GRPS`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '暂停的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_SCHEDULER_STATE
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SCHEDULER_STATE`;
CREATE TABLE `QRTZ_SCHEDULER_STATE`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '调度器状态表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_SCHEDULER_STATE
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_SIMPLE_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPLE_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPLE_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_SIMPLE_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_SIMPLE_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_SIMPROP_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPROP_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPROP_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_SIMPROP_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_SIMPROP_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_TRIGGERS`;
CREATE TABLE `QRTZ_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint NOT NULL COMMENT '开始时间',
  `end_time` bigint NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name`, `job_name`, `job_group`) USING BTREE,
  CONSTRAINT `QRTZ_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `QRTZ_JOB_DETAILS` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '触发器详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `tpl_web_type` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
  `package_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (1, 'sys_laboratory', '实验室', 'sys_patrol', 'laboratory_id', 'SysLaboratory', 'sub', 'element-ui', 'com.ruoyi.system', 'system', 'laboratory', '实验室', 'ruoyi', '0', '/', '{\"parentMenuId\":\"2000\"}', 'admin', '2024-06-22 15:20:31', '', '2024-06-23 02:10:07', NULL);
INSERT INTO `gen_table` VALUES (2, 'sys_patrol', '巡查管理', NULL, NULL, 'SysPatrol', 'crud', 'element-ui', 'com.ruoyi.system', 'system', 'patrol', '巡查管理', 'ruoyi', '0', '/', '{\"parentMenuId\":\"1\"}', 'admin', '2024-06-23 01:59:12', '', '2024-06-23 02:29:14', NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (1, 1, 'id', 'id', 'bigint', 'Long', 'id', '1', '1', '0', '1', NULL, '1', NULL, 'EQ', 'input', '', 1, 'admin', '2024-06-22 15:20:31', '', '2024-06-23 02:10:07');
INSERT INTO `gen_table_column` VALUES (2, 1, 'name', '实验室名称', 'varchar(255)', 'String', 'name', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2024-06-22 15:20:31', '', '2024-06-23 02:10:07');
INSERT INTO `gen_table_column` VALUES (3, 1, 'user_id', '用户Id', 'bigint', 'Long', 'userId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-06-22 15:20:31', '', '2024-06-23 02:10:07');
INSERT INTO `gen_table_column` VALUES (4, 1, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, '1', NULL, 'EQ', 'datetime', '', 4, 'admin', '2024-06-22 15:20:31', '', '2024-06-23 02:10:07');
INSERT INTO `gen_table_column` VALUES (5, 2, 'id', 'id', 'bigint', 'Long', 'id', '1', '1', '0', '1', NULL, '1', NULL, 'EQ', 'input', '', 1, 'admin', '2024-06-23 01:59:12', '', '2024-06-23 02:29:14');
INSERT INTO `gen_table_column` VALUES (7, 2, 'appliance', '电器线路 1 ok 2 no', 'int', 'Long', 'appliance', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', 'sys_patrol_status', 4, 'admin', '2024-06-23 01:59:12', '', '2024-06-23 02:29:14');
INSERT INTO `gen_table_column` VALUES (8, 2, 'device_used', '仪器设备正常使用 1ok 2 no', 'int', 'Long', 'deviceUsed', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', 'sys_patrol_status', 5, 'admin', '2024-06-23 01:59:12', '', '2024-06-23 02:29:14');
INSERT INTO `gen_table_column` VALUES (9, 2, 'device_pickproof', '仪器设备防盗是否完好 1ok 2 no', 'int', 'Long', 'devicePickproof', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', 'sys_patrol_status', 6, 'admin', '2024-06-23 01:59:12', '', '2024-06-23 02:29:14');
INSERT INTO `gen_table_column` VALUES (10, 2, 'goods_put', '物品摆放和清洁卫生 1ok 2 no', 'int', 'Long', 'goodsPut', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', 'sys_patrol_status', 7, 'admin', '2024-06-23 01:59:12', '', '2024-06-23 02:29:14');
INSERT INTO `gen_table_column` VALUES (11, 2, 'patrol_time', '巡查时间', 'datetime', 'Date', 'patrolTime', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'datetime', '', 8, 'admin', '2024-06-23 01:59:12', '', '2024-06-23 02:29:14');
INSERT INTO `gen_table_column` VALUES (12, 2, 'user_id', '巡查人员', 'bigint', 'Long', 'userId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2024-06-23 01:59:12', '', '2024-06-23 02:29:14');
INSERT INTO `gen_table_column` VALUES (13, 2, 'laboratory_id', '实验室ID', 'bigint', 'Long', 'laboratoryId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, '', '2024-06-23 02:09:30', '', '2024-06-23 02:29:14');
INSERT INTO `gen_table_column` VALUES (14, 2, 'door_windows', '门窗完好及关闭 1 ok 2 no', 'int', 'Long', 'doorWindows', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', 'sys_patrol_status', 3, '', '2024-06-23 02:09:30', '', '2024-06-23 02:29:14');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2024-06-22 15:12:56', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2024-06-22 15:12:56', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2024-06-22 15:12:56', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2024-06-22 15:12:56', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2024-06-22 15:12:56', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (6, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2024-06-22 15:12:56', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 200 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '重庆', 0, 'cq', '15888888888', 'cq@qq.com', '0', '0', 'admin', '2024-06-22 15:12:49', 'admin', '2024-06-22 15:22:53');
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '大学', 1, 'dx', '15888888881', 'dx@qq.com', '0', '0', 'admin', '2024-06-22 15:12:49', 'admin', '2024-06-22 15:23:09');
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2024-06-22 15:12:49', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', 'IT部门', 1, 'it', '15888888882', 'it@qq.com', '0', '0', 'admin', '2024-06-22 15:12:49', 'admin', '2024-06-22 15:23:42');
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2024-06-22 15:12:49', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2024-06-22 15:12:49', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2024-06-22 15:12:49', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2024-06-22 15:12:49', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2024-06-22 15:12:49', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2024-06-22 15:12:49', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2024-06-22 15:12:56', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-06-22 15:12:56', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-06-22 15:12:56', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2024-06-22 15:12:56', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2024-06-22 15:12:56', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2024-06-22 15:12:56', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2024-06-22 15:12:56', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2024-06-22 15:12:56', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2024-06-22 15:12:56', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2024-06-22 15:12:56', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2024-06-22 15:12:56', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2024-06-22 15:12:56', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2024-06-22 15:12:56', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2024-06-22 15:12:56', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2024-06-22 15:12:56', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2024-06-22 15:12:56', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2024-06-22 15:12:56', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-06-22 15:12:56', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-06-22 15:12:56', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-06-22 15:12:56', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-06-22 15:12:56', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2024-06-22 15:12:56', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-06-22 15:12:56', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-06-22 15:12:56', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-06-22 15:12:56', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-06-22 15:12:56', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-06-22 15:12:56', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2024-06-22 15:12:56', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2024-06-22 15:12:56', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (100, 1, '是', '1', 'sys_patrol_status', NULL, 'primary', 'N', '0', 'admin', '2024-06-23 02:01:24', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (101, 2, '否', '2', 'sys_patrol_status', NULL, 'danger', 'N', '0', 'admin', '2024-06-23 02:01:38', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2024-06-22 15:12:55', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2024-06-22 15:12:55', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2024-06-22 15:12:55', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2024-06-22 15:12:55', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2024-06-22 15:12:55', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2024-06-22 15:12:55', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2024-06-22 15:12:55', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2024-06-22 15:12:55', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2024-06-22 15:12:55', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2024-06-22 15:12:55', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (100, '巡检状态', 'sys_patrol_status', '0', 'admin', '2024-06-23 02:00:12', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2024-06-22 15:12:57', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2024-06-22 15:12:57', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2024-06-22 15:12:57', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_laboratory
-- ----------------------------
DROP TABLE IF EXISTS `sys_laboratory`;
CREATE TABLE `sys_laboratory`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '实验室名称',
  `user_id` bigint NULL DEFAULT NULL COMMENT '用户Id',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_laboratory
-- ----------------------------
INSERT INTO `sys_laboratory` VALUES (6, '22222', 100, '2024-06-22 23:50:29');
INSERT INTO `sys_laboratory` VALUES (7, '4444', 101, '2024-06-23 00:42:10');
INSERT INTO `sys_laboratory` VALUES (8, '3333', 102, '2024-06-23 11:52:07');

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status`) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-06-22 15:20:10');
INSERT INTO `sys_logininfor` VALUES (101, 'admin1', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-22 16:16:32');
INSERT INTO `sys_logininfor` VALUES (102, 'admin1', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-06-22 16:19:59');
INSERT INTO `sys_logininfor` VALUES (103, 'admin1', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-06-22 16:20:08');
INSERT INTO `sys_logininfor` VALUES (104, 'admin1', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-22 16:20:14');
INSERT INTO `sys_logininfor` VALUES (105, 'admin1', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-22 16:22:38');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2024-06-22 16:32:43');
INSERT INTO `sys_logininfor` VALUES (107, 'admin2', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-06-22 16:32:49');
INSERT INTO `sys_logininfor` VALUES (108, 'admin2', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2024-06-22 16:33:04');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2024-06-22 16:33:09');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2024-06-22 16:33:23');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2024-06-22 16:33:27');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2024-06-22 16:33:33');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2024-06-22 16:33:46');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-06-22 16:33:58');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-23 00:25:46');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2024-06-23 01:58:40');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2024-06-23 01:58:47');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-06-23 01:58:49');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-06-23 03:03:13');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2024-06-23 03:31:47');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-06-23 03:32:51');
INSERT INTO `sys_logininfor` VALUES (122, 'admin1', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-23 03:42:04');
INSERT INTO `sys_logininfor` VALUES (123, 'admin1', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-06-23 03:42:42');
INSERT INTO `sys_logininfor` VALUES (124, 'admin1', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-23 03:42:48');
INSERT INTO `sys_logininfor` VALUES (125, 'admin1', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-06-23 03:46:15');
INSERT INTO `sys_logininfor` VALUES (126, 'admin1', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-23 03:46:20');
INSERT INTO `sys_logininfor` VALUES (127, 'admin1', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-06-23 03:47:33');
INSERT INTO `sys_logininfor` VALUES (128, 'admin2', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-23 03:47:38');
INSERT INTO `sys_logininfor` VALUES (129, 'admin2', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-06-23 03:48:04');
INSERT INTO `sys_logininfor` VALUES (130, 'admin1', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-23 03:48:09');
INSERT INTO `sys_logininfor` VALUES (131, 'admin1', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-06-23 03:51:27');
INSERT INTO `sys_logininfor` VALUES (132, 'admin3', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-23 03:51:34');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` int NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2000 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2024-06-22 15:12:50', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 3, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2024-06-22 15:12:50', 'admin', '2024-06-23 03:36:29', '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 3, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2024-06-22 15:12:50', 'admin', '2024-06-23 03:36:41', '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2024-06-22 15:12:50', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '1', '0', 'system:dept:list', 'tree', 'admin', '2024-06-22 15:12:50', 'admin', '2024-06-23 03:49:42', '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '1', '0', 'system:post:list', 'post', 'admin', '2024-06-22 15:12:50', 'admin', '2024-06-23 03:49:38', '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '1', '0', 'system:dict:list', 'dict', 'admin', '2024-06-22 15:12:50', 'admin', '2024-06-23 03:49:34', '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', 1, 0, 'C', '1', '0', 'system:config:list', 'edit', 'admin', '2024-06-22 15:12:50', 'admin', '2024-06-23 03:49:29', '参数设置菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2024-06-22 15:12:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2024-06-22 15:12:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2024-06-22 15:12:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2024-06-22 15:12:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2024-06-22 15:12:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2024-06-22 15:12:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2024-06-22 15:12:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2024-06-22 15:12:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2024-06-22 15:12:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2024-06-22 15:12:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2024-06-22 15:12:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2024-06-22 15:12:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2024-06-22 15:12:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2024-06-22 15:12:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2024-06-22 15:12:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2024-06-22 15:12:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2024-06-22 15:12:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2024-06-22 15:12:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2024-06-22 15:12:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2024-06-22 15:12:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2024-06-22 15:12:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2024-06-22 15:12:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2024-06-22 15:12:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2024-06-22 15:12:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2024-06-22 15:12:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2024-06-22 15:12:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2024-06-22 15:12:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2024-06-22 15:12:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2024-06-22 15:12:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2024-06-22 15:12:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2024-06-22 15:12:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2024-06-22 15:12:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2024-06-22 15:12:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2024-06-22 15:12:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2024-06-22 15:12:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2003, '实验室', 1, 1, 'laboratory', 'system/laboratory/index', NULL, 1, 0, 'C', '0', '0', 'system:laboratory:list', 'code', 'admin', '2024-06-22 15:36:44', 'admin', '2024-06-22 15:46:50', '实验室菜单');
INSERT INTO `sys_menu` VALUES (2004, '实验室查询', 2003, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:laboratory:query', '#', 'admin', '2024-06-22 15:36:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2005, '实验室新增', 2003, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:laboratory:add', '#', 'admin', '2024-06-22 15:36:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2006, '实验室修改', 2003, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:laboratory:edit', '#', 'admin', '2024-06-22 15:36:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2007, '实验室删除', 2003, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:laboratory:remove', '#', 'admin', '2024-06-22 15:36:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2008, '实验室导出', 2003, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:laboratory:export', '#', 'admin', '2024-06-22 15:36:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2009, '巡查管理', 1, 2, 'patrol', 'system/patrol/index', NULL, 1, 0, 'C', '0', '0', 'system:patrol:list', 'documentation', 'admin', '2024-06-23 02:05:34', 'admin', '2024-06-23 02:07:38', '巡查管理菜单');
INSERT INTO `sys_menu` VALUES (2010, '巡查管理查询', 2009, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:patrol:query', '#', 'admin', '2024-06-23 02:05:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2011, '巡查管理新增', 2009, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:patrol:add', '#', 'admin', '2024-06-23 02:05:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2012, '巡查管理修改', 2009, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:patrol:edit', '#', 'admin', '2024-06-23 02:05:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2013, '巡查管理删除', 2009, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:patrol:remove', '#', 'admin', '2024-06-23 02:05:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2014, '巡查管理导出', 2009, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:patrol:export', '#', 'admin', '2024-06-23 02:05:35', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2024-06-22 15:12:57', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2024-06-22 15:12:57', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type`) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status`) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '创建表', 0, 'com.ruoyi.generator.controller.GenController.createTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/createTable', '127.0.0.1', '内网IP', '{\"sql\":\"CREATE TABLE `sys_laboratory` (\\n  `id` bigint NOT NULL AUTO_INCREMENT COMMENT \'id\',\\n  `name` varchar(255) DEFAULT NULL COMMENT \'实验室名称\',\\n  `user_id` bigint DEFAULT NULL COMMENT \'用户Id\',\\n  `create_time` datetime DEFAULT NULL COMMENT \'创建时间\',\\n  PRIMARY KEY (`id`)\\n) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-22 15:20:31', 433);
INSERT INTO `sys_oper_log` VALUES (101, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[],\"params\":{},\"roleId\":100,\"roleKey\":\"laboratory\",\"roleName\":\"实验室管理员\",\"roleSort\":3,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-22 15:21:48', 64);
INSERT INTO `sys_oper_log` VALUES (102, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-06-22 15:21:48\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[4],\"params\":{},\"roleId\":100,\"roleKey\":\"laboratory\",\"roleName\":\"实验室管理员\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-22 15:21:55', 55);
INSERT INTO `sys_oper_log` VALUES (103, '角色管理', 3, 'com.ruoyi.web.controller.system.SysRoleController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/role/2', '127.0.0.1', '内网IP', '{}', NULL, 1, '普通角色已分配,不能删除', '2024-06-22 15:21:58', 37);
INSERT INTO `sys_oper_log` VALUES (104, '用户管理', 3, 'com.ruoyi.web.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/user/2', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-22 15:22:06', 68);
INSERT INTO `sys_oper_log` VALUES (105, '角色管理', 3, 'com.ruoyi.web.controller.system.SysRoleController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/role/2', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-22 15:22:10', 100);
INSERT INTO `sys_oper_log` VALUES (106, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.dataScope()', 'PUT', 1, 'admin', '研发部门', '/system/role/dataScope', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-06-22 15:21:48\",\"dataScope\":\"5\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"params\":{},\"roleId\":100,\"roleKey\":\"laboratory\",\"roleName\":\"实验室管理员\",\"roleSort\":3,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-22 15:22:19', 47);
INSERT INTO `sys_oper_log` VALUES (107, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dept/109', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-22 15:22:26', 36);
INSERT INTO `sys_oper_log` VALUES (108, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dept/108', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-22 15:22:28', 62);
INSERT INTO `sys_oper_log` VALUES (109, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dept/102', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-22 15:22:29', 81);
INSERT INTO `sys_oper_log` VALUES (110, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dept/107', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-22 15:22:31', 69);
INSERT INTO `sys_oper_log` VALUES (111, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dept/106', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-22 15:22:33', 60);
INSERT INTO `sys_oper_log` VALUES (112, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dept/105', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-22 15:22:34', 49);
INSERT INTO `sys_oper_log` VALUES (113, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dept/104', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-22 15:22:36', 58);
INSERT INTO `sys_oper_log` VALUES (114, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0\",\"children\":[],\"deptId\":100,\"deptName\":\"重庆\",\"email\":\"cq@qq.com\",\"leader\":\"cq\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-22 15:22:53', 51);
INSERT INTO `sys_oper_log` VALUES (115, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100\",\"children\":[],\"deptId\":101,\"deptName\":\"大学\",\"email\":\"dx@qq.com\",\"leader\":\"dx\",\"orderNum\":1,\"params\":{},\"parentId\":100,\"parentName\":\"重庆\",\"phone\":\"15888888881\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-22 15:23:09', 53);
INSERT INTO `sys_oper_log` VALUES (116, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"IT部门\",\"email\":\"it@qq.com\",\"leader\":\"it\",\"orderNum\":1,\"params\":{},\"parentId\":101,\"parentName\":\"大学\",\"phone\":\"15888888882\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-22 15:23:42', 49);
INSERT INTO `sys_oper_log` VALUES (117, '岗位管理', 3, 'com.ruoyi.web.controller.system.SysPostController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/post/2', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-22 15:23:50', 45);
INSERT INTO `sys_oper_log` VALUES (118, '岗位管理', 3, 'com.ruoyi.web.controller.system.SysPostController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/post/3', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-22 15:23:52', 54);
INSERT INTO `sys_oper_log` VALUES (119, '岗位管理', 3, 'com.ruoyi.web.controller.system.SysPostController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/post/4', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-22 15:23:53', 63);
INSERT INTO `sys_oper_log` VALUES (120, '岗位管理', 2, 'com.ruoyi.web.controller.system.SysPostController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/post', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-06-22 15:12:49\",\"flag\":false,\"params\":{},\"postCode\":\"ceo\",\"postId\":1,\"postName\":\"超级管理员\",\"postSort\":1,\"remark\":\"\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-22 15:24:01', 48);
INSERT INTO `sys_oper_log` VALUES (121, '岗位管理', 1, 'com.ruoyi.web.controller.system.SysPostController.add()', 'POST', 1, 'admin', '研发部门', '/system/post', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"flag\":false,\"params\":{},\"postCode\":\"laboratory\",\"postId\":5,\"postName\":\"实验室管理员\",\"postSort\":0,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-22 15:24:18', 36);
INSERT INTO `sys_oper_log` VALUES (122, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":103,\"nickName\":\"管理员一\",\"params\":{},\"postIds\":[5],\"remark\":\"admin1\",\"roleIds\":[100],\"sex\":\"2\",\"status\":\"0\",\"userId\":100,\"userName\":\"admin1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-22 15:25:01', 126);
INSERT INTO `sys_oper_log` VALUES (123, '角色管理', 4, 'com.ruoyi.web.controller.system.SysRoleController.selectAuthUserAll()', 'PUT', 1, 'admin', '研发部门', '/system/role/authUser/selectAll', '127.0.0.1', '内网IP', '{\"roleId\":\"100\",\"userIds\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-22 15:25:57', 29);
INSERT INTO `sys_oper_log` VALUES (124, '角色管理', 4, 'com.ruoyi.web.controller.system.SysRoleController.cancelAuthUser()', 'PUT', 1, 'admin', '研发部门', '/system/role/authUser/cancel', '127.0.0.1', '内网IP', '{\"roleId\":100,\"userId\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-22 15:26:08', 35);
INSERT INTO `sys_oper_log` VALUES (125, '角色管理', 4, 'com.ruoyi.web.controller.system.SysRoleController.selectAuthUserAll()', 'PUT', 1, 'admin', '研发部门', '/system/role/authUser/selectAll', '127.0.0.1', '内网IP', '{\"roleId\":\"100\",\"userIds\":\"100\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-22 15:26:13', 31);
INSERT INTO `sys_oper_log` VALUES (126, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"实验室管理\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"#\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-22 15:27:59', 32);
INSERT INTO `sys_oper_log` VALUES (127, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-06-22 15:27:59\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"实验室管理\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"laboratory\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-22 15:28:16', 31);
INSERT INTO `sys_oper_log` VALUES (128, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"dashboard\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"实验室管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"system:laboratory:view\",\"perms\":\"system:laboratory:view\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-22 15:29:34', 30);
INSERT INTO `sys_oper_log` VALUES (129, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"/system/laboratory/index\",\"createTime\":\"2024-06-22 15:29:34\",\"icon\":\"dashboard\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"实验室管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"laboratory\",\"perms\":\"system:laboratory:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-22 15:30:27', 32);
INSERT INTO `sys_oper_log` VALUES (130, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"/system/patrol/index\",\"createBy\":\"admin\",\"icon\":\"star\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"巡查记录\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2000,\"path\":\"patrol\",\"perms\":\"system:patrol:list\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-22 15:31:34', 36);
INSERT INTO `sys_oper_log` VALUES (131, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"laboratory\",\"className\":\"SysLaboratory\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"id\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-06-22 15:20:31\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"实验室名称\",\"columnId\":2,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-22 15:20:31\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"用户Id\",\"columnId\":3,\"columnName\":\"user_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-06-22 15:20:31\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CreateTime\",\"columnComment\":\"创建时间\",\"columnId\":4,\"columnName\":\"create_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-06-22 15:20:31\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":false,\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"createTime\",\"javaTyp', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-22 15:33:26', 54);
INSERT INTO `sys_oper_log` VALUES (132, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/laboratory/index\",\"createTime\":\"2024-06-22 15:36:44\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2003,\"menuName\":\"实验室\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1,\"path\":\"laboratory\",\"perms\":\"system:laboratory:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-22 15:46:15', 36);
INSERT INTO `sys_oper_log` VALUES (133, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/laboratory/index\",\"createTime\":\"2024-06-22 15:36:44\",\"icon\":\"code\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2003,\"menuName\":\"实验室\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1,\"path\":\"laboratory\",\"perms\":\"system:laboratory:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-22 15:46:50', 33);
INSERT INTO `sys_oper_log` VALUES (134, '实验室', 1, 'com.ruoyi.web.controller.system.SysLaboratoryController.add()', 'POST', 1, 'admin', '研发部门', '/system/laboratory', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-06-22 23:48:32\",\"id\":3,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-22 15:48:32', 48);
INSERT INTO `sys_oper_log` VALUES (135, '实验室', 3, 'com.ruoyi.web.controller.system.SysLaboratoryController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/laboratory/3', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-22 15:48:36', 29);
INSERT INTO `sys_oper_log` VALUES (136, '实验室', 1, 'com.ruoyi.web.controller.system.SysLaboratoryController.add()', 'POST', 1, 'admin', '研发部门', '/system/laboratory', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-06-22 23:49:39\",\"id\":4,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-22 15:49:39', 31);
INSERT INTO `sys_oper_log` VALUES (137, '实验室', 1, 'com.ruoyi.web.controller.system.SysLaboratoryController.add()', 'POST', 1, 'admin', '研发部门', '/system/laboratory', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-06-22 23:50:22\",\"id\":5,\"name\":\"111\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-22 15:50:22', 31);
INSERT INTO `sys_oper_log` VALUES (138, '实验室', 3, 'com.ruoyi.web.controller.system.SysLaboratoryController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/laboratory/4', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-22 15:50:24', 37);
INSERT INTO `sys_oper_log` VALUES (139, '实验室', 1, 'com.ruoyi.web.controller.system.SysLaboratoryController.add()', 'POST', 1, 'admin', '研发部门', '/system/laboratory', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-06-22 23:50:29\",\"id\":6,\"name\":\"22\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-22 15:50:29', 26);
INSERT INTO `sys_oper_log` VALUES (140, '实验室', 2, 'com.ruoyi.web.controller.system.SysLaboratoryController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/laboratory', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-06-22 23:50:22\",\"id\":5,\"name\":\"11133\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-22 15:50:34', 30);
INSERT INTO `sys_oper_log` VALUES (141, '实验室', 3, 'com.ruoyi.web.controller.system.SysLaboratoryController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/laboratory/5', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-22 15:50:43', 42);
INSERT INTO `sys_oper_log` VALUES (142, '实验室', 2, 'com.ruoyi.web.controller.system.SysLaboratoryController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/laboratory', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-06-22 23:50:29\",\"id\":6,\"name\":\"22\",\"params\":{},\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-22 16:08:52', 75);
INSERT INTO `sys_oper_log` VALUES (143, '实验室', 2, 'com.ruoyi.web.controller.system.SysLaboratoryController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/laboratory', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-06-22 23:50:29\",\"id\":6,\"name\":\"22\",\"params\":{},\"userId\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-22 16:09:52', 26);
INSERT INTO `sys_oper_log` VALUES (144, '实验室', 2, 'com.ruoyi.web.controller.system.SysLaboratoryController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/laboratory', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-06-22 23:50:29\",\"id\":6,\"name\":\"22222\",\"params\":{},\"userId\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-22 16:16:07', 40);
INSERT INTO `sys_oper_log` VALUES (145, '实验室', 2, 'com.ruoyi.web.controller.system.SysLaboratoryController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/laboratory', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-06-22 23:50:29\",\"id\":6,\"name\":\"22222\",\"params\":{},\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-22 16:16:10', 29);
INSERT INTO `sys_oper_log` VALUES (146, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-06-22 15:21:48\",\"dataScope\":\"5\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,2003,2004,2005,2006,2007,2008],\"params\":{},\"roleId\":100,\"roleKey\":\"laboratory\",\"roleName\":\"实验室管理员\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-22 16:16:55', 79);
INSERT INTO `sys_oper_log` VALUES (147, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.dataScope()', 'PUT', 1, 'admin', '研发部门', '/system/role/dataScope', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-06-22 15:21:48\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"params\":{},\"roleId\":100,\"roleKey\":\"laboratory\",\"roleName\":\"实验室管理员\",\"roleSort\":3,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-22 16:17:28', 39);
INSERT INTO `sys_oper_log` VALUES (148, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-06-22 15:21:48\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[],\"params\":{},\"roleId\":100,\"roleKey\":\"laboratory\",\"roleName\":\"实验室管理员\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-22 16:20:38', 55);
INSERT INTO `sys_oper_log` VALUES (149, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.dataScope()', 'PUT', 1, 'admin', '研发部门', '/system/role/dataScope', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-06-22 15:21:48\",\"dataScope\":\"5\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"params\":{},\"roleId\":100,\"roleKey\":\"laboratory\",\"roleName\":\"实验室管理员\",\"roleSort\":3,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-22 16:22:17', 41);
INSERT INTO `sys_oper_log` VALUES (150, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-06-22 15:21:48\",\"dataScope\":\"5\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,2003,2004],\"params\":{},\"roleId\":100,\"roleKey\":\"laboratory\",\"roleName\":\"实验室管理员\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-22 16:22:31', 52);
INSERT INTO `sys_oper_log` VALUES (151, '实验室', 2, 'com.ruoyi.web.controller.system.SysLaboratoryController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/laboratory', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-06-22 23:50:29\",\"id\":6,\"name\":\"22222\",\"params\":{},\"userId\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-22 16:31:26', 69);
INSERT INTO `sys_oper_log` VALUES (152, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":103,\"nickName\":\"admin2\",\"params\":{},\"postIds\":[5],\"roleIds\":[100],\"sex\":\"2\",\"status\":\"0\",\"userId\":101,\"userName\":\"admin2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-22 16:32:27', 144);
INSERT INTO `sys_oper_log` VALUES (153, '实验室', 2, 'com.ruoyi.web.controller.system.SysLaboratoryController.edit()', 'PUT', 1, 'admin', 'IT部门', '/system/laboratory', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-06-22 23:50:29\",\"id\":6,\"name\":\"22222\",\"params\":{},\"userId\":101}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-22 16:34:06', 24);
INSERT INTO `sys_oper_log` VALUES (154, '实验室', 2, 'com.ruoyi.web.controller.system.SysLaboratoryController.edit()', 'PUT', 1, 'admin', 'IT部门', '/system/laboratory', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-06-22 23:50:29\",\"id\":6,\"name\":\"22222\",\"params\":{},\"userId\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-22 16:37:05', 29);
INSERT INTO `sys_oper_log` VALUES (155, '实验室', 1, 'com.ruoyi.web.controller.system.SysLaboratoryController.add()', 'POST', 1, 'admin', 'IT部门', '/system/laboratory', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-06-23 00:42:09\",\"id\":7,\"name\":\"4444\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-22 16:42:09', 48);
INSERT INTO `sys_oper_log` VALUES (156, '实验室', 2, 'com.ruoyi.web.controller.system.SysLaboratoryController.edit()', 'PUT', 1, 'admin', 'IT部门', '/system/laboratory', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-06-23 00:42:10\",\"id\":7,\"name\":\"4444\",\"params\":{},\"userId\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-23 00:26:14', 30);
INSERT INTO `sys_oper_log` VALUES (157, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', 'IT部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"sys_patrol\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-23 01:59:12', 120);
INSERT INTO `sys_oper_log` VALUES (158, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', 'IT部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"patrol\",\"className\":\"SysPatrol\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"id\",\"columnId\":5,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-06-23 01:59:12\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"DoorWindows\",\"columnComment\":\"门窗完好及关闭 1 ok 2 no\",\"columnId\":6,\"columnName\":\"door__windows\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-23 01:59:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"doorWindows\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Appliance\",\"columnComment\":\"电器线路 1 ok 2 no\",\"columnId\":7,\"columnName\":\"appliance\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-23 01:59:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"appliance\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"DeviceUsed\",\"columnComment\":\"仪器设备正常使用 1ok 2 no\",\"columnId\":8,\"columnName\":\"device_used\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-23 01:59:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRe', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-23 01:59:27', 72);
INSERT INTO `sys_oper_log` VALUES (159, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', 'IT部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"巡检状态\",\"dictType\":\"sys_patrol_status\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-23 02:00:12', 34);
INSERT INTO `sys_oper_log` VALUES (160, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', 'IT部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"是\",\"dictSort\":1,\"dictType\":\"sys_patrol_status\",\"dictValue\":\"1\",\"listClass\":\"primary\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-23 02:01:24', 45);
INSERT INTO `sys_oper_log` VALUES (161, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', 'IT部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"否\",\"dictSort\":2,\"dictType\":\"sys_patrol_status\",\"dictValue\":\"2\",\"listClass\":\"danger\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-23 02:01:38', 37);
INSERT INTO `sys_oper_log` VALUES (162, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', 'IT部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"patrol\",\"className\":\"SysPatrol\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"id\",\"columnId\":5,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-06-23 01:59:12\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-06-23 01:59:27\",\"usableColumn\":false},{\"capJavaField\":\"DoorWindows\",\"columnComment\":\"门窗完好及关闭 1 ok 2 no\",\"columnId\":6,\"columnName\":\"door__windows\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-23 01:59:12\",\"dictType\":\"sys_patrol_status\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"doorWindows\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-06-23 01:59:27\",\"usableColumn\":false},{\"capJavaField\":\"Appliance\",\"columnComment\":\"电器线路 1 ok 2 no\",\"columnId\":7,\"columnName\":\"appliance\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-23 01:59:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"appliance\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-06-23 01:59:27\",\"usableColumn\":false},{\"capJavaField\":\"DeviceUsed\",\"columnComment\":\"仪器设备正常使用 1ok 2 no\",\"columnId\":8,\"columnName\":\"device_used\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-23 01:59:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-23 02:02:07', 76);
INSERT INTO `sys_oper_log` VALUES (163, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', 'IT部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"patrol\",\"className\":\"SysPatrol\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"id\",\"columnId\":5,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-06-23 01:59:12\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-06-23 02:02:07\",\"usableColumn\":false},{\"capJavaField\":\"DoorWindows\",\"columnComment\":\"门窗完好及关闭 1 ok 2 no\",\"columnId\":6,\"columnName\":\"door__windows\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-23 01:59:12\",\"dictType\":\"sys_patrol_status\",\"edit\":true,\"htmlType\":\"radio\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"doorWindows\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-06-23 02:02:07\",\"usableColumn\":false},{\"capJavaField\":\"Appliance\",\"columnComment\":\"电器线路 1 ok 2 no\",\"columnId\":7,\"columnName\":\"appliance\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-23 01:59:12\",\"dictType\":\"sys_patrol_status\",\"edit\":true,\"htmlType\":\"radio\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"appliance\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-06-23 02:02:07\",\"usableColumn\":false},{\"capJavaField\":\"DeviceUsed\",\"columnComment\":\"仪器设备正常使用 1ok 2 no\",\"columnId\":8,\"columnName\":\"device_used\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-23 01:59:12\",\"dictType\":\"sys', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-23 02:03:23', 81);
INSERT INTO `sys_oper_log` VALUES (164, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', 'IT部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"patrol\",\"className\":\"SysPatrol\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"id\",\"columnId\":5,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-06-23 01:59:12\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-06-23 02:03:23\",\"usableColumn\":false},{\"capJavaField\":\"DoorWindows\",\"columnComment\":\"门窗完好及关闭 1 ok 2 no\",\"columnId\":6,\"columnName\":\"door__windows\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-23 01:59:12\",\"dictType\":\"sys_patrol_status\",\"edit\":true,\"htmlType\":\"radio\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"doorWindows\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-06-23 02:03:23\",\"usableColumn\":false},{\"capJavaField\":\"Appliance\",\"columnComment\":\"电器线路 1 ok 2 no\",\"columnId\":7,\"columnName\":\"appliance\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-23 01:59:12\",\"dictType\":\"sys_patrol_status\",\"edit\":true,\"htmlType\":\"radio\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"appliance\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-06-23 02:03:23\",\"usableColumn\":false},{\"capJavaField\":\"DeviceUsed\",\"columnComment\":\"仪器设备正常使用 1ok 2 no\",\"columnId\":8,\"columnName\":\"device_used\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-23 01:59:12\",\"dictType\":\"sys', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-23 02:05:17', 83);
INSERT INTO `sys_oper_log` VALUES (165, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', 'IT部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/patrol/index\",\"createTime\":\"2024-06-23 02:05:34\",\"icon\":\"documentation\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2009,\"menuName\":\"巡查管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":1,\"path\":\"patrol\",\"perms\":\"system:patrol:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-23 02:07:38', 50);
INSERT INTO `sys_oper_log` VALUES (166, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', 'IT部门', '/tool/gen/synchDb/sys_patrol', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-23 02:09:30', 253);
INSERT INTO `sys_oper_log` VALUES (167, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', 'IT部门', '/tool/gen/synchDb/sys_laboratory', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-23 02:09:41', 111);
INSERT INTO `sys_oper_log` VALUES (168, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', 'IT部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"laboratory\",\"className\":\"SysLaboratory\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"id\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-06-22 15:20:31\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-06-23 02:09:41\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"实验室名称\",\"columnId\":2,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-22 15:20:31\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-06-23 02:09:41\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"用户Id\",\"columnId\":3,\"columnName\":\"user_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-06-22 15:20:31\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-06-23 02:09:41\",\"usableColumn\":false},{\"capJavaField\":\"CreateTime\",\"columnComment\":\"创建时间\",\"columnId\":4,\"columnName\":\"create_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-06-22 15:20:31\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isInc', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-23 02:10:07', 60);
INSERT INTO `sys_oper_log` VALUES (169, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', 'IT部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"patrol\",\"className\":\"SysPatrol\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"id\",\"columnId\":5,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-06-23 01:59:12\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-06-23 02:09:30\",\"usableColumn\":false},{\"capJavaField\":\"LaboratoryId\",\"columnComment\":\"实验室ID\",\"columnId\":13,\"columnName\":\"laboratory_id\",\"columnType\":\"bigint\",\"createBy\":\"\",\"createTime\":\"2024-06-23 02:09:30\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"laboratoryId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"DoorWindows\",\"columnComment\":\"门窗完好及关闭 1 ok 2 no\",\"columnId\":14,\"columnName\":\"door_windows\",\"columnType\":\"int\",\"createBy\":\"\",\"createTime\":\"2024-06-23 02:09:30\",\"dictType\":\"sys_patrol_status\",\"edit\":true,\"htmlType\":\"radio\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"doorWindows\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Appliance\",\"columnComment\":\"电器线路 1 ok 2 no\",\"columnId\":7,\"columnName\":\"appliance\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-23 01:59:12\",\"dictType\":\"sys_patrol_status\",\"edit\":true,\"htmlType\":\"radio\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncr', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-23 02:22:20', 91);
INSERT INTO `sys_oper_log` VALUES (170, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', 'IT部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"patrol\",\"className\":\"SysPatrol\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"id\",\"columnId\":5,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-06-23 01:59:12\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-06-23 02:22:20\",\"usableColumn\":false},{\"capJavaField\":\"LaboratoryId\",\"columnComment\":\"实验室ID\",\"columnId\":13,\"columnName\":\"laboratory_id\",\"columnType\":\"bigint\",\"createBy\":\"\",\"createTime\":\"2024-06-23 02:09:30\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"laboratoryId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-06-23 02:22:20\",\"usableColumn\":false},{\"capJavaField\":\"DoorWindows\",\"columnComment\":\"门窗完好及关闭 1 ok 2 no\",\"columnId\":14,\"columnName\":\"door_windows\",\"columnType\":\"int\",\"createBy\":\"\",\"createTime\":\"2024-06-23 02:09:30\",\"dictType\":\"sys_patrol_status\",\"edit\":true,\"htmlType\":\"radio\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"doorWindows\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-06-23 02:22:20\",\"usableColumn\":false},{\"capJavaField\":\"Appliance\",\"columnComment\":\"电器线路 1 ok 2 no\",\"columnId\":7,\"columnName\":\"appliance\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-23 01:59:12\",\"dictType\":\"sys_patrol_status\",\"edit\":true,\"ht', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-23 02:29:14', 99);
INSERT INTO `sys_oper_log` VALUES (171, '巡查管理', 1, 'com.ruoyi.web.controller.system.SysPatrolController.add()', 'POST', 1, 'admin', 'IT部门', '/system/patrol', '127.0.0.1', '内网IP', '{\"params\":{}}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\r\n### The error may exist in file [C:\\Users\\lizemin\\Desktop\\youran\\ruoyi-system\\target\\classes\\mapper\\system\\SysPatrolMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysPatrolMapper.insertSysPatrol-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_patrol\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1', '2024-06-23 02:34:00', 56);
INSERT INTO `sys_oper_log` VALUES (172, '巡查管理', 1, 'com.ruoyi.web.controller.system.SysPatrolController.add()', 'POST', 1, 'admin', 'IT部门', '/system/patrol', '127.0.0.1', '内网IP', '{\"params\":{}}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\r\n### The error may exist in file [C:\\Users\\lizemin\\Desktop\\youran\\ruoyi-system\\target\\classes\\mapper\\system\\SysPatrolMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysPatrolMapper.insertSysPatrol-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_patrol\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1', '2024-06-23 02:34:01', 6);
INSERT INTO `sys_oper_log` VALUES (173, '巡查管理', 1, 'com.ruoyi.web.controller.system.SysPatrolController.add()', 'POST', 1, 'admin', 'IT部门', '/system/patrol', '127.0.0.1', '内网IP', '{\"params\":{}}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\r\n### The error may exist in file [C:\\Users\\lizemin\\Desktop\\youran\\ruoyi-system\\target\\classes\\mapper\\system\\SysPatrolMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysPatrolMapper.insertSysPatrol-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_patrol\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1', '2024-06-23 02:37:44', 10);
INSERT INTO `sys_oper_log` VALUES (174, '巡查管理', 1, 'com.ruoyi.web.controller.system.SysPatrolController.add()', 'POST', 1, 'admin', 'IT部门', '/system/patrol', '127.0.0.1', '内网IP', '{\"params\":{}}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\r\n### The error may exist in file [C:\\Users\\lizemin\\Desktop\\youran\\ruoyi-system\\target\\classes\\mapper\\system\\SysPatrolMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysPatrolMapper.insertSysPatrol-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_patrol\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1', '2024-06-23 03:03:23', 55);
INSERT INTO `sys_oper_log` VALUES (175, '巡查管理', 1, 'com.ruoyi.web.controller.system.SysPatrolController.add()', 'POST', 1, 'admin', 'IT部门', '/system/patrol', '127.0.0.1', '内网IP', '{\"params\":{}}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\r\n### The error may exist in file [C:\\Users\\lizemin\\Desktop\\youran\\ruoyi-system\\target\\classes\\mapper\\system\\SysPatrolMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysPatrolMapper.insertSysPatrol-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_patrol\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1', '2024-06-23 03:03:53', 16);
INSERT INTO `sys_oper_log` VALUES (176, '巡查管理', 1, 'com.ruoyi.web.controller.system.SysPatrolController.add()', 'POST', 1, 'admin', 'IT部门', '/system/patrol', '127.0.0.1', '内网IP', '{\"params\":{}}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\r\n### The error may exist in file [C:\\Users\\lizemin\\Desktop\\youran\\ruoyi-system\\target\\classes\\mapper\\system\\SysPatrolMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysPatrolMapper.insertSysPatrol-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_patrol\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1', '2024-06-23 03:03:59', 5);
INSERT INTO `sys_oper_log` VALUES (177, '巡查管理', 1, 'com.ruoyi.web.controller.system.SysPatrolController.add()', 'POST', 1, 'admin', 'IT部门', '/system/patrol', '127.0.0.1', '内网IP', '{\"params\":{}}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\r\n### The error may exist in file [C:\\Users\\lizemin\\Desktop\\youran\\ruoyi-system\\target\\classes\\mapper\\system\\SysPatrolMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysPatrolMapper.insertSysPatrol-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_patrol\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1', '2024-06-23 03:04:18', 11);
INSERT INTO `sys_oper_log` VALUES (178, '巡查管理', 1, 'com.ruoyi.web.controller.system.SysPatrolController.add()', 'POST', 1, 'admin', 'IT部门', '/system/patrol', '127.0.0.1', '内网IP', '{\"params\":{}}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\r\n### The error may exist in file [C:\\Users\\lizemin\\Desktop\\youran\\ruoyi-system\\target\\classes\\mapper\\system\\SysPatrolMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysPatrolMapper.insertSysPatrol-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_patrol\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1', '2024-06-23 03:06:01', 16);
INSERT INTO `sys_oper_log` VALUES (179, '巡查管理', 1, 'com.ruoyi.web.controller.system.SysPatrolController.add()', 'POST', 1, 'admin', 'IT部门', '/system/patrol', '127.0.0.1', '内网IP', '{\"appliance\":1,\"devicePickproof\":1,\"deviceUsed\":1,\"doorWindows\":1,\"goodsPut\":1,\"id\":1,\"laboratoryId\":6,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-23 03:08:16', 32);
INSERT INTO `sys_oper_log` VALUES (180, '巡查管理', 1, 'com.ruoyi.web.controller.system.SysPatrolController.add()', 'POST', 1, 'admin', 'IT部门', '/system/patrol', '127.0.0.1', '内网IP', '{\"appliance\":1,\"devicePickproof\":2,\"deviceUsed\":2,\"doorWindows\":1,\"goodsPut\":2,\"id\":2,\"laboratoryId\":6,\"params\":{},\"patrolTime\":\"2024-06-23\",\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-23 03:23:31', 54);
INSERT INTO `sys_oper_log` VALUES (181, '巡查管理', 5, 'com.ruoyi.web.controller.system.SysPatrolController.export()', 'POST', 1, 'admin', 'IT部门', '/system/patrol/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2024-06-23 03:28:13', 1660);
INSERT INTO `sys_oper_log` VALUES (182, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', 'IT部门', '/system/menu/4', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-23 03:33:05', 73);
INSERT INTO `sys_oper_log` VALUES (183, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', 'IT部门', '/system/menu/3', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}', 0, NULL, '2024-06-23 03:33:11', 9);
INSERT INTO `sys_oper_log` VALUES (184, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', 'IT部门', '/system/menu/117', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-23 03:33:14', 30);
INSERT INTO `sys_oper_log` VALUES (185, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', 'IT部门', '/system/menu/116', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}', 0, NULL, '2024-06-23 03:33:15', 7);
INSERT INTO `sys_oper_log` VALUES (186, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', 'IT部门', '/system/menu/1055', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-23 03:33:21', 32);
INSERT INTO `sys_oper_log` VALUES (187, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', 'IT部门', '/system/menu/1056', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-23 03:33:24', 66);
INSERT INTO `sys_oper_log` VALUES (188, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', 'IT部门', '/system/menu/1057', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-23 03:33:26', 50);
INSERT INTO `sys_oper_log` VALUES (189, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', 'IT部门', '/system/menu/1058', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-23 03:33:28', 46);
INSERT INTO `sys_oper_log` VALUES (190, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', 'IT部门', '/system/menu/1059', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-23 03:33:29', 55);
INSERT INTO `sys_oper_log` VALUES (191, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', 'IT部门', '/system/menu/1060', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-23 03:33:30', 37);
INSERT INTO `sys_oper_log` VALUES (192, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', 'IT部门', '/system/menu/116', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-23 03:33:31', 50);
INSERT INTO `sys_oper_log` VALUES (193, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', 'IT部门', '/system/menu/115', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-23 03:33:33', 52);
INSERT INTO `sys_oper_log` VALUES (194, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', 'IT部门', '/system/menu/3', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-23 03:33:34', 47);
INSERT INTO `sys_oper_log` VALUES (195, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', 'IT部门', '/system/menu/109', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}', 0, NULL, '2024-06-23 03:33:38', 7);
INSERT INTO `sys_oper_log` VALUES (196, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', 'IT部门', '/system/menu/113', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-23 03:33:40', 32);
INSERT INTO `sys_oper_log` VALUES (197, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', 'IT部门', '/system/menu/112', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-23 03:33:42', 54);
INSERT INTO `sys_oper_log` VALUES (198, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', 'IT部门', '/system/menu/114', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-23 03:33:43', 47);
INSERT INTO `sys_oper_log` VALUES (199, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', 'IT部门', '/system/menu/111', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-23 03:33:44', 48);
INSERT INTO `sys_oper_log` VALUES (200, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', 'IT部门', '/system/menu/1049', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-23 03:33:47', 48);
INSERT INTO `sys_oper_log` VALUES (201, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', 'IT部门', '/system/menu/1050', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-23 03:33:48', 51);
INSERT INTO `sys_oper_log` VALUES (202, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', 'IT部门', '/system/menu/1051', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-23 03:33:49', 46);
INSERT INTO `sys_oper_log` VALUES (203, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', 'IT部门', '/system/menu/1052', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-23 03:33:51', 46);
INSERT INTO `sys_oper_log` VALUES (204, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', 'IT部门', '/system/menu/1053', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-23 03:33:52', 49);
INSERT INTO `sys_oper_log` VALUES (205, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', 'IT部门', '/system/menu/1054', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-23 03:33:55', 68);
INSERT INTO `sys_oper_log` VALUES (206, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', 'IT部门', '/system/menu/110', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-23 03:33:56', 45);
INSERT INTO `sys_oper_log` VALUES (207, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', 'IT部门', '/system/menu/1046', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-23 03:33:59', 42);
INSERT INTO `sys_oper_log` VALUES (208, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', 'IT部门', '/system/menu/1047', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-23 03:34:00', 42);
INSERT INTO `sys_oper_log` VALUES (209, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', 'IT部门', '/system/menu/1048', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-23 03:34:02', 43);
INSERT INTO `sys_oper_log` VALUES (210, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', 'IT部门', '/system/menu/109', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-23 03:34:03', 40);
INSERT INTO `sys_oper_log` VALUES (211, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', 'IT部门', '/system/menu/2', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-23 03:34:05', 45);
INSERT INTO `sys_oper_log` VALUES (212, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', 'IT部门', '/system/menu/501', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-23 03:35:04', 38);
INSERT INTO `sys_oper_log` VALUES (213, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', 'IT部门', '/system/menu/1040', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-23 03:35:08', 54);
INSERT INTO `sys_oper_log` VALUES (214, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', 'IT部门', '/system/menu/1039', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-23 03:35:16', 53);
INSERT INTO `sys_oper_log` VALUES (215, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', 'IT部门', '/system/menu/500', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-23 03:35:19', 45);
INSERT INTO `sys_oper_log` VALUES (216, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', 'IT部门', '/system/menu/108', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-23 03:35:21', 71);
INSERT INTO `sys_oper_log` VALUES (217, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', 'IT部门', '/system/menu/1038', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-23 03:35:24', 47);
INSERT INTO `sys_oper_log` VALUES (218, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', 'IT部门', '/system/menu/1037', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-23 03:35:26', 48);
INSERT INTO `sys_oper_log` VALUES (219, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', 'IT部门', '/system/menu/1036', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-23 03:35:27', 58);
INSERT INTO `sys_oper_log` VALUES (220, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', 'IT部门', '/system/menu/1035', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-23 03:35:29', 62);
INSERT INTO `sys_oper_log` VALUES (221, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', 'IT部门', '/system/menu/107', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-23 03:35:33', 45);
INSERT INTO `sys_oper_log` VALUES (222, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', 'IT部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/user/index\",\"createTime\":\"2024-06-22 15:12:50\",\"icon\":\"user\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":100,\"menuName\":\"用户管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":1,\"path\":\"user\",\"perms\":\"system:user:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-23 03:36:20', 33);
INSERT INTO `sys_oper_log` VALUES (223, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', 'IT部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/user/index\",\"createTime\":\"2024-06-22 15:12:50\",\"icon\":\"user\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":100,\"menuName\":\"用户管理\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":1,\"path\":\"user\",\"perms\":\"system:user:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-23 03:36:29', 27);
INSERT INTO `sys_oper_log` VALUES (224, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', 'IT部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/role/index\",\"createTime\":\"2024-06-22 15:12:50\",\"icon\":\"peoples\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":101,\"menuName\":\"角色管理\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":1,\"path\":\"role\",\"perms\":\"system:role:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-23 03:36:41', 33);
INSERT INTO `sys_oper_log` VALUES (225, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', 'IT部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-06-22 15:21:48\",\"dataScope\":\"5\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,2003,2009,2004,2010,2014],\"params\":{},\"roleId\":100,\"roleKey\":\"laboratory\",\"roleName\":\"实验室管理员\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-23 03:42:28', 71);
INSERT INTO `sys_oper_log` VALUES (226, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', 'IT部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-06-22 15:21:48\",\"dataScope\":\"5\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,2003,2009,2004,2010,2011,2014],\"params\":{},\"roleId\":100,\"roleKey\":\"laboratory\",\"roleName\":\"实验室管理员\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-23 03:46:10', 81);
INSERT INTO `sys_oper_log` VALUES (227, '巡查管理', 1, 'com.ruoyi.web.controller.system.SysPatrolController.add()', 'POST', 1, 'admin1', 'IT部门', '/system/patrol', '127.0.0.1', '内网IP', '{\"appliance\":2,\"devicePickproof\":2,\"deviceUsed\":2,\"doorWindows\":2,\"goodsPut\":2,\"id\":3,\"laboratoryId\":6,\"params\":{},\"patrolTime\":\"2024-06-23\",\"userId\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-23 03:46:27', 51);
INSERT INTO `sys_oper_log` VALUES (228, '巡查管理', 5, 'com.ruoyi.web.controller.system.SysPatrolController.export()', 'POST', 1, 'admin1', 'IT部门', '/system/patrol/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2024-06-23 03:46:50', 2332);
INSERT INTO `sys_oper_log` VALUES (229, '实验室', 2, 'com.ruoyi.web.controller.system.SysLaboratoryController.edit()', 'PUT', 1, 'admin', 'IT部门', '/system/laboratory', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-06-23 00:42:10\",\"id\":7,\"name\":\"4444\",\"params\":{},\"userId\":101}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-23 03:47:50', 26);
INSERT INTO `sys_oper_log` VALUES (230, '巡查管理', 1, 'com.ruoyi.web.controller.system.SysPatrolController.add()', 'POST', 1, 'admin2', 'IT部门', '/system/patrol', '127.0.0.1', '内网IP', '{\"appliance\":1,\"devicePickproof\":2,\"deviceUsed\":2,\"doorWindows\":1,\"goodsPut\":2,\"id\":4,\"laboratoryId\":7,\"params\":{},\"patrolTime\":\"2024-06-23\",\"userId\":101}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-23 03:47:57', 32);
INSERT INTO `sys_oper_log` VALUES (231, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', 'IT部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/config/index\",\"createTime\":\"2024-06-22 15:12:50\",\"icon\":\"edit\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":106,\"menuName\":\"参数设置\",\"menuType\":\"C\",\"orderNum\":7,\"params\":{},\"parentId\":1,\"path\":\"config\",\"perms\":\"system:config:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-23 03:49:29', 36);
INSERT INTO `sys_oper_log` VALUES (232, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', 'IT部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/dict/index\",\"createTime\":\"2024-06-22 15:12:50\",\"icon\":\"dict\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":105,\"menuName\":\"字典管理\",\"menuType\":\"C\",\"orderNum\":6,\"params\":{},\"parentId\":1,\"path\":\"dict\",\"perms\":\"system:dict:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-23 03:49:35', 38);
INSERT INTO `sys_oper_log` VALUES (233, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', 'IT部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/post/index\",\"createTime\":\"2024-06-22 15:12:50\",\"icon\":\"post\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":104,\"menuName\":\"岗位管理\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":1,\"path\":\"post\",\"perms\":\"system:post:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-23 03:49:38', 36);
INSERT INTO `sys_oper_log` VALUES (234, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', 'IT部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/dept/index\",\"createTime\":\"2024-06-22 15:12:50\",\"icon\":\"tree\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":103,\"menuName\":\"部门管理\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":1,\"path\":\"dept\",\"perms\":\"system:dept:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-23 03:49:42', 26);
INSERT INTO `sys_oper_log` VALUES (235, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', 'IT部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":103,\"nickName\":\"管理员三\",\"params\":{},\"postIds\":[],\"roleIds\":[],\"status\":\"0\",\"userId\":102,\"userName\":\"admin3\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-23 03:50:44', 105);
INSERT INTO `sys_oper_log` VALUES (236, '角色管理', 4, 'com.ruoyi.web.controller.system.SysRoleController.selectAuthUserAll()', 'PUT', 1, 'admin', 'IT部门', '/system/role/authUser/selectAll', '127.0.0.1', '内网IP', '{\"roleId\":\"100\",\"userIds\":\"102\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-23 03:50:55', 30);
INSERT INTO `sys_oper_log` VALUES (237, '实验室', 1, 'com.ruoyi.web.controller.system.SysLaboratoryController.add()', 'POST', 1, 'admin', 'IT部门', '/system/laboratory', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-06-23 11:52:06\",\"id\":8,\"name\":\"3333\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-23 03:52:06', 27);
INSERT INTO `sys_oper_log` VALUES (238, '实验室', 2, 'com.ruoyi.web.controller.system.SysLaboratoryController.edit()', 'PUT', 1, 'admin', 'IT部门', '/system/laboratory', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-06-23 11:52:07\",\"id\":8,\"name\":\"3333\",\"params\":{},\"userId\":102}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-23 03:52:11', 32);
INSERT INTO `sys_oper_log` VALUES (239, '巡查管理', 1, 'com.ruoyi.web.controller.system.SysPatrolController.add()', 'POST', 1, 'admin3', 'IT部门', '/system/patrol', '127.0.0.1', '内网IP', '{\"appliance\":1,\"devicePickproof\":2,\"deviceUsed\":2,\"doorWindows\":1,\"goodsPut\":2,\"id\":5,\"laboratoryId\":8,\"params\":{},\"patrolTime\":\"2024-06-23\",\"userId\":102}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-23 03:52:20', 23);

-- ----------------------------
-- Table structure for sys_patrol
-- ----------------------------
DROP TABLE IF EXISTS `sys_patrol`;
CREATE TABLE `sys_patrol`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `laboratory_id` bigint NULL DEFAULT NULL COMMENT '实验室ID',
  `door_windows` int NULL DEFAULT NULL COMMENT '门窗完好及关闭 1 ok 2 no',
  `appliance` int NULL DEFAULT NULL COMMENT '电器线路 1 ok 2 no',
  `device_used` int NULL DEFAULT NULL COMMENT '仪器设备正常使用 1ok 2 no',
  `device_pickproof` int NULL DEFAULT NULL COMMENT '仪器设备防盗是否完好 1ok 2 no',
  `goods_put` int NULL DEFAULT NULL COMMENT '物品摆放和清洁卫生 1ok 2 no',
  `patrol_time` datetime NULL DEFAULT NULL COMMENT '巡查时间',
  `user_id` bigint NULL DEFAULT NULL COMMENT '巡查人员',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '巡查管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_patrol
-- ----------------------------
INSERT INTO `sys_patrol` VALUES (1, 6, 1, 1, 1, 1, 1, NULL, NULL);
INSERT INTO `sys_patrol` VALUES (2, 6, 1, 1, 2, 2, 2, '2024-06-23 11:23:31', 1);
INSERT INTO `sys_patrol` VALUES (3, 6, 2, 2, 2, 2, 2, '2024-06-23 11:46:28', 100);
INSERT INTO `sys_patrol` VALUES (4, 7, 1, 1, 2, 2, 2, '2024-06-23 11:47:58', 101);
INSERT INTO `sys_patrol` VALUES (5, 8, 1, 1, 2, 2, 2, '2024-06-23 11:52:21', 102);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '超级管理员', 1, '0', 'admin', '2024-06-22 15:12:49', 'admin', '2024-06-22 15:24:01', '');
INSERT INTO `sys_post` VALUES (5, 'laboratory', '实验室管理员', 0, '0', 'admin', '2024-06-22 15:24:18', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2024-06-22 15:12:49', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '2', 'admin', '2024-06-22 15:12:50', '', NULL, '普通角色');
INSERT INTO `sys_role` VALUES (100, '实验室管理员', 'laboratory', 3, '5', 1, 1, '0', '0', 'admin', '2024-06-22 15:21:48', 'admin', '2024-06-23 03:46:10', NULL);

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (100, 1);
INSERT INTO `sys_role_menu` VALUES (100, 2003);
INSERT INTO `sys_role_menu` VALUES (100, 2004);
INSERT INTO `sys_role_menu` VALUES (100, 2009);
INSERT INTO `sys_role_menu` VALUES (100, 2010);
INSERT INTO `sys_role_menu` VALUES (100, 2011);
INSERT INTO `sys_role_menu` VALUES (100, 2014);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '超级管理员', '00', 'super@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2024-06-23 11:32:52', 'admin', '2024-06-22 15:12:49', '', '2024-06-23 03:32:51', '管理员');
INSERT INTO `sys_user` VALUES (100, 103, 'admin1', '管理员一', '00', '', '', '2', '', '$2a$10$zpsSDF8EEhyikfTOrXJD9Oq1v3RHcgXB/Tmon/eujSc847iOd9Du.', '0', '0', '127.0.0.1', '2024-06-23 11:48:09', 'admin', '2024-06-22 15:25:01', '', '2024-06-23 03:48:09', 'admin1');
INSERT INTO `sys_user` VALUES (101, 103, 'admin2', '管理员二', '00', '', '', '2', '', '$2a$10$t7VlNVjZkO4S00OF0r477Obv0UP9E5f/8anp4mZ22BDYUFMHNOcVu', '0', '0', '127.0.0.1', '2024-06-23 11:47:38', 'admin', '2024-06-22 16:32:27', '', '2024-06-23 03:47:38', NULL);
INSERT INTO `sys_user` VALUES (102, 103, 'admin3', '管理员三', '00', '', '', '0', '', '$2a$10$d.slE/Cwe2pHbdD5p7AAhe83lgsbyfDy8qsfgzUrXGDKucznzCguC', '0', '0', '127.0.0.1', '2024-06-23 11:51:35', 'admin', '2024-06-23 03:50:44', '', '2024-06-23 03:51:34', NULL);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (100, 5);
INSERT INTO `sys_user_post` VALUES (101, 5);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (1, 100);
INSERT INTO `sys_user_role` VALUES (100, 100);
INSERT INTO `sys_user_role` VALUES (101, 100);
INSERT INTO `sys_user_role` VALUES (102, 100);

SET FOREIGN_KEY_CHECKS = 1;
