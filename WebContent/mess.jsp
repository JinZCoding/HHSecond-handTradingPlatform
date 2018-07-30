<%@page import="com.alibaba.fastjson.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
			
			/*对话框*/
			.my_message{
				position: absolute;
				right: 0;
				width: 85%;
				height: 100%;
				box-sizing: border-box;
			}
			
			.my_message .talk{
				position: relative;
				width: 90%;
				height: 80%;
				margin: 10px auto;
				border: 1px solid #A6E7FF;
				padding: 10px 20px;
				box-shadow: 0px 0px 6px 0px #A6E7FF;
				box-sizing: border-box;
				overflow-y: scroll;
			}
			.my_message.tu{
				background: url(img/messimg/tu.png) no-repeat center center;
				
			}
			/*查看更多*/
			.my_message .talk .more{
				position: relative;
				text-align: center;
				margin-top: 0;
			}
			.my_message .talk .more>a{
				font-size: 14px;
				color: skyblue;
			}
			
			.my_message .talk>div{
				margin-top: 20px;
				position: relative;
			}
			/*时间*/
			.my_message .talk>div::before{
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
			.my_message .talk .me{
				
				line-height: 40px;
				text-align: right;
			}
			.my_message .talk .me .myword{
				display: inline-block;
				background-color: #EF5350;
				position: relative;
				padding: 5px 10px;
				border-radius: 8px;
				color: white;
			}
			.my_message .talk .me .myword::after{
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
			.my_message .talk .fri{
				line-height: 40px;
				text-align: left;
			}
			.my_message .talk .fri .myword{
				display: inline-block;
				background-color: skyblue;
				position: relative;
				padding: 5px 10px;
				border-radius: 8px;
				color: #eee;
			}
			.my_message .talk .fri .myword::after{
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
			.my_message .my_talk{
				position: relative;
				width: 90%;
				height: 13%;
				margin: 10px auto;
			}
			
			.my_message .my_talk #messTextDiv{
				position: absolute;
				width: 80%;
				height: 98%;
				border-radius: 5px;
   				box-shadow: 0px 2px 2px 2px #A6E7FF;
				overflow: hidden;
				
			}
			.my_message .my_talk #messTextDiv #messText{
				position: absolute;
				width: 100%;
				height: 100%;
				box-sizing: border-box;
				border: none;
				font-size: 20px;
				padding: 5px;
				
			}
			.my_message .my_talk #messBtnDiv{
				position: absolute;
				right: 0;
				bottom: 0;
				width: 18%;
				height: 98%;
				border-radius: 5px;
				overflow: hidden;
   				box-shadow: 0px 2px 2px 2px #ccc;

			}
			.my_message .my_talk #messBtnDiv #messBtn{
				position: absolute;
				width: 100%;
				height: 100%;
				box-sizing: border-box;
				background-color:#EF5350;
				border: none;
				color: white;
				cursor: pointer;
				font-size: 22px;
				
			}
			.my_message .my_talk #messBtnDiv #messBtn:hover{
				background-color: #F16A67;
			}
			
			/*左边消息框用户头像等*/
			/*头像*/
			.talkPeople{
				position: absolute;
				left: 0px;
				width: 15%;
				height: 100%;
				background-color: #A6E7FF;
				box-sizing: border-box;
			}
			.talkPeople .t_people{
				width: 100%;
				height: 100px;
				text-align: center;
				padding: 10px;
				cursor: pointer;
				box-sizing: border-box;
				position: relative;
			} 
			.talkPeople .t_people::after{
				content: "";
				width: 0;
				height: 0;
			}
			
			/*新的样式表示有未读消息*/
			.talkPeople .t_people.noread::after{
				content: "";
				width: 0;
				height: 0;
				border: 10px solid red;
				border-radius: 50%;
				position: absolute;
			}
			
			.talkPeople .t_people:hover{
				background-color: skyblue;
			}
			.talkPeople .t_people .t_people_img{
				width: 80px;
				height: 80px;
				border-radius: 50%;
				overflow: hidden;
			}
		</style>
		<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
		<script type="text/javascript" src="js/js.js"></script>
	    <script type="text/javascript" src="js/my-js.js"></script>
		<script type="text/javascript">
			$(function() {
				
				
				var talkArr = [
					{
						'sendId':'00000000001',
						'receId':'00000000002',//接受方
						'imgsrc':'img/img_myinfo/myimage.jpg',
						'talkstatus':1
					},{
						'sendId':'00000000001',
						'receId':'00000000003',
						'imgsrc':'img/img_myinfo/bg.jpg',
						'talkstatus':1
					}
				];
				//alert(talkArr);
				var  talkArr = <%=request.getAttribute("talkArr")%>;
				//alert(talkArr);
				
				//左侧头像栏
				for(var i=0;i<talkArr.length;i++){
					var imgStr = '<div class="t_people" >'+
							 '<img src="'+talkArr[i].imgsrc+'" class="t_people_img" alt="" />'+
							 '</div>';
					$(".talkPeople").append(imgStr);
					if(talkArr[i].talkstatus == 1){
						//添加状态样式0已读 1是未读
						$(".t_people:nth-child("+(i+1)+")").addClass("noread");
					}
				};
				
				//默认不显示对话框
				$(".my_message div").css("display","none");
				$(".my_message").addClass("tu");
				
				
				//右侧会话框
				//对话框中的消息
				var messArr;
				$(".talkPeople").children(".t_people").click(function(){
					
								
					//去掉消息框红点点
					var index = $(this).index();
					talkArr[index].talkstatus = 1;
					
					$(this).removeClass("noread");
					
					//var receiveId = talkArr[index].receId;
					var fromId = talkArr[index].sendId;
					//console.log(receiveId);
								
					//消息记录 0表示对方的话，1表示自己
								
					messArr = [
						{
							'time':'2018/6/13 16:19',
							'from':0,
							'mess':'你好，在吗？'
						},{
							'time':'2018/6/13 16:40',
							'from':1,
							'mess':'在的'
						},{
							'time':'2018/6/13 16:41',
							'from':1,
							'mess':'有什么事吗'
						},{
							'time':'2018/6/13 16:41',
							'from':0,
							'mess':'电脑还可以便宜点吗'
						},{
							'time':'2018/6/13 16:45',
							'from':1,
							'mess':'可以哦'
						}
					];
		
			
					$.ajax({
						type:"post",
						url:"HHTransaction/message_getMessageRecord.action",
						data:"fromId="+fromId,
						dataType:"json",
						success:function(data){
							//alert("正在获取聊天记录");
							messArr =data;
							
							//显示对话内容
							var messLength = messArr.length;
							
							for(var i=0;i<messLength;i++){
								var	talkMessage = messArr[i].mess;
								var talkDa = messArr[i].time;
								//from 1表示自己的话，0对方的话
								if(messArr[i].from){
									talkStr = '<div class="me" data-time="'+talkDa+'">'+
							  				  '<div class="myword"><span>'+talkMessage+'</span></div>'+
							  				  '</div>';
							  		$(".talk").append(talkStr);	
								}else{
									talkStr = '<div class="fri" data-time="'+talkDa+'">'+
							  				  '<div class="myword"><span>'+talkMessage+'</span></div>'+
							  				  '</div>';
							  		$(".talk").append(talkStr);	
								}
							}
							
						},
						error:function(data){
							alert("取聊天记录失败！")
						}
						
					});
					
		
					//改变div背景
					$(this).siblings().css('background-color','');
					$(this).css('background-color','skyblue');
					//显示对话框
//					$(".my_message").css("display","");
					$(".my_message div").css("display","");
					$(".my_message").removeClass("tu");
					//清空对话框
					$(".talk").empty();
					//添加显示更多
					var talkStr = '<div class="more">'+
								  '<a href="#">查看更多</a>'+
								  '</div>';
					$(".talk").append(talkStr);	
					
				
				   
					//发送消息
					$("#messBtn").unbind("click");
					$("#messBtn").click(function(){
						
						var textWord = $("#messText").val();
						
	//					console.log(textWord);
						//获取当前时间
						var now = new Date();
						var nowdata = now.getFullYear() + "/" +((now.getMonth()+1)<10?"0":"")+(now.getMonth()+1)+"/"+(now.getDate()<10?"0":"")+now.getDate()+
								   " " + now.getHours() + ":" + now.getMinutes();
						var newStr = '<div class="me" data-time="'+nowdata+'">'+
									 '<div class="myword"><span>'+textWord+'</span></div>'+
									 '</div>';
						if(textWord){
							$(".talk").append(newStr);
								
						
							
						//添加至聊天
						 $.ajax({
							    type:"post",
								url:"HHTransaction/message_sendMessage.action",
								data:{fromId:fromId,messageContent:textWord},
								//dataType:"json",
			                   success:function(data){	
			                	  // alert(textWord);
			               	     
			                    },
			                   error:function(data){
				                  alert("发送失败~");				
			                      }
			
		                    });	
							
						// window.location = "HHTransaction/message_sendMessage.action?fromId="+fromId+"&messageContent="+textWord;
							//将所说的话传进messArr中
							/*messArr.push({
								'time':nowdata,
								'from':1,
								'mess':textWord
							});
							console.log(messArr);*/
							
						}
						$('.talk').scrollTop( $('.talk')[0].scrollHeight );
						
						$("#messText").val("");
						
					});
				});
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
					<li class="current">
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
					<li>
						<a href="setting.jsp">个人设置</a>
					</li>
				</ul>
			</div>
			<div class="info">
				<!--大盒子-->
				<div class="outer">
					<!--消息人-->
					<div class="talkPeople">
						
					</div>
					
					<!--对话框-->
					<div class="my_message">
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
			</div>
		</div>
	</body>

</html>