package com.test;

import static org.junit.Assert.*;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.dao.BaseDao;
import com.entity.CartItem;
import com.entity.Classify;
import com.entity.Goods;
import com.entity.Message;
import com.entity.Order;
import com.entity.VipInfo;
import com.service.CartItemService;
import com.service.CartService;
import com.service.ClassifyService;
import com.service.GoodsService;
import com.service.MessageService;
import com.service.OrderService;
import com.service.VipInfoService;
import com.utils.HibernateSessionFactory;
import com.utils.Page;

public class TestHibernate {
	
     BaseDao<VipInfo> dao;
     VipInfoService service;
     ApplicationContext ac;
	@Before
	public void setUp() throws Exception {
		
	ac = new ClassPathXmlApplicationContext("beans.xml");
    dao=(BaseDao<VipInfo>)ac.getBean("baseDao");
    service=(VipInfoService)ac.getBean("vipInfoService");
	}

	@After
	public void tearDown() throws Exception {
	
	}

	@Test
	public void testVipService() {
		VipInfo vip=new VipInfo();
		vip.setVipNickName("zhu");
		vip.setVipPassWord("zhu");
		if(service.login(vip)!=null) {
			System.out.println(service.login(vip).getVipNickName());
		}
	}
	
	@Test
	public void testInsertVip() {
		VipInfo vip=new VipInfo();
		vip.setVipNickName("zhu");
		vip.setVipPassWord("zhu");
		vip.setVipTokenTime(new Date());
//		dao.save(vip);
		service.insert(vip);
		
		
	}
	
	@Test
	  public void testBase() {
		  List<VipInfo> list =dao.find("from VipInfo");
		  for(VipInfo a : list) {
				System.out.println(a.getVipNickName()+a.getVipTokenTime());
			}
	  }
	
	@Test
	  public void testClassifyInsert() {
		BaseDao<Classify> dao;
		dao=(BaseDao<Classify>)ac.getBean("baseDao");
		
		Classify classify = new Classify();
		classify.setClassifyId(1);
		classify.setClassifyName("电子产品");
		dao.save(classify);
		System.out.println("添加成功");
		
	  }
	
	@Test
	  public void testgetClassify() {
		ClassifyService classifyService;
		classifyService=(ClassifyService)ac.getBean("classifyService");
		
		Classify c=classifyService.getClassify("美容美化");
		System.out.println(c.getClassifyName()+"的ID："+c.getClassifyId());
	  }
	@Test
	  public void testGoodsInsert() {
		BaseDao<Goods> goodsdao;
		goodsdao=(BaseDao<Goods>)ac.getBean("baseDao");
		Goods goods = new Goods();
		goods.setGoodsClassify(new Classify(2));
		goods.setGoodsIntroduction("全新带吊牌！");
		goods.setGoodsName("女生短袖");
		goods.setGoodsNum(1);
		goods.setGoodsPrice(56);
		goods.setGoodsStatus(1);
	   //VipInfo vipInfo = service.getCurrentVop(38);
		goods.setGoodsVipId(new VipInfo(35));
		
		 for(int i=0;i<=0;i++) {
			 goodsdao.save(goods);
		 }
	  }
	@Test
	  public void testGoodsInsertService() {
		 GoodsService service;		
		 service=(GoodsService)ac.getBean("goodsService");
	
			 List<Goods> list = service.findGoodsByClassify(1);
		     for(Goods g:list) {
		    	 System.out.println(g.getGoodsName());
		     }
	  }
	
	@Test
	  public void testGoodsFenYe() {
		
		 GoodsService service;		
		 service=(GoodsService)ac.getBean("goodsService");
		    
		 Page page = new Page(1, 3, 7);
		List<Goods> list= service.findGoodsByClassify(1, page);
		 for(Goods g:list) {
			 System.out.println(g.getGoodsName()+g.getGoodsId());
		 }
		 System.out.println("一共有"+service.countGoodsByClassify(1).intValue());
	  }

	
	@Test
	  public void testCartInsertService() {
		 CartItemService service;		
		 service=(CartItemService)ac.getBean("cartItemService");
		 //cartid 和 goodId
	     service.insertCartItem(34, 17);
	  }

	//json和字符串互换
	@Test
	  public void test2() {
		 String str = "";
		 JSONObject json  = new JSONObject();
		 json.put("id", "123456");
		 json.put("name", "test");
		 str = json.toJSONString();
		 
		 System.out.println(str);
		 JSONObject t =new JSONObject().parseObject(str);
		 System.out.println(t);
	  }
	
	@Test
	  public void testGoodsInser() {
		//获取file2的文件copy到G:/ftp/img文件中
		 GoodsService service;		
		 service=(GoodsService)ac.getBean("goodsService");
	
		 String filePath = "G:/ftp/img/";
		 File file  = new File(filePath);
		 File file2 =new File("G:/ftp/test.txt").getAbsoluteFile();
		 
			//goods.setGoodsVipId((VipInfo)session.get("current_user"));
		Goods goods = new Goods();
		goods.setGoodsIntroduction("123123");
		goods.setGoodsName("123");
		 service.insertGoods(file2, filePath, "文件名",goods);
		        System.out.println("添加成功");
			
	}
	
