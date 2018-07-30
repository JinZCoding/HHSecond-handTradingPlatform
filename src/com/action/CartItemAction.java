package com.action;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Controller;

import com.alibaba.fastjson.JSONArray;
import com.entity.Cart;
import com.entity.VipInfo;
import com.opensymphony.xwork2.ActionSupport;
import com.service.CartItemService;
import com.service.CartService;
import com.utils.Page;
import com.utils.PageSplitUtil;

@Controller("cartItemAction")
public class CartItemAction extends ActionSupport{

	int goodsId;
	Integer page;
	String goodsIdArr;

	@Resource
	CartItemService cartItemService;
	@Resource
	CartService cartService;
	
	public void setCartItemService(CartItemService cartItemService) {
		this.cartItemService = cartItemService;
	}
	

	
	
	public void setCartService(CartService cartService) {
		this.cartService = cartService;
	}




	public int getGoodsId() {
		return goodsId;
	}



	public void setGoodsId(int goodsId) {
		this.goodsId = goodsId;
	}

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}
	public String getGoodsIdArr() {
		return goodsIdArr;
	}
	public void setGoodsIdArr(String goodsIdArr) {
		this.goodsIdArr = goodsIdArr;
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
	
	//删除购物车商品
	public String delCart() {
		Map<String, Object> session = ServletActionContext.getContext().getSession();
		VipInfo current_user = (VipInfo) session.get("current_user");
		if(current_user==null) {
			//如果未登陆给出提示信息
			
		}else {			
			cartItemService.deleteCartItem(current_user.getVipId(), goodsId);
		}
		return null;
	}
	
	//批量删除购物车商品
	public String delCartArr() {
		Map<String, Object> session = ServletActionContext.getContext().getSession();
		VipInfo current_user = (VipInfo) session.get("current_user");
		if(current_user==null) {
			//如果未登陆给出提示信息
			
		}else {			
			cartItemService.deleteCartItem(current_user.getVipId(), goodsIdArr);
		}
		return null;
	}
	
	
	
	
	//获取购物车列表
	public String getCartItem() {
		Map<String, Object> session = ServletActionContext.getContext().getSession();
		HttpServletRequest request = ServletActionContext.getRequest();
		VipInfo current_user = (VipInfo) session.get("current_user");
		if(current_user==null) {
			//如果未登陆给出提示信息
			
		}else {			
			Cart cart=cartService.getCart(current_user.getVipId());
			if(page==null) {
				page=1;
			}
			Page pageBean = new Page(page, 4, cartItemService.getCountCartItem(cart).intValue());
			JSONArray shopArr = cartItemService.getShopArr(cart,pageBean);
			String pageSplit = new PageSplitUtil().pageSplit2("cartItem_getCartItem.action?page=", pageBean);
			request.setAttribute("shopArr", shopArr);
			request.setAttribute("pageSplit", pageSplit);
			
		}
		return "cart";
	}
	
	
}
