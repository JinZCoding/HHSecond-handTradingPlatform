package com.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.SimpleFormatter;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONArray;
import com.dao.BaseDao;
import com.entity.Order;
import com.entity.OrderItem;
import com.entity.OrderItemPk;
import com.entity.VipInfo;

@Service("orderService")
public class OrderServiceImpl implements OrderService{

	@Resource
	BaseDao<Order> baseDao;
	@Resource
	OrderItemService orderItemService;
	
	
	public void setBaseDao(BaseDao<Order> baseDao) {
		this.baseDao = baseDao;
	}
	

	public void setOrderItemService(OrderItemService orderItemService) {
		this.orderItemService = orderItemService;
	}


	@Override
	public List<Order> getOrderList(VipInfo vipInfo) {
		String hql="from Order where orderBuyId=?";
		return baseDao.find(hql, new Object[] {vipInfo});
	}
//添加一个订单同时添加一个item
	@Override
	public void insertOrder(Order order,int[] goodsIdArr) {
		//设置这个order的订单编号为时间戳
		
		baseDao.save(order);
		//然后获取这个order，在添加一个item
		int orderId = order.getOrderId();
		for(int i=0;i<goodsIdArr.length;i++) {
			int goodsId = goodsIdArr[i];
			OrderItemPk orderItemPK = new OrderItemPk(goodsId,orderId);
			OrderItem orderItem = new OrderItem();
			orderItem.setOrderItemPk(orderItemPK);
			
			orderItemService.insertOrderItem(orderItem);
		}
		
		
	}

	@Override
	public Order getOrder(int id) {		
		return baseDao.get(Order.class, id);
	}
	
	//获取该用户的所有订单列表（包括订单列表内的商品信息）
		@Override
		public JSONArray getOrderArr(VipInfo vipInfo) {
			List<Order> list = getOrderList(vipInfo);
			for(Order order:list) {
				//获得order信息
			    
				int id = order.getOrderId();
				float orderPrice = order.getOrderPrice();
				String orderAdd = order.getOrderAddress();
				Date orderDate = order.getOrderDate();
				//String orderSell = order.getOrderSellId().getVipNickName();
				//获得item信息
				Order orderId = getOrder(id);
				List<OrderItem> orderItem = orderItemService.getOderItemList(orderId);
				for(OrderItem item:orderItem) {
					String goodsName = item.getGoodsId().getGoodsName();
					float goodsPrice = item.getGoodsId().getGoodsPrice();
				}
			}
			return null;
		}

}
