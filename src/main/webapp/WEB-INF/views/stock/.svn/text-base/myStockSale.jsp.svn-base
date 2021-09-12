<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="code" uri="http://www.ohQuest.com/jsp/tags/core" %>


<script type="text/javascript">

function selectEvent(selectObj) {
   // alert(selectObj.value + "가 선택 되었습니다.");
   var sMode = selectObj.value;
    $("#mStatCd").val(sMode);
    
    //주식 상태에 따른 버튼 제어처리
    /*  
	       <button class="inset" id="myStockCancle"><i class="icon-remove"></i> 취소 </button>
	       <button class="inset" id="myStockAddBtn"><i class="icon-signin"></i> 매수요청 </button>
    */
	$("#openStock #myStockCancle").show();
    $("#openStock #myStockAllow").show();
	$("#openStock #myStockAddBtn").show();
	
    //WC	관심목록취소,BC	매수 취소, SR	매도완료, SC	매도 취소
    if (sMode == 'WC' || sMode == 'BC' || sMode == 'SR' || sMode == 'SC'){
    	//$("#openStock #myStockAddBtn").text("test"); 
    	$("#openStock #myStockCancle").hide();
    	$("#openStock #myStockAllow").hide();
    	
    	$("#openStock #myStockAddBtn").hide();
    // WR	관심목록	
    } else if (sMode == 'WR')  {
    	$("#openStock #myStockAddBtn").text("매수요청");
    //BV	매수요청	
    } else if (sMode == 'BV')  {
    	$("#openStock #myStockAddBtn").text("매수결정");
    //BR	매수완료	
    } else if (sMode == 'BR')  {
    	$("#openStock #myStockCancle").hide();
    	$("#openStock #myStockAddBtn").text("매도요청");    	
    //SV	매도요청
    } else if (sMode == 'SV')  {
    	$("#openStock #myStockAddBtn").text("매도결정");       	
    }
    
}

Date.prototype.yyyymmdd = function()
{
    var yyyy = this.getFullYear().toString();
    var mm = (this.getMonth() + 1).toString();
    var dd = this.getDate().toString();


    return yyyy + (mm[1] ? mm : '0'+mm[0]) + (dd[1] ? dd : '0'+dd[0]);
}


