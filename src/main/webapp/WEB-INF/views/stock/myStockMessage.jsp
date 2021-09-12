<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="code" uri="http://www.ohQuest.com/jsp/tags/core" %>


<script type="text/javascript">

	//기능설명
	$(function(e) {
		
		//주식 관련 분석 메시지조회
		reStockMessageListLoad();


		//초기화시키는 부분
		$("#smsCodeMainDiv #searchDivSmsCode #mode").val("I");
		//그리드가 생성되고 난 후 리드온리를 거짓으로 입력받을수있도록 하고 리드온리폼을 제거하고 노몰폼을 집어넣는다.
		$("#smsCodeMainDiv #searchDivSmsCode  #smsCodeInputForm #evntCd").attr("readonly", false);
		$("#smsCodeMainDiv #searchDivSmsCode  #smsCodeInputForm #evntCd").removeClass("form_readonly");
		$("#smsCodeMainDiv #searchDivSmsCode  #smsCodeInputForm #evntCd").addClass("form_normal01");

		//reComStockListLoad(); //리스트나열 함수 호출
		

		//관심종목저장처리
		$("#openStock #myStockSaveBtn").click(function(e) {
		  	 
		 	var s;
			s = jQuery("#recommandStockTable").jqGrid('getGridParam','selarrrow');
			/* jQuery("#list9").jqGrid('setSelection',"13"); */
	   	 	
	   	    var selected_ids_arr = $('#recommandStockTable').jqGrid('getGridParam','selarrrow');
	   	    if(selected_ids_arr == null || selected_ids_arr == ''){
	   	 		alert('저장하고자 하는 관심종목을 선택하세요.');
	   	 		return ;
	   	 	}
	   	 
			console.log(">>>>>>>>>>> [smsPhrBySvcTable selected ids arr] ===== "+selected_ids_arr);
			//var selected_ids_arr = selected_ids.split(",");
			var savedata = [];
			for(var i=0; i< selected_ids_arr.length; i++){
 	   		$("#recommandStockTable").jqGrid('saveRow',selected_ids_arr[i]);
 	   		$("#recommandStockTable").jqGrid('restoreRow',selected_ids_arr[i],true); 
 	   		var rowData = $('#recommandStockTable').getRowData(selected_ids_arr[i]);
				if(parseInt(selected_ids_arr[i]) < 0){
					 rowData.smode = "C";
				}else{
					rowData.smode = "U";		
				} 
				 savedata.push(rowData);
			}
			console.log(">>>>>>>>>>> [recommandStockTable selected ids arr] ===== "+savedata);
			console.log(">>>>>>>>>>> [recommandStockTable selected ids arr] ===== "+JSON.stringify(savedata));
			console.log(">>>>>>>>>>> [recommandStockTable selected ids arr] ===== "+JSON.parse(JSON.stringify(savedata)));
			var list = {
					stockDayList   : savedata, 
					mode		: "evnt"
				} ;
			
			$.ajax({
				type : "POST",//포스트방식으로 
				async : true,//비동기방식인지 동기식인지
				url : baseUrl + 'stock/mystock/saveRecomm.do',
				contentType: "application/json; charset=utf-8",
				data : JSON.stringify(list),//JSON.parse(JSON.stringify(savedata)),//$("#smsCodeMainDiv #searchDivSmsCode " + vForm).serialize(),//serialize(): Encode a set of form elements as a string for submission.
				dataType : "json",
				success : function(data) {
					gf_console.log("recommandStockTable data >>>>>>>>>>>>>>>>>>> "+JSON.stringify(data));
					MessageBox.dialog(data.message);
					//$("#recommandStockTable #smsCodeByEvntSearchBtn").click();
				},
					error : function(data) {
						gf_console.log("process() error..." + JSON.stringify(data));
						//JSON.parse() : JSON형식의 문자열을 자바스크립트 객체로 만든다.
						//JSON.stringify() : 자바스크립트 객체를 JSON형식의 문자열로 만든다.
						MessageBox.dialog('<s:message code="smsCode.msg.000002"/>');
					},
					complete : function(jqXHR, textStatus) {
						
						gf_console.log("process() completed .......");
						divUnmask("#smsCodeMainDiv");
					}
			});
		});
		
		
		//매수요청 등록 팝업 화면호출
		$("#openStock #myStockAddBtn").click(function(e) {
			
			//var scCodeStatus = $("#stockContext #selectOptDiv #selectOptCodeDiv #scStatCdDiv #scStatCd").val();
			//alert(scCodeStatus);
			//return 0;
			
		 	var s;
			s = jQuery("#recommandStockTable").jqGrid('getGridParam','selarrrow');
			/* jQuery("#list9").jqGrid('setSelection',"13"); */
	   	 	
	   	    var selected_ids_arr = $('#recommandStockTable').jqGrid('getGridParam','selarrrow');
	   	    if(selected_ids_arr == null || selected_ids_arr == ''){
	   	 		alert('저장하고자 하는 관심종목을 선택하세요.');
	   	 		return ;
	   	 	}
	   	    
			Dialog.open({
				div : '#myStockAddDialog',
				url : baseUrl + "stock/mystock/save.do",
				title : '매수요청',
				width : 800,
				height : 700,
				modal : true
			});
		});		
		
		/*
		기능 : select / open할때 리스트 로드
		searchSmsCodeForm을 받아와서 검색어가 있으면 검색, 없으면 로드
		*/ 
		function reStockMessageListLoad() {
		 	gf_clearGridList("recommandStockTable"); // 테이블 그리드 클리어
			divMask("#smsCodeMainDiv #searchDivSmsCode", "Grid Loading..."); //불러오는 중에 화면을 파랗게 하는 것
			$.ajax({
						type : "GET",
						async : true,
						url : baseUrl + "stock/message/sel.do",
						data : 'html',
						dataType : "json",
						success : function(data) {
							
							if (data.list.length <= 0) {
								//MessageBox.dialog("err.nodata"); //조회 할 데이터 없음
							} else {
								//gf_addMultiGridList("#recommandStockTable",data.list);
								setMessageDisplay(data);
								
							}
							
							return 1;
						},
						error : function(data) {
							
							//JSON.parse() : JSON형식의 문자열을 자바스크립트 객체로 만든다.
							//JSON.stringify() : 자바스크립트 객체를 JSON형식의 문자열로 만든다.
							//MessageBox.dialog("firstSmsCodeLoad() Error..");
						},
						complete : function(jqXHR, textStatus) {
							divMask("#smsCodeMainDiv #searchDivSmsCode", "완료..."); //불러오는 중에 화면을 파랗게 하는 것
							return -1;
							//divUnmask("#smsCodeMainDiv #searchDivSmsCode");
							//$("#smsCodeMainDiv #searchDivSmsCode #mode").val("I"); //입력 모드로 초기화 시켜줌
							//gf_console.log("firstSmsCodeLoad() Completed..........");
						}
		    });
		}

		
		//화면에 HTML정보 생성
		function setMessageDisplay(data) {
			
		     var html = '';
		     var sType = '';
		     var sAddMessage = '';
		     var sIconType = '';
		     var foo, targetElement = document.getElementById('stockMessage');
		     foo = document.createElement('foo');
		     
			for(var i = 0 ; i < data.list.length; i++){
				rowData = data.list[i];
			
			
			
			    //div class="notify success"><span>Hello! This is an information notification.</span><span>This is the description field for more information</span><i class="fa fa-check-circle"></i></div>
			    /*message.setType("SR");        ///주식대기상태
			    message.setType("SS");        //주식 매매가능요청상태
			    message.setType("SC"); //주식취소요청상태
			    <div class="notify info"><span>1</span><i class="fa fa-info-circle"></i></div>
				<div class="notify success"><span>2</span><i class="fa fa-check-circle"></i></div>
				<div class="notify warning"><span>3</span><i class="fa fa-exclamation-triangle"></i></div>
				<div class="notify error"><span>4</span><i class="fa fa-exclamation-triangle"></i></div>
				
			    */
			    
			    if (rowData.type=="SR" || rowData.type=="BR"){ //대기
			    	/* sType = "info";
			    	sIconType = '<i class="fa fa-info-circle"></i>'; */
			    	sType = "success";
			    	sIconType = '<i class="fa fa-info-circle"></i>'; 
			    }else  if (rowData.type=="SV" || rowData.type=="BV"){  //주식 매매가능요청상태
			    	//sType = "success";
			    	//sIconType = '<i class="fa fa-check-circle"></i>'; //아이폰이 안이뻐서
			    	sType = "info";
			    	sIconType = '<i class="fa fa-check-circle"></i>';
			    }else  if (rowData.type=="SC"){  //주식취소요청상태
			    	sType = "warning";
			    	sIconType = '<i class="fa fa-exclamation-triangle"></i>';
			    }else  {  //주식분석오류
			    	sType = "error";
			    	sIconType = '<i class="fa fa-exclamation-triangle"></i>';
			    }
			    sAddMessage = '['+rowData.contCreateDate+']' + rowData.message;
			    
			    html = html + ' <div class="notify '+sType+'"">';
			    html = html + ' <span>'+sAddMessage+'</span>'+sIconType+'</div>';
			}	
			
		    foo.innerHTML = html;
		
		    targetElement.appendChild(foo);
			 
		}
		
		//그리드 테이블설정
		$("#recommandStockTable").jqGrid(
				{
					
							datatype : "local",	height : 640,	width : 770,	
							colNames : [ //이름과 모델 갯수가 맞아야한다.
							             '코드', 
							             '유형', 	//Language
							             '등록일', 	//SMS Send Phr
							             '종목명',		//Event NM
							             '시가', 	//Sys Creation Date
							             '상항가', 	//Update Date
							             '하한가', 	//Operator ID
							             'seq',
							             ],
							colModel : [ 
							       	  	{name : 'scCode',			index : 'scCode',			width : "80",		sorttype : "string",	align : 'center'},
								       	{name : 'type',			    index : 'type',		    	width : "50",		sorttype : "string",	align : 'center'},
										{name : 'statChgDate',	    index : 'statChgDate',		width : "140",		sorttype : "string",	align : 'center'},
										{name : 'scName',			index : 'scName',			    width : "120",		sorttype : "string",	align : 'center'},
										{name : 'buyVAmt',	        index : 'buyVAmt',	        width : "100",		sorttype : "long",	    align : 'center'}, 
										{name : 'hiRate',	        index : 'hiRate',	        width : "100",		sorttype : "long",	    align : 'center'}, 
										{name : 'lowRate',		    index : 'lowRate',		    width : "100",		sorttype : "long",	    align : 'center'},
										{name : 'idscMyStock',		index : 'idscMyStock',		width : "100",		sorttype : "long",	    align : 'center'},
							],
	
							 //viewrecords : true,
							multiselect : true,
							rownumbers : true,
							
							caption: "Stock List",
					        ExpandColumn: "menu",
					        autowidth: true,
					        //width: 180,
					        rowNum: 200,
					     	pager: '#pmethod',
						  /*  	rowNum:10,
						   	rowList:[10,20,30],
						   	pager: '#pmethod',
						   	sortname: 'id',
						    viewrecords: true,
						    sortorder: "desc",
						    caption:"Stock List",
						    multiselect: true, */

							//그리드 선택해서 아래로 값이 입력되면 업데이트모드로 바뀜
							onSelectRow : function(id) {
								var rowData = $('#recommandStockTable')
										.getRowData(id);

								$("#mode").val("U");

								$("#smsCodeInputForm #scCode").val(rowData.scCode);
								$("#smsCodeInputForm #evntCd").attr("readonly",true);
								$("#smsCodeInputForm #evntCd").removeClass("form_normal01").addClass("form_readonly");
								$("#smsCodeInputForm #smsSendPhr").val(rowData.smsSendPhr);
								$("#smsCodeInputForm #evntNm").val(rowData.evntNm);
								
								document.getElementById('daumRealInfo').src = "http://m.finance.daum.net/m/item/main.daum?code="+rowData.scCode;
								
							}
			});
	});
	
</script>

 <div class="gird">
   <li><i class="icon-envelope"></i>Message List</li>
 </div>
			
<div id="stockMessage"  class="col_12">
</div>	
    



