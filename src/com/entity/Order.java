package com.entity;

import java.util.Date;

public class Order {
   private int orderId;   //订单id
   private VipInfo orderBuyId; //买方会员id
   private VipInfo orderSellId; //卖方会员id
   private Date orderDate;  //订单日期
   private String orderAddress; //订单地址
   private float orderPrice;   //订单价格
   
   
public int getOrderId() {
	return orderId;
}
public void setOrderId(int orderId) {
	this.orderId = orderId;
}

public VipInfo getOrderBuyId() {
	return orderBuyId;
}
public void setOrderBuyId(VipInfo orderBuyId) {
	this.orderBuyId = orderBuyId;
}
public VipInfo getOrderSellId() {
	return orderSellId;
}
public void setOrderSellId(VipInfo orderSellId) {
	this.orderSellId = orderSellId;
}
public Date getOrderDate() {
	return orderDate;
}
public void setOrderDate(Date orderDate) {
	this.orderDate = orderDate;
}
public String getOrderAddress() {
	return orderAddress;
}
public void setOrderAddress(String orderAddress) {
	this.orderAddress = orderAddress;
}
public float getOrderPrice() {
	return orderPrice;
}
public void setOrderPrice(float orderPrice) {
	this.orderPrice = orderPrice;
}
   
   
}
