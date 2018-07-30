<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta charset="utf-8" />
		<title></title>
		<link rel="stylesheet" type="text/css" href="css/css.css" />
		<style type="text/css">
			/*标题样式*/
			
			.show_title {
				height: 40px;
				padding: 20px;
				/*background-color: red;*/
			}
			
			.show_title a {
				text-decoration: none;
				color: rgb(47, 79, 79);
				font: 23px/40px "微软雅黑";
			}
			
			.show_title #s_hr1 {
				width: 96px;
				border-top: solid 3px rgb(11, 148, 248);
				margin-bottom: 5px;
			}
			
			.show_title #s_hr2 {
				width: 930px;
				border: solid 2px lightgray;
			}
			/*轮播图样式*/
			
			#show1 {
				position: relative;
				width: 900px;
				height: 400px;
				overflow: hidden;
				margin-top: 80px;
				margin-left: 35px;
			}
			
			#prev,
			#next {
				position: absolute;
				top: 200px;
				background-color: lightcoral;
				opacity: 0.5;
				cursor: pointer;
			}
			
			#prev a,
			#next a {
				text-decoration: none;
				color: black;
			}
			
			#prev {
				left: 15px;
			}
			
			#next {
				right: 15px;
			}
			
			#imgShowUl {
				left: 0;
				list-style: none;
				height: 400px;
				position: absolute;
				left: 0px;
			}
			
			#imgShowUl li {
				float: left;
			}
		</style>
		<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
		<script type="text/javascript" src="js/js.js"></script>
		<script type="text/javascript">
			window.onload = function() {
				
				var imgLi = document.getElementById("imgShowUl");
				var imgArray = imgLi.getElementsByTagName("li");
				var prev = document.getElementById("prev");
				var next = document.getElementById("next");

				//轮播图
				var imgWidth = imgArray.length * 900;
				//console.log(imgWidth);
				imgLi.style.width = imgWidth + "px";

				var index = 0;
				//开启自动切换图片
				autoChange();
				prev.onclick = function() {
					clearInterval(timer);
					if(index == 0) {
						imgLi.style.left = -2700 + 'px';
						index = imgArray.length - 1;
					}
					move(imgLi, "left", -900 * (index - 1), 20, function() {
						console.log(index);
						index -= 1;
						if(index < 0) {
							imgLi.style.left = -imgWidth + 'px';
							index = imgArray.length - 1;
						}
						autoChange();
					});
				};
				//创建切换下一张图片按钮的单击响应函数
				next.onclick = function() {
					clearInterval(timer);
					move(imgLi, "left", -900 * (index + 1), 20, function() {
						index += 1;
						if(index >= imgArray.length - 1) {
							imgLi.style.left = 0 + 'px';
							index = 0;
						}
						autoChange();
					});
				};

				var timer;

				function autoChange() {
					//设置图片自动播放				
					timer = setInterval(function() {
						index++;
						index %= imgArray.length;
						move(imgLi, "left", -900 * index, 20, function() {
							if(index >= imgArray.length - 1) {
								//最后一张，则使索引变为0，left变为0
								index = 0;
								imgLi.style.left = 0;
							}
						});
					}, 3000);
				};
			};
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
								<a href="put.jsp">我要发布</a>
							</li>
							<li id="mess">
								<a href="message_getMessageForCurr.action">消息</a>
							</li>
							
								<li id="my">
								<a href="vip_getVipIntroduction.action">${current_user.vipNickName}</a>
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

		<!--内容区-->
		<div id="content">
			<!--导航-->
			<div id="banner">
				<div class="banner-div">
					<ul class="banner-ul">
						<li><img src="img/index.png">
							<a href="javascript:;">首&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;页</a>
						</li>
						<li><img src="img/digital.png">
							<a href="goods_GoosListByClassify.action?classifyId=1">电子产品</a>
						</li>
						<li><img src="img/ride.png">
							<a href="goods_GoosListByClassify.action?classifyId=2">服装配饰</a>
						</li>
						<li><img src="img/sport.png">
							<a href="goods_GoosListByClassify.action?classifyId=3">文娱教育</a>
						</li>
						<li><img src="img/makeup.png">
							<a href="goods_GoosListByClassify.action?classifyId=4">美容美化</a>
						</li>
						<li><img src="img/book.png">
							<a href="goods_GoosListByClassify.action?classifyId=5">生活用品</a>
						</li>
					</ul>
				</div>
				<div class="copy">
					<span id="copy-span">
						&copy;黄淮学院
					</span>
					<span id="contact">
						<a href="javascript:;">联系我们</a>
					</span>
				</div>
			</div>
			<!--商品展示区-->
			<div id="show">

				<div class="show_title">
					<a href="#">首&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;页</a>
					<hr id="s_hr1" />
					<hr id="s_hr2" />
				</div>

				<div id="show1">
					<ul id="imgShowUl">
						<li><img src="img/swb3.jpg" /></li>
						<li><img src="img/swb2.jpg" /></li>
						<li><img src="img/findfun.png" /></li>
						<li><img src="img/swb1.jpg" /></li>
						
						

					</ul>
					<div id="prev">
						<a href="javascript:;">
							< </a>
					</div>
					<div id="next">
						<a href="javascript:;"> > </a>
					</div>
				</div>
			</div>
		</div>

	</body>

</html>