<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="code" uri="http://www.ohQuest.com/jsp/tags/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<script type="text/javascript" src="<s:url value="/resources/lib/jquery/plugins/jqueryForm/jquery.form.js"/>"></script>
<script  type="text/javascript" src="<s:url value="/resources/javascript/common/util.js"/>"></script>
<script type="text/javascript">
 var balanceAmt ="";
 var mbalanceAmt = '${balanceAmt}';
 
	//판매유형변경 시 코드 상한 요율정보변경
	function selectJobType() {
		//var sMode = $("#divSubMain #divBuyCode #scBuyType").val(); 
	    var sMode = $("#mStatCd").val();
	  // ${balanceAmt} = 10000;
	 
	   //var sMode = selectObj.value;
	   
	   //판매유형
	   fretrieveJobRate(sMode);
	   
	   var jobTypeRate1 = ${jobTypeRate};
	   
	   //alert(jobTypeRate1);
	   
		for (var i=0; i< selected_ids_arr.length; i++){
			var num = 0;
			
 	   		var rowData = $('#recommandStockTable').getRowData(selected_ids_arr[i]);
 	   		
 	   	   if (sMode == 'BR')  {
		       num = Number(rowData.buyRAmt);
		       num =  num + (num * (Number(jobTypeRate1)/100));
		    
		       $("#divSubMain #mylist #divStockList"+i+" #divStock6"+i+" #text1baseStockAmt"+i).val(num);
		    }
		}
	   
	   
	
	   
	}
	
	//서버에서 정책의 상한값을 jsp파일에 적용.
	function fretrieveJobRate(sMode) {
		   //alert(sMode+ "가 선택 되었습니다.");
		   //alert("${balanceAmt}"+ "가 선택 되었습니다.");
		   
		   //'${balanceAmt}' = 100;
		 
		   
		$.ajax({
					type : "GET",
					async : true,
					url : baseUrl + "stock/policyRate/sel.do?sMode="+sMode+"&realYN="+$("#mRealYN").val(),
					data : 'html',
					dataType : "json",
					success : function(data) {
						//return 1;
						 //alert("${balanceAmt}"+ "가 되었습니다.");
						//console.log(">>>>>>>>>>> [  data ] ===== "+data.balanceAmt);
						 $("#divSubMain #divTotalAmt #balanceR").val(data.balanceAmt);
						 $("#divSubMain #myAccount #balance").val(data.balanceAmt);
					},
					error : function(data) {
						// alert( "xxxxx가 되었습니다.");
					},
					complete : function(jqXHR, textStatus) {
					  //  return -1;
						 //alert($("#authType").val() +"${balanceAmt}"+ "가 되었습니다.");
					
						 
					}
				}); 
	}	
	

	//gird 초기화 및 page초기화
	function modelInit(form, table){
		$("#"+form).find("[id=totalCnt]").text(0);
		$("#"+form).find("[id=currentCnt]").text(0);
		$("#"+table).jqGrid("clearGridData", true);
		$("#"+form +" #page").val(0);

		//호출할 화면상에에서 체크한 리스트 조회 후 화면 표시
	 	var s;
		s = jQuery("#recommandStockTable").jqGrid('getGridParam','selarrrow');
		/* jQuery("#list9").jqGrid('setSelection',"13"); */
		
		
   	 	
   	    var selected_ids_arr = $('#recommandStockTable').jqGrid('getGridParam','selarrrow');
		
       // alert(   	' ${authType}');
        
       /*  var btn = document.createElement("BUTTON");        // Create a <button> element
        var t = document.createTextNode("CLICK ME");       // Create a text node
        btn.appendChild(t);                                // Append the text to <button>
        document.body.appendChild(btn);                    // Append <button> to <body>
        
	   	 var s = ' <div class="speech"> 정보확인</div> ';
		  // DOM
		 /*  var el1 = document.createElement(s);
		  // prototype
		  var el2 = new Element(s);
		  $('#mylist').appendChild(el1);
		  $('#mylist').appendChild(el2); */
		  
	/* 	  $('#myStockAddDialog #searchDivSmsCode #mylist').insert(s);
		  $('#myStockAddDialog #searchDivSmsCode #mylist').insert(s);
		  $('#myStockAddDialog #searchDivSmsCode #mylist').insert(s);  */
		  
	      
		    var foo, targetElement = document.getElementById('mylist');
		  	    //  alert(   	'step 2.1');
		    
		    foo = document.createElement('foo');
		     var html = '';
		     
		     $("#mSelCount").val(selected_ids_arr.length);
		     $("#mRealYN").val("R");
		     
		   
		     var sMode = $("#mStatCd").val();
		 	    var sTitle = "";
			   	
	       //WC	관심목록취소,BC	매수 취소, SR	매도완료, SC	매도 취소
	       if (sMode == 'WR')  {
	    	   sTitle = "매수"; 
	       //BV	매수요청	
	       } else if (sMode == 'BV')  {
	    	   sTitle = "매수";
	       //BR	매수완료	
	       } else if (sMode == 'BR')  {
	    	   sTitle = "매도";
	       //SV	매도요청
	       } else if (sMode == 'SV')  {
	    	   sTitle = "매도";
	       }
	       
	       
			for(var i=0; i< selected_ids_arr.length; i++){
				
	 	   		//$("#recommandStockTable").jqGrid('saveRow',selected_ids_arr[i]);
	 	   		//$("#recommandStockTable").jqGrid('restoreRow',selected_ids_arr[i],true); 
	 	   		var rowData = $('#recommandStockTable').getRowData(selected_ids_arr[i]);

	 	   //	alert(rowData.idohMember);	
		 	   console.log(">>>>>>>>>>> [smodelInit rowData===== "+rowData);
		 	   console.log(">>>>>>>>>>> [smodelInit rowData===== "+rowData.idohMember);
		 	   console.log(">>>>>>>>>>> [smodelInit buyRAmt===== "+rowData.buyVAmt);
		 	   console.log(">>>>>>>>>>> [smodelInit SaleVAmt===== "+rowData.saleVAmt);
		 	 
		 	   		
						// savedata.push(rowData);
				//targetElement.appendChild(foo)
				var num = rowData.buyVAmt;
				var jobTypeRate1 = ${jobTypeRate};
				
				//alert(jobTypeRate1);
	
			    if (sMode == 'WR')  {
			       sTitle = "매수"; 
			       num = rowData.buyVAmt;
			    //BV	매수요청	
			    } else if (sMode == 'BV')  {
			       sTitle = "매수";
			       num = rowData.buyVAmt;
			    //BR	매수완료	
			    } else if (sMode == 'BR')  {
			    	
			       sTitle = "매도";
			       num = Number(rowData.buyRAmt);
			       num =  num + (num * (Number(jobTypeRate1)/100));
			       
			    //SV	매도요청
			    } else if (sMode == 'SV')  {
			       sTitle = "매도";
			       num = rowData.saleVAmt;
			    }
			    num = parseInt(num);
			
			   
				html = html + ' <div id="divStockList'+i+'" class="col_12">';
				html = html + ' <div class="col_6">';
				html = html + ' <div class="speech"><li><i class="icon-tag"></i>['+rowData.scCode+']'+rowData.scName+''+'</li> </div> ' ;
				html = html + ' </div>';
				html = html + ' <div id="divStock6'+i+'" class="col_6">';
				html = html + ' <pre>';
				//최초선택한 시가
				html = html + ' <label><span>요청액</span></label>';
				html = html + ' <input id="text1baseStockAmt'+i+'" name="text1baseStockAmt"'+i+' type="text"  value="'+num.format()+'" size="7"/>';
				//투자금액
				html = html + ' <label><span>투자금</span></label>';
				html = html + ' <input id="text2SelStockAmt'+i+'" name="text2SelStockAmt"'+i+'type="text" size="8" /><br/>';
				//실 요청 수량
				html = html + ' <label><span>'+sTitle+'건</span></label>';
				html = html + ' <input id="text3SelStockCount'+i+'" name="text4SelStockCount"'+i+'type="text" size="7" />';
				//실 요청 단가
				html = html + ' <label><span>'+sTitle+'금</span></label>';
				html = html + ' <input id="text4SelStockCost'+i+'" name="text4SelStockCost"'+i+'type="text" size="8" /><br/>';
				html = html + ' </pre> ';
				html = html + ' </div>';
				html = html + ' </div>'; 
				//html = html + ' <hr class="alt2" />';
				
				
				//alert(rowData.scCode);
				
			}
			
		    foo.innerHTML = html;
            /*  +
           '<a href="#" onclick="return !!alert(this.innerHTML)">Text of <b>A 2</b>.</a> '+
           '<hr size="1" />' */
			// Append 'foo' element to target element
			targetElement.appendChild(foo);
           
          /*   var sbalanFormat = ${balanceAmt};
            
    	 	$("#myAccount #balance").val(sbalanFormat.format()); */
    	 	
            //balance.
            
            //${balanceAmt} = sbalanFormat.format();
            

		                    
		    // Add event
		    //foo.firstChild.onclick = function() { return !!alert(this.target) }
		    //while (foo.firstChild) {
		        // Also removes child nodes from 'foo'
		      //  targetElement.insertBefore(foo.firstChild, foo)
		   // }
		    // Remove 'foo' element from target element
		    //targetElement.removeChild(foo)
		    


	}

	
	
	$(function(e){
		
		//jqgrid 초기화
		modelInit("noticeSearchForm", "noticeTable");
		//noticeGridAjaxCall(baseUrl + "notice/notice_detailgrid","noticeSearchForm", "noticeTable");
		
		<%-- 권한이 일반 유저인 경우는 contentTable,New,update,delete버튼을  숨겨줌.--%>
		if('${authType}' == 'User'){
			//$("#noticeRegForm #contentTable").hide();
			$("#noticeRegForm #newNoticeBtn").hide();
			$("#noticeRegForm #modifyNoticeBtn").hide();
			$("#noticeRegForm #deleteNoticeBtn").hide();
			//$("#noticeRegForm #viewNoticeBtn").show();
			 
		}else if('${authType}' == 'Manager'){
			<%-- 권한이 관리자인경우는 다보여줌--%>
			$("#noticeRegForm #contentTable").show();
			$("#noticeRegForm #newNoticeBtn").show();
			$("#noticeRegForm #modifyNoticeBtn").show();
			$("#noticeRegForm #deleteNoticeBtn").show();
		}
	});

	



	
		$("#noticeTable").mouseover(function(e){
		    $(this).css("cursor","pointer");
		}); 
	
	
	



		

	//자동 매수금액 설정
	$("#divSubMain #divbtn #newAutoAmt").click(function(e) {
		//var totalamt      = "${balanceAmt}".commaExcl();    //콤마제거
		var totalamt      = $("#divSubMain #divTotalAmt #balanceR").val().commaExcl();    
		
        var tobeSelCount  = $("#mSelCount").val();          //선택건수
        var divAmt = Number(totalamt)/Number(tobeSelCount); 
         
        
		//var tobe_expryDt       = $("#ResellerForm_M #expryDt").val();     //해지일자
		
		//$("#mSelCount").val(tobe_grtmnAmt);
		divAmt = divAmt.toFixed(0);//원단위 절사
		var baseStAmt = 0;
		var stCount = 0;
		var costAmt = 0;
		
        //해당 필드의 나눠서 값을 지정
        for (var i=0; i<tobeSelCount; i++) {
	        //투자가능금액
        	$("#divSubMain #mylist #divStockList"+i+" #divStock6"+i+" #text2SelStockAmt"+i).val(divAmt);
        	baseStAmt = $("#divSubMain #mylist #divStockList"+i+" #divStock6"+i+" #text1baseStockAmt"+i).val().commaExcl();;
        	
        	//수량
        	stCount = Math.floor((Number(divAmt)/Number(baseStAmt)));
        	$("#divSubMain #mylist #divStockList"+i+" #divStock6"+i+" #text3SelStockCount"+i).val(stCount);
        	
        	//투자금액
        	costAmt = (Number(baseStAmt)*Number(stCount)).toFixed(0);
        	$("#divSubMain #mylist #divStockList"+i+" #divStock6"+i+" #text4SelStockCost"+i).val(costAmt);
        }
        
      
	});
	
	//작업유형 멤버변수에서 관리함.
	$("#divSubMain #divSelectBox1 #selJobType").click(function(e) {
		
		if( $("#mRealYN").val() == 'R'){
			$("#mRealYN").val("S");
		}else{
			$("#mRealYN").val("R");
		}
		
		//작업유형에 따른 발런스 조회
		selectJobType();
		//if   $("#mRealYN").val("R");
	});
	
	//가매수정보 저장처리
	$("#divSubMain #divbtn #saveStBv").click(function(e) {
		//var totalamt      = "${balanceAmt}".commaExcl();    //콤마제거
		var totalamt      = $("#divSubMain #divTotalAmt #balanceR").val().commaExcl();    
		
		//var jobType       = $("#divSubMain #divSelectBox1 #selJobType").val();
		var jobType       = $("#mRealYN").val();
		
        var tobeSelCount  = $("#mSelCount").val();          //선택건수
        var divAmt = Number(totalamt)/Number(tobeSelCount); 
    
        //alert("jobType:"+ jobType); 
        
		//var tobe_expryDt       = $("#ResellerForm_M #expryDt").val();     //해지일자
		
		//$("#mSelCount").val(tobe_grtmnAmt);
		divAmt = divAmt.toFixed(0);//원단위 절사
		var baseStAmt = 0;
		var stCount = 0;
		var costAmt = 0;
		var savedata = [];
		
		var selected_ids_arr = $('#recommandStockTable').jqGrid('getGridParam','selarrrow');
		
        //해당 필드의 나눠서 값을 지정
        //for (var i=0; i<tobeSelCount; i++) {
        for(var i=0; i< selected_ids_arr.length; i++){
		   		//$("#recommandStockTable").jqGrid('saveRow',selected_ids_arr[i]);
	 	   		//$("#recommandStockTable").jqGrid('restoreRow',selected_ids_arr[i],true); 
	 	   			
        	
			//최초선택한 시가
			//html = html + ' <input id="text1baseStockAmt'+i+'" name="text1baseStockAmt"'+i+' type="text" disabled="disabled"  value="'+num.format()+'"/>';
			//투자금액
			//html = html + ' <input id="text2SelStockAmt'+i+'" name="text2SelStockAmt"'+i+'type="text" />';
			//실 요청 수량
			//html = html + ' <input id="text3SelStockCount'+i+'" name="text4SelStockCount"'+i+'type="text" />';
			//실 요청 단가
			//html = html + ' <input id="text4SelStockCost'+i+'" name="text4SelStockCost"'+i+'type="text" />';
			
        	//투자가능금액
        	//$("#divSubMain #mylist #divStockList"+i+" #divStock6"+i+" #text2SelStockAmt"+i).val(divAmt);
        	
        	baseStAmt = $("#divSubMain #mylist #divStockList"+i+" #divStock6"+i+" #text1baseStockAmt"+i).val().commaExcl();;
        	
        	//수량
        	//stCount = Math.floor((Number(divAmt)/Number(baseStAmt)));
        	var sCount = $("#divSubMain #mylist #divStockList"+i+" #divStock6"+i+" #text3SelStockCount"+i).val();
        	//투자금액
        	costAmt = (Number(baseStAmt)*Number(stCount)).toFixed(0);
        	//$("#divSubMain #mylist #divStockList"+i+" #divStock6"+i+" #text4SelStockCost"+i).val(costAmt);
        	
			$("#recommandStockTable").jqGrid('saveRow',i);
 	   		$("#recommandStockTable").jqGrid('restoreRow',i,true); 
 	   		//var rowData = $('#recommandStockTable').getRowData(i+1);
 	   		var rowData = $('#recommandStockTable').getRowData(selected_ids_arr[i]);
 	   	    var selBuyType      = $("#divSubMain #divBuyCode #scBuyType").val();     //판매 방식
 	   		var sMode = rowData.scStatCd;
		 	   	
	        //WC	관심목록취소,BC	매수 취소, SR	매도완료, SC	매도 취소
	        if (sMode == 'WR')  {
	    	   rowData.scStatCd = "BV"; //매수요청	
			   rowData.buyType   = selBuyType;//code 관리 - BUYTYPE : 매수유형 - 코드에 따라서 프로세스 진행 디폴트 즉시 처리.
			   rowData.buyVCount = sCount;
			   rowData.buyVAmt   = baseStAmt;
	        //BV	매수요청	
	        } else if (sMode == 'BV')  {
	    	   rowData.scStatCd = "BR"; //매수완료
			   rowData.buyType   = selBuyType;//code 관리 - BUYTYPE : 매수유형 - 코드에 따라서 프로세스 진행 디폴트 즉시 처리.
			   rowData.buyRCount = sCount;
			   rowData.buyRAmt   = baseStAmt;
	        //BR	매수완료	
	        } else if (sMode == 'BR')  {
	    	   rowData.scStatCd = "SV"; //매도요청
			   rowData.saleType   = selBuyType;//code 관리 - BUYTYPE : 매수유형 - 코드에 따라서 프로세스 진행 디폴트 즉시 처리.
			   rowData.saleVCount = sCount;
			   rowData.saleVAmt   = baseStAmt;
	        //SV	매도요청
	        } else if (sMode == 'SV')  {
	    	   rowData.scStatCd = "SR"; //매도완료
			   rowData.saleType   = selBuyType;//code 관리 - BUYTYPE : 매수유형 - 코드에 따라서 프로세스 진행 디폴트 즉시 처리.
			   rowData.saleRCount = sCount;
			   rowData.saleRAmt   = baseStAmt;	    	   
	        }
			
			rowData.jobType   = jobType; //S:시뮬레이션, R:실시간 인지
				  
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
				//alert(data.message);
				MessageBox.dialog(data.message);
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

	//창닫기
	$("#divSubMain #divbtn #closeBtn").click(function(e) {	
		Dialog.close('#myStockAddDialog');
	});

	
		
	
</script>

<!-- <div class="speech"> 
 정보확인
<p>
    To-Do:  할게 많아. ㅠㅠ 

</div>
<div id="speach">Speach</div> -->
<!--
<form id="myStockSaveForm">
-->
<!-- 변수지정 -->
<input type="hidden" id="mSelCount" name="mSelCount">
<input type="hidden" id="mTotalAmt" name="mTotalAmt">
<input type="hidden" id="tobe_grtmnAmt" name="tobe_grtmnAmt">
<input type="hidden" id="tobe_creditAmt" name="tobe_creditAmt">
<input type="hidden" id="mRealYN" name="mRealYN">
<input type="hidden" id="balanceAmt" name="balanceAmt" value="${balanceAmt}"/>

	<div id="divSubMain" >
	
		<div  id="divSelectBox1" class="col_12">
		   <label class="switch switch-green">
		      <input id="selJobType" type="checkbox" class="switch-input" checked>
		      <span class="switch-label" data-on="On" data-off="Off"></span>
		      <span class="switch-handle"></span>
		    </label>ON:리얼/OFF:시뮬레이션
		</div>
		
		<div id="searchDivSmsCode" class="col_3">
	    <li><i class="icon-credit-card"></i>계정잔고</li>
		</div>
		 
		<div id="divBuyCode" class="col_3">
	<%-- 		<select id="searchSelect" name="searchSelect"
				class="form_normal01 mr_20" style="width: 124px;">
				<option value="NOTICE_TITLE">현금</option>
				<option value="NOTICE_PERSONID">주식</option>
			</select> --%>
	        <!--       매수유형<input name="buyType" type="hidden" value="BUYTYPE" /> -->
	                                                  매수유형<input name="buyType" type="hidden" value="BUYTYPE" />
						<select class="myStockSaveForm" id="scBuyType" name="scBuyType" style="width: 100px" onChange="javascript:selectJobType()">
							<!--  <option value="">Choose</option> -->
							<code:out codeType="${jobSelType}" value="en" option="listbox" />
						</select>		 
		</div>
		
		<div id="myAccount" class="col_3">
			<input id="balance" type="text" disabled="disabled" value="${balanceAmt}"/>
		</div>
		
		
		<div id="divTotalAmt" class="col_3">
		    <input id="balanceR" type="text" placeholder="예산금액" value="${balanceAmt}"/>
			<!--  
			<input id="balanceR" type="text" placeholder="예산금액" value="${balanceAmt}"/>
			<input type="button" value="자동적용"id="newAutoAmt" />
			<input type="button" value="저장"id="saveStBv" />
			<input type="button" value="닫기"id="closeBtn" />
			-->
			

		</div>
		
		<div id="divbtn" class="col_12">
			<button class="inset" id="newAutoAmt"><i class="icon-cogs"></i> 자동적용</button>
			<button class="inset" id="saveStBv"><i class="icon-save"></i> 저장 </button>
			<button class="inset" id="closeBtn"><i class="icon-remove"></i> 닫기 </button>
		</div>
		
		
		<div id="mylist" class="col_12">
		</div>
		
	</div>
<!--	
</form> -->