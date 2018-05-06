<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <title>旅游图谱</title>
    <link type="text/css" rel="stylesheet" href="css/travel_atlas.css"/>
    <link type="text/css" rel="stylesheet" href="css/index.css"/>
    <link type="text/css" rel="stylesheet" href="css/zzsc.css"/>
    <link type="text/css" rel="stylesheet" href="css/d3_menu.css"/>
    <link type="text/css" rel="stylesheet" href="css/alert_box.css"/>
    <link type="text/css" rel="stylesheet" href="css/zTreeStyle/zTreeStyle.css"/>
    <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>
    <script type="text/javascript" src="js/jquery-3.1.0.min.js"></script>
    <script type="text/javascript" src="js/nav_slider.js"></script>
    <script type="text/javascript" src="js/d3.js"></script>
    <script type="text/javascript" src="js/d3Events.js"></script>
    <script type="text/javascript" src="js/events.js"></script>
    <script type="text/javascript" src="js/jquery.ztree.core.js"></script>
    <script type="text/javascript" src="js/index.js"></script>
    
</head>
<body>
<nav class="navbar navbar-default" role="navigation">
    <div class="container-fluid">
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
				if(session.getAttribute("username")==null){
					out.print("<li><a href=\"login.jsp\">登录</a></li>");
					out.print("<li>|</li>");
					out.print("<li><a href=\"register.jsp\">注册</a></li>");
				}else{
					out.print("<li><a href=\"./Personal\">"+session.getAttribute("username")+"</a></li>");
				} %>                                                          
            </ul>
        </div>
        </div>
    </div>
</nav>
<div class="container-fluid">
    <div class="row">
        <img src="img/picture/封面.jpg" width="100%" />
    </div>
    <div id="edc">
        <form>
            <span>
                <input type="submit" value="分类" class="def">
            </span>
            <span style="position: relative">
            <span class="ghi"><img src="img/icon/放大镜.png" style="width: 100%;height: 100%"></span>
                <input type="text" class="abc" maxlength="100">
            </span>
        </form>
    </div>
</div>
<div class="container">
    <div class="row clearfix" id="atlas_main">
        <div class="col-md-3 column" >
            <div id="classify">
                <div id="topic1">
                    <p>类名</p>
                </div>
                <div id="content1">
                    <ul id="classes"></ul>
                </div>
            </div>
        </div>
        <div class="col-md-9 column">
            <div id="show">
                <div id="topic2">
                    <input class="ijn" type="button" value="图谱">
                    <input class="ijn" type="button" value="文字">
                </div>
                <div id="content2" class="d3_area"></div>
            </div>
        </div>
    </div>
</div>
<div class="container-fluid" id="Footer">
    北京师范大学珠海分校管理学院 @2016-2018 http://som.bnuz.edu.cn 版权所有
</div>
</html>