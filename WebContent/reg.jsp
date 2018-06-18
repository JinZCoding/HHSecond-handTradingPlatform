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
				border-bottom: 1px #999999 solid;
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
			.reg .fixed{
				position: absolute;
				left: 480px;
				width: 150px;
				
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
			  <form action="vip_register.action" method="post">
				<h1>欢迎注册</h1>
				<!--<label>用&nbsp;户&nbsp;名 ：</label><img src="img/reg1.jpg"><input type="text" name=""><br>-->
				
				<label class="posi">邮&emsp;&emsp;箱：<span class="fixed" id="emailMess"></span></label><img src="img/reg1.jpg"><input type="text" name="email" id="email" value="<%String str = (String)request.getParameter("email"); out.print(str);%>" readonly="readonly"><br>
				<label class="posi">昵&emsp;&emsp;称：<span class="fixed" id="nicknameMess"></span></label><img src="img/reg3.jpg"><input type="text" name="nickname" id="nickname" onblur="validateNickName123()" required  ><br>
				<!--<label>学&emsp;&emsp;号：</label><img src="img/reg1.jpg"><input type="text" name=""><br>-->
				<!--邮箱-->
				<label class="posi">密&emsp;&emsp;码：<span class="fixed" id="passwordMess"></span></label><img src="img/reg2.jpg"><input type="password" name="password" id="password" required><br>
				<label class="posi">确认密码：<span class="fixed" id="repasswordMess"></span></label><img src="img/reg2.jpg"><input type="password" name="repassword" id="repassword" ><br>
				
				<input type="submit" name="submit" class="regsub" value="注册">
				
			 </form>
			</div>		
		</div>
		<center>Copyright &copy; 2018 黄淮学院 版权所有</center>
		
	</body>
</html>

<script src="js/jquery-1.11.1.js" type="text/javascript"></script>

<script type="text/javascript">



$(function(){
	 
    var ok1=false;
    var ok2=false;
    var ok3=false;
    var ok4=false;
// 验证用户名
$('input[name="nickname"]').focus(function(){
	 $("#nicknameMess").html("用户名在3-20个字符之间！");		  
}).blur(function(){
    if($(this).val().length >= 3 && $(this).val().length <=12 && $(this).val()!=''){
    	$("#nicknameMess").html("<img src='img/icon/yes.ico'>");
    	ok1=true;
    }else{
    	$("#nicknameMess").html("<img src='img/icon/error.ico'>"+"用户名在3-20个字符之间！");		  
    }
     
});



//验证密码
$('input[name="password"]').focus(function(){
}).blur(function(){
    if($(this).val().length >= 6 && $(this).val().length <=20 && $(this).val()!=''){
    	 $('#passwordMess').html("<img src='img/icon/yes.ico'>");
    	 ok2=true;
    }else{
    	 $('#passwordMess').html("<img src='img/icon/error.ico'>"+"密码应该为6-20位之间！");
    }     
});

//验证确认密码
    $('input[name="repassword"]').focus(function(){
}).blur(function(){
    if($(this).val().length >= 6 && $(this).val().length <=20 && $(this).val()!='' && $(this).val() == $('input[name="password"]').val()){
    	$('#repasswordMess').html("<img src='img/icon/yes.ico'>");
    	ok3=true;
    }else{
    	 $('#repasswordMess').html("<img src='img/icon/error.ico'>"+"请重新输入！");
    }
     
});


  //提交按钮,所有验证通过方可提交
    
    $('input[name="submit"]').click(function(){
    	//alert($('input[name="email"]').val());
        if(ok1 && ok2 && ok3){        	
            //alert("submit");
        }else{
        	 //alert("false");        	 
            return false;
        }
    });
});
<!--
邮箱验证
//-->
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
