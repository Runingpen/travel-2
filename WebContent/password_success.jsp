<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册成功</title>

</head>
<body>
<script type="text/javascript">        //倒计时跳转
var t=5;//设定跳转的时间 
setInterval("refer()",1000);
function refer(){  
    if(t==0){ 
        location="personal.jsp"; //#设定跳转的链接地址 
    } 
    document.getElementById('show').innerHTML=""+t+"秒后跳转到登陆界面"; // 显示倒计时 
    t--; // 计数器递减 
} 
</script>
<div style="width:700px;border-radius:25px;border:1px solid #00BFFF">
<div>
<img style="position: relative;width: 150px;height: 150px;top:15px;left:75px;" url="">
</div>
<div >
<a style="position:relative;top:-100px;left:300px;color:yellow;font-size:40px;font-weght:blod">修改密码成功</a>
<span id="show" style="position:relative;left:100px;top:-50px"></span>
</div>
</div>
</body>
</html>