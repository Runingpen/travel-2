<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <title>美食列表</title>
    <link type="text/css" rel="stylesheet" href="css/index.css"/>
    <link type="text/css" rel="stylesheet" href="css/zzsc.css"/>
    <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>
    <link type="text/css" rel="stylesheet" href="css/RestaurantDetial.css"/>
    <script type="text/javascript" src="js/jquery-3.1.0.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/nav_slider.js"></script>
    <script type="text/javascript" src="js/index.js"></script>
</head>
<body>
<!--首页导航栏-->

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
                                            <li>
                                                <a href="./ShowZhuHai">珠海</a>
                                            </li>
                                            <br>
                                            <li>
                                                <a href="./ShowZhongShan">中山</a>
                                            </li>
                                            <br>
                                            <li>
                                                <a href="./ShowAoMen">澳门</a>
                                            </li>
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
<!--菜式图片-->
<div class="container-fluid">
    <div class="row clearfix">
	
    </div>
</div>

<!--子目录导航栏-->
<div id="catalog">
    <ul id="ntr">
        <li>
            <img src="img/icon/美食.png" style=" width: 50px;height: 50px;">
        </li>
        <li><a href="#">区域热度&nbsp;&nbsp;&nbsp;&or;</a>
            <ul class="qs">
                <li><a href="#">目录1</a></li>
                <li><a href="#">目录2</a></li>
            </ul>
        </li>
        <li><a href="#">分类&nbsp;&nbsp;&nbsp;&or;</a>
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
<div id="Sdirection">
    <p>区域分类----   后面加内容啊   </p>
</div>
<!--餐馆列表-->

<!--后面直接改餐馆的就可以了,最底下的class="line"是隔开每个介绍模块的界限，尝试把下面的模块-->
<!--以restaurantIntro为一个模块显示内容，每多一个内容，多一个模块-->

<div class="container-fluid" id="restaurantIntro">
    <div class="row clearfix">
        <div class="col-md-4 column">
            <div class="row clearfix" id="picture">
                 <img src="${ZhuHaiPhoto.get(0) }">
            </div>
        </div>
        <div class="col-md-8 column">
            <div class="row clearfix">
                <div class="col-md-12 column" id="name">
                    <h2><a href="./jump?flag=${ZhuHaiTitle.get(0)}">${ZhuHaiTitle.get(0)}</a></h2>
                    <img src="img/icon/星(1).png"/>
                    <img src="img/icon/星(1).png"/>
                </div>
            </div>
            <div class="row clearfix">
                <div class="col-md-12 column" id="content">
                    <p>${ZhuHaiInfo.get(0)}</p>
                </div>
            </div>

        </div>
        <div class="line">
        <p>${ZhuHaiAddress.get(0)}</p>
        </div>
    </div>
</div>


<div class="container" id="restaurantIntro">
    <div class="row clearfix">
	<div class="col=md-4 column">
    	    <div id="picture">
        	<img src="${ZhuHaiPhoto.get(0) }">
    	    </div>
    	    <div id="name" class="">
        	<h1><a href="./jump?flag=${ZhuHaiTitle.get(0)}">${ZhuHaiTitle.get(0)}</a></h1>
        	<img src="img/icon/星(1).png">
    	    </div>
    	    <div id="content" class="">
        	<p>${ZhuHaiInfo.get(0)}</p>
    	    </div>
    	    <div>    
    		<p>${ZhuHaiAddress.get(0)}</p>
    	    </div>
    	    <div id="picture" class="">
        	<img src="${ZhuHaiPhoto.get(1) }">
    	    </div>
    	    <div id="name" class="">
        	<h1><a href="./jump?flag=${ZhuHaiTitle.get(1)}">${ZhuHaiTitle.get(1)}</a></h1>
        	<img src="img/icon/星(1).png">
    	    </div>
    	    <div id="content" class="">
        	<p>${ZhuHaiInfo.get(1)}</p>
    	    </div>
    	    <div> 
    		<p>${ZhuHaiAddress.get(1)}</p>
    	    </div>
    	    <div id="picture" class="">
        	<img src="${ZhuHaiPhoto.get(2) }">
    	    </div>
    	    <div id="name" class="">
        	<h1><a href="./jump?flag=${ZhuHaiTitle.get(2)}">${ZhuHaiTitle.get(2)}</a></h1>
        	<img src="img/icon/星(1).png">
    	    </div>
    	    <div id="content" class="">
        	<p>${ZhuHaiInfo.get(2)}</p>
    	    </div>
    	    <div>  
    		<p>${ZhuHaiAddress.get(2)}</p>
    	    </div>
    	    <div class="line"></div>
	</div>
    </div>
</div>

<!--添加一定数量的div-->
<script type="text/javascript">     
var txt1="<div>123456 </div>"
+ " <div id='picture'> <img src='${ZhuHaiPhoto.get(0) }'> </div>"
+"<div> <img src='img/icon/星(1).png'/></div>"

for (var i=0; i<5; i+=1){
	  $("body").append(txt1)
	}

</script>
<!--添加一定数量的div-->

</body>
</html>