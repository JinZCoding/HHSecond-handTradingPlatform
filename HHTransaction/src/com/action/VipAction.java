package com.action;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.core.ApplicationContext;
import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.entity.Cart;
import com.entity.VipInfo;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.service.CartService;
import com.service.VipInfoService;
import com.utils.SendEmail;

@Controller("vipAction")
public class VipAction extends ActionSupport{
	String nickname;
	String password;
	String email;
	String Introduction;
	File stuheadfile;
	String stuheadfileFileName;
	String stuheadfileContentType;
	
	
	@Resource
	VipInfoService vipInfoService;
	@Resource
	CartService cartService;
	
	public void setVipInfoService(VipInfoService vipInfoService) {
		this.vipInfoService = vipInfoService;
	}
	
	public void setCartService(CartService cartService) {
		this.cartService = cartService;
	}

	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	



	public String getIntroduction() {
		return Introduction;
	}

	public void setIntroduction(String introduction) {
		Introduction = introduction;
	}
	
	

	public File getStuheadfile() {
		return stuheadfile;
	}

	public void setStuheadfile(File stuheadfile) {
		this.stuheadfile = stuheadfile;
	}

	public String getStuheadfileFileName() {
		return stuheadfileFileName;
	}

	public void setStuheadfileFileName(String stuheadfileFileName) {
		this.stuheadfileFileName = stuheadfileFileName;
	}

	public String getStuheadfileContentType() {
		return stuheadfileContentType;
	}

	public void setStuheadfileContentType(String stuheadfileContentType) {
		this.stuheadfileContentType = stuheadfileContentType;
	}

	/**
	 * 登录成功存储到session中
	 * 失败返回error
	 * @return
	 */
	public String login() {
		Map<String,Object> session=ActionContext.getContext().getSession();
		VipInfo vip = new VipInfo(nickname, password);
		VipInfo current_user=vipInfoService.login(vip);
		if(current_user!=null) {
			session.put("current_user", current_user);
			return "index";
		}
		else
			return "login";
		
	}
	/**
	 * 用户注销登录
	 */
	public String logout() {
		Map<String , Object> session = ActionContext.getContext().getSession();
		session.remove("current_user");
		return "index";
	}
	
	/**
	 * 用户昵称验证
	 * @throws IOException 
	 */
	public String validateNickName() throws IOException {
	    HttpServletResponse response = ServletActionContext.getResponse();
	    Map<String , Object> session = ActionContext.getContext().getSession();
	    response.setCharacterEncoding("utf-8");
	     VipInfo current_user = (VipInfo) session.get("current_user");
	     
	     PrintWriter out = response.getWriter();
	 	 JSONObject str = new JSONObject();
	 	 str.put("msg", false);
	 	    
	    if(current_user.getVipNickName().equals(nickname)) {
	        str.put("msg", true);
	    	return null;//昵称为更改不做任何操作
	    }else {
	    	boolean flag = vipInfoService.validateNickname(nickname);	 	  
	 	    if(flag) {
	 	    str.put("msg", true);
	 	    }
	 	    
	    }
	    out.println(str);
 		out.flush();
 		out.close();
 		return null;
	}
	
	
	/**
	 * 注册
	 * 注册时初始化其的购物车
	 */
	public String register() {
		SendEmail sendEmail = new SendEmail();
		sendEmail.sendMail(email, "123");	
	if(nickname!=null) {
		VipInfo vip = new VipInfo();
		vip.setVipNickName(nickname);
		vip.setVipPassWord(password);
		vip.setVipTokenTime(new Date());
		vip.setVipEmail(email);
		vip.setVipStatus(1);
		vipInfoService.insert(vip);
		//初始化购物车
		cartService.initCartforVipInfo(new Cart(0,0,vip));
		return "login";
	}else {
		return "reg";
	}
						
	}
	
	
	/**
	 * 编辑个人信息
	 * @throws IOException 
	 */
	public String editInfo() throws IOException {
	  Map<String,Object> session = ActionContext.getContext().getSession();
	  HttpServletResponse response = ServletActionContext.getResponse();
	  response.setCharacterEncoding("utf-8");
	  VipInfo current_user=  (VipInfo) session.get("current_user");
	  //System.out.println(Introduction);	  	  
	  
	  
	  
	  JSONObject infoArr = new JSONObject().parseObject(Introduction);
	  //头像初始化
	  infoArr.put("img","img/img_myinfo/myimage.jpg");
	  //将信息存入数据库
	  current_user.setVipIntroduction(infoArr.toJSONString());
	  vipInfoService.updateVipInfo(current_user);
  
	  PrintWriter out = response.getWriter();
	  out.print(infoArr);
	  out.flush();
	  out.close();
	
	  System.out.println(infoArr);
	  System.out.println(infoArr.get("ssex"));
		return null;
	}
	
	
	//查看个人信息
	public String getVipIntroduction() {
	    Map<String,Object> session = ActionContext.getContext().getSession();
	    HttpServletRequest requset = ServletActionContext.getRequest();
	
	    VipInfo current_user=  (VipInfo) session.get("current_user");
	    requset.setAttribute("infoArr", new JSONObject().parseObject(current_user.getVipIntroduction()));
		return "my";
	}

}
