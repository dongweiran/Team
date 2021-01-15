#设置客户端连接服务器端的编码为UTF-8
SET NAMES UTF8;
#丢弃数据库，如果存在
DROP DATABASE IF EXISTS  health;
#创建新的数据库,设置存储编码为UTF-8
CREATE DATABASE  health CHARSET=UTF8;
#进入该数据库
USE  health;
#创建保存数据的表
--个人中心模块
-- 用户信息表
CREATE TABLE `users`(
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID，主键且自增',
  `username` VARCHAR(16) NOT NULL COMMENT '用户名 唯一',
  `password` VARCHAR(32) NOT NULL COMMENT '密码 MD5',
  `nickname` VARCHAR(30) NOT NULL COMMENT '用户昵称',
  `avatar`   VARCHAR(50) NOT NULL DEFAULT 'unamed.jpg' COMMENT '用户头像',
  `health_collect` mediumint(10) NOT NULL DEFAULT '30' COMMENT '用户收藏商品数量',
  `health_number` mediumint(9) NOT NULL DEFAULT '10' COMMENT '用户发表的文章数量',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `nickname` (`nickname`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
#插入数据
LOCK TABLES `users` WRITE;

INSERT INTO `users` (`id`,`username`,`password`,`nickname`,`avatar`,`health_collect`,`health_number`)   VALUES (1,'joy','12345406','心动夏天','null','3','12'),
(2,'tom','1234567','风年','null','5','22'),
(3,'tian','1234568','风吹过脸庞','null','3','2'),
(4,'qinaxi','0123456','秀发飘飘','null','2','14'),
(5,'junkai','123456','听风','null','4','8'),
(6,'jay','1234544','晚霞','null','11','34'),
(7,'pet','1234544','夜晚的星空','null','1','12');
UNLOCK TABLES;
#购物车模块
CREATE TABLE `test` (
  `id` smallint(5) AUTO_INCREMENT COMMENT '类型id 主键且自增',
  `info_name` varchar(30) NOT NULL COMMENT '商品状态名称 唯一',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `info_name` (`info_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
-----
INSERT INTO `test` VALUES (1, '待付款');
INSERT INTO `test` VALUES (4, '待发货');
INSERT INTO `test` VALUES (2, '待收货');
INSERT INTO `test` VALUES (5, '已收货');
INSERT INTO `test` VALUES (3, '待评价');

-- -----------
--
--------------
#商品分类表
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_img` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `classify` VARCHAR(8) CHARACTER SET utf8 COLLATE utf8_general_ci ,
  PRIMARY KEY (`id`) USING BTREE
)ENGINE = InnoDB AUTO_INCREMENT =10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT =Dynamic;

-----
-----

INSERT INTO `category` VALUES(1,'https://img.alicdn.com/imgextra/i3/1646579318/O1CN01mETKiR2Ihh9AN0PS8_!!0-item_pic.jpg_430x430q90.jpg','减脂推荐');
INSERT INTO `category` VALUES(2,'https://img.alicdn.com/imgextra/https://img.alicdn.com/imgextra/i2/2200715859777/O1CN01MeYGGq2M5uyDSIc96_!!2200715859777.jpg_430x430q90.jpg','运动设备');
INSERT INTO `category` VALUES(3,'https://img.alicdn.com/imgextra/https://img.alicdn.com/bao/uploaded/i1/1653731630/O1CN01TP25Vh1NuaDLshycN_!!1653731630.jpg_430x430q90.jpg','健康家居');
INSERT INTO `category` VALUES(4,'https://img.alicdn.com/imgextra/https://img.alicdn.com/imgextra/i2/2112920217/O1CN01uajVJo1DTQaf21ChR_!!2112920217.jpg_430x430q90.jpg','健身食物');
INSERT INTO `category` VALUES(5,'https://img.alicdn.com/imgextra/i1/2962332750/O1CN01tLHqlU1WBXoF6CCGd_!!2962332750.jpg_430x430q90.jpg','健康体检');
INSERT INTO `category` VALUES(6,'https://img.alicdn.com/imgextra/i1/2206554538131/O1CN01yiTNks29w321RWv8l_!!0-item_pic.jpg_430x430q90.jpg','健康服务');
INSERT INTO `category` VALUES(7,'https://img.alicdn.com/imgextra/i4/2208311209044/O1CN017wXT2U2GgCdMXcc4x_!!2208311209044.jpg_400x400.jpg','健康套餐');
INSERT INTO `category` VALUES(8,'https://img.alicdn.com/imgextra/i4/90919986/O1CN01iW2OaM2NddlFKbQXv_!!0-item_pic.jpg_430x430q90.jpg','健康护肤');

#商品详情表
CREATE TABLE `product` (
  `cid` int(10) unsigned Not NULL AUTO_INCREMENT COMMENT '商品编号 主键且自增',
  `subject` VARCHAR(50) Not NULL COMMENT '商品名称',
  `subhead` VARCHAR(50) DEFAULT NULL COMMENT '商品副标题',
  `img_big` VARCHAR(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `img_content` VARCHAR(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `img_contents` VARCHAR(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `img_contentss` VARCHAR(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `img_contentsss` VARCHAR(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` int(11) NULL DEFAULT NULL COMMENT '商品折后价格',
  `p_discount` int(11) NULL DEFAULT NULL COMMENT '商品原价格价格',
  `sales` int(11) NULL DEFAULT NULL COMMENT '累计销售数量',
  `category_id` int(11) COMMENT '商品所属分类 关联category',
  PRIMARY KEY (`cid`) USING BTREE,
  FOREIGN KEY (`category_id`)  REFERENCES `category`(`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;
---
---
INSERT INTO `product` VALUES(1,'西麦 纯燕麦片1480g即速食冲饮无蔗糖健身代早餐营养学生懒人食品','纤享代餐 新客之选 膳食纤维 肠胃舒畅','https://img.alicdn.com/imgextra/i3/1646579318/O1CN01mETKiR2Ihh9AN0PS8_!!0-item_pic.jpg_430x430q90.jpg','https://img.alicdn.com/imgextra/i1/1646579318/O1CN014t8sG92IhhAMEmTd7_!!1646579318.jpg','https://img.alicdn.com/imgextra/i3/1646579318/O1CN01D6K1LF2IhhA6s2LgW_!!1646579318.jpg','https://img.alicdn.com/imgextra/i2/1646579318/O1CN01sTEvrg2IhhA6s6Ar0_!!1646579318.jpg','https://img.alicdn.com/imgextra/i2/1646579318/O1CN01oivWuM2IhhA5k2hwR_!!1646579318.jpg',29,49,85120,1
);
INSERT INTO `product` VALUES(2,'ffit8代餐能量蛋白棒乳清粥粉饱腹早餐食品蛋白运动代餐棒',null,'https://img.alicdn.com/imgextra/i2/2206526701854/O1CN014tLAxG1PZAxGXud47_!!2206526701854.jpg_430x430q90.jpg','https://img.alicdn.com/imgextra/i4/2206526701854/O1CN01WMEzO71PZAx7oEHTX_!!2206526701854.jpg','https://img.alicdn.com/imgextra/i3/2206526701854/O1CN01QyUQ7K1PZAxCrruvz_!!2206526701854.jpg','https://img.alicdn.com/imgextra/i3/2206526701854/O1CN0115MKCX1PZAxCSNdXe_!!2206526701854.jpg','https://img.alicdn.com/imgextra/i1/2206526701854/O1CN01v8Btao1PZAxBYhJRh_!!2206526701854.jpg',169,299,1354,1
);
INSERT INTO `product` VALUES(3,'买1发3水果坚果燕麦片营养早餐即食冲饮酸奶果粒代餐饱腹速食食品',null,'https://img.alicdn.com/imgextra/https://img.alicdn.com/imgextra/i2/2112920217/O1CN01uajVJo1DTQaf21ChR_!!2112920217.jpg_430x430q90.jpg','https://img.alicdn.com/imgextra/i4/2112920217/O1CN01Yeu64Q1DTQZpS2DY3_!!2112920217.jpg','https://img.alicdn.com/imgextra/i3/2112920217/O1CN01XqyVUI1DTQZqj1PJr_!!2112920217.jpg','https://img.alicdn.com/imgextra/i3/2112920217/O1CN01eDRfli1DTQZrjcj1F_!!2112920217.jpg','https://img.alicdn.com/imgextra/i4/2112920217/O1CN01aGeeUh1DTQa7le5LT_!!2112920217.jpg',34,128,3548,1
);
INSERT INTO `product` VALUES(4,'若米无糖魔芋宽面条低碳糖尿病人主食生酮凉皮低脂低卡代餐食品','低碳水生酮无糖精低糖尿饼人孕妇零食品早餐','https://img.alicdn.com/imgextra/i2/2209005683628/O1CN017YtebX1cffZDHw5PZ_!!2209005683628.jpg_430x430q90.jpg','https://img.alicdn.com/imgextra/i4/2209005683628/O1CN01VYhpET1cffXvCfW5q_!!2209005683628.jpg','https://img.alicdn.com/imgextra/i3/2209005683628/O1CN01A0xyaC1cffZEXvKoH_!!2209005683628.jpg','https://img.alicdn.com/imgextra/i2/2209005683628/O1CN01P6OAZa1cffZFTzxOw_!!2209005683628.jpg','https://img.alicdn.com/imgextra/i2/2209005683628/O1CN01zwTiTs1cffZHP6cF1_!!2209005683628.jpg',39,99,11354,1
);
INSERT INTO `product` VALUES(5,'薏米红豆燕麦全麦代餐饼干低0压缩脂卡热量粗粮饱腹无糖精零食品','无添加蔗糖全麦粗粮杂粮 轻卡饱腹','https://img.alicdn.com/imgextra/i3/735580970/O1CN01FA53NS1J2InbieNSI_!!735580970.jpg','https://img.alicdn.com/imgextra/i3/735580970/O1CN01qlAWCq1J2Inbif386_!!735580970.jpg','https://img.alicdn.com/imgextra/i4/735580970/O1CN01nD5Y271J2InYbvW6M_!!735580970.jpg','https://img.alicdn.com/imgextra/i4/735580970/O1CN01nD5Y271J2InYbvW6M_!!735580970.jpg','https://img.alicdn.com/imgextra/i4/735580970/O1CN01iiwDtS1J2IneONqrm_!!735580970.jpg',24,90,354,1
);
INSERT INTO `product` VALUES(6,'SmealNOTO代餐粉代餐奶昔蛋白膳食饱腹食品全营养30瓶装',null,'https://img.alicdn.com/imgextra/i3/2200807254153/O1CN01RqE8SW1gY7VG3cQAr_!!2200807254153.jpg_430x430q90.jpg','https://img.alicdn.com/imgextra/i1/2200807254153/O1CN01JvHgpP1gY7UtX9RrA_!!2200807254153.jpg','https://img.alicdn.com/imgextra/i3/2200807254153/O1CN01kKZ6BD1gY7V7s94SJ_!!2200807254153.jpg','https://img.alicdn.com/imgextra/i3/2200807254153/O1CN01F1bNg11gY7UqpNdKk_!!2200807254153.jpg','https://img.alicdn.com/imgextra/i1/2200807254153/O1CN01RyBfRw1gY7UpCC35Y_!!2200807254153.jpg',499,1459,12354,1
);
INSERT INTO `product` VALUES(7,'【25袋】丸妃二倍鸡胸肉健身代餐即食低脂碳水无蔗糖零食生酮食品',null,'https://gd4.alicdn.com/imgextra/i3/2204170885969/O1CN017lVwaa1txqlApNJah_!!2204170885969.jpg_400x400.jpg','https://img.alicdn.com/imgextra/i4/2204170885969/O1CN01PjZ5Bp1txqj1fUroT_!!2204170885969.jpg','https://img.alicdn.com/imgextra/i3/2204170885969/O1CN01dSBefK1txqizdMyAF_!!2204170885969.jpg','https://img.alicdn.com/imgextra/i3/2204170885969/O1CN01t4CjyB1txqir4L2Ji_!!2204170885969.jpg','https://img.alicdn.com/imgextra/i4/2204170885969/O1CN01EI7bg11txqj0nqki6_!!2204170885969.jpg',69,348,11245,1
);
INSERT INTO `product` VALUES(8,'【K姐推荐】WonderLab小蓝瓶益生菌 大人儿童调理肠胃肠道冻干粉',null,'https://img.alicdn.com/imgextra/i2/2200662002307/O1CN01V89X6r1SueLDp3dRh_!!2200662002307-2-lubanu-s.png_430x430q90.jpg','https://img.alicdn.com/imgextra/i4/2200662002307/O1CN01Z35zvB1SueN9kJdQ8_!!2200662002307.png','https://img.alicdn.com/imgextra/i1/2200662002307/O1CN01Rx1Ozw1SueN5lQRDx_!!2200662002307.png','https://img.alicdn.com/imgextra/i4/2200662002307/O1CN015xbWXk1SueMzs3edt_!!2200662002307.png','https://img.alicdn.com/imgextra/i4/2200662002307/O1CN01Uxi2bh1SueN9kIQa5_!!2200662002307.png',169-609,1000,10354,1
);
INSERT INTO `product` VALUES(9,'吉根纯黄豆黑豆豆浆粉无添加不加糖现磨口感即食早餐黄豆黑豆浆粉','无添加 不加糖 香醇可口','https://img.alicdn.com/imgextra/i1/2104795463/O1CN01RCxnBw1qE6GKrZmhb_!!2104795463.jpg_430x430q90.jpg','https://img.alicdn.com/imgextra/i1/2104795463/O1CN011ZxcLI1qE6GOHJk6Q_!!2104795463.jpg','https://img.alicdn.com/imgextra/i1/2104795463/O1CN01NMHR5w1qE6GPWlbSf_!!2104795463.jpg','https://img.alicdn.com/imgextra/i4/2104795463/O1CN01P90zcg1qE6GJgqYxV_!!2104795463.jpg','https://img.alicdn.com/imgextra/i4/2104795463/O1CN01YVzX3o1qE6GKfQfUI_!!2104795463.jpg',17,45,135411,1
);
INSERT INTO `product` VALUES(10,'绿瘦代餐能量棒减粗粮脂卡餐压缩早餐代餐饼干零食热量食品代餐棒','推荐买5发10 中国国家跳水队官方合作伙伴','https://img.alicdn.com/imgextra/https://img.alicdn.com/imgextra/i4/758489962/O1CN01xmJqGJ2NSeFXwn62d_!!758489962.jpg_430x430q90.jpg','https://img.alicdn.com/imgextra/i3/758489962/O1CN01v9SIJE2NSeE0neixz_!!758489962.jpg','https://img.alicdn.com/imgextra/i2/758489962/O1CN01bMxM0N2NSeAU6WU6g_!!758489962.jpg','https://img.alicdn.com/imgextra/i3/758489962/O1CN01094SlR2NSeASd3hIB_!!758489962.jpg','https://img.alicdn.com/imgextra/i2/758489962/O1CN01OeQp3k2NSe9vqUXoF_!!758489962.jpg',59,338,4678,1
);
INSERT INTO `product` VALUES(11,'【热巴同款】Swisse斯维诗乳清蛋白粉香草味改善体质成人蛋白粉','大豆蛋白有效期至2021年9月，介意者慎拍','https://img.alicdn.com/imgextra/i2/3203912792/O1CN01WC8put1WUmT4xp3sM_!!0-item_pic.jpg_430x430q90.jpg','https://img.alicdn.com/imgextra/i3/3203912792/O1CN01BrGdGY1WUmScTDZsg_!!3203912792.jpg','https://img.alicdn.com/imgextra/i1/3203912792/O1CN01BsADlF1WUmSbWp18i_!!3203912792.jpg','https://img.alicdn.com/imgextra/i4/3203912792/O1CN01itfnPE1WUmSb9nwCh_!!3203912792.jpg','https://img.alicdn.com/imgextra/i2/3203912792/O1CN01S3vss41WUmSeOLe0m_!!3203912792.jpg',239,499,5400,1
);
INSERT INTO `product` VALUES(12,'三日断糖餐防弹咖啡生酮鸡胸肉牛肉代餐轻断食健身餐轻食即食套餐',null,'https://gd2.alicdn.com/imgextra/i3/3440624079/O1CN01g8dYEq1g0EC3lDnBm_!!3440624079.jpg_400x400.jpg','https://img.alicdn.com/imgextra/i2/3440624079/O1CN0151pFdP1g0EC2op0OZ_!!3440624079.jpg','https://img.alicdn.com/imgextra/i2/3440624079/O1CN017v3iEZ1g0ECpi9aw7_!!3440624079.jpg','https://img.alicdn.com/imgextra/i4/3440624079/O1CN01Qia74n1g0EC3AhSYI_!!3440624079.jpg','https://img.alicdn.com/imgextra/i2/3440624079/O1CN01S6aC8a1g0EBwOYPYS_!!3440624079.jpg',98,198,13543,1
);
INSERT INTO `product` VALUES(13,'【12餐轻食代餐】超级零控卡断糖餐量贩12盒 魔芋粗粮快手餐速食',null,'https://img.alicdn.com/imgextra/https://img.alicdn.com/imgextra/i2/2200863423968/O1CN01OuEckD1fBOEPMuv2r_!!2200863423968.jpg_430x430q90.jpg','https://img.alicdn.com/imgextra/i1/2200863423968/O1CN01wIHvSm1fBOEOBMxMt_!!2200863423968.jpg','https://img.alicdn.com/imgextra/i4/2200863423968/O1CN01oOfy0Q1fBOEN6mSDz_!!2200863423968.jpg','https://img.alicdn.com/imgextra/i4/2200863423968/O1CN014sDDvy1fBOESyOyQ5_!!2200863423968.jpg','https://img.alicdn.com/imgextra/i4/2200863423968/O1CN01QTANxi1fBOEN6luxS_!!2200863423968.jpg',329,329,1789,1
);
INSERT INTO `product` VALUES(14,'理想燃料1+4断糖计划饱腹代餐能量棒生酮代餐食品套装',null,'https://img.alicdn.com/imgextra/i2/4071478519/O1CN01r1lpml2CnkgYA8kuM_!!4071478519.jpg_430x430q90.jpg','https://img.alicdn.com/imgextra/i1/4071478519/O1CN01DvmdDw2CnkggOuV16_!!4071478519.jpg','https://img.alicdn.com/imgextra/i3/4071478519/O1CN01XsbmrT2Cnkgf777oE_!!4071478519.jpg','https://img.alicdn.com/imgextra/i2/4071478519/O1CN01TMQ2rm2CnkgZAU9YG_!!4071478519.jpg','https://img.alicdn.com/imgextra/i3/4071478519/O1CN01wH0hHB2Cnkh9lDGqc_!!4071478519.jpg',288,576,654,1
);
INSERT INTO `product` VALUES(15,'杂粮先生 烘焙坚果水果燕麦片 即食早餐速食麦片懒人代餐饱腹食品','双罐组合 干吃冲泡/花样吃法','https://img.alicdn.com/imgextra/https://img.alicdn.com/imgextra/i2/762536596/O1CN019xStaW1yb11UmRQWg_!!762536596.jpg_430x430q90.jpg','https://img.alicdn.com/imgextra/i3/762536596/O1CN01bx00NZ1yb16RsvL6l_!!762536596.jpg','https://img.alicdn.com/imgextra/i2/762536596/O1CN01ZUR6Y61yb16S7zOEC_!!762536596.jpg','https://img.alicdn.com/imgextra/i2/762536596/O1CN01C6gesD1yb16Xkz64o_!!762536596.jpg','https://img.alicdn.com/imgextra/i3/762536596/O1CN01GlO9T21yb16T4E9W7_!!762536596.jpg',38,99,13540,1
);
INSERT INTO `product` VALUES(16,'WonderLab白芸豆膳食纤维粉小绿条菊粉清肠胃无糖青桔柠檬味1盒装',null,'https://img.alicdn.com/imgextra/https://img.alicdn.com/imgextra/i2/2200662002307/O1CN01acZWZ61SueLlrKTDu_!!2200662002307.png_430x430q90.jpg','https://img.alicdn.com/imgextra/i4/2200662002307/O1CN01isbtLL1SueKVKd1G8_!!2200662002307.png','https://img.alicdn.com/imgextra/i1/2200662002307/O1CN01XHeL9L1SueKX3ojUq_!!2200662002307.png','https://img.alicdn.com/imgextra/i2/2200662002307/O1CN01dK45BW1SueKTAV7w3_!!2200662002307.png','https://img.alicdn.com/imgextra/i2/2200662002307/O1CN01IUtZ7z1SueNIGPgcN_!!2200662002307.png',99,199,13504,1
);
INSERT INTO `product` VALUES(17,'小鸡收腹旗舰店健身代餐即食低鸡胸肉丸脂卡餐刷脂小零食品','刷脂大礼包，营养均衡。下单立减20元!','https://img.alicdn.com/imgextra/i4/2201232206816/O1CN01HRA9tZ20DmDlZ8WXE_!!2201232206816.jpg','https://img.alicdn.com/imgextra/i2/2201232206816/O1CN0107SKhU20DmDiWFVdG_!!2201232206816.jpg','https://img.alicdn.com/imgextra/i2/2201232206816/O1CN01QGDvl120DmDoM1Hbg_!!2201232206816.jpg','https://img.alicdn.com/imgextra/i3/2201232206816/O1CN01XKnUOc20DmDjDiISC_!!2201232206816.jpg','https://img.alicdn.com/imgextra/i4/2201232206816/O1CN01OUEHpJ20DmDeslIp0_!!2201232206816.jpg',89,209,1354,1
);

INSERT INTO `product` VALUES(18,'【双旦礼盒】益生菌代餐补充剂 30天+巴西莓养颜套餐30天',null,'https://img.alicdn.com/imgextra/i2/2966640448/O1CN01yKpfLR1FBE5KRByd8_!!0-item_pic.jpg_430x430q90.jpg','https://img.alicdn.com/imgextra/i2/2966640448/O1CN01yAgkYS1FBE38Zysmh_!!2966640448.jpg','https://img.alicdn.com/imgextra/i1/2966640448/O1CN01XU9W2N1FBE3EchZxy_!!2966640448.jpg','https://img.alicdn.com/imgextra/i2/2966640448/O1CN016j2Lvo1FBE3Gq5b9c_!!2966640448.jpg','https://img.alicdn.com/imgextra/i4/2966640448/O1CN014O8Jj41FBE3C2TgRa_!!2966640448.jpg',839,1058,7,1
);
INSERT INTO `product` VALUES(19,'超级补丁抱紧一生君脂肪碳水白芸豆阻断剂布丁冲饮益生菌粉',null,'https://img.alicdn.com/imgextra/https://img.alicdn.com/imgextra/i2/2207319853943/O1CN01FoR7xn1ezwJTNb3EE_!!2207319853943.jpg_430x430q90.jpg','https://img.alicdn.com/imgextra/i3/2207319853943/O1CN01aYKZrk1ezwJWQtyDi_!!2207319853943.jpg','https://img.alicdn.com/imgextra/i4/2207319853943/O1CN01eoubgL1ezwJSoQvVN_!!2207319853943.jpg','https://img.alicdn.com/imgextra/i2/2207319853943/O1CN013NEJHk1ezwJaETMYj_!!2207319853943.jpg','https://img.alicdn.com/imgextra/i3/2207319853943/O1CN01GzdfYr1ezwL3TB46k_!!2207319853943.jpg',239,299,100,1
);
INSERT INTO `product` VALUES(20,'沙拉鸡胸肉健身代餐即食食品高蛋白脯断一周轻速无油低脂零食解馋','无淀粉鸡肉肠沙拉鸡胸肉丸低脂鸡胸肉肠增肌','https://img.alicdn.com/imgextra/https://img.alicdn.com/imgextra/i1/3997125814/O1CN01DclxxJ1sorMeGWlzn_!!3997125814.jpg_430x430q90.jpg','https://img.alicdn.com/imgextra/i3/3997125814/O1CN01beEM2a1sorMhfzP5K_!!3997125814.jpg','https://img.alicdn.com/imgextra/i4/3997125814/O1CN01IAbwn41sorMhSgS6h_!!3997125814.jpg','https://img.alicdn.com/imgextra/i3/3997125814/O1CN01sjx59F1sorNXRTOGl_!!3997125814.jpg','https://img.alicdn.com/imgextra/i4/3997125814/O1CN01t8DkLU1sorMgTegHx_!!3997125814.jpg',69,99,1000,1
);
INSERT INTO `product` VALUES(21,'0脂荞麦面杂粮面条粗粮全麦饱腹控低减代餐食品糖尿人无糖精主食','0脂肪高蛋白 0加白面粉 健身糖尿人胖友主食','https://img.alicdn.com/imgextra/https://img.alicdn.com/imgextra/i2/735580970/O1CN01efPXez1J2InRyrA70_!!735580970.jpg_430x430q90.jpg','https://img.alicdn.com/imgextra/i3/735580970/O1CN01KCvfEH1J2InOkHGfy_!!735580970.jpg','https://img.alicdn.com/imgextra/i4/735580970/O1CN0139GN1Y1J2InQ3rVfi_!!735580970.jpg','https://img.alicdn.com/imgextra/i4/735580970/O1CN012cjR2I1J2InQ3ryoD_!!735580970.jpg','https://img.alicdn.com/imgextra/i4/735580970/O1CN01EjNEZL1J2InQhnZge_!!735580970.jpg',19,59,500,1
);
INSERT INTO `product` VALUES(22,'康恩贝蛋白粉高蛋白质粉乳清营养粉男白女增强免疫力中老年补品','1件5折 增强免疫力','https://img.alicdn.com/imgextra/i7/TB1yGrVjYY1gK0jSZTEQgBDQVXa_032540.jpg_430x430q90.jpg','https://img.alicdn.com/imgextra/i3/692420117/TB2aCV7CaSWBuNjSsrbXXa0mVXa_!!692420117-0-scmitem6000.jpg','https://img.alicdn.com/imgextra/i4/692420117/TB2fXPjCeSSBuNjy0FlXXbBpVXa_!!692420117-0-scmitem6000.jpg','https://img.alicdn.com/imgextra/i1/692420117/TB2E090CeuSBuNjSsplXXbe8pXa_!!692420117-0-scmitem6000.jpg','https://img.alicdn.com/imgextra/i2/692420117/TB2r9bsCoR1BeNjy0FmXXb0wVXa_!!692420117-0-scmitem6000.jpg',89,118,1354,1
);
INSERT INTO `product` VALUES(23,'全麦面包黑麦吐司健身0无糖精无油粗粮减低脂肪热量代餐早餐食品','0糖低脂饱腹代餐 12天短保更健康 现烤发货','https://img.alicdn.com/imgextra/https://img.alicdn.com/imgextra/i1/2277382463/O1CN017pgN0Z1U461fA1Oox_!!2277382463.jpg_430x430q90.jpg','https://img.alicdn.com/imgextra/i1/2277382463/TB2sv1XcJ3nyKJjSZFjXXcdBXXa_!!2277382463.jpg','https://img.alicdn.com/imgextra/i1/2277382463/O1CN01RzhF0x1U46204EJZK_!!2277382463.jpg','https://img.alicdn.com/imgextra/i2/2277382463/TB2rXqbcNwlyKJjSZFsXXar3XXa_!!2277382463.jpg?t=1539833869000','https://img.alicdn.com/imgextra/i3/2277382463/TB2Pj88cNolyKJjSZPfXXawNpXa_!!2277382463.jpg',29,59,61379,1
);
INSERT INTO `product` VALUES(24,'【纯肉22袋】馋帽鸡胸肉健身开袋即食代餐低脂高蛋白轻食鸡肉一箱','22包鸡胸肉 低脂高蛋白 收藏加购优先发货','https://img.alicdn.com/imgextra/https://img.alicdn.com/imgextra/i4/2207335488314/O1CN01CCoJu82BHrTeZbpxg_!!2207335488314.jpg_430x430q90.jpg','https://img.alicdn.com/imgextra/i3/2207335488314/O1CN01Zj8LTb2BHrTciO2j1_!!2207335488314.jpg','https://img.alicdn.com/imgextra/i3/2207335488314/O1CN01O6KuIz2BHrTdxBV7v_!!2207335488314.jpg','https://img.alicdn.com/imgextra/i1/2207335488314/O1CN01eRlcy42BHrVy6auZK_!!2207335488314.jpg','https://img.alicdn.com/imgextra/i3/2207335488314/O1CN01jZv2gc2BHrTfZGwhL_!!2207335488314.jpg',109,179,4031,1
);
INSERT INTO `product` VALUES(25,'WonderLab小蓝瓶益生菌 大人幼儿童孕妇调理肠胃肠道便秘元冻干粉',null,'https://img.alicdn.com/imgextra/https://img.alicdn.com/imgextra/i2/2200662002307/O1CN01tIGlnO1SueLMi8ljS_!!2200662002307.png_430x430q90.jpg','https://img.alicdn.com/imgextra/i4/2200662002307/O1CN01Z35zvB1SueN9kJdQ8_!!2200662002307.png','https://img.alicdn.com/imgextra/i1/2200662002307/O1CN01Rx1Ozw1SueN5lQRDx_!!2200662002307.png','https://img.alicdn.com/imgextra/i4/2200662002307/O1CN015xbWXk1SueMzs3edt_!!2200662002307.png','https://img.alicdn.com/imgextra/i4/2200662002307/O1CN01Uxi2bh1SueN9kIQa5_!!2200662002307.png',169,369,10368,1
);
INSERT INTO `product` VALUES(26,'Vitobest维托贝斯特碳水脂肪全阻断剂白芸豆双孢蘑菇餐前阻断吸收',null,'https://img.alicdn.com/imgextra/https://img.alicdn.com/imgextra/i4/2209029114418/O1CN01f1xCIo1iVUTBXdNhB_!!2209029114418.jpg_430x430q90.jpg','https://img.alicdn.com/imgextra/i4/2209029114418/O1CN01Bq4Qst1iVUSZAUlUl_!!2209029114418.jpg','https://img.alicdn.com/imgextra/i4/2209029114418/O1CN01Iw4vqC1iVUSakqaOQ_!!2209029114418.jpg','https://img.alicdn.com/imgextra/i1/2209029114418/O1CN01haMQuZ1iVUSNfwg7z_!!2209029114418.jpg','https://img.alicdn.com/imgextra/i4/2209029114418/O1CN01qRjhQE1iVUSU3JjOt_!!2209029114418.jpg',299,328,34,1
);
INSERT INTO `product` VALUES(27,'躺兽生酮代餐粉奶昔4口味低碳防弹奶茶营养粉早中晚代餐饱腹食品','多营养矿物质 3餐代餐 饱腹持续供能','https://img.alicdn.com/imgextra/https://img.alicdn.com/imgextra/i1/2209175019881/O1CN01Pxd7vh2MrYAVe0bP4_!!2209175019881.png_430x430q90.jpg','https://img.alicdn.com/imgextra/i3/2209175019881/O1CN01YTVqGG2MrYASdarf1_!!2209175019881.png','https://img.alicdn.com/imgextra/i1/2209175019881/O1CN01Brxj2T2MrYAZNnoR4_!!2209175019881.png','https://img.alicdn.com/imgextra/i4/2209175019881/O1CN01O3Z3tU2MrYAaGPs05_!!2209175019881.png','https://img.alicdn.com/imgextra/i2/2209175019881/O1CN01lqQmVp2MrYAZNr6Dy_!!2209175019881.png',79,99,51,1
);
INSERT INTO `product` VALUES(28,'绿瘦代餐能量棒减粗粮脂卡餐压缩早餐代餐饼干零食热量食品代餐棒','推荐买5发10 中国国家跳水队官方合作伙伴','https://img.alicdn.com/imgextra/https://img.alicdn.com/imgextra/i1/758489962/O1CN01iHJKJJ2NSeEf9knLB_!!758489962.jpg_430x430q90.jpg','https://img.alicdn.com/imgextra/i3/758489962/O1CN01v9SIJE2NSeE0neixz_!!758489962.jpg','https://img.alicdn.com/imgextra/i2/758489962/O1CN01bMxM0N2NSeAU6WU6g_!!758489962.jpg','https://img.alicdn.com/imgextra/i3/758489962/O1CN01094SlR2NSeASd3hIB_!!758489962.jpg','https://img.alicdn.com/imgextra/i2/758489962/O1CN01OeQp3k2NSe9vqUXoF_!!758489962.jpg',59,338,81414,1
);
INSERT INTO `product` VALUES(29,'美国进口拜耳Oneaday女性复合维生素加速新陈代谢50粒燃动小马达','有效期至2021-11-01','https://img.alicdn.com/imgextra/i1/2939847205/O1CN01Qas0Oa235wH9da9Zf_!!2939847205.jpg_430x430q90.jpg','https://img.alicdn.com/imgextra/i2/2939847205/O1CN01isNsQw235wIKXOFJl_!!2939847205.jpg','https://img.alicdn.com/imgextra/i1/2939847205/O1CN019Vctbp235wIMlEKTQ_!!2939847205.jpg','https://img.alicdn.com/imgextra/i4/2939847205/O1CN01ThpKNg235wHm9bKP0_!!2939847205.jpg','https://img.alicdn.com/imgextra/i4/2939847205/O1CN01vu9E0o235wHk8DVGG_!!2939847205.jpg',349,699,8100,1
);
-----
-----
#文章分类表
CREATE TABLE `classify`(
  `cid` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '文章分类id 主键且自增',
  `cname` varchar(50) NOT NULL COMMENT '类型名称 唯一',
  PRIMARY KEY (`cid`),
  UNIQUE KEY `cname` (`cname`)
)ENGINE = InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET = utf8;
INSERT INTO `classify` (`cid`,`cname`) VALUES(1,'今日推荐'),(2,'健身运动'),(3,'健康专题'),(4,'营养专题'),(5,'头条');
----
------
#文章详情表
CREATE TABLE `details` (
  `did` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文章详情id主键且自增',
  `dtitle` varchar(50)  NOT NULL COMMENT '文章标题',
  `synopsis` varchar(255) NOT NULL COMMENT '文章简介',
  `text`   mediumtext NOT NULL COMMENT '文章正文',
  `image` varchar(50) DEFAULT NULL COMMENT '文章缩略图',
  `users_id` int(5) unsigned NOT NULL COMMENT '外键 文章所属分类',
  `author_id` mediumint(10) unsigned NOT NULL COMMENT '外键 作者id',
  `data` int(10) unsigned NOT NULL COMMENT '发表日期',
  PRIMARY KEY(`did`) USING BTREE,
  FOREIGN KEY (`users_id`)  REFERENCES `classify`(`cid`),
  FOREIGN KEY (`author_id`)  REFERENCES `users`(`id`)
)ENGINE =InnoDB AUTO_INCREMENT =3 DEFAULT CHARSET =utf8;
-----
-----
INSERT INTO `details` VALUES (1,'健身菜鸟恢复肌肉，只需这6步','对于健身爱好者来说，日常锻炼时肌肉酸痛等情况是不可避免的，健身大牛们常常有科学的休息方法，对于恢复肌肉自然轻松应对。作为健身房的新(菜)人(鸟)，苦恼于没有完整的恢复攻略?编者为您支出以下6招：','<p>一、 充分的休息</p>\n<p>健身之后应该给予肌肉更多的休息时间，健身是需要持之以恒的，需要循序渐进的，不可能一蹴而就，所以，平常健身时应该把握自身的承受能力，选择可以负荷的运动量，坚持不懈才是黄金准则</p>\n<p><img src=\"http://www.swjswang.com/uploads/allimg/161209/8-16120ZU40K34.png\" /></p>\n<p>二、 补充水分</p>\n<p>运动时人体会流失掉大量的水分，健身过程中我们应该补充水分，健身后更应该补充水分，促进身体新陈代谢，让肌肉更快地吸收运动量。</p>\n<p><img src=\"http://www.swjswang.com/uploads/allimg/161209/8-16120ZU41W10.jpg\" /></p>\n<p>三、 运动后的拉伸</p>\n<p>健身后肌肉处于紧绷的状态，此时进行一些适当的拉伸，有助于放松肌肉，更有助于保证健身后的睡眠质量，使肌肉恢复更快。</p>\n<p><img src=\"http://www.swjswang.com/uploads/allimg/161209/8-16120ZU42U00.png\" /></p>\n<p>四、 缓和运动</p>\n<p>　指在健身运动后缓慢停止下来的过程，在剧烈运动后的5到10分钟内进行缓和运动，也就是放松运动，可以使肌肉放松下来，消除掉肌肉内的乳酸，减少肌肉酸痛。</p>\n<p><img src=\"http://www.swjswang.com/uploads/allimg/161209/8-16120ZU4553Y.jpg\" /></p>\n<p>　五、 饮食补充</p>\n<p>在健身过程中会消耗大量的身体能量，此时需要在运动后的1小时内摄入食物，食物种类应偏向于高蛋白肉类，以及碳水化合物类(如蜂蜜水果汁，扁豆等)</p>\n<p><img src=\"http://www.swjswang.com/uploads/allimg/161209/8-16120ZU513551.jpg\" /></p>\n<p>六、 按摩</p>\n<p>剧烈运动后对肌肉进行一些按摩可以放松肌肉，促进血液循环。</p>\n<p><img src=\"http://www.swjswang.com/uploads/allimg/161209/8-16120ZU52c57.jpg\" /></p>','http://www.swjswang.com/uploads/161222/8-16122209432JA.jpg',2,1,1610518693),(2,'做到这几点，整个城市都成为你的健身场！','健身房是健身的好地方，但这次小编想说的是健身不只是健身房才能健身，只要你有心，整个城市都可以是你的运动场。接下来，小编整理了几种在健身房外依然可以达到健身效果的方法。','<p>快走和跑步.只要有一双跑鞋、换上轻便衣裤，就能跟跑步来场邂逅。踏出家门就可以在河堤、公园、操场看到跑者们的踪影，当你踏出这一步时你就会发现健身与自然合二为一，是一种前所未有的享受。
没有健身经验或者是想减肥的人，建议从走路开始。快走可以加快消耗量，增加出汗量，达到排毒瘦身的理想功效。再次，快走可以加快消耗体内备用脂肪的力度，有减脂减肥的效果。一般来说，运动在半个钟以上，可以相当跑步骑车消耗的热量。先养成运动习惯，再慢慢增加活动量、提升运动强度。像是先走路、变成快走、慢跑2-3公里、一次跑20分钟等。健身讲究的是一个循序渐进的过程，并非一蹴而就，最重要的是，享受你踏出的每一步，习惯才能长久。登山健走.更多时候让人喜欢登山健走的原因是可以远离都市尘嚣、亲自走过生长的土地、体验大自然，好比一场冒险。让你的心灵与大自然来一场相遇，在健身的同时感受不自然的舒适，在登山的同时带走不愉快的心情。在登山时一定要注意自己的安全问题，一定要提前了解山的情况以及充分准备好工具。</p>\n<p><img src=\"http://www.swjswang.com/uploads/allimg/161122/18-161122144K0X9.jpg\" /></p>\n<p>徒手循环训练.对有训练经验的人来说，徒手训练可能强度不足、枯燥乏味。这时候采用动静交错的“徒手循环训练”，可以将运动强度提高，一次练到全身并提升心肺耐力，还可以节省时间。通常进行循环训练的地点不限，运动与休息时间的比例从1:1、1:2到2:1都有（视自己当天的状况设定）。动作分配的部分，建议上下肌群交替做，可替肌肉争取更多休息时间。线上瑜珈课程.同样家也是一个健身的好场所，线上视频与手机APP相当方便，现在的移动网络更加的发达，线上的视频更新速度也是相当的快，这时你可以选择适合自己的健身的方法去跟着视频一起健身，甚至可以根据自己的身体综合素质定制自己的健身计划表。举例国外的Do Yoga With Me就有很详细的分类，让你能选择适合自己的课程。
但不得提醒的大家是，因为网络的便利与发达，越来越多类似但可能品质不是很好的教学影片流出。大家在观看前最好多搜集相关评价，提高一点运动安全性。</p>\n<p><img src=\"http://www.swjswang.com/uploads/allimg/161122/18-161122144ZRZ.jpg\" /></p>\n<p>户外伸展.伸展原则上可以每天进行，伸展运动是最不受场合的限制，在任何场合都可以进行的一种运动。通常只要一块瑜珈垫，就能进行简单伸展。健身爱好者通常都喜欢携带一块瑜伽垫在户外进行伸展运动，户外伸展让练习者感受天人合一的意境,在呼吸到新鲜空气的同时,更舒缓了身心.。一方面透过伸展解除一周累积的疲惫，另一方面欣赏眼前景色，追求完全放松的感觉非常不错，也推荐大家这样做。以上几点都是适合户外运动，不需要再健身房中也能进行的运动，在无聊的周末不妨试试，让自己的心灵与大自然来一场相遇，做到这几点，整个城市都是你的健身场所。</p>\n<p><img src=\"http://www.swjswang.com/uploads/allimg/161122/18-16112214492I39.jpg\" /></p>','http://www.swjswang.com/uploads/161216/8-1612160T430c6.jpg',2,1,1610518693);
------
------
#本站强推好物

CREATE TABLE `best` (
  `cid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '精选推荐id 主键且自增',
  `subject` varchar(50) NOT NULL COMMENT '精选商品名称',
  `best_img` VARCHAR(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` int(11) NULL DEFAULT NULL,
  `b_discount` int(11) NULL DEFAULT NULL,
  `snap_up` varchar (10) NULL DEFAULT NULL,
  PRIMARY KEY(`cid`) USING BTREE
)ENGINE = InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET =utf8;
---
---
INSERT INTO `best` VALUES(1,'MUSCLETECH/麦斯泰克','https://img.alicdn.com/imgextra/https://img.alicdn.com/imgextra/i4/4213330370/O1CN01ylgl7x1EbVCD6BwQF_!!4213330370.png_430x430q90.jpg',498,168,'抢购');
INSERT INTO `best` VALUES(2,'多功能仰卧板','https://img.alicdn.com/imgextra/https://img.alicdn.com/imgextra/i1/2260376590/O1CN01eFZpgt1yYGhS4nPCA_!!2260376590.jpg_430x430q90.jpg',378,219,'抢购');
INSERT INTO `best` VALUES(3,'黑科技腹肌贴','https://img.alicdn.com/imgextra/i1/2208175320863/O1CN016oKuOs1IFIRlclKax_!!2208175320863.jpg_400x400.jpg',499,199,'抢购');
---
---
#商城轮播图表
CREATE TABLE `swiper` (
  `cid` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '轮播图id 主键且自增',
  `swiper_img` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`cid`) USING BTREE
)ENGINE = InnoDB AUTO_INCREMENT =5 DEFAULT CHARSET = utf8;
---
---
INSERT INTO `swiper` VALUES(
  1,'http://www.swjswang.com/uploads/allimg/170411/3-1F411195411206.jpg'
);
INSERT INTO `swiper` VALUES(
  2,'http://www.swjswang.com/uploads/170412/3-1F4121KT3B1.png'
);
INSERT INTO `swiper` VALUES(
  3,'http://www.swjswang.com/uploads/170510/3-1F510155113Y9.png'
);
INSERT INTO `swiper` VALUES(
  4,'http://www.swjswang.com/uploads/allimg/170524/1-1F52409252V01.jpg'
);
INSERT INTO `swiper` VALUES(
  5,'http://www.swjswang.com/uploads/allimg/170607/3-1F60G5314B32.jpg'
);
-----
-----
#饮食表
CREATE TABLE `food` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `food_name` VARCHAR(50) Not NULL COMMENT '一日三餐',
  PRIMARY KEY (`id`) USING BTREE
)ENGINE = InnoDB AUTO_INCREMENT =4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT =Dynamic;
----
----
INSERT INTO `food` VALUES(1,'早餐');
INSERT INTO `food` VALUES(2,'午餐');
INSERT INTO `food` VALUES(3,'晚餐');
INSERT INTO `food` VALUES(4,'加餐');
#饮食推荐表
CREATE TABLE `foods` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `foods_image` VARCHAR(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `foods_name` VARCHAR(50)  NOT NULL COMMENT '食物标题',
  `classify_id` int(11) COMMENT '外键 关联food表',
  `foods_son` VARCHAR(30) NOT NULL COMMENT '视为热量',
  PRIMARY KEY(`cid`) USING BTREE,
  FOREIGN KEY (`classify_id`)  REFERENCES `food`(`id`)
)ENGINE =InnoDB AUTO_INCREMENT =10 CHARACTER SET=utf8 COLLATE utf8_general_ci ROW_FORMAT=Dynamic;
----
----
INSERT INTO `foods` VALUES(1,'https://img.alicdn.com/imgextra/i1/3059456309/O1CN01iL7DLa1wTZPUDqVa7_!!3059456309.jpg_430x430q90.jpg','爆浆面包',1,404);
INSERT INTO `foods` VALUES(2,'https://gd1.alicdn.com/imgextra/i1/86977045/O1CN0121uekG8dJspZ1Bh_!!86977045.jpg_400x400.jpg','美味生煎包',1,130);
INSERT INTO `foods` VALUES(3,'https://img.alicdn.com/imgextra/i3/2200807254153/O1CN01LyhL7O1gY7SQWZ8Vl_!!2200807254153.jpg_430x430q90.jpg','代餐奶昔',1,501);
INSERT INTO `foods` VALUES(4,'https://img.alicdn.com/imgextra/https://img.alicdn.com/imgextra/i1/2201271158392/O1CN01pmFaDB2BraOie0mfP_!!2201271158392.jpg_430x430q90.jpg','红烧牛肉',2,666);
INSERT INTO `foods` VALUES(5,'https://gd1.alicdn.com/imgextra/i1/3175090424/O1CN01SxxyEY1F0EWkBmStH_!!3175090424.jpg_400x400.jpg','黑椒牛柳芝士',2,357);
INSERT INTO `foods` VALUES(6,'https://img.alicdn.com/imgextra/i1/2200699866716/O1CN01Zfy2jE1zTyXdPTzK7_!!2200699866716.jpg_430x430q90.jpg','椰汁黑糯米',2,474);
INSERT INTO `foods` VALUES(7,'https://img.alicdn.com/imgextra/i3/3043418704/O1CN01ZkDYYW2EATv6tlWgH_!!3043418704.jpg_430x430q90.jpg','低脂鸡胸肉肠',3,414);
INSERT INTO `foods` VALUES(8,'https://img.alicdn.com/imgextra/i4/361034375/O1CN01LbgWD31iBnR1amOFb_!!361034375.jpg_400x400.jpg','杏仁粉无糖冲饮',3,1074);
INSERT INTO `foods` VALUES(9,'https://i8.meishichina.com/attachment/recipe/2021/01/12/2021011216104582502964797345450.jpg?x-oss-process=style/p800','韭菜虾仁饺子',3,45);
INSERT INTO `foods` VALUES(10,'https://i8.meishichina.com/attachment/recipe/2021/01/14/2021011416106157298193997513584.jpg?x-oss-process=style/p800','小熊甜甜圈',4,358);
