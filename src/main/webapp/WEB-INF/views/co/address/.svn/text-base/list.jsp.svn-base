<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<script>


$(function(e){
	
	//조회/페이지 이동시 처리
	$("[class^=paging]").click(function(e){
		e.preventDefault();
		var pageUrl = $(this).attr('href')+"&callBack=${param.callBack}&coverageMode=${param.coverageMode}" ;
		
		if($(this).attr('class') == 'now'){
			return ;
		}
		
		$.ajax({
			type : "GET",  
			async : true,
			url : pageUrl,
			dataType : 'html',
			data : $("#searchForm").serializeArray(),
			success : function(data) {
				$("#addressSearchList").hide().empty().append(data).show();
			},
			error:function(data){
				MessageBox.dialog('<s:message code="cos.msg.server"/>');
			},
			complete:function(jqXHR, textStatus){
				
			}
		});
	});
	$("#insertAddress").click(function(e){		
		$("#noView").hide();
		$("#onlySearch").hide();
		$("#columnForm").hide();
		$("[id=insertForm1]").show();
		$("#insertForm2").show();
	});
	
	$("[id=selectAddressS]").click(function(e){
		e.preventDefault();
		
		$("#detailSearch").show();
		$("#detailSearch2").show();
		
		var inputObj =$(this).parent().parent().parent() ;
		
		$("#addressFullName2").val($(inputObj).find('[id=addressFullName1]').val());
		$("#addNum2").val($(inputObj).find('[id=addNum1]').val());
	});
	
	$("#selectBtn").click(function(e){
		e.preventDefault();
   		if('${param.coverageMode}' ==''){
			if ($("#subAddress").val()==''){
				MessageBox.dialog('<s:message code="address.msg.000008"/>');
				return;
			}
		}
		var jsonData = {
				addressFullName : $("#addressFullName2").val(),
				addNum: $("#addNum2").val(),
				subAddress: $("#subAddress").val(),					
		};
		if(eval("window.${param.callBack}") != null){
			var funcName = eval("${param.callBack}");
			funcName(jsonData);
		}
		Dialog.close('#searchAddressDialog'); 
		}
	);
	
	$("#registAddress").click(function(e){
		e.preventDefault();
		check_num($("#addNum").val(),$("#addNum"));
		if(submitToAdd2()){		
			MessageBox.confirm('<s:message code="address.msg.000021"/>', function(){
				$.ajax({
					type : "POST",  
					async : false,
					url : baseUrl + "common/address/check/",
					dataType : 'json',
					data : $("#insertForm2").find("[type=text]").serialize(),
					success : function(data) {
						if(data.RESULT == "SUCCESS"){
							
							if (data.COUNT == 0 ){
								registAddress();
							}else{
								MessageBox.dialog('<s:message code="address.msg.000011"/>');
							}
						}else{
							MessageBox.dialog('<s:message code="address.msg.000012"/>');
							//errorMessage(data.MESSAGE);
						}
					},
					error:function(data){
						MessageBox.dialog('<s:message code="cos.msg.server"/>');
					},
					complete:function(jqXHR, textStatus){
						
					}
				});
			}, function(){
				return false ;
			});
		}		
	});
	
	function registAddress(){
		
		$.ajax({
			type : "POST",  
			async : true,
			url : baseUrl + "address/process/I",
			dataType : 'json',
			data : $("#insertForm2").find("[type=text]").serialize(),
			success : function(data) {
				if(data.RESULT == "SUCCESS"){
					MessageBox.dialog('<s:message code="address.msg.000013"/>');
				}else{
					MessageBox.dialog('<s:message code="address.msg.000014"/>');
					//errorMessage(data.MESSAGE);
				}
			},
			error:function(data){
				MessageBox.dialog('<s:message code="cos.msg.server"/>');
			},
			complete:function(jqXHR, textStatus){
				
			}
		});
	}
	
	$("[id=deleteAddress]").click(function(e){		
		//var addSeqno = $(this).parent().parent().parent().find('[id=addSeqno]').val();
		/* var addNum = $(this).parent().parent().parent().parent().find('[id=addNum]').val();	 */			
		e.preventDefault();
		
		MessageBox.confirm('<s:message code="address.msg.000022"/>', function(){
			//$(this).parent().parent().parent().parent().remove();
			
			$.ajax({
				type : "POST",  
				async : false,
				url : baseUrl + "address/process/D",
				dataType : 'json',
				//data : {"addSeqno": addSeqno, "addNum": addNum},
				data : {"addNum" : $(this).parent().parent().parent().find('[id=addNumU]').val()},
				success : function(data) {
					if(data.RESULT == "SUCCESS"){
						MessageBox.dialog('<s:message code="address.msg.000015"/>');
						searchAddress();
					}else{
						MessageBox.dialog('<s:message code="address.msg.000016"/>');
						//errorMessage(data.MESSAGE);
					}
				},
				error:function(data){
					MessageBox.dialog('<s:message code="cos.msg.server"/>');
				},
				complete:function(jqXHR, textStatus){
					$("[id^=detailModify]").hide();
				}
			});
		}, function(){
			return false ;
		});
	});
	
	//이거?
	function searchAddress(){
		
		$.ajax({
			type : "GET",  
			async : false,
			url : baseUrl + "common/address/search?page=${pagination.currentPage}&callBack=${param.callBack}&coverageMode=${param.coverageMode}",
			dataType : 'html',
			data : $("#searchForm").serializeArray(),
			success : function(data) {
				$("#addressSearchList").hide().empty().append(data).show();
			},
			error:function(data){
				MessageBox.dialog('<s:message code="cos.msg.server"/>');
			},
			complete:function(jqXHR, textStatus){
				
			}
		});
	}
	
	$("[id=updateAddress]").click(function(e){		
		e.preventDefault();
		//var addSeqno = $(this).parent().parent().parent().find('[id=addSeqno]').val();
		var addNum = $(this).parent().parent().parent().find('[id=addNumU]').val();
		var city = $(this).parent().parent().parent().find('[id=cityU]').val();
		var district = $(this).parent().parent().parent().find('[id=districtU]').val();
		var subDistrict = $(this).parent().parent().parent().find('[id=subDistrictU]').val();
		var building = $(this).parent().parent().parent().find('[id=buildingU]').val();
		var entrance = $(this).parent().parent().parent().find('[id=entranceU]').val();
		var apt = $(this).parent().parent().parent().find('[id=aptU]').val();
		var location = $(this).parent().parent().parent().find('[id=locationU]').val();
		
		$("[id^=detailModify]").show();
		$("#addNum").val(addNum);
		$("#city").val(city);
		$("#district").val(district);
		$("#subDistrict").val(subDistrict);
		$("#building").val(building);
		$("#entrance").val(entrance);
		$("#location").val(location);
		
		
	});
	
	$("#modifyBtn").click(function(e){
		e.preventDefault();
		
		MessageBox.confirm('<s:message code="address.msg.000023"/>', function(){
			$.ajax({
				type : "POST",  
				async : false,
				url : baseUrl + "address/process/U",
				dataType : 'json',
				//data : {"addSeqno": addSeqno, "addNum": addNum, "city": city, "district": district, "subDistrict": subDistrict, "building": building, "entrance": entrance, "apt": apt, "location" : location},
				//data : $(this).parent().parent().parent().parent().parent().parent().find(":input").serialize(),
				data : $("#detailModify").find(":input").serialize(),
				success : function(data) {
					if(data.RESULT == "SUCCESS"){
						MessageBox.dialog('<s:message code="address.msg.000017"/>');
					}else{
						MessageBox.dialog('<s:message code="address.msg.000014"/>');
						//errorMessage(data.MESSAGE);
					}				
				},
				error:function(data){
					MessageBox.dialog('<s:message code="cos.msg.server"/>');
				},
				complete:function(jqXHR, textStatus){
					$("[id^=detailModify]").hide();
					/* var addressFullName = $("#addNum").val()+" "+$("#city").val()+" "+$("#district").val()+" "+$("#subDistrict").val()+" "+$("#building").val()+" "+$("#entrance").val()+" "+$("#apt").val();
					var location = $("#location").val();
					$("#textAddress").text(addressFullName);
					$("#textLocation").text(location); */
					searchAddress();
				}
			});
		},function(){
			return false ;
		});
	});
	
	function submitToAdd2(){
		var ret = true;
		$("[required=required2]").each(function(e){
			if($(this).val() == ""){
				MessageBox.dialog($(this).attr('title')+ '<s:message code="address.msg.000019"/>');
				$(this).focus();
				ret = false ;
				return false;
			}
		});
		return ret;
	}
	
	function check_num(num, obj) {
		 var val = "0123456789";
		 var len = num.length;
		 
		 for(var i=0; i<len; i++) {
			  if(val.indexOf(num.substring(i, i+1)) < 0) {
				MessageBox.dialog('<s:message code="address.msg.000020"/>');
			   obj.val("");
			   obj.focus();
			   return;
			  }
	     }
	}
	
});
</script>
		   
