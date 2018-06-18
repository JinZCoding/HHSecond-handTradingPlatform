<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta charset="UTF-8">
		<title>黄淮二手商城</title>
		<link rel="icon" href="img/gt_favicon.png">
		<style type="text/css">
			*{
				padding: 0;
				margin: 0;
			}
			.header{
				height: 60px;
				background-color: #FFFFFF;
				position: relative;
			}
			.header h1{
				margin-left: 20px;
			}
			.lo{
				height: 475px;
				background-color: #4E7ED2;
			}
			#logimg{
				position: relative;
				width: 900px;
				margin: 0 auto;

				/*background: url(img/bg.jpg) center no-repeat;*/
			}

			#img{
				position: absolute;
				left: 0px;
			}

			.login{
				position: relative;
				left: 18%;
				float: right;
				top: 10px;
				height: 400px;
				width: 347px;
				/*margin: 0 auto;*/
				background-color: #FFFFFF;
			}
			.login h2{
				margin-top: 18px;
				text-align: center;
				color: #E4393C;
			}
			.login form{
				height: 300px;
				width: 300px;
				font: "微软雅黑" 18px;
				margin: 10px auto;
				background-color: #F3F3F3;
			}
			.login ul {
				list-style: none;
				padding: 10px;
			}
			.login ul li{
				margin: 20px; 
				
			}
			.login ul input{
				width: 245px;
				height: 30px;
				vertical-align: center;
			}
			.login p{
				text-align: center;
			}
		</style>
	</head>
	<body>
		<div class="header">
			<h1><a><span style="font-family: '微软雅黑';font-size: 28px;color: #0bb9f8;font-weight: bolder;">黄淮&nbsp;&nbsp;</span><span style="font-family: '微软雅黑';font-size: 28px;font-weight: bolder;">二手工坊</span></a><img src=""/></h1>
		</div>
		<div class="lo">
			<div id="logimg">
				<div id="img">
					<img src="img/findfun.png">
				</div>
				<div class="login">
				<h2>用户登录</h2>
				<form action="vip_login.action" method="post">
					<ul>
						<li>用户名：<input type="text" name="nickname" /></li>
						<li>密&nbsp;&nbsp;&nbsp;码：<input type="password"  name="password"/></li>
						<li><input type="submit" style="height: 35px; border: none;background-color:#E4393C; color: #FFFFFF;font-size: 18px;" name="" id="" value="登陆" /></li>
					</ul>
				</form>
				<p>没有账号？点击<a href="reg_validate.jsp" style="color: #E4393C;">注册</a>吧！<a href="index.jsp" style="color: #E4393C;">返回首页</a></p>
				</div>
			</div>
			
		</div>
		<center>Copyright © 2018 黄淮学院 版权所有</center>
		
	</body>
</html>

