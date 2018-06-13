package com.entity;

public class OrderItem {
	
	private Goods goodsId;//商品id
	//private int orderId;// 订单id
	OrderItemPk orderItemPk = new OrderItemPk();
	private Order orderId;
	

	public Goods getGoodsId() {
		return goodsId;
	}
	public void setGoodsId(Goods goodsId) {
		this.goodsId = goodsId;
	}
	public Order getOrderId() {
		return orderId;
	}
	public void setOrderId(Order orderId) {
		this.orderId = orderId;
	}
	public OrderItemPk getOrderItemPk() {
		return orderItemPk;
	}
	public void setOrderItemPk(OrderItemPk orderItemPk) {
		this.orderItemPk = orderItemPk;
	}
	
	
	
	

}
