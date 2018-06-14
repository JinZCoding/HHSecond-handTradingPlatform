package com.entity;

import java.util.Date;

import com.alibaba.fastjson.annotation.JSONField;

public class Message {
	
	private int messageId;  //消息id
	private VipInfo messageSendId;   //发送方会员ID
	private VipInfo messageReceiveId;  //接收方会员ID
	@JSONField(format="yyyy/MM/dd HH:mm:ss")
	private Date messageDate;//消息日期
	private String messageContent;//消息内容
	private int messageStatus;//消息状态
	
	
	
	
	public Message() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Message(VipInfo messageSendId, VipInfo messageReceiveId, String messageContent) {
		super();
		this.messageSendId = messageSendId;
		this.messageReceiveId = messageReceiveId;
		this.messageContent = messageContent;
		
	}
	
	public int getMessageId() {
		return messageId;
	}
	public void setMessageId(int messageId) {
		this.messageId = messageId;
	}
	public Date getMessageDate() {
		return messageDate;
	}
	public void setMessageDate(Date messageDate) {
		this.messageDate = messageDate;
	}
	public String getMessageContent() {
		return messageContent;
	}
	public void setMessageContent(String messageContent) {
		this.messageContent = messageContent;
	}
	
	public VipInfo getMessageSendId() {
		return messageSendId;
	}
	public void setMessageSendId(VipInfo messageSendId) {
		this.messageSendId = messageSendId;
	}
	public VipInfo getMessageReceiveId() {
		return messageReceiveId;
	}
	public void setMessageReceiveId(VipInfo messageReceiveId) {
		this.messageReceiveId = messageReceiveId;
	}
	public int getMessageStatus() {
		return messageStatus;
	}
	public void setMessageStatus(int messageStatus) {
		this.messageStatus = messageStatus;
	}

	
	
	

}
