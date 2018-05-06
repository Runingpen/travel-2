require(['config'],function () {
    require(['jquery'],function () {
        $(window).resize(function () {
            $('#container').css('height',$(window).innerHeight()+'px');
        });

        $(function () {
            $('#title,#sub-title,#enter-btn').fadeIn(1000);
            $('#container').css('height',$(window).innerHeight()+'px');
            $('#enter-btn').click(function () {
                $('#enter-block').hide();
            });

        });


    });

    window.require = require(['jquery','web-key','map-ui'],function ($) {

        var str;

        var map = new AMap.Map("container", {
            resizeEnable: true,
            center:[113.360695,22.331724],
            zoom:10,
            zooms: [10,15],
            mapStyle:'amap://styles/7bc20b330c2db8e965c7414c31cf860e',
            features:['bg','building','point']
        });
        
        AMap.plugin(['AMap.ToolBar','AMap.Scale','AMap.OverView'], 
        	    function(){
        	        map.addControl(new AMap.ToolBar());

        	        map.addControl(new AMap.Scale());

        	        map.addControl(new AMap.OverView({isOpen:true}));
        	});
        
        var city = ['珠海市','中山市','澳门特别行政区'];
        var cityLngLat=[[113.32911,22.148046],[113.382391,22.521113],[113.562397,22.160448]];
        var pol = [];

        for(var i = 0;i < 3;i++){
            var marker = new AMap.Marker({
                icon: "http://webapi.amap.com/theme/v1.3/markers/n/mark_b.png",
                position: cityLngLat[i],
                content:'<h3 style="color: #FFFFFF;">'+city[i].substring(0,2)+'</h3>'
            });
            marker.setMap(map);
        }

        $(function(){
            $.ajax({
                url: 'lib/sights.txt',
                dataType: 'text',
                success: function(data) {
                    str= data.split("\n");
                }
            });
        });

        function setPoloygon(city,level) {
            AMap.service('AMap.DistrictSearch', function() {
                var opts = {
                    subdistrict: 0,   //返回下一级行政区
                    extensions: 'all',  //返回行政区边界坐标组等具体信息
                    level: 'city'  //查询行政级别为 市

                };
                //实例化DistrictSearch
                district = new AMap.DistrictSearch(opts);
                //行政区查询
                for(var i = 0;i < 3;i++){
                    district.search(city[i],(function (i) {
                            return function(status, result) {
                                var bounds = result.districtList[0].boundaries;
                                var polygons = [];
                                if (bounds) {
                                    for (var j = 0, l = bounds.length; j < l; j++) {
                                        //生成行政区划polygon
                                        var polygon = new AMap.Polygon({
                                            map: map,
                                            strokeWeight: 1,
                                            path: bounds[j],
                                            fillOpacity: 0.9,
                                            fillColor: '#DCDCDC',
                                            strokeColor: '#595959',
                                            strokeStyle: 'dashed',
                                            cursor: 'pointer',
                                            city: city[i]
                                        });
                                        polygons.push(polygon);
                                    }
                                    pol.push(polygons);
                                    for (j = 0; j < polygons.length; j++) {
                                        polygons[j].on('mouseover', function () {
                                            for (var k = 0; k < polygons.length; k++) {
                                                polygons[k].setOptions({
                                                    fillColor: '#636363'
                                                });
                                            }
                                        });
                                        polygons[j].on('mouseout', function () {
                                            for (var k = 0; k < polygons.length; k++) {
                                                polygons[k].setOptions({
                                                    fillColor: '#DCDCDC'
                                                });
                                            }
                                        });
                                        polygons[j].on('click', function () {
                                            switch (i){
                                                case 0:
                                                    map.setCenter([113.553986,22.224979]);
                                                    map.setZoom(11);
                                                    map.clearMap();
                                                    setMarkers();
                                                    break;
                                                case 1:
                                                    map.setCenter([113.382391,22.521113]);
                                                    map.setZoom(11);
                                                    map.clearMap();
                                                    setMarkers();
                                                    break;
                                                case 2:
                                                    map.setCenter([113.562397,22.160448]);
                                                    map.setZoom(13);
                                                    map.clearMap();
                                                    setMarkers();
                                                    break;
                                            }

                                        });
                                    }

                                }
                            }
                        })(i)
                    );
                }

            });
        }
        setPoloygon(city);

        function deletePoloygon() {
            for(var i = 0;i < pol.length;i++){
                for(var j = 0;j < pol[i].length;j++){
                    pol[i][j].setMap(null);
                }

            }

        }

        function setMarkers() {
            map.plugin(["AMap.Geocoder"], function () {
                var geocoder = new AMap.Geocoder({});
                str.forEach(function (t,i) {
                    geocoder.setCity(city[i]);
                    var sights = t.split(" ");
                    sights.forEach(function (sight) {
                        geocoder.getLocation(sight, function(status, result) {
                            if (status === 'complete' && result.info === 'OK') {
                                result.geocodes.forEach(
                                    function (geo) {
                                        setMarker([geo.location.getLng(),geo.location.getLat()],geo.formattedAddress);
                                    }
                                )

                            }
                        });
                    })
                })
            });
        }

        function setMarker(position,title) {
            var marker = new AMap.Marker({
                icon: "img/地点.png",
                position: position,
                title:title
            });
            marker.on('mouseover', function() {
            		var infoWindow = new AMap.InfoWindow({
            			infoTitle: '<strong>这里是标题</strong>',
                    infoBody: '<p class="my-desc"><strong>这里是内容。</strong> <br/> 高德地图 JavaScript API，是由 JavaScript 语言编写的应用程序接口，' +
                        '它能够帮助您在网站或移动端中构建功能丰富、交互性强的地图应用程序</p>',
                    //基点指向marker的头部位置
                    offset: new AMap.Pixel(0, -31)
                });
            		infoWindow.open(map, marker.getPosition());
            });
            marker.setMap(map);
        }
    });


});