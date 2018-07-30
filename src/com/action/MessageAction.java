package com.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.entity.Message;
import com.entity.VipInfo;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.service.MessageService;
import com.service.VipInfoService;

@Controller("messageAction")
public class MessageAction extends ActionSupport{

	 int fromId;//发送者的id
	
	 String messageContent;//消息内容
	 
	// String goodsIdArr;//添加商品
	 
	 @Resource
	 MessageService messageService;
	 @Resource
	 VipInfoService vipInfoService;
	  

	public void setMessageService(MessageService messageService) {
		this.messageService = messageService;
	}

	public void setVipInfoService(VipInfoService vipInfoService) {
		this.vipInfoService = vipInfoService;
	}

	public int getFromId() {
		return fromId;
	}

	public void setFromId(int fromId) {
		this.fromId = fromId;
	}
	
	
	
	public String getMessageContent() {
		return messageContent;
	}

	public void setMessageContent(String messageContent) {
		this.messageContent = messageContent;
	}
	


	//获取消息列表
	public String getMessageForCurr() {
		Map<String,Object> session = ActionContext.getContext().getSession();
		HttpServletRequest request = ServletActionContext.getRequest();
		VipInfo current_user =(VipInfo) session.get("current_user");
		//获取所有人给当前用户发的消息列表
		
		JSONArray talkArr = messageService.getMessArrToCurr(current_user);
		request.setAttribute("talkArr", talkArr);
		System.out.println(talkArr);
		
		return "mess";
	}
	
	//获取聊天记录
	public String  getMessageRecord() throws IOException {
		Map<String,Object> session = ActionContext.getContext().getSession();
		VipInfo current_user =(VipInfo) session.get("current_user");
		//获取两人聊天记录
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("UTF-8");
		JSONArray messArr = messageService.getMessArr(vipInfoService.getCurrentVop(fromId), current_user);
		//System.out.println(messArr);
		//传至前台
		PrintWriter out = response.getWriter();
		out.println(messArr);
		out.flush();
		out.close();
		return null;
	}
	 
	//发送消息
	public String sendMessage() {
		Map<String,Object> session = ActionContext.getContext().getSession();
		VipInfo current_user =(VipInfo) session.get("current_user");
		//获取发送者和接收者
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("UTF-8");
    
		//构造方法（发送方，接收方，内容，状态（0是已读，1是未读））
		Message message = new Message(current_user,vipInfoService.getCurrentVop(fromId),messageContent);
		
		message.setMessageDate(new Date());
		messageService.insertMessage(message);
		
		return null;
	}
	
	
	//发送消息
	public String sellToCurMessage() {
		Map<String,Object> session = ActionContext.getContext().getSession();
		VipInfo current_user =(VipInfo) session.get("current_user");
		//获取发送者和接收者
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("UTF-8");
    
		//构造方法（发送方，接收方，内容，状态（0是已读，1是未读））
		Message message = new Message(vipInfoService.getCurrentVop(fromId),current_user,messageContent);
		
		message.setMessageDate(new Date());
		messageService.insertMessage(message);
		
		//发送消息后，添加
		
		return null;
	}

}
