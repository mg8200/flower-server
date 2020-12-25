/*
 Navicat Premium Data Transfer

 Source Server         : aliyun
 Source Server Type    : MySQL
 Source Server Version : 50649
 Source Host           : 101.132.151.184:3306
 Source Schema         : flowersbaking

 Target Server Type    : MySQL
 Target Server Version : 50649
 File Encoding         : 65001

 Date: 21/12/2020 12:45:09
*/

-- ----------------------------
-- Create database
-- ----------------------------
drop database if exists flowersbaking;
create database flowersbaking;
use flowersbaking;

-- ----------------------------
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address`  (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人电话',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `isDefault` tinyint(1) NOT NULL DEFAULT 0,
  `province` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `city` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `county` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `addressDetail` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES (9, 9, '湖北省黄冈市英山县温泉镇', '15347056241', '明钢', 1, '湖北省', '武汉市', '武昌区', '雄楚大道领秀城');
INSERT INTO `address` VALUES (10, 9, '湖北省武汉市武昌区五环天地', '16655110488', '明钢', 0, '湖北省', '武汉市', '武昌区', '五环天地');
INSERT INTO `address` VALUES (11, 9, '湖北省武汉市武昌区雄楚大道', '15347056241', '明钢', 0, '湖北省', '武汉市', '汉阳区', '王家湾');
INSERT INTO `address` VALUES (12, 9, '黑龙江省伊春市金山屯区asfsaf', '13612345678', 'safas', 0, '江西省', '赣州市', '大余县', 'asfsaf');

-- ----------------------------
-- Table structure for cat
-- ----------------------------
DROP TABLE IF EXISTS `cat`;
CREATE TABLE `cat`  (
  `catid` int(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`catid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of cat
-- ----------------------------
INSERT INTO `cat` VALUES (1, '热门资讯');
INSERT INTO `cat` VALUES (2, '知识百科');
INSERT INTO `cat` VALUES (3, '专题推荐');

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(5) NULL DEFAULT NULL,
  `good_id` int(5) NULL DEFAULT NULL,
  `comments_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 95 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of comments
-- ----------------------------
INSERT INTO `comments` VALUES (79, 9, 32, '很好，很不错哦');
INSERT INTO `comments` VALUES (80, 9, 33, '很好，很不错哦');
INSERT INTO `comments` VALUES (89, 9, 32, '今天是和女友认识3年纪念日，送过女友不少礼物，女友还是最喜欢这家的花');
INSERT INTO `comments` VALUES (90, 9, 33, '今天是和女友认识3年纪念日，送过女友不少礼物，女友还是最喜欢这家的花');
INSERT INTO `comments` VALUES (91, 9, 1, '非常好的购物体验，第一次写这么多字赞商家，理由如下： 1.客服：因为是要临时用花所以很着急，客服回复速度非常快，而且根据我的要求推荐了适合花束。 2.花材和价格：花材质量上成，新鲜、花型也好，没开的部分泡在花瓶里基本都能怒放！价格也很公道，同类商家比较性价比超高。我想这条也是最重要的。 3.物流：连锁企业，各大城市好像都有店，而且在时间比较紧的情况下也能及时送达，根本不需要担心会因为物流耽误用花。 推荐大家购买，本人已收藏');
INSERT INTO `comments` VALUES (92, 9, 43, '很好很不错哦');
INSERT INTO `comments` VALUES (93, 9, 43, '很好哦');
INSERT INTO `comments` VALUES (94, 9, 26, '很不错');

-- ----------------------------
-- Table structure for good_title
-- ----------------------------
DROP TABLE IF EXISTS `good_title`;
CREATE TABLE `good_title`  (
  `good_tag_id` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`good_tag_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of good_title
-- ----------------------------
INSERT INTO `good_title` VALUES (1, '爱情鲜花');
INSERT INTO `good_title` VALUES (2, '友情鲜花');
INSERT INTO `good_title` VALUES (3, '鲜花礼盒');
INSERT INTO `good_title` VALUES (4, '开业花篮');
INSERT INTO `good_title` VALUES (5, '绿植');