<table width="100%" cellpadding="0" cellspacing="0" border="1" class="table_list01 mt_5" id="insertForm">
	<colgroup>
		<col width="65%" /><col width="20%" /><col width="15%" />
	</colgroup>
	 <tr id="onlySearch">
		<th><s:message code="ar.ar22.label.000010"/></th>
		<th><s:message code="co.label.location"/></th>		
		<th><s:message code="cmn.btn.select"/></th> 
	</tr>
    <c:choose>
    <c:when test="${mode eq 'SELECT'}">
   
	
	
	<c:choose>
	<c:when test="${pagination.objectsCount gt 0}">	
	<c:forEach items="${list}" var="address" varStatus="status">
	<c:set value="${status.count}" var="totalCount"/>
	<tr ${status.count % 2 == 0 ? 'class="row02"' : ''}>
		<td><a href="#" id="selectAddressS">${address.addressFullName}</a></td>
		<td><a href="#" id="selectAddressS">${address.location}</a></td>			
		<td>		
		<input type="hidden" id="addressFullName1" name="addressFullName1" value="${address.addressFullName}"/>		
		<input type="hidden" id="addNum1" name="addNum1" value="${address.addNum}"/>		
		<div class="contents_box mt_5 both"><span class="btns3 save"><input type="submit"  id="selectAddressS" value="<s:message code="cmn.btn.select"/>"/></span></div></td>
			
	</tr>
	</c:forEach>
	<c:forEach begin="${totalCount+1}" end="${pagination.objectsPerPage}" step="1" varStatus="status">
    <tr ${status.count % 2 == 0 ? 'class="row02"' : ''} > 
	    <td style="height:23px">&nbsp;</td>
	    <td>&nbsp;</td>
	    <td>&nbsp;</td>
    </tr>
    </c:forEach>
	</c:when>
	<c:otherwise>
	<tr id="noView">
		<td colspan="3"><s:message code="address.msg.000028"/></td>		
	</tr>	
	</c:otherwise>
	</c:choose>
	</c:when>
	<c:otherwise>
	<%-- <colgroup>
		<col width="10%" /><col width="12%" /><col width="15%" /><col width="15%" /><col width="10%" /><col width="11%" /><col width="12%" /><col width="50%" />
	</colgroup>
	<tr id="columnForm">
		<th><s:message code="ccs.csCccs000.taskHistoryListTable.lable.addNum"/></th>
		<th><s:message code="co.label.city"/></th>
		<th><s:message code="co.label.district"/></th>
		<th><s:message code="co.label.subDistrict"/></th>
		<th><s:message code="co.label.building"/></th>
		<th><s:message code="co.label.entrance"/></th>
		<th><s:message code="co.label.apt"/></th>
		<th><s:message code="cmn.btn.select"/></th> 
	</tr> --%>
	
	<c:choose>
	<c:when test="${pagination.objectsCount gt 0}">	
	<c:forEach items="${list}" var="address" varStatus="status">
	<c:set value="${status.count}" var="totalCount"/>
	<tr ${status.count % 2 == 0 ? 'class="row02"' : ''}>
		<%-- <td><input type="text" class="form_normal01" style="width:95%;" id="addNum" name="addNum" value="${address.addNum}" required="N" readonly/></td>
		<td><input type="text" class="form_normal01" style="width:95%;" id="city" name="city" value="${address.city}"/></td>
		<td><input type="text" class="form_normal01" style="width:95%;" id="district" name="district" value="${address.district}"/></td>
		<td><input type="text" class="form_normal01" style="width:95%;" id="subDistrict" name="subDistrict" value="${address.subDistrict}"/></td>
		<td><input type="text" class="form_normal01" style="width:95%;" id="building" name="building" value="${address.building}"/>	</td>
		<td><input type="text" class="form_normal01" style="width:95%;" id="entrance" name="entrance" value="${address.entrance}"/></td>
		<td><input type="text" class="form_normal01" style="width:95%;" id="apt" name="apt" value="${address.apt}"/></td></td>		
		<input type="hidden" id="addressFullName" name="addressFullName" value="${address.addressFullName}"/>
		<input type="hidden" id="location" name="location" value="${address.location}"/><div class="contents_box mt_5 both"><span class="btns3 save"><input type="submit"  id="updateAddress" value="modify"/></span> <span class="btns3 save"><input type="submit" id="	Address" value= '<s:message code="cmn.btn.delete"/>' /></span></div></td>
		</td>	 --%>	
		<%-- <table width="100%" cellpadding="0" cellspacing="0" border="1" class="table_list01 mt_5" id="updateForm">
			<colgroup>
				<col width="10%" /><col width="35%" /><col width="10%" /><col width="35%" /><col width="10%" />
			</colgroup>
			<tr>
			    <th><s:message code="ccs.csCccs000.taskHistoryListTable.lable.addNum"/></th>
				<td><input type="text" class="form_normal01" style="width:95%;" id="addNum" name="addNum" value="${address.addNum}" required="N" readonly/></td>
				<th><s:message code="co.label.city"/></th>
				<td><input type="text" class="form_normal01" style="width:95%;" id="city" name="city" title="city" value="${address.city}"/></td>
				<td rowspan="4"><div class="contents_box mt_5 both"><span class="btns3 save"><input type="submit"  id="updateAddress" value="modify"/></span> <span class="btns3 save"><input type="submit" id="deleteAddress" value= '<s:message code="cmn.btn.delete"/>' /></span></div></td>
			</tr>
			<tr>
			    <th><s:message code="co.label.district"/></th>
				<td><input type="text" class="form_normal01" style="width:95%;" id="district" name="district" value="${address.district}""/></td>
				<th><s:message code="co.label.subDistrict"/></th>
				<td><input type="text" class="form_normal01" style="width:95%;" id="subDistrict" name="subDistrict" value="${address.subDistrict}"/></td>
			</tr>
			<tr>
			    <th><s:message code="co.label.building"/></th>
				<td><input type="text" class="form_normal01" style="width:95%;" id="building" name="building" value="${address.building}"/></td>
				<th><s:message code="co.label.entrance"/></th>
				<td><input type="text" class="form_normal01" style="width:95%;" id="entrance" name="entrance" value="${address.entrance}"/></td>
			</tr>
			<tr>
			    <th><s:message code="co.label.apt"/></th>
				<td><input type="text" class="form_normal01" style="width:95%;" id="apt" name="apt" value="${address.apt}"/></td>
				<th><s:message code="co.label.location"/></th>
				<td><input type="text" class="form_normal01" style="width:95%;" id="location" name="location" value="${address.location}"/></td>
			</tr>
		</table> --%>
		<td id="textAddress">${address.addressFullName}</td>
		<td id="textLocation">${address.location}</td>			
		<td>		
		<input type="hidden" id="addressFullNameU" name="addressFullNameU" value="${address.addressFullName}"/>		
		<input type="hidden" id="addNumU" name="addNumU" value="${address.addNum}"/>		
		<input type="hidden" id="cityU" name="cityU" value="${address.city}"/>		
		<input type="hidden" id="districtU" name="districtU" value="${address.district}"/>		
		<input type="hidden" id="subDistrictU" name="subDistrictU" value="${address.subDistrict}"/>		
		<input type="hidden" id="buildingU" name="buildingU" value="${address.building}"/>		
		<input type="hidden" id="entranceU" name="entranceU" value="${address.entrance}"/>		
		<input type="hidden" id="aptU" name="aptU" value="${address.apt}"/>		
		<input type="hidden" id="locationU" name="locationU" value="${address.location}"/>		
		<div class="contents_box mt_5 both"><span class="btns3 save"><input type="submit"  id="updateAddress" value="modify"/></span> <span class="btns3 save"><input type="submit" id="deleteAddress" value= '<s:message code="cmn.btn.delete"/>' /></span></div></td>
		
	</tr>
	</c:forEach>
	<c:forEach begin="${totalCount+1}" end="${pagination.objectsPerPage}" step="1" varStatus="status">
    <tr ${status.count % 2 == 0 ? 'class="row02"' : ''} > 
    <td style="height:23px">&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
   </tr>
   </c:forEach>
	</c:when>
	<c:otherwise>
	<tr id="noView">
		<td colspan="2"><s:message code="address.msg.000032"/><s:message code="address.msg.000021"/></td> 
		<td><div class="contents_box mt_5 both"><span class="btns3 save"><input type="submit"  id="insertAddress" value="regist"/></span></div></td>
	</tr>
	<tr id="insertForm1" style="display:none">
		<div>
			<table width="100%" cellpadding="0" cellspacing="0" border="1" class="table_list01 mt_5" style="display:none" id="insertForm2">
				<colgroup>
					<col width="12%" /><col width="38%" /><col width="12%" /><col width="38%" />
				</colgroup>
				<tr>
				    <th><s:message code="ccs.csCccs000.taskHistoryListTable.lable.addNum"/></th>
					<td><input type="text" class="form_normal01" style="width:95%;" id="addNum" name="addNum" title="addNum" required="required2" maxlength="6"/></td>
					<th><s:message code="co.label.city"/></th>
					<td><input type="text" class="form_normal01" style="width:95%;" id="city" name="city" title="city" required="required2" /></td>
				</tr>
				<tr>
				    <th><s:message code="co.label.district"/></th>
					<td><input type="text" class="form_normal01" style="width:95%;" id="district" name="district" title="district" required="required2"/></td>
					<th><s:message code="co.label.subDistrict"/></th>
					<td><input type="text" class="form_normal01" style="width:95%;" id="subDistrict" name="subDistrict" /></td>
				</tr>
				<tr>
				    <th><s:message code="co.label.building"/></th>
					<td><input type="text" class="form_normal01" style="width:95%;" id="building" name="building" /></td>
					<th><s:message code="co.label.entrance"/></th>
					<td><input type="text" class="form_normal01" style="width:95%;" id="entrance" name="entrance" /></td>
				</tr>
				<tr>
				    <th><s:message code="co.label.apt"/></th>
					<td><input type="text" class="form_normal01" style="width:95%;" id="apt" name="apt" /></td>
					<th><s:message code="co.label.location"/></th>
					<td><input type="text" class="form_normal01" style="width:95%;" id="location" name="location" /></td>
				</tr>
			</table>
		</div>
		<div class="contents_box mt_5" id="insertForm1" style="display:none">
			<!-- 버튼 //-->
			<div class="f_right">
				<span class="btns7 save"><input type="submit" value="<s:message code="cmn.label.save"/>" id="registAddress" mode="I"/></span> 
			</div>
			<!--// 버튼 -->
		</div>
	</tr>	
	</c:otherwise>
	</c:choose>
	
	</c:otherwise>
	</c:choose>
