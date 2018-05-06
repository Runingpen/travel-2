function searchbar(){
    $("#input").width(200);
}
function searchbar2() {
    $("#input").width(100);
}
function button(){
    // $("#button").text("开始搜索>>");
    var $p = $("#button");
    $p.text("开始搜索>>").css("background-color","#0D6CCC");
}

function button2() {
    var $p = $("#button");
    $p.text("开始探索").css("background-color","#3A9BFC");
}

// function button3() {
//     location.href = "recommend.html"
// }

function zhuhaievent() {
    var $a = $("#underwordzhuhai")
    var $b = $("#underwordzhuhai2")
    var $p = $("#zhuhaiblackbox")
    $p.stop(true);
    $a.stop(true);
    $b.stop(true);
    $p.fadeTo("slow",0.5);
    $a.animate({top:"460px"});
    $b.fadeTo("fast",1).animate({top:"510px"});
}
function zhuhaievent2() {
    var $a = $("#underwordzhuhai")
    var $b = $("#underwordzhuhai2")
    var $p = $("#zhuhaiblackbox");
    $p.stop(true);
    $a.stop(true);
    $b.stop(true);
    $p.fadeTo("slow",0);
    $a.animate({top:"480px"});
    $b.animate({top:"610px"}).fadeTo("fast",0);
}

function zhongshanevent() {
    var $a = $("#underwordzhongshan")
    var $b = $("#underwordzhongshan2")
    var $p= $("#zhongshanblackbox")
    $p.stop(true);
    $a.stop(true);
    $b.stop(true);
    $p.fadeTo("slow",0.5);
    $a.animate({top:"180px"});
    $b.fadeTo("fast",1);
    $b.animate({top:"220px"});
}

function zhongshanevent2() {
    var $a = $("#underwordzhongshan")
    var $b = $("#underwordzhongshan2")
    var $p= $("#zhongshanblackbox")
    $p.stop(true);
    $a.stop(true);
    $b.stop(true);
    $p.fadeTo("slow",0);
    $a.animate({top:"200px"});
    $b.animate({top:"300px"}).fadeTo("fast",0);
}

function aomenevent() {
    var $a = $("#underwordaomen")
    var $b = $("#underwordaomen2")
    var $p= $("#aomenblackbox")
    $p.stop(true);
    $a.stop(true);
    $b.stop(true);
    $p.fadeTo("slow",0.5);
    $a.animate({top:"480px"});
    $b.fadeTo("fast",1);
}

function aomenevent2() {
    var $a = $("#underwordaomen")
    var $b = $("#underwordaomen2")
    var $p= $("#aomenblackbox")
    $p.stop(true);
    $a.stop(true);
    $b.stop(true);
    $p.fadeTo("slow",0);
    $a.animate({top:"520px"});
    $b.fadeTo("fast",0);
}

function  recommend() {
    $("#littlerecommend").toggle();
}

function recommend2() {
    $("#littlerecommend").hide();
}

