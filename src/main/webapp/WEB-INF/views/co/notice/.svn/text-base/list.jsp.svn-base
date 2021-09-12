<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:set value="${ss_member}" var="user"/>
<script type="text/javascript">
    

	
	
	$("#myTodoTable").mouseover(function(e){
	    $(this).css("cursor","pointer");
	});

	jQuery("#myTodoTable").jqGrid({        
		//data : JSON.parse($("#myTodoListJson").val()),
		datatype: "local",
		colNames: [ 
		            
		            '<s:message code="ar.ar1.label.000001"/>',//Type
		            '<s:message code="ccs.ccsWork003_120318.workerTaskTable.lable.000001"/>',//Work Details
		            '<s:message code="bs.bsArManage.grid.000015"/>',//Receipt Date
		            '<s:message code="ccs.csCccs000.taskHistoryListTable.lable.ScheduledDate"/>',//
		            '<s:message code="cs.lable.cug.000048"/>',//Cust No
		            '<s:message code="cs.label.000046"/>',//Subscriber Id
		            '<s:message code="cs.lable.cug.000058"/>',//Cust Name
		            '<s:message code="ccs.csCccs000.taskHistoryListTable.lable.Custphone"/>',//Cust phone
		            '<s:message code="ar.ar22.label.000010"/>',//Address

		            ],
		colModel: [
		   			  {name:'gubun', index:'gubun', width:'80'}
		          	, {name:'activityDesc', index:'activityDesc', width:'120'}
		          	
		          	, {name:'regDate', index:'regDate', width:'110'}
		          	, {name:'hopeDate', index:'hopeDate', width:'100'}
		          	, {name:'custNo', index:'custNo', width:'80'}
		          	, {name:'entrNo', index:'entrNo', width:'80'}
		          	
		          	, {name:'counselName', index:'counselName', width:'200'}		          
		          	, {name:'counselTel', index:'counselTel', width:'80'}
		          	, {name:'fullAddr', index:'fullAddr', width:'300'}
		          	
		          	
		      	  ],
		sortable: true,
		height: '200',
		width: '960',
		multiselect: false,
	   	viewrecords: true,
	   	shrinkToFit: false,
	  //Row를 더블 클릭했을경우 발생하는 이벤트
	   	ondblClickRow : function(rowid, iRow, iCol,e){
	   		var rowData=$("#noticeListForm #myTodoTable").getRowData(rowid);
	   		
	   	     //화면 오픈여부 체크후의 로직
	   		//구분값이 COUNSEL일경우(Search Sub's 로 연결...)
	   		if(rowData.gubun == "COUNSEL"){  
	   			
	   			//$("[menuId=searchSubscriber]").click();
		   		if(rowData.entrNo == null || rowData.entrNo == "" || rowData.entrNo == "&nbsp;"){//subscribeID가 우선이 되어야한다. (subscribeId가없을경우 custNO로 조회)
		   			if(rowData.custNo == null || rowData.custNo == "" ||rowData.custNo == "&nbsp;"){
		   				//둘다 없는 경우는 리턴
		   				return;
		   			}else{
	   				//custno가 있는경우
		   				if ($('[workareaname=searchSubscriber]').length > 0){ 
				   			//화면이 열려있는경우(right메뉴의 workareaname 속성명 체크)
				   			//열려 있다면 셀선택값(custno인지 subscriberid 인지 체크해서 조회를 태운다.)
			   				$("[menuId=searchSubscriber]").click();
			   				$("#subscriptionCustomerSearchForm #searchKey").val("CUSTID");//콤보셋팅(아직 코드값이없음..20131316)
							$("#subscriptionCustomerSearchForm #searchValue_1").val(rowData.custNo);//조회조건셋팅
							$("#subscriptionCustomerSearchForm #searchBtn").click();//조회버튼클릭
							Dialog.close('#${param.dialogName}'); //조회후 화면을 닫는다.
				   			
				   		}else{
				   		//화면이 열려있지 않은 경우는 화면 오픈	
				   			createMainWorkArea('searchSubscriber',
												$("<a href=\"#\" id=\"menuClick\" menuId=\"searchSubscriber\" ><U>S</U>earch Sub's</a>"), 
												baseUrl+'resources/images/common/left/csCust000.gif',
												baseUrl+"cs/csCust000?dialogName=dialogContent");
				   			
			   				
		   					setTimeout(function(){
				   				$("#subscriptionCustomerSearchForm #searchKey").val("CUSTID");//콤보셋팅(아직 코드값이없음..20131316)
								$("#subscriptionCustomerSearchForm #searchValue_1").val(rowData.custNo);//조회조건셋팅
								$("#subscriptionCustomerSearchForm #searchBtn").click();//조회버튼클릭
				   			},500);
						   			
				   			
							Dialog.close('#${param.dialogName}'); //조회후 화면을 닫는다.
				   		}
			   			
	   				}
	   			}else{
	   				//subscribeId가있는경우 값셋팅
	   				if ($('[workareaname=searchSubscriber]').length > 0){ 
			   			//화면이 열려있는경우(right메뉴의 workareaname 속성명 체크)
			   			//열려 있다면 셀선택값(custno인지 subscriberid 인지 체크해서 조회를 태운다.)
		   				$("[menuId=searchSubscriber]").click();
	   					$("#subscriptionCustomerSearchForm #searchKey").val("ENTR");
						$("#subscriptionCustomerSearchForm #searchValue_1").val(rowData.entrNo);//조회조건셋팅
						$("#subscriptionCustomerSearchForm #searchBtn").click();//조회버튼클릭
						Dialog.close('#${param.dialogName}'); //조회후 화면을 닫는다.
			   			
			   		}else{
			   		//화면이 열려있지 않은 경우는 화면 오픈	
			   			createMainWorkArea('searchSubscriber',
											$("<a href=\"#\" id=\"menuClick\" menuId=\"searchSubscriber\" ><U>S</U>earch Sub's</a>"), 
											baseUrl+'resources/images/common/left/csCust000.gif',
											baseUrl+"cs/csCust000?dialogName=dialogContent");
			   			
			   			setTimeout(function(){
			   				$("#subscriptionCustomerSearchForm #searchKey").val("ENTR");
							$("#subscriptionCustomerSearchForm #searchValue_1").val(rowData.entrNo);//조회조건셋팅
							$("#subscriptionCustomerSearchForm #searchBtn").click();//조회버튼클릭
			   			},500);
			   			
			   			
						Dialog.close('#${param.dialogName}'); //조회후 화면을 닫는다.
			   		
			   			
			   		}
	   				
	   			}
		   	//구분값이 ORDER 인경우 (TASK > TASK Task Receipt로 연결)
	   		}else if(rowData.gubun == "ORDER"){
	   			if(rowData.entrNo != null || rowData.entrNo != "" || rowData.entrNo != "&nbsp;"){
		   			Dialog.open({
						div : '#ccsWork001Dialog',
						url : baseUrl + "ccs/ccsWork001"
								+ "?dialogName=ccsWork001Dialog&req_entrno="+rowData.entrNo,
						title : '<s:message code="cmn.label.TaskReceipt"/>',//
						width : 1030,
						height : 685,
						modal : true
					});
		   			Dialog.close('#${param.dialogName}'); //조회후 화면을 닫는다.}
	   			}else{
	   				Dialog.open({
						div : '#ccsWork001Dialog',
						url : baseUrl + "ccs/ccsWork001"
								+ "?dialogName=ccsWork001Dialog",
						title : '<s:message code="cmn.label.TaskReceipt"/>',//
						width : 1030,
						height : 685,
						modal : true
					});
		   			Dialog.close('#${param.dialogName}'); //조회후 화면을 닫는다.}
	   			}
	   		//구분값이 WORK인 경우(TASK > Mytask로 연결)	
	   		}else{
	   			if(rowData.entrNo != null || rowData.entrNo != "" || rowData.entrNo != "&nbsp;"){
	   				
		   			Dialog.open({
						div : '#ccsWork003Dialog',
						url : baseUrl + "ccs/ccsWork003_1"
								+ "?dialogName=ccsWork003Dialog&req_entrno="+rowData.entrNo,
						title :'<s:message code="cmn.label.MyTask"/>',//
						width : 1127,
						height : 690,
						modal : true
					});
   				
		   			Dialog.close('#${param.dialogName}'); //조회후 화면을 닫는다.}
	   				
	   			}else{
	   				Dialog.open({
						div : '#ccsWork003Dialog',
						url : baseUrl + "ccs/ccsWork003_1"
								+ "?dialogName=ccsWork003Dialog",
						title :'<s:message code="cmn.label.MyTask"/>',//
						width : 1127,
						height : 690,
						modal : true
					});
   				
		   			Dialog.close('#${param.dialogName}'); //조회후 화면을 닫는다.}
	   			}
	   		}
	   	}
	   	,afterInsertRow : function(rowid) {
        	var rowData = $('#noticeListForm #myTodoTable').getRowData(rowid);
        	
        	var tomorrow = gf_getGapDate(1);
        	if ( rowData.hopeDate!=null && rowData.hopeDate!=''){
	    		var hopeDate = rowData.hopeDate.replace("-","").replace("-","");
	    		tomorrow = tomorrow.replace("-","").replace("-","");
	    		if (Number(hopeDate) - Number(tomorrow)  < 0){
	    			$("#myTodoTable [id="+rowid+"]").css("background", "#fdecca");
	    		}
        	}
        	
	 	}

	});
	
	
	
	
	$("[id=noticeList]").click(function(e) {
			Dialog.open({
				div:'#noticeViewDialog',
				url : baseUrl + "notice/noticeView/"+$(this).attr("mode")+"?dialogName=noticeViewDialog",
				title : '<s:message code="cmn.label.notice"/>',//
				width : 760,
				height :450,
				modal : true
		  });
	});
	
	$("#seeMore").click(function(e) {
		e.preventDefault();
		Dialog.open({
			div : '#noticeDialog',
			url : baseUrl + "notice/notice_detail"
					+ "?dialogName=noticeDialog",
			title : '<s:message code="cmn.label.notice"/>',
			width : 810,
			height : 600,
			modal : true
		});

	});
	
	
	
	try{
	    var myWorkJobListListData = JSON.parse($("#myTodoListJson").val());
	    if(myWorkJobListListData != null){
			for(var i=0;i<myWorkJobListListData.length;i++){
				if(myWorkJobListListData[i].hopeDate!=null && myWorkJobListListData[i].hopeDate !=''  ){
					myWorkJobListListData[i].hopeDate = myWorkJobListListData[i].hopeDate.substr(0,4)+"-"+myWorkJobListListData[i].hopeDate.substr(4,2)+"-"+myWorkJobListListData[i].hopeDate.substr(6,2);
	    		} 
				var receiptDate = "";
				if ( myWorkJobListListData[i].regDate!=null && myWorkJobListListData[i].regDate !='' ){
					receiptDate = gf_getTodayDate2(myWorkJobListListData[i].regDate,"-");
					myWorkJobListListData[i].regDate = receiptDate;
				}
				jQuery("#myTodoTable").jqGrid('addRowData',i+1,myWorkJobListListData[i]);
			}
	    }
	
	}catch(exception){
	} 
	
	function delayTime(){
	}
	
	
	
	//그리드 Cell에 마우스를 올렸을때 발생하는 이벤트
	$('#myTodoTable .jqgrow').mouseover(function(e) {
			var rowId = $(this).attr('id');
		    $("#myTodoTable [id="+rowId+"]").css("background","#DADADA");
		}); 
	//그리드 Cell에 마우스가 벗어났을때 발생하는 이벤트
	$('#myTodoTable .jqgrow').mouseout(function(e) {
			var rowId = $(this).attr('id');
			var rowData = $("#myTodoTable").getRowData(rowId);
			var hopeDate = rowData.hopeDate.replace("-","").replace("-","");
			var tomorrow = gf_getGapDate(1);
			tomorrow = tomorrow.replace("-","").replace("-","");
	if ( hopeDate!=null && hopeDate!=''&&hopeDate!='&nbsp;'){
		if (Number(hopeDate) - Number(tomorrow)  < 0){
			$("#myTodoTable [id="+rowId+"]").css("background","#fdecca");
			
		}else{
			$("#myTodoTable [id="+rowId+"]").css("background","#FFFFFF");
		}
	}else{
		$("#myTodoTable [id="+rowId+"]").css("background","#FFFFFF");
	}

	});
	
	
