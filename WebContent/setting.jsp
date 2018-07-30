<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人设置</title>

		<meta charset="utf-8" />
		<title>我的消息</title>
		<link rel="stylesheet" type="text/css" href="css/css.css"/>
		<link rel="stylesheet" type="text/css" href="css/my_css.css" />
		<style type="text/css">
			.outer{
				width: 95%;
				height: 600px;
				/*border: 1px solid #000;*/
				position: relative;
				margin-left: 30px;
				background-color: white;
				top:20px;
				border-radius: 10px;
				overflow: hidden;
			}
			.e_img{
				width: 250px;
				height: 250px;
				margin: 100px auto 0;
			}
			.e_img img{
				width: 250px;
				height: 250px;
			}
			.exit{
				width: 127px;
				height: 37px;
				margin: 50px auto 0;
			}
			#exitBtn{
			    width: 127px;
			    height: 37px;
			    line-height: 37px;
			    background-color: #EF5350;
			    box-shadow: 0px 2px 2px 2px #ccc;
			    border: none;
			}
			#exitBtn a{
				text-decoration:none;
			    color: white;
			}
		</style>
		<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
		<script type="text/javascript" src="js/js.js"></script>
		<script type="text/javascript" src="js/my-js.js"></script>
		<script type="text/javascript">
			$(function(){

				var imagsrc = $("#my_img").find("img").attr("data-type");
				//alert(imagsrc);
				var json = eval('(' + imagsrc + ')');
				//alert(json.img);
				$("#my_img").find("img").attr("src",json.img);
				$(".e_img img").attr("src",json.img);
			});
			

		</script>
	</head>

	<body>
		
		<!--header开始-->
		<div id="header">
			<div>
				<!--右边的-->
				<div class="right">
                    <s:if test="%{#session.current_user!=null}">
					 <nav class="float-right">
						<ul id="navlist">
						   <li id="put">
								<a href="index.jsp">首页</a>
							</li>
							<li id="put">
								<a href="put.jsp">我要发布</a>
							</li>
							<li id="mess">
								<a href="message_getMessageForCurr.action">消息</a>
							</li>
							
								<li id="my">
								<a href="my.jsp">${current_user.vipNickName}</a>
								<ul id="my-2" style="display: none;">
									<li>
										<a href="cartItem_getCartItem.action" style="color: black;">购物车</a>
									</li>
									<li>
										<a href="order_getOrderArr.action" style="color: black;">订单</a>
									</li>
									<li>
								        <a href="vip_logout.action" style="color: black;">退出</a>
							         </li>
								</ul>
							</li>
						</ul>
					</nav>
				</s:if>
					<!--未登陆之前显示-->
					<div class="float-right">
						<span>
						    <s:if test="%{#session.current_user==null}">
						     <a href="login.jsp">
							   登录/注册 </a>
						    </s:if>
						</span>
					</div>
             

				</div>
				<!--右边结束-->
				<!--标题logo-->
				<div id="logo">
					<h1><a><span style="font-family: '微软雅黑';font-size: 28px;color: #0bb9f8;font-weight: bolder;">黄淮&nbsp;&nbsp;</span><span style="font-family: '微软雅黑';font-size: 28px;font-weight: bolder;">二手工坊</span></a><img src=""/></h1>
				</div>
				<!--logo结束-->

				<!--搜索框-->
				<div id="search">
					<input type="text" name="search" id="se" placeholder="搜索" />
				</div>
				<!--搜索框结束-->

			</div>
		</div>
		<!--header结束-->
		
		<div class="content">
			<div class="banner">
				<div id="my_img">
					<a href="vip_getVipIntroduction.action"><img data-type='${current_user.vipIntroduction}' /></a>
				    </div>
				    <div id="myname">
					<a href="#"><span>${current_user.vipNickName }</span></a>
				    </div>
				<ul class="banner-ul">
					<li>
						<a href="vip_getVipIntroduction.action">编辑资料</a>
					</li>
					<li>
						<a href="message_getMessageForCurr.action">我的消息</a>
					</li>
					<li><a href="cartItem_getCartItem.action">购物车</a></li>
					<li>
						<a href="order_getOrderArr.action">我买到的</a>
					</li>
					<li>
					  <a href="goods_getPutGoods.action">我的闲置</a>
					</li>
					
					<li>
						<a href="put.jsp">发布闲置</a>
					</li>
					<li class="current">
						<a href="setting.jsp">个人设置</a>
					</li>
				</ul>
			</div>
			<div class="info">
				<!--大盒子-->
				<div class="outer">
					<div class="e_img"><img/></div>
					<div class="exit">
						<button type="button" id="exitBtn" ><a href="vip_logout.action">退出登录</a></button>
					</div>
				</div>
			</div>
		</div>
	</body>

</html>