<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=0.75, minimum-scale=0.3, maximum-scale=2.0, user-scalable=yes"/>
    <title>珠海景点介绍</title>
    <link rel="stylesheet" href="css/index.css"  type="text/css"/>
    <link rel="stylesheet" href="css/zhuhai%20recommend.css" type="text/css"/>
    <link href="css/zzsc.css" type="text/css" rel="stylesheet"/>
    <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>
    <script type="text/javascript" src="js/jquery-3.1.0.min.js"></script>
    <script type="text/javascript" src="js/nav_slider.js"></script>
    <script src="js/jssor.slider-25.1.0.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="js/picturing.js"></script>
    <script type="text/javascript" src="js/index.js"></script>
</head>
<body style="background-color:#fff;">
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
<!--分类栏-->
<div id="zhuhaivariety">
    <div><a id="zhuhaivarietyhead">中山</a></div>
    <div >
        <ul >
            <li><img src="img/icon/景点.png" style="height: 60px;width: 60px"><a id="zhuhaivarietya">景点</a></li>
            <li><img src="img/icon/酒店.png" style="height: 60px;width: 60px"><a id="zhuhaivarietya">酒店</a></li>
            <li><img src="img/icon/美食.png" style="height: 60px;width: 60px"><a id="zhuhaivarietya">美食</a></li>
            <li><img src="img/icon/娱乐.png" style="height: 60px;width: 60px"><a id="zhuhaivarietya">娱乐</a></li>
            <li><img src="img/icon/游记d.png" style="height: 60px;width: 60px"><a id="zhuhaivarietya">游记</a></li>
            <li><img src="img/icon/旅游%20(1).png" style="height: 60px;width: 60px"><a id="zhuhaivarietya">旅游产品</a></li>
        </ul>
    </div>
</div>
<!--分类栏-->
<!--图片轮播栏-->
<div style="padding:0px 0px; margin:0px;background-color:#fff; font-family:'Open Sans',sans-serif,arial,helvetica,verdana" >

    <div id="jssor_1" style="position:relative;margin:0 auto;top:140px;left:0px;width:980px;height:380px;overflow:hidden;visibility:hidden;">
        <!-- Loading Screen -->
        <div data-u="loading" class="jssorl-004-double-tail-spin" style="position:absolute;top:0px;left:0px;text-align:center;background-color:rgba(0,0,0,0.7);">
            <img style="margin-top:-19px;position:relative;top:50%;width:38px;height:38px;" src="img/picture/double-tail-spin.svg" />
        </div>
        <div data-u="slides" style="cursor:default;position:relative;top:0px;left:0px;width:980px;height:380px;overflow:hidden;">
            <div>
                <img data-u="image" src="img/picture/013.jpg" />
            </div>
            <div>
                <img data-u="image" src="img/picture/014.jpg" />
            </div>
            <div>
                <img data-u="image" src="img/picture/015.jpg" />
            </div>
            <div>
                <img data-u="image" src="img/picture/017.jpg" />
            </div>
            <div>
                <img data-u="image" src="img/picture/019.jpg" />
            </div>
            <div>
                <img data-u="image" src="img/picture/020.jpg" />
            </div>
            <div>
                <img data-u="image" src="img/picture/021.jpg" />
            </div>
            <div>
                <img data-u="image" src="img/picture/022.jpg" />
            </div>
            <div>
                <img data-u="image" src="img/picture/025.jpg" />
            </div>
            <div>
                <img data-u="image" src="img/picture/018.jpg" />
            </div>
            <div>
                <img data-u="image" src="img/picture/026.jpg" />
            </div>
            <div>
                <img data-u="image" src="img/picture/027.jpg" />
            </div>
        </div>
        <!-- Bullet Navigator -->
        <div data-u="navigator" class="jssorb052" style="position:absolute;bottom:12px;right:12px;" data-autocenter="1" data-scale="0.5" data-scale-bottom="0.75">
            <div data-u="prototype" class="i" style="width:16px;height:16px;">
                <svg viewbox="0 0 16000 16000" style="position:absolute;top:0;left:0;width:100%;height:100%;">
                    <circle class="b" cx="8000" cy="8000" r="5800"></circle>
                </svg>
            </div>
        </div>
        <!-- Arrow Navigator -->
        <div data-u="arrowleft" class="jssora053" style="width:55px;height:55px;top:0px;left:25px;" data-autocenter="2" data-scale="0.75" data-scale-left="0.75">
            <svg viewbox="0 0 16000 16000" style="position:absolute;top:0;left:0;width:100%;height:100%;">
                <polyline class="a" points="11040,1920 4960,8000 11040,14080 "></polyline>
            </svg>
        </div>
        <div data-u="arrowright" class="jssora053" style="width:55px;height:55px;top:0px;right:25px;" data-autocenter="2" data-scale="0.75" data-scale-right="0.75">
            <svg viewbox="0 0 16000 16000" style="position:absolute;top:0;left:0;width:100%;height:100%;">
                <polyline class="a" points="4960,1920 11040,8000 4960,14080 "></polyline>
            </svg>
        </div>
    </div>
