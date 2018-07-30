package com.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.dao.BaseDao;
import com.entity.Cart;
import com.entity.CartItem;
import com.entity.CartItemPk;
import com.entity.Goods;
import com.entity.OrderItem;
import com.entity.OrderItemPk;
import com.utils.Page;

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


	
	//分页显示购物车列表
		@Override
		public List<CartItem> findCartItemList(Cart cart, Page page) {
			String hql="from CartItem where cartId=?";
			return baseDao.find(hql, new Object[] {cart}, page.getNowpage(), page.getPagesize());
		}



	@Override
	public JSONArray getShopArr(Cart cart,Page page) {
		JSONArray shopArr = new JSONArray();
		List<CartItem> list = findCartItemList(cart,page);
		for(CartItem cartItem : list) {
			JSONObject shop = new JSONObject();		
			shop.put("goodsImg", cartItem.getGoodsId().getGoodsImage());
			shop.put("goodsName", cartItem.getGoodsId().getGoodsName());
			shop.put("goodsPrice", cartItem.getGoodsId().getGoodsPrice());
			shop.put("goodsId", cartItem.getGoodsId().getGoodsId());
			shop.put("goodsNum", 1);
			shop.put("sellId", cartItem.getGoodsId().getGoodsVipId().getVipId());
		    shopArr.add(shop);
		}
		
		return shopArr;
	}


	@Override
	public Long getCountCartItem(Cart cart) {
		
		return baseDao.count("select count(*) from CartItem where cartId=?",new Object[] {cart});
	}
	
	
	//删除购物车的一条数据	
	@Override
	public void deleteCartItem(int cartId, int goodsId) {
			
		//怎么从数据库中取出这个cartItem
		Cart find_cart = cartService.getCart(cartId);
		Goods find_goods = goodsService.findGoods(goodsId);
		CartItem c = baseDao.get("from CartItem where cartId=? and goodsId=?", new Object[] {find_cart,find_goods});
		
		//更新一次cart
		
		Cart cart = c.getCartId();	
		int countNum = cart.getCartNum()-1;
		cart.setCartNum(countNum);
		
		Goods goods = c.getGoodsId();
		float countPrice = cart.getCartPrice()-goods.getGoodsPrice();
		cart.setCartPrice(countPrice);
		
		cartService.updateCart(cart);
		
		
		//先取出item后删除
		CartItemPk cartItemPk = new CartItemPk(cartId,goodsId);
		CartItem cartItem = new CartItem();
		cartItem.setCartItemPk(cartItemPk);
		baseDao.delete(cartItem);
		
	
	}

//批量删除
	@Override
	public void deleteCartItem(int cartId, String goodsIdStr) {
		
		//怎么从数据库中取出这个cartItem
		Cart find_cart = cartService.getCart(cartId);
		
		//批量删除与更新
		String[] goodsIdArr=goodsIdStr.split(",");
		for(int i=0;i<goodsIdArr.length;i++) {
		  int goodsId = Integer.parseInt(goodsIdArr[i]);
			
		Goods find_goods = goodsService.findGoods(goodsId);
		CartItem c = baseDao.get("from CartItem where cartId=? and goodsId=?", new Object[] {find_cart,find_goods});
		
		//更新一次cart
		
		Cart cart = c.getCartId();	
		int countNum = cart.getCartNum()-1;
		cart.setCartNum(countNum);
		
		Goods goods = c.getGoodsId();
		float countPrice = cart.getCartPrice()-goods.getGoodsPrice();
		cart.setCartPrice(countPrice);
		
		cartService.updateCart(cart);
		
		
		//先取出item后删除
		CartItemPk cartItemPk = new CartItemPk(cartId,goodsId);
		CartItem cartItem = new CartItem();
		cartItem.setCartItemPk(cartItemPk);
		baseDao.delete(cartItem);
		
		}
		
		
	}



	
	
	

}
