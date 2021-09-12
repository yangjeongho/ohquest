<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
var cityList = [];
var districtList = [];
var subDistrictList = [];
var buildingList = [];
var entranceList = [];
var doorList = [];

var $autocomplete11 = $('<div id="searchValue11" class="form_normal01" style="width:120px;margin-left:81px; height: 150px;position: absolute; Z-index: 1;"></div>').hide().insertAfter('#cityName');
var autocomplete2 = $('<div id="searchValue22" class="form_normal01" style="width:120px;margin-left:286px; height: 200px;position: absolute; Z-index: 1;"></>').hide().insertAfter('#districtName');
var autocomplete3 = $('<div id="searchValue33" class="form_normal01" style="width:120px;margin-left:81px; height: 200px;position: absolute; Z-index: 1;"></>').hide().insertAfter('#subDistrictName');
var autocomplete4 = $('<div id="searchValue44" class="form_normal01" style="width:120px;margin-left:286px; height: 200px;position: absolute; Z-index: 1;"></>').hide().insertAfter('#buildingName');
var autocomplete5 = $('<div id="searchValue55" class="form_normal01" style="width:120px;margin-left:81px; height: 200px;position: absolute; Z-index: 1;"></>').hide().insertAfter('#entranceName');
var autocomplete6 = $('<div id="searchValue66" class="form_normal01" style="width:120px;margin-left:286px; height: 200px;position: absolute; Z-index: 1;"></>').hide().insertAfter('#doorName');




var clickAddr = function(){
	var addressText = $(this).text();
	var cityCode = "";
	
	//해당 주소의 코드값 세팅 -> 다음 조건 자동완성위해
	for(var i=0; i<cityList.length; i++){
		if(cityList[i]['cityName'] == addressText){
			cityCode = cityList[i]['cityCode'];			
			$("#cityCode").val(cityCode);
		}
	}
	
	$("#cityName").val(addressText);
	$("#searchValue11").hide();
};

var clickAddrDis = function(){
	var addressText = $(this).text();
	var disCode = "";
	
	//해당 주소의 코드값 세팅 -> 다음 조건 자동완성위해
	for(var i=0; i<districtList.length; i++){
		if(districtList[i]['districtName'] == addressText){
			disCode = districtList[i]['districtCode'];			
			$("#districtCode").val(disCode);
		}
	}
	
	$("#districtName").val(addressText);
	$("#searchValue22").hide();
};

var clickAddrSub = function(){
	var addressText = $(this).text();
	var subDisCode = "";
	
	//해당 주소의 코드값 세팅 -> 다음 조건 자동완성위해
	for(var i=0; i<subDistrictList.length; i++){
		if(subDistrictList[i]['subDistrictName'] == addressText){
			subDisCode = subDistrictList[i]['subDistrictCode'];			
			$("#districtCode").val(subDisCode);
		}
	}
	
	$("#subDistrictName").val(addressText);
	$("#searchValue33").hide();
};

var clickAddrBul = function(){
	var addressText = $(this).text();
	var bulCode = "";
	
	//해당 주소의 코드값 세팅 -> 다음 조건 자동완성위해
	for(var i=0; i<buildingList.length; i++){
		if(buildingList[i]['buildingName'] == addressText){
			bulCode = buildingList[i]['buildingCode'];			
			$("#buildingCode").val(bulCode);
		}
	}
	
	$("#buildingName").val(addressText);
	$("#searchValue44").hide();
};

var clickAddrEntr = function(){
	var addressText = $(this).text();
	var entrCode = "";
	
	//해당 주소의 코드값 세팅 -> 다음 조건 자동완성위해
	for(var i=0; i<entranceList.length; i++){
		if(entranceList[i]['entranceName'] == addressText){
			entrCode = entranceList[i]['entranceCode'];			
			$("#entranceCode").val(entrCode);
		}
	}
	
	$("#entranceName").val(addressText);
	$("#searchValue55").hide();
};

var clickAddrDoor = function(){
	var addressText = $(this).text();
	var doorCode = "";
	
	//해당 주소의 코드값 세팅 -> 다음 조건 자동완성위해
	for(var i=0; i<doorList.length; i++){
		if(doorList[i]['doorName'] == addressText){
			doorCode = doorList[i]['doorCode'];			
			$("#doorCode").val(doorCode);
		}
	}
	
	$("#doorName").val(addressText);
	$("#searchValue66").hide();
};

function houseHoldSearchGridInit(form,  table){
	$("#"+form).find("[id=totalCnt]").text(0);
	$("#"+form).find("[id=currentCnt]").text(0);
	$("#"+table).jqGrid("clearGridData", true);
	$("#"+form +" #page").val(0);
}

