
function getStatement(subject,predicate,object){
	var uri='./GetStatementProcess.do?subject='+subject+'&predicate='+predicate+'&object='+object;
	$(".d3_area").empty();
	requestD3(uri);
}

function getPredicate(){
	var args={"time":new Date()};
	$.getJSON("./GetPredicatesProcess.do",args,function(data){
		$("#accuratePredicates").empty();
		for(i=0;i<data.length;i++){
			$("#accuratePredicates").append("<option style='{text-align:center;}'>"+data[i]+"</option>");
		}
		
	})
}


function showInstanceAsD3(event,treeId,treeNode){
	$(".d3_area").empty();
	var uri = './KeywordQueryProcess.do?keyword='+treeNode.name+'&recordable=false&scope=所有类';
	requestD3(uri);
}


function refreshHistory(type){
	var args={"time":new Date(),"type":type};
	
	$.getJSON("./GetSearchHistoriesProcess.do",args,function(result){  
		$('.history_area').empty();
		for(var i=result.length-1;i>-1;i--){
			if(result[i]!=''){
				$('.history_area').append('<center><a href="#" onclick="'+type+'(\''+result[i]+'\')">'+result[i]+'</a></center><br>');
			}
		}
	})
}

function emptyHistories(type){
	var args={"time":new Date(),"type":type};
	$.post("./EmptyHistoriesProcess.do",args,function(result){
		$('.history_area').empty();
	})
}

function listInstances(event,treeId,treeNode){
	if(!treeNode.isParent){
		var args = {"date":new Date(),"name":treeNode.name};
		var setting = {	
				async: {
					enable: true,
					url:"CatalogProcess.do",
					autoParam:["name"]
				},
				callback: {
					onClick: showInstanceAsD3
				}
			};
		$.getJSON("./CatalogProcess.do",args,function(zNodes){
			if(zNodes.length==0){
				$("#warning").empty();
				$("#warning").append('该类没有实例!');
				$("#instanceNumber").empty();
				$("#classInstances").empty();
			}else{
				$("#warning").empty();
				$("#instanceNumber").empty();
				$("#instanceNumber").append("("+zNodes.length+")");
				$.fn.zTree.init($("#classInstances"), setting, zNodes);
			}		
		})
	}else{
		$("#warning").empty();
		$("#instanceNumber").empty();
		$("#classInstances").empty();
		$("#warning").append('该类没有实例!');
	}
}
          

function knowledgeSearch(keyword){
	/* var theEvent = window.event || arguments.callee.caller.arguments[0];
	if(theEvent.keyCode==13){    */  
	var queryResult;
	var scope='';

	if(keyword!=null&&keyword.indexOf("(")!=-1){
		scope=keyword.slice(keyword.indexOf("(")+1,keyword.indexOf(")"));
		keyword = keyword.slice(0,keyword.indexOf("("));
	}else{
		keyword=$("#SearchContent").val();
		scope = $("#scope option:selected").val();
	}

	var uri='./KeywordQueryProcess.do?keyword='+keyword+'&scope='+scope+'&recordable=true';
	$(".d3_area").empty();
	queryResult = requestD3(uri);
	$('#ResultContent').empty();
	for(var i=0;i<queryResult.length;i++){
		var subject = queryResult[i].name;
		var predicate = queryResult[i].children[0].relation;
		var object = queryResult[i].children[0].name;
		$('#ResultContent').append('<center><a href="#" onclick="getStatement(\''+subject+'\','+'\''+predicate+'\','+'\''+object+'\')">'+subject+'<--'+predicate+'-->'+object+'</a></center>')
	}
	if(queryResult.length==0){
		$('#ResultContent').append('<center><font color="red">无检索结果!</font></center>');
	}
	refreshHistory("knowledgeSearch");
	
	
};

