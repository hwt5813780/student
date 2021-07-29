<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="shortcut icon" href="favicon.ico"/>
<link rel="bookmark" href="favicon.ico"/>
<link href="h-ui/css/H-ui.min.css" rel="stylesheet" type="text/css" />
<link href="h-ui/css/H-ui.login.css" rel="stylesheet" type="text/css" />
<link href="h-ui/lib/icheck/icheck.css" rel="stylesheet" type="text/css" />
<link href="h-ui/lib/Hui-iconfont/1.0.1/iconfont.css" rel="stylesheet" type="text/css" />

<link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">

<script type="text/javascript" src="easyui/jquery.min.js"></script> 
<script type="text/javascript" src="h-ui/js/H-ui.js"></script> 
<script type="text/javascript" src="h-ui/lib/icheck/jquery.icheck.min.js"></script> 

<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>

<script type="text/javascript">
	$(function(){
		//点击图片切换验证码
		$("#vcodeImg").click(function(){
			this.src="CpachaServlet?method=loginCapcha&t="+new Date().getTime();
		});
		
		//登录
		$("#submitBtn").click(function(){
			var data = $("#form").serialize();
			$.ajax({
				type: "post",
				url: "LoginServlet?method=Login",
				data: data, 
				dataType: "text", //返回数据类型
				success: function(msg){
					if("vcodeError" == msg){
						$.messager.alert("Warning", "Verification code error!", "warning");
						$("#vcodeImg").click();//切换验证码
						$("input[name='vcode']").val("");//清空验证码输入框
					} else if("loginError" == msg){
						$.messager.alert("Warning", "Username or Password error!", "warning");
						$("#vcodeImg").click();//切换验证码
						$("input[name='vcode']").val("");//清空验证码输入框
					} else if("loginSuccess" == msg){
						window.location.href = "SystemServlet?method=toAdminView";
					} else{
						alert(msg);
					} 
				}
				
			});
		});
		
		//设置复选框
		$(".skin-minimal input").iCheck({
			radioClass: 'iradio-blue',
			increaseArea: '25%'
		});
	})
</script> 
<title>登录|学生信息管理系统</title>
<meta name="keywords" content="学生信息管理系统">
</head>
<body>
<div class="loginWraper">
  <div id="loginform" class="loginBox">
    <form id="form" class="form form-horizontal" method="post">
      <div class="row cl">
        <div class="formControls col-8">
          <h3 style="font-weight: bold;margin-left: 25px;width:300px;">Used Car Warehouse</h3>
        </div>
      </div>
      <div class="row cl">
        <div class="formControls col-8">
          <input class="input-text size-L" id="" name="account" type="text" placeholder="User Name" >
        </div>
      </div>
      <div class="row cl">
        <div class="formControls col-8">
          <input class="input-text size-L" id="" name="password" type="password" placeholder="Password">
        </div>
      </div>
      <div class="row cl">
            <div class="formControls col-8 col-offset-3" >
                <input class="input-text size-L" name="vcode" type="text" placeholder="Captcha" style="right:87px;width: 150px;">
            	<img class="capcha" title="点击图片切换验证码" id="vcodeImg" src="CpachaServlet?method=loginCapcha" >
            </div>
      </div>
      <div class="mt-20 skin-minimal" style="text-align: center;position:relative;bottom:30px">
		<div class="radio-box">
			<input type="radio" id="radio-2" name="type" checked value="2" />
			<label for="radio-1">Student</label>
		</div>
		<div class="radio-box">
			<input type="radio" id="radio-3" name="type" value="3" />
			<label for="radio-2">Teacher</label>
		</div>
		<div class="radio-box">
			<input type="radio" id="radio-1" name="type" value="1" />
			<label for="radio-3">Administer</label>
		</div>
	</div>
      
      <div class="row" style="position:relative;bottom:20px;right:63px">
        <div class="formControls col-8 col-offset-3">
          <input id="submitBtn" type="button" class="btn btn-success radius size-L" value="&nbsp;&nbsp;Sign in&nbsp;&nbsp;" style="width: 300px;">
        </div>
      </div>
    </form>
  </div>
</div>


</body>
</html>