</script>
<form id="noticeListForm">
	<div id="wrap">
		<div class="main_box_1">
			<h1><s:message code="cmn.label.mytodolist"/></h1>
			<div class="h1_btn">
				<%-- <span class="btns2 save"><input type="submit"
					value="More" /></span> --%>
			</div>
			<div class="con">
				<table class="main_list_01_1" border="0" frame="hsides" rules="none"
					bordercolor="#dfdfdf" id="myTodoTable" name="myTodoTable">
					<textarea id="myTodoListJson" name="myTodoListJson" style="display:none">${myTodoList}</textarea>
				</table>
			</div>
		</div>
		<div class="main_box_1">
			<h1><s:message code="cmn.label.notice"/></h1>
			<div class="h1_btn">
				<span class="btns2 save"><input type="submit" value='<s:message code="cmn.btn.seeMore"/>' id="seeMore"></span>
			</div>
			<div class="con">
				<table class="main_list_02_1" border="0" frame="hsides" rules="none"
					bordercolor="#dfdfdf">
					<col width="80%" />
					<col width="20%" />
					<c:choose>
						<c:when test="${not empty list}">
							<c:forEach var="list" items="${list}" varStatus="listIndex">
								<c:if test="${listIndex.index<9 }">
									<tr>
										<td><input type="hidden" id="seqNo" name="seqNo" value="${list.seqNo }"><a href="#" id="noticeList" mode="${list.seqNo }"><font color="${list.titleColor}">${list.title}</font></a></td>
										<td class="date"><fmt:formatDate pattern="yyyy/MM/dd"
												value="${list.nDate}" /></td>
									</tr>
								</c:if>
							</c:forEach>

						</c:when>
					</c:choose>
				</table>
			</div>
		</div>
		
		
	</div>

			
</form>