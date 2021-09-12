<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
       #ip11{
           width: 5px; display: none; background-color : #EFEBDE;
/*            margin-left: 0px; margin-right: 0px; padding: 0px; */
        } 
</style>
<script type="text/javascript" src="<s:url value="/resources/lib/jquery/plugins/jqueryForm/jquery.form.js"/>"></script>
<script type="text/javascript">
var autocomplete2 = $('<div id="eventListAuto" class="form_normal01" style="width:120px;margin-left:378px; height: 200px;position: absolute; Z-index: 1;"></>').hide().insertAfter('#eventList');

	//2013.04.05 자동완성관련 추가
	var clickEventList = function(){
		var eventListText = $(this).text();
		
		$("#eventList").val(eventListText);
		$("#eventListAuto").hide();
	};
	
	$(function(e){		
		autocomplete2.val("");
		autoSearch();
		initCoEvent001();
				
		function initCoEvent001(){			
			$('[id=startDate]').datepicker({showAnim: "fold", dateFormat: "yy-mm-dd",  changeMonth: true,
		        changeYear: true,  showOtherMonths: true,showButtonPanel: true,
		        selectOtherMonths: true});
			$("[id=startDttmImg]").click(function(e){
				e.preventDefault();
				$(this).parent().parent().find('[id=startDate]').focus();
				autocomplete2.hide();
			});
			
			$('[id=endDate]').datepicker({showAnim: "fold", dateFormat: "yy-mm-dd",  changeMonth: true,
		        changeYear: true,  showOtherMonths: true,showButtonPanel: true,
		        selectOtherMonths: true});
			$("[id=endDttmImg]").click(function(e){
				e.preventDefault();
				$(this).parent().parent().find('[id=endDate]').focus();
				autocomplete2.hide();
			});
			
			jQuery('#coEvent001Form #eventLogList').jqGrid({
				datatype:"local",
				width:970,
				height:400,
				colNames:['<s:message code="eventlog.label.logSeqno"/>',//'logSeqno',
				          '<s:message code="co.security.label.000003"/>',//'User ID', 
				          '<s:message code="code.label.000069"/>',//'User Name', 
				          '<s:message code="eventlog.label.ControllerId"/>',//'Controller ID', 
				          '<s:message code="eventlog.label.ControllerName"/>',//'Controller Name', 
				          '<s:message code="cos.ipManagement.IpManageTable.lable.IP_Address"/>',//'IP Address', 
				          '<s:message code="bs.label.000182"/>',//'Create Date',
				          '<s:message code="bs.bsArManage.label.000005"/>',//'Customer No.',
				          '<s:message code="bs.bsArManage.subpop.000000"/>',//'Customer Name', 
				          '<s:message code="cs.lable.bill.000058"/>',// 'Subscriber Key', 
				          '<s:message code="eventlog.label.CTN"/>',//'CTN'
				          ],
				colModel:[
				          {name:'logSeqno' ,index:'ifSeqno', hidden:true},
				          {name:'userId' ,index:'userId', width:100, align:'center'},
				          {name:'userName' ,index:'userName', width:100, align:'center'},
				          {name:'controlId' ,index:'controlId', hidden:true},
				          {name:'controlName' ,index:'controlName', width:140, align:'center'},
				          {name:'ipAddress' ,index:'ipAddress', width:100 , align:'center'},
				          {name:'workDate' ,index:'workDate', width:80, align:'center' },
				          {name:'custNo' ,index:'custNm', width:100 , align:'center'},
				          {name:'custNm' ,index:'custNm', width:100 , align:'center'},
				          {name:'entrNo' ,index:'custNm', width:100 , align:'center'},
				          {name:'prodNo' ,index:'prodNo', width:80, align:'center' }
				          ],
				sortable: false,
				shrinkToFit : true				
			});
			
			//확인 필요
			$("#coEvent001Form").find("[id=totalCnt]").text(0);
			$("#coEvent001Form").find("[id=currentCnt]").text(0);
			$("#eventLogList").jqGrid("clearGridData", true);
			$("#coEvent001Form" +" #page").val(0);
	
			gf_clearGridList($("#eventLogList")); //그리드 초기화
		}
		
	    function searcheventLogListByNavi(){	    	
	    	$("#coEvent001Form #coEvent001PageNav").unbind('click');
			if(coEvent001PageNavCom("coEvent001Form")){
				coEvent001GridAjaxCall(baseUrl + "co/eventlog/search","coEvent001Form", "eventLogList");	
			}
	    }
	    		
		function coEvent001PageNavCom(form){
			var totalCnt = $("#"+form).find("[id=totalCnt]").text() ;
			var currentCnt = $("#"+form).find("[id=currentCnt]").text() ;
			if(parseInt(totalCnt) == parseInt(currentCnt)) {
				return false;
			}
			return true ;
		} 
		
		//main jqgrid 리스트 가져오기
		function coEvent001GridAjaxCall(curl, form, table){		

			autocomplete2.hide();
			
			$("#coEvent001Form #searcheventLogListBtn").loadingDialog();		
			$.ajax({
				type : "POST",  
				async : true,
				url : curl,
				data : $("#"+form).serializeArray(),
				dataType : 'json',
				success : function(data) {
					gf_console.log(data);
					if (data.list.length > 0) {
						
						$("#"+form+"#"+table).jqGrid("clearGridData", true);						
						for(var i=0; i<data.list.length;i++){
							data.list[i].workDate = gf_getTodayDate2(data.list[i].workDate, '-');					
						}
						gf_addMultiGridList("#" + table, data.list);
						autoSearch();
					}else{
						MessageBox.dialog('<s:message code="res.label.res020.000030"/>');
					}
					
					$("#"+form).find("[id=page]").val(data.pagination.currentPage+1);
					$("#"+form).find("[id=totalCnt]").text(data.pagination.objectsCount);
					$("#"+form).find("[id=currentCnt]").text( $("#"+table).getDataIDs().length );
				},	error:function(data){
					//서버 비정상 동작시 구현
					MessageBox.dialog("err.500");
				}, complete:function(jqXHR, textStatus){
					$("#coEvent001Form #searcheventLogListBtn").hideLoading();
					$("#coEvent001Form #coEvent001PageNav").bind('click', searcheventLogListByNavi);
				}
			});
		}
		
		//조회 클릭
		$("#coEvent001Form #searcheventLogListBtn").click(function(e){
			e.preventDefault();	
						
			var startDate = $("#coEvent001Form #startDate");
			var endDate = $("#coEvent001Form #endDate");
			var startHour = $("#coEvent001Form #startHour").val();
			var endHour = $("#coEvent001Form #endHour").val();
			var startMN = $("#coEvent001Form #startMN").val();
			var ip1 = coEvent001Form.ip1.value;
			var ip2 = coEvent001Form.ip2.value;
			var ip3 = coEvent001Form.ip3.value;
			var ip4 = coEvent001Form.ip4.value;
			
			var searchKey = $("#coEvent001Form #searchKey").val();
			if(searchKey == 'A.USER_ID'){
				if($("#coEvent001Form #userIdIp").val()==''){
					MessageBox.dialog('<s:message code="sec.msg.000001"/>');
					return ;
				}
			}else if(searchKey == 'A.IP_ADDR'){
				if(ip1 == '' || ip2 == '' || ip3 == '' || ip4 == ''){
					MessageBox.dialog('<s:message code="or.msg.000025"/>');
					return ;
				}
				var ip = ip1+":"+ip2+":"+ip3+":"+ip4;
				//공백제거
				ip = ip.replace(/ /g,""); 
				$("#coEvent001Form #userIdIp").val(ip);
			}
			
			//시간 체크
			if(startHour.length > 2 || startMN.length > 2 || endHour.length > 2 || endMN.length > 2 ){
				MessageBox.dialog('<s:message code="coEvnt001.msg.000001"/>');
				return ;
			}
			if(startHour.length == 1 || startMN.length == 1 || endHour.length == 1 || endMN.length == 1 ){
				MessageBox.dialog('<s:message code="coEvnt001.msg.000001"/>');
				return ;
			}
			
// 			if(!compareBeginEndDate(startDate, endDate, 1)){   
			if(!compareBeginEndDate(startDate, endDate)){   
				return ;
			}
			$("#coEvent001Form #coEvent001PageNav").off('click');
			$("#coEvent001Form").find("[id=totalCnt]").text(0);
			$("#coEvent001Form").find("[id=currentCnt]").text(0);
			$("#eventLogList").jqGrid("clearGridData", true);
			$("#coEvent001Form" +" #page").val(0);
			
			coEvent001GridAjaxCall(baseUrl + "co/eventlog/search","coEvent001Form", "eventLogList");
		});
			

		//화면에서 엔터 칠때
		$("#coEvent001Form").submit(function(e){
			coEvent001GridAjaxCall(baseUrl + "co/eventlog/search","coEvent001Form", "eventLogList");
			return false ;
		});
					
		//네비
		 $("#coEvent001PageNav").click(function(e){
			e.preventDefault();
			$("#coEvent001Form #coEvent001PageNav").off('click');
		});
		
		$("#coEvent001CloseBtn").click(function(e){
			e.preventDefault();
			Dialog.close('#${param.dialogName}');
		});
	
		
	});
	
	//자동완성
	function autoSearch(){
		$("#userIdIp").click(function(e){	
			e.preventDefault();
			autocomplete2.hide();
		});
		$("#ip1").click(function(e){	
			e.preventDefault();
			autocomplete2.hide();
		});
		$("#ip2").click(function(e){	
			e.preventDefault();
			autocomplete2.hide();
		});
		$("#ip3").click(function(e){	
			e.preventDefault();
			autocomplete2.hide();
		});
		$("#ip4").click(function(e){	
			e.preventDefault();
			autocomplete2.hide();
		});
		$("#startHour").click(function(e){	
			e.preventDefault();
			autocomplete2.hide();
		});
		$("#startMN").click(function(e){	
			e.preventDefault();
			autocomplete2.hide();
		});
		$("#endHour").click(function(e){	
			e.preventDefault();
			autocomplete2.hide();
		});
		$("#endMN").click(function(e){	
			e.preventDefault();
			autocomplete2.hide();
		});
		
		$("#coEvent001Form #searchKey").change(function(e){
			e.preventDefault();
			autocomplete2.hide();
			var key = $("#coEvent001Form #searchKey").val();
			
			//ip_addr 조건선택시 입력 폼 세팅_2013.04.05
			if(key == "A.USER_ID"){
				$("#eventTitle").attr("style", 'margin-left:40px');
				$("#coEvent001Form #userIdIp").show();
				$("#coEvent001Form #ip1").hide();
				$("#coEvent001Form #ip2").hide();
				$("#coEvent001Form #ip3").hide();
				$("#coEvent001Form #ip4").hide();
				$("#coEvent001Form #ip11").hide();
			}else{
				$("#eventTitle").attr("style", 'margin-left:78px');
				$("#eventListAuto").attr("style", 'width:120px;margin-left:377px;height: 200px;position: absolute; Z-index: 1;');
				$("#coEvent001Form #userIdIp").hide();
				$("#coEvent001Form #ip1").show();
				$("#coEvent001Form #ip2").show();
				$("#coEvent001Form #ip3").show();
				$("#coEvent001Form #ip4").show();
				$("#coEvent001Form #ip11").show();
			}
			
			$("#coEvent001Form #userIdIp").val("");
			$("#coEvent001Form #ip1").val("");
			$("#coEvent001Form #ip2").val("");
			$("#coEvent001Form #ip3").val("");
			$("#coEvent001Form #ip4").val("");
			
			autocomplete2.hide();
		});
				
		// Event 자동완성_2013.04.05  추가
		$("#eventList").keyup(function(e){	
			var eventLen = $("#eventList").val();
			
			if(event.keyCode > 40){
				$( "#eventList" ).autocomplete(			
					{	display: 20,
					  	minLength: 2,
				      	source: 
				      		function () {
					      	  var data =  $("#coEvent001Form").serializeArray();
//  							  alert(JSON.stringify(data));
					    	  $.ajax({
					    		  type : "POST",  
					    		  async : false,
					    		  url : baseUrl+"co/eventlog/eventAutoList" ,
					    		  data : data,
						   		  dataType : 'json',
						   		  success : function(data) {									
						   			  if(data.list.length > 0){					   					
						   					autocomplete2.empty();
						   					for(var i = 0; i < data.list.length; i++) {
											       $('<div></div>').text([data.list[i].controlName]).appendTo(autocomplete2).attr('id',"eventList");											       
						   					}
						   					autocomplete2.show();
						   				}else{
						   					autocomplete2.hide();
						   				}		   	       		
						   	      },error:function(data){
					   				  //서버 비정상 동작시 구현
					   				  MessageBox.dialog("err.500");
						   		  }, complete:function(jqXHR, textStatus){
						   			  $('[id=eventList]').bind('click', clickEventList);
						   		  }
					    	  });
					    },		
				      	cacheLength: 1,
					}
				);
			}else if(eventLen.length < 2 && event.keyCode == 8){
				
				if(eventLen.length < 2){
					autocomplete2.hide();
				}else if(eventLen.length == 0){
					$("#eventList").val("");
					autocomplete2.hide();
				}
				autocomplete2.hide();				
			}else{
				autocomplete2.hide();
			}		
		});
	}
	
	//자동완성 마우스오버, 아웃시
	$("#eventListAuto").mouseover(function(e){
		e.preventDefault();
		$(e.target).removeClass().addClass("form_normal01");  
		$("#eventListAuto").removeClass().addClass("form_normal01");  
		$("#eventListAuto").removeAttr('disabled', false);
	}).mouseout(function(e){
		e.preventDefault();
		$(e.target).removeClass("form_normal01").addClass(); 
		$("#eventListAuto").removeClass().addClass("form_normal01");  
		$("#eventListAuto").removeAttr('disabled', false);
	});
