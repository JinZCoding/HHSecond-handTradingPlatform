package com.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
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
		//更新(发送给当前用户的)消息状态为已读
		String hql1 = "update Message  SET messageStatus = 0 WHERE (messageSendId=? and messageReceiveId=?)  ";
		baseDao.executeHql(hql1, new Object[] { fromId, toId});

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
		 message.setMessageStatus(1);
		baseDao.save(message);
	}

  //获取的是封装后的mess
	@Override
	public JSONArray getMessArr(VipInfo fromId, VipInfo toId) {
		
		JSONArray messArr = new JSONArray();
		List<Message> list =getMessageList(fromId, toId);
		//将日期格式化
		SimpleDateFormat sf = new SimpleDateFormat("yyyy/MM/dd HH:mm");
		
		for(Message m : list) {
			JSONObject mess = new JSONObject();		
			
			//System.out.println(m.getMessageSendId()+"与  "+toId);
			//判断是谁说的话
			if(m.getMessageSendId().getVipId()==toId.getVipId()) {
				mess.put("from", 1);
			}else {
				mess.put("from", 0);
			}		
			mess.put("mess", m.getMessageContent());
			mess.put("time", sf.format(m.getMessageDate()));
			messArr.add(mess);
						
			
		}
		return messArr;
	}

//获取所有聊天 对象(接收者是发送者)
//获取说的最新消息的每个对象group by messageSendId不能让最新聊天的人置顶
	@Override
	public List<Message> getMessageToCurr(VipInfo toId) {
		String hql="from Message  where messageReceiveId=?  order by messageDate desc";
	   List<Message> list = baseDao.find(hql, new Object[] {toId});
	   int sendId[] = new int[300];
	   List<Message> messList  = new ArrayList<Message>();
	   for(Message m : list) {
		   if(sendId[m.getMessageSendId().getVipId()]==0) {
			   messList.add(m);
			   sendId[m.getMessageSendId().getVipId()]=1;
		   }
	   }
		return messList;
	}


//将消息列表封装成json数组
	@Override
	public JSONArray getMessArrToCurr(VipInfo toId) {
		JSONArray talkArr = new JSONArray();
		List<Message> list = getMessageToCurr(toId);
		for(Message m : list) {
			JSONObject talk = new JSONObject();
			talk.put("sendId", m.getMessageSendId().getVipId());
			JSONObject temp = new JSONObject().parseObject(m.getMessageSendId().getVipIntroduction());
			talk.put("imgsrc", temp.get("img"));
			//消息记录(接收者为当前用户的消息记录)
			
			talk.put("talkstatus", m.getMessageStatus());
			talkArr.add(talk);
		}
		return talkArr;
	}
	
 


}
