<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript">

var gCounselPushTime = '';
var gPsvErrPushTime = '';

$(function(e){
	
	initLoad();
	
	$("#setMyMenuClick").live("click", function(e){
		if(eval("window.clickMenu_setMyMenu") != null){
			$("#${param.dialogName}").loadingDialog();
			var menuFunction= eval("clickMenu_setMyMenu");
			menuFunction($(this)); 
			$("#myMenuBtn").prev().hide();
		}else{
			//alert("function clickMenu_"+menuId +"()이 정의 되지 않았습니다. 확인 하십시요.!!");
		}
	});
	
});

function initLoad() {
	//$("#${param.dialogName}").loadingDialog();
	$.ajax({ 
    	type : "POST",  
    	url: baseUrl + "poll/getCounselWorkOrder", 
    	success: function(data){
	        //Update your dashboard gauge
	        var cntData = (data.list);
			
			var cnt = 0;
			var msgTodo = "";
			var pollGubun = "";
	        for(var i = 0; i < cntData.length; i++) {
	        	var todoCnt = 0;
				todoCnt = parseInt(cntData[i].pollCnt);
				cnt = cnt  + parseInt(cntData[i].pollCnt);
				pollGubun = cntData[i].pollGubun;
				
				if (pollGubun == "COUNSEL") msgTodo = msgTodo + " Counsel :: " + todoCnt;
				if (pollGubun == "ORDER") msgTodo = msgTodo + " Order :: " + todoCnt;
				if (pollGubun == "WORK") msgTodo = msgTodo + " Task :: " + todoCnt;
			}
	        $("#todoList").text(cnt);
	        $("#msgTodo").text("Todo Count :: " + msgTodo);
	        window.document.title = window.document.title +"(Todo :: "+ cnt + ")";
	        
   		}, 
   		dataType: "json"
   	}); 
}

/*우측 to-do 개수 클릭하면 TODO List Popup 호출 */
 function clickTodo(obj){	
	 
	/*  if($("#noticeListForm #myTodoTable").length > 0){
		 MessageBox.dialog("<s:message code="mytodo.msg.000001"/>"); //co_message
	 }else{   */
		//화면에 MytodoList 그리드가 없는 경우에만 Dialog 창 호출 
		 Dialog.open({
				div : '#rightTodoDialog',
				url : baseUrl + "notice/dialog_todolist"
						+ "?dialogName=rightTodoDialog",
				title : "<s:message code="cmn.label.mytodolist"/>",
				width : 900,
				height : 400,
				modal : true
			});
		/* //todoList 오픈할시 searchSubscriber 가열려 있지 않은 경우에는 화면 오픈 2013.03.16 
		 if ($('[workareaname=searchSubscriber]').length > 0){ 
	   			//화면이 열려있는경우(right메뉴의 workareaname 속성명 체크)
	   			//열려 있다면 셀선택값(custno인지 subscriberid 인지 체크해서 조회를 태운다.)
	   		}else{
	   		//화면이 열려있지 않은 경우는 화면 오픈	
	   			createMainWorkArea('searchSubscriber',
									$("<a href=\"#\" id=\"menuClick\" menuId=\"searchSubscriber\" ><U>S</U>earch Sub's</a>"), 
									baseUrl+'resources/images/common/left/csCust000.gif',
									baseUrl+"cs/csCust000?dialogName=dialogContent");
	   		
	   			$("#dialTodoListForm #openCheck").val("open");
	   			
	   		}  */
	/*  }  */
	 return;
	
 }


/* 
 (function poll(){
    $.ajax({ 
    	type : "POST",  
    	url: baseUrl + "poll/getCounselWorkOrder", 
    	success: function(data){
	        //Update your dashboard gauge
	        var cntData = (data.list);
			
			var cnt = 0;
			var msgTodo = "";
			var pollGubun = "";
	        for(var i = 0; i < cntData.length; i++) {
	        	var todoCnt = 0;
				gf_console.log(cntData[i]);
				todoCnt = parseInt(cntData[i].pollCnt);
				cnt = cnt  + parseInt(cntData[i].pollCnt);
				pollGubun = cntData[i].pollGubun;
				
				if (pollGubun == "COUNSEL") msgTodo = msgTodo + " Counsel Count :: " + todoCnt;
				if (pollGubun == "ORDER") msgTodo = msgTodo + " Order Count :: " + todoCnt;
				if (pollGubun == "WORK") msgTodo = msgTodo + " Task Count :: " + todoCnt;
			}
	        $("#todoList").text(cnt);
	        $("#msgTodo").text(msgTodo);
	        
   		}, 
   		dataType: "json" ,
   		complete: poll, 
   		timeout: 30000 
   	});
})(); 
 */
