package com.entity;

import java.io.Serializable;

public class CartItemPk implements Serializable{
	
	private int cartId; //购物车id
    private int goodsId; //商品id
    
	
	
	public CartItemPk() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public CartItemPk(int cartId, int goodsId) {
		super();
		this.cartId = cartId;
		this.goodsId = goodsId;
	}

	public int getCartId() {
		return cartId;
	}
	public void setCartId(int cartId) {
		this.cartId = cartId;
	}
	public int getGoodsId() {
		return goodsId;
	}
	public void setGoodsId(int goodsId) {
		this.goodsId = goodsId;
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + cartId;
		result = prime * result + goodsId;
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
		CartItemPk other = (CartItemPk) obj;
		if (cartId != other.cartId)
			return false;
		if (goodsId != other.goodsId)
			return false;
		return true;
	}
    
    

}
