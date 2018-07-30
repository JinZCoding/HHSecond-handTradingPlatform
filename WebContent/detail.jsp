<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta charset="utf-8" />
		<title>商品详情</title>
		<link rel="stylesheet" type="text/css" href="css/css.css" />
		<style type="text/css">
			#show {
				margin-right: 50px;
			}
			
			.showCon {
				position: relative;
				background-color: #fff;
				width: 1050px;
				height: 450px;
				margin-top: 20px;
				padding-top: 30px;
				padding-left: 30px;
			}
			
			#pic {
				/*border: solid 1px lightgray;*/
				/*position: absolute;
				top: 10%;
				left: 22%;*/
				width: 300px;
				height: 370px;
			}
			
			#pic img {
				width: 370px;
				height: 370px;
			}
			
			#detail {
				position: absolute;
				left: 450px;
				top: 30px;
				width: 600px;
				height: 370px;
				border: 1px solid lightgray;
				box-shadow: 0px 3px 3px 0px #ccc;
				line-height: 30px;
			}
			
			#detail p {
				font-size: 18px;
			}
			
			#tit {
				font-size: 24px;
				text-align: center;
				height: 40px;
				line-height: 40px;
			}
			
			#con {
				height: 140px;
				margin: 10px;
				padding: 20px;
				border-top: solid 1px lightgray;
				border-bottom: solid 1px lightgray;
			}
			
			#con span {
				color: darkslategray;
				font-size: 18px;
			}
			
			#detail #oth {
				height: 140px;
				padding: 10px 40px;
			}
			
			#oth span {
				font-size: 18px;
			}
			
			#oth #price {
				color: #F05350;
			}
			
			#oth #tim {
				color: gray;
			}
			
			#detail input {
				margin-left: 7%;
				margin-top: -20px;
				background-color: #EF5350;
				color: #FFFFFF;
				border: none;
				width: 150px;
				height: 40px;
				cursor: pointer;
			}
			
			#detail input:hover {
				background-color: #0bb9f8;
			}
		</style>
		<style type="text/css">
			.cover {
				z-index: 100;
				display: none;
				position: absolute;
				width: 100%;
				height: 100%;
				background-color: rgba(0, 0, 0, 0.2);
			}
			/*对话框*/
			
			.my_message {
				/*position: absolute;*/
				/*right: 0;*/
				width: 500px;
				height: 500px;
				background-color: white;
				box-sizing: border-box;
				margin: 50px auto;
				/*padding-top: 10px;*/
			}
			
			.my_message .close {
				position: relative;
				/*background-color: wheat;*/
				height: 5%;
			}
			
			.close span {
				text-align: center;
				display: inline-block;
				width: 25px;
				/*background-color: red;*/
				float: right;
				cursor: pointer;
			}
			
			.my_message .talk {
				position: relative;
				width: 90%;
				height: 75%;
				margin: 10px auto;
				border: 1px solid #A6E7FF;
				padding: 10px 20px;
				box-shadow: 0px 0px 6px 0px #A6E7FF;
				box-sizing: border-box;
				overflow-y: scroll;
			}
			
			.my_message.tu {
				background: url(img/messimg/tu.png) no-repeat center center;
			}
			/*查看更多*/
			
			.my_message .talk .more {
				position: relative;
				text-align: center;
				margin-top: 0;
			}
			
			.my_message .talk .more>a {
				font-size: 14px;
				color: skyblue;
			}
			
			.my_message .talk>div {
				margin-top: 20px;
				position: relative;
			}
			/*时间*/
			
			.my_message .talk>div::before {
				content: attr(data-time);
				/*width: auto;*/
				position: absolute;
				top: -30px;
				/*left: 40%;*/
				font-size: 12px;
				color: gray;
			}
			
			.my_message .talk>div.me::before {
				right: 7px;
			}
			/*我说的话*/
			
			.my_message .talk .me {
				line-height: 40px;
				text-align: right;
			}
			
			.my_message .talk .me .myword {
				display: inline-block;
				background-color: #EF5350;
				position: relative;
				padding: 5px 10px;
				border-radius: 8px;
				color: white;
			}
			
			.my_message .talk .me .myword::after {
				content: '';
				width: 0;
				height: 0;
				border-width: 10px;
				border-style: solid;
				border-top-color: transparent;
				border-right-color: transparent;
				border-bottom-color: transparent;
				border-left-color: #EF5350;
				position: absolute;
				top: 16px;
				right: -20px;
			}
			/*对方的话*/
			
			.my_message .talk .fri {
				line-height: 40px;
				text-align: left;
			}
			
			.my_message .talk .fri .myword {
				display: inline-block;
				background-color: skyblue;
				position: relative;
				padding: 5px 10px;
				border-radius: 8px;
				color: #eee;
			}
			
			.my_message .talk .fri .myword::after {
				content: '';
				width: 0;
				height: 0;
				border-width: 10px;
				border-style: solid;
				border-top-color: transparent;
				border-right-color: skyblue;
				border-bottom-color: transparent;
				border-left-color: transparent;
				position: absolute;
				top: 16px;
				left: -20px;
			}
			/*发送消息栏*/
			
			.my_message .my_talk {
				position: relative;
				width: 90%;
				height: 13%;
				margin: 10px auto;
			}
			
			.my_message .my_talk #messTextDiv {
				position: absolute;
				width: 80%;
				height: 98%;
				border-radius: 5px;
				box-shadow: 0px 2px 2px 2px #A6E7FF;
				overflow: hidden;
			}
			
			.my_message .my_talk #messTextDiv #messText {
				position: absolute;
				width: 100%;
				height: 100%;
				box-sizing: border-box;
				border: none;
				font-size: 20px;
				padding: 5px;
			}
			
			.my_message .my_talk #messBtnDiv {
				position: absolute;
				right: 0;
				bottom: 0;
				width: 18%;
				height: 98%;
				border-radius: 5px;
				overflow: hidden;
				box-shadow: 0px 2px 2px 2px #ccc;
			}
			
			.my_message .my_talk #messBtnDiv #messBtn {
				position: absolute;
				width: 100%;
				height: 100%;
				box-sizing: border-box;
				background-color: #EF5350;
				border: none;
				color: white;
				cursor: pointer;
				font-size: 22px;
			}
			
			.my_message .my_talk #messBtnDiv #messBtn:hover {
				background-color: #F16A67;
			}
			
			.outer{
				display: none;
				position: absolute;
				width: 100%;
				height: 100%;
				background-color: rgba(0,0,0,0.3);
				z-index: 100;
			}
			.inner{
				width: 400px;
				height: 260px;
				position: relative;
				margin: 100px auto;
				background-color: white;
				border-radius: 10px;
			}
			.inner div{
				text-align: center;
			}
			
			.inner div:first-child{
				/*position: absolute;*/
				height: 30px;
			}
			.inner div:first-child span{
				height: 30px;
				width: 30px;
				float: right;
				cursor: pointer;
			}
			.inner div:nth-child(2){
				height: 150px;
				line-height: 150px;
			}
			.inner div:nth-child(3){
				height: 50px;
				line-height: 50px;
			}
			.inner div:nth-child(3) button{
				width: 80px;
				height: 30px;
				margin: 10px;
				cursor: pointer;

			}
			.inner div:nth-child(3) button a{
				text-decoration: none;
				color: black;
			}
		</style>

		<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
		<script type="text/javascript" src="js/js.js"></script>
		<script type="text/javascript">
			$(window).ready(function() {
				$("#contactBtn").click(function() {
					$(".cover").show();
				});

				$(".close").click(function() {
					$(".cover").hide();
				});
				//发送消息
				$("#messBtn").click(function() {
					var textWord = $("#messText").val();
					//获取当前时间
					var now = new Date();
					var nowdata = now.getFullYear() + "/" + ((now.getMonth() + 1) < 10 ? "0" : "") + (now.getMonth() + 1) + "/" + (now.getDate() < 10 ? "0" : "") + now.getDate() +
						" " + now.getHours() + ":" + now.getMinutes();
					var newStr = '<div class="me" data-time="' + nowdata + '">' +
						'<div class="myword"><span>' + textWord + '</span></div>' +
						'</div>';
					//alert($("#contactBtn").attr("data-fromId"));
					if(textWord) {
						$(".talk").append(newStr);
						//添加至聊天内容
						var fromId = $("#contactBtn").attr("data-fromId");

						$.ajax({
							type: "post",
							url: "HHTransaction/message_sendMessage.action",
							data: {
								fromId: fromId,
								messageContent: textWord
							},
							//dataType:"json",
							success: function(data) {
								// alert(textWord);

							},
							error: function(data) {
								alert("发送失败~");
							}
						});
					}
					$('.talk').scrollTop($('.talk')[0].scrollHeight);
					$("#messText").val("");
				});
				//购买
				$('#buyBtn').click(function(){
					$('.outer').show();
					//获取时间
					var now = new Date();
					var nowdata = now.getFullYear() + "/" +((now.getMonth()+1)<10?"0":"")+(now.getMonth()+1)+"/"+(now.getDate()<10?"0":"")+now.getDate()+
								   " " + now.getHours() + ":" + now.getMinutes();
								   
					var fromId = $("#contactBtn").attr("data-fromId");
					var goodsId = $("#buyBtn").attr("data-goodsId");
					//var textWord="你已预购成功!";
					var goodsIdArr=goodsId;
					var textWord="你已预购 商品：<a href='goods_findDetailGoods.action?goodsId="+ goodsId +"'>点击查看</a>成功!";
					//<a href="goods_findDetailGoods.action?goodsId=' + shopArr[index].goodsId + '">shopArr[index].goodsName</a>
					//alert(textWord);
					//添加至聊天
					 $.ajax({
						    type:"post",
							url:"HHTransaction/message_sellToCurMessage.action",
							data:{fromId:fromId,messageContent:textWord},
							//dataType:"json",
		                   success:function(data){	
		                	  // window.location.href="message_getMessageForCurr.action";
		               	     
		                    },
		                   error:function(data){
			                  alert("发送失败~");				
		                      }
		
	                    });	
					
					//增加一条order
					 $.ajax({
						    type:"post",
							url:"HHTransaction/order_addOrder.action",
							data:{goodsIdArr:goodsIdArr},
							//dataType:"json",
		                   success:function(data){	
		                	  // alert(textWord);	               	     
		                    },
		                   error:function(data){
			                  alert("预购失败~");				
		                      }
		
	                    });	
					
					
					
				});
				
				$('#buyClose,#sureBtn').click(function(){
					$('.outer').hide();
				});
				
			});
		</script>

	</head>

	<body>
		<div class="cover">
			<div class="my_message">
				<div class="close"><span>x</span></div>
				<!--消息框-->
				<div class="talk">
					<!--<div class="more">
						<a href="#">查看更多</a>
					</div>-->
				</div>
				<!--发送消息区域-->
				<div class="my_talk">
					<div id="messTextDiv">
						<input type="text" name="message" id="messText" placeholder="在这里输入">
						</input>
					</div>
					<div id="messBtnDiv">
						<input type="submit" name="mesBtn" id="messBtn" value="发送" />
					</div>
				</div>

			</div>
		</div>
		<!--//购买-->
		<div class="outer">
			<div class="inner">
				<div><span id="buyClose">x</span></div>
				<div><span>预定成功！请自行联系卖家拿货！</span></div>
				<div><button id="sureBtn">确定</button><button><a href="message_getMessageForCurr.action">联系他</a></button></div>
			</div>
		</div>
			
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
					<p>
						
						<a href="#">${goods.goodsName}</a>
					</p>
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
						<input type="submit" name="" value="购买" id="buyBtn" data-goodsId="${goods.goodsId}" >
						<input type="submit" name="" value="联系他" id="contactBtn" data-fromId="${goods.goodsVipId.getVipId()}">

					</div>
				</div>
			</div>
		</div>

	</body>
	<script type="text/javascript">
		function addCartItem(goodsId) {
			$.ajax({
				type: "post",
				url: "HHTransaction/cartItem_addCart.action",
				data: "goodsId=" + goodsId,
				//dataType:"json",
				success: function(data) {
					alert("加购成功~");
				},
				error: function(data) {
					alert("加购失败~");

				}

			});

		}
	</script>

</html>