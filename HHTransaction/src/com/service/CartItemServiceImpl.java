package com.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dao.BaseDao;
import com.entity.CartItem;
import com.entity.CartItemPk;

@Service("cartItemService")
public class CartItemServiceImpl implements CartItemService {

	@Resource
	BaseDao<CartItem> baseDao;
	
	public void setBaseDao(BaseDao<CartItem> baseDao) {
		this.baseDao = baseDao;
	}

//加购物车
	public void insertCartItem(int cartId, int goodsId) {
		CartItemPk cartItemPk = new CartItemPk(cartId,goodsId);
		CartItem cartItem = new CartItem();
		cartItem.setCartItemPk(cartItemPk);
		baseDao.save(cartItem);
	}

}
