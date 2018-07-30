package com.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.SimpleFormatter;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.dao.BaseDao;
import com.entity.Goods;
import com.entity.Order;
import com.entity.OrderItem;
import com.entity.OrderItemPk;
import com.entity.VipInfo;
import com.mchange.v2.cfg.PropertiesConfigSource.Parse;

@Service("orderService")
public class OrderServiceImpl implements OrderService{

	@Resource
	BaseDao<Order> baseDao;
	@Resource
	OrderItemService orderItemService;
	@Resource
	GoodsService goodsService;

	
	
	public void setBaseDao(BaseDao<Order> baseDao) {
		this.baseDao = baseDao;
	}
	

	public void setOrderItemService(OrderItemService orderItemService) {
		this.orderItemService = orderItemService;
	}
	

	public void setGoodsService(GoodsService goodsService) {
		this.goodsService = goodsService;
	}


//	@Override
//	public List<Order> getOrderList(VipInfo vipInfo) {
//		String hql="from Order where orderBuyId=?";
//		return baseDao.find(hql, new Object[] {vipInfo});
//	}
	
//添加一个订单同时添加一个item
	@Override
	public void insertOrder(Order order,String goodsIdStr) {
		//设置这个order的订单编号为时间戳
		
		baseDao.save(order);
		//然后获取这个order，在添加一个item
		int orderId = order.getOrderId();
		//转换goodsIdArr
		String[] goodsIdArr=goodsIdStr.split(",");
		for(int i=0;i<goodsIdArr.length;i++) {
			int goodsId = Integer.parseInt(goodsIdArr[i]);
			OrderItemPk orderItemPK = new OrderItemPk(goodsId,orderId);
			OrderItem orderItem = new OrderItem();
			orderItem.setOrderItemPk(orderItemPK);
			
			orderItemService.insertOrderItem(orderItem);
			//找到goodIs商品的价格
			float goodsPrice = goodsService.findGoods(goodsId).getGoodsPrice();
			//更新订单的总价钱
			float totalPrice = order.getOrderPrice()+goodsPrice;
			order.setOrderPrice(totalPrice);
			baseDao.update(order);
			
		}
		
		
	}

	@Override
	public Order getOrder(int id) {		
		return baseDao.get(Order.class, id);
	}
	
	//获取该用户的所有订单列表（包括订单列表内的商品信息）
		@Override
		public JSONArray getOrderArr(VipInfo vipInfo) {		
			List<Order> list =  baseDao.find("from Order where orderBuyId=?", new Object[] {vipInfo});
			//应该是orderArr...
			JSONArray orderArr=new JSONArray();;
			JSONArray goodsArr=null;
			for(Order order:list) {												
				goodsArr = new JSONArray();	
				//获得order信息
			    JSONObject temp = new JSONObject();
			    
				int id = order.getOrderId();
				
				temp.put("orderId", id);
				temp.put("orderPrice", order.getOrderPrice());
				temp.put("orderAddress",  order.getOrderAddress());
				SimpleDateFormat sf = new SimpleDateFormat("yyyy年MM月dd日 HH:mm");
				temp.put("orderDate", sf.format(order.getOrderDate()));			   
				temp.put("buyName", order.getOrderBuyId().getVipNickName());
				//String orderSell = order.getOrderSellId().getVipNickName();
				
				//获得item信息
				Order orderId = getOrder(id);
				
				List<OrderItem> orderItem = orderItemService.getOderItemList(orderId);
				
				for(OrderItem item:orderItem) {
					//orderArr嵌套的goodsArr								
					 JSONObject temp2 = new JSONObject();
					 temp2.put("goodsId", item.getGoodsId().getGoodsId());
					 temp2.put("goodsName", item.getGoodsId().getGoodsName());
					// temp2.put("goodsImg", item.getGoodsId().getGoodsImage());
					 temp2.put("goodsPrice", item.getGoodsId().getGoodsPrice());
					 //卖家id
					 temp2.put("vipSellId", item.getGoodsId().getGoodsVipId().getVipId());
					 temp2.put("vipSellName", item.getGoodsId().getGoodsVipId().getVipNickName());
					 goodsArr.add(temp2);
					 
					 temp.put("goodsList", goodsArr);
				     
				}				
				orderArr.add(temp);
				//System.out.println("订单为"+id+"  "+orderArr);
			}
			System.out.println(orderArr);
			return orderArr;
		}

}
