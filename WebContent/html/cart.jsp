<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的购物车</title>

<meta charset="utf-8" />
<title>购物车</title>
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

#cars_form thead tr, #cars_form tbody tr {
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
/*#goodsname{
				width: 380px;
			}*/
.goodsimg {
	cursor: pointer;
	transition: all 1s;
}
/*放大图片*/
.goodsimg:hover {
	transform: scale(4);
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

.cover {
	display: none;
	position: absolute;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.3);
	z-index: 100;
}

.inner {
	width: 400px;
	height: 260px;
	position: relative;
	margin: 100px auto;
	background-color: white;
	border-radius: 10px;
}

.inner div {
	text-align: center;
}

.inner div:first-child {
	/*position: absolute;*/
	height: 30px;
}

.inner div:first-child span {
	height: 30px;
	width: 30px;
	float: right;
	cursor: pointer;
}

.inner div:nth-child(2) {
	height: 150px;
	line-height: 150px;
}

.inner div:nth-child(3) {
	height: 50px;
	line-height: 50px;
}

.inner div:nth-child(3) button {
	width: 80px;
	height: 30px;
	margin: 10px;
	cursor: pointer;
}

.inner div:nth-child(3) button a {
	text-decoration: none;
	color: black;
}
</style>
<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
<script type="text/javascript" src="js/js.js"></script>
<script type="text/javascript" src="js/my-js.js"></script>
<script type="text/javascript">
	$(function() {
		var shopArr = [ {
			'goodsImg' : 'img/pic1.png',
			'goodsName' : 'T恤',
			'goodsPrice' : 99.00,
			'goodsNum' : 2,
			'sellId' : '0001'
		}, {
			'goodsImg' : 'img/pic1.png',
			'goodsName' : 'T恤2',
			'goodsPrice' : 85.30,
			'goodsNum' : 1,
			'sellId' : '0002'
		} ];

		shopArr =
<%=request.getAttribute("shopArr")%>
	;
		for (var i = 0; i < shopArr.length; i++) {
			var str = '<tr>'
					+ '<td><input type="checkbox" name="" id="" value="" /></td>'
					+ '<td><img class="goodsimg" src="' + shopArr[i].goodsImg + '" width="80"></td>'
					+ '<td>' + shopArr[i].goodsName + '</td>' + '<td>'
					+ shopArr[i].goodsPrice.toFixed(2) + '</td>' +
					//'<td><input id="goodsnum" type="number" name="" min="1" max="5" value="' + shopArr[i].goodsNum + '"></td>' +
					'<td>' + shopArr[i].goodsNum + '</td>'
					+ '<td class="good_price">'
					+ (shopArr[i].goodsPrice * shopArr[i].goodsNum).toFixed(2)
					+ '</td>' + '<td><a href="#" onclick="delCartItem('
					+ shopArr[i].goodsId + ')" >删除</a></td>' + '</tr>';

			$('tbody').append(str);
		}

		//结算总额
		var totalPrice = 0;

		//全选反选
		$("#cbAll").click(
				function() {
					totalPrice = 0;
					$("#g_list input:checkbox").prop("checked",
							$(this).prop("checked"));
					$("#g_list input:checked").each(
							function() {
								totalPrice += parseFloat($(this).parent()
										.siblings(".good_price").text());
							});
					//					alert(totalPrice);
					$("#buybtn").val("结算(" + totalPrice.toFixed(2) + "元)");
				});

		$("#g_list input:checkbox")
				.click(
						function() {
							if ($("#g_list input:checkbox").length === $("#g_list input:checked").length) {
								$("#cbAll").prop("checked", true);
							} else {
								$("#cbAll").prop("checked", false);
							}

							totalPrice = 0;
							$("#g_list input:checked").each(
									function() {
										totalPrice += parseFloat($(this)
												.parent().siblings(
														".good_price").text());
									});
							//					alert(totalPrice);
							$("#buybtn").val(
									"结算(" + totalPrice.toFixed(2) + "元)");
						});

		//点击结算，购买成功，跳转到联系卖家界面
		$('#buybtn')
				.click(
						function() {
							$('.cover').show();
							//获取时间
							var now = new Date();
							var nowdata = now.getFullYear() + "/"
									+ ((now.getMonth() + 1) < 10 ? "0" : "")
									+ (now.getMonth() + 1) + "/"
									+ (now.getDate() < 10 ? "0" : "")
									+ now.getDate() + " " + now.getHours()
									+ ":" + now.getMinutes();
							//alert(nowdata);

							for (var i = 0; i < $("#g_list input:checked").length; i++) {

								var index = $("#g_list input:checked").eq(i)
										.parent().parent().index();

								var fromId = shopArr[index].sellId;
								//console.log(shopArr[index].goodsId );
								//alert(shopArr[index].goodsId );
								var textWord = "你已预购 商品：<a href='goods_findDetailGoods.action?goodsId="
										+ shopArr[index].goodsId
										+ "'>"
										+ shopArr[index].goodsName + "</a>成功!";
								//var textWord="你已预定成功！";
								//alert(textWord);
								//添加至聊天
								$
										.ajax({
											type : "post",
											url : "HHTransaction/message_sellToCurMessage.action",
											data : {
												fromId : fromId,
												messageContent : textWord
											},
											//dataType:"json",
											success : function(data) {
												// alert(textWord);

											},
											error : function(data) {
												alert("发送失败~");
											}

										});

								//console.log(str);
							}
						});
		//获取批量的id
		var goodsIdArr = "";
		//alert(shopArr[i].goodsId);
		$('#buyClose,#sureBtn').click(function() {
			$('.cover').hide();
			//已经预算的的从购物车中去掉
			for (var i = $("#g_list input:checked").length - 1; i >= 0; i--) {
				var tr = $("#g_list input:checked").eq(i).parent().parent();
				var index = tr.index();
				//alert(index);

				var id = shopArr[index].goodsId;
				//alert(id);
				//goodsIdArr.push(id);
				goodsIdArr = goodsIdArr + id + ",";
				//alert(goodsIdArr);
				tr.remove();
			}
			//获取的goodsId数组添加到订单中
			//alert(goodsIdArr);					
			$.ajax({
				type : "post",
				url : "HHTransaction/order_addOrder.action",
				data : {
					goodsIdArr : goodsIdArr
				},
				//dataType:"json",
				success : function(data) {
					//删除购物车
					$.ajax({
						type : "post",
						url : "HHTransaction/cartItem_delCartArr.action",
						data : {
							goodsIdArr : goodsIdArr
						},
						//dataType:"json",
						success : function(data) {
							alert("删除成功~");
							//window.location.href="cartItem_getCartItem.action";
						},
						error : function(data) {
							alert("删除失败~");

						}

					});

				},
				error : function(data) {
					alert("预购失败~");
				}

			});

		});

	});