$(function(e){

	
	createComboBox($("#cityCode"), baseUrl + "code/cityListbox", null, "<option value=''><s:message code="code.msg.choose"/></option>");
	
	$('#cityCode').change(function (e){
		$("#districtCode").empty().append("<option value=''><s:message code="code.msg.choose"/></option>");
		$("#subDistrictCode").empty().append("<option value=''><s:message code="code.msg.choose"/></option>");
		$("#buildingCode").empty().append("<option value=''><s:message code="code.msg.choose"/></option>");
		$("#entranceCode").empty().append("<option value=''><s:message code="code.msg.choose"/></option>");
		$("#doorCode").empty().append("<option value=''><s:message code="code.msg.choose"/></option>");
		var selectType = $(this).val();	
		createComboBox($("#districtCode"), baseUrl + "code/districtListbox", {upCodeId:selectType}, null);
		
	});
	
	$('#districtCode').change(function (e){
		$("#subDistrictCode").empty().append("<option value=''><s:message code="code.msg.choose"/></option>");
		$("#buildingCode").empty().append("<option value=''><s:message code="code.msg.choose"/></option>");
		$("#entranceCode").empty().append("<option value=''><s:message code="code.msg.choose"/></option>");
		$("#doorCode").empty().append("<option value=''><s:message code="code.msg.choose"/></option>");
		var selectType = $(this).val();	
		createComboBox($("#subDistrictCode"), baseUrl + "code/subDistrictListbox", {upCodeId:selectType}, null);
		
	});
	
	$('#subDistrictCode').change(function (e){
		$("#buildingCode").empty().append("<option value=''><s:message code="code.msg.choose"/></option>");
		$("#entranceCode").empty().append("<option value=''><s:message code="code.msg.choose"/></option>");
		$("#doorCode").empty().append("<option value=''><s:message code="code.msg.choose"/></option>");
		var selectType = $(this).val();	
		createComboBox($("#buildingCode"), baseUrl + "code/buildingListbox", {upCodeId:selectType}, null);
		
	});
	
	$('#buildingCode').change(function (e){
		
		$("#entranceCode").empty().append("<option value=''><s:message code="code.msg.choose"/></option>");
		$("#doorCode").empty().append("<option value=''><s:message code="code.msg.choose"/></option>");
		var selectType = $(this).val();	
		createComboBox($("#entranceCode"), baseUrl + "code/entranceListbox", {upCodeId:selectType}, null);
		
	});
	
	$('#entranceCode').change(function (e){
		
		$("#doorCode").empty().append("<option value=''><s:message code="code.msg.choose"/></option>");
		var selectType = $(this).val();	
		createComboBox($("#doorCode"), baseUrl + "code/doorListbox", {upCodeId:selectType}, null);
		
	});
	
	
	
	
	$autocomplete11.val("");
	autocomplete2.val("");
	autocomplete3.val("");
	autocomplete4.val("");	
	autocomplete5.val("");
	autocomplete6.val("");	
	
// 	$('#searchAddressForm #searchKey').val('${searchFilter.searchKey[0]}');
	
	houseHoldSearchGridInit("houseHoldSearchForm", "houseHoldSearchDivListGridTable");
	
	$("#houseHoldSearchForm #searchValue").keydown(function(e){
		
		if(e.keyCode == 13) {
			e.preventDefault();
						
			$("#searchAddressForm").click();
		}
	});
		
	//초기화
	initAddr();
	
});

