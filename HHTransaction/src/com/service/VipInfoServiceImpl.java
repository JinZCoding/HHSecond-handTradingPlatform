package com.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dao.BaseDao;
import com.entity.VipInfo;
import com.utils.EncryptPassword;

@Service("vipInfoService")
public class VipInfoServiceImpl implements VipInfoService {

	@Resource
	BaseDao<VipInfo> baseDao;

	public void setBaseDao(BaseDao<VipInfo> baseDao) {
		this.baseDao = baseDao;
	}

	/**
	 * 登录并加密
	 */
	@Override
	public VipInfo login(VipInfo vip) {
		VipInfo currVip = null;

		EncryptPassword ep = new EncryptPassword();

		String hql = "from VipInfo v where vipNickName=?and vipPassWord=?";
		VipInfo v = baseDao.get(hql, new Object[] { vip.getVipNickName(), ep.KL(vip.getVipPassWord()) });
		if (v != null) {
			currVip = v;
		}
		return currVip;
	}

	/**
	 * 注册并密码加密
	 */
	public void insert(VipInfo vip) {
		// 密码加密
		EncryptPassword ep = new EncryptPassword();
		String newstr = ep.KL(vip.getVipPassWord());
		vip.setVipPassWord(newstr);
		baseDao.save(vip);
	}

	// 根据id找到vip用户test用
	@Override
	public VipInfo getCurrentVop(int id) {

		return baseDao.get(VipInfo.class, id);
	}

	// 更新用户
	@Override
	public void updateVipInfo(VipInfo vip) {

		baseDao.update(vip);
	}

	// 用户名验证
	@Override
	public boolean validateNickname(String nickname) {
		String hql = "from VipInfo where vipNickName=?";
		VipInfo vip = baseDao.get(hql, new Object[] { nickname });
		if (vip == null) {
			return true;
		}
		return false;
	}
}
