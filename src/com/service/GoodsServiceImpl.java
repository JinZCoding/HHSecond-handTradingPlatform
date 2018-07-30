package com.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.aspectj.util.FileUtil;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.dao.BaseDao;
import com.entity.Goods;
import com.entity.VipInfo;
import com.utils.FtpBean;
import com.utils.FtpUtil;
import com.utils.Page;

@Service("goodsService")
public class GoodsServiceImpl  implements GoodsService{

	@Resource
	BaseDao<Goods> baseDao;
	
	


	public void setBaseDao(BaseDao<Goods> baseDao) {
		this.baseDao = baseDao;
	}

	@Override
	public List<Goods> findGoodsByClassify(int id) {
		String hql="from Goods where classifyId=?";		
		return baseDao.find(hql, new Object[] {id});
	}

 //分页
	@Override
	public List<Goods> findGoodsByClassify(int id, Page page) {
		int firstRow = page.getNowpage();
		int maxRow = page.getPagesize();		
		String hql="from Goods where classifyId=?";		
		return baseDao.find(hql, new Object[] {id}, firstRow, maxRow);
	}

//总计
	@Override
	public Long countGoodsByClassify(int id) {
		String hql = "select count(*) from Goods where classifyId=? ";		
		return baseDao.count(hql,new Object[] {id});
	}

//查看详情
	@Override
	public Goods findGoods(int id) {
		return baseDao.get(Goods.class, id);
	}

//插入一个goods
	@Override
	public void insertGoods(File file,String filePath,String fileName,Goods goods) {
		//将文件保存到本地磁盘上
		//filepath="G:/temp"

		
		FileInputStream in=null;
		SimpleDateFormat sf = new SimpleDateFormat("yyyyMMddHHmmss");
		String str=sf.format(new Date()).toString();
		filePath +=str+fileName;
		fileName=str+fileName;
		
		try {
		//图片保存到了本地
			File tempFile  = new File(filePath);
			FileUtil.copyFile(file, tempFile);
//			in = new FileInputStream(new File(filePath));
//			System.out.println(in);
		} catch (Exception e1) {
			
			e1.printStackTrace();
		}
	
//		FtpBean ftpBean = new FtpBean("10.115.15.162", 21, "zhu", "123456", "G:/ftp/", fileName, in,"");
//		FtpUtil ftp = new FtpUtil();
		//图片上传到ftp上
//		boolean flag=ftp.uploadFile(ftpBean);
//		if(flag) {
			//goods.setGoodsImage(ftpBean.getFtpPath()+fileName);
			//System.out.println("添加图片");
//		}
		
		goods.setGoodsImage("img/goods/"+fileName);
    	 baseDao.save(goods);
		
	}
	
//模糊搜索商品
	@Override
	public List<Goods> findGoods(String name,Page page) {
		String hql="from Goods where goodsName like ? or goodsIntroduction like ?";
		name = "%"+name+"%";
		return baseDao.find(hql, new Object[] {name,name},page.getNowpage(),page.getPagesize());
	}
//模糊查询总数
	@Override
	public Long countGoods(String name) {
		String hql=" select count(*) from Goods where goodsName like ? or goodsIntroduction like ?";
		name = "%"+name+"%";
		return baseDao.count(hql, new Object[] {name,name});
	}

//返回一个GoodsList的json数组(商品展示)
	@Override
	public JSONArray getGoodsJsonArr(List<Goods> list) {
		JSONArray GoodsArr = new JSONArray();
		for(Goods goods : list) {
			JSONObject Goods = new JSONObject();
			
			Goods.put("id", goods.getGoodsId());
			//img地址是在这个时候从ftp服务器上下载到项目中
			//File file = new File(goods.getGoodsImage());
			Goods.put("img",goods.getGoodsImage());//模拟
			Goods.put("name", goods.getGoodsName());
			Goods.put("price", goods.getGoodsPrice());
			Goods.put("info", goods.getGoodsIntroduction());
			//System.out.println(Goods.get("img"));
			GoodsArr.add(Goods);
			//System.out.println(goods.getGoodsName());
		}
		//System.out.println(GoodsArr);
		return GoodsArr;
	}




	@Override
	public Long getGoodsCountByVipId(VipInfo id) {
		String hql="select count(*) from Goods where goodsVipId=?";
		return baseDao.count(hql, new Object[] {id});
	}

	//获取我发布的商品，将其封装成JSON
	@Override
	public JSONArray getshopArr(VipInfo id,Page page) {
		String hql="from Goods where goodsVipId=?";
		List<Goods> list =  baseDao.find(hql, new Object[] {id}, page.getNowpage(), page.getPagesize());
		JSONArray shopArr = new JSONArray();
		for(Goods goods:list) {
			JSONObject temp = new JSONObject();
			temp.put("goodsImg", goods.getGoodsImage());
			temp.put("goodsName", goods.getGoodsName());
			temp.put("goodsPrice",goods.getGoodsPrice());
			temp.put("goodsNum", goods.getGoodsNum());
			temp.put("goodsId", goods.getGoodsId());
			temp.put("sellerId", goods.getGoodsVipId().getVipId());
		   shopArr.add(temp);
		}
		return shopArr;
	}
//删除当前用户发布的商品
	@Override
	public void deletePutGoods(VipInfo id, int goodsId) {
		//String[] goodsIdArr = goodsIdStr.split(",");
			Goods goods = findGoods(goodsId);
			//baseDao.delete(goods);
			baseDao.executeHql("delete  from Goods where goodsVipId=? and goodsId=?",new Object[] {id,goodsId});
		
	}


}
