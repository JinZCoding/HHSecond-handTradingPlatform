package com.service;

import java.util.List;

import com.entity.Order;
import com.entity.OrderItem;

public interface OrderItemService {
	
   void insertOrderItem(OrderItem orderItem);
   
   List<OrderItem> getOderItemList(Order OrderId);
}
