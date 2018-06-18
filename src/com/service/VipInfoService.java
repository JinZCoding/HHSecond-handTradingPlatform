package com.service;

import com.entity.VipInfo;

public interface VipInfoService {
     
	VipInfo login(VipInfo vip);
	void insert(VipInfo vip) ;
	VipInfo getCurrentVop(int id);
	void updateVipInfo(VipInfo vip);
	boolean  validateNickname(String nickname);
}
