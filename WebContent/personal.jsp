<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=0.75, minimum-scale=0.3, maximum-scale=2.0, user-scalable=yes"/>
    <title>个人首页</title>
    <link rel="stylesheet" href="css/index.css"  type="text/css"/>
    <link rel="stylesheet" href="css/presonal.css" type="text/css"/>
    <link href="css/zzsc.css" type="text/css" rel="stylesheet"/>
    <script type="text/javascript" src="js/jquery-3.1.0.min.js"></script>
    <script type="text/javascript" src="js/nav_slider.js"></script>
        <script type="text/javascript" src="js/index.js"></script>
        <script type="text/javascript" src="js/picturing.js"></script>
</head>
<body>
<!--个人信息页导航栏-->
 <div id="header" >
        <!--<img id="smalllogo" src="img/picture/smalllogo.png" />-->
        <div id="nav">
            <ul>
                <li class="cur"><a href="index.jsp">首页</a></li>
                <li><a href="travel_atlas.jsp">旅游图谱</a></li>
                <li><a href="xiangshanMap.jsp">香山地图</a></li>
                <li><a href="CustomMap.jsp">路线规划</a></li>
                <li >
                    <ul >
                        <li class="dropdown" >
                            <a href="./ShowAll" class="dropdown-toggle" data-toggle="dropdown" onmouseover="recommend()" >景点<strong class="caret"></strong> </a>
                            <ul id="littlerecommend" >
                                <li2 >
                                    <a href="./ShowZhuHai">珠海</a>
                                </li2>
                                <br>
                                <li2>
                                    <a href="./ShowZhongShan">中山</a>
                                </li2>
                                <br>
                                <li2>
                                    <a href="./ShowAoMen">澳门</a>
                                </li2>
                            </ul>
                        </li>
                    </ul>
                </li>
                <li><a href="./RedirectProcess.do?pageName=timeSpaceSearch">旅游集市</a></li>
                <li><a href="./RedirectProcess.do?pageName=nearSearch">游记</a></li>
                <!--搜索框-->
                <li><input id="input"  type="text" onfocus="searchbar()"  onblur="searchbar2()"></li>
                <!--搜索框-->
            </ul>
            <div class="curBg"></div>
            <div class="cls"></div>
        </div>
        <div id="opk">
            <ul>                     				
                  <%	
					out.print("<li><a href=\"./Logout\">注销</a></li>");
				 %>                                         
            </ul>
        </div>
        </div>
<!--大头像-->
<div id="personal">
    <img src="img/icon/用户.png"/>
    <div>
        <p>${nickname }&nbsp;<img src="img/icon/男.png" width="25" height="25"/></p>
    </div>
    <div>
        <p>用户名</p>
    </div>
    <div>
    <button id="personal_button" onclick="window.location.href='password_revise.jsp'">修改密码</button>
    </div>
</div>
<!--个人信息表-->
<div id="personal2">
    <form action="./Change" method="post" name="form1">
        <table id="adc"  align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td ><img src="img/icon/用户名.png" width="45" height="45"></td>
                <td >用户名</td>
                <td width="500"><label>
                    <input type="text" name="username" value=${username } >
                </label></td>
            </tr>
            <tr>
                <td><img src="img/icon/昵称.jpg" width="45" height="45"></td>
                <td>昵称</td>
                <td width="500"><label>
                    <input type="text" name="nickname" value=${nickname }>
                </label></td>
            </tr>
            <tr>
                <td><img src="img/icon/性别.png" width="40" height="40"></td>
                <td>性别</td>
                <td width="500"><label>
                    <input style="width: 50px" type="radio" name="sex" checked>男
                    <font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font>
                    <input style="width: 50px" type="radio" name="sex" checked>女
                </label></td>
            </tr>
            <tr>
                <td><img src="img/icon/邮箱.png" width="45" height="45"></td>
                <td>邮箱</td>
                <td width="500"><label>
                    <input type="email" name="email" value=${email }>
                </label></td>
            </tr>
            <tr>
                <td><img src="img/icon/生日.jpg" width="40" height="40"></td>
                <td>出生日期</td>
                <td width="500"><label>
                    <input type="text" name="birth" value=${birth }>
                </label></td>
            </tr>
            <tr>
                <td><img src="img/icon/手机.png" width="40" height="40"></td>
                <td>手机号</td>
                <td width="500"><label>
                    <input type="tel" name="phone" value=${phone }>
                </label></td>
            </tr>
            <tr>
                <td><img src="img/icon/家.png" width="40" height="40"></td>
                <td>地址</td>
                <td width="500"><label>
                    <input type="text" name="address" value=${address }>
                </label></td>
            </tr>
            <tr>
                <td><img src="img/icon/简介.png" width="40" height="40"></td>
                <td>简介</td>
                <td width="500"><label>
                    <input style="height: 150px" type="text" name="personal" value=${personal }>
                </label></td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td width="500"><label>
                    <input   type="submit" value="保存">
                </label></td>
        </table>
    </form>
</div>
</body>
</html>