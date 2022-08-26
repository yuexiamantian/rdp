
SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for chart_test
-- ----------------------------
DROP TABLE IF EXISTS `chart_test`;
CREATE TABLE `chart_test` (
  `id` int(11) NOT NULL,
  `model` varchar(255) DEFAULT NULL,
  `val` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of chart_test
-- ----------------------------
INSERT INTO `chart_test` VALUES ('1', '1', '100', '1');
INSERT INTO `chart_test` VALUES ('2', '2', '200', '2');
INSERT INTO `chart_test` VALUES ('3', '3', '300', '1');
INSERT INTO `chart_test` VALUES ('4', '4', '400', '2');
INSERT INTO `chart_test` VALUES ('5', '1', '500', '1');
INSERT INTO `chart_test` VALUES ('6', '2', '600', '2');
INSERT INTO `chart_test` VALUES ('7', '3', '700', '1');
INSERT INTO `chart_test` VALUES ('8', '4', '800', '2');

-- ----------------------------
-- Table structure for data_set
-- ----------------------------
DROP TABLE IF EXISTS `data_set`;
CREATE TABLE `data_set` (
  `dt_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '数据集编号',
  `dt_name` varchar(80) DEFAULT NULL COMMENT '数据集名称',
  `ds_id` int(11) DEFAULT NULL COMMENT '数据源编号',
  `type` varchar(10) DEFAULT NULL COMMENT '数据集分类',
  `sql` varchar(5000) DEFAULT NULL COMMENT '数据集SQL',
  `data_type` varchar(10) DEFAULT NULL COMMENT '数据来源类型',
  `sts` varchar(1) DEFAULT NULL COMMENT '数据集状态',
  `tx_time` datetime DEFAULT NULL COMMENT '登记日期',
  `up_time` datetime DEFAULT NULL,
  `tx_op` varchar(30) DEFAULT NULL COMMENT '登记人',
  `up_op` varchar(30) DEFAULT NULL COMMENT '更新人',
  `order_by_str` varchar(255) DEFAULT NULL COMMENT '排序字段',
  PRIMARY KEY (`dt_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='数据集表';

-- ----------------------------
-- Records of data_set
-- ----------------------------
INSERT INTO `data_set` VALUES ('4', '测试SQL', '107', 'mysql', 'select * from db_type', 'sql', '1', null, '2019-01-10 12:02:50', null, 'admin', null);
INSERT INTO `data_set` VALUES ('7', '系统日志', '107', 'rsdb', 'select * from sys_log', 'sql', '1', null, '2018-09-05 14:52:51', null, null, null);
INSERT INTO `data_set` VALUES ('11', '测试数据', '107', 'mysql', 'select * from (select * from chart_test order by id asc) a ', 'sql', '1', null, '2019-04-19 09:53:10', null, null, 'id desc');
INSERT INTO `data_set` VALUES ('12', 'dept_year', '121', 'rsdb', 'select * from dept_year', 'sql', '1', '2018-12-07 17:16:04', '2018-12-07 17:16:04', 'admin', 'admin', null);
INSERT INTO `data_set` VALUES ('15', '列表', '121', 'mysql', 'select * from demo_user', 'sql', '1', '2019-03-05 09:50:05', '2019-03-05 09:50:05', 'admin', 'admin', null);

-- ----------------------------
-- Table structure for data_source
-- ----------------------------
DROP TABLE IF EXISTS `data_source`;
CREATE TABLE `data_source` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '数据源编号',
  `name` varchar(80) DEFAULT NULL COMMENT '数据源名称',
  `model` varchar(10) DEFAULT NULL COMMENT '数据源种类  json   db',
  `type` varchar(20) DEFAULT NULL COMMENT '数据源类型',
  `version` varchar(10) DEFAULT NULL COMMENT '数据源版本',
  `driver` varchar(100) DEFAULT NULL COMMENT '驱动',
  `addr` varchar(300) DEFAULT NULL COMMENT '地址',
  `usr` varchar(100) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL COMMENT '密码',
  `icon` varchar(20) DEFAULT NULL COMMENT '图标',
  `readonly` varchar(1) DEFAULT NULL COMMENT '只读',
  `sts` varchar(1) DEFAULT NULL COMMENT '状态',
  `tx_time` datetime DEFAULT NULL COMMENT '登记日期',
  `up_time` datetime DEFAULT NULL COMMENT '更新日期',
  `tx_op` varchar(30) DEFAULT NULL COMMENT '登记人',
  `up_op` varchar(30) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=171 DEFAULT CHARSET=utf8 COMMENT='数据源表';

-- ----------------------------
-- Records of data_source
-- ----------------------------
INSERT INTO `data_source` VALUES ('107', 'MySql-24', 'rsdb', 'mysql', null, 'com.mysql.jdbc.Driver', 'jdbc:mysql://128.1.13.24:3306/rdp_server?characterEncoding=utf8&useSSL=false&serverTimezone=UTC', 'root', 'dhccpass', 'MySql', '0', '1', null, '2019-01-31 10:00:52', null, 'admin');
INSERT INTO `data_source` VALUES ('121', 'report_demo', 'rsdb', 'mysql', null, 'com.mysql.jdbc.Driver', 'jdbc:mysql://128.1.13.24:3306/report_demo?characterEncoding=utf8&useSSL=false&serverTimezone=UTC', 'root', 'dhccpass', 'MySql', '0', '1', null, '2019-03-25 16:27:34', null, 'admin');
INSERT INTO `data_source` VALUES ('123', 'cms_oracle', 'oracle', 'oracle', null, 'oracle.jdbc.driver.OracleDriver', 'jdbc:oracle:thin:@128.1.13.22:1521:orcl', 'cmsii', 'cmsii', null, '0', '1', null, '2019-02-20 18:08:33', null, 'admin');
INSERT INTO `data_source` VALUES ('131', 'Oracle1', 'rsdb', 'oracle', null, 'oracle.jdbc.driver.OracleDriver', 'jdbc:oracle:thin:@//<host>:<port>/ServiceName', null, null, 'Oracle', '1', '1', '2018-11-02 13:51:24', '2018-11-02 13:51:24', 'admin', 'admin');
INSERT INTO `data_source` VALUES ('132', 'Json', 'file', 'Json', null, null, 'https://api.github.com/search/', null, null, 'Json', '1', '1', null, '2018-11-06 16:15:21', null, 'admin');
INSERT INTO `data_source` VALUES ('133', 'PostgreSQL', 'rsdb', 'postgresql', null, 'org.postgresql.Driver', 'jdbc:postgresql://128.1.13.24:5432/postgres', 'postgres', 'postgres', 'PostgreSQL', '1', '1', '2018-11-05 09:27:02', '2018-11-05 09:27:02', 'admin', 'admin');
INSERT INTO `data_source` VALUES ('134', 'SQL Server 2005', 'rsdb', 'sqlserver', null, 'com.microsoft.sqlserver.jdbc.SQLServerDriver', 'jdbc:sqlserver://128.1.13.24:1433;DatabaseName=REPORT', 'REPORT', 'REPORT', 'SqlServer', '0', '1', null, '2018-12-17 11:36:10', null, 'admin');
INSERT INTO `data_source` VALUES ('135', 'Db2', 'rsdb', 'db2', null, 'com.ibm.db2.jcc.DB2Driver', 'jdbc:db2://128.1.13.24:50000/REPORT', 'REPORT', 'REPORT', 'Db2 type2', '1', '1', null, '2018-11-08 09:44:29', null, 'admin');
INSERT INTO `data_source` VALUES ('141', 'jsonaaa', 'json', 'json', null, null, 'https://api.github.com', null, null, 'Json', null, '1', '2018-11-09 14:59:32', '2018-11-09 14:59:32', 'admin', 'admin');
INSERT INTO `data_source` VALUES ('146', 'MySql-test', 'rsdb', 'mysql', null, 'com.mysql.jdbc.Driver', 'jdbc:mysql://128.1.20.33:3306/rdp_server', 'root', 'root', 'MySql', '0', '1', null, '2018-11-14 16:29:52', null, 'admin');
INSERT INTO `data_source` VALUES ('148', '天气', 'json', 'json', null, null, 'http://t.weather.sojson.com/api/weather/city/101030100', null, null, 'Json', null, '1', null, '2018-11-16 14:49:14', null, 'admin');
INSERT INTO `data_source` VALUES ('149', 'jsonlocal', 'json', 'json', null, null, 'http://localhost', 'admin', 'admin', 'Json', null, '1', '2018-11-19 09:17:33', '2018-11-19 09:17:33', 'admin', 'admin');
INSERT INTO `data_source` VALUES ('150', 'Oracle2', 'rsdb', 'oracle', null, 'oracle.jdbc.driver.OracleDriver', 'jdbc:oracle:thin://128.1.20.33:1521/orcl', 'zlxt', 'zlxt', 'Oracle', '0', '1', null, '2019-03-23 09:08:47', null, 'admin');
INSERT INTO `data_source` VALUES ('151', 'jishiyu', 'rsdb', 'mysql', null, 'com.mysql.jdbc.Driver', 'jdbc:mysql://localhost:3366/factor_platform?useUnicode=true&characterEncoding=utf-8&useSSL=true', 'factor', 'admin', 'MySql', '1', '1', null, '2018-11-26 15:16:01', null, 'admin');
INSERT INTO `data_source` VALUES ('152', 'wangqing', 'rsdb', 'oracle', null, 'oracle.jdbc.driver.OracleDriver', 'jdbc:oracle:thin:@128.1.13.22:1521:orcl', 'cmsii', 'cmsii', 'Oracle', '1', '1', null, '2018-11-27 14:32:46', null, 'admin');
INSERT INTO `data_source` VALUES ('153', '中文', 'rsdb', 'mysql', null, 'com.mysql.jdbc.Driver', 'jdbc:mysql://128.1.13.24:3306/report_demo', 'root', 'dhccpass', 'MySql', '1', '1', '2018-11-27 16:09:12', '2018-11-27 16:09:12', 'admin', 'admin');
INSERT INTO `data_source` VALUES ('158', 'asdasd', 'jndi', 'mysql', null, null, 'asdasd', null, null, 'Jndi', '1', '1', '2018-11-30 09:29:47', '2018-11-30 09:29:47', 'admin', 'admin');
INSERT INTO `data_source` VALUES ('159', 'asdas22', 'jndi', 'mysql', null, null, 'asdasd', null, null, 'Jndi', '1', '1', '2018-11-30 09:37:04', '2018-11-30 09:37:04', 'admin', 'admin');
INSERT INTO `data_source` VALUES ('160', 'asdas22eee', 'jndi', 'mysql', null, null, 'qweqwe', null, null, 'Jndi', '1', '1', '2018-11-30 09:37:39', '2018-11-30 09:37:39', 'admin', 'admin');
INSERT INTO `data_source` VALUES ('161', 'jnreport_demo', 'jndi', 'mysql', null, null, 'java:comp/env/jdbc/report_demo', null, null, 'Jndi', '1', '1', null, '2018-11-30 10:44:48', null, 'admin');
INSERT INTO `data_source` VALUES ('164', 'MYSQL', 'rsdb', 'mysql', null, 'com.mysql.jdbc.Driver', 'jdbc:mysql://localhost:3366/factor_platform?characterEncoding=utf8&useSSL=false&serverTimezone=UTC', 'factor', 'admin', 'MySql', '1', '1', null, '2018-12-18 13:43:01', null, 'admin');
INSERT INTO `data_source` VALUES ('166', 'local', 'json', 'json', null, null, 'http://localhost/', 'admin', 'admin', 'Json', null, '1', '2018-12-14 16:44:03', '2018-12-14 16:44:03', 'admin', 'admin');
INSERT INTO `data_source` VALUES ('167', 'ms_report', 'rsdb', 'sqlserver', null, 'com.microsoft.sqlserver.jdbc.SQLServerDriver', 'jdbc:sqlserver://128.1.13.24:1433;DatabaseName=report_demo', 'sa', 'sa', 'SqlServer', '0', '1', null, '2018-12-26 11:45:56', null, 'admin');
INSERT INTO `data_source` VALUES ('168', 'rdp_test', 'rsdb', 'oracle', null, 'oracle.jdbc.driver.OracleDriver', 'jdbc:oracle:thin:@128.1.20.33:1521:orcl', 'rdp_admin', 'rdp_admin', 'Oracle', '1', '1', null, '2019-03-07 11:27:03', null, 'admin');

-- ----------------------------
-- Table structure for db_type
-- ----------------------------
DROP TABLE IF EXISTS `db_type`;
CREATE TABLE `db_type` (
  `id` int(11) NOT NULL COMMENT '类型编号',
  `name` varchar(80) DEFAULT NULL COMMENT '类型名称',
  `model` varchar(20) DEFAULT NULL COMMENT '数据类型大类',
  `type` varchar(20) DEFAULT NULL COMMENT '支持类型',
  `driver` varchar(100) DEFAULT NULL COMMENT '数据库驱动',
  `addr_demo` varchar(120) DEFAULT NULL COMMENT '数据库地址例子',
  `sts` varchar(1) DEFAULT NULL COMMENT '状态',
  `icon` varchar(80) DEFAULT NULL COMMENT '图标',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据库支持类型';

-- ----------------------------
-- Records of db_type
-- ----------------------------
INSERT INTO `db_type` VALUES ('101', 'MySql', 'rsdb', 'mysql', 'com.mysql.jdbc.Driver', 'jdbc:mysql://<host>:<port>/<database_name>', '1', 'MySql');
INSERT INTO `db_type` VALUES ('201', 'Oracle', 'rsdb', 'oracle', 'oracle.jdbc.driver.OracleDriver', 'jdbc:oracle:thin:@<host>:<port>:<ServiceName>', '1', 'Oracle');
INSERT INTO `db_type` VALUES ('301', 'Db2 type2', 'rsdb', 'db2', 'com.ibm.db2.jcc.DB2Driver', 'jdbc:db2:<database_name>', '1', 'Db2 type2');
INSERT INTO `db_type` VALUES ('302', 'Db2 type4', 'rsdb', 'db2', 'com.ibm.db2.jcc.DB2Driver', 'jdbc:db2://<host>[:<port>]/<database_name>', '1', 'Db2 type4');
INSERT INTO `db_type` VALUES ('401', 'SQL Server 2000', 'rsdb', 'sqlserver', 'com.microsoft.jdbc.sqlserver.SQLServerDriver', 'jdbc:microsoft:sqlserver://:', '0', 'SqlServer');
INSERT INTO `db_type` VALUES ('402', 'SQL Server 2005', 'rsdb', 'sqlserver', 'com.microsoft.sqlserver.jdbc.SQLServerDriver', 'jdbc:sqlserver://<server_name>:<port>;DatabaseName=<DatabaseName>', '1', 'SqlServer');
INSERT INTO `db_type` VALUES ('501', 'Sybase', 'rsdb', 'sysbase', 'com.sybase.jdbc3.jdbc.SybDriver', 'jdbc:sybase:Tds::', '0', 'Sybase');
INSERT INTO `db_type` VALUES ('601', 'PostgreSQL', 'rsdb', 'postgresql', 'org.postgresql.Driver', 'jdbc:postgresql://:/', '1', 'PostgreSQL');
INSERT INTO `db_type` VALUES ('701', 'SQLite', 'rsdb', 'sqlite', 'org.sqlite.JDBC', 'jdbc:sqlite:D:\\\\xxxdatabase.db', '0', 'SQLite');
INSERT INTO `db_type` VALUES ('801', 'MongoDB', 'nosqldb', 'mongodb', null, 'mongodb://userName:password@host/?authSource=databaseName&amp;ssh=false', '0', 'MongoDB');
INSERT INTO `db_type` VALUES ('901', 'Xml', 'file', 'xml', null, null, '0', 'Xml');
INSERT INTO `db_type` VALUES ('902', 'API请求', 'file', 'json', null, null, '1', 'Json');
INSERT INTO `db_type` VALUES ('903', 'Csv', 'file', 'csv', null, null, '0', 'Csv');
INSERT INTO `db_type` VALUES ('904', 'Excel', 'file', 'excel', null, null, '0', 'Excel');
INSERT INTO `db_type` VALUES ('1001', 'JNDI', 'jndi', 'jndi', '', '', '1', 'Jndi');

-- ----------------------------
-- Table structure for ds_showcol
-- ----------------------------
DROP TABLE IF EXISTS `ds_showcol`;
CREATE TABLE `ds_showcol` (
  `show_id` int(11) NOT NULL COMMENT '显示编号',
  `dt_id` int(11) DEFAULT NULL COMMENT '数据集编号',
  `use_id` int(11) DEFAULT NULL COMMENT '引用表编号',
  `is_show` varchar(1) DEFAULT NULL COMMENT '是否显示',
  `data_type` varchar(10) DEFAULT NULL COMMENT '数据类型',
  `alias` varchar(80) DEFAULT NULL COMMENT '别名',
  `describe` varchar(200) DEFAULT NULL COMMENT '描述',
  `tx_time` datetime DEFAULT NULL COMMENT '创建时间',
  `tx_op` varchar(255) DEFAULT NULL COMMENT '登记人',
  PRIMARY KEY (`show_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据集表显示字段表';

-- ----------------------------
-- Records of ds_showcol
-- ----------------------------

-- ----------------------------
-- Table structure for dt_filter
-- ----------------------------
DROP TABLE IF EXISTS `dt_filter`;
CREATE TABLE `dt_filter` (
  `filter_id` int(11) NOT NULL COMMENT '过滤编号',
  `dt_id` int(11) DEFAULT NULL COMMENT '数据集编号',
  `table_name` varchar(80) DEFAULT NULL COMMENT '过滤表名',
  `column` varchar(30) DEFAULT NULL COMMENT '过滤字段',
  `col_type` varchar(1) DEFAULT NULL COMMENT '操作符',
  `operator` varchar(10) DEFAULT NULL,
  `param_type` varchar(1) DEFAULT NULL COMMENT '参数数据类型',
  `param` varchar(30) DEFAULT NULL COMMENT '参数',
  `tx_time` datetime DEFAULT NULL COMMENT '登记日期',
  `up_time` datetime DEFAULT NULL COMMENT '更新日期',
  `tx_op` varchar(30) DEFAULT NULL COMMENT '登记人',
  `up_op` varchar(30) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`filter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据集过滤';

-- ----------------------------
-- Records of dt_filter
-- ----------------------------

-- ----------------------------
-- Table structure for dt_param
-- ----------------------------
DROP TABLE IF EXISTS `dt_param`;
CREATE TABLE `dt_param` (
  `param_id` int(11) NOT NULL COMMENT '参数编号',
  `param_name` varchar(80) DEFAULT NULL COMMENT '参数名称',
  `dt_id` int(11) DEFAULT NULL COMMENT '数据集编号',
  `param_type` varchar(255) DEFAULT NULL COMMENT '参数类型',
  `data_type` varchar(255) DEFAULT NULL COMMENT '数据类型',
  `if_values` varchar(1) DEFAULT NULL COMMENT '是否多值',
  `tx_time` datetime DEFAULT NULL COMMENT '登记日期',
  `up_time` datetime DEFAULT NULL COMMENT '更新日期',
  `tx_op` varchar(30) DEFAULT NULL COMMENT '登记人',
  `up_op` varchar(30) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`param_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据集参数表';

-- ----------------------------
-- Records of dt_param
-- ----------------------------

-- ----------------------------
-- Table structure for dt_table
-- ----------------------------
DROP TABLE IF EXISTS `dt_table`;
CREATE TABLE `dt_table` (
  `use_id` int(11) NOT NULL COMMENT '编号',
  `dt_id` int(11) NOT NULL COMMENT '数据集编号',
  `table_name` varchar(80) DEFAULT NULL COMMENT '表名',
  `table_comments` varchar(120) DEFAULT NULL COMMENT '表说明',
  `level` varchar(1) DEFAULT NULL COMMENT '层级',
  `show_name` varchar(80) DEFAULT NULL COMMENT '显示名称',
  `px` int(11) DEFAULT NULL COMMENT '横向位置',
  `py` int(11) DEFAULT NULL COMMENT '纵向位置',
  `tx_time` datetime DEFAULT NULL COMMENT '登记日期',
  `up_time` datetime DEFAULT NULL COMMENT '更新日期',
  `tx_op` varchar(30) DEFAULT NULL COMMENT '登记人',
  `up_op` varchar(30) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`use_id`,`dt_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='据集使用表';

-- ----------------------------
-- Records of dt_table
-- ----------------------------

-- ----------------------------
-- Table structure for dt_table_rs
-- ----------------------------
DROP TABLE IF EXISTS `dt_table_rs`;
CREATE TABLE `dt_table_rs` (
  `rs_id` int(11) NOT NULL COMMENT '关系编号',
  `use_id` int(11) NOT NULL COMMENT '引用编号',
  `rs_type` varchar(10) DEFAULT NULL COMMENT '关系类型(union/join)',
  `rs_model` varchar(1) DEFAULT NULL COMMENT '关系模式',
  `tx_time` datetime DEFAULT NULL COMMENT '登记日期',
  `up_time` datetime DEFAULT NULL COMMENT '更新日期',
  `tx_op` varchar(30) DEFAULT NULL COMMENT '登记人',
  `up_op` varchar(30) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`rs_id`,`use_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据集引用表关系表';

-- ----------------------------
-- Records of dt_table_rs
-- ----------------------------

-- ----------------------------
-- Table structure for dt_table_rs_condition
-- ----------------------------
DROP TABLE IF EXISTS `dt_table_rs_condition`;
CREATE TABLE `dt_table_rs_condition` (
  `cd_id` int(11) NOT NULL COMMENT '关系编号',
  `cd_type` varchar(10) DEFAULT NULL COMMENT '关系类型',
  `rename` varchar(255) DEFAULT NULL COMMENT '输出名称',
  `left_table` varchar(255) DEFAULT NULL COMMENT '左侧表',
  `left_col` varchar(255) DEFAULT NULL COMMENT '左侧字段',
  `operator` varchar(255) DEFAULT NULL COMMENT '操作符',
  `right_table` varchar(255) DEFAULT NULL COMMENT '右侧表',
  `right_col` varchar(255) DEFAULT NULL COMMENT '右侧字段',
  `tx_time` datetime DEFAULT NULL COMMENT '创建时间',
  `tx_op` varchar(255) DEFAULT NULL COMMENT '登记人',
  PRIMARY KEY (`cd_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据集表关系表';

-- ----------------------------
-- Records of dt_table_rs_condition
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(120) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('RdpScheduler', 'TASK_1', 'DEFAULT', '0 0/30 * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RdpScheduler', 'TASK_2', 'DEFAULT', '0 0/1 * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`),
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`),
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('RdpScheduler', 'TASK_1', 'DEFAULT', null, 'io.report.modules.job.utils.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597372002E696F2E7265706F72742E6D6F64756C65732E6A6F622E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200084C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C000A6D6574686F644E616D6571007E00094C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000158BAF593307874000E3020302F3330202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787000000000000000017400047465737474000672656E72656E74000FE69C89E58F82E695B0E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000007800);
INSERT INTO `qrtz_job_details` VALUES ('RdpScheduler', 'TASK_2', 'DEFAULT', null, 'io.report.modules.job.utils.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597372002E696F2E7265706F72742E6D6F64756C65732E6A6F622E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200084C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C000A6D6574686F644E616D6571007E00094C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000158C377C4607874000D3020302F31202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000274000574657374327074000FE697A0E58F82E695B0E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000017800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('RdpScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('RdpScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('RdpScheduler', 'jzh1538095544583', '1538103904271', '15000');

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`),
  KEY `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('RdpScheduler', 'TASK_1', 'DEFAULT', 'TASK_1', 'DEFAULT', null, '1535688000000', '-1', '5', 'PAUSED', 'CRON', '1535686297000', '0', null, '2', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597372002E696F2E7265706F72742E6D6F64756C65732E6A6F622E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200084C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C000A6D6574686F644E616D6571007E00094C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000158BAF593307874000E3020302F3330202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787000000000000000017400047465737474000672656E72656E74000FE69C89E58F82E695B0E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000017800);
INSERT INTO `qrtz_triggers` VALUES ('RdpScheduler', 'TASK_2', 'DEFAULT', 'TASK_2', 'DEFAULT', null, '1535686320000', '-1', '5', 'PAUSED', 'CRON', '1535686298000', '0', null, '2', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597372002E696F2E7265706F72742E6D6F64756C65732E6A6F622E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200084C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C000A6D6574686F644E616D6571007E00094C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000158C377C4607874000D3020302F31202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000274000574657374327074000FE697A0E58F82E695B0E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000017800);

-- ----------------------------
-- Table structure for schedule_job
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job`;
CREATE TABLE `schedule_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `method_name` varchar(100) DEFAULT NULL COMMENT '方法名',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `cron_expression` varchar(100) DEFAULT NULL COMMENT 'cron表达式',
  `status` tinyint(4) DEFAULT NULL COMMENT '任务状态  0：正常  1：暂停',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='定时任务';

-- ----------------------------
-- Records of schedule_job
-- ----------------------------
INSERT INTO `schedule_job` VALUES ('1', 'testTask', 'test', 'renren', '0 0/30 * * * ?', '1', '有参数测试', '2016-12-01 23:16:46');
INSERT INTO `schedule_job` VALUES ('2', 'testTask', 'test2', null, '0 0/1 * * * ?', '1', '无参数测试', '2016-12-03 14:55:56');

-- ----------------------------
-- Table structure for schedule_job_log
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job_log`;
CREATE TABLE `schedule_job_log` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志id',
  `job_id` bigint(20) NOT NULL COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `method_name` varchar(100) DEFAULT NULL COMMENT '方法名',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `status` tinyint(4) NOT NULL COMMENT '任务状态    0：成功    1：失败',
  `error` varchar(2000) DEFAULT NULL COMMENT '失败信息',
  `times` int(11) NOT NULL COMMENT '耗时(单位：毫秒)',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`log_id`),
  KEY `job_id` (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8 COMMENT='定时任务日志';

-- ----------------------------
-- Records of schedule_job_log
-- ----------------------------
INSERT INTO `schedule_job_log` VALUES ('69', '1', 'testTask', 'test', 'renren', '0', null, '1086', '2018-09-05 13:30:00');

-- ----------------------------
-- Table structure for sys_area
-- ----------------------------
DROP TABLE IF EXISTS `sys_area`;
CREATE TABLE `sys_area` (
  `area_no` varchar(15) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `area_name` varchar(80) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `lev` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `uplev` varchar(15) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `area_sts` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `if_leaf` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  UNIQUE KEY `sys_area_idx1` (`area_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_area
-- ----------------------------
INSERT INTO `sys_area` VALUES ('110000', '北京市', '1', '0', '1', null);
INSERT INTO `sys_area` VALUES ('110100', '市辖区', '2', '110000', '0', '1');
INSERT INTO `sys_area` VALUES ('110101', '东城区', '2', '110000', '1', '1');
INSERT INTO `sys_area` VALUES ('110102', '西城区', '2', '110000', '1', '1');
INSERT INTO `sys_area` VALUES ('110103', '崇文区', '2', '110000', '1', '1');
INSERT INTO `sys_area` VALUES ('110104', '宣武区', '2', '110000', '1', '1');
INSERT INTO `sys_area` VALUES ('110105', '朝阳区', '2', '110000', '1', '1');
INSERT INTO `sys_area` VALUES ('110106', '丰台区', '2', '110000', '1', '1');
INSERT INTO `sys_area` VALUES ('110107', '石景山区', '2', '110000', '1', '1');
INSERT INTO `sys_area` VALUES ('110108', '海淀区', '2', '110000', '1', '1');
INSERT INTO `sys_area` VALUES ('110109', '门头沟区', '2', '110000', '1', '1');
INSERT INTO `sys_area` VALUES ('110111', '房山区', '2', '110000', '1', '1');
INSERT INTO `sys_area` VALUES ('110112', '通州区', '2', '110000', '1', '1');
INSERT INTO `sys_area` VALUES ('110113', '顺义区', '2', '110000', '1', '1');
INSERT INTO `sys_area` VALUES ('110114', '昌平区', '2', '110000', '1', '1');
INSERT INTO `sys_area` VALUES ('110115', '大兴区', '2', '110000', '1', '1');
INSERT INTO `sys_area` VALUES ('110116', '怀柔区', '2', '110000', '1', '1');
INSERT INTO `sys_area` VALUES ('110117', '平谷区', '2', '110000', '1', '1');
INSERT INTO `sys_area` VALUES ('110228', '密云县', '2', '110000', '1', '1');
INSERT INTO `sys_area` VALUES ('110229', '延庆县', '2', '110000', '1', '1');
INSERT INTO `sys_area` VALUES ('120000', '天津市', '1', '0', '1', null);
INSERT INTO `sys_area` VALUES ('120100', '市辖区', '2', '120000', '0', '1');
INSERT INTO `sys_area` VALUES ('120101', '和平区', '2', '120000', '1', '1');
INSERT INTO `sys_area` VALUES ('120102', '河东区', '2', '120000', '1', '1');
INSERT INTO `sys_area` VALUES ('120103', '河西区', '2', '120000', '1', '1');
INSERT INTO `sys_area` VALUES ('120104', '南开区', '2', '120000', '1', '1');
INSERT INTO `sys_area` VALUES ('120105', '河北区', '2', '120000', '1', '1');
INSERT INTO `sys_area` VALUES ('120106', '红桥区', '2', '120000', '1', '1');
INSERT INTO `sys_area` VALUES ('120107', '塘沽区', '2', '120000', '1', '1');
INSERT INTO `sys_area` VALUES ('120108', '汉沽区', '2', '120000', '1', '1');
INSERT INTO `sys_area` VALUES ('120109', '大港区', '2', '120000', '1', '1');
INSERT INTO `sys_area` VALUES ('120110', '东丽区', '2', '120000', '1', '1');
INSERT INTO `sys_area` VALUES ('120111', '西青区', '2', '120000', '1', '1');
INSERT INTO `sys_area` VALUES ('120112', '津南区', '2', '120000', '1', '1');
INSERT INTO `sys_area` VALUES ('120113', '北辰区', '2', '120000', '1', '1');
INSERT INTO `sys_area` VALUES ('120114', '武清区', '2', '120000', '1', '1');
INSERT INTO `sys_area` VALUES ('120115', '宝坻区', '2', '120000', '1', '1');
INSERT INTO `sys_area` VALUES ('120221', '宁河县', '2', '120000', '1', '1');
INSERT INTO `sys_area` VALUES ('120223', '静海县', '2', '120000', '1', '1');
INSERT INTO `sys_area` VALUES ('120225', '蓟县', '2', '120000', '1', '1');
INSERT INTO `sys_area` VALUES ('130000', '河北省', '1', '0', '1', null);
INSERT INTO `sys_area` VALUES ('130100', '石家庄市', '2', '130000', '1', null);
INSERT INTO `sys_area` VALUES ('130101', '市辖区', '3', '130100', '0', '1');
INSERT INTO `sys_area` VALUES ('130102', '长安区', '3', '130100', '1', '1');
INSERT INTO `sys_area` VALUES ('130103', '桥东区', '3', '130100', '1', '1');
INSERT INTO `sys_area` VALUES ('130104', '桥西区', '3', '130100', '1', '1');
INSERT INTO `sys_area` VALUES ('130105', '新华区', '3', '130100', '1', '1');
INSERT INTO `sys_area` VALUES ('130107', '井陉矿区', '3', '130100', '1', '1');
INSERT INTO `sys_area` VALUES ('130108', '裕华区', '3', '130100', '1', '1');
INSERT INTO `sys_area` VALUES ('130121', '井陉县', '3', '130100', '1', '1');
INSERT INTO `sys_area` VALUES ('130123', '正定县', '3', '130100', '1', '1');
INSERT INTO `sys_area` VALUES ('130124', '栾城县', '3', '130100', '1', '1');
INSERT INTO `sys_area` VALUES ('130125', '行唐县', '3', '130100', '1', '1');
INSERT INTO `sys_area` VALUES ('130126', '灵寿县', '3', '130100', '1', '1');
INSERT INTO `sys_area` VALUES ('130127', '高邑县', '3', '130100', '1', '1');
INSERT INTO `sys_area` VALUES ('130128', '深泽县', '3', '130100', '1', '1');
INSERT INTO `sys_area` VALUES ('130129', '赞皇县', '3', '130100', '1', '1');
INSERT INTO `sys_area` VALUES ('130130', '无极县', '3', '130100', '1', '1');
INSERT INTO `sys_area` VALUES ('130131', '平山县', '3', '130100', '1', '1');
INSERT INTO `sys_area` VALUES ('130132', '元氏县', '3', '130100', '1', '1');
INSERT INTO `sys_area` VALUES ('130133', '赵县', '3', '130100', '1', '1');
INSERT INTO `sys_area` VALUES ('130181', '辛集市', '3', '130100', '1', '1');
INSERT INTO `sys_area` VALUES ('130182', '藁城市', '3', '130100', '1', '1');
INSERT INTO `sys_area` VALUES ('130183', '晋州市', '3', '130100', '1', '1');
INSERT INTO `sys_area` VALUES ('130184', '新乐市', '3', '130100', '1', '1');
INSERT INTO `sys_area` VALUES ('130185', '鹿泉市', '3', '130100', '1', '1');
INSERT INTO `sys_area` VALUES ('130200', '唐山市', '2', '130000', '1', null);
INSERT INTO `sys_area` VALUES ('130201', '市辖区', '3', '130200', '0', '1');
INSERT INTO `sys_area` VALUES ('130202', '路南区', '3', '130200', '1', '1');
INSERT INTO `sys_area` VALUES ('130203', '路北区', '3', '130200', '1', '1');
INSERT INTO `sys_area` VALUES ('130204', '古冶区', '3', '130200', '1', '1');
INSERT INTO `sys_area` VALUES ('130205', '开平区', '3', '130200', '1', '1');
INSERT INTO `sys_area` VALUES ('130207', '丰南区', '3', '130200', '1', '1');
INSERT INTO `sys_area` VALUES ('130208', '丰润区', '3', '130200', '1', '1');
INSERT INTO `sys_area` VALUES ('130223', '滦县', '3', '130200', '1', '1');
INSERT INTO `sys_area` VALUES ('130224', '滦南县', '3', '130200', '1', '1');
INSERT INTO `sys_area` VALUES ('130225', '乐亭县', '3', '130200', '1', '1');
INSERT INTO `sys_area` VALUES ('130227', '迁西县', '3', '130200', '1', '1');
INSERT INTO `sys_area` VALUES ('130229', '玉田县', '3', '130200', '1', '1');
INSERT INTO `sys_area` VALUES ('130230', '唐海县', '3', '130200', '1', '1');
INSERT INTO `sys_area` VALUES ('130281', '遵化市', '3', '130200', '1', '1');
INSERT INTO `sys_area` VALUES ('130283', '迁安市', '3', '130200', '1', '1');
INSERT INTO `sys_area` VALUES ('130300', '秦皇岛市', '2', '130000', '1', null);
INSERT INTO `sys_area` VALUES ('130301', '市辖区', '3', '130300', '0', '1');
INSERT INTO `sys_area` VALUES ('130302', '海港区', '3', '130300', '1', '1');
INSERT INTO `sys_area` VALUES ('130303', '山海关区', '3', '130300', '1', '1');
INSERT INTO `sys_area` VALUES ('130304', '北戴河区', '3', '130300', '1', '1');
INSERT INTO `sys_area` VALUES ('130321', '青龙满族自治县', '3', '130300', '1', '1');
INSERT INTO `sys_area` VALUES ('130322', '昌黎县', '3', '130300', '1', '1');
INSERT INTO `sys_area` VALUES ('130323', '抚宁县', '3', '130300', '1', '1');
INSERT INTO `sys_area` VALUES ('130324', '卢龙县', '3', '130300', '1', '1');
INSERT INTO `sys_area` VALUES ('130400', '邯郸市', '2', '130000', '1', null);
INSERT INTO `sys_area` VALUES ('130401', '市辖区', '3', '130400', '0', '1');
INSERT INTO `sys_area` VALUES ('130402', '邯山区', '3', '130400', '1', '1');
INSERT INTO `sys_area` VALUES ('130403', '丛台区', '3', '130400', '1', '1');
INSERT INTO `sys_area` VALUES ('130404', '复兴区', '3', '130400', '1', '1');
INSERT INTO `sys_area` VALUES ('130406', '峰峰矿区', '3', '130400', '1', '1');
INSERT INTO `sys_area` VALUES ('130421', '邯郸县', '3', '130400', '1', '1');
INSERT INTO `sys_area` VALUES ('130423', '临漳县', '3', '130400', '1', '1');
INSERT INTO `sys_area` VALUES ('130424', '成安县', '3', '130400', '1', '1');
INSERT INTO `sys_area` VALUES ('130425', '大名县', '3', '130400', '1', '1');
INSERT INTO `sys_area` VALUES ('130426', '涉县', '3', '130400', '1', '1');
INSERT INTO `sys_area` VALUES ('130427', '磁县', '3', '130400', '1', '1');
INSERT INTO `sys_area` VALUES ('130428', '肥乡县', '3', '130400', '1', '1');
INSERT INTO `sys_area` VALUES ('130429', '永年县', '3', '130400', '1', '1');
INSERT INTO `sys_area` VALUES ('130430', '邱县', '3', '130400', '1', '1');
INSERT INTO `sys_area` VALUES ('130431', '鸡泽县', '3', '130400', '1', '1');
INSERT INTO `sys_area` VALUES ('130432', '广平县', '3', '130400', '1', '1');
INSERT INTO `sys_area` VALUES ('130433', '馆陶县', '3', '130400', '1', '1');
INSERT INTO `sys_area` VALUES ('130434', '魏县', '3', '130400', '1', '1');
INSERT INTO `sys_area` VALUES ('130435', '曲周县', '3', '130400', '1', '1');
INSERT INTO `sys_area` VALUES ('130481', '武安市', '3', '130400', '1', '1');
INSERT INTO `sys_area` VALUES ('130500', '邢台市', '2', '130000', '1', null);
INSERT INTO `sys_area` VALUES ('130501', '市辖区', '3', '130500', '0', '1');
INSERT INTO `sys_area` VALUES ('130502', '桥东区', '3', '130500', '1', '1');
INSERT INTO `sys_area` VALUES ('130503', '桥西区', '3', '130500', '1', '1');
INSERT INTO `sys_area` VALUES ('130521', '邢台县', '3', '130500', '1', '1');
INSERT INTO `sys_area` VALUES ('130522', '临城县', '3', '130500', '1', '1');
INSERT INTO `sys_area` VALUES ('130523', '内丘县', '3', '130500', '1', '1');
INSERT INTO `sys_area` VALUES ('130524', '柏乡县', '3', '130500', '1', '1');
INSERT INTO `sys_area` VALUES ('130525', '隆尧县', '3', '130500', '1', '1');
INSERT INTO `sys_area` VALUES ('130526', '任县', '3', '130500', '1', '1');
INSERT INTO `sys_area` VALUES ('130527', '南和县', '3', '130500', '1', '1');
INSERT INTO `sys_area` VALUES ('130528', '宁晋县', '3', '130500', '1', '1');
INSERT INTO `sys_area` VALUES ('130529', '巨鹿县', '3', '130500', '1', '1');
INSERT INTO `sys_area` VALUES ('130530', '新河县', '3', '130500', '1', '1');
INSERT INTO `sys_area` VALUES ('130531', '广宗县', '3', '130500', '1', '1');
INSERT INTO `sys_area` VALUES ('130532', '平乡县', '3', '130500', '1', '1');
INSERT INTO `sys_area` VALUES ('130533', '威县', '3', '130500', '1', '1');
INSERT INTO `sys_area` VALUES ('130534', '清河县', '3', '130500', '1', '1');
INSERT INTO `sys_area` VALUES ('130535', '临西县', '3', '130500', '1', '1');
INSERT INTO `sys_area` VALUES ('130581', '南宫市', '3', '130500', '1', '1');
INSERT INTO `sys_area` VALUES ('130582', '沙河市', '3', '130500', '1', '1');
INSERT INTO `sys_area` VALUES ('130600', '保定市', '2', '130000', '1', null);
INSERT INTO `sys_area` VALUES ('130601', '市辖区', '3', '130600', '0', '1');
INSERT INTO `sys_area` VALUES ('130602', '新市区', '3', '130600', '1', '1');
INSERT INTO `sys_area` VALUES ('130603', '北市区', '3', '130600', '1', '1');
INSERT INTO `sys_area` VALUES ('130604', '南市区', '3', '130600', '1', '1');
INSERT INTO `sys_area` VALUES ('130621', '满城县', '3', '130600', '1', '1');
INSERT INTO `sys_area` VALUES ('130622', '清苑县', '3', '130600', '1', '1');
INSERT INTO `sys_area` VALUES ('130623', '涞水县', '3', '130600', '1', '1');
INSERT INTO `sys_area` VALUES ('130624', '阜平县', '3', '130600', '1', '1');
INSERT INTO `sys_area` VALUES ('130625', '徐水县', '3', '130600', '1', '1');
INSERT INTO `sys_area` VALUES ('130626', '定兴县', '3', '130600', '1', '1');
INSERT INTO `sys_area` VALUES ('130627', '唐县', '3', '130600', '1', '1');
INSERT INTO `sys_area` VALUES ('130628', '高阳县', '3', '130600', '1', '1');
INSERT INTO `sys_area` VALUES ('130629', '容城县', '3', '130600', '1', '1');
INSERT INTO `sys_area` VALUES ('130630', '涞源县', '3', '130600', '1', '1');
INSERT INTO `sys_area` VALUES ('130631', '望都县', '3', '130600', '1', '1');
INSERT INTO `sys_area` VALUES ('130632', '安新县', '3', '130600', '1', '1');
INSERT INTO `sys_area` VALUES ('130633', '易县', '3', '130600', '1', '1');
INSERT INTO `sys_area` VALUES ('130634', '曲阳县', '3', '130600', '1', '1');
INSERT INTO `sys_area` VALUES ('130635', '蠡县', '3', '130600', '1', '1');
INSERT INTO `sys_area` VALUES ('130636', '顺平县', '3', '130600', '1', '1');
INSERT INTO `sys_area` VALUES ('130637', '博野县', '3', '130600', '1', '1');
INSERT INTO `sys_area` VALUES ('130638', '雄县', '3', '130600', '1', '1');
INSERT INTO `sys_area` VALUES ('130681', '涿州市', '3', '130600', '1', '1');
INSERT INTO `sys_area` VALUES ('130682', '定州市', '3', '130600', '1', '1');
INSERT INTO `sys_area` VALUES ('130683', '安国市', '3', '130600', '1', '1');
INSERT INTO `sys_area` VALUES ('130684', '高碑店市', '3', '130600', '1', '1');
INSERT INTO `sys_area` VALUES ('130700', '张家口市', '2', '130000', '1', null);
INSERT INTO `sys_area` VALUES ('130701', '市辖区', '3', '130700', '0', '1');
INSERT INTO `sys_area` VALUES ('130702', '桥东区', '3', '130700', '1', '1');
INSERT INTO `sys_area` VALUES ('130703', '桥西区', '3', '130700', '1', '1');
INSERT INTO `sys_area` VALUES ('130705', '宣化区', '3', '130700', '1', '1');
INSERT INTO `sys_area` VALUES ('130706', '下花园区', '3', '130700', '1', '1');
INSERT INTO `sys_area` VALUES ('130721', '宣化县', '3', '130700', '1', '1');
INSERT INTO `sys_area` VALUES ('130722', '张北县', '3', '130700', '1', '1');
INSERT INTO `sys_area` VALUES ('130723', '康保县', '3', '130700', '1', '1');
INSERT INTO `sys_area` VALUES ('130724', '沽源县', '3', '130700', '1', '1');
INSERT INTO `sys_area` VALUES ('130725', '尚义县', '3', '130700', '1', '1');
INSERT INTO `sys_area` VALUES ('130726', '蔚县', '3', '130700', '1', '1');
INSERT INTO `sys_area` VALUES ('130727', '阳原县', '3', '130700', '1', '1');
INSERT INTO `sys_area` VALUES ('130728', '怀安县', '3', '130700', '1', '1');
INSERT INTO `sys_area` VALUES ('130729', '万全县', '3', '130700', '1', '1');
INSERT INTO `sys_area` VALUES ('130730', '怀来县', '3', '130700', '1', '1');
INSERT INTO `sys_area` VALUES ('130731', '涿鹿县', '3', '130700', '1', '1');
INSERT INTO `sys_area` VALUES ('130732', '赤城县', '3', '130700', '1', '1');
INSERT INTO `sys_area` VALUES ('130733', '崇礼县', '3', '130700', '1', '1');
INSERT INTO `sys_area` VALUES ('130800', '承德市', '2', '130000', '1', null);
INSERT INTO `sys_area` VALUES ('130801', '市辖区', '3', '130800', '0', '1');
INSERT INTO `sys_area` VALUES ('130802', '双桥区', '3', '130800', '1', '1');
INSERT INTO `sys_area` VALUES ('130803', '双滦区', '3', '130800', '1', '1');
INSERT INTO `sys_area` VALUES ('130804', '鹰手营子矿区', '3', '130800', '1', '1');
INSERT INTO `sys_area` VALUES ('130821', '承德县', '3', '130800', '1', '1');
INSERT INTO `sys_area` VALUES ('130822', '兴隆县', '3', '130800', '1', '1');
INSERT INTO `sys_area` VALUES ('130823', '平泉县', '3', '130800', '1', '1');
INSERT INTO `sys_area` VALUES ('130824', '滦平县', '3', '130800', '1', '1');
INSERT INTO `sys_area` VALUES ('130825', '隆化县', '3', '130800', '1', '1');
INSERT INTO `sys_area` VALUES ('130826', '丰宁满族自治县', '3', '130800', '1', '1');
INSERT INTO `sys_area` VALUES ('130827', '宽城满族自治县', '3', '130800', '1', '1');
INSERT INTO `sys_area` VALUES ('130828', '围场满族蒙古族自治县', '3', '130800', '1', '1');
INSERT INTO `sys_area` VALUES ('130900', '沧州市', '2', '130000', '1', null);
INSERT INTO `sys_area` VALUES ('130901', '市辖区', '3', '130900', '0', '1');
INSERT INTO `sys_area` VALUES ('130902', '新华区', '3', '130900', '1', '1');
INSERT INTO `sys_area` VALUES ('130903', '运河区', '3', '130900', '1', '1');
INSERT INTO `sys_area` VALUES ('130921', '沧县', '3', '130900', '1', '1');
INSERT INTO `sys_area` VALUES ('130922', '青县', '3', '130900', '1', '1');
INSERT INTO `sys_area` VALUES ('130923', '东光县', '3', '130900', '1', '1');
INSERT INTO `sys_area` VALUES ('130924', '海兴县', '3', '130900', '1', '1');
INSERT INTO `sys_area` VALUES ('130925', '盐山县', '3', '130900', '1', '1');
INSERT INTO `sys_area` VALUES ('130926', '肃宁县', '3', '130900', '1', '1');
INSERT INTO `sys_area` VALUES ('130927', '南皮县', '3', '130900', '1', '1');
INSERT INTO `sys_area` VALUES ('130928', '吴桥县', '3', '130900', '1', '1');
INSERT INTO `sys_area` VALUES ('130929', '献县', '3', '130900', '1', '1');
INSERT INTO `sys_area` VALUES ('130930', '孟村回族自治县', '3', '130900', '1', '1');
INSERT INTO `sys_area` VALUES ('130981', '泊头市', '3', '130900', '1', '1');
INSERT INTO `sys_area` VALUES ('130982', '任丘市', '3', '130900', '1', '1');
INSERT INTO `sys_area` VALUES ('130983', '黄骅市', '3', '130900', '1', '1');
INSERT INTO `sys_area` VALUES ('130984', '河间市', '3', '130900', '1', '1');
INSERT INTO `sys_area` VALUES ('131000', '廊坊市', '2', '130000', '1', null);
INSERT INTO `sys_area` VALUES ('131001', '市辖区', '3', '131000', '0', '1');
INSERT INTO `sys_area` VALUES ('131002', '安次区', '3', '131000', '1', '1');
INSERT INTO `sys_area` VALUES ('131003', '广阳区', '3', '131000', '1', '1');
INSERT INTO `sys_area` VALUES ('131022', '固安县', '3', '131000', '1', '1');
INSERT INTO `sys_area` VALUES ('131023', '永清县', '3', '131000', '1', '1');
INSERT INTO `sys_area` VALUES ('131024', '香河县', '3', '131000', '1', '1');
INSERT INTO `sys_area` VALUES ('131025', '大城县', '3', '131000', '1', '1');
INSERT INTO `sys_area` VALUES ('131026', '文安县', '3', '131000', '1', '1');
INSERT INTO `sys_area` VALUES ('131028', '大厂回族自治县', '3', '131000', '1', '1');
INSERT INTO `sys_area` VALUES ('131081', '霸州市', '3', '131000', '1', '1');
INSERT INTO `sys_area` VALUES ('131082', '三河市', '3', '131000', '1', '1');
INSERT INTO `sys_area` VALUES ('131100', '衡水市', '2', '130000', '1', null);
INSERT INTO `sys_area` VALUES ('131101', '市辖区', '3', '131100', '0', '1');
INSERT INTO `sys_area` VALUES ('131102', '桃城区', '3', '131100', '1', '1');
INSERT INTO `sys_area` VALUES ('131121', '枣强县', '3', '131100', '1', '1');
INSERT INTO `sys_area` VALUES ('131122', '武邑县', '3', '131100', '1', '1');
INSERT INTO `sys_area` VALUES ('131123', '武强县', '3', '131100', '1', '1');
INSERT INTO `sys_area` VALUES ('131124', '饶阳县', '3', '131100', '1', '1');
INSERT INTO `sys_area` VALUES ('131125', '安平县', '3', '131100', '1', '1');
INSERT INTO `sys_area` VALUES ('131126', '故城县', '3', '131100', '1', '1');
INSERT INTO `sys_area` VALUES ('131127', '景县', '3', '131100', '1', '1');
INSERT INTO `sys_area` VALUES ('131128', '阜城县', '3', '131100', '1', '1');
INSERT INTO `sys_area` VALUES ('131181', '冀州市', '3', '131100', '1', '1');
INSERT INTO `sys_area` VALUES ('131182', '深州市', '3', '131100', '1', '1');
INSERT INTO `sys_area` VALUES ('140000', '山西省', '1', '0', '1', null);
INSERT INTO `sys_area` VALUES ('140100', '太原市', '2', '140000', '1', null);
INSERT INTO `sys_area` VALUES ('140101', '市辖区', '3', '140100', '0', '1');
INSERT INTO `sys_area` VALUES ('140105', '小店区', '3', '140100', '1', '1');
INSERT INTO `sys_area` VALUES ('140106', '迎泽区', '3', '140100', '1', '1');
INSERT INTO `sys_area` VALUES ('140107', '杏花岭区', '3', '140100', '1', '1');
INSERT INTO `sys_area` VALUES ('140108', '尖草坪区', '3', '140100', '1', '1');
INSERT INTO `sys_area` VALUES ('140109', '万柏林区', '3', '140100', '1', '1');
INSERT INTO `sys_area` VALUES ('140110', '晋源区', '3', '140100', '1', '1');
INSERT INTO `sys_area` VALUES ('140121', '清徐县', '3', '140100', '1', '1');
INSERT INTO `sys_area` VALUES ('140122', '阳曲县', '3', '140100', '1', '1');
INSERT INTO `sys_area` VALUES ('140123', '娄烦县', '3', '140100', '1', '1');
INSERT INTO `sys_area` VALUES ('140181', '古交市', '3', '140100', '1', '1');
INSERT INTO `sys_area` VALUES ('140200', '大同市', '2', '140000', '1', null);
INSERT INTO `sys_area` VALUES ('140201', '市辖区', '3', '140200', '0', '1');
INSERT INTO `sys_area` VALUES ('140202', '城区', '3', '140200', '1', '1');
INSERT INTO `sys_area` VALUES ('140203', '矿区', '3', '140200', '1', '1');
INSERT INTO `sys_area` VALUES ('140211', '南郊区', '3', '140200', '1', '1');
INSERT INTO `sys_area` VALUES ('140212', '新荣区', '3', '140200', '1', '1');
INSERT INTO `sys_area` VALUES ('140221', '阳高县', '3', '140200', '1', '1');
INSERT INTO `sys_area` VALUES ('140222', '天镇县', '3', '140200', '1', '1');
INSERT INTO `sys_area` VALUES ('140223', '广灵县', '3', '140200', '1', '1');
INSERT INTO `sys_area` VALUES ('140224', '灵丘县', '3', '140200', '1', '1');
INSERT INTO `sys_area` VALUES ('140225', '浑源县', '3', '140200', '1', '1');
INSERT INTO `sys_area` VALUES ('140226', '左云县', '3', '140200', '1', '1');
INSERT INTO `sys_area` VALUES ('140227', '大同县', '3', '140200', '1', '1');
INSERT INTO `sys_area` VALUES ('140300', '阳泉市', '2', '140000', '1', null);
INSERT INTO `sys_area` VALUES ('140301', '市辖区', '3', '140300', '0', '1');
INSERT INTO `sys_area` VALUES ('140302', '城区', '3', '140300', '1', '1');
INSERT INTO `sys_area` VALUES ('140303', '矿区', '3', '140300', '1', '1');
INSERT INTO `sys_area` VALUES ('140311', '郊区', '3', '140300', '1', '1');
INSERT INTO `sys_area` VALUES ('140321', '平定县', '3', '140300', '1', '1');
INSERT INTO `sys_area` VALUES ('140322', '盂县', '3', '140300', '1', '1');
INSERT INTO `sys_area` VALUES ('140400', '长治市', '2', '140000', '1', null);
INSERT INTO `sys_area` VALUES ('140401', '市辖区', '3', '140400', '0', '1');
INSERT INTO `sys_area` VALUES ('140402', '城区', '3', '140400', '1', '1');
INSERT INTO `sys_area` VALUES ('140411', '郊区', '3', '140400', '1', '1');
INSERT INTO `sys_area` VALUES ('140421', '长治县', '3', '140400', '1', '1');
INSERT INTO `sys_area` VALUES ('140423', '襄垣县', '3', '140400', '1', '1');
INSERT INTO `sys_area` VALUES ('140424', '屯留县', '3', '140400', '1', '1');
INSERT INTO `sys_area` VALUES ('140425', '平顺县', '3', '140400', '1', '1');
INSERT INTO `sys_area` VALUES ('140426', '黎城县', '3', '140400', '1', '1');
INSERT INTO `sys_area` VALUES ('140427', '壶关县', '3', '140400', '1', '1');
INSERT INTO `sys_area` VALUES ('140428', '长子县', '3', '140400', '1', '1');
INSERT INTO `sys_area` VALUES ('140429', '武乡县', '3', '140400', '1', '1');
INSERT INTO `sys_area` VALUES ('140430', '沁县', '3', '140400', '1', '1');
INSERT INTO `sys_area` VALUES ('140431', '沁源县', '3', '140400', '1', '1');
INSERT INTO `sys_area` VALUES ('140481', '潞城市', '3', '140400', '1', '1');
INSERT INTO `sys_area` VALUES ('140500', '晋城市', '2', '140000', '1', null);
INSERT INTO `sys_area` VALUES ('140501', '市辖区', '3', '140500', '0', '1');
INSERT INTO `sys_area` VALUES ('140502', '城区', '3', '140500', '1', '1');
INSERT INTO `sys_area` VALUES ('140521', '沁水县', '3', '140500', '1', '1');
INSERT INTO `sys_area` VALUES ('140522', '阳城县', '3', '140500', '1', '1');
INSERT INTO `sys_area` VALUES ('140524', '陵川县', '3', '140500', '1', '1');
INSERT INTO `sys_area` VALUES ('140525', '泽州县', '3', '140500', '1', '1');
INSERT INTO `sys_area` VALUES ('140581', '高平市', '3', '140500', '1', '1');
INSERT INTO `sys_area` VALUES ('140600', '朔州市', '2', '140000', '1', null);
INSERT INTO `sys_area` VALUES ('140601', '市辖区', '3', '140600', '0', '1');
INSERT INTO `sys_area` VALUES ('140602', '朔城区', '3', '140600', '1', '1');
INSERT INTO `sys_area` VALUES ('140603', '平鲁区', '3', '140600', '1', '1');
INSERT INTO `sys_area` VALUES ('140621', '山阴县', '3', '140600', '1', '1');
INSERT INTO `sys_area` VALUES ('140622', '应县', '3', '140600', '1', '1');
INSERT INTO `sys_area` VALUES ('140623', '右玉县', '3', '140600', '1', '1');
INSERT INTO `sys_area` VALUES ('140624', '怀仁县', '3', '140600', '1', '1');
INSERT INTO `sys_area` VALUES ('140700', '晋中市', '2', '140000', '1', null);
INSERT INTO `sys_area` VALUES ('140701', '市辖区', '3', '140700', '0', '1');
INSERT INTO `sys_area` VALUES ('140702', '榆次区', '3', '140700', '1', '1');
INSERT INTO `sys_area` VALUES ('140721', '榆社县', '3', '140700', '1', '1');
INSERT INTO `sys_area` VALUES ('140722', '左权县', '3', '140700', '1', '1');
INSERT INTO `sys_area` VALUES ('140723', '和顺县', '3', '140700', '1', '1');
INSERT INTO `sys_area` VALUES ('140724', '昔阳县', '3', '140700', '1', '1');
INSERT INTO `sys_area` VALUES ('140725', '寿阳县', '3', '140700', '1', '1');
INSERT INTO `sys_area` VALUES ('140726', '太谷县', '3', '140700', '1', '1');
INSERT INTO `sys_area` VALUES ('140727', '祁县', '3', '140700', '1', '1');
INSERT INTO `sys_area` VALUES ('140728', '平遥县', '3', '140700', '1', '1');
INSERT INTO `sys_area` VALUES ('140729', '灵石县', '3', '140700', '1', '1');
INSERT INTO `sys_area` VALUES ('140781', '介休市', '3', '140700', '1', '1');
INSERT INTO `sys_area` VALUES ('140800', '运城市', '2', '140000', '1', null);
INSERT INTO `sys_area` VALUES ('140801', '市辖区', '3', '140800', '0', '1');
INSERT INTO `sys_area` VALUES ('140802', '盐湖区', '3', '140800', '1', '1');
INSERT INTO `sys_area` VALUES ('140821', '临猗县', '3', '140800', '1', '1');
INSERT INTO `sys_area` VALUES ('140822', '万荣县', '3', '140800', '1', '1');
INSERT INTO `sys_area` VALUES ('140823', '闻喜县', '3', '140800', '1', '1');
INSERT INTO `sys_area` VALUES ('140824', '稷山县', '3', '140800', '1', '1');
INSERT INTO `sys_area` VALUES ('140825', '新绛县', '3', '140800', '1', '1');
INSERT INTO `sys_area` VALUES ('140826', '绛县', '3', '140800', '1', '1');
INSERT INTO `sys_area` VALUES ('140827', '垣曲县', '3', '140800', '1', '1');
INSERT INTO `sys_area` VALUES ('140828', '夏县', '3', '140800', '1', '1');
INSERT INTO `sys_area` VALUES ('140829', '平陆县', '3', '140800', '1', '1');
INSERT INTO `sys_area` VALUES ('140830', '芮城县', '3', '140800', '1', '1');
INSERT INTO `sys_area` VALUES ('140881', '永济市', '3', '140800', '1', '1');
INSERT INTO `sys_area` VALUES ('140882', '河津市', '3', '140800', '1', '1');
INSERT INTO `sys_area` VALUES ('140900', '忻州市', '2', '140000', '1', null);
INSERT INTO `sys_area` VALUES ('140901', '市辖区', '3', '140900', '0', '1');
INSERT INTO `sys_area` VALUES ('140902', '忻府区', '3', '140900', '1', '1');
INSERT INTO `sys_area` VALUES ('140921', '定襄县', '3', '140900', '1', '1');
INSERT INTO `sys_area` VALUES ('140922', '五台县', '3', '140900', '1', '1');
INSERT INTO `sys_area` VALUES ('140923', '代县', '3', '140900', '1', '1');
INSERT INTO `sys_area` VALUES ('140924', '繁峙县', '3', '140900', '1', '1');
INSERT INTO `sys_area` VALUES ('140925', '宁武县', '3', '140900', '1', '1');
INSERT INTO `sys_area` VALUES ('140926', '静乐县', '3', '140900', '1', '1');
INSERT INTO `sys_area` VALUES ('140927', '神池县', '3', '140900', '1', '1');
INSERT INTO `sys_area` VALUES ('140928', '五寨县', '3', '140900', '1', '1');
INSERT INTO `sys_area` VALUES ('140929', '岢岚县', '3', '140900', '1', '1');
INSERT INTO `sys_area` VALUES ('140930', '河曲县', '3', '140900', '1', '1');
INSERT INTO `sys_area` VALUES ('140931', '保德县', '3', '140900', '1', '1');
INSERT INTO `sys_area` VALUES ('140932', '偏关县', '3', '140900', '1', '1');
INSERT INTO `sys_area` VALUES ('140981', '原平市', '3', '140900', '1', '1');
INSERT INTO `sys_area` VALUES ('141000', '临汾市', '2', '140000', '1', null);
INSERT INTO `sys_area` VALUES ('141001', '市辖区', '3', '141000', '0', '1');
INSERT INTO `sys_area` VALUES ('141002', '尧都区', '3', '141000', '1', '1');
INSERT INTO `sys_area` VALUES ('141021', '曲沃县', '3', '141000', '1', '1');
INSERT INTO `sys_area` VALUES ('141022', '翼城县', '3', '141000', '1', '1');
INSERT INTO `sys_area` VALUES ('141023', '襄汾县', '3', '141000', '1', '1');
INSERT INTO `sys_area` VALUES ('141024', '洪洞县', '3', '141000', '1', '1');
INSERT INTO `sys_area` VALUES ('141025', '古县', '3', '141000', '1', '1');
INSERT INTO `sys_area` VALUES ('141026', '安泽县', '3', '141000', '1', '1');
INSERT INTO `sys_area` VALUES ('141027', '浮山县', '3', '141000', '1', '1');
INSERT INTO `sys_area` VALUES ('141028', '吉县', '3', '141000', '1', '1');
INSERT INTO `sys_area` VALUES ('141029', '乡宁县', '3', '141000', '1', '1');
INSERT INTO `sys_area` VALUES ('141030', '大宁县', '3', '141000', '1', '1');
INSERT INTO `sys_area` VALUES ('141031', '隰县', '3', '141000', '1', '1');
INSERT INTO `sys_area` VALUES ('141032', '永和县', '3', '141000', '1', '1');
INSERT INTO `sys_area` VALUES ('141033', '蒲县', '3', '141000', '1', '1');
INSERT INTO `sys_area` VALUES ('141034', '汾西县', '3', '141000', '1', '1');
INSERT INTO `sys_area` VALUES ('141081', '侯马市', '3', '141000', '1', '1');
INSERT INTO `sys_area` VALUES ('141082', '霍州市', '3', '141000', '1', '1');
INSERT INTO `sys_area` VALUES ('141100', '吕梁市', '2', '140000', '1', null);
INSERT INTO `sys_area` VALUES ('141101', '市辖区', '3', '141100', '0', '1');
INSERT INTO `sys_area` VALUES ('141102', '离石区', '3', '141100', '1', '1');
INSERT INTO `sys_area` VALUES ('141121', '文水县', '3', '141100', '1', '1');
INSERT INTO `sys_area` VALUES ('141122', '交城县', '3', '141100', '1', '1');
INSERT INTO `sys_area` VALUES ('141123', '兴县', '3', '141100', '1', '1');
INSERT INTO `sys_area` VALUES ('141124', '临县', '3', '141100', '1', '1');
INSERT INTO `sys_area` VALUES ('141125', '柳林县', '3', '141100', '1', '1');
INSERT INTO `sys_area` VALUES ('141126', '石楼县', '3', '141100', '1', '1');
INSERT INTO `sys_area` VALUES ('141127', '岚县', '3', '141100', '1', '1');
INSERT INTO `sys_area` VALUES ('141128', '方山县', '3', '141100', '1', '1');
INSERT INTO `sys_area` VALUES ('141129', '中阳县', '3', '141100', '1', '1');
INSERT INTO `sys_area` VALUES ('141130', '交口县', '3', '141100', '1', '1');
INSERT INTO `sys_area` VALUES ('141181', '孝义市', '3', '141100', '1', '1');
INSERT INTO `sys_area` VALUES ('141182', '汾阳市', '3', '141100', '1', '1');
INSERT INTO `sys_area` VALUES ('150000', '内蒙古自治区', '1', '0', '1', null);
INSERT INTO `sys_area` VALUES ('150100', '呼和浩特市', '2', '150000', '1', null);
INSERT INTO `sys_area` VALUES ('150101', '市辖区', '3', '150100', '0', '1');
INSERT INTO `sys_area` VALUES ('150102', '新城区', '3', '150100', '1', '1');
INSERT INTO `sys_area` VALUES ('150103', '回民区', '3', '150100', '1', '1');
INSERT INTO `sys_area` VALUES ('150104', '玉泉区', '3', '150100', '1', '1');
INSERT INTO `sys_area` VALUES ('150105', '赛罕区', '3', '150100', '1', '1');
INSERT INTO `sys_area` VALUES ('150121', '土默特左旗', '3', '150100', '1', '1');
INSERT INTO `sys_area` VALUES ('150122', '托克托县', '3', '150100', '1', '1');
INSERT INTO `sys_area` VALUES ('150123', '和林格尔县', '3', '150100', '1', '1');
INSERT INTO `sys_area` VALUES ('150124', '清水河县', '3', '150100', '1', '1');
INSERT INTO `sys_area` VALUES ('150125', '武川县', '3', '150100', '1', '1');
INSERT INTO `sys_area` VALUES ('150200', '包头市', '2', '150000', '1', null);
INSERT INTO `sys_area` VALUES ('150201', '市辖区', '3', '150200', '0', '1');
INSERT INTO `sys_area` VALUES ('150202', '东河区', '3', '150200', '1', '1');
INSERT INTO `sys_area` VALUES ('150203', '昆都仑区', '3', '150200', '1', '1');
INSERT INTO `sys_area` VALUES ('150204', '青山区', '3', '150200', '1', '1');
INSERT INTO `sys_area` VALUES ('150205', '石拐区', '3', '150200', '1', '1');
INSERT INTO `sys_area` VALUES ('150206', '白云矿区', '3', '150200', '1', '1');
INSERT INTO `sys_area` VALUES ('150207', '九原区', '3', '150200', '1', '1');
INSERT INTO `sys_area` VALUES ('150221', '土默特右旗', '3', '150200', '1', '1');
INSERT INTO `sys_area` VALUES ('150222', '固阳县', '3', '150200', '1', '1');
INSERT INTO `sys_area` VALUES ('150223', '达尔罕茂明安联合旗', '3', '150200', '1', '1');
INSERT INTO `sys_area` VALUES ('150300', '乌海市', '2', '150000', '1', null);
INSERT INTO `sys_area` VALUES ('150301', '市辖区', '3', '150300', '0', '1');
INSERT INTO `sys_area` VALUES ('150302', '海勃湾区', '3', '150300', '1', '1');
INSERT INTO `sys_area` VALUES ('150303', '海南区', '3', '150300', '1', '1');
INSERT INTO `sys_area` VALUES ('150304', '乌达区', '3', '150300', '1', '1');
INSERT INTO `sys_area` VALUES ('150400', '赤峰市', '2', '150000', '1', null);
INSERT INTO `sys_area` VALUES ('150401', '市辖区', '3', '150400', '0', '1');
INSERT INTO `sys_area` VALUES ('150402', '红山区', '3', '150400', '1', '1');
INSERT INTO `sys_area` VALUES ('150403', '元宝山区', '3', '150400', '1', '1');
INSERT INTO `sys_area` VALUES ('150404', '松山区', '3', '150400', '1', '1');
INSERT INTO `sys_area` VALUES ('150421', '阿鲁科尔沁旗', '3', '150400', '1', '1');
INSERT INTO `sys_area` VALUES ('150422', '巴林左旗', '3', '150400', '1', '1');
INSERT INTO `sys_area` VALUES ('150423', '巴林右旗', '3', '150400', '1', '1');
INSERT INTO `sys_area` VALUES ('150424', '林西县', '3', '150400', '1', '1');
INSERT INTO `sys_area` VALUES ('150425', '克什克腾旗', '3', '150400', '1', '1');
INSERT INTO `sys_area` VALUES ('150426', '翁牛特旗', '3', '150400', '1', '1');
INSERT INTO `sys_area` VALUES ('150428', '喀喇沁旗', '3', '150400', '1', '1');
INSERT INTO `sys_area` VALUES ('150429', '宁城县', '3', '150400', '1', '1');
INSERT INTO `sys_area` VALUES ('150430', '敖汉旗', '3', '150400', '1', '1');
INSERT INTO `sys_area` VALUES ('150500', '通辽市', '2', '150000', '1', null);
INSERT INTO `sys_area` VALUES ('150501', '市辖区', '3', '150500', '0', '1');
INSERT INTO `sys_area` VALUES ('150502', '科尔沁区', '3', '150500', '1', '1');
INSERT INTO `sys_area` VALUES ('150521', '科尔沁左翼中旗', '3', '150500', '1', '1');
INSERT INTO `sys_area` VALUES ('150522', '科尔沁左翼后旗', '3', '150500', '1', '1');
INSERT INTO `sys_area` VALUES ('150523', '开鲁县', '3', '150500', '1', '1');
INSERT INTO `sys_area` VALUES ('150524', '库伦旗', '3', '150500', '1', '1');
INSERT INTO `sys_area` VALUES ('150525', '奈曼旗', '3', '150500', '1', '1');
INSERT INTO `sys_area` VALUES ('150526', '扎鲁特旗', '3', '150500', '1', '1');
INSERT INTO `sys_area` VALUES ('150581', '霍林郭勒市', '3', '150500', '1', '1');
INSERT INTO `sys_area` VALUES ('150600', '鄂尔多斯市', '2', '150000', '1', null);
INSERT INTO `sys_area` VALUES ('150601', '市辖区', '3', '150600', '0', '1');
INSERT INTO `sys_area` VALUES ('150602', '  东胜区', '3', '150600', '1', '1');
INSERT INTO `sys_area` VALUES ('150621', '达拉特旗', '3', '150600', '1', '1');
INSERT INTO `sys_area` VALUES ('150622', '准格尔旗', '3', '150600', '1', '1');
INSERT INTO `sys_area` VALUES ('150623', '鄂托克前旗', '3', '150600', '1', '1');
INSERT INTO `sys_area` VALUES ('150624', '鄂托克旗', '3', '150600', '1', '1');
INSERT INTO `sys_area` VALUES ('150625', '杭锦旗', '3', '150600', '1', '1');
INSERT INTO `sys_area` VALUES ('150626', '乌审旗', '3', '150600', '1', '1');
INSERT INTO `sys_area` VALUES ('150627', '伊金霍洛旗', '3', '150600', '1', '1');
INSERT INTO `sys_area` VALUES ('150700', '呼伦贝尔市', '2', '150000', '1', null);
INSERT INTO `sys_area` VALUES ('150701', '市辖区', '3', '150700', '0', '1');
INSERT INTO `sys_area` VALUES ('150702', '海拉尔区', '3', '150700', '1', '1');
INSERT INTO `sys_area` VALUES ('150721', '阿荣旗', '3', '150700', '1', '1');
INSERT INTO `sys_area` VALUES ('150722', '莫力达瓦达斡尔族自治旗', '3', '150700', '1', '1');
INSERT INTO `sys_area` VALUES ('150723', '鄂伦春自治旗', '3', '150700', '1', '1');
INSERT INTO `sys_area` VALUES ('150724', '鄂温克族自治旗', '3', '150700', '1', '1');
INSERT INTO `sys_area` VALUES ('150725', '陈巴尔虎旗', '3', '150700', '1', '1');
INSERT INTO `sys_area` VALUES ('150726', '新巴尔虎左旗', '3', '150700', '1', '1');
INSERT INTO `sys_area` VALUES ('150727', '新巴尔虎右旗', '3', '150700', '1', '1');
INSERT INTO `sys_area` VALUES ('150781', '满洲里市', '3', '150700', '1', '1');
INSERT INTO `sys_area` VALUES ('150782', '牙克石市', '3', '150700', '1', '1');
INSERT INTO `sys_area` VALUES ('150783', '扎兰屯市', '3', '150700', '1', '1');
INSERT INTO `sys_area` VALUES ('150784', '额尔古纳市', '3', '150700', '1', '1');
INSERT INTO `sys_area` VALUES ('150785', '根河市', '3', '150700', '1', '1');
INSERT INTO `sys_area` VALUES ('150800', '巴彦淖尔市', '2', '150000', '1', null);
INSERT INTO `sys_area` VALUES ('150801', '市辖区', '3', '150800', '0', '1');
INSERT INTO `sys_area` VALUES ('150802', '临河区', '3', '150800', '1', '1');
INSERT INTO `sys_area` VALUES ('150821', '五原县', '3', '150800', '1', '1');
INSERT INTO `sys_area` VALUES ('150822', '磴口县', '3', '150800', '1', '1');
INSERT INTO `sys_area` VALUES ('150823', '乌拉特前旗', '3', '150800', '1', '1');
INSERT INTO `sys_area` VALUES ('150824', '乌拉特中旗', '3', '150800', '1', '1');
INSERT INTO `sys_area` VALUES ('150825', '乌拉特后旗', '3', '150800', '1', '1');
INSERT INTO `sys_area` VALUES ('150826', '杭锦后旗', '3', '150800', '1', '1');
INSERT INTO `sys_area` VALUES ('150900', '乌兰察布市', '2', '150000', '1', null);
INSERT INTO `sys_area` VALUES ('150901', '市辖区', '3', '150900', '0', '1');
INSERT INTO `sys_area` VALUES ('150902', '集宁区', '3', '150900', '1', '1');
INSERT INTO `sys_area` VALUES ('150921', '卓资县', '3', '150900', '1', '1');
INSERT INTO `sys_area` VALUES ('150922', '化德县', '3', '150900', '1', '1');
INSERT INTO `sys_area` VALUES ('150923', '商都县', '3', '150900', '1', '1');
INSERT INTO `sys_area` VALUES ('150924', '兴和县', '3', '150900', '1', '1');
INSERT INTO `sys_area` VALUES ('150925', '凉城县', '3', '150900', '1', '1');
INSERT INTO `sys_area` VALUES ('150926', '察哈尔右翼前旗', '3', '150900', '1', '1');
INSERT INTO `sys_area` VALUES ('150927', '察哈尔右翼中旗', '3', '150900', '1', '1');
INSERT INTO `sys_area` VALUES ('150928', '察哈尔右翼后旗', '3', '150900', '1', '1');
INSERT INTO `sys_area` VALUES ('150929', '四子王旗', '3', '150900', '1', '1');
INSERT INTO `sys_area` VALUES ('150981', '丰镇市', '3', '150900', '1', '1');
INSERT INTO `sys_area` VALUES ('152200', '兴安盟', '2', '150000', '1', null);
INSERT INTO `sys_area` VALUES ('152201', '乌兰浩特市', '3', '152200', '1', '1');
INSERT INTO `sys_area` VALUES ('152202', '阿尔山市', '3', '152200', '1', '1');
INSERT INTO `sys_area` VALUES ('152221', '科尔沁右翼前旗', '3', '152200', '1', '1');
INSERT INTO `sys_area` VALUES ('152222', '科尔沁右翼中旗', '3', '152200', '1', '1');
INSERT INTO `sys_area` VALUES ('152223', '扎赉特旗', '3', '152200', '1', '1');
INSERT INTO `sys_area` VALUES ('152224', '突泉县', '3', '152200', '1', '1');
INSERT INTO `sys_area` VALUES ('152500', '锡林郭勒盟', '2', '150000', '1', null);
INSERT INTO `sys_area` VALUES ('152501', '二连浩特市', '3', '152500', '1', '1');
INSERT INTO `sys_area` VALUES ('152502', '锡林浩特市', '3', '152500', '1', '1');
INSERT INTO `sys_area` VALUES ('152522', '阿巴嘎旗', '3', '152500', '1', '1');
INSERT INTO `sys_area` VALUES ('152523', '苏尼特左旗', '3', '152500', '1', '1');
INSERT INTO `sys_area` VALUES ('152524', '苏尼特右旗', '3', '152500', '1', '1');
INSERT INTO `sys_area` VALUES ('152525', '东乌珠穆沁旗', '3', '152500', '1', '1');
INSERT INTO `sys_area` VALUES ('152526', '西乌珠穆沁旗', '3', '152500', '1', '1');
INSERT INTO `sys_area` VALUES ('152527', '太仆寺旗', '3', '152500', '1', '1');
INSERT INTO `sys_area` VALUES ('152528', '镶黄旗', '3', '152500', '1', '1');
INSERT INTO `sys_area` VALUES ('152529', '正镶白旗', '3', '152500', '1', '1');
INSERT INTO `sys_area` VALUES ('152530', '正蓝旗', '3', '152500', '1', '1');
INSERT INTO `sys_area` VALUES ('152531', '多伦县', '3', '152500', '1', '1');
INSERT INTO `sys_area` VALUES ('152900', '阿拉善盟', '2', '150000', '1', null);
INSERT INTO `sys_area` VALUES ('152921', '阿拉善左旗', '3', '152900', '1', '1');
INSERT INTO `sys_area` VALUES ('152922', '阿拉善右旗', '3', '152900', '1', '1');
INSERT INTO `sys_area` VALUES ('152923', '额济纳旗', '3', '152900', '1', '1');
INSERT INTO `sys_area` VALUES ('210000', '辽宁省', '1', '0', '1', null);
INSERT INTO `sys_area` VALUES ('210100', '沈阳市', '2', '210000', '1', null);
INSERT INTO `sys_area` VALUES ('210101', '市辖区', '3', '210100', '0', '1');
INSERT INTO `sys_area` VALUES ('210102', '和平区', '3', '210100', '1', '1');
INSERT INTO `sys_area` VALUES ('210103', '沈河区', '3', '210100', '1', '1');
INSERT INTO `sys_area` VALUES ('210104', '大东区', '3', '210100', '1', '1');
INSERT INTO `sys_area` VALUES ('210105', '皇姑区', '3', '210100', '1', '1');
INSERT INTO `sys_area` VALUES ('210106', '铁西区', '3', '210100', '1', '1');
INSERT INTO `sys_area` VALUES ('210111', '苏家屯区', '3', '210100', '1', '1');
INSERT INTO `sys_area` VALUES ('210112', '东陵区', '3', '210100', '1', '1');
INSERT INTO `sys_area` VALUES ('210113', '沈北新区', '3', '210100', '1', '1');
INSERT INTO `sys_area` VALUES ('210114', '于洪区', '3', '210100', '1', '1');
INSERT INTO `sys_area` VALUES ('210122', '辽中县', '3', '210100', '1', '1');
INSERT INTO `sys_area` VALUES ('210123', '康平县', '3', '210100', '1', '1');
INSERT INTO `sys_area` VALUES ('210124', '法库县', '3', '210100', '1', '1');
INSERT INTO `sys_area` VALUES ('210181', '新民市', '3', '210100', '1', '1');
INSERT INTO `sys_area` VALUES ('210200', '大连市', '2', '210000', '1', null);
INSERT INTO `sys_area` VALUES ('210201', '市辖区', '3', '210200', '0', '1');
INSERT INTO `sys_area` VALUES ('210202', '中山区', '3', '210200', '1', '1');
INSERT INTO `sys_area` VALUES ('210203', '西岗区', '3', '210200', '1', '1');
INSERT INTO `sys_area` VALUES ('210204', '沙河口区', '3', '210200', '1', '1');
INSERT INTO `sys_area` VALUES ('210211', '甘井子区', '3', '210200', '1', '1');
INSERT INTO `sys_area` VALUES ('210212', '旅顺口区', '3', '210200', '1', '1');
INSERT INTO `sys_area` VALUES ('210213', '金州区', '3', '210200', '1', '1');
INSERT INTO `sys_area` VALUES ('210224', '长海县', '3', '210200', '1', '1');
INSERT INTO `sys_area` VALUES ('210281', '瓦房店市', '3', '210200', '1', '1');
INSERT INTO `sys_area` VALUES ('210282', '普兰店市', '3', '210200', '1', '1');
INSERT INTO `sys_area` VALUES ('210283', '庄河市', '3', '210200', '1', '1');
INSERT INTO `sys_area` VALUES ('210300', '鞍山市', '2', '210000', '1', null);
INSERT INTO `sys_area` VALUES ('210301', '市辖区', '3', '210300', '0', '1');
INSERT INTO `sys_area` VALUES ('210302', '铁东区', '3', '210300', '1', '1');
INSERT INTO `sys_area` VALUES ('210303', '铁西区', '3', '210300', '1', '1');
INSERT INTO `sys_area` VALUES ('210304', '立山区', '3', '210300', '1', '1');
INSERT INTO `sys_area` VALUES ('210311', '千山区', '3', '210300', '1', '1');
INSERT INTO `sys_area` VALUES ('210321', '台安县', '3', '210300', '1', '1');
INSERT INTO `sys_area` VALUES ('210323', '岫岩满族自治县', '3', '210300', '1', '1');
INSERT INTO `sys_area` VALUES ('210381', '海城市', '3', '210300', '1', '1');
INSERT INTO `sys_area` VALUES ('210400', '抚顺市', '2', '210000', '1', null);
INSERT INTO `sys_area` VALUES ('210401', '市辖区', '3', '210400', '0', '1');
INSERT INTO `sys_area` VALUES ('210402', '新抚区', '3', '210400', '1', '1');
INSERT INTO `sys_area` VALUES ('210403', '东洲区', '3', '210400', '1', '1');
INSERT INTO `sys_area` VALUES ('210404', '望花区', '3', '210400', '1', '1');
INSERT INTO `sys_area` VALUES ('210411', '顺城区', '3', '210400', '1', '1');
INSERT INTO `sys_area` VALUES ('210421', '抚顺县', '3', '210400', '1', '1');
INSERT INTO `sys_area` VALUES ('210422', '新宾满族自治县', '3', '210400', '1', '1');
INSERT INTO `sys_area` VALUES ('210423', '清原满族自治县', '3', '210400', '1', '1');
INSERT INTO `sys_area` VALUES ('210500', '本溪市', '2', '210000', '1', null);
INSERT INTO `sys_area` VALUES ('210501', '市辖区', '3', '210500', '0', '1');
INSERT INTO `sys_area` VALUES ('210502', '平山区', '3', '210500', '1', '1');
INSERT INTO `sys_area` VALUES ('210503', '溪湖区', '3', '210500', '1', '1');
INSERT INTO `sys_area` VALUES ('210504', '明山区', '3', '210500', '1', '1');
INSERT INTO `sys_area` VALUES ('210505', '南芬区', '3', '210500', '1', '1');
INSERT INTO `sys_area` VALUES ('210521', '本溪满族自治县', '3', '210500', '1', '1');
INSERT INTO `sys_area` VALUES ('210522', '桓仁满族自治县', '3', '210500', '1', '1');
INSERT INTO `sys_area` VALUES ('210600', '丹东市', '2', '210000', '1', null);
INSERT INTO `sys_area` VALUES ('210601', '市辖区', '3', '210600', '0', '1');
INSERT INTO `sys_area` VALUES ('210602', '元宝区', '3', '210600', '1', '1');
INSERT INTO `sys_area` VALUES ('210603', '振兴区', '3', '210600', '1', '1');
INSERT INTO `sys_area` VALUES ('210604', '振安区', '3', '210600', '1', '1');
INSERT INTO `sys_area` VALUES ('210624', '宽甸满族自治县', '3', '210600', '1', '1');
INSERT INTO `sys_area` VALUES ('210681', '东港市', '3', '210600', '1', '1');
INSERT INTO `sys_area` VALUES ('210682', '凤城市', '3', '210600', '1', '1');
INSERT INTO `sys_area` VALUES ('210700', '锦州市', '2', '210000', '1', null);
INSERT INTO `sys_area` VALUES ('210701', '市辖区', '3', '210700', '0', '1');
INSERT INTO `sys_area` VALUES ('210702', '古塔区', '3', '210700', '1', '1');
INSERT INTO `sys_area` VALUES ('210703', '凌河区', '3', '210700', '1', '1');
INSERT INTO `sys_area` VALUES ('210711', '太和区', '3', '210700', '1', '1');
INSERT INTO `sys_area` VALUES ('210726', '黑山县', '3', '210700', '1', '1');
INSERT INTO `sys_area` VALUES ('210727', '义县', '3', '210700', '1', '1');
INSERT INTO `sys_area` VALUES ('210781', '凌海市', '3', '210700', '1', '1');
INSERT INTO `sys_area` VALUES ('210782', '北镇市', '3', '210700', '1', '1');
INSERT INTO `sys_area` VALUES ('210800', '营口市', '2', '210000', '1', null);
INSERT INTO `sys_area` VALUES ('210801', '市辖区', '3', '210800', '0', '1');
INSERT INTO `sys_area` VALUES ('210802', '站前区', '3', '210800', '1', '1');
INSERT INTO `sys_area` VALUES ('210803', '西市区', '3', '210800', '1', '1');
INSERT INTO `sys_area` VALUES ('210804', '鲅鱼圈区', '3', '210800', '1', '1');
INSERT INTO `sys_area` VALUES ('210811', '老边区', '3', '210800', '1', '1');
INSERT INTO `sys_area` VALUES ('210881', '盖州市', '3', '210800', '1', '1');
INSERT INTO `sys_area` VALUES ('210882', '大石桥市', '3', '210800', '1', '1');
INSERT INTO `sys_area` VALUES ('210900', '阜新市', '2', '210000', '1', null);
INSERT INTO `sys_area` VALUES ('210901', '市辖区', '3', '210900', '0', '1');
INSERT INTO `sys_area` VALUES ('210902', '海州区', '3', '210900', '1', '1');
INSERT INTO `sys_area` VALUES ('210903', '新邱区', '3', '210900', '1', '1');
INSERT INTO `sys_area` VALUES ('210904', '太平区', '3', '210900', '1', '1');
INSERT INTO `sys_area` VALUES ('210905', '清河门区', '3', '210900', '1', '1');
INSERT INTO `sys_area` VALUES ('210911', '细河区', '3', '210900', '1', '1');
INSERT INTO `sys_area` VALUES ('210921', '阜新蒙古族自治县', '3', '210900', '1', '1');
INSERT INTO `sys_area` VALUES ('210922', '彰武县', '3', '210900', '1', '1');
INSERT INTO `sys_area` VALUES ('211000', '辽阳市', '2', '210000', '1', null);
INSERT INTO `sys_area` VALUES ('211001', '市辖区', '3', '211000', '0', '1');
INSERT INTO `sys_area` VALUES ('211002', '白塔区', '3', '211000', '1', '1');
INSERT INTO `sys_area` VALUES ('211003', '文圣区', '3', '211000', '1', '1');
INSERT INTO `sys_area` VALUES ('211004', '宏伟区', '3', '211000', '1', '1');
INSERT INTO `sys_area` VALUES ('211005', '弓长岭区', '3', '211000', '1', '1');
INSERT INTO `sys_area` VALUES ('211011', '太子河区', '3', '211000', '1', '1');
INSERT INTO `sys_area` VALUES ('211021', '辽阳县', '3', '211000', '1', '1');
INSERT INTO `sys_area` VALUES ('211081', '灯塔市', '3', '211000', '1', '1');
INSERT INTO `sys_area` VALUES ('211100', '盘锦市', '2', '210000', '1', null);
INSERT INTO `sys_area` VALUES ('211101', '市辖区', '3', '211100', '0', '1');
INSERT INTO `sys_area` VALUES ('211102', '双台子区', '3', '211100', '1', '1');
INSERT INTO `sys_area` VALUES ('211103', '兴隆台区', '3', '211100', '1', '1');
INSERT INTO `sys_area` VALUES ('211121', '大洼县', '3', '211100', '1', '1');
INSERT INTO `sys_area` VALUES ('211122', '盘山县', '3', '211100', '1', '1');
INSERT INTO `sys_area` VALUES ('211200', '铁岭市', '2', '210000', '1', null);
INSERT INTO `sys_area` VALUES ('211201', '市辖区', '3', '211200', '0', '1');
INSERT INTO `sys_area` VALUES ('211202', '银州区', '3', '211200', '1', '1');
INSERT INTO `sys_area` VALUES ('211204', '清河区', '3', '211200', '1', '1');
INSERT INTO `sys_area` VALUES ('211221', '铁岭县', '3', '211200', '1', '1');
INSERT INTO `sys_area` VALUES ('211223', '西丰县', '3', '211200', '1', '1');
INSERT INTO `sys_area` VALUES ('211224', '昌图县', '3', '211200', '1', '1');
INSERT INTO `sys_area` VALUES ('211281', '调兵山市', '3', '211200', '1', '1');
INSERT INTO `sys_area` VALUES ('211282', '开原市', '3', '211200', '1', '1');
INSERT INTO `sys_area` VALUES ('211300', '朝阳市', '2', '210000', '1', null);
INSERT INTO `sys_area` VALUES ('211301', '市辖区', '3', '211300', '0', '1');
INSERT INTO `sys_area` VALUES ('211302', '双塔区', '3', '211300', '1', '1');
INSERT INTO `sys_area` VALUES ('211303', '龙城区', '3', '211300', '1', '1');
INSERT INTO `sys_area` VALUES ('211321', '朝阳县', '3', '211300', '1', '1');
INSERT INTO `sys_area` VALUES ('211322', '建平县', '3', '211300', '1', '1');
INSERT INTO `sys_area` VALUES ('211324', '喀喇沁左翼蒙古族自治县', '3', '211300', '1', '1');
INSERT INTO `sys_area` VALUES ('211381', '北票市', '3', '211300', '1', '1');
INSERT INTO `sys_area` VALUES ('211382', '凌源市', '3', '211300', '1', '1');
INSERT INTO `sys_area` VALUES ('211400', '葫芦岛市', '2', '210000', '1', null);
INSERT INTO `sys_area` VALUES ('211401', '市辖区', '3', '211400', '0', '1');
INSERT INTO `sys_area` VALUES ('211402', '连山区', '3', '211400', '1', '1');
INSERT INTO `sys_area` VALUES ('211403', '龙港区', '3', '211400', '1', '1');
INSERT INTO `sys_area` VALUES ('211404', '南票区', '3', '211400', '1', '1');
INSERT INTO `sys_area` VALUES ('211421', '绥中县', '3', '211400', '1', '1');
INSERT INTO `sys_area` VALUES ('211422', '建昌县', '3', '211400', '1', '1');
INSERT INTO `sys_area` VALUES ('211481', '兴城市', '3', '211400', '1', '1');
INSERT INTO `sys_area` VALUES ('220000', '吉林省', '1', '0', '1', null);
INSERT INTO `sys_area` VALUES ('220100', '长春市', '2', '220000', '1', null);
INSERT INTO `sys_area` VALUES ('220101', '市辖区', '3', '220100', '0', '1');
INSERT INTO `sys_area` VALUES ('220102', '南关区', '3', '220100', '1', '1');
INSERT INTO `sys_area` VALUES ('220103', '宽城区', '3', '220100', '1', '1');
INSERT INTO `sys_area` VALUES ('220104', '朝阳区', '3', '220100', '1', '1');
INSERT INTO `sys_area` VALUES ('220105', '二道区', '3', '220100', '1', '1');
INSERT INTO `sys_area` VALUES ('220106', '绿园区', '3', '220100', '1', '1');
INSERT INTO `sys_area` VALUES ('220112', '双阳区', '3', '220100', '1', '1');
INSERT INTO `sys_area` VALUES ('220122', '农安县', '3', '220100', '1', '1');
INSERT INTO `sys_area` VALUES ('220181', '九台市', '3', '220100', '1', '1');
INSERT INTO `sys_area` VALUES ('220182', '榆树市', '3', '220100', '1', '1');
INSERT INTO `sys_area` VALUES ('220183', '德惠市', '3', '220100', '1', '1');
INSERT INTO `sys_area` VALUES ('220200', '吉林市', '2', '220000', '1', null);
INSERT INTO `sys_area` VALUES ('220201', '市辖区', '3', '220200', '0', '1');
INSERT INTO `sys_area` VALUES ('220202', '昌邑区', '3', '220200', '1', '1');
INSERT INTO `sys_area` VALUES ('220203', '龙潭区', '3', '220200', '1', '1');
INSERT INTO `sys_area` VALUES ('220204', '船营区', '3', '220200', '1', '1');
INSERT INTO `sys_area` VALUES ('220211', '丰满区', '3', '220200', '1', '1');
INSERT INTO `sys_area` VALUES ('220221', '永吉县', '3', '220200', '1', '1');
INSERT INTO `sys_area` VALUES ('220281', '蛟河市', '3', '220200', '1', '1');
INSERT INTO `sys_area` VALUES ('220282', '桦甸市', '3', '220200', '1', '1');
INSERT INTO `sys_area` VALUES ('220283', '舒兰市', '3', '220200', '1', '1');
INSERT INTO `sys_area` VALUES ('220284', '磐石市', '3', '220200', '1', '1');
INSERT INTO `sys_area` VALUES ('220300', '四平市', '2', '220000', '1', null);
INSERT INTO `sys_area` VALUES ('220301', '市辖区', '3', '220300', '0', '1');
INSERT INTO `sys_area` VALUES ('220302', '铁西区', '3', '220300', '1', '1');
INSERT INTO `sys_area` VALUES ('220303', '铁东区', '3', '220300', '1', '1');
INSERT INTO `sys_area` VALUES ('220322', '梨树县', '3', '220300', '1', '1');
INSERT INTO `sys_area` VALUES ('220323', '伊通满族自治县', '3', '220300', '1', '1');
INSERT INTO `sys_area` VALUES ('220381', '公主岭市', '3', '220300', '1', '1');
INSERT INTO `sys_area` VALUES ('220382', '双辽市', '3', '220300', '1', '1');
INSERT INTO `sys_area` VALUES ('220400', '辽源市', '2', '220000', '1', null);
INSERT INTO `sys_area` VALUES ('220401', '市辖区', '3', '220400', '0', '1');
INSERT INTO `sys_area` VALUES ('220402', '龙山区', '3', '220400', '1', '1');
INSERT INTO `sys_area` VALUES ('220403', '西安区', '3', '220400', '1', '1');
INSERT INTO `sys_area` VALUES ('220421', '东丰县', '3', '220400', '1', '1');
INSERT INTO `sys_area` VALUES ('220422', '东辽县', '3', '220400', '1', '1');
INSERT INTO `sys_area` VALUES ('220500', '通化市', '2', '220000', '1', null);
INSERT INTO `sys_area` VALUES ('220501', '市辖区', '3', '220500', '0', '1');
INSERT INTO `sys_area` VALUES ('220502', '东昌区', '3', '220500', '1', '1');
INSERT INTO `sys_area` VALUES ('220503', '二道江区', '3', '220500', '1', '1');
INSERT INTO `sys_area` VALUES ('220521', '通化县', '3', '220500', '1', '1');
INSERT INTO `sys_area` VALUES ('220523', '辉南县', '3', '220500', '1', '1');
INSERT INTO `sys_area` VALUES ('220524', '柳河县', '3', '220500', '1', '1');
INSERT INTO `sys_area` VALUES ('220581', '梅河口市', '3', '220500', '1', '1');
INSERT INTO `sys_area` VALUES ('220582', '集安市', '3', '220500', '1', '1');
INSERT INTO `sys_area` VALUES ('220600', '白山市', '2', '220000', '1', null);
INSERT INTO `sys_area` VALUES ('220601', '市辖区', '3', '220600', '0', '1');
INSERT INTO `sys_area` VALUES ('220602', '八道江区', '3', '220600', '1', '1');
INSERT INTO `sys_area` VALUES ('220605', '  江源区', '3', '220600', '1', '1');
INSERT INTO `sys_area` VALUES ('220621', '抚松县', '3', '220600', '1', '1');
INSERT INTO `sys_area` VALUES ('220622', '靖宇县', '3', '220600', '1', '1');
INSERT INTO `sys_area` VALUES ('220623', '长白朝鲜族自治县', '3', '220600', '1', '1');
INSERT INTO `sys_area` VALUES ('220681', '临江市', '3', '220600', '1', '1');
INSERT INTO `sys_area` VALUES ('220700', '松原市', '2', '220000', '1', null);
INSERT INTO `sys_area` VALUES ('220701', '市辖区', '3', '220700', '0', '1');
INSERT INTO `sys_area` VALUES ('220702', '宁江区', '3', '220700', '1', '1');
INSERT INTO `sys_area` VALUES ('220721', '前郭尔罗斯蒙古族自治县', '3', '220700', '1', '1');
INSERT INTO `sys_area` VALUES ('220722', '长岭县', '3', '220700', '1', '1');
INSERT INTO `sys_area` VALUES ('220723', '乾安县', '3', '220700', '1', '1');
INSERT INTO `sys_area` VALUES ('220724', '扶余县', '3', '220700', '1', '1');
INSERT INTO `sys_area` VALUES ('220800', '白城市', '2', '220000', '1', null);
INSERT INTO `sys_area` VALUES ('220801', '市辖区', '3', '220800', '0', '1');
INSERT INTO `sys_area` VALUES ('220802', '洮北区', '3', '220800', '1', '1');
INSERT INTO `sys_area` VALUES ('220821', '镇赉县', '3', '220800', '1', '1');
INSERT INTO `sys_area` VALUES ('220822', '通榆县', '3', '220800', '1', '1');
INSERT INTO `sys_area` VALUES ('220881', '洮南市', '3', '220800', '1', '1');
INSERT INTO `sys_area` VALUES ('220882', '大安市', '3', '220800', '1', '1');
INSERT INTO `sys_area` VALUES ('222400', '延边朝鲜族自治州', '2', '220000', '1', null);
INSERT INTO `sys_area` VALUES ('222401', '延吉市', '3', '222400', '1', '1');
INSERT INTO `sys_area` VALUES ('222402', '图们市', '3', '222400', '1', '1');
INSERT INTO `sys_area` VALUES ('222403', '敦化市', '3', '222400', '1', '1');
INSERT INTO `sys_area` VALUES ('222404', '珲春市', '3', '222400', '1', '1');
INSERT INTO `sys_area` VALUES ('222405', '龙井市', '3', '222400', '1', '1');
INSERT INTO `sys_area` VALUES ('222406', '和龙市', '3', '222400', '1', '1');
INSERT INTO `sys_area` VALUES ('222424', '汪清县', '3', '222400', '1', '1');
INSERT INTO `sys_area` VALUES ('222426', '安图县', '3', '222400', '1', '1');
INSERT INTO `sys_area` VALUES ('230000', '黑龙江省', '1', '0', '1', null);
INSERT INTO `sys_area` VALUES ('230100', '哈尔滨市', '2', '230000', '1', null);
INSERT INTO `sys_area` VALUES ('230101', '市辖区', '3', '230100', '0', '1');
INSERT INTO `sys_area` VALUES ('230102', '道里区', '3', '230100', '1', '1');
INSERT INTO `sys_area` VALUES ('230103', '南岗区', '3', '230100', '1', '1');
INSERT INTO `sys_area` VALUES ('230104', '道外区', '3', '230100', '1', '1');
INSERT INTO `sys_area` VALUES ('230108', '平房区', '3', '230100', '1', '1');
INSERT INTO `sys_area` VALUES ('230109', '松北区', '3', '230100', '1', '1');
INSERT INTO `sys_area` VALUES ('230110', '香坊区', '3', '230100', '1', '1');
INSERT INTO `sys_area` VALUES ('230111', '呼兰区', '3', '230100', '1', '1');
INSERT INTO `sys_area` VALUES ('230112', '阿城区', '3', '230100', '1', '1');
INSERT INTO `sys_area` VALUES ('230123', '依兰县', '3', '230100', '1', '1');
INSERT INTO `sys_area` VALUES ('230124', '方正县', '3', '230100', '1', '1');
INSERT INTO `sys_area` VALUES ('230125', '宾县', '3', '230100', '1', '1');
INSERT INTO `sys_area` VALUES ('230126', '巴彦县', '3', '230100', '1', '1');
INSERT INTO `sys_area` VALUES ('230127', '木兰县', '3', '230100', '1', '1');
INSERT INTO `sys_area` VALUES ('230128', '通河县', '3', '230100', '1', '1');
INSERT INTO `sys_area` VALUES ('230129', '延寿县', '3', '230100', '1', '1');
INSERT INTO `sys_area` VALUES ('230182', '双城市', '3', '230100', '1', '1');
INSERT INTO `sys_area` VALUES ('230183', '尚志市', '3', '230100', '1', '1');
INSERT INTO `sys_area` VALUES ('230184', '五常市', '3', '230100', '1', '1');
INSERT INTO `sys_area` VALUES ('230200', '齐齐哈尔市', '2', '230000', '1', null);
INSERT INTO `sys_area` VALUES ('230201', '市辖区', '3', '230200', '0', '1');
INSERT INTO `sys_area` VALUES ('230202', '龙沙区', '3', '230200', '1', '1');
INSERT INTO `sys_area` VALUES ('230203', '建华区', '3', '230200', '1', '1');
INSERT INTO `sys_area` VALUES ('230204', '铁锋区', '3', '230200', '1', '1');
INSERT INTO `sys_area` VALUES ('230205', '昂昂溪区', '3', '230200', '1', '1');
INSERT INTO `sys_area` VALUES ('230206', '富拉尔基区', '3', '230200', '1', '1');
INSERT INTO `sys_area` VALUES ('230207', '碾子山区', '3', '230200', '1', '1');
INSERT INTO `sys_area` VALUES ('230208', '梅里斯达斡尔族区', '3', '230200', '1', '1');
INSERT INTO `sys_area` VALUES ('230221', '龙江县', '3', '230200', '1', '1');
INSERT INTO `sys_area` VALUES ('230223', '依安县', '3', '230200', '1', '1');
INSERT INTO `sys_area` VALUES ('230224', '泰来县', '3', '230200', '1', '1');
INSERT INTO `sys_area` VALUES ('230225', '甘南县', '3', '230200', '1', '1');
INSERT INTO `sys_area` VALUES ('230227', '富裕县', '3', '230200', '1', '1');
INSERT INTO `sys_area` VALUES ('230229', '克山县', '3', '230200', '1', '1');
INSERT INTO `sys_area` VALUES ('230230', '克东县', '3', '230200', '1', '1');
INSERT INTO `sys_area` VALUES ('230231', '拜泉县', '3', '230200', '1', '1');
INSERT INTO `sys_area` VALUES ('230281', '讷河市', '3', '230200', '1', '1');
INSERT INTO `sys_area` VALUES ('230300', '鸡西市', '2', '230000', '1', null);
INSERT INTO `sys_area` VALUES ('230301', '市辖区', '3', '230300', '0', '1');
INSERT INTO `sys_area` VALUES ('230302', '鸡冠区', '3', '230300', '1', '1');
INSERT INTO `sys_area` VALUES ('230303', '恒山区', '3', '230300', '1', '1');
INSERT INTO `sys_area` VALUES ('230304', '滴道区', '3', '230300', '1', '1');
INSERT INTO `sys_area` VALUES ('230305', '梨树区', '3', '230300', '1', '1');
INSERT INTO `sys_area` VALUES ('230306', '城子河区', '3', '230300', '1', '1');
INSERT INTO `sys_area` VALUES ('230307', '麻山区', '3', '230300', '1', '1');
INSERT INTO `sys_area` VALUES ('230321', '鸡东县', '3', '230300', '1', '1');
INSERT INTO `sys_area` VALUES ('230381', '虎林市', '3', '230300', '1', '1');
INSERT INTO `sys_area` VALUES ('230382', '密山市', '3', '230300', '1', '1');
INSERT INTO `sys_area` VALUES ('230400', '鹤岗市', '2', '230000', '1', null);
INSERT INTO `sys_area` VALUES ('230401', '市辖区', '3', '230400', '0', '1');
INSERT INTO `sys_area` VALUES ('230402', '向阳区', '3', '230400', '1', '1');
INSERT INTO `sys_area` VALUES ('230403', '工农区', '3', '230400', '1', '1');
INSERT INTO `sys_area` VALUES ('230404', '南山区', '3', '230400', '1', '1');
INSERT INTO `sys_area` VALUES ('230405', '兴安区', '3', '230400', '1', '1');
INSERT INTO `sys_area` VALUES ('230406', '东山区', '3', '230400', '1', '1');
INSERT INTO `sys_area` VALUES ('230407', '兴山区', '3', '230400', '1', '1');
INSERT INTO `sys_area` VALUES ('230421', '萝北县', '3', '230400', '1', '1');
INSERT INTO `sys_area` VALUES ('230422', '绥滨县', '3', '230400', '1', '1');
INSERT INTO `sys_area` VALUES ('230500', '双鸭山市', '2', '230000', '1', null);
INSERT INTO `sys_area` VALUES ('230501', '市辖区', '3', '230500', '0', '1');
INSERT INTO `sys_area` VALUES ('230502', '尖山区', '3', '230500', '1', '1');
INSERT INTO `sys_area` VALUES ('230503', '岭东区', '3', '230500', '1', '1');
INSERT INTO `sys_area` VALUES ('230505', '四方台区', '3', '230500', '1', '1');
INSERT INTO `sys_area` VALUES ('230506', '宝山区', '3', '230500', '1', '1');
INSERT INTO `sys_area` VALUES ('230521', '集贤县', '3', '230500', '1', '1');
INSERT INTO `sys_area` VALUES ('230522', '友谊县', '3', '230500', '1', '1');
INSERT INTO `sys_area` VALUES ('230523', '宝清县', '3', '230500', '1', '1');
INSERT INTO `sys_area` VALUES ('230524', '饶河县', '3', '230500', '1', '1');
INSERT INTO `sys_area` VALUES ('230600', '大庆市', '2', '230000', '1', null);
INSERT INTO `sys_area` VALUES ('230601', '市辖区', '3', '230600', '0', '1');
INSERT INTO `sys_area` VALUES ('230602', '萨尔图区', '3', '230600', '1', '1');
INSERT INTO `sys_area` VALUES ('230603', '龙凤区', '3', '230600', '1', '1');
INSERT INTO `sys_area` VALUES ('230604', '让胡路区', '3', '230600', '1', '1');
INSERT INTO `sys_area` VALUES ('230605', '红岗区', '3', '230600', '1', '1');
INSERT INTO `sys_area` VALUES ('230606', '大同区', '3', '230600', '1', '1');
INSERT INTO `sys_area` VALUES ('230621', '肇州县', '3', '230600', '1', '1');
INSERT INTO `sys_area` VALUES ('230622', '肇源县', '3', '230600', '1', '1');
INSERT INTO `sys_area` VALUES ('230623', '林甸县', '3', '230600', '1', '1');
INSERT INTO `sys_area` VALUES ('230624', '杜尔伯特蒙古族自治县', '3', '230600', '1', '1');
INSERT INTO `sys_area` VALUES ('230700', '伊春市', '2', '230000', '1', null);
INSERT INTO `sys_area` VALUES ('230701', '市辖区', '3', '230700', '0', '1');
INSERT INTO `sys_area` VALUES ('230702', '伊春区', '3', '230700', '1', '1');
INSERT INTO `sys_area` VALUES ('230703', '南岔区', '3', '230700', '1', '1');
INSERT INTO `sys_area` VALUES ('230704', '友好区', '3', '230700', '1', '1');
INSERT INTO `sys_area` VALUES ('230705', '西林区', '3', '230700', '1', '1');
INSERT INTO `sys_area` VALUES ('230706', '翠峦区', '3', '230700', '1', '1');
INSERT INTO `sys_area` VALUES ('230707', '新青区', '3', '230700', '1', '1');
INSERT INTO `sys_area` VALUES ('230708', '美溪区', '3', '230700', '1', '1');
INSERT INTO `sys_area` VALUES ('230709', '金山屯区', '3', '230700', '1', '1');
INSERT INTO `sys_area` VALUES ('230710', '五营区', '3', '230700', '1', '1');
INSERT INTO `sys_area` VALUES ('230711', '乌马河区', '3', '230700', '1', '1');
INSERT INTO `sys_area` VALUES ('230712', '汤旺河区', '3', '230700', '1', '1');
INSERT INTO `sys_area` VALUES ('230713', '带岭区', '3', '230700', '1', '1');
INSERT INTO `sys_area` VALUES ('230714', '乌伊岭区', '3', '230700', '1', '1');
INSERT INTO `sys_area` VALUES ('230715', '红星区', '3', '230700', '1', '1');
INSERT INTO `sys_area` VALUES ('230716', '上甘岭区', '3', '230700', '1', '1');
INSERT INTO `sys_area` VALUES ('230722', '嘉荫县', '3', '230700', '1', '1');
INSERT INTO `sys_area` VALUES ('230781', '铁力市', '3', '230700', '1', '1');
INSERT INTO `sys_area` VALUES ('230800', '佳木斯市', '2', '230000', '1', null);
INSERT INTO `sys_area` VALUES ('230801', '市辖区', '3', '230800', '0', '1');
INSERT INTO `sys_area` VALUES ('230803', '向阳区', '3', '230800', '1', '1');
INSERT INTO `sys_area` VALUES ('230804', '前进区', '3', '230800', '1', '1');
INSERT INTO `sys_area` VALUES ('230805', '东风区', '3', '230800', '1', '1');
INSERT INTO `sys_area` VALUES ('230811', '郊区', '3', '230800', '1', '1');
INSERT INTO `sys_area` VALUES ('230822', '桦南县', '3', '230800', '1', '1');
INSERT INTO `sys_area` VALUES ('230826', '桦川县', '3', '230800', '1', '1');
INSERT INTO `sys_area` VALUES ('230828', '汤原县', '3', '230800', '1', '1');
INSERT INTO `sys_area` VALUES ('230833', '抚远县', '3', '230800', '1', '1');
INSERT INTO `sys_area` VALUES ('230881', '同江市', '3', '230800', '1', '1');
INSERT INTO `sys_area` VALUES ('230882', '富锦市', '3', '230800', '1', '1');
INSERT INTO `sys_area` VALUES ('230900', '七台河市', '2', '230000', '1', null);
INSERT INTO `sys_area` VALUES ('230901', '市辖区', '3', '230900', '0', '1');
INSERT INTO `sys_area` VALUES ('230902', '新兴区', '3', '230900', '1', '1');
INSERT INTO `sys_area` VALUES ('230903', '桃山区', '3', '230900', '1', '1');
INSERT INTO `sys_area` VALUES ('230904', '茄子河区', '3', '230900', '1', '1');
INSERT INTO `sys_area` VALUES ('230921', '勃利县', '3', '230900', '1', '1');
INSERT INTO `sys_area` VALUES ('231000', '牡丹江市', '2', '230000', '1', null);
INSERT INTO `sys_area` VALUES ('231001', '市辖区', '3', '231000', '0', '1');
INSERT INTO `sys_area` VALUES ('231002', '东安区', '3', '231000', '1', '1');
INSERT INTO `sys_area` VALUES ('231003', '阳明区', '3', '231000', '1', '1');
INSERT INTO `sys_area` VALUES ('231004', '爱民区', '3', '231000', '1', '1');
INSERT INTO `sys_area` VALUES ('231005', '西安区', '3', '231000', '1', '1');
INSERT INTO `sys_area` VALUES ('231024', '东宁县', '3', '231000', '1', '1');
INSERT INTO `sys_area` VALUES ('231025', '林口县', '3', '231000', '1', '1');
INSERT INTO `sys_area` VALUES ('231081', '绥芬河市', '3', '231000', '1', '1');
INSERT INTO `sys_area` VALUES ('231083', '海林市', '3', '231000', '1', '1');
INSERT INTO `sys_area` VALUES ('231084', '宁安市', '3', '231000', '1', '1');
INSERT INTO `sys_area` VALUES ('231085', '穆棱市', '3', '231000', '1', '1');
INSERT INTO `sys_area` VALUES ('231100', '黑河市', '2', '230000', '1', null);
INSERT INTO `sys_area` VALUES ('231101', '市辖区', '3', '231100', '0', '1');
INSERT INTO `sys_area` VALUES ('231102', '爱辉区', '3', '231100', '1', '1');
INSERT INTO `sys_area` VALUES ('231121', '嫩江县', '3', '231100', '1', '1');
INSERT INTO `sys_area` VALUES ('231123', '逊克县', '3', '231100', '1', '1');
INSERT INTO `sys_area` VALUES ('231124', '孙吴县', '3', '231100', '1', '1');
INSERT INTO `sys_area` VALUES ('231181', '北安市', '3', '231100', '1', '1');
INSERT INTO `sys_area` VALUES ('231182', '五大连池市', '3', '231100', '1', '1');
INSERT INTO `sys_area` VALUES ('231200', '绥化市', '2', '230000', '1', null);
INSERT INTO `sys_area` VALUES ('231201', '市辖区', '3', '231200', '0', '1');
INSERT INTO `sys_area` VALUES ('231202', '北林区', '3', '231200', '1', '1');
INSERT INTO `sys_area` VALUES ('231221', '望奎县', '3', '231200', '1', '1');
INSERT INTO `sys_area` VALUES ('231222', '兰西县', '3', '231200', '1', '1');
INSERT INTO `sys_area` VALUES ('231223', '青冈县', '3', '231200', '1', '1');
INSERT INTO `sys_area` VALUES ('231224', '庆安县', '3', '231200', '1', '1');
INSERT INTO `sys_area` VALUES ('231225', '明水县', '3', '231200', '1', '1');
INSERT INTO `sys_area` VALUES ('231226', '绥棱县', '3', '231200', '1', '1');
INSERT INTO `sys_area` VALUES ('231281', '安达市', '3', '231200', '1', '1');
INSERT INTO `sys_area` VALUES ('231282', '肇东市', '3', '231200', '1', '1');
INSERT INTO `sys_area` VALUES ('231283', '海伦市', '3', '231200', '1', '1');
INSERT INTO `sys_area` VALUES ('232700', '大兴安岭地区', '2', '230000', '1', null);
INSERT INTO `sys_area` VALUES ('232701', '加格达奇区', '3', '232700', '1', '1');
INSERT INTO `sys_area` VALUES ('232702', '松岭区', '3', '232700', '1', '1');
INSERT INTO `sys_area` VALUES ('232703', '新林区', '3', '232700', '1', '1');
INSERT INTO `sys_area` VALUES ('232704', '呼中区', '3', '232700', '1', '1');
INSERT INTO `sys_area` VALUES ('232721', '呼玛县', '3', '232700', '1', '1');
INSERT INTO `sys_area` VALUES ('232722', '塔河县', '3', '232700', '1', '1');
INSERT INTO `sys_area` VALUES ('232723', '漠河县', '3', '232700', '1', '1');
INSERT INTO `sys_area` VALUES ('310000', '上海市', '1', '0', '1', null);
INSERT INTO `sys_area` VALUES ('310100', '市辖区', '2', '310000', '0', '1');
INSERT INTO `sys_area` VALUES ('310101', '黄浦区', '2', '310000', '1', '1');
INSERT INTO `sys_area` VALUES ('310103', '卢湾区', '2', '310000', '1', '1');
INSERT INTO `sys_area` VALUES ('310104', '徐汇区', '2', '310000', '1', '1');
INSERT INTO `sys_area` VALUES ('310105', '长宁区', '2', '310000', '1', '1');
INSERT INTO `sys_area` VALUES ('310106', '静安区', '2', '310000', '1', '1');
INSERT INTO `sys_area` VALUES ('310107', '普陀区', '2', '310000', '1', '1');
INSERT INTO `sys_area` VALUES ('310108', '闸北区', '2', '310000', '1', '1');
INSERT INTO `sys_area` VALUES ('310109', '虹口区', '2', '310000', '1', '1');
INSERT INTO `sys_area` VALUES ('310110', '杨浦区', '2', '310000', '1', '1');
INSERT INTO `sys_area` VALUES ('310112', '闵行区', '2', '310000', '1', '1');
INSERT INTO `sys_area` VALUES ('310113', '宝山区', '2', '310000', '1', '1');
INSERT INTO `sys_area` VALUES ('310114', '嘉定区', '2', '310000', '1', '1');
INSERT INTO `sys_area` VALUES ('310115', '浦东新区', '2', '310000', '1', '1');
INSERT INTO `sys_area` VALUES ('310116', '金山区', '2', '310000', '1', '1');
INSERT INTO `sys_area` VALUES ('310117', '松江区', '2', '310000', '1', '1');
INSERT INTO `sys_area` VALUES ('310118', '青浦区', '2', '310000', '1', '1');
INSERT INTO `sys_area` VALUES ('310119', '南汇区', '2', '310000', '1', '1');
INSERT INTO `sys_area` VALUES ('310120', '奉贤区', '2', '310000', '1', '1');
INSERT INTO `sys_area` VALUES ('310230', '崇明县', '2', '310000', '1', '1');
INSERT INTO `sys_area` VALUES ('320000', '江苏省', '1', '0', '1', null);
INSERT INTO `sys_area` VALUES ('320100', '南京市', '2', '320000', '1', null);
INSERT INTO `sys_area` VALUES ('320101', '市辖区', '3', '320100', '0', '1');
INSERT INTO `sys_area` VALUES ('320102', '玄武区', '3', '320100', '1', '1');
INSERT INTO `sys_area` VALUES ('320103', '白下区', '3', '320100', '1', '1');
INSERT INTO `sys_area` VALUES ('320104', '秦淮区', '3', '320100', '1', '1');
INSERT INTO `sys_area` VALUES ('320105', '建邺区', '3', '320100', '1', '1');
INSERT INTO `sys_area` VALUES ('320106', '鼓楼区', '3', '320100', '1', '1');
INSERT INTO `sys_area` VALUES ('320107', '下关区', '3', '320100', '1', '1');
INSERT INTO `sys_area` VALUES ('320111', '浦口区', '3', '320100', '1', '1');
INSERT INTO `sys_area` VALUES ('320113', '栖霞区', '3', '320100', '1', '1');
INSERT INTO `sys_area` VALUES ('320114', '雨花台区', '3', '320100', '1', '1');
INSERT INTO `sys_area` VALUES ('320115', '江宁区', '3', '320100', '1', '1');
INSERT INTO `sys_area` VALUES ('320116', '六合区', '3', '320100', '1', '1');
INSERT INTO `sys_area` VALUES ('320124', '溧水县', '3', '320100', '1', '1');
INSERT INTO `sys_area` VALUES ('320125', '高淳县', '3', '320100', '1', '1');
INSERT INTO `sys_area` VALUES ('320200', '无锡市', '2', '320000', '1', null);
INSERT INTO `sys_area` VALUES ('320201', '市辖区', '3', '320200', '0', '1');
INSERT INTO `sys_area` VALUES ('320202', '崇安区', '3', '320200', '1', '1');
INSERT INTO `sys_area` VALUES ('320203', '南长区', '3', '320200', '1', '1');
INSERT INTO `sys_area` VALUES ('320204', '北塘区', '3', '320200', '1', '1');
INSERT INTO `sys_area` VALUES ('320205', '锡山区', '3', '320200', '1', '1');
INSERT INTO `sys_area` VALUES ('320206', '惠山区', '3', '320200', '1', '1');
INSERT INTO `sys_area` VALUES ('320211', '滨湖区', '3', '320200', '1', '1');
INSERT INTO `sys_area` VALUES ('320281', '江阴市', '3', '320200', '1', '1');
INSERT INTO `sys_area` VALUES ('320282', '宜兴市', '3', '320200', '1', '1');
INSERT INTO `sys_area` VALUES ('320300', '徐州市', '2', '320000', '1', null);
INSERT INTO `sys_area` VALUES ('320301', '市辖区', '3', '320300', '0', '1');
INSERT INTO `sys_area` VALUES ('320302', '鼓楼区', '3', '320300', '1', '1');
INSERT INTO `sys_area` VALUES ('320303', '云龙区', '3', '320300', '1', '1');
INSERT INTO `sys_area` VALUES ('320304', '九里区', '3', '320300', '1', '1');
INSERT INTO `sys_area` VALUES ('320305', '贾汪区', '3', '320300', '1', '1');
INSERT INTO `sys_area` VALUES ('320311', '泉山区', '3', '320300', '1', '1');
INSERT INTO `sys_area` VALUES ('320321', '丰县', '3', '320300', '1', '1');
INSERT INTO `sys_area` VALUES ('320322', '沛县', '3', '320300', '1', '1');
INSERT INTO `sys_area` VALUES ('320323', '铜山县', '3', '320300', '1', '1');
INSERT INTO `sys_area` VALUES ('320324', '睢宁县', '3', '320300', '1', '1');
INSERT INTO `sys_area` VALUES ('320381', '新沂市', '3', '320300', '1', '1');
INSERT INTO `sys_area` VALUES ('320382', '邳州市', '3', '320300', '1', '1');
INSERT INTO `sys_area` VALUES ('320400', '常州市', '2', '320000', '1', null);
INSERT INTO `sys_area` VALUES ('320401', '市辖区', '3', '320400', '0', '1');
INSERT INTO `sys_area` VALUES ('320402', '天宁区', '3', '320400', '1', '1');
INSERT INTO `sys_area` VALUES ('320404', '钟楼区', '3', '320400', '1', '1');
INSERT INTO `sys_area` VALUES ('320405', '戚墅堰区', '3', '320400', '1', '1');
INSERT INTO `sys_area` VALUES ('320411', '新北区', '3', '320400', '1', '1');
INSERT INTO `sys_area` VALUES ('320412', '武进区', '3', '320400', '1', '1');
INSERT INTO `sys_area` VALUES ('320481', '溧阳市', '3', '320400', '1', '1');
INSERT INTO `sys_area` VALUES ('320482', '金坛市', '3', '320400', '1', '1');
INSERT INTO `sys_area` VALUES ('320500', '苏州市', '2', '320000', '1', null);
INSERT INTO `sys_area` VALUES ('320501', '市辖区', '3', '320500', '0', '1');
INSERT INTO `sys_area` VALUES ('320502', '沧浪区', '3', '320500', '1', '1');
INSERT INTO `sys_area` VALUES ('320503', '平江区', '3', '320500', '1', '1');
INSERT INTO `sys_area` VALUES ('320504', '金阊区', '3', '320500', '1', '1');
INSERT INTO `sys_area` VALUES ('320505', '虎丘区', '3', '320500', '1', '1');
INSERT INTO `sys_area` VALUES ('320506', '吴中区', '3', '320500', '1', '1');
INSERT INTO `sys_area` VALUES ('320507', '相城区', '3', '320500', '1', '1');
INSERT INTO `sys_area` VALUES ('320581', '常熟市', '3', '320500', '1', '1');
INSERT INTO `sys_area` VALUES ('320582', '张家港市', '3', '320500', '1', '1');
INSERT INTO `sys_area` VALUES ('320583', '昆山市', '3', '320500', '1', '1');
INSERT INTO `sys_area` VALUES ('320584', '吴江市', '3', '320500', '1', '1');
INSERT INTO `sys_area` VALUES ('320585', '太仓市', '3', '320500', '1', '1');
INSERT INTO `sys_area` VALUES ('320600', '南通市', '2', '320000', '1', null);
INSERT INTO `sys_area` VALUES ('320601', '市辖区', '3', '320600', '0', '1');
INSERT INTO `sys_area` VALUES ('320602', '崇川区', '3', '320600', '1', '1');
INSERT INTO `sys_area` VALUES ('320611', '港闸区', '3', '320600', '1', '1');
INSERT INTO `sys_area` VALUES ('320621', '海安县', '3', '320600', '1', '1');
INSERT INTO `sys_area` VALUES ('320623', '如东县', '3', '320600', '1', '1');
INSERT INTO `sys_area` VALUES ('320681', '启东市', '3', '320600', '1', '1');
INSERT INTO `sys_area` VALUES ('320682', '如皋市', '3', '320600', '1', '1');
INSERT INTO `sys_area` VALUES ('320683', '通州市', '3', '320600', '1', '1');
INSERT INTO `sys_area` VALUES ('320684', '海门市', '3', '320600', '1', '1');
INSERT INTO `sys_area` VALUES ('320700', '连云港市', '2', '320000', '1', null);
INSERT INTO `sys_area` VALUES ('320701', '市辖区', '3', '320700', '0', '1');
INSERT INTO `sys_area` VALUES ('320703', '连云区', '3', '320700', '1', '1');
INSERT INTO `sys_area` VALUES ('320705', '新浦区', '3', '320700', '1', '1');
INSERT INTO `sys_area` VALUES ('320706', '海州区', '3', '320700', '1', '1');
INSERT INTO `sys_area` VALUES ('320721', '赣榆县', '3', '320700', '1', '1');
INSERT INTO `sys_area` VALUES ('320722', '东海县', '3', '320700', '1', '1');
INSERT INTO `sys_area` VALUES ('320723', '灌云县', '3', '320700', '1', '1');
INSERT INTO `sys_area` VALUES ('320724', '灌南县', '3', '320700', '1', '1');
INSERT INTO `sys_area` VALUES ('320800', '淮安市', '2', '320000', '1', null);
INSERT INTO `sys_area` VALUES ('320801', '市辖区', '3', '320800', '0', '1');
INSERT INTO `sys_area` VALUES ('320802', '清河区', '3', '320800', '1', '1');
INSERT INTO `sys_area` VALUES ('320803', '楚州区', '3', '320800', '1', '1');
INSERT INTO `sys_area` VALUES ('320804', '淮阴区', '3', '320800', '1', '1');
INSERT INTO `sys_area` VALUES ('320811', '清浦区', '3', '320800', '1', '1');
INSERT INTO `sys_area` VALUES ('320826', '涟水县', '3', '320800', '1', '1');
INSERT INTO `sys_area` VALUES ('320829', '洪泽县', '3', '320800', '1', '1');
INSERT INTO `sys_area` VALUES ('320830', '盱眙县', '3', '320800', '1', '1');
INSERT INTO `sys_area` VALUES ('320831', '金湖县', '3', '320800', '1', '1');
INSERT INTO `sys_area` VALUES ('320900', '盐城市', '2', '320000', '1', null);
INSERT INTO `sys_area` VALUES ('320901', '市辖区', '3', '320900', '0', '1');
INSERT INTO `sys_area` VALUES ('320902', '亭湖区', '3', '320900', '1', '1');
INSERT INTO `sys_area` VALUES ('320903', '盐都区', '3', '320900', '1', '1');
INSERT INTO `sys_area` VALUES ('320921', '响水县', '3', '320900', '1', '1');
INSERT INTO `sys_area` VALUES ('320922', '滨海县', '3', '320900', '1', '1');
INSERT INTO `sys_area` VALUES ('320923', '阜宁县', '3', '320900', '1', '1');
INSERT INTO `sys_area` VALUES ('320924', '射阳县', '3', '320900', '1', '1');
INSERT INTO `sys_area` VALUES ('320925', '建湖县', '3', '320900', '1', '1');
INSERT INTO `sys_area` VALUES ('320981', '东台市', '3', '320900', '1', '1');
INSERT INTO `sys_area` VALUES ('320982', '大丰市', '3', '320900', '1', '1');
INSERT INTO `sys_area` VALUES ('321000', '扬州市', '2', '320000', '1', null);
INSERT INTO `sys_area` VALUES ('321001', '市辖区', '3', '321000', '0', '1');
INSERT INTO `sys_area` VALUES ('321002', '广陵区', '3', '321000', '1', '1');
INSERT INTO `sys_area` VALUES ('321003', '邗江区', '3', '321000', '1', '1');
INSERT INTO `sys_area` VALUES ('321011', '维扬区', '3', '321000', '1', '1');
INSERT INTO `sys_area` VALUES ('321023', '宝应县', '3', '321000', '1', '1');
INSERT INTO `sys_area` VALUES ('321081', '仪征市', '3', '321000', '1', '1');
INSERT INTO `sys_area` VALUES ('321084', '高邮市', '3', '321000', '1', '1');
INSERT INTO `sys_area` VALUES ('321088', '江都市', '3', '321000', '1', '1');
INSERT INTO `sys_area` VALUES ('321100', '镇江市', '2', '320000', '1', null);
INSERT INTO `sys_area` VALUES ('321101', '市辖区', '3', '321100', '0', '1');
INSERT INTO `sys_area` VALUES ('321102', '京口区', '3', '321100', '1', '1');
INSERT INTO `sys_area` VALUES ('321111', '润州区', '3', '321100', '1', '1');
INSERT INTO `sys_area` VALUES ('321112', '丹徒区', '3', '321100', '1', '1');
INSERT INTO `sys_area` VALUES ('321181', '丹阳市', '3', '321100', '1', '1');
INSERT INTO `sys_area` VALUES ('321182', '扬中市', '3', '321100', '1', '1');
INSERT INTO `sys_area` VALUES ('321183', '句容市', '3', '321100', '1', '1');
INSERT INTO `sys_area` VALUES ('321200', '泰州市', '2', '320000', '1', null);
INSERT INTO `sys_area` VALUES ('321201', '市辖区', '3', '321200', '0', '1');
INSERT INTO `sys_area` VALUES ('321202', '海陵区', '3', '321200', '1', '1');
INSERT INTO `sys_area` VALUES ('321203', '高港区', '3', '321200', '1', '1');
INSERT INTO `sys_area` VALUES ('321281', '兴化市', '3', '321200', '1', '1');
INSERT INTO `sys_area` VALUES ('321282', '靖江市', '3', '321200', '1', '1');
INSERT INTO `sys_area` VALUES ('321283', '泰兴市', '3', '321200', '1', '1');
INSERT INTO `sys_area` VALUES ('321284', '姜堰市', '3', '321200', '1', '1');
INSERT INTO `sys_area` VALUES ('321300', '宿迁市', '2', '320000', '1', null);
INSERT INTO `sys_area` VALUES ('321301', '市辖区', '3', '321300', '0', '1');
INSERT INTO `sys_area` VALUES ('321302', '宿城区', '3', '321300', '1', '1');
INSERT INTO `sys_area` VALUES ('321311', '宿豫区', '3', '321300', '1', '1');
INSERT INTO `sys_area` VALUES ('321322', '沭阳县', '3', '321300', '1', '1');
INSERT INTO `sys_area` VALUES ('321323', '泗阳县', '3', '321300', '1', '1');
INSERT INTO `sys_area` VALUES ('321324', '泗洪县', '3', '321300', '1', '1');
INSERT INTO `sys_area` VALUES ('330000', '浙江省', '1', '0', '1', null);
INSERT INTO `sys_area` VALUES ('330100', '杭州市', '2', '330000', '1', null);
INSERT INTO `sys_area` VALUES ('330101', '市辖区', '3', '330100', '0', '1');
INSERT INTO `sys_area` VALUES ('330102', '上城区', '3', '330100', '1', '1');
INSERT INTO `sys_area` VALUES ('330103', '下城区', '3', '330100', '1', '1');
INSERT INTO `sys_area` VALUES ('330104', '江干区', '3', '330100', '1', '1');
INSERT INTO `sys_area` VALUES ('330105', '拱墅区', '3', '330100', '1', '1');
INSERT INTO `sys_area` VALUES ('330106', '西湖区', '3', '330100', '1', '1');
INSERT INTO `sys_area` VALUES ('330108', '滨江区', '3', '330100', '1', '1');
INSERT INTO `sys_area` VALUES ('330109', '萧山区', '3', '330100', '1', '1');
INSERT INTO `sys_area` VALUES ('330110', '余杭区', '3', '330100', '1', '1');
INSERT INTO `sys_area` VALUES ('330122', '桐庐县', '3', '330100', '1', '1');
INSERT INTO `sys_area` VALUES ('330127', '淳安县', '3', '330100', '1', '1');
INSERT INTO `sys_area` VALUES ('330182', '建德市', '3', '330100', '1', '1');
INSERT INTO `sys_area` VALUES ('330183', '富阳市', '3', '330100', '1', '1');
INSERT INTO `sys_area` VALUES ('330185', '临安市', '3', '330100', '1', '1');
INSERT INTO `sys_area` VALUES ('330200', '宁波市', '2', '330000', '1', null);
INSERT INTO `sys_area` VALUES ('330201', '市辖区', '3', '330200', '0', '1');
INSERT INTO `sys_area` VALUES ('330203', '海曙区', '3', '330200', '1', '1');
INSERT INTO `sys_area` VALUES ('330204', '江东区', '3', '330200', '1', '1');
INSERT INTO `sys_area` VALUES ('330205', '江北区', '3', '330200', '1', '1');
INSERT INTO `sys_area` VALUES ('330206', '北仑区', '3', '330200', '1', '1');
INSERT INTO `sys_area` VALUES ('330211', '镇海区', '3', '330200', '1', '1');
INSERT INTO `sys_area` VALUES ('330212', '鄞州区', '3', '330200', '1', '1');
INSERT INTO `sys_area` VALUES ('330225', '象山县', '3', '330200', '1', '1');
INSERT INTO `sys_area` VALUES ('330226', '宁海县', '3', '330200', '1', '1');
INSERT INTO `sys_area` VALUES ('330281', '余姚市', '3', '330200', '1', '1');
INSERT INTO `sys_area` VALUES ('330282', '慈溪市', '3', '330200', '1', '1');
INSERT INTO `sys_area` VALUES ('330283', '奉化市', '3', '330200', '1', '1');
INSERT INTO `sys_area` VALUES ('330300', '温州市', '2', '330000', '1', null);
INSERT INTO `sys_area` VALUES ('330301', '市辖区', '3', '330300', '0', '1');
INSERT INTO `sys_area` VALUES ('330302', '鹿城区', '3', '330300', '1', '1');
INSERT INTO `sys_area` VALUES ('330303', '龙湾区', '3', '330300', '1', '1');
INSERT INTO `sys_area` VALUES ('330304', '瓯海区', '3', '330300', '1', '1');
INSERT INTO `sys_area` VALUES ('330322', '洞头县', '3', '330300', '1', '1');
INSERT INTO `sys_area` VALUES ('330324', '永嘉县', '3', '330300', '1', '1');
INSERT INTO `sys_area` VALUES ('330326', '平阳县', '3', '330300', '1', '1');
INSERT INTO `sys_area` VALUES ('330327', '苍南县', '3', '330300', '1', '1');
INSERT INTO `sys_area` VALUES ('330328', '文成县', '3', '330300', '1', '1');
INSERT INTO `sys_area` VALUES ('330329', '泰顺县', '3', '330300', '1', '1');
INSERT INTO `sys_area` VALUES ('330381', '瑞安市', '3', '330300', '1', '1');
INSERT INTO `sys_area` VALUES ('330382', '乐清市', '3', '330300', '1', '1');
INSERT INTO `sys_area` VALUES ('330400', '嘉兴市', '2', '330000', '1', null);
INSERT INTO `sys_area` VALUES ('330401', '市辖区', '3', '330400', '0', '1');
INSERT INTO `sys_area` VALUES ('330402', '南湖区', '3', '330400', '1', '1');
INSERT INTO `sys_area` VALUES ('330411', '秀洲区', '3', '330400', '1', '1');
INSERT INTO `sys_area` VALUES ('330421', '嘉善县', '3', '330400', '1', '1');
INSERT INTO `sys_area` VALUES ('330424', '海盐县', '3', '330400', '1', '1');
INSERT INTO `sys_area` VALUES ('330481', '海宁市', '3', '330400', '1', '1');
INSERT INTO `sys_area` VALUES ('330482', '平湖市', '3', '330400', '1', '1');
INSERT INTO `sys_area` VALUES ('330483', '桐乡市', '3', '330400', '1', '1');
INSERT INTO `sys_area` VALUES ('330500', '湖州市', '2', '330000', '1', null);
INSERT INTO `sys_area` VALUES ('330501', '市辖区', '3', '330500', '0', '1');
INSERT INTO `sys_area` VALUES ('330502', '吴兴区', '3', '330500', '1', '1');
INSERT INTO `sys_area` VALUES ('330503', '南浔区', '3', '330500', '1', '1');
INSERT INTO `sys_area` VALUES ('330521', '德清县', '3', '330500', '1', '1');
INSERT INTO `sys_area` VALUES ('330522', '长兴县', '3', '330500', '1', '1');
INSERT INTO `sys_area` VALUES ('330523', '安吉县', '3', '330500', '1', '1');
INSERT INTO `sys_area` VALUES ('330600', '绍兴市', '2', '330000', '1', null);
INSERT INTO `sys_area` VALUES ('330601', '市辖区', '3', '330600', '0', '1');
INSERT INTO `sys_area` VALUES ('330602', '越城区', '3', '330600', '1', '1');
INSERT INTO `sys_area` VALUES ('330621', '绍兴县', '3', '330600', '1', '1');
INSERT INTO `sys_area` VALUES ('330624', '新昌县', '3', '330600', '1', '1');
INSERT INTO `sys_area` VALUES ('330681', '诸暨市', '3', '330600', '1', '1');
INSERT INTO `sys_area` VALUES ('330682', '上虞市', '3', '330600', '1', '1');
INSERT INTO `sys_area` VALUES ('330683', '嵊州市', '3', '330600', '1', '1');
INSERT INTO `sys_area` VALUES ('330700', '金华市', '2', '330000', '1', null);
INSERT INTO `sys_area` VALUES ('330701', '市辖区', '3', '330700', '0', '1');
INSERT INTO `sys_area` VALUES ('330702', '婺城区', '3', '330700', '1', '1');
INSERT INTO `sys_area` VALUES ('330703', '金东区', '3', '330700', '1', '1');
INSERT INTO `sys_area` VALUES ('330723', '武义县', '3', '330700', '1', '1');
INSERT INTO `sys_area` VALUES ('330726', '浦江县', '3', '330700', '1', '1');
INSERT INTO `sys_area` VALUES ('330727', '磐安县', '3', '330700', '1', '1');
INSERT INTO `sys_area` VALUES ('330781', '兰溪市', '3', '330700', '1', '1');
INSERT INTO `sys_area` VALUES ('330782', '义乌市', '3', '330700', '1', '1');
INSERT INTO `sys_area` VALUES ('330783', '东阳市', '3', '330700', '1', '1');
INSERT INTO `sys_area` VALUES ('330784', '永康市', '3', '330700', '1', '1');
INSERT INTO `sys_area` VALUES ('330800', '衢州市', '2', '330000', '1', null);
INSERT INTO `sys_area` VALUES ('330801', '市辖区', '3', '330800', '0', '1');
INSERT INTO `sys_area` VALUES ('330802', '柯城区', '3', '330800', '1', '1');
INSERT INTO `sys_area` VALUES ('330803', '衢江区', '3', '330800', '1', '1');
INSERT INTO `sys_area` VALUES ('330822', '常山县', '3', '330800', '1', '1');
INSERT INTO `sys_area` VALUES ('330824', '开化县', '3', '330800', '1', '1');
INSERT INTO `sys_area` VALUES ('330825', '龙游县', '3', '330800', '1', '1');
INSERT INTO `sys_area` VALUES ('330881', '江山市', '3', '330800', '1', '1');
INSERT INTO `sys_area` VALUES ('330900', '舟山市', '2', '330000', '1', null);
INSERT INTO `sys_area` VALUES ('330901', '市辖区', '3', '330900', '0', '1');
INSERT INTO `sys_area` VALUES ('330902', '定海区', '3', '330900', '1', '1');
INSERT INTO `sys_area` VALUES ('330903', '普陀区', '3', '330900', '1', '1');
INSERT INTO `sys_area` VALUES ('330921', '岱山县', '3', '330900', '1', '1');
INSERT INTO `sys_area` VALUES ('330922', '嵊泗县', '3', '330900', '1', '1');
INSERT INTO `sys_area` VALUES ('331000', '台州市', '2', '330000', '1', null);
INSERT INTO `sys_area` VALUES ('331001', '市辖区', '3', '331000', '0', '1');
INSERT INTO `sys_area` VALUES ('331002', '椒江区', '3', '331000', '1', '1');
INSERT INTO `sys_area` VALUES ('331003', '黄岩区', '3', '331000', '1', '1');
INSERT INTO `sys_area` VALUES ('331004', '路桥区', '3', '331000', '1', '1');
INSERT INTO `sys_area` VALUES ('331021', '玉环县', '3', '331000', '1', '1');
INSERT INTO `sys_area` VALUES ('331022', '三门县', '3', '331000', '1', '1');
INSERT INTO `sys_area` VALUES ('331023', '天台县', '3', '331000', '1', '1');
INSERT INTO `sys_area` VALUES ('331024', '仙居县', '3', '331000', '1', '1');
INSERT INTO `sys_area` VALUES ('331081', '温岭市', '3', '331000', '1', '1');
INSERT INTO `sys_area` VALUES ('331082', '临海市', '3', '331000', '1', '1');
INSERT INTO `sys_area` VALUES ('331100', '丽水市', '2', '330000', '1', null);
INSERT INTO `sys_area` VALUES ('331101', '市辖区', '3', '331100', '0', '1');
INSERT INTO `sys_area` VALUES ('331102', '莲都区', '3', '331100', '1', '1');
INSERT INTO `sys_area` VALUES ('331121', '青田县', '3', '331100', '1', '1');
INSERT INTO `sys_area` VALUES ('331122', '缙云县', '3', '331100', '1', '1');
INSERT INTO `sys_area` VALUES ('331123', '遂昌县', '3', '331100', '1', '1');
INSERT INTO `sys_area` VALUES ('331124', '松阳县', '3', '331100', '1', '1');
INSERT INTO `sys_area` VALUES ('331125', '云和县', '3', '331100', '1', '1');
INSERT INTO `sys_area` VALUES ('331126', '庆元县', '3', '331100', '1', '1');
INSERT INTO `sys_area` VALUES ('331127', '景宁畲族自治县', '3', '331100', '1', '1');
INSERT INTO `sys_area` VALUES ('331181', '龙泉市', '3', '331100', '1', '1');
INSERT INTO `sys_area` VALUES ('340000', '安徽省', '1', '0', '1', null);
INSERT INTO `sys_area` VALUES ('340100', '合肥市', '2', '340000', '1', null);
INSERT INTO `sys_area` VALUES ('340101', '市辖区', '3', '340100', '0', '1');
INSERT INTO `sys_area` VALUES ('340102', '瑶海区', '3', '340100', '1', '1');
INSERT INTO `sys_area` VALUES ('340103', '庐阳区', '3', '340100', '1', '1');
INSERT INTO `sys_area` VALUES ('340104', '蜀山区', '3', '340100', '1', '1');
INSERT INTO `sys_area` VALUES ('340111', '包河区', '3', '340100', '1', '1');
INSERT INTO `sys_area` VALUES ('340121', '长丰县', '3', '340100', '1', '1');
INSERT INTO `sys_area` VALUES ('340122', '肥东县', '3', '340100', '1', '1');
INSERT INTO `sys_area` VALUES ('340123', '肥西县', '3', '340100', '1', '1');
INSERT INTO `sys_area` VALUES ('340200', '芜湖市', '2', '340000', '1', null);
INSERT INTO `sys_area` VALUES ('340201', '市辖区', '3', '340200', '0', '1');
INSERT INTO `sys_area` VALUES ('340202', '镜湖区', '3', '340200', '1', '1');
INSERT INTO `sys_area` VALUES ('340203', '弋江区', '3', '340200', '1', '1');
INSERT INTO `sys_area` VALUES ('340207', '鸠江区', '3', '340200', '1', '1');
INSERT INTO `sys_area` VALUES ('340208', '三山区', '3', '340200', '1', '1');
INSERT INTO `sys_area` VALUES ('340221', '芜湖县', '3', '340200', '1', '1');
INSERT INTO `sys_area` VALUES ('340222', '繁昌县', '3', '340200', '1', '1');
INSERT INTO `sys_area` VALUES ('340223', '南陵县', '3', '340200', '1', '1');
INSERT INTO `sys_area` VALUES ('340300', '蚌埠市', '2', '340000', '1', null);
INSERT INTO `sys_area` VALUES ('340301', '市辖区', '3', '340300', '0', '1');
INSERT INTO `sys_area` VALUES ('340302', '龙子湖区', '3', '340300', '1', '1');
INSERT INTO `sys_area` VALUES ('340303', '蚌山区', '3', '340300', '1', '1');
INSERT INTO `sys_area` VALUES ('340304', '禹会区', '3', '340300', '1', '1');
INSERT INTO `sys_area` VALUES ('340311', '淮上区', '3', '340300', '1', '1');
INSERT INTO `sys_area` VALUES ('340321', '怀远县', '3', '340300', '1', '1');
INSERT INTO `sys_area` VALUES ('340322', '五河县', '3', '340300', '1', '1');
INSERT INTO `sys_area` VALUES ('340323', '固镇县', '3', '340300', '1', '1');
INSERT INTO `sys_area` VALUES ('340400', '淮南市', '2', '340000', '1', null);
INSERT INTO `sys_area` VALUES ('340401', '市辖区', '3', '340400', '0', '1');
INSERT INTO `sys_area` VALUES ('340402', '大通区', '3', '340400', '1', '1');
INSERT INTO `sys_area` VALUES ('340403', '田家庵区', '3', '340400', '1', '1');
INSERT INTO `sys_area` VALUES ('340404', '谢家集区', '3', '340400', '1', '1');
INSERT INTO `sys_area` VALUES ('340405', '八公山区', '3', '340400', '1', '1');
INSERT INTO `sys_area` VALUES ('340406', '潘集区', '3', '340400', '1', '1');
INSERT INTO `sys_area` VALUES ('340421', '凤台县', '3', '340400', '1', '1');
INSERT INTO `sys_area` VALUES ('340500', '马鞍山市', '2', '340000', '1', null);
INSERT INTO `sys_area` VALUES ('340501', '市辖区', '3', '340500', '0', '1');
INSERT INTO `sys_area` VALUES ('340502', '金家庄区', '3', '340500', '1', '1');
INSERT INTO `sys_area` VALUES ('340503', '花山区', '3', '340500', '1', '1');
INSERT INTO `sys_area` VALUES ('340504', '雨山区', '3', '340500', '1', '1');
INSERT INTO `sys_area` VALUES ('340521', '当涂县', '3', '340500', '1', '1');
INSERT INTO `sys_area` VALUES ('340600', '淮北市', '2', '340000', '1', null);
INSERT INTO `sys_area` VALUES ('340601', '市辖区', '3', '340600', '0', '1');
INSERT INTO `sys_area` VALUES ('340602', '杜集区', '3', '340600', '1', '1');
INSERT INTO `sys_area` VALUES ('340603', '相山区', '3', '340600', '1', '1');
INSERT INTO `sys_area` VALUES ('340604', '烈山区', '3', '340600', '1', '1');
INSERT INTO `sys_area` VALUES ('340621', '濉溪县', '3', '340600', '1', '1');
INSERT INTO `sys_area` VALUES ('340700', '铜陵市', '2', '340000', '1', null);
INSERT INTO `sys_area` VALUES ('340701', '市辖区', '3', '340700', '0', '1');
INSERT INTO `sys_area` VALUES ('340702', '铜官山区', '3', '340700', '1', '1');
INSERT INTO `sys_area` VALUES ('340703', '狮子山区', '3', '340700', '1', '1');
INSERT INTO `sys_area` VALUES ('340711', '郊区', '3', '340700', '1', '1');
INSERT INTO `sys_area` VALUES ('340721', '铜陵县', '3', '340700', '1', '1');
INSERT INTO `sys_area` VALUES ('340800', '安庆市', '2', '340000', '1', null);
INSERT INTO `sys_area` VALUES ('340801', '市辖区', '3', '340800', '0', '1');
INSERT INTO `sys_area` VALUES ('340802', '迎江区', '3', '340800', '1', '1');
INSERT INTO `sys_area` VALUES ('340803', '大观区', '3', '340800', '1', '1');
INSERT INTO `sys_area` VALUES ('340811', '宜秀区', '3', '340800', '1', '1');
INSERT INTO `sys_area` VALUES ('340822', '怀宁县', '3', '340800', '1', '1');
INSERT INTO `sys_area` VALUES ('340823', '枞阳县', '3', '340800', '1', '1');
INSERT INTO `sys_area` VALUES ('340824', '潜山县', '3', '340800', '1', '1');
INSERT INTO `sys_area` VALUES ('340825', '太湖县', '3', '340800', '1', '1');
INSERT INTO `sys_area` VALUES ('340826', '宿松县', '3', '340800', '1', '1');
INSERT INTO `sys_area` VALUES ('340827', '望江县', '3', '340800', '1', '1');
INSERT INTO `sys_area` VALUES ('340828', '岳西县', '3', '340800', '1', '1');
INSERT INTO `sys_area` VALUES ('340881', '桐城市', '3', '340800', '1', '1');
INSERT INTO `sys_area` VALUES ('341000', '黄山市', '2', '340000', '1', null);
INSERT INTO `sys_area` VALUES ('341001', '市辖区', '3', '341000', '0', '1');
INSERT INTO `sys_area` VALUES ('341002', '屯溪区', '3', '341000', '1', '1');
INSERT INTO `sys_area` VALUES ('341003', '黄山区', '3', '341000', '1', '1');
INSERT INTO `sys_area` VALUES ('341004', '徽州区', '3', '341000', '1', '1');
INSERT INTO `sys_area` VALUES ('341021', '歙县', '3', '341000', '1', '1');
INSERT INTO `sys_area` VALUES ('341022', '休宁县', '3', '341000', '1', '1');
INSERT INTO `sys_area` VALUES ('341023', '黟县', '3', '341000', '1', '1');
INSERT INTO `sys_area` VALUES ('341024', '祁门县', '3', '341000', '1', '1');
INSERT INTO `sys_area` VALUES ('341100', '滁州市', '2', '340000', '1', null);
INSERT INTO `sys_area` VALUES ('341101', '市辖区', '3', '341100', '0', '1');
INSERT INTO `sys_area` VALUES ('341102', '琅琊区', '3', '341100', '1', '1');
INSERT INTO `sys_area` VALUES ('341103', '南谯区', '3', '341100', '1', '1');
INSERT INTO `sys_area` VALUES ('341122', '来安县', '3', '341100', '1', '1');
INSERT INTO `sys_area` VALUES ('341124', '全椒县', '3', '341100', '1', '1');
INSERT INTO `sys_area` VALUES ('341125', '定远县', '3', '341100', '1', '1');
INSERT INTO `sys_area` VALUES ('341126', '凤阳县', '3', '341100', '1', '1');
INSERT INTO `sys_area` VALUES ('341181', '天长市', '3', '341100', '1', '1');
INSERT INTO `sys_area` VALUES ('341182', '明光市', '3', '341100', '1', '1');
INSERT INTO `sys_area` VALUES ('341200', '阜阳市', '2', '340000', '1', null);
INSERT INTO `sys_area` VALUES ('341201', '市辖区', '3', '341200', '0', '1');
INSERT INTO `sys_area` VALUES ('341202', '颍州区', '3', '341200', '1', '1');
INSERT INTO `sys_area` VALUES ('341203', '颍东区', '3', '341200', '1', '1');
INSERT INTO `sys_area` VALUES ('341204', '颍泉区', '3', '341200', '1', '1');
INSERT INTO `sys_area` VALUES ('341221', '临泉县', '3', '341200', '1', '1');
INSERT INTO `sys_area` VALUES ('341222', '太和县', '3', '341200', '1', '1');
INSERT INTO `sys_area` VALUES ('341225', '阜南县', '3', '341200', '1', '1');
INSERT INTO `sys_area` VALUES ('341226', '颍上县', '3', '341200', '1', '1');
INSERT INTO `sys_area` VALUES ('341282', '界首市', '3', '341200', '1', '1');
INSERT INTO `sys_area` VALUES ('341300', '宿州市', '2', '340000', '1', null);
INSERT INTO `sys_area` VALUES ('341301', '市辖区', '3', '341300', '0', '1');
INSERT INTO `sys_area` VALUES ('341302', '埇桥区', '3', '341300', '1', '1');
INSERT INTO `sys_area` VALUES ('341321', '砀山县', '3', '341300', '1', '1');
INSERT INTO `sys_area` VALUES ('341322', '萧县', '3', '341300', '1', '1');
INSERT INTO `sys_area` VALUES ('341323', '灵璧县', '3', '341300', '1', '1');
INSERT INTO `sys_area` VALUES ('341324', '泗县', '3', '341300', '1', '1');
INSERT INTO `sys_area` VALUES ('341400', '巢湖市', '2', '340000', '1', null);
INSERT INTO `sys_area` VALUES ('341401', '市辖区', '3', '341400', '0', '1');
INSERT INTO `sys_area` VALUES ('341402', '居巢区', '3', '341400', '1', '1');
INSERT INTO `sys_area` VALUES ('341421', '庐江县', '3', '341400', '1', '1');
INSERT INTO `sys_area` VALUES ('341422', '无为县', '3', '341400', '1', '1');
INSERT INTO `sys_area` VALUES ('341423', '含山县', '3', '341400', '1', '1');
INSERT INTO `sys_area` VALUES ('341424', '和县', '3', '341400', '1', '1');
INSERT INTO `sys_area` VALUES ('341500', '六安市', '2', '340000', '1', null);
INSERT INTO `sys_area` VALUES ('341501', '市辖区', '3', '341500', '0', '1');
INSERT INTO `sys_area` VALUES ('341502', '金安区', '3', '341500', '1', '1');
INSERT INTO `sys_area` VALUES ('341503', '裕安区', '3', '341500', '1', '1');
INSERT INTO `sys_area` VALUES ('341521', '寿县', '3', '341500', '1', '1');
INSERT INTO `sys_area` VALUES ('341522', '霍邱县', '3', '341500', '1', '1');
INSERT INTO `sys_area` VALUES ('341523', '舒城县', '3', '341500', '1', '1');
INSERT INTO `sys_area` VALUES ('341524', '金寨县', '3', '341500', '1', '1');
INSERT INTO `sys_area` VALUES ('341525', '霍山县', '3', '341500', '1', '1');
INSERT INTO `sys_area` VALUES ('341600', '亳州市', '2', '340000', '1', null);
INSERT INTO `sys_area` VALUES ('341601', '市辖区', '3', '341600', '0', '1');
INSERT INTO `sys_area` VALUES ('341602', '谯城区', '3', '341600', '1', '1');
INSERT INTO `sys_area` VALUES ('341621', '涡阳县', '3', '341600', '1', '1');
INSERT INTO `sys_area` VALUES ('341622', '蒙城县', '3', '341600', '1', '1');
INSERT INTO `sys_area` VALUES ('341623', '利辛县', '3', '341600', '1', '1');
INSERT INTO `sys_area` VALUES ('341700', '池州市', '2', '340000', '1', null);
INSERT INTO `sys_area` VALUES ('341701', '市辖区', '3', '341700', '0', '1');
INSERT INTO `sys_area` VALUES ('341702', '贵池区', '3', '341700', '1', '1');
INSERT INTO `sys_area` VALUES ('341721', '东至县', '3', '341700', '1', '1');
INSERT INTO `sys_area` VALUES ('341722', '石台县', '3', '341700', '1', '1');
INSERT INTO `sys_area` VALUES ('341723', '青阳县', '3', '341700', '1', '1');
INSERT INTO `sys_area` VALUES ('341800', '宣城市', '2', '340000', '1', null);
INSERT INTO `sys_area` VALUES ('341801', '市辖区', '3', '341800', '0', '1');
INSERT INTO `sys_area` VALUES ('341802', '宣州区', '3', '341800', '1', '1');
INSERT INTO `sys_area` VALUES ('341821', '郎溪县', '3', '341800', '1', '1');
INSERT INTO `sys_area` VALUES ('341822', '广德县', '3', '341800', '1', '1');
INSERT INTO `sys_area` VALUES ('341823', '泾县', '3', '341800', '1', '1');
INSERT INTO `sys_area` VALUES ('341824', '绩溪县', '3', '341800', '1', '1');
INSERT INTO `sys_area` VALUES ('341825', '旌德县', '3', '341800', '1', '1');
INSERT INTO `sys_area` VALUES ('341881', '宁国市', '3', '341800', '1', '1');
INSERT INTO `sys_area` VALUES ('350000', '福建省', '1', '0', '1', null);
INSERT INTO `sys_area` VALUES ('350100', '福州市', '2', '350000', '1', null);
INSERT INTO `sys_area` VALUES ('350101', '市辖区', '3', '350100', '0', '1');
INSERT INTO `sys_area` VALUES ('350102', '鼓楼区', '3', '350100', '1', '1');
INSERT INTO `sys_area` VALUES ('350103', '台江区', '3', '350100', '1', '1');
INSERT INTO `sys_area` VALUES ('350104', '仓山区', '3', '350100', '1', '1');
INSERT INTO `sys_area` VALUES ('350105', '马尾区', '3', '350100', '1', '1');
INSERT INTO `sys_area` VALUES ('350111', '晋安区', '3', '350100', '1', '1');
INSERT INTO `sys_area` VALUES ('350121', '闽侯县', '3', '350100', '1', '1');
INSERT INTO `sys_area` VALUES ('350122', '连江县', '3', '350100', '1', '1');
INSERT INTO `sys_area` VALUES ('350123', '罗源县', '3', '350100', '1', '1');
INSERT INTO `sys_area` VALUES ('350124', '闽清县', '3', '350100', '1', '1');
INSERT INTO `sys_area` VALUES ('350125', '永泰县', '3', '350100', '1', '1');
INSERT INTO `sys_area` VALUES ('350128', '平潭县', '3', '350100', '1', '1');
INSERT INTO `sys_area` VALUES ('350181', '福清市', '3', '350100', '1', '1');
INSERT INTO `sys_area` VALUES ('350182', '长乐市', '3', '350100', '1', '1');
INSERT INTO `sys_area` VALUES ('350200', '厦门市', '2', '350000', '1', null);
INSERT INTO `sys_area` VALUES ('350201', '市辖区', '3', '350200', '0', '1');
INSERT INTO `sys_area` VALUES ('350203', '思明区', '3', '350200', '1', '1');
INSERT INTO `sys_area` VALUES ('350205', '海沧区', '3', '350200', '1', '1');
INSERT INTO `sys_area` VALUES ('350206', '湖里区', '3', '350200', '1', '1');
INSERT INTO `sys_area` VALUES ('350211', '集美区', '3', '350200', '1', '1');
INSERT INTO `sys_area` VALUES ('350212', '同安区', '3', '350200', '1', '1');
INSERT INTO `sys_area` VALUES ('350213', '翔安区', '3', '350200', '1', '1');
INSERT INTO `sys_area` VALUES ('350300', '莆田市', '2', '350000', '1', null);
INSERT INTO `sys_area` VALUES ('350301', '市辖区', '3', '350300', '0', '1');
INSERT INTO `sys_area` VALUES ('350302', '城厢区', '3', '350300', '1', '1');
INSERT INTO `sys_area` VALUES ('350303', '涵江区', '3', '350300', '1', '1');
INSERT INTO `sys_area` VALUES ('350304', '荔城区', '3', '350300', '1', '1');
INSERT INTO `sys_area` VALUES ('350305', '秀屿区', '3', '350300', '1', '1');
INSERT INTO `sys_area` VALUES ('350322', '仙游县', '3', '350300', '1', '1');
INSERT INTO `sys_area` VALUES ('350400', '三明市', '2', '350000', '1', null);
INSERT INTO `sys_area` VALUES ('350401', '市辖区', '3', '350400', '0', '1');
INSERT INTO `sys_area` VALUES ('350402', '梅列区', '3', '350400', '1', '1');
INSERT INTO `sys_area` VALUES ('350403', '三元区', '3', '350400', '1', '1');
INSERT INTO `sys_area` VALUES ('350421', '明溪县', '3', '350400', '1', '1');
INSERT INTO `sys_area` VALUES ('350423', '清流县', '3', '350400', '1', '1');
INSERT INTO `sys_area` VALUES ('350424', '宁化县', '3', '350400', '1', '1');
INSERT INTO `sys_area` VALUES ('350425', '大田县', '3', '350400', '1', '1');
INSERT INTO `sys_area` VALUES ('350426', '尤溪县', '3', '350400', '1', '1');
INSERT INTO `sys_area` VALUES ('350427', '沙县', '3', '350400', '1', '1');
INSERT INTO `sys_area` VALUES ('350428', '将乐县', '3', '350400', '1', '1');
INSERT INTO `sys_area` VALUES ('350429', '泰宁县', '3', '350400', '1', '1');
INSERT INTO `sys_area` VALUES ('350430', '建宁县', '3', '350400', '1', '1');
INSERT INTO `sys_area` VALUES ('350481', '永安市', '3', '350400', '1', '1');
INSERT INTO `sys_area` VALUES ('350500', '泉州市', '2', '350000', '1', null);
INSERT INTO `sys_area` VALUES ('350501', '市辖区', '3', '350500', '0', '1');
INSERT INTO `sys_area` VALUES ('350502', '鲤城区', '3', '350500', '1', '1');
INSERT INTO `sys_area` VALUES ('350503', '丰泽区', '3', '350500', '1', '1');
INSERT INTO `sys_area` VALUES ('350504', '洛江区', '3', '350500', '1', '1');
INSERT INTO `sys_area` VALUES ('350505', '泉港区', '3', '350500', '1', '1');
INSERT INTO `sys_area` VALUES ('350521', '惠安县', '3', '350500', '1', '1');
INSERT INTO `sys_area` VALUES ('350524', '安溪县', '3', '350500', '1', '1');
INSERT INTO `sys_area` VALUES ('350525', '永春县', '3', '350500', '1', '1');
INSERT INTO `sys_area` VALUES ('350526', '德化县', '3', '350500', '1', '1');
INSERT INTO `sys_area` VALUES ('350527', '金门县', '3', '350500', '1', '1');
INSERT INTO `sys_area` VALUES ('350581', '石狮市', '3', '350500', '1', '1');
INSERT INTO `sys_area` VALUES ('350582', '晋江市', '3', '350500', '1', '1');
INSERT INTO `sys_area` VALUES ('350583', '南安市', '3', '350500', '1', '1');
INSERT INTO `sys_area` VALUES ('350600', '漳州市', '2', '350000', '1', null);
INSERT INTO `sys_area` VALUES ('350601', '市辖区', '3', '350600', '0', '1');
INSERT INTO `sys_area` VALUES ('350602', '芗城区', '3', '350600', '1', '1');
INSERT INTO `sys_area` VALUES ('350603', '龙文区', '3', '350600', '1', '1');
INSERT INTO `sys_area` VALUES ('350622', '云霄县', '3', '350600', '1', '1');
INSERT INTO `sys_area` VALUES ('350623', '漳浦县', '3', '350600', '1', '1');
INSERT INTO `sys_area` VALUES ('350624', '诏安县', '3', '350600', '1', '1');
INSERT INTO `sys_area` VALUES ('350625', '长泰县', '3', '350600', '1', '1');
INSERT INTO `sys_area` VALUES ('350626', '东山县', '3', '350600', '1', '1');
INSERT INTO `sys_area` VALUES ('350627', '南靖县', '3', '350600', '1', '1');
INSERT INTO `sys_area` VALUES ('350628', '平和县', '3', '350600', '1', '1');
INSERT INTO `sys_area` VALUES ('350629', '华安县', '3', '350600', '1', '1');
INSERT INTO `sys_area` VALUES ('350681', '龙海市', '3', '350600', '1', '1');
INSERT INTO `sys_area` VALUES ('350700', '南平市', '2', '350000', '1', null);
INSERT INTO `sys_area` VALUES ('350701', '市辖区', '3', '350700', '0', '1');
INSERT INTO `sys_area` VALUES ('350702', '延平区', '3', '350700', '1', '1');
INSERT INTO `sys_area` VALUES ('350721', '顺昌县', '3', '350700', '1', '1');
INSERT INTO `sys_area` VALUES ('350722', '浦城县', '3', '350700', '1', '1');
INSERT INTO `sys_area` VALUES ('350723', '光泽县', '3', '350700', '1', '1');
INSERT INTO `sys_area` VALUES ('350724', '松溪县', '3', '350700', '1', '1');
INSERT INTO `sys_area` VALUES ('350725', '政和县', '3', '350700', '1', '1');
INSERT INTO `sys_area` VALUES ('350781', '邵武市', '3', '350700', '1', '1');
INSERT INTO `sys_area` VALUES ('350782', '武夷山市', '3', '350700', '1', '1');
INSERT INTO `sys_area` VALUES ('350783', '建瓯市', '3', '350700', '1', '1');
INSERT INTO `sys_area` VALUES ('350784', '建阳市', '3', '350700', '1', '1');
INSERT INTO `sys_area` VALUES ('350800', '龙岩市', '2', '350000', '1', null);
INSERT INTO `sys_area` VALUES ('350801', '市辖区', '3', '350800', '0', '1');
INSERT INTO `sys_area` VALUES ('350802', '新罗区', '3', '350800', '1', '1');
INSERT INTO `sys_area` VALUES ('350821', '长汀县', '3', '350800', '1', '1');
INSERT INTO `sys_area` VALUES ('350822', '永定县', '3', '350800', '1', '1');
INSERT INTO `sys_area` VALUES ('350823', '上杭县', '3', '350800', '1', '1');
INSERT INTO `sys_area` VALUES ('350824', '武平县', '3', '350800', '1', '1');
INSERT INTO `sys_area` VALUES ('350825', '连城县', '3', '350800', '1', '1');
INSERT INTO `sys_area` VALUES ('350881', '漳平市', '3', '350800', '1', '1');
INSERT INTO `sys_area` VALUES ('350900', '宁德市', '2', '350000', '1', null);
INSERT INTO `sys_area` VALUES ('350901', '市辖区', '3', '350900', '0', '1');
INSERT INTO `sys_area` VALUES ('350902', '蕉城区', '3', '350900', '1', '1');
INSERT INTO `sys_area` VALUES ('350921', '霞浦县', '3', '350900', '1', '1');
INSERT INTO `sys_area` VALUES ('350922', '古田县', '3', '350900', '1', '1');
INSERT INTO `sys_area` VALUES ('350923', '屏南县', '3', '350900', '1', '1');
INSERT INTO `sys_area` VALUES ('350924', '寿宁县', '3', '350900', '1', '1');
INSERT INTO `sys_area` VALUES ('350925', '周宁县', '3', '350900', '1', '1');
INSERT INTO `sys_area` VALUES ('350926', '柘荣县', '3', '350900', '1', '1');
INSERT INTO `sys_area` VALUES ('350981', '福安市', '3', '350900', '1', '1');
INSERT INTO `sys_area` VALUES ('350982', '福鼎市', '3', '350900', '1', '1');
INSERT INTO `sys_area` VALUES ('360000', '江西省', '1', '0', '1', null);
INSERT INTO `sys_area` VALUES ('360100', '南昌市', '2', '360000', '1', null);
INSERT INTO `sys_area` VALUES ('360101', '市辖区', '3', '360100', '0', '1');
INSERT INTO `sys_area` VALUES ('360102', '东湖区', '3', '360100', '1', '1');
INSERT INTO `sys_area` VALUES ('360103', '西湖区', '3', '360100', '1', '1');
INSERT INTO `sys_area` VALUES ('360104', '青云谱区', '3', '360100', '1', '1');
INSERT INTO `sys_area` VALUES ('360105', '湾里区', '3', '360100', '1', '1');
INSERT INTO `sys_area` VALUES ('360111', '青山湖区', '3', '360100', '1', '1');
INSERT INTO `sys_area` VALUES ('360121', '南昌县', '3', '360100', '1', '1');
INSERT INTO `sys_area` VALUES ('360122', '新建县', '3', '360100', '1', '1');
INSERT INTO `sys_area` VALUES ('360123', '安义县', '3', '360100', '1', '1');
INSERT INTO `sys_area` VALUES ('360124', '进贤县', '3', '360100', '1', '1');
INSERT INTO `sys_area` VALUES ('360200', '景德镇市', '2', '360000', '1', null);
INSERT INTO `sys_area` VALUES ('360201', '市辖区', '3', '360200', '0', '1');
INSERT INTO `sys_area` VALUES ('360202', '昌江区', '3', '360200', '1', '1');
INSERT INTO `sys_area` VALUES ('360203', '珠山区', '3', '360200', '1', '1');
INSERT INTO `sys_area` VALUES ('360222', '浮梁县', '3', '360200', '1', '1');
INSERT INTO `sys_area` VALUES ('360281', '乐平市', '3', '360200', '1', '1');
INSERT INTO `sys_area` VALUES ('360300', '萍乡市', '2', '360000', '1', null);
INSERT INTO `sys_area` VALUES ('360301', '市辖区', '3', '360300', '0', '1');
INSERT INTO `sys_area` VALUES ('360302', '安源区', '3', '360300', '1', '1');
INSERT INTO `sys_area` VALUES ('360313', '湘东区', '3', '360300', '1', '1');
INSERT INTO `sys_area` VALUES ('360321', '莲花县', '3', '360300', '1', '1');
INSERT INTO `sys_area` VALUES ('360322', '上栗县', '3', '360300', '1', '1');
INSERT INTO `sys_area` VALUES ('360323', '芦溪县', '3', '360300', '1', '1');
INSERT INTO `sys_area` VALUES ('360400', '九江市', '2', '360000', '1', null);
INSERT INTO `sys_area` VALUES ('360401', '市辖区', '3', '360400', '0', '1');
INSERT INTO `sys_area` VALUES ('360402', '庐山区', '3', '360400', '1', '1');
INSERT INTO `sys_area` VALUES ('360403', '浔阳区', '3', '360400', '1', '1');
INSERT INTO `sys_area` VALUES ('360421', '九江县', '3', '360400', '1', '1');
INSERT INTO `sys_area` VALUES ('360423', '武宁县', '3', '360400', '1', '1');
INSERT INTO `sys_area` VALUES ('360424', '修水县', '3', '360400', '1', '1');
INSERT INTO `sys_area` VALUES ('360425', '永修县', '3', '360400', '1', '1');
INSERT INTO `sys_area` VALUES ('360426', '德安县', '3', '360400', '1', '1');
INSERT INTO `sys_area` VALUES ('360427', '星子县', '3', '360400', '1', '1');
INSERT INTO `sys_area` VALUES ('360428', '都昌县', '3', '360400', '1', '1');
INSERT INTO `sys_area` VALUES ('360429', '湖口县', '3', '360400', '1', '1');
INSERT INTO `sys_area` VALUES ('360430', '彭泽县', '3', '360400', '1', '1');
INSERT INTO `sys_area` VALUES ('360481', '瑞昌市', '3', '360400', '1', '1');
INSERT INTO `sys_area` VALUES ('360500', '新余市', '2', '360000', '1', null);
INSERT INTO `sys_area` VALUES ('360501', '市辖区', '3', '360500', '0', '1');
INSERT INTO `sys_area` VALUES ('360502', '渝水区', '3', '360500', '1', '1');
INSERT INTO `sys_area` VALUES ('360521', '分宜县', '3', '360500', '1', '1');
INSERT INTO `sys_area` VALUES ('360600', '鹰潭市', '2', '360000', '1', null);
INSERT INTO `sys_area` VALUES ('360601', '市辖区', '3', '360600', '0', '1');
INSERT INTO `sys_area` VALUES ('360602', '月湖区', '3', '360600', '1', '1');
INSERT INTO `sys_area` VALUES ('360622', '余江县', '3', '360600', '1', '1');
INSERT INTO `sys_area` VALUES ('360681', '贵溪市', '3', '360600', '1', '1');
INSERT INTO `sys_area` VALUES ('360700', '赣州市', '2', '360000', '1', null);
INSERT INTO `sys_area` VALUES ('360701', '市辖区', '3', '360700', '0', '1');
INSERT INTO `sys_area` VALUES ('360702', '章贡区', '3', '360700', '1', '1');
INSERT INTO `sys_area` VALUES ('360721', '赣县', '3', '360700', '1', '1');
INSERT INTO `sys_area` VALUES ('360722', '信丰县', '3', '360700', '1', '1');
INSERT INTO `sys_area` VALUES ('360723', '大余县', '3', '360700', '1', '1');
INSERT INTO `sys_area` VALUES ('360724', '上犹县', '3', '360700', '1', '1');
INSERT INTO `sys_area` VALUES ('360725', '崇义县', '3', '360700', '1', '1');
INSERT INTO `sys_area` VALUES ('360726', '安远县', '3', '360700', '1', '1');
INSERT INTO `sys_area` VALUES ('360727', '龙南县', '3', '360700', '1', '1');
INSERT INTO `sys_area` VALUES ('360728', '定南县', '3', '360700', '1', '1');
INSERT INTO `sys_area` VALUES ('360729', '全南县', '3', '360700', '1', '1');
INSERT INTO `sys_area` VALUES ('360730', '宁都县', '3', '360700', '1', '1');
INSERT INTO `sys_area` VALUES ('360731', '于都县', '3', '360700', '1', '1');
INSERT INTO `sys_area` VALUES ('360732', '兴国县', '3', '360700', '1', '1');
INSERT INTO `sys_area` VALUES ('360733', '会昌县', '3', '360700', '1', '1');
INSERT INTO `sys_area` VALUES ('360734', '寻乌县', '3', '360700', '1', '1');
INSERT INTO `sys_area` VALUES ('360735', '石城县', '3', '360700', '1', '1');
INSERT INTO `sys_area` VALUES ('360781', '瑞金市', '3', '360700', '1', '1');
INSERT INTO `sys_area` VALUES ('360782', '南康市', '3', '360700', '1', '1');
INSERT INTO `sys_area` VALUES ('360800', '吉安市', '2', '360000', '1', null);
INSERT INTO `sys_area` VALUES ('360801', '市辖区', '3', '360800', '0', '1');
INSERT INTO `sys_area` VALUES ('360802', '吉州区', '3', '360800', '1', '1');
INSERT INTO `sys_area` VALUES ('360803', '青原区', '3', '360800', '1', '1');
INSERT INTO `sys_area` VALUES ('360821', '吉安县', '3', '360800', '1', '1');
INSERT INTO `sys_area` VALUES ('360822', '吉水县', '3', '360800', '1', '1');
INSERT INTO `sys_area` VALUES ('360823', '峡江县', '3', '360800', '1', '1');
INSERT INTO `sys_area` VALUES ('360824', '新干县', '3', '360800', '1', '1');
INSERT INTO `sys_area` VALUES ('360825', '永丰县', '3', '360800', '1', '1');
INSERT INTO `sys_area` VALUES ('360826', '泰和县', '3', '360800', '1', '1');
INSERT INTO `sys_area` VALUES ('360827', '遂川县', '3', '360800', '1', '1');
INSERT INTO `sys_area` VALUES ('360828', '万安县', '3', '360800', '1', '1');
INSERT INTO `sys_area` VALUES ('360829', '安福县', '3', '360800', '1', '1');
INSERT INTO `sys_area` VALUES ('360830', '永新县', '3', '360800', '1', '1');
INSERT INTO `sys_area` VALUES ('360881', '井冈山市', '3', '360800', '1', '1');
INSERT INTO `sys_area` VALUES ('360900', '宜春市', '2', '360000', '1', null);
INSERT INTO `sys_area` VALUES ('360901', '市辖区', '3', '360900', '0', '1');
INSERT INTO `sys_area` VALUES ('360902', '袁州区', '3', '360900', '1', '1');
INSERT INTO `sys_area` VALUES ('360921', '奉新县', '3', '360900', '1', '1');
INSERT INTO `sys_area` VALUES ('360922', '万载县', '3', '360900', '1', '1');
INSERT INTO `sys_area` VALUES ('360923', '上高县', '3', '360900', '1', '1');
INSERT INTO `sys_area` VALUES ('360924', '宜丰县', '3', '360900', '1', '1');
INSERT INTO `sys_area` VALUES ('360925', '靖安县', '3', '360900', '1', '1');
INSERT INTO `sys_area` VALUES ('360926', '铜鼓县', '3', '360900', '1', '1');
INSERT INTO `sys_area` VALUES ('360981', '丰城市', '3', '360900', '1', '1');
INSERT INTO `sys_area` VALUES ('360982', '樟树市', '3', '360900', '1', '1');
INSERT INTO `sys_area` VALUES ('360983', '高安市', '3', '360900', '1', '1');
INSERT INTO `sys_area` VALUES ('361000', '抚州市', '2', '360000', '1', null);
INSERT INTO `sys_area` VALUES ('361001', '市辖区', '3', '361000', '0', '1');
INSERT INTO `sys_area` VALUES ('361002', '临川区', '3', '361000', '1', '1');
INSERT INTO `sys_area` VALUES ('361021', '南城县', '3', '361000', '1', '1');
INSERT INTO `sys_area` VALUES ('361022', '黎川县', '3', '361000', '1', '1');
INSERT INTO `sys_area` VALUES ('361023', '南丰县', '3', '361000', '1', '1');
INSERT INTO `sys_area` VALUES ('361024', '崇仁县', '3', '361000', '1', '1');
INSERT INTO `sys_area` VALUES ('361025', '乐安县', '3', '361000', '1', '1');
INSERT INTO `sys_area` VALUES ('361026', '宜黄县', '3', '361000', '1', '1');
INSERT INTO `sys_area` VALUES ('361027', '金溪县', '3', '361000', '1', '1');
INSERT INTO `sys_area` VALUES ('361028', '资溪县', '3', '361000', '1', '1');
INSERT INTO `sys_area` VALUES ('361029', '东乡县', '3', '361000', '1', '1');
INSERT INTO `sys_area` VALUES ('361030', '广昌县', '3', '361000', '1', '1');
INSERT INTO `sys_area` VALUES ('361100', '上饶市', '2', '360000', '1', null);
INSERT INTO `sys_area` VALUES ('361101', '市辖区', '3', '361100', '0', '1');
INSERT INTO `sys_area` VALUES ('361102', '信州区', '3', '361100', '1', '1');
INSERT INTO `sys_area` VALUES ('361121', '上饶县', '3', '361100', '1', '1');
INSERT INTO `sys_area` VALUES ('361122', '广丰县', '3', '361100', '1', '1');
INSERT INTO `sys_area` VALUES ('361123', '玉山县', '3', '361100', '1', '1');
INSERT INTO `sys_area` VALUES ('361124', '铅山县', '3', '361100', '1', '1');
INSERT INTO `sys_area` VALUES ('361125', '横峰县', '3', '361100', '1', '1');
INSERT INTO `sys_area` VALUES ('361126', '弋阳县', '3', '361100', '1', '1');
INSERT INTO `sys_area` VALUES ('361127', '余干县', '3', '361100', '1', '1');
INSERT INTO `sys_area` VALUES ('361128', '鄱阳县', '3', '361100', '1', '1');
INSERT INTO `sys_area` VALUES ('361129', '万年县', '3', '361100', '1', '1');
INSERT INTO `sys_area` VALUES ('361130', '婺源县', '3', '361100', '1', '1');
INSERT INTO `sys_area` VALUES ('361181', '德兴市', '3', '361100', '1', '1');
INSERT INTO `sys_area` VALUES ('370000', '山东省', '1', '0', '1', null);
INSERT INTO `sys_area` VALUES ('370100', '济南市', '2', '370000', '1', null);
INSERT INTO `sys_area` VALUES ('370101', '市辖区', '3', '370100', '0', '1');
INSERT INTO `sys_area` VALUES ('370102', '历下区', '3', '370100', '1', '1');
INSERT INTO `sys_area` VALUES ('370103', '市中区', '3', '370100', '1', '1');
INSERT INTO `sys_area` VALUES ('370104', '槐荫区', '3', '370100', '1', '1');
INSERT INTO `sys_area` VALUES ('370105', '天桥区', '3', '370100', '1', '1');
INSERT INTO `sys_area` VALUES ('370112', '历城区', '3', '370100', '1', '1');
INSERT INTO `sys_area` VALUES ('370113', '长清区', '3', '370100', '1', '1');
INSERT INTO `sys_area` VALUES ('370124', '平阴县', '3', '370100', '1', '1');
INSERT INTO `sys_area` VALUES ('370125', '济阳县', '3', '370100', '1', '1');
INSERT INTO `sys_area` VALUES ('370126', '商河县', '3', '370100', '1', '1');
INSERT INTO `sys_area` VALUES ('370181', '章丘市', '3', '370100', '1', '1');
INSERT INTO `sys_area` VALUES ('370200', '青岛市', '2', '370000', '1', null);
INSERT INTO `sys_area` VALUES ('370201', '市辖区', '3', '370200', '0', '1');
INSERT INTO `sys_area` VALUES ('370202', '市南区', '3', '370200', '1', '1');
INSERT INTO `sys_area` VALUES ('370203', '市北区', '3', '370200', '1', '1');
INSERT INTO `sys_area` VALUES ('370205', '四方区', '3', '370200', '1', '1');
INSERT INTO `sys_area` VALUES ('370211', '黄岛区', '3', '370200', '1', '1');
INSERT INTO `sys_area` VALUES ('370212', '崂山区', '3', '370200', '1', '1');
INSERT INTO `sys_area` VALUES ('370213', '李沧区', '3', '370200', '1', '1');
INSERT INTO `sys_area` VALUES ('370214', '城阳区', '3', '370200', '1', '1');
INSERT INTO `sys_area` VALUES ('370281', '胶州市', '3', '370200', '1', '1');
INSERT INTO `sys_area` VALUES ('370282', '即墨市', '3', '370200', '1', '1');
INSERT INTO `sys_area` VALUES ('370283', '平度市', '3', '370200', '1', '1');
INSERT INTO `sys_area` VALUES ('370284', '胶南市', '3', '370200', '1', '1');
INSERT INTO `sys_area` VALUES ('370285', '莱西市', '3', '370200', '1', '1');
INSERT INTO `sys_area` VALUES ('370300', '淄博市', '2', '370000', '1', null);
INSERT INTO `sys_area` VALUES ('370301', '市辖区', '3', '370300', '0', '1');
INSERT INTO `sys_area` VALUES ('370302', '淄川区', '3', '370300', '1', '1');
INSERT INTO `sys_area` VALUES ('370303', '张店区', '3', '370300', '1', '1');
INSERT INTO `sys_area` VALUES ('370304', '博山区', '3', '370300', '1', '1');
INSERT INTO `sys_area` VALUES ('370305', '临淄区', '3', '370300', '1', '1');
INSERT INTO `sys_area` VALUES ('370306', '周村区', '3', '370300', '1', '1');
INSERT INTO `sys_area` VALUES ('370321', '桓台县', '3', '370300', '1', '1');
INSERT INTO `sys_area` VALUES ('370322', '高青县', '3', '370300', '1', '1');
INSERT INTO `sys_area` VALUES ('370323', '沂源县', '3', '370300', '1', '1');
INSERT INTO `sys_area` VALUES ('370400', '枣庄市', '2', '370000', '1', null);
INSERT INTO `sys_area` VALUES ('370401', '市辖区', '3', '370400', '0', '1');
INSERT INTO `sys_area` VALUES ('370402', '市中区', '3', '370400', '1', '1');
INSERT INTO `sys_area` VALUES ('370403', '薛城区', '3', '370400', '1', '1');
INSERT INTO `sys_area` VALUES ('370404', '峄城区', '3', '370400', '1', '1');
INSERT INTO `sys_area` VALUES ('370405', '台儿庄区', '3', '370400', '1', '1');
INSERT INTO `sys_area` VALUES ('370406', '山亭区', '3', '370400', '1', '1');
INSERT INTO `sys_area` VALUES ('370481', '滕州市', '3', '370400', '1', '1');
INSERT INTO `sys_area` VALUES ('370500', '东营市', '2', '370000', '1', null);
INSERT INTO `sys_area` VALUES ('370501', '市辖区', '3', '370500', '0', '1');
INSERT INTO `sys_area` VALUES ('370502', '东营区', '3', '370500', '1', '1');
INSERT INTO `sys_area` VALUES ('370503', '河口区', '3', '370500', '1', '1');
INSERT INTO `sys_area` VALUES ('370521', '垦利县', '3', '370500', '1', '1');
INSERT INTO `sys_area` VALUES ('370522', '利津县', '3', '370500', '1', '1');
INSERT INTO `sys_area` VALUES ('370523', '广饶县', '3', '370500', '1', '1');
INSERT INTO `sys_area` VALUES ('370600', '烟台市', '2', '370000', '1', null);
INSERT INTO `sys_area` VALUES ('370601', '市辖区', '3', '370600', '0', '1');
INSERT INTO `sys_area` VALUES ('370602', '芝罘区', '3', '370600', '1', '1');
INSERT INTO `sys_area` VALUES ('370611', '福山区', '3', '370600', '1', '1');
INSERT INTO `sys_area` VALUES ('370612', '牟平区', '3', '370600', '1', '1');
INSERT INTO `sys_area` VALUES ('370613', '莱山区', '3', '370600', '1', '1');
INSERT INTO `sys_area` VALUES ('370634', '长岛县', '3', '370600', '1', '1');
INSERT INTO `sys_area` VALUES ('370681', '龙口市', '3', '370600', '1', '1');
INSERT INTO `sys_area` VALUES ('370682', '莱阳市', '3', '370600', '1', '1');
INSERT INTO `sys_area` VALUES ('370683', '莱州市', '3', '370600', '1', '1');
INSERT INTO `sys_area` VALUES ('370684', '蓬莱市', '3', '370600', '1', '1');
INSERT INTO `sys_area` VALUES ('370685', '招远市', '3', '370600', '1', '1');
INSERT INTO `sys_area` VALUES ('370686', '栖霞市', '3', '370600', '1', '1');
INSERT INTO `sys_area` VALUES ('370687', '海阳市', '3', '370600', '1', '1');
INSERT INTO `sys_area` VALUES ('370700', '潍坊市', '2', '370000', '1', null);
INSERT INTO `sys_area` VALUES ('370701', '市辖区', '3', '370700', '0', '1');
INSERT INTO `sys_area` VALUES ('370702', '潍城区', '3', '370700', '1', '1');
INSERT INTO `sys_area` VALUES ('370703', '寒亭区', '3', '370700', '1', '1');
INSERT INTO `sys_area` VALUES ('370704', '坊子区', '3', '370700', '1', '1');
INSERT INTO `sys_area` VALUES ('370705', '奎文区', '3', '370700', '1', '1');
INSERT INTO `sys_area` VALUES ('370724', '临朐县', '3', '370700', '1', '1');
INSERT INTO `sys_area` VALUES ('370725', '昌乐县', '3', '370700', '1', '1');
INSERT INTO `sys_area` VALUES ('370781', '青州市', '3', '370700', '1', '1');
INSERT INTO `sys_area` VALUES ('370782', '诸城市', '3', '370700', '1', '1');
INSERT INTO `sys_area` VALUES ('370783', '寿光市', '3', '370700', '1', '1');
INSERT INTO `sys_area` VALUES ('370784', '安丘市', '3', '370700', '1', '1');
INSERT INTO `sys_area` VALUES ('370785', '高密市', '3', '370700', '1', '1');
INSERT INTO `sys_area` VALUES ('370786', '昌邑市', '3', '370700', '1', '1');
INSERT INTO `sys_area` VALUES ('370800', '济宁市', '2', '370000', '1', null);
INSERT INTO `sys_area` VALUES ('370801', '市辖区', '3', '370800', '0', '1');
INSERT INTO `sys_area` VALUES ('370802', '市中区', '3', '370800', '1', '1');
INSERT INTO `sys_area` VALUES ('370811', '任城区', '3', '370800', '1', '1');
INSERT INTO `sys_area` VALUES ('370826', '微山县', '3', '370800', '1', '1');
INSERT INTO `sys_area` VALUES ('370827', '鱼台县', '3', '370800', '1', '1');
INSERT INTO `sys_area` VALUES ('370828', '金乡县', '3', '370800', '1', '1');
INSERT INTO `sys_area` VALUES ('370829', '嘉祥县', '3', '370800', '1', '1');
INSERT INTO `sys_area` VALUES ('370830', '汶上县', '3', '370800', '1', '1');
INSERT INTO `sys_area` VALUES ('370831', '泗水县', '3', '370800', '1', '1');
INSERT INTO `sys_area` VALUES ('370832', '梁山县', '3', '370800', '1', '1');
INSERT INTO `sys_area` VALUES ('370881', '曲阜市', '3', '370800', '1', '1');
INSERT INTO `sys_area` VALUES ('370882', '兖州市', '3', '370800', '1', '1');
INSERT INTO `sys_area` VALUES ('370883', '邹城市', '3', '370800', '1', '1');
INSERT INTO `sys_area` VALUES ('370900', '泰安市', '2', '370000', '1', null);
INSERT INTO `sys_area` VALUES ('370901', '市辖区', '3', '370900', '0', '1');
INSERT INTO `sys_area` VALUES ('370902', '泰山区', '3', '370900', '1', '1');
INSERT INTO `sys_area` VALUES ('370911', '岱岳区', '3', '370900', '1', '1');
INSERT INTO `sys_area` VALUES ('370921', '宁阳县', '3', '370900', '1', '1');
INSERT INTO `sys_area` VALUES ('370923', '东平县', '3', '370900', '1', '1');
INSERT INTO `sys_area` VALUES ('370982', '新泰市', '3', '370900', '1', '1');
INSERT INTO `sys_area` VALUES ('370983', '肥城市', '3', '370900', '1', '1');
INSERT INTO `sys_area` VALUES ('371000', '威海市', '2', '370000', '1', null);
INSERT INTO `sys_area` VALUES ('371001', '市辖区', '3', '371000', '0', '1');
INSERT INTO `sys_area` VALUES ('371002', '环翠区', '3', '371000', '1', '1');
INSERT INTO `sys_area` VALUES ('371081', '文登市', '3', '371000', '1', '1');
INSERT INTO `sys_area` VALUES ('371082', '荣成市', '3', '371000', '1', '1');
INSERT INTO `sys_area` VALUES ('371083', '乳山市', '3', '371000', '1', '1');
INSERT INTO `sys_area` VALUES ('371100', '日照市', '2', '370000', '1', null);
INSERT INTO `sys_area` VALUES ('371101', '市辖区', '3', '371100', '0', '1');
INSERT INTO `sys_area` VALUES ('371102', '东港区', '3', '371100', '1', '1');
INSERT INTO `sys_area` VALUES ('371103', '岚山区', '3', '371100', '1', '1');
INSERT INTO `sys_area` VALUES ('371121', '五莲县', '3', '371100', '1', '1');
INSERT INTO `sys_area` VALUES ('371122', '莒县', '3', '371100', '1', '1');
INSERT INTO `sys_area` VALUES ('371200', '莱芜市', '2', '370000', '1', null);
INSERT INTO `sys_area` VALUES ('371201', '市辖区', '3', '371200', '0', '1');
INSERT INTO `sys_area` VALUES ('371202', '莱城区', '3', '371200', '1', '1');
INSERT INTO `sys_area` VALUES ('371203', '钢城区', '3', '371200', '1', '1');
INSERT INTO `sys_area` VALUES ('371300', '临沂市', '2', '370000', '1', null);
INSERT INTO `sys_area` VALUES ('371301', '市辖区', '3', '371300', '0', '1');
INSERT INTO `sys_area` VALUES ('371302', '兰山区', '3', '371300', '1', '1');
INSERT INTO `sys_area` VALUES ('371311', '罗庄区', '3', '371300', '1', '1');
INSERT INTO `sys_area` VALUES ('371312', '河东区', '3', '371300', '1', '1');
INSERT INTO `sys_area` VALUES ('371321', '沂南县', '3', '371300', '1', '1');
INSERT INTO `sys_area` VALUES ('371322', '郯城县', '3', '371300', '1', '1');
INSERT INTO `sys_area` VALUES ('371323', '沂水县', '3', '371300', '1', '1');
INSERT INTO `sys_area` VALUES ('371324', '苍山县', '3', '371300', '1', '1');
INSERT INTO `sys_area` VALUES ('371325', '费县', '3', '371300', '1', '1');
INSERT INTO `sys_area` VALUES ('371326', '平邑县', '3', '371300', '1', '1');
INSERT INTO `sys_area` VALUES ('371327', '莒南县', '3', '371300', '1', '1');
INSERT INTO `sys_area` VALUES ('371328', '蒙阴县', '3', '371300', '1', '1');
INSERT INTO `sys_area` VALUES ('371329', '临沭县', '3', '371300', '1', '1');
INSERT INTO `sys_area` VALUES ('371400', '德州市', '2', '370000', '1', null);
INSERT INTO `sys_area` VALUES ('371401', '市辖区', '3', '371400', '0', '1');
INSERT INTO `sys_area` VALUES ('371402', '德城区', '3', '371400', '1', '1');
INSERT INTO `sys_area` VALUES ('371421', '陵县', '3', '371400', '1', '1');
INSERT INTO `sys_area` VALUES ('371422', '宁津县', '3', '371400', '1', '1');
INSERT INTO `sys_area` VALUES ('371423', '庆云县', '3', '371400', '1', '1');
INSERT INTO `sys_area` VALUES ('371424', '临邑县', '3', '371400', '1', '1');
INSERT INTO `sys_area` VALUES ('371425', '齐河县', '3', '371400', '1', '1');
INSERT INTO `sys_area` VALUES ('371426', '平原县', '3', '371400', '1', '1');
INSERT INTO `sys_area` VALUES ('371427', '夏津县', '3', '371400', '1', '1');
INSERT INTO `sys_area` VALUES ('371428', '武城县', '3', '371400', '1', '1');
INSERT INTO `sys_area` VALUES ('371481', '乐陵市', '3', '371400', '1', '1');
INSERT INTO `sys_area` VALUES ('371482', '禹城市', '3', '371400', '1', '1');
INSERT INTO `sys_area` VALUES ('371500', '聊城市', '2', '370000', '1', null);
INSERT INTO `sys_area` VALUES ('371501', '市辖区', '3', '371500', '0', '1');
INSERT INTO `sys_area` VALUES ('371502', '东昌府区', '3', '371500', '1', '1');
INSERT INTO `sys_area` VALUES ('371521', '阳谷县', '3', '371500', '1', '1');
INSERT INTO `sys_area` VALUES ('371522', '莘县', '3', '371500', '1', '1');
INSERT INTO `sys_area` VALUES ('371523', '茌平县', '3', '371500', '1', '1');
INSERT INTO `sys_area` VALUES ('371524', '东阿县', '3', '371500', '1', '1');
INSERT INTO `sys_area` VALUES ('371525', '冠县', '3', '371500', '1', '1');
INSERT INTO `sys_area` VALUES ('371526', '高唐县', '3', '371500', '1', '1');
INSERT INTO `sys_area` VALUES ('371581', '临清市', '3', '371500', '1', '1');
INSERT INTO `sys_area` VALUES ('371600', '滨州市', '2', '370000', '1', null);
INSERT INTO `sys_area` VALUES ('371601', '市辖区', '3', '371600', '0', '1');
INSERT INTO `sys_area` VALUES ('371602', '滨城区', '3', '371600', '1', '1');
INSERT INTO `sys_area` VALUES ('371621', '惠民县', '3', '371600', '1', '1');
INSERT INTO `sys_area` VALUES ('371622', '阳信县', '3', '371600', '1', '1');
INSERT INTO `sys_area` VALUES ('371623', '无棣县', '3', '371600', '1', '1');
INSERT INTO `sys_area` VALUES ('371624', '沾化县', '3', '371600', '1', '1');
INSERT INTO `sys_area` VALUES ('371625', '博兴县', '3', '371600', '1', '1');
INSERT INTO `sys_area` VALUES ('371626', '邹平县', '3', '371600', '1', '1');
INSERT INTO `sys_area` VALUES ('371700', '菏泽市', '2', '370000', '1', null);
INSERT INTO `sys_area` VALUES ('371701', '市辖区', '3', '371700', '0', '1');
INSERT INTO `sys_area` VALUES ('371702', '牡丹区', '3', '371700', '1', '1');
INSERT INTO `sys_area` VALUES ('371721', '曹县', '3', '371700', '1', '1');
INSERT INTO `sys_area` VALUES ('371722', '单县', '3', '371700', '1', '1');
INSERT INTO `sys_area` VALUES ('371723', '成武县', '3', '371700', '1', '1');
INSERT INTO `sys_area` VALUES ('371724', '巨野县', '3', '371700', '1', '1');
INSERT INTO `sys_area` VALUES ('371725', '郓城县', '3', '371700', '1', '1');
INSERT INTO `sys_area` VALUES ('371726', '鄄城县', '3', '371700', '1', '1');
INSERT INTO `sys_area` VALUES ('371727', '定陶县', '3', '371700', '1', '1');
INSERT INTO `sys_area` VALUES ('371728', '东明县', '3', '371700', '1', '1');
INSERT INTO `sys_area` VALUES ('410000', '河南省', '1', '0', '1', null);
INSERT INTO `sys_area` VALUES ('410100', '郑州市', '2', '410000', '1', null);
INSERT INTO `sys_area` VALUES ('410101', '市辖区', '3', '410100', '0', '1');
INSERT INTO `sys_area` VALUES ('410102', '中原区', '3', '410100', '1', '1');
INSERT INTO `sys_area` VALUES ('410103', '二七区', '3', '410100', '1', '1');
INSERT INTO `sys_area` VALUES ('410104', '管城回族区', '3', '410100', '1', '1');
INSERT INTO `sys_area` VALUES ('410105', '金水区', '3', '410100', '1', '1');
INSERT INTO `sys_area` VALUES ('410106', '上街区', '3', '410100', '1', '1');
INSERT INTO `sys_area` VALUES ('410108', '惠济区', '3', '410100', '1', '1');
INSERT INTO `sys_area` VALUES ('410122', '中牟县', '3', '410100', '1', '1');
INSERT INTO `sys_area` VALUES ('410181', '巩义市', '3', '410100', '1', '1');
INSERT INTO `sys_area` VALUES ('410182', '荥阳市', '3', '410100', '1', '1');
INSERT INTO `sys_area` VALUES ('410183', '新密市', '3', '410100', '1', '1');
INSERT INTO `sys_area` VALUES ('410184', '新郑市', '3', '410100', '1', '1');
INSERT INTO `sys_area` VALUES ('410185', '登封市', '3', '410100', '1', '1');
INSERT INTO `sys_area` VALUES ('410200', '开封市', '2', '410000', '1', null);
INSERT INTO `sys_area` VALUES ('410201', '市辖区', '3', '410200', '0', '1');
INSERT INTO `sys_area` VALUES ('410202', '龙亭区', '3', '410200', '1', '1');
INSERT INTO `sys_area` VALUES ('410203', '顺河回族区', '3', '410200', '1', '1');
INSERT INTO `sys_area` VALUES ('410204', '鼓楼区', '3', '410200', '1', '1');
INSERT INTO `sys_area` VALUES ('410205', '禹王台区', '3', '410200', '1', '1');
INSERT INTO `sys_area` VALUES ('410211', '金明区', '3', '410200', '1', '1');
INSERT INTO `sys_area` VALUES ('410221', '杞县', '3', '410200', '1', '1');
INSERT INTO `sys_area` VALUES ('410222', '通许县', '3', '410200', '1', '1');
INSERT INTO `sys_area` VALUES ('410223', '尉氏县', '3', '410200', '1', '1');
INSERT INTO `sys_area` VALUES ('410224', '开封县', '3', '410200', '1', '1');
INSERT INTO `sys_area` VALUES ('410225', '兰考县', '3', '410200', '1', '1');
INSERT INTO `sys_area` VALUES ('410300', '洛阳市', '2', '410000', '1', null);
INSERT INTO `sys_area` VALUES ('410301', '市辖区', '3', '410300', '0', '1');
INSERT INTO `sys_area` VALUES ('410302', '老城区', '3', '410300', '1', '1');
INSERT INTO `sys_area` VALUES ('410303', '西工区', '3', '410300', '1', '1');
INSERT INTO `sys_area` VALUES ('410304', '瀍河回族区', '3', '410300', '1', '1');
INSERT INTO `sys_area` VALUES ('410305', '涧西区', '3', '410300', '1', '1');
INSERT INTO `sys_area` VALUES ('410306', '吉利区', '3', '410300', '1', '1');
INSERT INTO `sys_area` VALUES ('410311', '洛龙区', '3', '410300', '1', '1');
INSERT INTO `sys_area` VALUES ('410322', '孟津县', '3', '410300', '1', '1');
INSERT INTO `sys_area` VALUES ('410323', '新安县', '3', '410300', '1', '1');
INSERT INTO `sys_area` VALUES ('410324', '栾川县', '3', '410300', '1', '1');
INSERT INTO `sys_area` VALUES ('410325', '嵩县', '3', '410300', '1', '1');
INSERT INTO `sys_area` VALUES ('410326', '汝阳县', '3', '410300', '1', '1');
INSERT INTO `sys_area` VALUES ('410327', '宜阳县', '3', '410300', '1', '1');
INSERT INTO `sys_area` VALUES ('410328', '洛宁县', '3', '410300', '1', '1');
INSERT INTO `sys_area` VALUES ('410329', '伊川县', '3', '410300', '1', '1');
INSERT INTO `sys_area` VALUES ('410381', '偃师市', '3', '410300', '1', '1');
INSERT INTO `sys_area` VALUES ('410400', '平顶山市', '2', '410000', '1', null);
INSERT INTO `sys_area` VALUES ('410401', '市辖区', '3', '410400', '0', '1');
INSERT INTO `sys_area` VALUES ('410402', '新华区', '3', '410400', '1', '1');
INSERT INTO `sys_area` VALUES ('410403', '卫东区', '3', '410400', '1', '1');
INSERT INTO `sys_area` VALUES ('410404', '石龙区', '3', '410400', '1', '1');
INSERT INTO `sys_area` VALUES ('410411', '湛河区', '3', '410400', '1', '1');
INSERT INTO `sys_area` VALUES ('410421', '宝丰县', '3', '410400', '1', '1');
INSERT INTO `sys_area` VALUES ('410422', '叶县', '3', '410400', '1', '1');
INSERT INTO `sys_area` VALUES ('410423', '鲁山县', '3', '410400', '1', '1');
INSERT INTO `sys_area` VALUES ('410425', '郏县', '3', '410400', '1', '1');
INSERT INTO `sys_area` VALUES ('410481', '舞钢市', '3', '410400', '1', '1');
INSERT INTO `sys_area` VALUES ('410482', '汝州市', '3', '410400', '1', '1');
INSERT INTO `sys_area` VALUES ('410500', '安阳市', '2', '410000', '1', null);
INSERT INTO `sys_area` VALUES ('410501', '市辖区', '3', '410500', '0', '1');
INSERT INTO `sys_area` VALUES ('410502', '文峰区', '3', '410500', '1', '1');
INSERT INTO `sys_area` VALUES ('410503', '北关区', '3', '410500', '1', '1');
INSERT INTO `sys_area` VALUES ('410505', '殷都区', '3', '410500', '1', '1');
INSERT INTO `sys_area` VALUES ('410506', '龙安区', '3', '410500', '1', '1');
INSERT INTO `sys_area` VALUES ('410522', '安阳县', '3', '410500', '1', '1');
INSERT INTO `sys_area` VALUES ('410523', '汤阴县', '3', '410500', '1', '1');
INSERT INTO `sys_area` VALUES ('410526', '滑县', '3', '410500', '1', '1');
INSERT INTO `sys_area` VALUES ('410527', '内黄县', '3', '410500', '1', '1');
INSERT INTO `sys_area` VALUES ('410581', '林州市', '3', '410500', '1', '1');
INSERT INTO `sys_area` VALUES ('410600', '鹤壁市', '2', '410000', '1', null);
INSERT INTO `sys_area` VALUES ('410601', '市辖区', '3', '410600', '0', '1');
INSERT INTO `sys_area` VALUES ('410602', '鹤山区', '3', '410600', '1', '1');
INSERT INTO `sys_area` VALUES ('410603', '山城区', '3', '410600', '1', '1');
INSERT INTO `sys_area` VALUES ('410611', '淇滨区', '3', '410600', '1', '1');
INSERT INTO `sys_area` VALUES ('410621', '浚县', '3', '410600', '1', '1');
INSERT INTO `sys_area` VALUES ('410622', '淇县', '3', '410600', '1', '1');
INSERT INTO `sys_area` VALUES ('410700', '新乡市', '2', '410000', '1', null);
INSERT INTO `sys_area` VALUES ('410701', '市辖区', '3', '410700', '0', '1');
INSERT INTO `sys_area` VALUES ('410702', '红旗区', '3', '410700', '1', '1');
INSERT INTO `sys_area` VALUES ('410703', '卫滨区', '3', '410700', '1', '1');
INSERT INTO `sys_area` VALUES ('410704', '凤泉区', '3', '410700', '1', '1');
INSERT INTO `sys_area` VALUES ('410711', '牧野区', '3', '410700', '1', '1');
INSERT INTO `sys_area` VALUES ('410721', '新乡县', '3', '410700', '1', '1');
INSERT INTO `sys_area` VALUES ('410724', '获嘉县', '3', '410700', '1', '1');
INSERT INTO `sys_area` VALUES ('410725', '原阳县', '3', '410700', '1', '1');
INSERT INTO `sys_area` VALUES ('410726', '延津县', '3', '410700', '1', '1');
INSERT INTO `sys_area` VALUES ('410727', '封丘县', '3', '410700', '1', '1');
INSERT INTO `sys_area` VALUES ('410728', '长垣县', '3', '410700', '1', '1');
INSERT INTO `sys_area` VALUES ('410781', '卫辉市', '3', '410700', '1', '1');
INSERT INTO `sys_area` VALUES ('410782', '辉县市', '3', '410700', '1', '1');
INSERT INTO `sys_area` VALUES ('410800', '焦作市', '2', '410000', '1', null);
INSERT INTO `sys_area` VALUES ('410801', '市辖区', '3', '410800', '0', '1');
INSERT INTO `sys_area` VALUES ('410802', '解放区', '3', '410800', '1', '1');
INSERT INTO `sys_area` VALUES ('410803', '中站区', '3', '410800', '1', '1');
INSERT INTO `sys_area` VALUES ('410804', '马村区', '3', '410800', '1', '1');
INSERT INTO `sys_area` VALUES ('410811', '山阳区', '3', '410800', '1', '1');
INSERT INTO `sys_area` VALUES ('410821', '修武县', '3', '410800', '1', '1');
INSERT INTO `sys_area` VALUES ('410822', '博爱县', '3', '410800', '1', '1');
INSERT INTO `sys_area` VALUES ('410823', '武陟县', '3', '410800', '1', '1');
INSERT INTO `sys_area` VALUES ('410825', '温县', '3', '410800', '1', '1');
INSERT INTO `sys_area` VALUES ('410881', '济源市', '3', '410800', '1', '1');
INSERT INTO `sys_area` VALUES ('410882', '沁阳市', '3', '410800', '1', '1');
INSERT INTO `sys_area` VALUES ('410883', '孟州市', '3', '410800', '1', '1');
INSERT INTO `sys_area` VALUES ('410900', '濮阳市', '2', '410000', '1', null);
INSERT INTO `sys_area` VALUES ('410901', '市辖区', '3', '410900', '0', '1');
INSERT INTO `sys_area` VALUES ('410902', '华龙区', '3', '410900', '1', '1');
INSERT INTO `sys_area` VALUES ('410922', '清丰县', '3', '410900', '1', '1');
INSERT INTO `sys_area` VALUES ('410923', '南乐县', '3', '410900', '1', '1');
INSERT INTO `sys_area` VALUES ('410926', '范县', '3', '410900', '1', '1');
INSERT INTO `sys_area` VALUES ('410927', '台前县', '3', '410900', '1', '1');
INSERT INTO `sys_area` VALUES ('410928', '濮阳县', '3', '410900', '1', '1');
INSERT INTO `sys_area` VALUES ('411000', '许昌市', '2', '410000', '1', null);
INSERT INTO `sys_area` VALUES ('411001', '市辖区', '3', '411000', '0', '1');
INSERT INTO `sys_area` VALUES ('411002', '魏都区', '3', '411000', '1', '1');
INSERT INTO `sys_area` VALUES ('411023', '许昌县', '3', '411000', '1', '1');
INSERT INTO `sys_area` VALUES ('411024', '鄢陵县', '3', '411000', '1', '1');
INSERT INTO `sys_area` VALUES ('411025', '襄城县', '3', '411000', '1', '1');
INSERT INTO `sys_area` VALUES ('411081', '禹州市', '3', '411000', '1', '1');
INSERT INTO `sys_area` VALUES ('411082', '长葛市', '3', '411000', '1', '1');
INSERT INTO `sys_area` VALUES ('411100', '漯河市', '2', '410000', '1', null);
INSERT INTO `sys_area` VALUES ('411101', '市辖区', '3', '411100', '0', '1');
INSERT INTO `sys_area` VALUES ('411102', '源汇区', '3', '411100', '1', '1');
INSERT INTO `sys_area` VALUES ('411103', '郾城区', '3', '411100', '1', '1');
INSERT INTO `sys_area` VALUES ('411104', '召陵区', '3', '411100', '1', '1');
INSERT INTO `sys_area` VALUES ('411121', '舞阳县', '3', '411100', '1', '1');
INSERT INTO `sys_area` VALUES ('411122', '临颍县', '3', '411100', '1', '1');
INSERT INTO `sys_area` VALUES ('411200', '三门峡市', '2', '410000', '1', null);
INSERT INTO `sys_area` VALUES ('411201', '市辖区', '3', '411200', '0', '1');
INSERT INTO `sys_area` VALUES ('411202', '湖滨区', '3', '411200', '1', '1');
INSERT INTO `sys_area` VALUES ('411221', '渑池县', '3', '411200', '1', '1');
INSERT INTO `sys_area` VALUES ('411222', '陕县', '3', '411200', '1', '1');
INSERT INTO `sys_area` VALUES ('411224', '卢氏县', '3', '411200', '1', '1');
INSERT INTO `sys_area` VALUES ('411281', '义马市', '3', '411200', '1', '1');
INSERT INTO `sys_area` VALUES ('411282', '灵宝市', '3', '411200', '1', '1');
INSERT INTO `sys_area` VALUES ('411300', '南阳市', '2', '410000', '1', null);
INSERT INTO `sys_area` VALUES ('411301', '市辖区', '3', '411300', '0', '1');
INSERT INTO `sys_area` VALUES ('411302', '宛城区', '3', '411300', '1', '1');
INSERT INTO `sys_area` VALUES ('411303', '卧龙区', '3', '411300', '1', '1');
INSERT INTO `sys_area` VALUES ('411321', '南召县', '3', '411300', '1', '1');
INSERT INTO `sys_area` VALUES ('411322', '方城县', '3', '411300', '1', '1');
INSERT INTO `sys_area` VALUES ('411323', '西峡县', '3', '411300', '1', '1');
INSERT INTO `sys_area` VALUES ('411324', '镇平县', '3', '411300', '1', '1');
INSERT INTO `sys_area` VALUES ('411325', '内乡县', '3', '411300', '1', '1');
INSERT INTO `sys_area` VALUES ('411326', '淅川县', '3', '411300', '1', '1');
INSERT INTO `sys_area` VALUES ('411327', '社旗县', '3', '411300', '1', '1');
INSERT INTO `sys_area` VALUES ('411328', '唐河县', '3', '411300', '1', '1');
INSERT INTO `sys_area` VALUES ('411329', '新野县', '3', '411300', '1', '1');
INSERT INTO `sys_area` VALUES ('411330', '桐柏县', '3', '411300', '1', '1');
INSERT INTO `sys_area` VALUES ('411381', '邓州市', '3', '411300', '1', '1');
INSERT INTO `sys_area` VALUES ('411400', '商丘市', '2', '410000', '1', null);
INSERT INTO `sys_area` VALUES ('411401', '市辖区', '3', '411400', '0', '1');
INSERT INTO `sys_area` VALUES ('411402', '梁园区', '3', '411400', '1', '1');
INSERT INTO `sys_area` VALUES ('411403', '睢阳区', '3', '411400', '1', '1');
INSERT INTO `sys_area` VALUES ('411421', '民权县', '3', '411400', '1', '1');
INSERT INTO `sys_area` VALUES ('411422', '睢县', '3', '411400', '1', '1');
INSERT INTO `sys_area` VALUES ('411423', '宁陵县', '3', '411400', '1', '1');
INSERT INTO `sys_area` VALUES ('411424', '柘城县', '3', '411400', '1', '1');
INSERT INTO `sys_area` VALUES ('411425', '虞城县', '3', '411400', '1', '1');
INSERT INTO `sys_area` VALUES ('411426', '夏邑县', '3', '411400', '1', '1');
INSERT INTO `sys_area` VALUES ('411481', '永城市', '3', '411400', '1', '1');
INSERT INTO `sys_area` VALUES ('411500', '信阳市', '2', '410000', '1', null);
INSERT INTO `sys_area` VALUES ('411501', '市辖区', '3', '411500', '0', '1');
INSERT INTO `sys_area` VALUES ('411502', '浉河区', '3', '411500', '1', '1');
INSERT INTO `sys_area` VALUES ('411503', '平桥区', '3', '411500', '1', '1');
INSERT INTO `sys_area` VALUES ('411521', '罗山县', '3', '411500', '1', '1');
INSERT INTO `sys_area` VALUES ('411522', '光山县', '3', '411500', '1', '1');
INSERT INTO `sys_area` VALUES ('411523', '新县', '3', '411500', '1', '1');
INSERT INTO `sys_area` VALUES ('411524', '商城县', '3', '411500', '1', '1');
INSERT INTO `sys_area` VALUES ('411525', '固始县', '3', '411500', '1', '1');
INSERT INTO `sys_area` VALUES ('411526', '潢川县', '3', '411500', '1', '1');
INSERT INTO `sys_area` VALUES ('411527', '淮滨县', '3', '411500', '1', '1');
INSERT INTO `sys_area` VALUES ('411528', '息县', '3', '411500', '1', '1');
INSERT INTO `sys_area` VALUES ('411600', '周口市', '2', '410000', '1', null);
INSERT INTO `sys_area` VALUES ('411601', '市辖区', '3', '411600', '0', '1');
INSERT INTO `sys_area` VALUES ('411602', '川汇区', '3', '411600', '1', '1');
INSERT INTO `sys_area` VALUES ('411621', '扶沟县', '3', '411600', '1', '1');
INSERT INTO `sys_area` VALUES ('411622', '西华县', '3', '411600', '1', '1');
INSERT INTO `sys_area` VALUES ('411623', '商水县', '3', '411600', '1', '1');
INSERT INTO `sys_area` VALUES ('411624', '沈丘县', '3', '411600', '1', '1');
INSERT INTO `sys_area` VALUES ('411625', '郸城县', '3', '411600', '1', '1');
INSERT INTO `sys_area` VALUES ('411626', '淮阳县', '3', '411600', '1', '1');
INSERT INTO `sys_area` VALUES ('411627', '太康县', '3', '411600', '1', '1');
INSERT INTO `sys_area` VALUES ('411628', '鹿邑县', '3', '411600', '1', '1');
INSERT INTO `sys_area` VALUES ('411681', '项城市', '3', '411600', '1', '1');
INSERT INTO `sys_area` VALUES ('411700', '驻马店市', '2', '410000', '1', null);
INSERT INTO `sys_area` VALUES ('411701', '市辖区', '3', '411700', '0', '1');
INSERT INTO `sys_area` VALUES ('411702', '驿城区', '3', '411700', '1', '1');
INSERT INTO `sys_area` VALUES ('411721', '西平县', '3', '411700', '1', '1');
INSERT INTO `sys_area` VALUES ('411722', '上蔡县', '3', '411700', '1', '1');
INSERT INTO `sys_area` VALUES ('411723', '平舆县', '3', '411700', '1', '1');
INSERT INTO `sys_area` VALUES ('411724', '正阳县', '3', '411700', '1', '1');
INSERT INTO `sys_area` VALUES ('411725', '确山县', '3', '411700', '1', '1');
INSERT INTO `sys_area` VALUES ('411726', '泌阳县', '3', '411700', '1', '1');
INSERT INTO `sys_area` VALUES ('411727', '汝南县', '3', '411700', '1', '1');
INSERT INTO `sys_area` VALUES ('411728', '遂平县', '3', '411700', '1', '1');
INSERT INTO `sys_area` VALUES ('411729', '新蔡县', '3', '411700', '1', '1');
INSERT INTO `sys_area` VALUES ('420000', '湖北省', '1', '0', '1', null);
INSERT INTO `sys_area` VALUES ('420100', '武汉市', '2', '420000', '1', null);
INSERT INTO `sys_area` VALUES ('420101', '市辖区', '3', '420100', '0', '1');
INSERT INTO `sys_area` VALUES ('420102', '江岸区', '3', '420100', '1', '1');
INSERT INTO `sys_area` VALUES ('420103', '江汉区', '3', '420100', '1', '1');
INSERT INTO `sys_area` VALUES ('420104', '硚口区', '3', '420100', '1', '1');
INSERT INTO `sys_area` VALUES ('420105', '汉阳区', '3', '420100', '1', '1');
INSERT INTO `sys_area` VALUES ('420106', '武昌区', '3', '420100', '1', '1');
INSERT INTO `sys_area` VALUES ('420107', '青山区', '3', '420100', '1', '1');
INSERT INTO `sys_area` VALUES ('420111', '洪山区', '3', '420100', '1', '1');
INSERT INTO `sys_area` VALUES ('420112', '东西湖区', '3', '420100', '1', '1');
INSERT INTO `sys_area` VALUES ('420113', '汉南区', '3', '420100', '1', '1');
INSERT INTO `sys_area` VALUES ('420114', '蔡甸区', '3', '420100', '1', '1');
INSERT INTO `sys_area` VALUES ('420115', '江夏区', '3', '420100', '1', '1');
INSERT INTO `sys_area` VALUES ('420116', '黄陂区', '3', '420100', '1', '1');
INSERT INTO `sys_area` VALUES ('420117', '新洲区', '3', '420100', '1', '1');
INSERT INTO `sys_area` VALUES ('420200', '黄石市', '2', '420000', '1', null);
INSERT INTO `sys_area` VALUES ('420201', '市辖区', '3', '420200', '0', '1');
INSERT INTO `sys_area` VALUES ('420202', '黄石港区', '3', '420200', '1', '1');
INSERT INTO `sys_area` VALUES ('420203', '西塞山区', '3', '420200', '1', '1');
INSERT INTO `sys_area` VALUES ('420204', '下陆区', '3', '420200', '1', '1');
INSERT INTO `sys_area` VALUES ('420205', '铁山区', '3', '420200', '1', '1');
INSERT INTO `sys_area` VALUES ('420222', '阳新县', '3', '420200', '1', '1');
INSERT INTO `sys_area` VALUES ('420281', '大冶市', '3', '420200', '1', '1');
INSERT INTO `sys_area` VALUES ('420300', '十堰市', '2', '420000', '1', null);
INSERT INTO `sys_area` VALUES ('420301', '市辖区', '3', '420300', '0', '1');
INSERT INTO `sys_area` VALUES ('420302', '茅箭区', '3', '420300', '1', '1');
INSERT INTO `sys_area` VALUES ('420303', '张湾区', '3', '420300', '1', '1');
INSERT INTO `sys_area` VALUES ('420321', '郧县', '3', '420300', '1', '1');
INSERT INTO `sys_area` VALUES ('420322', '郧西县', '3', '420300', '1', '1');
INSERT INTO `sys_area` VALUES ('420323', '竹山县', '3', '420300', '1', '1');
INSERT INTO `sys_area` VALUES ('420324', '竹溪县', '3', '420300', '1', '1');
INSERT INTO `sys_area` VALUES ('420325', '房县', '3', '420300', '1', '1');
INSERT INTO `sys_area` VALUES ('420381', '丹江口市', '3', '420300', '1', '1');
INSERT INTO `sys_area` VALUES ('420500', '宜昌市', '2', '420000', '1', null);
INSERT INTO `sys_area` VALUES ('420501', '市辖区', '3', '420500', '0', '1');
INSERT INTO `sys_area` VALUES ('420502', '西陵区', '3', '420500', '1', '1');
INSERT INTO `sys_area` VALUES ('420503', '伍家岗区', '3', '420500', '1', '1');
INSERT INTO `sys_area` VALUES ('420504', '点军区', '3', '420500', '1', '1');
INSERT INTO `sys_area` VALUES ('420505', '猇亭区', '3', '420500', '1', '1');
INSERT INTO `sys_area` VALUES ('420506', '夷陵区', '3', '420500', '1', '1');
INSERT INTO `sys_area` VALUES ('420525', '远安县', '3', '420500', '1', '1');
INSERT INTO `sys_area` VALUES ('420526', '兴山县', '3', '420500', '1', '1');
INSERT INTO `sys_area` VALUES ('420527', '秭归县', '3', '420500', '1', '1');
INSERT INTO `sys_area` VALUES ('420528', '长阳土家族自治县', '3', '420500', '1', '1');
INSERT INTO `sys_area` VALUES ('420529', '五峰土家族自治县', '3', '420500', '1', '1');
INSERT INTO `sys_area` VALUES ('420581', '宜都市', '3', '420500', '1', '1');
INSERT INTO `sys_area` VALUES ('420582', '当阳市', '3', '420500', '1', '1');
INSERT INTO `sys_area` VALUES ('420583', '枝江市', '3', '420500', '1', '1');
INSERT INTO `sys_area` VALUES ('420600', '襄樊市', '2', '420000', '1', null);
INSERT INTO `sys_area` VALUES ('420601', '市辖区', '3', '420600', '0', '1');
INSERT INTO `sys_area` VALUES ('420602', '襄城区', '3', '420600', '1', '1');
INSERT INTO `sys_area` VALUES ('420606', '樊城区', '3', '420600', '1', '1');
INSERT INTO `sys_area` VALUES ('420607', '襄阳区', '3', '420600', '1', '1');
INSERT INTO `sys_area` VALUES ('420624', '南漳县', '3', '420600', '1', '1');
INSERT INTO `sys_area` VALUES ('420625', '谷城县', '3', '420600', '1', '1');
INSERT INTO `sys_area` VALUES ('420626', '保康县', '3', '420600', '1', '1');
INSERT INTO `sys_area` VALUES ('420682', '老河口市', '3', '420600', '1', '1');
INSERT INTO `sys_area` VALUES ('420683', '枣阳市', '3', '420600', '1', '1');
INSERT INTO `sys_area` VALUES ('420684', '宜城市', '3', '420600', '1', '1');
INSERT INTO `sys_area` VALUES ('420700', '鄂州市', '2', '420000', '1', null);
INSERT INTO `sys_area` VALUES ('420701', '市辖区', '3', '420700', '0', '1');
INSERT INTO `sys_area` VALUES ('420702', '梁子湖区', '3', '420700', '1', '1');
INSERT INTO `sys_area` VALUES ('420703', '华容区', '3', '420700', '1', '1');
INSERT INTO `sys_area` VALUES ('420704', '鄂城区', '3', '420700', '1', '1');
INSERT INTO `sys_area` VALUES ('420800', '荆门市', '2', '420000', '1', null);
INSERT INTO `sys_area` VALUES ('420801', '市辖区', '3', '420800', '0', '1');
INSERT INTO `sys_area` VALUES ('420802', '东宝区', '3', '420800', '1', '1');
INSERT INTO `sys_area` VALUES ('420804', '掇刀区', '3', '420800', '1', '1');
INSERT INTO `sys_area` VALUES ('420821', '京山县', '3', '420800', '1', '1');
INSERT INTO `sys_area` VALUES ('420822', '沙洋县', '3', '420800', '1', '1');
INSERT INTO `sys_area` VALUES ('420881', '钟祥市', '3', '420800', '1', '1');
INSERT INTO `sys_area` VALUES ('420900', '孝感市', '2', '420000', '1', null);
INSERT INTO `sys_area` VALUES ('420901', '市辖区', '3', '420900', '0', '1');
INSERT INTO `sys_area` VALUES ('420902', '孝南区', '3', '420900', '1', '1');
INSERT INTO `sys_area` VALUES ('420921', '孝昌县', '3', '420900', '1', '1');
INSERT INTO `sys_area` VALUES ('420922', '大悟县', '3', '420900', '1', '1');
INSERT INTO `sys_area` VALUES ('420923', '云梦县', '3', '420900', '1', '1');
INSERT INTO `sys_area` VALUES ('420981', '应城市', '3', '420900', '1', '1');
INSERT INTO `sys_area` VALUES ('420982', '安陆市', '3', '420900', '1', '1');
INSERT INTO `sys_area` VALUES ('420984', '汉川市', '3', '420900', '1', '1');
INSERT INTO `sys_area` VALUES ('421000', '荆州市', '2', '420000', '1', null);
INSERT INTO `sys_area` VALUES ('421001', '市辖区', '3', '421000', '0', '1');
INSERT INTO `sys_area` VALUES ('421002', '沙市区', '3', '421000', '1', '1');
INSERT INTO `sys_area` VALUES ('421003', '荆州区', '3', '421000', '1', '1');
INSERT INTO `sys_area` VALUES ('421022', '公安县', '3', '421000', '1', '1');
INSERT INTO `sys_area` VALUES ('421023', '监利县', '3', '421000', '1', '1');
INSERT INTO `sys_area` VALUES ('421024', '江陵县', '3', '421000', '1', '1');
INSERT INTO `sys_area` VALUES ('421081', '石首市', '3', '421000', '1', '1');
INSERT INTO `sys_area` VALUES ('421083', '洪湖市', '3', '421000', '1', '1');
INSERT INTO `sys_area` VALUES ('421087', '松滋市', '3', '421000', '1', '1');
INSERT INTO `sys_area` VALUES ('421100', '黄冈市', '2', '420000', '1', null);
INSERT INTO `sys_area` VALUES ('421101', '市辖区', '3', '421100', '0', '1');
INSERT INTO `sys_area` VALUES ('421102', '黄州区', '3', '421100', '1', '1');
INSERT INTO `sys_area` VALUES ('421121', '团风县', '3', '421100', '1', '1');
INSERT INTO `sys_area` VALUES ('421122', '红安县', '3', '421100', '1', '1');
INSERT INTO `sys_area` VALUES ('421123', '罗田县', '3', '421100', '1', '1');
INSERT INTO `sys_area` VALUES ('421124', '英山县', '3', '421100', '1', '1');
INSERT INTO `sys_area` VALUES ('421125', '浠水县', '3', '421100', '1', '1');
INSERT INTO `sys_area` VALUES ('421126', '蕲春县', '3', '421100', '1', '1');
INSERT INTO `sys_area` VALUES ('421127', '黄梅县', '3', '421100', '1', '1');
INSERT INTO `sys_area` VALUES ('421181', '麻城市', '3', '421100', '1', '1');
INSERT INTO `sys_area` VALUES ('421182', '武穴市', '3', '421100', '1', '1');
INSERT INTO `sys_area` VALUES ('421200', '咸宁市', '2', '420000', '1', null);
INSERT INTO `sys_area` VALUES ('421201', '市辖区', '3', '421200', '0', '1');
INSERT INTO `sys_area` VALUES ('421202', '咸安区', '3', '421200', '1', '1');
INSERT INTO `sys_area` VALUES ('421221', '嘉鱼县', '3', '421200', '1', '1');
INSERT INTO `sys_area` VALUES ('421222', '通城县', '3', '421200', '1', '1');
INSERT INTO `sys_area` VALUES ('421223', '崇阳县', '3', '421200', '1', '1');
INSERT INTO `sys_area` VALUES ('421224', '通山县', '3', '421200', '1', '1');
INSERT INTO `sys_area` VALUES ('421281', '赤壁市', '3', '421200', '1', '1');
INSERT INTO `sys_area` VALUES ('421300', '随州市', '2', '420000', '1', null);
INSERT INTO `sys_area` VALUES ('421301', '市辖区', '3', '421300', '0', '1');
INSERT INTO `sys_area` VALUES ('421302', '曾都区', '3', '421300', '1', '1');
INSERT INTO `sys_area` VALUES ('421381', '广水市', '3', '421300', '1', '1');
INSERT INTO `sys_area` VALUES ('422800', '恩施土家族苗族自治州', '2', '420000', '1', null);
INSERT INTO `sys_area` VALUES ('422801', '恩施市', '3', '422800', '1', '1');
INSERT INTO `sys_area` VALUES ('422802', '利川市', '3', '422800', '1', '1');
INSERT INTO `sys_area` VALUES ('422822', '建始县', '3', '422800', '1', '1');
INSERT INTO `sys_area` VALUES ('422823', '巴东县', '3', '422800', '1', '1');
INSERT INTO `sys_area` VALUES ('422825', '宣恩县', '3', '422800', '1', '1');
INSERT INTO `sys_area` VALUES ('422826', '咸丰县', '3', '422800', '1', '1');
INSERT INTO `sys_area` VALUES ('422827', '来凤县', '3', '422800', '1', '1');
INSERT INTO `sys_area` VALUES ('422828', '鹤峰县', '3', '422800', '1', '1');
INSERT INTO `sys_area` VALUES ('429000', '省直辖县级行政单位', '2', '420000', '1', null);
INSERT INTO `sys_area` VALUES ('429004', '仙桃市', '3', '429000', '1', '1');
INSERT INTO `sys_area` VALUES ('429005', '潜江市', '3', '429000', '1', '1');
INSERT INTO `sys_area` VALUES ('429006', '天门市', '3', '429000', '1', '1');
INSERT INTO `sys_area` VALUES ('429021', '神农架林区', '3', '429000', '1', '1');
INSERT INTO `sys_area` VALUES ('430000', '湖南省', '1', '0', '1', null);
INSERT INTO `sys_area` VALUES ('430100', '长沙市', '2', '430000', '1', null);
INSERT INTO `sys_area` VALUES ('430101', '市辖区', '3', '430100', '0', '1');
INSERT INTO `sys_area` VALUES ('430102', '芙蓉区', '3', '430100', '1', '1');
INSERT INTO `sys_area` VALUES ('430103', '天心区', '3', '430100', '1', '1');
INSERT INTO `sys_area` VALUES ('430104', '岳麓区', '3', '430100', '1', '1');
INSERT INTO `sys_area` VALUES ('430105', '开福区', '3', '430100', '1', '1');
INSERT INTO `sys_area` VALUES ('430111', '雨花区', '3', '430100', '1', '1');
INSERT INTO `sys_area` VALUES ('430121', '长沙县', '3', '430100', '1', '1');
INSERT INTO `sys_area` VALUES ('430122', '望城县', '3', '430100', '1', '1');
INSERT INTO `sys_area` VALUES ('430124', '宁乡县', '3', '430100', '1', '1');
INSERT INTO `sys_area` VALUES ('430181', '浏阳市', '3', '430100', '1', '1');
INSERT INTO `sys_area` VALUES ('430200', '株洲市', '2', '430000', '1', null);
INSERT INTO `sys_area` VALUES ('430201', '市辖区', '3', '430200', '0', '1');
INSERT INTO `sys_area` VALUES ('430202', '荷塘区', '3', '430200', '1', '1');
INSERT INTO `sys_area` VALUES ('430203', '芦淞区', '3', '430200', '1', '1');
INSERT INTO `sys_area` VALUES ('430204', '石峰区', '3', '430200', '1', '1');
INSERT INTO `sys_area` VALUES ('430211', '天元区', '3', '430200', '1', '1');
INSERT INTO `sys_area` VALUES ('430221', '株洲县', '3', '430200', '1', '1');
INSERT INTO `sys_area` VALUES ('430223', '攸县', '3', '430200', '1', '1');
INSERT INTO `sys_area` VALUES ('430224', '茶陵县', '3', '430200', '1', '1');
INSERT INTO `sys_area` VALUES ('430225', '炎陵县', '3', '430200', '1', '1');
INSERT INTO `sys_area` VALUES ('430281', '醴陵市', '3', '430200', '1', '1');
INSERT INTO `sys_area` VALUES ('430300', '湘潭市', '2', '430000', '1', null);
INSERT INTO `sys_area` VALUES ('430301', '市辖区', '3', '430300', '0', '1');
INSERT INTO `sys_area` VALUES ('430302', '雨湖区', '3', '430300', '1', '1');
INSERT INTO `sys_area` VALUES ('430304', '岳塘区', '3', '430300', '1', '1');
INSERT INTO `sys_area` VALUES ('430321', '湘潭县', '3', '430300', '1', '1');
INSERT INTO `sys_area` VALUES ('430381', '湘乡市', '3', '430300', '1', '1');
INSERT INTO `sys_area` VALUES ('430382', '韶山市', '3', '430300', '1', '1');
INSERT INTO `sys_area` VALUES ('430400', '衡阳市', '2', '430000', '1', null);
INSERT INTO `sys_area` VALUES ('430401', '市辖区', '3', '430400', '0', '1');
INSERT INTO `sys_area` VALUES ('430405', '珠晖区', '3', '430400', '1', '1');
INSERT INTO `sys_area` VALUES ('430406', '雁峰区', '3', '430400', '1', '1');
INSERT INTO `sys_area` VALUES ('430407', '石鼓区', '3', '430400', '1', '1');
INSERT INTO `sys_area` VALUES ('430408', '蒸湘区', '3', '430400', '1', '1');
INSERT INTO `sys_area` VALUES ('430412', '南岳区', '3', '430400', '1', '1');
INSERT INTO `sys_area` VALUES ('430421', '衡阳县', '3', '430400', '1', '1');
INSERT INTO `sys_area` VALUES ('430422', '衡南县', '3', '430400', '1', '1');
INSERT INTO `sys_area` VALUES ('430423', '衡山县', '3', '430400', '1', '1');
INSERT INTO `sys_area` VALUES ('430424', '衡东县', '3', '430400', '1', '1');
INSERT INTO `sys_area` VALUES ('430426', '祁东县', '3', '430400', '1', '1');
INSERT INTO `sys_area` VALUES ('430481', '耒阳市', '3', '430400', '1', '1');
INSERT INTO `sys_area` VALUES ('430482', '常宁市', '3', '430400', '1', '1');
INSERT INTO `sys_area` VALUES ('430500', '邵阳市', '2', '430000', '1', null);
INSERT INTO `sys_area` VALUES ('430501', '市辖区', '3', '430500', '0', '1');
INSERT INTO `sys_area` VALUES ('430502', '双清区', '3', '430500', '1', '1');
INSERT INTO `sys_area` VALUES ('430503', '大祥区', '3', '430500', '1', '1');
INSERT INTO `sys_area` VALUES ('430511', '北塔区', '3', '430500', '1', '1');
INSERT INTO `sys_area` VALUES ('430521', '邵东县', '3', '430500', '1', '1');
INSERT INTO `sys_area` VALUES ('430522', '新邵县', '3', '430500', '1', '1');
INSERT INTO `sys_area` VALUES ('430523', '邵阳县', '3', '430500', '1', '1');
INSERT INTO `sys_area` VALUES ('430524', '隆回县', '3', '430500', '1', '1');
INSERT INTO `sys_area` VALUES ('430525', '洞口县', '3', '430500', '1', '1');
INSERT INTO `sys_area` VALUES ('430527', '绥宁县', '3', '430500', '1', '1');
INSERT INTO `sys_area` VALUES ('430528', '新宁县', '3', '430500', '1', '1');
INSERT INTO `sys_area` VALUES ('430529', '城步苗族自治县', '3', '430500', '1', '1');
INSERT INTO `sys_area` VALUES ('430581', '武冈市', '3', '430500', '1', '1');
INSERT INTO `sys_area` VALUES ('430600', '岳阳市', '2', '430000', '1', null);
INSERT INTO `sys_area` VALUES ('430601', '市辖区', '3', '430600', '0', '1');
INSERT INTO `sys_area` VALUES ('430602', '岳阳楼区', '3', '430600', '1', '1');
INSERT INTO `sys_area` VALUES ('430603', '云溪区', '3', '430600', '1', '1');
INSERT INTO `sys_area` VALUES ('430611', '君山区', '3', '430600', '1', '1');
INSERT INTO `sys_area` VALUES ('430621', '岳阳县', '3', '430600', '1', '1');
INSERT INTO `sys_area` VALUES ('430623', '华容县', '3', '430600', '1', '1');
INSERT INTO `sys_area` VALUES ('430624', '湘阴县', '3', '430600', '1', '1');
INSERT INTO `sys_area` VALUES ('430626', '平江县', '3', '430600', '1', '1');
INSERT INTO `sys_area` VALUES ('430681', '汨罗市', '3', '430600', '1', '1');
INSERT INTO `sys_area` VALUES ('430682', '临湘市', '3', '430600', '1', '1');
INSERT INTO `sys_area` VALUES ('430700', '常德市', '2', '430000', '1', null);
INSERT INTO `sys_area` VALUES ('430701', '市辖区', '3', '430700', '0', '1');
INSERT INTO `sys_area` VALUES ('430702', '武陵区', '3', '430700', '1', '1');
INSERT INTO `sys_area` VALUES ('430703', '鼎城区', '3', '430700', '1', '1');
INSERT INTO `sys_area` VALUES ('430721', '安乡县', '3', '430700', '1', '1');
INSERT INTO `sys_area` VALUES ('430722', '汉寿县', '3', '430700', '1', '1');
INSERT INTO `sys_area` VALUES ('430723', '澧县', '3', '430700', '1', '1');
INSERT INTO `sys_area` VALUES ('430724', '临澧县', '3', '430700', '1', '1');
INSERT INTO `sys_area` VALUES ('430725', '桃源县', '3', '430700', '1', '1');
INSERT INTO `sys_area` VALUES ('430726', '石门县', '3', '430700', '1', '1');
INSERT INTO `sys_area` VALUES ('430781', '津市市', '3', '430700', '1', '1');
INSERT INTO `sys_area` VALUES ('430800', '张家界市', '2', '430000', '1', null);
INSERT INTO `sys_area` VALUES ('430801', '市辖区', '3', '430800', '0', '1');
INSERT INTO `sys_area` VALUES ('430802', '永定区', '3', '430800', '1', '1');
INSERT INTO `sys_area` VALUES ('430811', '武陵源区', '3', '430800', '1', '1');
INSERT INTO `sys_area` VALUES ('430821', '慈利县', '3', '430800', '1', '1');
INSERT INTO `sys_area` VALUES ('430822', '桑植县', '3', '430800', '1', '1');
INSERT INTO `sys_area` VALUES ('430900', '益阳市', '2', '430000', '1', null);
INSERT INTO `sys_area` VALUES ('430901', '市辖区', '3', '430900', '0', '1');
INSERT INTO `sys_area` VALUES ('430902', '资阳区', '3', '430900', '1', '1');
INSERT INTO `sys_area` VALUES ('430903', '赫山区', '3', '430900', '1', '1');
INSERT INTO `sys_area` VALUES ('430921', '南县', '3', '430900', '1', '1');
INSERT INTO `sys_area` VALUES ('430922', '桃江县', '3', '430900', '1', '1');
INSERT INTO `sys_area` VALUES ('430923', '安化县', '3', '430900', '1', '1');
INSERT INTO `sys_area` VALUES ('430981', '沅江市', '3', '430900', '1', '1');
INSERT INTO `sys_area` VALUES ('431000', '郴州市', '2', '430000', '1', null);
INSERT INTO `sys_area` VALUES ('431001', '市辖区', '3', '431000', '0', '1');
INSERT INTO `sys_area` VALUES ('431002', '北湖区', '3', '431000', '1', '1');
INSERT INTO `sys_area` VALUES ('431003', '苏仙区', '3', '431000', '1', '1');
INSERT INTO `sys_area` VALUES ('431021', '桂阳县', '3', '431000', '1', '1');
INSERT INTO `sys_area` VALUES ('431022', '宜章县', '3', '431000', '1', '1');
INSERT INTO `sys_area` VALUES ('431023', '永兴县', '3', '431000', '1', '1');
INSERT INTO `sys_area` VALUES ('431024', '嘉禾县', '3', '431000', '1', '1');
INSERT INTO `sys_area` VALUES ('431025', '临武县', '3', '431000', '1', '1');
INSERT INTO `sys_area` VALUES ('431026', '汝城县', '3', '431000', '1', '1');
INSERT INTO `sys_area` VALUES ('431027', '桂东县', '3', '431000', '1', '1');
INSERT INTO `sys_area` VALUES ('431028', '安仁县', '3', '431000', '1', '1');
INSERT INTO `sys_area` VALUES ('431081', '资兴市', '3', '431000', '1', '1');
INSERT INTO `sys_area` VALUES ('431100', '永州市', '2', '430000', '1', null);
INSERT INTO `sys_area` VALUES ('431101', '市辖区', '3', '431100', '0', '1');
INSERT INTO `sys_area` VALUES ('431102', '零陵区', '3', '431100', '1', '1');
INSERT INTO `sys_area` VALUES ('431103', '冷水滩区', '3', '431100', '1', '1');
INSERT INTO `sys_area` VALUES ('431121', '祁阳县', '3', '431100', '1', '1');
INSERT INTO `sys_area` VALUES ('431122', '东安县', '3', '431100', '1', '1');
INSERT INTO `sys_area` VALUES ('431123', '双牌县', '3', '431100', '1', '1');
INSERT INTO `sys_area` VALUES ('431124', '道县', '3', '431100', '1', '1');
INSERT INTO `sys_area` VALUES ('431125', '江永县', '3', '431100', '1', '1');
INSERT INTO `sys_area` VALUES ('431126', '宁远县', '3', '431100', '1', '1');
INSERT INTO `sys_area` VALUES ('431127', '蓝山县', '3', '431100', '1', '1');
INSERT INTO `sys_area` VALUES ('431128', '新田县', '3', '431100', '1', '1');
INSERT INTO `sys_area` VALUES ('431129', '江华瑶族自治县', '3', '431100', '1', '1');
INSERT INTO `sys_area` VALUES ('431200', '怀化市', '2', '430000', '1', null);
INSERT INTO `sys_area` VALUES ('431201', '市辖区', '3', '431200', '0', '1');
INSERT INTO `sys_area` VALUES ('431202', '鹤城区', '3', '431200', '1', '1');
INSERT INTO `sys_area` VALUES ('431221', '中方县', '3', '431200', '1', '1');
INSERT INTO `sys_area` VALUES ('431222', '沅陵县', '3', '431200', '1', '1');
INSERT INTO `sys_area` VALUES ('431223', '辰溪县', '3', '431200', '1', '1');
INSERT INTO `sys_area` VALUES ('431224', '溆浦县', '3', '431200', '1', '1');
INSERT INTO `sys_area` VALUES ('431225', '会同县', '3', '431200', '1', '1');
INSERT INTO `sys_area` VALUES ('431226', '麻阳苗族自治县', '3', '431200', '1', '1');
INSERT INTO `sys_area` VALUES ('431227', '新晃侗族自治县', '3', '431200', '1', '1');
INSERT INTO `sys_area` VALUES ('431228', '芷江侗族自治县', '3', '431200', '1', '1');
INSERT INTO `sys_area` VALUES ('431229', '靖州苗族侗族自治县', '3', '431200', '1', '1');
INSERT INTO `sys_area` VALUES ('431230', '通道侗族自治县', '3', '431200', '1', '1');
INSERT INTO `sys_area` VALUES ('431281', '洪江市', '3', '431200', '1', '1');
INSERT INTO `sys_area` VALUES ('431300', '娄底市', '2', '430000', '1', null);
INSERT INTO `sys_area` VALUES ('431301', '市辖区', '3', '431300', '0', '1');
INSERT INTO `sys_area` VALUES ('431302', '娄星区', '3', '431300', '1', '1');
INSERT INTO `sys_area` VALUES ('431321', '双峰县', '3', '431300', '1', '1');
INSERT INTO `sys_area` VALUES ('431322', '新化县', '3', '431300', '1', '1');
INSERT INTO `sys_area` VALUES ('431381', '冷水江市', '3', '431300', '1', '1');
INSERT INTO `sys_area` VALUES ('431382', '涟源市', '3', '431300', '1', '1');
INSERT INTO `sys_area` VALUES ('433100', '湘西土家族苗族自治州', '2', '430000', '1', null);
INSERT INTO `sys_area` VALUES ('433101', '吉首市', '3', '433100', '1', '1');
INSERT INTO `sys_area` VALUES ('433122', '泸溪县', '3', '433100', '1', '1');
INSERT INTO `sys_area` VALUES ('433123', '凤凰县', '3', '433100', '1', '1');
INSERT INTO `sys_area` VALUES ('433124', '花垣县', '3', '433100', '1', '1');
INSERT INTO `sys_area` VALUES ('433125', '保靖县', '3', '433100', '1', '1');
INSERT INTO `sys_area` VALUES ('433126', '古丈县', '3', '433100', '1', '1');
INSERT INTO `sys_area` VALUES ('433127', '永顺县', '3', '433100', '1', '1');
INSERT INTO `sys_area` VALUES ('433130', '龙山县', '3', '433100', '1', '1');
INSERT INTO `sys_area` VALUES ('440000', '广东省', '1', '0', '1', null);
INSERT INTO `sys_area` VALUES ('440100', '广州市', '2', '440000', '1', null);
INSERT INTO `sys_area` VALUES ('440101', '市辖区', '3', '440100', '0', '1');
INSERT INTO `sys_area` VALUES ('440103', '荔湾区', '3', '440100', '1', '1');
INSERT INTO `sys_area` VALUES ('440104', '越秀区', '3', '440100', '1', '1');
INSERT INTO `sys_area` VALUES ('440105', '海珠区', '3', '440100', '1', '1');
INSERT INTO `sys_area` VALUES ('440106', '天河区', '3', '440100', '1', '1');
INSERT INTO `sys_area` VALUES ('440111', '白云区', '3', '440100', '1', '1');
INSERT INTO `sys_area` VALUES ('440112', '黄埔区', '3', '440100', '1', '1');
INSERT INTO `sys_area` VALUES ('440113', '番禺区', '3', '440100', '1', '1');
INSERT INTO `sys_area` VALUES ('440114', '花都区', '3', '440100', '1', '1');
INSERT INTO `sys_area` VALUES ('440115', '南沙区', '3', '440100', '1', '1');
INSERT INTO `sys_area` VALUES ('440116', '萝岗区', '3', '440100', '1', '1');
INSERT INTO `sys_area` VALUES ('440183', '增城市', '3', '440100', '1', '1');
INSERT INTO `sys_area` VALUES ('440184', '从化市', '3', '440100', '1', '1');
INSERT INTO `sys_area` VALUES ('440200', '韶关市', '2', '440000', '1', null);
INSERT INTO `sys_area` VALUES ('440201', '市辖区', '3', '440200', '0', '1');
INSERT INTO `sys_area` VALUES ('440203', '武江区', '3', '440200', '1', '1');
INSERT INTO `sys_area` VALUES ('440204', '浈江区', '3', '440200', '1', '1');
INSERT INTO `sys_area` VALUES ('440205', '曲江区', '3', '440200', '1', '1');
INSERT INTO `sys_area` VALUES ('440222', '始兴县', '3', '440200', '1', '1');
INSERT INTO `sys_area` VALUES ('440224', '仁化县', '3', '440200', '1', '1');
INSERT INTO `sys_area` VALUES ('440229', '翁源县', '3', '440200', '1', '1');
INSERT INTO `sys_area` VALUES ('440232', '乳源瑶族自治县', '3', '440200', '1', '1');
INSERT INTO `sys_area` VALUES ('440233', '新丰县', '3', '440200', '1', '1');
INSERT INTO `sys_area` VALUES ('440281', '乐昌市', '3', '440200', '1', '1');
INSERT INTO `sys_area` VALUES ('440282', '南雄市', '3', '440200', '1', '1');
INSERT INTO `sys_area` VALUES ('440300', '深圳市', '2', '440000', '1', null);
INSERT INTO `sys_area` VALUES ('440301', '市辖区', '3', '440300', '0', '1');
INSERT INTO `sys_area` VALUES ('440303', '罗湖区', '3', '440300', '1', '1');
INSERT INTO `sys_area` VALUES ('440304', '福田区', '3', '440300', '1', '1');
INSERT INTO `sys_area` VALUES ('440305', '南山区', '3', '440300', '1', '1');
INSERT INTO `sys_area` VALUES ('440306', '宝安区', '3', '440300', '1', '1');
INSERT INTO `sys_area` VALUES ('440307', '龙岗区', '3', '440300', '1', '1');
INSERT INTO `sys_area` VALUES ('440308', '盐田区', '3', '440300', '1', '1');
INSERT INTO `sys_area` VALUES ('440400', '珠海市', '2', '440000', '1', null);
INSERT INTO `sys_area` VALUES ('440401', '市辖区', '3', '440400', '0', '1');
INSERT INTO `sys_area` VALUES ('440402', '香洲区', '3', '440400', '1', '1');
INSERT INTO `sys_area` VALUES ('440403', '斗门区', '3', '440400', '1', '1');
INSERT INTO `sys_area` VALUES ('440404', '金湾区', '3', '440400', '1', '1');
INSERT INTO `sys_area` VALUES ('440500', '汕头市', '2', '440000', '1', null);
INSERT INTO `sys_area` VALUES ('440501', '市辖区', '3', '440500', '0', '1');
INSERT INTO `sys_area` VALUES ('440507', '龙湖区', '3', '440500', '1', '1');
INSERT INTO `sys_area` VALUES ('440511', '金平区', '3', '440500', '1', '1');
INSERT INTO `sys_area` VALUES ('440512', '濠江区', '3', '440500', '1', '1');
INSERT INTO `sys_area` VALUES ('440513', '潮阳区', '3', '440500', '1', '1');
INSERT INTO `sys_area` VALUES ('440514', '潮南区', '3', '440500', '1', '1');
INSERT INTO `sys_area` VALUES ('440515', '澄海区', '3', '440500', '1', '1');
INSERT INTO `sys_area` VALUES ('440523', '南澳县', '3', '440500', '1', '1');
INSERT INTO `sys_area` VALUES ('440600', '佛山市', '2', '440000', '1', null);
INSERT INTO `sys_area` VALUES ('440601', '市辖区', '3', '440600', '0', '1');
INSERT INTO `sys_area` VALUES ('440604', '禅城区', '3', '440600', '1', '1');
INSERT INTO `sys_area` VALUES ('440605', '南海区', '3', '440600', '1', '1');
INSERT INTO `sys_area` VALUES ('440606', '顺德区', '3', '440600', '1', '1');
INSERT INTO `sys_area` VALUES ('440607', '三水区', '3', '440600', '1', '1');
INSERT INTO `sys_area` VALUES ('440608', '高明区', '3', '440600', '1', '1');
INSERT INTO `sys_area` VALUES ('440700', '江门市', '2', '440000', '1', null);
INSERT INTO `sys_area` VALUES ('440701', '市辖区', '3', '440700', '0', '1');
INSERT INTO `sys_area` VALUES ('440703', '蓬江区', '3', '440700', '1', '1');
INSERT INTO `sys_area` VALUES ('440704', '江海区', '3', '440700', '1', '1');
INSERT INTO `sys_area` VALUES ('440705', '新会区', '3', '440700', '1', '1');
INSERT INTO `sys_area` VALUES ('440781', '台山市', '3', '440700', '1', '1');
INSERT INTO `sys_area` VALUES ('440783', '开平市', '3', '440700', '1', '1');
INSERT INTO `sys_area` VALUES ('440784', '鹤山市', '3', '440700', '1', '1');
INSERT INTO `sys_area` VALUES ('440785', '恩平市', '3', '440700', '1', '1');
INSERT INTO `sys_area` VALUES ('440800', '湛江市', '2', '440000', '1', null);
INSERT INTO `sys_area` VALUES ('440801', '市辖区', '3', '440800', '0', '1');
INSERT INTO `sys_area` VALUES ('440802', '赤坎区', '3', '440800', '1', '1');
INSERT INTO `sys_area` VALUES ('440803', '霞山区', '3', '440800', '1', '1');
INSERT INTO `sys_area` VALUES ('440804', '坡头区', '3', '440800', '1', '1');
INSERT INTO `sys_area` VALUES ('440811', '麻章区', '3', '440800', '1', '1');
INSERT INTO `sys_area` VALUES ('440823', '遂溪县', '3', '440800', '1', '1');
INSERT INTO `sys_area` VALUES ('440825', '徐闻县', '3', '440800', '1', '1');
INSERT INTO `sys_area` VALUES ('440881', '廉江市', '3', '440800', '1', '1');
INSERT INTO `sys_area` VALUES ('440882', '雷州市', '3', '440800', '1', '1');
INSERT INTO `sys_area` VALUES ('440883', '吴川市', '3', '440800', '1', '1');
INSERT INTO `sys_area` VALUES ('440900', '茂名市', '2', '440000', '1', null);
INSERT INTO `sys_area` VALUES ('440901', '市辖区', '3', '440900', '0', '1');
INSERT INTO `sys_area` VALUES ('440902', '茂南区', '3', '440900', '1', '1');
INSERT INTO `sys_area` VALUES ('440903', '茂港区', '3', '440900', '1', '1');
INSERT INTO `sys_area` VALUES ('440923', '电白县', '3', '440900', '1', '1');
INSERT INTO `sys_area` VALUES ('440981', '高州市', '3', '440900', '1', '1');
INSERT INTO `sys_area` VALUES ('440982', '化州市', '3', '440900', '1', '1');
INSERT INTO `sys_area` VALUES ('440983', '信宜市', '3', '440900', '1', '1');
INSERT INTO `sys_area` VALUES ('441200', '肇庆市', '2', '440000', '1', null);
INSERT INTO `sys_area` VALUES ('441201', '市辖区', '3', '441200', '0', '1');
INSERT INTO `sys_area` VALUES ('441202', '端州区', '3', '441200', '1', '1');
INSERT INTO `sys_area` VALUES ('441203', '鼎湖区', '3', '441200', '1', '1');
INSERT INTO `sys_area` VALUES ('441223', '广宁县', '3', '441200', '1', '1');
INSERT INTO `sys_area` VALUES ('441224', '怀集县', '3', '441200', '1', '1');
INSERT INTO `sys_area` VALUES ('441225', '封开县', '3', '441200', '1', '1');
INSERT INTO `sys_area` VALUES ('441226', '德庆县', '3', '441200', '1', '1');
INSERT INTO `sys_area` VALUES ('441283', '高要市', '3', '441200', '1', '1');
INSERT INTO `sys_area` VALUES ('441284', '四会市', '3', '441200', '1', '1');
INSERT INTO `sys_area` VALUES ('441300', '惠州市', '2', '440000', '1', null);
INSERT INTO `sys_area` VALUES ('441301', '市辖区', '3', '441300', '0', '1');
INSERT INTO `sys_area` VALUES ('441302', '惠城区', '3', '441300', '1', '1');
INSERT INTO `sys_area` VALUES ('441303', '惠阳区', '3', '441300', '1', '1');
INSERT INTO `sys_area` VALUES ('441322', '博罗县', '3', '441300', '1', '1');
INSERT INTO `sys_area` VALUES ('441323', '惠东县', '3', '441300', '1', '1');
INSERT INTO `sys_area` VALUES ('441324', '龙门县', '3', '441300', '1', '1');
INSERT INTO `sys_area` VALUES ('441400', '梅州市', '2', '440000', '1', null);
INSERT INTO `sys_area` VALUES ('441401', '市辖区', '3', '441400', '0', '1');
INSERT INTO `sys_area` VALUES ('441402', '梅江区', '3', '441400', '1', '1');
INSERT INTO `sys_area` VALUES ('441421', '梅县', '3', '441400', '1', '1');
INSERT INTO `sys_area` VALUES ('441422', '大埔县', '3', '441400', '1', '1');
INSERT INTO `sys_area` VALUES ('441423', '丰顺县', '3', '441400', '1', '1');
INSERT INTO `sys_area` VALUES ('441424', '五华县', '3', '441400', '1', '1');
INSERT INTO `sys_area` VALUES ('441426', '平远县', '3', '441400', '1', '1');
INSERT INTO `sys_area` VALUES ('441427', '蕉岭县', '3', '441400', '1', '1');
INSERT INTO `sys_area` VALUES ('441481', '兴宁市', '3', '441400', '1', '1');
INSERT INTO `sys_area` VALUES ('441500', '汕尾市', '2', '440000', '1', null);
INSERT INTO `sys_area` VALUES ('441501', '市辖区', '3', '441500', '0', '1');
INSERT INTO `sys_area` VALUES ('441502', '城区', '3', '441500', '1', '1');
INSERT INTO `sys_area` VALUES ('441521', '海丰县', '3', '441500', '1', '1');
INSERT INTO `sys_area` VALUES ('441523', '陆河县', '3', '441500', '1', '1');
INSERT INTO `sys_area` VALUES ('441581', '陆丰市', '3', '441500', '1', '1');
INSERT INTO `sys_area` VALUES ('441600', '河源市', '2', '440000', '1', null);
INSERT INTO `sys_area` VALUES ('441601', '市辖区', '3', '441600', '0', '1');
INSERT INTO `sys_area` VALUES ('441602', '源城区', '3', '441600', '1', '1');
INSERT INTO `sys_area` VALUES ('441621', '紫金县', '3', '441600', '1', '1');
INSERT INTO `sys_area` VALUES ('441622', '龙川县', '3', '441600', '1', '1');
INSERT INTO `sys_area` VALUES ('441623', '连平县', '3', '441600', '1', '1');
INSERT INTO `sys_area` VALUES ('441624', '和平县', '3', '441600', '1', '1');
INSERT INTO `sys_area` VALUES ('441625', '东源县', '3', '441600', '1', '1');
INSERT INTO `sys_area` VALUES ('441700', '阳江市', '2', '440000', '1', null);
INSERT INTO `sys_area` VALUES ('441701', '市辖区', '3', '441700', '0', '1');
INSERT INTO `sys_area` VALUES ('441702', '江城区', '3', '441700', '1', '1');
INSERT INTO `sys_area` VALUES ('441721', '阳西县', '3', '441700', '1', '1');
INSERT INTO `sys_area` VALUES ('441723', '阳东县', '3', '441700', '1', '1');
INSERT INTO `sys_area` VALUES ('441781', '阳春市', '3', '441700', '1', '1');
INSERT INTO `sys_area` VALUES ('441800', '清远市', '2', '440000', '1', null);
INSERT INTO `sys_area` VALUES ('441801', '市辖区', '3', '441800', '0', '1');
INSERT INTO `sys_area` VALUES ('441802', '清城区', '3', '441800', '1', '1');
INSERT INTO `sys_area` VALUES ('441821', '佛冈县', '3', '441800', '1', '1');
INSERT INTO `sys_area` VALUES ('441823', '阳山县', '3', '441800', '1', '1');
INSERT INTO `sys_area` VALUES ('441825', '连山壮族瑶族自治县', '3', '441800', '1', '1');
INSERT INTO `sys_area` VALUES ('441826', '连南瑶族自治县', '3', '441800', '1', '1');
INSERT INTO `sys_area` VALUES ('441827', '清新县', '3', '441800', '1', '1');
INSERT INTO `sys_area` VALUES ('441881', '英德市', '3', '441800', '1', '1');
INSERT INTO `sys_area` VALUES ('441882', '连州市', '3', '441800', '1', '1');
INSERT INTO `sys_area` VALUES ('441900', '东莞市', '2', '440000', '1', '1');
INSERT INTO `sys_area` VALUES ('442000', '中山市', '2', '440000', '1', '1');
INSERT INTO `sys_area` VALUES ('445100', '潮州市', '2', '440000', '1', null);
INSERT INTO `sys_area` VALUES ('445101', '市辖区', '3', '445100', '0', '1');
INSERT INTO `sys_area` VALUES ('445102', '湘桥区', '3', '445100', '1', '1');
INSERT INTO `sys_area` VALUES ('445121', '潮安县', '3', '445100', '1', '1');
INSERT INTO `sys_area` VALUES ('445122', '饶平县', '3', '445100', '1', '1');
INSERT INTO `sys_area` VALUES ('445200', '揭阳市', '2', '440000', '1', null);
INSERT INTO `sys_area` VALUES ('445201', '市辖区', '3', '445200', '0', '1');
INSERT INTO `sys_area` VALUES ('445202', '榕城区', '3', '445200', '1', '1');
INSERT INTO `sys_area` VALUES ('445221', '揭东县', '3', '445200', '1', '1');
INSERT INTO `sys_area` VALUES ('445222', '揭西县', '3', '445200', '1', '1');
INSERT INTO `sys_area` VALUES ('445224', '惠来县', '3', '445200', '1', '1');
INSERT INTO `sys_area` VALUES ('445281', '普宁市', '3', '445200', '1', '1');
INSERT INTO `sys_area` VALUES ('445300', '云浮市', '2', '440000', '1', null);
INSERT INTO `sys_area` VALUES ('445301', '市辖区', '3', '445300', '0', '1');
INSERT INTO `sys_area` VALUES ('445302', '云城区', '3', '445300', '1', '1');
INSERT INTO `sys_area` VALUES ('445321', '新兴县', '3', '445300', '1', '1');
INSERT INTO `sys_area` VALUES ('445322', '郁南县', '3', '445300', '1', '1');
INSERT INTO `sys_area` VALUES ('445323', '云安县', '3', '445300', '1', '1');
INSERT INTO `sys_area` VALUES ('445381', '罗定市', '3', '445300', '1', '1');
INSERT INTO `sys_area` VALUES ('450000', '广西壮族自治区', '1', '0', '1', null);
INSERT INTO `sys_area` VALUES ('450100', '南宁市', '2', '450000', '1', null);
INSERT INTO `sys_area` VALUES ('450101', '市辖区', '3', '450100', '0', '1');
INSERT INTO `sys_area` VALUES ('450102', '兴宁区', '3', '450100', '1', '1');
INSERT INTO `sys_area` VALUES ('450103', '青秀区', '3', '450100', '1', '1');
INSERT INTO `sys_area` VALUES ('450105', '江南区', '3', '450100', '1', '1');
INSERT INTO `sys_area` VALUES ('450107', '西乡塘区', '3', '450100', '1', '1');
INSERT INTO `sys_area` VALUES ('450108', '良庆区', '3', '450100', '1', '1');
INSERT INTO `sys_area` VALUES ('450109', '邕宁区', '3', '450100', '1', '1');
INSERT INTO `sys_area` VALUES ('450122', '武鸣县', '3', '450100', '1', '1');
INSERT INTO `sys_area` VALUES ('450123', '隆安县', '3', '450100', '1', '1');
INSERT INTO `sys_area` VALUES ('450124', '马山县', '3', '450100', '1', '1');
INSERT INTO `sys_area` VALUES ('450125', '上林县', '3', '450100', '1', '1');
INSERT INTO `sys_area` VALUES ('450126', '宾阳县', '3', '450100', '1', '1');
INSERT INTO `sys_area` VALUES ('450127', '横县', '3', '450100', '1', '1');
INSERT INTO `sys_area` VALUES ('450200', '柳州市', '2', '450000', '1', null);
INSERT INTO `sys_area` VALUES ('450201', '市辖区', '3', '450200', '0', '1');
INSERT INTO `sys_area` VALUES ('450202', '城中区', '3', '450200', '1', '1');
INSERT INTO `sys_area` VALUES ('450203', '鱼峰区', '3', '450200', '1', '1');
INSERT INTO `sys_area` VALUES ('450204', '柳南区', '3', '450200', '1', '1');
INSERT INTO `sys_area` VALUES ('450205', '柳北区', '3', '450200', '1', '1');
INSERT INTO `sys_area` VALUES ('450221', '柳江县', '3', '450200', '1', '1');
INSERT INTO `sys_area` VALUES ('450222', '柳城县', '3', '450200', '1', '1');
INSERT INTO `sys_area` VALUES ('450223', '鹿寨县', '3', '450200', '1', '1');
INSERT INTO `sys_area` VALUES ('450224', '融安县', '3', '450200', '1', '1');
INSERT INTO `sys_area` VALUES ('450225', '融水苗族自治县', '3', '450200', '1', '1');
INSERT INTO `sys_area` VALUES ('450226', '三江侗族自治县', '3', '450200', '1', '1');
INSERT INTO `sys_area` VALUES ('450300', '桂林市', '2', '450000', '1', null);
INSERT INTO `sys_area` VALUES ('450301', '市辖区', '3', '450300', '0', '1');
INSERT INTO `sys_area` VALUES ('450302', '秀峰区', '3', '450300', '1', '1');
INSERT INTO `sys_area` VALUES ('450303', '叠彩区', '3', '450300', '1', '1');
INSERT INTO `sys_area` VALUES ('450304', '象山区', '3', '450300', '1', '1');
INSERT INTO `sys_area` VALUES ('450305', '七星区', '3', '450300', '1', '1');
INSERT INTO `sys_area` VALUES ('450311', '雁山区', '3', '450300', '1', '1');
INSERT INTO `sys_area` VALUES ('450321', '阳朔县', '3', '450300', '1', '1');
INSERT INTO `sys_area` VALUES ('450322', '临桂县', '3', '450300', '1', '1');
INSERT INTO `sys_area` VALUES ('450323', '灵川县', '3', '450300', '1', '1');
INSERT INTO `sys_area` VALUES ('450324', '全州县', '3', '450300', '1', '1');
INSERT INTO `sys_area` VALUES ('450325', '兴安县', '3', '450300', '1', '1');
INSERT INTO `sys_area` VALUES ('450326', '永福县', '3', '450300', '1', '1');
INSERT INTO `sys_area` VALUES ('450327', '灌阳县', '3', '450300', '1', '1');
INSERT INTO `sys_area` VALUES ('450328', '龙胜各族自治县', '3', '450300', '1', '1');
INSERT INTO `sys_area` VALUES ('450329', '资源县', '3', '450300', '1', '1');
INSERT INTO `sys_area` VALUES ('450330', '平乐县', '3', '450300', '1', '1');
INSERT INTO `sys_area` VALUES ('450331', '荔蒲县', '3', '450300', '1', '1');
INSERT INTO `sys_area` VALUES ('450332', '恭城瑶族自治县', '3', '450300', '1', '1');
INSERT INTO `sys_area` VALUES ('450400', '梧州市', '2', '450000', '1', null);
INSERT INTO `sys_area` VALUES ('450401', '市辖区', '3', '450400', '0', '1');
INSERT INTO `sys_area` VALUES ('450403', '万秀区', '3', '450400', '1', '1');
INSERT INTO `sys_area` VALUES ('450404', '蝶山区', '3', '450400', '1', '1');
INSERT INTO `sys_area` VALUES ('450405', '长洲区', '3', '450400', '1', '1');
INSERT INTO `sys_area` VALUES ('450421', '苍梧县', '3', '450400', '1', '1');
INSERT INTO `sys_area` VALUES ('450422', '藤县', '3', '450400', '1', '1');
INSERT INTO `sys_area` VALUES ('450423', '蒙山县', '3', '450400', '1', '1');
INSERT INTO `sys_area` VALUES ('450481', '岑溪市', '3', '450400', '1', '1');
INSERT INTO `sys_area` VALUES ('450500', '北海市', '2', '450000', '1', null);
INSERT INTO `sys_area` VALUES ('450501', '市辖区', '3', '450500', '0', '1');
INSERT INTO `sys_area` VALUES ('450502', '海城区', '3', '450500', '1', '1');
INSERT INTO `sys_area` VALUES ('450503', '银海区', '3', '450500', '1', '1');
INSERT INTO `sys_area` VALUES ('450512', '铁山港区', '3', '450500', '1', '1');
INSERT INTO `sys_area` VALUES ('450521', '合浦县', '3', '450500', '1', '1');
INSERT INTO `sys_area` VALUES ('450600', '防城港市', '2', '450000', '1', null);
INSERT INTO `sys_area` VALUES ('450601', '市辖区', '3', '450600', '0', '1');
INSERT INTO `sys_area` VALUES ('450602', '港口区', '3', '450600', '1', '1');
INSERT INTO `sys_area` VALUES ('450603', '防城区', '3', '450600', '1', '1');
INSERT INTO `sys_area` VALUES ('450621', '上思县', '3', '450600', '1', '1');
INSERT INTO `sys_area` VALUES ('450681', '东兴市', '3', '450600', '1', '1');
INSERT INTO `sys_area` VALUES ('450700', '钦州市', '2', '450000', '1', null);
INSERT INTO `sys_area` VALUES ('450701', '市辖区', '3', '450700', '0', '1');
INSERT INTO `sys_area` VALUES ('450702', '钦南区', '3', '450700', '1', '1');
INSERT INTO `sys_area` VALUES ('450703', '钦北区', '3', '450700', '1', '1');
INSERT INTO `sys_area` VALUES ('450721', '灵山县', '3', '450700', '1', '1');
INSERT INTO `sys_area` VALUES ('450722', '浦北县', '3', '450700', '1', '1');
INSERT INTO `sys_area` VALUES ('450800', '贵港市', '2', '450000', '1', null);
INSERT INTO `sys_area` VALUES ('450801', '市辖区', '3', '450800', '0', '1');
INSERT INTO `sys_area` VALUES ('450802', '港北区', '3', '450800', '1', '1');
INSERT INTO `sys_area` VALUES ('450803', '港南区', '3', '450800', '1', '1');
INSERT INTO `sys_area` VALUES ('450804', '覃塘区', '3', '450800', '1', '1');
INSERT INTO `sys_area` VALUES ('450821', '平南县', '3', '450800', '1', '1');
INSERT INTO `sys_area` VALUES ('450881', '桂平市', '3', '450800', '1', '1');
INSERT INTO `sys_area` VALUES ('450900', '玉林市', '2', '450000', '1', null);
INSERT INTO `sys_area` VALUES ('450901', '市辖区', '3', '450900', '0', '1');
INSERT INTO `sys_area` VALUES ('450902', '玉州区', '3', '450900', '1', '1');
INSERT INTO `sys_area` VALUES ('450921', '容县', '3', '450900', '1', '1');
INSERT INTO `sys_area` VALUES ('450922', '陆川县', '3', '450900', '1', '1');
INSERT INTO `sys_area` VALUES ('450923', '博白县', '3', '450900', '1', '1');
INSERT INTO `sys_area` VALUES ('450924', '兴业县', '3', '450900', '1', '1');
INSERT INTO `sys_area` VALUES ('450981', '北流市', '3', '450900', '1', '1');
INSERT INTO `sys_area` VALUES ('451000', '百色市', '2', '450000', '1', null);
INSERT INTO `sys_area` VALUES ('451001', '市辖区', '3', '451000', '0', '1');
INSERT INTO `sys_area` VALUES ('451002', '右江区', '3', '451000', '1', '1');
INSERT INTO `sys_area` VALUES ('451021', '田阳县', '3', '451000', '1', '1');
INSERT INTO `sys_area` VALUES ('451022', '田东县', '3', '451000', '1', '1');
INSERT INTO `sys_area` VALUES ('451023', '平果县', '3', '451000', '1', '1');
INSERT INTO `sys_area` VALUES ('451024', '德保县', '3', '451000', '1', '1');
INSERT INTO `sys_area` VALUES ('451025', '靖西县', '3', '451000', '1', '1');
INSERT INTO `sys_area` VALUES ('451026', '那坡县', '3', '451000', '1', '1');
INSERT INTO `sys_area` VALUES ('451027', '凌云县', '3', '451000', '1', '1');
INSERT INTO `sys_area` VALUES ('451028', '乐业县', '3', '451000', '1', '1');
INSERT INTO `sys_area` VALUES ('451029', '田林县', '3', '451000', '1', '1');
INSERT INTO `sys_area` VALUES ('451030', '西林县', '3', '451000', '1', '1');
INSERT INTO `sys_area` VALUES ('451031', '隆林各族自治县', '3', '451000', '1', '1');
INSERT INTO `sys_area` VALUES ('451100', '贺州市', '2', '450000', '1', null);
INSERT INTO `sys_area` VALUES ('451101', '市辖区', '3', '451100', '0', '1');
INSERT INTO `sys_area` VALUES ('451102', '八步区', '3', '451100', '1', '1');
INSERT INTO `sys_area` VALUES ('451121', '昭平县', '3', '451100', '1', '1');
INSERT INTO `sys_area` VALUES ('451122', '钟山县', '3', '451100', '1', '1');
INSERT INTO `sys_area` VALUES ('451123', '富川瑶族自治县', '3', '451100', '1', '1');
INSERT INTO `sys_area` VALUES ('451200', '河池市', '2', '450000', '1', null);
INSERT INTO `sys_area` VALUES ('451201', '市辖区', '3', '451200', '0', '1');
INSERT INTO `sys_area` VALUES ('451202', '金城江区', '3', '451200', '1', '1');
INSERT INTO `sys_area` VALUES ('451221', '南丹县', '3', '451200', '1', '1');
INSERT INTO `sys_area` VALUES ('451222', '天峨县', '3', '451200', '1', '1');
INSERT INTO `sys_area` VALUES ('451223', '凤山县', '3', '451200', '1', '1');
INSERT INTO `sys_area` VALUES ('451224', '东兰县', '3', '451200', '1', '1');
INSERT INTO `sys_area` VALUES ('451225', '罗城仫佬族自治县', '3', '451200', '1', '1');
INSERT INTO `sys_area` VALUES ('451226', '环江毛南族自治县', '3', '451200', '1', '1');
INSERT INTO `sys_area` VALUES ('451227', '巴马瑶族自治县', '3', '451200', '1', '1');
INSERT INTO `sys_area` VALUES ('451228', '都安瑶族自治县', '3', '451200', '1', '1');
INSERT INTO `sys_area` VALUES ('451229', '大化瑶族自治县', '3', '451200', '1', '1');
INSERT INTO `sys_area` VALUES ('451281', '宜州市', '3', '451200', '1', '1');
INSERT INTO `sys_area` VALUES ('451300', '来宾市', '2', '450000', '1', null);
INSERT INTO `sys_area` VALUES ('451301', '市辖区', '3', '451300', '0', '1');
INSERT INTO `sys_area` VALUES ('451302', '兴宾区', '3', '451300', '1', '1');
INSERT INTO `sys_area` VALUES ('451321', '忻城县', '3', '451300', '1', '1');
INSERT INTO `sys_area` VALUES ('451322', '象州县', '3', '451300', '1', '1');
INSERT INTO `sys_area` VALUES ('451323', '武宣县', '3', '451300', '1', '1');
INSERT INTO `sys_area` VALUES ('451324', '金秀瑶族自治县', '3', '451300', '1', '1');
INSERT INTO `sys_area` VALUES ('451381', '合山市', '3', '451300', '1', '1');
INSERT INTO `sys_area` VALUES ('451400', '崇左市', '2', '450000', '1', null);
INSERT INTO `sys_area` VALUES ('451401', '市辖区', '3', '451400', '0', '1');
INSERT INTO `sys_area` VALUES ('451402', '江洲区', '3', '451400', '1', '1');
INSERT INTO `sys_area` VALUES ('451421', '扶绥县', '3', '451400', '1', '1');
INSERT INTO `sys_area` VALUES ('451422', '宁明县', '3', '451400', '1', '1');
INSERT INTO `sys_area` VALUES ('451423', '龙州县', '3', '451400', '1', '1');
INSERT INTO `sys_area` VALUES ('451424', '大新县', '3', '451400', '1', '1');
INSERT INTO `sys_area` VALUES ('451425', '天等县', '3', '451400', '1', '1');
INSERT INTO `sys_area` VALUES ('451481', '凭祥市', '3', '451400', '1', '1');
INSERT INTO `sys_area` VALUES ('460000', '海南省', '1', '0', '1', null);
INSERT INTO `sys_area` VALUES ('460100', '海口市', '2', '460000', '1', null);
INSERT INTO `sys_area` VALUES ('460101', '市辖区', '3', '460100', '0', '1');
INSERT INTO `sys_area` VALUES ('460105', '秀英区', '3', '460100', '1', '1');
INSERT INTO `sys_area` VALUES ('460106', '龙华区', '3', '460100', '1', '1');
INSERT INTO `sys_area` VALUES ('460107', '琼山区', '3', '460100', '1', '1');
INSERT INTO `sys_area` VALUES ('460108', '美兰区', '3', '460100', '1', '1');
INSERT INTO `sys_area` VALUES ('460200', '三亚市', '2', '460000', '1', null);
INSERT INTO `sys_area` VALUES ('460201', '市辖区', '3', '460200', '0', '1');
INSERT INTO `sys_area` VALUES ('469000', '省直辖县级行政单位', '2', '460000', '1', null);
INSERT INTO `sys_area` VALUES ('469001', '五指山市', '3', '469000', '1', '1');
INSERT INTO `sys_area` VALUES ('469002', '琼海市', '3', '469000', '1', '1');
INSERT INTO `sys_area` VALUES ('469003', '儋州市', '3', '469000', '1', '1');
INSERT INTO `sys_area` VALUES ('469005', '文昌市', '3', '469000', '1', '1');
INSERT INTO `sys_area` VALUES ('469006', '万宁市', '3', '469000', '1', '1');
INSERT INTO `sys_area` VALUES ('469007', '东方市', '3', '469000', '1', '1');
INSERT INTO `sys_area` VALUES ('469021', '定安县', '3', '469000', '1', '1');
INSERT INTO `sys_area` VALUES ('469022', '屯昌县', '3', '469000', '1', '1');
INSERT INTO `sys_area` VALUES ('469023', '澄迈县', '3', '469000', '1', '1');
INSERT INTO `sys_area` VALUES ('469024', '临高县', '3', '469000', '1', '1');
INSERT INTO `sys_area` VALUES ('469025', '白沙黎族自治县', '3', '469000', '1', '1');
INSERT INTO `sys_area` VALUES ('469026', '昌江黎族自治县', '3', '469000', '1', '1');
INSERT INTO `sys_area` VALUES ('469027', '乐东黎族自治县', '3', '469000', '1', '1');
INSERT INTO `sys_area` VALUES ('469028', '陵水黎族自治县', '3', '469000', '1', '1');
INSERT INTO `sys_area` VALUES ('469029', '保亭黎族苗族自治县', '3', '469000', '1', '1');
INSERT INTO `sys_area` VALUES ('469030', '琼中黎族苗族自治县', '3', '469000', '1', '1');
INSERT INTO `sys_area` VALUES ('469031', '西沙群岛', '3', '469000', '1', '1');
INSERT INTO `sys_area` VALUES ('469032', '南沙群岛', '3', '469000', '1', '1');
INSERT INTO `sys_area` VALUES ('469033', '中沙群岛的岛礁及其海域', '3', '469000', '1', '1');
INSERT INTO `sys_area` VALUES ('500000', '重庆市', '1', '0', '1', null);
INSERT INTO `sys_area` VALUES ('500100', '市辖区', '2', '500000', '0', '1');
INSERT INTO `sys_area` VALUES ('500101', '万州区', '2', '500000', '1', '1');
INSERT INTO `sys_area` VALUES ('500102', '涪陵区', '2', '500000', '1', '1');
INSERT INTO `sys_area` VALUES ('500103', '渝中区', '2', '500000', '1', '1');
INSERT INTO `sys_area` VALUES ('500104', '大渡口区', '2', '500000', '1', '1');
INSERT INTO `sys_area` VALUES ('500105', '江北区', '2', '500000', '1', '1');
INSERT INTO `sys_area` VALUES ('500106', '沙坪坝区', '2', '500000', '1', '1');
INSERT INTO `sys_area` VALUES ('500107', '九龙坡区', '2', '500000', '1', '1');
INSERT INTO `sys_area` VALUES ('500108', '南岸区', '2', '500000', '1', '1');
INSERT INTO `sys_area` VALUES ('500109', '北碚区', '2', '500000', '1', '1');
INSERT INTO `sys_area` VALUES ('500110', '万盛区', '2', '500000', '1', '1');
INSERT INTO `sys_area` VALUES ('500111', '双桥区', '2', '500000', '1', '1');
INSERT INTO `sys_area` VALUES ('500112', '渝北区', '2', '500000', '1', '1');
INSERT INTO `sys_area` VALUES ('500113', '巴南区', '2', '500000', '1', '1');
INSERT INTO `sys_area` VALUES ('500114', '黔江区', '2', '500000', '1', '1');
INSERT INTO `sys_area` VALUES ('500115', '长寿区', '2', '500000', '1', '1');
INSERT INTO `sys_area` VALUES ('500116', '江津区', '2', '500000', '1', '1');
INSERT INTO `sys_area` VALUES ('500117', '合川区', '2', '500000', '1', '1');
INSERT INTO `sys_area` VALUES ('500118', '永川区', '2', '500000', '1', '1');
INSERT INTO `sys_area` VALUES ('500119', '南川区', '2', '500000', '1', '1');
INSERT INTO `sys_area` VALUES ('500222', '綦江县', '2', '500000', '1', '1');
INSERT INTO `sys_area` VALUES ('500223', '潼南县', '2', '500000', '1', '1');
INSERT INTO `sys_area` VALUES ('500224', '铜梁县', '2', '500000', '1', '1');
INSERT INTO `sys_area` VALUES ('500225', '大足县', '2', '500000', '1', '1');
INSERT INTO `sys_area` VALUES ('500226', '荣昌县', '2', '500000', '1', '1');
INSERT INTO `sys_area` VALUES ('500227', '璧山县', '2', '500000', '1', '1');
INSERT INTO `sys_area` VALUES ('500228', '梁平县', '2', '500000', '1', '1');
INSERT INTO `sys_area` VALUES ('500229', '城口县', '2', '500000', '1', '1');
INSERT INTO `sys_area` VALUES ('500230', '丰都县', '2', '500000', '1', '1');
INSERT INTO `sys_area` VALUES ('500231', '垫江县', '2', '500000', '1', '1');
INSERT INTO `sys_area` VALUES ('500232', '武隆县', '2', '500000', '1', '1');
INSERT INTO `sys_area` VALUES ('500233', '忠县', '2', '500000', '1', '1');
INSERT INTO `sys_area` VALUES ('500234', '开县', '2', '500000', '1', '1');
INSERT INTO `sys_area` VALUES ('500235', '云阳县', '2', '500000', '1', '1');
INSERT INTO `sys_area` VALUES ('500236', '奉节县', '2', '500000', '1', '1');
INSERT INTO `sys_area` VALUES ('500237', '巫山县', '2', '500000', '1', '1');
INSERT INTO `sys_area` VALUES ('500238', '巫溪县', '2', '500000', '1', '1');
INSERT INTO `sys_area` VALUES ('500240', '石柱土家族自治县', '2', '500000', '1', '1');
INSERT INTO `sys_area` VALUES ('500241', '秀山土家族苗族自治县', '2', '500000', '1', '1');
INSERT INTO `sys_area` VALUES ('500242', '酉阳土家族苗族自治县', '2', '500000', '1', '1');
INSERT INTO `sys_area` VALUES ('500243', '彭水苗族土家族自治县', '2', '500000', '1', '1');
INSERT INTO `sys_area` VALUES ('510000', '四川省', '1', '0', '1', null);
INSERT INTO `sys_area` VALUES ('510100', '成都市', '2', '510000', '1', null);
INSERT INTO `sys_area` VALUES ('510101', '市辖区', '3', '510100', '0', '1');
INSERT INTO `sys_area` VALUES ('510104', '锦江区', '3', '510100', '1', '1');
INSERT INTO `sys_area` VALUES ('510105', '青羊区', '3', '510100', '1', '1');
INSERT INTO `sys_area` VALUES ('510106', '金牛区', '3', '510100', '1', '1');
INSERT INTO `sys_area` VALUES ('510107', '武侯区', '3', '510100', '1', '1');
INSERT INTO `sys_area` VALUES ('510108', '成华区', '3', '510100', '1', '1');
INSERT INTO `sys_area` VALUES ('510112', '龙泉驿区', '3', '510100', '1', '1');
INSERT INTO `sys_area` VALUES ('510113', '青白江区', '3', '510100', '1', '1');
INSERT INTO `sys_area` VALUES ('510114', '新都区', '3', '510100', '1', '1');
INSERT INTO `sys_area` VALUES ('510115', '温江区', '3', '510100', '1', '1');
INSERT INTO `sys_area` VALUES ('510121', '金堂县', '3', '510100', '1', '1');
INSERT INTO `sys_area` VALUES ('510122', '双流县', '3', '510100', '1', '1');
INSERT INTO `sys_area` VALUES ('510124', '郫县', '3', '510100', '1', '1');
INSERT INTO `sys_area` VALUES ('510129', '大邑县', '3', '510100', '1', '1');
INSERT INTO `sys_area` VALUES ('510131', '蒲江县', '3', '510100', '1', '1');
INSERT INTO `sys_area` VALUES ('510132', '新津县', '3', '510100', '1', '1');
INSERT INTO `sys_area` VALUES ('510181', '都江堰市', '3', '510100', '1', '1');
INSERT INTO `sys_area` VALUES ('510182', '彭州市', '3', '510100', '1', '1');
INSERT INTO `sys_area` VALUES ('510183', '邛崃市', '3', '510100', '1', '1');
INSERT INTO `sys_area` VALUES ('510184', '崇州市', '3', '510100', '1', '1');
INSERT INTO `sys_area` VALUES ('510300', '自贡市', '2', '510000', '1', null);
INSERT INTO `sys_area` VALUES ('510301', '市辖区', '3', '510300', '0', '1');
INSERT INTO `sys_area` VALUES ('510302', '自流井区', '3', '510300', '1', '1');
INSERT INTO `sys_area` VALUES ('510303', '贡井区', '3', '510300', '1', '1');
INSERT INTO `sys_area` VALUES ('510304', '大安区', '3', '510300', '1', '1');
INSERT INTO `sys_area` VALUES ('510311', '沿滩区', '3', '510300', '1', '1');
INSERT INTO `sys_area` VALUES ('510321', '荣县', '3', '510300', '1', '1');
INSERT INTO `sys_area` VALUES ('510322', '富顺县', '3', '510300', '1', '1');
INSERT INTO `sys_area` VALUES ('510400', '攀枝花市', '2', '510000', '1', null);
INSERT INTO `sys_area` VALUES ('510401', '市辖区', '3', '510400', '0', '1');
INSERT INTO `sys_area` VALUES ('510402', '东区', '3', '510400', '1', '1');
INSERT INTO `sys_area` VALUES ('510403', '西区', '3', '510400', '1', '1');
INSERT INTO `sys_area` VALUES ('510411', '仁和区', '3', '510400', '1', '1');
INSERT INTO `sys_area` VALUES ('510421', '米易县', '3', '510400', '1', '1');
INSERT INTO `sys_area` VALUES ('510422', '盐边县', '3', '510400', '1', '1');
INSERT INTO `sys_area` VALUES ('510500', '泸州市', '2', '510000', '1', null);
INSERT INTO `sys_area` VALUES ('510501', '市辖区', '3', '510500', '0', '1');
INSERT INTO `sys_area` VALUES ('510502', '江阳区', '3', '510500', '1', '1');
INSERT INTO `sys_area` VALUES ('510503', '纳溪区', '3', '510500', '1', '1');
INSERT INTO `sys_area` VALUES ('510504', '龙马潭区', '3', '510500', '1', '1');
INSERT INTO `sys_area` VALUES ('510521', '泸县', '3', '510500', '1', '1');
INSERT INTO `sys_area` VALUES ('510522', '合江县', '3', '510500', '1', '1');
INSERT INTO `sys_area` VALUES ('510524', '叙永县', '3', '510500', '1', '1');
INSERT INTO `sys_area` VALUES ('510525', '古蔺县', '3', '510500', '1', '1');
INSERT INTO `sys_area` VALUES ('510600', '德阳市', '2', '510000', '1', null);
INSERT INTO `sys_area` VALUES ('510601', '市辖区', '3', '510600', '0', '1');
INSERT INTO `sys_area` VALUES ('510603', '旌阳区', '3', '510600', '1', '1');
INSERT INTO `sys_area` VALUES ('510623', '中江县', '3', '510600', '1', '1');
INSERT INTO `sys_area` VALUES ('510626', '罗江县', '3', '510600', '1', '1');
INSERT INTO `sys_area` VALUES ('510681', '广汉市', '3', '510600', '1', '1');
INSERT INTO `sys_area` VALUES ('510682', '什邡市', '3', '510600', '1', '1');
INSERT INTO `sys_area` VALUES ('510683', '绵竹市', '3', '510600', '1', '1');
INSERT INTO `sys_area` VALUES ('510700', '绵阳市', '2', '510000', '1', null);
INSERT INTO `sys_area` VALUES ('510701', '市辖区', '3', '510700', '0', '1');
INSERT INTO `sys_area` VALUES ('510703', '涪城区', '3', '510700', '1', '1');
INSERT INTO `sys_area` VALUES ('510704', '游仙区', '3', '510700', '1', '1');
INSERT INTO `sys_area` VALUES ('510722', '三台县', '3', '510700', '1', '1');
INSERT INTO `sys_area` VALUES ('510723', '盐亭县', '3', '510700', '1', '1');
INSERT INTO `sys_area` VALUES ('510724', '安县', '3', '510700', '1', '1');
INSERT INTO `sys_area` VALUES ('510725', '梓潼县', '3', '510700', '1', '1');
INSERT INTO `sys_area` VALUES ('510726', '北川羌族自治县', '3', '510700', '1', '1');
INSERT INTO `sys_area` VALUES ('510727', '平武县', '3', '510700', '1', '1');
INSERT INTO `sys_area` VALUES ('510781', '江油市', '3', '510700', '1', '1');
INSERT INTO `sys_area` VALUES ('510800', '广元市', '2', '510000', '1', null);
INSERT INTO `sys_area` VALUES ('510801', '市辖区', '3', '510800', '0', '1');
INSERT INTO `sys_area` VALUES ('510802', '市中区', '3', '510800', '1', '1');
INSERT INTO `sys_area` VALUES ('510811', '元坝区', '3', '510800', '1', '1');
INSERT INTO `sys_area` VALUES ('510812', '朝天区', '3', '510800', '1', '1');
INSERT INTO `sys_area` VALUES ('510821', '旺苍县', '3', '510800', '1', '1');
INSERT INTO `sys_area` VALUES ('510822', '青川县', '3', '510800', '1', '1');
INSERT INTO `sys_area` VALUES ('510823', '剑阁县', '3', '510800', '1', '1');
INSERT INTO `sys_area` VALUES ('510824', '苍溪县', '3', '510800', '1', '1');
INSERT INTO `sys_area` VALUES ('510900', '遂宁市', '2', '510000', '1', null);
INSERT INTO `sys_area` VALUES ('510901', '市辖区', '3', '510900', '0', '1');
INSERT INTO `sys_area` VALUES ('510903', '船山区', '3', '510900', '1', '1');
INSERT INTO `sys_area` VALUES ('510904', '安居区', '3', '510900', '1', '1');
INSERT INTO `sys_area` VALUES ('510921', '蓬溪县', '3', '510900', '1', '1');
INSERT INTO `sys_area` VALUES ('510922', '射洪县', '3', '510900', '1', '1');
INSERT INTO `sys_area` VALUES ('510923', '大英县', '3', '510900', '1', '1');
INSERT INTO `sys_area` VALUES ('511000', '内江市', '2', '510000', '1', null);
INSERT INTO `sys_area` VALUES ('511001', '市辖区', '3', '511000', '0', '1');
INSERT INTO `sys_area` VALUES ('511002', '市中区', '3', '511000', '1', '1');
INSERT INTO `sys_area` VALUES ('511011', '东兴区', '3', '511000', '1', '1');
INSERT INTO `sys_area` VALUES ('511024', '威远县', '3', '511000', '1', '1');
INSERT INTO `sys_area` VALUES ('511025', '资中县', '3', '511000', '1', '1');
INSERT INTO `sys_area` VALUES ('511028', '隆昌县', '3', '511000', '1', '1');
INSERT INTO `sys_area` VALUES ('511100', '乐山市', '2', '510000', '1', null);
INSERT INTO `sys_area` VALUES ('511101', '市辖区', '3', '511100', '0', '1');
INSERT INTO `sys_area` VALUES ('511102', '市中区', '3', '511100', '1', '1');
INSERT INTO `sys_area` VALUES ('511111', '沙湾区', '3', '511100', '1', '1');
INSERT INTO `sys_area` VALUES ('511112', '五通桥区', '3', '511100', '1', '1');
INSERT INTO `sys_area` VALUES ('511113', '金口河区', '3', '511100', '1', '1');
INSERT INTO `sys_area` VALUES ('511123', '犍为县', '3', '511100', '1', '1');
INSERT INTO `sys_area` VALUES ('511124', '井研县', '3', '511100', '1', '1');
INSERT INTO `sys_area` VALUES ('511126', '夹江县', '3', '511100', '1', '1');
INSERT INTO `sys_area` VALUES ('511129', '沐川县', '3', '511100', '1', '1');
INSERT INTO `sys_area` VALUES ('511132', '峨边彝族自治县', '3', '511100', '1', '1');
INSERT INTO `sys_area` VALUES ('511133', '马边彝族自治县', '3', '511100', '1', '1');
INSERT INTO `sys_area` VALUES ('511181', '峨眉山市', '3', '511100', '1', '1');
INSERT INTO `sys_area` VALUES ('511300', '南充市', '2', '510000', '1', null);
INSERT INTO `sys_area` VALUES ('511301', '市辖区', '3', '511300', '0', '1');
INSERT INTO `sys_area` VALUES ('511302', '顺庆区', '3', '511300', '1', '1');
INSERT INTO `sys_area` VALUES ('511303', '高坪区', '3', '511300', '1', '1');
INSERT INTO `sys_area` VALUES ('511304', '嘉陵区', '3', '511300', '1', '1');
INSERT INTO `sys_area` VALUES ('511321', '南部县', '3', '511300', '1', '1');
INSERT INTO `sys_area` VALUES ('511322', '营山县', '3', '511300', '1', '1');
INSERT INTO `sys_area` VALUES ('511323', '蓬安县', '3', '511300', '1', '1');
INSERT INTO `sys_area` VALUES ('511324', '仪陇县', '3', '511300', '1', '1');
INSERT INTO `sys_area` VALUES ('511325', '西充县', '3', '511300', '1', '1');
INSERT INTO `sys_area` VALUES ('511381', '阆中市', '3', '511300', '1', '1');
INSERT INTO `sys_area` VALUES ('511400', '眉山市', '2', '510000', '1', null);
INSERT INTO `sys_area` VALUES ('511401', '市辖区', '3', '511400', '0', '1');
INSERT INTO `sys_area` VALUES ('511402', '东坡区', '3', '511400', '1', '1');
INSERT INTO `sys_area` VALUES ('511421', '仁寿县', '3', '511400', '1', '1');
INSERT INTO `sys_area` VALUES ('511422', '彭山县', '3', '511400', '1', '1');
INSERT INTO `sys_area` VALUES ('511423', '洪雅县', '3', '511400', '1', '1');
INSERT INTO `sys_area` VALUES ('511424', '丹棱县', '3', '511400', '1', '1');
INSERT INTO `sys_area` VALUES ('511425', '青神县', '3', '511400', '1', '1');
INSERT INTO `sys_area` VALUES ('511500', '宜宾市', '2', '510000', '1', null);
INSERT INTO `sys_area` VALUES ('511501', '市辖区', '3', '511500', '0', '1');
INSERT INTO `sys_area` VALUES ('511502', '翠屏区', '3', '511500', '1', '1');
INSERT INTO `sys_area` VALUES ('511521', '宜宾县', '3', '511500', '1', '1');
INSERT INTO `sys_area` VALUES ('511522', '南溪县', '3', '511500', '1', '1');
INSERT INTO `sys_area` VALUES ('511523', '江安县', '3', '511500', '1', '1');
INSERT INTO `sys_area` VALUES ('511524', '长宁县', '3', '511500', '1', '1');
INSERT INTO `sys_area` VALUES ('511525', '高县', '3', '511500', '1', '1');
INSERT INTO `sys_area` VALUES ('511526', '珙县', '3', '511500', '1', '1');
INSERT INTO `sys_area` VALUES ('511527', '筠连县', '3', '511500', '1', '1');
INSERT INTO `sys_area` VALUES ('511528', '兴文县', '3', '511500', '1', '1');
INSERT INTO `sys_area` VALUES ('511529', '屏山县', '3', '511500', '1', '1');
INSERT INTO `sys_area` VALUES ('511600', '广安市', '2', '510000', '1', null);
INSERT INTO `sys_area` VALUES ('511601', '市辖区', '3', '511600', '0', '1');
INSERT INTO `sys_area` VALUES ('511602', '广安区', '3', '511600', '1', '1');
INSERT INTO `sys_area` VALUES ('511621', '岳池县', '3', '511600', '1', '1');
INSERT INTO `sys_area` VALUES ('511622', '武胜县', '3', '511600', '1', '1');
INSERT INTO `sys_area` VALUES ('511623', '邻水县', '3', '511600', '1', '1');
INSERT INTO `sys_area` VALUES ('511681', '华蓥市', '3', '511600', '1', '1');
INSERT INTO `sys_area` VALUES ('511700', '达州市', '2', '510000', '1', null);
INSERT INTO `sys_area` VALUES ('511701', '市辖区', '3', '511700', '0', '1');
INSERT INTO `sys_area` VALUES ('511702', '通川区', '3', '511700', '1', '1');
INSERT INTO `sys_area` VALUES ('511721', '达县', '3', '511700', '1', '1');
INSERT INTO `sys_area` VALUES ('511722', '宣汉县', '3', '511700', '1', '1');
INSERT INTO `sys_area` VALUES ('511723', '开江县', '3', '511700', '1', '1');
INSERT INTO `sys_area` VALUES ('511724', '大竹县', '3', '511700', '1', '1');
INSERT INTO `sys_area` VALUES ('511725', '渠县', '3', '511700', '1', '1');
INSERT INTO `sys_area` VALUES ('511781', '万源市', '3', '511700', '1', '1');
INSERT INTO `sys_area` VALUES ('511800', '雅安市', '2', '510000', '1', null);
INSERT INTO `sys_area` VALUES ('511801', '市辖区', '3', '511800', '0', '1');
INSERT INTO `sys_area` VALUES ('511802', '雨城区', '3', '511800', '1', '1');
INSERT INTO `sys_area` VALUES ('511821', '名山县', '3', '511800', '1', '1');
INSERT INTO `sys_area` VALUES ('511822', '荥经县', '3', '511800', '1', '1');
INSERT INTO `sys_area` VALUES ('511823', '汉源县', '3', '511800', '1', '1');
INSERT INTO `sys_area` VALUES ('511824', '石棉县', '3', '511800', '1', '1');
INSERT INTO `sys_area` VALUES ('511825', '天全县', '3', '511800', '1', '1');
INSERT INTO `sys_area` VALUES ('511826', '芦山县', '3', '511800', '1', '1');
INSERT INTO `sys_area` VALUES ('511827', '宝兴县', '3', '511800', '1', '1');
INSERT INTO `sys_area` VALUES ('511900', '巴中市', '2', '510000', '1', null);
INSERT INTO `sys_area` VALUES ('511901', '市辖区', '3', '511900', '0', '1');
INSERT INTO `sys_area` VALUES ('511902', '巴州区', '3', '511900', '1', '1');
INSERT INTO `sys_area` VALUES ('511921', '通江县', '3', '511900', '1', '1');
INSERT INTO `sys_area` VALUES ('511922', '南江县', '3', '511900', '1', '1');
INSERT INTO `sys_area` VALUES ('511923', '平昌县', '3', '511900', '1', '1');
INSERT INTO `sys_area` VALUES ('512000', '资阳市', '2', '510000', '1', null);
INSERT INTO `sys_area` VALUES ('512001', '市辖区', '3', '512000', '0', '1');
INSERT INTO `sys_area` VALUES ('512002', '雁江区', '3', '512000', '1', '1');
INSERT INTO `sys_area` VALUES ('512021', '安岳县', '3', '512000', '1', '1');
INSERT INTO `sys_area` VALUES ('512022', '乐至县', '3', '512000', '1', '1');
INSERT INTO `sys_area` VALUES ('512081', '简阳市', '3', '512000', '1', '1');
INSERT INTO `sys_area` VALUES ('513200', '阿坝藏族羌族自治州', '2', '510000', '1', null);
INSERT INTO `sys_area` VALUES ('513221', '汶川县', '3', '513200', '1', '1');
INSERT INTO `sys_area` VALUES ('513222', '理县', '3', '513200', '1', '1');
INSERT INTO `sys_area` VALUES ('513223', '茂县', '3', '513200', '1', '1');
INSERT INTO `sys_area` VALUES ('513224', '松潘县', '3', '513200', '1', '1');
INSERT INTO `sys_area` VALUES ('513225', '九寨沟县', '3', '513200', '1', '1');
INSERT INTO `sys_area` VALUES ('513226', '金川县', '3', '513200', '1', '1');
INSERT INTO `sys_area` VALUES ('513227', '小金县', '3', '513200', '1', '1');
INSERT INTO `sys_area` VALUES ('513228', '黑水县', '3', '513200', '1', '1');
INSERT INTO `sys_area` VALUES ('513229', '马尔康县', '3', '513200', '1', '1');
INSERT INTO `sys_area` VALUES ('513230', '壤塘县', '3', '513200', '1', '1');
INSERT INTO `sys_area` VALUES ('513231', '阿坝县', '3', '513200', '1', '1');
INSERT INTO `sys_area` VALUES ('513232', '若尔盖县', '3', '513200', '1', '1');
INSERT INTO `sys_area` VALUES ('513233', '红原县', '3', '513200', '1', '1');
INSERT INTO `sys_area` VALUES ('513300', '甘孜藏族自治州', '2', '510000', '1', null);
INSERT INTO `sys_area` VALUES ('513321', '康定县', '3', '513300', '1', '1');
INSERT INTO `sys_area` VALUES ('513322', '泸定县', '3', '513300', '1', '1');
INSERT INTO `sys_area` VALUES ('513323', '丹巴县', '3', '513300', '1', '1');
INSERT INTO `sys_area` VALUES ('513324', '九龙县', '3', '513300', '1', '1');
INSERT INTO `sys_area` VALUES ('513325', '雅江县', '3', '513300', '1', '1');
INSERT INTO `sys_area` VALUES ('513326', '道孚县', '3', '513300', '1', '1');
INSERT INTO `sys_area` VALUES ('513327', '炉霍县', '3', '513300', '1', '1');
INSERT INTO `sys_area` VALUES ('513328', '甘孜县', '3', '513300', '1', '1');
INSERT INTO `sys_area` VALUES ('513329', '新龙县', '3', '513300', '1', '1');
INSERT INTO `sys_area` VALUES ('513330', '德格县', '3', '513300', '1', '1');
INSERT INTO `sys_area` VALUES ('513331', '白玉县', '3', '513300', '1', '1');
INSERT INTO `sys_area` VALUES ('513332', '石渠县', '3', '513300', '1', '1');
INSERT INTO `sys_area` VALUES ('513333', '色达县', '3', '513300', '1', '1');
INSERT INTO `sys_area` VALUES ('513334', '理塘县', '3', '513300', '1', '1');
INSERT INTO `sys_area` VALUES ('513335', '巴塘县', '3', '513300', '1', '1');
INSERT INTO `sys_area` VALUES ('513336', '乡城县', '3', '513300', '1', '1');
INSERT INTO `sys_area` VALUES ('513337', '稻城县', '3', '513300', '1', '1');
INSERT INTO `sys_area` VALUES ('513338', '得荣县', '3', '513300', '1', '1');
INSERT INTO `sys_area` VALUES ('513400', '凉山彝族自治州', '2', '510000', '1', null);
INSERT INTO `sys_area` VALUES ('513401', '西昌市', '3', '513400', '1', '1');
INSERT INTO `sys_area` VALUES ('513422', '木里藏族自治县', '3', '513400', '1', '1');
INSERT INTO `sys_area` VALUES ('513423', '盐源县', '3', '513400', '1', '1');
INSERT INTO `sys_area` VALUES ('513424', '德昌县', '3', '513400', '1', '1');
INSERT INTO `sys_area` VALUES ('513425', '会理县', '3', '513400', '1', '1');
INSERT INTO `sys_area` VALUES ('513426', '会东县', '3', '513400', '1', '1');
INSERT INTO `sys_area` VALUES ('513427', '宁南县', '3', '513400', '1', '1');
INSERT INTO `sys_area` VALUES ('513428', '普格县', '3', '513400', '1', '1');
INSERT INTO `sys_area` VALUES ('513429', '布拖县', '3', '513400', '1', '1');
INSERT INTO `sys_area` VALUES ('513430', '金阳县', '3', '513400', '1', '1');
INSERT INTO `sys_area` VALUES ('513431', '昭觉县', '3', '513400', '1', '1');
INSERT INTO `sys_area` VALUES ('513432', '喜德县', '3', '513400', '1', '1');
INSERT INTO `sys_area` VALUES ('513433', '冕宁县', '3', '513400', '1', '1');
INSERT INTO `sys_area` VALUES ('513434', '越西县', '3', '513400', '1', '1');
INSERT INTO `sys_area` VALUES ('513435', '甘洛县', '3', '513400', '1', '1');
INSERT INTO `sys_area` VALUES ('513436', '美姑县', '3', '513400', '1', '1');
INSERT INTO `sys_area` VALUES ('513437', '雷波县', '3', '513400', '1', '1');
INSERT INTO `sys_area` VALUES ('520000', '贵州省', '1', '0', '1', null);
INSERT INTO `sys_area` VALUES ('520100', '贵阳市', '2', '520000', '1', null);
INSERT INTO `sys_area` VALUES ('520101', '市辖区', '3', '520100', '0', '1');
INSERT INTO `sys_area` VALUES ('520102', '南明区', '3', '520100', '1', '1');
INSERT INTO `sys_area` VALUES ('520103', '云岩区', '3', '520100', '1', '1');
INSERT INTO `sys_area` VALUES ('520111', '花溪区', '3', '520100', '1', '1');
INSERT INTO `sys_area` VALUES ('520112', '乌当区', '3', '520100', '1', '1');
INSERT INTO `sys_area` VALUES ('520113', '白云区', '3', '520100', '1', '1');
INSERT INTO `sys_area` VALUES ('520114', '小河区', '3', '520100', '1', '1');
INSERT INTO `sys_area` VALUES ('520121', '开阳县', '3', '520100', '1', '1');
INSERT INTO `sys_area` VALUES ('520122', '息烽县', '3', '520100', '1', '1');
INSERT INTO `sys_area` VALUES ('520123', '修文县', '3', '520100', '1', '1');
INSERT INTO `sys_area` VALUES ('520181', '清镇市', '3', '520100', '1', '1');
INSERT INTO `sys_area` VALUES ('520200', '六盘水市', '2', '520000', '1', null);
INSERT INTO `sys_area` VALUES ('520201', '钟山区', '3', '520200', '1', '1');
INSERT INTO `sys_area` VALUES ('520203', '六枝特区', '3', '520200', '1', '1');
INSERT INTO `sys_area` VALUES ('520221', '水城县', '3', '520200', '1', '1');
INSERT INTO `sys_area` VALUES ('520222', '盘县', '3', '520200', '1', '1');
INSERT INTO `sys_area` VALUES ('520300', '遵义市', '2', '520000', '1', null);
INSERT INTO `sys_area` VALUES ('520301', '市辖区', '3', '520300', '0', '1');
INSERT INTO `sys_area` VALUES ('520302', '红花岗区', '3', '520300', '1', '1');
INSERT INTO `sys_area` VALUES ('520303', '汇川区', '3', '520300', '1', '1');
INSERT INTO `sys_area` VALUES ('520321', '遵义县', '3', '520300', '1', '1');
INSERT INTO `sys_area` VALUES ('520322', '桐梓县', '3', '520300', '1', '1');
INSERT INTO `sys_area` VALUES ('520323', '绥阳县', '3', '520300', '1', '1');
INSERT INTO `sys_area` VALUES ('520324', '正安县', '3', '520300', '1', '1');
INSERT INTO `sys_area` VALUES ('520325', '道真仡佬族苗族自治县', '3', '520300', '1', '1');
INSERT INTO `sys_area` VALUES ('520326', '务川仡佬族苗族自治县', '3', '520300', '1', '1');
INSERT INTO `sys_area` VALUES ('520327', '凤冈县', '3', '520300', '1', '1');
INSERT INTO `sys_area` VALUES ('520328', '湄潭县', '3', '520300', '1', '1');
INSERT INTO `sys_area` VALUES ('520329', '余庆县', '3', '520300', '1', '1');
INSERT INTO `sys_area` VALUES ('520330', '习水县', '3', '520300', '1', '1');
INSERT INTO `sys_area` VALUES ('520381', '赤水市', '3', '520300', '1', '1');
INSERT INTO `sys_area` VALUES ('520382', '仁怀市', '3', '520300', '1', '1');
INSERT INTO `sys_area` VALUES ('520400', '安顺市', '2', '520000', '1', null);
INSERT INTO `sys_area` VALUES ('520401', '市辖区', '3', '520400', '0', '1');
INSERT INTO `sys_area` VALUES ('520402', '西秀区', '3', '520400', '1', '1');
INSERT INTO `sys_area` VALUES ('520421', '平坝县', '3', '520400', '1', '1');
INSERT INTO `sys_area` VALUES ('520422', '普定县', '3', '520400', '1', '1');
INSERT INTO `sys_area` VALUES ('520423', '镇宁布依族苗族自治县', '3', '520400', '1', '1');
INSERT INTO `sys_area` VALUES ('520424', '关岭布依族苗族自治县', '3', '520400', '1', '1');
INSERT INTO `sys_area` VALUES ('520425', '紫云苗族布依族自治县', '3', '520400', '1', '1');
INSERT INTO `sys_area` VALUES ('522200', '铜仁地区', '2', '520000', '1', null);
INSERT INTO `sys_area` VALUES ('522201', '铜仁市', '3', '522200', '1', '1');
INSERT INTO `sys_area` VALUES ('522222', '江口县', '3', '522200', '1', '1');
INSERT INTO `sys_area` VALUES ('522223', '玉屏侗族自治县', '3', '522200', '1', '1');
INSERT INTO `sys_area` VALUES ('522224', '石阡县', '3', '522200', '1', '1');
INSERT INTO `sys_area` VALUES ('522225', '思南县', '3', '522200', '1', '1');
INSERT INTO `sys_area` VALUES ('522226', '印江土家族苗族自治县', '3', '522200', '1', '1');
INSERT INTO `sys_area` VALUES ('522227', '德江县', '3', '522200', '1', '1');
INSERT INTO `sys_area` VALUES ('522228', '沿河土家族自治县', '3', '522200', '1', '1');
INSERT INTO `sys_area` VALUES ('522229', '松桃苗族自治县', '3', '522200', '1', '1');
INSERT INTO `sys_area` VALUES ('522230', '万山特区', '3', '522200', '1', '1');
INSERT INTO `sys_area` VALUES ('522300', '黔西南布依族苗族自治州', '2', '520000', '1', null);
INSERT INTO `sys_area` VALUES ('522301', '兴义市', '3', '522300', '1', '1');
INSERT INTO `sys_area` VALUES ('522322', '兴仁县', '3', '522300', '1', '1');
INSERT INTO `sys_area` VALUES ('522323', '普安县', '3', '522300', '1', '1');
INSERT INTO `sys_area` VALUES ('522324', '晴隆县', '3', '522300', '1', '1');
INSERT INTO `sys_area` VALUES ('522325', '贞丰县', '3', '522300', '1', '1');
INSERT INTO `sys_area` VALUES ('522326', '望谟县', '3', '522300', '1', '1');
INSERT INTO `sys_area` VALUES ('522327', '册亨县', '3', '522300', '1', '1');
INSERT INTO `sys_area` VALUES ('522328', '安龙县', '3', '522300', '1', '1');
INSERT INTO `sys_area` VALUES ('522400', '毕节地区', '2', '520000', '1', null);
INSERT INTO `sys_area` VALUES ('522401', '毕节市', '3', '522400', '1', '1');
INSERT INTO `sys_area` VALUES ('522422', '大方县', '3', '522400', '1', '1');
INSERT INTO `sys_area` VALUES ('522423', '黔西县', '3', '522400', '1', '1');
INSERT INTO `sys_area` VALUES ('522424', '金沙县', '3', '522400', '1', '1');
INSERT INTO `sys_area` VALUES ('522425', '织金县', '3', '522400', '1', '1');
INSERT INTO `sys_area` VALUES ('522426', '纳雍县', '3', '522400', '1', '1');
INSERT INTO `sys_area` VALUES ('522427', '威宁彝族回族苗族自治县', '3', '522400', '1', '1');
INSERT INTO `sys_area` VALUES ('522428', '赫章县', '3', '522400', '1', '1');
INSERT INTO `sys_area` VALUES ('522600', '黔东南苗族侗族自治州', '2', '520000', '1', null);
INSERT INTO `sys_area` VALUES ('522601', '凯里市', '3', '522600', '1', '1');
INSERT INTO `sys_area` VALUES ('522622', '黄平县', '3', '522600', '1', '1');
INSERT INTO `sys_area` VALUES ('522623', '施秉县', '3', '522600', '1', '1');
INSERT INTO `sys_area` VALUES ('522624', '三穗县', '3', '522600', '1', '1');
INSERT INTO `sys_area` VALUES ('522625', '镇远县', '3', '522600', '1', '1');
INSERT INTO `sys_area` VALUES ('522626', '岑巩县', '3', '522600', '1', '1');
INSERT INTO `sys_area` VALUES ('522627', '天柱县', '3', '522600', '1', '1');
INSERT INTO `sys_area` VALUES ('522628', '锦屏县', '3', '522600', '1', '1');
INSERT INTO `sys_area` VALUES ('522629', '剑河县', '3', '522600', '1', '1');
INSERT INTO `sys_area` VALUES ('522630', '台江县', '3', '522600', '1', '1');
INSERT INTO `sys_area` VALUES ('522631', '黎平县', '3', '522600', '1', '1');
INSERT INTO `sys_area` VALUES ('522632', '榕江县', '3', '522600', '1', '1');
INSERT INTO `sys_area` VALUES ('522633', '从江县', '3', '522600', '1', '1');
INSERT INTO `sys_area` VALUES ('522634', '雷山县', '3', '522600', '1', '1');
INSERT INTO `sys_area` VALUES ('522635', '麻江县', '3', '522600', '1', '1');
INSERT INTO `sys_area` VALUES ('522636', '丹寨县', '3', '522600', '1', '1');
INSERT INTO `sys_area` VALUES ('522700', '黔南布依族苗族自治州', '2', '520000', '1', null);
INSERT INTO `sys_area` VALUES ('522701', '都匀市', '3', '522700', '1', '1');
INSERT INTO `sys_area` VALUES ('522702', '福泉市', '3', '522700', '1', '1');
INSERT INTO `sys_area` VALUES ('522722', '荔波县', '3', '522700', '1', '1');
INSERT INTO `sys_area` VALUES ('522723', '贵定县', '3', '522700', '1', '1');
INSERT INTO `sys_area` VALUES ('522725', '瓮安县', '3', '522700', '1', '1');
INSERT INTO `sys_area` VALUES ('522726', '独山县', '3', '522700', '1', '1');
INSERT INTO `sys_area` VALUES ('522727', '平塘县', '3', '522700', '1', '1');
INSERT INTO `sys_area` VALUES ('522728', '罗甸县', '3', '522700', '1', '1');
INSERT INTO `sys_area` VALUES ('522729', '长顺县', '3', '522700', '1', '1');
INSERT INTO `sys_area` VALUES ('522730', '龙里县', '3', '522700', '1', '1');
INSERT INTO `sys_area` VALUES ('522731', '惠水县', '3', '522700', '1', '1');
INSERT INTO `sys_area` VALUES ('522732', '三都水族自治县', '3', '522700', '1', '1');
INSERT INTO `sys_area` VALUES ('530000', '云南省', '1', '0', '1', null);
INSERT INTO `sys_area` VALUES ('530100', '昆明市', '2', '530000', '1', null);
INSERT INTO `sys_area` VALUES ('530101', '市辖区', '3', '530100', '0', '1');
INSERT INTO `sys_area` VALUES ('530102', '五华区', '3', '530100', '1', '1');
INSERT INTO `sys_area` VALUES ('530103', '盘龙区', '3', '530100', '1', '1');
INSERT INTO `sys_area` VALUES ('530111', '官渡区', '3', '530100', '1', '1');
INSERT INTO `sys_area` VALUES ('530112', '西山区', '3', '530100', '1', '1');
INSERT INTO `sys_area` VALUES ('530113', '东川区', '3', '530100', '1', '1');
INSERT INTO `sys_area` VALUES ('530121', '呈贡县', '3', '530100', '1', '1');
INSERT INTO `sys_area` VALUES ('530122', '晋宁县', '3', '530100', '1', '1');
INSERT INTO `sys_area` VALUES ('530124', '富民县', '3', '530100', '1', '1');
INSERT INTO `sys_area` VALUES ('530125', '宜良县', '3', '530100', '1', '1');
INSERT INTO `sys_area` VALUES ('530126', '石林彝族自治县', '3', '530100', '1', '1');
INSERT INTO `sys_area` VALUES ('530127', '嵩明县', '3', '530100', '1', '1');
INSERT INTO `sys_area` VALUES ('530128', '禄劝彝族苗族自治县', '3', '530100', '1', '1');
INSERT INTO `sys_area` VALUES ('530129', '寻甸回族彝族自治县', '3', '530100', '1', '1');
INSERT INTO `sys_area` VALUES ('530181', '安宁市', '3', '530100', '1', '1');
INSERT INTO `sys_area` VALUES ('530300', '曲靖市', '2', '530000', '1', null);
INSERT INTO `sys_area` VALUES ('530301', '市辖区', '3', '530300', '0', '1');
INSERT INTO `sys_area` VALUES ('530302', '麒麟区', '3', '530300', '1', '1');
INSERT INTO `sys_area` VALUES ('530321', '马龙县', '3', '530300', '1', '1');
INSERT INTO `sys_area` VALUES ('530322', '陆良县', '3', '530300', '1', '1');
INSERT INTO `sys_area` VALUES ('530323', '师宗县', '3', '530300', '1', '1');
INSERT INTO `sys_area` VALUES ('530324', '罗平县', '3', '530300', '1', '1');
INSERT INTO `sys_area` VALUES ('530325', '富源县', '3', '530300', '1', '1');
INSERT INTO `sys_area` VALUES ('530326', '会泽县', '3', '530300', '1', '1');
INSERT INTO `sys_area` VALUES ('530328', '沾益县', '3', '530300', '1', '1');
INSERT INTO `sys_area` VALUES ('530381', '宣威市', '3', '530300', '1', '1');
INSERT INTO `sys_area` VALUES ('530400', '玉溪市', '2', '530000', '1', null);
INSERT INTO `sys_area` VALUES ('530401', '市辖区', '3', '530400', '0', '1');
INSERT INTO `sys_area` VALUES ('530402', '红塔区', '3', '530400', '1', '1');
INSERT INTO `sys_area` VALUES ('530421', '江川县', '3', '530400', '1', '1');
INSERT INTO `sys_area` VALUES ('530422', '澄江县', '3', '530400', '1', '1');
INSERT INTO `sys_area` VALUES ('530423', '通海县', '3', '530400', '1', '1');
INSERT INTO `sys_area` VALUES ('530424', '华宁县', '3', '530400', '1', '1');
INSERT INTO `sys_area` VALUES ('530425', '易门县', '3', '530400', '1', '1');
INSERT INTO `sys_area` VALUES ('530426', '峨山彝族自治县', '3', '530400', '1', '1');
INSERT INTO `sys_area` VALUES ('530427', '新平彝族傣族自治县', '3', '530400', '1', '1');
INSERT INTO `sys_area` VALUES ('530428', '元江哈尼族彝族傣族自治县', '3', '530400', '1', '1');
INSERT INTO `sys_area` VALUES ('530500', '保山市', '2', '530000', '1', null);
INSERT INTO `sys_area` VALUES ('530501', '市辖区', '3', '530500', '0', '1');
INSERT INTO `sys_area` VALUES ('530502', '隆阳区', '3', '530500', '1', '1');
INSERT INTO `sys_area` VALUES ('530521', '施甸县', '3', '530500', '1', '1');
INSERT INTO `sys_area` VALUES ('530522', '腾冲县', '3', '530500', '1', '1');
INSERT INTO `sys_area` VALUES ('530523', '龙陵县', '3', '530500', '1', '1');
INSERT INTO `sys_area` VALUES ('530524', '昌宁县', '3', '530500', '1', '1');
INSERT INTO `sys_area` VALUES ('530600', '昭通市', '2', '530000', '1', null);
INSERT INTO `sys_area` VALUES ('530601', '市辖区', '3', '530600', '0', '1');
INSERT INTO `sys_area` VALUES ('530602', '昭阳区', '3', '530600', '1', '1');
INSERT INTO `sys_area` VALUES ('530621', '鲁甸县', '3', '530600', '1', '1');
INSERT INTO `sys_area` VALUES ('530622', '巧家县', '3', '530600', '1', '1');
INSERT INTO `sys_area` VALUES ('530623', '盐津县', '3', '530600', '1', '1');
INSERT INTO `sys_area` VALUES ('530624', '大关县', '3', '530600', '1', '1');
INSERT INTO `sys_area` VALUES ('530625', '永善县', '3', '530600', '1', '1');
INSERT INTO `sys_area` VALUES ('530626', '绥江县', '3', '530600', '1', '1');
INSERT INTO `sys_area` VALUES ('530627', '镇雄县', '3', '530600', '1', '1');
INSERT INTO `sys_area` VALUES ('530628', '彝良县', '3', '530600', '1', '1');
INSERT INTO `sys_area` VALUES ('530629', '威信县', '3', '530600', '1', '1');
INSERT INTO `sys_area` VALUES ('530630', '水富县', '3', '530600', '1', '1');
INSERT INTO `sys_area` VALUES ('530700', '丽江市', '2', '530000', '1', null);
INSERT INTO `sys_area` VALUES ('530701', '市辖区', '3', '530700', '0', '1');
INSERT INTO `sys_area` VALUES ('530702', '古城区', '3', '530700', '1', '1');
INSERT INTO `sys_area` VALUES ('530721', '玉龙纳西族自治县', '3', '530700', '1', '1');
INSERT INTO `sys_area` VALUES ('530722', '永胜县', '3', '530700', '1', '1');
INSERT INTO `sys_area` VALUES ('530723', '华坪县', '3', '530700', '1', '1');
INSERT INTO `sys_area` VALUES ('530724', '宁蒗彝族自治县', '3', '530700', '1', '1');
INSERT INTO `sys_area` VALUES ('530800', '普洱市', '2', '530000', '1', null);
INSERT INTO `sys_area` VALUES ('530801', '市辖区', '3', '530800', '0', '1');
INSERT INTO `sys_area` VALUES ('530802', '思茅区', '3', '530800', '1', '1');
INSERT INTO `sys_area` VALUES ('530821', '宁洱哈尼族彝族自治县', '3', '530800', '1', '1');
INSERT INTO `sys_area` VALUES ('530822', '墨江哈尼族自治县', '3', '530800', '1', '1');
INSERT INTO `sys_area` VALUES ('530823', '景东彝族自治县', '3', '530800', '1', '1');
INSERT INTO `sys_area` VALUES ('530824', '景谷傣族彝族自治县', '3', '530800', '1', '1');
INSERT INTO `sys_area` VALUES ('530825', '镇沅彝族哈尼族拉祜族自治县', '3', '530800', '1', '1');
INSERT INTO `sys_area` VALUES ('530826', '江城哈尼族彝族自治县', '3', '530800', '1', '1');
INSERT INTO `sys_area` VALUES ('530827', '孟连傣族拉祜族佤族自治县', '3', '530800', '1', '1');
INSERT INTO `sys_area` VALUES ('530828', '澜沧拉祜族自治县', '3', '530800', '1', '1');
INSERT INTO `sys_area` VALUES ('530829', '西盟佤族自治县', '3', '530800', '1', '1');
INSERT INTO `sys_area` VALUES ('530900', '临沧市', '2', '530000', '1', null);
INSERT INTO `sys_area` VALUES ('530901', '市辖区', '3', '530900', '0', '1');
INSERT INTO `sys_area` VALUES ('530902', '临翔区', '3', '530900', '1', '1');
INSERT INTO `sys_area` VALUES ('530921', '凤庆县', '3', '530900', '1', '1');
INSERT INTO `sys_area` VALUES ('530922', '云县', '3', '530900', '1', '1');
INSERT INTO `sys_area` VALUES ('530923', '永德县', '3', '530900', '1', '1');
INSERT INTO `sys_area` VALUES ('530924', '镇康县', '3', '530900', '1', '1');
INSERT INTO `sys_area` VALUES ('530925', '双江拉祜族佤族布朗族傣族自治县', '3', '530900', '1', '1');
INSERT INTO `sys_area` VALUES ('530926', '耿马傣族佤族自治县', '3', '530900', '1', '1');
INSERT INTO `sys_area` VALUES ('530927', '沧源佤族自治县', '3', '530900', '1', '1');
INSERT INTO `sys_area` VALUES ('532300', '楚雄彝族自治州', '2', '530000', '1', null);
INSERT INTO `sys_area` VALUES ('532301', '楚雄市', '3', '532300', '1', '1');
INSERT INTO `sys_area` VALUES ('532322', '双柏县', '3', '532300', '1', '1');
INSERT INTO `sys_area` VALUES ('532323', '牟定县', '3', '532300', '1', '1');
INSERT INTO `sys_area` VALUES ('532324', '南华县', '3', '532300', '1', '1');
INSERT INTO `sys_area` VALUES ('532325', '姚安县', '3', '532300', '1', '1');
INSERT INTO `sys_area` VALUES ('532326', '大姚县', '3', '532300', '1', '1');
INSERT INTO `sys_area` VALUES ('532327', '永仁县', '3', '532300', '1', '1');
INSERT INTO `sys_area` VALUES ('532328', '元谋县', '3', '532300', '1', '1');
INSERT INTO `sys_area` VALUES ('532329', '武定县', '3', '532300', '1', '1');
INSERT INTO `sys_area` VALUES ('532331', '禄丰县', '3', '532300', '1', '1');
INSERT INTO `sys_area` VALUES ('532500', '红河哈尼族彝族自治州', '2', '530000', '1', null);
INSERT INTO `sys_area` VALUES ('532501', '个旧市', '3', '532500', '1', '1');
INSERT INTO `sys_area` VALUES ('532502', '开远市', '3', '532500', '1', '1');
INSERT INTO `sys_area` VALUES ('532522', '蒙自县', '3', '532500', '1', '1');
INSERT INTO `sys_area` VALUES ('532523', '屏边苗族自治县', '3', '532500', '1', '1');
INSERT INTO `sys_area` VALUES ('532524', '建水县', '3', '532500', '1', '1');
INSERT INTO `sys_area` VALUES ('532525', '石屏县', '3', '532500', '1', '1');
INSERT INTO `sys_area` VALUES ('532526', '弥勒县', '3', '532500', '1', '1');
INSERT INTO `sys_area` VALUES ('532527', '泸西县', '3', '532500', '1', '1');
INSERT INTO `sys_area` VALUES ('532528', '元阳县', '3', '532500', '1', '1');
INSERT INTO `sys_area` VALUES ('532529', '红河县', '3', '532500', '1', '1');
INSERT INTO `sys_area` VALUES ('532530', '金平苗族瑶族傣族自治县', '3', '532500', '1', '1');
INSERT INTO `sys_area` VALUES ('532531', '绿春县', '3', '532500', '1', '1');
INSERT INTO `sys_area` VALUES ('532532', '河口瑶族自治县', '3', '532500', '1', '1');
INSERT INTO `sys_area` VALUES ('532600', '文山壮族苗族自治州', '2', '530000', '1', null);
INSERT INTO `sys_area` VALUES ('532621', '文山县', '3', '532600', '1', '1');
INSERT INTO `sys_area` VALUES ('532622', '砚山县', '3', '532600', '1', '1');
INSERT INTO `sys_area` VALUES ('532623', '西畴县', '3', '532600', '1', '1');
INSERT INTO `sys_area` VALUES ('532624', '麻栗坡县', '3', '532600', '1', '1');
INSERT INTO `sys_area` VALUES ('532625', '马关县', '3', '532600', '1', '1');
INSERT INTO `sys_area` VALUES ('532626', '丘北县', '3', '532600', '1', '1');
INSERT INTO `sys_area` VALUES ('532627', '广南县', '3', '532600', '1', '1');
INSERT INTO `sys_area` VALUES ('532628', '富宁县', '3', '532600', '1', '1');
INSERT INTO `sys_area` VALUES ('532800', '西双版纳傣族自治州', '2', '530000', '1', null);
INSERT INTO `sys_area` VALUES ('532801', '景洪市', '3', '532800', '1', '1');
INSERT INTO `sys_area` VALUES ('532822', '勐海县', '3', '532800', '1', '1');
INSERT INTO `sys_area` VALUES ('532823', '勐腊县', '3', '532800', '1', '1');
INSERT INTO `sys_area` VALUES ('532900', '大理白族自治州', '2', '530000', '1', null);
INSERT INTO `sys_area` VALUES ('532901', '大理市', '3', '532900', '1', '1');
INSERT INTO `sys_area` VALUES ('532922', '漾濞彝族自治县', '3', '532900', '1', '1');
INSERT INTO `sys_area` VALUES ('532923', '祥云县', '3', '532900', '1', '1');
INSERT INTO `sys_area` VALUES ('532924', '宾川县', '3', '532900', '1', '1');
INSERT INTO `sys_area` VALUES ('532925', '弥渡县', '3', '532900', '1', '1');
INSERT INTO `sys_area` VALUES ('532926', '南涧彝族自治县', '3', '532900', '1', '1');
INSERT INTO `sys_area` VALUES ('532927', '巍山彝族回族自治县', '3', '532900', '1', '1');
INSERT INTO `sys_area` VALUES ('532928', '永平县', '3', '532900', '1', '1');
INSERT INTO `sys_area` VALUES ('532929', '云龙县', '3', '532900', '1', '1');
INSERT INTO `sys_area` VALUES ('532930', '洱源县', '3', '532900', '1', '1');
INSERT INTO `sys_area` VALUES ('532931', '剑川县', '3', '532900', '1', '1');
INSERT INTO `sys_area` VALUES ('532932', '鹤庆县', '3', '532900', '1', '1');
INSERT INTO `sys_area` VALUES ('533100', '德宏傣族景颇族自治州', '2', '530000', '1', null);
INSERT INTO `sys_area` VALUES ('533102', '瑞丽市', '3', '533100', '1', '1');
INSERT INTO `sys_area` VALUES ('533103', '潞西市', '3', '533100', '1', '1');
INSERT INTO `sys_area` VALUES ('533122', '梁河县', '3', '533100', '1', '1');
INSERT INTO `sys_area` VALUES ('533123', '盈江县', '3', '533100', '1', '1');
INSERT INTO `sys_area` VALUES ('533124', '陇川县', '3', '533100', '1', '1');
INSERT INTO `sys_area` VALUES ('533300', '怒江傈僳族自治州', '2', '530000', '1', null);
INSERT INTO `sys_area` VALUES ('533321', '泸水县', '3', '533300', '1', '1');
INSERT INTO `sys_area` VALUES ('533323', '福贡县', '3', '533300', '1', '1');
INSERT INTO `sys_area` VALUES ('533324', '贡山独龙族怒族自治县', '3', '533300', '1', '1');
INSERT INTO `sys_area` VALUES ('533325', '兰坪白族普米族自治县', '3', '533300', '1', '1');
INSERT INTO `sys_area` VALUES ('533400', '迪庆藏族自治州', '2', '530000', '1', null);
INSERT INTO `sys_area` VALUES ('533421', '香格里拉县', '3', '533400', '1', '1');
INSERT INTO `sys_area` VALUES ('533422', '德钦县', '3', '533400', '1', '1');
INSERT INTO `sys_area` VALUES ('533423', '维西傈僳族自治县', '3', '533400', '1', '1');
INSERT INTO `sys_area` VALUES ('540000', '西藏自治区', '1', '0', '1', null);
INSERT INTO `sys_area` VALUES ('540100', '拉萨市', '2', '540000', '1', null);
INSERT INTO `sys_area` VALUES ('540101', '市辖区', '3', '540100', '0', '1');
INSERT INTO `sys_area` VALUES ('540102', '城关区', '3', '540100', '1', '1');
INSERT INTO `sys_area` VALUES ('540121', '林周县', '3', '540100', '1', '1');
INSERT INTO `sys_area` VALUES ('540122', '当雄县', '3', '540100', '1', '1');
INSERT INTO `sys_area` VALUES ('540123', '尼木县', '3', '540100', '1', '1');
INSERT INTO `sys_area` VALUES ('540124', '曲水县', '3', '540100', '1', '1');
INSERT INTO `sys_area` VALUES ('540125', '堆龙德庆县', '3', '540100', '1', '1');
INSERT INTO `sys_area` VALUES ('540126', '达孜县', '3', '540100', '1', '1');
INSERT INTO `sys_area` VALUES ('540127', '墨竹工卡县', '3', '540100', '1', '1');
INSERT INTO `sys_area` VALUES ('542100', '昌都地区', '2', '540000', '1', null);
INSERT INTO `sys_area` VALUES ('542121', '昌都县', '3', '542100', '1', '1');
INSERT INTO `sys_area` VALUES ('542122', '江达县', '3', '542100', '1', '1');
INSERT INTO `sys_area` VALUES ('542123', '贡觉县', '3', '542100', '1', '1');
INSERT INTO `sys_area` VALUES ('542124', '类乌齐县', '3', '542100', '1', '1');
INSERT INTO `sys_area` VALUES ('542125', '丁青县', '3', '542100', '1', '1');
INSERT INTO `sys_area` VALUES ('542126', '察雅县', '3', '542100', '1', '1');
INSERT INTO `sys_area` VALUES ('542127', '八宿县', '3', '542100', '1', '1');
INSERT INTO `sys_area` VALUES ('542128', '左贡县', '3', '542100', '1', '1');
INSERT INTO `sys_area` VALUES ('542129', '芒康县', '3', '542100', '1', '1');
INSERT INTO `sys_area` VALUES ('542132', '洛隆县', '3', '542100', '1', '1');
INSERT INTO `sys_area` VALUES ('542133', '边坝县', '3', '542100', '1', '1');
INSERT INTO `sys_area` VALUES ('542200', '山南地区', '2', '540000', '1', null);
INSERT INTO `sys_area` VALUES ('542221', '乃东县', '3', '542200', '1', '1');
INSERT INTO `sys_area` VALUES ('542222', '扎囊县', '3', '542200', '1', '1');
INSERT INTO `sys_area` VALUES ('542223', '贡嘎县', '3', '542200', '1', '1');
INSERT INTO `sys_area` VALUES ('542224', '桑日县', '3', '542200', '1', '1');
INSERT INTO `sys_area` VALUES ('542225', '琼结县', '3', '542200', '1', '1');
INSERT INTO `sys_area` VALUES ('542226', '曲松县', '3', '542200', '1', '1');
INSERT INTO `sys_area` VALUES ('542227', '措美县', '3', '542200', '1', '1');
INSERT INTO `sys_area` VALUES ('542228', '洛扎县', '3', '542200', '1', '1');
INSERT INTO `sys_area` VALUES ('542229', '加查县', '3', '542200', '1', '1');
INSERT INTO `sys_area` VALUES ('542231', '隆子县', '3', '542200', '1', '1');
INSERT INTO `sys_area` VALUES ('542232', '错那县', '3', '542200', '1', '1');
INSERT INTO `sys_area` VALUES ('542233', '浪卡子县', '3', '542200', '1', '1');
INSERT INTO `sys_area` VALUES ('542300', '日喀则地区', '2', '540000', '1', null);
INSERT INTO `sys_area` VALUES ('542301', '日喀则市', '3', '542300', '1', '1');
INSERT INTO `sys_area` VALUES ('542322', '南木林县', '3', '542300', '1', '1');
INSERT INTO `sys_area` VALUES ('542323', '江孜县', '3', '542300', '1', '1');
INSERT INTO `sys_area` VALUES ('542324', '定日县', '3', '542300', '1', '1');
INSERT INTO `sys_area` VALUES ('542325', '萨迦县', '3', '542300', '1', '1');
INSERT INTO `sys_area` VALUES ('542326', '拉孜县', '3', '542300', '1', '1');
INSERT INTO `sys_area` VALUES ('542327', '昂仁县', '3', '542300', '1', '1');
INSERT INTO `sys_area` VALUES ('542328', '谢通门县', '3', '542300', '1', '1');
INSERT INTO `sys_area` VALUES ('542329', '白朗县', '3', '542300', '1', '1');
INSERT INTO `sys_area` VALUES ('542330', '仁布县', '3', '542300', '1', '1');
INSERT INTO `sys_area` VALUES ('542331', '康马县', '3', '542300', '1', '1');
INSERT INTO `sys_area` VALUES ('542332', '定结县', '3', '542300', '1', '1');
INSERT INTO `sys_area` VALUES ('542333', '仲巴县', '3', '542300', '1', '1');
INSERT INTO `sys_area` VALUES ('542334', '亚东县', '3', '542300', '1', '1');
INSERT INTO `sys_area` VALUES ('542335', '吉隆县', '3', '542300', '1', '1');
INSERT INTO `sys_area` VALUES ('542336', '聂拉木县', '3', '542300', '1', '1');
INSERT INTO `sys_area` VALUES ('542337', '萨嘎县', '3', '542300', '1', '1');
INSERT INTO `sys_area` VALUES ('542338', '岗巴县', '3', '542300', '1', '1');
INSERT INTO `sys_area` VALUES ('542400', '那曲地区', '2', '540000', '1', null);
INSERT INTO `sys_area` VALUES ('542421', '那曲县', '3', '542400', '1', '1');
INSERT INTO `sys_area` VALUES ('542422', '嘉黎县', '3', '542400', '1', '1');
INSERT INTO `sys_area` VALUES ('542423', '比如县', '3', '542400', '1', '1');
INSERT INTO `sys_area` VALUES ('542424', '聂荣县', '3', '542400', '1', '1');
INSERT INTO `sys_area` VALUES ('542425', '安多县', '3', '542400', '1', '1');
INSERT INTO `sys_area` VALUES ('542426', '申扎县', '3', '542400', '1', '1');
INSERT INTO `sys_area` VALUES ('542427', '索县', '3', '542400', '1', '1');
INSERT INTO `sys_area` VALUES ('542428', '班戈县', '3', '542400', '1', '1');
INSERT INTO `sys_area` VALUES ('542429', '巴青县', '3', '542400', '1', '1');
INSERT INTO `sys_area` VALUES ('542430', '尼玛县', '3', '542400', '1', '1');
INSERT INTO `sys_area` VALUES ('542500', '阿里地区', '2', '540000', '1', null);
INSERT INTO `sys_area` VALUES ('542521', '普兰县', '3', '542500', '1', '1');
INSERT INTO `sys_area` VALUES ('542522', '札达县', '3', '542500', '1', '1');
INSERT INTO `sys_area` VALUES ('542523', '噶尔县', '3', '542500', '1', '1');
INSERT INTO `sys_area` VALUES ('542524', '日土县', '3', '542500', '1', '1');
INSERT INTO `sys_area` VALUES ('542525', '革吉县', '3', '542500', '1', '1');
INSERT INTO `sys_area` VALUES ('542526', '改则县', '3', '542500', '1', '1');
INSERT INTO `sys_area` VALUES ('542527', '措勤县', '3', '542500', '1', '1');
INSERT INTO `sys_area` VALUES ('542600', '林芝地区', '2', '540000', '1', null);
INSERT INTO `sys_area` VALUES ('542621', '林芝县', '3', '542600', '1', '1');
INSERT INTO `sys_area` VALUES ('542622', '工布江达县', '3', '542600', '1', '1');
INSERT INTO `sys_area` VALUES ('542623', '米林县', '3', '542600', '1', '1');
INSERT INTO `sys_area` VALUES ('542624', '墨脱县', '3', '542600', '1', '1');
INSERT INTO `sys_area` VALUES ('542625', '波密县', '3', '542600', '1', '1');
INSERT INTO `sys_area` VALUES ('542626', '察隅县', '3', '542600', '1', '1');
INSERT INTO `sys_area` VALUES ('542627', '朗县', '3', '542600', '1', '1');
INSERT INTO `sys_area` VALUES ('610000', '陕西省', '1', '0', '1', null);
INSERT INTO `sys_area` VALUES ('610100', '西安市', '2', '610000', '1', null);
INSERT INTO `sys_area` VALUES ('610101', '市辖区', '3', '610100', '0', '1');
INSERT INTO `sys_area` VALUES ('610102', '新城区', '3', '610100', '1', '1');
INSERT INTO `sys_area` VALUES ('610103', '碑林区', '3', '610100', '1', '1');
INSERT INTO `sys_area` VALUES ('610104', '莲湖区', '3', '610100', '1', '1');
INSERT INTO `sys_area` VALUES ('610111', '灞桥区', '3', '610100', '1', '1');
INSERT INTO `sys_area` VALUES ('610112', '未央区', '3', '610100', '1', '1');
INSERT INTO `sys_area` VALUES ('610113', '雁塔区', '3', '610100', '1', '1');
INSERT INTO `sys_area` VALUES ('610114', '阎良区', '3', '610100', '1', '1');
INSERT INTO `sys_area` VALUES ('610115', '临潼区', '3', '610100', '1', '1');
INSERT INTO `sys_area` VALUES ('610116', '长安区', '3', '610100', '1', '1');
INSERT INTO `sys_area` VALUES ('610122', '蓝田县', '3', '610100', '1', '1');
INSERT INTO `sys_area` VALUES ('610124', '周至县', '3', '610100', '1', '1');
INSERT INTO `sys_area` VALUES ('610125', '户县', '3', '610100', '1', '1');
INSERT INTO `sys_area` VALUES ('610126', '高陵县', '3', '610100', '1', '1');
INSERT INTO `sys_area` VALUES ('610200', '铜川市', '2', '610000', '1', null);
INSERT INTO `sys_area` VALUES ('610201', '市辖区', '3', '610200', '0', '1');
INSERT INTO `sys_area` VALUES ('610202', '王益区', '3', '610200', '1', '1');
INSERT INTO `sys_area` VALUES ('610203', '印台区', '3', '610200', '1', '1');
INSERT INTO `sys_area` VALUES ('610204', '耀州区', '3', '610200', '1', '1');
INSERT INTO `sys_area` VALUES ('610222', '宜君县', '3', '610200', '1', '1');
INSERT INTO `sys_area` VALUES ('610300', '宝鸡市', '2', '610000', '1', null);
INSERT INTO `sys_area` VALUES ('610301', '市辖区', '3', '610300', '0', '1');
INSERT INTO `sys_area` VALUES ('610302', '渭滨区', '3', '610300', '1', '1');
INSERT INTO `sys_area` VALUES ('610303', '金台区', '3', '610300', '1', '1');
INSERT INTO `sys_area` VALUES ('610304', '陈仓区', '3', '610300', '1', '1');
INSERT INTO `sys_area` VALUES ('610322', '凤翔县', '3', '610300', '1', '1');
INSERT INTO `sys_area` VALUES ('610323', '岐山县', '3', '610300', '1', '1');
INSERT INTO `sys_area` VALUES ('610324', '扶风县', '3', '610300', '1', '1');
INSERT INTO `sys_area` VALUES ('610326', '眉县', '3', '610300', '1', '1');
INSERT INTO `sys_area` VALUES ('610327', '陇县', '3', '610300', '1', '1');
INSERT INTO `sys_area` VALUES ('610328', '千阳县', '3', '610300', '1', '1');
INSERT INTO `sys_area` VALUES ('610329', '麟游县', '3', '610300', '1', '1');
INSERT INTO `sys_area` VALUES ('610330', '凤县', '3', '610300', '1', '1');
INSERT INTO `sys_area` VALUES ('610331', '太白县', '3', '610300', '1', '1');
INSERT INTO `sys_area` VALUES ('610400', '咸阳市', '2', '610000', '1', null);
INSERT INTO `sys_area` VALUES ('610401', '市辖区', '3', '610400', '0', '1');
INSERT INTO `sys_area` VALUES ('610402', '秦都区', '3', '610400', '1', '1');
INSERT INTO `sys_area` VALUES ('610403', '杨凌区', '3', '610400', '1', '1');
INSERT INTO `sys_area` VALUES ('610404', '渭城区', '3', '610400', '1', '1');
INSERT INTO `sys_area` VALUES ('610422', '三原县', '3', '610400', '1', '1');
INSERT INTO `sys_area` VALUES ('610423', '泾阳县', '3', '610400', '1', '1');
INSERT INTO `sys_area` VALUES ('610424', '乾县', '3', '610400', '1', '1');
INSERT INTO `sys_area` VALUES ('610425', '礼泉县', '3', '610400', '1', '1');
INSERT INTO `sys_area` VALUES ('610426', '永寿县', '3', '610400', '1', '1');
INSERT INTO `sys_area` VALUES ('610427', '彬县', '3', '610400', '1', '1');
INSERT INTO `sys_area` VALUES ('610428', '长武县', '3', '610400', '1', '1');
INSERT INTO `sys_area` VALUES ('610429', '旬邑县', '3', '610400', '1', '1');
INSERT INTO `sys_area` VALUES ('610430', '淳化县', '3', '610400', '1', '1');
INSERT INTO `sys_area` VALUES ('610431', '武功县', '3', '610400', '1', '1');
INSERT INTO `sys_area` VALUES ('610481', '兴平市', '3', '610400', '1', '1');
INSERT INTO `sys_area` VALUES ('610500', '渭南市', '2', '610000', '1', null);
INSERT INTO `sys_area` VALUES ('610501', '市辖区', '3', '610500', '0', '1');
INSERT INTO `sys_area` VALUES ('610502', '临渭区', '3', '610500', '1', '1');
INSERT INTO `sys_area` VALUES ('610521', '华县', '3', '610500', '1', '1');
INSERT INTO `sys_area` VALUES ('610522', '潼关县', '3', '610500', '1', '1');
INSERT INTO `sys_area` VALUES ('610523', '大荔县', '3', '610500', '1', '1');
INSERT INTO `sys_area` VALUES ('610524', '合阳县', '3', '610500', '1', '1');
INSERT INTO `sys_area` VALUES ('610525', '澄城县', '3', '610500', '1', '1');
INSERT INTO `sys_area` VALUES ('610526', '蒲城县', '3', '610500', '1', '1');
INSERT INTO `sys_area` VALUES ('610527', '白水县', '3', '610500', '1', '1');
INSERT INTO `sys_area` VALUES ('610528', '富平县', '3', '610500', '1', '1');
INSERT INTO `sys_area` VALUES ('610581', '韩城市', '3', '610500', '1', '1');
INSERT INTO `sys_area` VALUES ('610582', '华阴市', '3', '610500', '1', '1');
INSERT INTO `sys_area` VALUES ('610600', '延安市', '2', '610000', '1', null);
INSERT INTO `sys_area` VALUES ('610601', '市辖区', '3', '610600', '0', '1');
INSERT INTO `sys_area` VALUES ('610602', '宝塔区', '3', '610600', '1', '1');
INSERT INTO `sys_area` VALUES ('610621', '延长县', '3', '610600', '1', '1');
INSERT INTO `sys_area` VALUES ('610622', '延川县', '3', '610600', '1', '1');
INSERT INTO `sys_area` VALUES ('610623', '子长县', '3', '610600', '1', '1');
INSERT INTO `sys_area` VALUES ('610624', '安塞县', '3', '610600', '1', '1');
INSERT INTO `sys_area` VALUES ('610625', '志丹县', '3', '610600', '1', '1');
INSERT INTO `sys_area` VALUES ('610626', '吴起县', '3', '610600', '1', '1');
INSERT INTO `sys_area` VALUES ('610627', '甘泉县', '3', '610600', '1', '1');
INSERT INTO `sys_area` VALUES ('610628', '富县', '3', '610600', '1', '1');
INSERT INTO `sys_area` VALUES ('610629', '洛川县', '3', '610600', '1', '1');
INSERT INTO `sys_area` VALUES ('610630', '宜川县', '3', '610600', '1', '1');
INSERT INTO `sys_area` VALUES ('610631', '黄龙县', '3', '610600', '1', '1');
INSERT INTO `sys_area` VALUES ('610632', '黄陵县', '3', '610600', '1', '1');
INSERT INTO `sys_area` VALUES ('610700', '汉中市', '2', '610000', '1', null);
INSERT INTO `sys_area` VALUES ('610701', '市辖区', '3', '610700', '0', '1');
INSERT INTO `sys_area` VALUES ('610702', '汉台区', '3', '610700', '1', '1');
INSERT INTO `sys_area` VALUES ('610721', '南郑县', '3', '610700', '1', '1');
INSERT INTO `sys_area` VALUES ('610722', '城固县', '3', '610700', '1', '1');
INSERT INTO `sys_area` VALUES ('610723', '洋县', '3', '610700', '1', '1');
INSERT INTO `sys_area` VALUES ('610724', '西乡县', '3', '610700', '1', '1');
INSERT INTO `sys_area` VALUES ('610725', '勉县', '3', '610700', '1', '1');
INSERT INTO `sys_area` VALUES ('610726', '宁强县', '3', '610700', '1', '1');
INSERT INTO `sys_area` VALUES ('610727', '略阳县', '3', '610700', '1', '1');
INSERT INTO `sys_area` VALUES ('610728', '镇巴县', '3', '610700', '1', '1');
INSERT INTO `sys_area` VALUES ('610729', '留坝县', '3', '610700', '1', '1');
INSERT INTO `sys_area` VALUES ('610730', '佛坪县', '3', '610700', '1', '1');
INSERT INTO `sys_area` VALUES ('610800', '榆林市', '2', '610000', '1', null);
INSERT INTO `sys_area` VALUES ('610801', '市辖区', '3', '610800', '0', '1');
INSERT INTO `sys_area` VALUES ('610802', '榆阳区', '3', '610800', '1', '1');
INSERT INTO `sys_area` VALUES ('610821', '神木县', '3', '610800', '1', '1');
INSERT INTO `sys_area` VALUES ('610822', '府谷县', '3', '610800', '1', '1');
INSERT INTO `sys_area` VALUES ('610823', '横山县', '3', '610800', '1', '1');
INSERT INTO `sys_area` VALUES ('610824', '靖边县', '3', '610800', '1', '1');
INSERT INTO `sys_area` VALUES ('610825', '定边县', '3', '610800', '1', '1');
INSERT INTO `sys_area` VALUES ('610826', '绥德县', '3', '610800', '1', '1');
INSERT INTO `sys_area` VALUES ('610827', '米脂县', '3', '610800', '1', '1');
INSERT INTO `sys_area` VALUES ('610828', '佳县', '3', '610800', '1', '1');
INSERT INTO `sys_area` VALUES ('610829', '吴堡县', '3', '610800', '1', '1');
INSERT INTO `sys_area` VALUES ('610830', '清涧县', '3', '610800', '1', '1');
INSERT INTO `sys_area` VALUES ('610831', '子洲县', '3', '610800', '1', '1');
INSERT INTO `sys_area` VALUES ('610900', '安康市', '2', '610000', '1', null);
INSERT INTO `sys_area` VALUES ('610901', '市辖区', '3', '610900', '0', '1');
INSERT INTO `sys_area` VALUES ('610902', '汉滨区', '3', '610900', '1', '1');
INSERT INTO `sys_area` VALUES ('610921', '汉阴县', '3', '610900', '1', '1');
INSERT INTO `sys_area` VALUES ('610922', '石泉县', '3', '610900', '1', '1');
INSERT INTO `sys_area` VALUES ('610923', '宁陕县', '3', '610900', '1', '1');
INSERT INTO `sys_area` VALUES ('610924', '紫阳县', '3', '610900', '1', '1');
INSERT INTO `sys_area` VALUES ('610925', '岚皋县', '3', '610900', '1', '1');
INSERT INTO `sys_area` VALUES ('610926', '平利县', '3', '610900', '1', '1');
INSERT INTO `sys_area` VALUES ('610927', '镇坪县', '3', '610900', '1', '1');
INSERT INTO `sys_area` VALUES ('610928', '旬阳县', '3', '610900', '1', '1');
INSERT INTO `sys_area` VALUES ('610929', '白河县', '3', '610900', '1', '1');
INSERT INTO `sys_area` VALUES ('611000', '商洛市', '2', '610000', '1', null);
INSERT INTO `sys_area` VALUES ('611001', '市辖区', '3', '611000', '0', '1');
INSERT INTO `sys_area` VALUES ('611002', '商州区', '3', '611000', '1', '1');
INSERT INTO `sys_area` VALUES ('611021', '洛南县', '3', '611000', '1', '1');
INSERT INTO `sys_area` VALUES ('611022', '丹凤县', '3', '611000', '1', '1');
INSERT INTO `sys_area` VALUES ('611023', '商南县', '3', '611000', '1', '1');
INSERT INTO `sys_area` VALUES ('611024', '山阳县', '3', '611000', '1', '1');
INSERT INTO `sys_area` VALUES ('611025', '镇安县', '3', '611000', '1', '1');
INSERT INTO `sys_area` VALUES ('611026', '柞水县', '3', '611000', '1', '1');
INSERT INTO `sys_area` VALUES ('620000', '甘肃省', '1', '0', '1', null);
INSERT INTO `sys_area` VALUES ('620100', '兰州市', '2', '620000', '1', null);
INSERT INTO `sys_area` VALUES ('620101', '市辖区', '3', '620100', '0', '1');
INSERT INTO `sys_area` VALUES ('620102', '城关区', '3', '620100', '1', '1');
INSERT INTO `sys_area` VALUES ('620103', '七里河区', '3', '620100', '1', '1');
INSERT INTO `sys_area` VALUES ('620104', '西固区', '3', '620100', '1', '1');
INSERT INTO `sys_area` VALUES ('620105', '安宁区', '3', '620100', '1', '1');
INSERT INTO `sys_area` VALUES ('620111', '红古区', '3', '620100', '1', '1');
INSERT INTO `sys_area` VALUES ('620121', '永登县', '3', '620100', '1', '1');
INSERT INTO `sys_area` VALUES ('620122', '皋兰县', '3', '620100', '1', '1');
INSERT INTO `sys_area` VALUES ('620123', '榆中县', '3', '620100', '1', '1');
INSERT INTO `sys_area` VALUES ('620200', '嘉峪关市', '2', '620000', '1', null);
INSERT INTO `sys_area` VALUES ('620201', '市辖区', '3', '620200', '0', '1');
INSERT INTO `sys_area` VALUES ('620300', '金昌市', '2', '620000', '1', null);
INSERT INTO `sys_area` VALUES ('620301', '市辖区', '3', '620300', '0', '1');
INSERT INTO `sys_area` VALUES ('620302', '金川区', '3', '620300', '1', '1');
INSERT INTO `sys_area` VALUES ('620321', '永昌县', '3', '620300', '1', '1');
INSERT INTO `sys_area` VALUES ('620400', '白银市', '2', '620000', '1', null);
INSERT INTO `sys_area` VALUES ('620401', '市辖区', '3', '620400', '0', '1');
INSERT INTO `sys_area` VALUES ('620402', '白银区', '3', '620400', '1', '1');
INSERT INTO `sys_area` VALUES ('620403', '平川区', '3', '620400', '1', '1');
INSERT INTO `sys_area` VALUES ('620421', '靖远县', '3', '620400', '1', '1');
INSERT INTO `sys_area` VALUES ('620422', '会宁县', '3', '620400', '1', '1');
INSERT INTO `sys_area` VALUES ('620423', '景泰县', '3', '620400', '1', '1');
INSERT INTO `sys_area` VALUES ('620500', '天水市', '2', '620000', '1', null);
INSERT INTO `sys_area` VALUES ('620501', '市辖区', '3', '620500', '0', '1');
INSERT INTO `sys_area` VALUES ('620502', '秦州区', '3', '620500', '1', '1');
INSERT INTO `sys_area` VALUES ('620503', '麦积区', '3', '620500', '1', '1');
INSERT INTO `sys_area` VALUES ('620521', '清水县', '3', '620500', '1', '1');
INSERT INTO `sys_area` VALUES ('620522', '秦安县', '3', '620500', '1', '1');
INSERT INTO `sys_area` VALUES ('620523', '甘谷县', '3', '620500', '1', '1');
INSERT INTO `sys_area` VALUES ('620524', '武山县', '3', '620500', '1', '1');
INSERT INTO `sys_area` VALUES ('620525', '张家川回族自治县', '3', '620500', '1', '1');
INSERT INTO `sys_area` VALUES ('620600', '武威市', '2', '620000', '1', null);
INSERT INTO `sys_area` VALUES ('620601', '市辖区', '3', '620600', '0', '1');
INSERT INTO `sys_area` VALUES ('620602', '凉州区', '3', '620600', '1', '1');
INSERT INTO `sys_area` VALUES ('620621', '民勤县', '3', '620600', '1', '1');
INSERT INTO `sys_area` VALUES ('620622', '古浪县', '3', '620600', '1', '1');
INSERT INTO `sys_area` VALUES ('620623', '天祝藏族自治县', '3', '620600', '1', '1');
INSERT INTO `sys_area` VALUES ('620700', '张掖市', '2', '620000', '1', null);
INSERT INTO `sys_area` VALUES ('620701', '市辖区', '3', '620700', '0', '1');
INSERT INTO `sys_area` VALUES ('620702', '甘州区', '3', '620700', '1', '1');
INSERT INTO `sys_area` VALUES ('620721', '肃南裕固族自治县', '3', '620700', '1', '1');
INSERT INTO `sys_area` VALUES ('620722', '民乐县', '3', '620700', '1', '1');
INSERT INTO `sys_area` VALUES ('620723', '临泽县', '3', '620700', '1', '1');
INSERT INTO `sys_area` VALUES ('620724', '高台县', '3', '620700', '1', '1');
INSERT INTO `sys_area` VALUES ('620725', '山丹县', '3', '620700', '1', '1');
INSERT INTO `sys_area` VALUES ('620800', '平凉市', '2', '620000', '1', null);
INSERT INTO `sys_area` VALUES ('620801', '市辖区', '3', '620800', '0', '1');
INSERT INTO `sys_area` VALUES ('620802', '崆峒区', '3', '620800', '1', '1');
INSERT INTO `sys_area` VALUES ('620821', '泾川县', '3', '620800', '1', '1');
INSERT INTO `sys_area` VALUES ('620822', '灵台县', '3', '620800', '1', '1');
INSERT INTO `sys_area` VALUES ('620823', '崇信县', '3', '620800', '1', '1');
INSERT INTO `sys_area` VALUES ('620824', '华亭县', '3', '620800', '1', '1');
INSERT INTO `sys_area` VALUES ('620825', '庄浪县', '3', '620800', '1', '1');
INSERT INTO `sys_area` VALUES ('620826', '静宁县', '3', '620800', '1', '1');
INSERT INTO `sys_area` VALUES ('620900', '酒泉市', '2', '620000', '1', null);
INSERT INTO `sys_area` VALUES ('620901', '市辖区', '3', '620900', '0', '1');
INSERT INTO `sys_area` VALUES ('620902', '肃州区', '3', '620900', '1', '1');
INSERT INTO `sys_area` VALUES ('620921', '金塔县', '3', '620900', '1', '1');
INSERT INTO `sys_area` VALUES ('620922', '瓜州县', '3', '620900', '1', '1');
INSERT INTO `sys_area` VALUES ('620923', '肃北蒙古族自治县', '3', '620900', '1', '1');
INSERT INTO `sys_area` VALUES ('620924', '阿克塞哈萨克族自治县', '3', '620900', '1', '1');
INSERT INTO `sys_area` VALUES ('620981', '玉门市', '3', '620900', '1', '1');
INSERT INTO `sys_area` VALUES ('620982', '敦煌市', '3', '620900', '1', '1');
INSERT INTO `sys_area` VALUES ('621000', '庆阳市', '2', '620000', '1', null);
INSERT INTO `sys_area` VALUES ('621001', '市辖区', '3', '621000', '0', '1');
INSERT INTO `sys_area` VALUES ('621002', '西峰区', '3', '621000', '1', '1');
INSERT INTO `sys_area` VALUES ('621021', '庆城县', '3', '621000', '1', '1');
INSERT INTO `sys_area` VALUES ('621022', '环县', '3', '621000', '1', '1');
INSERT INTO `sys_area` VALUES ('621023', '华池县', '3', '621000', '1', '1');
INSERT INTO `sys_area` VALUES ('621024', '合水县', '3', '621000', '1', '1');
INSERT INTO `sys_area` VALUES ('621025', '正宁县', '3', '621000', '1', '1');
INSERT INTO `sys_area` VALUES ('621026', '宁县', '3', '621000', '1', '1');
INSERT INTO `sys_area` VALUES ('621027', '镇原县', '3', '621000', '1', '1');
INSERT INTO `sys_area` VALUES ('621100', '定西市', '2', '620000', '1', null);
INSERT INTO `sys_area` VALUES ('621101', '市辖区', '3', '621100', '0', '1');
INSERT INTO `sys_area` VALUES ('621102', '安定区', '3', '621100', '1', '1');
INSERT INTO `sys_area` VALUES ('621121', '通渭县', '3', '621100', '1', '1');
INSERT INTO `sys_area` VALUES ('621122', '陇西县', '3', '621100', '1', '1');
INSERT INTO `sys_area` VALUES ('621123', '渭源县', '3', '621100', '1', '1');
INSERT INTO `sys_area` VALUES ('621124', '临洮县', '3', '621100', '1', '1');
INSERT INTO `sys_area` VALUES ('621125', '漳县', '3', '621100', '1', '1');
INSERT INTO `sys_area` VALUES ('621126', '岷县', '3', '621100', '1', '1');
INSERT INTO `sys_area` VALUES ('621200', '陇南市', '2', '620000', '1', null);
INSERT INTO `sys_area` VALUES ('621201', '市辖区', '3', '621200', '0', '1');
INSERT INTO `sys_area` VALUES ('621202', '武都区', '3', '621200', '1', '1');
INSERT INTO `sys_area` VALUES ('621221', '成县', '3', '621200', '1', '1');
INSERT INTO `sys_area` VALUES ('621222', '文县', '3', '621200', '1', '1');
INSERT INTO `sys_area` VALUES ('621223', '宕昌县', '3', '621200', '1', '1');
INSERT INTO `sys_area` VALUES ('621224', '康县', '3', '621200', '1', '1');
INSERT INTO `sys_area` VALUES ('621225', '西和县', '3', '621200', '1', '1');
INSERT INTO `sys_area` VALUES ('621226', '礼县', '3', '621200', '1', '1');
INSERT INTO `sys_area` VALUES ('621227', '徽县', '3', '621200', '1', '1');
INSERT INTO `sys_area` VALUES ('621228', '两当县', '3', '621200', '1', '1');
INSERT INTO `sys_area` VALUES ('622900', '临夏回族自治州', '2', '620000', '1', null);
INSERT INTO `sys_area` VALUES ('622901', '临夏市', '3', '622900', '1', '1');
INSERT INTO `sys_area` VALUES ('622921', '临夏县', '3', '622900', '1', '1');
INSERT INTO `sys_area` VALUES ('622922', '康乐县', '3', '622900', '1', '1');
INSERT INTO `sys_area` VALUES ('622923', '永靖县', '3', '622900', '1', '1');
INSERT INTO `sys_area` VALUES ('622924', '广河县', '3', '622900', '1', '1');
INSERT INTO `sys_area` VALUES ('622925', '和政县', '3', '622900', '1', '1');
INSERT INTO `sys_area` VALUES ('622926', '东乡族自治县', '3', '622900', '1', '1');
INSERT INTO `sys_area` VALUES ('622927', '积石山保安族东乡族撒拉族自治县', '3', '622900', '1', '1');
INSERT INTO `sys_area` VALUES ('623000', '甘南藏族自治州', '2', '620000', '1', null);
INSERT INTO `sys_area` VALUES ('623001', '合作市', '3', '623000', '1', '1');
INSERT INTO `sys_area` VALUES ('623021', '临潭县', '3', '623000', '1', '1');
INSERT INTO `sys_area` VALUES ('623022', '卓尼县', '3', '623000', '1', '1');
INSERT INTO `sys_area` VALUES ('623023', '舟曲县', '3', '623000', '1', '1');
INSERT INTO `sys_area` VALUES ('623024', '迭部县', '3', '623000', '1', '1');
INSERT INTO `sys_area` VALUES ('623025', '玛曲县', '3', '623000', '1', '1');
INSERT INTO `sys_area` VALUES ('623026', '碌曲县', '3', '623000', '1', '1');
INSERT INTO `sys_area` VALUES ('623027', '夏河县', '3', '623000', '1', '1');
INSERT INTO `sys_area` VALUES ('630000', '青海省', '1', '0', '1', null);
INSERT INTO `sys_area` VALUES ('630100', '西宁市', '2', '630000', '1', null);
INSERT INTO `sys_area` VALUES ('630101', '市辖区', '3', '630100', '0', '1');
INSERT INTO `sys_area` VALUES ('630102', '城东区', '3', '630100', '1', '1');
INSERT INTO `sys_area` VALUES ('630103', '城中区', '3', '630100', '1', '1');
INSERT INTO `sys_area` VALUES ('630104', '城西区', '3', '630100', '1', '1');
INSERT INTO `sys_area` VALUES ('630105', '城北区', '3', '630100', '1', '1');
INSERT INTO `sys_area` VALUES ('630121', '大通回族土族自治县', '3', '630100', '1', '1');
INSERT INTO `sys_area` VALUES ('630122', '湟中县', '3', '630100', '1', '1');
INSERT INTO `sys_area` VALUES ('630123', '湟源县', '3', '630100', '1', '1');
INSERT INTO `sys_area` VALUES ('632100', '海东地区', '2', '630000', '1', null);
INSERT INTO `sys_area` VALUES ('632121', '平安县', '3', '632100', '1', '1');
INSERT INTO `sys_area` VALUES ('632122', '民和回族土族自治县', '3', '632100', '1', '1');
INSERT INTO `sys_area` VALUES ('632123', '乐都县', '3', '632100', '1', '1');
INSERT INTO `sys_area` VALUES ('632126', '互助土族自治县', '3', '632100', '1', '1');
INSERT INTO `sys_area` VALUES ('632127', '化隆回族自治县', '3', '632100', '1', '1');
INSERT INTO `sys_area` VALUES ('632128', '循化撒拉族自治县', '3', '632100', '1', '1');
INSERT INTO `sys_area` VALUES ('632200', '海北藏族自治州', '2', '630000', '1', null);
INSERT INTO `sys_area` VALUES ('632221', '门源回族自治县', '3', '632200', '1', '1');
INSERT INTO `sys_area` VALUES ('632222', '祁连县', '3', '632200', '1', '1');
INSERT INTO `sys_area` VALUES ('632223', '海晏县', '3', '632200', '1', '1');
INSERT INTO `sys_area` VALUES ('632224', '刚察县', '3', '632200', '1', '1');
INSERT INTO `sys_area` VALUES ('632300', '黄南藏族自治州', '2', '630000', '1', null);
INSERT INTO `sys_area` VALUES ('632321', '同仁县', '3', '632300', '1', '1');
INSERT INTO `sys_area` VALUES ('632322', '尖扎县', '3', '632300', '1', '1');
INSERT INTO `sys_area` VALUES ('632323', '泽库县', '3', '632300', '1', '1');
INSERT INTO `sys_area` VALUES ('632324', '河南蒙古族自治县', '3', '632300', '1', '1');
INSERT INTO `sys_area` VALUES ('632500', '海南藏族自治州', '2', '630000', '1', null);
INSERT INTO `sys_area` VALUES ('632521', '共和县', '3', '632500', '1', '1');
INSERT INTO `sys_area` VALUES ('632522', '同德县', '3', '632500', '1', '1');
INSERT INTO `sys_area` VALUES ('632523', '贵德县', '3', '632500', '1', '1');
INSERT INTO `sys_area` VALUES ('632524', '兴海县', '3', '632500', '1', '1');
INSERT INTO `sys_area` VALUES ('632525', '贵南县', '3', '632500', '1', '1');
INSERT INTO `sys_area` VALUES ('632600', '果洛藏族自治州', '2', '630000', '1', null);
INSERT INTO `sys_area` VALUES ('632621', '玛沁县', '3', '632600', '1', '1');
INSERT INTO `sys_area` VALUES ('632622', '班玛县', '3', '632600', '1', '1');
INSERT INTO `sys_area` VALUES ('632623', '甘德县', '3', '632600', '1', '1');
INSERT INTO `sys_area` VALUES ('632624', '达日县', '3', '632600', '1', '1');
INSERT INTO `sys_area` VALUES ('632625', '久治县', '3', '632600', '1', '1');
INSERT INTO `sys_area` VALUES ('632626', '玛多县', '3', '632600', '1', '1');
INSERT INTO `sys_area` VALUES ('632700', '玉树藏族自治州', '2', '630000', '1', null);
INSERT INTO `sys_area` VALUES ('632721', '玉树县', '3', '632700', '1', '1');
INSERT INTO `sys_area` VALUES ('632722', '杂多县', '3', '632700', '1', '1');
INSERT INTO `sys_area` VALUES ('632723', '称多县', '3', '632700', '1', '1');
INSERT INTO `sys_area` VALUES ('632724', '治多县', '3', '632700', '1', '1');
INSERT INTO `sys_area` VALUES ('632725', '囊谦县', '3', '632700', '1', '1');
INSERT INTO `sys_area` VALUES ('632726', '曲麻莱县', '3', '632700', '1', '1');
INSERT INTO `sys_area` VALUES ('632800', '海西蒙古族藏族自治州', '2', '630000', '1', null);
INSERT INTO `sys_area` VALUES ('632801', '格尔木市', '3', '632800', '1', '1');
INSERT INTO `sys_area` VALUES ('632802', '德令哈市', '3', '632800', '1', '1');
INSERT INTO `sys_area` VALUES ('632821', '乌兰县', '3', '632800', '1', '1');
INSERT INTO `sys_area` VALUES ('632822', '都兰县', '3', '632800', '1', '1');
INSERT INTO `sys_area` VALUES ('632823', '天峻县', '3', '632800', '1', '1');
INSERT INTO `sys_area` VALUES ('640000', '宁夏回族自治区', '1', '0', '1', null);
INSERT INTO `sys_area` VALUES ('640100', '银川市', '2', '640000', '1', null);
INSERT INTO `sys_area` VALUES ('640101', '市辖区', '3', '640100', '0', '1');
INSERT INTO `sys_area` VALUES ('640104', '兴庆区', '3', '640100', '1', '1');
INSERT INTO `sys_area` VALUES ('640105', '西夏区', '3', '640100', '1', '1');
INSERT INTO `sys_area` VALUES ('640106', '金凤区', '3', '640100', '1', '1');
INSERT INTO `sys_area` VALUES ('640121', '永宁县', '3', '640100', '1', '1');
INSERT INTO `sys_area` VALUES ('640122', '贺兰县', '3', '640100', '1', '1');
INSERT INTO `sys_area` VALUES ('640181', '灵武市', '3', '640100', '1', '1');
INSERT INTO `sys_area` VALUES ('640200', '石嘴山市', '2', '640000', '1', null);
INSERT INTO `sys_area` VALUES ('640201', '市辖区', '3', '640200', '0', '1');
INSERT INTO `sys_area` VALUES ('640202', '大武口区', '3', '640200', '1', '1');
INSERT INTO `sys_area` VALUES ('640205', '惠农区', '3', '640200', '1', '1');
INSERT INTO `sys_area` VALUES ('640221', '平罗县', '3', '640200', '1', '1');
INSERT INTO `sys_area` VALUES ('640300', '吴忠市', '2', '640000', '1', null);
INSERT INTO `sys_area` VALUES ('640301', '市辖区', '3', '640300', '0', '1');
INSERT INTO `sys_area` VALUES ('640302', '利通区', '3', '640300', '1', '1');
INSERT INTO `sys_area` VALUES ('640323', '盐池县', '3', '640300', '1', '1');
INSERT INTO `sys_area` VALUES ('640324', '同心县', '3', '640300', '1', '1');
INSERT INTO `sys_area` VALUES ('640381', '青铜峡市', '3', '640300', '1', '1');
INSERT INTO `sys_area` VALUES ('640400', '固原市', '2', '640000', '1', null);
INSERT INTO `sys_area` VALUES ('640401', '市辖区', '3', '640400', '0', '1');
INSERT INTO `sys_area` VALUES ('640402', '原州区', '3', '640400', '1', '1');
INSERT INTO `sys_area` VALUES ('640422', '西吉县', '3', '640400', '1', '1');
INSERT INTO `sys_area` VALUES ('640423', '隆德县', '3', '640400', '1', '1');
INSERT INTO `sys_area` VALUES ('640424', '泾源县', '3', '640400', '1', '1');
INSERT INTO `sys_area` VALUES ('640425', '彭阳县', '3', '640400', '1', '1');
INSERT INTO `sys_area` VALUES ('640500', '中卫市', '2', '640000', '1', null);
INSERT INTO `sys_area` VALUES ('640501', '市辖区', '3', '640500', '0', '1');
INSERT INTO `sys_area` VALUES ('640502', '沙坡头区', '3', '640500', '1', '1');
INSERT INTO `sys_area` VALUES ('640521', '中宁县', '3', '640500', '1', '1');
INSERT INTO `sys_area` VALUES ('640522', '海原县', '3', '640500', '1', '1');
INSERT INTO `sys_area` VALUES ('650000', '新疆维吾尔自治区', '1', '0', '1', null);
INSERT INTO `sys_area` VALUES ('650100', '乌鲁木齐市', '2', '650000', '1', null);
INSERT INTO `sys_area` VALUES ('650101', '市辖区', '3', '650100', '0', '1');
INSERT INTO `sys_area` VALUES ('650102', '天山区', '3', '650100', '1', '1');
INSERT INTO `sys_area` VALUES ('650103', '沙依巴克区', '3', '650100', '1', '1');
INSERT INTO `sys_area` VALUES ('650104', '新市区', '3', '650100', '1', '1');
INSERT INTO `sys_area` VALUES ('650105', '水磨沟区', '3', '650100', '1', '1');
INSERT INTO `sys_area` VALUES ('650106', '头屯河区', '3', '650100', '1', '1');
INSERT INTO `sys_area` VALUES ('650107', '达坂城区', '3', '650100', '1', '1');
INSERT INTO `sys_area` VALUES ('650109', '米东区', '3', '650100', '1', '1');
INSERT INTO `sys_area` VALUES ('650121', '乌鲁木齐县', '3', '650100', '1', '1');
INSERT INTO `sys_area` VALUES ('650200', '克拉玛依市', '2', '650000', '1', null);
INSERT INTO `sys_area` VALUES ('650201', '市辖区', '3', '650200', '0', '1');
INSERT INTO `sys_area` VALUES ('650202', '独山子区', '3', '650200', '1', '1');
INSERT INTO `sys_area` VALUES ('650203', '克拉玛依区', '3', '650200', '1', '1');
INSERT INTO `sys_area` VALUES ('650204', '白碱滩区', '3', '650200', '1', '1');
INSERT INTO `sys_area` VALUES ('650205', '乌尔禾区', '3', '650200', '1', '1');
INSERT INTO `sys_area` VALUES ('652100', '吐鲁番地区', '2', '650000', '1', null);
INSERT INTO `sys_area` VALUES ('652101', '吐鲁番市', '3', '652100', '1', '1');
INSERT INTO `sys_area` VALUES ('652122', '鄯善县', '3', '652100', '1', '1');
INSERT INTO `sys_area` VALUES ('652123', '托克逊县', '3', '652100', '1', '1');
INSERT INTO `sys_area` VALUES ('652200', '哈密地区', '2', '650000', '1', null);
INSERT INTO `sys_area` VALUES ('652201', '哈密市', '3', '652200', '1', '1');
INSERT INTO `sys_area` VALUES ('652222', '巴里坤哈萨克自治县', '3', '652200', '1', '1');
INSERT INTO `sys_area` VALUES ('652223', '伊吾县', '3', '652200', '1', '1');
INSERT INTO `sys_area` VALUES ('652300', '昌吉回族自治州', '2', '650000', '1', null);
INSERT INTO `sys_area` VALUES ('652301', '昌吉市', '3', '652300', '1', '1');
INSERT INTO `sys_area` VALUES ('652302', '阜康市', '3', '652300', '1', '1');
INSERT INTO `sys_area` VALUES ('652323', '呼图壁县', '3', '652300', '1', '1');
INSERT INTO `sys_area` VALUES ('652324', '玛纳斯县', '3', '652300', '1', '1');
INSERT INTO `sys_area` VALUES ('652325', '奇台县', '3', '652300', '1', '1');
INSERT INTO `sys_area` VALUES ('652327', '吉木萨尔县', '3', '652300', '1', '1');
INSERT INTO `sys_area` VALUES ('652328', '木垒哈萨克自治县', '3', '652300', '1', '1');
INSERT INTO `sys_area` VALUES ('652700', '博尔塔拉蒙古自治州', '2', '650000', '1', null);
INSERT INTO `sys_area` VALUES ('652701', '博乐市', '3', '652700', '1', '1');
INSERT INTO `sys_area` VALUES ('652722', '精河县', '3', '652700', '1', '1');
INSERT INTO `sys_area` VALUES ('652723', '温泉县', '3', '652700', '1', '1');
INSERT INTO `sys_area` VALUES ('652800', '巴音郭楞蒙古自治州', '2', '650000', '1', null);
INSERT INTO `sys_area` VALUES ('652801', '库尔勒市', '3', '652800', '1', '1');
INSERT INTO `sys_area` VALUES ('652822', '轮台县', '3', '652800', '1', '1');
INSERT INTO `sys_area` VALUES ('652823', '尉犁县', '3', '652800', '1', '1');
INSERT INTO `sys_area` VALUES ('652824', '若羌县', '3', '652800', '1', '1');
INSERT INTO `sys_area` VALUES ('652825', '且末县', '3', '652800', '1', '1');
INSERT INTO `sys_area` VALUES ('652826', '焉耆回族自治县', '3', '652800', '1', '1');
INSERT INTO `sys_area` VALUES ('652827', '和静县', '3', '652800', '1', '1');
INSERT INTO `sys_area` VALUES ('652828', '和硕县', '3', '652800', '1', '1');
INSERT INTO `sys_area` VALUES ('652829', '博湖县', '3', '652800', '1', '1');
INSERT INTO `sys_area` VALUES ('652900', '阿克苏地区', '2', '650000', '1', null);
INSERT INTO `sys_area` VALUES ('652901', '阿克苏市', '3', '652900', '1', '1');
INSERT INTO `sys_area` VALUES ('652922', '温宿县', '3', '652900', '1', '1');
INSERT INTO `sys_area` VALUES ('652923', '库车县', '3', '652900', '1', '1');
INSERT INTO `sys_area` VALUES ('652924', '沙雅县', '3', '652900', '1', '1');
INSERT INTO `sys_area` VALUES ('652925', '新和县', '3', '652900', '1', '1');
INSERT INTO `sys_area` VALUES ('652926', '拜城县', '3', '652900', '1', '1');
INSERT INTO `sys_area` VALUES ('652927', '乌什县', '3', '652900', '1', '1');
INSERT INTO `sys_area` VALUES ('652928', '阿瓦提县', '3', '652900', '1', '1');
INSERT INTO `sys_area` VALUES ('652929', '柯坪县', '3', '652900', '1', '1');
INSERT INTO `sys_area` VALUES ('653000', '克孜勒苏柯尔克孜自治州', '2', '650000', '1', null);
INSERT INTO `sys_area` VALUES ('653001', '阿图什市', '3', '653000', '1', '1');
INSERT INTO `sys_area` VALUES ('653022', '阿克陶县', '3', '653000', '1', '1');
INSERT INTO `sys_area` VALUES ('653023', '阿合奇县', '3', '653000', '1', '1');
INSERT INTO `sys_area` VALUES ('653024', '乌恰县', '3', '653000', '1', '1');
INSERT INTO `sys_area` VALUES ('653100', '喀什地区', '2', '650000', '1', null);
INSERT INTO `sys_area` VALUES ('653101', '喀什市', '3', '653100', '1', '1');
INSERT INTO `sys_area` VALUES ('653121', '疏附县', '3', '653100', '1', '1');
INSERT INTO `sys_area` VALUES ('653122', '疏勒县', '3', '653100', '1', '1');
INSERT INTO `sys_area` VALUES ('653123', '英吉沙县', '3', '653100', '1', '1');
INSERT INTO `sys_area` VALUES ('653124', '泽普县', '3', '653100', '1', '1');
INSERT INTO `sys_area` VALUES ('653125', '莎车县', '3', '653100', '1', '1');
INSERT INTO `sys_area` VALUES ('653126', '叶城县', '3', '653100', '1', '1');
INSERT INTO `sys_area` VALUES ('653127', '麦盖提县', '3', '653100', '1', '1');
INSERT INTO `sys_area` VALUES ('653128', '岳普湖县', '3', '653100', '1', '1');
INSERT INTO `sys_area` VALUES ('653129', '伽师县', '3', '653100', '1', '1');
INSERT INTO `sys_area` VALUES ('653130', '巴楚县', '3', '653100', '1', '1');
INSERT INTO `sys_area` VALUES ('653131', '塔什库尔干塔吉克自治县', '3', '653100', '1', '1');
INSERT INTO `sys_area` VALUES ('653200', '和田地区', '2', '650000', '1', null);
INSERT INTO `sys_area` VALUES ('653201', '和田市', '3', '653200', '1', '1');
INSERT INTO `sys_area` VALUES ('653221', '和田县', '3', '653200', '1', '1');
INSERT INTO `sys_area` VALUES ('653222', '墨玉县', '3', '653200', '1', '1');
INSERT INTO `sys_area` VALUES ('653223', '皮山县', '3', '653200', '1', '1');
INSERT INTO `sys_area` VALUES ('653224', '洛浦县', '3', '653200', '1', '1');
INSERT INTO `sys_area` VALUES ('653225', '策勒县', '3', '653200', '1', '1');
INSERT INTO `sys_area` VALUES ('653226', '于田县', '3', '653200', '1', '1');
INSERT INTO `sys_area` VALUES ('653227', '民丰县', '3', '653200', '1', '1');
INSERT INTO `sys_area` VALUES ('654000', '伊犁哈萨克自治州', '2', '650000', '1', null);
INSERT INTO `sys_area` VALUES ('654002', '伊宁市', '3', '654000', '1', '1');
INSERT INTO `sys_area` VALUES ('654003', '奎屯市', '3', '654000', '1', '1');
INSERT INTO `sys_area` VALUES ('654021', '伊宁县', '3', '654000', '1', '1');
INSERT INTO `sys_area` VALUES ('654022', '察布查尔锡伯自治县', '3', '654000', '1', '1');
INSERT INTO `sys_area` VALUES ('654023', '霍城县', '3', '654000', '1', '1');
INSERT INTO `sys_area` VALUES ('654024', '巩留县', '3', '654000', '1', '1');
INSERT INTO `sys_area` VALUES ('654025', '新源县', '3', '654000', '1', '1');
INSERT INTO `sys_area` VALUES ('654026', '昭苏县', '3', '654000', '1', '1');
INSERT INTO `sys_area` VALUES ('654027', '特克斯县', '3', '654000', '1', '1');
INSERT INTO `sys_area` VALUES ('654028', '尼勒克县', '3', '654000', '1', '1');
INSERT INTO `sys_area` VALUES ('654200', '塔城地区', '2', '650000', '1', null);
INSERT INTO `sys_area` VALUES ('654201', '塔城市', '3', '654200', '1', '1');
INSERT INTO `sys_area` VALUES ('654202', '乌苏市', '3', '654200', '1', '1');
INSERT INTO `sys_area` VALUES ('654221', '额敏县', '3', '654200', '1', '1');
INSERT INTO `sys_area` VALUES ('654223', '沙湾县', '3', '654200', '1', '1');
INSERT INTO `sys_area` VALUES ('654224', '托里县', '3', '654200', '1', '1');
INSERT INTO `sys_area` VALUES ('654225', '裕民县', '3', '654200', '1', '1');
INSERT INTO `sys_area` VALUES ('654226', '和布克赛尔蒙古自治县', '3', '654200', '1', '1');
INSERT INTO `sys_area` VALUES ('654300', '阿勒泰地区', '2', '650000', '1', null);
INSERT INTO `sys_area` VALUES ('654301', '阿勒泰市', '3', '654300', '1', '1');
INSERT INTO `sys_area` VALUES ('654321', '布尔津县', '3', '654300', '1', '1');
INSERT INTO `sys_area` VALUES ('654322', '富蕴县', '3', '654300', '1', '1');
INSERT INTO `sys_area` VALUES ('654323', '福海县', '3', '654300', '1', '1');
INSERT INTO `sys_area` VALUES ('654324', '哈巴河县', '3', '654300', '1', '1');
INSERT INTO `sys_area` VALUES ('654325', '青河县', '3', '654300', '1', '1');
INSERT INTO `sys_area` VALUES ('654326', '吉木乃县', '3', '654300', '1', '1');
INSERT INTO `sys_area` VALUES ('659000', '自治区直辖县级行政单位', '2', '650000', '1', null);
INSERT INTO `sys_area` VALUES ('659001', '石河子市', '3', '659000', '1', '1');
INSERT INTO `sys_area` VALUES ('659002', '阿拉尔市', '3', '659000', '1', '1');
INSERT INTO `sys_area` VALUES ('659003', '图木舒克市', '3', '659000', '1', '1');
INSERT INTO `sys_area` VALUES ('659004', '五家渠市', '3', '659000', '1', '1');
INSERT INTO `sys_area` VALUES ('710000', '台湾省', '1', '0', '1', '1');
INSERT INTO `sys_area` VALUES ('810000', '香港特别行政区', '1', '0', '1', '1');
INSERT INTO `sys_area` VALUES ('820000', '澳门特别行政区', '1', '0', '1', '1');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `param_key` varchar(50) DEFAULT NULL COMMENT 'key',
  `param_value` varchar(2000) DEFAULT NULL COMMENT 'value',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态   0：隐藏   1：显示',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `param_key` (`param_key`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='系统配置信息表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('1', 'CLOUD_STORAGE_CONFIG_KEY', '{\"aliyunAccessKeyId\":\"\",\"aliyunAccessKeySecret\":\"\",\"aliyunBucketName\":\"\",\"aliyunDomain\":\"\",\"aliyunEndPoint\":\"\",\"aliyunPrefix\":\"\",\"qcloudBucketName\":\"\",\"qcloudDomain\":\"\",\"qcloudPrefix\":\"\",\"qcloudSecretId\":\"\",\"qcloudSecretKey\":\"\",\"qiniuAccessKey\":\"NrgMfABZxWLo5B-YYSjoE8-AZ1EISdi1Z3ubLOeZ\",\"qiniuBucketName\":\"ios-app\",\"qiniuDomain\":\"http://7xqbwh.dl1.z0.glb.clouddn.com\",\"qiniuPrefix\":\"upload\",\"qiniuSecretKey\":\"uIwJHevMRWU0VLxFvgy0tAcOdGqasdtVlJkdy6vV\",\"type\":1}', '0', '云存储配置信息');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '上级部门ID，一级部门为0',
  `name` varchar(50) DEFAULT NULL COMMENT '部门名称',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  `del_flag` tinyint(4) DEFAULT '0' COMMENT '是否删除  -1：已删除  0：正常',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='部门管理';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('1', '0', '总部', '0', '0');
INSERT INTO `sys_dept` VALUES ('2', '1', '分公司', '1', '0');
INSERT INTO `sys_dept` VALUES ('3', '2', '研发部', '3', '0');

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT '字典名称',
  `type` varchar(100) NOT NULL COMMENT '字典类型',
  `code` varchar(100) NOT NULL COMMENT '字典码',
  `value` varchar(1000) NOT NULL COMMENT '字典值',
  `order_num` int(11) DEFAULT '0' COMMENT '排序',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `del_flag` tinyint(4) DEFAULT '0' COMMENT '删除标记  -1：已删除  0：正常',
  PRIMARY KEY (`id`),
  UNIQUE KEY `type` (`type`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='数据字典表';

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES ('1', '性别', 'sex', '0', '女', '0', null, '0');
INSERT INTO `sys_dict` VALUES ('2', '性别', 'sex', '1', '男', '1', null, '0');
INSERT INTO `sys_dict` VALUES ('3', '性别', 'sex', '2', '未知', '3', null, '0');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) DEFAULT NULL COMMENT '用户操作',
  `method` varchar(200) DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) DEFAULT NULL COMMENT '请求参数',
  `time` bigint(20) NOT NULL COMMENT '执行时长(毫秒)',
  `ip` varchar(64) DEFAULT NULL COMMENT 'IP地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=208 DEFAULT CHARSET=utf8 COMMENT='系统日志';

-- ----------------------------
-- Records of sys_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int(11) DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  `open_mode` varchar(10) DEFAULT NULL COMMENT '打开方式',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8 COMMENT='菜单管理';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '0', '系统管理', null, null, '0', 'fa fa-cog', '99', '_self');
INSERT INTO `sys_menu` VALUES ('2', '1', '管理员管理', 'modules/sys/user.html', null, '1', 'fa fa-user', '1', '_self');
INSERT INTO `sys_menu` VALUES ('3', '1', '角色管理', 'modules/sys/role.html', null, '1', 'fa fa-user-secret', '2', '_self');
INSERT INTO `sys_menu` VALUES ('4', '1', '菜单管理', 'modules/sys/menu.html', null, '1', 'fa fa-th-list', '3', '_self');
INSERT INTO `sys_menu` VALUES ('5', '1', 'SQL监控', 'druid/sql.html', null, '1', 'fa fa-bug', '4', '_self');
INSERT INTO `sys_menu` VALUES ('15', '2', '查看', null, 'sys:user:list,sys:user:info', '2', null, '0', '_self');
INSERT INTO `sys_menu` VALUES ('16', '2', '新增', null, 'sys:user:save,sys:role:select', '2', null, '0', '_self');
INSERT INTO `sys_menu` VALUES ('17', '2', '修改', null, 'sys:user:update,sys:role:select', '2', null, '0', '_self');
INSERT INTO `sys_menu` VALUES ('18', '2', '删除', null, 'sys:user:delete', '2', null, '0', '_self');
INSERT INTO `sys_menu` VALUES ('19', '3', '查看', null, 'sys:role:list,sys:role:info', '2', null, '0', '_self');
INSERT INTO `sys_menu` VALUES ('20', '3', '新增', null, 'sys:role:save,sys:menu:perms', '2', null, '0', '_self');
INSERT INTO `sys_menu` VALUES ('21', '3', '修改', null, 'sys:role:update,sys:menu:perms', '2', null, '0', '_self');
INSERT INTO `sys_menu` VALUES ('22', '3', '删除', null, 'sys:role:delete', '2', null, '0', '_self');
INSERT INTO `sys_menu` VALUES ('23', '4', '查看', null, 'sys:menu:list,sys:menu:info', '2', null, '0', '_self');
INSERT INTO `sys_menu` VALUES ('24', '4', '新增', null, 'sys:menu:save,sys:menu:select', '2', null, '0', '_self');
INSERT INTO `sys_menu` VALUES ('25', '4', '修改', null, 'sys:menu:update,sys:menu:select', '2', null, '0', '_self');
INSERT INTO `sys_menu` VALUES ('26', '4', '删除', null, 'sys:menu:delete', '2', null, '0', '_self');
INSERT INTO `sys_menu` VALUES ('27', '1', '参数管理', 'modules/sys/config.html', 'sys:config:list,sys:config:info,sys:config:save,sys:config:update,sys:config:delete', '1', 'fa fa-sun-o', '6', '_self');
INSERT INTO `sys_menu` VALUES ('29', '1', '系统日志', 'modules/sys/log.html', 'sys:log:list', '1', 'fa fa-file-text-o', '7', '_self');
INSERT INTO `sys_menu` VALUES ('31', '1', '部门管理', 'modules/sys/dept.html', null, '1', 'fa fa-file-code-o', '1', '_self');
INSERT INTO `sys_menu` VALUES ('32', '31', '查看', null, 'sys:dept:list,sys:dept:info', '2', null, '0', '_self');
INSERT INTO `sys_menu` VALUES ('33', '31', '新增', null, 'sys:dept:save,sys:dept:select', '2', null, '0', '_self');
INSERT INTO `sys_menu` VALUES ('34', '31', '修改', null, 'sys:dept:update,sys:dept:select', '2', null, '0', '_self');
INSERT INTO `sys_menu` VALUES ('35', '31', '删除', null, 'sys:dept:delete', '2', null, '0', '_self');
INSERT INTO `sys_menu` VALUES ('36', '1', '字典管理', 'modules/sys/dict.html', null, '1', 'fa fa-bookmark-o', '6', '_self');
INSERT INTO `sys_menu` VALUES ('37', '36', '查看', null, 'sys:dict:list,sys:dict:info', '2', null, '6', '_self');
INSERT INTO `sys_menu` VALUES ('38', '36', '新增', null, 'sys:dict:save', '2', null, '6', '_self');
INSERT INTO `sys_menu` VALUES ('39', '36', '修改', null, 'sys:dict:update', '2', null, '6', '_self');
INSERT INTO `sys_menu` VALUES ('40', '36', '删除', null, 'sys:dict:delete', '2', null, '6', '_self');
INSERT INTO `sys_menu` VALUES ('92', '0', '设计器', null, null, '0', 'fa fa-paper-plane', '3', '_self');
INSERT INTO `sys_menu` VALUES ('93', '92', '大屏设计器', './modules/bddp/home.html', null, '1', 'fa fa-pencil-square-o', '0', '_blank');
INSERT INTO `sys_menu` VALUES ('94', '1', '授权信息', 'AsReport?authMessage=1', 'grant:info', '1', 'fa fa-shield', '99', '_self');
INSERT INTO `sys_menu` VALUES ('95', '0', '大屏DEMO', null, null, '0', 'fa fa-tv', '100', '_self');
INSERT INTO `sys_menu` VALUES ('96', '95', '三农大数据指挥舱', 'bddpshow/show/c99268a7bdf0a8c8dec37f4e5927910d', null, '1', 'fa fa-eye', '10', '_blank');
INSERT INTO `sys_menu` VALUES ('97', '95', '信贷综合业务驾驶舱', 'bddpshow/show/044a1af39843779cde39678289c42240', null, '1', 'fa fa-eye', '10', '_blank');
INSERT INTO `sys_menu` VALUES ('98', '95', '综合业务_模板1_首页', 'bddpshow/show/41284e70ef854b0bc215fe95ec9f6aae', null, '1', 'fa fa-eye', '1', '_blank');
INSERT INTO `sys_menu` VALUES ('99', '95', '综合业务_模板3_三列样式', 'bddpshow/show/51284e70ef854b0bc215fe95ec9f6aae', null, '1', 'fa fa-eye', '4', '_blank');
INSERT INTO `sys_menu` VALUES ('100', '95', '综合业务_模板2_三行模块', 'bddpshow/show/d76cbda028bebf896552816e981c3cc2', null, '1', 'fa fa-eye', '5', '_blank');
INSERT INTO `sys_menu` VALUES ('101', '95', '综合业务_模板4_七块', 'bddpshow/show/61284e70ef854b0bc215fe95ec9f6aae', '', '1', 'fa fa-eye', '5', '_blank');
INSERT INTO `sys_menu` VALUES ('102', '0', 'BI配置', null, null, '0', 'fa fa-bars', '98', '_self');
INSERT INTO `sys_menu` VALUES ('103', '102', '数据集', 'developing.html?num=1', null, '1', null, '0', '_self');
INSERT INTO `sys_menu` VALUES ('104', '102', '数据挖掘', 'developing.html?num=2', null, '1', null, '0', '_self');
INSERT INTO `sys_menu` VALUES ('105', '95', '业务风险_模板1', 'bddpshow/show/4286e3f913e364025ddc91d74ab7a5ad', null, '1', 'fa fa-eye', '7', '_blank');
INSERT INTO `sys_menu` VALUES ('106', '107', '左右轮播1', 'modules/bddp/swiper/swiper.html', null, '1', 'fa fa-eye', '99', '_blank');
INSERT INTO `sys_menu` VALUES ('107', '0', '整套报表轮播效果', null, null, '0', 'fa fa-refresh', '101', '_self');
INSERT INTO `sys_menu` VALUES ('108', '107', '左右轮播-淡入式', 'modules/bddp/swiper/swiperfade.html', null, '1', 'fa fa-eye', '0', '_blank');
INSERT INTO `sys_menu` VALUES ('109', '107', '左右轮播-自动切换', 'modules/bddp/swiper/swiperauto.html', null, '1', 'fa fa-eye', '0', '_blank');
INSERT INTO `sys_menu` VALUES ('110', '107', '不规则切换式1', 'modules/bddp/swiper/swiper.html', null, '1', 'fa fa-eye', '0', '_blank');
INSERT INTO `sys_menu` VALUES ('111', '95', '公司预览图', 'bddpshow/show/e22d6f7344ea0645b84c60a0a5a57cda', null, '1', 'fa fa-eye', '2', '_blank');
INSERT INTO `sys_menu` VALUES ('112', '95', '人力资源', 'bddpshow/show/45eef4da7a8f4b56235e24190acd800f', null, '1', 'fa fa-eye', '9', '_blank');
INSERT INTO `sys_menu` VALUES ('113', '0', '报表管理', null, null, '0', 'fa fa-table', '4', '_self');
INSERT INTO `sys_menu` VALUES ('114', '92', '网格式报表设计器', './modules/rdp/rdpDesign.html', null, '1', 'fa fa-braille', '0', '_blank');
INSERT INTO `sys_menu` VALUES ('115', '113', '网格报表管理', 'modules/rdp/list.html', null, '1', 'fa fa-user', '0', '_self');
INSERT INTO `sys_menu` VALUES ('116', '0', '公共数据源配置', 'modules/ser/config/rdpDataConfig.html', null, '1', 'fa fa-database', '0', '_self');
INSERT INTO `sys_menu` VALUES ('117', '0', '网格报表DEMO', null, null, '0', 'fa fa-table', '99', '_self');
INSERT INTO `sys_menu` VALUES ('118', '117', '交叉-客户与产品交叉报表', 'rdppage/show/1ea3e7ef2e8d9bd9a44ba3f24a1417de', null, '1', 'fa fa-eye', '2', '_self');
INSERT INTO `sys_menu` VALUES ('119', '117', '分组-地域客户信息报表', 'rdppage/show/04c65e333d6c8cf1e006c054f8d6158b', null, '1', 'fa fa-eye', '2', '_self');
INSERT INTO `sys_menu` VALUES ('120', '117', '分块-用户信息', 'rdppage/show/b0f44689bd804c43d59d85871a99711c', null, '1', 'fa fa-eye', '2', '_self');
INSERT INTO `sys_menu` VALUES ('121', '117', '详情-入库通知书', 'rdppage/main/f001db5305e400fe28bb5f3ebac7e451', null, '1', 'fa fa-eye', '2', '_self');
INSERT INTO `sys_menu` VALUES ('122', '117', '动态-水电费统计', 'rdppage/show/f004ff76e9e10b6b7d4ecb396608ee0a', null, '1', 'fa fa-eye', '2', '_self');
INSERT INTO `sys_menu` VALUES ('123', '117', '对比-季度对比分析报表', 'rdppage/show/23a58db31668eef064370d9706a3896c', null, '1', 'fa fa-eye', '2', '_self');
INSERT INTO `sys_menu` VALUES ('124', '117', '预警-客户风险预警报表', 'rdppage/show/8b9873d6fb7e14e93794ee7fc11cc3a0', null, '1', 'fa fa-eye', '2', '_self');
INSERT INTO `sys_menu` VALUES ('125', '117', '一体化生成-查询列表', 'modules/rdp/demo/demo2.html', null, '1', 'fa fa-eye', '0', '_self');
INSERT INTO `sys_menu` VALUES ('126', '117', '自定义查询条件-查询列表', 'modules/rdp/demo/demo1.html', null, '1', 'fa fa-eye', '0', '_self');
INSERT INTO `sys_menu` VALUES ('129', '117', '动态列JAVABEAN', 'modules/rdp/javabean/c.html', null, '1', 'fa fa-eye', '2', '_self');
INSERT INTO `sys_menu` VALUES ('131', '107', '盒模型切换', 'modules/bddp/swiper/swipercube.html', null, '1', 'fa fa-eye', '0', '_blank');
INSERT INTO `sys_menu` VALUES ('132', '113', '大屏幕报表管理', 'modules/bddp/home.html', null, '1', null, '0', '_blank');
INSERT INTO `sys_menu` VALUES ('133', '0', '填报报表DEMO', '', null, '0', 'fa fa-wpforms', '100', '_self');
INSERT INTO `sys_menu` VALUES ('134', '133', '人员基本情况表', 'rdppage/main/e93657d429ea44bfe6f5b7872676b35f?deptId=${deptId}&amp;userId=${userId}', null, '1', 'fa fa-eye', '1', '_self');
INSERT INTO `sys_menu` VALUES ('135', '133', '申报事项审批单', 'rdppage/main/6fbd2deabc701284edeb14003b26baea', null, '1', 'fa fa-eye', '2', '_self');
INSERT INTO `sys_menu` VALUES ('136', '133', '申报事项审批单编辑', 'rdppage/main/5bd730f8f1b65b0908e383ad76d15642', null, '1', 'fa fa-eye', '3', '_self');
INSERT INTO `sys_menu` VALUES ('137', '133', '填报添加验证DEMO', 'rdppage/main/b00eaf643bd2034ebc2a2e402a785667', null, '1', 'fa fa-eye', '4', '_self');
INSERT INTO `sys_menu` VALUES ('138', '133', '填报详情明细', 'rdppage/main/3132737d6c808d35f2fbc60f6ec6e2a5?userId=${userId}', null, '1', 'fa fa-eye', '5', '_self');
INSERT INTO `sys_menu` VALUES ('139', '117', '数据集过滤', 'rdppage/main/1cc54e0a1116c6c4dd06806b43621a25', null, '1', null, '0', '_self');

-- ----------------------------
-- Table structure for sys_oss
-- ----------------------------
DROP TABLE IF EXISTS `sys_oss`;
CREATE TABLE `sys_oss` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(200) DEFAULT NULL COMMENT 'URL地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文件上传';

-- ----------------------------
-- Records of sys_oss
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='角色';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '开发人员', null, '1', '2018-10-31 17:27:10');
INSERT INTO `sys_role` VALUES ('2', '业务人员', null, '1', '2018-10-31 17:28:01');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='角色与部门对应关系';

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES ('1', '1', '1');
INSERT INTO `sys_role_dept` VALUES ('2', '1', '2');
INSERT INTO `sys_role_dept` VALUES ('3', '1', '3');
INSERT INTO `sys_role_dept` VALUES ('4', '2', '1');
INSERT INTO `sys_role_dept` VALUES ('5', '2', '2');
INSERT INTO `sys_role_dept` VALUES ('6', '2', '3');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8 COMMENT='角色与菜单对应关系';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('1', '1', '92');
INSERT INTO `sys_role_menu` VALUES ('2', '1', '93');
INSERT INTO `sys_role_menu` VALUES ('3', '1', '114');
INSERT INTO `sys_role_menu` VALUES ('4', '1', '95');
INSERT INTO `sys_role_menu` VALUES ('5', '1', '96');
INSERT INTO `sys_role_menu` VALUES ('6', '1', '97');
INSERT INTO `sys_role_menu` VALUES ('7', '1', '98');
INSERT INTO `sys_role_menu` VALUES ('8', '1', '99');
INSERT INTO `sys_role_menu` VALUES ('9', '1', '100');
INSERT INTO `sys_role_menu` VALUES ('10', '1', '101');
INSERT INTO `sys_role_menu` VALUES ('11', '1', '105');
INSERT INTO `sys_role_menu` VALUES ('12', '1', '111');
INSERT INTO `sys_role_menu` VALUES ('13', '1', '112');
INSERT INTO `sys_role_menu` VALUES ('14', '1', '102');
INSERT INTO `sys_role_menu` VALUES ('15', '1', '103');
INSERT INTO `sys_role_menu` VALUES ('16', '1', '104');
INSERT INTO `sys_role_menu` VALUES ('17', '1', '107');
INSERT INTO `sys_role_menu` VALUES ('18', '1', '106');
INSERT INTO `sys_role_menu` VALUES ('19', '1', '108');
INSERT INTO `sys_role_menu` VALUES ('20', '1', '109');
INSERT INTO `sys_role_menu` VALUES ('21', '1', '110');
INSERT INTO `sys_role_menu` VALUES ('22', '1', '113');
INSERT INTO `sys_role_menu` VALUES ('23', '1', '115');
INSERT INTO `sys_role_menu` VALUES ('24', '1', '116');
INSERT INTO `sys_role_menu` VALUES ('25', '1', '117');
INSERT INTO `sys_role_menu` VALUES ('26', '1', '118');
INSERT INTO `sys_role_menu` VALUES ('27', '1', '119');
INSERT INTO `sys_role_menu` VALUES ('28', '1', '120');
INSERT INTO `sys_role_menu` VALUES ('29', '1', '121');
INSERT INTO `sys_role_menu` VALUES ('30', '1', '122');
INSERT INTO `sys_role_menu` VALUES ('31', '1', '123');
INSERT INTO `sys_role_menu` VALUES ('32', '1', '124');
INSERT INTO `sys_role_menu` VALUES ('33', '1', '125');
INSERT INTO `sys_role_menu` VALUES ('34', '1', '126');
INSERT INTO `sys_role_menu` VALUES ('35', '1', '129');
INSERT INTO `sys_role_menu` VALUES ('36', '2', '95');
INSERT INTO `sys_role_menu` VALUES ('37', '2', '96');
INSERT INTO `sys_role_menu` VALUES ('38', '2', '97');
INSERT INTO `sys_role_menu` VALUES ('39', '2', '98');
INSERT INTO `sys_role_menu` VALUES ('40', '2', '99');
INSERT INTO `sys_role_menu` VALUES ('41', '2', '100');
INSERT INTO `sys_role_menu` VALUES ('42', '2', '101');
INSERT INTO `sys_role_menu` VALUES ('43', '2', '105');
INSERT INTO `sys_role_menu` VALUES ('44', '2', '111');
INSERT INTO `sys_role_menu` VALUES ('45', '2', '112');
INSERT INTO `sys_role_menu` VALUES ('46', '2', '107');
INSERT INTO `sys_role_menu` VALUES ('47', '2', '106');
INSERT INTO `sys_role_menu` VALUES ('48', '2', '108');
INSERT INTO `sys_role_menu` VALUES ('49', '2', '109');
INSERT INTO `sys_role_menu` VALUES ('50', '2', '110');
INSERT INTO `sys_role_menu` VALUES ('51', '2', '117');
INSERT INTO `sys_role_menu` VALUES ('52', '2', '118');
INSERT INTO `sys_role_menu` VALUES ('53', '2', '119');
INSERT INTO `sys_role_menu` VALUES ('54', '2', '120');
INSERT INTO `sys_role_menu` VALUES ('55', '2', '121');
INSERT INTO `sys_role_menu` VALUES ('56', '2', '122');
INSERT INTO `sys_role_menu` VALUES ('57', '2', '123');
INSERT INTO `sys_role_menu` VALUES ('58', '2', '124');
INSERT INTO `sys_role_menu` VALUES ('59', '2', '125');
INSERT INTO `sys_role_menu` VALUES ('60', '2', '126');
INSERT INTO `sys_role_menu` VALUES ('61', '2', '129');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `salt` varchar(20) DEFAULT NULL COMMENT '盐',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) DEFAULT NULL COMMENT '手机号',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态  0：禁用   1：正常',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='系统用户';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', 'e1153123d7d180ceeb820d577ff119876678732a68eef4e6ffc0b1f06a01f91b', 'YzcmCZNvbXocrsz9dm8e', '517537832@qq.com', ' ', '1', '1', '2018-08-27 14:00:00');
INSERT INTO `sys_user` VALUES ('2', 'user', '7e9591ff11ba1fa4ef8f9c56483b79aed081f0beb46672820b6f9b1bb3aeed2a', 'rJOkHEBBEkdL1nt7ifW1', 'user@qq.com', '13112345678', '1', '1', '2018-10-31 17:25:39');
INSERT INTO `sys_user` VALUES ('3', 'guest', '93ee72a556fd66126ac88633516c6ebe76c1490e99f92c3aa4a8e3cf2677080b', 'i8surV6S6L64zP5SO6yY', 'guest@qq.com', '13212345678', '1', '1', '2018-10-31 17:26:20');
INSERT INTO `sys_user` VALUES ('4', 'wangli', '62eb29365851ecb8b71dde6f1eb06b27bcdc5dd214cfcc8f92120125591453e3', 'B1McpZZIbPEyZRkgMTAZ', 'wangli@qq.com', null, '1', '3', '2018-11-15 16:22:46');
INSERT INTO `sys_user` VALUES ('5', 'zhengtao', '3fda65d06831ae56ef17dd00bc51663722ce4dd47a50b32ac8cbe69f2d57808e', 'jS8QZrcVIDwKU46r9Hia', 'zhengtao@qq.com', null, '1', '3', '2018-11-15 16:23:12');
INSERT INTO `sys_user` VALUES ('6', 'lixing', 'f7559b24a2e4b26fa0d6062e19b938c16d1ca24f8eb1f0be30262e3687d37a6b', '3WY4u56aMUmE84T5lLYN', 'lixing@qq.com', null, '1', '3', '2018-11-16 09:13:02');
INSERT INTO `sys_user` VALUES ('7', 'zhangjianing', 'b4c44d29c06009f953762e449087f534e07c98950b7a34703e96862f82075a1f', 'esQGA84bXZdfob7qPyfK', 'zhangjianing@qq.com', null, '1', '3', '2018-11-16 09:13:32');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='用户与角色对应关系';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '2', '1');
INSERT INTO `sys_user_role` VALUES ('2', '3', '2');
INSERT INTO `sys_user_role` VALUES ('3', '4', '1');
INSERT INTO `sys_user_role` VALUES ('4', '5', '1');
INSERT INTO `sys_user_role` VALUES ('5', '6', '1');
INSERT INTO `sys_user_role` VALUES ('6', '7', '1');

-- ----------------------------
-- Table structure for sys_way
-- ----------------------------
DROP TABLE IF EXISTS `sys_way`;
CREATE TABLE `sys_way` (
  `way_no` varchar(6) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `way_name` varchar(80) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `lev` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `uplev` varchar(6) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`way_no`),
  UNIQUE KEY `SYS_C0019395` (`way_no`) USING BTREE,
  KEY `cif_way_idx1` (`uplev`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_way
-- ----------------------------
INSERT INTO `sys_way` VALUES ('A', '农、林、牧、渔业', '1', null);
INSERT INTO `sys_way` VALUES ('A01', '农业', '2', 'A');
INSERT INTO `sys_way` VALUES ('A011', '谷物种植', '3', 'A01');
INSERT INTO `sys_way` VALUES ('A0111', '稻谷种植', '4', 'A011');
INSERT INTO `sys_way` VALUES ('A0112', '小麦种植', '4', 'A011');
INSERT INTO `sys_way` VALUES ('A0113', '玉米种植', '4', 'A011');
INSERT INTO `sys_way` VALUES ('A0119', '其他谷物种植', '4', 'A011');
INSERT INTO `sys_way` VALUES ('A012', '豆类、油料和薯类种植', '3', 'A01');
INSERT INTO `sys_way` VALUES ('A0121', '豆类种植', '4', 'A012');
INSERT INTO `sys_way` VALUES ('A0122', '油料种植', '4', 'A012');
INSERT INTO `sys_way` VALUES ('A0123', '薯类种植', '4', 'A012');
INSERT INTO `sys_way` VALUES ('A013', '棉、麻、糖、烟草种植', '3', 'A01');
INSERT INTO `sys_way` VALUES ('A0131', '棉花种植', '4', 'A013');
INSERT INTO `sys_way` VALUES ('A0132', '麻类种植', '4', 'A013');
INSERT INTO `sys_way` VALUES ('A0133', '糖料种植', '4', 'A013');
INSERT INTO `sys_way` VALUES ('A0134', '烟草种植', '4', 'A013');
INSERT INTO `sys_way` VALUES ('A014', '蔬菜、食用菌及园艺作物种植', '3', 'A01');
INSERT INTO `sys_way` VALUES ('A0141', '蔬菜种植', '4', 'A014');
INSERT INTO `sys_way` VALUES ('A0142', '食用菌种植', '4', 'A014');
INSERT INTO `sys_way` VALUES ('A0143', '花卉种植', '4', 'A014');
INSERT INTO `sys_way` VALUES ('A0149', '其他园艺作物种植', '4', 'A014');
INSERT INTO `sys_way` VALUES ('A015', '水果种植', '3', 'A01');
INSERT INTO `sys_way` VALUES ('A0151', '仁果类和核果类水果种植', '4', 'A015');
INSERT INTO `sys_way` VALUES ('A0152', '葡萄种植', '4', 'A015');
INSERT INTO `sys_way` VALUES ('A0153', '柑橘类种植', '4', 'A015');
INSERT INTO `sys_way` VALUES ('A0154', '香蕉等亚热带水果种植', '4', 'A015');
INSERT INTO `sys_way` VALUES ('A0159', '其他水果种植', '4', 'A015');
INSERT INTO `sys_way` VALUES ('A016', '坚果、含油果、香料和饮料作物种植', '3', 'A01');
INSERT INTO `sys_way` VALUES ('A0161', '坚果种植', '4', 'A016');
INSERT INTO `sys_way` VALUES ('A0162', '含油果种植', '4', 'A016');
INSERT INTO `sys_way` VALUES ('A0163', '香料作物种植', '4', 'A016');
INSERT INTO `sys_way` VALUES ('A0169', '茶及其他饮料作物种植', '4', 'A016');
INSERT INTO `sys_way` VALUES ('A017', '中药材种植', '3', 'A01');
INSERT INTO `sys_way` VALUES ('A0170', '中药材种植', '4', 'A017');
INSERT INTO `sys_way` VALUES ('A019', '其他农业', '3', 'A01');
INSERT INTO `sys_way` VALUES ('A0190', '其他农业', '4', 'A019');
INSERT INTO `sys_way` VALUES ('A02', '林业', '2', 'A');
INSERT INTO `sys_way` VALUES ('A021', '林木育种和育苗', '3', 'A02');
INSERT INTO `sys_way` VALUES ('A0211', '林木育种', '4', 'A021');
INSERT INTO `sys_way` VALUES ('A0212', '林木育苗', '4', 'A021');
INSERT INTO `sys_way` VALUES ('A022', '造林和更新', '3', 'A02');
INSERT INTO `sys_way` VALUES ('A0220', '造林和更新', '4', 'A022');
INSERT INTO `sys_way` VALUES ('A023', '森林经营和管护', '3', 'A02');
INSERT INTO `sys_way` VALUES ('A0230', '森林经营和管护', '4', 'A023');
INSERT INTO `sys_way` VALUES ('A024', '木材和竹材采运', '3', 'A02');
INSERT INTO `sys_way` VALUES ('A0241', '木材采运', '4', 'A024');
INSERT INTO `sys_way` VALUES ('A0242', '竹材采运', '4', 'A024');
INSERT INTO `sys_way` VALUES ('A025', '林产品采集', '3', 'A02');
INSERT INTO `sys_way` VALUES ('A0251', '木竹材林产品采集', '4', 'A025');
INSERT INTO `sys_way` VALUES ('A0252', '非木竹材林产品采集', '4', 'A025');
INSERT INTO `sys_way` VALUES ('A03', '畜牧业', '2', 'A');
INSERT INTO `sys_way` VALUES ('A031', '牲畜饲养', '3', 'A03');
INSERT INTO `sys_way` VALUES ('A0311', '牛的饲养', '4', 'A031');
INSERT INTO `sys_way` VALUES ('A0312', '马的饲养', '4', 'A031');
INSERT INTO `sys_way` VALUES ('A0313', '猪的饲养', '4', 'A031');
INSERT INTO `sys_way` VALUES ('A0314', '羊的饲养', '4', 'A031');
INSERT INTO `sys_way` VALUES ('A0315', '骆驼饲养', '4', 'A031');
INSERT INTO `sys_way` VALUES ('A0319', '其他牲畜饲养', '4', 'A031');
INSERT INTO `sys_way` VALUES ('A032', '家禽饲养', '3', 'A03');
INSERT INTO `sys_way` VALUES ('A0321', '鸡的饲养', '4', 'A032');
INSERT INTO `sys_way` VALUES ('A0322', '鸭的饲养', '4', 'A032');
INSERT INTO `sys_way` VALUES ('A0323', '鹅的饲养', '4', 'A032');
INSERT INTO `sys_way` VALUES ('A0329', '其他家禽饲养', '4', 'A032');
INSERT INTO `sys_way` VALUES ('A033', '狩猎和捕捉动物', '3', 'A03');
INSERT INTO `sys_way` VALUES ('A0330', '狩猎和捕捉动物', '4', 'A033');
INSERT INTO `sys_way` VALUES ('A039', '其他畜牧业', '3', 'A03');
INSERT INTO `sys_way` VALUES ('A0390', '其他畜牧业', '4', 'A039');
INSERT INTO `sys_way` VALUES ('A04', '渔业', '2', 'A');
INSERT INTO `sys_way` VALUES ('A041', '水产养殖', '3', 'A04');
INSERT INTO `sys_way` VALUES ('A0411', '海水养殖', '4', 'A041');
INSERT INTO `sys_way` VALUES ('A0412', '内陆养殖', '4', 'A041');
INSERT INTO `sys_way` VALUES ('A042', '水产捕捞', '3', 'A04');
INSERT INTO `sys_way` VALUES ('A0421', '海水捕捞', '4', 'A042');
INSERT INTO `sys_way` VALUES ('A0422', '内陆捕捞', '4', 'A042');
INSERT INTO `sys_way` VALUES ('A05', '农、林、牧、渔服务业', '2', 'A');
INSERT INTO `sys_way` VALUES ('A051', '农业服务业', '3', 'A05');
INSERT INTO `sys_way` VALUES ('A0511', '农业机械服务', '4', 'A051');
INSERT INTO `sys_way` VALUES ('A0512', '灌溉服务', '4', 'A051');
INSERT INTO `sys_way` VALUES ('A0513', '农产品初加工服务', '4', 'A051');
INSERT INTO `sys_way` VALUES ('A0519', '其他农业服务', '4', 'A051');
INSERT INTO `sys_way` VALUES ('A052', '林业服务业', '3', 'A05');
INSERT INTO `sys_way` VALUES ('A0521', '林业有害生物防治服务', '4', 'A052');
INSERT INTO `sys_way` VALUES ('A0522', '森林防火服务', '4', 'A052');
INSERT INTO `sys_way` VALUES ('A0523', '林产品初级加工服务', '4', 'A052');
INSERT INTO `sys_way` VALUES ('A0529', '其他林业服务', '4', 'A052');
INSERT INTO `sys_way` VALUES ('A053', '畜牧服务业', '3', 'A05');
INSERT INTO `sys_way` VALUES ('A0530', '畜牧服务业', '4', 'A053');
INSERT INTO `sys_way` VALUES ('A054', '渔业服务业', '3', 'A05');
INSERT INTO `sys_way` VALUES ('A0540', '渔业服务业', '4', 'A054');
INSERT INTO `sys_way` VALUES ('B', '采矿业', '1', null);
INSERT INTO `sys_way` VALUES ('B06', '煤炭开采和洗选业', '2', 'B');
INSERT INTO `sys_way` VALUES ('B061', '烟煤和无烟煤开采洗选', '3', 'B06');
INSERT INTO `sys_way` VALUES ('B0610', '烟煤和无烟煤开采洗选', '4', 'B061');
INSERT INTO `sys_way` VALUES ('B062', '褐煤开采洗选', '3', 'B06');
INSERT INTO `sys_way` VALUES ('B0620', '褐煤开采洗选', '4', 'B062');
INSERT INTO `sys_way` VALUES ('B069', '其他煤炭采选', '3', 'B06');
INSERT INTO `sys_way` VALUES ('B0690', '其他煤炭采选', '4', 'B069');
INSERT INTO `sys_way` VALUES ('B07', '石油和天然气开采业', '2', 'B');
INSERT INTO `sys_way` VALUES ('B071', '石油开采', '3', 'B07');
INSERT INTO `sys_way` VALUES ('B0710', '石油开采', '4', 'B071');
INSERT INTO `sys_way` VALUES ('B072', '天然气开采', '3', 'B07');
INSERT INTO `sys_way` VALUES ('B0720', '天然气开采', '4', 'B072');
INSERT INTO `sys_way` VALUES ('B08', '黑色金属矿采选业', '2', 'B');
INSERT INTO `sys_way` VALUES ('B081', '铁矿采选', '3', 'B08');
INSERT INTO `sys_way` VALUES ('B0810', '铁矿采选', '4', 'B081');
INSERT INTO `sys_way` VALUES ('B082', '锰矿、铬矿采选', '3', 'B08');
INSERT INTO `sys_way` VALUES ('B0820', '锰矿、铬矿采选', '4', 'B082');
INSERT INTO `sys_way` VALUES ('B089', '其他黑色金属矿采选', '3', 'B08');
INSERT INTO `sys_way` VALUES ('B0890', '其他黑色金属矿采选', '4', 'B089');
INSERT INTO `sys_way` VALUES ('B09', '有色金属矿采选业', '2', 'B');
INSERT INTO `sys_way` VALUES ('B091', '常用有色金属矿采选', '3', 'B09');
INSERT INTO `sys_way` VALUES ('B0911', '铜矿采选', '4', 'B091');
INSERT INTO `sys_way` VALUES ('B0912', '铅锌矿采选', '4', 'B091');
INSERT INTO `sys_way` VALUES ('B0913', '镍钴矿采选', '4', 'B091');
INSERT INTO `sys_way` VALUES ('B0914', '锡矿采选', '4', 'B091');
INSERT INTO `sys_way` VALUES ('B0915', '锑矿采选', '4', 'B091');
INSERT INTO `sys_way` VALUES ('B0916', '铝矿采选', '4', 'B091');
INSERT INTO `sys_way` VALUES ('B0917', '镁矿采选', '4', 'B091');
INSERT INTO `sys_way` VALUES ('B0919', '其他常用有色金属矿采选', '4', 'B091');
INSERT INTO `sys_way` VALUES ('B092', '贵金属矿采选', '3', 'B09');
INSERT INTO `sys_way` VALUES ('B0921', '金矿采选', '4', 'B092');
INSERT INTO `sys_way` VALUES ('B0922', '银矿采选', '4', 'B092');
INSERT INTO `sys_way` VALUES ('B0929', '其他贵金属矿采选', '4', 'B092');
INSERT INTO `sys_way` VALUES ('B093', '稀有稀土金属矿采选', '3', 'B09');
INSERT INTO `sys_way` VALUES ('B0931', '钨钼矿采选', '4', 'B093');
INSERT INTO `sys_way` VALUES ('B0932', '稀土金属矿采选', '4', 'B093');
INSERT INTO `sys_way` VALUES ('B0933', '放射性金属矿采选', '4', 'B093');
INSERT INTO `sys_way` VALUES ('B0939', '其他稀有金属矿采选', '4', 'B093');
INSERT INTO `sys_way` VALUES ('B10', '非金属矿采选业', '2', 'B');
INSERT INTO `sys_way` VALUES ('B101', '土砂石开采', '3', 'B10');
INSERT INTO `sys_way` VALUES ('B1011', '石灰石、石膏开采', '4', 'B101');
INSERT INTO `sys_way` VALUES ('B1012', '建筑装饰用石开采', '4', 'B101');
INSERT INTO `sys_way` VALUES ('B1013', '耐火土石开采', '4', 'B101');
INSERT INTO `sys_way` VALUES ('B1019', '粘土及其他土砂石开采', '4', 'B101');
INSERT INTO `sys_way` VALUES ('B102', '化学矿开采', '3', 'B10');
INSERT INTO `sys_way` VALUES ('B1020', '化学矿开采', '4', 'B102');
INSERT INTO `sys_way` VALUES ('B103', '采盐', '3', 'B10');
INSERT INTO `sys_way` VALUES ('B1030', '采盐', '4', 'B103');
INSERT INTO `sys_way` VALUES ('B109', '石棉及其他非金属矿采选', '3', 'B10');
INSERT INTO `sys_way` VALUES ('B1091', '石棉、云母矿采选', '4', 'B109');
INSERT INTO `sys_way` VALUES ('B1092', '石墨、滑石采选', '4', 'B109');
INSERT INTO `sys_way` VALUES ('B1093', '宝石、玉石采选', '4', 'B109');
INSERT INTO `sys_way` VALUES ('B1099', '其他未列明非金属矿采选', '4', 'B109');
INSERT INTO `sys_way` VALUES ('B11', '开采辅助活动', '2', 'B');
INSERT INTO `sys_way` VALUES ('B111', '煤炭开采和洗选辅助活动', '3', 'B11');
INSERT INTO `sys_way` VALUES ('B1110', '煤炭开采和洗选辅助活动', '4', 'B111');
INSERT INTO `sys_way` VALUES ('B112', '石油和天然气开采辅助活动', '3', 'B11');
INSERT INTO `sys_way` VALUES ('B1120', '石油和天然气开采辅助活动', '4', 'B112');
INSERT INTO `sys_way` VALUES ('B119', '其他开采辅助活动', '3', 'B11');
INSERT INTO `sys_way` VALUES ('B1190', '其他开采辅助活动', '4', 'B119');
INSERT INTO `sys_way` VALUES ('B12', '其他采矿业', '2', 'B');
INSERT INTO `sys_way` VALUES ('B120', '其他采矿业', '3', 'B12');
INSERT INTO `sys_way` VALUES ('B1200', '其他采矿业', '4', 'B120');
INSERT INTO `sys_way` VALUES ('C', '制造业', '1', null);
INSERT INTO `sys_way` VALUES ('C13', '农副食品加工业', '2', 'C');
INSERT INTO `sys_way` VALUES ('C131', '谷物磨制', '3', 'C13');
INSERT INTO `sys_way` VALUES ('C1310', '谷物磨制', '4', 'C131');
INSERT INTO `sys_way` VALUES ('C132', '饲料加工', '3', 'C13');
INSERT INTO `sys_way` VALUES ('C1320', '饲料加工', '4', 'C132');
INSERT INTO `sys_way` VALUES ('C133', '植物油加工', '3', 'C13');
INSERT INTO `sys_way` VALUES ('C1331', '食用植物油加工', '4', 'C133');
INSERT INTO `sys_way` VALUES ('C1332', '非食用植物油加工', '4', 'C133');
INSERT INTO `sys_way` VALUES ('C134', '制糖业', '3', 'C13');
INSERT INTO `sys_way` VALUES ('C1340', '制糖业', '4', 'C134');
INSERT INTO `sys_way` VALUES ('C135', '屠宰及肉类加工', '3', 'C13');
INSERT INTO `sys_way` VALUES ('C1351', '牲畜屠宰', '4', 'C135');
INSERT INTO `sys_way` VALUES ('C1352', '禽类屠宰', '4', 'C135');
INSERT INTO `sys_way` VALUES ('C1353', '肉制品及副产品加工', '4', 'C135');
INSERT INTO `sys_way` VALUES ('C136', '水产品加工', '3', 'C13');
INSERT INTO `sys_way` VALUES ('C1361', '水产品冷冻加工', '4', 'C136');
INSERT INTO `sys_way` VALUES ('C1362', '鱼糜制品及水产品干腌制加工', '4', 'C136');
INSERT INTO `sys_way` VALUES ('C1363', '水产饲料制造', '4', 'C136');
INSERT INTO `sys_way` VALUES ('C1364', '鱼油提取及制品制造', '4', 'C136');
INSERT INTO `sys_way` VALUES ('C1369', '其他水产品加工', '4', 'C136');
INSERT INTO `sys_way` VALUES ('C137', '蔬菜、水果和坚果加工', '3', 'C13');
INSERT INTO `sys_way` VALUES ('C1371', '蔬菜加工', '4', 'C137');
INSERT INTO `sys_way` VALUES ('C1372', '水果和坚果加工', '4', 'C137');
INSERT INTO `sys_way` VALUES ('C139', '其他农副食品加工', '3', 'C13');
INSERT INTO `sys_way` VALUES ('C1391', '淀粉及淀粉制品制造', '4', 'C139');
INSERT INTO `sys_way` VALUES ('C1392', '豆制品制造', '4', 'C139');
INSERT INTO `sys_way` VALUES ('C1393', '蛋品加工', '4', 'C139');
INSERT INTO `sys_way` VALUES ('C1399', '其他未列明农副食品加工', '4', 'C139');
INSERT INTO `sys_way` VALUES ('C14', '食品制造业', '2', 'C');
INSERT INTO `sys_way` VALUES ('C141', '焙烤食品制造', '3', 'C14');
INSERT INTO `sys_way` VALUES ('C1411', '糕点、面包制造', '4', 'C141');
INSERT INTO `sys_way` VALUES ('C1419', '饼干及其他焙烤食品制造', '4', 'C141');
INSERT INTO `sys_way` VALUES ('C142', '糖果、巧克力及蜜饯制造', '3', 'C14');
INSERT INTO `sys_way` VALUES ('C1421', '糖果、巧克力制造', '4', 'C142');
INSERT INTO `sys_way` VALUES ('C1422', '蜜饯制作', '4', 'C142');
INSERT INTO `sys_way` VALUES ('C143', '方便食品制造', '3', 'C14');
INSERT INTO `sys_way` VALUES ('C1431', '米、面制品制造', '4', 'C143');
INSERT INTO `sys_way` VALUES ('C1432', '速冻食品制造', '4', 'C143');
INSERT INTO `sys_way` VALUES ('C1439', '方便面及其他方便食品制造', '4', 'C143');
INSERT INTO `sys_way` VALUES ('C144', '乳制品制造', '3', 'C14');
INSERT INTO `sys_way` VALUES ('C1440', '乳制品制造', '4', 'C144');
INSERT INTO `sys_way` VALUES ('C145', '罐头食品制造', '3', 'C14');
INSERT INTO `sys_way` VALUES ('C1451', '肉、禽类罐头制造', '4', 'C145');
INSERT INTO `sys_way` VALUES ('C1452', '水产品罐头制造', '4', 'C145');
INSERT INTO `sys_way` VALUES ('C1453', '蔬菜、水果罐头制造', '4', 'C145');
INSERT INTO `sys_way` VALUES ('C1459', '其他罐头食品制造', '4', 'C145');
INSERT INTO `sys_way` VALUES ('C146', '调味品、发酵制品制造', '3', 'C14');
INSERT INTO `sys_way` VALUES ('C1461', '味精制造', '4', 'C146');
INSERT INTO `sys_way` VALUES ('C1462', '酱油、食醋及类似制品制造', '4', 'C146');
INSERT INTO `sys_way` VALUES ('C1469', '其他调味品、发酵制品制造', '4', 'C146');
INSERT INTO `sys_way` VALUES ('C149', '其他食品制造', '3', 'C14');
INSERT INTO `sys_way` VALUES ('C1491', '营养食品制造', '4', 'C149');
INSERT INTO `sys_way` VALUES ('C1492', '保健食品制造', '4', 'C149');
INSERT INTO `sys_way` VALUES ('C1493', '冷冻饮品及食用冰制造', '4', 'C149');
INSERT INTO `sys_way` VALUES ('C1494', '盐加工', '4', 'C149');
INSERT INTO `sys_way` VALUES ('C1495', '食品及饲料添加剂制造', '4', 'C149');
INSERT INTO `sys_way` VALUES ('C1499', '其他未列明食品制造', '4', 'C149');
INSERT INTO `sys_way` VALUES ('C15', '酒、饮料和精制茶制造业', '2', 'C');
INSERT INTO `sys_way` VALUES ('C151', '酒的制造', '3', 'C15');
INSERT INTO `sys_way` VALUES ('C1511', '酒精制造', '4', 'C151');
INSERT INTO `sys_way` VALUES ('C1512', '白酒制造', '4', 'C151');
INSERT INTO `sys_way` VALUES ('C1513', '啤酒制造', '4', 'C151');
INSERT INTO `sys_way` VALUES ('C1514', '黄酒制造', '4', 'C151');
INSERT INTO `sys_way` VALUES ('C1515', '葡萄酒制造', '4', 'C151');
INSERT INTO `sys_way` VALUES ('C1519', '其他酒制造', '4', 'C151');
INSERT INTO `sys_way` VALUES ('C152', '饮料制造', '3', 'C15');
INSERT INTO `sys_way` VALUES ('C1521', '碳酸饮料制造', '4', 'C152');
INSERT INTO `sys_way` VALUES ('C1522', '瓶（罐）装饮用水制造', '4', 'C152');
INSERT INTO `sys_way` VALUES ('C1523', '果菜汁及果菜汁饮料制造', '4', 'C152');
INSERT INTO `sys_way` VALUES ('C1524', '含乳饮料和植物蛋白饮料制造', '4', 'C152');
INSERT INTO `sys_way` VALUES ('C1525', '固体饮料制造', '4', 'C152');
INSERT INTO `sys_way` VALUES ('C1529', '茶饮料及其他饮料制造', '4', 'C152');
INSERT INTO `sys_way` VALUES ('C153', '精制茶加工', '3', 'C15');
INSERT INTO `sys_way` VALUES ('C1530', '精制茶加工', '4', 'C153');
INSERT INTO `sys_way` VALUES ('C16', '烟草制品业', '2', 'C');
INSERT INTO `sys_way` VALUES ('C161', '烟叶复烤', '3', 'C16');
INSERT INTO `sys_way` VALUES ('C1610', '烟叶复烤', '4', 'C161');
INSERT INTO `sys_way` VALUES ('C162', '卷烟制造', '3', 'C16');
INSERT INTO `sys_way` VALUES ('C1620', '卷烟制造', '4', 'C162');
INSERT INTO `sys_way` VALUES ('C169', '其他烟草制品制造', '3', 'C16');
INSERT INTO `sys_way` VALUES ('C1690', '其他烟草制品制造', '4', 'C169');
INSERT INTO `sys_way` VALUES ('C17', '纺织业', '2', 'C');
INSERT INTO `sys_way` VALUES ('C171', '棉纺织及印染精加工', '3', 'C17');
INSERT INTO `sys_way` VALUES ('C1711', '棉纺纱加工', '4', 'C171');
INSERT INTO `sys_way` VALUES ('C1712', '棉织造加工', '4', 'C171');
INSERT INTO `sys_way` VALUES ('C1713', '棉印染精加工', '4', 'C171');
INSERT INTO `sys_way` VALUES ('C172', '毛纺织及染整精加工', '3', 'C17');
INSERT INTO `sys_way` VALUES ('C1721', '毛条和毛纱线加工', '4', 'C172');
INSERT INTO `sys_way` VALUES ('C1722', '毛织造加工', '4', 'C172');
INSERT INTO `sys_way` VALUES ('C1723', '毛染整精加工', '4', 'C172');
INSERT INTO `sys_way` VALUES ('C173', '麻纺织及染整精加工', '3', 'C17');
INSERT INTO `sys_way` VALUES ('C1731', '麻纤维纺前加工和纺纱', '4', 'C173');
INSERT INTO `sys_way` VALUES ('C1732', '麻织造加工', '4', 'C173');
INSERT INTO `sys_way` VALUES ('C1733', '麻染整精加工', '4', 'C173');
INSERT INTO `sys_way` VALUES ('C174', '丝绢纺织及印染精加工', '3', 'C17');
INSERT INTO `sys_way` VALUES ('C1741', '缫丝加工', '4', 'C174');
INSERT INTO `sys_way` VALUES ('C1742', '绢纺和丝织加工', '4', 'C174');
INSERT INTO `sys_way` VALUES ('C1743', '丝印染精加工', '4', 'C174');
INSERT INTO `sys_way` VALUES ('C175', '化纤织造及印染精加工', '3', 'C17');
INSERT INTO `sys_way` VALUES ('C1751', '化纤织造加工', '4', 'C175');
INSERT INTO `sys_way` VALUES ('C1752', '化纤织物染整精加工', '4', 'C175');
INSERT INTO `sys_way` VALUES ('C176', '针织或钩针编织物及其制品制造', '3', 'C17');
INSERT INTO `sys_way` VALUES ('C1761', '针织或钩针编织物织造', '4', 'C176');
INSERT INTO `sys_way` VALUES ('C1762', '针织或钩针编织物印染精加工', '4', 'C176');
INSERT INTO `sys_way` VALUES ('C1763', '针织或钩针编织品制造', '4', 'C176');
INSERT INTO `sys_way` VALUES ('C177', '家用纺织制成品制造', '3', 'C17');
INSERT INTO `sys_way` VALUES ('C1771', '床上用品制造', '4', 'C177');
INSERT INTO `sys_way` VALUES ('C1772', '毛巾类制品制造', '4', 'C177');
INSERT INTO `sys_way` VALUES ('C1773', '窗帘、布艺类产品制造', '4', 'C177');
INSERT INTO `sys_way` VALUES ('C1779', '其他家用纺织制成品制造', '4', 'C177');
INSERT INTO `sys_way` VALUES ('C178', '非家用纺织制成品制造', '3', 'C17');
INSERT INTO `sys_way` VALUES ('C1781', '非织造布制造', '4', 'C178');
INSERT INTO `sys_way` VALUES ('C1782', '绳、索、缆制造', '4', 'C178');
INSERT INTO `sys_way` VALUES ('C1783', '纺织带和帘子布制造', '4', 'C178');
INSERT INTO `sys_way` VALUES ('C1784', '篷、帆布制造', '4', 'C178');
INSERT INTO `sys_way` VALUES ('C1789', '其他非家用纺织制成品制造', '4', 'C178');
INSERT INTO `sys_way` VALUES ('C18', '纺织服装、服饰业', '2', 'C');
INSERT INTO `sys_way` VALUES ('C181', '机织服装制造', '3', 'C18');
INSERT INTO `sys_way` VALUES ('C1810', '机织服装制造', '4', 'C181');
INSERT INTO `sys_way` VALUES ('C182', '针织或钩针编织服装制造', '3', 'C18');
INSERT INTO `sys_way` VALUES ('C1820', '针织或钩针编织服装制造', '4', 'C182');
INSERT INTO `sys_way` VALUES ('C183', '服饰制造', '3', 'C18');
INSERT INTO `sys_way` VALUES ('C1830', '服饰制造', '4', 'C183');
INSERT INTO `sys_way` VALUES ('C19', '皮革、毛皮、羽毛及其制品和制鞋业', '2', 'C');
INSERT INTO `sys_way` VALUES ('C191', '皮革鞣制加工', '3', 'C19');
INSERT INTO `sys_way` VALUES ('C1910', '皮革鞣制加工', '4', 'C191');
INSERT INTO `sys_way` VALUES ('C192', '皮革制品制造', '3', 'C19');
INSERT INTO `sys_way` VALUES ('C1921', '皮革服装制造', '4', 'C192');
INSERT INTO `sys_way` VALUES ('C1922', '皮箱、包（袋）制造', '4', 'C192');
INSERT INTO `sys_way` VALUES ('C1923', '皮手套及皮装饰制品制造', '4', 'C192');
INSERT INTO `sys_way` VALUES ('C1929', '其他皮革制品制造', '4', 'C192');
INSERT INTO `sys_way` VALUES ('C193', '毛皮鞣制及制品加工', '3', 'C19');
INSERT INTO `sys_way` VALUES ('C1931', '毛皮鞣制加工', '4', 'C193');
INSERT INTO `sys_way` VALUES ('C1932', '毛皮服装加工', '4', 'C193');
INSERT INTO `sys_way` VALUES ('C1939', '其他毛皮制品加工', '4', 'C193');
INSERT INTO `sys_way` VALUES ('C194', '羽毛(绒)加工及制品制造', '3', 'C19');
INSERT INTO `sys_way` VALUES ('C1941', '羽毛（绒）加工', '4', 'C194');
INSERT INTO `sys_way` VALUES ('C1942', '羽毛（绒）制品加工', '4', 'C194');
INSERT INTO `sys_way` VALUES ('C195', '制鞋业', '3', 'C19');
INSERT INTO `sys_way` VALUES ('C1951', '纺织面料鞋制造', '4', 'C195');
INSERT INTO `sys_way` VALUES ('C1952', '皮鞋制造', '4', 'C195');
INSERT INTO `sys_way` VALUES ('C1953', '塑料鞋制造', '4', 'C195');
INSERT INTO `sys_way` VALUES ('C1954', '橡胶鞋制造', '4', 'C195');
INSERT INTO `sys_way` VALUES ('C1959', '其他制鞋业', '4', 'C195');
INSERT INTO `sys_way` VALUES ('C20', '木材加工和木、竹、藤、棕、草制品业', '2', 'C');
INSERT INTO `sys_way` VALUES ('C201', '木材加工', '3', 'C20');
INSERT INTO `sys_way` VALUES ('C2011', '锯材加工', '4', 'C201');
INSERT INTO `sys_way` VALUES ('C2012', '木片加工', '4', 'C201');
INSERT INTO `sys_way` VALUES ('C2013', '单板加工', '4', 'C201');
INSERT INTO `sys_way` VALUES ('C2019', '其他木材加工', '4', 'C201');
INSERT INTO `sys_way` VALUES ('C202', '人造板制造', '3', 'C20');
INSERT INTO `sys_way` VALUES ('C2021', '胶合板制造', '4', 'C202');
INSERT INTO `sys_way` VALUES ('C2022', '纤维板制造', '4', 'C202');
INSERT INTO `sys_way` VALUES ('C2023', '刨花板制造', '4', 'C202');
INSERT INTO `sys_way` VALUES ('C2029', '其他人造板制造', '4', 'C202');
INSERT INTO `sys_way` VALUES ('C203', '木制品制造', '3', 'C20');
INSERT INTO `sys_way` VALUES ('C2031', '建筑用木料及木材组件加工', '4', 'C203');
INSERT INTO `sys_way` VALUES ('C2032', '木门窗、楼梯制造', '4', 'C203');
INSERT INTO `sys_way` VALUES ('C2033', '地板制造', '4', 'C203');
INSERT INTO `sys_way` VALUES ('C2034', '木制容器制造', '4', 'C203');
INSERT INTO `sys_way` VALUES ('C2039', '软木制品及其他木制品制造', '4', 'C203');
INSERT INTO `sys_way` VALUES ('C204', '竹、藤、棕、草等制品制造', '3', 'C20');
INSERT INTO `sys_way` VALUES ('C2041', '竹制品制造', '4', 'C204');
INSERT INTO `sys_way` VALUES ('C2042', '藤制品制造', '4', 'C204');
INSERT INTO `sys_way` VALUES ('C2043', '棕制品制造', '4', 'C204');
INSERT INTO `sys_way` VALUES ('C2049', '草及其他制品制造', '4', 'C204');
INSERT INTO `sys_way` VALUES ('C21', '家具制造业', '2', 'C');
INSERT INTO `sys_way` VALUES ('C211', '木质家具制造', '3', 'C21');
INSERT INTO `sys_way` VALUES ('C2110', '木质家具制造', '4', 'C211');
INSERT INTO `sys_way` VALUES ('C212', '竹、藤家具制造', '3', 'C21');
INSERT INTO `sys_way` VALUES ('C2120', '竹、藤家具制造', '4', 'C212');
INSERT INTO `sys_way` VALUES ('C213', '金属家具制造', '3', 'C21');
INSERT INTO `sys_way` VALUES ('C2130', '金属家具制造', '4', 'C213');
INSERT INTO `sys_way` VALUES ('C214', '塑料家具制造', '3', 'C21');
INSERT INTO `sys_way` VALUES ('C2140', '塑料家具制造', '4', 'C214');
INSERT INTO `sys_way` VALUES ('C219', '其他家具制造', '3', 'C21');
INSERT INTO `sys_way` VALUES ('C2190', '其他家具制造', '4', 'C219');
INSERT INTO `sys_way` VALUES ('C22', '造纸和纸制品业', '2', 'C');
INSERT INTO `sys_way` VALUES ('C221', '纸浆制造', '3', 'C22');
INSERT INTO `sys_way` VALUES ('C2211', '木竹浆制造', '4', 'C221');
INSERT INTO `sys_way` VALUES ('C2212', '非木竹浆制造', '4', 'C221');
INSERT INTO `sys_way` VALUES ('C222', '造纸', '3', 'C22');
INSERT INTO `sys_way` VALUES ('C2221', '机制纸及纸板制造', '4', 'C222');
INSERT INTO `sys_way` VALUES ('C2222', '手工纸制造', '4', 'C222');
INSERT INTO `sys_way` VALUES ('C2223', '加工纸制造', '4', 'C222');
INSERT INTO `sys_way` VALUES ('C223', '纸制品制造', '3', 'C22');
INSERT INTO `sys_way` VALUES ('C2231', '纸和纸板容器制造', '4', 'C223');
INSERT INTO `sys_way` VALUES ('C2239', '其他纸制品制造', '4', 'C223');
INSERT INTO `sys_way` VALUES ('C23', '印刷和记录媒介复制业', '2', 'C');
INSERT INTO `sys_way` VALUES ('C231', '印刷', '3', 'C23');
INSERT INTO `sys_way` VALUES ('C2311', '书、报刊印刷', '4', 'C231');
INSERT INTO `sys_way` VALUES ('C2312', '本册印制', '4', 'C231');
INSERT INTO `sys_way` VALUES ('C2319', '包装装潢及其他印刷', '4', 'C231');
INSERT INTO `sys_way` VALUES ('C232', '装订及印刷相关服务', '3', 'C23');
INSERT INTO `sys_way` VALUES ('C2320', '装订及印刷相关服务', '4', 'C232');
INSERT INTO `sys_way` VALUES ('C233', '记录媒介复制', '3', 'C23');
INSERT INTO `sys_way` VALUES ('C2330', '记录媒介复制', '4', 'C233');
INSERT INTO `sys_way` VALUES ('C24', '文教、工美、体育和娱乐用品制造业', '2', 'C');
INSERT INTO `sys_way` VALUES ('C241', '文教办公用品制造', '3', 'C24');
INSERT INTO `sys_way` VALUES ('C2411', '文具制造', '4', 'C241');
INSERT INTO `sys_way` VALUES ('C2412', '笔的制造', '4', 'C241');
INSERT INTO `sys_way` VALUES ('C2413', '教学用模型及教具制造', '4', 'C241');
INSERT INTO `sys_way` VALUES ('C2414', '墨水、墨汁制造', '4', 'C241');
INSERT INTO `sys_way` VALUES ('C2419', '其他文教办公用品制造', '4', 'C241');
INSERT INTO `sys_way` VALUES ('C242', '乐器制造', '3', 'C24');
INSERT INTO `sys_way` VALUES ('C2421', '中乐器制造', '4', 'C242');
INSERT INTO `sys_way` VALUES ('C2422', '西乐器制造', '4', 'C242');
INSERT INTO `sys_way` VALUES ('C2423', '电子乐器制造', '4', 'C242');
INSERT INTO `sys_way` VALUES ('C2429', '其他乐器及零件制造', '4', 'C242');
INSERT INTO `sys_way` VALUES ('C243', '工艺美术品制造', '3', 'C24');
INSERT INTO `sys_way` VALUES ('C2431', '雕塑工艺品制造', '4', 'C243');
INSERT INTO `sys_way` VALUES ('C2432', '金属工艺品制造', '4', 'C243');
INSERT INTO `sys_way` VALUES ('C2433', '漆器工艺品制造', '4', 'C243');
INSERT INTO `sys_way` VALUES ('C2434', '花画工艺品制造', '4', 'C243');
INSERT INTO `sys_way` VALUES ('C2435', '天然植物纤维编织工艺品制造', '4', 'C243');
INSERT INTO `sys_way` VALUES ('C2436', '抽纱刺绣工艺品制造', '4', 'C243');
INSERT INTO `sys_way` VALUES ('C2437', '地毯、挂毯制造', '4', 'C243');
INSERT INTO `sys_way` VALUES ('C2438', '珠宝首饰及有关物品制造', '4', 'C243');
INSERT INTO `sys_way` VALUES ('C2439', '其他工艺美术品制造', '4', 'C243');
INSERT INTO `sys_way` VALUES ('C244', '体育用品制造', '3', 'C24');
INSERT INTO `sys_way` VALUES ('C2441', '球类制造', '4', 'C244');
INSERT INTO `sys_way` VALUES ('C2442', '体育器材及配件制造', '4', 'C244');
INSERT INTO `sys_way` VALUES ('C2443', '训练健身器材制造', '4', 'C244');
INSERT INTO `sys_way` VALUES ('C2444', '运动防护用具制造', '4', 'C244');
INSERT INTO `sys_way` VALUES ('C2449', '其他体育用品制造', '4', 'C244');
INSERT INTO `sys_way` VALUES ('C245', '玩具制造', '3', 'C24');
INSERT INTO `sys_way` VALUES ('C2450', '玩具制造', '4', 'C245');
INSERT INTO `sys_way` VALUES ('C246', '游艺器材及娱乐用品制造', '3', 'C24');
INSERT INTO `sys_way` VALUES ('C2461', '露天游乐场所游乐设备制造', '4', 'C246');
INSERT INTO `sys_way` VALUES ('C2462', '游艺用品及室内游艺器材制造', '4', 'C246');
INSERT INTO `sys_way` VALUES ('C2469', '其他娱乐用品制造', '4', 'C246');
INSERT INTO `sys_way` VALUES ('C25', '石油加工、炼焦和核燃料加工业', '2', 'C');
INSERT INTO `sys_way` VALUES ('C251', '精炼石油产品制造', '3', 'C25');
INSERT INTO `sys_way` VALUES ('C2511', '原油加工及石油制品制造', '4', 'C251');
INSERT INTO `sys_way` VALUES ('C2512', '人造原油制造', '4', 'C251');
INSERT INTO `sys_way` VALUES ('C252', '炼焦', '3', 'C25');
INSERT INTO `sys_way` VALUES ('C2520', '炼焦', '4', 'C252');
INSERT INTO `sys_way` VALUES ('C253', '核燃料加工', '3', 'C25');
INSERT INTO `sys_way` VALUES ('C2530', '核燃料加工', '4', 'C253');
INSERT INTO `sys_way` VALUES ('C26', '化学原料和化学制品制造业', '2', 'C');
INSERT INTO `sys_way` VALUES ('C261', '基础化学原料制造', '3', 'C26');
INSERT INTO `sys_way` VALUES ('C2611', '无机酸制造', '4', 'C261');
INSERT INTO `sys_way` VALUES ('C2612', '无机碱制造', '4', 'C261');
INSERT INTO `sys_way` VALUES ('C2613', '无机盐制造', '4', 'C261');
INSERT INTO `sys_way` VALUES ('C2614', '有机化学原料制造', '4', 'C261');
INSERT INTO `sys_way` VALUES ('C2619', '其他基础化学原料制造', '4', 'C261');
INSERT INTO `sys_way` VALUES ('C262', '肥料制造', '3', 'C26');
INSERT INTO `sys_way` VALUES ('C2621', '氮肥制造', '4', 'C262');
INSERT INTO `sys_way` VALUES ('C2622', '磷肥制造', '4', 'C262');
INSERT INTO `sys_way` VALUES ('C2623', '钾肥制造', '4', 'C262');
INSERT INTO `sys_way` VALUES ('C2624', '复混肥料制造', '4', 'C262');
INSERT INTO `sys_way` VALUES ('C2625', '有机肥料及微生物肥料制造', '4', 'C262');
INSERT INTO `sys_way` VALUES ('C2629', '其他肥料制造', '4', 'C262');
INSERT INTO `sys_way` VALUES ('C263', '农药制造', '3', 'C26');
INSERT INTO `sys_way` VALUES ('C2631', '化学农药制造', '4', 'C263');
INSERT INTO `sys_way` VALUES ('C2632', '生物化学农药及微生物农药制造', '4', 'C263');
INSERT INTO `sys_way` VALUES ('C264', '涂料、油墨、颜料及类似产品制造', '3', 'C26');
INSERT INTO `sys_way` VALUES ('C2641', '涂料制造', '4', 'C264');
INSERT INTO `sys_way` VALUES ('C2642', '油墨及类似产品制造', '4', 'C264');
INSERT INTO `sys_way` VALUES ('C2643', '颜料制造', '4', 'C264');
INSERT INTO `sys_way` VALUES ('C2644', '染料制造', '4', 'C264');
INSERT INTO `sys_way` VALUES ('C2645', '密封用填料及类似品制造', '4', 'C264');
INSERT INTO `sys_way` VALUES ('C265', '合成材料制造', '3', 'C26');
INSERT INTO `sys_way` VALUES ('C2651', '初级形态塑料及合成树脂制造', '4', 'C265');
INSERT INTO `sys_way` VALUES ('C2652', '合成橡胶制造', '4', 'C265');
INSERT INTO `sys_way` VALUES ('C2653', '合成纤维单（聚合）体制造', '4', 'C265');
INSERT INTO `sys_way` VALUES ('C2659', '其他合成材料制造', '4', 'C265');
INSERT INTO `sys_way` VALUES ('C266', '专用化学产品制造', '3', 'C26');
INSERT INTO `sys_way` VALUES ('C2661', '化学试剂和助剂制造', '4', 'C266');
INSERT INTO `sys_way` VALUES ('C2662', '专项化学用品制造', '4', 'C266');
INSERT INTO `sys_way` VALUES ('C2663', '林产化学产品制造', '4', 'C266');
INSERT INTO `sys_way` VALUES ('C2664', '信息化学品制造', '4', 'C266');
INSERT INTO `sys_way` VALUES ('C2665', '环境污染处理专用药剂材料制造', '4', 'C266');
INSERT INTO `sys_way` VALUES ('C2666', '动物胶制造', '4', 'C266');
INSERT INTO `sys_way` VALUES ('C2669', '其他专用化学产品制造', '4', 'C266');
INSERT INTO `sys_way` VALUES ('C267', '炸药、火工及焰火产品制造', '3', 'C26');
INSERT INTO `sys_way` VALUES ('C2671', '炸药及火工产品制造', '4', 'C267');
INSERT INTO `sys_way` VALUES ('C2672', '焰火、鞭炮产品制造', '4', 'C267');
INSERT INTO `sys_way` VALUES ('C268', '日用化学产品制造', '3', 'C26');
INSERT INTO `sys_way` VALUES ('C2681', '肥皂及合成洗涤剂制造', '4', 'C268');
INSERT INTO `sys_way` VALUES ('C2682', '化妆品制造', '4', 'C268');
INSERT INTO `sys_way` VALUES ('C2683', '口腔清洁用品制造', '4', 'C268');
INSERT INTO `sys_way` VALUES ('C2684', '香料、香精制造', '4', 'C268');
INSERT INTO `sys_way` VALUES ('C2689', '其他日用化学产品制造', '4', 'C268');
INSERT INTO `sys_way` VALUES ('C27', '医药制造业', '2', 'C');
INSERT INTO `sys_way` VALUES ('C271', '化学药品原料药制造', '3', 'C27');
INSERT INTO `sys_way` VALUES ('C2710', '化学药品原料药制造', '4', 'C271');
INSERT INTO `sys_way` VALUES ('C272', '化学药品制剂制造', '3', 'C27');
INSERT INTO `sys_way` VALUES ('C2720', '化学药品制剂制造', '4', 'C272');
INSERT INTO `sys_way` VALUES ('C273', '中药饮片加工', '3', 'C27');
INSERT INTO `sys_way` VALUES ('C2730', '中药饮片加工', '4', 'C273');
INSERT INTO `sys_way` VALUES ('C274', '中成药生产', '3', 'C27');
INSERT INTO `sys_way` VALUES ('C2740', '中成药生产', '4', 'C274');
INSERT INTO `sys_way` VALUES ('C275', '兽用药品制造', '3', 'C27');
INSERT INTO `sys_way` VALUES ('C2750', '兽用药品制造', '4', 'C275');
INSERT INTO `sys_way` VALUES ('C276', '生物药品制造', '3', 'C27');
INSERT INTO `sys_way` VALUES ('C2760', '生物药品制造', '4', 'C276');
INSERT INTO `sys_way` VALUES ('C277', '卫生材料及医药用品制造', '3', 'C27');
INSERT INTO `sys_way` VALUES ('C2770', '卫生材料及医药用品制造', '4', 'C277');
INSERT INTO `sys_way` VALUES ('C28', '化学纤维制造业', '2', 'C');
INSERT INTO `sys_way` VALUES ('C281', '纤维素纤维原料及纤维制造', '3', 'C28');
INSERT INTO `sys_way` VALUES ('C2811', '化纤浆粕制造', '4', 'C281');
INSERT INTO `sys_way` VALUES ('C2812', '人造纤维（纤维素纤维）制造', '4', 'C281');
INSERT INTO `sys_way` VALUES ('C282', '合成纤维制造', '3', 'C28');
INSERT INTO `sys_way` VALUES ('C2821', '锦纶纤维制造', '4', 'C282');
INSERT INTO `sys_way` VALUES ('C2822', '涤纶纤维制造', '4', 'C282');
INSERT INTO `sys_way` VALUES ('C2823', '腈纶纤维制造', '4', 'C282');
INSERT INTO `sys_way` VALUES ('C2824', '维纶纤维制造', '4', 'C282');
INSERT INTO `sys_way` VALUES ('C2825', '丙纶纤维制造', '4', 'C282');
INSERT INTO `sys_way` VALUES ('C2826', '氨纶纤维制造', '4', 'C282');
INSERT INTO `sys_way` VALUES ('C2829', '其他合成纤维制造', '4', 'C282');
INSERT INTO `sys_way` VALUES ('C29', '橡胶和塑料制品业', '2', 'C');
INSERT INTO `sys_way` VALUES ('C291', '橡胶制品业', '3', 'C29');
INSERT INTO `sys_way` VALUES ('C2911', '轮胎制造', '4', 'C291');
INSERT INTO `sys_way` VALUES ('C2912', '橡胶板、管、带制造', '4', 'C291');
INSERT INTO `sys_way` VALUES ('C2913', '橡胶零件制造', '4', 'C291');
INSERT INTO `sys_way` VALUES ('C2914', '再生橡胶制造', '4', 'C291');
INSERT INTO `sys_way` VALUES ('C2915', '日用及医用橡胶制品制造', '4', 'C291');
INSERT INTO `sys_way` VALUES ('C2919', '其他橡胶制品制造', '4', 'C291');
INSERT INTO `sys_way` VALUES ('C292', '塑料制品业', '3', 'C29');
INSERT INTO `sys_way` VALUES ('C2921', '塑料薄膜制造', '4', 'C292');
INSERT INTO `sys_way` VALUES ('C2922', '塑料板、管、型材制造', '4', 'C292');
INSERT INTO `sys_way` VALUES ('C2923', '塑料丝、绳及编织品制造', '4', 'C292');
INSERT INTO `sys_way` VALUES ('C2924', '泡沫塑料制造', '4', 'C292');
INSERT INTO `sys_way` VALUES ('C2925', '塑料人造革、合成革制造', '4', 'C292');
INSERT INTO `sys_way` VALUES ('C2926', '塑料包装箱及容器制造', '4', 'C292');
INSERT INTO `sys_way` VALUES ('C2927', '日用塑料制品制造', '4', 'C292');
INSERT INTO `sys_way` VALUES ('C2928', '塑料零件制造', '4', 'C292');
INSERT INTO `sys_way` VALUES ('C2929', '其他塑料制品制造', '4', 'C292');
INSERT INTO `sys_way` VALUES ('C30', '非金属矿物制品业', '2', 'C');
INSERT INTO `sys_way` VALUES ('C301', '水泥、石灰和石膏制造', '3', 'C30');
INSERT INTO `sys_way` VALUES ('C3011', '水泥制造', '4', 'C301');
INSERT INTO `sys_way` VALUES ('C3012', '石灰和石膏制造', '4', 'C301');
INSERT INTO `sys_way` VALUES ('C302', '石膏、水泥制品及类似制品制造', '3', 'C30');
INSERT INTO `sys_way` VALUES ('C3021', '水泥制品制造', '4', 'C302');
INSERT INTO `sys_way` VALUES ('C3022', '砼结构构件制造', '4', 'C302');
INSERT INTO `sys_way` VALUES ('C3023', '石棉水泥制品制造', '4', 'C302');
INSERT INTO `sys_way` VALUES ('C3024', '轻质建筑材料制造', '4', 'C302');
INSERT INTO `sys_way` VALUES ('C3029', '其他水泥类似制品制造', '4', 'C302');
INSERT INTO `sys_way` VALUES ('C303', '砖瓦、石材等建筑材料制造', '3', 'C30');
INSERT INTO `sys_way` VALUES ('C3031', '粘土砖瓦及建筑砌块制造', '4', 'C303');
INSERT INTO `sys_way` VALUES ('C3032', '建筑陶瓷制品制造', '4', 'C303');
INSERT INTO `sys_way` VALUES ('C3033', '建筑用石加工', '4', 'C303');
INSERT INTO `sys_way` VALUES ('C3034', '防水建筑材料制造', '4', 'C303');
INSERT INTO `sys_way` VALUES ('C3035', '隔热和隔音材料制造', '4', 'C303');
INSERT INTO `sys_way` VALUES ('C3039', '其他建筑材料制造', '4', 'C303');
INSERT INTO `sys_way` VALUES ('C304', '玻璃制造', '3', 'C30');
INSERT INTO `sys_way` VALUES ('C3041', '平板玻璃制造', '4', 'C304');
INSERT INTO `sys_way` VALUES ('C3049', '其他玻璃制造', '4', 'C304');
INSERT INTO `sys_way` VALUES ('C305', '玻璃制品制造', '3', 'C30');
INSERT INTO `sys_way` VALUES ('C3051', '技术玻璃制品制造', '4', 'C305');
INSERT INTO `sys_way` VALUES ('C3052', '光学玻璃制造', '4', 'C305');
INSERT INTO `sys_way` VALUES ('C3053', '玻璃仪器制造', '4', 'C305');
INSERT INTO `sys_way` VALUES ('C3054', '日用玻璃制品制造', '4', 'C305');
INSERT INTO `sys_way` VALUES ('C3055', '玻璃包装容器制造', '4', 'C305');
INSERT INTO `sys_way` VALUES ('C3056', '玻璃保温容器制造', '4', 'C305');
INSERT INTO `sys_way` VALUES ('C3057', '制镜及类似品加工', '4', 'C305');
INSERT INTO `sys_way` VALUES ('C3059', '其他玻璃制品制造', '4', 'C305');
INSERT INTO `sys_way` VALUES ('C306', '玻璃纤维和玻璃纤维增强塑料制品制造', '3', 'C30');
INSERT INTO `sys_way` VALUES ('C3061', '玻璃纤维及制品制造', '4', 'C306');
INSERT INTO `sys_way` VALUES ('C3062', '玻璃纤维增强塑料制品制造', '4', 'C306');
INSERT INTO `sys_way` VALUES ('C307', '陶瓷制品制造', '3', 'C30');
INSERT INTO `sys_way` VALUES ('C3071', '卫生陶瓷制品制造', '4', 'C307');
INSERT INTO `sys_way` VALUES ('C3072', '特种陶瓷制品制造', '4', 'C307');
INSERT INTO `sys_way` VALUES ('C3073', '日用陶瓷制品制造', '4', 'C307');
INSERT INTO `sys_way` VALUES ('C3079', '园林、陈设艺术及其他陶瓷制品制造', '4', 'C307');
INSERT INTO `sys_way` VALUES ('C308', '耐火材料制品制造', '3', 'C30');
INSERT INTO `sys_way` VALUES ('C3081', '石棉制品制造', '4', 'C308');
INSERT INTO `sys_way` VALUES ('C3082', '云母制品制造', '4', 'C308');
INSERT INTO `sys_way` VALUES ('C3089', '耐火陶瓷制品及其他耐火材料制造', '4', 'C308');
INSERT INTO `sys_way` VALUES ('C309', '石墨及其他非金属矿物制品制造', '3', 'C30');
INSERT INTO `sys_way` VALUES ('C3091', '石墨及碳素制品制造', '4', 'C309');
INSERT INTO `sys_way` VALUES ('C3099', '其他非金属矿物制品制造', '4', 'C309');
INSERT INTO `sys_way` VALUES ('C31', '黑色金属冶炼和压延加工业', '2', 'C');
INSERT INTO `sys_way` VALUES ('C311', '炼铁', '3', 'C31');
INSERT INTO `sys_way` VALUES ('C3110', '炼铁', '4', 'C311');
INSERT INTO `sys_way` VALUES ('C312', '炼钢', '3', 'C31');
INSERT INTO `sys_way` VALUES ('C3120', '炼钢', '4', 'C312');
INSERT INTO `sys_way` VALUES ('C313', '黑色金属铸造', '3', 'C31');
INSERT INTO `sys_way` VALUES ('C3130', '黑色金属铸造', '4', 'C313');
INSERT INTO `sys_way` VALUES ('C314', '钢压延加工', '3', 'C31');
INSERT INTO `sys_way` VALUES ('C3140', '钢压延加工', '4', 'C314');
INSERT INTO `sys_way` VALUES ('C315', '铁合金冶炼', '3', 'C31');
INSERT INTO `sys_way` VALUES ('C3150', '铁合金冶炼', '4', 'C315');
INSERT INTO `sys_way` VALUES ('C32', '有色金属冶炼和压延加工业', '2', 'C');
INSERT INTO `sys_way` VALUES ('C321', '常用有色金属冶炼', '3', 'C32');
INSERT INTO `sys_way` VALUES ('C3211', '铜冶炼', '4', 'C321');
INSERT INTO `sys_way` VALUES ('C3212', '铅锌冶炼', '4', 'C321');
INSERT INTO `sys_way` VALUES ('C3213', '镍钴冶炼', '4', 'C321');
INSERT INTO `sys_way` VALUES ('C3214', '锡冶炼', '4', 'C321');
INSERT INTO `sys_way` VALUES ('C3215', '锑冶炼', '4', 'C321');
INSERT INTO `sys_way` VALUES ('C3216', '铝冶炼', '4', 'C321');
INSERT INTO `sys_way` VALUES ('C3217', '镁冶炼', '4', 'C321');
INSERT INTO `sys_way` VALUES ('C3219', '其他常用有色金属冶炼', '4', 'C321');
INSERT INTO `sys_way` VALUES ('C322', '贵金属冶炼', '3', 'C32');
INSERT INTO `sys_way` VALUES ('C3221', '金冶炼', '4', 'C322');
INSERT INTO `sys_way` VALUES ('C3222', '银冶炼', '4', 'C322');
INSERT INTO `sys_way` VALUES ('C3229', '其他贵金属冶炼', '4', 'C322');
INSERT INTO `sys_way` VALUES ('C323', '稀有稀土金属冶炼', '3', 'C32');
INSERT INTO `sys_way` VALUES ('C3231', '钨钼冶炼', '4', 'C323');
INSERT INTO `sys_way` VALUES ('C3232', '稀土金属冶炼', '4', 'C323');
INSERT INTO `sys_way` VALUES ('C3239', '其他稀有金属冶炼', '4', 'C323');
INSERT INTO `sys_way` VALUES ('C324', '有色金属合金制造', '3', 'C32');
INSERT INTO `sys_way` VALUES ('C3240', '有色金属合金制造', '4', 'C324');
INSERT INTO `sys_way` VALUES ('C325', '有色金属铸造', '3', 'C32');
INSERT INTO `sys_way` VALUES ('C3250', '有色金属铸造', '4', 'C325');
INSERT INTO `sys_way` VALUES ('C326', '有色金属压延加工', '3', 'C32');
INSERT INTO `sys_way` VALUES ('C3261', '铜压延加工', '4', 'C326');
INSERT INTO `sys_way` VALUES ('C3262', '铝压延加工', '4', 'C326');
INSERT INTO `sys_way` VALUES ('C3263', '贵金属压延加工', '4', 'C326');
INSERT INTO `sys_way` VALUES ('C3264', '稀有稀土金属压延加工', '4', 'C326');
INSERT INTO `sys_way` VALUES ('C3269', '其他有色金属压延加工', '4', 'C326');
INSERT INTO `sys_way` VALUES ('C33', '金属制品业', '2', 'C');
INSERT INTO `sys_way` VALUES ('C331', '结构性金属制品制造', '3', 'C33');
INSERT INTO `sys_way` VALUES ('C3311', '金属结构制造', '4', 'C331');
INSERT INTO `sys_way` VALUES ('C3312', '金属门窗制造', '4', 'C331');
INSERT INTO `sys_way` VALUES ('C332', '金属工具制造', '3', 'C33');
INSERT INTO `sys_way` VALUES ('C3321', '切削工具制造', '4', 'C332');
INSERT INTO `sys_way` VALUES ('C3322', '手工具制造', '4', 'C332');
INSERT INTO `sys_way` VALUES ('C3323', '农用及园林用金属工具制造', '4', 'C332');
INSERT INTO `sys_way` VALUES ('C3324', '刀剪及类似日用金属工具制造', '4', 'C332');
INSERT INTO `sys_way` VALUES ('C3329', '其他金属工具制造', '4', 'C332');
INSERT INTO `sys_way` VALUES ('C333', '集装箱及金属包装容器制造', '3', 'C33');
INSERT INTO `sys_way` VALUES ('C3331', '集装箱制造', '4', 'C333');
INSERT INTO `sys_way` VALUES ('C3332', '金属压力容器制造', '4', 'C333');
INSERT INTO `sys_way` VALUES ('C3333', '金属包装容器制造', '4', 'C333');
INSERT INTO `sys_way` VALUES ('C334', '金属丝绳及其制品制造', '3', 'C33');
INSERT INTO `sys_way` VALUES ('C3340', '金属丝绳及其制品制造', '4', 'C334');
INSERT INTO `sys_way` VALUES ('C335', '建筑、安全用金属制品制造', '3', 'C33');
INSERT INTO `sys_way` VALUES ('C3351', '建筑、家具用金属配件制造', '4', 'C335');
INSERT INTO `sys_way` VALUES ('C3352', '建筑装饰及水暖管道零件制造', '4', 'C335');
INSERT INTO `sys_way` VALUES ('C3353', '安全、消防用金属制品制造', '4', 'C335');
INSERT INTO `sys_way` VALUES ('C3359', '其他建筑、安全用金属制品制造', '4', 'C335');
INSERT INTO `sys_way` VALUES ('C336', '金属表面处理及热处理加工', '3', 'C33');
INSERT INTO `sys_way` VALUES ('C3360', '金属表面处理及热处理加工', '4', 'C336');
INSERT INTO `sys_way` VALUES ('C337', '搪瓷制品制造', '3', 'C33');
INSERT INTO `sys_way` VALUES ('C3371', '生产专用搪瓷制品制造', '4', 'C337');
INSERT INTO `sys_way` VALUES ('C3372', '建筑装饰搪瓷制品制造', '4', 'C337');
INSERT INTO `sys_way` VALUES ('C3373', '搪瓷卫生洁具制造', '4', 'C337');
INSERT INTO `sys_way` VALUES ('C3379', '搪瓷日用品及其他搪瓷制品制造', '4', 'C337');
INSERT INTO `sys_way` VALUES ('C338', '金属制日用品制造', '3', 'C33');
INSERT INTO `sys_way` VALUES ('C3381', '金属制厨房用器具制造', '4', 'C338');
INSERT INTO `sys_way` VALUES ('C3382', '金属制餐具和器皿制造', '4', 'C338');
INSERT INTO `sys_way` VALUES ('C3383', '金属制卫生器具制造', '4', 'C338');
INSERT INTO `sys_way` VALUES ('C3389', '其他金属制日用品制造', '4', 'C338');
INSERT INTO `sys_way` VALUES ('C339', '其他金属制品制造', '3', 'C33');
INSERT INTO `sys_way` VALUES ('C3391', '锻件及粉末冶金制品制造', '4', 'C339');
INSERT INTO `sys_way` VALUES ('C3392', '交通及公共管理用金属标牌制造', '4', 'C339');
INSERT INTO `sys_way` VALUES ('C3399', '其他未列明金属制品制造', '4', 'C339');
INSERT INTO `sys_way` VALUES ('C34', '通用设备制造业', '2', 'C');
INSERT INTO `sys_way` VALUES ('C341', '锅炉及原动设备制造', '3', 'C34');
INSERT INTO `sys_way` VALUES ('C3411', '锅炉及辅助设备制造', '4', 'C341');
INSERT INTO `sys_way` VALUES ('C3412', '内燃机及配件制造', '4', 'C341');
INSERT INTO `sys_way` VALUES ('C3413', '汽轮机及辅机制造', '4', 'C341');
INSERT INTO `sys_way` VALUES ('C3414', '水轮机及辅机制造', '4', 'C341');
INSERT INTO `sys_way` VALUES ('C3415', '风能原动设备制造', '4', 'C341');
INSERT INTO `sys_way` VALUES ('C3419', '其他原动设备制造', '4', 'C341');
INSERT INTO `sys_way` VALUES ('C342', '金属加工机械制造', '3', 'C34');
INSERT INTO `sys_way` VALUES ('C3421', '金属切削机床制造', '4', 'C342');
INSERT INTO `sys_way` VALUES ('C3422', '金属成形机床制造', '4', 'C342');
INSERT INTO `sys_way` VALUES ('C3423', '铸造机械制造', '4', 'C342');
INSERT INTO `sys_way` VALUES ('C3424', '金属切割及焊接设备制造', '4', 'C342');
INSERT INTO `sys_way` VALUES ('C3425', '机床附件制造', '4', 'C342');
INSERT INTO `sys_way` VALUES ('C3429', '其他金属加工机械制造', '4', 'C342');
INSERT INTO `sys_way` VALUES ('C343', '物料搬运设备制造', '3', 'C34');
INSERT INTO `sys_way` VALUES ('C3431', '轻小型起重设备制造', '4', 'C343');
INSERT INTO `sys_way` VALUES ('C3432', '起重机制造', '4', 'C343');
INSERT INTO `sys_way` VALUES ('C3433', '生产专用车辆制造', '4', 'C343');
INSERT INTO `sys_way` VALUES ('C3434', '连续搬运设备制造', '4', 'C343');
INSERT INTO `sys_way` VALUES ('C3435', '电梯、自动扶梯及升降机制造', '4', 'C343');
INSERT INTO `sys_way` VALUES ('C3439', '其他物料搬运设备制造', '4', 'C343');
INSERT INTO `sys_way` VALUES ('C344', '泵、阀门、压缩机及类似机械制造', '3', 'C34');
INSERT INTO `sys_way` VALUES ('C3441', '泵及真空设备制造', '4', 'C344');
INSERT INTO `sys_way` VALUES ('C3442', '气体压缩机械制造', '4', 'C344');
INSERT INTO `sys_way` VALUES ('C3443', '阀门和旋塞制造', '4', 'C344');
INSERT INTO `sys_way` VALUES ('C3444', '液压和气压动力机械及元件制造', '4', 'C344');
INSERT INTO `sys_way` VALUES ('C345', '轴承、齿轮和传动部件制造', '3', 'C34');
INSERT INTO `sys_way` VALUES ('C3451', '轴承制造', '4', 'C345');
INSERT INTO `sys_way` VALUES ('C3452', '齿轮及齿轮减、变速箱制造', '4', 'C345');
INSERT INTO `sys_way` VALUES ('C3459', '其他传动部件制造', '4', 'C345');
INSERT INTO `sys_way` VALUES ('C346', '烘炉、风机、衡器、包装等设备制造', '3', 'C34');
INSERT INTO `sys_way` VALUES ('C3461', '烘炉、熔炉及电炉制造', '4', 'C346');
INSERT INTO `sys_way` VALUES ('C3462', '风机、风扇制造', '4', 'C346');
INSERT INTO `sys_way` VALUES ('C3463', '气体、液体分离及纯净设备制造', '4', 'C346');
INSERT INTO `sys_way` VALUES ('C3464', '制冷、空调设备制造', '4', 'C346');
INSERT INTO `sys_way` VALUES ('C3465', '风动和电动工具制造', '4', 'C346');
INSERT INTO `sys_way` VALUES ('C3466', '喷枪及类似器具制造', '4', 'C346');
INSERT INTO `sys_way` VALUES ('C3467', '衡器制造', '4', 'C346');
INSERT INTO `sys_way` VALUES ('C3468', '包装专用设备制造', '4', 'C346');
INSERT INTO `sys_way` VALUES ('C347', '文化、办公用机械制造', '3', 'C34');
INSERT INTO `sys_way` VALUES ('C3471', '电影机械制造', '4', 'C347');
INSERT INTO `sys_way` VALUES ('C3472', '幻灯及投影设备制造', '4', 'C347');
INSERT INTO `sys_way` VALUES ('C3473', '照相机及器材制造', '4', 'C347');
INSERT INTO `sys_way` VALUES ('C3474', '复印和胶印设备制造', '4', 'C347');
INSERT INTO `sys_way` VALUES ('C3475', '计算器及货币专用设备制造', '4', 'C347');
INSERT INTO `sys_way` VALUES ('C3479', '其他文化、办公用机械制造', '4', 'C347');
INSERT INTO `sys_way` VALUES ('C348', '通用零部件制造', '3', 'C34');
INSERT INTO `sys_way` VALUES ('C3481', '金属密封件制造', '4', 'C348');
INSERT INTO `sys_way` VALUES ('C3482', '紧固件制造', '4', 'C348');
INSERT INTO `sys_way` VALUES ('C3483', '弹簧制造', '4', 'C348');
INSERT INTO `sys_way` VALUES ('C3484', '机械零部件加工', '4', 'C348');
INSERT INTO `sys_way` VALUES ('C3489', '其他通用零部件制造', '4', 'C348');
INSERT INTO `sys_way` VALUES ('C349', '其他通用设备制造业', '3', 'C34');
INSERT INTO `sys_way` VALUES ('C3490', '其他通用设备制造业', '4', 'C349');
INSERT INTO `sys_way` VALUES ('C35', '专用设备制造业', '2', 'C');
INSERT INTO `sys_way` VALUES ('C351', '采矿、冶金、建筑专用设备制造', '3', 'C35');
INSERT INTO `sys_way` VALUES ('C3511', '矿山机械制造', '4', 'C351');
INSERT INTO `sys_way` VALUES ('C3512', '石油钻采专用设备制造', '4', 'C351');
INSERT INTO `sys_way` VALUES ('C3513', '建筑工程用机械制造', '4', 'C351');
INSERT INTO `sys_way` VALUES ('C3514', '海洋工程专用设备制造', '4', 'C351');
INSERT INTO `sys_way` VALUES ('C3515', '建筑材料生产专用机械制造', '4', 'C351');
INSERT INTO `sys_way` VALUES ('C3516', '冶金专用设备制造', '4', 'C351');
INSERT INTO `sys_way` VALUES ('C352', '化工、木材、非金属加工专用设备制造', '3', 'C35');
INSERT INTO `sys_way` VALUES ('C3521', '炼油、化工生产专用设备制造', '4', 'C352');
INSERT INTO `sys_way` VALUES ('C3522', '橡胶加工专用设备制造', '4', 'C352');
INSERT INTO `sys_way` VALUES ('C3523', '塑料加工专用设备制造', '4', 'C352');
INSERT INTO `sys_way` VALUES ('C3524', '木材加工机械制造', '4', 'C352');
INSERT INTO `sys_way` VALUES ('C3525', '模具制造', '4', 'C352');
INSERT INTO `sys_way` VALUES ('C3529', '其他非金属加工专用设备制造', '4', 'C352');
INSERT INTO `sys_way` VALUES ('C353', '食品、饮料、烟草及饲料生产专用设备制造　　　', '3', 'C35');
INSERT INTO `sys_way` VALUES ('C3531', '食品、酒、饮料及茶生产专用设备制造', '4', 'C353');
INSERT INTO `sys_way` VALUES ('C3532', '农副食品加工专用设备制造', '4', 'C353');
INSERT INTO `sys_way` VALUES ('C3533', '烟草生产专用设备制造', '4', 'C353');
INSERT INTO `sys_way` VALUES ('C3534', '饲料生产专用设备制造', '4', 'C353');
INSERT INTO `sys_way` VALUES ('C354', '印刷、制药、日化及日用品生产专用设备制造', '3', 'C35');
INSERT INTO `sys_way` VALUES ('C3541', '制浆和造纸专用设备制造', '4', 'C354');
INSERT INTO `sys_way` VALUES ('C3542', '印刷专用设备制造', '4', 'C354');
INSERT INTO `sys_way` VALUES ('C3543', '日用化工专用设备制造', '4', 'C354');
INSERT INTO `sys_way` VALUES ('C3544', '制药专用设备制造', '4', 'C354');
INSERT INTO `sys_way` VALUES ('C3545', '照明器具生产专用设备制造', '4', 'C354');
INSERT INTO `sys_way` VALUES ('C3546', '玻璃、陶瓷和搪瓷制品生产专用设备制造', '4', 'C354');
INSERT INTO `sys_way` VALUES ('C3549', '其他日用品生产专用设备制造', '4', 'C354');
INSERT INTO `sys_way` VALUES ('C355', '纺织、服装和皮革加工专用设备制造', '3', 'C35');
INSERT INTO `sys_way` VALUES ('C3551', '纺织专用设备制造', '4', 'C355');
INSERT INTO `sys_way` VALUES ('C3552', '皮革、毛皮及其制品加工专用设备制造', '4', 'C355');
INSERT INTO `sys_way` VALUES ('C3553', '缝制机械制造', '4', 'C355');
INSERT INTO `sys_way` VALUES ('C3554', '洗涤机械制造', '4', 'C355');
INSERT INTO `sys_way` VALUES ('C356', '电子和电工机械专用设备制造', '3', 'C35');
INSERT INTO `sys_way` VALUES ('C3561', '电工机械专用设备制造', '4', 'C356');
INSERT INTO `sys_way` VALUES ('C3562', '电子工业专用设备制造', '4', 'C356');
INSERT INTO `sys_way` VALUES ('C357', '农、林、牧、渔专用机械制造', '3', 'C35');
INSERT INTO `sys_way` VALUES ('C3571', '拖拉机制造', '4', 'C357');
INSERT INTO `sys_way` VALUES ('C3572', '机械化农业及园艺机具制造', '4', 'C357');
INSERT INTO `sys_way` VALUES ('C3573', '营林及木竹采伐机械制造', '4', 'C357');
INSERT INTO `sys_way` VALUES ('C3574', '畜牧机械制造', '4', 'C357');
INSERT INTO `sys_way` VALUES ('C3575', '渔业机械制造', '4', 'C357');
INSERT INTO `sys_way` VALUES ('C3576', '农林牧渔机械配件制造', '4', 'C357');
INSERT INTO `sys_way` VALUES ('C3577', '棉花加工机械制造', '4', 'C357');
INSERT INTO `sys_way` VALUES ('C3579', '其他农、林、牧、渔业机械制造', '4', 'C357');
INSERT INTO `sys_way` VALUES ('C358', '医疗仪器设备及器械制造', '3', 'C35');
INSERT INTO `sys_way` VALUES ('C3581', '医疗诊断、监护及治疗设备制造', '4', 'C358');
INSERT INTO `sys_way` VALUES ('C3582', '口腔科用设备及器具制造', '4', 'C358');
INSERT INTO `sys_way` VALUES ('C3583', '医疗实验室及医用消毒设备和器具制造', '4', 'C358');
INSERT INTO `sys_way` VALUES ('C3584', '医疗、外科及兽医用器械制造', '4', 'C358');
INSERT INTO `sys_way` VALUES ('C3585', '机械治疗及病房护理设备制造', '4', 'C358');
INSERT INTO `sys_way` VALUES ('C3586', '假肢、人工器官及植（介）入器械制造', '4', 'C358');
INSERT INTO `sys_way` VALUES ('C3589', '其他医疗设备及器械制造', '4', 'C358');
INSERT INTO `sys_way` VALUES ('C359', '环保、社会公共服务及其他专用设备制造', '3', 'C35');
INSERT INTO `sys_way` VALUES ('C3591', '环境保护专用设备制造', '4', 'C359');
INSERT INTO `sys_way` VALUES ('C3592', '地质勘查专用设备制造', '4', 'C359');
INSERT INTO `sys_way` VALUES ('C3593', '邮政专用机械及器材制造', '4', 'C359');
INSERT INTO `sys_way` VALUES ('C3594', '商业、饮食、服务专用设备制造', '4', 'C359');
INSERT INTO `sys_way` VALUES ('C3595', '社会公共安全设备及器材制造', '4', 'C359');
INSERT INTO `sys_way` VALUES ('C3596', '交通安全、管制及类似专用设备制造', '4', 'C359');
INSERT INTO `sys_way` VALUES ('C3597', '水资源专用机械制造', '4', 'C359');
INSERT INTO `sys_way` VALUES ('C3599', '其他专用设备制造', '4', 'C359');
INSERT INTO `sys_way` VALUES ('C36', '汽车制造业', '2', 'C');
INSERT INTO `sys_way` VALUES ('C361', '汽车整车制造', '3', 'C36');
INSERT INTO `sys_way` VALUES ('C3610', '汽车整车制造', '4', 'C361');
INSERT INTO `sys_way` VALUES ('C362', '改装汽车制造', '3', 'C36');
INSERT INTO `sys_way` VALUES ('C3620', '改装汽车制造', '4', 'C362');
INSERT INTO `sys_way` VALUES ('C363', '低速载货汽车制造', '3', 'C36');
INSERT INTO `sys_way` VALUES ('C3630', '低速载货汽车制造', '4', 'C363');
INSERT INTO `sys_way` VALUES ('C364', '电车制造', '3', 'C36');
INSERT INTO `sys_way` VALUES ('C3640', '电车制造', '4', 'C364');
INSERT INTO `sys_way` VALUES ('C365', '汽车车身、挂车制造', '3', 'C36');
INSERT INTO `sys_way` VALUES ('C3650', '汽车车身、挂车制造', '4', 'C365');
INSERT INTO `sys_way` VALUES ('C366', '汽车零部件及配件制造', '3', 'C36');
INSERT INTO `sys_way` VALUES ('C3660', '汽车零部件及配件制造', '4', 'C366');
INSERT INTO `sys_way` VALUES ('C37', '铁路、船舶、航空航天和其他运输设备制造业', '2', 'C');
INSERT INTO `sys_way` VALUES ('C371', '铁路运输设备制造', '3', 'C37');
INSERT INTO `sys_way` VALUES ('C3711', '铁路机车车辆及动车组制造', '4', 'C371');
INSERT INTO `sys_way` VALUES ('C3712', '窄轨机车车辆制造', '4', 'C371');
INSERT INTO `sys_way` VALUES ('C3713', '铁路机车车辆配件制造', '4', 'C371');
INSERT INTO `sys_way` VALUES ('C3714', '铁路专用设备及器材、配件制造', '4', 'C371');
INSERT INTO `sys_way` VALUES ('C3719', '其他铁路运输设备制造', '4', 'C371');
INSERT INTO `sys_way` VALUES ('C372', '城市轨道交通设备制造', '3', 'C37');
INSERT INTO `sys_way` VALUES ('C3720', '城市轨道交通设备制造', '4', 'C372');
INSERT INTO `sys_way` VALUES ('C373', '船舶及相关装置制造', '3', 'C37');
INSERT INTO `sys_way` VALUES ('C3731', '金属船舶制造', '4', 'C373');
INSERT INTO `sys_way` VALUES ('C3732', '非金属船舶制造', '4', 'C373');
INSERT INTO `sys_way` VALUES ('C3733', '娱乐船和运动船制造', '4', 'C373');
INSERT INTO `sys_way` VALUES ('C3734', '船用配套设备制造', '4', 'C373');
INSERT INTO `sys_way` VALUES ('C3735', '船舶改装与拆除', '4', 'C373');
INSERT INTO `sys_way` VALUES ('C3739', '航标器材及其他相关装置制造', '4', 'C373');
INSERT INTO `sys_way` VALUES ('C374', '航空、航天器及设备制造', '3', 'C37');
INSERT INTO `sys_way` VALUES ('C3741', '飞机制造', '4', 'C374');
INSERT INTO `sys_way` VALUES ('C3742', '航天器制造', '4', 'C374');
INSERT INTO `sys_way` VALUES ('C3743', '航空、航天相关设备制造', '4', 'C374');
INSERT INTO `sys_way` VALUES ('C3749', '其他航空航天器制造', '4', 'C374');
INSERT INTO `sys_way` VALUES ('C375', '摩托车制造', '3', 'C37');
INSERT INTO `sys_way` VALUES ('C3751', '摩托车整车制造', '4', 'C375');
INSERT INTO `sys_way` VALUES ('C3752', '摩托车零部件及配件制造', '4', 'C375');
INSERT INTO `sys_way` VALUES ('C376', '自行车制造', '3', 'C37');
INSERT INTO `sys_way` VALUES ('C3761', '脚踏自行车及残疾人座车制造', '4', 'C376');
INSERT INTO `sys_way` VALUES ('C3762', '助动自行车制造', '4', 'C376');
INSERT INTO `sys_way` VALUES ('C377', '非公路休闲车及零配件制造', '3', 'C37');
INSERT INTO `sys_way` VALUES ('C3770', '非公路休闲车及零配件制造', '4', 'C377');
INSERT INTO `sys_way` VALUES ('C379', '潜水救捞及其他未列明运输设备制造', '3', 'C37');
INSERT INTO `sys_way` VALUES ('C3791', '潜水及水下救捞装备制造', '4', 'C379');
INSERT INTO `sys_way` VALUES ('C3799', '其他未列明运输设备制造', '4', 'C379');
INSERT INTO `sys_way` VALUES ('C38', '电气机械和器材制造业', '2', 'C');
INSERT INTO `sys_way` VALUES ('C381', '电机制造', '3', 'C38');
INSERT INTO `sys_way` VALUES ('C3811', '发电机及发电机组制造', '4', 'C381');
INSERT INTO `sys_way` VALUES ('C3812', '电动机制造', '4', 'C381');
INSERT INTO `sys_way` VALUES ('C3819', '微电机及其他电机制造', '4', 'C381');
INSERT INTO `sys_way` VALUES ('C382', '输配电及控制设备制造', '3', 'C38');
INSERT INTO `sys_way` VALUES ('C3821', '变压器、整流器和电感器制造', '4', 'C382');
INSERT INTO `sys_way` VALUES ('C3822', '电容器及其配套设备制造', '4', 'C382');
INSERT INTO `sys_way` VALUES ('C3823', '配电开关控制设备制造', '4', 'C382');
INSERT INTO `sys_way` VALUES ('C3824', '电力电子元器件制造', '4', 'C382');
INSERT INTO `sys_way` VALUES ('C3825', '光伏设备及元器件制造', '4', 'C382');
INSERT INTO `sys_way` VALUES ('C3829', '其他输配电及控制设备制造', '4', 'C382');
INSERT INTO `sys_way` VALUES ('C383', '电线、电缆、光缆及电工器材制造', '3', 'C38');
INSERT INTO `sys_way` VALUES ('C3831', '电线、电缆制造', '4', 'C383');
INSERT INTO `sys_way` VALUES ('C3832', '光纤、光缆制造', '4', 'C383');
INSERT INTO `sys_way` VALUES ('C3833', '绝缘制品制造', '4', 'C383');
INSERT INTO `sys_way` VALUES ('C3839', '其他电工器材制造', '4', 'C383');
INSERT INTO `sys_way` VALUES ('C384', '电池制造', '3', 'C38');
INSERT INTO `sys_way` VALUES ('C3841', '锂离子电池制造', '4', 'C384');
INSERT INTO `sys_way` VALUES ('C3842', '镍氢电池制造', '4', 'C384');
INSERT INTO `sys_way` VALUES ('C3849', '其他电池制造', '4', 'C384');
INSERT INTO `sys_way` VALUES ('C385', '家用电力器具制造', '3', 'C38');
INSERT INTO `sys_way` VALUES ('C3851', '家用制冷电器具制造', '4', 'C385');
INSERT INTO `sys_way` VALUES ('C3852', '家用空气调节器制造', '4', 'C385');
INSERT INTO `sys_way` VALUES ('C3853', '家用通风电器具制造', '4', 'C385');
INSERT INTO `sys_way` VALUES ('C3854', '家用厨房电器具制造', '4', 'C385');
INSERT INTO `sys_way` VALUES ('C3855', '家用清洁卫生电器具制造', '4', 'C385');
INSERT INTO `sys_way` VALUES ('C3856', '家用美容、保健电器具制造', '4', 'C385');
INSERT INTO `sys_way` VALUES ('C3857', '家用电力器具专用配件制造', '4', 'C385');
INSERT INTO `sys_way` VALUES ('C3859', '其他家用电力器具制造', '4', 'C385');
INSERT INTO `sys_way` VALUES ('C386', '非电力家用器具制造', '3', 'C38');
INSERT INTO `sys_way` VALUES ('C3861', '燃气、太阳能及类似能源家用器具制造', '4', 'C386');
INSERT INTO `sys_way` VALUES ('C3869', '其他非电力家用器具制造', '4', 'C386');
INSERT INTO `sys_way` VALUES ('C387', '照明器具制造', '3', 'C38');
INSERT INTO `sys_way` VALUES ('C3871', '电光源制造', '4', 'C387');
INSERT INTO `sys_way` VALUES ('C3872', '照明灯具制造', '4', 'C387');
INSERT INTO `sys_way` VALUES ('C3879', '灯用电器附件及其他照明器具制造', '4', 'C387');
INSERT INTO `sys_way` VALUES ('C389', '其他电气机械及器材制造', '3', 'C38');
INSERT INTO `sys_way` VALUES ('C3891', '电气信号设备装置制造', '4', 'C389');
INSERT INTO `sys_way` VALUES ('C3899', '其他未列明电气机械及器材制造', '4', 'C389');
INSERT INTO `sys_way` VALUES ('C39', '计算机、通信和其他电子设备制造业', '2', 'C');
INSERT INTO `sys_way` VALUES ('C391', '计算机制造', '3', 'C39');
INSERT INTO `sys_way` VALUES ('C3911', '计算机整机制造', '4', 'C391');
INSERT INTO `sys_way` VALUES ('C3912', '计算机零部件制造', '4', 'C391');
INSERT INTO `sys_way` VALUES ('C3913', '计算机外围设备制造', '4', 'C391');
INSERT INTO `sys_way` VALUES ('C3919', '其他计算机制造', '4', 'C391');
INSERT INTO `sys_way` VALUES ('C392', '通信设备制造', '3', 'C39');
INSERT INTO `sys_way` VALUES ('C3921', '通信系统设备制造', '4', 'C392');
INSERT INTO `sys_way` VALUES ('C3922', '通信终端设备制造', '4', 'C392');
INSERT INTO `sys_way` VALUES ('C393', '广播电视设备制造', '3', 'C39');
INSERT INTO `sys_way` VALUES ('C3931', '广播电视节目制作及发射设备制造', '4', 'C393');
INSERT INTO `sys_way` VALUES ('C3932', '广播电视接收设备及器材制造', '4', 'C393');
INSERT INTO `sys_way` VALUES ('C3939', '应用电视设备及其他广播电视设备制造', '4', 'C393');
INSERT INTO `sys_way` VALUES ('C394', '雷达及配套设备制造', '3', 'C39');
INSERT INTO `sys_way` VALUES ('C3940', '雷达及配套设备制造', '4', 'C394');
INSERT INTO `sys_way` VALUES ('C395', '视听设备制造', '3', 'C39');
INSERT INTO `sys_way` VALUES ('C3951', '电视机制造', '4', 'C395');
INSERT INTO `sys_way` VALUES ('C3952', '音响设备制造', '4', 'C395');
INSERT INTO `sys_way` VALUES ('C3953', '影视录放设备制造', '4', 'C395');
INSERT INTO `sys_way` VALUES ('C396', '电子器件制造', '3', 'C39');
INSERT INTO `sys_way` VALUES ('C3961', '电子真空器件制造', '4', 'C396');
INSERT INTO `sys_way` VALUES ('C3962', '半导体分立器件制造', '4', 'C396');
INSERT INTO `sys_way` VALUES ('C3963', '集成电路制造', '4', 'C396');
INSERT INTO `sys_way` VALUES ('C3969', '光电子器件及其他电子器件制造', '4', 'C396');
INSERT INTO `sys_way` VALUES ('C397', '电子元件制造', '3', 'C39');
INSERT INTO `sys_way` VALUES ('C3971', '电子元件及组件制造', '4', 'C397');
INSERT INTO `sys_way` VALUES ('C3972', '印制电路板制造', '4', 'C397');
INSERT INTO `sys_way` VALUES ('C399', '其他电子设备制造', '3', 'C39');
INSERT INTO `sys_way` VALUES ('C3990', '其他电子设备制造', '4', 'C399');
INSERT INTO `sys_way` VALUES ('C40', '仪器仪表制造业', '2', 'C');
INSERT INTO `sys_way` VALUES ('C401', '通用仪器仪表制造', '3', 'C40');
INSERT INTO `sys_way` VALUES ('C4011', '工业自动控制系统装置制造', '4', 'C401');
INSERT INTO `sys_way` VALUES ('C4012', '电工仪器仪表制造', '4', 'C401');
INSERT INTO `sys_way` VALUES ('C4013', '绘图、计算及测量仪器制造', '4', 'C401');
INSERT INTO `sys_way` VALUES ('C4014', '实验分析仪器制造', '4', 'C401');
INSERT INTO `sys_way` VALUES ('C4015', '试验机制造', '4', 'C401');
INSERT INTO `sys_way` VALUES ('C4019', '供应用仪表及其他通用仪器制造', '4', 'C401');
INSERT INTO `sys_way` VALUES ('C402', '专用仪器仪表制造', '3', 'C40');
INSERT INTO `sys_way` VALUES ('C4021', '环境监测专用仪器仪表制造', '4', 'C402');
INSERT INTO `sys_way` VALUES ('C4022', '运输设备及生产用计数仪表制造', '4', 'C402');
INSERT INTO `sys_way` VALUES ('C4023', '导航、气象及海洋专用仪器制造', '4', 'C402');
INSERT INTO `sys_way` VALUES ('C4024', '农林牧渔专用仪器仪表制造', '4', 'C402');
INSERT INTO `sys_way` VALUES ('C4025', '地质勘探和地震专用仪器制造', '4', 'C402');
INSERT INTO `sys_way` VALUES ('C4026', '教学专用仪器制造', '4', 'C402');
INSERT INTO `sys_way` VALUES ('C4027', '核子及核辐射测量仪器制造', '4', 'C402');
INSERT INTO `sys_way` VALUES ('C4028', '电子测量仪器制造', '4', 'C402');
INSERT INTO `sys_way` VALUES ('C4029', '其他专用仪器制造', '4', 'C402');
INSERT INTO `sys_way` VALUES ('C403', '钟表与计时仪器制造', '3', 'C40');
INSERT INTO `sys_way` VALUES ('C4030', '钟表与计时仪器制造', '4', 'C403');
INSERT INTO `sys_way` VALUES ('C404', '光学仪器及眼镜制造', '3', 'C40');
INSERT INTO `sys_way` VALUES ('C4041', '光学仪器制造', '4', 'C404');
INSERT INTO `sys_way` VALUES ('C4042', '眼镜制造', '4', 'C404');
INSERT INTO `sys_way` VALUES ('C409', '其他仪器仪表制造业', '3', 'C40');
INSERT INTO `sys_way` VALUES ('C4090', '其他仪器仪表制造业', '4', 'C409');
INSERT INTO `sys_way` VALUES ('C41', '其他制造业', '2', 'C');
INSERT INTO `sys_way` VALUES ('C411', '日用杂品制造', '3', 'C41');
INSERT INTO `sys_way` VALUES ('C4111', '鬃毛加工、制刷及清扫工具制造', '4', 'C411');
INSERT INTO `sys_way` VALUES ('C4119', '其他日用杂品制造', '4', 'C411');
INSERT INTO `sys_way` VALUES ('C412', '煤制品制造', '3', 'C41');
INSERT INTO `sys_way` VALUES ('C4120', '煤制品制造', '4', 'C412');
INSERT INTO `sys_way` VALUES ('C413', '核辐射加工', '3', 'C41');
INSERT INTO `sys_way` VALUES ('C4130', '核辐射加工', '4', 'C413');
INSERT INTO `sys_way` VALUES ('C419', '其他未列明制造业', '3', 'C41');
INSERT INTO `sys_way` VALUES ('C4190', '其他未列明制造业', '4', 'C419');
INSERT INTO `sys_way` VALUES ('C42', '废弃资源综合利用业', '2', 'C');
INSERT INTO `sys_way` VALUES ('C421', '金属废料和碎屑加工处理', '3', 'C42');
INSERT INTO `sys_way` VALUES ('C4210', '金属废料和碎屑加工处理', '4', 'C421');
INSERT INTO `sys_way` VALUES ('C422', '非金属废料和碎屑加工处理', '3', 'C42');
INSERT INTO `sys_way` VALUES ('C4220', '非金属废料和碎屑加工处理', '4', 'C422');
INSERT INTO `sys_way` VALUES ('C43', '金属制品、机械和设备修理业', '2', 'C');
INSERT INTO `sys_way` VALUES ('C431', '金属制品修理', '3', 'C43');
INSERT INTO `sys_way` VALUES ('C4310', '金属制品修理', '4', 'C431');
INSERT INTO `sys_way` VALUES ('C432', '通用设备修理', '3', 'C43');
INSERT INTO `sys_way` VALUES ('C4320', '通用设备修理', '4', 'C432');
INSERT INTO `sys_way` VALUES ('C433', '专用设备修理', '3', 'C43');
INSERT INTO `sys_way` VALUES ('C4330', '专用设备修理', '4', 'C433');
INSERT INTO `sys_way` VALUES ('C434', '铁路、船舶、航空航天等运输设备修理', '3', 'C43');
INSERT INTO `sys_way` VALUES ('C4341', '铁路运输设备修理', '4', 'C434');
INSERT INTO `sys_way` VALUES ('C4342', '船舶修理', '4', 'C434');
INSERT INTO `sys_way` VALUES ('C4343', '航空航天器修理', '4', 'C434');
INSERT INTO `sys_way` VALUES ('C4349', '其他运输设备修理', '4', 'C434');
INSERT INTO `sys_way` VALUES ('C435', '电气设备修理', '3', 'C43');
INSERT INTO `sys_way` VALUES ('C4350', '电气设备修理', '4', 'C435');
INSERT INTO `sys_way` VALUES ('C436', '仪器仪表修理', '3', 'C43');
INSERT INTO `sys_way` VALUES ('C4360', '仪器仪表修理', '4', 'C436');
INSERT INTO `sys_way` VALUES ('C439', '其他机械和设备修理业', '3', 'C43');
INSERT INTO `sys_way` VALUES ('C4390', '其他机械和设备修理业', '4', 'C439');
INSERT INTO `sys_way` VALUES ('D', '电力、热力、燃气及水生产和供应业', '1', null);
INSERT INTO `sys_way` VALUES ('D44', '电力、热力生产和供应业', '2', 'D');
INSERT INTO `sys_way` VALUES ('D441', '电力生产', '3', 'D44');
INSERT INTO `sys_way` VALUES ('D4411', '火力发电', '4', 'D441');
INSERT INTO `sys_way` VALUES ('D4412', '水力发电', '4', 'D441');
INSERT INTO `sys_way` VALUES ('D4413', '核力发电', '4', 'D441');
INSERT INTO `sys_way` VALUES ('D4414', '风力发电', '4', 'D441');
INSERT INTO `sys_way` VALUES ('D4415', '太阳能发电', '4', 'D441');
INSERT INTO `sys_way` VALUES ('D4419', '其他电力生产', '4', 'D441');
INSERT INTO `sys_way` VALUES ('D442', '电力供应', '3', 'D44');
INSERT INTO `sys_way` VALUES ('D4420', '电力供应', '4', 'D442');
INSERT INTO `sys_way` VALUES ('D443', '热力生产和供应', '3', 'D44');
INSERT INTO `sys_way` VALUES ('D4430', '热力生产和供应', '4', 'D443');
INSERT INTO `sys_way` VALUES ('D45', '燃气生产和供应业', '2', 'D');
INSERT INTO `sys_way` VALUES ('D450', '燃气生产和供应业', '3', 'D45');
INSERT INTO `sys_way` VALUES ('D4500', '燃气生产和供应业', '4', 'D450');
INSERT INTO `sys_way` VALUES ('D46', '水的生产和供应业', '2', 'D');
INSERT INTO `sys_way` VALUES ('D461', '自来水生产和供应', '3', 'D46');
INSERT INTO `sys_way` VALUES ('D4610', '自来水生产和供应', '4', 'D461');
INSERT INTO `sys_way` VALUES ('D462', '污水处理及其再生利用', '3', 'D46');
INSERT INTO `sys_way` VALUES ('D4620', '污水处理及其再生利用', '4', 'D462');
INSERT INTO `sys_way` VALUES ('D469', '其他水的处理、利用与分配', '3', 'D46');
INSERT INTO `sys_way` VALUES ('D4690', '其他水的处理、利用与分配', '4', 'D469');
INSERT INTO `sys_way` VALUES ('E', '建筑业', '1', null);
INSERT INTO `sys_way` VALUES ('E47', '房屋建筑业', '2', 'E');
INSERT INTO `sys_way` VALUES ('E470', '房屋建筑业', '3', 'E47');
INSERT INTO `sys_way` VALUES ('E4700', '房屋建筑业', '4', 'E470');
INSERT INTO `sys_way` VALUES ('E48', '土木工程建筑业', '2', 'E');
INSERT INTO `sys_way` VALUES ('E481', '铁路、道路、隧道和桥梁工程建筑', '3', 'E48');
INSERT INTO `sys_way` VALUES ('E4811', '铁路工程建筑', '4', 'E481');
INSERT INTO `sys_way` VALUES ('E4812', '公路工程建筑', '4', 'E481');
INSERT INTO `sys_way` VALUES ('E4813', '市政道路工程建筑', '4', 'E481');
INSERT INTO `sys_way` VALUES ('E4819', '其他道路、隧道和桥梁工程建筑', '4', 'E481');
INSERT INTO `sys_way` VALUES ('E482', '水利和内河港口工程建筑', '3', 'E48');
INSERT INTO `sys_way` VALUES ('E4821', '水源及供水设施工程建筑', '4', 'E482');
INSERT INTO `sys_way` VALUES ('E4822', '河湖治理及防洪设施工程建筑', '4', 'E482');
INSERT INTO `sys_way` VALUES ('E4823', '港口及航运设施工程建筑', '4', 'E482');
INSERT INTO `sys_way` VALUES ('E483', '海洋工程建筑', '3', 'E48');
INSERT INTO `sys_way` VALUES ('E4830', '海洋工程建筑', '4', 'E483');
INSERT INTO `sys_way` VALUES ('E484', '工矿工程建筑', '3', 'E48');
INSERT INTO `sys_way` VALUES ('E4840', '工矿工程建筑', '4', 'E484');
INSERT INTO `sys_way` VALUES ('E485', '架线和管道工程建筑', '3', 'E48');
INSERT INTO `sys_way` VALUES ('E4851', '架线及设备工程建筑', '4', 'E485');
INSERT INTO `sys_way` VALUES ('E4852', '管道工程建筑', '4', 'E485');
INSERT INTO `sys_way` VALUES ('E489', '其他土木工程建筑', '3', 'E48');
INSERT INTO `sys_way` VALUES ('E4890', '其他土木工程建筑', '4', 'E489');
INSERT INTO `sys_way` VALUES ('E49', '建筑安装业', '2', 'E');
INSERT INTO `sys_way` VALUES ('E491', '电气安装', '3', 'E49');
INSERT INTO `sys_way` VALUES ('E4910', '电气安装', '4', 'E491');
INSERT INTO `sys_way` VALUES ('E492', '管道和设备安装', '3', 'E49');
INSERT INTO `sys_way` VALUES ('E4920', '管道和设备安装', '4', 'E492');
INSERT INTO `sys_way` VALUES ('E499', '其他建筑安装业', '3', 'E49');
INSERT INTO `sys_way` VALUES ('E4990', '其他建筑安装业', '4', 'E499');
INSERT INTO `sys_way` VALUES ('E50', '建筑装饰和其他建筑业', '2', 'E');
INSERT INTO `sys_way` VALUES ('E501', '建筑装饰业', '3', 'E50');
INSERT INTO `sys_way` VALUES ('E5010', '建筑装饰业', '4', 'E501');
INSERT INTO `sys_way` VALUES ('E502', '工程准备活动', '3', 'E50');
INSERT INTO `sys_way` VALUES ('E5021', '建筑物拆除活动', '4', 'E502');
INSERT INTO `sys_way` VALUES ('E5029', '其他工程准备活动', '4', 'E502');
INSERT INTO `sys_way` VALUES ('E503', '提供施工设备服务', '3', 'E50');
INSERT INTO `sys_way` VALUES ('E5030', '提供施工设备服务', '4', 'E503');
INSERT INTO `sys_way` VALUES ('E509', '其他未列明建筑业', '3', 'E50');
INSERT INTO `sys_way` VALUES ('E5090', '其他未列明建筑业', '4', 'E509');
INSERT INTO `sys_way` VALUES ('F', '批发和零售业', '1', null);
INSERT INTO `sys_way` VALUES ('F51', '批发业', '2', 'F');
INSERT INTO `sys_way` VALUES ('F511', '农、林、牧产品批发', '3', 'F51');
INSERT INTO `sys_way` VALUES ('F5111', '谷物、豆及薯类批发', '4', 'F511');
INSERT INTO `sys_way` VALUES ('F5112', '种子批发', '4', 'F511');
INSERT INTO `sys_way` VALUES ('F5113', '饲料批发', '4', 'F511');
INSERT INTO `sys_way` VALUES ('F5114', '棉、麻批发', '4', 'F511');
INSERT INTO `sys_way` VALUES ('F5115', '林业产品批发', '4', 'F511');
INSERT INTO `sys_way` VALUES ('F5116', '牲畜批发', '4', 'F511');
INSERT INTO `sys_way` VALUES ('F5119', '其他农牧产品批发', '4', 'F511');
INSERT INTO `sys_way` VALUES ('F512', '食品、饮料及烟草制品批发', '3', 'F51');
INSERT INTO `sys_way` VALUES ('F5121', '米、面制品及食用油批发', '4', 'F512');
INSERT INTO `sys_way` VALUES ('F5122', '糕点、糖果及糖批发', '4', 'F512');
INSERT INTO `sys_way` VALUES ('F5123', '果品、蔬菜批发', '4', 'F512');
INSERT INTO `sys_way` VALUES ('F5124', '肉、禽、蛋、奶及水产品批发', '4', 'F512');
INSERT INTO `sys_way` VALUES ('F5125', '盐及调味品批发', '4', 'F512');
INSERT INTO `sys_way` VALUES ('F5126', '营养和保健品批发', '4', 'F512');
INSERT INTO `sys_way` VALUES ('F5127', '酒、饮料及茶叶批发', '4', 'F512');
INSERT INTO `sys_way` VALUES ('F5128', '烟草制品批发', '4', 'F512');
INSERT INTO `sys_way` VALUES ('F5129', '其他食品批发', '4', 'F512');
INSERT INTO `sys_way` VALUES ('F513', '纺织、服装及家庭用品批发', '3', 'F51');
INSERT INTO `sys_way` VALUES ('F5131', '纺织品、针织品及原料批发', '4', 'F513');
INSERT INTO `sys_way` VALUES ('F5132', '服装批发', '4', 'F513');
INSERT INTO `sys_way` VALUES ('F5133', '鞋帽批发', '4', 'F513');
INSERT INTO `sys_way` VALUES ('F5134', '化妆品及卫生用品批发', '4', 'F513');
INSERT INTO `sys_way` VALUES ('F5135', '厨房、卫生间用具及日用杂货批发', '4', 'F513');
INSERT INTO `sys_way` VALUES ('F5136', '灯具、装饰物品批发', '4', 'F513');
INSERT INTO `sys_way` VALUES ('F5137', '家用电器批发', '4', 'F513');
INSERT INTO `sys_way` VALUES ('F5139', '其他家庭用品批发', '4', 'F513');
INSERT INTO `sys_way` VALUES ('F514', '文化、体育用品及器材批发', '3', 'F51');
INSERT INTO `sys_way` VALUES ('F5141', '文具用品批发', '4', 'F514');
INSERT INTO `sys_way` VALUES ('F5142', '体育用品及器材批发', '4', 'F514');
INSERT INTO `sys_way` VALUES ('F5143', '图书批发', '4', 'F514');
INSERT INTO `sys_way` VALUES ('F5144', '报刊批发', '4', 'F514');
INSERT INTO `sys_way` VALUES ('F5145', '音像制品及电子出版物批发', '4', 'F514');
INSERT INTO `sys_way` VALUES ('F5146', '首饰、工艺品及收藏品批发', '4', 'F514');
INSERT INTO `sys_way` VALUES ('F5149', '其他文化用品批发', '4', 'F514');
INSERT INTO `sys_way` VALUES ('F515', '医药及医疗器材批发', '3', 'F51');
INSERT INTO `sys_way` VALUES ('F5151', '西药批发', '4', 'F515');
INSERT INTO `sys_way` VALUES ('F5152', '中药批发', '4', 'F515');
INSERT INTO `sys_way` VALUES ('F5153', '医疗用品及器材批发', '4', 'F515');
INSERT INTO `sys_way` VALUES ('F516', '矿产品、建材及化工产品批发', '3', 'F51');
INSERT INTO `sys_way` VALUES ('F5161', '煤炭及制品批发', '4', 'F516');
INSERT INTO `sys_way` VALUES ('F5162', '石油及制品批发', '4', 'F516');
INSERT INTO `sys_way` VALUES ('F5163', '非金属矿及制品批发', '4', 'F516');
INSERT INTO `sys_way` VALUES ('F5164', '金属及金属矿批发', '4', 'F516');
INSERT INTO `sys_way` VALUES ('F5165', '建材批发', '4', 'F516');
INSERT INTO `sys_way` VALUES ('F5166', '化肥批发', '4', 'F516');
INSERT INTO `sys_way` VALUES ('F5167', '农药批发', '4', 'F516');
INSERT INTO `sys_way` VALUES ('F5168', '农用薄膜批发', '4', 'F516');
INSERT INTO `sys_way` VALUES ('F5169', '其他化工产品批发', '4', 'F516');
INSERT INTO `sys_way` VALUES ('F517', '机械设备、五金产品及电子产品批发', '3', 'F51');
INSERT INTO `sys_way` VALUES ('F5171', '农业机械批发', '4', 'F517');
INSERT INTO `sys_way` VALUES ('F5172', '汽车批发', '4', 'F517');
INSERT INTO `sys_way` VALUES ('F5173', '汽车零配件批发', '4', 'F517');
INSERT INTO `sys_way` VALUES ('F5174', '摩托车及零配件批发', '4', 'F517');
INSERT INTO `sys_way` VALUES ('F5175', '五金产品批发', '4', 'F517');
INSERT INTO `sys_way` VALUES ('F5176', '电气设备批发', '4', 'F517');
INSERT INTO `sys_way` VALUES ('F5177', '计算机、软件及辅助设备批发', '4', 'F517');
INSERT INTO `sys_way` VALUES ('F5178', '通讯及广播电视设备批发', '4', 'F517');
INSERT INTO `sys_way` VALUES ('F5179', '其他机械设备及电子产品批发', '4', 'F517');
INSERT INTO `sys_way` VALUES ('F518', '贸易经纪与代理', '3', 'F51');
INSERT INTO `sys_way` VALUES ('F5181', '贸易代理', '4', 'F518');
INSERT INTO `sys_way` VALUES ('F5182', '拍卖', '4', 'F518');
INSERT INTO `sys_way` VALUES ('F5189', '其他贸易经纪与代理', '4', 'F518');
INSERT INTO `sys_way` VALUES ('F519', '其他批发业', '3', 'F51');
INSERT INTO `sys_way` VALUES ('F5191', '再生物资回收与批发', '4', 'F519');
INSERT INTO `sys_way` VALUES ('F5199', '其他未列明批发业', '4', 'F519');
INSERT INTO `sys_way` VALUES ('F52', '零售业', '2', 'F');
INSERT INTO `sys_way` VALUES ('F521', '综合零售', '3', 'F52');
INSERT INTO `sys_way` VALUES ('F5211', '百货零售', '4', 'F521');
INSERT INTO `sys_way` VALUES ('F5212', '超级市场零售', '4', 'F521');
INSERT INTO `sys_way` VALUES ('F5219', '其他综合零售', '4', 'F521');
INSERT INTO `sys_way` VALUES ('F522', '食品、饮料及烟草制品专门零售', '3', 'F52');
INSERT INTO `sys_way` VALUES ('F5221', '粮油零售', '4', 'F522');
INSERT INTO `sys_way` VALUES ('F5222', '糕点、面包零售', '4', 'F522');
INSERT INTO `sys_way` VALUES ('F5223', '果品、蔬菜零售', '4', 'F522');
INSERT INTO `sys_way` VALUES ('F5224', '肉、禽、蛋、奶及水产品零售', '4', 'F522');
INSERT INTO `sys_way` VALUES ('F5225', '营养和保健品零售', '4', 'F522');
INSERT INTO `sys_way` VALUES ('F5226', '酒、饮料及茶叶零售', '4', 'F522');
INSERT INTO `sys_way` VALUES ('F5227', '烟草制品零售', '4', 'F522');
INSERT INTO `sys_way` VALUES ('F5229', '其他食品零售', '4', 'F522');
INSERT INTO `sys_way` VALUES ('F523', '纺织、服装及日用品专门零售', '3', 'F52');
INSERT INTO `sys_way` VALUES ('F5231', '纺织品及针织品零售', '4', 'F523');
INSERT INTO `sys_way` VALUES ('F5232', '服装零售', '4', 'F523');
INSERT INTO `sys_way` VALUES ('F5233', '鞋帽零售', '4', 'F523');
INSERT INTO `sys_way` VALUES ('F5234', '化妆品及卫生用品零售', '4', 'F523');
INSERT INTO `sys_way` VALUES ('F5235', '钟表、眼镜零售', '4', 'F523');
INSERT INTO `sys_way` VALUES ('F5236', '箱、包零售', '4', 'F523');
INSERT INTO `sys_way` VALUES ('F5237', '厨房用具及日用杂品零售', '4', 'F523');
INSERT INTO `sys_way` VALUES ('F5238', '自行车零售', '4', 'F523');
INSERT INTO `sys_way` VALUES ('F5239', '其他日用品零售', '4', 'F523');
INSERT INTO `sys_way` VALUES ('F524', '文化、体育用品及器材专门零售', '3', 'F52');
INSERT INTO `sys_way` VALUES ('F5241', '文具用品零售', '4', 'F524');
INSERT INTO `sys_way` VALUES ('F5242', '体育用品及器材零售', '4', 'F524');
INSERT INTO `sys_way` VALUES ('F5243', '图书、报刊零售', '4', 'F524');
INSERT INTO `sys_way` VALUES ('F5244', '音像制品及电子出版物零售', '4', 'F524');
INSERT INTO `sys_way` VALUES ('F5245', '珠宝首饰零售', '4', 'F524');
INSERT INTO `sys_way` VALUES ('F5246', '工艺美术品及收藏品零售', '4', 'F524');
INSERT INTO `sys_way` VALUES ('F5247', '乐器零售', '4', 'F524');
INSERT INTO `sys_way` VALUES ('F5248', '照相器材零售', '4', 'F524');
INSERT INTO `sys_way` VALUES ('F5249', '其他文化用品零售', '4', 'F524');
INSERT INTO `sys_way` VALUES ('F525', '医药及医疗器材专门零售', '3', 'F52');
INSERT INTO `sys_way` VALUES ('F5251', '药品零售', '4', 'F525');
INSERT INTO `sys_way` VALUES ('F5252', '医疗用品及器材零售', '4', 'F525');
INSERT INTO `sys_way` VALUES ('F526', '汽车、摩托车、燃料及零配件专门零售', '3', 'F52');
INSERT INTO `sys_way` VALUES ('F5261', '汽车零售', '4', 'F526');
INSERT INTO `sys_way` VALUES ('F5262', '汽车零配件零售', '4', 'F526');
INSERT INTO `sys_way` VALUES ('F5263', '摩托车及零配件零售', '4', 'F526');
INSERT INTO `sys_way` VALUES ('F5264', '机动车燃料零售', '4', 'F526');
INSERT INTO `sys_way` VALUES ('F527', '家用电器及电子产品专门零售', '3', 'F52');
INSERT INTO `sys_way` VALUES ('F5271', '家用视听设备零售', '4', 'F527');
INSERT INTO `sys_way` VALUES ('F5272', '日用家电设备零售', '4', 'F527');
INSERT INTO `sys_way` VALUES ('F5273', '计算机、软件及辅助设备零售', '4', 'F527');
INSERT INTO `sys_way` VALUES ('F5274', '通信设备零售', '4', 'F527');
INSERT INTO `sys_way` VALUES ('F5279', '其他电子产品零售', '4', 'F527');
INSERT INTO `sys_way` VALUES ('F528', '五金、家具及室内装饰材料专门零售', '3', 'F52');
INSERT INTO `sys_way` VALUES ('F5281', '五金零售', '4', 'F528');
INSERT INTO `sys_way` VALUES ('F5282', '灯具零售', '4', 'F528');
INSERT INTO `sys_way` VALUES ('F5283', '家具零售', '4', 'F528');
INSERT INTO `sys_way` VALUES ('F5284', '涂料零售', '4', 'F528');
INSERT INTO `sys_way` VALUES ('F5285', '卫生洁具零售', '4', 'F528');
INSERT INTO `sys_way` VALUES ('F5286', '木质装饰材料零售', '4', 'F528');
INSERT INTO `sys_way` VALUES ('F5287', '陶瓷、石材装饰材料零售', '4', 'F528');
INSERT INTO `sys_way` VALUES ('F5289', '其他室内装饰材料零售', '4', 'F528');
INSERT INTO `sys_way` VALUES ('F529', '货摊、无店铺及其他零售业', '3', 'F52');
INSERT INTO `sys_way` VALUES ('F5291', '货摊食品零售', '4', 'F529');
INSERT INTO `sys_way` VALUES ('F5292', '货摊纺织、服装及鞋零售', '4', 'F529');
INSERT INTO `sys_way` VALUES ('F5293', '货摊日用品零售', '4', 'F529');
INSERT INTO `sys_way` VALUES ('F5294', '互联网零售', '4', 'F529');
INSERT INTO `sys_way` VALUES ('F5295', '邮购及电视、电话零售', '4', 'F529');
INSERT INTO `sys_way` VALUES ('F5296', '旧货零售', '4', 'F529');
INSERT INTO `sys_way` VALUES ('F5297', '生活用燃料零售', '4', 'F529');
INSERT INTO `sys_way` VALUES ('F5299', '其他未列明零售业', '4', 'F529');
INSERT INTO `sys_way` VALUES ('G', '交通运输、仓储和邮政业', '1', null);
INSERT INTO `sys_way` VALUES ('G53', '铁路运输业', '2', 'G');
INSERT INTO `sys_way` VALUES ('G531', '铁路旅客运输', '3', 'G53');
INSERT INTO `sys_way` VALUES ('G5310', '铁路旅客运输', '4', 'G531');
INSERT INTO `sys_way` VALUES ('G532', '铁路货物运输', '3', 'G53');
INSERT INTO `sys_way` VALUES ('G5320', '铁路货物运输', '4', 'G532');
INSERT INTO `sys_way` VALUES ('G533', '铁路运输辅助活动', '3', 'G53');
INSERT INTO `sys_way` VALUES ('G5331', '客运火车站', '4', 'G533');
INSERT INTO `sys_way` VALUES ('G5332', '货运火车站', '4', 'G533');
INSERT INTO `sys_way` VALUES ('G5339', '其他铁路运输辅助活动', '4', 'G533');
INSERT INTO `sys_way` VALUES ('G54', '道路运输业', '2', 'G');
INSERT INTO `sys_way` VALUES ('G541', '城市公共交通运输', '3', 'G54');
INSERT INTO `sys_way` VALUES ('G5411', '公共电汽车客运', '4', 'G541');
INSERT INTO `sys_way` VALUES ('G5412', '城市轨道交通', '4', 'G541');
INSERT INTO `sys_way` VALUES ('G5413', '出租车客运', '4', 'G541');
INSERT INTO `sys_way` VALUES ('G5419', '其他城市公共交通运输', '4', 'G541');
INSERT INTO `sys_way` VALUES ('G542', '公路旅客运输', '3', 'G54');
INSERT INTO `sys_way` VALUES ('G5420', '公路旅客运输', '4', 'G542');
INSERT INTO `sys_way` VALUES ('G543', '道路货物运输', '3', 'G54');
INSERT INTO `sys_way` VALUES ('G5430', '道路货物运输', '4', 'G543');
INSERT INTO `sys_way` VALUES ('G544', '道路运输辅助活动', '3', 'G54');
INSERT INTO `sys_way` VALUES ('G5441', '客运汽车站', '4', 'G544');
INSERT INTO `sys_way` VALUES ('G5442', '公路管理与养护', '4', 'G544');
INSERT INTO `sys_way` VALUES ('G5449', '其他道路运输辅助活动', '4', 'G544');
INSERT INTO `sys_way` VALUES ('G55', '水上运输业', '2', 'G');
INSERT INTO `sys_way` VALUES ('G551', '水上旅客运输', '3', 'G55');
INSERT INTO `sys_way` VALUES ('G5511', '海洋旅客运输', '4', 'G551');
INSERT INTO `sys_way` VALUES ('G5512', '内河旅客运输', '4', 'G551');
INSERT INTO `sys_way` VALUES ('G5513', '客运轮渡运输', '4', 'G551');
INSERT INTO `sys_way` VALUES ('G552', '水上货物运输', '3', 'G55');
INSERT INTO `sys_way` VALUES ('G5521', '远洋货物运输', '4', 'G552');
INSERT INTO `sys_way` VALUES ('G5522', '沿海货物运输', '4', 'G552');
INSERT INTO `sys_way` VALUES ('G5523', '内河货物运输', '4', 'G552');
INSERT INTO `sys_way` VALUES ('G553', '水上运输辅助活动', '3', 'G55');
INSERT INTO `sys_way` VALUES ('G5531', '客运港口', '4', 'G553');
INSERT INTO `sys_way` VALUES ('G5532', '货运港口', '4', 'G553');
INSERT INTO `sys_way` VALUES ('G5539', '其他水上运输辅助活动', '4', 'G553');
INSERT INTO `sys_way` VALUES ('G56', '航空运输业', '2', 'G');
INSERT INTO `sys_way` VALUES ('G561', '航空客货运输', '3', 'G56');
INSERT INTO `sys_way` VALUES ('G5611', '航空旅客运输', '4', 'G561');
INSERT INTO `sys_way` VALUES ('G5612', '航空货物运输', '4', 'G561');
INSERT INTO `sys_way` VALUES ('G562', '通用航空服务', '3', 'G56');
INSERT INTO `sys_way` VALUES ('G5620', '通用航空服务', '4', 'G562');
INSERT INTO `sys_way` VALUES ('G563', '航空运输辅助活动', '3', 'G56');
INSERT INTO `sys_way` VALUES ('G5631', '机场', '4', 'G563');
INSERT INTO `sys_way` VALUES ('G5632', '空中交通管理', '4', 'G563');
INSERT INTO `sys_way` VALUES ('G5639', '其他航空运输辅助活动', '4', 'G563');
INSERT INTO `sys_way` VALUES ('G57', '管道运输业', '2', 'G');
INSERT INTO `sys_way` VALUES ('G570', '管道运输业', '3', 'G57');
INSERT INTO `sys_way` VALUES ('G5700', '管道运输业', '4', 'G570');
INSERT INTO `sys_way` VALUES ('G58', '装卸搬运和运输代理业', '2', 'G');
INSERT INTO `sys_way` VALUES ('G581', '装卸搬运', '3', 'G58');
INSERT INTO `sys_way` VALUES ('G5810', '装卸搬运', '4', 'G581');
INSERT INTO `sys_way` VALUES ('G582', '运输代理业', '3', 'G58');
INSERT INTO `sys_way` VALUES ('G5821', '货物运输代理', '4', 'G582');
INSERT INTO `sys_way` VALUES ('G5822', '旅客票务代理', '4', 'G582');
INSERT INTO `sys_way` VALUES ('G5829', '其他运输代理业', '4', 'G582');
INSERT INTO `sys_way` VALUES ('G59', '仓储业', '2', 'G');
INSERT INTO `sys_way` VALUES ('G591', '谷物、棉花等农产品仓储', '3', 'G59');
INSERT INTO `sys_way` VALUES ('G5911', '谷物仓储', '4', 'G591');
INSERT INTO `sys_way` VALUES ('G5912', '棉花仓储', '4', 'G591');
INSERT INTO `sys_way` VALUES ('G5919', '其他农产品仓储', '4', 'G591');
INSERT INTO `sys_way` VALUES ('G599', '其他仓储业', '3', 'G59');
INSERT INTO `sys_way` VALUES ('G5990', '其他仓储业', '4', 'G599');
INSERT INTO `sys_way` VALUES ('G60', '邮政业', '2', 'G');
INSERT INTO `sys_way` VALUES ('G601', '邮政基本服务', '3', 'G60');
INSERT INTO `sys_way` VALUES ('G6010', '邮政基本服务', '4', 'G601');
INSERT INTO `sys_way` VALUES ('G602', '快递服务', '3', 'G60');
INSERT INTO `sys_way` VALUES ('G6020', '快递服务', '4', 'G602');
INSERT INTO `sys_way` VALUES ('H', '住宿和餐饮业', '1', null);
INSERT INTO `sys_way` VALUES ('H61', '住宿业', '2', 'H');
INSERT INTO `sys_way` VALUES ('H611', '旅游饭店', '3', 'H61');
INSERT INTO `sys_way` VALUES ('H6110', '旅游饭店', '4', 'H611');
INSERT INTO `sys_way` VALUES ('H612', '一般旅馆', '3', 'H61');
INSERT INTO `sys_way` VALUES ('H6120', '一般旅馆', '4', 'H612');
INSERT INTO `sys_way` VALUES ('H619', '其他住宿业', '3', 'H61');
INSERT INTO `sys_way` VALUES ('H6190', '其他住宿业', '4', 'H619');
INSERT INTO `sys_way` VALUES ('H62', '餐饮业', '2', 'H');
INSERT INTO `sys_way` VALUES ('H621', '正餐服务', '3', 'H62');
INSERT INTO `sys_way` VALUES ('H6210', '正餐服务', '4', 'H621');
INSERT INTO `sys_way` VALUES ('H622', '快餐服务', '3', 'H62');
INSERT INTO `sys_way` VALUES ('H6220', '快餐服务', '4', 'H622');
INSERT INTO `sys_way` VALUES ('H623', '饮料及冷饮服务', '3', 'H62');
INSERT INTO `sys_way` VALUES ('H6231', '茶馆服务', '4', 'H623');
INSERT INTO `sys_way` VALUES ('H6232', '咖啡馆服务', '4', 'H623');
INSERT INTO `sys_way` VALUES ('H6233', '酒吧服务', '4', 'H623');
INSERT INTO `sys_way` VALUES ('H6239', '其他饮料及冷饮服务', '4', 'H623');
INSERT INTO `sys_way` VALUES ('H629', '其他餐饮业', '3', 'H62');
INSERT INTO `sys_way` VALUES ('H6291', '小吃服务', '4', 'H629');
INSERT INTO `sys_way` VALUES ('H6292', '餐饮配送服务', '4', 'H629');
INSERT INTO `sys_way` VALUES ('H6299', '其他未列明餐饮业', '4', 'H629');
INSERT INTO `sys_way` VALUES ('I', '信息传输、软件和信息技术服务业', '1', null);
INSERT INTO `sys_way` VALUES ('I63', '电信、广播电视和卫星传输服务', '2', 'I');
INSERT INTO `sys_way` VALUES ('I631', '电信', '3', 'I63');
INSERT INTO `sys_way` VALUES ('I6311', '固定电信服务', '4', 'I631');
INSERT INTO `sys_way` VALUES ('I6312', '移动电信服务', '4', 'I631');
INSERT INTO `sys_way` VALUES ('I6319', '其他电信服务', '4', 'I631');
INSERT INTO `sys_way` VALUES ('I632', '广播电视传输服务', '3', 'I63');
INSERT INTO `sys_way` VALUES ('I6321', '有线广播电视传输服务', '4', 'I632');
INSERT INTO `sys_way` VALUES ('I6322', '无线广播电视传输服务', '4', 'I632');
INSERT INTO `sys_way` VALUES ('I633', '卫星传输服务', '3', 'I63');
INSERT INTO `sys_way` VALUES ('I6330', '卫星传输服务', '4', 'I633');
INSERT INTO `sys_way` VALUES ('I64', '互联网和相关服务', '2', 'I');
INSERT INTO `sys_way` VALUES ('I641', '互联网接入及相关服务', '3', 'I64');
INSERT INTO `sys_way` VALUES ('I6410', '互联网接入及相关服务', '4', 'I641');
INSERT INTO `sys_way` VALUES ('I642', '互联网信息服务', '3', 'I64');
INSERT INTO `sys_way` VALUES ('I6420', '互联网信息服务', '4', 'I642');
INSERT INTO `sys_way` VALUES ('I649', '其他互联网服务', '3', 'I64');
INSERT INTO `sys_way` VALUES ('I6490', '其他互联网服务', '4', 'I649');
INSERT INTO `sys_way` VALUES ('I65', '软件和信息技术服务业', '2', 'I');
INSERT INTO `sys_way` VALUES ('I651', '软件开发', '3', 'I65');
INSERT INTO `sys_way` VALUES ('I6510', '软件开发', '4', 'I651');
INSERT INTO `sys_way` VALUES ('I652', '信息系统集成服务', '3', 'I65');
INSERT INTO `sys_way` VALUES ('I6520', '信息系统集成服务', '4', 'I652');
INSERT INTO `sys_way` VALUES ('I653', '信息技术咨询服务', '3', 'I65');
INSERT INTO `sys_way` VALUES ('I6530', '信息技术咨询服务', '4', 'I653');
INSERT INTO `sys_way` VALUES ('I654', '数据处理和存储服务', '3', 'I65');
INSERT INTO `sys_way` VALUES ('I6540', '数据处理和存储服务', '4', 'I654');
INSERT INTO `sys_way` VALUES ('I655', '集成电路设计', '3', 'I65');
INSERT INTO `sys_way` VALUES ('I6550', '集成电路设计', '4', 'I655');
INSERT INTO `sys_way` VALUES ('I659', '其他信息技术服务业', '3', 'I65');
INSERT INTO `sys_way` VALUES ('I6591', '数字内容服务', '4', 'I659');
INSERT INTO `sys_way` VALUES ('I6592', '呼叫中心', '4', 'I659');
INSERT INTO `sys_way` VALUES ('I6599', '其他未列明信息技术服务业', '4', 'I659');
INSERT INTO `sys_way` VALUES ('J', '金融业', '1', null);
INSERT INTO `sys_way` VALUES ('J66', '货币金融服务', '2', 'J');
INSERT INTO `sys_way` VALUES ('J661', '中央银行服务', '3', 'J66');
INSERT INTO `sys_way` VALUES ('J6610', '中央银行服务', '4', 'J661');
INSERT INTO `sys_way` VALUES ('J662', '货币银行服务', '3', 'J66');
INSERT INTO `sys_way` VALUES ('J6620', '货币银行服务', '4', 'J662');
INSERT INTO `sys_way` VALUES ('J663', '非货币银行服务', '3', 'J66');
INSERT INTO `sys_way` VALUES ('J6631', '金融租赁服务', '4', 'J663');
INSERT INTO `sys_way` VALUES ('J6632', '财务公司', '4', 'J663');
INSERT INTO `sys_way` VALUES ('J6633', '典当', '4', 'J663');
INSERT INTO `sys_way` VALUES ('J6639', '其他非货币银行服务', '4', 'J663');
INSERT INTO `sys_way` VALUES ('J664', '银行监管服务', '3', 'J66');
INSERT INTO `sys_way` VALUES ('J6640', '银行监管服务', '4', 'J664');
INSERT INTO `sys_way` VALUES ('J67', '资本市场服务', '2', 'J');
INSERT INTO `sys_way` VALUES ('J671', '证券市场服务', '3', 'J67');
INSERT INTO `sys_way` VALUES ('J6711', '证券市场管理服务', '4', 'J671');
INSERT INTO `sys_way` VALUES ('J6712', '证券经纪交易服务', '4', 'J671');
INSERT INTO `sys_way` VALUES ('J6713', '基金管理服务', '4', 'J671');
INSERT INTO `sys_way` VALUES ('J672', '期货市场服务', '3', 'J67');
INSERT INTO `sys_way` VALUES ('J6721', '期货市场管理服务', '4', 'J672');
INSERT INTO `sys_way` VALUES ('J6729', '其他期货市场服务', '4', 'J672');
INSERT INTO `sys_way` VALUES ('J673', '证券期货监管服务', '3', 'J67');
INSERT INTO `sys_way` VALUES ('J6730', '证券期货监管服务', '4', 'J673');
INSERT INTO `sys_way` VALUES ('J674', '资本投资服务', '3', 'J67');
INSERT INTO `sys_way` VALUES ('J6740', '资本投资服务', '4', 'J674');
INSERT INTO `sys_way` VALUES ('J679', '其他资本市场服务', '3', 'J67');
INSERT INTO `sys_way` VALUES ('J6790', '其他资本市场服务', '4', 'J679');
INSERT INTO `sys_way` VALUES ('J68', '保险业', '2', 'J');
INSERT INTO `sys_way` VALUES ('J681', '人身保险', '3', 'J68');
INSERT INTO `sys_way` VALUES ('J6811', '人寿保险', '4', 'J681');
INSERT INTO `sys_way` VALUES ('J6812', '健康和意外保险', '4', 'J681');
INSERT INTO `sys_way` VALUES ('J682', '财产保险', '3', 'J68');
INSERT INTO `sys_way` VALUES ('J6820', '财产保险', '4', 'J682');
INSERT INTO `sys_way` VALUES ('J683', '再保险', '3', 'J68');
INSERT INTO `sys_way` VALUES ('J6830', '再保险', '4', 'J683');
INSERT INTO `sys_way` VALUES ('J684', '养老金', '3', 'J68');
INSERT INTO `sys_way` VALUES ('J6840', '养老金', '4', 'J684');
INSERT INTO `sys_way` VALUES ('J685', '保险经纪与代理服务', '3', 'J68');
INSERT INTO `sys_way` VALUES ('J6850', '保险经纪与代理服务', '4', 'J685');
INSERT INTO `sys_way` VALUES ('J686', '保险监管服务', '3', 'J68');
INSERT INTO `sys_way` VALUES ('J6860', '保险监管服务', '4', 'J686');
INSERT INTO `sys_way` VALUES ('J689', '其他保险活动', '3', 'J68');
INSERT INTO `sys_way` VALUES ('J6891', '风险和损失评估', '4', 'J689');
INSERT INTO `sys_way` VALUES ('J6899', '其他未列明保险活动', '4', 'J689');
INSERT INTO `sys_way` VALUES ('J69', '其他金融业', '2', 'J');
INSERT INTO `sys_way` VALUES ('J691', '金融信托与管理服务', '3', 'J69');
INSERT INTO `sys_way` VALUES ('J6910', '金融信托与管理服务', '4', 'J691');
INSERT INTO `sys_way` VALUES ('J692', '控股公司服务', '3', 'J69');
INSERT INTO `sys_way` VALUES ('J6920', '控股公司服务', '4', 'J692');
INSERT INTO `sys_way` VALUES ('J693', '非金融机构支付服务', '3', 'J69');
INSERT INTO `sys_way` VALUES ('J6930', '非金融机构支付服务', '4', 'J693');
INSERT INTO `sys_way` VALUES ('J694', '金融信息服务', '3', 'J69');
INSERT INTO `sys_way` VALUES ('J6940', '金融信息服务', '4', 'J694');
INSERT INTO `sys_way` VALUES ('J699', '其他未列明金融业', '3', 'J69');
INSERT INTO `sys_way` VALUES ('J6990', '其他未列明金融业', '4', 'J699');
INSERT INTO `sys_way` VALUES ('K', '房地产业', '1', null);
INSERT INTO `sys_way` VALUES ('K70', '房地产业', '2', 'K');
INSERT INTO `sys_way` VALUES ('K701', '房地产开发经营', '3', 'K70');
INSERT INTO `sys_way` VALUES ('K7010', '房地产开发经营', '4', 'K701');
INSERT INTO `sys_way` VALUES ('K702', '物业管理', '3', 'K70');
INSERT INTO `sys_way` VALUES ('K7020', '物业管理', '4', 'K702');
INSERT INTO `sys_way` VALUES ('K703', '房地产中介服务', '3', 'K70');
INSERT INTO `sys_way` VALUES ('K7030', '房地产中介服务', '4', 'K703');
INSERT INTO `sys_way` VALUES ('K704', '自有房地产经营活动', '3', 'K70');
INSERT INTO `sys_way` VALUES ('K7040', '自有房地产经营活动', '4', 'K704');
INSERT INTO `sys_way` VALUES ('K709', '其他房地产业', '3', 'K70');
INSERT INTO `sys_way` VALUES ('K7090', '其他房地产业', '4', 'K709');
INSERT INTO `sys_way` VALUES ('L', '租赁和商务服务业', '1', null);
INSERT INTO `sys_way` VALUES ('L71', '租赁业', '2', 'L');
INSERT INTO `sys_way` VALUES ('L711', '机械设备租赁', '3', 'L71');
INSERT INTO `sys_way` VALUES ('L7111', '汽车租赁', '4', 'L711');
INSERT INTO `sys_way` VALUES ('L7112', '农业机械租赁', '4', 'L711');
INSERT INTO `sys_way` VALUES ('L7113', '建筑工程机械与设备租赁', '4', 'L711');
INSERT INTO `sys_way` VALUES ('L7114', '计算机及通讯设备租赁', '4', 'L711');
INSERT INTO `sys_way` VALUES ('L7119', '其他机械与设备租赁', '4', 'L711');
INSERT INTO `sys_way` VALUES ('L712', '文化及日用品出租', '3', 'L71');
INSERT INTO `sys_way` VALUES ('L7121', '娱乐及体育设备出租', '4', 'L712');
INSERT INTO `sys_way` VALUES ('L7122', '图书出租', '4', 'L712');
INSERT INTO `sys_way` VALUES ('L7123', '音像制品出租', '4', 'L712');
INSERT INTO `sys_way` VALUES ('L7129', '其他文化及日用品出租', '4', 'L712');
INSERT INTO `sys_way` VALUES ('L72', '商务服务业', '2', 'L');
INSERT INTO `sys_way` VALUES ('L721', '企业管理服务', '3', 'L72');
INSERT INTO `sys_way` VALUES ('L7211', '企业总部管理', '4', 'L721');
INSERT INTO `sys_way` VALUES ('L7212', '投资与资产管理', '4', 'L721');
INSERT INTO `sys_way` VALUES ('L7213', '单位后勤管理服务', '4', 'L721');
INSERT INTO `sys_way` VALUES ('L7219', '其他企业管理服务', '4', 'L721');
INSERT INTO `sys_way` VALUES ('L722', '法律服务', '3', 'L72');
INSERT INTO `sys_way` VALUES ('L7221', '律师及相关法律服务', '4', 'L722');
INSERT INTO `sys_way` VALUES ('L7222', '公证服务', '4', 'L722');
INSERT INTO `sys_way` VALUES ('L7229', '其他法律服务', '4', 'L722');
INSERT INTO `sys_way` VALUES ('L723', '咨询与调查', '3', 'L72');
INSERT INTO `sys_way` VALUES ('L7231', '会计、审计及税务服务', '4', 'L723');
INSERT INTO `sys_way` VALUES ('L7232', '市场调查', '4', 'L723');
INSERT INTO `sys_way` VALUES ('L7233', '社会经济咨询', '4', 'L723');
INSERT INTO `sys_way` VALUES ('L7239', '其他专业咨询', '4', 'L723');
INSERT INTO `sys_way` VALUES ('L724', '广告业', '3', 'L72');
INSERT INTO `sys_way` VALUES ('L7240', '广告业', '4', 'L724');
INSERT INTO `sys_way` VALUES ('L725', '知识产权服务', '3', 'L72');
INSERT INTO `sys_way` VALUES ('L7250', '知识产权服务', '4', 'L725');
INSERT INTO `sys_way` VALUES ('L726', '人力资源服务', '3', 'L72');
INSERT INTO `sys_way` VALUES ('L7261', '公共就业服务', '4', 'L726');
INSERT INTO `sys_way` VALUES ('L7262', '职业中介服务', '4', 'L726');
INSERT INTO `sys_way` VALUES ('L7263', '劳务派遣服务', '4', 'L726');
INSERT INTO `sys_way` VALUES ('L7269', '其他人力资源服务', '4', 'L726');
INSERT INTO `sys_way` VALUES ('L727', '旅行社及相关服务', '3', 'L72');
INSERT INTO `sys_way` VALUES ('L7271', '旅行社服务', '4', 'L727');
INSERT INTO `sys_way` VALUES ('L7272', '旅游管理服务', '4', 'L727');
INSERT INTO `sys_way` VALUES ('L7279', '其他旅行社相关服务', '4', 'L727');
INSERT INTO `sys_way` VALUES ('L728', '安全保护服务', '3', 'L72');
INSERT INTO `sys_way` VALUES ('L7281', '安全服务', '4', 'L728');
INSERT INTO `sys_way` VALUES ('L7282', '安全系统监控服务', '4', 'L728');
INSERT INTO `sys_way` VALUES ('L7289', '其他安全保护服务', '4', 'L728');
INSERT INTO `sys_way` VALUES ('L729', '其他商务服务业', '3', 'L72');
INSERT INTO `sys_way` VALUES ('L7291', '市场管理', '4', 'L729');
INSERT INTO `sys_way` VALUES ('L7292', '会议及展览服务', '4', 'L729');
INSERT INTO `sys_way` VALUES ('L7293', '包装服务', '4', 'L729');
INSERT INTO `sys_way` VALUES ('L7294', '办公服务', '4', 'L729');
INSERT INTO `sys_way` VALUES ('L7295', '信用服务', '4', 'L729');
INSERT INTO `sys_way` VALUES ('L7296', '担保服务', '4', 'L729');
INSERT INTO `sys_way` VALUES ('L7299', '其他未列明商务服务业', '4', 'L729');
INSERT INTO `sys_way` VALUES ('M', '科学研究和技术服务业', '1', null);
INSERT INTO `sys_way` VALUES ('M73', '研究和试验发展', '2', 'M');
INSERT INTO `sys_way` VALUES ('M731', '自然科学研究和试验发展', '3', 'M73');
INSERT INTO `sys_way` VALUES ('M7310', '自然科学研究和试验发展', '4', 'M731');
INSERT INTO `sys_way` VALUES ('M732', '工程和技术研究和试验发展', '3', 'M73');
INSERT INTO `sys_way` VALUES ('M7320', '工程和技术研究和试验发展', '4', 'M732');
INSERT INTO `sys_way` VALUES ('M733', '农业科学研究和试验发展', '3', 'M73');
INSERT INTO `sys_way` VALUES ('M7330', '农业科学研究和试验发展', '4', 'M733');
INSERT INTO `sys_way` VALUES ('M734', '医学研究和试验发展', '3', 'M73');
INSERT INTO `sys_way` VALUES ('M7340', '医学研究和试验发展', '4', 'M734');
INSERT INTO `sys_way` VALUES ('M735', '社会人文科学研究', '3', 'M73');
INSERT INTO `sys_way` VALUES ('M7350', '社会人文科学研究', '4', 'M735');
INSERT INTO `sys_way` VALUES ('M74', '专业技术服务业', '2', 'M');
INSERT INTO `sys_way` VALUES ('M741', '气象服务', '3', 'M74');
INSERT INTO `sys_way` VALUES ('M7410', '气象服务', '4', 'M741');
INSERT INTO `sys_way` VALUES ('M742', '地震服务', '3', 'M74');
INSERT INTO `sys_way` VALUES ('M7420', '地震服务', '4', 'M742');
INSERT INTO `sys_way` VALUES ('M743', '海洋服务', '3', 'M74');
INSERT INTO `sys_way` VALUES ('M7430', '海洋服务', '4', 'M743');
INSERT INTO `sys_way` VALUES ('M744', '测绘服务', '3', 'M74');
INSERT INTO `sys_way` VALUES ('M7440', '测绘服务', '4', 'M744');
INSERT INTO `sys_way` VALUES ('M745', '质检技术服务', '3', 'M74');
INSERT INTO `sys_way` VALUES ('M7450', '质检技术服务', '4', 'M745');
INSERT INTO `sys_way` VALUES ('M746', '环境与生态监测', '3', 'M74');
INSERT INTO `sys_way` VALUES ('M7461', '环境保护监测', '4', 'M746');
INSERT INTO `sys_way` VALUES ('M7462', '生态监测', '4', 'M746');
INSERT INTO `sys_way` VALUES ('M747', '地质勘查', '3', 'M74');
INSERT INTO `sys_way` VALUES ('M7471', '能源矿产地质勘查', '4', 'M747');
INSERT INTO `sys_way` VALUES ('M7472', '固体矿产地质勘查', '4', 'M747');
INSERT INTO `sys_way` VALUES ('M7473', '水、二氧化碳等矿产地质勘查', '4', 'M747');
INSERT INTO `sys_way` VALUES ('M7474', '基础地质勘查', '4', 'M747');
INSERT INTO `sys_way` VALUES ('M7475', '地质勘查技术服务', '4', 'M747');
INSERT INTO `sys_way` VALUES ('M748', '工程技术', '3', 'M74');
INSERT INTO `sys_way` VALUES ('M7481', '工程管理服务', '4', 'M748');
INSERT INTO `sys_way` VALUES ('M7482', '工程勘察设计', '4', 'M748');
INSERT INTO `sys_way` VALUES ('M7483', '规划管理', '4', 'M748');
INSERT INTO `sys_way` VALUES ('M749', '其他专业技术服务业', '3', 'M74');
INSERT INTO `sys_way` VALUES ('M7491', '专业化设计服务', '4', 'M749');
INSERT INTO `sys_way` VALUES ('M7492', '摄影扩印服务', '4', 'M749');
INSERT INTO `sys_way` VALUES ('M7493', '兽医服务', '4', 'M749');
INSERT INTO `sys_way` VALUES ('M7499', '其他未列明专业技术服务业', '4', 'M749');
INSERT INTO `sys_way` VALUES ('M75', '科技推广和应用服务业', '2', 'M');
INSERT INTO `sys_way` VALUES ('M751', '技术推广服务', '3', 'M75');
INSERT INTO `sys_way` VALUES ('M7511', '农业技术推广服务', '4', 'M751');
INSERT INTO `sys_way` VALUES ('M7512', '生物技术推广服务', '4', 'M751');
INSERT INTO `sys_way` VALUES ('M7513', '新材料技术推广服务', '4', 'M751');
INSERT INTO `sys_way` VALUES ('M7514', '节能技术推广服务', '4', 'M751');
INSERT INTO `sys_way` VALUES ('M7519', '其他技术推广服务', '4', 'M751');
INSERT INTO `sys_way` VALUES ('M752', '科技中介服务', '3', 'M75');
INSERT INTO `sys_way` VALUES ('M7520', '科技中介服务', '4', 'M752');
INSERT INTO `sys_way` VALUES ('M759', '其他科技推广和应用服务业', '3', 'M75');
INSERT INTO `sys_way` VALUES ('M7590', '其他科技推广和应用服务业', '4', 'M759');
INSERT INTO `sys_way` VALUES ('N', '水利、环境和公共设施管理业', '1', null);
INSERT INTO `sys_way` VALUES ('N76', '水利管理业', '2', 'N');
INSERT INTO `sys_way` VALUES ('N761', '防洪除涝设施管理', '3', 'N76');
INSERT INTO `sys_way` VALUES ('N7610', '防洪除涝设施管理', '4', 'N761');
INSERT INTO `sys_way` VALUES ('N762', '水资源管理', '3', 'N76');
INSERT INTO `sys_way` VALUES ('N7620', '水资源管理', '4', 'N762');
INSERT INTO `sys_way` VALUES ('N763', '天然水收集与分配', '3', 'N76');
INSERT INTO `sys_way` VALUES ('N7630', '天然水收集与分配', '4', 'N763');
INSERT INTO `sys_way` VALUES ('N764', '水文服务', '3', 'N76');
INSERT INTO `sys_way` VALUES ('N7640', '水文服务', '4', 'N764');
INSERT INTO `sys_way` VALUES ('N769', '其他水利管理业', '3', 'N76');
INSERT INTO `sys_way` VALUES ('N7690', '其他水利管理业', '4', 'N769');
INSERT INTO `sys_way` VALUES ('N77', '生态保护和环境治理业', '2', 'N');
INSERT INTO `sys_way` VALUES ('N771', '生态保护', '3', 'N77');
INSERT INTO `sys_way` VALUES ('N7711', '自然保护区管理', '4', 'N771');
INSERT INTO `sys_way` VALUES ('N7712', '野生动物保护', '4', 'N771');
INSERT INTO `sys_way` VALUES ('N7713', '野生植物保护', '4', 'N771');
INSERT INTO `sys_way` VALUES ('N7719', '其他自然保护', '4', 'N771');
INSERT INTO `sys_way` VALUES ('N772', '环境治理业', '3', 'N77');
INSERT INTO `sys_way` VALUES ('N7721', '水污染治理', '4', 'N772');
INSERT INTO `sys_way` VALUES ('N7722', '大气污染治理', '4', 'N772');
INSERT INTO `sys_way` VALUES ('N7723', '固体废物治理', '4', 'N772');
INSERT INTO `sys_way` VALUES ('N7724', '危险废物治理', '4', 'N772');
INSERT INTO `sys_way` VALUES ('N7725', '放射性废物治理', '4', 'N772');
INSERT INTO `sys_way` VALUES ('N7729', '其他污染治理', '4', 'N772');
INSERT INTO `sys_way` VALUES ('N78', '公共设施管理业', '2', 'N');
INSERT INTO `sys_way` VALUES ('N781', '市政设施管理', '3', 'N78');
INSERT INTO `sys_way` VALUES ('N7810', '市政设施管理', '4', 'N781');
INSERT INTO `sys_way` VALUES ('N782', '环境卫生管理', '3', 'N78');
INSERT INTO `sys_way` VALUES ('N7820', '环境卫生管理', '4', 'N782');
INSERT INTO `sys_way` VALUES ('N783', '城乡市容管理', '3', 'N78');
INSERT INTO `sys_way` VALUES ('N7830', '城乡市容管理', '4', 'N783');
INSERT INTO `sys_way` VALUES ('N784', '绿化管理', '3', 'N78');
INSERT INTO `sys_way` VALUES ('N7840', '绿化管理', '4', 'N784');
INSERT INTO `sys_way` VALUES ('N785', '公园和游览景区管理', '3', 'N78');
INSERT INTO `sys_way` VALUES ('N7851', '公园管理', '4', 'N785');
INSERT INTO `sys_way` VALUES ('N7852', '游览景区管理', '4', 'N785');
INSERT INTO `sys_way` VALUES ('O', '居民服务、修理和其他服务业', '1', null);
INSERT INTO `sys_way` VALUES ('O79', '居民服务业', '2', 'O');
INSERT INTO `sys_way` VALUES ('O791', '家庭服务', '3', 'O79');
INSERT INTO `sys_way` VALUES ('O7910', '家庭服务', '4', 'O791');
INSERT INTO `sys_way` VALUES ('O792', '托儿所服务', '3', 'O79');
INSERT INTO `sys_way` VALUES ('O7920', '托儿所服务', '4', 'O792');
INSERT INTO `sys_way` VALUES ('O793', '洗染服务', '3', 'O79');
INSERT INTO `sys_way` VALUES ('O7930', '洗染服务', '4', 'O793');
INSERT INTO `sys_way` VALUES ('O794', '理发及美容服务', '3', 'O79');
INSERT INTO `sys_way` VALUES ('O7940', '理发及美容服务', '4', 'O794');
INSERT INTO `sys_way` VALUES ('O795', '洗浴服务', '3', 'O79');
INSERT INTO `sys_way` VALUES ('O7950', '洗浴服务', '4', 'O795');
INSERT INTO `sys_way` VALUES ('O796', '保健服务', '3', 'O79');
INSERT INTO `sys_way` VALUES ('O7960', '保健服务', '4', 'O796');
INSERT INTO `sys_way` VALUES ('O797', '婚姻服务', '3', 'O79');
INSERT INTO `sys_way` VALUES ('O7970', '婚姻服务', '4', 'O797');
INSERT INTO `sys_way` VALUES ('O798', '殡葬服务', '3', 'O79');
INSERT INTO `sys_way` VALUES ('O7980', '殡葬服务', '4', 'O798');
INSERT INTO `sys_way` VALUES ('O799', '其他居民服务业', '3', 'O79');
INSERT INTO `sys_way` VALUES ('O7990', '其他居民服务业', '4', 'O799');
INSERT INTO `sys_way` VALUES ('O80', '机动车、电子产品和日用产品修理业', '2', 'O');
INSERT INTO `sys_way` VALUES ('O801', '汽车、摩托车修理与维护', '3', 'O80');
INSERT INTO `sys_way` VALUES ('O8011', '汽车修理与维护', '4', 'O801');
INSERT INTO `sys_way` VALUES ('O8012', '摩托车修理与维护', '4', 'O801');
INSERT INTO `sys_way` VALUES ('O802', '计算机和办公设备维修', '3', 'O80');
INSERT INTO `sys_way` VALUES ('O8021', '计算机和辅助设备修理', '4', 'O802');
INSERT INTO `sys_way` VALUES ('O8022', '通讯设备修理', '4', 'O802');
INSERT INTO `sys_way` VALUES ('O8029', '其他办公设备维修', '4', 'O802');
INSERT INTO `sys_way` VALUES ('O803', '家用电器修理', '3', 'O80');
INSERT INTO `sys_way` VALUES ('O8031', '家用电子产品修理', '4', 'O803');
INSERT INTO `sys_way` VALUES ('O8032', '日用电器修理', '4', 'O803');
INSERT INTO `sys_way` VALUES ('O809', '其他日用产品修理业', '3', 'O80');
INSERT INTO `sys_way` VALUES ('O8091', '自行车修理', '4', 'O809');
INSERT INTO `sys_way` VALUES ('O8092', '鞋和皮革修理', '4', 'O809');
INSERT INTO `sys_way` VALUES ('O8093', '家具和相关物品修理', '4', 'O809');
INSERT INTO `sys_way` VALUES ('O8099', '其他未列明日用产品修理业', '4', 'O809');
INSERT INTO `sys_way` VALUES ('O81', '其他服务业', '2', 'O');
INSERT INTO `sys_way` VALUES ('O811', '清洁服务', '3', 'O81');
INSERT INTO `sys_way` VALUES ('O8111', '建筑物清洁服务', '4', 'O811');
INSERT INTO `sys_way` VALUES ('O8119', '其他清洁服务', '4', 'O811');
INSERT INTO `sys_way` VALUES ('O819', '其他未列明服务业', '3', 'O81');
INSERT INTO `sys_way` VALUES ('O8190', '其他未列明服务业', '4', 'O819');
INSERT INTO `sys_way` VALUES ('P', '教育', '1', null);
INSERT INTO `sys_way` VALUES ('P82', '教育', '2', 'P');
INSERT INTO `sys_way` VALUES ('P821', '学前教育', '3', 'P82');
INSERT INTO `sys_way` VALUES ('P8210', '学前教育', '4', 'P821');
INSERT INTO `sys_way` VALUES ('P822', '初等教育', '3', 'P82');
INSERT INTO `sys_way` VALUES ('P8221', '普通小学教育', '4', 'P822');
INSERT INTO `sys_way` VALUES ('P8222', '成人小学教育', '4', 'P822');
INSERT INTO `sys_way` VALUES ('P823', '中等教育', '3', 'P82');
INSERT INTO `sys_way` VALUES ('P8231', '普通初中教育', '4', 'P823');
INSERT INTO `sys_way` VALUES ('P8232', '职业初中教育', '4', 'P823');
INSERT INTO `sys_way` VALUES ('P8233', '成人初中教育', '4', 'P823');
INSERT INTO `sys_way` VALUES ('P8234', '普通高中教育', '4', 'P823');
INSERT INTO `sys_way` VALUES ('P8235', '成人高中教育', '4', 'P823');
INSERT INTO `sys_way` VALUES ('P8236', '中等职业学校教育', '4', 'P823');
INSERT INTO `sys_way` VALUES ('P824', '高等教育', '3', 'P82');
INSERT INTO `sys_way` VALUES ('P8241', '普通高等教育', '4', 'P824');
INSERT INTO `sys_way` VALUES ('P8242', '成人高等教育', '4', 'P824');
INSERT INTO `sys_way` VALUES ('P825', '特殊教育', '3', 'P82');
INSERT INTO `sys_way` VALUES ('P8250', '特殊教育', '4', 'P825');
INSERT INTO `sys_way` VALUES ('P829', '技能培训、教育辅助及其他教育', '3', 'P82');
INSERT INTO `sys_way` VALUES ('P8291', '职业技能培训', '4', 'P829');
INSERT INTO `sys_way` VALUES ('P8292', '体校及体育培训', '4', 'P829');
INSERT INTO `sys_way` VALUES ('P8293', '文化艺术培训', '4', 'P829');
INSERT INTO `sys_way` VALUES ('P8294', '教育辅助服务', '4', 'P829');
INSERT INTO `sys_way` VALUES ('P8299', '其他未列明教育', '4', 'P829');
INSERT INTO `sys_way` VALUES ('Q', '卫生和社会工作', '1', null);
INSERT INTO `sys_way` VALUES ('Q83', '卫生', '2', 'Q');
INSERT INTO `sys_way` VALUES ('Q831', '医院', '3', 'Q83');
INSERT INTO `sys_way` VALUES ('Q8311', '综合医院', '4', 'Q831');
INSERT INTO `sys_way` VALUES ('Q8312', '中医医院', '4', 'Q831');
INSERT INTO `sys_way` VALUES ('Q8313', '中西医结合医院', '4', 'Q831');
INSERT INTO `sys_way` VALUES ('Q8314', '民族医院', '4', 'Q831');
INSERT INTO `sys_way` VALUES ('Q8315', '专科医院', '4', 'Q831');
INSERT INTO `sys_way` VALUES ('Q8316', '疗养院', '4', 'Q831');
INSERT INTO `sys_way` VALUES ('Q832', '社区医疗与卫生院', '3', 'Q83');
INSERT INTO `sys_way` VALUES ('Q8321', '社区卫生服务中心（站）', '4', 'Q832');
INSERT INTO `sys_way` VALUES ('Q8322', '街道卫生院', '4', 'Q832');
INSERT INTO `sys_way` VALUES ('Q8323', '乡镇卫生院', '4', 'Q832');
INSERT INTO `sys_way` VALUES ('Q833', '门诊部（所）', '3', 'Q83');
INSERT INTO `sys_way` VALUES ('Q8330', '门诊部（所）', '4', 'Q833');
INSERT INTO `sys_way` VALUES ('Q834', '计划生育技术服务活动', '3', 'Q83');
INSERT INTO `sys_way` VALUES ('Q8340', '计划生育技术服务活动', '4', 'Q834');
INSERT INTO `sys_way` VALUES ('Q835', '妇幼保健院（所、站）', '3', 'Q83');
INSERT INTO `sys_way` VALUES ('Q8350', '妇幼保健院（所、站）', '4', 'Q835');
INSERT INTO `sys_way` VALUES ('Q836', '专科疾病防治院（所、站）', '3', 'Q83');
INSERT INTO `sys_way` VALUES ('Q8360', '专科疾病防治院（所、站）', '4', 'Q836');
INSERT INTO `sys_way` VALUES ('Q837', '疾病预防控制中心', '3', 'Q83');
INSERT INTO `sys_way` VALUES ('Q8370', '疾病预防控制中心', '4', 'Q837');
INSERT INTO `sys_way` VALUES ('Q839', '其他卫生活动', '3', 'Q83');
INSERT INTO `sys_way` VALUES ('Q8390', '其他卫生活动', '4', 'Q839');
INSERT INTO `sys_way` VALUES ('Q84', '社会工作', '2', 'Q');
INSERT INTO `sys_way` VALUES ('Q841', '提供住宿社会工作', '3', 'Q84');
INSERT INTO `sys_way` VALUES ('Q8411', '干部休养所', '4', 'Q841');
INSERT INTO `sys_way` VALUES ('Q8412', '护理机构服务', '4', 'Q841');
INSERT INTO `sys_way` VALUES ('Q8413', '精神康复服务', '4', 'Q841');
INSERT INTO `sys_way` VALUES ('Q8414', '老年人、残疾人养护服务', '4', 'Q841');
INSERT INTO `sys_way` VALUES ('Q8415', '孤残儿童收养和庇护服务', '4', 'Q841');
INSERT INTO `sys_way` VALUES ('Q8419', '其他提供住宿社会救助', '4', 'Q841');
INSERT INTO `sys_way` VALUES ('Q842', '不提供住宿社会工作', '3', 'Q84');
INSERT INTO `sys_way` VALUES ('Q8421', '社会看护与帮助服务', '4', 'Q842');
INSERT INTO `sys_way` VALUES ('Q8429', '其他不提供住宿社会工作', '4', 'Q842');
INSERT INTO `sys_way` VALUES ('R', '文化、体育和娱乐业', '1', null);
INSERT INTO `sys_way` VALUES ('R85', '新闻和出版业', '2', 'R');
INSERT INTO `sys_way` VALUES ('R851', '新闻业', '3', 'R85');
INSERT INTO `sys_way` VALUES ('R8510', '新闻业', '4', 'R851');
INSERT INTO `sys_way` VALUES ('R852', '出版业', '3', 'R85');
INSERT INTO `sys_way` VALUES ('R8521', '图书出版', '4', 'R852');
INSERT INTO `sys_way` VALUES ('R8522', '报纸出版', '4', 'R852');
INSERT INTO `sys_way` VALUES ('R8523', '期刊出版', '4', 'R852');
INSERT INTO `sys_way` VALUES ('R8524', '音像制品出版', '4', 'R852');
INSERT INTO `sys_way` VALUES ('R8525', '电子出版物出版', '4', 'R852');
INSERT INTO `sys_way` VALUES ('R8529', '其他出版业', '4', 'R852');
INSERT INTO `sys_way` VALUES ('R86', '广播、电视、电影和影视录音制作业', '2', 'R');
INSERT INTO `sys_way` VALUES ('R861', '广播', '3', 'R86');
INSERT INTO `sys_way` VALUES ('R8610', '广播', '4', 'R861');
INSERT INTO `sys_way` VALUES ('R862', '电视', '3', 'R86');
INSERT INTO `sys_way` VALUES ('R8620', '电视', '4', 'R862');
INSERT INTO `sys_way` VALUES ('R863', '电影和影视节目制作', '3', 'R86');
INSERT INTO `sys_way` VALUES ('R8630', '电影和影视节目制作', '4', 'R863');
INSERT INTO `sys_way` VALUES ('R864', '电影和影视节目发行', '3', 'R86');
INSERT INTO `sys_way` VALUES ('R8640', '电影和影视节目发行', '4', 'R864');
INSERT INTO `sys_way` VALUES ('R865', '电影放映', '3', 'R86');
INSERT INTO `sys_way` VALUES ('R8650', '电影放映', '4', 'R865');
INSERT INTO `sys_way` VALUES ('R866', '录音制作', '3', 'R86');
INSERT INTO `sys_way` VALUES ('R8660', '录音制作', '4', 'R866');
INSERT INTO `sys_way` VALUES ('R87', '文化艺术业', '2', 'R');
INSERT INTO `sys_way` VALUES ('R871', '文艺创作与表演', '3', 'R87');
INSERT INTO `sys_way` VALUES ('R8710', '文艺创作与表演', '4', 'R871');
INSERT INTO `sys_way` VALUES ('R872', '艺术表演场馆', '3', 'R87');
INSERT INTO `sys_way` VALUES ('R8720', '艺术表演场馆', '4', 'R872');
INSERT INTO `sys_way` VALUES ('R873', '图书馆与档案馆', '3', 'R87');
INSERT INTO `sys_way` VALUES ('R8731', '图书馆', '4', 'R873');
INSERT INTO `sys_way` VALUES ('R8732', '档案馆', '4', 'R873');
INSERT INTO `sys_way` VALUES ('R874', '文物及非物质文化遗产保护', '3', 'R87');
INSERT INTO `sys_way` VALUES ('R8740', '文物及非物质文化遗产保护', '4', 'R874');
INSERT INTO `sys_way` VALUES ('R875', '博物馆', '3', 'R87');
INSERT INTO `sys_way` VALUES ('R8750', '博物馆', '4', 'R875');
INSERT INTO `sys_way` VALUES ('R876', '烈士陵园、纪念馆', '3', 'R87');
INSERT INTO `sys_way` VALUES ('R8760', '烈士陵园、纪念馆', '4', 'R876');
INSERT INTO `sys_way` VALUES ('R877', '群众文化活动', '3', 'R87');
INSERT INTO `sys_way` VALUES ('R8770', '群众文化活动', '4', 'R877');
INSERT INTO `sys_way` VALUES ('R879', '其他文化艺术业', '3', 'R87');
INSERT INTO `sys_way` VALUES ('R8790', '其他文化艺术业', '4', 'R879');
INSERT INTO `sys_way` VALUES ('R88', '体育', '2', 'R');
INSERT INTO `sys_way` VALUES ('R881', '体育组织', '3', 'R88');
INSERT INTO `sys_way` VALUES ('R8810', '体育组织', '4', 'R881');
INSERT INTO `sys_way` VALUES ('R882', '体育场馆', '3', 'R88');
INSERT INTO `sys_way` VALUES ('R8820', '体育场馆', '4', 'R882');
INSERT INTO `sys_way` VALUES ('R883', '休闲健身活动', '3', 'R88');
INSERT INTO `sys_way` VALUES ('R8830', '休闲健身活动', '4', 'R883');
INSERT INTO `sys_way` VALUES ('R889', '其他体育', '3', 'R88');
INSERT INTO `sys_way` VALUES ('R8890', '其他体育', '4', 'R889');
INSERT INTO `sys_way` VALUES ('R89', '娱乐业', '2', 'R');
INSERT INTO `sys_way` VALUES ('R891', '室内娱乐活动', '3', 'R89');
INSERT INTO `sys_way` VALUES ('R8911', '歌舞厅娱乐活动', '4', 'R891');
INSERT INTO `sys_way` VALUES ('R8912', '电子游艺厅娱乐活动', '4', 'R891');
INSERT INTO `sys_way` VALUES ('R8913', '网吧活动', '4', 'R891');
INSERT INTO `sys_way` VALUES ('R8919', '其他室内娱乐活动', '4', 'R891');
INSERT INTO `sys_way` VALUES ('R892', '游乐园', '3', 'R89');
INSERT INTO `sys_way` VALUES ('R8920', '游乐园', '4', 'R892');
INSERT INTO `sys_way` VALUES ('R893', '彩票活动', '3', 'R89');
INSERT INTO `sys_way` VALUES ('R8930', '彩票活动', '4', 'R893');
INSERT INTO `sys_way` VALUES ('R894', '文化、娱乐、体育经纪代理', '3', 'R89');
INSERT INTO `sys_way` VALUES ('R8941', '文化娱乐经纪人', '4', 'R894');
INSERT INTO `sys_way` VALUES ('R8942', '体育经纪人', '4', 'R894');
INSERT INTO `sys_way` VALUES ('R8949', '其他文化艺术经纪代理', '4', 'R894');
INSERT INTO `sys_way` VALUES ('R899', '其他娱乐业', '3', 'R89');
INSERT INTO `sys_way` VALUES ('R8990', '其他娱乐业', '4', 'R899');
INSERT INTO `sys_way` VALUES ('S', '公共管理、社会保障和社会组织', '1', null);
INSERT INTO `sys_way` VALUES ('S90', '中国共产党机关', '2', 'S');
INSERT INTO `sys_way` VALUES ('S900', '中国共产党机关', '3', 'S90');
INSERT INTO `sys_way` VALUES ('S9000', '中国共产党机关', '4', 'S900');
INSERT INTO `sys_way` VALUES ('S91', '国家机构', '2', 'S');
INSERT INTO `sys_way` VALUES ('S911', '国家权力机构', '3', 'S91');
INSERT INTO `sys_way` VALUES ('S9110', '国家权力机构', '4', 'S911');
INSERT INTO `sys_way` VALUES ('S912', '国家行政机构', '3', 'S91');
INSERT INTO `sys_way` VALUES ('S9121', '综合事务管理机构', '4', 'S912');
INSERT INTO `sys_way` VALUES ('S9122', '对外事务管理机构', '4', 'S912');
INSERT INTO `sys_way` VALUES ('S9123', '公共安全管理机构', '4', 'S912');
INSERT INTO `sys_way` VALUES ('S9124', '社会事务管理机构', '4', 'S912');
INSERT INTO `sys_way` VALUES ('S9125', '经济事务管理机构', '4', 'S912');
INSERT INTO `sys_way` VALUES ('S9126', '行政监督检查机构', '4', 'S912');
INSERT INTO `sys_way` VALUES ('S913', '人民法院和人民检察院', '3', 'S91');
INSERT INTO `sys_way` VALUES ('S9131', '人民法院', '4', 'S913');
INSERT INTO `sys_way` VALUES ('S9132', '人民检察院', '4', 'S913');
INSERT INTO `sys_way` VALUES ('S919', '其他国家机构', '3', 'S91');
INSERT INTO `sys_way` VALUES ('S9190', '其他国家机构', '4', 'S919');
INSERT INTO `sys_way` VALUES ('S92', '人民政协、民主党派', '2', 'S');
INSERT INTO `sys_way` VALUES ('S921', '人民政协', '3', 'S92');
INSERT INTO `sys_way` VALUES ('S9210', '人民政协', '4', 'S921');
INSERT INTO `sys_way` VALUES ('S922', '民主党派', '3', 'S92');
INSERT INTO `sys_way` VALUES ('S9220', '民主党派', '4', 'S922');
INSERT INTO `sys_way` VALUES ('S93', '社会保障', '2', 'S');
INSERT INTO `sys_way` VALUES ('S930', '社会保障', '3', 'S93');
INSERT INTO `sys_way` VALUES ('S9300', '社会保障', '4', 'S930');
INSERT INTO `sys_way` VALUES ('S94', '群众团体、社会团体和其他成员组织', '2', 'S');
INSERT INTO `sys_way` VALUES ('S941', '群众团体', '3', 'S94');
INSERT INTO `sys_way` VALUES ('S9411', '工会', '4', 'S941');
INSERT INTO `sys_way` VALUES ('S9412', '妇联', '4', 'S941');
INSERT INTO `sys_way` VALUES ('S9413', '共青团', '4', 'S941');
INSERT INTO `sys_way` VALUES ('S9419', '其他群众团体', '4', 'S941');
INSERT INTO `sys_way` VALUES ('S942', '社会团体', '3', 'S94');
INSERT INTO `sys_way` VALUES ('S9421', '专业性团体', '4', 'S942');
INSERT INTO `sys_way` VALUES ('S9422', '行业性团体', '4', 'S942');
INSERT INTO `sys_way` VALUES ('S9429', '其他社会团体', '4', 'S942');
INSERT INTO `sys_way` VALUES ('S943', '基金会', '3', 'S94');
INSERT INTO `sys_way` VALUES ('S9430', '基金会', '4', 'S943');
INSERT INTO `sys_way` VALUES ('S944', '宗教组织', '3', 'S94');
INSERT INTO `sys_way` VALUES ('S9440', '宗教组织', '4', 'S944');
INSERT INTO `sys_way` VALUES ('S95', '基层群众自治组织', '2', 'S');
INSERT INTO `sys_way` VALUES ('S951', '社区自治组织', '3', 'S95');
INSERT INTO `sys_way` VALUES ('S9510', '社区自治组织', '4', 'S951');
INSERT INTO `sys_way` VALUES ('S952', '村民自治组织', '3', 'S95');
INSERT INTO `sys_way` VALUES ('S9520', '村民自治组织', '4', 'S952');
INSERT INTO `sys_way` VALUES ('T', '国际组织', '1', null);
INSERT INTO `sys_way` VALUES ('T96', '国际组织', '2', 'T');
INSERT INTO `sys_way` VALUES ('T960', '国际组织', '3', 'T96');
INSERT INTO `sys_way` VALUES ('T9600', '国际组织', '4', 'T960');
INSERT INTO `sys_way` VALUES ('W', '其他', '1', null);

-- ----------------------------
-- Table structure for tb_token
-- ----------------------------
DROP TABLE IF EXISTS `tb_token`;
CREATE TABLE `tb_token` (
  `user_id` bigint(20) NOT NULL,
  `token` varchar(100) NOT NULL COMMENT 'token',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户Token';

-- ----------------------------
-- Records of tb_token
-- ----------------------------

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `mobile` varchar(20) NOT NULL COMMENT '手机号',
  `password` varchar(64) DEFAULT NULL COMMENT '密码',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户';

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES ('1', 'mark', 'admin', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', '2017-03-23 22:37:41');