function initAddr(){
	
	//주소 자동완성
	//autoAddress();
	
	//조회
	$("#searchAddressForm").click(function(e){
		
		e.preventDefault();
		
		var cityCode = $("#houseHoldSearchForm #cityCode").val();
		var districtCode = $("#houseHoldSearchForm #districtCode").val();
		var subDistrictCode = $("#houseHoldSearchForm #subDistrictCode").val();
		
		$("#houseHoldSearchForm #searchValue11").hide();
		$("#houseHoldSearchForm #searchValue22").hide();
		$("#houseHoldSearchForm #searchValue33").hide();
		$("#houseHoldSearchForm #searchValue44").hide();
		$("#houseHoldSearchForm #searchValue33").hide();
		$("#houseHoldSearchForm #searchValue44").hide();
		
		if(cityCode == "" || cityCode.length <= 0 || cityCode=='X'){
			MessageBox.dialog('<s:message code="address.msg.000001"/>');
		}else if(districtCode == "" || districtCode.length <= 0 || districtCode=='X'){
			MessageBox.dialog('<s:message code="address.msg.000002"/>');
		}else if(subDistrictCode == "" || subDistrictCode.length < 0 || subDistrictCode=='X'){
			MessageBox.dialog('<s:message code="address.msg.000003"/>');
		}else{
			$(this).loadingDialog();
			houseHoldSearchGridInit("houseHoldSearchForm", "houseHoldSearchDivListGridTable");
			houseHoldSearchGridAjaxCall(baseUrl + "common/address/houseHoldsearchList","houseHoldSearchForm", "houseHoldSearchDivListGridTable");
			$(this).hideLoading();			

// 			$("#houseHoldSearchForm #cityName").val("");
// 			$("#houseHoldSearchForm #districtName").val("");
// 			$("#houseHoldSearchForm #subDistrictName").val("");
// 			$("#houseHoldSearchForm #buildingName").val("");
// 			$("#houseHoldSearchForm #entranceName").val("");
// 			$("#houseHoldSearchForm #doorName").val("");
		}		
				
		//주소 자동완성
		//autoAddress();
	 });
	
	//네비
	$("#houseHoldSearchDivListPageNav").click(function(e){
		e.preventDefault();
		if(houseHoldSearchGridPageNavCom("houseHoldSearchForm") != false){
			$(this).loadingDialog();
			houseHoldSearchGridAjaxCall(baseUrl + "common/address/houseHoldsearchList","houseHoldSearchForm", "houseHoldSearchDivListGridTable");
			$(this).hideLoading();						
		};		
	 });

	//닫기
	$("#houseHoldSearchDiv01 #houseHoldSearchDivListCloseBtn").click(function(e){
		e.preventDefault();
		Dialog.close('#${param.dialogName}');
	});
	
	
	//확인
	$("#houseHoldSearchDiv01 #houseHoldSearchDivListConfirmBtn").click(function(e){
		if($("#houseHoldSearchDiv01 #subAddress").val() == ''){
			MessageBox.dialog('<s:message code="address.msg.000004"/>');
			return;
		}
		var jsonData = {
				addressFullName : $("#houseHoldSearchDiv01 #addressFullName").val(),
				addNum: $("#houseHoldSearchDiv01 #addNum").val(),
				doorCode: $("#houseHoldSearchDiv01 #houseDoorCode").val(),
				subAddress: $("#houseHoldSearchDiv01 #subAddress").val()
		};
		var funcName =eval('${callBackFunc}');
		funcName(jsonData);
		Dialog.close('#${param.dialogName}');
	});
	
	$("#cityName").click(function(e){
		e.preventDefault();
				
// 		$("#searchValue11").hide();
		$("#searchValue22").hide();
		$("#searchValue33").hide();
		$("#searchValue44").hide();
		$("#searchValue55").hide();
		$("#searchValue66").hide();
	});
	
	$("#districtName").click(function(e){
		e.preventDefault();
		
		$("#searchValue11").hide();
// 		$("#searchValue22").hide();
		$("#searchValue33").hide();
		$("#searchValue44").hide();
		$("#searchValue55").hide();
		$("#searchValue66").hide();
	});
	
	$("#subDistrictName").click(function(e){
		e.preventDefault();
		
		$("#searchValue11").hide();
		$("#searchValue22").hide();
// 		$("#searchValue33").hide();
		$("#searchValue44").hide();
		$("#searchValue55").hide();
		$("#searchValue66").hide();
	});
	
	$("#buildingName").click(function(e){
		e.preventDefault();
		
		$("#searchValue11").hide();
		$("#searchValue22").hide();
		$("#searchValue33").hide();
// 		$("#searchValue44").hide();
		$("#searchValue55").hide();
		$("#searchValue66").hide();
	});		
	
	$("#entranceName").click(function(e){
		e.preventDefault();
		
		$("#searchValue11").hide();
		$("#searchValue22").hide();
		$("#searchValue33").hide();
		$("#searchValue44").hide();
// 		$("#searchValue55").hide();
		$("#searchValue66").hide();
	});
	
	$("#doorName").click(function(e){
		e.preventDefault();
		
		$("#searchValue11").hide();
		$("#searchValue22").hide();
		$("#searchValue33").hide();
		$("#searchValue44").hide();
		$("#searchValue55").hide();
// 		$("#searchValue66").hide();
	});	
}

