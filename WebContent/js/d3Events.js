var eventObject = null;

$(function(){
	
	//页面初次加载时，如果有id为d3_menu的菜单元素，就将它隐藏
	d3.select("#d3_menu").style("display","none"); 
	
	//创建菜单元素，并初始化菜单样式
	menu = d3.select("body")
		.on("click",function(){
			$("#d3_menu").hide();
		})
		.append("div")
		.attr("id","d3_menu")
		.style("display","none")
		.style("position","absolute");
	
	ul = menu.append("ul");
	
	ul.append("li").attr("class","menu-li").attr("id","li-open").append("a").attr("href","#").on("click",query).text("展开");
	ul.append("li").attr("class","menu-li").attr("id","li-reasoning").append("a").attr("href","#").on("click",reasoning).text("推理");
	ul.append("li").attr("class","menu-li").attr("id","li-deleteNode").append("a").attr("href","#").on("click",deleteNode).text("删除该节点");
	ul.append("li").attr("class","menu-li").attr("id","li-deleteEdge").append("a").attr("href","#").on("click",deleteEdge).text("删除该联系");
	ul.append("li").attr("class","menu-li").attr("id","li-close").append("a").attr("href","#").on("click",deleteEdges).text("关闭叶子节点");
	ul.append("li").attr("class","menu-li").attr("id","li-fix").append("a").attr("href","#").on("click",fix).text("固定节点");
	ul.append("li").attr("class","menu-li").attr("id","li-loose").append("a").attr("href","#").on("click",cancleFix).text("取消固定");	
	ul.append("li").attr("class","menu-li").attr("id","li-details").append("a").attr("href","#").on("click",getDetails).text("显示详细信息");

	alertBox = d3.select("body")       
				.append("div")
				.attr("id","alert_box")
				.style("display","none")
				.style("position","absolute");
	
	alertBoxTitle = alertBox.append("div")
					.attr("id","alert_box_title");
	
	alertBoxTitle.append("span")
					.attr("id","alert_title")
					.attr("style","margin-left:20px");
	
	alertBoxTitle.append("div")
					.attr("id","exit_icon")
					.append("input")
					.attr("type","image")
					.attr("src","img/X.png")
					.on("click",closeAlertBox);
			
	
	alertBox.append("div")
			.attr("id","alert_box_content");
	
	//调用初始化函数对图谱进行初始化
	initiate();
})

function cancleAllFix(){
	
	for(var i =0;i<_nodes.length;i++){
		_nodes[i].fixed = false;
	}
	
}

function fixAll(){
	
	for(var i =0;i<_nodes.length;i++){
		_nodes[i].fixed = true;
	}
	
}

function emptyElements(){
	
	_nodes = [];
	
	_edges = [];
	
	removeElements();
	
	refreshD3();
}

function deleteNode(){
	
	d3.select("#d3_menu").style("display","none");
	
	for(var i = 0;i<_edges.length;i++){
		
		if(_edges[i].source==eventObject||_edges[i].target==eventObject){
			_edges[i].source.openable = true;
			_edges[i].target.openable = true;
			_edges[i].source.linked--;
			_edges[i].target.linked--;
		    _edges.splice(i,1);
			i--;
		}
		
	}
	
	deleteNodes([eventObject]);
	
	removeElements();

	refreshD3();
}

function deleteEdge(){
	
	for(var i = 0;i<_edges.length;i++){
		
		if(_edges[i]==eventObject){
			_edges[i].source.openable = true;
			_edges[i].target.openable = true;
			_edges[i].source.linked--;
			_edges[i].target.linked--;
			_edges.splice(i,1);
			break;
		}
	}
	
	removeElements();

	refreshD3();
}


