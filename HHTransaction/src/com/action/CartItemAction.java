package com.action;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Controller;

import com.entity.VipInfo;
import com.opensymphony.xwork2.ActionSupport;
import com.service.CartItemService;

@Controller("cartItemAction")
public class CartItemAction extends ActionSupport{

	int goodsId;

	@Resource
	CartItemService cartItemService;
	
	public void setCartItemService(CartItemService cartItemService) {
		this.cartItemService = cartItemService;
	}

	
	
	public int getGoodsId() {
		return goodsId;
	}



	public void setGoodsId(int goodsId) {
		this.goodsId = goodsId;
	}



	//加购
	public String addCart() {
		Map<String, Object> session = ServletActionContext.getContext().getSession();
		VipInfo current_user = (VipInfo) session.get("current_user");
		if(current_user==null) {
			//如果未登陆给出提示信息
			
		}else {			
			cartItemService.insertCartItem(current_user.getVipId(), goodsId);
		}
		return null;
	}
	
	
}