//자동완성
function autoAddress(){	
	//CITY 자동완성		
	$("#cityName").keyup(function(e){	
		var cityName = $("#cityName").val();
		
// 		$("#searchValue11").val();
		$("#searchValue22").hide();
		$("#searchValue33").hide();
		$("#searchValue44").hide();
		$("#searchValue55").hide();
		$("#searchValue66").hide();
		
		if(cityName != ""){	   
			if(event.keyCode > 40){
				$( "#cityName" ).autocomplete(	
				{	
				  	minLength: 4,
			      	source: 
			      		function () {
				      	  var data =  $("#houseHoldSearchForm").serializeArray();	
				    	  $.ajax({
				    		  type : "POST",  
				    		  async : true,
				    		  url : baseUrl+"common/address/houseHoldsearchListAuto" ,
				    		  data : data,
					   		  dataType : 'json',
					   		  success : function(data) {
					   				if(data.list.length > 0){
					   				    $autocomplete11.empty();
					   					for(var i = 0; i < data.list.length; i++) {
										       $('<div></div>').text([data.list[i].cityName]).appendTo($autocomplete11).attr('id',"autoAddr");
										       cityList.push({cityCode : data.list[i].cityCode, cityName : data.list[i].cityName});
					   					}
						   				$autocomplete11.show();
					   				}else{
						   				$autocomplete11.hide();
					   		       }		   	       		
					   	      },error:function(data){
				   				  //서버 비정상 동작시 구현
				   				  MessageBox.dialog("err.500");
					   		  }, complete:function(jqXHR, textStatus){
					   			$('[id=autoAddr]').bind('click', clickAddr);
					   		  }
				    	  });
				    },		
			      	cacheLength: 1,
			      	scroll : true,
				}
				);  	
			}else if(event.keyCode == 8){				
				if(cityName.length < 4){
					$autocomplete11.hide();
				}else if(cityName.length == 0)
					$("#cityName").val("");
					$autocomplete11.hide();
			}
		}	
	});	
	
	// District 자동완성	
	$("#districtName").keyup(function(e){
		var cityName = $("#cityName").val();
		var districtName = $("#districtName").val();
		
		$("#searchValue11").hide();
// 		$("#searchValue22").hide();
		$("#searchValue33").hide();
		$("#searchValue44").hide();
		$("#searchValue55").hide();
		$("#searchValue66").hide();

		if(districtName.length >= 4 && cityName == "" || cityName.length < 0){
			MessageBox.dialog('<s:message code="address.msg.000005"/>');
		}
		
		if(cityName != "" && districtName != "" && districtName.length >= 4){	
			if(event.keyCode > 40){
				$( "#districtName" ).autocomplete(			
					{	display: 20,
					  	minLength: 4,
				      	source: 
				      		function () {
					      	  var data =  $("#houseHoldSearchForm").serializeArray();
					    	  $.ajax({
					    		  type : "POST",  
					    		  async : false,
					    		  url : baseUrl+"common/address/houseHoldsearchListAutoDis" ,
					    		  data : data,
						   		  dataType : 'json',
						   		  success : function(data) {									
						   			  if(data.list.length > 0){					   					
						   					autocomplete2.empty();
						   					for(var i = 0; i < data.list.length; i++) {
										       $('<div></div>').text([data.list[i].districtName]).appendTo(autocomplete2).attr('id',"autoAddrD");
										       districtList.push({districtCode : data.list[i].districtCode, districtName : data.list[i].districtName});
						   					}
						   					autocomplete2.show();
						   				}		   	       		
						   	      },error:function(data){
					   				  //서버 비정상 동작시 구현
					   				  MessageBox.dialog("err.500");
						   		  }, complete:function(jqXHR, textStatus){
						   			  $('[id=autoAddrD]').bind('click', clickAddrDis);
						   		  }
					    	  });
					    },		
				      	cacheLength: 1,
					}
				);
			}else if(districtName.length < 4 && event.keyCode == 8){
				if(districtName.length == 0 && event.keyCode == 8){
					$("#districtName").val("");
					autocomplete2.hide();
				}
				autocomplete2.hide();
			}	
		}else{
			autocomplete2.hide();
		}		
	});

	//sub District 자동완성
	$("#subDistrictName").keyup(function(e){
		var cityName = $("#cityName").val();
		var districtName = $("#districtName").val();
		var subDistrictName = $("#subDistrictName").val();
		
		$("#searchValue11").hide();
		$("#searchValue22").hide();
// 		$("#searchValue33").hide();
		$("#searchValue44").hide();
		$("#searchValue55").hide();
		$("#searchValue66").hide();
		
		if(subDistrictName.length >= 4){
			if(cityName == "" || cityName.length <= 0){
				MessageBox.dialog('<s:message code="address.msg.000006"/>');
			}else if(districtName == "" || districtName.length <= 0){
				MessageBox.dialog('<s:message code="address.msg.000007"/>');
			}
		}
		
		if(cityName != "" && districtName != "" && subDistrictName != ""){	
			if(event.keyCode > 40){
				$( "#subDistrictName" ).autocomplete(	
				{
					display: 20,
				  	minLength: 4,
			      	source: 
			      		function () {
				      	  var data =  $("#houseHoldSearchForm").serializeArray();			      	
				    	  $.ajax({
				    		  type : "POST",  
				    		  async : false,
				    		  url : baseUrl+"common/address/houseHoldsearchListAutoSub" ,
				    		  data : data,
					   		  dataType : 'json',
					   		  success : function(data) {
					   				if(data.list.length > 0){					   					
					   				    autocomplete3.empty();
					   					 for(var i = 0; i < data.list.length; i++) {
									       	$('<div></div>').text([data.list[i].subDistrictName]).appendTo(autocomplete3).attr('id',"autoAddrS");									       
									        subDistrictList.push({subDistrictCode : data.list[i].subDistrictCode, subDistrictName : data.list[i].subDistrictName});
						   				}
					   					autocomplete3.show();
					   				}		   	       		
					   	      },error:function(data){
				   				  //서버 비정상 동작시 구현
				   				  MessageBox.dialog("err.500");
					   		  }, complete:function(jqXHR, textStatus){
					   			  $('[id=autoAddrS]').bind('click', clickAddrSub);
					   		  }
				    	  });
				    },		
// 			      	cacheLength: 1,
				}
				);
		    }else if(subDistrictName.length < 4 && event.keyCode == 8){
		    	if(subDistrictName.length == 0 && event.keyCode == 8){
					$("#subDistrictName").val("");
					autocomplete3.hide();
				}
				autocomplete3.hide();
			}	
		}
	});
	
	// builing 자동완성	
	$("#buildingName").keyup(function(e){
		var buildingName = $("#buildingName").val();
		
		$("#searchValue11").hide();
		$("#searchValue22").hide();
		$("#searchValue33").hide();
// 		$("#searchValue44").hide();
		$("#searchValue55").hide();
		$("#searchValue66").hide();
				
		if(buildingName != "" && buildingName.length >= 4){
			if(event.keyCode > 40){
				$( "#buildingName" ).autocomplete(			
					{	display: 20,
					  	minLength: 4,
				      	source: 
				      		function () {
					      	  var data =  $("#houseHoldSearchForm").serializeArray();					      	  	
					    	  $.ajax({
					    		  type : "POST",  
					    		  async : false,
					    		  url : baseUrl+"common/address/houseHoldsearchListAutoBul" ,
					    		  data : data,
						   		  dataType : 'json',
						   		  success : function(data) {
						   				if(data.list.length > 0){						   					
						   					autocomplete4.empty();
						   					for(var i = 0; i < data.list.length; i++) {						   						
											   $('<div></div>').text([data.list[i].buildingName]).appendTo(autocomplete4).attr('id',"autoAddrB");
											   buildingList.push({buildingCode : data.list[i].buildingCode, buildingName : data.list[i].buildingName});
								   			}
						   					autocomplete4.show();
						   				}else{
						   					autocomplete4.hide();
						   				}
						   	      },error:function(data){
					   				  //서버 비정상 동작시 구현
					   				  MessageBox.dialog("err.500");
						   		  }, complete:function(jqXHR, textStatus){
						   			 $('[id=autoAddrB]').bind('click', clickAddrBul);
						   		  }
					    	  });
					    },		
				      	cacheLength: 1,	
					}
				);	
			}else if(buildingName.length < 4 && event.keyCode == 8){
				if(buildingName.length == 0 && event.keyCode == 8){
					$("#buildingName").val("");
					autocomplete4.hide();
				}
				autocomplete4.hide();
			}
		}		
	});
	
	// entrance 자동완성	
	$("#entranceName").keyup(function(e){
		var entranceName = $("#entranceName").val();
		
		$("#searchValue11").hide();
		$("#searchValue22").hide();
		$("#searchValue33").hide();
		$("#searchValue44").hide();
// 		$("#searchValue55").hide();
		$("#searchValue66").hide();
				
		if(entranceName != ""){
			if(event.keyCode > 40){
				$( "#entranceName" ).autocomplete(			
					{	display: 20,
					  	minLength: 2,   //테스트위해 2글자로 바꿔놓음. 테스트 후 4로 바꾸면됨.
				      	source: 
				      		function () {
					      	  var data =  $("#houseHoldSearchForm").serializeArray();
					      	  	
					    	  $.ajax({
					    		  type : "POST",  
					    		  async : false,
					    		  url : baseUrl+"common/address/houseHoldsearchListAutoEntr" ,
					    		  data : data,
						   		  dataType : 'json',
						   		  success : function(data) {
						   				if(data.list.length > 0){						   					
						   					autocomplete5.empty();
						   					for(var i = 0; i < data.list.length; i++) {						   						
											   $('<div></div>').text([data.list[i].entranceName]).appendTo(autocomplete5).attr('id',"autoAddrE");
											   entranceList.push({entranceCode : data.list[i].entranceCode, entranceName : data.list[i].entranceName});
								   			}
						   					autocomplete5.show();
						   				}else{
						   					autocomplete5.hide();
						   				}
						   	      },error:function(data){
					   				  //서버 비정상 동작시 구현
					   				  MessageBox.dialog("err.500");
						   		  }, complete:function(jqXHR, textStatus){
						   			 $('[id=autoAddrE]').bind('click', clickAddrEntr);
						   		  }
					    	  });
					    },		
				      	cacheLength: 1,	
					}
				);	
			}else if(entranceName.length < 4 && event.keyCode == 8){
				if(entranceName.length == 0 && event.keyCode == 8){
					$("#entranceName").val("");
					autocomplete5.hide();
				}
				autocomplete5.hide();
			}
		}		
	});
	
	// door 자동완성	
	$("#doorName").keyup(function(e){
		var doorName = $("#doorName").val();
		
		$("#searchValue11").hide();
		$("#searchValue22").hide();
		$("#searchValue33").hide();
		$("#searchValue44").hide();
		$("#searchValue55").hide();
// 		$("#searchValue66").hide();
				
		if(doorName != ""){
			if(event.keyCode > 40){
				$( "#doorName" ).autocomplete(			
					{	display: 20,
					  	minLength: 2,     //테스트위해 2글자로 바꿔놓음. 테스트 후 4로 바꾸면됨.
				      	source: 
				      		function () {
					      	  var data =  $("#houseHoldSearchForm").serializeArray();
					      	  	
					    	  $.ajax({
					    		  type : "POST",  
					    		  async : false,
					    		  url : baseUrl+"common/address/houseHoldsearchListAutoDoor" ,
					    		  data : data,
						   		  dataType : 'json',
						   		  success : function(data) {
						   				if(data.list.length > 0){						   					
						   					autocomplete6.empty();
						   					for(var i = 0; i < data.list.length; i++) {						   						
											   $('<div></div>').text([data.list[i].doorName]).appendTo(autocomplete6).attr('id',"autoAddrDoor");
											   doorList.push({doorCode : data.list[i].doorCode, doorName : data.list[i].doorName});
								   			}
						   					autocomplete6.show();
						   				}else{
						   					autocomplete6.hide();
						   				}
						   	      },error:function(data){
					   				  //서버 비정상 동작시 구현
					   				  MessageBox.dialog("err.500");
						   		  }, complete:function(jqXHR, textStatus){
						   			 $('[id=autoAddrDoor]').bind('click', clickAddrDoor);
						   		  }
					    	  });
					    },		
				      	cacheLength: 1,	
					}
				);	
			}else if(doorName.length < 4 && event.keyCode == 8){
				if(doorName.length == 0 && event.keyCode == 8){
					$("#doorName").val("");
					autocomplete6.hide();
				}
				autocomplete6.hide();
			}
		}		
	});
}

