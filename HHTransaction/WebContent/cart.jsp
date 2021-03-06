<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="s"  uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的购物车</title>

		<meta charset="utf-8" />
		<title>购物车</title>
		<link rel="stylesheet" type="text/css" href="css/css.css"/>
		<link rel="stylesheet" type="text/css" href="css/my_css.css" />
		<style type="text/css">
			#cars_h2 h2{
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
			
			#cars_form thead tr,#cars_form tbody tr{
				height: 30px;
			}
			#buybtn{
				width: 130px;
				float: right;
				margin-top: 30px;
				margin-right: 100px;
				border: none;
				background-color:rgb(239, 83, 80);
				color: white;
				height: 30px;
			}
			/*#goodsname{
				width: 380px;
			}*/
			.goodsimg{
				cursor: pointer;
				transition: all 1s;
			} 
			/*放大图片*/
			.goodsimg:hover{
				transform: scale(4);
			}
			#goodsnum{
				width: 40px;
			}
			#pagination{
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
		</style>
		<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
		<script type="text/javascript" src="js/js.js"></script>
		<script type="text/javascript" src="js/my-js.js"></script>
		<script type="text/javascript">
			$(function() {
				var shopArr = [{
					'goodsImg': 'img/pic1.png',
					'goodsName': 'T恤',
					'goodsPrice': 99.00,
					'goodsNum': 2
				}, {
					'goodsImg': 'img/pic1.png',
					'goodsName': 'T恤2',
					'goodsPrice': 85.30,
					'goodsNum': 1
				}];
				
				shopArr = <%=request.getAttribute("shopArr")%>;
				for(var i = 0; i < shopArr.length; i++) {
					var str = '<tr>' +
						'<td><input type="checkbox" name="" id="" value="" /></td>' +
						'<td><img class="goodsimg" src="' + shopArr[i].goodsImg + '" width="80"></td>' +
						'<td>' + shopArr[i].goodsName + '</td>' +
						'<td>' + shopArr[i].goodsPrice.toFixed(2) + '</td>' +
						//'<td><input id="goodsnum" type="number" name="" min="1" max="5" value="' + shopArr[i].goodsNum + '"></td>' +
						'<td>' + shopArr[i].goodsNum + '</td>' +
						'<td class="good_price">' + (shopArr[i].goodsPrice * shopArr[i].goodsNum).toFixed(2) + '</td>' +
						'<td><a href="#" onclick="delCartItem('+ shopArr[i].goodsId+ ')" >删除</a></td>' +
						'</tr>';
						
					$('tbody').append(str);
				}
				
				//结算总额
				var totalPrice=0;
				
				//全选反选
				$("#cbAll").click(function() {
					totalPrice=0;
					$("#g_list input:checkbox").prop("checked", $(this).prop("checked"));
					$("#g_list input:checked").each(function(){
						totalPrice += parseFloat($(this).parent().siblings(".good_price").text());
					});
//					alert(totalPrice);
					$("#buybtn").val("结算("+totalPrice.toFixed(2)+"元)");
				});

				$("#g_list input:checkbox").click(function() {
					if($("#g_list input:checkbox").length === $("#g_list input:checked").length) {
						$("#cbAll").prop("checked", true);
					} else {
						$("#cbAll").prop("checked", false);
					}
					
					totalPrice =0;
					$("#g_list input:checked").each(function(){
					    totalPrice += parseFloat($(this).parent().siblings(".good_price").text());
					});
//					alert(totalPrice);
					$("#buybtn").val("结算("+totalPrice.toFixed(2)+"元)");
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
					<li class="current">
						<a href="cartItem_getCartItem.action">购物车</a>
					</li>
					<li>
						<a href="buyed.html">我买到的</a>
					</li>
					<li>
						<a href="#">我的闲置</a>
					</li>
					<li>
						<a href="put.jsp">发布闲置</a>
					</li>
					<li>
						<a href="#">个人设置</a>
					</li>
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
						<input id="buybtn" type="submit" name="buybtn" value="结算(0.00元)">

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
			  type:"post",
			  url:"HHTransaction/cartItem_delCart.action",
			  data:"goodsId="+goodsId,
			  //dataType:"json",
			  success:function(data){			  
				  alert("删除成功~");
				  window.location.href="cartItem_getCartItem.action";
			  },
			  error:function(data){
				  alert("删除失败~");
				
			  }
			
		});
		
	}
	</script>
</html>