</script>
</head>

<body>
	<div class="cover">
		<div class="inner">
			<div>
				<span id="buyClose">x</span>
			</div>
			<div>
				<span>预定成功！请自行联系卖家拿货！</span>
			</div>
			<div>
				<button id="sureBtn">确定</button>
				<button>
					<a href="message_getMessageForCurr.action">联系他</a>
				</button>
			</div>
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
						<li id="put"><a href="index.jsp">首页</a></li>
						<li id="put"><a href="put.jsp">我要发布</a></li>
						<li id="mess"><a href="message_getMessageForCurr.action">消息</a>
						</li>

						<li id="my"><a href="vip_getVipIntroduction.action">${current_user.vipNickName}</a>
							<ul id="my-2" style="display: none;">
								<li><a href="#" style="color: black;">购物车</a></li>
								<li><a href="#" style="color: black;">订单</a></li>
								<li><a href="vip_logout.action" style="color: black;">退出</a>
								</li>
							</ul></li>
					</ul>
					</nav>
				</s:if>
				<!--未登陆之前显示-->
				<div class="float-right">
					<span> <s:if test="%{#session.current_user==null}">
							<a href="login.jsp"> 登录/注册 </a>
							   ||
							   <a href="index.jsp"> 首页 </a>
						</s:if>
					</span>
				</div>


			</div>
			<!--右边结束-->
			<!--标题logo-->
			<div id="logo">
				<h1>
					<a><span
						style="font-family: '微软雅黑'; font-size: 28px; color: #0bb9f8; font-weight: bolder;">黄淮&nbsp;&nbsp;</span><span
						style="font-family: '微软雅黑'; font-size: 28px; font-weight: bolder;">二手工坊</span></a><img
						src="" />
				</h1>
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
				<a href="vip_getVipIntroduction.action"><img
					data-type='${current_user.vipIntroduction}' /></a>
			</div>
			<div id="myname">
				<a href="#"><span>${current_user.vipNickName }</span></a>
			</div>
			<ul class="banner-ul">
				<li><a href="vip_getVipIntroduction.action">编辑资料</a></li>
				<li><a href="message_getMessageForCurr.action">我的消息</a></li>
				<li class="current"><a href="cartItem_getCartItem.action">购物车</a>
				</li>
				<li><a href="buyed.jsp">我买到的</a></li>
				<li><a href="goods_getPutGood.action">我的闲置</a></li>
				<li><a href="put.jsp">发布闲置</a></li>
				<li><a href="setting.jsp">个人设置</a></li>
			</ul>
		</div>

		<div class="info">

			<div class="put_goods">
				<div id="cars_h2">
					<h2>购物车</h2>
				</div>
				<br />
				<!--<div id="goods_form">-->
				<div id="cars_form">
					<table cellpadding="10" cellspacing="0" border="1">
						<thead>
							<tr>
								<td><input type="checkbox" id="cbAll" /></td>
								<td>图片</td>
								<td id="goodsname">名称</td>
								<td>价格</td>
								<td>数量</td>
								<td>价格</td>
								<td>操作</td>
							</tr>
						</thead>
						<tbody id="g_list">
						</tbody>
					</table>
					<input id="buybtn" type="submit" name="buybtn" value="预购(0.00元)">

					<div id="pagination">
						<ul class="pagination">
							<%=request.getAttribute("pageSplit")%>
						</ul>
					</div>
					<!--</form>-->
				</div>
				<!--</div>-->
			</div>
		</div>


	</div>
</body>
<script type="text/javascript">
	function delCartItem(goodsId) {
		$.ajax({
			type : "post",
			url : "HHTransaction/cartItem_delCart.action",
			data : "goodsId=" + goodsId,
			//dataType:"json",
			success : function(data) {
				alert("删除成功~");
				window.location.href = "cartItem_getCartItem.action";
			},
			error : function(data) {
				alert("删除失败~");

			}

		});

	}
</script>
</html>