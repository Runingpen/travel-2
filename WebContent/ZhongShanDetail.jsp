<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
     <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>景点列表</title>
    <link type="text/css" rel="stylesheet" href="css/index.css"/>
    <link type="text/css" rel="stylesheet" href="css/zzsc.css"/>
    <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>
    <link type="text/css" rel="stylesheet" href="css/recommentIntor.css"/>
    <script type="text/javascript" src="js/jquery-3.1.0.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/nav_slider.js"></script>
    <script type="text/javascript" src="js/index.js"></script>
</head>
<body>
<!--首页导航栏-->
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
<!--分隔线-->
<div style="position: relative;top: 52px;">
    <img src="img/icon/分隔栏.png" style="width: 100%"/>
</div>
<!--子目录导航栏-->
<div id="catalog">
    <ul id="ntr">
        <li>
            <img src="img/icon/景点.png" style=" width: 50px;height: 50px;">
        </li>
        <li><a href="#">区域分类&nbsp;&nbsp;&nbsp;&or;</a>
            <ul class="qs">
                <li><a href="#">目录1</a></li>
                <li><a href="#">目录2</a></li>
            </ul>
        </li>
        <li><a href="#">景点分类&nbsp;&nbsp;&nbsp;&or;</a>
            <ul class="qs">
                <li><a href="#">分类1</a></li>
                <li><a href="#">分类2</a></li>
            </ul>
        </li>
    </ul>
</div>
<!--子目录导航栏下拉功能-->
<script type="text/javascript">
    //下拉函数
    $(function(){
        var _this1=null;
        $('#ntr>li').hover(function(){
                _this1=$(this);
                _this1.find('.qs').show();},
            //隐藏函数
            function(){
                _this1.find('.qs').hide();
            });
    });
</script>
<!--小向导-->
<div id="Sdirection" class="">
    <p>区域分类----</p>
</div>
<!--景点列表-->
<div id="scenicIntro" class="">
    <div id="picture" class="">
        <img src="${ZhongShanPhoto.get(0)}">
    </div>
    <div id="name" class="">
        <h1><a href="./jump?flag=${ZhongShanTitle.get(0)}">${ZhongShanTitle.get(0)}</a></h1>
        <img src="img/icon/星(1).png">
    </div>
    <div id="content" class="">
        <p>${ZhongShanInfo.get(0)}</p>
		

    </div>
    <div>
    
    <p>${ZhongShanAddress.get(0)}</p>
    </div>
    <div id="picture" class="">
        <img src="${ZhongShanPhoto.get(1)}">
    </div>
    <div id="name" class="">
        <h1><a href="./jump?flag=${ZhongShanTitle.get(1)}">${ZhongShanTitle.get(1)}</a></h1>
        <img src="img/icon/星(1).png">
    </div>
    <div id="content" class="">
        <p>${ZhongShanInfo.get(1)}</p>
		

    </div>
    <div>
    
    <p>${ZhongShanAddress.get(1)}</p>
    </div>
    <div id="picture" class="">
        <img src="${ZhongShanPhoto.get(2)}">
    </div>
    <div id="name" class="">
        <h1><a href="./jump?flag=${ZhongShanTitle.get(2)}">${ZhongShanTitle.get(2)}</a></h1>
        <img src="img/icon/星(1).png">
    </div>
    <div id="content" class="">
        <p>${ZhongShanInfo.get(2)}</p>
		

    </div>
    <div>
    
    <p>${ZhongShanAddress.get(2)}</p>
    </div>
    <div class="line"></div>
</div>
</body>
</html>