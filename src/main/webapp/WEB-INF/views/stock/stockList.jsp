<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false"%>
<% request.setCharacterEncoding("utf-8"); %>
<% response.setContentType("text/html; charset=utf-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>

<script type="text/javascript">
	//기능설명
	$(function(e) {

		//초기화시키는 부분
		$("#smsCodeMainDiv #searchDivSmsCode #mode").val("I");
		//그리드가 생성되고 난 후 리드온리를 거짓으로 입력받을수있도록 하고 리드온리폼을 제거하고 노몰폼을 집어넣는다.
		$("#smsCodeMainDiv #searchDivSmsCode  #smsCodeInputForm #evntCd").attr("readonly", false);
		$("#smsCodeMainDiv #searchDivSmsCode  #smsCodeInputForm #evntCd").removeClass("form_readonly");
		$("#smsCodeMainDiv #searchDivSmsCode  #smsCodeInputForm #evntCd").addClass("form_normal01");

		//reComStockListLoad(); //리스트나열 함수 호출
		
		$("#smsCodeMainDiv #openStock #myRecommadnBtn").click(function(e) {
	  	  reComStockListLoad(); //리스트나열 함수 호출
	    });
		
		$("#smsCodeMainDiv #searchDivSmsCode #codeSearchBtn").click(function(e) {
		  	
		  	var sText = $("#stCode").val();
		  	
		  	if(sText == null || sText == ''){
	   	 		alert('조회하고자 할 주식코드 또는 명을 입력하세요.');
	   	 		return ;
		   	}
		  	
		  	reComStockListLoad();
		  	
		  	//alert("확인"+$("#stCode").val());
		  	
		  	
		});
		
		

		//관심종목저장처리
		$("#smsCodeMainDiv #openStock #myStockSaveBtn").click(function(e) {
		  	 
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
			var sMemo = $("#stMemo").val();
			
			for(var i=0; i< selected_ids_arr.length; i++){
	 	   		$("#recommandStockTable").jqGrid('saveRow',selected_ids_arr[i]);
	 	   		$("#recommandStockTable").jqGrid('restoreRow',selected_ids_arr[i],true); 
	 	   		var rowData = $('#recommandStockTable').getRowData(selected_ids_arr[i]);
	 	   		
				if(parseInt(selected_ids_arr[i]) < 0){
					 rowData.smode = "C";
				}else{
					rowData.smode = "U";		
				}
				
				rowData.memo = sMemo;

				savedata.push(rowData);
			}
			

			console.log(">>>>>>>>>>> [recommandStockTable selected ids arr] ===== "+savedata);
			console.log(">>>>>>>>>>> [recommandStockTable selected ids arr] ===== "+JSON.stringify(savedata));
			console.log(">>>>>>>>>>> [recommandStockTable selected ids arr] ===== "+JSON.parse(JSON.stringify(savedata)));
			console.log(">>>>>>>>>>> [recommandStockTable sMemo ids sMemo] ===== "+sMemo);
			var list = {
					stockDayList   : savedata, 
					mode		: "evnt",
					memo		: sMemo
				} ;
			
			$.ajax({
				type : "POST",//포스트방식으로 
				async : true,//비동기방식인지 동기식인지
				url : baseUrl + 'stock/mystock/saveRecomm.do',
				contentType: "application/json; charset=utf-8",
				data : JSON.stringify(list),//JSON.parse(JSON.stringify(savedata)),//$("#smsCodeMainDiv #searchDivSmsCode " + vForm).serialize(),//serialize(): Encode a set of form elements as a string for submission.
				dataType : "json",
				success : function(data) {
					MessageBox.dialog(data.message);
					//alert(data.message);
					//gf_console.log("recommandStockTable data >>>>>>>>>>>>>>>>>>> "+JSON.stringify(data));
					//MessageBox.dialog(data.message);
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
		
	/* 	$("#smsCodeByEvntSaveBtn").click(function(e) {
			var selected_ids_arr = $('#smsPhrByEvntTable').jqGrid('getGridParam','selarrrow');
			console.log(">>>>>>>>>>> [smsPhrByEvntTable selected ids arr] ===== "+selected_ids_arr);
			//var selected_ids_arr = selected_ids.split(",");
			var savedata = [];
			for(var i=0; i< selected_ids_arr.length; i++){
    	   		$("#smsPhrByEvntTable").jqGrid('saveRow',selected_ids_arr[i]);
    	   		$("#smsPhrByEvntTable").jqGrid('restoreRow',selected_ids_arr[i],true); 
    	   		var rowData = $('#smsPhrByEvntTable').getRowData(selected_ids_arr[i]);
				 if(parseInt(selected_ids_arr[i]) < 0){
					 rowData.smode = "C";
				}else{
					rowData.smode = "U";
				} 
				 savedata.push(rowData);
			}
			console.log(">>>>>>>>>>> [smsPhrByEvntTable selected ids arr] ===== "+savedata);
			console.log(">>>>>>>>>>> [smsPhrByEvntTable selected ids arr] ===== "+JSON.stringify(savedata));
			console.log(">>>>>>>>>>> [smsPhrByEvntTable selected ids arr] ===== "+JSON.parse(JSON.stringify(savedata)));
			var list = {
					smsPhrByEvntList   : savedata, 
					mode		: "evnt"
				} ;
			
			$.ajax({
				type : "POST",//포스트방식으로 
				async : true,//비동기방식인지 동기식인지
				url : baseUrl + 'co/smsCode/saveSmsCode',
				contentType: "application/json; charset=utf-8",
				data : JSON.stringify(list),//JSON.parse(JSON.stringify(savedata)),//$("#smsCodeMainDiv #searchDivSmsCode " + vForm).serialize(),//serialize(): Encode a set of form elements as a string for submission.
				dataType : "json",
				success : function(data) {
					gf_console.log("smsCodeByEvntSaveBtn data >>>>>>>>>>>>>>>>>>> "+JSON.stringify(data));
					MessageBox.dialog(data.message);
					$("#smsCodeByEvntBtnForm #smsCodeByEvntSearchBtn").click();
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
		}); */
		
		$("#smsCodeMainDiv #openStock #myStockAddBtn").click(function(e) {
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
		function reComStockListLoad() {
		 	gf_clearGridList("recommandStockTable"); // 테이블 그리드 클리어
		 	
		 	var sText = $("#stCode").val();
		 	
		 	//alert(sText);
		 	
			divMask("#smsCodeMainDiv #searchDivSmsCode", "Grid Loading..."); //불러오는 중에 화면을 파랗게 하는 것
			$.ajax({
						type : "GET",
						async : true,
						url : baseUrl + "stock/stockList/sel.do",
						contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
						data : {"stCode":sText},
						dataType : "json",
						success : function(data) {
							
							if (data.list.length <= 0) {
								//MessageBox.dialog("err.nodata"); //조회 할 데이터 없음
							} else {
								gf_addMultiGridList("#recommandStockTable",data.list);
								
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
							             '상한가', 	//Update Date
							             '하한가', 	//Operator ID
							             'seq',
							             '상한율',
							             ],
							colModel : [ 
							       	  	{name : 'scCode',			index : 'scCode',			width : "80",		sorttype : "string",	align : 'center'},
								       	{name : 'type',			    index : 'type',		    	width : "50",		sorttype : "string",	align : 'center'},
										{name : 'siteRegDt',	    index : 'siteRegDt',		width : "140",		sorttype : "string",	align : 'center'},
										{name : 'name',			    index : 'name',			    width : "120",		sorttype : "string",	align : 'center'},
										{name : 'siRate',	        index : 'siRate',	        width : "100",		sorttype : "long",	    align : 'center'}, 
										{name : 'hiRate',	        index : 'hiRate',	        width : "100",		sorttype : "long",	    align : 'center'}, 
										{name : 'lowRate',		    index : 'lowRate',		    width : "100",		sorttype : "long",	    align : 'center'},
										{name : 'idscMyStock',		index : 'idscMyStock',		width : "100",		sorttype : "long",	    align : 'center'},
										{name : 'upPs',		        index : 'upPs',	        	width : "100",		sorttype : "long",	    align : 'center'},
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

								document.getElementById('daumRealInfo').src = "http://m.stock.naver.com/item/main.nhn#/stocks/"+rowData.scCode+"/total";
							}
				});
	});
	

	


</script>

<div id="smsCodeMainDiv" class="grid">
    <div class="gird">
		    <li><i class="icon-search"></i>Serch</li>
    </div>
          
	<div id="searchDivSmsCode" class="grid">
		

	          <div class="col_12 visible">
	          
	       <%--   <input type="checkbox" name="toggle" class="sw" id="toggle-2">
             <label for="toggle-2"><span>With a little label</span> </label>    --%>
	          
			<!-- <fieldset>
			<legend>Naver Info</legend>
			<input type="checkbox" id="check1" /> <label for="check1" class="inline">골든크로스        </label>
			<input type="checkbox" id="check2" /> <label for="check2" class="inline">갭상승         </label>
			<input type="checkbox" id="check3" /> <label for="check3" class="inline">20일이동평균         </label>
			</fieldset> -->
				          
		      Search :<input  type="text5" id="stCode" name="stCode" />
		      <button class="medium" id="codeSearchBtn"><i class="icon-search"></i> 필터</button><br />
		      </div>
		
		
	</div>	
	
		 <div id="openStock"  class="grid">
		     <%--  <span class="btns3 save"><input type="button" id="myRecommadnBtn" name="myRecommadnBtn" value="관심종목조회"></span>
		      <span class="btns3 save"><input type="button" id="myStockSaveBtn" name="myStockSaveBtn" value="관심종목저장"></span> --%>
		       <button class="inset" id="myRecommadnBtn"><i class="icon-search"></i> 관심종목조회 </button>
		       <button class="inset" id="myStockSaveBtn"><i class="icon-plus-sign"></i> 관심종목저장  </button>
		       <i class="icon-comment-alt"></i>  메모 :<input  type="text5" id="stMemo" name="stMemo" />
		</div>
		
		<div class="gird">
            <li><i class="icon-bell"></i> Stock List</li>
		</div>
		
		
		<div id="stockList"  class="col_6">
		  <table id="recommandStockTable"></table>
	    </div>
	    <div id="mydivid"  class="col_6">
	     <iframe id="daumRealInfo" src="http://m.stock.naver.com/sise/siseList.nhn?menu=market_sum&sosok=0" width="100%" height="600"></iframe>
	    </div>

</div>
