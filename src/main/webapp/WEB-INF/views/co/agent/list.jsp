<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script  type="text/javascript" src="<s:url value="/resources/javascript/common/util.js"/>"></script>
<c:set var="baseUrl" value="/common/agent/list"/>	
<script type="text/javascript">

	// 연락처 목록 클릭 처리
	var agentListClick = function (){
		var agentObj = $(this).find('#agentInfo');
		agentListClick2(agentObj);
		//$("#contactTypeCode").change();
		
	};
	
	function agentListClick2(agentObj){
		//e.preventDefault();	
		//alert('xxxxxx>>');
		
		var agentId = $(agentObj).attr('agentId');
		var agentName = $(agentObj).attr('agentName');
		var dlrId = $(agentObj).attr('dlrId');
		var password = $(agentObj).attr('password');
		var effectiveDate = $(agentObj).attr('effectiveDate');
		var expirationData = $(agentObj).attr('expirationData');
		var emailAddress = $(agentObj).attr('emailAddress');
		var homeTelno = $(agentObj).attr('homeTelno');
		
		$("#agentRegForm").find("[id=agentId]").val(agentId);
		$("#agentRegForm").find("[id=agentName]").val(agentName);
		$("#agentRegForm").find("[id=dlrId]").val(dlrId);
		$("#agentRegForm").find("[id=password]").val(password);
		$("#agentRegForm").find("[id=effectiveDate]").val(effectiveDate);
		$("#agentRegForm").find("[id=expirationData]").val(expirationData);
		$("#agentRegForm").find("[id=email]").val(emailAddress);
		$("#agentRegForm").find("[id=homeTelno]").val(homeTelno);
	
	};
	

	function agnetNewSubmitCheck(){
			var userId = $("#agentForm").find("#userId");
			var password = $("#agentForm").find("#password");
			if($(userId).val() == ''){
				alert('<s:message code="address.msg.000027"/>')
				$(userId).focus();
				return false ;
			}
			if($(password).val() == ''){
				alert('<s:message code="address.msg.000028"/>')
				$(password).focus();
				return false ;
			}
			return true ;
    }

	
	function registAgent(){
		
		$.ajax({
			type : "POST",  
			async : true,
			url : baseUrl + "agent/process/I",
			dataType : 'json',
			data : $("#agentRegForm").find("[type=text]").serialize(),
			success : function(data) {
				if(data.RESULT == "SUCCESS"){
					alert('<s:message code="address.msg.000013"/>')
				}else{
					alert('<s:message code="address.msg.000029"/>')
					//errorMessage(data.MESSAGE);
				}
			},
			error:function(data){
				alert('<s:message code="cos.msg.server"/>')
			},
			complete:function(jqXHR, textStatus){
				
			}
		});
	}
	
	
	
	function selAgent(){
 
	    $(this).loadingDialog("사용자를 검색중입니다. 잠시만 기다려 주세요");
		
		$.ajax({
			type : "GET",  
			async : true,
			url : baseUrl + "co/agent/sel?callBack=${param.callBack}",
			dataType : 'html',
			data : $("#agentInfoSelList").serializeArray(),
			success : function(data) {
				$("#agentInfoSelList").hide().empty().append(data).show();
			},
			error:function(data){
				alert('<s:message code="cos.msg.server"/>')
			},
			complete:function(jqXHR, textStatus){
				
			}
		});
		
	}
	
	$(function(e){
		
		//리스트 선택 시 디테일 정보 클릭처리 
		$("#agentInfoSelList").find('[id=agentSeq]').bind('click', agentListClick);
		
		/**************************/
		//new 버튼
		/**************************/
		$("#agentAddBtn").click(function(e){
			
			
			//e.preventDefault();
			//리스트에 추가한다. CREATE
			//addCustomerToList($("#custContactRegForm"), 'CREATE');
			//json 및 입력form을 클리어 한다.
			
		//$(this).val('');
			
			$("#agentRegForm").find("input[type=text]").each(function(e){
		      $(this).val('');
	        });	

			//clearCustContactRegForm();
		});
		
		/**************************/
		//저장버튼 클릭
		/**************************/
		$("#agentSaveBtn").click(function(e){
			
			if (!agnetNewSubmitCheck()){
				return false;
			}
			
			MessageBox.confirm('<s:message code="address.msg.000030"/>', ,{
				return false ;
			});
			
			
			//저장함.
			registAgent();
			
			//다시 조회함.
			selAgent();
								
		});
		
		/**************************/
		//조회버튼클릭
		/**************************/
		$("#agentSelBtn").click(function(e){
			
			selAgent();
								
		});
		
	});
	

