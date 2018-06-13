package com.utils;

import java.io.File;
import java.io.IOException;
import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Formatter;

import org.aspectj.util.FileUtil;

import com.mchange.v2.sql.filter.FilterPreparedStatement;

public class ImageFile {

	//
	public boolean SetFilePath(File file,String fileName,String filePath) {
		//传的文件名filePath
		SimpleDateFormat sf = new SimpleDateFormat("yyMMddHHssmm");
		String nowDate = sf.format(new Date()).toString();
	    filePath += nowDate;
		//System.out.println("当前日期："+nowDate);		
		File saveFile = new File(filePath);
		try {
			FileUtil.copyFile(file, saveFile);
			return true;
		} catch (IOException e) {			
			e.printStackTrace();
			return false;
		}
		
	}
	public static void main(String[] args) {
		
	}
}
