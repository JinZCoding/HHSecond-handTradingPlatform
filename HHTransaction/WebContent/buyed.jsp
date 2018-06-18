<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			#cars_form tbody tr:hover{
				background-color: #FCD1D0;
				color: white;
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
		</style>
		<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
		<script type="text/javascript" src="js/js.js"></script>
		<script type="text/javascript" src="js/my-js.js"></script>
		<script type="text/javascript">
			$(function() {
				var cartArr = [
					{
						'cardId':'20180613223401',
						'cardName':'T恤',
						'cardTime':'2018/06/13 22:34',
						'cardAdd':'河南省固始县黎集镇',
						'cardPri':100.50,
						'saleName':'陈伟霆',
						'buyName':'张三'
					},{
						'cardId':'20180613223402',
						'cardName':'T恤',
						'cardTime':'2018/06/13 22:34',
						'cardAdd':'河南省固始县黎集镇',
						'cardPri':80.00,
						'saleName':'陈伟霆',
						'buyName':'张三'
					},{
						'cardId':'20180613223403',
						'cardName':'T恤',
						'cardTime':'2018/06/13 22:34',
						'cardAdd':'河南省固始县黎集镇',
						'cardPri':10.98,
						'saleName':'陈伟霆',
						'buyName':'张三'
					}
				];
				
				//放进table中
				for(var i=0;i<cartArr.length;i++){
					var listStr = '<tr>'+
							'<td>'+cartArr[i].cardId+'</td>'+
							'<td>'+cartArr[i].cardName+'</td>'+
							'<td>'+cartArr[i].cardTime+'</td>'+
							'<td>'+cartArr[i].cardAdd+'</td>'+
							//保留小数
							'<td>'+cartArr[i].cardPri.toFixed(2)+'元</td>'+
							'<td>'+cartArr[i].saleName+'</td>'+
							'<td>'+cartArr[i].buyName+'</td>'+
							'</tr>';
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
					<!--未登陆之前显示-->
					<div class="float-right">
						<span><a href="#">
							登录/注册</a>
						</span>
					</div>

					<nav class="float-right">
						<ul id="navlist">
							<li id="put">
								<a href="put.html">我要发布</a>
							</li>
							<li id="my">
								<a href="javascript:;">我的</a>
								<ul id="my-2" style="display: none;">
									<li>
										<a href="shoppingTrolley.html" style="color: black;">购物车</a>
									</li>
									<li>
										<a href="javascript:;" style="color: black;">订单</a>
									</li>
								</ul>
							</li>
							<li id="mess">
								<a href="mess.html">消息</a>
							</li>
						</ul>
					</nav>

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
		
		<div class="content">
			<div class="banner">
				<div id="my_img">
					<a href="#"><img/></a>
				</div>
				<div id="myname">
					<a href="#"><span></span></a>
				</div>
				<ul class="banner-ul">
					<li>
						<a href="my.html">编辑资料</a>
					</li>
					<li>
						<a href="mess.html">我的消息</a>
					</li>
					<li >
						<a href="shoppingTrolley.html">购物车</a>
					</li>
					<li class="current">
						<a href="buyed.html">我买到的</a>
					</li>
					<li>
						<a href="#">我的闲置</a>
					</li>
					<li>
						<a href="put.html">发布闲置</a>
					</li>
					<li>
						<a href="#">个人设置</a>
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
								<td>时间</td>
								<td>地址</td>
								<td>总价</td>
								<td>买家</td>
								<td>卖家</td>
								</tr>
							</thead>
							<tbody>
								<!--<tr>
								<td>20180613223401</td>
								<td>T恤</td>
								<td>2018-06-13 22:34</td>
								<td>河南省固始县黎集镇</td>
								<td>100.00元</td>
								<td>陈伟霆</td>
								<td>张三</td>
								</tr>

								<tr>
								<td>20180613223401</td>
								<td>T恤</td>
								<td>2018-06-13 22:34</td>
								<td>河南省固始县黎集镇</td>
								<td>100.00元</td>
								<td>陈伟霆</td>
								<td>张三</td>
								</tr>

								<tr>
								<td>20180613223401</td>
								<td>T恤</td>
								<td>2018-06-13 22:34</td>
								<td>河南省固始县黎集镇</td>
								<td>100.00元</td>
								<td>陈伟霆</td>
								<td>张三</td>
								</tr>-->
							</tbody>
						</table>
						
						<div id="pagination">
							<ul class="pagination">
							<li><a href="#">«</a></li>
							<li><a href="#">1</a></li>
							<li><a class="current" href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">4</a></li>
							<li><a href="#">5</a></li>
							<li><a href="#">6</a></li>
							<li><a href="#">7</a></li>
							<li><a href="#">»</a></li>
							</ul>	
						</div>					
						<!--</form>-->
					</div>
					<!--</div>-->
				</div>
			</div>

		</div>
	</body>

</html>