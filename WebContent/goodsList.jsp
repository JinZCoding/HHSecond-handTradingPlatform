<%@page import="com.utils.FtpBean"%>
<%@page import="com.utils.FtpUtil"%>
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
		
		
			#show {
				margin-right: 50px;
			}
			.show_con {
				width: 980px;
				height: 520px;
				margin-top: 40px;
				/*background-color: #fff;*/
			}
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
			.goodsShow {
				width: 980px;
			}
			.goods {
				position: relative;
				width: 200px;
				height: 300px;
				margin-top: 20px;
				margin-left: 20px;
				padding: 5px;
				background-color: #FFFFFF;
				border: solid 1px lightgray;
				float: left;
				box-shadow: 0px 1px 1px 1px #ccc;
			}
			.goods:hover {
				box-shadow: 0px 1px 2px 2px #ccc;
			}
			.goods .goodsImg {
				/*height: 240px;
				background-color: green;*/
				border-bottom: solid 1px lightgray;
				border-radius: 8px;
			}
			.goods .goodsImg img {
				height: 170px;
				width: 200px;
				border-radius: 8px;
			}
			.goods .describ {
				padding: 9px;
			}
			.goods .describ .tit {
				font: 21px "微软雅黑";
			}
			.goods .describ .pri {
				font: 16px "微软雅黑";
				color: rgb(11, 148, 248);
			}
			.goods .describ .inf {
				font: 15px "微软雅黑";
			}
			.goods .contact {
				position: absolute;
				right: 8px;
				bottom: 6px;
				width: 72px;
				height: 34px;
				border-radius: 15px;
				background-color: rgb(239, 83, 80);
				/*cursor: pointer;*/
			}
			.goods .contact a {
				text-decoration: none;
			}
			.goods .contact a p {
				font: 16px/34px "微软雅黑";
				color: #fff;
				text-align: center;
			}
			
			
			/*分页*/
			#goodsPage{
				/*width: 150px;
				height: 30px;*/
				position: absolute;
			    bottom: 35px;
			    left: 50%;
			    text-align: center;
			    line-height: 30px;
			}
			#goodsPage>div{
				/*position: absolute;*/
				width: 30px;
				height: 30px;
				display: inline-block;
				float: left;
				border: 1px solid rgb(239, 83, 80);
				box-sizing: border-box;
				margin: 5px;
				cursor: pointer;
			}
			#goodsPage>div a,#goodsPage>div span{
				text-decoration: none;
				color: rgb(239, 83, 80);
			}
		</style>
		<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
		<script type="text/javascript" src="js/js.js"></script>

		<script type="text/javascript">
			$(window).ready(function() {

				//点击导航中的li，更改show中的内容
				//更改标题
				$(".banner-ul li").click(function(){
//					var index = $(this).index();
//					consloe.log(index);
					$("#show_tit").text($(this).find("a").text());
				});
								
				//模拟获取后台数据，显示在show中
			  var goodsArr = [{
					"img": "img/goods1.png",
					"name": "惠普电脑",
					"price": 2000,
					"info": "毕业，低价出"
				}, {
					"img": "img/goods1.png",
					"name": "联想电脑",
					"price": 2500,
					"info": "毕业，低价出"
				}];
			
				
				
			   var goodsArr = <%=request.getAttribute("GoodsArr")%>;
				  var count =<%=request.getAttribute("count")%>;
				
				  if(count==0){
						$(".goodsShow").append("<h1 align='center'>暂且没有相关商品~</h1>");
					}
				  

					
				  
				//放进盒子中
				for(var i = 0; i < goodsArr.length; i++) {
				
					
					var str = '<div class="goods">'+
					'<div class="goodsImg"><img  src="' + goodsArr[i].img + '" /></div>'+
					'<div class="describ"><p class="tit">' + goodsArr[i].name + '</p>'+
					'<p class="pri">￥ ' + goodsArr[i].price + '</p>'+
					'<p class="inf">' + goodsArr[i].info + '</p></div>'+
					'<div class="contact"><a href="goods_findDetailGoods.action?goodsId=' + goodsArr[i].id + '"><p>查看详情</p></a></div></div>';	
					//console.log(str);
					$(".goodsShow").append(str);
			      
				}
				
				//更改页码最后一页数字
				var page = Math.ceil(goodsArr.length/4);
				
				$('#page_num').text(page);
				
				
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
								<a href="put.jsp">我要发布</a>
							</li>
							<li id="mess">
								<a href="mess.jsp">消息</a>
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
					<input type="text" name="search" id="se" value="搜索" />
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
							<a href="index.jsp">首&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;页</a>
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
						&copy;黄淮学院<a href="javascript:;">联系我们</a>
					</span>
					<span id="contact">
						
					</span>
				</div>
			</div>
			<!--商品展示区-->
			<div id="show">
				<div class="show_con">
					<div class="show_title">
						<a href="#" id="show_tit">电子产品</a>
						<hr id="s_hr1" />
						<hr id="s_hr2" />
					</div>

					<div class="goodsShow">
				
						<!--后台数据放进去-->
						<!--<div class="goods">
							<div class="goodsImg">
								<img src=""/>
							</div>
							<div class="describ">
								<p class="tit">惠普</p>
								<p class="pri">2000</p>
								<p class="inf">出</p>
							</div>
							<div class="contact">
								<a href="#"><p>联系他</p></a>
							</div>
						</div>-->
					</div>
					<!--分页-->
					<div id="goodsPage">
					<%=request.getAttribute("pageSplit") %>
						
					</div>
					
				</div>
			</div>
		</div>
	</body>
</html>