function displayMenu(e){
	
	//获取事件对象
	event=arguments.callee.caller.arguments[0];
	
	$(".menu-li").show();
	
	//判断该事件是否为鼠标右键
	if(event.buttons==2){
		//将鼠标右键点击的对象赋给全局变量eventObject，方便其它地方对该对象进行操纵
		eventObject = e; 
		
		if(!e.source){
			$("#li-deleteEdge").hide();
			if(e.linked==0){
				$("#li-close").hide();
			}
			if(!e.openable){
				$("#li-open").hide();
			}
		}else{
			
			$(".menu-li").hide();
			$("#li-deleteEdge").show();
			
		}
		//更改菜单的坐标为鼠标点击的坐标，并显示菜单
		d3.select("#d3_menu").style("top",event.clientY+"px")
					.style("left",event.clientX+"px")
					.style("display","block");
	}
	
}

function getDetails(){	
	
	d3.select("#d3_menu").style("display","none");
	
	d3.json('./GetDetailsProcess.do?keyword='+eventObject.name,function(result){
		if(result.keys.length==0){
			$("#alert_box_content").append("<center><font color='red'>无详细信息</font></center><br/>");
		}
		else{
			for(var i=0;i<result.keys.length;i++){
				var key = result.keys[i];
				var value = result.values[i];
				$("#alert_box_content").append("<center><font color='#FF7F00'>"+key+":</font>  "+value+"</center><br/>");
			}
		}
		d3.select("#alert_title").text("详细信息:");
		d3.select("#alert_box").style("display","block");
	});
}


function closeAlertBox(){
	$("#alert_box_content").empty();
	d3.select("#alert_box").style("display","none");
}


function reasoning(){
		
	d3.select("#d3_menu").style("display","none");
	
	d3.json('./ReasoningProcess.do?keyword='+eventObject.name,function(root){
		if(root.length==0){
			$("#alert_box_content").append("<center><font color='red'>无推理结果</font></center><br/>");
		}
		else{
			for(var i=0;i<root.length;i++){
				var reasoningResult = root[i].subject+" ---"+root[i].predicate+"---> "+root[i].object;
				$("#alert_box_content").append("<center>"+reasoningResult+"</center>");
			}
		}
		d3.select("#alert_title").text("推理结果:");
		d3.select("#alert_box").style("display","block");
	});
}

function fix(){
	//固定某一节点
	eventObject.fixed=true;
	//将已经显示的菜单再次隐藏
	d3.select("#d3_menu").style("display","none");
}


function cancleFix(){
	//取消节点固定
	eventObject.fixed=false;
	//将已经显示的菜单再次隐藏
	d3.select("#d3_menu").style("display","none");
}

