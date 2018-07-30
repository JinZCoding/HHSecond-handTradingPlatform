package com.service;

import java.util.List;

import com.alibaba.fastjson.JSONArray;
import com.entity.Cart;
import com.entity.CartItem;
import com.utils.Page;

public interface CartItemService {
	
   void insertCartItem(int cartId,int goodsId);
   void deleteCartItem(int cartId,int goodsId);
   //批量删除
   void deleteCartItem(int cartId,String goodsIdArr);
  
   //分页
   List<CartItem> findCartItemList(Cart cart,Page page);
   Long getCountCartItem(Cart cart);
   JSONArray getShopArr(Cart cart,Page page);
   
   
   
   
}
