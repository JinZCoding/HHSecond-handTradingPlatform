package com.service;

import java.io.File;
import java.util.List;

import com.alibaba.fastjson.JSONArray;
import com.entity.Goods;
import com.entity.VipInfo;
import com.utils.Page;

public interface GoodsService {
	List<Goods> findGoodsByClassify(int id);
	List<Goods> findGoodsByClassify(int id,Page page);
	Long countGoodsByClassify(int id);
	Goods findGoods(int id);
	List<Goods> findGoods(String name,Page page);
	Long countGoods(String name);
	//添加一个商品
	void insertGoods(File file,String filePath,String fileName,Goods goods);
	//封装一个Goods的json数组
	JSONArray getGoodsJsonArr(List<Goods> list);

	
	
	
	//我发布的商品的总数量
	Long getGoodsCountByVipId(VipInfo id);
	//找到所有我发布的商品封装一个Goods的json数组
	JSONArray getshopArr(VipInfo id,Page page);
	
	//删除发布商品没有批量
	void deletePutGoods(VipInfo id,int goodsId);
	
	

}
