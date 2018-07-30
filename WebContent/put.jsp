<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

		<meta charset="utf-8" />
		<title>发布</title>
		<link rel="stylesheet" type="text/css" href="css/css.css"/>
		<link rel="stylesheet" type="text/css" href="css/my_css.css" />
		<style type="text/css">
			.put_goods {
				position: absolute;
				width: 90%;
				height: 580px;
				margin: 20px 30px;
			}
			
			.put_goods h2 {
				font-size: 24px;
				text-align: center;
				color: rgb(11, 145, 248);
			}
			
			#goods_form {
				width: 1200px;
				height: 520px;
				background-color: #fff;
				padding-top: 10px;
				box-shadow: 0 0 10px 3px #CCCCCC;
				margin-left: 45px;
			}
			
			#g_img {
				width: 420px;
				height: 420px;
				margin-left: 50px;
			}
			
			#goods_f {
				width: 580px;
				height: 400px;
				/*border: 1px solid #ccc;*/
				position: absolute;
				right: 60px;
				top: 60px;
				padding: 20px;
				background-color: #FFFFFF;
			}
			
			#goods_f div {
				height: 50px;
				margin-left: 80px;
			}
			
			#goods_f label {
				font-size: 20px;
				color: rgb(11, 145, 248);
			}
			
			#goods_f input {
				width: 300px;
				height: 25px;
			}
			
			#goods_f #goods_text {
				height: 210px;
				position: relative;
			}
			
			#goods_f #goods_text label {
				position: absolute;
				left: 0;
				top: 0;
			}
			
			#goods_f textarea {
				position: absolute;
				left: 105px;
				width: 294px;
				height: 200px;
				padding: 5px 3px 3px 5px;
			}
			
			#goods_f #sub_btn {
				position: absolute;
				bottom: 0;
				left: 50px;
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
		<script type="text/javascript" src="js/my-js.js"></script>
		
		<script type="text/javascript">
			
			$(function() {
				
				//头像
				//在input file内容改变的时候触发事件
				$('#goods_imgfile').change(function() {
					//获取input file的files文件数组;
					//$('#filed')获取的是jQuery对象，.get(0)转为原生对象;
					//这边默认只能选一个，但是存放形式仍然是数组，所以取第一个元素使用[0];
					var file = $('#goods_imgfile').get(0).files[0];
					//创建用来读取此文件的对象
					var reader = new FileReader();
					//使用该对象读取file文件
					reader.readAsDataURL(file);
					//读取文件成功后执行的方法函数
					reader.onload = function(e) {
						//读取成功后返回的一个参数e，整个的一个进度事件
						console.log(e);
						//选择所要显示图片的img，要赋值给img的src就是e中target下result里面的base64编码格式的地址
						$('#goods_img').get(0).src = e.target.result;
						
					}
				})

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
							   ||
							   <a href="index.jsp">
							   首页 </a>
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
					<li class="current">
						<a href="put.jsp">发布闲置</a>
					</li>
					<li>
						<a href="setting.jsp">个人设置</a>
					</li>
				</ul>
			</div>
			<div class="info">

				<div class="put_goods">
					<div id="goods_h2">
						<h2>发布闲置</h2>
					</div>
					<br />
					<!--<div id="goods_form">-->
					<form action="goods_putGoods.action" method="post" id="goods_form" enctype="multipart/form-data">
							
						<div id="g_img">
						<img src="#" id="goods_img" width="400px" height="400px" /><br />
							<label>上传图片：</label><input type="file" name="imgfile" id="goods_imgfile" /><br />
								

						</div>

						<!--<form action="" method="post" id="goods_f">-->
						<div id="goods_f">
							<div>
								<label>标&emsp;&emsp;题：</label>
								<input type="text" name="goodsName" id="goods_tit" placeholder="例如：联想电脑" autofocus="autofocus" />
							</div>
							<div>
								<label>价&emsp;&emsp;格：</label>
								<input type="number" name="goodsPrice" id="goods_price" value="" />
							</div>
							<div>
								<label>商品类别：</label>
								<select name="goodsClassify" id="goods_type">
									<option value="电子产品">电子产品</option>
									<option value="服装配饰" selected="selected">服装配饰</option>
									<option value="文娱教育">文娱教育</option>
									<option value="美容美化">美容美化</option>
									<option value="生活用品">生活用品</option>
								</select>

							</div>
							<div id="goods_text">
								<label>商品详情：</label>
								<textarea name="goodsIntroduction" placeholder="商品详细信息"></textarea>
							</div>
							<input type="submit" value="发布" id="sub_btn" />
						
						</div>
						<!--</form>-->
					</form>
					<!--</div>-->
				</div>
			</div>
		</div>
	</body>

</html>