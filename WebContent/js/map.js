/**
 * Created by JIM on 2017/6/4.
 */


//地图对象初始化
var map = new AMap.Map("container", {
    resizeEnable: true
});
var driving;
var walking;
var transfer;
var riding;
var sight_num = "3";
var placeSearch;
var keywordlist = [];
var hotsightdata;

//网页布局初始化
window.onload = function () {
    init();
    data = initjson();
    clickcustom();
    cancelSelected();
    custom();
    hotshow();
    inithotshow("hot1");
    inithotshow("hot2");
    $(".hotshow-select").bind("click");
};

function initjson() {
    $.ajax({
        async: false,
        type : "GET",
        url : 'lib/hotsight.json',
        success : function(data) {
            hotsightdata = data;
        }
    });
}

function init() {
    //获取浏览器窗口高度
    var winHeight = 0;
    var winWidth = 0;
    if (window.innerHeight) {
        winHeight = window.innerHeight;
        winWidth = window.innerWidth
    }
    else if ((document.body) && (document.body.clientHeight) && (document.body.clientWidth)) {
        winHeight = document.body.clientHeight;
        winWidth = document.body.clientWidth;
    }
    //通过深入Document内部对body进行检测，获取浏览器窗口高度
    if (document.documentElement && document.documentElement.clientHeight) {
        winHeight = document.documentElement.clientHeight;
        winWidth = document.documentElement.clientWidth;
    }
    //DIV高度为浏览器窗口的高度
    document.getElementById("content").style.height = winHeight + "px";
    document.getElementById("left-block").style.height = winHeight + "px";
    document.getElementById("container").style.height = winHeight + "px";
    document.getElementById("panel").style.width = winWidth * 0.15 + "px";
    document.getElementById("route").style.height = winHeight * 0.6 + "px";

}

//搜索插件初始化
AMap.plugin(["AMap.PlaceSearch"], function () {
    placeSearch = new AMap.PlaceSearch({ //构造地点查询类
        pageSize: 4,
        pageIndex: 1,
        city: "", //城市
        map: map,
        panel: "panel",
        renderStyle:"newpc",
    });
    placeSearch.on("listElementClick",function (e) {
        
    })
});

//输入提示
AMap.plugin(['AMap.Autocomplete', 'AMap.PlaceSearch'], function () {
    var autoOptions = {
        city: "", //城市，默认全国
        input: "sight1"//使用联想输入的input的id
    };
    var autoOpitons2 = {
        city: "",
        input: "sight2"
    };
    var autocomplete = new AMap.Autocomplete(autoOptions);
    var autocomplete2 = new AMap.Autocomplete(autoOpitons2);
    AMap.event.addListener(autocomplete, "select", function (e) {
        placeSearch.search(e.poi.name);
        document.getElementById("panel").style.display = "block";
        confrimSelected("sight1");
        document.getElementById("panel").style.top = document.getElementById("sight1").offsetTop + 30 + "px";
        document.getElementById("panel").style.left = document.getElementById("sight1").offsetLeft + "px";
    });
    AMap.event.addListener(autocomplete2, "select", function (e) {
        placeSearch.search(e.poi.name);
        document.getElementById("panel").style.display = "block";
        confrimSelected("sight2");
        document.getElementById("panel").style.top = document.getElementById("sight2").offsetTop + 30 + "px";
        document.getElementById("panel").style.left = document.getElementById("sight2").offsetLeft + "px";
    });

});


//取消选定地点
function cancelSelected() {
    document.getElementById("cancel").onclick = function () {
        document.getElementById("confrim_sight").style.display = "none";
    };
}

//确定选定地点
function confrimSelected(id) {
    AMap.event.addListener(placeSearch, "listElementClick", function (e) {
        document.getElementById("confrim_sight").style.display = "block";
        document.getElementById("select-name").innerHTML = e.data.name;
        document.getElementById("confrim").onclick = function () {
            document.getElementById(id).value = e.data.name;
            document.getElementById("confrim_sight").style.display = "none";
            document.getElementById("panel").style.display = "none";
        };
    });

}

//开始规划
function custom() {
    //路径规划初始化

    AMap.plugin('AMap.Driving', function () {//回调函数
        //实例化Walking
        driving = new AMap.Driving({
            map: map,
            isOutline: true,
            autoFitView: true,
            panel: "route"
        });

    });

    document.getElementById("custom-btn").onclick = function () {
        var success = 1;
        for (var i = 1; i < sight_num; i++) {
            var sight = document.getElementById("sight" + i.toString());
            if ($.trim(sight.value) === "" || $.trim(sight.value) === "地址非法") {
                success = 0;
                sight.value = "地址非法";
                sight.style.color = "#FF4500";
                document.getElementById("selectmethod").style.display = "none";
            } else {
                keywordlist[i - 1] = {"keyword": sight.value};
            }
            var list = keywordlist;
        }
        driving.search(keywordlist.concat());
    }
}

