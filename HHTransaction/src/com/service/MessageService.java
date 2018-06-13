package com.service;

import java.util.List;

import com.entity.Message;
import com.entity.VipInfo;
import com.utils.Page;

public interface MessageService {
	
	//获取消息记录
	List<Message> getMessageList(VipInfo fromId,VipInfo toId);
	List<Message> getMessageList(VipInfo fromId,VipInfo toId,Page page);

	void insertMessage(Message message);
	void updateMessageStatus(VipInfo fromId, VipInfo toId);
}
