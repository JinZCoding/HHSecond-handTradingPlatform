package com.service;

import com.entity.Cart;

public interface CartService {
    void initCartforVipInfo(Cart cart);
    void updateCart(Cart cart);
    Cart getCart(int cartId);
    
}