function relationSearch(keyword){
	
	var subject;
	var object;
	var queryResult;
	
	if(keyword!=null){
		subject = keyword.slice(keyword.indexOf("(")+1,keyword.indexOf(","));
		object = keyword.slice(keyword.indexOf(",")+1,keyword.indexOf(")"));
	}else{
		subject = $("#subject").val();
		object = $("#object").val();
	}

	$("#RelationshipSearchResultContent").empty();
	var args = {"date":new Date(),"subject":subject,"object":object};
	$.ajax({
		async:false,
		url:"./RelationQueryProcess.do",
		data:args,
		dataType:"json",
		success:function(results){
			for(var i=0;i<results.length;i++){
				var predicate = results[i];
				$("#RelationshipSearchResultContent").append("<center><a href='#' onclick='getStatement(\""+subject+"\",\""+predicate+"\",\""+object+"\")'>"+predicate+"</a></br><center>")
			}
			if(results.length==0){
				$('#RelationshipSearchResultContent').append('<center><font color="red">无检索结果!</font></center>');
			}
		}
		
	});
	refreshHistory("relationSearch");
}


function predicateSearch(param){
	
	var predicate;
	if(param=='indistinct'){
		predicate=$("#PredicateSearchContent").val();
	}else if(param=='accurate'){
		predicate=$("#accuratePredicates").val();
	}else{
		predicate = param;
	}

	$("#PredicateSearchResultContent").empty();
	var args={"time":new Date(),"predicate":predicate};
	$.ajax({
	   async:false,
	   type: "post",
       url: "./PredicateQueryProcess.do",
       data: args,
       dataType: "json",
       success: function(data){
		for(var i = 0;i<data.length;i++){
			var subject=data[i].subject;
			var object=data[i].object;
			$("#PredicateSearchResultContent").append("<center><a href='#' onclick='getStatement(\""+subject+"\",\""+predicate+"\",\""+object+"\")'>"+subject+"<--"+predicate+"-->"+object+"</a><center>");
		}
		if(data.length==0){
			$('#PredicateSearchResultContent').append('<center><font color="red">无检索结果!</font></center>');
		}
		
	}
       
   });		
	refreshHistory('predicateSearch');
}

function timeSpaceSearch(keyword){  
	var queryResult;
	var scope='';
	
	if(keyword!=null&&keyword.indexOf("(")!=-1){
		scope=keyword.slice(keyword.indexOf("(")+1,keyword.indexOf(")"));
		keyword = keyword.slice(0,keyword.indexOf("("));
	}else{
		keyword=$("#SearchContent").val();
		scope = $("#timeScope option:selected").val();
	}

	var uri='./TimeSpaceQueryProcess.do?keyword='+keyword+'&scope='+scope;
	$(".d3_area").empty();
	queryResult = requestD3(uri);
	$('#ResultContent').empty();
	for(var i=0;i<queryResult.length;i++){
		var subject = queryResult[i].name;
		var predicate = queryResult[i].children[0].relation;
		var object = queryResult[i].children[0].name;
		$('#ResultContent').append('<center><a href="#" onclick="getStatement(\''+subject+'\','+'\''+predicate+'\','+'\''+object+'\')">'+subject+'<--'+predicate+'-->'+object+'</a></center>')
	}
	
	if(queryResult.length==0){
		$('#ResultContent').append('<center><font color="red">无检索结果!</font></center>');
	}
	refreshHistory("timeSpaceSearch");
	changeSlider(keyword,scope);
	
	$("#timeScope option").each(function(){
		if($(this).val()==scope){
			$(this).attr("selected",true);
		}else{
			$(this).attr("selected",false);
		}
	})
	
}

function changeSlider(keyword,scope){
	
	var $Slider = $("#Slider");	
	
	if(scope=="古"){
		$Slider.stop(true, true).animate({left:"11px"}, "fast");
		$("#scope_past").attr("onclick","timeSpaceSearch('"+keyword+"("+scope+")')");
	}else if(scope=="今"){
		$Slider.stop(true, true).animate({left:"49px"}, "fast");

	}else if(scope=="全"){
		$Slider.stop(true, true).animate({left:"87px"}, "fast");
	}
	$("#scope_past").attr("onclick","timeSpaceSearch('"+keyword+"(古)')");
	$("#scope_now").attr("onclick","timeSpaceSearch('"+keyword+"(今)')");
	$("#scope_whole").attr("onclick","timeSpaceSearch('"+keyword+"(全)')");
	
}