//点击地点选框事件
function clickcustom() {
    var sight1 = document.getElementById("sight1");
    var sight2 = document.getElementById("sight2");
    $("#sight1").on("click", function () {
        if (sight1.value === "地址非法") {
            sight1.style.color = "#000000";
            sight1.value = "";
        }
    });
    $("#sight2").on("click", function () {
        if (sight2.value === "地址非法") {
            sight2.style.color = "#000000";
            sight2.value = "";
        }
    });
}

//增加地点选框
function addsight() {

    var div = document.createElement("div");
    div.id = "ip" + sight_num;
    div.className = "ip";
    document.getElementById("sightlist").appendChild(div);

    var input = document.createElement("input");
    input.id = "sight" + sight_num;
    input.className = "place";
    input.nodeType = "text";
    input.onclick = function () {
        if (input.value === "地址非法") {
            input.style.color = "#000000";
            input.value = "";
        }
    };
    input.placeholder = "第" + sight_num + "地点";

    var deletediv = document.createElement("img");
    deletediv.src = "img/delete.png";
    deletediv.style.marginTop = "8px";
    deletediv.style.position = "absolute";
    deletediv.style.left = "1%";
    deletediv.style.float = "left";
    deletediv.style.width = "15px";
    deletediv.style.height = "15px";
    deletediv.style.cursor = "pointer";
    deletediv.onclick = function () {
        var del_num = div.id.replace(/[^0-9]/ig, "");
        div.parentNode.removeChild(div);
        sight_num = sight_num - 1;
        if (sight_num === 12) {
            document.getElementById("addsight").style.display = "block";
        }
        for (var i = parseInt(del_num); i < sight_num; i++) {
            var sight = document.getElementById("sight" + (i + 1).toString());
            sight.id = "sight" + i.toString();
            sight.placeholder = "第" + i + "地点";
            document.getElementById("ip" + (i + 1).toString()).id = "ip" + i.toString();
            document.getElementById("hot" + (i + 1).toString()).id = "hot" + i.toString();
        }
    };
    div.appendChild(deletediv);

    var img = document.createElement("img");
    img.className = "hotshow";
    img.id = "hot" + sight_num;
    img.src = "img/more.png";

    var clearFloatDiv = document.createElement("div");
    clearFloatDiv.style.clear = "both";

    div.appendChild(input);
    div.appendChild(img);
    div.appendChild(clearFloatDiv);

    AMap.plugin('AMap.Autocomplete', function () {//回调函数
        //实例化Autocomplete
        var autoOptions = {
            city: "", //城市，默认全国
            input: input.id//使用联想输入的input的id
        };
        var autocomplete = new AMap.Autocomplete(autoOptions);
        AMap.event.addListener(autocomplete, "select", function (e) {
            placeSearch.search(e.poi.name);
            document.getElementById("panel").style.display = "block";
            confrimSelected(input.id);
            document.getElementById("panel").style.top = document.getElementById(input.id).offsetTop + 30 + "px";
            document.getElementById("panel").style.left = document.getElementById(input.id).offsetLeft + "px";
        });
    });
    sight_num = (parseInt(sight_num) + 1).toString();
    if (parseInt(sight_num) === 13) {
        document.getElementById("addsight").style.display = "none";
    }
    inithotshow(img.id);
    img.onclick = function () {
        document.getElementById("hotshow" + img.id.charAt(img.id.length - 1)).style.display = "block";
        document.getElementById("hotshow" + img.id.charAt(img.id.length - 1)).style.zIndex = "1000";

    }

}

//解析热门景点信息，填充到数组里;
function gethotsightData(city,id) {
    var zhuhai_CultureSightdata;
    var zhuhai_otherSightdata;
    var macao_CultureSgihtdata;
    var macao_otherSightdata;
    var zhongshan_Culturedata;
    var zhongshan_otherSightdata;
    var datalist = [];
    $.each(hotsightdata,function (i,data) {
        $.each(data,function (i,data) {
            if(i === "珠海"){
                $.each(data,function (i,data) {
                    $.each(data,function (i,data) {
                        if(i === "历史文化景点"){
                            zhuhai_CultureSightdata = data;
                        }
                        else if(i === "其他景点"){
                            zhuhai_otherSightdata = data;
                        }
                    })
                });
            }
            else if(i === "澳门") {
                $.each(data,function (i,data) {
                    $.each(data,function (i,data) {
                        if(i === "历史文化景点"){
                            macao_CultureSgihtdata = data;
                        }
                        else if(i === "其他景点"){
                            macao_otherSightdata = data;
                        }
                    })
                });
            }
            else if(i === "中山"){
                $.each(data,function (i,data) {
                    $.each(data,function (i,data) {
                        if(i === "历史文化景点"){
                            zhongshan_Culturedata = data;
                        }
                        else if(i === "其他景点"){
                            zhongshan_otherSightdata = data;
                        }
                    })
                });
            }

        })
    });
    if (city === "珠海" && id === 0){
        $.each(zhuhai_CultureSightdata,function (i,data) {
            datalist[i] = data["景点名称"];
        });
        return datalist;
    }
    else if (city === "珠海" && id === 1){
        $.each(zhuhai_otherSightdata,function (i,data) {
            datalist[i] = data["景点名称"];
        });
        return datalist;
    }
    else if (city === "澳门" && id === 0){
        $.each(macao_CultureSgihtdata,function (i,data) {
            datalist[i] = data["景点名称"];
        });
        return datalist;
    }
    else if (city === "澳门" && id === 1){
        $.each(macao_otherSightdata,function (i,data) {
            datalist[i] = data["景点名称"];
        });
        return datalist;
    }
    else if (city === "中山" && id === 0){
        $.each(zhongshan_Culturedata,function (i,data) {
            datalist[i] = data["景点名称"];
        });
        return datalist;
    }
    else if (city === "中山" && id === 1){
        $.each(zhongshan_otherSightdata,function (i,data) {
            datalist[i] = data["景点名称"];
        });
        return datalist;
    }
}