function initiate(){

	//节点数组
	_nodes = [];
	
	//连线数组
	_edges = [];
	
	//颜色比例尺
	color = d3.scale.category20c();
	
	//创建缩放行为
	zoom = d3.behavior.zoom()
				//指定缩放比例的范围，默认为[0,正无穷]
				.scaleExtent([0.1,3])
				//为缩放事件指定处理函数，缩放事件(zoomstart,zoom,zoomend)
				.on("zoom",zoomed);
	
	//禁用浏览器的右键菜单
	document.oncontextmenu = function() {
		return false;
	};
	
	width = parseInt($('.d3_area').css('width'));
	
	height = parseInt($('.d3_area').css('height'));
	
	svg = d3.select(".d3_area")
				.append("svg")
				.attr("width",width)
				.attr("height",height)
				.attr("id","svg")
				//将缩放行为指定到svg上
				.call(zoom)
				//禁用双击缩放
				.on('dblclick.zoom',null)
				//禁用单击缩放
				.on('mousedown.zoom',null);
	
				
	//<defs>元素用于预定义一个元素使其能够在SVG图像中重复使用
	defs = svg.append("defs");
	
	//<marker>是一个特殊的元素，可以在一个地方定义，然后在另一个地方引用
	arrowMarker = defs.append("marker")
							.attr("id","arrow")
							/*	它接受两个值，strokeWidth和userSpaceOnUse。
								默认值是strokeWidth，这也是大家大多数情况下会设置的值，因为它允许你的marker随着它连接的line进行缩放
								strokeWidth:坐标系统中的marker值和当前描边宽度的单位是相同的尺寸
								userSpaceOnUse: marker的值是当前用户坐标系统的值。
								也就是说如果你的marker是一个半径为10px的圆，它就一直都是10px的半径，不受连接的元素的影响。*/
							.attr("markerUnits","strokeWidth")
							//markerWidth和markerHeight属性定义了marker视窗的宽度和高度。
							.attr("markerWidth","12")
							.attr("markerHeight","12")
							/*	取景框. 它使用xmin,ymin,width,height这些参数确定取景范围，然后将取到的景象，放到marker中，并且充满整个marker. 							 
								如果取到的景象比marker可视范围小，则景象会被放大再充满marker；如果取到的景象比marker可视范围大，则景象怎取景会被缩小再充满marker*/
							.attr("viewBox","0 0 12 12")
							//refX和refY，指的是图形元素和marker连接的位置坐标
							.attr("refX","24.5")
							.attr("refY","6")
							//接受一个auto值，或者一个角度值。在与其它内容连接的时候这个值决定了marker是否要旋转。auto表示随元素一起旋转
							.attr("orient","auto");
	
	//设置轨迹
	/*
	M	moveto 移动到	(x y)+
	Z	closepath 关闭路径	(none)
	L	lineto 画线到	(x y)+
	H	horizontal lineto 水平线到	x+
	V	vertical lineto 垂直线到	y+
	C	curveto 三次贝塞尔曲线到	(x1 y1 x2 y2 x y)+
	S	smooth curveto 光滑三次贝塞尔曲线到	(x2 y2 x y)+
	Q	quadratic Bézier curveto 二次贝塞尔曲线到	(x1 y1 x y)+
	T	smooth quadratic Bézier curveto 光滑二次贝塞尔曲线到	(x y)+
	A	elliptical arc 椭圆弧	(rx ry x-axis-rotation large-arc-flag sweep-flag x y)+
	R	Catmull-Rom curveto* Catmull-Rom曲线	x1 y1 (x y)+
	
	大写是绝对定位，小写是相对定位
	*/
	arrow_path = "M2, 0 L9, 6 L2, 12 L1.3, 11.3 L7.5, 6 L1.3, 0.7 Z";
	
	arrowMarker.append("path")
				//赋予设置好的轨迹，根据轨迹绘画图形
				.attr("d",arrow_path)
				//对轨迹范围内填充颜色
				.attr("fill","#E4E4E3");
	
	//g标签为svg常用的标签，用于把相关元素进行组合的容器元素，以便进行统一变化
	g_edges = svg.append("g"); 
	
	g_nodes = svg.append("g"); 
	
	g_texts = svg.append("g"); 
	
	g_relations = svg.append("g");
	
	g_images = svg.append("g");
	
	//创建力向图，默认为尺寸1x1，连线长度1，摩擦系数0.9，连线距离20，电荷强度-30，重力强度0.1，theta0.8
	force = d3.layout.force()
					.nodes(_nodes)
					.links(_edges)
					.size([width,height])
					.linkDistance([100])
					.linkStrength(0.4)
					.charge([-1000])
					.friction(0.9);
	
	
	//力向图节拍事件
	force.on("tick", function() { 
	
				d3.selectAll("line")
					.transition()
					.duration(36)
					.ease("circle")
					.attr("x1", function(d) {
						return d.source.x;
					})
					.attr("y1", function(d) {
						return d.source.y;
					})
					.attr("x2", function(d) {
						return d.target.x;
					})
					.attr("y2", function(d) {
						return d.target.y;
					}).style("stroke", "#E4E4E3")
					.style("stroke-width", "1.3px");
	
				
				d3.selectAll("circle")
				.transition()
					.duration(36)
					.ease("circle")
					.attr("cx", function(d) {
						return d.x;
					})
					.attr("r", function(d) {
						return 20;
					})
					.attr("fill",function(d){
						return "url(#"+d.name+")";
					})
					.style("stroke", "#000")
					.attr("cy", function(d) {
						return d.y;
					});
			
				d3.selectAll(".node_text")
					.transition()
					.duration(36)
					.ease("circle")
					.attr("x", function(d) {
						return d.x - 20;
					})
					.attr("y", function(d) {
						return d.y + 32;
					})
					.attr("fill","black")
					.text(function(d) {
						return d.name;
					});
			
				
				d3.selectAll(".relation_text")
				.transition()
					.duration(36)
					.ease("circle")
					.attr("x", function(d) {
						return (d.source.x+d.target.x)/2;
					})
					.attr("y", function(d) {
						return (d.source.y+d.target.y)/2;
					})
					.text(function(d) {
						return d.relation;
					})
					.attr("fill","#EA3162");
	
		});

}


