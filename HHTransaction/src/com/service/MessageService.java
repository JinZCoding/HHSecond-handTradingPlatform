package com.service;

import java.util.List;

import com.alibaba.fastjson.JSONArray;
import com.entity.Message;
import com.entity.VipInfo;
import com.utils.Page;

public interface MessageService {
	
	//获取与某个人的消息记录
	List<Message> getMessageList(VipInfo fromId,VipInfo toId);
	List<Message> getMessageList(VipInfo fromId,VipInfo toId,Page page);
	//将消息列表封装成JsonArr
	JSONArray getMessArr(VipInfo fromId, VipInfo toId);


	void insertMessage(Message message);
	
	//获取所有聊天消息发送者
	List<Message> getMessageToCurr(VipInfo toId);
	//将消息列表封装成JsonArr
	JSONArray getMessArrToCurr(VipInfo toId);
	
	

}
