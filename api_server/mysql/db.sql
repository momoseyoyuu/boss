/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80019
 Source Host           : localhost:3306
 Source Schema         : db

 Target Server Type    : MySQL
 Target Server Version : 80019
 File Encoding         : 65001

 Date: 04/06/2020 10:45:29
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gridcells
-- ----------------------------
DROP TABLE IF EXISTS `gridcells`;
CREATE TABLE `gridcells` (
  `gridcellid` int NOT NULL,
  `gridcellname` varchar(100) DEFAULT NULL,
  `gridcellcode` varchar(100) DEFAULT NULL,
  `customermanagername` varchar(100) DEFAULT NULL,
  `customermanagerZGJN` varchar(100) DEFAULT NULL,
  `customermanagerSPJN` varchar(100) DEFAULT NULL,
  `installermanagername` varchar(100) DEFAULT NULL,
  `installermanagerZGJN` varchar(100) DEFAULT NULL,
  `installermanagerSPJN` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`gridcellid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gridcells
-- ----------------------------
BEGIN;
INSERT INTO `gridcells` VALUES (1, '茶山网格单元', '769035000396758', '王海塘', '13966976', '13966976', '罗淑芳', '21198046', '21198033');
INSERT INTO `gridcells` VALUES (2, '常平网格单元', '769035000396740', '', '', '', '', '', '');
INSERT INTO `gridcells` VALUES (3, '长安网格单元', '769035000396752', '', '', '', '', '', '');
INSERT INTO `gridcells` VALUES (4, '大朗网格单元', '769035000396754', '罗淑芳', '21198046', '21198033', '郭长流', '36000070', '36000070');
INSERT INTO `gridcells` VALUES (5, '大岭山网格单元', '769035000396742', '', '', '', '', '', '');
INSERT INTO `gridcells` VALUES (6, '道滘网格单元', '769035000396751', '', '', '', '', '', '');
INSERT INTO `gridcells` VALUES (7, '东城网格单元', '769035000396763', '王海塘', '13966976', '13966976', '王海塘', '13966976', '13966976');
INSERT INTO `gridcells` VALUES (8, '东坑网格单元', '769035000396760', '', '', '', '', '', '');
INSERT INTO `gridcells` VALUES (9, '凤岗网格单元', '769035000396767', '', '', '', '', '', '');
INSERT INTO `gridcells` VALUES (10, '高埗网格单元', '769035000396772', '', '', '', '', '', '');
INSERT INTO `gridcells` VALUES (11, '横沥网格单元', '769035000396744', '', '', '', '', '', '');
INSERT INTO `gridcells` VALUES (12, '洪梅网格单元', '769035000396746', '', '', '', '', '', '');
INSERT INTO `gridcells` VALUES (13, '厚街网格单元', '769035000396753', '', '', '', '', '', '');
INSERT INTO `gridcells` VALUES (14, '虎门网格单元', '769035000396745', '', '', '', '', '', '');
INSERT INTO `gridcells` VALUES (15, '黄江网格单元', '769035000396759', '', '', '', '', '', '');
INSERT INTO `gridcells` VALUES (16, '麻涌网格单元', '769035000396756', '雷咸力', '45055756', '45055756', '刘悦鹏', '45092460', '45092460');
INSERT INTO `gridcells` VALUES (17, '南城网格单元', '769035000396761', '', '', '', '', '', '');
INSERT INTO `gridcells` VALUES (18, '企石网格单元', '769035000396739', '', '', '', '', '', '');
INSERT INTO `gridcells` VALUES (19, '桥头网格单元', '769035000396770', '', '', '', '', '', '');
INSERT INTO `gridcells` VALUES (20, '清溪网格单元', '769035000396747', '', '', '', '', '', '');
INSERT INTO `gridcells` VALUES (21, '沙田网格单元', '769035000396765', '', '', '', '', '', '');
INSERT INTO `gridcells` VALUES (22, '石龙网格单元', '769035000396738', '', '', '', '', '', '');
INSERT INTO `gridcells` VALUES (23, '石排网格单元', '769035000396769', '', '', '', '', '', '');
INSERT INTO `gridcells` VALUES (24, '石碣网格单元', '769035000396768', '', '', '', '', '', '');
INSERT INTO `gridcells` VALUES (25, '松山湖网格单元', '769035000396755', '', '', '', '', '', '');
INSERT INTO `gridcells` VALUES (26, '塘厦网格单元', '769035000396736', '', '', '', '', '', '');
INSERT INTO `gridcells` VALUES (27, '万江网格单元', '769035000396757', '', '', '', '', '', '');
INSERT INTO `gridcells` VALUES (28, '望牛墩网格单元', '769035000396766', '', '', '', '', '', '');
INSERT INTO `gridcells` VALUES (29, '谢岗网格单元', '769035000396743', '', '', '', '', '', '');
INSERT INTO `gridcells` VALUES (30, '樟木头网格单元', '769035000396764', '', '', '', '', '', '');
INSERT INTO `gridcells` VALUES (31, '中堂网格单元', '769035000396762', '', '', '', '', '', '');
INSERT INTO `gridcells` VALUES (32, '莞城网格单元', '769035000396741', '', '', '', '', '', '');
INSERT INTO `gridcells` VALUES (33, '寮步网格单元', '769035000396771', '', '', '', '', '', '');
INSERT INTO `gridcells` VALUES (34, '东城网格单元2', '769035000396763', '周焕棠', '44040006', '44040006', '赖颖煜', '34003233', '34003233');
INSERT INTO `gridcells` VALUES (35, '东城网格单元3', '769035000396763', '', '', '', '', '', '');
INSERT INTO `gridcells` VALUES (36, '东城网格单元4', '769035000396763', '', '', '', '', '', '');
INSERT INTO `gridcells` VALUES (37, '东城网格单元5', '769035000396763', '', '', '', '', '', '');
INSERT INTO `gridcells` VALUES (38, '东城网格单元6', '769035000396763', '', '', '', '', '', '');
INSERT INTO `gridcells` VALUES (39, '东城网格单元7', '769035000396763', '', '', '', '', '', '');
INSERT INTO `gridcells` VALUES (40, '东城网格单元8', '769035000396763', '', '', '', '', '', '');
INSERT INTO `gridcells` VALUES (41, '东城网格单元9', '769035000396763', '', '', '', '', '', '');
INSERT INTO `gridcells` VALUES (42, '东城网格单元10', '769035000396763', '', '', '', '', '', '');
INSERT INTO `gridcells` VALUES (43, '东城网格单元11', '769035000396763', '', '', '', '', '', '');
INSERT INTO `gridcells` VALUES (44, '东城网格单元12', '769035000396763', '', '', '', '', '', '');
INSERT INTO `gridcells` VALUES (45, '东城网格单元13', '769035000396763', '', '', '', '', '', '');
INSERT INTO `gridcells` VALUES (46, '东城网格单元14', '769035000396763', '', '', '', '', '', '');
INSERT INTO `gridcells` VALUES (47, '东城网格单元15', '769035000396763', '', '', '', '', '', '');
INSERT INTO `gridcells` VALUES (48, '东城网格单元16', '769035000396763', '', '', '', '', '', '');
INSERT INTO `gridcells` VALUES (49, '东城网格单元17', '769035000396763', '', '', '', '', '', '');
INSERT INTO `gridcells` VALUES (50, '东城网格单元18', '769035000396763', '', '', '', '', '', '');
INSERT INTO `gridcells` VALUES (51, '东城网格单元19', '769035000396763', '', '', '', '', '', '');
INSERT INTO `gridcells` VALUES (52, '东城网格单元20', '769035000396763', '刘金福', '45031076', '45031076', '罗淑芳', '21198046', '21198033');
INSERT INTO `gridcells` VALUES (53, '东城网格单元21', '769035000396763', '', '', '', '', '', '');
INSERT INTO `gridcells` VALUES (54, '东城网格单元22', '769035000396763', '', '', '', '', '', '');
INSERT INTO `gridcells` VALUES (55, '东城网格单元23', '769035000396763', '', '', '', '', '', '');
INSERT INTO `gridcells` VALUES (56, '东城网格单元24', '769035000396763', '', '', '', '', '', '');
INSERT INTO `gridcells` VALUES (57, '东城网格单元25', '769035000396763', '', '', '', '', '', '');
INSERT INTO `gridcells` VALUES (58, '东城网格单元26', '769035000396763', '', '', '', '', '', '');
INSERT INTO `gridcells` VALUES (59, '东城网格单元27', '769035000396763', '', '', '', '', '', '');
INSERT INTO `gridcells` VALUES (60, '东城网格单元28', '769035000396763', '', '', '', '', '', '');
INSERT INTO `gridcells` VALUES (61, '东城网格单元29', '769035000396763', '', '', '', '', '', '');
INSERT INTO `gridcells` VALUES (62, '东城网格单元30', '769035000396763', '', '', '', '', '', '');
COMMIT;

-- ----------------------------
-- Table structure for manager
-- ----------------------------
DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager` (
  `id` int NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `zgjobnumber` varchar(100) DEFAULT NULL,
  `spjobnumber` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of manager
-- ----------------------------
BEGIN;
INSERT INTO `manager` VALUES (1, '赖颖煜', '34003400', '34003401');
INSERT INTO `manager` VALUES (2, '赖颖煜', '34003233', '34003200');
INSERT INTO `manager` VALUES (3, '罗淑芳', '21198046', '21198033');
INSERT INTO `manager` VALUES (4, '王海塘', '13966976', '13966976');
INSERT INTO `manager` VALUES (5, '郭长流', '36000070', '36000070');
INSERT INTO `manager` VALUES (6, '雷咸力', '45055756', '45055756');
INSERT INTO `manager` VALUES (7, '周焕棠', '44040006', '44040006');
INSERT INTO `manager` VALUES (8, '尹满元', '15157862', '15157862');
INSERT INTO `manager` VALUES (9, '吴袂青', '51186080', '51186080');
INSERT INTO `manager` VALUES (10, '吴利琴', '51189986', '51189986');
INSERT INTO `manager` VALUES (11, '林耿锋', '11030016', '11030016');
INSERT INTO `manager` VALUES (12, '郑昌基', '51129068', '51129068');
INSERT INTO `manager` VALUES (13, '张贵平', '51126393', '51126393');
INSERT INTO `manager` VALUES (14, '庞毅', '51126395', '51126395');
INSERT INTO `manager` VALUES (15, '张凯', '51131360', '51131360');
INSERT INTO `manager` VALUES (16, '廖让源', '51126749', '51126749');
INSERT INTO `manager` VALUES (17, '许少丹', '13020246', '13020246');
INSERT INTO `manager` VALUES (18, '汪红燕', '51175186', '51175186');
INSERT INTO `manager` VALUES (19, '毛盛森', '51178776', '51178776');
INSERT INTO `manager` VALUES (20, '卢海涛', '51172619', '51172619');
INSERT INTO `manager` VALUES (21, '王立洪', '51126054', '51126054');
INSERT INTO `manager` VALUES (22, '董三发', '51172634', '51172634');
INSERT INTO `manager` VALUES (23, '尹胜文', '51179316', '51179316');
INSERT INTO `manager` VALUES (24, '樊栋翔', '21021618', '21021618');
INSERT INTO `manager` VALUES (25, '冯玉霞', '91021604', '91021604');
INSERT INTO `manager` VALUES (26, '曾晓龙', '51120761', '51120761');
INSERT INTO `manager` VALUES (27, '谢玉雪', '51170206', '51170206');
INSERT INTO `manager` VALUES (28, '蔡有林', '51121586', '51121586');
INSERT INTO `manager` VALUES (29, '陈炳鹏', '13626365', '13626365');
INSERT INTO `manager` VALUES (30, '唐敬德', '45067385', '45067385');
INSERT INTO `manager` VALUES (31, '陈子鑫', '13626306', '13626306');
INSERT INTO `manager` VALUES (32, '梁美连', '13260372', '13260372');
INSERT INTO `manager` VALUES (33, '陈玮彬', '21158146', '21158146');
INSERT INTO `manager` VALUES (34, '王继', '13562457', '13562457');
INSERT INTO `manager` VALUES (35, '邓明光', '44039638', '44039638');
INSERT INTO `manager` VALUES (36, '罗喜虔', '51126095', '51126095');
INSERT INTO `manager` VALUES (37, '何绮文', '44106416', '44106416');
INSERT INTO `manager` VALUES (38, '彭叶', '51172216', '51172216');
INSERT INTO `manager` VALUES (39, '刘金福', '45031076', '45031076');
INSERT INTO `manager` VALUES (40, '方火红', '45039836', '45039836');
INSERT INTO `manager` VALUES (41, '陈金满', '45030649', '45030649');
INSERT INTO `manager` VALUES (42, '樊俊良', '45036122', '45036122');
INSERT INTO `manager` VALUES (43, '朱伟立', '21098604', '21098604');
INSERT INTO `manager` VALUES (44, '陈力彬', '51175526', '51175526');
INSERT INTO `manager` VALUES (45, '余斌宏', '45099671', '45099671');
INSERT INTO `manager` VALUES (46, '叶植豪', '45096631', '45096631');
INSERT INTO `manager` VALUES (47, '刘悦鹏', '45092460', '45092460');
INSERT INTO `manager` VALUES (48, '郑瑩瑩', '21042564', '21042564');
INSERT INTO `manager` VALUES (49, '林淑仪', '21046433', '21046433');
INSERT INTO `manager` VALUES (50, '彭耀阳', '51126211', '51126211');
COMMIT;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int NOT NULL COMMENT 'ID',
  `username` varchar(20) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL,
  `town` varchar(100) DEFAULT NULL,
  `townid` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
INSERT INTO `users` VALUES (1, 'admin', 'admin123456!', '东莞', '1');
INSERT INTO `users` VALUES (2, '茶山', '329861', '茶山', '769035000396758');
INSERT INTO `users` VALUES (3, '常平', '669173', '常平', '769035000396740');
INSERT INTO `users` VALUES (4, '长安', '361663', '长安', '769035000396752');
INSERT INTO `users` VALUES (5, '大朗', '124682', '大朗', '769035000396754');
INSERT INTO `users` VALUES (6, '大岭山', '339759', '大岭山', '769035000396742');
INSERT INTO `users` VALUES (7, '道滘', '143683', '道滘', '769035000396751');
INSERT INTO `users` VALUES (8, '东城', '974588', '东城', '769035000396763');
INSERT INTO `users` VALUES (9, '东坑', '528655', '东坑', '769035000396760');
INSERT INTO `users` VALUES (10, '凤岗', '410189', '凤岗', '769035000396767');
INSERT INTO `users` VALUES (11, '高埗', '581282', '高埗', '769035000396772');
INSERT INTO `users` VALUES (12, '横沥', '660188', '横沥', '769035000396744');
INSERT INTO `users` VALUES (13, '洪梅', '889669', '洪梅', '769035000396746');
INSERT INTO `users` VALUES (14, '厚街', '323234', '厚街', '769035000396753');
INSERT INTO `users` VALUES (15, '虎门', '986034', '虎门', '769035000396745');
INSERT INTO `users` VALUES (16, '黄江', '243959', '黄江', '769035000396759');
INSERT INTO `users` VALUES (17, '麻涌', '197185', '麻涌', '769035000396756');
INSERT INTO `users` VALUES (18, '南城', '670575', '南城', '769035000396761');
INSERT INTO `users` VALUES (19, '企石', '952149', '企石', '769035000396739');
INSERT INTO `users` VALUES (20, '桥头', '768231', '桥头', '769035000396770');
INSERT INTO `users` VALUES (21, '清溪', '228473', '清溪', '769035000396747');
INSERT INTO `users` VALUES (22, '沙田', '126609', '沙田', '769035000396765');
INSERT INTO `users` VALUES (23, '石龙', '494252', '石龙', '769035000396738');
INSERT INTO `users` VALUES (24, '石排', '672510', '石排', '769035000396769');
INSERT INTO `users` VALUES (25, '石碣', '685275', '石碣', '769035000396768');
INSERT INTO `users` VALUES (26, '松山湖', '628846', '松山湖', '769035000396755');
INSERT INTO `users` VALUES (27, '塘厦', '194858', '塘厦', '769035000396736');
INSERT INTO `users` VALUES (28, '万江', '847911', '万江', '769035000396757');
INSERT INTO `users` VALUES (29, '望牛墩', '306828', '望牛墩', '769035000396766');
INSERT INTO `users` VALUES (30, '谢岗', '122085', '谢岗', '769035000396743');
INSERT INTO `users` VALUES (31, '樟木头', '192651', '樟木头', '769035000396764');
INSERT INTO `users` VALUES (32, '中堂', '319503', '中堂', '769035000396762');
INSERT INTO `users` VALUES (33, '莞城', '275187', '莞城', '769035000396741');
INSERT INTO `users` VALUES (34, '寮步', '704379', '寮步', '769035000396771');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
