<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<meta charset="utf-8" />
		<title>我的资料</title>
		<link rel="stylesheet" type="text/css" href="css/css.css"/>
		<link rel="stylesheet" type="text/css" href="css/my_css.css" />
		<style type="text/css">
			.info #my_tit {
				width: 200px;
				height: 40px;
				position: absolute;
				right: 30%;
				top: 80px;
			}
			
			#my_tit span {
				font: 30px/40px "微软雅黑";
				color: #EF5350;
			}
			
			
			.infoForm {
				/*display: table-cell;*/
				width: 800px;
				height: 340px;
				margin: 160px auto 0;
				padding: 10px;
				line-height: 40px;
				/*background-color: yellow;*/
			}
			/*头像*/
			.infoForm .infoImage {
				width: 250px;
				height: 300px;
				margin: 40px 40px;
				float: left;
				text-align: center;
				font-size: 18px;
				font-family: 微软雅黑;
				color: #EF5350;
			}
			
			.infoForm .infoImage>div{
				width: 250px;
				height: 200px;
			}
			
			.infoForm .infoImage img {
				width: 200px;
				height: 200px;
			}
			.infoForm .infoImage input{
				width: 200px;
			}
			.infoForm label {
				text-align: left;
				font-family: 微软雅黑;
				color: #0bb9f8;
				font-size: 20px;
			}
			
			.infoForm input {
				width: 250px;
				height: 30px;
			}
			
			.infoForm #sub {
				background-color: #EF5350;
				color: #FFFFFF;
				border: none;
				width: 150px;
				height: 40px;
				cursor: pointer;
				margin-left: 100px;
				margin-top: 10px;
			}
		</style>
		<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
		<script type="text/javascript" src="js/js.js"></script>
		<script type="text/javascript">	
		
		$(function() {
			//模拟获取后台信息
			var infoArr = {
				"img": "img/img_myinfo/myimage.jpg",
				"name": "陈伟霆",
				"ssex":"男",
				"info":"我是陈伟霆",
				"myqq":"503211159",
				"tel":"11111111111",
				"dep":"信息工程学院软件工程",
				"psw":""
			};
			
			var infoArr = <%=request.getAttribute("infoArr")%>;
		
			
			$("#my_img").find("img").attr("src", infoArr.img);
			//$("#myname").find("span").text();
			$(".infoImage").find("img").attr("src", infoArr.img);
			//$(".infoForm").find("input").eq(0).attr("placeholder",infoArr.name);
			$(".infoForm").find("input").eq(2).attr("value",infoArr.ssex);
			$(".infoForm").find("input").eq(3).attr("value",infoArr.info);
			$(".infoForm").find("input").eq(4).attr("value",infoArr.myqq);
			$(".infoForm").find("input").eq(5).attr("value",infoArr.tel);
			$(".infoForm").find("input").eq(6).attr("value",infoArr.dep);
			//$(".infoForm").find("input").eq(6).attr("placeholder",infoArr.psw);
			
			
			
			
			$(".banner-ul li").on("mouseover",function(){
				$(this).css("background-color","#EF5350");
				$(this).find("a").css("color","#fff");
			});
			
			$(".banner-ul li").mouseleave(function(){
				//判断是否含有current类，如果没有，将样式去掉
				if(!$(this).hasClass("current")){
					$(this).css("background-color","#fff");
					$(this).find("a").css("color","#EF5350");
				}
			});
			
			//头像
				//在input file内容改变的时候触发事件
				$('#stuheadfile').change(function() {
					//获取input file的files文件数组;
					//$('#filed')获取的是jQuery对象，.get(0)转为原生对象;
					//这边默认只能选一个，但是存放形式仍然是数组，所以取第一个元素使用[0];
					var file = $('#stuheadfile').get(0).files[0];
					
					//创建用来读取此文件的对象
					var reader = new FileReader();
					//使用该对象读取file文件
					reader.readAsDataURL(file);
					//读取文件成功后执行的方法函数
					reader.onload = function(e) {
						//读取成功后返回的一个参数e，整个的一个进度事件
						console.log(e);
						//选择所要显示图片的img，要赋值给img的src就是e中target下result里面的base64编码格式的地址
						$('#my_headimg').get(0).src = e.target.result;
						
					}
				});

		});
		
		//没用
		function editInfo() {
			
			var ssex = $("#stusex").val();
			var info = $("#stuintro").val();
			var myqq = $("#QQ").val();
			var tel =  $("#tel").val();
			var dep =  $("#studep").val();		
			    
			//var stuname=document.getElementById("image");
		
			var info = {
					//"img": "img/img_myinfo/myimage.jpg",
					//"name": "陈伟霆",
					"ssex":ssex,
					"info":info,
					"myqq":myqq,
					"tel":tel,
					"dep":dep,
					//"psw":""					
				};
			//将info这个json转换成字符串传给后台
			var Introduction = JSON.stringify(info);
			alert(Introduction);
			var file = $('#stuheadfile').get(0).files[0];
			alert(file);
			$.ajax({
				  type:"post",
				  url:"HHTransaction/vip_editInfo.action",
				  data:"Introduction="+ Introduction +"&stuheadfile="+file,
				  dataType:"json",
				  success:function(data){			  
					  alert("修改成功！");				  
				  },
				  error:function(data){
					 // alert("error");
					  alert(data);
					  					
				  }
			});
		
		}
		
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
					<a href="#"><img/></a>
				</div>
				<div id="myname">
					<a href="#"><span>${current_user.vipNickName }</span></a>
				</div>
				<ul class="banner-ul">
					<li  class="current">
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
					<li>
						<a href="setting.jsp">个人设置</a>
					</li>
				</ul>
			</div>
			<div class="info">
				<div id="my_tit">
					<span>修改资料</span>
				</div>
				
				<div class="infoForm">
					<form action="vip_editInfo.action" method="post" id="myInfoForm" enctype="multipart/form-data">
						<!--头像区-->
						<div class="infoImage">
							<div>
								<img src="img/img_myinfo/myimage.jpg" id="my_headimg" width="200px" height="200px" />
							</div>
							
							<label>修改头像</label>
							
							<input type="file" name="stuheadfile" id="stuheadfile" value="" accept="image/*" />
							
						</div>
						<label>昵称：</label><input type="text" name="stuname" id="stuname" value="${current_user.vipNickName }" onblur="validateNickName()"/><br />
						<label>性别：</label><input type="text" name="stusex" value="" id="stusex"/><br />
						<label>简介：</label><input type="text" name="stuintro" value="" id="stuintro" /><br />
						<label>Q&thinsp;&thinsp;Q：</label><input type="text" name="QQ" value="" id="QQ"/><br />
						<label>手机：</label><input type="text" name="tel" value=""  id="tel"/><br />
						<label>院系：</label><input type="text" name="studep" value="" id="studep"/><br />
						
						<input type="submit" value="保存" id="sub" /><br />
					</form>
				</div>
			</div>  
		</div>
	</body>
	<script type="text/javascript">
	

	function validateNickName() {
		var nickname = $("#stuname").val();
	
		$.ajax({
			type:"post",
			url:"HHTransaction/vip_validateNickName.action",
			data:"nickname="+nickname,
			dateType:"json",
			success:function(data){
				var json = eval("("+data+")");
				if(json.msg){
					alert("可以使用~");					
				}else{
					alert("已被占用~");
				}
			},
			error:function(data){
				alert("调用失败！");
			}
			
		});
					
	}
	</script>

</html>