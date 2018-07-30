<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的订单</title>
		<meta charset="utf-8" />
		<title>我的订单</title>
		<link rel="stylesheet" type="text/css" href="css/css.css"/>
		<link rel="stylesheet" type="text/css" href="css/my_css.css" />
		<style type="text/css">
			#cars_h2 h2{
				font-size: 24px;
				text-align: center;
				color: rgb(11, 145, 248);
			}
			#cars_form {
				position: relative;
				width: 97%;
				height: 520px;
				background-color: #fff;
				padding-top: 10px;
				box-shadow: 0 0 10px 3px #CCCCCC;
				margin-left: 45px;
				
			}
			#cars_form table{
				width: 96%;
   				margin: 10px auto 0;
				text-align: center;
				border-width: 1px;
				border-color: #e5d1df87;
			}
			#cars_form thead{
				background-color: #EF5350;
				color: #fff;
			}
			#cars_form thead tr{
				height: 30px;
			}
			#cars_form tbody tr{
				height: 30px;
			}
			
			#cars_form input{
				width: 130px;
				float: right;
				margin-top: 30px;
				margin-right: 100px;
				border: none;
				background-color:rgb(239, 83, 80);
				color: white;
				height: 30px;
			}
			#goodsname{
				width: 20	0px;
			}
			.goodsimg{
				cursor: pointer;
				transition: all 1s;
			} 
			.goodsimg:hover{
				transform: scale(4);
			}
			#pagination{
				position: absolute;
			    bottom: 20px;
			    right: 20px;
			    height: 40px;
			    width: auto;
			    margin: 0 auto;
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
				var orderArr = [
					{
						'orderId':'20180613223401',
						'orderDate':'2018/06/13 22:34',
						'orderAddress':'河南省固始县黎集镇',
						'orderPrice':100.50,
						'goodsList':[{
										'goodsId':'15',
										'goodsName':'T恤',
										'goodsPrice':30,
										'vipSellId':'56',
										'vipSellName':'李四'
									},{
										'goodsId':'14',
										'goodsName':'U型枕',
										'goodsPrice':120,
										'vipSellId':'56',
										'vipSellName':'王二'
									}],
						'buyName':'ting',
					},{
						'orderId':'20180613223401',
						'orderDate':'2018/06/13 22:34',
						'orderAddress':'河南省固始县黎集镇',
						'orderPrice':190.50,
						'goodsList':[{
										'goodsId':'15',
										'goodsName':'T恤',
										'goodsPrice':30,
										'vipSellId':'56',
										'vipSellName':'张三'
									},{
										'goodsId':'14',
										'goodsName':'U型枕',
										'goodsPrice':120,
										'vipSellId':'56',
										'vipSellName':'阿珂'
									}],
						'buyName':'ting'
					},{
						'orderId':'20180613223401',
						'orderDate':'2018/06/13 22:34',
						'orderAddress':'河南省固始县黎集镇',
						'orderPrice':300.50,
						'goodsList':[{
										'goodsId':'15',
										'goodsName':'T恤',
										'goodsPrice':30,
										'vipSellId':'56',
										'vipSellName':'小鱼'
									},{
										'goodsId':'14',
										'goodsName':'U型枕',
										'goodsPrice':110,
										'vipSellId':'56',
										'vipSellName':'小婷'
									}],
						'buyName':'ting'
					}
				];
				
				orderArr=<%=request.getAttribute("orderArr")%>;
				if(orderArr.length == 0){
					$("#nogoods").show();
					$("#cars_form").hide();
				}
				
				//放进table中
				//alert(orderArr.length);
				for(var i=0;i<orderArr.length;i++){
					//通过orderId获取goodslist
					var orderId = orderArr[i].orderId;
						
					var goodsListArr = orderArr[i].goodsList;
					
					var listLength = goodsListArr.length;
					
					//alert(listLength);
					
					var listStr = '<tr>'+
							'<td rowspan='+listLength+'>'+orderArr[i].orderId+'</td>'+
							'<td>'+goodsListArr[0].goodsName+'</td>'+
							'<td>'+goodsListArr[0].goodsPrice.toFixed(2)+'元</td>'+
							'<td>'+goodsListArr[0].vipSellName+'</td>'+
							'<td rowspan='+listLength+'>'+orderArr[i].orderDate+'</td>'+
							'<td rowspan='+listLength+'>'+orderArr[i].orderAddress+'</td>'+
							//保留小数
							'<td rowspan='+listLength+'>'+orderArr[i].orderPrice.toFixed(2)+'元</td>'+
							'<td rowspan='+listLength+'>'+orderArr[i].buyName+'</td>'+
							'</tr>';
					for(var j=1;j<listLength;j++){
						listStr += '<tr><td>'+goodsListArr[j].goodsName+'</td>'+
									'<td>'+goodsListArr[j].goodsPrice.toFixed(2)+'元</td>'+
									'<td>'+goodsListArr[j].vipSellName+'</td>'+
									'</tr>';
					}
					
					$('#cars_form').find('tbody').append(listStr);
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
					<li >
						<a href="cartItem_getCartItem.action">购物车</a>
					</li>
					<li class="current">
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

				<div class="put_goods">
					<div id="cars_h2">
						<h2>我的订单</h2>
					</div>
					<br />
					<!--<div id="goods_form">-->
					<div id="cars_form">
						<table cellpadding="10" cellspacing="0" border="1">
							<thead>
								<tr>
								<td>订单编号</td>
								<td id="goodsname">商品名称</td>
								<td>价格</td>
								<td>卖家</td>
								<td>时间</td>
								<td>地址</td>
								<td>总价</td>
								<td>买家</td>
								</tr>
							</thead>
							<tbody>
								<!--<tr>
								<td rowspan="2">20180613223401</td>
								<td>T恤</td>
								<td>张三</td>
								<td>30元</td>
								<td rowspan="2">2018-06-13 22:34</td>
								<td rowspan="2">河南省固始县黎集镇</td>
								<td rowspan="2">100.00元</td>
								<td rowspan="2">陈伟霆</td>
								</tr>
								<tr>
								<td>T恤</td>
								<td>张三</td>
								<td>30元</td>
								</tr>-->
							</tbody>
						</table>
						
						<div id="pagination">
							<ul class="pagination">
							<!-- 订单分页未做 -->
							</ul>	
						</div>					
						<!--</form>-->
					</div>
					
					<div id="nogoods">
						<div>
							<h2>你还没有订单哦~</h2>
							<span>
								<a href="goods_GoosListByClassify.action?classifyId=1">购买商品</a>
							</span>
						</div>
					</div>
						
					<!--</div>-->
				</div>
			</div>

		</div>
	</body>

</html>