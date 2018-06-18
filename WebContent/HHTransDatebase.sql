/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.7.17-log : Database - hhtransaction
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`hhtransaction` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;

USE `hhtransaction`;

/*Data for the table `t_cart` */

insert  into `t_cart`(`cartId`,`cartNum`,`cartPrice`) values (34,0,0),(35,0,0),(38,0,0),(39,0,0),(40,0,0);

/*Data for the table `t_cartitem` */

/*Data for the table `t_classify` */

insert  into `t_classify`(`classifyId`,`classifyName`) values (1,'电子产品'),(2,'服装配饰'),(3,'文娱教育'),(4,'美容美化'),(5,'生活用品');

/*Data for the table `t_goods` */

insert  into `t_goods`(`goodsId`,`goodsName`,`goodsIntroduction`,`goodsPrice`,`goodsNum`,`goodsStatus`,`classifyId`,`vipId`,`goodsImage`) values (55,'test','123',9999,1,1,5,40,'img/goods/201806130839375.jpg'),(56,'汉服','123',9999,1,1,5,40,'img/goods/201806130846006.jpg'),(57,'女生短袖','带吊牌！',25,1,1,2,40,'img/goods/20180613085133goods2.jpg'),(58,'95新三星','欢迎咨询',560,1,1,1,40,'img/goods/20180613085221goods1.jpg'),(59,'99新苹果机6s','价钱可面议',1500,1,1,1,40,'img/goods/201806130904546s.jpg'),(60,'联想电脑','价格可面议',3000,1,1,1,40,'img/goods/20180613085800u=3020855232,2488411186&fm=27&gp=0.jpg'),(61,'小米手环1','85新最低价啦',30,1,1,1,40,'img/goods/20180613085838u=328507604,4072240742&fm=27&gp=0.jpg'),(62,'华为平板','价格可以面议，喜欢联系我哦',1500,1,1,1,40,'img/goods/20180613085916timg225.jpg'),(63,'小米手环2','原价149没有戴过几次求带走',88,1,1,1,40,'img/goods/20180613085957timg123.jpg'),(64,'2017年新款ipad','128G急出，99新',2500,1,1,1,40,'img/goods/20180613090101timg22.jpg'),(65,'联想超薄本','内存8G！',5000,1,1,1,40,'img/goods/20180613090145timg.jpg'),(66,'老式电脑','性能很高',1000,1,1,1,40,'img/goods/20180613090225tim2g1.jpg'),(67,'苹果电脑急出','急需用钱跳楼卖',3000,1,1,1,40,'img/goods/20180613090331tim2g.jpg'),(68,'99新苹果机6s','急出急出',2500,1,1,1,40,'img/goods/201806130904546s.jpg'),(69,'粉色连衣裙','只穿过几次',30,1,1,2,40,'img/goods/20180613091035tim1g.jpg'),(70,'全新全新','求带走',20,1,1,2,40,'img/goods/20180613091100timg.jpg'),(71,'新裙子','s码，可以先试试',50,1,1,2,40,'img/goods/20180613091148timg3.jpg'),(72,'雪纺连衣裙','衣服太多带不走便宜甩卖',30,1,1,2,40,'img/goods/20180613091215timg4.jpg'),(73,'特别显瘦','要不要没关系，欢迎咨询',45,1,1,2,40,'img/goods/20180613091252timg6.jpg'),(74,'简单大方长裙子','原价189啊！真的带不走了',36,1,1,2,40,'img/goods/20180613091330timg7.jpg'),(75,'粉裙子','特别显气质，带吊牌哦全新',88,1,1,2,40,'img/goods/20180613091411timg9.jpg'),(76,'森女系裙子','可来宿舍试穿，还有许多同系列衣服',55,1,1,2,40,'img/goods/20180613091449timg12.jpg'),(77,'性感连衣裙','不多说了求带走',55,1,1,2,40,'img/goods/20180613091522timg77.jpg'),(78,'雪纺连衣裙','穿上真的超级凉快，骗你不要钱啊',50,1,1,2,40,'img/goods/20180613091603u=1223928227,583143460&fm=11&gp=0.jpg'),(79,'高兴死了','求带走',5,1,1,3,40,'img/goods/201806130917061.jpg'),(80,'技术领导力','书使人进步',5,1,1,3,40,'img/goods/2018061309174626.jpg'),(81,'7分钟理财','绝对正版！！！',5,1,1,3,40,'img/goods/2018061309181812.jpg'),(82,'深入浅出通信原理','技术书，学硬件的',10,1,1,3,40,'img/goods/2018061309184629.jpg'),(83,'深度学习','数据库学习使用',10,1,1,3,40,'img/goods/2018061309200027.jpg'),(84,'微服务器搭建','技多不压身啊同学',8,1,1,3,40,'img/goods/2018061309203325.jpg'),(85,'菲诗小铺洗面奶','十块一只快来拿',10,1,1,4,40,'img/goods/20180613092353tim11g.jpg'),(86,'泰国羽翼散粉','小仙女们快来围观呐',25,1,1,4,40,'img/goods/20180613092433timg.147jpg.jpg'),(87,'泰国羽翼整套全新','一整天洗面奶眼线液口红都有',250,1,1,4,40,'img/goods/20180613092518timg13.jpg'),(88,'小草莓唇膏','全新未拆封',5,1,1,4,40,'img/goods/20180613092623timg44.jpg'),(89,'羽翼眼线液','最便宜啦',20,1,1,4,40,'img/goods/20180613092649timg55.jpg'),(90,'菲诗小铺隔离','只有紫色的啦',15,1,1,4,40,'img/goods/20180613092719timg222.jpg'),(91,'羽翼粉底液','全新',38,1,1,2,40,'img/goods/20180613092806u=691090653,1645584224&fm=27&gp=0.jpg'),(92,'羽翼睫毛膏','还有很多',25,1,1,4,40,'img/goods/20180613092828timg999.jpg');

