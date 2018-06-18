package com.entity;

public class Goods {
	
	private int goodsId;        //商品Id
	private String goodsName;   //商品名称
	private String goodsIntroduction;//商品想请 
	private float goodsPrice;  //商品价格
	//private int goodsClassify; //商品分类
	private int goodsNum;      //商品数量
	//private int goodsVipId;         //商品的发布者id
	private int goodsStatus;   // 商品状态
	
	private Classify goodsClassify; //商品分类
	private VipInfo goodsVipId;       //商品的发布者id
	private String goodsImage;//商品图片
	
	
	public int getGoodsId() {
		return goodsId;
	}
	public void setGoodsId(int goodsId) {
		this.goodsId = goodsId;
	}
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	public String getGoodsIntroduction() {
		return goodsIntroduction;
	}
	public void setGoodsIntroduction(String goodsIntroduction) {
		this.goodsIntroduction = goodsIntroduction;
	}
	public float getGoodsPrice() {
		return goodsPrice;
	}
	public void setGoodsPrice(float goodsPrice) {
		this.goodsPrice = goodsPrice;
	}

	public int getGoodsNum() {
		return goodsNum;
	}
	public void setGoodsNum(int goodsNum) {
		this.goodsNum = goodsNum;
	}


	public int getGoodsStatus() {
		return goodsStatus;
	}
	public void setGoodsStatus(int goodsStatus) {
		this.goodsStatus = goodsStatus;
	}
	public Classify getGoodsClassify() {
		return goodsClassify;
	}
	public void setGoodsClassify(Classify goodsClassify) {
		this.goodsClassify = goodsClassify;
	}
	public VipInfo getGoodsVipId() {
		return goodsVipId;
	}
	public void setGoodsVipId(VipInfo goodsVipId) {
		this.goodsVipId = goodsVipId;
	}
	public String getGoodsImage() {
		return goodsImage;
	}
	public void setGoodsImage(String goodsImage) {
		this.goodsImage = goodsImage;
	}
	
	

	
	

}
