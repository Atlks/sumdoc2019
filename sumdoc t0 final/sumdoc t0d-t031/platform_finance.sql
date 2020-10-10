/*
 Navicat Premium Data Transfer

 Source Server         : dev 192.168.0.2
 Source Server Type    : MySQL
 Source Server Version : 50644
 Source Host           : 192.168.0.2:3306
 Source Schema         : platform_finance

 Target Server Type    : MySQL
 Target Server Version : 50644
 File Encoding         : 65001

 Date: 19/10/2019 10:55:46
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for fs_account_t
-- ----------------------------
DROP TABLE IF EXISTS `fs_account_t`;
CREATE TABLE `fs_account_t`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `account_no` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '卡号',
  `account_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `bank_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所属银行',
  `bank_code` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所属银行Code',
  `tools_id` bigint(20) NULL DEFAULT NULL COMMENT '配置表id',
  `create_timestamp` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_timestamp` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `statuss` int(11) NULL DEFAULT NULL COMMENT '状态：1.默认',
  `is_deleted` int(11) NULL DEFAULT NULL COMMENT '逻辑删除 1启用，2禁用',
  `icon_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图标url',
  `qr_code_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '二维码url',
  `bank_address` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '银行地址',
  `account_type` int(11) NULL DEFAULT NULL COMMENT '账号类型1 QQ 2 支付宝 3 微信',
  `account_type_str` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '账号类型str',
  `title` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标题',
  `platform_id` bigint(20) NULL DEFAULT NULL,
  `sort_by` int(11) NULL DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 214130418448912388 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '收款账号表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for fs_account_tools_t
-- ----------------------------
DROP TABLE IF EXISTS `fs_account_tools_t`;
CREATE TABLE `fs_account_tools_t`  (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `type` int(11) NULL DEFAULT NULL COMMENT '1 银行卡转账 2 云闪付 3 微信转账 4 支付宝转账 5 微信支付 6 支付宝支付 7 代理充值',
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `icon_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图片url',
  `max_val` int(11) NULL DEFAULT NULL COMMENT '最大值',
  `min_val` int(11) NULL DEFAULT NULL COMMENT '最小值',
  `create_timestamp` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_timestamp` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `statuss` int(11) NULL DEFAULT NULL COMMENT '状态：1.默认',
  `is_deleted` int(11) NULL DEFAULT NULL COMMENT '逻辑删除 1启用，2禁用',
  `offer` int(11) NULL DEFAULT NULL COMMENT '优惠标识 1启用，2禁用',
  `offer_str` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '优惠备注',
  `type_page` int(11) NULL DEFAULT NULL COMMENT ' 1 表示线上（银行卡转账）2 线下(2 云闪付 3 微信转账 4 支付宝转账 5 微信支付 6 支付宝支付),3 代理(代理充值)',
  `platform_id` bigint(20) NULL DEFAULT NULL,
  `sort_by` int(11) NULL DEFAULT NULL COMMENT '排序',
  `pay_platform_id` bigint(20) NULL DEFAULT NULL COMMENT '支付平台ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '收款支付方式配置表， 多个支付平台里面的支付类型\r\n 例： 微信 300-5000 支付平台 A ， 微信 300-5000 支付平台 B' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for fs_account_value_t
-- ----------------------------
DROP TABLE IF EXISTS `fs_account_value_t`;
CREATE TABLE `fs_account_value_t`  (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `value` int(11) NULL DEFAULT NULL COMMENT '值: 100 500 1000 2000',
  `tools_id` bigint(20) NULL DEFAULT NULL COMMENT '配置表id',
  `update_timestamp` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `create_timestamp` datetime(0) NULL DEFAULT NULL COMMENT '充值时间',
  `is_deleted` int(11) NULL DEFAULT NULL COMMENT '无效字段',
  `platform_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '最大最小值区间表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for fs_book_t
-- ----------------------------
DROP TABLE IF EXISTS `fs_book_t`;
CREATE TABLE `fs_book_t`  (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `balance` bigint(20) NULL DEFAULT NULL COMMENT '余额',
  `balance_number` bigint(20) NULL DEFAULT NULL COMMENT '上分登入冻结金额',
  `balance_safe` bigint(20) NULL DEFAULT NULL COMMENT '保险箱可用余额',
  `money_extract` bigint(20) NULL DEFAULT NULL COMMENT '提现冻结金额/登入游戏冻结金额',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户id',
  `platform_id` bigint(20) NULL DEFAULT NULL COMMENT '平台Id',
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户name',
  `create_timestamp` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_timestamp` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `is_deleted` int(11) NULL DEFAULT NULL COMMENT '无效字段',
  `statuss` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '无效字段',
  `extract_pwd` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '提现密码',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id_index`(`user_id`) USING BTREE,
  INDEX `platform_id_index`(`platform_id`) USING BTREE,
  INDEX `statuss_index`(`statuss`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '我的账本' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for fs_business_t
-- ----------------------------
DROP TABLE IF EXISTS `fs_business_t`;
CREATE TABLE `fs_business_t`  (
  `id` bigint(20) NOT NULL,
  `code` bigint(20) NULL DEFAULT NULL COMMENT '单号',
  `amount` bigint(20) NULL DEFAULT NULL COMMENT '预充值金额',
  `create_timestamp` datetime(0) NULL DEFAULT NULL COMMENT '充值时间',
  `update_timestamp` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `statuss` int(11) NULL DEFAULT NULL COMMENT '状态：101 入账核查中、102 入账成功、103 入账失败、104 入账取消\r\n            201 正在出款、202 成功出款、203 退回出款、204 拒绝出款',
  `statuss_str` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态str',
  `actual_amount` bigint(20) NULL DEFAULT NULL COMMENT '实际收款金额',
  `pay_timestamp` datetime(0) NULL DEFAULT NULL COMMENT '实际到账时间',
  `type_all` int(11) NULL DEFAULT NULL COMMENT '大类key',
  `type_all_str` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '大类 1 会员充值、2 系统可用余额累加、3 活动-可用余额累加、4 可用余额累减、5 可用提现',
  `type` int(11) NULL DEFAULT NULL COMMENT '类型：1 登入、2 登出、3 充值、4 提现、5 人工取款、6 会员取款、7 领取佣金、8 红包、9 保险箱记录、10 结算入账、11 领取洗码、12 赠送彩金、13 活动优惠、14 人工存入、15 会员充值',
  `type_str` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型name',
  `sys_key` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付系统key',
  `trading_manner` int(11) NULL DEFAULT NULL COMMENT '交易方式：1. 银行转账 2. 云闪付转账 3.微信转账 4. 支付宝转账 5. 微信支付 6. 支付宝支付 7 代理充值',
  `trading_manner_str` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '交易方式str',
  `trading_manner_off_str` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '交易方式优惠str',
  `pay_remarks` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '付款信息/卡号、姓名后4位',
  `pay_account` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '付款账号',
  `pay_bank_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '付款账号所属支行code',
  `pay_bank` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '付款账号所属支行',
  `pay_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '付款人名字',
  `receipt_account` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收款账号',
  `receipt_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收款人名字',
  `receipt_bank_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收款账号所属支行code',
  `receipt_bank` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收款账号所属支行',
  `pay_code` bigint(20) NULL DEFAULT NULL COMMENT '支付单号',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户id',
  `platform_id` bigint(20) NULL DEFAULT NULL COMMENT '平台Id',
  `pay_status` int(11) NULL DEFAULT NULL COMMENT '支付状态： 1 成功 2 失败 3 等待',
  `pay_status_str` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付状态str',
  `update_by` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_by_id` bigint(20) NULL DEFAULT NULL COMMENT '更新人ID',
  `file_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付凭证附件URL',
  `is_deleted` int(11) NULL DEFAULT NULL COMMENT '无效字段',
  `status_code` int(1) NULL DEFAULT NULL COMMENT '打码状态 0 未同步 1 满足 2 不满足',
  `status_code_str` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '打码状态 0 未同步 1 满足 2 不满足',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `code_index`(`code`) USING BTREE,
  INDEX `statuss_index`(`statuss`) USING BTREE,
  INDEX `status_code_index`(`status_code`) USING BTREE,
  INDEX `type_all_index`(`type_all`) USING BTREE,
  INDEX `type_index`(`type`) USING BTREE,
  INDEX `sys_key_index`(`sys_key`) USING BTREE,
  INDEX `trading_manner_index`(`trading_manner`) USING BTREE,
  INDEX `pay_code_index`(`pay_code`) USING BTREE,
  INDEX `user_id_index`(`user_id`) USING BTREE,
  INDEX `platform_id_index`(`platform_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '交易记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for fs_card_t
-- ----------------------------
DROP TABLE IF EXISTS `fs_card_t`;
CREATE TABLE `fs_card_t`  (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `type` int(11) NULL DEFAULT NULL COMMENT '类型：银行卡，支付宝，微信，PayPal 等',
  `bank_code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所属银行code',
  `bank_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所属银行',
  `bank_address` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '银行地址',
  `account_no` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '银行卡号/第三方账号',
  `account_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '银行卡姓名',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户id',
  `platform_id` bigint(20) NULL DEFAULT NULL COMMENT '平台Id',
  `create_timestamp` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_timestamp` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `statuss` int(11) NULL DEFAULT NULL COMMENT '状态： 1 默认，2 非默认',
  `is_deleted` int(11) NULL DEFAULT NULL COMMENT '1 有效，2 无效',
  `create_by` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '记录人',
  `create_user_id` bigint(20) NULL DEFAULT NULL COMMENT '记录人id',
  `url_backroug` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '背景图',
  `url_icon` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图标',
  `user_name` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户name',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '绑卡记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for fs_flow_t
-- ----------------------------
DROP TABLE IF EXISTS `fs_flow_t`;
CREATE TABLE `fs_flow_t`  (
  `id` bigint(20) NOT NULL,
  `amount` bigint(20) NULL DEFAULT NULL COMMENT '预交易金额',
  `actual_amount` bigint(20) NULL DEFAULT NULL COMMENT '实际交易金额',
  `type_all` int(11) NULL DEFAULT NULL COMMENT '大类：1 会员充值、2 系统余额累加、3 活动余额累加、4 余额累减、5 提现',
  `type_all_str` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '大类：1 会员充值、2 系统余额累加、3 活动余额累加、4 余额累减、5 提现',
  `type` int(11) NULL DEFAULT NULL COMMENT '类型 : 1 登入、2 登出、3 充值、4 提现、5 人工取款、6 会员取款、7 领取佣金、8 红包、9 保险箱记录、10 结算入账、11 领取洗码、12 赠送彩金、13 活动优惠、14 人工存入、15 会员充值',
  `type_str` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型 : 1 登入、2 登出、3 充值、4 提现、5 人工取款、6 会员取款、7 领取佣金、8 红包、9 保险箱记录、10 结算入账、11 领取洗码、12 赠送彩金、13 活动优惠、14 人工存入、15 会员充值',
  `code_id` bigint(20) NULL DEFAULT NULL COMMENT '交易单号表id（充值表，提现表）',
  `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '交易单号',
  `sys_key` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付系统key',
  `trading_manner` int(11) NULL DEFAULT NULL COMMENT '交易方式（ 1. 银行转账 2. 云闪付转账 3.微信转账 4. 支付宝转账 5. 微信支付 6. 支付宝支付 7 代理充值 ）',
  `trading_manner_str` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '交易方式str',
  `trading_manner_off_str` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '交易方式优惠str',
  `code_other` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '第三方平台单号（回调的支付单号）',
  `bus_timestamp` datetime(0) NULL DEFAULT NULL COMMENT '交易时间（从登入，登出，充值，提现，保险箱转入转出 等 类型中 传入的记录时间字段）',
  `pay_remarks` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '付款信息/卡号、姓名后4位',
  `pay_account` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '付款人账号（银行、支付宝、微信、PayPal 等）',
  `pay_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '付款人姓名',
  `pay_bank_code` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '付款账号所属支行code',
  `pay_bank` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '付款账号所属支行',
  `receipt_account` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收款人账号（银行、支付宝、微信、PayPal 等）',
  `receipt_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收款人姓名',
  `receipt_bank_code` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收款账号所属支行code',
  `receipt_bank` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收款账号所属支行',
  `description` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '交易描述',
  `game_name` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所属游戏平台名称',
  `game_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所属游戏平台',
  `remark` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户id',
  `platform_id` bigint(20) NULL DEFAULT NULL COMMENT '平台Id',
  `create_timestamp` datetime(0) NULL DEFAULT NULL COMMENT '记录时间（当前新增记录的时间）',
  `update_timestamp` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `statuss` int(11) NULL DEFAULT NULL COMMENT '交易流水表状态字段',
  `statuss_str` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '交易流水表状态字段str',
  `is_deleted` int(11) NULL DEFAULT NULL COMMENT '无效字段2',
  `balance` bigint(20) NULL DEFAULT NULL COMMENT '可用余额',
  `balance_in` bigint(20) NULL DEFAULT NULL COMMENT '收入',
  `balance_out` bigint(20) NULL DEFAULT NULL COMMENT '支出',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `code_index`(`code`) USING BTREE,
  INDEX `code_other_index`(`code_other`) USING BTREE,
  INDEX `statuss_index`(`statuss`) USING BTREE,
  INDEX `type_all_index`(`type_all`) USING BTREE,
  INDEX `type_index`(`type`) USING BTREE,
  INDEX `sys_key_index`(`sys_key`) USING BTREE,
  INDEX `trading_manner_index`(`trading_manner`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '账本流水表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for fs_freeze_t
-- ----------------------------
DROP TABLE IF EXISTS `fs_freeze_t`;
CREATE TABLE `fs_freeze_t`  (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `freeze_money` bigint(20) NULL DEFAULT NULL COMMENT '冻结金额',
  `verify_money` bigint(20) NULL DEFAULT NULL COMMENT '核销金额',
  `game_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '游戏name',
  `game_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '游戏订单编号',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户id',
  `platform_id` bigint(20) NULL DEFAULT NULL COMMENT '平台id',
  `batch_no` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '批次号',
  `freeze_timestarmp` datetime(0) NULL DEFAULT NULL COMMENT '冻结开始时间',
  `create_timestamp` datetime(0) NULL DEFAULT NULL COMMENT '记录时间',
  `update_timestamp` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `statuss` int(11) NULL DEFAULT NULL COMMENT '状态：1冻结、2 核销、3 异常',
  `is_deleted` int(11) NULL DEFAULT NULL COMMENT '无效字段',
  `type` int(11) NULL DEFAULT NULL COMMENT '类型:1 提现冻结 2 登入游戏冻结',
  `bus_id` bigint(20) NULL DEFAULT NULL COMMENT '交易记录ID',
  `remarks` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `batch_no_index`(`batch_no`) USING BTREE,
  INDEX `bus_id_index`(`bus_id`) USING BTREE,
  INDEX `type_index`(`type`) USING BTREE,
  INDEX `statuss_index`(`statuss`) USING BTREE,
  INDEX `user_id_index`(`user_id`) USING BTREE,
  INDEX `platform_id_index`(`platform_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '余额冻结单据表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for fs_interest_t
-- ----------------------------
DROP TABLE IF EXISTS `fs_interest_t`;
CREATE TABLE `fs_interest_t`  (
  `id` bigint(20) NOT NULL COMMENT '主键ID',
  `type` int(11) NULL DEFAULT NULL COMMENT '类型 1 保险箱',
  `create_timestamp` datetime(0) NULL DEFAULT NULL COMMENT '无效字段4',
  `update_timestamp` datetime(0) NULL DEFAULT NULL COMMENT '无效字段3',
  `statuss` int(11) NULL DEFAULT NULL COMMENT '无效字段2',
  `is_deleted` int(11) NULL DEFAULT NULL COMMENT '无效字段1',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户id',
  `platform_id` bigint(20) NULL DEFAULT NULL COMMENT '平台id',
  `cale_date` date NULL DEFAULT NULL COMMENT '计算日期',
  `money` bigint(20) NULL DEFAULT NULL COMMENT '当前计算利息金额',
  `param_calc` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '计算参数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `type_index`(`type`) USING BTREE,
  INDEX `cale_date_index`(`cale_date`) USING BTREE,
  INDEX `user_id_index`(`user_id`) USING BTREE,
  INDEX `platform_id_index`(`platform_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '利息计算表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for fs_msg_bus_t
-- ----------------------------
DROP TABLE IF EXISTS `fs_msg_bus_t`;
CREATE TABLE `fs_msg_bus_t`  (
  `id` bigint(20) NOT NULL,
  `create_timestamp` datetime(0) NULL DEFAULT NULL COMMENT '记录时间(创建时间)',
  `update_timestamp` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `statuss` int(11) NULL DEFAULT NULL COMMENT '状态 1 已执行  2 未执行',
  `is_deleted` int(11) NULL DEFAULT NULL COMMENT '无效字段',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户id',
  `platform_id` bigint(20) NULL DEFAULT NULL COMMENT '平台Id',
  `code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '消息code',
  `amount` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '金额',
  `msg` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '内容',
  `type` int(1) NULL DEFAULT NULL COMMENT '消息类型 ',
  `type_str` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `code_index`(`code`) USING BTREE,
  INDEX `type_index`(`type`) USING BTREE,
  INDEX `statuss_index`(`statuss`) USING BTREE,
  INDEX `user_id_index`(`user_id`) USING BTREE,
  INDEX `platform_id_index`(`platform_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '消息金额变动表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for fs_order_code_data_t
-- ----------------------------
DROP TABLE IF EXISTS `fs_order_code_data_t`;
CREATE TABLE `fs_order_code_data_t`  (
  `id` bigint(20) NOT NULL COMMENT '主键ID',
  `create_timestamp` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_timestamp` datetime(0) NULL DEFAULT NULL COMMENT '无效字段3',
  `is_deleted` int(11) NULL DEFAULT NULL COMMENT '无效字段2',
  `statuss` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '无效字段1',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户ID',
  `platform_id` bigint(20) NULL DEFAULT NULL COMMENT '平台ID',
  `order_no` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '订单号',
  `game_id` bigint(20) NULL DEFAULT NULL COMMENT '游戏ID',
  `game_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '游戏名称',
  `money` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '投注金额',
  `order_by_user_id` bigint(20) NULL DEFAULT NULL COMMENT '投注人ID',
  `order_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '投注人账号',
  `order_reg_datetime` datetime(0) NULL DEFAULT NULL COMMENT '投注开始时间',
  `order_end_datetime` datetime(0) NULL DEFAULT NULL COMMENT '投注结束时间',
  `batch_code` bigint(20) NULL DEFAULT NULL COMMENT '批次编码',
  `param_calc` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '计算参数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id_index`(`user_id`) USING BTREE,
  INDEX `platform_id_index`(`platform_id`) USING BTREE,
  INDEX `order_no_index`(`order_no`) USING BTREE,
  INDEX `game_id_index`(`game_id`) USING BTREE,
  INDEX `batch_code_index`(`batch_code`) USING BTREE,
  INDEX `param_calc_index`(`param_calc`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '打码原始数据表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for fs_order_code_t
-- ----------------------------
DROP TABLE IF EXISTS `fs_order_code_t`;
CREATE TABLE `fs_order_code_t`  (
  `id` bigint(20) NOT NULL COMMENT '主键ID',
  `bus_id` bigint(20) NULL DEFAULT NULL COMMENT '交易ID',
  `bus_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '交易CODE',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户ID',
  `platform_id` bigint(20) NULL DEFAULT NULL COMMENT '平台ID',
  `last_order_datetime` datetime(0) NULL DEFAULT NULL COMMENT '最后订单同步时间',
  `batch_code` bigint(20) NULL DEFAULT NULL COMMENT '批次编码',
  `last_amount` bigint(20) NULL DEFAULT NULL COMMENT '最后一次打码剩余金额',
  `create_timestamp` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_timestamp` datetime(0) NULL DEFAULT NULL COMMENT '无效字段3',
  `is_deleted` int(11) NULL DEFAULT NULL COMMENT '无效字段2',
  `statuss` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '无效字段1',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id_index`(`user_id`) USING BTREE,
  INDEX `platform_id_index`(`platform_id`) USING BTREE,
  INDEX `bus_id_index`(`bus_id`) USING BTREE,
  INDEX `bus_code_index`(`bus_code`) USING BTREE,
  INDEX `create_timestamp_index`(`create_timestamp`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '打码计算表-同步每笔订单的投注额' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for fs_safe_flow_t
-- ----------------------------
DROP TABLE IF EXISTS `fs_safe_flow_t`;
CREATE TABLE `fs_safe_flow_t`  (
  `id` bigint(20) NOT NULL,
  `amount` bigint(20) NULL DEFAULT NULL COMMENT '操作金额',
  `type` int(11) NULL DEFAULT NULL COMMENT '类型(转入、转出)',
  `create_timestamp` datetime(0) NULL DEFAULT NULL COMMENT '记录时间(创建时间)',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户id',
  `platform_id` bigint(20) NULL DEFAULT NULL COMMENT '平台Id',
  `update_timestamp` datetime(0) NULL DEFAULT NULL,
  `remarks` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `balance` bigint(20) NULL DEFAULT NULL COMMENT '可用余额',
  `balance_safe` bigint(20) NULL DEFAULT NULL COMMENT '保险箱余额',
  `is_deleted` int(1) NULL DEFAULT NULL,
  `statuss` int(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '保险箱转入转出记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for fs_safe_info_t
-- ----------------------------
DROP TABLE IF EXISTS `fs_safe_info_t`;
CREATE TABLE `fs_safe_info_t`  (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `pwd` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '保险箱密码',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户ID',
  `platform_id` bigint(20) NULL DEFAULT NULL COMMENT '平台Id',
  `create_timestamp` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_timestamp` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `statuss` int(1) NULL DEFAULT NULL,
  `is_deleted` int(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '保险箱信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for fs_safe_rate_t
-- ----------------------------
DROP TABLE IF EXISTS `fs_safe_rate_t`;
CREATE TABLE `fs_safe_rate_t`  (
  `id` bigint(20) NOT NULL,
  `rate` float NULL DEFAULT NULL COMMENT '利率',
  `day_num` int(11) NULL DEFAULT NULL COMMENT '连续天数',
  `platform_id` bigint(20) NULL DEFAULT NULL COMMENT '平台Id',
  `create_timestamp` datetime(0) NULL DEFAULT NULL COMMENT '记录时间(创建时间)',
  `update_timestamp` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `statuss` int(11) NULL DEFAULT NULL COMMENT '无效字段',
  `is_deleted` int(11) NULL DEFAULT NULL COMMENT '无效字段',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '保险箱利率表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for fs_sum_moeny_flow_t
-- ----------------------------
DROP TABLE IF EXISTS `fs_sum_moeny_flow_t`;
CREATE TABLE `fs_sum_moeny_flow_t`  (
  `id` bigint(20) NOT NULL COMMENT '主键ID',
  `type` int(11) NULL DEFAULT NULL COMMENT '类型 1 充值：人工，会员 2 提现：人工，会员 3  优惠  4  洗码/返水',
  `sum_amount` bigint(20) NULL DEFAULT NULL COMMENT '当前批次计总金额',
  `last_datetime` datetime(0) NULL DEFAULT NULL COMMENT '计总最新时间',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户id',
  `platform_id` bigint(20) NULL DEFAULT NULL COMMENT '平台id',
  `begin_datetime` datetime(0) NULL DEFAULT NULL COMMENT '开始时间',
  `end_datetime` datetime(0) NULL DEFAULT NULL COMMENT '结束时间',
  `create_timestamp` datetime(0) NULL DEFAULT NULL COMMENT '无效字段4',
  `update_timestamp` datetime(0) NULL DEFAULT NULL COMMENT '无效字段3',
  `statuss` int(11) NULL DEFAULT NULL COMMENT '无效字段2',
  `is_deleted` int(11) NULL DEFAULT NULL COMMENT '无效字段1',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '金额统计流水表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for fs_sum_moeny_t
-- ----------------------------
DROP TABLE IF EXISTS `fs_sum_moeny_t`;
CREATE TABLE `fs_sum_moeny_t`  (
  `id` bigint(20) NULL DEFAULT NULL COMMENT '主键ID',
  `type` int(11) NULL DEFAULT NULL COMMENT '类型 1 充值：人工，会员 2 提现：人工，会员 3  优惠  4  洗码/返水',
  `sum_amount` bigint(20) NULL DEFAULT NULL COMMENT '当前批次计总金额',
  `last_datetime` datetime(0) NULL DEFAULT NULL COMMENT '计总最新时间',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户id',
  `platform_id` bigint(20) NULL DEFAULT NULL COMMENT '平台id',
  `create_timestamp` datetime(0) NULL DEFAULT NULL COMMENT '无效字段4',
  `update_timestamp` datetime(0) NULL DEFAULT NULL COMMENT '无效字段3',
  `statuss` int(11) NULL DEFAULT NULL COMMENT '无效字段2',
  `is_deleted` int(11) NULL DEFAULT NULL COMMENT '无效字段1',
  `sum_number` int(11) NULL DEFAULT NULL COMMENT '计总次数'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '金额统计表' ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