//city 마우스오버, 아웃시
$("#searchValue11").mouseover(function(e){
	e.preventDefault();
	$(e.target).removeClass().addClass("form_normal01");  
	$("#searchValue11").removeClass().addClass("form_normal01");  
	$("#searchValue11").removeAttr('disabled', false);
}).mouseout(function(e){
	e.preventDefault();
	$(e.target).removeClass("form_normal01").addClass(); 
	$("#searchValue11").removeClass().addClass("form_normal01");  
	$("#searchValue11").removeAttr('disabled', false);
});

//district 마우스오버, 아웃시
$("#searchValue22").mouseover(function(e){
	e.preventDefault();
	$(e.target).removeClass().addClass("form_normal01");  
	$("#searchValue22").removeClass().addClass("form_normal01");  
	$("#searchValue22").removeAttr('disabled', false);
}).mouseout(function(e){
	e.preventDefault();
	$(e.target).removeClass("form_normal01").addClass(); 
	$("#searchValue22").removeClass().addClass("form_normal01");  
	$("#searchValue22").removeAttr('disabled', false);
});

//sub district 마우스오버, 아웃시
$("#searchValue33").mouseover(function(e){
	e.preventDefault();
	$(e.target).removeClass().addClass("form_normal01");  
	$("#searchValue33").removeClass().addClass("form_normal01");  
	$("#searchValue33").removeAttr('disabled', false);
}).mouseout(function(e){
	e.preventDefault();
	$(e.target).removeClass("form_normal01").addClass(); 
	$("#searchValue33").removeClass().addClass("form_normal01");  
	$("#searchValue33").removeAttr('disabled', false);
});

