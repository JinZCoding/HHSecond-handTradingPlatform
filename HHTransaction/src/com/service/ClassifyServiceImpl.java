package com.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dao.BaseDao;
import com.entity.Classify;
@Service("classifyService")
public class ClassifyServiceImpl implements ClassifyService {
    @Resource
	BaseDao<Classify> baseDao ;
	
	
	public void setBaseDao(BaseDao<Classify> baseDao) {
		this.baseDao = baseDao;
	}


	@Override
	public void insertClassify(Classify classify) {
	  baseDao.save(classify);

	}


	@Override
	public Classify getClassify(String classofyName) {
		String hql = "from Classify where classifyName=?";
		return baseDao.get(hql, new Object[]{classofyName});
	}

}
