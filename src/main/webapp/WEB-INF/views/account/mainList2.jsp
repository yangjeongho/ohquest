<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript" src="<s:url value="/resources/lib/jquery/plugins/jqueryForm/jquery.form.js"/>"></script>
<link type="text/css" rel="stylesheet" href="../css/contents.css" />

<script type="text/javascript">
	//최초 new 가지고 오기 
	$.ajax({
		type : "GET",  
		async : false,
		url : baseUrl + "prm/baseline/rateNew",		
		dataType : 'html',
		success : function(data) {
			$("#detail_show").hide().empty().append(data).show();
		},
		error:function(data){
		
		},
		complete:function(jqXHR, textStatus){					
		}
	});
	$(function(e){
		$("#rateNewBtn").click(function(e){
			e.preventDefault();
			$.ajax({
				type : "GET",  
				async : false,
				url : baseUrl + "prm/baseline/rateNew",		
				dataType : 'html',
				success : function(data) {
					$("#detail_show").hide().empty().append(data).show();
				},
				error:function(data){
					
				},
				complete:function(jqXHR, textStatus){					
				}
			});
		});
		$("#rateCloseBtn").click(function(e){
			e.preventDefault();
			Dialog.close('#${param.dialogName}');
		});
	
		//상세링크
		$("tr").click(function(e){
			e.preventDefault();
			company =$(this).attr('id');
			$.ajax({
				type : "GET",  
				async : false,
				url : baseUrl + "prm/baseline/rateDetail?company="+company,		
				dataType : 'html',
				success : function(data) {
					$("#detail_show").hide().empty().append(data).show();
				},
				error:function(data){
				
				},
				complete:function(jqXHR, textStatus){					
				}
			});
		});
		
		$("#startDateActive").datepicker({showAnim: "fold", dateFormat: "yy/mm/dd",  changeMonth: true,
	        changeYear: true,  showOtherMonths: true,
	        selectOtherMonths: true});
		$("#endDateActive").datepicker({showAnim: "fold", dateFormat: "yy/mm/dd",  changeMonth: true,
	        changeYear: true,  showOtherMonths: true,
	        selectOtherMonths: true}); 
		$("#resetDatePicker").click(function(e){
			e.preventDefault();
			$("#startDateActive").val("");
			$("#endDateActive").val(""); 
		});
		
		//조회버튼 클릭
		$("#searchConnRateBtn").click(function(e){
			e.preventDefault();	
			$("#${param.dialogName} > div").load(baseUrl+"prm/baseline/rateList?dialogName=${param.dialogName}&"+$("#BaselineConnRateSearchForm").serialize(), 
					function(e){});
			
		});
		
		//조회/페이지 이동시 처리
		$("[class^=paging]").click(function(e){
			e.preventDefault();
			var pageUrl = $(this).attr('href') ;
			if($(this).attr('class') != 'now'){
				$("#${param.dialogName} > div").load(pageUrl +"&dialogName=${param.dialogName}&"+ $("#BaselineConnRateSearchForm").serialize());
			}
		});
		
		//화면에서 엔터 칠때
		$("#BaselineConnRateSearchForm").find("[name=searchValue]").keydown(function(e){
			if(e.keyCode == 13) {
				$("#searchConnRateBtn").click();
			}
		});
		$('#comSelect').val('${searchFilter.searchValue[0]}');
	});
	function refresh(){
		$("#searchConnRateBtn").click();
	}
</script>
<div class="warp">
    <!-- Start Condition //-->
	<div class="contents_box">
		<div class="div_right ">
		<form id="BaselineConnRateSearchForm"  action="<c:url value="/prm/baseline/rateList"/>">

			<div class="f_left">
				<p>
					<input  name="searchKey" type="hidden" value="EXTRA_CD"/>
					<label>코드<!--추출코드--></label>   <input type="text" name="searchValue" class="form_normal01" style="width: 120px;" value="${searchValue[2]}"  />
					<input  name="searchKey" type="hidden" value="VALD_STRT_DT"/>
					<label>명</label> <input type="text" class="form_normal01"  style="width: 120px" id="startDateActive" name="searchValue" value="${searchValue[3]}" readonly/>
					<input  name="searchKey" type="hidden" value="VALD_APLY_DT"/>
					<label>일자</label>   <input type="text" class="form_normal01" style="width: 120px" id="endDateActive" name="searchValue" value="${searchValue[4]}" readonly/> 
					<!--<span class="btns3 save"><input type="submit" id="resetDatePicker" value= '초기화' /></span>-->
						<!-- 조회 버튼 //-->
		 	 <button class="inset" id="myRecommadnBtn"><i class="icon-search"></i> 조회 </button>
		
				</p>
			</div>
		</form>
		
		</div>
    </div>
     <!-- End Condition //-->
	<!-- Start Special -->
	<br>
	<div class="contents_box" style="height:300px;">
	
		<table cellpadding="0" cellspacing="0" border="1" class="table_list01" >
			<colgroup>
			    <col width="130px" />
				<col width="70px" />
				<col width="90px" />
				<col width="150px" />
				<col width="80px" />
				<col width="90px" />
				<col width="90px" />
				<col width="90px" />
				<col width="90px" />
			</colgroup>
			<tr class="row02"> 
				<th>1</th>
				<th>1</th>
				<th>2<!--추출코드--></th>
				<th>4<!--추출코드명--></th>
				<th>5</th>
				<th>6</th>
				<th>7</th>
				<th>8</th>
				<th>9</th>
			</tr>
			<c:set value="0" var="totalCount"/>
			<c:forEach items="${list}" var="list" varStatus="status">
			<c:set value="${totalCount+1}" var="totalCount"/>
			<tr id ="${list.company}" ${status.count % 2 == 0 ? 'class="row02"' : ''}>
				<td class="center">${list.company}</td>
				<td class="center">${list.unitDv}</td>
				<td class="center">${list.extraCd} </td>
				<td class="center">${list.extraCd}</td>
				<td class="center">${list.saleCostDvCd}</td>
				<td class="center"></td>
				<td class="center">${list.accessRate}</td>
				<td class="center">${list.valdStrtDt}</td>
				<td class="center">${list.valdAplyDt}</td>
			</tr>
			</c:forEach>
			<c:forEach begin="${totalCount+1}" end="${pagination.objectsPerPage}" step="1" varStatus="status">
			<tr ${status.count % 2 == 0 ? 'class="row02"' : ''}> 
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			</c:forEach>
			
		</table>
	</div>
	
	<c:set var="baseUrl" value="/prm/baseline/rateList"/>	
	<c:if test="${pagination.objectsCount gt 0}">	
	<%@include file ="../co/page/pagination.jsp" %> 
	</c:if>
	<div class="contents_box mt_5">
		<div class="f_right">
			<span class="btns7 save"><input type="button" value= '<s:message code="cmn.btn.new"/>'  id="rateNewBtn"/></span>
			<span class="btns7 save"><input type="submit" value= '<s:message code="cmn.btn.close"/>'  id="rateCloseBtn"/></span>
		</div>
	</div>	
</div>
<div id="detail_show"></div>