	@Test
	  public void testGoodsFind() {
		
		 GoodsService service;		
		 service=(GoodsService)ac.getBean("goodsService");
		    
		 Page page = new Page(1, 8, 8);
		 List<Goods> list= service.findGoods("电子", page);
		 for(Goods g:list) {
			 System.out.println(g.getGoodsName()+g.getGoodsId());
		 }
		 System.out.println("一共有"+service.countGoods("电子").intValue());
	  }
	@Test
	  public void testMessList() {
		
		 MessageService messervice;		
		 messervice=(MessageService)ac.getBean("messageService");
		    
		// Page page = new Page(1, 5, 8);
		 VipInfo fvip = service.getCurrentVop(34);
		 VipInfo tvip = service.getCurrentVop(40);
		 List<Message> list= messervice.getMessageList(fvip,tvip);
		 for(Message m : list) {
			//System.out.println(m.getMessageReceiveId().getVipNickName());
			 System.out.println(m.getMessageSendId().getVipNickName()+" 给  " +m.getMessageReceiveId().getVipNickName()+ " 发送消息： " +m.getMessageContent());
		 }
		 
		
	  }
	@Test
	  public void testMessArr() {
		
		 MessageService messervice;		
		 messervice=(MessageService)ac.getBean("messageService");
		    
		// Page page = new Page(1, 5, 8);
		 VipInfo fvip = service.getCurrentVop(39);
		 //VipInfo tvip = service.getCurrentVop(40);
		// List<Message> list= messervice.getMessageList(fvip,tvip);
		
		// JSONArray temp = messervice.getMessArr(fvip, tvip);
		//System.out.println(temp);
		 List<Message> list = messervice.getMessageToCurr(fvip);
		 for(Message m :list) {
			 System.out.println(m.getMessageContent());
		 }
		
	  }
	
	@Test
	  public void testCart() {
		
		 CartItemService service;		
		 service=(CartItemService)ac.getBean("cartItemService");
		 CartService cartservice;
		 cartservice=(CartService)ac.getBean("cartService");
//		List<CartItem> list = service.findCartItemList(cartservice.getCart(38));
//		for(CartItem c :list) {
//			System.out.println(c.getGoodsId().getGoodsName());
//		}
		//System.out.println(service.getShopArr(cartservice.getCart(38)));
		System.out.println(service.getCountCartItem(cartservice.getCart(38)));
	}
	
	@Test
	  public void testMessListforProple() {
		
		 MessageService messervice;		
		 messervice=(MessageService)ac.getBean("messageService");
		 
		// Page page = new Page(1, 5, 8);
		
		 VipInfo tvip = service.getCurrentVop(40);
		  
		System.out.println(messervice.getMessArrToCurr(tvip));
		 
		
	  }
   @Test
   public void testDateToInt() {
	   SimpleDateFormat sf = new SimpleDateFormat("yyMMddHHmmss");
		String nowDate=sf.format(new Date()).toString();
		Date date  = new  Date();
		System.out.println(date.getTime());
   }
   
   @Test
   public void testGetOrdeId() {
	   //添加一个订单信息
	  OrderService orderservice;		
	  orderservice=(OrderService)ac.getBean("orderService");
	  Order order = new Order();
	  order.setOrderAddress("test18/6/20");
	  
	  String str = "79,80,81,";
	 // String[] a = str.split(",");
//	for(int i=0;i<a.length;i++) {
//		System.out.println(a[i]);
//	}
	  //int[] goodsArr= {56,57,58,59,60};
	  orderservice.insertOrder(order,str);
	  
   }
   
   @Test
   public void testImg() {
	   VipInfo current = service.getCurrentVop(34);
	   String str = current.getVipIntroduction();
	   JSONObject json = new JSONObject().parseObject(str);
	   System.out.println(json.get("img"));
   }
   
   @Test
   public void testOrder() {
	   //添加一个订单信息
	  OrderService orderservice;		
	  orderservice=(OrderService)ac.getBean("orderService");
	  Order order =orderservice.getOrder(13);
	  
	 orderservice.getOrderArr(service.getCurrentVop(39));
	  

	  
   }
   
	@Test
	  public void testCartDels() {
		
		 CartItemService service;		
		 service=(CartItemService)ac.getBean("cartItemService");
		 CartService cartservice;
		 cartservice=(CartService)ac.getBean("cartService");
         String goodsIds = "70,71,72,";
         service.deleteCartItem(39, goodsIds);
         //cartItemService.deleteCartItem(current_user.getVipId(), goodsIdArr);
	}
}