</table>
<c:set var="baseUrl" value="/common/address/search"/>	
<c:if test="${pagination.objectsCount gt 0}">	
<%@include file ="../page/pagination.jsp" %>
</c:if>
<div id="detailSearch" style="display:none">
	<table width="100%" cellpadding="0" cellspacing="0" border="1" class="table_view01">
		<colgroup>
			<col width="30%" /><col width="70%" /> 
		</colgroup>
		 <br/>
		 <tr>
		    <th><s:message code="ccs.csCccs000.taskHistoryListTable.lable.addNum"/></th>
			<td><input type="text" class="form_normal01" style="width:95%;" id="addNum2" name="addNum" required="N" title="addNum" readonly/></td>
			
		</tr>
		<tr>
		    <th><s:message code="ar.ar22.label.000010"/></th>
			<td><input type="text" class="form_normal01" style="width:95%;" id="addressFullName2" name="addressFullName" readonly/></td>
			
		</tr>
		<tr>
			<th><s:message code="prm.msg.000047"/></th>
			<td>
			<input type="text" class="form_normal01"  style="width:95%" id="subAddress" name="subAddress" title="subAddress" />
			</td>
		</tr>
	</table>
</div>
<div class="contents_box mt_5" id="detailSearch2" style="display:none">
	<!-- 버튼 //-->
	<div class="f_right">
		<span class="btns7 save"><input type="submit" value="<s:message code="cmn.btn.select"/>" id="selectBtn"/></span> 
	</div>
	<!--// 버튼 -->
