package com.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.entity.Order;
import com.entity.VipInfo;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.service.OrderService;
@Controller("orderAction")
public class OrderAction extends ActionSupport {
	 String goodsIdArr;
	

	@Resource
	OrderService orderService;
	

	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}
	

	public String getGoodsIdArr() {
		return goodsIdArr;
	}


	public void setGoodsIdArr(String goodsIdArr) {
		this.goodsIdArr = goodsIdArr;
	}


	public String addOrder() {
		 HttpServletResponse response = ServletActionContext.getResponse();
		 Map<String , Object> session = ActionContext.getContext().getSession();
		 response.setCharacterEncoding("utf-8");
		 VipInfo current_user = (VipInfo) session.get("current_user");
		 
		 Order order = new Order();
		 
		 //获取当前用户的收货地址
		 JSONObject temp = new JSONObject().parseObject(current_user.getVipIntroduction());
		 if(temp.get("dep").equals("")) {
			 order.setOrderAddress("黄淮学院");
		 }else {
			 order.setOrderAddress(temp.get("dep").toString());
		 }
		 order.setOrderDate(new Date());
		 order.setOrderPrice(0);
		 order.setOrderBuyId(current_user);
		// order.setOrderSellId(orderSellId);
		
		 orderService.insertOrder(order, goodsIdArr);
		 
		return null;
	}
	
	//获取当前用户的所有订单json数组
	public String getOrderArr() {
		 HttpServletRequest request  = ServletActionContext.getRequest();
		 Map<String , Object> session = ActionContext.getContext().getSession();
		 VipInfo current_user = (VipInfo) session.get("current_user");
		 
		JSONArray orderArr = orderService.getOrderArr(current_user);
		request.setAttribute("orderArr", orderArr);
		return "buyed";
	}
	
	

}
