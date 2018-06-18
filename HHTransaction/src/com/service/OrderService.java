package com.service;

import java.util.List;

import com.alibaba.fastjson.JSONArray;
import com.entity.Order;
import com.entity.VipInfo;

public interface OrderService {
	List<Order> getOrderList(VipInfo vipInfo);
	
	//JSON
	JSONArray getOrderArr(VipInfo vipInfo);
	
	void insertOrder(Order order,int[] goodsId);
	
	Order getOrder(int id);

}