</div>
<!--分隔线-->
<!--<div style="position: relative;top: 180px;">-->
    <!--<img src="img/icon/分隔栏.png" style="width: 100%"/>-->
<!--</div>-->
<!--&lt;!&ndash;猜你喜欢栏目&ndash;&gt;-->
<!--<div id="like">-->
<!--<div><img src="img/icon/猜你喜欢.png" style=" width: 50px;height: 50px;">猜你喜欢</div>-->
<!--<div>-->
<!--<ul>-->
            <!--<li><img src="${ZhongShanPhoto.get(0)}"><a href="./jump?flag=${ZhongShanTitle.get(0)}">${ZhongShanTitle.get(0)}</a></li>-->
            <!--<li><img src="${ZhongShanPhoto.get(4)}"><a href="./jump?flag=${ZhongShanTitle.get(4)}">${ZhongShanTitle.get(4)}</a></li>-->
            <!--<li><img src="${ZhongShanPhoto.get(3)}"><a href="./jump?flag=${ZhongShanTitle.get(3)}">${ZhongShanTitle.get(3)}</a></li>-->
<!--</ul>-->
<!--</div>-->
<!--<div><a href="#">更多</a></div>-->

<!--</div>-->
<!--热门景点栏目-->
<div class="container-fluid" id="like">
    <div><img src="img/icon/热门.png" style=" width: 50px;height: 50px;">热门景点</div>
   
 <div class="row clearfix">
        <div class="col-md-4 column">
            <img src="${ZhongShanPhoto.get(0) }" class="img-rounded"/>
            <span class="suibian"><a href="./jump?flag=${ZhongShanTitle.get(0)}">${ZhongShanTitle.get(0)}</a></span>
        </div>
        <div class="col-md-4 column">
            <img src="${ZhongShanPhoto.get(1) }" class="img-rounded"/>
            <span class="suibian"><a href="./jump?flag=${ZhongShanTitle.get(1)}">${ZhongShanTitle.get(1)}</a></span>
        </div>
        <div class="col-md-4 column">
            <img src="${ZhongShanPhoto.get(2) }" class="img-rounded"/>
            <span class="suibian"><a href="./jump?flag=${ZhongShanTitle.get(2)}">${ZhongShanTitle.get(2)}</a></span>
        </div>
          <div class="col-md-4 column">
            <img src="${ZhongShanPhoto.get(3) }" class="img-rounded"/>
            <span class="suibian"><a href="./jump?flag=${ZhongShanTitle.get(3)}">${ZhongShanTitle.get(3)}</a></span>
        </div>
        <div class="col-md-4 column">
            <img src="${ZhongShanPhoto.get(4) }" class="img-rounded"/>
            <span class="suibian"><a href="./jump?flag=${ZhongShanTitle.get(4)}">${ZhongShanTitle.get(4)}</a></span>
        </div>
        <div class="col-md-4 column">
            <img src="${ZhongShanPhoto.get(5) }" class="img-rounded"/>
            <span class="suibian"><a href="./jump?flag=${ZhongShanTitle.get(5)}">${ZhongShanTitle.get(5)}</a></span>
        </div>
          </div>
    
  
     <li><a id="more" href="./ShowZhongShanDetail">更多</a></li>
</div>
<!--当地美食栏目-->
<div id="deliciousfood">
    <div><img src="img/icon/美食.png" style=" width: 50px;height: 50px;">当地美食</div>
    <div>
        <ul>
            <li><img src="img/picture/赛车场.jpg"></li>
            <li><img src="img/picture/赛车场.jpg"></li>
            <li><img src="img/picture/赛车场.jpg"></li>
        </ul>
    </div>
    <div><a id="more" href="#">换一批</a></div>
</div>
<!--当地美食栏目-->

<!--旅游产品栏目-->
<div id="deliciousfood">
    <div>
        <img src="img/icon/旅游%20(1).png" style=" width: 50px;height: 50px;">旅游产品
        <ul id="product">
            <li>门票</li>
            <li>跟团游</li>
            <li>自由行</li>
            <li>半自由行</li>
        </ul>
    </div>
    <div>
        <ul>
            <li><img src="img/picture/赛车场.jpg"></li>
            <li><img src="img/picture/赛车场.jpg"></li>
            <li><img src="img/picture/赛车场.jpg"></li>
        </ul>
    </div>
    <div><a id="more" href="#">换一批</a></div>
</div>

<!--旅游产品栏目-->
<!--热门游记-->
<div id="deliciousfood">
    <div><img src="img/icon/游记d.png" style=" width: 50px;height: 50px;">热门游记</div>
    <div>

    </div>
</div>


<!--热门游记-->

<!--脚注-->
<div id="zhuhaiFooter">
    北京师范大学珠海分校管理学院 @2016-2018 http://som.bnuz.edu.cn 版权所有
</div>
</body>
</html>