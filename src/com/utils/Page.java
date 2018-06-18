package com.utils;

public class Page {
	int nowpage;//当前页数
	int pagesize;//每页的总记录数
	int countpage;//总页数		
	int totalsize;//记录总条数
 
	

	public Page(int nowpage, int pagesize, int totalsize) {
		super();
		this.nowpage = nowpage;
		this.pagesize = pagesize;
		this.totalsize = totalsize;
	}



	
	public int getNowpage() {
		return nowpage;
	}
	public void setNowpage(int nowpage) {
		this.nowpage = nowpage;
	}
	public int getPagesize() {
		return pagesize;
	}
	public void setPagesize(int pagesize) {
		this.pagesize = pagesize;
	}
	public int getCountpage() {
		return countpage;
	}
	public void setCountpage(int countpage) {
		this.countpage = countpage;
	}
	public int getTotalsize() {
		return totalsize;
	}
	public void setTotalsize(int totalsize) {
		this.totalsize = totalsize;
	}
	
	
	
	
	
   
	

}
