<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <title>注册</title>
    <style>
        /*背景图片*/
        body{
            background-image: url("img/picture/注册.jpg");
            background-size: 1920px 1080px;
        }
    </style>
    <link type="text/css" href="css/index_1366.css" rel="stylesheet"/>
    <link type="text/css" href="css/register.css" rel="stylesheet"/>
    <link href="css/zzsc.css" type="text/css" rel="stylesheet"/>
    <script type="text/javascript" src="js/jquery-3.1.0.min.js"></script>
    <script type="text/javascript" src="js/nav_slider.js"></script>  
    <script language="JavaScript" type="text/JavaScript" src="js/jquery-1.6.1.js"></script>
<script language="JavaScript" type="text/JavaScript" src="js/jquery.validate.min.js"></script>
<script language="JavaScript" type="text/JavaScript" src="js/jquery.metadata.js"></script>
<script language="JavaScript" type="text/JavaScript" src="js/messages_cn.js"></script>
<script>
//设定不同输入框的要求
$().ready(function() {
    $("#login").validate({
    	rules:{
    		username:{
    			required:true,
    			//用户名查重，提交给指定servlet处理
    			remote:{
    				type:"POST",
    	               url:"./CheckName",             
    	               dataType: "json",
    	               data:{
    	                 username:function(){return $("#username").val();}
    	               } 
    			}
    		},
    		email:{
    			required:true,
    			email:true
    		},
    		phone:{
    			required:true,
    			minlength:11
    		},
    		password:{
    			required:true,
    			minlength:6
    		},
    		repeatpassword:{
    			equalTo:"#password"
    			
    		}
    	},
    	//设定不同输入框要求的提示内容
    	messages:{
    		username:{
    			required:" * 用户名不能为空！",
    			remote: " * 用户名已存在！"
    		},
    		email:{
    			required:" * 邮箱地址不能为空！"
    		},
    		phone:{
    			required:" * 手机号码不能为空！",
    			minlength: $.format(" * 手机号长度不得小于11位！")
    		},
    		password:{
    			required:" * 用户密码不能为空！",
    			minlength: $.format(" * 密码长度不得小于6位！")
    		},
    		repeatpassword:{
    			equalTo:" * 两次密码输入不一致！"
    		}
    	}
    	
    	
    });
});

</script>
<style>
.error{
	color:red;
}
</style> 
</head>
<body>
<!--注册窗口-->
<div id="register">
    <!--创建两个div，第一个半透明白底，第二个不透明输入框-->
    <!--第一个半透明div-->
    <div id="div3"></div>
    <!--第二个不透明div-->
    <div id="div4">
        <!--把form传入后台-->
        <form  action="./RegServlet" method="post" name="login" id="login">

            <table align="center" >
                <tr>
                    <td>
                        <input type="text" id="username" name="username" placeholder="用户名" >
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="email" name="email" placeholder="邮箱">
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="tel" name="phone" placeholder="手机号">
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="password" id="password" name="password" placeholder="密码">
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="password" name="repeatpassword" placeholder="确认密码">
                    </td>
                </tr>
                <tr>
                    <td><span id="save_info"></span></td>
                </tr>
                <tr>
                    <td>
                        <input style="height: auto;background-color: dodgerblue;color: white;" name="form_save" type="submit"
                               onclick="return saveform(this.form)" value="立即注册">
                    </td>
                </tr>
                <tr style="font-size: 80%;" >
                    <td style="position: relative;float: left;padding-left: 110px;">已有账号？</td>
                    <td style="position: relative;float:left;color:dodgerblue; "> <a href="login.jsp" style="text-decoration:none;color: dodgerblue;"> 立即登录</a></td>
                </tr>
            </table>
        </form>
    </div>
</div>
<!--注册信息验证功能-->

</body>
</html>