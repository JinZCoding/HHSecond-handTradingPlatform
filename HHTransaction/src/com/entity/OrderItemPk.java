package com.entity;

import java.io.Serializable;

public class OrderItemPk implements Serializable{

	private int goodsId;//商品id
	private int orderId;// 订单id
	//private Goods goodsId;
	//private Order orderId;
	
	public OrderItemPk() {
		super();
		// TODO Auto-generated constructor stub
	}
	

	

	public OrderItemPk(int goodsId, int orderId) {
		super();
		this.goodsId = goodsId;
		this.orderId = orderId;
	}


	public int getGoodsId() {
		return goodsId;
	}

	public void setGoodsId(int goodsId) {
		this.goodsId = goodsId;
	}
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + goodsId;
		result = prime * result + orderId;
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		OrderItemPk other = (OrderItemPk) obj;
		if (goodsId != other.goodsId)
			return false;
		if (orderId != other.orderId)
			return false;
		return true;
	}
	
}