//builing 마우스오버, 아웃시
$("#searchValue44").mouseover(function(e){
	e.preventDefault();
	$(e.target).removeClass().addClass("form_normal01");  
	$("#searchValue44").removeClass().addClass("form_normal01");  
	$("#searchValue44").removeAttr('disabled', false);
}).mouseout(function(e){
	e.preventDefault();
	$(e.target).removeClass("form_normal01").addClass(); 
	$("#searchValue44").removeClass().addClass("form_normal01");  
	$("#searchValue44").removeAttr('disabled', false);
});

//entrance 마우스오버, 아웃시
$("#searchValue55").mouseover(function(e){
	e.preventDefault();
	$(e.target).removeClass().addClass("form_normal01");  
	$("#searchValue55").removeClass().addClass("form_normal01");  
	$("#searchValue55").removeAttr('disabled', false);
}).mouseout(function(e){
	e.preventDefault();
	$(e.target).removeClass("form_normal01").addClass(); 
	$("#searchValue55").removeClass().addClass("form_normal01");  
	$("#searchValue55").removeAttr('disabled', false);
});

//door 마우스오버, 아웃시
$("#searchValue66").mouseover(function(e){
	e.preventDefault();
	$(e.target).removeClass().addClass("form_normal01");  
	$("#searchValue66").removeClass().addClass("form_normal01");  
	$("#searchValue66").removeAttr('disabled', false);
}).mouseout(function(e){
	e.preventDefault();
	$(e.target).removeClass("form_normal01").addClass(); 
	$("#searchValue66").removeClass().addClass("form_normal01");  
	$("#searchValue66").removeAttr('disabled', false);
});

