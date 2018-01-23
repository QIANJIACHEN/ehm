-- phpMyAdmin SQL Dump
-- version 4.4.15
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2017-12-21 10:37:04
-- 服务器版本： 10.1.9-MariaDB
-- PHP Version: 7.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `os_ehmtestv7`
--

-- --------------------------------------------------------

--
-- 表的结构 `ehm_auth_access`
--

CREATE TABLE IF NOT EXISTS `ehm_auth_access` (
  `ID` int(11) NOT NULL,
  `MODULE` varchar(128) NOT NULL COMMENT '规则所属module',
  `TYPE` varchar(128) NOT NULL COMMENT '权限规则分类，请加应用前缀,如admin_',
  `NAME` varchar(128) NOT NULL COMMENT '规则唯一英文标识,全小写',
  `PARAM` varchar(128) NOT NULL COMMENT '额外参数',
  `TITLE` varchar(128) NOT NULL COMMENT '规则中文注释',
  `STATUS` int(11) NOT NULL COMMENT '0：无效；1：有效',
  `CONDITION_` varchar(128) NOT NULL COMMENT '规则附加'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限授权表';

-- --------------------------------------------------------

--
-- 表的结构 `ehm_auth_rule`
--

CREATE TABLE IF NOT EXISTS `ehm_auth_rule` (
  `ROLE_ID` int(11) NOT NULL COMMENT '角色',
  `RULE_NAME` varchar(64) NOT NULL COMMENT '规则唯一英文标识,全小写',
  `TYPE` varchar(128) NOT NULL COMMENT '权限规则分类，请加应用前缀,如admin_'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='规则权限表';

-- --------------------------------------------------------

--
-- 表的结构 `ehm_control_fleet_eng_spare`
--

CREATE TABLE IF NOT EXISTS `ehm_control_fleet_eng_spare` (
  `ID` int(11) NOT NULL,
  `ENG_ID` int(11) NOT NULL COMMENT '发动机ID',
  `ENG_SN` varchar(128) NOT NULL COMMENT '发动机编号',
  `REMOVE_DATE` datetime NOT NULL COMMENT '拆发时间',
  `CONDITION_` varchar(128) NOT NULL COMMENT '状态',
  `INSTALL_PLAN` varchar(128) NOT NULL COMMENT 'INSTALL_PLAN',
  `LLP_SAP` varchar(128) NOT NULL COMMENT 'LLP_SAP',
  `CONFIG_ACCESS` varchar(128) NOT NULL COMMENT 'CONFIG_ACCESS',
  `REMARK` varchar(1024) DEFAULT NULL COMMENT '备注'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='发动机维修表';

-- --------------------------------------------------------

--
-- 表的结构 `ehm_control_fleet_plane`
--

CREATE TABLE IF NOT EXISTS `ehm_control_fleet_plane` (
  `ID` int(11) NOT NULL,
  `PLANE_ID` int(11) NOT NULL COMMENT '飞机ID',
  `TAIL` varchar(128) NOT NULL COMMENT '飞机号',
  `ENG_POSITION` int(4) NOT NULL COMMENT '发动机位置',
  `ENG_ID` int(11) NOT NULL COMMENT '发动机ID',
  `ENG_SN` varchar(128) NOT NULL COMMENT '发动机编号',
  `ENG_PN` varchar(128) NOT NULL COMMENT '发动机设备号',
  `CODE_POSITION` varchar(128) NOT NULL COMMENT 'CODE_POSITION',
  `REMARK` varchar(1024) DEFAULT NULL COMMENT '备注'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='飞机发动机关联表';

-- --------------------------------------------------------

--
-- 表的结构 `ehm_data_case`
--

CREATE TABLE IF NOT EXISTS `ehm_data_case` (
  `ID` int(11) NOT NULL,
  `CASE_` varchar(128) NOT NULL COMMENT '故障',
  `RESOURCE` varchar(128) NOT NULL COMMENT 'RESOURCE',
  `CTIME` datetime NOT NULL COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='故障表';

-- --------------------------------------------------------

--
-- 表的结构 `ehm_data_cfm_performance`
--

CREATE TABLE IF NOT EXISTS `ehm_data_cfm_performance` (
  `ID` int(11) NOT NULL,
  `PLANE_ID` int(11) NOT NULL COMMENT '飞机ID',
  `TAIL` varchar(128) NOT NULL COMMENT '"某个点飞机的唯一标识 表之间一般使用这个字段进行关联"',
  `EPOSITION` varchar(128) NOT NULL COMMENT 'EPOSITION',
  `ENG_ID` int(11) NOT NULL COMMENT '发动机ID',
  `ESN` varchar(128) NOT NULL COMMENT 'ESN',
  `FLIGHT_PHASE` varchar(128) NOT NULL COMMENT 'FLIGHT_PHASE',
  `FLIGHT_DATETIME` datetime NOT NULL COMMENT '飞行时间',
  `ENGINE_TYPE` varchar(128) NOT NULL COMMENT '发动机类型',
  `ZPHSR` varchar(128) NOT NULL COMMENT 'N1 Phase Angle Rear',
  `GPCN25_SMOOTHED` varchar(128) NOT NULL COMMENT 'Delta Core Speed Smoothed',
  `DEGT_SMOOTHED` varchar(128) NOT NULL COMMENT 'Delta EGT Smoothed',
  `ZPHSF` varchar(128) NOT NULL COMMENT 'N1 Phase Angle Fwd',
  `EGTHDM_D` varchar(128) NOT NULL COMMENT 'EGT Hot Day Margin Divergence',
  `ZVB1F_SMOOTHED` varchar(128) NOT NULL COMMENT 'Fan Vibe Fwd Smoothed',
  `GWFM` varchar(128) NOT NULL COMMENT 'Delta Fuel Flow',
  `EGTHDM` varchar(128) NOT NULL COMMENT 'EGT Hot Day Margin',
  `GWFM_D` varchar(128) NOT NULL COMMENT 'Delta Fuel Flow Divergence',
  `ZVB1R` varchar(128) NOT NULL COMMENT 'Fan Vibe Rear',
  `EGTHDM_D_SMOOTHED` varchar(128) NOT NULL COMMENT 'EGT Hot Day Margin Divergence Smoothed',
  `ZTOIL` varchar(128) NOT NULL COMMENT 'Oil Temperature',
  `ZVB2F` varchar(128) NOT NULL COMMENT 'Core Vibe Fwd',
  `ZVB2R` varchar(128) NOT NULL COMMENT 'Core Vibe Rear',
  `ZVB1F` varchar(128) NOT NULL COMMENT 'Fan Vibe Fwd',
  `ZVB2R_SMOOTHED` varchar(128) NOT NULL COMMENT 'Core Vibe Rear Smoothed',
  `DEGT_D_SMOOTHED` varchar(128) NOT NULL COMMENT 'Delta EGT Divergence Smoothed',
  `GPCN25_D` varchar(128) NOT NULL COMMENT 'Delta Core Speed Divergence',
  `ZVB1R_SMOOTHED` varchar(128) NOT NULL COMMENT 'Fan Vibe Rear Smoothed',
  `ZTOIL_SMOOTHED` varchar(128) NOT NULL COMMENT 'Oil Temperature Smoothed',
  `GWFM_SMOOTHED` varchar(128) NOT NULL COMMENT 'Delta Fuel Flow Smoothed',
  `GPCN25` varchar(128) NOT NULL COMMENT 'Delta Core Speed',
  `GWFM_D_SMOOTHED` varchar(128) NOT NULL COMMENT 'Delta Fuel Flow Divergence Smoothed',
  `GPCN25_D_SMOOTHED` varchar(128) NOT NULL COMMENT 'Delta Core Speed Divergence Smoothed',
  `ZVB2F_SMOOTHED` varchar(128) NOT NULL COMMENT 'Core Vibe Fwd Smoothed',
  `ZPOIL_SMOOTHED` varchar(128) NOT NULL COMMENT 'Oil Pressure Smoothed',
  `EGTHDM_SMOOTHED` varchar(128) NOT NULL COMMENT 'EGT Hot Day Margin Smoothed',
  `DEGT_D` varchar(128) NOT NULL COMMENT 'Delta EGT Divergence',
  `ZPOIL` varchar(128) NOT NULL COMMENT 'Oil Pressure',
  `ZT49` varchar(128) NOT NULL COMMENT 'EGT',
  `DEGT` varchar(128) NOT NULL COMMENT 'Delta EGT',
  `CTIME` datetime NOT NULL COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='发动机监测参数表';

-- --------------------------------------------------------

--
-- 表的结构 `ehm_data_eng`
--

CREATE TABLE IF NOT EXISTS `ehm_data_eng` (
  `ID` int(11) NOT NULL,
  `ENG_SN` varchar(128) NOT NULL COMMENT '发动机SN',
  `ENG_SN_SAP` varchar(128) NOT NULL COMMENT 'SAP平台显示的方式',
  `ENG_SERIES` varchar(128) NOT NULL COMMENT '发动机序列',
  `ENG_TYPE` varchar(128) NOT NULL COMMENT '发动机类型',
  `ENG_MODEL` varchar(128) NOT NULL COMMENT '发动机模型',
  `ENG_CONFIG` varchar(128) NOT NULL COMMENT '发动机构型',
  `DELIVERY_MODE` varchar(128) NOT NULL COMMENT '原始厂商',
  `OWNER` varchar(128) NOT NULL COMMENT '所有人',
  `CODE_CONFIG` varchar(128) NOT NULL COMMENT 'CODE_CONFIG',
  `ENG_CONFIGRATION` varchar(128) NOT NULL COMMENT '发动机型号另一种标识',
  `CTIME` datetime NOT NULL COMMENT '创建时间',
  `ENG_PN` varchar(128) NOT NULL COMMENT '发动机设备号',
  `CONDITION_` varchar(128) NOT NULL COMMENT '状态',
  `REMARK` varchar(1024) DEFAULT NULL COMMENT '备注'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='发动机表';

--
-- 转存表中的数据 `ehm_data_eng`
--

INSERT INTO `ehm_data_eng` (`ID`, `ENG_SN`, `ENG_SN_SAP`, `ENG_SERIES`, `ENG_TYPE`, `ENG_MODEL`, `ENG_CONFIG`, `DELIVERY_MODE`, `OWNER`, `CODE_CONFIG`, `ENG_CONFIGRATION`, `CTIME`, `ENG_PN`, `CONDITION_`, `REMARK`) VALUES
(1, '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '2017-12-07 19:29:31', '', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `ehm_data_idplug`
--

CREATE TABLE IF NOT EXISTS `ehm_data_idplug` (
  `ID` int(11) NOT NULL,
  `ENG_ID` int(11) NOT NULL COMMENT '发动机ID',
  `ENG_PN` varchar(128) NOT NULL COMMENT '发动机设备号',
  `ENG_MODEL` varchar(128) NOT NULL COMMENT '发动机型号',
  `RATING` varchar(128) NOT NULL COMMENT '转速',
  `CONFIG` varchar(128) NOT NULL COMMENT '构型',
  `PLANE_TYPE` varchar(128) NOT NULL COMMENT '飞机型号',
  `IDPLUG_PN` varchar(128) NOT NULL COMMENT 'IDPLUG_PN'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='IDPLUG数据';

-- --------------------------------------------------------

--
-- 表的结构 `ehm_data_plane`
--

CREATE TABLE IF NOT EXISTS `ehm_data_plane` (
  `ID` int(11) NOT NULL,
  `TAIL` varchar(128) NOT NULL COMMENT '某个点飞机的唯一标识 表之间一般使用这个字段进行关联',
  `DUTY` int(11) NOT NULL COMMENT '基地ID',
  `RATING_PLANE` varchar(128) NOT NULL COMMENT '推力',
  `CONFIG_PLANE` varchar(128) NOT NULL COMMENT '构型',
  `ENG_SN_ORIGINAL` varchar(128) NOT NULL COMMENT '原始的发动机编码',
  `SERIES` varchar(128) NOT NULL COMMENT '型号1级',
  `TYPE` varchar(128) NOT NULL COMMENT '型号2级',
  `MODEL` varchar(128) NOT NULL COMMENT '型号3级',
  `ATTRIBUTE` varchar(128) NOT NULL COMMENT '属性',
  `ETOPS` varchar(128) NOT NULL COMMENT 'ETOPS',
  `H_HIGHLAND` int(11) NOT NULL COMMENT '高高原:0是1否',
  `VARIABLE` varchar(128) NOT NULL COMMENT 'VARIABLE',
  `SERIAL` varchar(128) NOT NULL COMMENT 'MSN',
  `LINE` varchar(128) NOT NULL COMMENT 'LINE',
  `EFFECTIVITY` varchar(128) NOT NULL COMMENT '手册适用性',
  `OPERATER` varchar(128) NOT NULL COMMENT '航空公司（品牌）',
  `OWNER` varchar(128) NOT NULL COMMENT '所有人',
  `REMARK` varchar(1024) NOT NULL COMMENT '备注',
  `IMPORT_WAY` varchar(128) NOT NULL COMMENT '引进方式',
  `CTIME` datetime NOT NULL COMMENT '创建时间',
  `CONDITION_` varchar(128) NOT NULL COMMENT '状态',
  `FLIGHT_ID` int(11) NOT NULL COMMENT '航班ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='波音飞机表';

-- --------------------------------------------------------

--
-- 表的结构 `ehm_data_sap_defect`
--

CREATE TABLE IF NOT EXISTS `ehm_data_sap_defect` (
  `ID` int(11) NOT NULL,
  `DUTY` int(11) NOT NULL COMMENT '基地ID',
  `SERIES` varchar(128) NOT NULL COMMENT '机型',
  `PLANE_ID` int(11) NOT NULL COMMENT '飞机ID',
  `TAIL` varchar(128) NOT NULL COMMENT '机号',
  `ENG_POSIT` varchar(128) NOT NULL COMMENT '位置',
  `ENG_ID` int(11) NOT NULL,
  `ENG_SN` varchar(128) NOT NULL COMMENT '发动机序号',
  `STATUS` int(11) NOT NULL COMMENT '0：否；1：是',
  `NAME` varchar(128) NOT NULL COMMENT '故障件名称',
  `REMARK` varchar(1024) NOT NULL COMMENT '监控间隔及措施',
  `CASE_ID` int(11) NOT NULL COMMENT '故障ID',
  `IS_MONITOR` int(4) NOT NULL COMMENT '是否重点监控',
  `CTIME` datetime NOT NULL COMMENT '创建时间',
  `START_MONITOR` varchar(128) NOT NULL COMMENT '起始监控点',
  `MONITOR_TYPE` int(4) NOT NULL COMMENT '监控类型（1：小时；2：循环）',
  `MAX` varchar(128) NOT NULL COMMENT '上限',
  `MIN` varchar(128) NOT NULL COMMENT '下限'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='故障件记录';

-- --------------------------------------------------------

--
-- 表的结构 `ehm_data_sap_oil_consumption`
--

CREATE TABLE IF NOT EXISTS `ehm_data_sap_oil_consumption` (
  `ID` int(11) NOT NULL,
  `DUTY` int(11) NOT NULL COMMENT '分公司',
  `CONFIG_PLANE` varchar(128) NOT NULL COMMENT '机型',
  `PLANE_ID` int(11) NOT NULL COMMENT '飞机ID',
  `TAIL` varchar(128) NOT NULL COMMENT '机号tail表',
  `FLT_NO` varchar(128) NOT NULL COMMENT '航班号',
  `FLT_TIME` datetime NOT NULL COMMENT '飞行日期',
  `AIR_TIME` datetime NOT NULL COMMENT '空中时间',
  `GROUND_TIME` datetime NOT NULL COMMENT '空地时间',
  `START_TERMINAL` varchar(128) NOT NULL COMMENT '起飞航站',
  `END_TERMINAL` varchar(128) NOT NULL COMMENT '到达航站',
  `REFUEL_OIL_1` varchar(128) NOT NULL COMMENT '1发加油前滑油量',
  `OIL_ADDITION_1` varchar(128) NOT NULL COMMENT '1发滑油添加量',
  `REFUEL_TIME_DIFFERENCE_1` varchar(128) NOT NULL COMMENT '1发加油时间差',
  `OIL_CONSUME_1` varchar(128) NOT NULL COMMENT '1发滑油消耗',
  `OIL_CONSUME_RATE_1` varchar(128) NOT NULL COMMENT '1发滑油消耗率',
  `REFUEL_OIL_2` varchar(128) NOT NULL COMMENT '2发加油前滑油量',
  `OIL_ADDITION_2` varchar(128) NOT NULL COMMENT '2发滑油添加量',
  `REFUEL_TIME_DIFFERENCE_2` varchar(128) NOT NULL COMMENT '2发加油时间差',
  `OIL_CONSUME_2` varchar(128) NOT NULL COMMENT '2发滑油消耗',
  `OIL_CONSUME_RATE_2` varchar(128) NOT NULL COMMENT '2发滑油消耗率',
  `REFUEL_OIL_3` varchar(128) NOT NULL COMMENT '3发加油前滑油量',
  `OIL_ADDITION_3` varchar(128) NOT NULL COMMENT '3发滑油添加量',
  `REFUEL_TIME_DIFFERENCE_3` varchar(128) NOT NULL COMMENT '3发加油时间差',
  `OIL_CONSUME_3` varchar(128) NOT NULL COMMENT '3发滑油消耗',
  `OIL_CONSUME_RATE_3` varchar(128) NOT NULL COMMENT '3发滑油消耗率',
  `REFUEL_OIL_4` varchar(128) NOT NULL COMMENT '4发加油前滑油量',
  `OIL_ADDITION_4` varchar(128) NOT NULL COMMENT '4发滑油添加量',
  `REFUEL_TIME_DIFFERENCE_4` varchar(128) NOT NULL COMMENT '4发加油时间差',
  `OIL_CONSUME_4` varchar(128) NOT NULL COMMENT '4发滑油消耗',
  `OIL_CONSUME_RATE_4` varchar(128) NOT NULL COMMENT '4发滑油消耗率',
  `ENG_VIGILANCE` varchar(128) NOT NULL COMMENT '发动机警戒值',
  `APU_OIL_ADDITION` varchar(128) NOT NULL COMMENT 'APU滑油添加量',
  `APU_OIL_CONSUME_RATE` varchar(128) NOT NULL COMMENT 'APU滑油消耗率',
  `APU_OIL_CONSUME_VIGILANCE` varchar(128) NOT NULL COMMENT 'APU滑油消耗警戒值',
  `USERID` int(11) NOT NULL COMMENT '录入人ID',
  `CTIME` datetime NOT NULL COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='油耗记录表';

-- --------------------------------------------------------

--
-- 表的结构 `ehm_duty`
--

CREATE TABLE IF NOT EXISTS `ehm_duty` (
  `ID` int(11) NOT NULL,
  `PARENT_ID` int(11) NOT NULL COMMENT '上级ID',
  `NAME` varchar(128) NOT NULL COMMENT '名称',
  `ROLE` int(11) NOT NULL COMMENT '角色ID',
  `LOCATION` varchar(64) NOT NULL COMMENT '所在地',
  `CTIME` datetime NOT NULL COMMENT '创建时间',
  `TYPE` int(4) NOT NULL DEFAULT '0' COMMENT '分类（1，分公司；2.子公司；3.执行单位；4.基地）'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='维修单位表';

-- --------------------------------------------------------

--
-- 表的结构 `ehm_eng_condition_fleet`
--

CREATE TABLE IF NOT EXISTS `ehm_eng_condition_fleet` (
  `ID` int(11) NOT NULL,
  `ENG_ID` int(11) NOT NULL COMMENT '发动机ID',
  `ENG_SN` varchar(128) NOT NULL COMMENT '发动机编号',
  `CTIME` datetime NOT NULL COMMENT '创建时间',
  `TSI_START` varchar(128) NOT NULL COMMENT 'TSI_START',
  `CSI_START` varchar(128) NOT NULL COMMENT 'CSI_START',
  `SV_TIME` varchar(128) NOT NULL COMMENT 'SV_TIME',
  `TSR_START` varchar(128) NOT NULL COMMENT 'TSR_START',
  `CSR_START` varchar(128) NOT NULL COMMENT 'CSR_START',
  `TSO_START` varchar(128) NOT NULL COMMENT 'TSO_START',
  `CSO_START` varchar(128) NOT NULL COMMENT 'CSO_START'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='发动机状态简报';

-- --------------------------------------------------------

--
-- 表的结构 `ehm_eng_fleet`
--

CREATE TABLE IF NOT EXISTS `ehm_eng_fleet` (
  `ID` int(11) NOT NULL,
  `CTIME` datetime NOT NULL COMMENT '签发日期',
  `DUTY` int(11) NOT NULL COMMENT '执管单位',
  `MODLE` varchar(128) NOT NULL COMMENT '机型',
  `PLANE_ID` int(11) NOT NULL COMMENT '飞机ID',
  `TAIL` varchar(128) NOT NULL COMMENT '机号',
  `ENG_POSIT` varchar(128) NOT NULL COMMENT '发动机位置',
  `ENG_ID` int(11) NOT NULL COMMENT '发动机ID',
  `ENG_SN` varchar(128) NOT NULL COMMENT '发动机序号',
  `ENG_PN` varchar(128) NOT NULL COMMENT 'ENG_PN',
  `RATING` varchar(128) NOT NULL COMMENT 'Rating',
  `CONFIG_PLANE` varchar(128) NOT NULL COMMENT 'Config',
  `LLP_LIFETIME` datetime NOT NULL COMMENT 'LLP余寿',
  `ETSN` varchar(128) NOT NULL COMMENT '当前ETSN',
  `ECSN` varchar(128) NOT NULL COMMENT '当前ECSN',
  `SV_TIME` datetime NOT NULL COMMENT 'SV_TIME',
  `IN_TIME` datetime NOT NULL COMMENT '装机日期',
  `TSI` varchar(128) NOT NULL COMMENT 'TSI',
  `CSI` varchar(128) NOT NULL COMMENT 'CSI',
  `TSR` varchar(128) NOT NULL COMMENT 'TSR',
  `CSR` varchar(128) NOT NULL COMMENT 'CSR',
  `TSO` varchar(128) NOT NULL COMMENT 'TSO',
  `CSO` varchar(128) NOT NULL COMMENT 'CSO',
  `LLP_211_SB` varchar(128) NOT NULL COMMENT 'LLP_211_SB门限',
  `HPTB_LIFETIME` datetime NOT NULL COMMENT 'HPTB余寿',
  `ENG_LIFETIME` datetime NOT NULL COMMENT 'ENG_余寿',
  `UNINSTALL_TIME` datetime NOT NULL COMMENT '下发日期_预计',
  `REMARK` varchar(1024) NOT NULL COMMENT '备注'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='发动机签发表';

-- --------------------------------------------------------

--
-- 表的结构 `ehm_eng_onwing`
--

CREATE TABLE IF NOT EXISTS `ehm_eng_onwing` (
  `ID` int(11) NOT NULL,
  `EXPR1` varchar(128) NOT NULL COMMENT 'EXPR2',
  `PLANE_ID` int(11) NOT NULL COMMENT '飞机ID',
  `TAIL` varchar(128) NOT NULL COMMENT '飞机号',
  `MODEL` varchar(128) NOT NULL COMMENT '型号',
  `ENG_POSITION` int(4) NOT NULL COMMENT '发动机位置',
  `ENG_ID` int(11) NOT NULL COMMENT '发动机ID',
  `ENG_SN` varchar(128) NOT NULL COMMENT '发动机编号',
  `ENG_PN` varchar(128) NOT NULL COMMENT '发动机设备号',
  `ETOPS` varchar(128) NOT NULL COMMENT 'ETOPS',
  `H_HIGHLAND` int(4) NOT NULL COMMENT '高高原',
  `DUTY` varchar(128) NOT NULL COMMENT '基地',
  `OPERATER` varchar(128) NOT NULL COMMENT '营运人',
  `IDPLUG_PN` varchar(128) NOT NULL COMMENT 'IDPLUG_PN',
  `OWNER` varchar(128) DEFAULT NULL COMMENT '所有人'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='onwing发动机表';

-- --------------------------------------------------------

--
-- 表的结构 `ehm_eng_spare`
--

CREATE TABLE IF NOT EXISTS `ehm_eng_spare` (
  `ID` int(11) NOT NULL,
  `ENG_ID` int(11) NOT NULL COMMENT '发动机ID',
  `ENG_SN` varchar(128) NOT NULL COMMENT '发动机号',
  `REMOVE_DATE` datetime NOT NULL COMMENT '删除日期',
  `REMOVAL_CAUSE` varchar(128) NOT NULL COMMENT '删除原因',
  `CONDITION_` varchar(128) NOT NULL COMMENT '状态',
  `FACTORY` varchar(128) NOT NULL COMMENT '工厂',
  `ARRIVED` datetime NOT NULL COMMENT '到达日期',
  `INDUCTION` datetime NOT NULL COMMENT '就位日期',
  `COMPLETE_PLAN` datetime NOT NULL COMMENT '完成计划时间',
  `COMPLETE` datetime NOT NULL COMMENT '完成时间',
  `SHIP` varchar(128) NOT NULL COMMENT 'SHIP',
  `TAT` varchar(128) NOT NULL COMMENT 'TAT'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='发动机备发表';

-- --------------------------------------------------------

--
-- 表的结构 `ehm_hptb_activity`
--

CREATE TABLE IF NOT EXISTS `ehm_hptb_activity` (
  `ID` int(11) NOT NULL,
  `ENG_SN` varchar(128) NOT NULL,
  `HPTB_PN` varchar(128) NOT NULL,
  `HPTB_SN` varchar(128) NOT NULL,
  `ENG_PN` varchar(128) NOT NULL,
  `ON_DATE` varchar(128) NOT NULL,
  `ON_ETSN` varchar(128) NOT NULL,
  `ON_ECSN` varchar(128) NOT NULL,
  `ON_PTSN` varchar(128) NOT NULL,
  `ON_PCSN` varchar(128) NOT NULL,
  `LIMIT_SPECIAL` varchar(128) NOT NULL,
  `CODE` varchar(128) NOT NULL,
  `REMARK` varchar(1024) NOT NULL,
  `CTIME` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='HPTB表';

-- --------------------------------------------------------

--
-- 表的结构 `ehm_hptb_history`
--

CREATE TABLE IF NOT EXISTS `ehm_hptb_history` (
  `ID` int(11) NOT NULL,
  `ENG_SN_USED` varchar(128) NOT NULL,
  `HPTB_PN` varchar(128) NOT NULL,
  `HPTB_SN` varchar(128) NOT NULL,
  `ENG_PN` varchar(128) NOT NULL,
  `ON_DATE` varchar(128) NOT NULL,
  `ON_ETSN` varchar(128) NOT NULL,
  `ON_ECSN` varchar(128) NOT NULL,
  `ON_PTSN` varchar(128) NOT NULL,
  `ON_PCSN` varchar(128) NOT NULL,
  `OFF_DATE` varchar(128) NOT NULL,
  `OFF_ETSN` varchar(128) NOT NULL,
  `OFF_ECSN` varchar(128) NOT NULL,
  `OFF_PTSN` varchar(128) NOT NULL,
  `OFF_PCSN` varchar(128) NOT NULL,
  `LIMIT_SPECIAL` varchar(128) NOT NULL,
  `CODE` varchar(128) NOT NULL,
  `REMARK` varchar(1024) NOT NULL,
  `CTIME` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='HPTB历史表';

-- --------------------------------------------------------

--
-- 表的结构 `ehm_hptn_activity`
--

CREATE TABLE IF NOT EXISTS `ehm_hptn_activity` (
  `ID` int(11) NOT NULL,
  `ENG_SN` varchar(128) NOT NULL,
  `HPTN_PN` varchar(128) NOT NULL,
  `HPTN_SN` varchar(128) NOT NULL,
  `ENG_PN` varchar(128) NOT NULL,
  `ON_DATE` varchar(128) NOT NULL,
  `ON_ETSN` varchar(128) NOT NULL,
  `ON_ECSN` varchar(128) NOT NULL,
  `ON_PTSN` varchar(128) NOT NULL,
  `ON_PCSN` varchar(128) NOT NULL,
  `LIMIT_SPECIAL` varchar(128) NOT NULL,
  `CODE` varchar(128) NOT NULL,
  `REMARK` varchar(1024) NOT NULL,
  `CTIME` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='HPTN表';

-- --------------------------------------------------------

--
-- 表的结构 `ehm_hptn_history`
--

CREATE TABLE IF NOT EXISTS `ehm_hptn_history` (
  `ID` int(11) NOT NULL,
  `ENG_SN_USED` varchar(128) NOT NULL,
  `HPTN_PN` varchar(128) NOT NULL,
  `HPTN_SN` varchar(128) NOT NULL,
  `ENG_PN` varchar(128) NOT NULL,
  `ON_DATE` varchar(128) NOT NULL,
  `ON_ETSN` varchar(128) NOT NULL,
  `ON_ECSN` varchar(128) NOT NULL,
  `ON_PTSN` varchar(128) NOT NULL,
  `ON_PCSN` varchar(128) NOT NULL,
  `OFF_DATE` varchar(128) NOT NULL,
  `OFF_ETSN` varchar(128) NOT NULL,
  `OFF_ECSN` varchar(128) NOT NULL,
  `OFF_PTSN` varchar(128) NOT NULL,
  `OFF_PCSN` varchar(128) NOT NULL,
  `LIMIT_SPECIAL` varchar(128) NOT NULL,
  `CODE` varchar(128) NOT NULL,
  `REMARK` varchar(1024) NOT NULL,
  `CTIME` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='HPTN历史表';

-- --------------------------------------------------------

--
-- 表的结构 `ehm_llp_activity`
--

CREATE TABLE IF NOT EXISTS `ehm_llp_activity` (
  `ID` int(11) NOT NULL,
  `ENG_SN` varchar(128) NOT NULL,
  `IIN` varchar(128) NOT NULL,
  `LLP_PN` varchar(128) NOT NULL,
  `LLP_SN` varchar(128) NOT NULL,
  `PLANE_TYPE` varchar(128) NOT NULL,
  `ENG_PN` varchar(128) NOT NULL,
  `ON_DATE` varchar(128) NOT NULL,
  `ON_ETSN` varchar(128) NOT NULL,
  `ON_ECSN` varchar(128) NOT NULL,
  `ON_PTSN` varchar(128) NOT NULL,
  `ON_PCSN` varchar(128) NOT NULL,
  `LIMIT_SPECIAL` varchar(128) NOT NULL,
  `REMARK` varchar(1024) NOT NULL,
  `CTIME` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='LLP表';

-- --------------------------------------------------------

--
-- 表的结构 `ehm_llp_history`
--

CREATE TABLE IF NOT EXISTS `ehm_llp_history` (
  `ID` int(11) NOT NULL,
  `ENG_SN_USED` varchar(128) NOT NULL,
  `IIN` varchar(128) NOT NULL,
  `LLP_PN` varchar(128) NOT NULL,
  `LLP_SN` varchar(128) NOT NULL,
  `PLANE_TYPE` varchar(128) NOT NULL,
  `ENG_PN` varchar(128) NOT NULL,
  `ON_DATE` varchar(128) NOT NULL,
  `ON_ETSN` varchar(128) NOT NULL,
  `ON_ECSN` varchar(128) NOT NULL,
  `ON_PTSN` varchar(128) NOT NULL,
  `ON_PCSN` varchar(128) NOT NULL,
  `OFF_DATE` varchar(128) NOT NULL,
  `OFF_ETSN` varchar(128) NOT NULL,
  `OFF_ECSN` varchar(128) NOT NULL,
  `OFF_PTSN` varchar(128) NOT NULL,
  `OFF_PCSN` varchar(128) NOT NULL,
  `LIMIT_SPECIAL` varchar(128) NOT NULL,
  `REMARK` varchar(1024) NOT NULL,
  `CTIME` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='LLP历史表';

-- --------------------------------------------------------

--
-- 表的结构 `ehm_lptn1_activity`
--

CREATE TABLE IF NOT EXISTS `ehm_lptn1_activity` (
  `ID` int(11) NOT NULL,
  `ENG_SN` varchar(128) NOT NULL,
  `LPTN1_PN` varchar(128) NOT NULL,
  `LPTN1_SN` varchar(128) NOT NULL,
  `ENG_PN` varchar(128) NOT NULL,
  `ON_DATE` varchar(128) NOT NULL,
  `ON_ETSN` varchar(128) NOT NULL,
  `ON_ECSN` varchar(128) NOT NULL,
  `ON_PTSN` varchar(128) NOT NULL,
  `ON_PCSN` varchar(128) NOT NULL,
  `LIMIT_SPECIAL` varchar(128) NOT NULL,
  `CODE` varchar(128) NOT NULL,
  `REMARK` varchar(1024) NOT NULL,
  `CTIME` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='LPTN1表';

-- --------------------------------------------------------

--
-- 表的结构 `ehm_lptn1_history`
--

CREATE TABLE IF NOT EXISTS `ehm_lptn1_history` (
  `ID` int(11) NOT NULL,
  `ENG_SN_USED` varchar(128) NOT NULL,
  `LPTN1_PN` varchar(128) NOT NULL,
  `LPTN1_SN` varchar(128) NOT NULL,
  `ENG_PN` varchar(128) NOT NULL,
  `ON_DATE` varchar(128) NOT NULL,
  `ON_ETSN` varchar(128) NOT NULL,
  `ON_ECSN` varchar(128) NOT NULL,
  `ON_PTSN` varchar(128) NOT NULL,
  `ON_PCSN` varchar(128) NOT NULL,
  `OFF_DATE` varchar(128) NOT NULL,
  `OFF_ETSN` varchar(128) NOT NULL,
  `OFF_ECSN` varchar(128) NOT NULL,
  `OFF_PTSN` varchar(128) NOT NULL,
  `OFF_PCSN` varchar(128) NOT NULL,
  `LIMIT_SPECIAL` varchar(128) NOT NULL,
  `CODE` varchar(128) NOT NULL,
  `REMARK` varchar(1024) NOT NULL,
  `CTIME` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='LPTN1历史表';

-- --------------------------------------------------------

--
-- 表的结构 `ehm_notice_record`
--

CREATE TABLE IF NOT EXISTS `ehm_notice_record` (
  `ID` int(11) NOT NULL,
  `RULE_INSPECTION_ID` int(11) NOT NULL COMMENT '监测ID，用以记录是哪条规则报警',
  `ENG_ID` int(11) NOT NULL COMMENT '发动机ID',
  `ENG_SN` varchar(128) NOT NULL COMMENT '发动机号',
  `TYEP` int(11) NOT NULL COMMENT '0：审核不处理；1：审核处理',
  `USERID` int(11) NOT NULL COMMENT '审核人',
  `CTIME` datetime NOT NULL COMMENT '生成时间',
  `UTIME` datetime NOT NULL COMMENT '审核时间',
  `FTIME` datetime NOT NULL COMMENT '完成时间',
  `H_USERID` int(11) NOT NULL COMMENT '处理人',
  `REMARK` varchar(1024) NOT NULL COMMENT '备注'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='报警记录';

-- --------------------------------------------------------

--
-- 表的结构 `ehm_plane_flight`
--

CREATE TABLE IF NOT EXISTS `ehm_plane_flight` (
  `ID` int(11) NOT NULL,
  `FLY_TIME` datetime NOT NULL COMMENT '飞行时间',
  `AIR_TIME` double NOT NULL COMMENT '空中时间',
  `FLOOR_TIME` double NOT NULL COMMENT '空地时间',
  `S_TERMINAL` varchar(128) NOT NULL COMMENT '飞起航站',
  `E_TERMINAL` varchar(128) NOT NULL COMMENT '到达航站',
  `CTIME` datetime NOT NULL COMMENT '创建时间',
  `NUMBER` varchar(64) NOT NULL COMMENT '航班号'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='航班表';

-- --------------------------------------------------------

--
-- 表的结构 `ehm_record_data_eng`
--

CREATE TABLE IF NOT EXISTS `ehm_record_data_eng` (
  `ID` int(11) NOT NULL,
  `ENG_SN` varchar(128) NOT NULL COMMENT '发动机SN',
  `ENG_SN_SAP` varchar(128) NOT NULL COMMENT 'SAP平台显示的方式',
  `ENG_SERIES` varchar(128) NOT NULL COMMENT '发动机序列',
  `ENG_TYPE` varchar(128) NOT NULL COMMENT '发动机类型',
  `ENG_MODEL` varchar(128) NOT NULL COMMENT '发动机模型',
  `ENG_CONFIG` varchar(128) NOT NULL COMMENT '发动机构型',
  `DELIVERY_MODE` varchar(128) NOT NULL COMMENT '原始厂商',
  `OWNER` varchar(128) NOT NULL COMMENT '所有人',
  `CODE_CONFIG` varchar(128) NOT NULL COMMENT 'CODE_CONFIG',
  `ENG_CONFIGRATION` varchar(128) NOT NULL COMMENT '发动机型号另一种标识',
  `ENG_PN` varchar(128) NOT NULL COMMENT '发动机设备号',
  `CTIME` datetime NOT NULL COMMENT '创建时间',
  `USERID` int(11) NOT NULL COMMENT '录入人'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='发动机属性变更记录';

-- --------------------------------------------------------

--
-- 表的结构 `ehm_record_data_plane`
--

CREATE TABLE IF NOT EXISTS `ehm_record_data_plane` (
  `ID` int(11) NOT NULL,
  `TAIL` varchar(128) NOT NULL COMMENT '某个点飞机的唯一标识 表之间一般使用这个字段进行关联',
  `DUTY` int(11) NOT NULL COMMENT '基地ID',
  `RATING_PLANE` varchar(128) NOT NULL COMMENT '推力',
  `CONFIG_PLANE` varchar(128) NOT NULL COMMENT '构型',
  `ENG_SN_ORIGINAL` varchar(128) NOT NULL COMMENT '原始的发动机编码',
  `SERIES` varchar(128) NOT NULL COMMENT '型号1级',
  `TYPE` varchar(128) NOT NULL COMMENT '型号2级',
  `MODEL` varchar(128) NOT NULL COMMENT '型号3级',
  `ATTRIBUTE` varchar(128) NOT NULL COMMENT '属性',
  `ETOPS` varchar(128) NOT NULL COMMENT 'ETOPS',
  `H_HIGHLAND` int(11) NOT NULL COMMENT '高高原:0是1否',
  `VARIABLE` varchar(128) NOT NULL COMMENT 'VARIABLE',
  `SERIAL` varchar(128) NOT NULL COMMENT 'MSN',
  `LINE` varchar(128) NOT NULL COMMENT 'LINE',
  `MANUAL` varchar(128) NOT NULL COMMENT 'MANUAL',
  `OPERATER` varchar(128) NOT NULL COMMENT '航空公司（品牌）',
  `OWNER` varchar(128) NOT NULL COMMENT '所有人',
  `REMARK` varchar(1024) NOT NULL COMMENT '备注',
  `IMPORT_WAY` varchar(128) NOT NULL COMMENT '引进方式',
  `CTIME` datetime NOT NULL COMMENT '创建时间',
  `USERID` int(11) NOT NULL COMMENT '录入人 关联用户表id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='飞机属性变更记录';

-- --------------------------------------------------------

--
-- 表的结构 `ehm_record_eng_replace`
--

CREATE TABLE IF NOT EXISTS `ehm_record_eng_replace` (
  `ID` int(11) NOT NULL,
  `PLANE_ID` int(11) NOT NULL COMMENT '飞机ID',
  `TAIL` varchar(128) NOT NULL COMMENT '飞机号',
  `ENG_POSITION` int(4) NOT NULL COMMENT '发动机位置',
  `ENG_ID` int(11) NOT NULL COMMENT '发动机ID',
  `ENG_SN` varchar(128) NOT NULL COMMENT '发动机编号',
  `ENG_PN` varchar(128) NOT NULL COMMENT '发动机设备号',
  `USED_CYCLE` varchar(128) NOT NULL COMMENT 'USED_CYCLE',
  `DATE_INSTALL` datetime NOT NULL COMMENT '安装时间',
  `ETSN_INSTALL` varchar(128) NOT NULL COMMENT '安装ETSN',
  `ECSN_INSTALL` varchar(128) NOT NULL COMMENT '安装ECSN',
  `DATE_REMOVAL` datetime NOT NULL COMMENT '拆发时间',
  `ETSN_REMOVAL` varchar(128) NOT NULL COMMENT '拆发ETSN',
  `ECSN_REMOVAL` varchar(128) NOT NULL COMMENT '拆发ECSN',
  `PLAN` varchar(128) NOT NULL COMMENT 'PLAN',
  `SV` varchar(128) NOT NULL COMMENT 'SV',
  `SV_GRADE` varchar(128) NOT NULL COMMENT 'SV_GRADE',
  `REMOVAL_CAUSE` varchar(128) NOT NULL COMMENT '拆发原因',
  `REMARK` varchar(1024) DEFAULT NULL COMMENT '备注',
  `FACTORY` varchar(128) NOT NULL COMMENT '工厂'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='发动机故障记录';

-- --------------------------------------------------------

--
-- 表的结构 `ehm_record_eng_sv_schedule`
--

CREATE TABLE IF NOT EXISTS `ehm_record_eng_sv_schedule` (
  `ID` int(11) NOT NULL,
  `REMOVE_DATE` datetime NOT NULL COMMENT '拆发时间',
  `FACTORY` varchar(128) NOT NULL COMMENT '工厂',
  `ARRIVED` datetime NOT NULL COMMENT '到达时间',
  `INDUCTION` varchar(128) NOT NULL COMMENT 'INDUCTION',
  `COMPLETE_PLAN` datetime NOT NULL COMMENT '计划完成时间',
  `COMPLETE` datetime NOT NULL COMMENT '完成时间',
  `SHIP` datetime NOT NULL COMMENT '送还时间',
  `COST` decimal(10,2) NOT NULL,
  `TAT` int(11) DEFAULT NULL COMMENT '耗时(秒为单位)'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='发动机维修记录';

-- --------------------------------------------------------

--
-- 表的结构 `ehm_role`
--

CREATE TABLE IF NOT EXISTS `ehm_role` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(128) NOT NULL COMMENT '角色名称',
  `PID` int(11) NOT NULL COMMENT '上级ID',
  `STATUS` int(11) NOT NULL COMMENT '0：无效；1：有效',
  `REMARK` varchar(1024) NOT NULL COMMENT '备注',
  `CTIME` datetime NOT NULL COMMENT '创建时间',
  `UTIME` datetime NOT NULL COMMENT '修改时间',
  `LISTORDER` int(11) NOT NULL COMMENT '排序'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';

-- --------------------------------------------------------

--
-- 表的结构 `ehm_role_user`
--

CREATE TABLE IF NOT EXISTS `ehm_role_user` (
  `ROLE_ID` int(11) NOT NULL COMMENT '角色ID',
  `USERID` int(11) NOT NULL COMMENT '用户ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户角色对应表';

-- --------------------------------------------------------

--
-- 表的结构 `ehm_rule_computation`
--

CREATE TABLE IF NOT EXISTS `ehm_rule_computation` (
  `ID` int(11) NOT NULL,
  `INSPECTION_ID` int(11) NOT NULL COMMENT '检查表ID',
  `TYPE` int(11) NOT NULL COMMENT '0：第一个条件；1：and；2：or',
  `RULE_ID` int(11) NOT NULL COMMENT '规则参数ID',
  `CTIME` datetime NOT NULL COMMENT '创建时间',
  `CALCULATION_TYPE` int(11) NOT NULL COMMENT '1：区间；2：短期；3：中期；4：长期',
  `CALCULATION_RANGE` int(11) NOT NULL COMMENT '计算范围',
  `RANGE_TYPE` int(11) NOT NULL COMMENT '1：点；2：天',
  `FLIGHT_PHASE` int(11) NOT NULL COMMENT '0：ALL；1：起飞；2\r\n\r\n：巡航',
  `MIN` varchar(128) DEFAULT NULL COMMENT '最小值',
  `MAX` varchar(128) DEFAULT NULL COMMENT '最大值',
  `EQUAL` varchar(128) DEFAULT NULL COMMENT '等于',
  `UNEQUAL` varchar(128) DEFAULT NULL COMMENT '不等于'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='计算规则';

-- --------------------------------------------------------

--
-- 表的结构 `ehm_rule_inspection`
--

CREATE TABLE IF NOT EXISTS `ehm_rule_inspection` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(128) NOT NULL COMMENT '名称',
  `USERID` int(11) NOT NULL COMMENT '录入人',
  `TYPE` int(11) NOT NULL COMMENT '0：开启；1：关闭',
  `CONTENT` varchar(648) NOT NULL COMMENT '警告提示内容',
  `ENG_SERIES` varchar(128) NOT NULL COMMENT '发动机序列',
  `ENG_TYPE` varchar(128) NOT NULL COMMENT '发动机类型',
  `ENG_MODEL` varchar(128) NOT NULL COMMENT '发动机模型',
  `ENG_CONFIG` varchar(128) NOT NULL COMMENT '发动机构型',
  `ORDER_ID` int(11) NOT NULL COMMENT '优先级',
  `CTIME` datetime NOT NULL COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='监测规则';

-- --------------------------------------------------------

--
-- 表的结构 `ehm_rule_inspection_user`
--

CREATE TABLE IF NOT EXISTS `ehm_rule_inspection_user` (
  `ID` int(11) NOT NULL,
  `INSPECTION_ID` int(11) NOT NULL COMMENT '规则ID',
  `DUTY` int(11) NOT NULL COMMENT '基地',
  `USERID` int(11) NOT NULL COMMENT '人员',
  `CTIME` datetime NOT NULL COMMENT '创建时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='监测推送人员表';

-- --------------------------------------------------------

--
-- 表的结构 `ehm_rule_parameter`
--

CREATE TABLE IF NOT EXISTS `ehm_rule_parameter` (
  `ID` int(11) NOT NULL,
  `PARENT_ID` int(11) NOT NULL COMMENT '上级ID',
  `TYPE` int(11) NOT NULL COMMENT '0：表；1：字段',
  `VAL` varchar(128) NOT NULL COMMENT '值',
  `ANNOTATION` varchar(128) NOT NULL COMMENT '注释',
  `CTIME` datetime NOT NULL COMMENT '创建时间',
  `IS_CALCULATE` int(11) NOT NULL COMMENT '是否加入计算；0：否；1：是'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='规则参数表';

-- --------------------------------------------------------

--
-- 表的结构 `ehm_sap_dailyreport`
--

CREATE TABLE IF NOT EXISTS `ehm_sap_dailyreport` (
  `ID` int(11) NOT NULL,
  `DUTY` int(11) NOT NULL COMMENT '基地ID',
  `SERIES` varchar(128) NOT NULL COMMENT '机型',
  `PLANE_ID` int(11) NOT NULL,
  `TAIL` varchar(128) NOT NULL COMMENT '机号',
  `ENG_POSIT` varchar(128) NOT NULL COMMENT '发动机位置',
  `ENG_ID` int(11) NOT NULL COMMENT '发动机id',
  `ENG_SN` varchar(128) NOT NULL COMMENT '发动机序号',
  `Rating` varchar(128) NOT NULL COMMENT 'Rating',
  `Config` varchar(128) NOT NULL COMMENT 'Config',
  `ETSN` varchar(128) NOT NULL COMMENT '当前ETSN',
  `ECSN` varchar(128) NOT NULL COMMENT '当前ECSN',
  `EGTM` varchar(128) NOT NULL COMMENT '当前EGTM(℃)',
  `MIN_LLP` varchar(128) NOT NULL COMMENT 'LLP最小剩余寿命（循环）',
  `REMARK` varchar(1024) NOT NULL COMMENT '备注',
  `IS_NORMAL` int(11) NOT NULL COMMENT '是否正常;0:否；1是',
  `DELIVERY_MODE_MONITORING` varchar(128) NOT NULL COMMENT '厂家网站监控',
  `OIL_MONITORING` varchar(128) NOT NULL COMMENT '滑耗监控',
  `VIBRATOPM_MONITORING` varchar(128) NOT NULL COMMENT '振动监控',
  `MAGNETIC_PLUGIN_SPECTION_REPORT` varchar(128) NOT NULL COMMENT '磁堵检查报告',
  `BORESCOPE_REPORT` varchar(128) NOT NULL COMMENT '孔探报告',
  `CNR_REPORT` varchar(128) NOT NULL COMMENT 'CNR报告',
  `ACARS` varchar(128) NOT NULL COMMENT 'ACARS传输',
  `ROUTE_OPERATION` varchar(128) NOT NULL COMMENT '航线运行',
  `ENG_OIL` varchar(128) NOT NULL COMMENT '发动机滑耗',
  `ETOPS` varchar(128) NOT NULL COMMENT 'ETOPS能力',
  `H_HIGHLAND` int(11) NOT NULL COMMENT '高高原能力',
  `CNTR_OPTR` varchar(128) NOT NULL COMMENT '营运人',
  `ETIME` datetime NOT NULL COMMENT '预计拆发日期',
  `ETSR` varchar(128) NOT NULL COMMENT '当前ETSR',
  `ECSR` varchar(128) NOT NULL COMMENT '当前ECSR',
  `ETSI` varchar(128) NOT NULL COMMENT '当前ETSI',
  `ECSI` varchar(128) NOT NULL COMMENT '当前ECSI',
  `ETSO` varchar(128) NOT NULL COMMENT '当前ETSO',
  `ECSO` varchar(128) NOT NULL COMMENT '当前ECSO',
  `PTIME` datetime NOT NULL COMMENT '装机日期',
  `CTIME` datetime NOT NULL COMMENT '创建日期',
  `C_USERID` int(11) NOT NULL COMMENT '创建人ID',
  `U_USERID` int(11) NOT NULL COMMENT '更改人ID',
  `UTIME` datetime NOT NULL COMMENT '更改日期',
  `AUDITOR` int(11) NOT NULL COMMENT '审核人ID',
  `ATIME` datetime NOT NULL COMMENT '审核日期',
  `MON_PERFORMANCE_NO` varchar(128) NOT NULL COMMENT '性能月报编号',
  `ENG_PN` varchar(128) NOT NULL COMMENT '发动机设备号',
  `IS_HIS_DATA` int(11) NOT NULL COMMENT '是否历史数据 0否1是',
  `DOC` varchar(648) NOT NULL COMMENT '文档'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='日报表';

-- --------------------------------------------------------

--
-- 表的结构 `ehm_user`
--

CREATE TABLE IF NOT EXISTS `ehm_user` (
  `USERID` int(11) NOT NULL COMMENT '用户ID',
  `USERNAME` varchar(128) NOT NULL COMMENT '用户名',
  `REALNAME` varchar(128) NOT NULL COMMENT '姓名',
  `PASSWORD` varchar(128) NOT NULL COMMENT '密码',
  `POSITION` varchar(128) NOT NULL COMMENT '职位',
  `ROLE` int(11) NOT NULL COMMENT '角色ID',
  `PHONE` varchar(32) NOT NULL COMMENT '手机号',
  `CTIME` datetime NOT NULL COMMENT '创建时间',
  `DUTY` int(11) NOT NULL COMMENT '基地ID',
  `NUMBER` varchar(64) DEFAULT NULL COMMENT '工号',
  `EMAIL` varchar(64) NOT NULL COMMENT '邮箱',
  `LOCATION` varchar(128) NOT NULL COMMENT 'LOCATION'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- --------------------------------------------------------

--
-- 表的结构 `ehm_water_wash_data`
--

CREATE TABLE IF NOT EXISTS `ehm_water_wash_data` (
  `ID` int(11) NOT NULL,
  `PARAMETER_APPARATUS` varchar(128) NOT NULL COMMENT '设备参数',
  `USERID` int(11) NOT NULL COMMENT '水洗人员ID',
  `GEOGRAPHIC` varchar(128) NOT NULL COMMENT '地理位置',
  `WEATHER` varchar(128) NOT NULL COMMENT '天气',
  `ENG_ID` int(11) NOT NULL COMMENT '发动机ID',
  `ENG_SN` varchar(128) NOT NULL COMMENT '发动机型号',
  `RESULT` varchar(128) NOT NULL COMMENT '效果',
  `LEVEL` varchar(128) NOT NULL COMMENT '评级',
  `DURATION_TIME` datetime NOT NULL COMMENT '持续时间',
  `CTIME` datetime NOT NULL COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='发动机水洗数据';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ehm_auth_access`
--
ALTER TABLE `ehm_auth_access`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `ehm_auth_rule`
--
ALTER TABLE `ehm_auth_rule`
  ADD PRIMARY KEY (`ROLE_ID`);

--
-- Indexes for table `ehm_control_fleet_eng_spare`
--
ALTER TABLE `ehm_control_fleet_eng_spare`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `ehm_control_fleet_plane`
--
ALTER TABLE `ehm_control_fleet_plane`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `ehm_data_case`
--
ALTER TABLE `ehm_data_case`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `ehm_data_cfm_performance`
--
ALTER TABLE `ehm_data_cfm_performance`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `ehm_data_eng`
--
ALTER TABLE `ehm_data_eng`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `ehm_data_idplug`
--
ALTER TABLE `ehm_data_idplug`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `ehm_data_plane`
--
ALTER TABLE `ehm_data_plane`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `ehm_data_sap_defect`
--
ALTER TABLE `ehm_data_sap_defect`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `ehm_data_sap_oil_consumption`
--
ALTER TABLE `ehm_data_sap_oil_consumption`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `ehm_duty`
--
ALTER TABLE `ehm_duty`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `ehm_eng_condition_fleet`
--
ALTER TABLE `ehm_eng_condition_fleet`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `ehm_eng_fleet`
--
ALTER TABLE `ehm_eng_fleet`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `ehm_eng_onwing`
--
ALTER TABLE `ehm_eng_onwing`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `ehm_eng_spare`
--
ALTER TABLE `ehm_eng_spare`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `ehm_hptb_activity`
--
ALTER TABLE `ehm_hptb_activity`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `ehm_hptb_history`
--
ALTER TABLE `ehm_hptb_history`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `ehm_hptn_activity`
--
ALTER TABLE `ehm_hptn_activity`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `ehm_hptn_history`
--
ALTER TABLE `ehm_hptn_history`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `ehm_llp_activity`
--
ALTER TABLE `ehm_llp_activity`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `ehm_llp_history`
--
ALTER TABLE `ehm_llp_history`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `ehm_lptn1_activity`
--
ALTER TABLE `ehm_lptn1_activity`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `ehm_lptn1_history`
--
ALTER TABLE `ehm_lptn1_history`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `ehm_notice_record`
--
ALTER TABLE `ehm_notice_record`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `ehm_record_data_eng`
--
ALTER TABLE `ehm_record_data_eng`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `ehm_record_data_plane`
--
ALTER TABLE `ehm_record_data_plane`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `ehm_record_eng_replace`
--
ALTER TABLE `ehm_record_eng_replace`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `ehm_record_eng_sv_schedule`
--
ALTER TABLE `ehm_record_eng_sv_schedule`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `ehm_role`
--
ALTER TABLE `ehm_role`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `ehm_role_user`
--
ALTER TABLE `ehm_role_user`
  ADD PRIMARY KEY (`ROLE_ID`);

--
-- Indexes for table `ehm_rule_computation`
--
ALTER TABLE `ehm_rule_computation`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `ehm_rule_inspection`
--
ALTER TABLE `ehm_rule_inspection`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `ehm_rule_parameter`
--
ALTER TABLE `ehm_rule_parameter`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `ehm_sap_dailyreport`
--
ALTER TABLE `ehm_sap_dailyreport`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `ehm_user`
--
ALTER TABLE `ehm_user`
  ADD PRIMARY KEY (`USERID`);

--
-- Indexes for table `ehm_water_wash_data`
--
ALTER TABLE `ehm_water_wash_data`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ehm_auth_access`
--
ALTER TABLE `ehm_auth_access`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ehm_auth_rule`
--
ALTER TABLE `ehm_auth_rule`
  MODIFY `ROLE_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色';
--
-- AUTO_INCREMENT for table `ehm_control_fleet_eng_spare`
--
ALTER TABLE `ehm_control_fleet_eng_spare`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ehm_control_fleet_plane`
--
ALTER TABLE `ehm_control_fleet_plane`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ehm_data_case`
--
ALTER TABLE `ehm_data_case`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ehm_data_cfm_performance`
--
ALTER TABLE `ehm_data_cfm_performance`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ehm_data_eng`
--
ALTER TABLE `ehm_data_eng`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `ehm_data_idplug`
--
ALTER TABLE `ehm_data_idplug`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ehm_data_plane`
--
ALTER TABLE `ehm_data_plane`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ehm_data_sap_defect`
--
ALTER TABLE `ehm_data_sap_defect`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ehm_data_sap_oil_consumption`
--
ALTER TABLE `ehm_data_sap_oil_consumption`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ehm_duty`
--
ALTER TABLE `ehm_duty`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ehm_eng_condition_fleet`
--
ALTER TABLE `ehm_eng_condition_fleet`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ehm_eng_fleet`
--
ALTER TABLE `ehm_eng_fleet`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ehm_eng_onwing`
--
ALTER TABLE `ehm_eng_onwing`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ehm_eng_spare`
--
ALTER TABLE `ehm_eng_spare`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ehm_hptb_activity`
--
ALTER TABLE `ehm_hptb_activity`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ehm_hptb_history`
--
ALTER TABLE `ehm_hptb_history`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ehm_hptn_activity`
--
ALTER TABLE `ehm_hptn_activity`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ehm_hptn_history`
--
ALTER TABLE `ehm_hptn_history`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ehm_llp_activity`
--
ALTER TABLE `ehm_llp_activity`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ehm_llp_history`
--
ALTER TABLE `ehm_llp_history`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ehm_lptn1_activity`
--
ALTER TABLE `ehm_lptn1_activity`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ehm_lptn1_history`
--
ALTER TABLE `ehm_lptn1_history`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ehm_notice_record`
--
ALTER TABLE `ehm_notice_record`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ehm_record_data_eng`
--
ALTER TABLE `ehm_record_data_eng`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ehm_record_data_plane`
--
ALTER TABLE `ehm_record_data_plane`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ehm_record_eng_replace`
--
ALTER TABLE `ehm_record_eng_replace`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ehm_record_eng_sv_schedule`
--
ALTER TABLE `ehm_record_eng_sv_schedule`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ehm_role`
--
ALTER TABLE `ehm_role`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ehm_role_user`
--
ALTER TABLE `ehm_role_user`
  MODIFY `ROLE_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色ID';
--
-- AUTO_INCREMENT for table `ehm_rule_computation`
--
ALTER TABLE `ehm_rule_computation`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ehm_rule_inspection`
--
ALTER TABLE `ehm_rule_inspection`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ehm_rule_parameter`
--
ALTER TABLE `ehm_rule_parameter`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ehm_sap_dailyreport`
--
ALTER TABLE `ehm_sap_dailyreport`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ehm_user`
--
ALTER TABLE `ehm_user`
  MODIFY `USERID` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID';
--
-- AUTO_INCREMENT for table `ehm_water_wash_data`
--
ALTER TABLE `ehm_water_wash_data`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;