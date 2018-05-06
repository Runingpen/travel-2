<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=0.75, minimum-scale=0.3, maximum-scale=2.0, user-scalable=yes"/>
    <title>香山文化知识图谱</title>
    <link type="text/css" rel="stylesheet" href="css/index.css"/>
    <link type="text/css" rel="stylesheet" href="css/zzsc.css"/>
    <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>
    <script type="text/javascript" src="js/jquery-3.1.0.min.js"></script>
    <script type="text/javascript" src="js/nav_slider.js"></script>
    <script type="text/javascript" src="js/index.js"></script>
    <script type="text/javascript" src="js/picturing.js"></script>
</head>
<body>
<div>
    <img id="firstpicture" src="img/picture/主页飞艇.jpg" width="1340px" height="650px">
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
        <!--飞艇左部分-->
    </div>
    <div id="airshipleft">
        <ul>
            <li><a id="word">香山文化旅游</a></li>
            <li><a id="word">旅游路上，文化探索</a></li>
            <li ><button id="button" type="button"  onmouseover="button()" onmouseout="button2()" onclick="window.location.href='recommend.jsp'">开始探索</button></li>
        </ul>
    </div>
    <!--图片区域-->
    <div id="under">
        <div id="left">
            <a ><img  id="picture" src="img/picture/珠海.jpg" ></a>
            <p id="underwordzhuhai">珠海</p>
                <ul id="underwordzhuhai2">
                <li>珠海是全国唯一以整体城市景观入选</li>
                <li>“全国旅游胜地四十佳”的城市，中国海滨城市。</li>
            </ul>
            <a onmouseover="zhuhaievent()"  onmouseout="zhuhaievent2()" id="zhuhaiblackbox" href="./ShowZhuHai"></a>
        </div>
        <div id="right">
            <div>
                <a ><img id="picture1" src="img/picture/未定名1.jpg"></a>
                <p id="underwordzhongshan">中山</p>
                <ul id="underwordzhongshan2">
                    <li>中山是国家历史文化名城</li>
                    <li>发祥于中山的香山文化是中国近代文化的重要源头</li>
                    <li>享有广东省曲艺之乡（粤剧）、华侨之乡的美誉。</li>
                </ul>
                <a id="zhongshanblackbox" href="#" onmouseover="zhongshanevent()" onmouseout="zhongshanevent2()"></a>
            </div>
            <div>
                <a ><img id="picture2" src="img/picture/未定名3.jpg"></a>
                <ul id="underwordaomen2">
                    <li>澳门是一个国际自由港</li>
                    <li>是世界人口密度最高的地区之一，也是世界四大赌城之一</li>
                    <li>其著名的轻工业、旅游业、酒店业和娱乐场使澳门长盛不衰，成为全球最发达、富裕的地区之一。</li>
                </ul>
                <p id="underwordaomen">澳门</p>
                <a  id="aomenblackbox" onmouseover="aomenevent()" onmouseout="aomenevent2()" href=""></a>
            </div>
        </div>
    </div>
    <!--</div>-->
    <div id="Footer">
        北京师范大学珠海分校管理学院 @2016-2018 http://som.bnuz.edu.cn 版权所有
    </div>
</div>

<!--</div>-->
</body>
</html>