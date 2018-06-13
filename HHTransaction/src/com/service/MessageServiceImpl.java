package com.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dao.BaseDao;
import com.entity.Message;
import com.entity.VipInfo;
import com.utils.Page;

@Service("messageService")
public class MessageServiceImpl implements MessageService {

	@Resource
	BaseDao<Message> baseDao;

	public void setBaseDao(BaseDao<Message> baseDao) {
		this.baseDao = baseDao;
	}

	// 获取消息记录并更新消息状态
	@Override
	public List<Message> getMessageList(VipInfo fromId, VipInfo toId) {
		//更新消息状态
		String hql1 = "update Message  SET messageStatus = 1 WHERE (messageSendId=? and messageReceiveId=?)  OR (messageSendId=? and messageReceiveId=? )";
		baseDao.executeHql(hql1, new Object[] { fromId, toId, toId, fromId });

		String hql2 = "from Message where (messageSendId=? and messageReceiveId=? ) or (messageSendId=? and messageReceiveId=? )  order by messageDate";
		return baseDao.find(hql2, new Object[] { fromId, toId, toId, fromId });
	}

	// 带分页的查看消息记录
	@Override
	public List<Message> getMessageList(VipInfo fromId, VipInfo toId, Page page) {
		String hql = "from Message where (messageSendId=? and messageReceiveId=? ) or (messageSendId=? and messageReceiveId=? )  order by messageDate ";
		return baseDao.find(hql, new Object[] { fromId, toId, toId, fromId }, page.getNowpage(), page.getPagesize());
	}

	// 添加一条消息
	@Override
	public void insertMessage(Message message) {
		// message.setStatus(0);
		baseDao.save(message);
	}

	// 更新消息状态
	@Override
	public void updateMessageStatus(VipInfo fromId, VipInfo toId) {
		String hql1 = "update Message  SET messageStatus = 1 WHERE (messageSendId=? and messageReceiveId=?)  OR (messageSendId=? and messageReceiveId=? )";
		baseDao.executeHql(hql1, new Object[] { fromId, toId, toId, fromId });
	}

}