</div>	
<div id="detailModify" style="display:none">
	<table width="100%" cellpadding="0" cellspacing="0" border="1" class="table_view01">
		<colgroup>
			<col width="12%" /><col width="38%" /><col width="12%" /><col width="38%" /> 
		</colgroup>
		 <br/>
		 <tr>
			    <th><s:message code="ccs.csCccs000.taskHistoryListTable.lable.addNum"/></th>
				<td><input type="text" class="form_normal01" style="width:95%;" id="addNum" name="addNum" title="addNum" readonly/></td>
				<th><s:message code="co.label.city"/></th>
				<td><input type="text" class="form_normal01" style="width:95%;" id="city" name="city" title="city" /></td>
			</tr>
			<tr>
			    <th><s:message code="co.label.district"/></th>
				<td><input type="text" class="form_normal01" style="width:95%;" id="district" name="district" title="district" /></td>
				<th><s:message code="co.label.subDistrict"/></th>
				<td><input type="text" class="form_normal01" style="width:95%;" id="subDistrict" name="subDistrict" /></td>
			</tr>
			<tr>
			    <th><s:message code="co.label.building"/></th>
				<td><input type="text" class="form_normal01" style="width:95%;" id="building" name="building" /></td>
				<th><s:message code="co.label.entrance"/></th>
				<td><input type="text" class="form_normal01" style="width:95%;" id="entrance" name="entrance" /></td>
			</tr>
			<tr>
			    <th><s:message code="co.label.apt"/></th>
				<td><input type="text" class="form_normal01" style="width:95%;" id="apt" name="apt" /></td>
				<th><s:message code="co.label.location"/></th>
				<td><input type="text" class="form_normal01" style="width:95%;" id="location" name="location" /></td>
			</tr>
	</table>
</div>
<div class="contents_box mt_5" id="detailModify2" style="display:none">
	<!-- 버튼 //-->
	<div class="f_right">
		<span class="btns7 save"><input type="submit" value="<s:message code="cmn.btn.modify"/>" id="modifyBtn"/></span> 
	</div>
	<!--// 버튼 -->
</div>