//解析数组创建span标签
function createhotshowDiv(city,div,index) {
    var temp_div = document.createElement("div");
    var cultrue_div = document.createElement("div");
    var other_div = document.createElement("div");
    temp_div.appendChild(cultrue_div);
    temp_div.appendChild(other_div);
    //添加标题
    var title1 = document.createElement("h4");
    var title2 = document.createElement("h4");
    title1.innerHTML = "历史文化景点";
    title2.innerHTML = "其他景点";
    cultrue_div.appendChild(title1);
    other_div.appendChild(title2);
    //处理数据添加span标签
    var data1 = gethotsightData(city,0);
    var data2 = gethotsightData(city,1);
    for(var i = 0;i<data1.length;i++){
        var span = document.createElement("span");
        span.innerHTML = data1[i];
        cultrue_div.appendChild(span);
        span.onclick = function () {
            var num = div.parentNode.id.replace(/[^0-9]/ig,"");
            document.getElementById("sight" + num).value = this.innerHTML;
            placeSearch.search(this.innerHTML);
            document.getElementById("panel").style.top = document.getElementById("sight" + num).offsetTop + 30 + "px";
            document.getElementById("panel").style.left = document.getElementById("sight" + num).offsetLeft + "px";
        }
    }
    for(var j = 0;j<data2.length;j++){
        var span = document.createElement("span");
        span.innerHTML = data2[j];
        other_div.appendChild(span);
        span.onclick = function () {
            var num = div.parentNode.id.replace(/[^0-9]/ig,"");
            document.getElementById("sight" + num).value = this.innerHTML;
            placeSearch.search(this.innerHTML);
            document.getElementById("panel").style.top = document.getElementById("sight" + num).offsetTop + 30 + "px";
            document.getElementById("panel").style.left = document.getElementById("sight" + num).offsetLeft + "px";
        }
    }
    temp_div.appendChild(cultrue_div);
    temp_div.appendChild(other_div);
    temp_div.className = "hotsight"+ index + " sightdiv";
    div.appendChild(temp_div);
}

//初始化加载热门景点
function inithotshow(id) {
    var div = document.createElement("div");
    div.className = "hotsight";
    div.id = "hotshow" + id.charAt(id.length - 1);
    div.style.top = document.getElementById(id).offsetTop + "px";

    var close = document.createElement("img");
    close.src = "img/close.png";
    close.style.position = "absolute";
    close.style.top = "0";
    close.style.right = "0";
    close.style.width = "12px";
    close.style.height = "12px";
    close.style.marginTop = "5px";
    close.style.marginRight = "5px";
    close.style.cursor = "pointer";
    close.onclick = function () {
        document.getElementById(div.id).style.display = "none";
    };
    div.appendChild(close);

    var ul = document.createElement("ul");
    ul.style.position = "absolute";
    ul.style.top = "0";
    ul.style.left = "0";
    div.appendChild(ul);

    var citylist = ["珠海","澳门","中山"];
    var div1 = document.createElement("div");
    div.appendChild(div1);
    $.each(citylist,function (index,city) {
        createhotshowDiv(city,div1,index);
    });
    for (var i = 0;i < 3;i++){
        var li = document.createElement("li");
        li.innerHTML = citylist[i];
        li.className = "hotshow-select";
        ul.appendChild(li);
        li.onclick = function () {
            $("#"+ div.id + " .hotsight"+$(this).index()).show().siblings().hide();
            $(this).css("color","#5CACEE").siblings().css("color","#000000");
        };
    }
    document.getElementById("content").appendChild(div);
    $("li:contains('珠海')").trigger("click");
}



//点击更多符号显示热门景点
function hotshow() {
    $("#hot1").on("click", function () {
        $("#hotshow1").show().css("z-index","999");
    });
    $("#hot2").on("click", function () {
        $("#hotshow2").show().css("z-index","999");
    });
}





