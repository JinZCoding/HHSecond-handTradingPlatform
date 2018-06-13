package com.utils;

import java.io.InputStream;
/**
 * 
 * @author Panpan
 *
 */
public class FtpBean {
	private String ftpUrl;//ftp地址
	private int port;//端口号是21
	private String userName;//ftp用户名
	private String passWord;//ftp密码
	private String ftpPath;//ftp上可以访问的文件路径
	private String fileName;//文件名 
	private InputStream input;//输入流（用做上传文件或在ftp新建文件使用）
	private String localPath;//用于从ftp上下载文件存放的路径
	
	
	
	
	public FtpBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	public FtpBean(String ftpUrl, int port, String userName, String passWord, String ftpPath, String fileName,
			InputStream input, String localPath) {
		super();
		this.ftpUrl = ftpUrl;
		this.port = port;
		this.userName = userName;
		this.passWord = passWord;
		this.ftpPath = ftpPath;
		this.fileName = fileName;
		this.input = input;
		this.localPath = localPath;
	}


	public String getFtpUrl() {
		return ftpUrl;
	}
	public void setFtpUrl(String ftpUrl) {
		this.ftpUrl = ftpUrl;
	}
	public int getPort() {
		return port;
	}
	public void setPort(int port) {
		this.port = port;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassWord() {
		return passWord;
	}
	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}
	public String getFtpPath() {
		return ftpPath;
	}
	public void setFtpPath(String ftpPath) {
		this.ftpPath = ftpPath;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public InputStream getInput() {
		return input;
	}
	public void setInput(InputStream input) {
		this.input = input;
	}
	public String getLocalPath() {
		return localPath;
	}
	public void setLocalPath(String localPath) {
		this.localPath = localPath;
	}
	
	
	


}
