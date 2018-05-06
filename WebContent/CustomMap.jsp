<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no, width=device-width">
    <script type="text/javascript" src="lib/jquery-3.2.1.min.js"></script>
    <title>地图测试</title>
    <link rel="stylesheet" href="http://cache.amap.com/lbs/static/AMap.PlaceSearchRender1120.css"/>
    <style>
        * {
            margin: 0;
            padding: 0;
        }
        body {

        }
        #panel{
            position: absolute;
        }
        #content {
            width: 100%;
            height: 1000px;
            text-align: center;
        }

        #left-block {
            width: 20%;
            height: 1000px;
            margin: 0;
            float: left;
            background: cornflowerblue;
        }

        #map {
            width: 80%;
            margin: 0;
            z-index: 0;
            float: left;
        }

        #container {
            width: 100%;
            height: 1000px;
            border: 1px solid silver;
        }

        #confrim_sight {
            display: none;
            width: 220px;
            height: 100px;
            margin: 0 auto;
            background: #fdfffb;
            z-index: 999;
            position: relative;
            bottom: 800px;
            padding: 20px;
            border: 1px solid silver;
        }

        .confrim_btn {
            margin-top: 20px;
            width: 60px;
            height: 20px;
            background: #ff8b86;
            color: #fdfffb;
            border: 0;
            cursor: pointer;
            outline: none;
        }

        #customroute {
            width: 80%;
            height: 400px;
            margin: 0 auto;
            padding-top: 30px;
            text-align: left;
        }

        #customroute label {
            color: white;
            width: 25px;
            margin-left: 5px;
        }

        .ip{
            clear: both;
            width: 90%;
            margin: 20px auto;
        }

        .place {
            float: left;
            width: 75%;
            height: 30px;
            padding-left: 10px;
            margin: 0;
            border: 0;
        }

        .hotshow {
            float: left;
            width: 20px;
            line-height: 30px;
            margin-left: 5px;
            padding-top: 5px;
            cursor: pointer;
        }

        #addsight {
            width: 70px;
            height: 25px;
            margin-left: 5px;
            background-color: white;
            border: 0;
            cursor: pointer;
        }

        #custom-btn {
            width: 120px;
            height: 30px;
            margin-left: 5px;
            margin-top: 20px;
            background-color: #ff8b86;
            color: white;
            border: 0;
            border-radius: 5px;
            cursor: pointer;
        }
        #route{
            width: 400px;
            max-height: 800px;
            position: absolute;
            right:30px;
            top: 50px;
            z-index: 999;
            overflow :auto;
        }
        #route button{
            width: 100px;
            display: none;
        }
        #selectmethod{
            display: none;
            width: 190px;
            height:30px;
            background-color: #fdfffb;
            border: 1px solid silver;
            padding-top: 5px;
            text-align: center;
            position: absolute;
            left: 30%;
            top:5%;
            z-index: 999;
        }
        #selectmethod li{
            display: inline-block;
            list-style: none;
        }
        #selectmethod a{
            color: #000000;
            text-decoration: none;
            cursor: pointer;
        }
        .hotsight{
            display: none;
            width: 400px;
            position: absolute;
            left:20%;
            border: 1px solid silver;
            background-color: #fdfffb;
            z-index: 999;
        }
        .hotshow-select{
            float:left;
            list-style: none;
            margin: 5px;
            padding: 2px;
            cursor:pointer;
        }
        .hotshow-select:hover{
            color:#5CACEE;
        }
        .sightdiv{
            display: none;
            margin-top: 30px;
            padding: 5px;
            text-align: left;
        }
        .sightdiv div{
            margin-bottom: 10px;
        }
        .sightdiv h4{
            color:#5CACEE;
        }
        .sightdiv span{
            margin: 5px;
            font-size: small;
            cursor: pointer;
        }
        .sightdiv span:hover{
            color:#5CACEE;
        }
    </style>
</head>
<body onresize="init()">
<div id="content">
    <div id="left-block">
        <div id="panel" style="position: absolute"></div>
        <div id="custom">
            <div id="customroute">
                <label>规划路线</label><br>
                <div id="sightlist">
                    <div id="ip1" class="ip">
                        <input id="sight1" class="place" type="text" placeholder="第1地点"/>
                        <img class="hotshow" id="hot1" src="img/more.png"/>
                        <div style="clear: both"></div>
                    </div>
                    <div id="ip2" class="ip">
                        <input id="sight2" class="place" type="text" placeholder="第2地点"/>
                        <img class="hotshow" id="hot2" src="img/more.png"/>
                        <div style="clear: both"></div>
                        <div id="panel2"></div>
                    </div>
                </div>
                <button id="addsight" onclick="addsight()">添加地点</button>
                <div style="text-align: center">
                    <button id="custom-btn">开始规划</button>
                </div>
            </div>
        </div>
    </div>
    <div id="map">
        <div id="selectmethod">
            <ul>
                <li><a id="transfer">公交 |</a></li>
                <li><a id="drive">驾车 |</a></li>
                <li><a id="walk">步行 |</a></li>
                <li><a id="ride">骑行</a></li>
            </ul>
            <div style="clear: both"></div>
        </div>
        <div id="route">
            <button id="closeguide">关闭路线指引</button>
        </div>
        <div id="container"></div>
    </div>
    <div style="clear: both"></div>
    <div id="confrim_sight">
        <label>确认选择<span id="select-name"></span>？</label><br>
        <button class="confrim_btn" id="confrim">确定</button>
        <button class="confrim_btn" id="cancel">取消</button>
    </div>
</div>
<script type="text/javascript" src="http://webapi.amap.com/maps?v=1.3&key=c164752710e569fad431743aa3669262"></script>
<script type="text/javascript" src="http://cache.amap.com/lbs/static/addToolbar.js"></script>
<script type="text/javascript" src="js/map.js"></script>
</body>
</html>