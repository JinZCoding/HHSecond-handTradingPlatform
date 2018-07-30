<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s"  uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>我的闲置</title>
		<meta charset="utf-8" />
		<link rel="stylesheet" type="text/css" href="css/css.css" />
		<link rel="stylesheet" type="text/css" href="css/my_css.css" />
		<style type="text/css">
			#cars_h2 h2 {
				font-size: 24px;
				text-align: center;
				color: rgb(11, 145, 248);
			}
			
			#cars_form {
				width: 97%;
				height: 520px;
				background-color: #fff;
				padding-top: 10px;
				box-shadow: 0 0 10px 3px #CCCCCC;
				margin-left: 45px;
				position: relative;
				/*display: none;*/
			}
			
			#cars_form table {
				width: 96%;
				margin: 10px auto 0;
				text-align: center;
				border-width: 1px;
				border-color: #e5d1df87;
			}
			
			#cars_form thead {
				background-color: #EF5350;
				color: #fff;
			}
			
			#cars_form thead tr,
			#cars_form tbody tr {
				height: 30px;
			}
			
			#buybtn {
				width: 130px;
				float: right;
				margin-top: 30px;
				margin-right: 100px;
				border: none;
				background-color: rgb(239, 83, 80);
				color: white;
				height: 30px;
			}
			
			.goodsimg {
				cursor: pointer;
				transition: all 1s;
			}
			
			#goodsnum {
				width: 40px;
			}
			
			#pagination {
				position: absolute;
				bottom: 20px;
				left: 50%;
				margin-left: -180px;
			}
			
			.pagination {
				display: inline-block;
				padding: 0;
				margin: 0;
			}
			
			.pagination li {
				display: inline;
			}
			
			.pagination li a {
				color: black;
				float: left;
				padding: 8px 16px;
				text-decoration: none;
			}
			
			/*没有商品时显示*/
			#nogoods {
				width: 97%;
				height: 520px;
				background-color: #fff;
				padding-top: 10px;
				box-shadow: 0 0 10px 3px #CCCCCC;
				margin-left: 45px;
				position: relative;
				display: none;
			}
			#nogoods div{
				width: 400px;
				height: 300px;
				/*border: 1px solid #000;*/
				margin: 100px auto;
				text-align: center;
			}
			#nogoods div h2{
				line-height: 150px;
				font-size: 22px;
				color: skyblue;
			}
			#nogoods div span{
				font-size: 20px;
			}
			#nogoods div span a{
				font-size: 20px;
				text-decoration: none;
				color: rgb(239, 83, 80);
			}
		</style>
		<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
		<script type="text/javascript" src="js/js.js"></script>
		<script type="text/javascript" src="js/my-js.js"></script>
		<script type="text/javascript">
			$(function() {
				var shopArr = [];
				shopArr = <%=request.getAttribute("shopArr")%>;
				
				if(shopArr.length == 0){
					$("#nogoods").show();
					$("#cars_form").hide();
				}
				
				for(var i = 0; i < shopArr.length; i++) {
					var str = '<tr>' +
						//'<td><input type="checkbox" name="" id="" value="" /></td>' +
						'<td><img class="goodsimg" src="' + shopArr[i].goodsImg + '" width="80"></td>' +
						'<td>' + shopArr[i].goodsName + '</td>' +
						
						//'<td><input id="goodsnum" type="number" name="" min="1" max="5" value="' + shopArr[i].goodsNum + '"></td>' +
						'<td>' + shopArr[i].goodsNum + '</td>' +
						'<td>' + shopArr[i].goodsPrice.toFixed(2) + '</td>' +
						'<td><a href="#" onclick="delGoods(' + shopArr[i].goodsId + ')" >删除</a></td>' +
						'</tr>';
						

					$('tbody').append(str);
					//alert(shopArr[i].goodsId);
				}


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
					<li>
						<a href="cartItem_getCartItem.action">购物车</a>
					</li>
					<li>
						<a href="order_getOrderArr.action">我买到的</a>
					</li>
					<li class="current">
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

				<div class="put_goods">
					<div id="cars_h2">
						<h2>我的闲置</h2>
					</div>
					<br />
					<!--<div id="goods_form">-->
					<div id="cars_form">
						<table cellpadding="10" cellspacing="0" border="1">
							<thead>
								<tr>
									<td>图片</td>
									<td id="goodsname">名称</td>
									
									<td>数量</td>
									<td>价格</td>
									<td>操作</td>
								</tr>
							</thead>
							<tbody id="g_list">
							</tbody>
						</table>

						<div id="pagination">
							<ul class="pagination">
								<%=request.getAttribute("pageSplit")%>
							</ul>
						</div>
						<!--</form>-->
					</div>
					
					<div id="nogoods">
						<div>
							<h2>您还没有发布任何闲置哦~</h2>
							<span>
								点击<a href="put.jsp">发布闲置</a>
							</span>
						</div>
						
					</div>
					<!--</div>-->
				</div>
			</div>

		</div>
	</body>
	<script type="text/javascript">
	
		function delGoods(goodsId) {
			$.ajax({
				type: "post",
				url:"HHTransaction/goods_delPutGoods.action",				
				data: "goodsId=" + goodsId,
				//dataType:"json",
				success: function(data) {
					alert("删除成功~");
					window.location.href = "goods_getPutGoods.action";
				},
				error: function(data) {
					//alert("删除"+goodsId);
					alert("删除失败~");

				}

			});

		}
	
	</script>

</html>