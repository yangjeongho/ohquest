/**
 * textarea 생성
 *
 * id:textarea id
 * name: textarea name
 * target: 부착할 id
 ***/
function txtAreaAppend(id,name,target){
	
	$(target).append($("<textArea id=" + id + " name="+name+">"));
	$("#"+id).css("display","none");
}
/**
 * 
 * span생성
 * selector: $(""),
 * attr:{id:"",name:"",class:""}
 * 
 * **/
function spanAppend(selector,attr){
	
	var spanSel= $("<span>");
	
	spanSel.attr(attr);
	
	selector.append(spanSel);
}

/**
	input type text생성
 * selector: $(""),
 * attr:{id:"",name:"",class:""}
 * 
 * **/
function inputTextAppend(selector,attr){
	
	
	var inputSel= $("<input>");
	inputSel.attr(attr);
	selector.append(inputSel);
	
}

/**
 * btn생성
 * selector: $(""),
 * attr:{id:"",name:"",class:""}
 * **/
function btnAppend(selector,attr){
	
	var btnSel = $("<button>");
	
	btnSel.attr(attr);
	btnSel.text(attr.value);
	
	selector.append(btnSel);
}

/**
 * btn생성
 * selector: $(""),
 * attr:{id:"",name:"",class:""}
 * **/
function divAppend(selector,attr){
	
	var divSel = $("<div>");
	
	divSel.attr(attr);
	
	selector.append(divSel);
}

function dymAppend(selector,attr,tag){
	
	var selCash = $(tag);

	selCash.attr(attr);
	
	selector.append(selCash);
}


/**
 * depth1 테이블 생성
 *
 ***/
function tableAppend(tableSelector,jsonArray){
	
	var tableSel = $(tableSelector);
	$.each(jsonArray,function(key,data){
		
		var label = data["label"];
		var name  = data["name"];
		var value = data["value"];
		var type  = data["type"];
		var trSel = $("<tr>");
		var thSel = $("<th>");
	    var tdSel = $("<td>");
	    var inputSel = $("<input>");
	    
		inputSel.attr({
		  	type:type,
		  	id:"rt"+name,
		  	name: name,
		   	class:"form_readonly",
		   	style:"width:90%;",
		   	readonly:true,
		   	value:value
		   });
		 thSel.attr({
			style:"width:150px;" 
		 });
		if(type != "hidden"){
			    
				thSel.text(label);
			    tdSel.append(inputSel);
			    trSel.append(thSel).append(tdSel);
			    tableSel.append(trSel);
	    
	    }//hidden일경우
		else{
			
			tableSel.append(inputSel);
	    }
		
	});
	
}

//생각중 버릴까 말까
function sHeight768(dialogSel){
	
	var sHeight=0;
	var dialogHeight = 0;
	var dialogWidth = 0;
//	var dialogHeight = parseInt($(dialogSel).height());
//	var dialogWidth = parseInt($(dialogSel).width());
	sHeight = screen.height;
	dialogHeight = parseInt($(dialogSel).height());
	dialogWidth = parseInt($(dialogSel).width());
	/*$(window).resize(function() {
	});*/
	console.log($(window));   // returns height of browser viewport
	console.log($(document)); // returns height of HTML document
	console.log($(window).height());   // returns height of browser viewport
	console.log($(document).height()); // returns height of HTML document
		if(sHeight <= 768){
			if(dialogHeight >= 580){
				
				$(dialogSel).height("580");
				$(dialogSel).width(dialogWidth+5);
			}
			
		}
		
		console.log("sHeight");
		console.log(sHeight);
		console.log(dialogHeight);
}