function load() {
    //최초 상태는 관심종목조회
    $("#stockContext #selectOptDiv #selectOptCodeDiv #scStatCdDiv #scStatCd").val("WR"); //WR : wish 리스트 등록
    $("#mStatCd").val("WR");
    
    console.log((new Date()).yyyymmdd());

    $("#inDate").val((new Date()).yyyymmdd());
    
    //alert("xxxx");
    //reComStockListLoad();
    //alert("end");
}
window.onload = load;

	//기능설명
	$(function(e) {
		
		
		CODE.clear(); //기존에 가져온 코드데이타를 clear한다.
		CODE.push("SCSTATCD"); //조회하고자 하는 코드그룹을 설정한다.
		CODE.server(); 
		
		


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

			console.log(">>>>>>>>>>> [recommandStockTable selected ids arr] ===== "+sStatCd);
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
	   	    
	   	    var sMode = $("#mStatCd").val();
	   	    var sTitle = "";
	   	
	       //WC	관심목록취소,BC	매수 취소, SR	매도완료, SC	매도 취소
	       if (sMode == 'WR')  {
	    	   sTitle = "매수요청"; 
	       //BV	매수요청	
	       } else if (sMode == 'BV')  {
	    	   sTitle = "매수결정";
	       //BR	매수완료	
	       } else if (sMode == 'BR')  {
	    	   sTitle = "매도요청";
	       //SV	매도요청
	       } else if (sMode == 'SV')  {
	    	   sTitle = "매도결정";
	       }
	   	    
			Dialog.open({
				div : '#myStockAddDialog',
				url : baseUrl + "stock/mystock/save.do?statCd="+sMode+"&realYN=R",
				title : sTitle,
				width : 800,
				height : 700,
				modal : true
			});
		});		
		
		//선택한주식의 상태를 최초처리함.
		$("#openStock #myStockCancle").click(function(e) {
			
			if (!confirm("정말로 취소하시겠습니다?"))retrun;
			
			var jobType       = $("#mRealYN").val();
			var tobeSelCount  = $("#mSelCount").val();          //선택건수
	        var savedata = [];
			
			var selected_ids_arr = $('#recommandStockTable').jqGrid('getGridParam','selarrrow');
			
	        //해당 필드의 나눠서 값을 지정
	        for (var i=0; i< selected_ids_arr.length; i++){
		    	
		   		var rowData = $('#recommandStockTable').getRowData(selected_ids_arr[i]);
	 	   		var sMode = rowData.scStatCd;
			 	   	
		        //WC	관심목록취소,BC	매수 취소, SR	매도완료, SC	매도 취소
		        if (sMode == 'WR')  {
		    	   rowData.scStatCd = "WC"; //관심종목취소	
		        //BV	매수요청	
		        } else if (sMode == 'BV')  {
		    	   rowData.scStatCd = "BC"; //매수취소
		        //BR	매수완료	
		        //} else if (sMode == 'BR')  {
		        // 	   rowData.scStatCd = "BV"; //매수요청
		        //SV	매도요청
		        } else if (sMode == 'SV')  {
		    	   rowData.scStatCd = "BR"; //매수완료
		        }
	 	   		
	 	   		//주식 상태 변경처리	  
				savedata.push(rowData);
				
	        }
	        
	        console.log(">>>>>>>>>>> [recommandStockTable selected ids arr] ===== "+savedata);
			console.log(">>>>>>>>>>> [recommandStockTable selected ids arr] ===== "+JSON.stringify(savedata));
			console.log(">>>>>>>>>>> [recommandStockTable selected ids arr] ===== "+JSON.parse(JSON.stringify(savedata)));
		        
			var list = {
					myStockList   : savedata, 
					mode		: "evnt"
				} ;
			
			 $.ajax({
				type : "POST",//포스트방식으로 
				async : true,//비동기방식인지 동기식인지
				url : baseUrl + 'stock/mystock/saveStockChgStatCd.do',
				contentType: "application/json; charset=utf-8",
				data : JSON.stringify(list),//JSON.parse(JSON.stringify(savedata)),//$("#smsCodeMainDiv #searchDivSmsCode " + vForm).serialize(),//serialize(): Encode a set of form elements as a string for submission.
				dataType : "json",
				success : function(data) {
					//gf_console.log("recommandStockTable data >>>>>>>>>>>>>>>>>>> "+JSON.stringify(data));
					alert(data.message);
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
	    					
						//MessageBox.dialog('성공적으로 완료했습니다.');
						Dialog.close('#myStockAddDialog');  //종료처리
					}
			}); 
		});				
		
			
		
		//선택한주식의 상태를 최초처리함.
		$("#openStock #myStockAllow").click(function(e) {
			
			if (!confirm("정말로 매매를 허락하시겠습니다?"))retrun;
			
			var jobType       = $("#mRealYN").val();
			var tobeSelCount  = $("#mSelCount").val();          //선택건수
	        var savedata = [];
			
			var selected_ids_arr = $('#recommandStockTable').jqGrid('getGridParam','selarrrow');
			
	        //해당 필드의 나눠서 값을 지정
	        for (var i=0; i< selected_ids_arr.length; i++){
		    	
		   		var rowData = $('#recommandStockTable').getRowData(selected_ids_arr[i]);
	 	   		var sMode = rowData.scStatCd;
			 	   	
		        //WC	관심목록취소,BC	매수 취소, SR	매도완료, SC	매도 취소
		        if (sMode == 'WR')  {
		    	   rowData.buyAllowYn = "Y"; //매도 강제 승인	
		        //BR	매수완료	
		        } else if (sMode == 'BR')  {
		        // rowData.saleAllowYn = "Y"; //매도 강제 승인
		        }
	 	   		
	 	   		//주식 상태 변경처리	  
				savedata.push(rowData);
				
	        }
	        
	        console.log(">>>>>>>>>>> [recommandStockTable selected ids arr] ===== "+savedata);
			console.log(">>>>>>>>>>> [recommandStockTable selected ids arr] ===== "+JSON.stringify(savedata));
			console.log(">>>>>>>>>>> [recommandStockTable selected ids arr] ===== "+JSON.parse(JSON.stringify(savedata)));
		        
			var list = {
					myStockList   : savedata, 
					mode		: "allow"
				} ;
			
			 $.ajax({
				type : "POST",//포스트방식으로 
				async : true,//비동기방식인지 동기식인지
				url : baseUrl + 'stock/mystock/saveStockChgStatCd.do',
				contentType: "application/json; charset=utf-8",
				data : JSON.stringify(list),//JSON.parse(JSON.stringify(savedata)),//$("#smsCodeMainDiv #searchDivSmsCode " + vForm).serialize(),//serialize(): Encode a set of form elements as a string for submission.
				dataType : "json",
				success : function(data) {
					//gf_console.log("recommandStockTable data >>>>>>>>>>>>>>>>>>> "+JSON.stringify(data));
					alert(data.message);
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
	    					
						//MessageBox.dialog('성공적으로 완료했습니다.');
						Dialog.close('#myStockAddDialog');  //종료처리
					}
			}); 
		});					
		
		//조회버튼 클릭
		$("#stockContext #selectOptDiv #selectOptCodeDiv #scStatCdDiv #smsCodeSearchBtn").click(function(e) {
			reComStockListLoad();
		});	
		
		
		/*
		기능 : select / open할때 리스트 로드
		searchSmsCodeForm을 받아와서 검색어가 있으면 검색, 없으면 로드
		*/ 
		function reComStockListLoad() {
			
			
			var sStatCd = $("#stockContext #selectOptDiv #selectOptCodeDiv #scStatCdDiv #scStatCd").val();
			
			$("#mStatCd").val(sStatCd);
			//alert($("#mStatCd").val());
			var sText = $("#stCode").val();
			var sInDate = $("#inDate").val();
			
			
		 	gf_clearGridList("#recommandStockTable"); // 테이블 그리드 클리어
			divMask("#smsCodeMainDiv #searchDivSmsCode", "Grid Loading..."); //불러오는 중에 화면을 파랗게 하는 것
			$.ajax({
						type : "GET",
						async : true,
						url : baseUrl + "stock/mystock/sel.do?statCd="+sStatCd+"&scCode="+sText+"&inDate="+sInDate,
						data : $("#smsCodeSearchForm").serialize(),
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

		
		function onChangeStatCd(){
			alert("xxxxxx");
			  var myselect = document.getElementById("scStatCd");
			  alert(myselect.options[myselect.selectedIndex].value);
		}
		
		//그리드 테이블설정
		$("#recommandStockTable").jqGrid(
				{
					
							datatype : "local",	height : 640,	width : 770,	
							colNames : [ //이름과 모델 갯수가 맞아야한다.
							             '코드',
							             '종목명',		//Event NM
							             '등록일', 	//SMS Send Phr
							             '요청가', 	
							             '매수가',
							             '요청가',
							             '매도가',
							             '유형', 	//Update Date
							             '상태', 	//Operator ID
							             'seq',
							             '최종시가',
							             '요율',
							             '승인',
							             ],
							colModel : [ 
							       	  	{name : 'scCode',			index : 'scCode',			width : "80",		sorttype : "string",	align : 'center'},
										{name : 'scName',			index : 'scName',			    width : "120",		sorttype : "string",	align : 'center'},
										{name : 'statChgDate',	    index : 'statChgDate',		width : "140",		sorttype : "string",	align : 'center'},
										{name : 'buyVAmt',	        index : 'buyVAmt',	        width : "100",		sorttype : "long",	    align : 'center'}, 
										{name : 'buyRAmt',	        index : 'buyRAmt',	        width : "100",		sorttype : "long",	    align : 'center'},
										{name : 'saleVAmt',	        index : 'saleVAmt',	        width : "100",		sorttype : "long",	    align : 'center'}, 
										{name : 'saleRAmt',	        index : 'saleRAmt',	        width : "100",		sorttype : "long",	    align : 'center'},
										{name : 'jobType',	        index : 'jobType',	        width : "100",		sorttype : "long",	    align : 'center'}, 
										{name : 'scStatCd',		    index : 'scStatCd',		    width : "100",		sorttype : "long",	    align : 'center'},
										{name : 'idscMyStock',		index : 'idscMyStock',		width : "100",		sorttype : "long",	    align : 'center'},
										{name : 'lastAmt',		    index : 'lastAmt',		width : "100",		sorttype : "long",	    align : 'center'},
										{name : 'salePocyValue',	index : 'salePocyValue',		width : "100",		sorttype : "long",	    align : 'center'},
										{name : 'buyAllowYn',	    index : 'buyAllowYn',		width : "100",		sorttype : "string",	    align : 'center'},
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
	
<!-- 변수지정 -->
<input type="hidden" id="mSelCount" name="mSelCount">
<input type="hidden" id="mTotalAmt" name="mTotalAmt">
<input type="hidden" id="tobe_grtmnAmt" name="tobe_grtmnAmt">
<input type="hidden" id="tobe_creditAmt" name="tobe_creditAmt">
<input type="hidden" id="mStatCd" name="mStatCd">


<div id="stockContext"  class="col_12">
	<div id="selectOptDiv" class="col_12">
        <li><i class="icon-search"></i>Serch</li>
	
		
          <div id="selectOptCodeDiv" class="col_12">
	
 
          <div id="scStatCdDiv"  class="grid">
           Date :<input  type="text" id="inDate" name="inDate" />
          
                      상태코드<input name="searchKey" type="hidden" value="SCSTATCD" />
				<select class="form_normal01" id="scStatCd" name="scStatCd" style="width: 100px" onChange="javascript:selectEvent(this)">
					<!--  <option value="">Choose</option> -->
					<code:out codeType="SCSTATCD" value="en" option="listbox" />
				</select>
          
		      Search :<input  type="text" id="stCode" name="stCode" />
		      <button class="medium" id="smsCodeSearchBtn"><i class="icon-search"></i> 조회</button><br />
                
		      
	      </div>
	    </div>  

		<div class="gird">
            <li><i class="icon-bell"></i> Stock List</li>
		</div>
		
	</div>

	 <div id="openStock"  class="col_12">
	      <%-- <span class="btns3 save"><input type="button" id="myStockAddBtn" name="myStockAddBtn" value="매수요청 "></span>
	      <span class="btns3 save"><input type="button" id="myStockAddBtn" name="myStockAddBtn" value="매수결정"></span>
	      <span class="btns3 save"><input type="button" id="myStockAddBtn" name="myStockAddBtn" value="매도요청"></span>
	      <span class="btns3 save"><input type="button" id="myStockAddBtn" name="myStockAddBtn" value="매도결정"></span> --%>
	      
	       <button class="inset" id="myStockCancle"><i class="icon-thumbs-down"></i>매매취소 </button>
	       <button class="inset" id="myStockAllow"><i class="icon-thumbs-up"></i>매매허락</button>
	       <button class="inset" id="myStockAddBtn"><span><i class="icon-signin"></i></span>매수요청 </button>
	        
	</div>
	
	<div id="myStockList"  class="col_6">
		<table id="recommandStockTable"></table>
	</div>
	<div id="mydivid"  class="col_6">
	     <iframe id="daumRealInfo" src="http://m.stock.naver.com/sise/siseList.nhn?menu=market_sum&sosok=0" width="100%" height="600"></iframe>
	</div>
</div>	
    



