-- 此文件是所有SQL的备份,防止数据库误删,起备份作用.
-- 请将最新的SQL脚本往备份进来.

-- -------------------------- 资费管理模块 SQL ------------------------------------------------

-- *********************************************************************************************
-- 收费公司信息表
CREATE TABLE `tariff_company` (
  `COMPANY_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '公司编号',
  `BUSINESS` varchar(32) NOT NULL COMMENT '业务类型',
  `NAME` varchar(64) NOT NULL COMMENT '公司名称',
  `ADDRESS` varchar(128) DEFAULT NULL COMMENT '公司地址',
  `TELEPHONE` varchar(64) DEFAULT NULL COMMENT '公司联系方式',
  `ORGANIZATION_CODE` varchar(10) DEFAULT NULL COMMENT '组织机构代码',
  `LEGAL_NAME` varchar(64) DEFAULT NULL COMMENT '企业法人名字',
  `ESTABLISH` varchar(64) DEFAULT NULL COMMENT '成立时间',
  `REGISTER_CAPITAL` varchar(64) DEFAULT NULL COMMENT '注册资金',
  `STATUS` varchar(64) NOT NULL COMMENT '状态(1:正常;0:无效)',
  `UPDATE_TIME` datetime NOT NULL COMMENT '修改时间',
  `CREATE_TIME` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`COMPANY_ID`)
) ENGINE=InnoDB AUTO_INCREMENT = 1000000 DEFAULT CHARSET=utf8 COMMENT='收费公司信息表';

-- COMPANY_ID
-- MERCHANT_NO
-- BUSINESS
-- LEGAL_PERSON
-- NAME
-- ADDRESS
-- TELEPHONE
-- STATUS
-- CREATE_TIME
-- UPDATE_TIME

-- *********************************************************************************************
-- 收费公司账目表

CREATE TABLE `tariff_company_bill` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `COMPANY_ID` bigint(20) NOT NULL COMMENT '公司编号',
  `MEMBER_ID` bigint(20) NOT NULL COMMENT '用户编号',
  `PLAN_NO` bigint(20) NOT NULL COMMENT '缴费计划编号',
  `BUSINESS` varchar(32) NOT NULL COMMENT '业务类型',
  `PAYMENT_AMOUNT` decimal(18,2) NOT NULL COMMENT '交易金额',
  `PAYMENT_WAY` varchar(32) NOT NULL COMMENT '支付方式',
  `PAYMENT_STATUS` varchar(32) NOT NULL COMMENT '支付状态',
  `PAYMENT_DATE` datetime NOT NULL COMMENT '交易时间',
  `ERROR_CODE` varchar(256) NOT NULL COMMENT '错误码',
  `ERROR_MESSAGE` varchar(256) NOT NULL COMMENT '错误信息',
  `CREATE_TIME` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='收费公司账目表';

-- ID
-- COMPANY_ID
-- MEMBER_ID
-- PLAN_NO
-- BUSINESS
-- PAYMENT_AMOUNT
-- PAYMENT_WAY
-- PAYMENT_STATUS
-- PAYMENT_DATE
-- ERROR_CODE
-- ERROR_MESSAGE
-- CREATE_TIME

-- *********************************************************************************************
-- 缴费标准表

CREATE TABLE `tariff_standard` (
  `STANDARD_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '缴费标准编号',
  `BUSINESS` varchar(32) NOT NULL COMMENT '业务类型',
  `LEVEL` varchar(32) NOT NULL COMMENT '缴费标准等级',
  `UNIT_PRICE` decimal(18,2) NOT NULL COMMENT '缴费单价',
  `OVERDUE_RATE` decimal(18,6) NOT NULL COMMENT '逾期利率',
  `START_TIME` datetime NOT NULL COMMENT '缴费标准生效时间',
  `END_TIME` datetime NOT NULL COMMENT '缴费标准失效时间',
  `STATUS` TINYINT(1) NOT NULL COMMENT '状态(1:正常;0:无效)',
  `UPDATE_TIME` datetime NOT NULL COMMENT '修改时间',
  `CREATE_TIME` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`STANDARD_ID`)
) ENGINE=InnoDB AUTO_INCREMENT = 100 DEFAULT CHARSET=utf8 COMMENT='缴费标准表';

-- STANDARD_ID
-- BUSINESS
-- LEVEL
-- UNIT_PRICE
-- START_TIME
-- END_TIME
-- STATUS
-- CREATE_TIME
-- UPDATE_TIME

