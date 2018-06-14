package com.service;

import java.util.List;

import com.entity.Cart;
import com.entity.CartItem;

public interface CartItemService {
	
   void insertCartItem(int cartId,int goodsId);
   List<CartItem> findCartItemList(Cart cart);
   
}
