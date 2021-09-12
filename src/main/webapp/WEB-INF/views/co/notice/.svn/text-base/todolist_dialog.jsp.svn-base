<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MyTodoList</title>
</head>
<script type="text/javascript">
		$("#dialTodoTable").mouseover(function(e){
		    $(this).css("cursor","pointer");	       	        	
		});

		jQuery("#dialTodoListForm #dialTodoTable").jqGrid({        
			//data : JSON.parse($("#myTodoListJson").val()),
			datatype: "local",
			colNames: [ '<s:message code="ar.ar1.label.000001"/>',// Type
			            '<s:message code="ccs.ccsWork003_120318.workerTaskTable.lable.000001"/>',//'Work Details', 
			            '<s:message code="bs.bsArManage.grid.000015"/>',//'Receipt Date',
			            '<s:message code="ccs.csCccs000.taskHistoryListTable.lable.ScheduledDate"/>',//'Scheduled Date',
			            '<s:message code="cs.lable.cug.000048"/>',//'Cust No',
			            '<s:message code="cs.label.000046"/>',//'Subscriber Id',
			            '<s:message code="cs.lable.cug.000058"/>',//'Cust Name',
			            '<s:message code="ccs.csCccs000.taskHistoryListTable.lable.Custphone"/>',//'Cust phone', 
			            '<s:message code="ar.ar22.label.000010"/>',//'Address'
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
			height: '300',
			width: '870',
			multiselect: false,
		   	viewrecords: true,
		   	shrinkToFit: false,
		   	//Row를 더블 클릭했을경우 발생하는 이벤트
		   	ondblClickRow : function(rowid, iRow, iCol,e){
		   		var rowData=$("#dialTodoListForm #dialTodoTable").getRowData(rowid);
		   		
		   	    //화면 오픈여부 체크후의 로직
		   		//구분값이 COUNSEL일경우(Search Sub's 로 연결...)
		   		if(rowData.gubun == "COUNSEL"){  
			   		if(rowData.entrNo == null || rowData.entrNo == "" || rowData.entrNo == "&nbsp;"){//subscribeID가 우선이 되어야한다. (subscribeId가없을경우 custNO로 조회)
			   			if(rowData.custNo == null || rowData.custNo == "" ||rowData.custNo == "&nbsp;"){
			   				//둘다 없는 경우는 리턴
			   				return;
			   			}else{
		   				//custno가 있는경우
		   				    if ($('[workareaname=searchSubscriber]').length > 0){ 
		   				    	$("[menuId=searchSubscriber]").click();
		   				    	$("#dialTodoListForm #gubunKey").val("COUNSEL");
					   			$("#subscriptionCustomerSearchForm #searchKey").val("CUSTID");//콤보셋팅(아직 코드값이없음..20131316)
								$("#subscriptionCustomerSearchForm #searchValue_1").val(rowData.custNo);//조회조건셋팅
								$("#subscriptionCustomerSearchForm #searchBtn").click();//조회버튼클릭
		   				    }else{
		   				    	createMainWorkArea('searchSubscriber',
										$("<a href=\"#\" id=\"menuClick\" menuId=\"searchSubscriber\" ><U>S</U>earch Sub's</a>"), 
										baseUrl+'resources/images/common/left/csCust000.gif',
										baseUrl+"cs/csCust000?dialogName=dialogContent");
		   				    	
		   				    	setTimeout(function(){
		   				    		$("#dialTodoListForm #gubunKey").val("COUNSEL");
						   			$("#subscriptionCustomerSearchForm #searchKey").val("CUSTID");//콤보셋팅(아직 코드값이없음..20131316)
									$("#subscriptionCustomerSearchForm #searchValue_1").val(rowData.custNo);//조회조건셋팅
									$("#subscriptionCustomerSearchForm #searchBtn").click();//조회버튼클릭
					   			},500);
		   				    }
		   					
							Dialog.close('#${param.dialogName}'); //조회후 화면을 닫는다.
		   				}
		   			}else{
		   				//subscribeId가있는경우 값셋팅
		   				if ($('[workareaname=searchSubscriber]').length > 0){ 
		   					$("[menuId=searchSubscriber]").click();
		   					$("#dialTodoListForm #gubunKey").val("COUNSEL");
			   				$("#dialTodoListForm #searchKey").val("ENTR"); 
			   				$("#dialTodoListForm #searchValue").val(rowData.entrNo);
			   				$("#subscriptionCustomerSearchForm #searchKey").val("ENTR");
							$("#subscriptionCustomerSearchForm #searchValue_1").val(rowData.entrNo);//조회조건셋팅
							$("#subscriptionCustomerSearchForm #searchBtn").click();//조회버튼클릭
		   				}else{
		   					createMainWorkArea('searchSubscriber',
									$("<a href=\"#\" id=\"menuClick\" menuId=\"searchSubscriber\" ><U>S</U>earch Sub's</a>"), 
									baseUrl+'resources/images/common/left/csCust000.gif',
									baseUrl+"cs/csCust000?dialogName=dialogContent");
		   					setTimeout(function(){
		   						$("#dialTodoListForm #gubunKey").val("COUNSEL");
				   				$("#dialTodoListForm #searchKey").val("ENTR"); 
				   				$("#dialTodoListForm #searchValue").val(rowData.entrNo);
				   				$("#subscriptionCustomerSearchForm #searchKey").val("ENTR");
								$("#subscriptionCustomerSearchForm #searchValue_1").val(rowData.entrNo);//조회조건셋팅
								$("#subscriptionCustomerSearchForm #searchBtn").click();//조회버튼클릭
				   			},500);
		   					
		   				}
		   				
		   				
						Dialog.close('#${param.dialogName}'); //조회후 화면을 닫는다.
		   			}
			   	//구분값이 ORDER 인경우 (TASK > TASK Task Receipt로 연결)
		   		}else if(rowData.gubun == "ORDER"){
		   			if(rowData.entrNo != null || rowData.entrNo != "" || rowData.entrNo != "&nbsp;"){
		   				if(rowData.entrNo){
				   			Dialog.open({
								div : '#ccsWork001Dialog',
								url : baseUrl + "ccs/ccsWork001"
										+ "?dialogName=ccsWork001Dialog&req_entrno="+rowData.entrNo,
								title : '<s:message code="cmn.label.TaskReceipt"/>',
								width : 1030,
								height : 685,
								modal : true
							});
				   			Dialog.close('#${param.dialogName}'); //조회후 화면을 닫는다.}
		   				}
		   			}
		   		//구분값이 WORK인 경우(TASK > Mytask로 연결)	
		   		}else{
		   			if(rowData.entrNo != null || rowData.entrNo != "" || rowData.entrNo != "&nbsp;"){
		   				if(rowData.entrNo){
				   			Dialog.open({
								div : '#ccsWork003Dialog',
								url : baseUrl + "ccs/ccsWork003_1"
										+ "?dialogName=ccsWork003Dialog&req_entrno="+rowData.entrNo,
								title : '<s:message code="cmn.label.MyTask"/>',//
								width : 1127,
								height : 690,
								modal : true
							});
		   				
				   			Dialog.close('#${param.dialogName}'); //조회후 화면을 닫는다.}
		   				}
		   			}
		   		}
		   	}
		});
		
		try{
		    var dialWorkJobListListData = JSON.parse($("#dialTodoListForm #dialTodoListJson").val());
		    if(dialWorkJobListListData != null){
				for(var i=0;i<dialWorkJobListListData.length;i++){
					
			        	
			        var check = false;	
			        var j= i+1;
		        	var tomorrow = gf_getGapDate(1);
		        	if ( dialWorkJobListListData[i].hopeDate!=null && dialWorkJobListListData[i].hopeDate!=''){
			    		var hopeDate = dialWorkJobListListData[i].hopeDate.replace("-","").replace("-","");
			    		tomorrow = tomorrow.replace("-","").replace("-","");
			    		if (Number(hopeDate) - Number(tomorrow)  < 0){
			    			check = true;
			    		}
		        	}
				 	
					if(dialWorkJobListListData[i].hopeDate!=null && dialWorkJobListListData[i].hopeDate !=''  ){
						dialWorkJobListListData[i].hopeDate = dialWorkJobListListData[i].hopeDate.substr(0,4)+"-"+dialWorkJobListListData[i].hopeDate.substr(4,2)+"-"+dialWorkJobListListData[i].hopeDate.substr(6,2);
		    		} 
					
					var receiptDate = "";
					if ( dialWorkJobListListData[i].regDate!=null && dialWorkJobListListData[i].regDate !='' ){
						receiptDate = gf_getTodayDate2(dialWorkJobListListData[i].regDate,"-");
						dialWorkJobListListData[i].regDate = receiptDate;
					}
					jQuery("#dialTodoTable").jqGrid('addRowData',i+1,dialWorkJobListListData[i]);
					if ( check ){
						$("#dialTodoTable [id="+j+"]").css("background", "#fdecca");
					}
				}
		    }
		
		}catch(exception){
		}
		
		
		//그리드 Cell에 마우스를 올렸을때 발생하는 이벤트
		$('#dialTodoListForm #dialTodoTable .jqgrow').mouseover(function(e) { 
   			var rowId = $(this).attr('id');
   		    $("#dialTodoTable [id="+rowId+"]").css("background","#DADADA");
   		}); 
		//그리드 Cell에 마우스가 벗어났을때 발생하는 이벤트
		$('#dialTodoListForm #dialTodoTable .jqgrow').mouseout(function(e) {
   			var rowId = $(this).attr('id');
   			var rowData = $("#dialTodoTable").getRowData(rowId);
	   		var hopeDate = rowData.hopeDate.replace("-","").replace("-","");
	   		var tomorrow = gf_getGapDate(1);
			tomorrow = tomorrow.replace("-","").replace("-","");
			if ( hopeDate!=null && hopeDate!=''&&hopeDate!='&nbsp;'){
				if (Number(hopeDate) - Number(tomorrow)  < 0){
					$("#dialTodoTable [id="+rowId+"]").css("background","#fdecca");
					
				}else{
					$("#dialTodoTable [id="+rowId+"]").css("background","#FFFFFF");
				}
			}else{
				$("#dialTodoTable [id="+rowId+"]").css("background","#FFFFFF");
			}

   		});
		
		
		$("#closeNoticeBtn").click(function(e){
			Dialog.close('#rightTodoDialog');	
		});
</script>
<body>
<form id="dialTodoListForm">
<input type="hidden" id="gubunKey" name="gubunKey" value=""/>
<input type="hidden" id="searchKey" name="searchKey" value=""/>
<input type="hidden" id="searchValue" name="searchValue" value=""/>
<div class="contents_box">
	<div class="con">
		<table class="main_list_01_1" border="0" frame="hsides" rules="none" bordercolor="#dfdfdf" id="dialTodoTable" name="dialTodoTable" width="800">
			<textarea id="dialTodoListJson" name="dialTodoListJson" style="display:none">${myTodoList}</textarea>
		</table>
	</div>
</div>
 <div class="contents_box mt_5 both">
	<%-- <div class="f_left">
		<span class="btns3 save"><input type="button" value="SORT" id="todoListSortBtn"/></span>
	</div> --%>
	<div class="f_right">
		<%-- <span class="btns3 save"><input type="button" value='<s:message code="cmn.btn.search"/>'  id="todoCustSearchBtn"/></span> --%>
		<span class="btns9 save"> <input type="button" value="<s:message code="cmn.btn.close"/>" id="closeNoticeBtn" /></span>
	</div>
</div> 
</form>
</body>
</html>