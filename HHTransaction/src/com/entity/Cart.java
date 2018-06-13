package com.entity;

public class Cart {
	
	private int cartId;//购物车id
	private int cartNum; //购物车总数
	private float cartPrice;//购物车总价
	private VipInfo vipId;
	
	

	
	public Cart() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Cart(int cartNum, float cartPrice, VipInfo vipId) {
		super();
		
		this.cartNum = cartNum;
		this.cartPrice = cartPrice;
		this.vipId = vipId;
	}

	public VipInfo getVipId() {
		return vipId;
	}
	public void setVipId(VipInfo vipId) {
		this.vipId = vipId;
	}
	public int getCartId() {
		return cartId;
	}
	public void setCartId(int cartId) {
		this.cartId = cartId;
	}
	public int getCartNum() {
		return cartNum;
	}
	public void setCartNum(int cartNum) {
		this.cartNum = cartNum;
	}
	public float getCartPrice() {
		return cartPrice;
	}
	public void setCartPrice(float cartPrice) {
		this.cartPrice = cartPrice;
	}
	
	

}
