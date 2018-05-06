<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <title>餐馆信息</title>
    <link type="text/css" rel="stylesheet" href="css/specitic%20restaurant.css"/>
    <link type="text/css" rel="stylesheet" href="css/index.css"/>
    <link type="text/css" rel="stylesheet" href="css/zzsc.css"/>
    <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>
    <script type="text/javascript" src="js/jquery-3.1.0.min.js"></script>
    <script type="text/javascript" src="js/nav_slider.js"></script>
    <script type="text/javascript" src="js/index.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
</head>
<body>
<nav class="navbar navbar-default" role="navigation">
                <div class="container-fluid">
                    <div id="header" >
        <!--<img id="smalllogo" src="img/picture/smalllogo.png" />-->
        <div id="nav">
            <ul>
                <li><a href="index.jsp">首页</a></li>
                <li><a href="travel_atlas.jsp">旅游图谱</a></li>
                <li><a href="xiangshanMap.jsp">香山地图</a></li>
                <li><a href="CustomMap.jsp">路线规划</a></li>
                <li class="cur">
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
<div class="container" id="HIntro">
    <div class="row clearfix">
        <div class="col-md-12 column" id="title" >
            <div class="row clearfix">
                <div class="col-md-12 column" >
                    <h1>餐馆名字</h1>                                      
                </div>
            </div>
            <div class="row clearfix">
                <div class="col-md-12 column">
                    <div class="effect1">
                        <p>地址：${Address}</p>
                        <p>电话：${TelePhone}</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="container" id="map">
    <div class="row clearfix">
        <div class="col-md-7 column" id="picture">
            <img class="effect3" src="${Photo}">
        </div>
        <div class="col-md-5 column">
            <div class="row clearfix">
                <div class="col-md-12 column" id="Smap">
                    <img style="width:100%;height:100%;" src="img/地图.png"/>
                </div>
            </div>
            <div class="row clearfix">
                <div class="col-md-12 column" id="atla">
                    <img style="width:100%;height:100%;" src="img/图谱.png"/>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="container" id="exIntro">
    <div class="row">
        <table class="table table-striped">
            <thead>
            <tr>
                <th>
                    <div class="row clearfix">
                        <div class="col-md-12 column">
                        <p><img src="img/icon/介绍.png" align="center" style="width: 50px;height: 50px;">&nbsp;&nbsp;&nbsp;简介</p>
                    </div>
                        <div class="col-md-12 column" id="textdescri">
                        <p>${Info}</p>
                    </div>
                    </div>
                </th>
            </tr>
            </thead>
            <tbody>
            <tr id="exTime">
                <td>
                    <p>营业时间</p>
                </td>
            </tr>
            <tr id="exTickic">
                <td>
                    <p>消费}</p>
                </td>
            </tr>
            <tr id="exTran">
                <td>
                    <p>推荐菜式</p>
                </td>
            </tr>
            <tr id="exTel">
                <td>
                    <p>交通</p>
                </td>
            </tr>
            </tbody>
        </table>
    </div>
</div>

</body>
</html>