function requestD3(uri){
	
	var queryResults;
	//请求获取json数据，root为json数据中的根节点
	var encodeUri = encodeURI(uri);

	var args={"time":new Date()};
	 $.ajax({
		async:false,
		type: "post",
        url: encodeUri,
        data: args,
        dataType: "json",
        success: function(nodes){
        	queryResults = nodes;
        	initiate();
        	for(var i =0;i<nodes.length;i++){
        		nodes[i].linked = 0;
        		nodes[i].sameEdge = 0;
        		nodes[i].openable = true;
        		nodes[i].children[0].sameEdge = 0;
        		nodes[i].children[0].openable = true;
        		addNode(nodes[i]);
        	}
    		refreshD3();
        }
        
    });		 
	/*resetLinked();*/
	return queryResults;
}

/*function resetLinked(){
	
	for(var i=0;i<_nodes.length;i++){
		if(_nodes[i].linked!=_nodes[i].weight - _nodes[i].sameEdge){
			_nodes[i].linked = _nodes[i].weight - _nodes[i].sameEdge;
		}
	}
}
*/
function addNode(root){
	
	var i = findSameNode(root);
	
	var j = findSameNode(root.children[0]);
	
	if(i!=-1&&j!=-1){
		k = findSameEdge(root,root.children[0]);
		if(k==-1){
			addEdge(_nodes[i],_nodes[j],root.children[0].relation);
		}

	}else if(i!=-1&&j==-1){	
			_nodes.push(root.children[0]);
			addEdge(_nodes[i],_nodes[_nodes.length-1],root.children[0].relation);

	}
	else if(i==-1&&j!=-1){
		_nodes.push(root);
		addEdge(root,_nodes[j],root.children[0].relation);
		
	}else if(i==-1&&j==-1){
		_nodes.push(root);
		_nodes.push(root.children[0]);
		addEdge(root,root.children[0],root.children[0].relation);
	}

}

function deleteEdges(){
	
		eventObject.openable = true;
		
		d3.select("#d3_menu").style("display","none");
		
		var targets = [];
		
/*		var deleted = false;
		
		var deleteCount = 0;*/
		
		for(var i = 0;i<_edges.length;i++){
				
			if(_edges[i].source==eventObject&&_edges[i].target.linked<=1) {
			/*	deleted = true;*/
				targets.push(_edges[i].target);
				eventObject.linked--;	
				_edges.splice(i,1);
				i--;
		/*		deleteCount++;*/
				
			}else if(_edges[i].target==eventObject&&_edges[i].source.linked<=1) {
				/*deleted = true;*/
				targets.push(_edges[i].source);
				eventObject.linked--;
				_edges.splice(i,1);
				i--;
				/*deleteCount++;*/
			}
   
		}
		
	/*	if(deleted&&eventObject.sameEdge){
			eventObject.linked += eventObject.sameEdge;
			eventObject.sameEdge -= deleteCount;
		}
		*/
		deleteNodes(targets);
		
		removeElements();
		
		refreshD3();
		
}

function deleteNodes(targets){
	
	for(var i = 0;i<_nodes.length;i++){

		for(var j = 0;j<targets.length;j++){

			if(_nodes[i]==targets[j]){				
				_nodes.splice(i,1);		
				i--;
			}
		}
		
	}
	
}

function removeElements() {

	g_edges.selectAll("line")
			.data(_edges) 
			.exit() 
			.remove(); 

	g_nodes.selectAll("circle")
			.data(_nodes)
			.exit()
			.remove();

	g_texts.selectAll(".node_text")
			.data(_nodes)
			.exit()
			.remove();
	
	g_images.selectAll("defs")
			.data(_nodes,function(d){
				return d.name;
			})
			.exit()
			.remove();
	
	g_relations.selectAll(".relation_text")
				.data(_edges)
				.exit()
				.remove();

}

