package com.entity;

import java.util.Date;

import com.alibaba.fastjson.annotation.JSONField;

public class VipInfo {
    private int vipId;     //会员id
    private String vipNickName;//会员昵称
    private String vipPassWord; //会员密码
    private String vipEmail;
    private String vipActiCode;
    private int vipStatus;
//    @JSONField(format="yyyy/MM/dd HH:mm:ss")
    private Date vipTokenTime;
    private String vipIntroduction;//个人信息
    


    
	public VipInfo() {
		super();
	}
	
	public VipInfo(int vipId) {
		super();
		this.vipId = vipId;
	}

	public VipInfo(String vipNickName, String vipPassWord) {
		super();
		this.vipNickName = vipNickName;
		this.vipPassWord = vipPassWord;
	}
	public int getVipId() {
		return vipId;
	}
	public void setVipId(int vipId) {
		this.vipId = vipId;
	}
	public String getVipNickName() {
		return vipNickName;
	}
	public void setVipNickName(String vipNickName) {
		this.vipNickName = vipNickName;
	}
	public String getVipPassWord() {
		return vipPassWord;
	}
	public void setVipPassWord(String vipPassWord) {
		this.vipPassWord = vipPassWord;
	}
	public String getVipEmail() {
		return vipEmail;
	}
	public void setVipEmail(String vipEmail) {
		this.vipEmail = vipEmail;
	}
	public String getVipActiCode() {
		return vipActiCode;
	}
	public void setVipActiCode(String vipActiCode) {
		this.vipActiCode = vipActiCode;
	}
	public int getVipStatus() {
		return vipStatus;
	}
	public void setVipStatus(int vipStatus) {
		this.vipStatus = vipStatus;
	}
	public Date getVipTokenTime() {
		return vipTokenTime;
	}
	public void setVipTokenTime(Date vipTokenTime) {
		this.vipTokenTime = vipTokenTime;
	}

	public String getVipIntroduction() {
		return vipIntroduction;
	}

	public void setVipIntroduction(String vipIntroduction) {
		this.vipIntroduction = vipIntroduction;
	}
	
	
 
	
    
    



	
	
    
    
}
