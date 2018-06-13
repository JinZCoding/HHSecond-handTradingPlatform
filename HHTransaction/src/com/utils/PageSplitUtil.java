package com.utils;



public class PageSplitUtil {
	/**
	 * 
	 * @param url      路径
	 * @param page     分页的实体类
	 * @return
	 */
 
	public String pageSplit(String url,Page page) {
		
		
		String str;
	   
		
		int countpage ;
		if(page.getTotalsize()%page.getPagesize()==0) {
			countpage=page.getTotalsize()/page.getPagesize();
		}else {
			countpage = page.getTotalsize()/page.getPagesize()+1;
		}
		
		if(page.getNowpage()<=0) {
			page.setNowpage(1);
		}
		
		if(page.getNowpage()>= countpage) {
			page.setNowpage(countpage);
		}
		

		
		if(page.getNowpage()>1) {
			 str="	<div id='page_prev'><a href=' "+url+(page.getNowpage()-1)+" '>&lsaquo;</a></div>\r\n  ";
		}else {
			 str="	<div id='page_prev'><a href='#'>&lsaquo;</a></div>\r\n  ";
		}
	   
	    
	        for(int i = 1; i <= countpage; i ++) {
	          str+= " <div id='page_zj'><a href='"+url+i+"'>"+i+"</a></div>\r\n"; 
	        }
	  
		
	    
		if(page.getNowpage()<countpage) {
			 str+="	<div id='page_next'><a href= ' "+url+(page.getNowpage()+1)+" '>&rsaquo;</a></div>\r\n  ";
		}else {
			 str+="	<div id='page_next'><a href='#'>&rsaquo;</a></div>\r\n  ";
		}
	   
		
		return str;
	}
	
	
}
