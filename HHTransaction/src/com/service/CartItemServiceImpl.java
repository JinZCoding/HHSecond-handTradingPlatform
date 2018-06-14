package com.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dao.BaseDao;
import com.entity.Cart;
import com.entity.CartItem;
import com.entity.CartItemPk;
import com.entity.Goods;

@Service("cartItemService")
public class CartItemServiceImpl implements CartItemService {

	@Resource
	BaseDao<CartItem> baseDao;
	@Resource
	CartService cartService;
	@Resource
	GoodsService goodsService;
	
	
	public void setBaseDao(BaseDao<CartItem> baseDao) {
		this.baseDao = baseDao;
	}
	

public void setCartService(CartService cartService) {
		this.cartService = cartService;
	}



	public void setGoodsService(GoodsService goodsService) {
	this.goodsService = goodsService;
}


	//加购物车
	public void insertCartItem(int cartId, int goodsId) {
		//商品只能添加一次		
		CartItemPk cartItemPk = new CartItemPk(cartId,goodsId);
		CartItem cartItem = new CartItem();
		cartItem.setCartItemPk(cartItemPk);
		baseDao.save(cartItem);
		
		//怎么从数据库中取出这个cartItem
		Cart find_cart = cartService.getCart(cartId);
		Goods find_goods = goodsService.findGoods(goodsId);
		CartItem c = baseDao.get("from CartItem where cartId=? and goodsId=?", new Object[] {find_cart,find_goods});
		
		//更新一次cart
		
		Cart cart = c.getCartId();	
		int countNum = cart.getCartNum()+1;
		cart.setCartNum(countNum);
		
		Goods goods = c.getGoodsId();
		float countPrice = cart.getCartPrice()+goods.getGoodsPrice();
		cart.setCartPrice(countPrice);
		
		cartService.updateCart(cart);
		
	}

//获取购物车列表
	@Override
	public List<CartItem> findCartItemList(Cart cart) {
		return baseDao.find("from CartItem where cartId=?", new Object[] {cart});
	}


	
	
	

}
