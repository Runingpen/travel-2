<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <title>登录</title>
    <style>
        /*背景图片*/
        body{
            background-image: url("img/picture/登录.jpg");
            background-size: 100% 1080px;
        }
    </style>
    <link type="text/css" href="css/index_1366.css" rel="stylesheet"/>
    <link type="text/css" href="css/login.css" rel="stylesheet"/>
    <script language="JavaScript" type="text/JavaScript" src="js/jquery-1.6.1.js"></script>
<script language="JavaScript" type="text/JavaScript" src="js/jquery.validate.min.js"></script>
<script language="JavaScript" type="text/JavaScript" src="js/jquery.metadata.js"></script>
<script language="JavaScript" type="text/JavaScript" src="js/messages_cn.js"></script>
<script>
$().ready(function() {
    $("#Login").validate({
    	rules:{
    		username:{
    			required:true   			
    		},
    		password:{
    			required:true
    		}
    	},messages:{
    		username:{
    			required:" * 请输入用户名!"
    		},
    		password:{
    			required:" * 请输入密码！"
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
<!--登录窗口-->
<div id="login">
    <!--创建两个div，第一个半透明白底，第二个不透明输入框-->
    <!--第一个半透明div-->
    <div id="div1"></div>
    <!--第二个不透明div-->
    <div id="div2">
        <!--把form传入后台-->
        <form action="./CheckServlet" method="post" name="login" id="Login">

            <table align="center" >
                <tr>
                    <td><label>
                         <input type="text" placeholder="账号/用户名/邮箱/手机号" name="username">
                         </label></td>
                </tr>
                <tr>
                    <td><label>
                         <input type="password" placeholder="密码" name="password">
                        </label></td>
                </tr>
                <tr>
                    <td>
                        <p style="font-size: 1px;float: right;padding: 0px;margin: 0px;"><a href="index.jsp" style="text-decoration:none;color: dodgerblue;"> 忘记密码？</a></p>
                    </td>
                 </tr>
                <tr>
                    <td><label>
                        <input style="height: auto;background-color: dodgerblue;color:white;" type="submit" value="登录">
                        </label></td>
                </tr>
                <tr style="font-size: 80%;" >
                    <td style="position: relative;float: left;padding-left: 110px;">还没有账号？</td>
                    <td style="position: relative;float:left;"><a href="register.jsp" style="text-decoration:none;color: dodgerblue;"> 注册账号</a></td>
                </tr>
            </table>
        </form>
    </div>
</div>
</body>
</html>