function houseHoldSearchGridPageNavCom(form){
	var totalCnt = $("#"+form).find("[id=totalCnt]").text() ;
	var currentCnt = $("#"+form).find("[id=currentCnt]").text() ;
	if(parseInt(totalCnt) == parseInt(currentCnt)) {
		return false;
	}
}

function houseHoldSearchGridAjaxCall(curl, form, table){
	var data1 =  $("#"+form).serialize();
	$.ajax({
		type : "POST",  
		async : true,
		url : curl ,
		data : data1,
		dataType : 'json',
		success : function(data) {
			if(data.list.length == 0){
				MessageBox.dialog('<s:message code="res.label.res020.000030"/>');
			}
			if (data.list.length > 0) {
// 				var list = [];
// 				var fullName = "";
				
// 				for(var i=0; i<data.list.length; i++){
// 					var city = data.list[i]['cityName'];
// 					var dis = data.list[i]['districtName'];
// 					var sub = data.list[i]['subDistrictName'];
// 					var bul = data.list[i]['buildingName'];
// 					var entr = data.list[i]['entranceName'];
// 					var door = data.list[i]['doorName'];
					
// 					list.push({userId : });
// 				}
				
				gf_addMultiGridList("#"+table,data.list);
				$("#"+form).find("[id=page]").val(data.pagination.currentPage+1);
				$("#"+form).find("[id=totalCnt]").text(data.pagination.objectsCount);
				$("#"+form).find("[id=currentCnt]").text( $("#"+table).getDataIDs().length );
			}
		},	error:function(data){
			//서버 비정상 동작시 구현
			MessageBox.dialog("err.500");
		}, complete:function(jqXHR, textStatus){
		}
	});	   
}

//상품
$("#houseHoldSearchDivListGridTable").jqGrid({
	datatype : "local",
	height : 200,
	width : 590,
	colNames : [ 
				'<s:message code="co.label.city"/>'
				,'<s:message code="co.label.district"/>' 
				,'<s:message code="co.label.subDistrict"/>'
				,'<s:message code="co.label.building"/>'
				,'<s:message code="co.label.entrance"/>'
				,'<s:message code="cos.repthouseHoldSearch.houseHoldSearchDivListGridTable.lable.Door"/>'
				,'<s:message code="co.label.addressCode"/>' 
				,'<s:message code="co.label.doorCode"/>'
		        ],  
    colModel : [ 
	              { name : 'cityName',          index : 'cityName',         sorttype : "string", align:"left"  ,width : "200"} 
	             ,{ name : 'districtName',      index : 'districtName',     sorttype : "string", align:"left"  ,width : "200"} 
	             ,{ name : 'subDistrictName',   index : 'subDistrictName',  sorttype : "string", align:"left"  ,width : "200"} 
	             ,{ name : 'buildingName',      index : 'buildingName',     sorttype : "string", align:"left"  ,width : "200"} 
	             ,{ name : 'entranceName',      index : 'entranceName',     sorttype : "string", align:"left"  ,width : "200"} 
	             ,{ name : 'doorName',          index : 'doorName',         sorttype : "string", align:"left"  ,width : "200"} 
	             ,{ name : 'addressCode',       index : 'addressCode',      sorttype : "string", align:"left"  ,width : "200", hidden : true} 
	             ,{ name : 'doorCode',          index : 'doorCode',      sorttype : "string", align:"left"  ,width : "200", hidden : true} 
	           ],
  	   	viewrecords: true,
  	   	shrinkToFit: false,
  	   	/* caption: '가입자리스트', */
       	onSelectRow: function (id, status) {
       		var rowData = $('#houseHoldSearchDivListGridTable').getRowData(id); 
//        		autoBinding("#houseHoldDetailForm", rowData);
			var address = "";			
			address = rowData.cityName+" "+rowData.districtName+" "+rowData.subDistrictName+" "+rowData.buildingName+" "+rowData.entranceName+" "+rowData.doorName;
				
			$("#houseHoldDetailForm #addNum").val(rowData.addressCode);
			$("#houseHoldDetailForm #addressFullName").val(address);
			$("#houseHoldDetailForm #houseDoorCode").val(rowData.doorCode);
       		$("#detailSearch").show();
		}
});

function houseHoldSearchDivListResult(data){
	if(data.resultCode == "SUCCESS"){
		$("#houseHoldSearchDivListCloseBtn").click();
	}
}

