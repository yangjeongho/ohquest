<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>

<script type="text/javascript">
	//기능설명
$(function(e) {
	
	    reloadAccountInfo();
		
		function reloadAccountInfo(){
			//$("#csvUploadBtn").loadingDialog();
			
		 //alert("stae11111r");
		 
			$.ajax({
				
				
				 type : "GET",  
				 async : true,
				 url : baseUrl + 'account/summaryInfo.do',
				 contentType: "application/json",
				 //data : $("#accountSummaryForm").serializeArray(),
		   		 dataType : 'json',
		   		 success : function(data) {
					   //alert("step 1");
					   //consol.
					   console.log(data);
					   //MessageBox.alert( "잘될까.1111");
					   var sAccount = data["account"];
					   var htmlTag = data["htmlTag"];
					   var sH2Tag = "<h1>"+ sAccount.acDesc +"</h1>";
					   //MessageBox.alert( "잘될까."+ sAcDesc);
					   $("#containerMain").hide().empty().append(htmlTag).show();
					   
					 //  MessageBox.error( "err.500");
					  //alert("step2");
					/* $("#workReportListTable").hide().empty().append(data).show(); */
					 //$("#tableTabPage").empty().append(data);
				  },
				   error:function(data){
					  // alert("ㅌㅌㅌㅌㅌ");
					   MessageBox.error(data, "err.500");
				   },
				   complete:function(jqXHR, textStatus){
					  // alert("step 두두두두두두두두");
					  //alert("step 2"+accountInfo.acDesc);
					 //if ( $("#AcceptDate").val()!=''){					
						//  $("#AcceptDate").val($("#AcceptDate").val().substr(0,4)+"-"+$("#AcceptDate").val().substr(4,2)+"-"+$("#AcceptDate").val().substr(6));
					// }
		            //if ( $("#counselEndDttm").val( )!='' ){
					//	$("#counselEndDttm").val($("#counselEndDttm").val().substr(0,4)+"-"+$("#counselEndDttm").val().substr(4,2)+"-"+$("#counselEndDttm").val().substr(6));
			         //}
		  			  /*   $("#counselDtilCd").val(counselDtilCd);
					 	$("#AcceptDate").val(regdate); 
						$("#counselEndDttm").val(counselEndDttm);  */
				   }
				});
		}
		

        //초회처리		
		$("#smsCodeMainDiv #openStock #myRecommadnBtn").click(function(e) {
			accountDetailListLoad(); //리스트나열 함수 호출
	    });



		
		//그리드 테이블설정
		$("#accountHistTable").jqGrid(
				{
					
							datatype : "local",	height : 640,	width : 770,	
							colNames : [ //이름과 모델 갯수가 맞아야한다.
							             '잔고', 
							             '입금', 	
							             '출금', 	
							             '등록일',	
							             '코드', 	
							             '종목명', 	
							             '매수수량', 	
							             '매수금액',
							             '매도수량',
							             '매도금액',
							             'seq',
							             ],
							colModel : [ 
							       	  	{name : 'balance',			index : 'balance',			width : "100",		sorttype : "string",	align : 'center'},
								       	{name : 'incomeAmt',		index : 'incomeAmt',		width : "100",		sorttype : "string",	align : 'center'},
										{name : 'outgoAmt',	        index : 'outgoAmt',	 	    width : "100",		sorttype : "string",	align : 'center'},
										{name : 'contCreateDate',	index : 'contCreateDate',	width : "130",		sorttype : "string",	align : 'center'},
										{name : 'scCode',	        index : 'scCode',	        width : "90",		sorttype : "long",	    align : 'center'}, 
										{name : 'scName',	        index : 'scName',	        width : "130",		sorttype : "long",	    align : 'center'}, 
										{name : 'buyRCount',		index : 'buyRCount',		width : "100",		sorttype : "long",	    align : 'center'},
										{name : 'buyRAmt',		    index : 'buyRAmt',		    width : "100",		sorttype : "long",	    align : 'center'},
										{name : 'saleRCount',		index : 'saleRCount',		width : "100",		sorttype : "long",	    align : 'center'},
										{name : 'saleRAmt',		    index : 'saleRAmt',	        width : "100",		sorttype : "long",	    align : 'center'},
										{name : 'idscMyStock',		index : 'idscMyStock',	    width : "100",		sorttype : "long",	    align : 'center'},
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
							}
				});
	});
	
/*
ACCODE	VCASH	KR		가상계좌(현금)
ACCODE	VSTOC	KR		가상계좌(주식)
ACCODE	RCASH	KR		실현금
ACCODE	RSTOC	KR		실주식*/

function accountCallFunVCASH() {
	accountDetailListLoad("VCASH");	
}

function accountCallFunVSTOC() {
	accountDetailListLoad("VSTOC");	
}
function accountCallFunRCASH() {
	accountDetailListLoad("RCASH");	
}
function accountCallFunRSTOC() {
	accountDetailListLoad("RSTOC");	
}

/*
기능 : select / open할때 리스트 로드
searchSmsCodeForm을 받아와서 검색어가 있으면 검색, 없으면 로드
*/ 
function accountDetailListLoad(acCode) {
	     
	//alert("accountDetailListLoad XXXXXXXXXXXXXXXXXXXXXXXXX"+acCode);
	
 	gf_clearGridList("#accountHistTable"); // 테이블 그리드 클리어
	divMask("#accountCodeMainDiv", "Grid Loading..."); //불러오는 중에 화면을 파랗게 하는 것
	$.ajax({
				type : "GET",
				async : true,
				url : baseUrl + "account/history/sel.do"+"?acCode="+acCode,
				data : $("#accountCodeMainDiv").serialize(),
				dataType : "json",
				success : function(data) {
					
					if (data.list.length <= 0) {
						//MessageBox.dialog("err.nodata"); //조회 할 데이터 없음
					} else {
						gf_addMultiGridList("#accountHistTable",data.list);
						
					}
					return 1;
				},
				error : function(data) {
					
					//JSON.parse() : JSON형식의 문자열을 자바스크립트 객체로 만든다.
					//JSON.stringify() : 자바스크립트 객체를 JSON형식의 문자열로 만든다.
					//MessageBox.dialog("firstSmsCodeLoad() Error..");
				},
				complete : function(jqXHR, textStatus) {
					divMask("#accountCodeMainDiv", "완료..."); //불러오는 중에 화면을 파랗게 하는 것
					return -1;
					//divUnmask("#smsCodeMainDiv #searchDivSmsCode");
					//$("#smsCodeMainDiv #searchDivSmsCode #mode").val("I"); //입력 모드로 초기화 시켜줌
					//gf_console.log("firstSmsCodeLoad() Completed..........");
				}
			}); 
}	
	


</script>

<div id="containerMain"></div>

<div id="accountCodeMainDiv" class="grid">
		
		<div class="gird">
            <li><i class="icon-bell"></i> Account Info</li>
		</div>
		
		<table id="accountHistTable"></table>
	
</div>

