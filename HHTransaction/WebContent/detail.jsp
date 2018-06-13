<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

		<meta charset="utf-8" />
		<title></title>
		<link rel="stylesheet" type="text/css" href="css/css.css"/>
		<style type="text/css">
			#show{
				margin-right: 50px;
			}
			.showCon{
				position: relative;
				background-color: #fff;
				width: 1050px;
				height: 450px;
				margin-top: 20px;
				padding-top: 30px;
				padding-left: 30px;
			}
			#pic{
				/*border: solid 1px lightgray;*/
				/*position: absolute;
				top: 10%;
				left: 22%;*/
				width: 300px;
				height: 370px;
			}
			#pic img{
				width: 370px;
				height: 370px;
			}
			#detail{
				position: absolute;
				left: 450px;
				top: 30px;
				width: 600px;
				height: 370px;
				border: 1px solid lightgray;
				box-shadow: 0px 3px 3px 0px #ccc;
				line-height: 30px;
				
			}
			#detail p{
				font-size: 18px;
			}
			#tit{
				font-size: 24px;
				text-align: center;
				height: 40px;
				line-height: 40px;
			}
			#con{
				height: 140px;
				margin: 10px;
				padding: 20px;
				border-top: solid 1px lightgray;
				border-bottom: solid 1px lightgray;
			}
			#con span{
				color: darkslategray;
				font-size: 18px;
			}
			#detail #oth{
				height: 140px;
				padding: 10px 40px;
			}
			#oth span{
				font-size: 18px;
			}
			#oth #price{
				color: #F05350;
			}
			#oth #tim{
				color: gray;
			}
			#detail input{
				margin-left: 7%;
				margin-top: -20px;
				background-color: #EF5350;
				color: #FFFFFF;
				border: none;
				width: 150px;
				height: 40px;
				cursor: pointer;
			}
			#detail input:hover{
				background-color: #0bb9f8;
				}
		</style>
		
		<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
		<script type="text/javascript" src="js/js.js"></script>
		<script type="text/javascript">
			$(window).ready(function() {
				
				
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
								<a href="#">我要发布</a>
							</li>
							<li id="mess">
								<a href="mess.jsp">消息</a>
							</li>
							
								<li id="my">
								<a href="vip_getVipIntroduction.action">${current_user.vipNickName}</a>
								<ul id="my-2" style="display: none;">
									<li>
										<a href="#" style="color: black;">购物车</a>
									</li>
									<li>
										<a href="#" style="color: black;">订单</a>
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
						<li><img src="img/index.png"><a href="index.jsp">首&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;页</a></li>
						<li><img src="img/digital.png"><a href="goods_GoosListByClassify.action?classifyId=1">电子产品</a></li>
						<li><img src="img/ride.png"><a href="goods_GoosListByClassify.action?classifyId=2">服装配饰</a></li>
						<li><img src="img/sport.png"><a href="goods_GoosListByClassify.action?classifyId=3">文娱教育</a></li>
						<li><img src="img/makeup.png"><a href="goods_GoosListByClassify.action?classifyId=4">美容美化</a></li>
						<li><img src="img/book.png"><a href="goods_GoosListByClassify.action?classifyId=5">生活用品</a></li>
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
					<p><a href="#">服装配饰</a>><a href="#">T恤</a></p>
					<hr id="s_hr1" />
					<hr id="s_hr2" />
				</div>
				<div class="showCon">
					<div id="pic">
						<img src="${goods.goodsImage}" alt="图片">
					</div>
					<div id="detail">
					
						<h2 id="tit">${goods.goodsName}</h2>
						<p id="con">简介：<span id="describtion">${goods.goodsIntroduction}</span></p>
						<div id="oth">
							<p>价格：<span id="price">${goods.goodsPrice }</span></p>
							<p>商品数量：<span id="num">${goods.goodsNum}</span></p>
							<!-- <p>发布时间：<span id="tim">2018-05-07 11:32</span></p> -->
						</div>
					
						<input type="submit" name="" value="加入购物车" onclick="addCartItem(${goods.goodsId})">
						<input type="submit" name="" value="购买">
						<input type="submit" name="" value="联系他">
						
					</div>
				</div>
			</div>
		</div>
		
	</body>
	<script type="text/javascript">
	  function addCartItem(goodsId) {
		  $.ajax({
			  type:"post",
			  url:"HHTransaction/cartItem_addCart.action",
			  data:"goodsId="+goodsId,
			  //dataType:"json",
			  success:function(data){			  
				  alert("加购成功~");
			  },
			  error:function(data){
				  alert("加购失败~");
				
			  }
			
		});
		
	}
	</script>
</html>