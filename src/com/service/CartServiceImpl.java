package com.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dao.BaseDao;
import com.entity.Cart;

@Service("cartService")
public class CartServiceImpl implements CartService{

	@Resource
	 BaseDao<Cart> baseDao;
	
	public void setBaseDao(BaseDao<Cart> baseDao) {
		this.baseDao = baseDao;
	}
	
	
	//注册用户时赋予其一个cat
	@Override
	public void initCartforVipInfo(Cart cart) {
		baseDao.save(cart);
		
	}

//更新cart
	@Override
	public void updateCart(Cart cart) {
		baseDao.update(cart);
		
	}

//获取cart对象
	@Override
	public Cart getCart(int cartId) {
		return baseDao.get(Cart.class, cartId);
	}
	



	

}