-- *********************************************************************************************
-- 缴费账单表

CREATE TABLE `tariff_bill` (
  `BILL_NO` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '账单编号',
  `HOUSE_NO` varchar(20) NOT NULL COMMENT '户号',
  `MEMBER_ID` bigint(20) NOT NULL COMMENT '用户编号',
  `BUSINESS` varchar(32) NOT NULL COMMENT '业务类型',
  `STANDARD_ID` bigint(20) NOT NULL COMMENT '资费标准编号',
  `UNIT_PRICE` decimal(18,6) NOT NULL COMMENT '缴费单价(冗余字段)',
  `OVERDUE_RATE` decimal(18,6) NOT NULL COMMENT '逾期利率(冗余字段)',
  `USED_TOTAL` decimal(18,6) NOT NULL COMMENT '使用量',
  `BILL_AMOUNT` decimal(18,2) NOT NULL COMMENT '账单金额',
  `BILL_MONTH` datetime NOT NULL COMMENT '账单月份',
  `PAYMENT_STATUS` varchar(32) NOT NULL COMMENT '支付状态',
  `BILL_START_DATE` datetime NOT NULL COMMENT '账单起始时间',
  `BILL_END_DATE` datetime NOT NULL COMMENT '账单结束时间',
  `EXPAND` varchar(256) NOT NULL COMMENT '拓展字段',
  `UPDATE_TIME` datetime NOT NULL COMMENT '修改时间',
  `CREATE_TIME` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`BILL_NO`)
) ENGINE=InnoDB AUTO_INCREMENT = 10000 DEFAULT CHARSET=utf8 COMMENT='缴费账单表';

-- BILL_NO
-- MEMBER_ID
-- HOUSE_NO
-- BUSINESS
-- STANDARD_ID
-- PAYMENT_STATUS
-- USED_TOTAL
-- UNIT_PRICE
-- BILL_AMOUNT
-- BILL_OVERDUE_RATE
-- BILL_MONTH
-- BILL_START_DATE
-- BILL_END_DATE
-- EXPAND
-- CREATE_TIME
-- UPDATE_TIME

-- *********************************************************************************************
-- 缴费账单还款计划表

CREATE TABLE `tariff_bill_plan` (
  `PLAN_NO` bigint(20) NOT NULL COMMENT '缴费计划编号',
  `BILL_NO` bigint(20) NOT NULL COMMENT '账单编号',
  `MEMBER_ID` bigint(20) NOT NULL COMMENT '用户编号',
  `REPAY_DATE` datetime NOT NULL COMMENT '应还款日期',
  `SETTLE_DATE` datetime NOT NULL COMMENT '结清日期',
  `OVERDUE_DAYS` INTEGER NOT NULL COMMENT '逾期天数',
  `PAYMENT_STATUS` varchar(32) NOT NULL COMMENT '支付状态',
  `BILL_AMOUNT` decimal(18,6) NOT NULL COMMENT '应缴纳本金',
  `LATE_CHARGE_AMT` decimal(18,6) NOT NULL COMMENT '应缴纳滞纳金',
  `BILL_AMOUNT_PAID` decimal(18,6) NOT NULL COMMENT '已缴纳本金',
  `LATE_CHARGE_AMT_PAID` decimal(18,6) NOT NULL COMMENT '已缴纳滞纳金',
  `BILL_AMOUNT_OFFER` decimal(18,6) NOT NULL COMMENT '优惠减免本金',
  `LATE_CHARGE_AMT_OFFER` decimal(18,6) NOT NULL COMMENT '优惠减免滞纳金',
  `EXPAND` varchar(256) NOT NULL COMMENT '拓展字段',
  `UPDATE_TIME` datetime NOT NULL COMMENT '修改时间',
  `CREATE_TIME` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`PLAN_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='缴费账单还款计划表';

-- PLAN_NO
-- BILL_NO
-- MEMBER_ID
-- PAYMENT_STATUS
-- REPAY_DATE
-- SETTLE_DATE
-- OVERDUE_DAYS
-- BILL_AMOUNT
-- LATE_CHARGE_AMT
-- BILL_AMOUNT_PAID
-- LATE_CHARGE_AMT_PAID
-- BILL_AMOUNT_OFFER
-- LATE_CHARGE_OFFER
-- EXPAND
-- CREATE_TIME
-- UPDATE_TIME