</script>
<div id="houseHoldSearchDiv01">
	<div class="contents_box">
		<form id="houseHoldSearchForm" method="post">
		<input type="hidden" id="page" name="page" value="0" /> 
		<input type="hidden" id="callBackFunc" name="callBackFunc" value="0" /> 
		
			<div class="search_box_01" style="">
				<div class="f_left">
					<p>
					<span style="margin-left : 51px">&nbsp;<s:message code="co.label.city"/></span>			    	
						<select class="form_select01" id="cityCode" name="cityCode" style="width:120px;margin-left:2px"  autofocus="autofocus" tabindex="1">
							<option value=''><s:message code="code.msg.choose"/></option>
			 	 		</select>
				    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<s:message code="co.label.building"/>			    	
						<select class="form_select01" id="buildingCode" name="buildingCode" style="width:120px;margin-left:1px" tabindex="4">
							<option value=''><s:message code="code.msg.choose"/></option>
			 	 		</select>
					</p>
					<p class="nextline">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<s:message code="co.label.district"/>			    	
						<select class="form_select01" id="districtCode" name="districtCode" style="width:120px;margin-left:2px" tabindex="2">
							<option value=''><s:message code="code.msg.choose"/></option>
			 	 		</select>		
				    	&nbsp;&nbsp;<s:message code="co.label.entranceName"/>				    	
						<select class="form_select01" id="entranceCode" name="entranceCode" style="width:120px;margin-left:1px" tabindex="5">
							<option value=''><s:message code="code.msg.choose"/></option>
			 	 		</select>		    	
						<input type="hidden" id="mode" name="mode" value="${mode}">
					</p>
					<p class="nextline">
					    &nbsp;&nbsp;<s:message code="co.label.subDistrict"/>		    	
						<select class="form_select01" id="subDistrictCode" name="subDistrictCode" style="width:120px;margin-left:2px" tabindex="3">
							<option value=''><s:message code="code.msg.choose"/></option>
			 	 		</select>		
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<s:message code="co.label.doorName"/>		    	
						<select class="form_select01" id="doorCode" name="doorCode" style="width:120px;margin-left:1px" tabindex="6">
						<option value=''><s:message code="code.msg.choose"/></option>
			 	 		</select>				 
					</p>
				</div>
				<div class="f_right mt_25">
					<img src="<c:url value="/resources/images/common/line_01.gif"/>" /> <span class="btns9 save">
					<input type="button" 	value='<s:message code="cmn.btn.search"/>'  id="searchAddressForm" tabindex="7"/></span>
				</div>
			</div>
			
			<div class="contents_box f_left mr_20" style="width: 100%; ">
				<!-- 타이틀 영역  //-->
				<div class="title">
					<ul class="btn_listtop f_right">
						
						<li class="page"><span class="text" id="currentCnt"></span> <s:message code="co.label.slash"/> <span class="text" id="totalCnt"></span></li>
						<li><a href="#" id="houseHoldSearchDivListPageNav"><img src="<s:url value="/resources/images/btn/btn_page.gif"/>" /></a></li>
					</ul>
				</div>			
				<div class="contents_box mt_5">
					<table id="houseHoldSearchDivListGridTable"></table>
				</div>
			</div>
		</form>
	</div>
	<br/>
	<form id="houseHoldDetailForm">
	
		<table width="100%" cellpadding="0" cellspacing="0" border="1" class="table_view01">
			<colgroup>
				<col width="30%" />
				<col width="70%" />
			</colgroup>
			<tr>
				<th><s:message code="ccs.csCccs000.taskHistoryListTable.lable.addNum"/></th>
				<td>
				<input type="text" class="form_disable" style="width: 100%;" id="addNum" name="addNum"  title="addNum" readonly />
				<input type="hidden" id="houseDoorCode" name="houseDoorCode"   />
				</td>
			</tr>
			<tr>
				<th><s:message code="ar.ar22.label.000010"/></th>
				<td><input type="text" class="form_disable" style="width: 100%;" id="addressFullName" name="addressFullName" readonly /></td>

			</tr>
		</table>
		<div id="detailSearch" style="display: none">
		<table width="100%" cellpadding="0" cellspacing="0" border="1" class="table_view01 mt_5">
			<colgroup>
				<col width="30%" />
				<col width="70%" />
			</colgroup>
			<c:if test="${mode eq 'Y'}">	
			<tr>
				<th class="key"><s:message code="prm.msg.000047"/></th>
				<td><input type="text" class="form_normal01" style="width: 100%" id="subAddress" name="subAddress" title="subAddress" /></td>
			</tr>
			</c:if>
			
		</table>
		<c:if test="${empty mode}">	
			<input type="hidden" class="form_normal01" style="width: 95%" id="subAddress" name="subAddress" title="subAddress" /></td>
		</c:if>
	</div>
   </form>
	<!-- 컨텐츠를 감싸는 박스 //-->
	<div class="contents_box mt_5 both">
		<!-- 버튼 //-->
		<div class="f_right">
		<span class="btns9 save"><input type="button" value= '<s:message code="cmn.btn.confirm"/>'  id="houseHoldSearchDivListConfirmBtn" /></span>
			<span class="btns7 save"><input type="button" value= '<s:message code="cmn.btn.close"/>'  id="houseHoldSearchDivListCloseBtn" /></span>
		</div>
		<!--// 버튼 -->
	</div>

</div>

