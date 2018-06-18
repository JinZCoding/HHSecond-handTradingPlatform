package com.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dao.BaseDao;
import com.entity.Order;
import com.entity.OrderItem;

@Service("orderItemService")
public class OrderItemServiceImpl implements OrderItemService {
	
	@Resource
	BaseDao<OrderItem> baseDao;

	public void setBaseDao(BaseDao<OrderItem> baseDao) {
		this.baseDao = baseDao;
	}

	@Override
	public void insertOrderItem(OrderItem orderItem) {
		baseDao.save(orderItem);
		
	}

	@Override
	public List<OrderItem> getOderItemList(Order OrderId) {
		
		return baseDao.find("from OrderItem where orderId=?", new Object[] {OrderId});
	}
	
	
	

}
