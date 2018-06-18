<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>黄淮二手商城</title>
		<meta charset="UTF-8">
		<title></title>
		<style type="text/css">
			*{
				padding: 0;
				margin: 0;
			}
			.header{
				height: 110px;
				background-color: #FFFFFF;
				box-shadow: 0px 0px 10px 0px #999999;
			}
			.logo{
				width: 1000px;
				height: 90px;
				line-height: 80px;
				margin: 0 auto;
				background-color: #FFFFFF;
			}
			.logo h1{
				float: left;
			}
			.login{
				margin-top: 40px;
				float: right;
				color: #999999;
			}
			.login a{
				text-decoration: none;
				color: #E4393C;
			}
			.con{
				height: 500px;
				background-color: #FFFFFF;
				margin-top: 8px;
				margin-bottom: 10px;
			}
			.reg{
				margin: 0 auto;
				width: 580px;
				height: 480px;
				/*border-bottom: 1px #999999 solid;*/
				text-align: center;
				/*position: relative;*/
			}
			.reg h1{
				font-size: 24px;
				margin-top: 50px;
				color: #E4393C;
			}
			.reg label{
				display: inline-block;
			}
			.reg input{
				width: 350px;
				height: 40px;
				line-height: 40px;
				margin-top: 20px;
				border: 1px #999999 solid;
				font-size: 20px;
			
				
			}
			
			.reg img{
				width: 26px;
				height: 26px;
				vertical-align: middle;
			}
			.regsub{
				background-color: #E4393C;
				width: 400px;
				height: 55px;
				color: #FFFFFF;
			}
			
			.regsubno{
				background-color: #A3A3A3;
				width: 400px;
				height: 55px;
				color: #FFFFFF;
			}
			
			.reg .posi{
				position: relative;
			}
			/*隐藏验证框*/
			.reg .fixed{
				position: absolute;
				left: 480px;
				width: 150px;
				
			}
			
			.reg .demo1{
				width: 570px;
				height: 60px;
				margin-top: 10px;
				line-height: 60px;
				/*position: relative;*/
			}
			.reg .demo1 #slider0{
				width: 230px;
				position: relative;
			}
			
			.reg .demo1 #slider1{
				display: inline-block;
				position: absolute;
				top: 10px;
			}
			
			
			/*版权*/
			center{
				position: fixed;
				bottom: 50px;
				left: 50%;
				margin-left:-130px ;
			}
			
		</style>
	</head>
	<body>
		<div class="header">
			<div class="logo">
				<h1><a><span style="font-family: '微软雅黑';font-size: 28px;color: #0bb9f8;font-weight: bolder;">黄淮&nbsp;&nbsp;</span><span style="font-family: '微软雅黑';font-size: 28px;font-weight: bolder;">二手工坊</span></a><img src=""/></h1>
				<p class="login"><span >已有账号？</span><a href="login.jsp" >请登陆></a></p>
			</div>
		</div>
		<div class="con">		
			<div class="reg">
			  <form action="reg.jsp" method="post">
				<h1>欢迎注册</h1>
				
				<!--邮箱-->
				<label class="posi">邮&emsp;&emsp;箱：<span class="fixed" id="emailMess"></span></label><img src="img/reg2.jpg"><input type="text" name="email" id="email" required><br>
	 
				<div class="demo1">
				  <div id="slider0">
				 	 <label>验&emsp;&emsp;证：</label><img src="img/reg2.jpg"><div id="slider1"></div>
		          </div>
	            </div>
                <div id="validateSubmit">		
				<input type="submit" name="submit" class="regsubno" value="下一步" " id="submit" onclick="return false;">
				<div>
			 </form>
			</div>		
		</div>
		<center>Copyright &copy; 2018 黄淮学院 版权所有</center>
		
	</body>
</html>

<script src="js/jquery-1.11.1.js" type="text/javascript"></script>
<link rel="stylesheet" href="css/jquery.slider.css" />
<script type="text/javascript" src="js/jquery.slider.min.js"></script>

<script type="text/javascript">

var ok1=false;

$("#slider1").slider({
	width: 340, // width
	height: 40, // height
	sliderBg: "rgb(134, 134, 131)", // 滑块背景颜色
	color: "#fff", // 文字颜色
	fontSize: 14, // 文字大小
	bgColor: "#E4393C", // 背景颜色
	textMsg: "按住滑块，拖拽验证", // 提示文字
	successMsg: "验证通过了哦", // 验证成功提示文字
	successColor: "#fff", // 滑块验证成功提示文字颜色
	time: 400, // 返回时间
	callback: function(result) { // 回调函数，true(成功),false(失败)
		//$("#result1").text(result);
	   if(result && ok1){		 
		 // $("#submit").removeClass("regsubno").addClass("regsub");
		 
		   $("#validateSubmit").html('<input type="submit" name="submit" class="regsub" value="下一步" " id="submit" >');
          
	   }
	      
	}
});



$(function(){	 
	
 
    
//邮箱验证
$("#email").blur(function(){	
	 //获取id对应的元素的值，去掉其左右的空格
	 var email = $.trim($('#email').val());	 
	 //验证邮箱格式的js正则表达式
	 var isEmail = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
	 //清空显示层中的数据    	 
	 $("#emailMess").html("");	
	 if(email == ""){
		   $("#emailMess").html("<img src='img/icon/error.ico'>"+"邮箱不能为空!");		   
	 }
	 else if(!(isEmail.test(email))){
		   $("#emailMess").html("<img src='img/icon/error.ico'>"+"邮箱格式错误！");		  
	 }
	 else{
               //此处可以操作向后台发送json数据，然后返回验证结果
		 $("#emailMess").html("<img src='img/icon/yes.ico'>");	
		 ok1=true;
      }
});

//提交按钮,所有验证通过方可提交



});
<!--邮箱验证-->
</script>


<script type="text/javascript">



 function validateNickName(){
	 var nickname = document.getElementById("nickname").value;
	 $.ajax({  
         type:"post",  
         url:"HHTransaction/validateNickName.action",  
         data:"nickname="+nickname,  
         dataType:"json",  
         success:function(data){              
              alert(data.msg);  
              console.log(data)                
          },  
         error:function(jqObj){  
              console.log(jqObj.status)       
              alert("Jquery失败哦");  
          }  
     });
	 
 }


</script>
