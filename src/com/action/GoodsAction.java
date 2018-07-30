package com.action;

import java.io.File;
import java.io.IOException;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;



import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.entity.Classify;
import com.entity.Goods;
import com.entity.VipInfo;
import com.opensymphony.xwork2.ActionSupport;
import com.service.ClassifyService;
import com.service.GoodsService;

import com.utils.PageSplitUtil;
import com.utils.Page;



@Controller("goodsAction")
public class GoodsAction extends ActionSupport {
	int classifyId;
	Integer page;
	int goodsId;//goodsId
	
	File imgfile;//图片
    String imgfileFileName;
    String imgfileContentType;
    //商品信息
     String goodsName;
     int goodsPrice;
     String goodsClassify;//类型名
     String goodsIntroduction;//
	
    @Resource
	GoodsService goodService ;
    @Resource
    ClassifyService classifyService;

	public void setGoodService(GoodsService goodService) {
		this.goodService = goodService;
	}
	
    
	public void setClassifyService(ClassifyService classifyService) {
		this.classifyService = classifyService;
	}


	public int getClassifyId() {
		return classifyId;
	}

	public void setClassifyId(int classifyId) {
		this.classifyId = classifyId;
	}
	

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}
	public int getGoodsId() {
		return goodsId;
	}

	public void setGoodsId(int goodsId) {
		this.goodsId = goodsId;
	}
	
	public File getImgfile() {
		return imgfile;
	}


	public void setImgfile(File imgfile) {
		this.imgfile = imgfile;
	}


	public String getImgfileFileName() {
		return imgfileFileName;
	}


	public void setImgfileFileName(String imgfileFileName) {
		this.imgfileFileName = imgfileFileName;
	}


	public String getImgfileContentType() {
		return imgfileContentType;
	}


	public void setImgfileContentType(String imgfileContentType) {
		this.imgfileContentType = imgfileContentType;
	}


	public String getGoodsName() {
		return goodsName;
	}

	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}

	public String getGoodsClassify() {
		return goodsClassify;
	}

	public void setGoodsClassify(String goodsClassify) {
		this.goodsClassify = goodsClassify;
	}

	public String getGoodsIntroduction() {
		return goodsIntroduction;
	}

	public void setGoodsIntroduction(String goodsIntroduction) {
		this.goodsIntroduction = goodsIntroduction;
	}
	
	public int getGoodsPrice() {
		return goodsPrice;
	}


	public void setGoodsPrice(int goodsPrice) {
		this.goodsPrice = goodsPrice;
	}


	//转换成json
	public String GoosListByClassify() throws IOException {
		HttpServletRequest request = ServletActionContext.getRequest();	
		
		if(page==null) {
			page=1;
		}		
		int count = goodService.countGoodsByClassify(classifyId).intValue();
		Page pageBean = new Page(page, 8,count);
		String pageSplit = new PageSplitUtil().pageSplit("goods_GoosListByClassify.action?classifyId="+classifyId+"&page=", pageBean);
		List<Goods> list =goodService.findGoodsByClassify(classifyId,pageBean);
		//将list封装成json传到前台
		request.setAttribute("GoodsArr", goodService.getGoodsJsonArr(list));
		request.setAttribute("count", count);
		request.setAttribute("pageSplit", pageSplit);
		//System.out.println(request.getSession().getServletContext().getRealPath("/"));//获取web项目的路径 );
		return "goodsList";
	}
	
	//查看详情
	public String findDetailGoods() {
		HttpServletRequest request = ServletActionContext.getRequest();
		Goods goods = goodService.findGoods(goodsId);
		request.setAttribute("goods", goods);
		//获取该用户的id
		//int id = goods.getGoodsVipId().getVipId();
		return "detail";
	}
	
	//发布商品
	public String  putGoods() throws IOException {
		
		HttpServletRequest request = ServletActionContext.getRequest();	
		Map<String,Object> session = ServletActionContext.getContext().getSession();
		//将图片保存到本地内的位置文件名命名方式："G:/workspace/HHTransaction/WebContent/img/goods/";
		String filePath =request.getSession().getServletContext().getRealPath("/")+"img/goods/";
		
		//封装一个goods对象
			Goods goods = new Goods();
			goods.setGoodsName(goodsName);
			goods.setGoodsPrice(goodsPrice);
			Classify classify = classifyService.getClassify(goodsClassify);
			goods.setGoodsClassify(classify);
			goods.setGoodsIntroduction(goodsIntroduction);
			VipInfo vipinfo = (VipInfo)session.get("current_user");
			goods.setGoodsVipId(vipinfo);
			goods.setGoodsStatus(1);
			goods.setGoodsNum(1);
			
			goodService.insertGoods(imgfile, filePath, imgfileFileName,goods);
	        System.out.println("添加成功");
	        		
		return "index";
	}
	
	//获取当前用户发布的所有商品
	public String getPutGoods() {

		HttpServletRequest request = ServletActionContext.getRequest();	
		Map<String,Object> session = ServletActionContext.getContext().getSession();
		VipInfo current_user = (VipInfo) session.get("current_user");
		if(page==null) {
			page=1;
		}
		int count = goodService.getGoodsCountByVipId(current_user).intValue();
		Page pageBean = new Page(page,5,count);
		String pageSplit = new PageSplitUtil().pageSplit2("goods_getPutGoods.action?page=", pageBean);
		JSONArray shopArr = goodService.getshopArr(current_user, pageBean); 
		request.setAttribute("count", count);
		request.setAttribute("shopArr", shopArr);
		request.setAttribute("pageSplit", pageSplit);
		return "mySpare";
	}
	
	
	//当前用户删除自己发布的商品
	public String delPutGoods() {
		Map<String, Object> session = ServletActionContext.getContext().getSession();
		VipInfo current_user = (VipInfo) session.get("current_user");
		if(current_user==null) {
			//如果未登陆给出提示信息
			
		}else {			
			goodService.deletePutGoods(current_user, goodsId);
		}
		return null;
		
	}
	
	


}