function reloadTodoCount(){
	 var vpush = '';
	 if (vpush == "Y") {
		$.ajax({ type : "POST",  
	    	url: baseUrl + "poll/getCounselWorkOrder", 
	    	success: function(data){
		        //Update your dashboard gauge
		        var cntData = (data.list);
				
				var cnt = 0;
				var msgTodo = "";
				var pollGubun = "";
		        for(var i = 0; i < cntData.length; i++) {
		        	var todoCnt = 0;
					todoCnt = parseInt(cntData[i].pollCnt);
					cnt = cnt  + parseInt(cntData[i].pollCnt);
					pollGubun = cntData[i].pollGubun;
					
					if (pollGubun == "COUNSEL") msgTodo = msgTodo + " Counsel :: " + todoCnt;
					if (pollGubun == "ORDER") msgTodo = msgTodo + " Order :: " + todoCnt;
					if (pollGubun == "WORK") msgTodo = msgTodo + " Task :: " + todoCnt;
				}
		        $("#todoList").text(cnt);
		        $("#msgTodo").text("Todo Count :: " + msgTodo);
		        window.document.title = window.document.title +"(Todo :: "+ cnt + ")";
	    }, dataType: "json"});
	 }
}
 
function checkPvsErr(){
	var vpush = '';
	if (vpush == "Y") {
		$.ajax({ type : "GET",  
	    	url: baseUrl + "co/evntLngk/pvsLnkgErr",
	    	dataType: "json",
	    	success: function(data){
		        var message = '';
		        if(data){
		        var eventCd = data.eventCd;
		        var entrNo = data.entrNo;
		         message = 'PVS ERROR : Event: '+eventCd+'['+entrNo+']';
		        }
		        $("#topPvsErrText").text(message);
	    	}
		});
	}
}

var count = 0;
function pvsErrView(message) { 
	var blink = $("#topPvsErrText");
	for (var i=0; i < blink.length; i++) 
		if(count%2 == 0 ){
			$("#topPvsErrText").css("color","red");
		}else{
			$("#topPvsErrText").css("color","black	");
		}
	count ++;
	}

setInterval(checkPvsErr,gPsvErrPushTime);
setInterval(pvsErrView,800); 

$("#topPvsErrText").click(function(e){
	
	if ($("#topPvsErrText").text != null) {
		Dialog.open({
			div : '#eventPvsView',
			url : baseUrl + "co/eventLnkg/pvsView"
					+ "?dialogName=eventPvsView",
			title : "Pvs View",
			width : 1000,
			height : 480, 
			modal : true
		});
	}
});



setInterval(reloadTodoCount, gCounselPushTime); // 30000
 
/*  (function poll(){
	   setTimeout(function(){
	      $.ajax({ url: "server", success: function(data){
	        //Update your dashboard gauge
	        salesGauge.setValue(data.value);

	        //Setup the next poll recursively
	        poll();
	      }, dataType: "json"});
	  }, 30000);
	})();
  */
$(document).ready(function(){
	pfMyMenuList();
});

function pfMyMenuList(profileId) {
	
	// 
	
	var htmlString ="";
	$('#prmUserLinkListSearchForm #searchProfileId').val(profileId);
	
	$.ajax({
		type : "POST",  
		async : true,
		url : baseUrl + "or/user/getMyMenuInfoList",
		dataType : 'json',
		data : $("#prmUserLinkListSearchForm").serializeArray(),		
		dataType:"json",
		success : function(data) {
			gf_console.log(data);
			for(var i = 0; i < data.myMenuInfoList.length; i++) {
				//jQuery("#OrUser001Table").jqGrid('addRowData', profileTableRow+1, data.myMenuInfoList[i]);
				htmlString +=("<li><a href=\"#\" class=\"menulink\" menuId=\""+data.myMenuInfoList[i].menuId+"\">"+data.myMenuInfoList[i].description+"</a></li>");
 			}
			
			$("#my_menu").html(htmlString);
		},
		error:function(data){
			alert(failMessage);
		}
	});	
	
}
</script>

<aside id="asideMenuArea">
	<!-- My Menu //-->
	<div class="my_menu_box">
		<p><a href="#" id="setMyMenuClick" menuId="setMyMenu" ><img src="<s:url value="/resources/images/mymenu/top_title.gif"/>"  alt="My Menu" /></a></p>
		<ul class="my_menu" id="my_menu">
		    <sec:myMenuView/>
		</ul>
		<p class="bottom"></p>
	</div>
	<!--// My Menu -->

	<a href="#" id="myMenuBtn" ><img src="<s:url value="/resources/images/common/left_arr.gif"/>" /></a>
	<div class="todo"><a href="#" onclick="clickTodo(this);"id="todoList">0</a></div>
	
</aside>