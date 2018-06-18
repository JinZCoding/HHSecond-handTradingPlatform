package com.entity;

public class CartItem {

	  private Cart cartId; //购物车id
	  private Goods goodsId; //商品id
	  CartItemPk cartItemPk = new CartItemPk();
	  
	  
	  
	
	public CartItemPk getCartItemPk() {
		return cartItemPk;
	}
	public void setCartItemPk(CartItemPk cartItemPk) {
		this.cartItemPk = cartItemPk;
	}
	public Cart getCartId() {
		return cartId;
	}
	public void setCartId(Cart cartId) {
		this.cartId = cartId;
	}
	public Goods getGoodsId() {
		return goodsId;
	}
	public void setGoodsId(Goods goodsId) {
		this.goodsId = goodsId;
	}
}