</script>
<div class="warp">
    <!-- Start Condition //-->
    <form id="coEvent001Form" name="coEvent001Form">
		<div class="contents_box">
			<div class="search_box_01">
				<div class="f_left">					
					<p>
						<select id="searchKey" name="searchKey" class="form_normal01">
							<option value="A.USER_ID" ${searchFilter.searchKey[0] eq 'A.USER_ID' ? 'selected' : ''}><s:message code="or.selectBox.option1" /></option>
							<option value="A.IP_ADDR" ${searchFilter.searchKey[0] eq 'A.IP_ADDR' ? 'selected' : ''} }><s:message code="cos.ipManagement.IpManageTable.lable.IP_Address"/></option>
						</select>
						<input id="userIdIp" name="searchValue" type="text" class="form_normal01" style="width: 200px;" value="${searchFilter.searchValue[0]}"/>
						
						<input id="ip1" type="text" class="form_normal01" style="width: 30px;display: none;" value="" maxlength="3"/>
						<input id="ip11" type="text" value="." disabled="disabled"/>
						<input id="ip2" type="text" class="form_normal01" style="width: 30px;display: none;" value="" maxlength="3"/>
						<input id="ip11" type="text" value="." disabled="disabled"/>
						<input id="ip3" type="text" class="form_normal01" style="width: 30px;display: none;" value="" maxlength="3"/>
						<input id="ip11" type="text" value="." disabled="disabled"/>
						<input id="ip4" type="text" class="form_normal01" style="width: 30px;display: none;" value="" maxlength="3"/>
					
					<span id="eventTitle" style="margin-left : 40px">Event</span>
			    	<input  name="searchKey" type="hidden" value="B.CONTROL_NM"/>		
			    	
			    	<select class="form_select01" id="eventList" name="searchValue" style="width:120px;margin-left:2px"  tabindex="1">
							<option value=''><s:message code="code.msg.choose"/></option>
							<c:forEach items="${controlNm}" var="code"><option value="${code.controlName }">${code.controlName} [<c:out value="${code.controlName}" />]</option></c:forEach>
			 	 	</select>
			 	 		
			 	 				    			    	
					</p>
					<p class="nextline">	
						<label><s:message code="cs.label.memo.000013"/></label> 
						<input type="text" id="startDate"  name="startDate" value="${strtDttm }" class="form_calendar01" style="width:100px;" ><a href="#"><img src="<s:url value="/resources/images/btn/btn_calendar.gif"/>"  alt="달력"  id="startDttmImg"/></a>
						<input class="form_normal01" type="text" id="startHour" name="startHour" style="width:30px; background: #f7f7f7;" value="00">H
						<input class="form_normal01" type="text" id="startMN" name="startMN" style="width:30px; background: #f7f7f7;" value="01"> M
				    	<label id="1" style="margin-left: 45px;"><s:message code="cs.label.memo.000014"/></label>
				    	<input type="text" id="endDate"  name="endDate" value="${strtDttm }" class="form_calendar01" style="width:100px;" ><a href="#"><img src="<s:url value="/resources/images/btn/btn_calendar.gif"/>"  alt="달력"  id="endDttmImg"/></a>
						<input class="form_normal01" type="text" id="endHour" name="endHour"  style="width:30px; background: #f7f7f7;" value="23"> H
						<input class="form_normal01" type="text" id="endMN" name="endMN" style="width:30px; background: #f7f7f7;" value="59"> M					
					</p>														    	
				</div>
				
				<!-- 조회 버튼 //-->
				<div class="f_right">
					<img src="<s:url value="/resources/images/common/line_01.gif"/>" />
						<span class="btns7 save"><input type="button" value='<s:message code="cmn.btn.search"/>'  id="searcheventLogListBtn" style="width: 80px;"/></span>
				</div>
		
			</div>
	    </div>
	     <!-- End Condition //-->
		<!-- Start Special -->
		<!--<br>-->
		<div class="title">
			<h1><s:message code="cs.label.memo.000019"/></h1>
			<ul class="btn_listtop f_right">
					<li class="page"><span class="text" id="currentCnt"></span> <s:message code="co.label.slash"/> <span class="text" id="totalCnt"></span></li>
					<li><a href="#" id="coEvent001PageNav"><img src="<s:url value="/resources/images/btn/btn_page.gif"/>" /></a></li>
				</ul>
				<input type="hidden" id="page" name="page" value="0">
		</div>			
		<table id="eventLogList"></table>
	    <!-- end Special -->    
	</form>
	<div class="contents_box mt_5">
		<div class="f_right">			
			<span class="btns7 save"><input type="submit" value= '<s:message code="cmn.btn.close"/>'  id="coEvent001CloseBtn"/></span>
		</div>
	</div>	

</div>