-- ----------------------------
-- Table structure for good_type
-- ----------------------------
DROP TABLE IF EXISTS `good_type`;
CREATE TABLE `good_type`  (
  `good_type_id` int(5) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`good_type_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of good_type
-- ----------------------------
INSERT INTO `good_type` VALUES (1, '花束');
INSERT INTO `good_type` VALUES (2, '礼盒');
INSERT INTO `good_type` VALUES (3, '花篮');
INSERT INTO `good_type` VALUES (4, '周花');
INSERT INTO `good_type` VALUES (5, '绿植');

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`  (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `title` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `src` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` decimal(10, 2) NULL DEFAULT NULL,
  `sales` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `title_id` int(4) NOT NULL,
  `isIndexShow` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1',
  `type_id` int(4) NULL DEFAULT NULL,
  `original_price` decimal(10, 2) NULL DEFAULT NULL,
  `material` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `packaging` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `distribution` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '全国送货上门，市区免运费',
  `attached` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goodsSwiperArr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goodsDetailsImgArr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `suitable_scene` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '适合场景，多个用逗号隔开',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 60 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES (1, '爱的诺言', '爱情鲜花', '/img/goodlist/love1.jpg', 219.00, '15367', 1, '1', 1, 269.00, '\r\n红玫瑰19枝，白色腊梅2枝（如腊梅无货，则用白色石竹梅或满天星代替）', '内层白底黑边丽染纸，外层深灰色雾面纸，白咖罗纹', '全国送货上门，市区免运费', '下单填写留言，免费赠送贺卡', '/img/goodsSwiper/1.jpg,/img/goodsSwiper/2.jpg,/img/goodsSwiper/3.jpg,/img/goodsSwiper/1.jpg,/img/goodsSwiper/4.jpg', '/img/goodsdetails/aydetails1.jpg,/img/goodsdetails/aydetails2.jpg,/img/goodsdetails/public.jpg', '1,5,4');
INSERT INTO `goods` VALUES (2, '爱意朦胧', '爱情鲜花', '/img/goodlist/love2.jpg', 158.00, '13258', 1, '1', 1, 189.00, '红玫瑰11枝，满天星，栀子叶搭配', '外层浅灰紫/香芋紫人造纸，里层白色人造单面纸，白绿粗罗纹带', '全国送货上门，市区免运费', '下单填写留言，免费赠送贺卡', '/img/goodsSwiper/menglong1.jpg,/img/goodsSwiper/menglong2.jpg,/img/goodsSwiper/menglong3.jpg,/img/goodsSwiper/menglong4.jpg', '/img/goodsdetails/menglong1.jpg,/img/goodsdetails/menglong2.jpg,/img/goodsdetails/public.jpg', '1,5,4');
INSERT INTO `goods` VALUES (3, '今生挚爱', '爱情鲜花', '/img/goodlist/love3.jpg', 239.00, '15454', 1, '1', 1, 319.00, '19枝苏醒玫瑰，2枝粉色桔梗，0.3扎小雏菊，0.2扎栀子叶，0.2扎水晶草', '白色雪梨纸5张，黑白竖条纹蝴蝶结', '全国送货上门，市区免运费', '下单填写留言，免费赠送贺卡', '/img/goodsSwiper/js1.jpg,/img/goodsSwiper/js2.jpg,/img/goodsSwiper/js3.jpg,/img/goodsSwiper/js4.jpg', '/img/goodsdetails/js1.jpg,/img/goodsdetails/js2.jpg,/img/goodsdetails/public.jpg', '1,5,4');
INSERT INTO `goods` VALUES (4, '永恒回忆', '爱情鲜花', '/img/goodlist/love4.jpg', 158.00, '13257', 1, '1', 1, 359.00, '红玫瑰33枝，石竹梅外围点缀', '白色棉纸内包，黑色包装纸外围圆形包装，红色丝带蝴蝶结', '全国送货上门，市区免运费', '下单填写留言，免费赠送贺卡', '/img/goodsSwiper/yhhy1.jpg,/img/goodsSwiper/yhhy2.jpg,/img/goodsSwiper/yhhy3.jpg,/img/goodsSwiper/yhhy4.jpg', '/img/goodsdetails/yhhy1.jpg,/img/goodsdetails/yhhy2.jpg,/img/goodsdetails/public.jpg', '1,5,4');
INSERT INTO `goods` VALUES (5, '念你一生', '爱情鲜花', '/img/goodlist/love5.jpg', 448.00, '19578', 1, '1', 1, 599.00, '66枝精品红玫瑰', '黑色雪梨纸，黑色条纹纸，玻璃纸卷，酒红色缎带花结', '全国送货上门，市区免运费', '下单填写留言，免费赠送贺卡', '/img/goodsSwiper/nnys1.jpg,/img/goodsSwiper/nnys2.jpg,/img/goodsSwiper/nnys3.jpg,/img/goodsSwiper/nnys4.jpg', '/img/goodsdetails/nnys1.jpg,/img/goodsdetails/nnys2.jpg,/img/goodsdetails/public.jpg', '1,5,4');
INSERT INTO `goods` VALUES (6, '佳期如梦', '爱情鲜花', '/img/goodlist/love6.jpg', 309.00, '12567', 1, '1', 1, 359.00, '香槟玫瑰33枝，红豆搭配', '内层黄色不织布，外层灰蓝绝色纸，香芋紫人造双面纸，玻璃纸，白蓝色罗纹带', '全国送货上门，市区免运费', '下单填写留言，免费赠送贺卡', '/img/goodsSwiper/jqrm1.jpg,/img/goodsSwiper/jqrm2.jpg,/img/goodsSwiper/jqrm3.jpg,/img/goodsSwiper/jqrm4.jpg', '/img/goodsdetails/jqrm1.jpg,/img/goodsdetails/jqrm2.jpg,/img/goodsdetails/public.jpg', '1,5');
INSERT INTO `goods` VALUES (7, '相守一生', '爱情鲜花', '/img/goodlist/love7.jpg', 599.00, '9598', 1, '1', 1, 689.00, '33枝戴安娜、66枝红玫瑰、满天星外围', '粉色opp雾面纸6张酒红色缎带2米', '全国送货上门，市区免运费', '下单填写留言，免费赠送贺卡', '/img/goodsSwiper/xsys1.jpg,/img/goodsSwiper/xsys2.jpg,/img/goodsSwiper/xsys4.jpg', '/img/goodsdetails/xsys1.jpg,/img/goodsdetails/xsys2.jpg,/img/goodsdetails/public.jpg', '1,5,4');
INSERT INTO `goods` VALUES (8, '幸福之约', '爱情鲜花', '/img/goodlist/love8.jpg', 568.00, NULL, 1, '1', 1, 599.00, '99朵精品红玫瑰，外围红豆搭配', '黑色高档包装', '全国送货上门，市区免运费', '下单填写留言，免费赠送贺卡', '/img/goodsSwiper/xfzy1.jpg,/img/goodsSwiper/xfzy2.jpg', '/img/goodsdetails/xfzy1.jpg,/img/goodsdetails/xfzy2.jpg,/img/goodsdetails/public.jpg', '1,5');
INSERT INTO `goods` VALUES (9, '美好时光', '友情鲜花', '/img/goodlist/friendship1.jpg', 209.00, '9875', 2, '1', 1, 259.00, '11枝戴安娜粉玫瑰，2枝多头白百合，白色相思梅5枝，栀子叶0.5扎', '浅紫香芋紫人造纸2张，米白色缎带1.5米', '全国送货上门，市区免运费', '下单填写留言，免费赠送贺卡', '/img/goodsSwiper/mhsg1.jpg,/img/goodsSwiper/mhsg2.jpg,/img/goodsSwiper/mhsg3.jpg,/img/goodsSwiper/mhsg4.jpg\r\n', '/img/goodsdetails/mhsg1.jpg,/img/goodsdetails/mhsg2.jpg,/img/goodsdetails/public.jpg', '3,2,4');
INSERT INTO `goods` VALUES (10, '温馨时刻', '友情鲜花', '/img/goodlist/friendship2.jpg', 176.00, '12641', 2, '1', 1, 229.00, '粉色康乃馨11枝，百合2枝', '白色雪梨纸，米白色平面纸，粉色吊花压纹纸 银灰色缎带', '全国送货上门，市区免运费', '下单填写留言，免费赠送贺卡', '/img/goodsSwiper/wxsk1.jpg,/img/goodsSwiper/wxsk2.jpg,/img/goodsSwiper/wxsk3.jpg,/img/goodsSwiper/wxsk4.jpg', '/img/goodsdetails/wxsk1.jpg,/img/goodsdetails/wxsk2.jpg,/img/goodsdetails/public.jpg', '3,2,4');
INSERT INTO `goods` VALUES (11, '美丽的她', '友情鲜花', '/img/goodlist/friendship3.jpg', 209.00, '7548', 2, '1', 1, 239.00, '11枝红玫瑰，2枝多头白香水百合，黄莺搭配', '内层白色雪梨纸，丝带系结', '全国送货上门，市区免运费', '下单填写留言，免费赠送贺卡', '/img/goodsSwiper/mldt1.jpg,/img/goodsSwiper/mldt2.jpg,/img/goodsSwiper/mldt3.jpg,/img/goodsSwiper/mldt4.jpg', '/img/goodsdetails/mldt1.jpg,/img/goodsdetails/mldt2.jpg,/img/goodsdetails/public.jpg', '3');
INSERT INTO `goods` VALUES (12, '不负韵华', '友情鲜花', '/img/goodlist/friendship4.jpg', 236.00, '11519', 2, '1', 1, 289.00, '多头粉色香水百合4枝，苏醒粉玫瑰9枝，迷你菊5枝、叶上花5枝、红豆5枝', '内层黄色不织布，外层浅紫/香芋紫人造不织布，玻璃纸，白咖罗纹带', '全国送货上门，市区免运费', '下单填写留言，免费赠送贺卡', '/img/goodsSwiper/bfyh1.jpg,/img/goodsSwiper/bfyh2.jpg,/img/goodsSwiper/bfyh3.jpg,/img/goodsSwiper/bfyh4.jpg', '/img/goodsdetails/bfyh1.jpg,/img/goodsdetails/bfyh2.jpg,/img/goodsdetails/public.jpg', '3,2');
INSERT INTO `goods` VALUES (13, '你的微笑', '友情鲜花', '/img/goodlist/friendship5.jpg', 289.00, '7523', 2, '1', 1, 369.00, '粉色康乃馨11枝，粉佳人玫瑰5枝、3头或以上白底粉边洋桔梗5枝、粉色绣球1枝、白色紫罗兰5枝、白色翠珠3枝，尤加利5枝', '粉色雾面纸8张、白色雪梨纸2大张、浅粉色罗纹玫瑰金丝带2米', '全国送货上门，市区免运费', '下单填写留言，免费赠送贺卡', '/img/goodsSwiper/ndwx1.jpg,/img/goodsSwiper/ndwx2.jpg,/img/goodsSwiper/ndwx3.jpg,/img/goodsSwiper/ndwx4.jpg', '/img/goodsdetails/ndwx1.jpg,/img/goodsdetails/ndwx2.jpg,/img/goodsdetails/public.jpg', '3,4');
INSERT INTO `goods` VALUES (14, 'xfyj', '幸福永久', '/img/goodlist/friendship6.png', 269.00, '8457', 2, '1', 1, 329.00, '红色康乃馨19枝，戴安娜粉玫瑰11枝，栀子叶搭配', '浅蓝色包装，粉色系带', '全国送货上门，市区免运费', '下单填写留言，免费赠送贺卡', '/img/goodsSwiper/xfyj1.jpg,/img/goodsSwiper/xfyj2.jpg,/img/goodsSwiper/xfyj3.jpg,/img/goodsSwiper/xfyj4.jpg', '/img/goodsdetails/xfyj1.jpg,/img/goodsdetails/xfyj2.jpg,/img/goodsdetails/public.jpg', '3');
INSERT INTO `goods` VALUES (15, '星语星愿', '友情鲜花', '/img/goodlist/friendship7.jpg', 289.00, '6598', 2, '1', 1, 359.00, '一大扎粉色满天星饱满搭配', '粉色雾面纸韩式包装，蝴蝶结系扎', '全国送货上门，市区免运费', '下单填写留言，免费赠送贺卡', '/img/goodsSwiper/xyxy1.jpg,/img/goodsSwiper/xyxy2.jpg,/img/goodsSwiper/xyxy3.jpg,/img/goodsSwiper/xyxy4.jpg', '/img/goodsdetails/xyxy1.jpg,/img/goodsdetails/xyxy2.jpg,/img/goodsdetails/public.jpg', '3,2');
INSERT INTO `goods` VALUES (16, '浩瀚星空', '友情鲜花', '/img/goodlist/friendship3.jpg', 288.00, '11935', 2, '1', 1, 369.00, '香槟玫瑰9枝、蓝绣球1枝、向日葵3枝、白色洋桔梗5枝、大叶尤加利5枝', '蓝色人造纸5张、褐绿色OPP膜书法纸3张、香槟缎带1.5米、灰蓝色罗纹烫金丝带1.5米', '全国送货上门，市区免运费', '下单填写留言，免费赠送贺卡', '/img/goodsSwiper/hhxk1.jpg,/img/goodsSwiper/hhxk2.jpg,/img/goodsSwiper/hhxk3.jpg,/img/goodsSwiper/hhxk4.jpg', '/img/goodsdetails/hhxk1.jpg,/img/goodsdetails/hhxk2.jpg,/img/goodsdetails/public.jpg', '3');
INSERT INTO `goods` VALUES (17, '幸福守候', '鲜花礼盒', '/img/goodlist/giftbox1.jpg', 228.00, '15361', 3, '1', 2, 279.00, '19枝红玫瑰，黄莺搭配，满天星点缀', '咖啡色礼盒包装', '全国送货上门，市区免运费', '下单填写留言，免费赠送贺卡', '/img/goodsSwiper/xfsh1.jpg', '/img/goodsdetails/xfsh1.jpg,/img/goodsdetails/xfsh2.jpg,/img/goodsdetails/public.jpg', '1,2');
INSERT INTO `goods` VALUES (18, '爱在心田', '鲜花礼盒', '/img/goodlist/giftbox2.jpg', 229.00, '12651', 3, '1', 2, 299.00, '19枝戴安娜粉玫瑰，勿忘我适量搭配', '牛皮纸和深咖啡色条纹纸，银色缎带花结，灰色包装盒', '全国送货上门，市区免运费', '下单填写留言，免费赠送贺卡', '/img/goodsSwiper/azxt1.jpg,/img/goodsSwiper/azxt2.jpg', '/img/goodsdetails/azxt1.jpg,/img/goodsdetails/azxt2.jpg,/img/goodsdetails/public.jpg', '1');
INSERT INTO `goods` VALUES (19, '挚爱一生', '鲜花礼盒', '/img/goodlist/giftbox3.jpg', 179.00, '9856', 3, '1', 2, 239.00, '11枝戴安娜粉玫瑰，相思梅搭配，一对卡通小熊', '礼盒装，精美蝴蝶结装饰', '全国送货上门，市区免运费', '下单填写留言，免费赠送贺卡', '/img/goodsSwiper/zays1.jpg', '/img/goodsdetails/zays1.jpg,/img/goodsdetails/zays2.jpg,/img/goodsdetails/public.jpg', '1,2');
INSERT INTO `goods` VALUES (20, '为你钟情', '鲜花礼盒', '/img/goodlist/giftbox4.jpg', 308.00, '13960', 3, '1', 2, 389.00, '33枝精品红玫瑰，少量绿叶搭配', '牛皮纸和深咖啡色条纹纸，银色缎带花结，魔力铁山灰包装盒', '全国送货上门，市区免运费', '下单填写留言，免费赠送贺卡', '/img/goodsSwiper/wnzq1.jpg,/img/goodsSwiper/wnzq2.jpg,/img/goodsSwiper/wnzq3.jpg,/img/goodsSwiper/wnzq4.jpg', '/img/goodsdetails/wnzq1.jpg,/img/goodsdetails/wnzq2.jpg,/img/goodsdetails/public.jpg', '1');
INSERT INTO `goods` VALUES (21, '亲密无间', '鲜花礼盒', '/img/goodlist/giftbox5.jpg', 229.00, '12248', 3, '1', 2, 299.00, '19枝香槟玫瑰高级礼盒，尤加利点缀搭配', '草绿色棉纸扇形包装，墨绿蝴蝶结束扎', '全国送货上门，市区免运费', '下单填写留言，免费赠送贺卡', '/img/goodsSwiper/qmwj1.jpg,/img/goodsSwiper/qmwj2.jpg,/img/goodsSwiper/qmwj3.jpg', '/img/goodsdetails/qmwj1.jpg,/img/goodsdetails/qmwj2.jpg,/img/goodsdetails/public.jpg', '1');
INSERT INTO `goods` VALUES (22, '钟情于你', '鲜花礼盒', '/img/goodlist/giftbox6.jpg', 289.00, '9821', 3, '1', 2, 389.00, '戴安娜粉玫瑰21枝，粉色桔梗5枝，石竹梅7枝', '高档灰色礼盒包装', '全国送货上门，市区免运费', '下单填写留言，免费赠送贺卡', '/img/goodsSwiper/zqyn1.jpg,/img/goodsSwiper/zqyn2.jpg,/img/goodsSwiper/zqyn3.jpg,/img/goodsSwiper/zqyn4.jpg', '/img/goodsdetails/zqyn1.jpg,/img/goodsdetails/zqyn2.jpg,/img/goodsdetails/public.jpg', '1,4');
INSERT INTO `goods` VALUES (23, '一生所爱', '鲜花礼盒', '/img/goodlist/giftbox7.jpg', 309.00, '11366', 3, '1', 2, 389.00, '香槟玫瑰6枝，红玫瑰10枝，白玫瑰7枝，艳粉玫瑰10枝，海桐叶搭配，2只小熊。', '精美长方形礼盒装', '全国送货上门，市区免运费', '下单填写留言，免费赠送贺卡', '/img/goodsSwiper/yssa1.jpg,/img/goodsSwiper/yssa2.jpg,/img/goodsSwiper/yssa3.jpg,/img/goodsSwiper/yssa4.jpg', '/img/goodsdetails/yssa1.jpg,/img/goodsdetails/yssa2.jpg,/img/goodsdetails/public.jpg', '1,2');
INSERT INTO `goods` VALUES (24, '爱情时光', '鲜花礼盒', '/img/goodlist/giftbox8.jpg', 336.00, '8957', 3, '1', 2, 459.00, '33枝精品红玫瑰', '心形礼盒精美包装', '全国送货上门，市区免运费', '下单填写留言，免费赠送贺卡', '/img/goodsSwiper/aqsg1.jpg,/img/goodsSwiper/aqsg2.jpg,/img/goodsSwiper/aqsg3.jpg,/img/goodsSwiper/aqsg4.jpg', '/img/goodsdetails/aqsg1.jpg,/img/goodsdetails/aqsg2.jpg,/img/goodsdetails/public.jpg', '1');
INSERT INTO `goods` VALUES (25, '大吉大利（一对）', '开业花篮', '/img/goodlist/flowerbasket1.jpg', 258.00, '10245', 4, '1', 3, 369.00, '20枝各色扶郎花，1枝多头白百合，绿叶、散尾葵搭配', '粉红色棉纸包扎、单层开业花篮', '全国送货上门，市区免运费', '下单填写留言，免费赠送贺卡', '/img/goodsSwiper/djdl1.jpg,/img/goodsSwiper/djdl2.jpg,/img/goodsSwiper/djdl3.jpg,/img/goodsSwiper/djdl4.jpg', '/img/goodsdetails/djdl1.jpg,/img/goodsdetails/djdl2.jpg,/img/goodsdetails/public.jpg', '6');
INSERT INTO `goods` VALUES (26, '喜气迎门（一对）', '开业花篮', '/img/goodlist/flowerbasket2.jpg', 326.00, '8936', 4, '1', 3, 399.00, '各色扶郎花，1枝多头粉百合，香槟玫瑰4枝，散尾葵、剑叶搭配', '红色棉纸包扎、单层开业花篮', '全国送货上门，市区免运费', '下单填写留言，免费赠送贺卡', '/img/goodsSwiper/xqym1.jpg', '/img/goodsdetails/xqym1.jpg,/img/goodsdetails/xqym2.jpg,/img/goodsdetails/public.jpg', '6');
INSERT INTO `goods` VALUES (27, '生意兴隆（一对）', '开业花篮', '/img/goodlist/flowerbasket3.jpg', 396.00, '11265', 4, '1', 3, 499.00, '扶朗，香水百合，富贵竹，散尾葵丰满搭配', '双层开业花篮', '全国送货上门，市区免运费', '下单填写留言，免费赠送贺卡', '/img/goodsSwiper/syxn1.jpg,/img/goodsSwiper/syxn2.jpg,/img/goodsSwiper/syxn3.jpg,/img/goodsSwiper/syxn4.jpg', '/img/goodsdetails/syxn1.jpg,/img/goodsdetails/syxn2.jpg,/img/goodsdetails/public.jpg', '6');
INSERT INTO `goods` VALUES (28, '好运连连（一对）', '开业花篮', '/img/goodlist/flowerbasket4.jpg', 398.00, '10711', 4, '1', 3, 489.00, '红扶郎，洋兰，栀子叶，散尾叶丰满搭配', '三脚架开业花篮', '全国送货上门，市区免运费', '下单填写留言，免费赠送贺卡', '/img/goodsSwiper/hyll1.jpg', '/img/goodsdetails/hyll1.jpg,/img/goodsdetails/hyll2.jpg,/img/goodsdetails/public.jpg', '6');
INSERT INTO `goods` VALUES (29, '喜气洋洋（一对）', '开业花篮', '/img/goodlist/flowerbasket5.jpg', 376.00, '7698', 4, '1', 3, 488.00, '红色，粉色扶朗花，多头百合，洋兰，散尾叶丰满搭配', '三脚架开业花篮，系丝带', '全国送货上门，市区免运费', '下单填写留言，免费赠送贺卡', '/img/goodsSwiper/xqyy1.jpg', '/img/goodsdetails/xqyy1.jpg,/img/goodsdetails/xqyy2.jpg,/img/goodsdetails/public.jpg', '6');
INSERT INTO `goods` VALUES (30, '张灯结彩（一对）', '开业花篮', '/img/goodlist/flowerbasket6.jpg', 498.00, '8738', 4, '1', 3, 589.00, '马卡龙色气球（大红色、玫红色、粉红色）+紫玫瑰+粉玫瑰+粉色洋桔梗，搭配适量龟背叶、散尾葵、栀子叶、尤加利叶装饰', '红色雾面纸+红色缎带束扎，三角架包装', '全国送货上门，市区免运费', '下单填写留言，免费赠送贺卡', '/img/goodsSwiper/zdjc1.jpg', '/img/goodsdetails/zdjc1.jpg,/img/goodsdetails/zdjc2.jpg,/img/goodsdetails/public.jpg', '6');
INSERT INTO `goods` VALUES (31, '开业大卖', '开业花篮', '/img/goodlist/flowerbasket7.jpg', 359.00, '6368', 4, '1', 3, 488.00, '大麦，满天星，富贵竹搭配', ' 酒红色包装纸包扎（单个装）', '全国送货上门，市区免运费', '下单填写留言，免费赠送贺卡', '/img/goodsSwiper/kydm1.jpg', '/img/goodsdetails/kydm1.jpg,/img/goodsdetails/kydm2.jpg,/img/goodsdetails/public.jpg', '6');
INSERT INTO `goods` VALUES (32, '万事如意（一对）', '开业花篮', '/img/goodlist/flowerbasket8.jpg', 569.00, '5512', 4, '1', 3, 699.00, '马卡龙色气球（浅绿色、浅蓝色、白色、透明色）+蓝色绣球+白玫瑰+浅绿色洋桔梗，搭配适量龟背叶、散尾葵、尤加利叶装饰', '双面雾面纸（绿色、浅绿色）+黑色缎带+香槟色缎带束扎，三角架包装', '全国送货上门，市区免运费', '下单填写留言，免费赠送贺卡', '/img/goodsSwiper/wsry1.jpg', '/img/goodsdetails/wsry1.jpg,/img/goodsdetails/wsry2.jpg,/img/goodsdetails/public.jpg', '6');
INSERT INTO `goods` VALUES (33, '辫子发财树盆栽', '绿植', '/img/goodlist/greenplant1.jpg', 539.00, '2549', 5, '1', 5, 689.00, '辫子发财树一盆', '陶瓷盆种植', '全国送货上门，市区免运费', '下单填写留言，免费赠送贺卡', '/img/goodsSwiper/bzfcs1.jpg,/img/goodsSwiper/bzfcs2.jpg', '/img/goodsdetails/bzfcs1.jpg,/img/goodsdetails/bzfcs2.jpg,/img/goodsdetails/public.jpg', '7');
INSERT INTO `goods` VALUES (34, '单柱发财树盆栽1', '绿植', '/img/goodlist/greenplant2.jpg', 489.00, '4563', 5, '1', 5, 589.00, '单柱发财树一盆', '陶瓷盆种植', '全国送货上门，市区免运费', '下单填写留言，免费赠送贺卡', '/img/goodsSwiper/dzfcs11.jpg,/img/goodsSwiper/dzfcs12.jpg', '/img/goodsdetails/dzfcs11.jpg,/img/goodsdetails/dzfcs12.jpg,/img/goodsdetails/public.jpg', '7');
INSERT INTO `goods` VALUES (35, '绿宝盆栽', '绿植', '/img/goodlist/greenplant3.jpg', 396.00, '845', 5, '1', 5, 699.00, '绿宝一盆', '陶瓷盆种植', '全国送货上门，市区免运费', '下单填写留言，免费赠送贺卡', '/img/goodsSwiper/lbpz1.jpg,/img/goodsSwiper/lbpz2.jpg', '/img/goodsdetails/lbpz1.jpg,/img/goodsdetails/lbpz2.jpg,/img/goodsdetails/public.jpg', '7');
INSERT INTO `goods` VALUES (36, '天堂鸟盆栽', '绿植', '/img/goodlist/greenplant4.jpg', 659.00, '1359', 5, '1', 5, 799.00, '天堂鸟一盆', '陶瓷盆种植', '全国送货上门，市区免运费', '下单填写留言，免费赠送贺卡', '/img/goodsSwiper/ttnpz1.jpg,/img/goodsSwiper/ttnpz2.jpg', '/img/goodsdetails/ttnpz1.jpg,/img/goodsdetails/ttnpz2.jpg,/img/goodsdetails/public.jpg', '7');
INSERT INTO `goods` VALUES (37, '落地大富贵竹', '绿植', '/img/goodlist/greenplant5.jpg', 438.00, '2845', 5, '1', 5, 567.00, '落地大富贵竹一盆', '陶瓷盆种植', '全国送货上门，市区免运费', '下单填写留言，免费赠送贺卡', '/img/goodsSwiper/lddfgz1.jpg,/img/goodsSwiper/lddfgz2.jpg', '/img/goodsdetails/lddfgz1.jpg,/img/goodsdetails/lddfgz2.jpg,/img/goodsdetails/public.jpg', '7');
INSERT INTO `goods` VALUES (38, '三株鸿运当头盆栽', '绿植', '/img/goodlist/greenplant6.jpg', 569.00, '2569', 5, '1', 5, 699.00, '三株鸿运当头一盆', '陶瓷盆种植', '全国送货上门，市区免运费', '下单填写留言，免费赠送贺卡', '/img/goodsSwiper/szhydtpz1.jpg', '/img/goodsdetails/szhydtpz1.jpg,/img/goodsdetails/szhydtpz2.jpg,/img/goodsdetails/public.jpg', '7');
INSERT INTO `goods` VALUES (39, '虎皮兰盆栽', '绿植', '/img/goodlist/greenplant7.jpg', 389.00, '3236', 5, '1', 5, 489.00, '虎皮兰一盆', '陶瓷盆种植', '全国送货上门，市区免运费', '下单填写留言，免费赠送贺卡', '/img/goodsSwiper/hplpz1.jpg,/img/goodsSwiper/hplpz2.jpg', '/img/goodsdetails/hplpz1.jpg,/img/goodsdetails/hplpz2.jpg,/img/goodsdetails/public.jpg', '7');
INSERT INTO `goods` VALUES (40, '心叶藤盆栽', '绿植', '/img/goodlist/greenplant8.jpg', 429.00, '1256', 5, '1', 5, 489.00, '心叶藤一盆', '陶瓷盆种植', '全国送货上门，市区免运费', '下单填写留言，免费赠送贺卡', '/img/goodsSwiper/xytpz1.jpg,/img/goodsSwiper/xytpz2.png', '/img/goodsdetails/xytpz1.jpg,/img/goodsdetails/xytpz2.jpg,/img/goodsdetails/public.jpg', '7');
INSERT INTO `goods` VALUES (41, '单品周花', '周花', '/img/goodlist/zhouhua1.jpg', 358.00, '4017', 0, '0', 4, 399.00, '玫瑰、康乃馨、满天星、百合、桔梗、雏菊等单品周花（每次只有一种花材，10枝左右）', '包月鲜花，每周送一次，10枝左右', '全国送货上门，市区免运费', '首次免费赠送精美花瓶', '/img/goodsSwiper/dpzh1.jpg,/img/goodsSwiper/dpzh2.jpg,/img/goodsSwiper/dpzh3.jpg,/img/goodsSwiper/dpzh4.jpg', '/img/goodsdetails/dpzh1.jpg,/img/goodsdetails/dpzh2.jpg,/img/goodsdetails/public.jpg', '1,5');
INSERT INTO `goods` VALUES (42, '混搭周花', '周花', '/img/goodlist/zhouhua2.jpg', 396.00, '6023', 0, '0', 4, 488.00, '玫瑰、康乃馨、满天星、百合、桔梗、雏菊等混合周花（每次2-3种花材混搭，15枝左右）', '玫瑰、康乃馨、满天星、百合、桔梗、雏菊等混合周花（每次2-3种花材混搭，15枝左右）', '全国送货上门，市区免运费', '下单填写留言，免费赠送贺卡', '/img/goodsSwiper/hdzh1.jpg,/img/goodsSwiper/hdzh2.jpg,/img/goodsSwiper/hdzh3.jpg,/img/goodsSwiper/hdzh4.jpg', '/img/goodsdetails/hdzh1.jpg,/img/goodsdetails/hdzh2.jpg,/img/goodsdetails/public.jpg', '1,5');
INSERT INTO `goods` VALUES (43, '爱的告白', '爱情鲜花', '/img/goodlist/love9.jpg', 309.00, '14250', 3, '0', 2, 359.00, '33枝戴安娜玫瑰，少量绿叶搭配', '牛皮纸和深咖啡色条纹纸，银色缎带花结，灰色包装盒', '全国送货上门，市区免运费', '下单填写留言，免费赠送贺卡', '/img/goodsSwiper/aqgb1.jpg,/img/goodsSwiper/aqgb2.jpg,/img/goodsSwiper/aqgb3.jpg,/img/goodsSwiper/aqgb4.jpg\r\n', '/img/goodsdetails/aqgb1.jpg,/img/goodsdetails/aqgb2.jpg,/img/goodsdetails/public.jpg', '1,5');
INSERT INTO `goods` VALUES (44, '绵绵情谊', '爱情鲜花', '/img/goodlist/love10.jpg', 229.00, '11897', 3, '0', 2, 299.00, '19枝精品粉玫瑰，搭配适量尤加利', '高档礼盒精美包装', '全国送货上门，市区免运费', '下单填写留言，免费赠送贺卡', '/img/goodsSwiper/mmqy1.jpg,/img/goodsSwiper/mmqy2.jpg,/img/goodsSwiper/mmqy3.jpg,/img/goodsSwiper/mmqy4.jpg', '/img/goodsdetails/mmqy1.jpg,/img/goodsdetails/mmqy2.jpg,/img/goodsdetails/public.jpg', '1,5');
INSERT INTO `goods` VALUES (45, '缘分天空', '爱情鲜花', '/img/goodlist/love11.jpg', 309.00, '6599', 3, '0', 2, 359.00, '33枝红玫瑰', '咖啡色礼盒精致包装', '全国送货上门，市区免运费', '下单填写留言，免费赠送贺卡', '/img/goodsSwiper/yftk1.jpg,/img/goodsSwiper/yftk2.jpg', '/img/goodsdetails/yftk1.jpg,/img/goodsdetails/yftk2.jpg,/img/goodsdetails/public.jpg', '1,5');
INSERT INTO `goods` VALUES (46, '永恒的爱', '爱情鲜花', '/img/goodlist/love12.jpg', 229.00, '10985', 3, '0', 2, 299.00, '19枝白玫瑰，搭配适量尤加利', '高档礼盒精美包装', '全国送货上门，市区免运费', '下单填写留言，免费赠送贺卡', '/img/goodsSwiper/yhda1.jpg,/img/goodsSwiper/yhda2.jpg,/img/goodsSwiper/yhda3.jpg,/img/goodsSwiper/yhda4.jpg', '/img/goodsdetails/yhda1.jpg,/img/goodsdetails/yhda2.jpg,/img/goodsdetails/public.jpg', '1,5');
INSERT INTO `goods` VALUES (47, '情定一生', '爱情鲜花', '/img/goodlist/love13.jpg', 309.00, '6594', 3, '0', 2, 389.00, '33枝红玫瑰，石竹梅、绿叶搭配，2个小熊', '精美长方形礼盒装', '全国送货上门，市区免运费', '下单填写留言，免费赠送贺卡', '/img/goodsSwiper/qdys1.jpg', '/img/goodsdetails/qdys1.jpg,/img/goodsdetails/qdys2.jpg,/img/goodsdetails/public.jpg', '1,5');
INSERT INTO `goods` VALUES (48, '美丽的你', '爱情鲜花', '/img/goodlist/love14.jpg', 309.00, '10471', 3, '0', 2, 359.00, '33枝精品香槟玫瑰', '灰色高档礼盒，牛皮纸包装，精美灰色缎带花结', '全国送货上门，市区免运费', '下单填写留言，免费赠送贺卡', '/img/goodsSwiper/mldn1.jpg,/img/goodsSwiper/mldn2.jpg,/img/goodsSwiper/mldn3.jpg,/img/goodsSwiper/mldn4.jpg', '/img/goodsdetails/mldn1.jpg,/img/goodsdetails/mldn2.jpg,/img/goodsdetails/public.jpg', '1,5');
INSERT INTO `goods` VALUES (49, '感谢有你', '爱情鲜花', '/img/goodlist/love15.jpg', 289.00, '6897', 3, '0', 2, 369.00, '33枝红色康乃馨，0.3扎尤加利叶', '灰色高档礼盒，牛皮纸包装，精美灰色缎带花结', '全国送货上门，市区免运费', '下单填写留言，免费赠送贺卡', '/img/goodsSwiper/gxyn1.jpg,/img/goodsSwiper/gxyn2.jpg,/img/goodsSwiper/gxyn3.jpg,/img/goodsSwiper/gxyn4.jpg', '/img/goodsdetails/gxyn1.jpg,/img/goodsdetails/gxyn2.jpg,/img/goodsdetails/public.jpg', '1,5');
INSERT INTO `goods` VALUES (50, '美丽如你', '爱情鲜花', '/img/goodlist/love16.jpg', 229.00, '9474', 3, '0', 2, 299.00, '19枝精品香槟玫瑰，勿忘我适量搭配', '牛皮纸和深咖啡色条纹纸，银色缎带花结，灰色包装盒', '全国送货上门，市区免运费', '下单填写留言，免费赠送贺卡', '/img/goodsSwiper/mnrn1.jpg,/img/goodsSwiper/mnrn2.jpg,/img/goodsSwiper/mnrn3.jpg,/img/goodsSwiper/mnrn4.jpg', '/img/goodsdetails/mnrn1.jpg,/img/goodsdetails/mnrn2.jpg,/img/goodsdetails/public.jpg', '1,5');
INSERT INTO `goods` VALUES (51, '今生唯一', '爱情鲜花', '/img/goodlist/love17.jpg', 299.00, '6589', 3, '0', 2, 359.00, '10枝红玫瑰，9朵粉百合，3枝尤加利叶', '灰色高档礼盒，牛皮纸包装，精美灰色缎带花结', '全国送货上门，市区免运费', '下单填写留言，免费赠送贺卡', '/img/goodsSwiper/jswy1.jpg,/img/goodsSwiper/jswy2.jpg,/img/goodsSwiper/jswy3.jpg,/img/goodsSwiper/jswy4.jpg', '/img/goodsdetails/jswy1.jpg,/img/goodsdetails/jswy2.jpg,/img/goodsdetails/public.jpg', '1,5');
INSERT INTO `goods` VALUES (52, '缘来是你', '爱情鲜花', '/img/goodlist/love18.jpg', 639.00, '4999', 3, '0', 2, 799.00, '99枝精品红色、白色玫瑰混搭', '高档礼盒精美包装', '全国送货上门，市区免运费', '下单填写留言，免费赠送贺卡', '/img/goodsSwiper/ylsn1.jpg', '/img/goodsdetails/ylsn1.jpg,/img/goodsdetails/ylsn2.jpg,/img/goodsdetails/public.jpg', '1,5');
INSERT INTO `goods` VALUES (53, 'wnhb', '爱情鲜花', '/img/goodlist/love19.jpg', 239.00, '4985', 3, '0', 2, 359.00, '19枝粉色康乃馨，1枝白色多头百合，搭配适量黄莺、紫色勿忘我间插', '灰色礼盒精致包装', '全国送货上门，市区免运费', '下单填写留言，免费赠送贺卡', '/img/goodsSwiper/wnhb1.jpg,/img/goodsSwiper/wnhb2.jpg,/img/goodsSwiper/wnhb3.jpg,/img/goodsSwiper/wnhb4.jpg', '/img/goodsdetails/wnhb1.jpg,/img/goodsdetails/wnhb2.jpg,/img/goodsdetails/public.jpg', '1,5');
INSERT INTO `goods` VALUES (54, '甜蜜如心', '爱情鲜花', '/img/goodlist/love20.jpg', 276.00, '9875', 3, '0', 2, 359.00, '10枝红玫瑰，9颗巧克力，2只小熊，1个苹果', '精美心形礼盒装', '全国送货上门，市区免运费', '下单填写留言，免费赠送贺卡', '/img/goodsSwiper/tmrx1.jpg,/img/goodsSwiper/tmrx2.jpg,/img/goodsSwiper/tmrx3.jpg', '/img/goodsdetails/tmrx1.jpg,/img/goodsdetails/tmrx2.jpg,/img/goodsdetails/public.jpg', '1,5');
INSERT INTO `goods` VALUES (55, '浓情蜜蜜', '爱情鲜花', '/img/goodlist/love21.jpg', 265.00, '3598', 3, '0', 2, 339.00, '11枝红玫瑰+1个苹果+4颗巧克力+尤加利叶+小雏菊+相思梅', ' 圆形礼盒精美包装', '全国送货上门，市区免运费', '下单填写留言，免费赠送贺卡', '/img/goodsSwiper/nqmm1.jpg,/img/goodsSwiper/nqmm2.jpg', '/img/goodsdetails/nqmm1.jpg,/img/goodsdetails/nqmm2.jpg,/img/goodsdetails/public.jpg', '1,5');
INSERT INTO `goods` VALUES (56, '为你守候', '爱情鲜花', '/img/goodlist/l22.jpg', 229.00, '9852', 3, '0', 2, 299.00, '19枝香槟玫瑰，搭配适量尤加利叶', '长方形精美礼盒装', '全国送货上门，市区免运费', '下单填写留言，免费赠送贺卡', '/img/goodsSwiper/wnsh1.jpg,/img/goodsSwiper/wnsh2.jpg,/img/goodsSwiper/wnsh3.jpg,/img/goodsSwiper/wnsh4.jpg', '/img/goodsdetails/wnsh1.jpg,/img/goodsdetails/wnsh2.jpg,/img/goodsdetails/public.jpg', '1,5');
INSERT INTO `goods` VALUES (57, '两情相悦', '爱情鲜花', '/img/goodlist/l23.jpg', 219.00, '12658', 1, '0', 1, 279.00, '19枝精品红玫瑰，外围红豆搭配', '内层黄色不织布，外层黑色opp雾面纸，白绿粗罗纹带', '全国送货上门，市区免运费', '下单填写留言，免费赠送贺卡', '/img/goodsSwiper/lqxy1.jpg,/img/goodsSwiper/lqxy2.jpg,/img/goodsSwiper/lqxy3.jpg,/img/goodsSwiper/lqxy4.jpg\r\n', '/img/goodsdetails/lqxy1.jpg,/img/goodsdetails/lqxy2.jpg,/img/goodsdetails/public.jpg', '1,5');
INSERT INTO `goods` VALUES (58, '此情可待', '爱情鲜花', '/img/goodlist/cq.jpg', 238.00, '12077', 0, '0', 1, 288.00, '苏醒粉玫瑰16枝，粉色绣球1枝，绿小菊3枝，叶上花6枝', '内层粉色opp雾面纸，外层蓝色绝色纸，透明玻璃纸，白咖细罗纹带', '全国送货上门，市区免运费', '下单填写留言，免费赠送贺卡', '/img/goodsSwiper/cq1.jpg,/img/goodsSwiper/cq2.jpg,/img/goodsSwiper/cq3.jpg,/img/goodsSwiper/cq4.jpg', '/img/goodsdetails/cq1.jpg,/img/goodsdetails/cq2.jpg,/img/goodsdetails/public.jpg', '1,5');
INSERT INTO `goods` VALUES (59, '恋之物语', '爱情鲜花', '/img/goodlist/l24.jpg', 399.00, '15366', 1, '0', 1, 478.00, '52枝香槟玫瑰，叶上花一扎', '内层香芋人造双面纸，灰蓝绝色纸，外层白色opp雾面纸，白蓝细条纹缎带', '全国送货上门，市区免运费', '下单填写留言，免费赠送贺卡', '/img/goodsSwiper/nzwy1.jpg,/img/goodsSwiper/nzwy2.jpg,/img/goodsSwiper/nzwy3.jpg,/img/goodsSwiper/nzwy4.jpg', '/img/goodsdetails/nzwy1.jpg,/img/goodsdetails/nzwy2.jpg,/img/goodsdetails/public.jpg', '1,5');

-- ----------------------------
-- Table structure for homeBanner
-- ----------------------------
DROP TABLE IF EXISTS `homeBanner`;
CREATE TABLE `homeBanner`  (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `src` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of homeBanner
-- ----------------------------
INSERT INTO `homeBanner` VALUES (1, '/img/home/banner/banner1.jpg');
INSERT INTO `homeBanner` VALUES (2, '/img/home/banner/banner2.jpg');

-- ----------------------------
-- Table structure for homeNav
-- ----------------------------
DROP TABLE IF EXISTS `homeNav`;
CREATE TABLE `homeNav`  (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `imgSrc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `good_type_id` int(5) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of homeNav
-- ----------------------------
INSERT INTO `homeNav` VALUES (1, '花束', '/img/home/homeFastNav/mIndex1.png', 1);
INSERT INTO `homeNav` VALUES (2, '礼盒', '/img/home/homeFastNav/mIndex2.png', 2);
INSERT INTO `homeNav` VALUES (3, '花篮', '/img/home/homeFastNav/mIndex3.png', 3);
INSERT INTO `homeNav` VALUES (4, '周花', '/img/home/homeFastNav/mIndex4.png', 4);
INSERT INTO `homeNav` VALUES (5, '绿植', '/img/home/homeFastNav/mIndex5.png', 5);

-- ----------------------------
-- Table structure for imgNav
-- ----------------------------
DROP TABLE IF EXISTS `imgNav`;
CREATE TABLE `imgNav`  (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `title` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `src` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of imgNav
-- ----------------------------
INSERT INTO `imgNav` VALUES (1, '送恋人', '/img/home/imgNav/imgNav1.png');
INSERT INTO `imgNav` VALUES (2, '送长辈', '/img/home/imgNav/imgNav2.png');
INSERT INTO `imgNav` VALUES (3, '送亲友', '/img/home/imgNav/imgNav3.png');
INSERT INTO `imgNav` VALUES (4, '生日祝福', '/img/home/imgNav/imgNav4.png');
INSERT INTO `imgNav` VALUES (5, '求婚表白', '/img/home/imgNav/imgNav5.png');
INSERT INTO `imgNav` VALUES (6, '商务开业', '/img/home/imgNav/imgNav6.png');
INSERT INTO `imgNav` VALUES (7, '装饰绿植', '/img/home/imgNav/imgNav7.png');

-- ----------------------------
-- Table structure for information
-- ----------------------------
DROP TABLE IF EXISTS `information`;
CREATE TABLE `information`  (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `catid` int(5) NOT NULL,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `title_text` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tag_name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `viewed_count` int(10) NOT NULL DEFAULT 0,
  `time` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `title_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `details` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `details_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`, `catid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of information
-- ----------------------------
INSERT INTO `information` VALUES (1, 1, '鲜花有哪些品牌', '鲜花是当下流行元素，无论是结婚、约会时，必备的礼物，漂亮的鲜花，可以添加浪漫气氛，还不失男友的面子，让女友感受到浓浓的爱意。', '十大品牌', 13, '2020-11-03', '/img/information/036ceeef-20bb-4948-a79f-9e45fa1f99eb.png', '<p data-v-ab703648=\"\"><p data-v-ab703648=\"\"></p><p data-v-ab703648=\"\"></p><p data-v-ab703648=\"\"></p><p data-v-ab703648=\"\"></p><p data-v-ab703648=\"\"></p><p data-v-ab703648=\"\"></p><p data-v-ab703648=\"\"></p><p data-v-ab703648=\"\"></p><p data-v-ab703648=\"\"></p><p data-v-ab703648=\"\"></p><p data-v-ab703648=\"\"></p><p data-v-ab703648=\"\"></p><p data-v-ab703648=\"\"></p><p data-v-ab703648=\"\"></p><p data-v-ab703648=\"\"></p><p data-v-ab703648=\"\"></p><p data-v-ab703648=\"\"></p><p data-v-ab703648=\"\"></p><p data-v-ab703648=\"\"></p><p data-v-ab703648=\"\"></p><p data-v-ab703648=\"\"></p><p data-v-ab703648=\"\"></p><p data-v-ab703648=\"\"></p><p data-v-ab703648=\"\"></p><p data-v-ab703648=\"\"></p><p data-v-ab703648=\"\"></p><p data-v-ab703648=\"\"></p><p data-v-ab703648=\"\"></p><p data-v-ab703648=\"\"></p><p data-v-ab703648=\"\"></p><p data-v-ab703648=\"\"></p><p data-v-ab703648=\"\"></p><p data-v-ab703648=\"\"></p><p data-v-ab703648=\"\"></p><p data-v-ab703648=\"\"></p><p data-v-ab703648=\"\"></p><p data-v-ab703648=\"\"></p><p data-v-ab703648=\"\"></p><p data-v-ab703648=\"\"></p><p data-v-ab703648=\"\"></p><p data-v-ab703648=\"\"></p><p data-v-ab703648=\"\"></p><p data-v-ab703648=\"\"></p><p data-v-ab703648=\"\"></p><p data-v-ab703648=\"\"></p><p data-v-ab703648=\"\"></p><p data-v-ab703648=\"\"></p><p data-v-ab703648=\"\"></p><p data-v-ab703648=\"\"></p><p data-v-ab703648=\"\"></p><p data-v-ab703648=\"\"></p><p data-v-ab703648=\"\"></p><p data-v-ab703648=\"\"></p><p data-v-ab703648=\"\"></p><p data-v-ab703648=\"\"></p><p data-v-ab703648=\"\"></p><p data-v-ab703648=\"\"></p><p data-v-ab703648=\"\"></p><p data-v-ab703648=\"\"></p><p data-v-ab703648=\"\"></p><p data-v-ab703648=\"\"></p><p data-v-ab703648=\"\"></p><p data-v-ab703648=\"\"></p><p data-v-ab703648=\"\"></p><p data-v-ab703648=\"\"></p><p data-v-ab703648=\"\"></p><p data-v-ab703648=\"\"></p><p data-v-ab703648=\"\"></p><p data-v-ab703648=\"\"></p><p data-v-ab703648=\"\"></p><p data-v-ab703648=\"\"></p><p data-v-ab703648=\"\"></p><p data-v-ab703648=\"\"></p><p data-v-ab703648=\"\"></p><p data-v-ab703648=\"\"></p><p data-v-ab703648=\"\"></p><p', '');
INSERT INTO `information` VALUES (2, 1, '革新鲜花概念：品牌lover palace争做行业领头者', '短短5年时间，从加入行业到成立品牌，再到如今已经有了推动行业发展之力的loverpalace，凭借优质品质革新了行业内的鲜花的概念，势必会成为行业领头者。', '品牌追踪', 7, '2020-11-10', '/img/information/201807022005442637.png', '<p class=\"mytext\">都说鲜花是个传统行业，作为大众女神高圆圆表达出女生会主动买花给自己的观点后，就一度引发网上讨论热潮。因为大多数人眼里鲜花都是作为礼物进行赠送，除了节日很少看见。但其实随着人们经济能力的提高，使用鲜花装点生活是最简单、有效、低成本的方法。</p>\r\n<p class=\"mytext\">据数据表示：在荷兰，生活鲜花的消费比例占到60%，美国则大约30%-40%，但在我国经济高速发展的大环境下，鲜花为什么没能成为走进千家万户？品牌loverpalace认为：是国内鲜花行业仍不够成熟，市场有多方面待开掘。并且正式将生活需要鲜花的概念融入企业，走在了行业前沿。</p>\r\n<p class=\"mytext\"><strong>改变鲜花行业，以优质打开市场</strong></p>\r\n<p class=\"mytext\">刚刚踏入鲜花行业时，lover palace发现国内鲜花行业只停留在普通的“买入”、“卖出”，本身质量仅仅靠着原料支撑。对行业现象感到痛心的loverpalace，为了能给消费者提供真正优质的产品，让品牌不止保证了鲜花的优质原材料，从著名鲜花种植地：昆明进购，还采用了高级花艺手法的包装，由不同的搭配呈现出了不同优质花艺。结果不仅成功打开市场，还成为了行业前列。</p>\r\n<p class=\"mytext\"><strong>全国推行，两个小时极速配送</strong></p>\r\n<p class=\"mytext\">刚刚踏入鲜花行业时，loverpalace发现国内鲜花行业只停留在普通的“买入”、“卖出”，本身质量仅仅靠着原料支撑。对行业现象感到痛心的loverpalace，为了能给消费者提供真正优质的产品，让品牌不止保证了鲜花的优质原材料，从著名鲜花种植地：昆明进购，还采用了高级花艺手法的包装，由不同的搭配呈现出了不同优质花艺。结果不仅成功打开市场，还成为了行业前列。</p>\r\n<p class=\"mytext\">为了能给更多用户服务，品牌lover palace开设了线上店铺，接着又收到来自全国各地的鲜花需求。但鲜花不能承受快递的长时间“摧残”，要怎么才能更快的送到用户手中？loverpalace干脆同线下超过30000家实体配送店达成了合作，给出包括县级城市的全国用户承诺：2小时内绝对送达！</p>\r\n<p class=\"mytext\">短短5年时间，从加入行业到成立品牌，再到如今已经有了推动行业发展之力的lover palace，凭借优质品质革新了行业内的鲜花的概念，势必会成为行业领头者。</p>\r\n', '/img/information/201807022005442637.png');
INSERT INTO `information` VALUES (3, 1, '金风玉露一相逢 七夕不带一束恋咔鲜花怎么行', '“鲜花”之所以能在品类繁多的礼物中经久不衰，是因为每一种花都有属于自己独特的花语，这种互相传达爱意的“暗号”也是一种独特的甜蜜。让花在普通中彰显深情，不妨试逛逛恋咔。', '品牌追踪', 5, '2020-11-15', '/img/information/15324182654376.jpg', '<p class=\"mytext\">从《诗经》中的“贻我彤管”，到《踏莎行》的“鱼传尺素”，深厚的感情从非虚无。在恰当时机送出坦白心意的礼物，比物是人非时“锦书难托”好得多，这也是为什么世间如此多有情男女在七夕这天费尽心机挑选礼物的原因。</p>\r\n\r\n<p class=\"mytext\">据调查，多达半数的人表示在选择告白礼物时会选择买花。“鲜花”之所以能在品类繁多的礼物中经久不衰，是因为每一种花都有属于自己独特的花语，这种互相传达爱意的“暗号”也是一种独特的甜蜜。让花在普通中彰显深情，不妨试逛逛恋咔。</p>\r\n\r\n<p class=\"mytext\">它身袭荷兰海风，带来永恒爱意</p>\r\n<p class=\"mytext\">金风玉露一相逢，便胜却人间无数。千言万语无从说起，不妨试试恋咔隐藏的花语。七夕将至，不带一束恋咔鲜花怎么行?</p>\r\n\r\n<p class=\"mytext\">温柔的海风拂过，带来轻声呢喃;缓慢转动的风车下，有一大片郁金香的花田。馥郁缱绻的花香袭过相爱的人们，这是荷兰。</p>\r\n\r\n<p class=\"mytext\">不远万里从荷兰进口的郁金香，带来的是来自异域的爱情。郁金香的花语很甜：白色代表纯洁的爱、黄色代表高雅的爱、粉色代表永恒的爱、红色代表热切的爱、紫色代表无尽的爱、黑色代表神秘的爱……这些漂洋过海来到恋人手里的郁金香，是恋咔带来的异乡潮汐间的柔软细腻，是微风起伏风车下的丝丝甜蜜。</p>\r\n\r\n<p class=\"mytext\">不要忘记思念我，我还会回来</p>\r\n\r\n<p class=\"mytext\">据调查，有39%的情侣存在异地经历，“爱而不见”确实煎熬，但恋咔有办法通过一株花让你朝暮相思的那个人知晓你的心意。</p>\r\n\r\n<p class=\"mytext\">勿忘我的花语是“不要忘记思念我，我将归来给你幸福”，这对于异地恋的情侣来说无疑是相互体谅最缄默的表达方式，恋咔通过一系列专业程序处理，将勿忘我打造成了永不凋谢的干花，并以此代表亘古不变的爱意，祝愿天下有情人战胜困难终成眷属。</p>', '/img/information/15324182654376.jpg');
INSERT INTO `information` VALUES (4, 1, '永生花品牌有哪些 你最喜欢哪一个\r\n永生花品牌有哪些 你最喜欢哪一个', '永生花品牌有哪些 你最喜欢哪一个\r\n永生花有哪些品牌？永生花哪些品牌比较受欢迎？永生花十大品牌有：Roseonly 诺誓、Para Ella、ivenran 依雯然、The Beast 野兽派、 The One 唯忆、Dilove 蒂爱、Joy Flower、Shining Love 香微、MizHome 米子家居', '十大品牌', 4, '2020-11-20', '/img/information/1918522a9bee571839e0bea2e04dc716.png', '<p class=\"mytext\">\r\n永生花是一种经过特殊工艺加工而成的鲜花，这种花一般可延长保存寿命!比起寿命只有短短几天的鲜花，永生花现在更受大家的青睐!那么永生花哪个牌子比较好?下面由中国品牌网小编为您推荐永生花的十大品牌供您参考!\r\n</p>\r\n<p class=\"mytext\"><strong>一、Roseonly 诺誓</strong></p>\r\n<p class=\"mytext\">Roseonly的中文译名“诺誓”，为爱而诺，以花为誓，以表不变之心意——信者得爱，爱是唯一，此生不渝，此心可鉴。诺誓(北京)商业股份有限公司，2014年成立，爱情信物品牌，以“一生只送一人”的真爱理念与矜贵花材甄选、精湛的工艺与设计闻名于世，产品系列涵盖鲜花玫瑰、永生玫瑰、珠宝、香氛等领域。roseonly以传奇玫瑰灵感杰作引领时代风格，见证世间无数至臻浪漫的爱情故事。</p>\r\n产品推荐\r\n<p class=\"mytext\"><strong>商品名称：</strong>唯忆白夜花园</p>\r\n<p class=\"mytext\"><strong>鲜花主花材：</strong>玫瑰</p>\r\n<p class=\"mytext\"><strong>参考报价：</strong>520</p>\r\n<p class=\"mytext\"><strong>六、Dilove 蒂爱</strong></p>\r\n<p class=\"mytext\">dilove(蒂爱)，我们已经专注花艺思考向前不止十年。于时间里，我们每个人都在走向未来的旅程中，由手工DIY所承载的艺术本身就代表着一段走向未来的旅程。dilove这座秘密花园，和四方的你一起传递着诗与远方的存在，试图寻回那些单纯的美好。这就是dilove想诠释的蕴义。</p>\r\n<p class=\"mytext\"><strong>商品推荐</strong></p>\r\n<p class=\"mytext\"><strong>商品名称：</strong>DILOVE蒂爱 进口永生花礼盒</p>\r\n<p class=\"mytext\"><strong>鲜花主花材：</strong>玫瑰</p>\r\n<p class=\"mytext\"><strong>参考报价：</strong>198</p>\r\n<p class=\"mytext\"><strong>七、Joy Flower</strong></p>\r\n<p class=\"mytext\">Joy Flower，是一家以爱情和浪漫为主题的高端品牌互联网花店。我们是一群喜欢艺术，可以为您提供花礼解决方案。对园艺设计、婚礼、私人PARTY空间设计更有独特见解;热爱生活。</p>\r\n<p class=\"mytext\"><strong>商品推荐</strong></p>\r\n<p class=\"mytext\"><strong>商品名称：</strong>JoyFlower进口永生花</p>\r\n<p class=\"mytext\"><strong>鲜花主花材：</strong>玫瑰</p>\r\n<p class=\"mytext\"><strong>参考报价：</strong>339</p>\r\n<p class=\"mytext\"><strong>八、Shining Love 香微</strong></p>\r\n<p class=\"mytext\">香微隶上海香微花卉有限公司。经营业务包括花卉，树木，工艺礼品，服装服饰销售，园林设计，自有花卉租赁，花卉，树木种植，园林绿化工程，绿化养护，婚庆礼仪服务，商务信息咨询(除经纪)，展览展示服务，会务服务，从事货物进口及技术进口业务。</p>\r\n<p class=\"mytext\"><strong>商品推荐</strong></p>\r\n<p class=\"mytext\"><strong>商品名称：</strong>香微永生花 天使之翼</p>\r\n<p class=\"mytext\"><strong>鲜花主花材：</strong>玫瑰</p>\r\n<p class=\"mytext\"><strong>参考报价：</strong>319</p>\r\n<p class=\"mytext\"><strong>九、MizHome 米子家居</strong></p>\r\n<p class=\"mytext\">米子家居是米子国际贸易(上海)有限公司旗下家居品牌，创立于2010年，主要从事仿真花艺设计、布艺手作品、ZAKKA日式家居店。英文名：MIZ。“米、子”两个字合起来就是一个“籽”字，果实的含义。</p>\r\n<p class=\"mytext\"><strong>商品推荐</strong></p>\r\n<p class=\"mytext\"><strong>商品名称：</strong>米子家居 创意永', '/img/information/1918522a9bee571839e0bea2e04dc716.png');
INSERT INTO `information` VALUES (5, 2, '情人节送巧克力和鲜花的含义', '巧克力及其含义。。。。', '', 3, '2020-11-03', '/img/information/808526a254cc625a7874eb649f78dabf.png', '<p class=\"mytext\">巧克力及其含义<p class=\"mytext\">\r\n\r\n<p class=\"mytext\">榛子巧克力——忠贞<p class=\"mytext\">\r\n\r\n<p class=\"mytext\">果仁巧克力——可人<p class=\"mytext\">\r\n\r\n<p class=\"mytext\">酒心巧克力——与你共醉<p class=\"mytext\">\r\n\r\n<p class=\"mytext\">奶香巧克力——我的蜜糖<p class=\"mytext\">\r\n\r\n<p class=\"mytext\">其他鲜花及含义<p class=\"mytext\">\r\n\r\n<p class=\"mytext\">蔷薇——求爱<p class=\"mytext\">\r\n\r\n<p class=\"mytext\">满天星——爱怜<p class=\"mytext\">\r\n\r\n<p class=\"mytext\">百合——百年好和<p class=\"mytext\">\r\n\r\n<p class=\"mytext\">向日葵——爱慕<p class=\"mytext\">', '/img/information/808526a254cc625a7874eb649f78dabf.png');
INSERT INTO `information` VALUES (6, 2, '鲜花美容好计谋\r\n鲜花美容好计谋', '春天是花开的季节， 而回归自然的生态美容方式正悄然流行，“鲜花美容”已成为时尚。', '', 1, '2020-11-04', '/img/information/ae74979fdc9fe7bf27aeab9f3182268a.png', '<p class=\"mytext\">春天是花开的季节，而回归自然的生态美容方式正悄然流行，“鲜花美容”已成为时尚。</p>\r\n\r\n<p class=\"mytext\">桃花：</p>\r\n\r\n<p class=\"mytext\">桃花含蕾未放之时，采桃花250克、白芷30克，用白酒1000毫升密封浸泡30天，每日早晚各饮15—30毫升，同时将酒倒少许在手掌中，两掌搓至手心发热，来回揉搓面部，对黄褐斑、黑斑、面色晦暗等面部色素性疾病有较好效果。桃花中含有山奈、香豆精、三叶豆苷等有机化合物，这些物质能疏通经络，扩张末梢毛细血管，改善血液循环，促进皮肤营养和氧供给，滋润皮肤。桃花中还有多种维生素和微量元素，这些元素能防止黑色素在皮肤内慢性沉积，有效地清除体表中有碍美容的黄褐斑、雀斑、黑斑。桃花中还富含植物蛋白和多种呈游离状态的氨基酸，容易被皮肤吸收，对防治皮肤干燥、粗糙及皱纹等有益。</p>\r\n\r\n<p class=\"mytext\">李花：</p>\r\n\r\n<p class=\"mytext\">洁白秀美，味苦气清，外用可以除粉刺，面有光泽。李子汁和酒，古称“驻色酒”，可以美颜面，李核仁研末调鸡蛋清涂面，可治脸上黑斑。</p>', '/img/information/ae74979fdc9fe7bf27aeab9f3182268a.png');
INSERT INTO `information` VALUES (7, 2, '鲜花怎么保存\r\n鲜花怎么保存', '鲜花是当下流行元素，无论是结婚、约会时，必备的礼物，漂亮的鲜花，可以添加浪漫气氛，还不失男友的面子，让女友感受到浓浓的爱意，', '', 1, '2020-11-10', '/img/information/20140730015138370.png', '<p class=\"mytext\">鲜花是当下流行元素，无论是结婚、约会时，必备的礼物，漂亮的鲜花，可以添加浪漫气氛，还不失男友的面子，让女友感受到浓浓的爱意，那么，鲜花怎么保存，下面随小编看看，这些话语吧。</p>\r\n\r\n<p class=\"mytext\">花瓶养花盛水前一定要洗干净。水是切花保鲜的关键因素，吸水不足容易出现花和叶的萎蔫。对切花来讲，低pH值4-5比高pH值要好得多。但pH值过低(低于4)花茎就有可能褪色变软，如菊花。自来水水质一般呈中性，可以使用。水质差的水，其会降低花茎吸水，花开受阻，花期变短。</p>\r\n\r\n<p class=\"mytext\">花瓶选择有讲究花瓶的高度应该为花束长度的40%-60%，且使用可盛1升水以上的花瓶为好。所有的花瓶都可以做插花，但花瓶的质地影响鲜花的花期。玻璃花瓶效果最佳;水晶花瓶用的时间久了会产生小孔，易有细菌等微生物附着、不易清洗;优级的塑料花瓶因为具有超强的韧性、优越抗拉性能，即使长期使用也不会出现划痕，对液体、固体承载物质的相容性极为稳定、并且具有良好的抑菌功能极易清洗;可自由折叠，收纳方便，节省空间。</p>\r\n\r\n<p class=\"mytext\">我记得网上有个“吾爱”3D可折叠花瓶比较适合你哦!还可以按图插花DIY将收到的花组合搭配，其实我也是看了那里的说明，按图亲手DIY的，不防去看看。</p>', '/img/information/20140730015138370.png');
INSERT INTO `information` VALUES (8, 3, '鲜花店加盟选哪家好 这些优质的品牌你不得不看\r\n鲜花店加盟选哪家好 这些优质的品牌你不得不看', '鲜花的兴起，促进了鲜花店的发展。很多时候，鲜花店可以提供种类各样的鲜花。那么哪一家的鲜花店比较受欢迎呢？下面让我们来看一下有哪些值得加盟的优质品牌。', '', 5, '2020-11-20', '/img/information/747fd618449c8a21b6c892c1efdd5fe7.png', '<p class=\"mytext\">我们知道，鲜花是一种很实用的花卉植物。美丽的鲜花是我们探访亲友、恋爱约会、商务合作、居家装饰都少不了的必备品。送花是一门学问，送花也是一门艺术，用花来表达的语言实在太丰富了。鲜花的兴起，促进了鲜花店的发展。很多时候，鲜花店可以提供种类各样的鲜花。那么哪一家的鲜花店比较受欢迎呢？下面让我们来看一下有哪些值得加盟的优质品牌。</p>', '/img/information/747fd618449c8a21b6c892c1efdd5fe7.png');
INSERT INTO `information` VALUES (9, 3, '鲜花装饰生活品牌代理加盟\r\n鲜花装饰生活品牌代理加盟', '一花一世界，一叶一菩提。', '', 2, '2020-12-03', '/img/information/e55c24b328c27d31f55c7083df57f4ba.png', '<p class=\"mytext\">我们都知道，花是一种文化艺术象征，它被人们赋予了特定含义。随着现代人的知识文化水平逐渐增高，对鲜花的鉴赏种养能力也随之提高。是的，对于一些人来讲，种花是一种闲情逸致，也是一种心灵上的自我沉淀。现在花店行业，也已经普及开来，无论是婚礼，聚会，年会等大大小小的活动，都会有花的身影。加盟花店行业，将会有相当广泛的应用前景，那么我们加盟花店的时候，可以有哪些好的花店品牌可以选择呢？来看看这些值得推荐的花店加盟品牌吧！</p>', '/img/information/e55c24b328c27d31f55c7083df57f4ba.png');
INSERT INTO `information` VALUES (11, 2, '鲜花搭配无人货架，入驻线下商超', '无人零售火了。生鲜零食、水果饮品等产品，终于在最后一公里霸占了办公室人群的胃和钱包。', '无人销售', 1, '2020-12-19', '/img/information/57e24974-a16f-492c-87a4-2c48eb4d6574.jpg', '<p>无人零售火了。生鲜零食、水果饮品等产品，终于在最后一公里霸占了办公室人群的胃和钱包。</p><p>而目前，立足消费升级背景的鲜花电商平台亦呈良好发展趋势。数据显示，自2014年至今四年间，独立鲜花电商平台野兽派、最美花开、花点时间、roseonly等多家企业相继融资总额在6亿元左右。</p><p>如果鲜花业入局无人零售领域，将会有怎样的碰撞和火花？</p><h2><strong><b><font color=\"#c24f4a\">鲜花搭配无人货架，入驻线下商超</font></b></strong></h2><div><p>含羞草花业（以下简称含羞草）是传统鲜花消费领域的一员。公司成立10余年，与西安各大婚庆、庆典公司及个人等进行对接合作，以鲜花大型销售、品牌/庆典花艺策划等为业，依托自有品牌“含羞草花业”面向中高端人群提供花艺设计，并开拓了含羞草时尚婚礼、花艺培训等业务。</p><p>“鲜花不是刚需，更偏向情绪性的场景消费，因此传统花店转型要立足线下。”基于此理念，含羞草花业创始人高淳瑞欲将鲜花与无人零售结合，以开拓更多的消费场景。</p><p><b>无人货架+鲜花。</b>初运营阶段，公司计划在周围5-10KM内的人流密集地分析选址，主要选取KTV、商超进行入驻。高淳瑞告诉猎云网，公司与厂商定制了无人售货架，可供从陈列展示鲜花，也可通过电子屏进行个性化鲜花定制。</p><p>货架配备恒温箱，并计划展示、销售10个鲜花品类，定价在百元级，并根据入驻地点和销量进行后期调整。用户可自助购花，也可扫码关联店铺获取其他服务。</p><p>无人零售十分看重运营能力，含羞草如何匹配？</p><p>“我们初步计划进入40家左右的驻点，鲜花的供应和更换要按照人流量和销量进行更新，更换周期在3天左右。”高淳瑞表示，公司目前积累的供应能力可以满足初期运营中的更新、物流、维护等需求，后续推广中，会依据实际运营数据建立自己的供应团队。</p><p>据了解，含羞草无人货架和恒温箱的成本在6万元左右，鲜花毛利率为40-50%左右，该项目筹备了一年多，目前处于验收阶段。</p><p>除了商超，含羞草也瞄准了家庭、亲子的线下消费领域，欲结合人工智能技术进入该场景。</p><p><strong><b>家庭租摆+人工智能。</b></strong>区别于目前鲜花电商定位的办公室场景，含羞草将鲜花租摆定位在家庭领域。公司面向租摆消费用户，自主研发了移动应用，用户可通过移动端实时监测鲜花培育，并实现定时供水等功能。</p><p>租摆消费人群如何获取？高淳瑞表示，公司目前与当地幼儿协会定向对接，筛选中高端幼儿园等用户群体，与其对接鲜花租摆等各项服务，并通过他们辐射到社区、家长圈等群体中，从而开拓亲子鲜花消费市场。</p><p>据了解，家庭租摆的成本在千元左右，基本匹配中高端群体的消费能力。</p><p><img src=\"https://static.lieyunwang.com/upload2/file/201808/031527ucdhux.jpg\" style=\"max-width:100%;\"><br></p><h2><strong><b>竞争壁垒在于鲜花渠道成本</b></strong></h2><p>高淳瑞是陕西省婚庆行业协会副会长，这也使含羞草在各类业务的实际运营中掌握资源优势。</p><p>在2B端，公司对接了当地数十家体量、业务吞吐量较大的婚庆公司及庆典公司，还与当地大型宴会、活动举办方进行合作，为其定向提供花艺服务。</p><p>目前，公司在西安设立了4个门店，占地近400平方米，囊括线上运营、花艺培训、零售等业务，覆盖数十家上下游商家。</p><p>面对尚待深耕的市场，面对遍布的鲜花平台，含羞草的竞争壁垒何在？</p><p>一是渠道成本。“日常常见的鲜花门店以夫妻店为主，体量较小，难以消化大型订单”。</p><p>高淳瑞告诉猎云网，70%的门店在采购鲜花时，采购成本往往分散在种植地、经销商、物流、花卉市场等多个渠道，终端销售价格也水涨船高。含羞草的业务体量可支持种植地直接采购，省略了一定的中间成本。</p><p>二是新零售先发优势。结合协会资源，更全面地对接上下游服务商，在新零售项目落地时得以从多方面解决潜在问题和困难。</p><p>在后续布局中，含羞草将重点开拓线上渠道，通过接入微商城等第三方平台进行垂直对标用户的口碑转化，从而完善自主三级分销体系；同时，在新零售项目落地时同步布局自主供应体系，以接入第三方配送为主；此外，含羞草考虑以加盟模式将业务复制到其它城市。</p><p>盈利方面，目前年营收为百万级，由于开展新业务，目前收支未平衡。主要通过婚庆花艺服务、花艺培训等实现盈利。</p><p>西安含羞草婚庆服务有限公司成立于2012年4月', '/img/information/57e24974-a16f-492c-87a4-2c48eb4d6574.jpg');
INSERT INTO `information` VALUES (13, 2, '杨幂、刘诗诗、吴亦凡追捧，腾讯、IDG等加持，ROSEONLY魔力何在？', '杨幂、刘诗诗、吴亦凡追捧，腾讯、IDG等加持，ROSEONLY魔力何在？', '鲜花', 1, '2020-12-19', '/img/information/ff344088-2508-474c-84a0-50ec86085f65.jpg', '<p>迢迢牵牛星，皎皎河汉女。<br></p><p>2020年8月25日，七夕来临。如今，越来越多的年轻人愿意为中国传统节日买单，通过互赠礼物来表情达意。</p><p>商家自然不会错过这场盛宴。</p><p>诸多礼品在“七夕”概念的包装下备受关注，其中，最为沸腾的当属鲜花卖家。投中网注意到，互联网电商起家、凭借“一生只爱一人”的品牌理念迅速走红的ROSEONLY，在七夕期间的销量再次创下新高。</p><p>据了解，在刚刚过去的七夕，ROSEONLY实现线上爆发式增长，较去年同期增长201%，整体增长112%。实际上，在更早的西方情人节，即便疫情阴霾未散，ROSEONLY线上销量依然实现超20%的增长。</p><p>“半个娱乐圈都曾为其代言”的ROSEONLY，魔力何在？</p><h2><font color=\"#c24f4a\">杨幂、刘诗诗强势赋能，腾讯、IDG等资本加持</font></h2><p>ROSEONLY一出场就与众不同。</p><p>2013年1月4日，ROSEONLY成立，取“爱你一生一世”之意。2013年2月初，ROSEONLY官网上线，预售限量99束、单价999元、12支装情人节玫瑰。</p><p>彼时，ROSEONLY创始人，即曾任德同资本合伙人、参与投资过大众点评网、机锋网、英飞特（股票代码：300582）等项目的蒲易充分调动自己的圈内人脉，在社交平台展开了铺天盖地的宣传，搜狗CEO王小川、世纪佳缘创始人龚海燕、新希望集团刘畅都参与了转发。2013年2月10日，其情人节玫瑰被提前抢购一空。</p><p>随后，不止于商业圈的力挺，明星了成为传播主力。随着杨幂、章子怡、昆凌等人的晒单，ROSEONLY短时间名声大噪，订单也一日千里。</p><p>近年来，但凡是明星求婚、结婚的报道中总是不乏ROSEONLY的身影。</p><p>在周星驰的电影《美人鱼》中，邓超饰演的男主角向林允饰演的美人鱼求婚时，除了一颗真诚的心，还带了一束ROSEONLY经典朱砂玫瑰。在吴奇隆和刘诗诗的婚礼上，ROSEONLY更是出尽风头：“6架直升机空运到现场的50万支玫瑰”，“全球顶级婚礼大师设计的捧花”随着两位新人的婚礼火遍网络。</p><p>目前在ROSEONLY的众多忠实用户中，隐藏着很多大家熟悉的面孔，包括杨幂、李云迪、范冰冰、吴亦凡、汪峰、章子怡、李晨、昆凌、郑恺、刘诗诗、吴奇隆等。此时，“品牌也很好的借势了明星效应，最终逐步获得用户认可，再口碑传播形成更多消费者对品牌的信任和好感。”</p><p>多年来，资本对于 ROSEONLY也一直颇多厚爱。</p><p>CVSource投中数据显示，ROSEONLY设立之初便获得来自时尚集团及几位知名天使投资人的天使轮投资；2013年10月，ROSEONLY又获得了来自腾讯的A轮投资；2014年5月，IDG及Acccel 作为B轮投资人，向ROSEONLY投资数千万美元；2015年12月，ROSEONLY再获1.9亿元投资，投资方为元生资本等。</p><p>另据了解，2016年，ROSEONLY公司实现了盈利，并完成了股改。2017年，ROSEONLY成立集团，在上海推出GREYBOX精品咖啡，并独立完成一亿人民币对外融资。一年后，Tiffany也推出了咖啡品牌Bluebox cafe。</p><p>然而，ROSEONLY品牌创业之初，当提出“一生只爱一人”的概念时，投资同行们纷纷投来了质疑的目光。</p><p>他们认为，“在网上卖高端花，已经是很小众了，还限定送花者一生只能送一人，就更加小众了。”甚至有投资人向蒲易直言，“在婚姻死亡论盛行的时代还去做爱情唯一，简直就是一种‘找死’的行为。”</p><p>但是，在蒲易看来，ROSEONLY恰恰抓住了女人的心理。当顾客下单的同时，会得到象征承诺的“唯一真爱证明卡”，将誓言落笔为证，收礼人用手机扫一扫便能倾听对方在下单时留下的爱语，使ROSEONLY玫瑰已不同于一般鲜花，它们被叠加上了更多的意涵，完整地传递出了用户的情感诉求。</p><h2>不止于“贵”</h2><p>“一生只爱一人”为ROSEONLY做足了概念。</p><p>天猫数据显示，成立7年来，七夕、情人节等重要节日ROSEONLY连续7年位列行业细分类目销售第一名。目前，ROSEONLY已正式入驻美团、饿了么闪购平台，全国所有精品店上线营业，覆盖包括北京、上海、广州、武汉、成都、青岛、上海、深圳、沈阳等在内的20个城市。</p><p>“贵”一直是ROSEONLY留给消费者印象最深的品牌特征之一。</p><p>在目前的鲜花电商领域，ROSEONLY是唯一客单价超过一千元的品牌，其他第二名到第十名基本在300-500元。</p><p>在如此高昂的客单价下，单有概念是不够的，19支玫瑰', '/img/information/ff344088-2508-474c-84a0-50ec86085f65.jpg');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(6) NULL DEFAULT NULL,
  `goods_details` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单商品详情',
  `address_id` int(6) NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL COMMENT '0：已取消:1：:待审核 2：待付款 3 :已付款  4:派送中  5：待评价  6：已完成\r\n',
  `submit_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '提交订单时间',
  `pay_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付时间',
  `deliver_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '待发货' COMMENT '发货时间',
  `received_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '待发货' COMMENT '收货时间',
  `greeting_message` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '贺卡留言',
  `buyer_message` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '买家留言',
  `delivery_date` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '送达日期',
  `delivery_time` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '送达时间',
  `subscriber_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订购人',
  `subscriber_tel` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订购人电话',
  `pay_methods` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付方式： 1：微信  2：支付宝',
  `real_pay` decimal(10, 2) NULL DEFAULT NULL COMMENT '订单支付金额',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (17, 9, '{\"total\":219,\"goods_count\":1,\"goods\":[{\"id\":39,\"uid\":9,\"goods_id\":1,\"price\":219,\"count\":1,\"name\":\"爱的诺言\",\"src\":\"http://www.minggang.top:8000/img/goodlist/love1.jpg\",\"g_price\":219,\"original_price\":269,\"material\":\"\\r\\n红玫瑰19枝，白色腊梅2枝（如腊梅无货，则用白色石竹梅或满天星代替）\",\"ischecked\":true}]}', 9, 0, '2020/12/11 下午12:54:4', '2020/12/11 下午12:54:4', '待发货', '待发货', '该用户未填写', '该用户未填写', '12/24', '12:00', '明', '15347056211', '1', 219.00);
INSERT INTO `orders` VALUES (18, 9, '{\"total\":915,\"goods_count\":3,\"goods\":[{\"id\":40,\"uid\":9,\"goods_id\":6,\"price\":309,\"count\":1,\"name\":\"佳期如梦\",\"src\":\"http://www.minggang.top:8000/img/goodlist/love6.jpg\",\"g_price\":309,\"original_price\":359,\"material\":\"香槟玫瑰33枝，红豆搭配\",\"ischecked\":true},{\"id\":41,\"uid\":9,\"goods_id\":5,\"price\":448,\"count\":1,\"name\":\"念你一生\",\"src\":\"http://www.minggang.top:8000/img/goodlist/love5.jpg\",\"g_price\":448,\"original_price\":599,\"material\":\"66枝精品红玫瑰\",\"ischecked\":true},{\"id\":42,\"uid\":9,\"goods_id\":2,\"price\":158,\"count\":1,\"name\":\"爱意朦胧\",\"src\":\"http://www.minggang.top:8000/img/goodlist/love2.jpg\",\"g_price\":158,\"original_price\":189,\"material\":\"红玫瑰11枝，满天星，栀子叶搭配\",\"ischecked\":true}]}', 9, 3, '2020/12/11 下午2:00:50', '2020/12/11 下午2:00:50', '待发货', '待发货', '该用户未填写', '该用户未填写', '12/16', '12:15', '保密', '16655110499', '1', 915.00);
INSERT INTO `orders` VALUES (19, 9, '{\"total\":4193,\"goods_count\":7,\"goods\":[{\"id\":43,\"uid\":9,\"goods_id\":7,\"price\":599,\"count\":7,\"name\":\"相守一生\",\"src\":\"http://www.minggang.top:8000/img/goodlist/love7.jpg\",\"g_price\":599,\"original_price\":689,\"material\":\"33枝戴安娜、66枝红玫瑰、满天星外围\",\"ischecked\":true}]}', 9, 6, '2020/12/11 下午2:02:28', '2020/12/11 下午2:02:28', '待发货', '待发货', '该用户未填写', '该用户未填写', '12/20', '不限时段', '保密', '16612345678', '2', 4193.00);
INSERT INTO `orders` VALUES (20, 9, '{\"total\":326,\"goods_count\":1,\"goods\":[{\"id\":26,\"name\":\"喜气迎门（一对）\",\"title\":\"开业花篮\",\"src\":\"http://www.minggang.top:8000/img/goodlist/flowerbasket2.jpg\",\"price\":326,\"sales\":\"8936\",\"title_id\":4,\"isIndexShow\":\"1\",\"type_id\":3,\"original_price\":399,\"material\":\"各色扶郎花，1枝多头粉百合，香槟玫瑰4枝，散尾葵、剑叶搭配\",\"packaging\":\"红色棉纸包扎、单层开业花篮\",\"distribution\":\"全国送货上门，市区免运费\",\"attached\":\"下单填写留言，免费赠送贺卡\",\"goodsSwiperArr\":\"/img/goodsSwiper/xqym1.jpg\",\"goodsDetailsImgArr\":\"/img/goodsdetails/xqym1.jpg,/img/goodsdetails/xqym2.jpg,/img/goodsdetails/public.jpg\",\"suitable_scene\":\"6\"}]}', 9, 6, '2020/12/11 下午2:03:01', '2020/12/11 下午2:03:01', '待发货', '待发货', '该用户未填写', '该用户未填写', '12/30', '12:00', 'm', '15366551100', '1', 326.00);
INSERT INTO `orders` VALUES (21, 9, '{\"total\":568,\"goods_count\":1,\"goods\":[{\"id\":8,\"name\":\"幸福之约\",\"title\":\"爱情鲜花\",\"src\":\"http://www.minggang.top:8000/img/goodlist/love8.jpg\",\"price\":568,\"sales\":\"13458\",\"title_id\":1,\"isIndexShow\":\"1\",\"type_id\":1,\"original_price\":599,\"material\":\"99朵精品红玫瑰，外围红豆搭配\",\"packaging\":\"黑色高档包装\",\"distribution\":\"全国送货上门，市区免运费\",\"attached\":\"下单填写留言，免费赠送贺卡\",\"goodsSwiperArr\":\"/img/goodsSwiper/xfzy1.jpg,/img/goodsSwiper/xfzy2.jpg\",\"goodsDetailsImgArr\":\"/img/goodsdetails/xfzy1.jpg,/img/goodsdetails/xfzy2.jpg,/img/goodsdetails/public.jpg\",\"suitable_scene\":\"1,5\"}]}', 9, 6, '2020/12/11 下午2:22:24', '2020/12/11 下午2:22:24', '待发货', '待发货', '该用户未填写', '该用户未填写', '12/24', '不限时段', 'mg', '16612345678', '1', 568.00);
INSERT INTO `orders` VALUES (22, 9, '{\"total\":176,\"goods_count\":1,\"goods\":[{\"id\":10,\"name\":\"温馨时刻\",\"title\":\"友情鲜花\",\"src\":\"http://www.minggang.top:8000/img/goodlist/friendship2.jpg\",\"price\":176,\"sales\":\"12641\",\"title_id\":2,\"isIndexShow\":\"1\",\"type_id\":1,\"original_price\":229,\"material\":\"粉色康乃馨11枝，百合2枝\",\"packaging\":\"白色雪梨纸，米白色平面纸，粉色吊花压纹纸 银灰色缎带\",\"distribution\":\"全国送货上门，市区免运费\",\"attached\":\"下单填写留言，免费赠送贺卡\",\"goodsSwiperArr\":\"/img/goodsSwiper/wxsk1.jpg,/img/goodsSwiper/wxsk2.jpg,/img/goodsSwiper/wxsk3.jpg,/img/goodsSwiper/wxsk4.jpg\",\"goodsDetailsImgArr\":\"/img/goodsdetails/wxsk1.jpg,/img/goodsdetails/wxsk2.jpg,/img/goodsdetails/public.jpg\",\"suitable_scene\":\"3,2,4\"}]}', 9, 1, '2020/12/11 下午2:23:09', '2020/12/11 下午2:23:09', '待发货', '待发货', '该用户未填写', '该用户未填写', '12/24', '12:00', '明', '15312345678', '1', 176.00);
INSERT INTO `orders` VALUES (23, 9, '{\"total\":568,\"goods_count\":1,\"goods\":[{\"id\":8,\"name\":\"幸福之约\",\"title\":\"爱情鲜花\",\"src\":\"http://www.minggang.top:8000/img/goodlist/love8.jpg\",\"price\":568,\"sales\":\"13458\",\"title_id\":1,\"isIndexShow\":\"1\",\"type_id\":1,\"original_price\":599,\"material\":\"99朵精品红玫瑰，外围红豆搭配\",\"packaging\":\"黑色高档包装\",\"distribution\":\"全国送货上门，市区免运费\",\"attached\":\"下单填写留言，免费赠送贺卡\",\"goodsSwiperArr\":\"/img/goodsSwiper/xfzy1.jpg,/img/goodsSwiper/xfzy2.jpg\",\"goodsDetailsImgArr\":\"/img/goodsdetails/xfzy1.jpg,/img/goodsdetails/xfzy2.jpg,/img/goodsdetails/public.jpg\",\"suitable_scene\":\"1,5\"}]}', 9, 5, '2020/12/11 下午2:24:03', '2020/12/11 下午2:24:03', '待发货', '待发货', '该用户未填写', '该用户未填写', '12/22', '12:00', 'mg', '15612345678', '1', 568.00);
INSERT INTO `orders` VALUES (24, 9, '{\"total\":219,\"goods_count\":1,\"goods\":[{\"id\":1,\"name\":\"爱的诺言\",\"title\":\"爱情鲜花\",\"src\":\"http://www.minggang.top:8000/img/goodlist/love1.jpg\",\"price\":219,\"sales\":\"15367\",\"title_id\":1,\"isIndexShow\":\"1\",\"type_id\":1,\"original_price\":269,\"material\":\"\\r\\n红玫瑰19枝，白色腊梅2枝（如腊梅无货，则用白色石竹梅或满天星代替）\",\"packaging\":\"内层白底黑边丽染纸，外层深灰色雾面纸，白咖罗纹\",\"distribution\":\"全国送货上门，市区免运费\",\"attached\":\"下单填写留言，免费赠送贺卡\",\"goodsSwiperArr\":\"/img/goodsSwiper/1.jpg,/img/goodsSwiper/2.jpg,/img/goodsSwiper/3.jpg,/img/goodsSwiper/1.jpg,/img/goodsSwiper/4.jpg\",\"goodsDetailsImgArr\":\"/img/goodsdetails/aydetails1.jpg,/img/goodsdetails/aydetails2.jpg,/img/goodsdetails/public.jpg\",\"suitable_scene\":\"1,5,4\"}]}', 9, 3, '2020/12/11 下午7:27:25', '2020/12/11 下午7:27:25', '待发货', '待发货', '该用户未填写', '该用户未填写', '12/16', '22:00', 'm', '15312345678', '2', 219.00);
INSERT INTO `orders` VALUES (25, 9, '{\"total\":1053,\"goods_count\":6,\"goods\":[{\"id\":44,\"uid\":9,\"goods_id\":2,\"price\":158,\"count\":1,\"name\":\"爱意朦胧\",\"src\":\"http://www.minggang.top:8000/img/goodlist/love2.jpg\",\"g_price\":158,\"original_price\":189,\"material\":\"红玫瑰11枝，满天星，栀子叶搭配\",\"ischecked\":true},{\"id\":45,\"uid\":9,\"goods_id\":19,\"price\":179,\"count\":5,\"name\":\"挚爱一生\",\"src\":\"http://www.minggang.top:8000/img/goodlist/giftbox3.jpg\",\"g_price\":179,\"original_price\":239,\"material\":\"11枝戴安娜粉玫瑰，相思梅搭配，一对卡通小熊\",\"ischecked\":true}]}', 9, 3, '2020/12/11 下午7:28:21', '2020/12/11 下午7:28:21', '待发货', '待发货', '该用户未填写', '该用户未填写', '12/15', '不限时段', 'mg', '16612345678', '1', 1053.00);
INSERT INTO `orders` VALUES (26, 9, '{\"total\":377,\"goods_count\":2,\"goods\":[{\"id\":46,\"uid\":9,\"goods_id\":1,\"price\":219,\"count\":1,\"name\":\"爱的诺言\",\"src\":\"http://www.minggang.top:8000/img/goodlist/love1.jpg\",\"g_price\":219,\"original_price\":269,\"material\":\"\\r\\n红玫瑰19枝，白色腊梅2枝（如腊梅无货，则用白色石竹梅或满天星代替）\",\"ischecked\":true},{\"id\":47,\"uid\":9,\"goods_id\":4,\"price\":158,\"count\":1,\"name\":\"永恒回忆\",\"src\":\"http://www.minggang.top:8000/img/goodlist/love4.jpg\",\"g_price\":158,\"original_price\":359,\"material\":\"红玫瑰33枝，石竹梅外围点缀\",\"ischecked\":true}]}', 9, 2, '2020/12/11 下午7:40:31', '2020/12/11 下午7:40:31', '待发货', '待发货', '该用户未填写', '该用户未填写', '12/16', '14:00', 'mg', '16651234567', '2', 377.00);
INSERT INTO `orders` VALUES (27, 9, '{\"total\":596,\"goods_count\":3,\"goods\":[{\"id\":48,\"uid\":9,\"goods_id\":1,\"price\":219,\"count\":2,\"name\":\"爱的诺言\",\"src\":\"http://www.minggang.top:8000/img/goodlist/love1.jpg\",\"g_price\":219,\"original_price\":269,\"material\":\"\\r\\n红玫瑰19枝，白色腊梅2枝（如腊梅无货，则用白色石竹梅或满天星代替）\",\"ischecked\":true},{\"id\":49,\"uid\":9,\"goods_id\":2,\"price\":158,\"count\":1,\"name\":\"爱意朦胧\",\"src\":\"http://www.minggang.top:8000/img/goodlist/love2.jpg\",\"g_price\":158,\"original_price\":189,\"material\":\"红玫瑰11枝，满天星，栀子叶搭配\",\"ischecked\":true}]}', 9, 3, '2020/12/11 下午7:50:08', '2020/12/11 下午7:50:08', '待发货', '待发货', '该用户未填写', '该用户未填写', '12/17', '14:00', 'mg', '15312345678', '1', 596.00);
INSERT INTO `orders` VALUES (28, 9, '{\"total\":239,\"goods_count\":1,\"goods\":[{\"id\":3,\"name\":\"今生挚爱\",\"title\":\"爱情鲜花\",\"src\":\"http://www.minggang.top:8000/img/goodlist/love3.jpg\",\"price\":239,\"sales\":\"15454\",\"title_id\":1,\"isIndexShow\":\"1\",\"type_id\":1,\"original_price\":319,\"material\":\"19枝苏醒玫瑰，2枝粉色桔梗，0.3扎小雏菊，0.2扎栀子叶，0.2扎水晶草\",\"packaging\":\"白色雪梨纸5张，黑白竖条纹蝴蝶结\",\"distribution\":\"全国送货上门，市区免运费\",\"attached\":\"下单填写留言，免费赠送贺卡\",\"goodsSwiperArr\":\"/img/goodsSwiper/js1.jpg,/img/goodsSwiper/js2.jpg,/img/goodsSwiper/js3.jpg,/img/goodsSwiper/js4.jpg\",\"goodsDetailsImgArr\":\"/img/goodsdetails/js1.jpg,/img/goodsdetails/js2.jpg,/img/goodsdetails/public.jpg\",\"suitable_scene\":\"1,5,4\"}]}', 9, 3, '2020/12/17 下午3:27:12', '2020/12/17 下午3:27:12', '待发货', '待发货', '该用户未填写', '该用户未填写', '12/23', '不限时段', 'asd', '15312345678', '2', 239.00);
INSERT INTO `orders` VALUES (29, 9, '{\"total\":219,\"goods_count\":1,\"goods\":[{\"id\":1,\"name\":\"爱的诺言\",\"title\":\"爱情鲜花\",\"src\":\"http://127.0.0.1:3000/img/goodlist/love1.jpg\",\"price\":219,\"sales\":\"15367\",\"title_id\":1,\"isIndexShow\":\"1\",\"type_id\":1,\"original_price\":269,\"material\":\"\\r\\n红玫瑰19枝，白色腊梅2枝（如腊梅无货，则用白色石竹梅或满天星代替）\",\"packaging\":\"内层白底黑边丽染纸，外层深灰色雾面纸，白咖罗纹\",\"distribution\":\"全国送货上门，市区免运费\",\"attached\":\"下单填写留言，免费赠送贺卡\",\"goodsSwiperArr\":\"/img/goodsSwiper/1.jpg,/img/goodsSwiper/2.jpg,/img/goodsSwiper/3.jpg,/img/goodsSwiper/1.jpg,/img/goodsSwiper/4.jpg\",\"goodsDetailsImgArr\":\"/img/goodsdetails/aydetails1.jpg,/img/goodsdetails/aydetails2.jpg,/img/goodsdetails/public.jpg\",\"suitable_scene\":\"1,5,4\"}]}', 10, 1, '2020/12/19 上午10:00:4', '2020/12/19 上午10:00:4', '待发货', '待发货', '该用户未填写', '该用户未填写', '12/21', '不限时段', 'aadfga', '15312345678', '1', 219.00);
INSERT INTO `orders` VALUES (30, 9, '{\"total\":599,\"goods_count\":15,\"goods\":[{\"id\":54,\"uid\":9,\"goods_id\":7,\"price\":599,\"count\":1,\"name\":\"相守一生\",\"src\":\"http://127.0.0.1:3000/img/goodlist/love7.jpg\",\"g_price\":599,\"original_price\":689,\"material\":\"33枝戴安娜、66枝红玫瑰、满天星外围\",\"ischecked\":true}]}', 9, 3, '2020/12/21 上午9:22:33', '2020/12/21 上午9:22:33', '待发货', '待发货', '该用户未填写', '该用户未填写', '12/25', '不限时段', 'mg', '15612345678', '2', 599.00);
INSERT INTO `orders` VALUES (31, 9, '{\"total\":418,\"goods_count\":14,\"goods\":[{\"id\":53,\"uid\":9,\"goods_id\":9,\"price\":209,\"count\":2,\"name\":\"美好时光\",\"src\":\"http://127.0.0.1:3000/img/goodlist/friendship1.jpg\",\"g_price\":209,\"original_price\":259,\"material\":\"11枝戴安娜粉玫瑰，2枝多头白百合，白色相思梅5枝，栀子叶0.5扎\",\"ischecked\":true}]}', 9, 3, '2020/12/21 上午9:23:45', '2020/12/21 上午9:23:45', '待发货', '待发货', '该用户未填写', '该用户未填写', '12/30', '不限时段', 'mg', '15312345678', '2', 418.00);
INSERT INTO `orders` VALUES (32, 9, '{\"total\":239,\"goods_count\":12,\"goods\":[{\"id\":52,\"uid\":9,\"goods_id\":3,\"price\":239,\"count\":1,\"name\":\"今生挚爱\",\"src\":\"http://127.0.0.1:3000/img/goodlist/love3.jpg\",\"g_price\":239,\"original_price\":319,\"material\":\"19枝苏醒玫瑰，2枝粉色桔梗，0.3扎小雏菊，0.2扎栀子叶，0.2扎水晶草\",\"ischecked\":true}]}', 9, 3, '2020/12/21 上午9:29:51', '2020/12/21 上午9:29:51', '待发货', '待发货', '该用户未填写', '该用户未填写', '12/31', '不限时段', 'mg', '13612345678', '2', 239.00);
INSERT INTO `orders` VALUES (33, 9, '{\"total\":2409,\"goods_count\":11,\"goods\":[{\"id\":51,\"uid\":9,\"goods_id\":1,\"price\":219,\"count\":11,\"name\":\"爱的诺言\",\"src\":\"http://127.0.0.1:3000/img/goodlist/love1.jpg\",\"g_price\":219,\"original_price\":269,\"material\":\"\\r\\n红玫瑰19枝，白色腊梅2枝（如腊梅无货，则用白色石竹梅或满天星代替）\",\"ischecked\":true}]}', 9, 0, '2020/12/21 上午9:32:12', '2020/12/21 上午9:32:12', '待发货', '待发货', '该用户未填写', '该用户未填写', '12/25', '12:00', 'mg', '15312345678', '1', 2409.00);
INSERT INTO `orders` VALUES (34, 9, '{\"total\":448,\"goods_count\":1,\"goods\":[{\"id\":5,\"name\":\"念你一生\",\"title\":\"爱情鲜花\",\"src\":\"http://127.0.0.1:3000/img/goodlist/love5.jpg\",\"price\":448,\"sales\":\"19578\",\"title_id\":1,\"isIndexShow\":\"1\",\"type_id\":1,\"original_price\":599,\"material\":\"66枝精品红玫瑰\",\"packaging\":\"黑色雪梨纸，黑色条纹纸，玻璃纸卷，酒红色缎带花结\",\"distribution\":\"全国送货上门，市区免运费\",\"attached\":\"下单填写留言，免费赠送贺卡\",\"goodsSwiperArr\":\"/img/goodsSwiper/nnys1.jpg,/img/goodsSwiper/nnys2.jpg,/img/goodsSwiper/nnys3.jpg,/img/goodsSwiper/nnys4.jpg\",\"goodsDetailsImgArr\":\"/img/goodsdetails/nnys1.jpg,/img/goodsdetails/nnys2.jpg,/img/goodsdetails/public.jpg\",\"suitable_scene\":\"1,5,4\"}]}', 9, 3, '2020/12/21 上午9:34:11', '2020/12/21 上午9:34:11', '待发货', '待发货', '该用户未填写', '该用户未填写', '12/26', '14:00', 'mg', '15312345678', '2', 448.00);

-- ----------------------------
-- Table structure for shoppingCar
-- ----------------------------
DROP TABLE IF EXISTS `shoppingCar`;
CREATE TABLE `shoppingCar`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(5) NOT NULL,
  `goods_id` int(5) NOT NULL,
  `price` decimal(10, 2) NOT NULL,
  `count` int(3) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 57 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of shoppingCar
-- ----------------------------
INSERT INTO `shoppingCar` VALUES (55, 9, 8, 568.00, 1);
INSERT INTO `shoppingCar` VALUES (56, 9, 1, 219.00, 2);

-- ----------------------------
-- Table structure for suitable_scene
-- ----------------------------
DROP TABLE IF EXISTS `suitable_scene`;
CREATE TABLE `suitable_scene`  (
  `sid` int(3) NOT NULL AUTO_INCREMENT,
  `sname` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`sid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of suitable_scene
-- ----------------------------
INSERT INTO `suitable_scene` VALUES (1, '送恋人');
INSERT INTO `suitable_scene` VALUES (2, '送长辈');
INSERT INTO `suitable_scene` VALUES (3, '送亲友');
INSERT INTO `suitable_scene` VALUES (4, '生日祝福');
INSERT INTO `suitable_scene` VALUES (5, '求婚表白');
INSERT INTO `suitable_scene` VALUES (6, '商务开业');
INSERT INTO `suitable_scene` VALUES (7, '装饰绿植');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `username` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `superPassword` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '000000',
  `permissions` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '0:用户     9:超级管理员',
  `isOnline` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact STORAGE DISK;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'root', 'b7f2967fe88af302643806cb0cc85f9b', '000000', '9', '1');
INSERT INTO `user` VALUES (9, 'mg123', 'b7f2967fe88af302643806cb0cc85f9b', '333333', '0', '1');
INSERT INTO `user` VALUES (10, 'mg8200', 'b7f2967fe88af302643806cb0cc85f9b', '123456', '0', '1');
INSERT INTO `user` VALUES (14, 'mg666', 'b7f2967fe88af302643806cb0cc85f9b', '000000', '0', '1');
INSERT INTO `user` VALUES (15, 'mg333', 'e1fde7135dc1a5316978b04bfff6ed69', '000000', '0', '1');

SET FOREIGN_KEY_CHECKS = 1;