function addEdge(source,target,relation){
	source.linked++;
	target.linked++;
	var line = new Object();
	line.source = source;
	line.target = target;
	line.relation = relation;
	_edges.push(line);
	
}

function findSameNode(node){
	
	for(var i = 0;i<_nodes.length;i++){
		
		if(_nodes[i].name==node.name){
			return i;
		}
	}
	return -1;
}

function findSameEdge(source,target){
	for(var i = 0;i<_edges.length;i++){
		if(_edges[i].source.name==source.name&&_edges[i].target.name==target.name){
			return i;
		}else if(_edges[i].source.name==target.name&&_edges[i].target.name==source.name){
			return i;
		}
	}
	return -1;
}




function zoomed() {
	
	$("#d3_menu").hide();
	
	d3.selectAll("g")
		.attr("transform","translate(" + d3.event.translate + ")scale(" + d3.event.scale+ ")");

}

function query(){
	
	d3.select("#d3_menu").style("display","none");
	
	var keyword = eventObject.name;
	
	eventObject.openable = false;
	
	var scope = $(".history_area a").html();
	
	if(scope!=null&&scope.indexOf(keyword)!=-1&&scope.indexOf(keyword)==-1){
		scope = scope.slice(scope.indexOf("(")+1,scope.indexOf(")"));
	}else{
		scope = "所有类";
	}
	
	d3.json('./KeywordQueryProcess.do?keyword='+keyword+'&recordable=false&scope='+scope,function(root){
		for(var i=0;i<root.length;i++){
			root[i].linked = 0;
			root[i].sameEdge = 0;
			root[i].openable = true;
			root[i].children[0].sameEdge = 0;
			root[i].children[0].openable = true;
			addNode(root[i]);
		}
		refreshD3();
	});
	
/*	resetLinked();*/
}

function refreshD3(){
	
	//当首次创建力向图时，必须调用start()，然后分配节点和连线，当节点或连接发生变化时应当再次调用start()
	force.start();
			
	edge =	g_edges.selectAll("line")
					.data(_edges)
					.enter()
					.append("line")
					.on("mousedown",displayMenu)
					.style("cursor","pointer")
					//设置箭头的终点指向的对象
					.attr("marker-end","url(#arrow)");
		
	node =	g_nodes.selectAll("circle")
					.data(_nodes)
					.enter()
					.append("circle")
					.attr("id",function(d){
						return d.name + "_node";
					})
					.call(force.drag().on("dragstart", function(d) {
						d.fixed = true;
						}))
					.style("cursor","pointer")
					.on("mousedown",displayMenu)
					.on("mouseover",function(d){
						d3.selectAll(".relation_text").style("fill-opacity",function(edge){
							if(edge.source==d||edge.target==d){
								return 1;
							}
						});
							
					})
					.on("mouseout",function(d){
						d3.selectAll(".relation_text").style("fill-opacity",0)
					});
	
	image = g_images.selectAll("pattern")
						.data(_nodes)
						.enter()
						.append("defs")
						.append("pattern")
						.attr("id",function(d){
							return d.name;
						})
						.attr("patternUnits","objectBoundingBox")
						.attr("width",1)
						.attr("height",1)
						.append("image")
						.attr("xlink:href",function(d){
							return d.images;
						})
						.attr("x",-7.5)
						.attr("y",-5)
						.attr("width",55)
						.attr("height",55);
		
	node_text =	g_texts.selectAll(".node_text") 
						.data(_nodes)
						.enter()
						/*.append("a")
						.attr("href","javascript:return false")
						.style("cursor","default")*/
						.append("text")
						.attr("class","node_text");
		
	relation_text =	g_relations.selectAll(".relation_text")
								.data(_edges)
								.enter()
								/*.append("a")
								.attr("href","javascript:return false")
								.style("cursor","default")*/
								.append("text")
								.attr("class","relation_text")
								.attr("fill-opacity",0);
}
