<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改密码</title>
<link rel="stylesheet" href="css/password_revise.css" type="text/css"/>
</head>
<body>
<div><a id="password_revise">修改密码</a></div>
<div>     
<table> <!--密码修改表-->
<tr>
<th>用户名：12345</th>
</tr>
<tr>
<th>输入原始密码：</th>
<th><input type="password" name="password" ></th>
</tr>
<tr>
<th>输入新密码：</th>
<th><input type="password" name="password" ></th>
</tr>
<tr>
<th>确认新密码：</th>
<th><input type="password" name="password" ></th>
</tr>                    
</table>
</div>
<div>
<button id="password_button" onclick="window.location.href='password_success.jsp'">确认</button>



</div>
</body>
</html>