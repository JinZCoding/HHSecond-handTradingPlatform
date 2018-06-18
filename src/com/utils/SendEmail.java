package com.utils;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.sun.mail.util.MailSSLSocketFactory;

/**
 * 测试类
 */
public class SendEmail {
//    public static void main(String[] args) {
//    	if(sendMail("lp995968535@qq.com","code")) {
//    		System.out.println("发送成功！");
//    	}
//    	
//    	
//    }
    
    	/**
         * 发送激活邮件
         * @param to 收件人邮箱地址
         * @param code 激活码
         */
        public static boolean sendMail(String to, String code) {  

            try {  
            	
            	//开启ssl加密
            	MailSSLSocketFactory sf = new MailSSLSocketFactory();
            	sf.setTrustAllHosts(true);
            	
                Properties props = new Properties();  
                props.put("username", "2983526367@qq.com");   
                props.put("password", "ikdiafesuyvcddgg");   
                props.put("mail.transport.protocol", "smtp" );  
                props.put("mail.smtp.host", "smtp.qq.com");  
                props.put("mail.smtp.port", "465" );  
                props.put("mail.smtp.ssl.enable", "true");
                props.put("mail.smtp.ssl.socketFactory", sf);

                Session mailSession = Session.getDefaultInstance(props);  

                Message msg = new MimeMessage(mailSession);     
                msg.setFrom(new InternetAddress("2983526367@qq.com"));  
                msg.addRecipients(Message.RecipientType.TO, InternetAddress.parse(to));   
                msg.setSubject("激活邮件");   
                msg.setContent("<h1>此邮件为官方激活邮件！请点击下面链接完成激活操作！</h1><h3>欢迎注册黄淮二手商城会员<a href='http://localhost:8080/HHTransaction/login.html'>点击进入</a></h3>","text/html;charset=UTF-8");
                msg.saveChanges();  

                Transport transport = mailSession.getTransport("smtp");  
                transport.connect(props.getProperty("mail.smtp.host"), props  
                        .getProperty("username"), props.getProperty("password"));   
                transport.sendMessage(msg, msg.getAllRecipients());  
                transport.close();     
            } catch (Exception e) {  
                e.printStackTrace();  
                System.out.println(e);  
                return false;  
            }  
            return true;  
        }   

}