/*Data for the table `t_message` */

/*Data for the table `t_order` */

/*Data for the table `t_orderitem` */

/*Data for the table `t_vipinfo` */

insert  into `t_vipinfo`(`vipId`,`vipNickName`,`vipPassWord`,`vipEmail`,`vipActiCode`,`vipStatus`,`vipTokenTime`,`vipIntroduction`) values (34,'admin','EFG@AB','lp995968535@qq.com',NULL,1,'2018-06-06 07:46:01','{\"dep\":\"\",\"img\":\"img/img_myinfo/myimage.jpg\",\"info\":\"\",\"myqq\":\"\",\"ssex\":\"男\",\"tel\":\"\"}'),(35,NULL,NULL,NULL,NULL,0,NULL,NULL),(38,'lpp','EFG@AB','2983526367@qq.com',NULL,1,'2018-06-06 14:01:55','{\"dep\":\"\",\"img\":\"img/img_myinfo/myimage.jpg\",\"info\":\"\",\"myqq\":\"\",\"ssex\":\"女\",\"tel\":\"\"}'),(39,'test','EFG@AB','lp995968535@qq.com',NULL,1,'2018-06-06 14:36:53','{\"dep\":\"\",\"img\":\"img/img_myinfo/myimage.jpg\",\"info\":\"程序员\",\"myqq\":\"995968535\",\"ssex\":\"男\",\"tel\":\"15203883326\"}'),(40,'李盼盼','EFG@AB','lp995968535@qq.com',NULL,1,'2018-06-07 10:27:29','{\"dep\":\"信息工程学院\",\"img\":\"img/img_myinfo/myimage.jpg\",\"info\":\"程序员\",\"myqq\":\"995968535\",\"ssex\":\"女孩纸\",\"tel\":\"15203883326\"}');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