</script>
<div id="wrap_401">
	
	<!-- 그리드 테이블 //-->
	<div id="contents_box" style="overflow:auto;width:100%; height:270px"> 
	
		<table id="agentInfoSelList" width="100%" cellpadding="0" cellspacing="0" border="1" class="table_list01 mt_5">
		  
				<div class="f_left">
					<p>
						<s:message code="co.label.userInput"/>
						<input class="form_normal01"  type="text" id="searchVal" name="searchVal" placeholder="사용자" value="${searchVal}">
						<input type="hidden"  id="mode" name="mode" value="${mode}">
					</p>
				</div>
				
				<!-- 조회 버튼 //-->
				<div class="f_right">
					<img src="<c:url value="/resources/images/common/line_01.gif"/>" />
					<span class="btns9 save"><input type="submit" value='<s:message code="cmn.btn.search"/>' id="agentSelBtn"/></span>
				</div>
				<!--// 조회 버튼 //-->
			
			
			<colgroup>
				<col width="" />
				<col width="" />
				<col width="" />
				<col width="" />
				<col width="" />
				<col width="" />
				<col width="" />
				<col width="" />				
			</colgroup>
			 <tr>
				<th><s:message code="co.label.agentId"/></th>
				<th><s:message code="co.label.agentName"/></th>
				<th><s:message code="co.label.dlrId"/></th>
				<th><s:message code="or.user000.label.001"/></th>
				<th><s:message code="co.label.effective"/></th>     
				<th><s:message code="co.label.expiration"/></th>
				<th><s:message code="roam.label.roamPrm001.contactInformationTable.Email"/></th>
				<th><s:message code="co.label.workTelNo"/></th>
			</tr>

			
			<c:forEach items="${list}" var="agent" varStatus="status">
				<tr id="agentSeq"  ${status.count % 2 == 0 ? 'class="row02"' : ''}>
				    <!-- 
					<td><input type="text" class="form_normal01" style="width:95%;" id="agentId" name="agentId" value="${agent.agentId}" readonly/></td>
					<td><input type="text" class="form_normal01" style="width:95%;" id="agentName" name="agentName" value="${agent.agentName}"/></td>
					<td><input type="text" class="form_normal01" style="width:95%;" id="dlrId" name="dlrId" value="${agent.dlrId}"/></td>
					<td><input type="text" class="form_normal01" style="width:95%;" id="password" name="password" value="${agent.password}"/></td>
					<td><input type="text" class="form_normal01" style="width:95%;" id="effectiveDate" name="effectiveDate" value="${agent.effectiveDate}"/>	</td>
					<td><input type="text" class="form_normal01" style="width:95%;" id="expirationData" name="expirationData" value="${agent.expirationData}"/></td>
					<td><input type="text" class="form_normal01" style="width:95%;" id="emailAddress" name="emailAddress" value="${agent.emailAddress}"/></td>
					<td><input type="text" class="form_normal01" style="width:95%;" id="homeTelno" name="homeTelno" value="${agent.homeTelno}"/></td>
					 -->
					<td>${agent.agentId}
					    <!-- 임시저장처리 -->
						<input type="hidden" id="agentInfo" name="agentInfo" 
						agentId="${agent.agentId}" 
						agentName="${agent.agentName}"
						dlrId="${agent.dlrId}" 
						password="${agent.password}"
						effectiveDate="${agent.effectiveDate}"
						expirationData="${agent.expirationData}"
						emailAddress="${agent.emailAddress}"
						homeTelno="${agent.homeTelno}">
					</td>
					<td>${agent.agentName}</td>
					<td>${agent.dlrId}</td>
					<td>${agent.password}</td>
					<td>${agent.effectiveDate}</td>
					<td>${agent.expirationData}</td>
					<td>${agent.emailAddress}</td>
					<td>${agent.homeTelno}</td>		
				</tr>
			</c:forEach>
		</table>
    </div>
    
    <!--// 입력 테이블 -->
	<div class="title">
		<!-- 타이틀 //-->
		<h1><s:message code="address.label.000001"/></h1>
		<!--// 타이틀 -->
	</div>
	
    <!-- 입력 테이블 //-->

	<table width="100%" cellpadding="0" cellspacing="0" border="1" class="table_view01 mt_5" id="agentRegForm">
	<span class="btns7 save"><input type="submit" value= '<s:message code="cmn.btn.confirm"/>'  id="agentConfirmBtn"/></span>
	
		<colgroup>
			<col width="20%" />
			<col width="" />
			<col width="20%" />
			<col width="" />
		</colgroup>
		<tr>
			<th class="key"><s:message code="co.security.label.000003"/></th>
			<td class="key"><input type="text" id="agentId" name="agentId" class="form_normal01" style="width:100px;"  />
			</td>
			<th><s:message code="or.user000.label.001"/></th>
			<td class="key"><input type="text" id="password"  name="password" class="form_normal01" style="width:100px;"  />
			</td>
			
		</tr>
		<tr>
			<th><s:message code="code.label.000069"/></th>
			<td class="key"><input type="text" id="agentName" name="agentName" class="form_normal01" style="width:100px;"  />
			</td>
			<th>이메일</th>
			<td><input type="text" id="emailAddress" name="emailAddress" class="form_normal01" style="width:100px;"  />
			<s:message code="co.label.at"/>
			<input type="text" id="address" class="form_normal01" style="width:100px;"  />
			
			<select class="form_select01" style="width:95px;" >
					<option><s:message code="co.label.naver"/></option>
					<option><s:message code="co.label.daum"/></option>
					<option><s:message code="co.label.gmail"/></option>
					<option><s:message code="co.label.msn"/></option>
			</select>
			
		</tr>		
		<tr>
			<th>유효시작일</th>
			
			<td colspan="3" ><input type="text" class="form_normal01"  style="width:80px" id="effectiveDate" name="effectiveDate" value="<fmt:formatDate pattern="yyyy/MM/dd" value="${lookupCode.startDateActive}"/>" readonly/> ~ 
					<input type="text" class="form_normal01" style="width:80px" id="expirationData" name="expirationData" value="<fmt:formatDate pattern="yyyy/MM/dd" value="${lookupCode.endDateActive}"/>" readonly/> 
					<span class="btns3 save"><input type="submit" id="resetDatePicker" value= '<s:message code="cmn.btn.reset"/>' /></span></td>
			
		</tr>
		<tr>
			<th>부서</th>
			<td><input type="text" id="dlrId" class="form_normal01" style="width:100px;"  />
			</td>
			<th><s:message code="cs.lable.cust.000030"/></th>
			<td class="key"><input type="text" id="homeTelno" class="form_normal01" style="width:100px;"  />
			</td>
			
		</tr>		

        <!-- 주석처리   
		<tr>
			<th class="key"><s:message code="ar.ar22.label.000010"/></th>
			<td colspan="3">
				<p>
				<input type="text" class="form_disable" style="width:70px;" disabled /> - 
				<input type="text" class="form_disable" style="width:70px;" disabled />
				<a href="#"><img src="../images/btn/btn_search_02.gif"/></a><br/>
                </p>
                <p class="mt_5"><input type="text" class="form_disable" style="width:100%;" disabled /></p>
                <p class="mt_5"><input type="text" class="form_normal01" style="width:100%;"  /></p>
			</td>
		</tr>
		 -->
	</table>
	
	<!-- 컨텐츠를 감싸는 박스 //-->
	<div class="contents_box mt_5 both">
		<!-- 버튼 //-->
		<div class="f_right">
		    <span class="btns7 save"><input type="submit" value='<s:message code="cmn.btn.add"/>'  id="agentAddBtn"/></span>
			<span class="btns9 save"><input type="submit" value= '<s:message code="cmn.btn.save"/>'  id="agentSaveBtn"/></span>
			<span class="btns7 save"><input type="submit" value='<s:message code="cmn.btn.update"/>' id="agentUpdateBtn"/></span>
			<span class="btns7 save"><input type="submit" value= '<s:message code="cmn.btn.close"/>'  id="agentCloseBtn"/></span>
		</div>
		<!--// 버튼 -->
	</div>
	
	
	<div id="agentSearchList">
			
	</div>
    
</div>
