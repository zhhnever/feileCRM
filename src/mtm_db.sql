/*
 Navicat Premium Data Transfer

 Source Server         : ·
 Source Server Type    : MySQL
 Source Server Version : 50717
 Source Host           : localhost:3306
 Source Schema         : mtm_db

 Target Server Type    : MySQL
 Target Server Version : 50717
 File Encoding         : 65001

 Date: 30/07/2018 01:58:09
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for crm_staff
-- ----------------------------
DROP TABLE IF EXISTS `crm_staff`;
CREATE TABLE `crm_staff`  (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `e_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '员工编号',
  `is_teacher` tinyint(2) NULL DEFAULT NULL COMMENT '是否是老師',
  `sex` tinyint(255) NULL DEFAULT NULL,
  `age` int(11) NULL DEFAULT NULL,
  `birth_date` datetime(0) NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `wx_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `in_time` datetime(0) NULL DEFAULT NULL,
  `status` tinyint(2) NULL DEFAULT NULL COMMENT '在职状态/离职，在职',
  `create_stamp` datetime(0) NULL DEFAULT NULL,
  `update_stamp` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tb_address
-- ----------------------------
DROP TABLE IF EXISTS `tb_address`;
CREATE TABLE `tb_address`  (
  `address_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NULL DEFAULT NULL,
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `street_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_default` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`address_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_address
-- ----------------------------
INSERT INTO `tb_address` VALUES (3, 63, 'test', '18782059038', '四川省成都市青羊区百花中心站对面', 1);
INSERT INTO `tb_address` VALUES (5, 63, 'admin', '18782059038', '上海青浦区汇联路', 0);
INSERT INTO `tb_address` VALUES (6, 62, '1', '1', '1', 0);

-- ----------------------------
-- Table structure for tb_base
-- ----------------------------
DROP TABLE IF EXISTS `tb_base`;
CREATE TABLE `tb_base`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `web_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `key_word` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `source_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `upload_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `copyright` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `count_code` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `has_log_notice` int(11) NULL DEFAULT NULL,
  `log_notice` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `has_all_notice` int(11) NULL DEFAULT NULL,
  `all_notice` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `notice` varchar(8000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_log` varchar(8000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `front_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_base
-- ----------------------------
INSERT INTO `tb_base` VALUES (1, 'XMall后台管理系统 v1.0', 'XMall后台管理系统 v1.0,XMall,XMall购物商城后台管理系统', 'XMall后台管理系统 v1.0，是一款电商后台管理系统，适合中小型CMS后台系统。', '', '', '', '', 0, 'test login notice', 0, 'test all notice', '', '', 'http://blog.exrick.cn');

-- ----------------------------
-- Table structure for tb_contract
-- ----------------------------
DROP TABLE IF EXISTS `tb_contract`;
CREATE TABLE `tb_contract`  (
  `id` int(255) NOT NULL,
  `contract_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `m_id` int(11) NULL DEFAULT NULL,
  `cc_id` int(11) NULL DEFAULT NULL,
  `id_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `money` decimal(11, 0) NULL DEFAULT NULL,
  `discount` double(65, 0) NULL DEFAULT NULL,
  `class_type` int(11) NULL DEFAULT NULL,
  `state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tb_course
-- ----------------------------
DROP TABLE IF EXISTS `tb_course`;
CREATE TABLE `tb_course`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '课程名',
  `teacher` int(12) NOT NULL COMMENT '老师',
  `date` datetime(0) NOT NULL COMMENT '课程日期',
  `create_stamp` datetime(0) NULL DEFAULT NULL,
  `update_stamp` datetime(0) NULL DEFAULT NULL,
  `stu_num` int(11) NOT NULL COMMENT '学生数量做限制',
  `course_id` bigint(20) NOT NULL COMMENT '课程',
  `reserve_time` datetime(0) NULL DEFAULT NULL,
  `status` tinyint(4) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_course
-- ----------------------------
INSERT INTO `tb_course` VALUES (4, '钢琴教学一对一', 1, '2018-08-08 11:46:04', '2018-06-21 11:46:21', '2018-06-21 11:46:21', 12, 152937344028221, '2018-06-23 11:46:17', 1);
INSERT INTO `tb_course` VALUES (5, '吉他一对一', 1, '2018-06-27 22:32:23', '2018-06-22 22:32:28', '2018-06-22 22:32:28', 12, 152967648151718, '2018-06-27 22:32:23', 1);

-- ----------------------------
-- Table structure for tb_course_reserve
-- ----------------------------
DROP TABLE IF EXISTS `tb_course_reserve`;
CREATE TABLE `tb_course_reserve`  (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) NULL DEFAULT NULL,
  `stu_id` int(11) NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  `reserve_time` datetime(0) NULL DEFAULT NULL,
  `create_stamp` datetime(0) NULL DEFAULT NULL,
  `update_stamp` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tb_item
-- ----------------------------
DROP TABLE IF EXISTS `tb_item`;
CREATE TABLE `tb_item`  (
  `id` bigint(20) NOT NULL COMMENT '商品id，同时也是商品编号',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品标题',
  `sell_point` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品卖点',
  `price` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '商品价格',
  `num` int(11) NULL DEFAULT NULL COMMENT '库存数量',
  `limit_num` int(11) NULL DEFAULT NULL COMMENT '售卖数量限制',
  `class_time` int(11) NULL DEFAULT NULL COMMENT '课程时长',
  `image` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品图片',
  `cid` bigint(11) NULL DEFAULT NULL COMMENT '所属分类',
  `status` int(1) NULL DEFAULT 1 COMMENT '商品状态 1正常 0下架',
  `created` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cid`(`cid`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `updated`(`updated`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_item
-- ----------------------------
INSERT INTO `tb_item` VALUES (152937344028221, '钢琴教学一对一', '钢琴', 12000.00, 999, 10, 45, 'e0542ea1e8f647c29e34bc28960e86b4.png,485de7b5d31840c385385631f650133d.png,7e4051943ede4be38fe9a52b763a3652.png', 1190, 1, '2018-06-19 09:57:20', '2018-06-26 01:13:42');
INSERT INTO `tb_item` VALUES (152967648151718, '吉他一对一', '吉他一对一', 2000.00, 999, 99, 45, '1f01c17c99f84a04b1fe4fa5cd72b163.png', 1191, 1, '2018-06-22 22:08:02', '2018-06-25 21:28:08');
INSERT INTO `tb_item` VALUES (153261481199591, 'CLASS 1', 'CLASS 1', 12000.00, 1, 1, NULL, '03ecf1099824403fbb8937e3f0a3d6b5.png', 1190, 1, '2018-07-26 22:20:12', '2018-07-26 22:20:12');

-- ----------------------------
-- Table structure for tb_item_cat
-- ----------------------------
DROP TABLE IF EXISTS `tb_item_cat`;
CREATE TABLE `tb_item_cat`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '类目ID',
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '父分类ID=0时代表一级根分类',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类名称',
  `status` int(1) NULL DEFAULT 1 COMMENT '状态 1启用 0禁用',
  `sort_order` int(4) NULL DEFAULT NULL COMMENT '排列序号',
  `is_parent` tinyint(1) NULL DEFAULT 1 COMMENT '是否为父分类 1为true 0为false',
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `created` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `parent_id`(`parent_id`, `status`) USING BTREE,
  INDEX `sort_order`(`sort_order`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1193 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品类目' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_item_cat
-- ----------------------------
INSERT INTO `tb_item_cat` VALUES (-1, 0, '所有商品', 1, 0, 0, NULL, '不建议修改', '2017-09-24 11:10:45', '2017-11-06 23:24:33');
INSERT INTO `tb_item_cat` VALUES (1185, 1183, '钢琴课程', 1, 0, 1, NULL, '', '2018-06-14 10:54:51', '2018-06-14 10:54:51');
INSERT INTO `tb_item_cat` VALUES (1186, 0, '钢琴', 1, 0, 1, NULL, '', NULL, NULL);
INSERT INTO `tb_item_cat` VALUES (1189, 0, '吉他', 1, 0, 1, NULL, '', NULL, NULL);
INSERT INTO `tb_item_cat` VALUES (1190, 1186, '钢琴一对一', 1, 0, 0, NULL, '', '2018-06-15 15:16:57', '2018-06-15 15:16:57');
INSERT INTO `tb_item_cat` VALUES (1191, 1189, '吉他', 1, 0, 0, NULL, '', '2018-06-22 09:19:12', '2018-06-22 09:19:12');
INSERT INTO `tb_item_cat` VALUES (1192, 1186, '钢琴成人课', 1, 0, 0, NULL, '钢琴成人课', '2018-06-22 09:19:27', '2018-06-22 09:19:27');

-- ----------------------------
-- Table structure for tb_item_desc
-- ----------------------------
DROP TABLE IF EXISTS `tb_item_desc`;
CREATE TABLE `tb_item_desc`  (
  `item_id` bigint(20) NOT NULL COMMENT '商品ID',
  `item_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '商品描述',
  `created` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`item_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品描述表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_item_desc
-- ----------------------------
INSERT INTO `tb_item_desc` VALUES (152937344028221, '钢琴教学<span>钢琴教学</span><span>钢琴教学</span><span>钢琴教学</span><span>钢琴教学</span><span>钢琴教学</span><span>钢琴教学</span><span>钢琴教学</span><span>钢琴教学</span><span>钢琴教学</span><span>钢琴教学</span><span>钢琴教学</span><span>钢琴教学</span><span>钢琴教学</span><span>钢琴教学</span><span>钢琴教学</span><span>钢琴教学</span><span>钢琴教学</span><span>钢琴教学</span><span>钢琴教学</span><span>钢琴教学</span><span>钢琴教学</span><span>钢琴教学</span><span>钢琴教学</span><span>钢琴教学</span><span>钢琴教学</span><span>钢琴教学</span><span>钢琴教学</span><span>钢琴教学</span><span>钢琴教学</span><span>钢琴教学</span><span>钢琴教学</span><span>钢琴教学</span><span>钢琴教学</span><span>钢琴教学</span><span>钢琴教学</span><span>钢琴教学</span><span>钢琴教学</span><span>钢琴教学</span><span>钢琴教学</span><span>钢琴教学</span><span>钢琴教学</span><span>钢琴教学</span><span>钢琴教学</span><span>钢琴教学</span><span>钢琴教学</span><span>钢琴教学</span><span>钢琴教学</span><span>钢琴教学</span><span>钢琴教学</span><span>钢琴教学</span><span>钢琴教学</span>', '2018-06-19 09:57:20', '2018-06-26 01:13:42');
INSERT INTO `tb_item_desc` VALUES (152967648151718, '<img src=\"/6e5b8112051546ce96279a4455aaca8f.png\" alt=\"\" />\n<p style=\"font-size:16px;font-family:&quot;Microsoft YaHei&quot;;background-color:#FFFFFF;\">\n	湖南省长沙市雨花区处于全国资源节约型和环境友好型社会建设综合 配套改革试验区——长株潭城市群的几何核心区域。今年以来，长沙市吹响了打好污染防治攻坚战的集结号，提出“三个月治标、三年治本”的目标。雨花区委、区政府科学决策、科技施策，打响了“雨花蓝”的“全民保卫战”\n</p>\n<p style=\"font-size:16px;font-family:&quot;Microsoft YaHei&quot;;background-color:#FFFFFF;\">\n	&emsp;&emsp;开出焚烧垃圾首笔最严10万元罚单、出台举报环境违法行为的奖励办法、环保与城管网格化管理平台在线监管实现污染“一网打尽”、暗访纪录片主动“揭短”曝光环保问题……一系列打赢蓝天保卫战的亮点，都出现在湖南省长沙市雨花区。\n</p>\n<p style=\"font-size:16px;font-family:&quot;Microsoft YaHei&quot;;background-color:#FFFFFF;\">\n	&emsp;&emsp;“良好的生态环境是最普惠的民生福祉。蓝天不仅是宜居之必需，还会增加市民的获得感，能更好地凝聚发展动力。”长沙市雨花区委书记张敏说，“我们要以最强硬的态度、最严格的执法来推动绿色发展方式和生活方式在全区形成风尚，使蓝天更蓝、绿水更绿。”数据显示，截至今年6月6日，雨花区累计优良天数123天，优良率78.3%，比去年同期增长14天，优良率提高8.4个百分点；PM2.5年均值52，同比下降5.5%，PM10年均值62，同比下降18.4%，空气质量优良率和优良天数继续保持长沙市区第一。\n</p>\n<p style=\"font-size:16px;font-family:&quot;Microsoft YaHei&quot;;background-color:#FFFFFF;\">\n	<strong>&emsp;&emsp;压实责任</strong>\n</p>\n<p style=\"font-size:16px;font-family:&quot;Microsoft YaHei&quot;;background-color:#FFFFFF;\">\n	<strong>&emsp;&emsp;干部个个加油干</strong>\n</p>\n<p style=\"font-size:16px;font-family:&quot;Microsoft YaHei&quot;;background-color:#FFFFFF;\">\n	&emsp;&emsp;大屏幕上播放着暗访纪录片，一个个“煤”镜头、“灰”镜头、“脏”镜头，让正在观看纪录片的13个街道（镇）党政一把手如坐针毡、红脸冒汗……回想起蓝天保卫战讲评会现场的场景，钟智宏印象深刻。\n</p>\n<p style=\"font-size:16px;font-family:&quot;Microsoft YaHei&quot;;background-color:#FFFFFF;\">\n	&emsp;&emsp;钟智宏是雨花区蓝天办常务副主任和区环保局党组书记、局长。3月1日，区委、区政府举行“蓝天保卫战讲评会”，会议在主动“揭疤”的暗访纪录片中拉开序幕。暗访片中的画面直指13个街道（镇）存在的环保问题，曝光现场达30多处。\n</p>\n<p style=\"font-size:16px;font-family:&quot;Microsoft YaHei&quot;;background-color:#FFFFFF;\">\n	&emsp;&emsp;主动揭疤、自查自纠、紧盯目标抓清零，是雨花区打赢蓝天保卫战的有力武器。\n</p>\n<p style=\"font-size:16px;font-family:&quot;Microsoft YaHei&quot;;background-color:#FFFFFF;\">\n	&emsp;&emsp;雨花区建立起高效执行机制、强力督查机制、严厉考核问责机制，将大气环境治理情况纳入街道、部门的年度绩效考核，按照长沙“10个严禁”的要求，科学制定控车、控尘、控排、控烧、控煤、控油6个方面的数十项措施，紧盯“三个月治标”的15项任务，建立任务清单、问题清单，明确责任人和倒逼治理时限，突发事件当晚交办，24小时办结，解决一项销号一项。同时，配套强力督查机制进行4个层面的督查，即区领导不定期督查，两办重点督查，人大、政协参与督查，志愿者随时督查。\n</p>\n<p style=\"font-size:16px;font-family:&quot;Microsoft YaHei&quot;;background-color:#FFFFFF;\">\n	&emsp;&emsp;此外，雨花区还出台了问责办法。对在蓝天保卫战中不履职或履职不力者，按情节轻重给予不同问责，单位受到问责的，对接全区绩效考核体系，视情节予以扣分，被问责者直接影响评优评先和职务晋升。\n</p>\n<p style=\"font-size:16px;font-family:&quot;Microsoft YaHei&quot;;background-color:#FFFFFF;\">\n	<strong>&emsp;&emsp;科技助力</strong>\n</p>\n<p style=\"font-size:16px;font-family:&quot;Microsoft YaHei&quot;;background-color:#FFFFFF;\">\n	<strong>&emsp;&emsp;盲区处处变亮区</strong>\n</p>\n<p style=\"font-size:16px;font-family:&quot;Microsoft YaHei&quot;;background-color:#FFFFFF;\">\n	&emsp;&emsp;接单审核、迅速派单、督查实效……雨花区环保数字网格化处置调度中心内，工作人员十分忙碌。“平时环保问题处理需要经过纸质报表、处理回复函等繁琐过程，如今网格员发现环保问题，用手机上的‘网格通’APP采集现场定位、现场照片，一键实时上传到调度中心，中心‘接单’审核后，立即‘派单’到街道处理。一般环保问题最快一天内办结。”钟智宏告诉记者，这种网络化新模式，是雨花区基于蓝天保卫战的现实需要，在长沙市率先探索的环保数字网格化管理。\n</p>\n<p style=\"font-size:16px;font-family:&quot;Microsoft YaHei&quot;;background-color:#FFFFFF;\">\n	&emsp;&emsp;去年10月份，依托城市管理网格框架，雨花区将全区划分为1个园区网格、37个部门网格、13个街镇网格、169个社区（村）网格。1200余名网格员每天分班动态巡查网格内环保问题。同时，雨花区将环保问题划分为环境隐患、工地扬尘、噪声污染、入河排污口不正常、突发事件等48个处置事项，对应工业园区、街道（镇）、社区（村）以及环保、城管、建设、农林水等监管责任主体，通过纵向到底、横向到边、全面覆盖的环保网格体系，实现对环保问题的“一网打尽”。环保网格体系确立后，城管、建设、环卫、交警、交通、公安和农林水等部门都行动起来，领走了各自的环保任务，污染防治责任越来越具体明细，既解决了责任来了“踢皮球”的问题，也解决了效率问题，“大环保”格局逐渐形成。\n</p>\n<p style=\"font-size:16px;font-family:&quot;Microsoft YaHei&quot;;background-color:#FFFFFF;\">\n	&emsp;&emsp;人防形成合力，科技及时助力。雨花区积极引“智”，强化治污防污技术保障，提升科学治霾水平：召开蓝天保卫战“科技战”会议；请来高科技公司绘制污染“热力图”；聘请湖南师大专家量身设定大气污染防治举措；为26个建筑工地安装扬尘在线监测仪……5月2日，雨花区在全省率先启用3D可视型激光雷达探测城市大气污染，激光雷达一开启，5公里垂直范围内的大气污染状况尽收眼底。雨花区区长刘素月介绍，3D可视型激光雷达的应用，可从源头防控，实时分析PM10、PM2.5的浓度分布，同时通过可调焦摄像装置实时拍照记录，可以更准确地监测定点工业烟尘的排放、城市上空环境污染物的扩散、捕获污染源位置。\n</p>\n<p style=\"font-size:16px;font-family:&quot;Microsoft YaHei&quot;;background-color:#FFFFFF;\">\n	<strong>&emsp;&emsp;全民“参战”</strong>\n</p>\n<p style=\"font-size:16px;font-family:&quot;Microsoft YaHei&quot;;background-color:#FFFFFF;\">\n	<strong>&emsp;&emsp;群众时时听号令</strong>\n</p>\n<p style=\"font-size:16px;font-family:&quot;Microsoft YaHei&quot;;background-color:#FFFFFF;\">\n	&emsp;&emsp;日前，一场特殊的考试在雨花区树木岭小学举行，全校1308名小学生和家长参加了以蓝天保卫战为基本知识点的网络答题及笔试。“打赢蓝天保卫战，每个家庭能做的事情太多了！”走出考场的家长和孩子们感慨。\n</p>\n<p style=\"font-size:16px;font-family:&quot;Microsoft YaHei&quot;;background-color:#FFFFFF;\">\n	&emsp;&emsp;作为高层楼宇多、老旧小区多、流动人口多、管理难度大的长沙中心城区，雨花区提出“全民行动”，引导居民积极投身到线索采集、监督治理、环保宣传等工作中。\n</p>\n<p style=\"font-size:16px;font-family:&quot;Microsoft YaHei&quot;;background-color:#FFFFFF;\">\n	&emsp;&emsp;爱管环保闲事的“雨花群众”来了！“白天冷冷清清，晚上灯火通明，这不正常！”在洞井街道桃花社区筹委会三溪桥组一处偏僻的角落，10间简陋板房引起居民邹培和彭建钢的警觉。经过连续5天的通宵蹲点，他们终于摸到了对方的行动轨迹：零时前后，一辆辆小三轮车、农用车驶入这里，从停在板房内空坪的大卡车上分装散煤运往销售点。两人迅速把线索和证据上报，雨花区各部门立即行动，一处占地1300平方米、藏匿城乡接合部的燃煤销售点被一举取缔。\n</p>\n<p style=\"font-size:16px;font-family:&quot;Microsoft YaHei&quot;;background-color:#FFFFFF;\">\n	&emsp;&emsp;“雨花群众”中有银发先锋。圭塘街道大塘社区长冶小区内，焚烧垃圾事件时有发生。由离退休党员组建的“红袖章”义务巡防队成立后，成了这里的“灭火员”和蓝天保卫战政策宣传员与环境知识解说员。\n</p>\n<p style=\"font-size:16px;font-family:&quot;Microsoft YaHei&quot;;background-color:#FFFFFF;\">\n	&emsp;&emsp;“雨花群众”当然少不了社会组织！开办“环保课堂”向居民传播低碳生活理念、通过形式鲜活的游戏引导孩子争当“绿伞小卫士”……\n</p>\n<p style=\"font-size:16px;font-family:&quot;Microsoft YaHei&quot;;background-color:#FFFFFF;\">\n	&emsp;&emsp;“雨花群众”更少不了企业商户！蓝天保卫战打响后，刘春妹主动成为高桥大市场第一个从经营烟花鞭炮转行的商户。摘下挂了12年的鞭炮商行招牌转行经营酒水，刘春妹信心满满，“十几年的经验还在，不担心生意不火”。（经济日报·中国经济网 记者 刘麟 中国县域经济报记者 谢瑶）\n</p>', '2018-06-22 22:08:02', '2018-06-25 21:28:08');
INSERT INTO `tb_item_desc` VALUES (153261481199591, '<p>\n	12312312312\n</p>\n<p>\n	dasdas das das\n</p>\n<p>\n	<br />\n</p>\n<p>\n	asdasdasd\n</p>', '2018-07-26 22:20:12', '2018-07-26 22:20:12');

-- ----------------------------
-- Table structure for tb_item_param
-- ----------------------------
DROP TABLE IF EXISTS `tb_item_param`;
CREATE TABLE `tb_item_param`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `item_cat_id` bigint(20) NULL DEFAULT NULL COMMENT '商品类目ID',
  `param_data` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '参数数据 格式为json格式',
  `created` datetime(0) NULL DEFAULT NULL,
  `updated` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `item_cat_id`(`item_cat_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品规则参数' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_item_param
-- ----------------------------
INSERT INTO `tb_item_param` VALUES (1, 3, '[{\"group\":\"组名1\",\"params\":[\"组员1\",\"组员2\"]},{\"group\":\"组名2\",\"params\":[\"组员1\",\"组员2\"]},{\"group\":\"组名3\",\"params\":[\"组员1\",\"组员2\",\"组员3\",\"组员4\"]}]', '2015-04-03 10:21:22', '2015-04-03 10:21:22');
INSERT INTO `tb_item_param` VALUES (2, 560, '[{\"group\":\"主体\",\"params\":[\"品牌\",\"型号\",\"颜色\",\"上市年份\"]},{\"group\":\"网络\",\"params\":[\"4G网络制式\",\"3G网络制式\",\"2G网络制式\"]},{\"group\":\"存储\",\"params\":[\"机身内存\",\"储存卡类型\"]}]', '2015-04-03 10:40:12', '2015-04-03 10:40:12');
INSERT INTO `tb_item_param` VALUES (3, 298, '[{\"group\":\"g1\",\"params\":[\"aa\",\"bb\",\"cc\"]},{\"group\":\"g2\",\"params\":[\"ad\",\"sd\"]},{\"group\":\"g3\",\"params\":[\"sdd\",\"sdfs\",\"dfg\"]}]', '2015-06-05 11:59:45', '2015-06-05 11:59:45');
INSERT INTO `tb_item_param` VALUES (21, 440, '[{\"group\":\"1\",\"params\":[\"2w\"]},{\"group\":\"2\",\"params\":[\"1\"]},{\"group\":\"3\",\"params\":[\"1\"]},{\"group\":\"4\",\"params\":[\"1\"]}]', '2015-06-05 12:04:41', '2015-06-05 12:04:41');
INSERT INTO `tb_item_param` VALUES (22, 298, '[{\"group\":\"f1\",\"params\":[\"1\"]},{\"group\":\"f2\",\"params\":[\"2\"]}]', '2015-06-05 12:08:07', '2015-06-05 12:08:07');
INSERT INTO `tb_item_param` VALUES (23, 257, '[{\"group\":\"12\",\"params\":[\"12\"]}]', '2015-06-05 12:10:45', '2015-06-05 12:10:45');
INSERT INTO `tb_item_param` VALUES (24, 443, '[{\"group\":\"股氯气\",\"params\":[\"撒旦法\"]}]', '2015-06-05 12:11:16', '2015-06-05 12:11:16');
INSERT INTO `tb_item_param` VALUES (25, 298, '[{\"group\":\"1\",\"params\":[\"1\"]}]', '2015-06-05 12:21:01', '2015-06-05 12:21:01');
INSERT INTO `tb_item_param` VALUES (26, 582, '[{\"group\":\"分组1\",\"params\":[\"参数1\",\"参数2\",\"参数3\",\"参数4\",\"参数5\"]},{\"group\":\"分组2\",\"params\":[\"参数21\",\"参数22\",\"参数23\",\"参数24\"]}]', '2015-07-23 16:44:32', '2015-07-23 16:44:32');

-- ----------------------------
-- Table structure for tb_item_param_item
-- ----------------------------
DROP TABLE IF EXISTS `tb_item_param_item`;
CREATE TABLE `tb_item_param_item`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `item_id` bigint(20) NULL DEFAULT NULL COMMENT '商品ID',
  `param_data` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '参数数据 格式为json格式',
  `created` datetime(0) NULL DEFAULT NULL,
  `updated` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `item_id`(`item_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品规格和商品的关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_item_param_item
-- ----------------------------
INSERT INTO `tb_item_param_item` VALUES (1, 48, '[{\"group\":\"主体\",\"params\":[{\"k\":\"品牌\",\"v\":\"苹果（Apple）\"},{\"k\":\"型号\",\"v\":\"iPhone 6 A1586\"},{\"k\":\"颜色\",\"v\":\"金色\"},{\"k\":\"上市年份\",\"v\":\"2014\"}]},{\"group\":\"网络\",\"params\":[{\"k\":\"4G网络制式\",\"v\":\"移动4G(TD-LTE)/联通4G(FDD-LTE)/电信4G(FDD-LTE)\"},{\"k\":\"3G网络制式\",\"v\":\"移动3G(TD-SCDMA)/联通3G(WCDMA)/电信3G（CDMA2000）\"},{\"k\":\"2G网络制式\",\"v\":\"移动2G/联通2G(GSM)/电信2G(CDMA)\"}]},{\"group\":\"存储\",\"params\":[{\"k\":\"机身内存\",\"v\":\"16GB ROM\"},{\"k\":\"储存卡类型\",\"v\":\"不支持\"}]}]', '2015-04-03 10:52:55', '2015-04-03 10:52:55');
INSERT INTO `tb_item_param_item` VALUES (2, 1188043, '[{\"group\":\"主体\",\"params\":[{\"k\":\"品牌\",\"v\":\"锤子\"},{\"k\":\"型号\",\"v\":\"T1(SM705)\"},{\"k\":\"颜色\",\"v\":\"黑色\"},{\"k\":\"上市年份\",\"v\":\"2014年\"}]},{\"group\":\"网络\",\"params\":[{\"k\":\"4G网络制式\",\"v\":\"移动4G（TD-LTE）/联通4G（FDD-LTE）\"},{\"k\":\"3G网络制式\",\"v\":\"移动3G(TD-SCDMA)/联通3G(WCDMA)\"},{\"k\":\"2G网络制式\",\"v\":\"移动2G/联通2G(GSM)\"}]},{\"group\":\"存储\",\"params\":[{\"k\":\"机身内存\",\"v\":\"32GB ROM\"},{\"k\":\"储存卡类型\",\"v\":\"2GB RAM\"}]}]', '2015-04-06 11:24:10', '2015-04-06 11:24:10');
INSERT INTO `tb_item_param_item` VALUES (3, 1433500495290, '[{\"group\":\"主体\",\"params\":[{\"k\":\"品牌\",\"v\":\"1\"},{\"k\":\"型号\",\"v\":\"2\"},{\"k\":\"颜色\",\"v\":\"3\"},{\"k\":\"上市年份\",\"v\":\"4\"}]},{\"group\":\"网络\",\"params\":[{\"k\":\"4G网络制式\",\"v\":\"a\"},{\"k\":\"3G网络制式\",\"v\":\"b\"},{\"k\":\"2G网络制式\",\"v\":\"c\"}]},{\"group\":\"存储\",\"params\":[{\"k\":\"机身内存\",\"v\":\"de\"},{\"k\":\"储存卡类型\",\"v\":\"ef\"}]}]', '2015-06-05 18:34:52', '2015-06-05 18:34:52');
INSERT INTO `tb_item_param_item` VALUES (4, 1001434271015869, '[{\"group\":\"主体\",\"params\":[{\"k\":\"品牌\",\"v\":\"华为（HUAWEI）\"},{\"k\":\"型号\",\"v\":\"P8\"},{\"k\":\"颜色\",\"v\":\"皓月银\"},{\"k\":\"上市年份\",\"v\":\"2015年\"}]},{\"group\":\"网络\",\"params\":[{\"k\":\"4G网络制式\",\"v\":\"移动4G(TDD-LTE)/联通4G(TDD-LTE/FDD-LTE)\"},{\"k\":\"3G网络制式\",\"v\":\"移动3G(TD-SCDMA)/联通3G(WCDMA)\"},{\"k\":\"2G网络制式\",\"v\":\"移动2G/联通2G(GSM)\"}]},{\"group\":\"存储\",\"params\":[{\"k\":\"机身内存\",\"v\":\"16GB ROM\"},{\"k\":\"储存卡类型\",\"v\":\"MicroSD(TF)\"}]}]', '2015-06-14 16:36:55', '2015-06-14 16:36:55');
INSERT INTO `tb_item_param_item` VALUES (5, 101434521126763, '[{\"group\":\"组名1\",\"params\":[{\"k\":\"组员1\",\"v\":\"a\"},{\"k\":\"组员2\",\"v\":\"a\"}]},{\"group\":\"组名2\",\"params\":[{\"k\":\"组员1\",\"v\":\"sd\"},{\"k\":\"组员2\",\"v\":\"ss\"}]},{\"group\":\"组名3\",\"params\":[{\"k\":\"组员1\",\"v\":\"sd\"},{\"k\":\"组员2\",\"v\":\"sd\"},{\"k\":\"组员3\",\"v\":\"sd\"},{\"k\":\"组员4\",\"v\":\"sda\"}]}]', '2015-06-17 14:05:26', '2015-06-17 14:05:26');
INSERT INTO `tb_item_param_item` VALUES (8, 143771131488369, '[{\"group\":\"主体\",\"params\":[{\"k\":\"品牌\",\"v\":\"1\"},{\"k\":\"型号\",\"v\":\"1\"},{\"k\":\"颜色\",\"v\":\"2\"},{\"k\":\"上市年份\",\"v\":\"3\"}]},{\"group\":\"网络\",\"params\":[{\"k\":\"4G网络制式\",\"v\":\"1\"},{\"k\":\"3G网络制式\",\"v\":\"2\"},{\"k\":\"2G网络制式\",\"v\":\"3\"}]},{\"group\":\"存储\",\"params\":[{\"k\":\"机身内存\",\"v\":\"4\"},{\"k\":\"储存卡类型\",\"v\":\"2\"}]}]', '2015-07-24 12:15:14', '2015-07-24 12:15:14');

-- ----------------------------
-- Table structure for tb_log
-- ----------------------------
DROP TABLE IF EXISTS `tb_log`;
CREATE TABLE `tb_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` int(11) NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `request_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `request_param` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ip_info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `time` int(11) NULL DEFAULT NULL,
  `create_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tb_member
-- ----------------------------
DROP TABLE IF EXISTS `tb_member`;
CREATE TABLE `tb_member`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码，加密存储',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '注册手机号',
  `sex` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `education` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学历',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '注册邮箱',
  `state` int(1) NULL DEFAULT 0,
  `file` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `channel` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '从哪个渠道得知菲乐',
  `recommand` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '推荐人',
  `balance` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '余额',
  `tags` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '标签',
  `created` datetime(0) NOT NULL,
  `updated` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE,
  UNIQUE INDEX `phone`(`phone`) USING BTREE,
  UNIQUE INDEX `email`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 66 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_member
-- ----------------------------
INSERT INTO `tb_member` VALUES (62, 'test', '098f6bcd4621d373cade4e832627b4f6', '133000000', '男', NULL, NULL, 1, 'http://ow2h3ee9w.bkt.clouddn.com/1507866636672.png', NULL, NULL, NULL, NULL, '2017-09-05 21:27:54', '2017-10-08 18:13:51');
INSERT INTO `tb_member` VALUES (63, 'admin', '21232f297a57a5a743894a0e4a801fc3', '1855555555', '男', NULL, NULL, 2, 'http://ow2h3ee9w.bkt.clouddn.com/1507875078112.png', NULL, NULL, NULL, NULL, '2017-09-05 21:27:54', '2018-04-18 14:43:32');
INSERT INTO `tb_member` VALUES (64, 'xhy', '21232f297a57a5a743894a0e4a801fc3', '13913331333', '男', NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, '2017-09-05 21:27:54', '2018-04-18 14:43:33');
INSERT INTO `tb_member` VALUES (65, 'xhy1', '267f32a4f71f5c243c06178f6207ddf4', '13100010001', '男', NULL, NULL, 1, '', NULL, NULL, NULL, NULL, '2017-09-05 21:27:54', '2018-06-15 15:29:36');

-- ----------------------------
-- Table structure for tb_member_fllow
-- ----------------------------
DROP TABLE IF EXISTS `tb_member_fllow`;
CREATE TABLE `tb_member_fllow`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `m_id` int(11) NOT NULL,
  `cc_id` int(11) NOT NULL,
  `fllow_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
  `fllow_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `fllow_time` datetime(0) NULL DEFAULT NULL,
  `area` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_member_fllow
-- ----------------------------
INSERT INTO `tb_member_fllow` VALUES (1, 62, 1, '123', '跟进', '2018-07-26 23:45:05', NULL, '2018-07-26 23:44:59', '2018-07-26 23:45:02');
INSERT INTO `tb_member_fllow` VALUES (2, 62, 2, '23123', '123', '2018-07-26 23:45:05', NULL, '2018-07-26 23:45:05', '2018-07-26 23:45:05');

-- ----------------------------
-- Table structure for tb_member_question
-- ----------------------------
DROP TABLE IF EXISTS `tb_member_question`;
CREATE TABLE `tb_member_question`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `m_id` int(11) NOT NULL,
  `age` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `create_stamp` datetime(0) NULL DEFAULT NULL,
  `update_stamp` datetime(0) NULL DEFAULT NULL,
  `target_class` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '意向课程',
  `profession` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '职业',
  `expect` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '课程需求',
  `competitor` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '有没有了解竞争对手',
  `m_class` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '客户分类',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tb_news
-- ----------------------------
DROP TABLE IF EXISTS `tb_news`;
CREATE TABLE `tb_news`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `pic` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
  `cid` int(11) NULL DEFAULT NULL,
  `author_id` bigint(22) NULL DEFAULT NULL,
  `create_stamp` datetime(0) NULL DEFAULT NULL,
  `update_stamp` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_news
-- ----------------------------
INSERT INTO `tb_news` VALUES (1, '上海活动掠影', NULL, 3, 2, '2018-06-26 00:41:45', '2018-06-26 00:41:45');
INSERT INTO `tb_news` VALUES (6, '上海活动掠影', NULL, 4, 2, '2018-06-26 01:01:55', '2018-06-26 01:01:55');
INSERT INTO `tb_news` VALUES (7, '1231231231', NULL, 3, 1, '2018-06-26 01:03:45', '2018-06-26 01:03:45');
INSERT INTO `tb_news` VALUES (8, '上海活动掠影', NULL, 2, 2, '2018-06-26 01:07:54', '2018-06-26 01:07:54');
INSERT INTO `tb_news` VALUES (9, '上海活动掠影', NULL, 2, 1, '2018-06-26 01:10:12', '2018-06-26 01:10:12');
INSERT INTO `tb_news` VALUES (10, '123', NULL, 4, 2, '2018-06-26 01:12:44', '2018-06-26 01:12:44');
INSERT INTO `tb_news` VALUES (11, '钢琴教学一对一', '', 3, 2, '2018-06-26 01:17:20', '2018-06-26 01:17:20');

-- ----------------------------
-- Table structure for tb_news_cat
-- ----------------------------
DROP TABLE IF EXISTS `tb_news_cat`;
CREATE TABLE `tb_news_cat`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `create_stamp` datetime(0) NULL DEFAULT NULL,
  `update_stamp` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_news_cat
-- ----------------------------
INSERT INTO `tb_news_cat` VALUES (1, '菲乐宣传片', '2018-06-26 00:23:27', '2018-06-26 00:23:31');
INSERT INTO `tb_news_cat` VALUES (2, '资讯', '2018-06-26 00:22:59', '2018-06-26 00:23:04');
INSERT INTO `tb_news_cat` VALUES (3, '课程体验', '2018-06-26 00:23:38', '2018-06-26 00:23:35');
INSERT INTO `tb_news_cat` VALUES (4, '活动掠影', '2018-06-26 00:23:40', '2018-06-26 00:23:43');

-- ----------------------------
-- Table structure for tb_news_desc
-- ----------------------------
DROP TABLE IF EXISTS `tb_news_desc`;
CREATE TABLE `tb_news_desc`  (
  `news_id` int(11) NOT NULL,
  `news_desc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
  `create_stamp` datetime(0) NULL DEFAULT NULL,
  `update_stamp` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`news_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_news_desc
-- ----------------------------
INSERT INTO `tb_news_desc` VALUES (1, '', '2018-06-26 00:41:51', '2018-06-26 00:41:51');
INSERT INTO `tb_news_desc` VALUES (6, '', '2018-06-26 01:02:07', '2018-06-26 01:02:07');
INSERT INTO `tb_news_desc` VALUES (7, '', '2018-06-26 01:05:52', '2018-06-26 01:05:52');
INSERT INTO `tb_news_desc` VALUES (8, '', '2018-06-26 01:09:53', '2018-06-26 01:09:53');
INSERT INTO `tb_news_desc` VALUES (9, '', '2018-06-26 01:10:20', '2018-06-26 01:10:20');
INSERT INTO `tb_news_desc` VALUES (10, '', '2018-06-26 01:12:44', '2018-06-26 01:12:44');
INSERT INTO `tb_news_desc` VALUES (11, '<p style=\"color:#222222;font-family:Simsun;font-size:16px;background-color:#FFFFFF;\">\n	【大纪元2018年06月25日讯】（大纪元记者吴英编译报导）据一份最新的<a href=\"http://www.epochtimes.com/gb/tag/%E6%B0%91%E8%B0%83.html\">民调</a>显示，过半数的美国人认同总统<a href=\"http://www.epochtimes.com/gb/tag/%E5%B7%9D%E6%99%AE.html\">川普</a>（<a href=\"http://www.epochtimes.com/gb/tag/%E7%89%B9%E6%9C%97%E6%99%AE.html\">特朗普</a>）的经济政策，川普的总体支持度也上升了2个百分点达到41%，创下他上任以来的最佳纪录。\n</p>\n<p style=\"color:#222222;font-family:Simsun;font-size:16px;background-color:#FFFFFF;\">\n	CNBC全美经济调查（CNBC All-America Economic Survey）公布其今年第二季度最新<a href=\"http://www.epochtimes.com/gb/tag/%E6%B0%91%E8%B0%83.html\">民调</a>结果，51%的受访者赞同总统<a href=\"http://www.epochtimes.com/gb/tag/%E5%B7%9D%E6%99%AE.html\">川普</a>的经济政策，比今年第一季度所做的调查上升了6%，不认同的比例则下降6个百分点到36%。\n</p>\n<p style=\"color:#222222;font-family:Simsun;font-size:16px;background-color:#FFFFFF;\">\n	这是川普2017年1月上任以来，民调首次出现过半数美国人支持川普的经济政策，而且比奥巴马总统首次上任后同期所获的满意度高出1个百分点。\n</p>\n<p style=\"color:#222222;font-family:Simsun;font-size:16px;background-color:#FFFFFF;\">\n	54%的受访者认为经济很好或非常好，创下CNBC这份民调十年来的最佳纪录，43%的民众认为经济普通或不好，缔造了本分民调有史以来的最低纪录。\n</p>\n<p style=\"color:#222222;font-family:Simsun;font-size:16px;background-color:#FFFFFF;\">\n	这次民调受访者对经济持正面看法的比例，比2016年总统大选时上升了20个百分点，也是首次超越对经济持负面看法的受访者。4%的美国人看好明年房价上涨，是2007年以来的最高比例。\n</p>\n<p style=\"color:#222222;font-family:Simsun;font-size:16px;background-color:#FFFFFF;\">\n	另外，川普的总体支持度上升2个百分点至41%，不赞成的比例下降10个百分点至47%，创下川普任内的最低纪录。\n</p>\n<p style=\"color:#222222;font-family:Simsun;font-size:16px;background-color:#FFFFFF;\">\n	本分民调是在6月16日至19日对全国800名成年人的调查，误差范围为正负3.5个百分点。\n</p>\n<p style=\"color:#222222;font-family:Simsun;font-size:16px;background-color:#FFFFFF;\">\n	特别的是，这次民调结果显示，在受访的民主党人中大约三成支持川普的经济政策，这对民主党来说是个警讯。\n</p>\n<p style=\"color:#222222;font-family:Simsun;font-size:16px;background-color:#FFFFFF;\">\n	总统川普在减税及贸易政策方面获得最大的满意度，至于移民、废除奥巴马健保及减少对银行监管等政策，则得到最差的支持度。此外，58%的受访者支持川普与朝鲜的谈判；45%认同川普加征关税，只有38%反对。\n</p>\n<p style=\"color:#222222;font-family:Simsun;font-size:16px;background-color:#FFFFFF;\">\n	亚特兰大联邦储备银行6月8日发表预测报告，全美2018年第二季度经济增长率为4.6%，将是四年来表现最强劲的一季。高盛集团（Goldman Sachs）6月15日表示，第二季度GDP增长率预测值由3.9%上调到4%。\n</p>\n<p style=\"color:#222222;font-family:Simsun;font-size:16px;background-color:#FFFFFF;\">\n	美国5月份新增就业22.3万个，远远超过经济学家预测的18.8万个；失业率同样跌破专家的眼镜，从4月份的3.9%再降到3.8%，创下18年来新低点；时薪增加了8美分，达到26.92美元，同比增长2.7%。#\n</p>\n<p style=\"color:#222222;font-family:Simsun;font-size:16px;background-color:#FFFFFF;\">\n	责任编辑：林妍\n</p>', '2018-06-26 01:17:20', '2018-06-26 01:17:20');

-- ----------------------------
-- Table structure for tb_order
-- ----------------------------
DROP TABLE IF EXISTS `tb_order`;
CREATE TABLE `tb_order`  (
  `order_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '订单id',
  `payment` decimal(10, 2) NULL DEFAULT NULL COMMENT '实付金额',
  `payment_type` int(1) NULL DEFAULT NULL COMMENT '支付类型 1在线支付 2货到付款',
  `post_fee` decimal(10, 2) NULL DEFAULT NULL COMMENT '邮费',
  `status` int(1) NULL DEFAULT NULL COMMENT '状态 0未付款 1已付款 2未发货 3已发货 4交易成功 5交易关闭 6交易失败',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '订单创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '订单更新时间',
  `payment_time` datetime(0) NULL DEFAULT NULL COMMENT '付款时间',
  `consign_time` datetime(0) NULL DEFAULT NULL COMMENT '发货时间',
  `end_time` datetime(0) NULL DEFAULT NULL COMMENT '交易完成时间',
  `close_time` datetime(0) NULL DEFAULT NULL COMMENT '交易关闭时间',
  `shipping_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '物流名称',
  `shipping_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '物流单号',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户id',
  `buyer_message` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '买家留言',
  `buyer_nick` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '买家昵称',
  `buyer_comment` tinyint(1) NULL DEFAULT NULL COMMENT '买家是否已经评价',
  PRIMARY KEY (`order_id`) USING BTREE,
  INDEX `create_time`(`create_time`) USING BTREE,
  INDEX `buyer_nick`(`buyer_nick`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `payment_type`(`payment_type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_order
-- ----------------------------
INSERT INTO `tb_order` VALUES ('150787555927616', 1.00, NULL, NULL, 5, '2017-10-13 14:19:19', '2017-10-13 14:19:19', NULL, NULL, NULL, '2017-10-13 14:19:35', NULL, NULL, 63, NULL, 'admin', NULL);
INSERT INTO `tb_order` VALUES ('152189811089285', 49.00, NULL, NULL, 1, '2018-03-24 21:28:30', '2018-03-24 21:32:28', '2018-03-24 21:32:28', NULL, NULL, NULL, NULL, NULL, 62, NULL, 'test', NULL);
INSERT INTO `tb_order` VALUES ('152190022212320', 1.00, NULL, NULL, 6, '2018-03-24 22:03:42', '2018-03-24 22:21:02', '2018-03-24 22:03:49', NULL, NULL, '2018-03-24 22:21:02', NULL, NULL, 62, NULL, 'test', NULL);
INSERT INTO `tb_order` VALUES ('152212603026105', 1.00, NULL, NULL, 4, '2018-03-27 12:47:10', '2018-03-27 12:48:23', '2018-03-27 12:47:22', NULL, '2018-03-27 12:48:23', NULL, NULL, NULL, 62, NULL, 'test', NULL);

-- ----------------------------
-- Table structure for tb_order_item
-- ----------------------------
DROP TABLE IF EXISTS `tb_order_item`;
CREATE TABLE `tb_order_item`  (
  `id` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `item_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '商品id',
  `order_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '订单id',
  `num` int(10) NULL DEFAULT NULL COMMENT '商品购买数量',
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '商品标题',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品单价',
  `total_fee` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品总金额',
  `pic_path` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '商品图片地址',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `item_id`(`item_id`) USING BTREE,
  INDEX `order_id`(`order_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_order_item
-- ----------------------------
INSERT INTO `tb_order_item` VALUES ('150787555927880', '150642571432835', '150787555927616', 1, '捐赠商品', 1.00, 1.00, 'http://ow2h3ee9w.bkt.clouddn.com/FgwHSk1Rnd-8FKqNJhFSSdcq2QVB');
INSERT INTO `tb_order_item` VALUES ('152189811096002', '635906', '152189811089285', 1, 'Smartisan M1 软胶保护套', 49.00, 49.00, 'http://image.smartisanos.cn/resource/1410440c8a690ec361e6e77de59939c6.png');
INSERT INTO `tb_order_item` VALUES ('152190022215406', '150635087972564', '152190022212320', 1, '支付测试商品 IPhone X 全面屏 全面绽放', 1.00, 1.00, 'http://ow2h3ee9w.bkt.clouddn.com/FuMpJKl7eTLaSAZCY0wS_ZfA9nZu');
INSERT INTO `tb_order_item` VALUES ('152212603031720', '150635087972564', '152212603026105', 1, '支付测试商品 IPhone X 全面屏 全面绽放', 1.00, 1.00, 'http://ow2h3ee9w.bkt.clouddn.com/FuMpJKl7eTLaSAZCY0wS_ZfA9nZu');

-- ----------------------------
-- Table structure for tb_order_shipping
-- ----------------------------
DROP TABLE IF EXISTS `tb_order_shipping`;
CREATE TABLE `tb_order_shipping`  (
  `order_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单ID',
  `receiver_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人全名',
  `receiver_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话',
  `receiver_mobile` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '移动电话',
  `receiver_state` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省份',
  `receiver_city` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市',
  `receiver_district` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区/县',
  `receiver_address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货地址，如：xx路xx号',
  `receiver_zip` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮政编码,如：310001',
  `created` datetime(0) NULL DEFAULT NULL,
  `updated` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_order_shipping
-- ----------------------------
INSERT INTO `tb_order_shipping` VALUES ('150787555927616', '4', '4', NULL, NULL, NULL, NULL, '4', NULL, '2017-10-13 14:19:19', '2017-10-13 14:19:19');
INSERT INTO `tb_order_shipping` VALUES ('152189811089285', '1', '1', NULL, NULL, NULL, NULL, '1', NULL, '2018-03-24 21:28:30', '2018-03-24 21:28:30');
INSERT INTO `tb_order_shipping` VALUES ('152190022212320', '1', '1', NULL, NULL, NULL, NULL, '1', NULL, '2018-03-24 22:03:42', '2018-03-24 22:03:42');
INSERT INTO `tb_order_shipping` VALUES ('152212603026105', '1', '1', NULL, NULL, NULL, NULL, '1', NULL, '2018-03-27 12:47:10', '2018-03-27 12:47:10');

-- ----------------------------
-- Table structure for tb_panel
-- ----------------------------
DROP TABLE IF EXISTS `tb_panel`;
CREATE TABLE `tb_panel`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '类目ID',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '板块名称',
  `type` int(1) NULL DEFAULT NULL COMMENT '类型 0轮播图 1板块种类一 2板块种类二 3板块种类三 ',
  `sort_order` int(4) NULL DEFAULT NULL COMMENT '排列序号',
  `position` int(1) NULL DEFAULT NULL COMMENT '所属位置 0首页 1商品推荐 2我要捐赠',
  `limit_num` int(4) NULL DEFAULT NULL COMMENT '板块限制商品数量',
  `status` int(1) NULL DEFAULT 1 COMMENT '状态',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `created` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `parent_id`(`status`) USING BTREE,
  INDEX `sort_order`(`sort_order`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '内容分类' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_panel
-- ----------------------------
INSERT INTO `tb_panel` VALUES (1, '热门商品', 2, 2, 0, 3, 1, '', '2018-04-18 23:49:13', '2018-04-15 19:05:16');
INSERT INTO `tb_panel` VALUES (2, '官方精选', 3, 3, 0, 8, 1, '', NULL, '2018-04-19 11:20:59');
INSERT INTO `tb_panel` VALUES (3, '品牌精选', 3, 5, 0, 7, 1, '', '2018-04-18 23:49:19', '2018-04-17 18:54:15');
INSERT INTO `tb_panel` VALUES (4, '我要捐赠', 2, 3, 2, 2, 1, '', '2017-09-23 15:20:31', '2017-11-06 13:17:04');
INSERT INTO `tb_panel` VALUES (6, '为您推荐', 2, 6, 1, 2, 1, '', '2017-11-06 13:17:41', '2017-11-06 13:17:41');
INSERT INTO `tb_panel` VALUES (7, '轮播图', 0, 0, 0, 5, 1, '', '2018-04-15 12:33:07', '2018-04-15 12:33:07');
INSERT INTO `tb_panel` VALUES (8, '活动版块', 1, 1, 0, 4, 1, '', '2018-04-15 19:05:00', '2018-04-15 19:05:00');
INSERT INTO `tb_panel` VALUES (9, '活动版块2', 1, 7, 0, 4, 1, '', NULL, '2018-04-19 11:57:47');
INSERT INTO `tb_panel` VALUES (10, '品牌周边', 3, 4, 0, 7, 1, NULL, '2018-04-18 23:50:32', '2018-04-18 23:50:35');

-- ----------------------------
-- Table structure for tb_panel_content
-- ----------------------------
DROP TABLE IF EXISTS `tb_panel_content`;
CREATE TABLE `tb_panel_content`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `panel_id` int(11) NOT NULL COMMENT '所属板块id',
  `type` int(1) NULL DEFAULT NULL COMMENT '类型 0关联商品 1其他链接',
  `product_id` bigint(20) NULL DEFAULT NULL COMMENT '关联商品id',
  `sort_order` int(4) NULL DEFAULT NULL,
  `full_url` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '其他链接',
  `pic_url` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pic_url2` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '3d轮播图备用',
  `pic_url3` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '3d轮播图备用',
  `created` datetime(0) NULL DEFAULT NULL,
  `updated` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `category_id`(`panel_id`) USING BTREE,
  INDEX `updated`(`updated`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_panel_content
-- ----------------------------
INSERT INTO `tb_panel_content` VALUES (2, 3, 0, 150642571432851, 1, '', 'https://resource.smartisan.com/resource/7ac3af5a92ad791c2b38bfe1e38ee334.jpg', NULL, NULL, '2017-09-23 00:03:02', '2018-04-20 00:23:40');
INSERT INTO `tb_panel_content` VALUES (7, 3, 0, 816448, 2, '', 'https://resource.smartisan.com/resource/41cb562a47d4831e199ed7e2057f3b61.jpg', NULL, NULL, '2017-09-23 22:58:11', '2018-04-20 00:14:29');
INSERT INTO `tb_panel_content` VALUES (8, 2, 0, 150642571432837, 1, '', 'https://resource.smartisan.com/resource/3a7522290397a9444d7355298248f197.jpg', NULL, NULL, '2017-09-25 17:03:48', '2018-04-19 23:23:26');
INSERT INTO `tb_panel_content` VALUES (9, 2, 0, 150642571432838, 2, '', 'https://resource.smartisan.com/resource/63ea40e5c64db1c6b1d480c48fe01272.jpg', NULL, NULL, '2017-09-25 17:04:35', '2018-04-20 10:48:17');
INSERT INTO `tb_panel_content` VALUES (14, 2, 0, 150642571432839, 3, '', 'https://resource.smartisan.com/resource/5e4b1feddb13639550849f12f6b2e202.jpg', NULL, NULL, '2017-10-22 22:14:01', '2018-04-20 10:48:29');
INSERT INTO `tb_panel_content` VALUES (15, 2, 0, 150642571432840, 4, '', 'https://resource.smartisan.com/resource/10525c4b21f039fc8ccb42cd1586f5cd.jpg', NULL, NULL, '2017-10-22 22:14:52', '2018-04-20 10:48:43');
INSERT INTO `tb_panel_content` VALUES (16, 2, 0, 150642571432841, 5, '', 'https://resource.smartisan.com/resource/b899d9b82c4bc2710492a26af021d484.jpg', NULL, NULL, '2017-10-22 22:15:51', '2018-04-20 10:49:02');
INSERT INTO `tb_panel_content` VALUES (17, 2, 0, 150642571432842, 6, '', 'https://resource.smartisan.com/resource/abb6986430536cd9365352b434f3c568.jpg', NULL, NULL, '2017-10-22 22:17:01', '2018-04-20 10:49:17');
INSERT INTO `tb_panel_content` VALUES (18, 3, 0, 847276, 3, NULL, 'https://resource.smartisan.com/resource/99c548bfc9848a8c95f4e4f7f2bc1095.png', NULL, NULL, '2017-10-22 22:22:52', '2017-10-22 22:22:52');
INSERT INTO `tb_panel_content` VALUES (19, 3, 0, 150642571432844, 4, '', 'https://resource.smartisan.com/resource/71432ad30288fb860a4389881069b874.png', NULL, NULL, '2017-10-22 22:23:35', '2018-04-20 11:25:38');
INSERT INTO `tb_panel_content` VALUES (20, 3, 0, 847276, 5, '', 'https://resource.smartisan.com/resource/804b82e4c05516e822667a23ee311f7c.jpg', NULL, NULL, '2017-10-22 22:24:54', '2018-04-20 00:15:03');
INSERT INTO `tb_panel_content` VALUES (21, 3, 0, 150642571432852, 6, '', 'https://resource.smartisan.com/resource/367d93db1d58f9f3505bc0ec18efaa44.jpg', NULL, NULL, '2017-10-22 22:25:28', '2018-04-20 00:24:11');
INSERT INTO `tb_panel_content` VALUES (22, 1, 0, 150635087972564, 1, NULL, 'http://ow2h3ee9w.bkt.clouddn.com/FjvP4gBFeYGQoEtEX7dL3kbwJTDW', NULL, NULL, '2017-10-22 22:26:31', '2017-10-22 22:26:31');
INSERT INTO `tb_panel_content` VALUES (25, 8, 0, 150642571432835, 1, 'https://www.smartisan.com/jianguo3-accessories', 'https://resource.smartisan.com/resource/6/610400xinpinpeijian.jpg', NULL, NULL, '2018-04-15 19:07:43', '2018-04-19 23:20:34');
INSERT INTO `tb_panel_content` VALUES (26, 8, 0, 150635087972564, 2, 'https://www.smartisan.com/service/#/tradein', 'https://resource.smartisan.com/resource/6/610400yijiuhuanxin.jpg', NULL, NULL, '2018-04-15 19:08:00', '2018-04-19 23:20:48');
INSERT INTO `tb_panel_content` VALUES (27, 8, 0, 150642571432835, 3, 'https://www.smartisan.com/category?id=69', 'https://resource.smartisan.com/resource/4/489673079577637073.png', NULL, NULL, '2018-04-15 19:08:24', '2018-04-19 23:21:01');
INSERT INTO `tb_panel_content` VALUES (28, 8, 0, 150635087972564, 4, 'https://www.smartisan.com/', 'https://resource.smartisan.com/resource/fe6ab43348a43152b4001b4454d206ac.jpg', NULL, NULL, '2018-04-15 19:08:58', '2018-04-19 23:21:13');
INSERT INTO `tb_panel_content` VALUES (29, 2, 2, 150642571432843, 0, '', 'https://resource.smartisan.com/resource/1/1220858shoujilouceng.jpg', NULL, NULL, '2018-04-15 20:14:35', '2018-04-20 11:41:27');
INSERT INTO `tb_panel_content` VALUES (30, 3, 2, 150642571432850, 0, '', 'https://resource.smartisan.com/resource/a/acillouceng1220856.jpg', NULL, NULL, '2018-04-15 20:15:18', '2018-04-20 11:18:03');
INSERT INTO `tb_panel_content` VALUES (32, 7, 0, 150635087972564, 1, '', 'http://static.smartisanos.cn/index/img/store/home/banner-3d-item-1-box-1_61bdc2f4f9.png', 'http://static.smartisanos.cn/index/img/store/home/banner-3d-item-1-box-3_8fa7866d59.png', 'http://ow2h3ee9w.bkt.clouddn.com/banner-3d-item-1-box-33.png', '2018-04-17 20:41:02', '2018-04-17 20:58:41');
INSERT INTO `tb_panel_content` VALUES (33, 7, 0, 150642571432835, 2, '', 'http://oweupqzdv.bkt.clouddn.com/bg_left.png', 'http://ow2h3ee9w.bkt.clouddn.com/phone_left2.png', 'http://oweupqzdv.bkt.clouddn.com/erji_left.png', '2018-04-17 21:08:22', '2018-04-20 10:47:19');
INSERT INTO `tb_panel_content` VALUES (34, 7, 0, 150635087972564, 3, NULL, 'http://oweupqzdv.bkt.clouddn.com/red-left.png', 'http://oweupqzdv.bkt.clouddn.com/word-left.png', 'http://oweupqzdv.bkt.clouddn.com/time-left.png', '2018-04-17 21:08:30', '2018-04-17 21:08:32');
INSERT INTO `tb_panel_content` VALUES (35, 7, 0, 150642571432843, 4, '', 'http://ow2h3ee9w.bkt.clouddn.com/24401108web1.png', NULL, NULL, '2018-04-18 23:44:48', '2018-04-20 11:41:46');
INSERT INTO `tb_panel_content` VALUES (36, 9, 0, 150635087972564, 1, 'https://www.smartisan.com/pr/#/video/conference-jianguopro2', 'https://resource.smartisan.com/resource/88684d7ed5eee77e34f044fa32a9121b.png', NULL, NULL, '2018-04-18 23:51:45', '2018-04-20 12:03:05');
INSERT INTO `tb_panel_content` VALUES (37, 9, 0, 150642571432835, 2, 'https://www.smartisan.com/os/#/4-x', 'https://resource.smartisan.com/resource/6/610400dibu.jpg', NULL, NULL, '2018-04-18 23:51:51', '2018-04-20 12:03:19');
INSERT INTO `tb_panel_content` VALUES (38, 9, 0, 150635087972564, 3, 'https://www.smartisan.com/pr/#/video/changhuxi-jinghuaqi', 'https://resource.smartisan.com/resource/c245ada282824a4a15e68bec80502ad4.jpg', NULL, NULL, '2018-04-18 23:51:58', '2018-04-20 12:03:31');
INSERT INTO `tb_panel_content` VALUES (39, 9, 0, 150642571432835, 4, 'https://www.smartisan.com/pr/#/video/onestep-introduction', 'https://resource.smartisan.com/resource/m/minibanner_03.jpg', NULL, NULL, '2018-04-18 23:52:02', '2018-04-20 12:03:41');
INSERT INTO `tb_panel_content` VALUES (40, 10, 3, NULL, 0, 'http://xmall.exrick.cn/#/goods?cid=1184', 'https://resource.smartisan.com/resource/z/zhoubianshangpin1220858web.jpg', NULL, NULL, '2018-04-19 00:02:53', '2018-04-20 11:15:59');
INSERT INTO `tb_panel_content` VALUES (41, 10, 0, 150642571432845, 1, '', 'https://resource.smartisan.com/resource/2f9a0f5f3dedf0ed813622003f1b287b.jpg', NULL, NULL, '2018-04-19 00:02:56', '2018-04-20 00:24:36');
INSERT INTO `tb_panel_content` VALUES (42, 10, 0, 150642571432836, 2, '', 'https://resource.smartisan.com/resource/2b05dbca9f5a4d0c1270123f42fb834c.jpg', NULL, NULL, '2018-04-19 00:03:00', '2018-04-20 00:25:01');
INSERT INTO `tb_panel_content` VALUES (43, 10, 0, 150642571432846, 3, '', 'https://resource.smartisan.com/resource/804edf579887b3e1fae4e20a379be5b5.png', NULL, NULL, '2018-04-19 00:03:04', '2018-04-20 00:25:17');
INSERT INTO `tb_panel_content` VALUES (44, 10, 0, 150642571432848, 4, '', 'https://resource.smartisan.com/resource/a1c53b5f12dd7ef790cadec0eaeaf466.jpg', NULL, NULL, '2018-04-19 00:03:10', '2018-04-20 10:55:52');
INSERT INTO `tb_panel_content` VALUES (45, 10, 0, 150642571432847, 5, '', 'https://resource.smartisan.com/resource/daa975651d6d700c0f886718c520ee19.jpg', NULL, NULL, '2018-04-19 00:03:15', '2018-04-20 10:54:56');
INSERT INTO `tb_panel_content` VALUES (46, 10, 0, 150642571432849, 6, '', 'https://resource.smartisan.com/resource/3973d009d182d8023bea6250b9a3959e.jpg', NULL, NULL, '2018-04-19 00:03:20', '2018-04-20 10:55:03');
INSERT INTO `tb_panel_content` VALUES (47, 6, 0, 150635087972564, 1, '', 'http://ow2h3ee9w.bkt.clouddn.com/FjvP4gBFeYGQoEtEX7dL3kbwJTDW', NULL, NULL, '2018-04-19 11:15:35', '2018-04-19 11:15:35');
INSERT INTO `tb_panel_content` VALUES (49, 4, 0, 150635087972564, 1, NULL, 'http://ow2h3ee9w.bkt.clouddn.com/FjvP4gBFeYGQoEtEX7dL3kbwJTDW', NULL, NULL, '2018-04-19 11:20:15', '2018-04-19 11:20:17');
INSERT INTO `tb_panel_content` VALUES (51, 7, 0, 150635087972564, 5, '', 'http://ow2h3ee9w.bkt.clouddn.com/417pcchunrihaolishouji.png', NULL, NULL, '2018-04-19 15:09:40', '2018-04-19 21:16:04');

-- ----------------------------
-- Table structure for tb_permission
-- ----------------------------
DROP TABLE IF EXISTS `tb_permission`;
CREATE TABLE `tb_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `permission` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 68 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_permission
-- ----------------------------
INSERT INTO `tb_permission` VALUES (15, '添加栏目', '/content/cat/add');
INSERT INTO `tb_permission` VALUES (16, '编辑栏目', '/content/cat/update');
INSERT INTO `tb_permission` VALUES (17, '添加栏目内容', '/content/add');
INSERT INTO `tb_permission` VALUES (18, '删除栏目内容', '/content/del/*');
INSERT INTO `tb_permission` VALUES (19, '编辑栏目内容', '/content/update');
INSERT INTO `tb_permission` VALUES (20, 'webupload图片上传', '/image/imageUpload');
INSERT INTO `tb_permission` VALUES (21, 'kindeditor图片上传', '/kindeditor/imageUpload');
INSERT INTO `tb_permission` VALUES (23, '商品分类编辑', '/item/cat/update');
INSERT INTO `tb_permission` VALUES (24, '商品分类添加', '/item/cat/add');
INSERT INTO `tb_permission` VALUES (25, '商品分类删除', '/item/cat/del/*');
INSERT INTO `tb_permission` VALUES (27, '商品添加', '/item/add');
INSERT INTO `tb_permission` VALUES (28, '商品删除', '/item/del/*');
INSERT INTO `tb_permission` VALUES (29, '启用商品', '/item/start/*');
INSERT INTO `tb_permission` VALUES (30, '停用商品', '/item/stop/*');
INSERT INTO `tb_permission` VALUES (31, '编辑商品', '/item/update/*');
INSERT INTO `tb_permission` VALUES (32, '同步索引页面', '/refresh-index');
INSERT INTO `tb_permission` VALUES (33, '会员添加', '/member/add');
INSERT INTO `tb_permission` VALUES (34, '修改会员密码', '/member/changePass/*');
INSERT INTO `tb_permission` VALUES (35, '会员删除', '/member/del/*');
INSERT INTO `tb_permission` VALUES (36, '会员移除', '/member/remove/*');
INSERT INTO `tb_permission` VALUES (37, '会员启用', '/member/start/*');
INSERT INTO `tb_permission` VALUES (38, '会员停用', '/member/stop/*');
INSERT INTO `tb_permission` VALUES (39, '会员编辑', '/member/update/*');
INSERT INTO `tb_permission` VALUES (40, '权限添加', '/user/addPermission');
INSERT INTO `tb_permission` VALUES (41, '角色添加', '/user/addRole');
INSERT INTO `tb_permission` VALUES (42, '用户添加', '/user/addUser');
INSERT INTO `tb_permission` VALUES (43, '修改用户密码', '/user/changePass');
INSERT INTO `tb_permission` VALUES (44, '删除权限', '/user/delPermission/*');
INSERT INTO `tb_permission` VALUES (45, '删除角色', '/user/delRole/*');
INSERT INTO `tb_permission` VALUES (46, '删除用户', '/user/delUser/*');
INSERT INTO `tb_permission` VALUES (47, '用户启用', '/user/start/*');
INSERT INTO `tb_permission` VALUES (48, '用户停用', '/user/stop/*');
INSERT INTO `tb_permission` VALUES (49, '编辑权限', '/user/updatePermission');
INSERT INTO `tb_permission` VALUES (50, '编辑角色', '/user/updateRole');
INSERT INTO `tb_permission` VALUES (51, '编辑用户', '/user/updateUser');
INSERT INTO `tb_permission` VALUES (52, '编辑系统基本配置', '/sys/base/update');
INSERT INTO `tb_permission` VALUES (53, '删除系统日志', '/sys/log/del/*');
INSERT INTO `tb_permission` VALUES (54, '添加shiro配置', '/sys/shiro/add');
INSERT INTO `tb_permission` VALUES (55, '删除shiro配置', '/sys/shiro/del/*');
INSERT INTO `tb_permission` VALUES (56, '编辑shiro配置', '/sys/shiro/update');
INSERT INTO `tb_permission` VALUES (57, '删除订单', '/order/del/*');
INSERT INTO `tb_permission` VALUES (58, '添加捐赠', '/thanks/add');
INSERT INTO `tb_permission` VALUES (59, '删除捐赠', '/thanks/del/*');
INSERT INTO `tb_permission` VALUES (60, '编辑捐赠', '/thanks/update');
INSERT INTO `tb_permission` VALUES (61, '添加板块', '/panel/add');
INSERT INTO `tb_permission` VALUES (62, '删除版块', '/panel/del/*');
INSERT INTO `tb_permission` VALUES (63, '更新板块', '/panel/update');
INSERT INTO `tb_permission` VALUES (64, '更新首页缓存', '/redis/index/update');
INSERT INTO `tb_permission` VALUES (65, '更新推荐板块缓存', '/redis/recommend/update');
INSERT INTO `tb_permission` VALUES (66, '更新捐赠板块缓存', '/redis/thank/update');
INSERT INTO `tb_permission` VALUES (67, '同步索引', '/item/importIndex');

-- ----------------------------
-- Table structure for tb_reserve_comment
-- ----------------------------
DROP TABLE IF EXISTS `tb_reserve_comment`;
CREATE TABLE `tb_reserve_comment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reserve_id` int(11) NOT NULL,
  `comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
  `comment_stars` int(11) NULL DEFAULT NULL,
  `class_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
  `class_question` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
  `work` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
  `create_stamp` datetime(0) NULL DEFAULT NULL,
  `update_stamp` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tb_role
-- ----------------------------
DROP TABLE IF EXISTS `tb_role`;
CREATE TABLE `tb_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_role
-- ----------------------------
INSERT INTO `tb_role` VALUES (1, '超级管理员', '拥有至高无上的权力');
INSERT INTO `tb_role` VALUES (2, '游客', '只是个过客');
INSERT INTO `tb_role` VALUES (3, '老师', '老师');

-- ----------------------------
-- Table structure for tb_role_perm
-- ----------------------------
DROP TABLE IF EXISTS `tb_role_perm`;
CREATE TABLE `tb_role_perm`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NULL DEFAULT NULL,
  `permission_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 188 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_role_perm
-- ----------------------------
INSERT INTO `tb_role_perm` VALUES (137, 1, 15);
INSERT INTO `tb_role_perm` VALUES (138, 1, 16);
INSERT INTO `tb_role_perm` VALUES (139, 1, 17);
INSERT INTO `tb_role_perm` VALUES (140, 1, 18);
INSERT INTO `tb_role_perm` VALUES (141, 1, 19);
INSERT INTO `tb_role_perm` VALUES (142, 1, 20);
INSERT INTO `tb_role_perm` VALUES (143, 1, 21);
INSERT INTO `tb_role_perm` VALUES (144, 1, 23);
INSERT INTO `tb_role_perm` VALUES (145, 1, 24);
INSERT INTO `tb_role_perm` VALUES (146, 1, 25);
INSERT INTO `tb_role_perm` VALUES (147, 1, 27);
INSERT INTO `tb_role_perm` VALUES (148, 1, 28);
INSERT INTO `tb_role_perm` VALUES (149, 1, 29);
INSERT INTO `tb_role_perm` VALUES (150, 1, 30);
INSERT INTO `tb_role_perm` VALUES (151, 1, 31);
INSERT INTO `tb_role_perm` VALUES (152, 1, 32);
INSERT INTO `tb_role_perm` VALUES (153, 1, 33);
INSERT INTO `tb_role_perm` VALUES (154, 1, 34);
INSERT INTO `tb_role_perm` VALUES (155, 1, 35);
INSERT INTO `tb_role_perm` VALUES (156, 1, 36);
INSERT INTO `tb_role_perm` VALUES (157, 1, 37);
INSERT INTO `tb_role_perm` VALUES (158, 1, 38);
INSERT INTO `tb_role_perm` VALUES (159, 1, 39);
INSERT INTO `tb_role_perm` VALUES (160, 1, 40);
INSERT INTO `tb_role_perm` VALUES (161, 1, 41);
INSERT INTO `tb_role_perm` VALUES (162, 1, 42);
INSERT INTO `tb_role_perm` VALUES (163, 1, 43);
INSERT INTO `tb_role_perm` VALUES (164, 1, 44);
INSERT INTO `tb_role_perm` VALUES (165, 1, 45);
INSERT INTO `tb_role_perm` VALUES (166, 1, 46);
INSERT INTO `tb_role_perm` VALUES (167, 1, 47);
INSERT INTO `tb_role_perm` VALUES (168, 1, 48);
INSERT INTO `tb_role_perm` VALUES (169, 1, 49);
INSERT INTO `tb_role_perm` VALUES (170, 1, 50);
INSERT INTO `tb_role_perm` VALUES (171, 1, 51);
INSERT INTO `tb_role_perm` VALUES (172, 1, 52);
INSERT INTO `tb_role_perm` VALUES (173, 1, 53);
INSERT INTO `tb_role_perm` VALUES (174, 1, 54);
INSERT INTO `tb_role_perm` VALUES (175, 1, 55);
INSERT INTO `tb_role_perm` VALUES (176, 1, 56);
INSERT INTO `tb_role_perm` VALUES (177, 1, 57);
INSERT INTO `tb_role_perm` VALUES (178, 1, 58);
INSERT INTO `tb_role_perm` VALUES (179, 1, 59);
INSERT INTO `tb_role_perm` VALUES (180, 1, 60);
INSERT INTO `tb_role_perm` VALUES (181, 1, 61);
INSERT INTO `tb_role_perm` VALUES (182, 1, 62);
INSERT INTO `tb_role_perm` VALUES (183, 1, 63);
INSERT INTO `tb_role_perm` VALUES (184, 1, 64);
INSERT INTO `tb_role_perm` VALUES (185, 1, 65);
INSERT INTO `tb_role_perm` VALUES (186, 1, 66);
INSERT INTO `tb_role_perm` VALUES (187, 1, 67);

-- ----------------------------
-- Table structure for tb_shiro_filter
-- ----------------------------
DROP TABLE IF EXISTS `tb_shiro_filter`;
CREATE TABLE `tb_shiro_filter`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `perms` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sort_order` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 76 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_shiro_filter
-- ----------------------------
INSERT INTO `tb_shiro_filter` VALUES (1, '/login', 'anon', 1);
INSERT INTO `tb_shiro_filter` VALUES (2, '/403', 'anon', 2);
INSERT INTO `tb_shiro_filter` VALUES (3, '/', 'authc', 3);
INSERT INTO `tb_shiro_filter` VALUES (7, '/index', 'authc', 4);
INSERT INTO `tb_shiro_filter` VALUES (8, '/welcome', 'authc', 5);
INSERT INTO `tb_shiro_filter` VALUES (9, '/thanks-pic', 'authc', 6);
INSERT INTO `tb_shiro_filter` VALUES (10, '/lock-screen', 'authc', 7);
INSERT INTO `tb_shiro_filter` VALUES (11, '/user/logout', 'authc', 8);
INSERT INTO `tb_shiro_filter` VALUES (12, '/user/userInfo', 'authc', 9);
INSERT INTO `tb_shiro_filter` VALUES (17, '/content/cat/add', 'perms[/content/cat/add]', 10);
INSERT INTO `tb_shiro_filter` VALUES (18, '/content/cat/del/*', 'perms[/content/cat/del/*]', 11);
INSERT INTO `tb_shiro_filter` VALUES (19, '/content/cat/update', 'perms[/content/cat/update]', 12);
INSERT INTO `tb_shiro_filter` VALUES (21, '/content/add', 'perms[/content/add]', 13);
INSERT INTO `tb_shiro_filter` VALUES (22, '/content/del/*', 'perms[/content/del/*]', 14);
INSERT INTO `tb_shiro_filter` VALUES (23, '/content/update', 'perms[/content/update]', 15);
INSERT INTO `tb_shiro_filter` VALUES (24, '/image/imageUpload', 'perms[/image/imageUpload]', 16);
INSERT INTO `tb_shiro_filter` VALUES (25, '/image/update', 'perms[/image/update]', 18);
INSERT INTO `tb_shiro_filter` VALUES (26, '/kindeditor/imageUpload', 'perms[/kindeditor/imageUpload]', 17);
INSERT INTO `tb_shiro_filter` VALUES (27, '/item/cat/add', 'perms[/item/cat/add]', 19);
INSERT INTO `tb_shiro_filter` VALUES (28, '/item/cat/del/*', 'perms[/item/cat/del/*]', 20);
INSERT INTO `tb_shiro_filter` VALUES (29, '/item/cat/update', 'perms[/item/cat/update]', 21);
INSERT INTO `tb_shiro_filter` VALUES (30, '/item/add', 'perms[/item/add]', 22);
INSERT INTO `tb_shiro_filter` VALUES (31, '/item/del/*', 'perms[/item/del/*]', 23);
INSERT INTO `tb_shiro_filter` VALUES (32, '/item/start/*', 'perms[/item/start/*]', 24);
INSERT INTO `tb_shiro_filter` VALUES (33, '/item/stop/*', 'perms[/item/stop/*]', 25);
INSERT INTO `tb_shiro_filter` VALUES (34, '/item/update/*', 'perms[/item/update/*]', 26);
INSERT INTO `tb_shiro_filter` VALUES (36, '/member/add', 'perms[/member/add]', 28);
INSERT INTO `tb_shiro_filter` VALUES (37, '/member/changePass/*', 'perms[/member/changePass/*]', 29);
INSERT INTO `tb_shiro_filter` VALUES (38, '/member/del/*', 'perms[/member/del/*]', 30);
INSERT INTO `tb_shiro_filter` VALUES (39, '/member/remove/*', 'perms[/member/remove/*]', 31);
INSERT INTO `tb_shiro_filter` VALUES (40, '/member/start/*', 'perms[/member/start/*]', 32);
INSERT INTO `tb_shiro_filter` VALUES (41, '/member/stop/*', 'perms[/member/stop/*]', 33);
INSERT INTO `tb_shiro_filter` VALUES (42, '/member/update/*', 'perms[/member/update/*]', 34);
INSERT INTO `tb_shiro_filter` VALUES (43, '/user/addPermission', 'perms[/user/addPermission]', 35);
INSERT INTO `tb_shiro_filter` VALUES (44, '/user/addRole', 'perms[/user/addRole]', 36);
INSERT INTO `tb_shiro_filter` VALUES (45, '/user/addUser', 'perms[/user/addUser]', 37);
INSERT INTO `tb_shiro_filter` VALUES (46, '/user/changePass', 'perms[/user/changePass]', 38);
INSERT INTO `tb_shiro_filter` VALUES (47, '/user/delPermission/*', 'perms[/user/delPermission/*]', 39);
INSERT INTO `tb_shiro_filter` VALUES (48, '/user/delRole/*', 'perms[/user/delRole/*]', 40);
INSERT INTO `tb_shiro_filter` VALUES (49, '/user/delUser/*', 'perms[/user/delUser/*]', 41);
INSERT INTO `tb_shiro_filter` VALUES (50, '/user/start/*', 'perms[/user/start/*]', 42);
INSERT INTO `tb_shiro_filter` VALUES (51, '/user/stop/*', 'perms[/user/stop/*]', 43);
INSERT INTO `tb_shiro_filter` VALUES (52, '/user/updatePermission', 'perms[/user/updatePermission]', 44);
INSERT INTO `tb_shiro_filter` VALUES (53, '/user/updateRole', 'perms[/user/updateRole]', 45);
INSERT INTO `tb_shiro_filter` VALUES (54, '/user/updateUser', 'perms[/user/updateUser]', 46);
INSERT INTO `tb_shiro_filter` VALUES (55, '/sys/base/update', 'perms[/sys/base/update]', 47);
INSERT INTO `tb_shiro_filter` VALUES (56, '/sys/log/del/*', 'perms[/sys/log/del/*]', 48);
INSERT INTO `tb_shiro_filter` VALUES (57, '/sys/shiro/add', 'perms[/sys/shiro/add]', 49);
INSERT INTO `tb_shiro_filter` VALUES (58, '/sys/shiro/del/*', 'perms[/sys/shiro/del/*]', 50);
INSERT INTO `tb_shiro_filter` VALUES (59, '/sys/shiro/update', 'perms[/sys/shiro/update]', 51);
INSERT INTO `tb_shiro_filter` VALUES (60, '/order/del/*', 'perms[/order/del/*]', 52);
INSERT INTO `tb_shiro_filter` VALUES (61, '/thanks/add', 'perms[/thanks/add]', 53);
INSERT INTO `tb_shiro_filter` VALUES (62, '/thanks/del/*', 'perms[/thanks/del/*]', 54);
INSERT INTO `tb_shiro_filter` VALUES (63, '/thanks/update', 'perms[/thanks/update]', 55);
INSERT INTO `tb_shiro_filter` VALUES (66, '/*', 'authc', 9);
INSERT INTO `tb_shiro_filter` VALUES (67, '/geetestInit', 'anon', 3);
INSERT INTO `tb_shiro_filter` VALUES (68, '/pay-edit', 'anon', 3);
INSERT INTO `tb_shiro_filter` VALUES (69, '/panel/add', 'perms[/panel/add]', 56);
INSERT INTO `tb_shiro_filter` VALUES (70, '/panel/del/*', 'perms[/panel/del/*]', 57);
INSERT INTO `tb_shiro_filter` VALUES (71, '/panel/update', 'perms[/panel/update]', 58);
INSERT INTO `tb_shiro_filter` VALUES (72, '/redis/index/update', 'perms[/redis/index/update]', 59);
INSERT INTO `tb_shiro_filter` VALUES (73, '/redis/recommend/update', 'perms[/redis/recommend/update]', 60);
INSERT INTO `tb_shiro_filter` VALUES (74, '/redis/thank/update', 'perms[/redis/thank/update]', 61);
INSERT INTO `tb_shiro_filter` VALUES (75, '/item/importIndex', 'perms[/item/importIndex]', 62);

-- ----------------------------
-- Table structure for tb_thanks
-- ----------------------------
DROP TABLE IF EXISTS `tb_thanks`;
CREATE TABLE `tb_thanks`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nick_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `money` decimal(10, 2) NULL DEFAULT NULL,
  `info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '通知邮箱',
  `state` int(11) NULL DEFAULT 0 COMMENT '状态 0待审核 1确认显示  2驳回 3通过不展示',
  `pay_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付方式',
  `order_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联订单id',
  `date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_thanks
-- ----------------------------
INSERT INTO `tb_thanks` VALUES (6, '小黄鱼', '18782059038@163.com', 1.00, '无', NULL, NULL, NULL, NULL, '2018-03-30 19:03:07');

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码 md5加密存储',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '注册手机号',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '注册邮箱',
  `sex` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `state` int(11) NULL DEFAULT 0,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `role_id` int(11) NULL DEFAULT 0,
  `file` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `created` datetime(0) NOT NULL,
  `updated` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE,
  UNIQUE INDEX `phone`(`phone`) USING BTREE,
  UNIQUE INDEX `email`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES (1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', '17621230884', '1012139570@qq.com', '男', NULL, 1, '超级管理员', 1, 'http://ow2h3ee9w.bkt.clouddn.com/1507866340369.png', '2017-09-05 21:27:54', '2017-10-18 22:57:08');
INSERT INTO `tb_user` VALUES (2, '测试账号', '098f6bcd4621d373cade4e832627b4f6', '12345678901', '123@qq.com', '女', NULL, 1, '游客', 0, NULL, '2017-09-05 21:27:54', '2018-04-18 14:35:19');

SET FOREIGN_KEY_CHECKS = 1;
