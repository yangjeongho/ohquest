/* 각 메뉴에 대한 별도 스크립트 include  */



var console = window.console || {log:function() {}}; // IE8이하일경우 이 코드를 삽입
function trace(){
	var args = arguments.length ;
	var jqObj = null;
	var message = null;
	if(args==1){
		message = arguments[0];	
	}else if(args==2){
		jqObj = arguments[0];	
		message = arguments[1];	
	}
	if(jqObj != null && jqObj.id != '') console.log('[ log ] '+ jqObj.id + ' : ' + message);
	else console.log('[ log ] ' + message);
}

/**
 * json데이타를 binding할 폼명에 name에 해당되는 컨트롤이 있을때 데이타를 자동바인딩한다.  
 * usage : autoBinding("#customerRegistForm", {custName : '홍길동', custDvCode : '1', yesNo : 'N', chk2 : '1,2'});
 * @param bindingFormName
 * @param bindingJsonData
 */
function autoBinding(bindingFormName, bindingJsonData){
	try{
		$.each(bindingJsonData, function(itemName,itemValue){
			itemName = itemName.replace(/[.]/g, '\\.');
			if($(bindingFormName).find("[id="+itemName+"]").length > 0){
				$(bindingFormName).find("[id="+itemName+"]").each(function(e){
					if($(this).is(":radio")){
						$(this).removeAttr("checked");
						if($(this).val() == itemValue){
							$(this).attr("checked", "checked");
						}
					}else if($(this).is(":checkbox")){
						$(this).removeAttr("checked");
						var chkValue = itemValue.split(',');
						for(var i=0; i<chkValue.length;i++){
							if($(this).val() == chkValue[i]){
								$(this).attr("checked", "checked");
							}	
						}					
					}else if($(this).is("textarea")){
						$(this).val(itemValue);	
					}else if($(this).is("input")){
						$(this).val(itemValue);	
					}else if($(this).is("select")){
						//TODO : multi select 시에는 별도처리 필요함.
						$(this).val(itemValue);	
					}else if($(this).is("div") || $(this).is("span") || $(this).is("label")){
						$(this).html(itemValue);	
					}
				});
			}
		});
	}catch(e){
		//alert(e);
	}
}

/**
 * 글자 byte 계산
 * 한글 2byte 계산한 입력 값 length 계산 
 */
function getByteLength(strValue, maxLength) {
    var retValue = {byteLength:0, splitLength: 0};
	var byteLength = 0;
    var index = 0 ;
    var splitIndex = 0 ;
	for(index = 0; index < strValue.length; index++) {
		var oneChar = escape(strValue.charAt(index));
		if(oneChar.length == 1) {
			byteLength ++;
		}else if(oneChar.indexOf("%u") != -1) {
			byteLength += 2;
		}else if(oneChar.indexOf("%") != -1) {
			byteLength += oneChar.length/3;
		}
		
		if(splitIndex == 0 && byteLength > maxLength){
			splitIndex = index ;
		}
	}
	retValue.byteLength = byteLength;
	retValue.splitLength = splitIndex ;
	return retValue;
}

function checkInputLength(objectText, maxLength){
	
	var retVal = getByteLength($(objectText).val(), maxLength) ;
	if(retVal.byteLength > maxLength){
		var itemName = $(objectText).attr('title') ;
		if(typeof(itemName) != 'undefined' && itemName != ''){
			itemName +=  '는(은) ';
		}else{
			itemName = '' ;
		}
		alert(itemName + maxLength + 'byte 이하로 입력하세요.\n한글1자 2byte, 영문 및 숫자는 1byte로 계산됩니다.');
		$(objectText).val( $(objectText).val().substring(0, retVal.splitLength));
		return false ;
	}
	return true ;
}

function encodeStr(str){
	var org = new Array(/&/g,/"/g,/'/g,/</g,/>/g);
	var encode = new Array("&amp;", "&#34;", "&#39;", "&lt;", "&gt;");
	for(var i=0; i<org.length;i++) {
		str = str.replace(org[i], encode[i]);
	}
	return str ;
}

/**
 *	시작/종료일 체크
 *  parameter1 : 시작일 
 *  parameter2 : 종료일 
 *  parameter3 : [일자간격]
 */
function compareBeginEndDate(){
	var startDateObj = null;
	var endDateObj  = null;
	var gapDate = 0;
	var args = arguments.length ;
	if(args==2){
		startDateObj = arguments[0];	
		endDateObj = arguments[1];	
	}else if(args==3){
		startDateObj = arguments[0];	
		endDateObj = arguments[1];	
		gapDate = eval(arguments[2]);	
	}
	
	if ( $(startDateObj).val()=="" ){
		alert('Input Start Date!');
		return false ;
	}
	if ( $(endDateObj).val()=="" ){
		alert('Input End Date!');
		return false ;
	}
	var startDate = new Date($(startDateObj).val());
	var endDate = new Date($(endDateObj).val());
	startDate.setDate(startDate.getDate() + gapDate );
	var startMonth = (( startDate.getMonth() < 9 ) ? "0" : "") + ( startDate.getMonth() + 1 );
	var startDay = (( startDate.getDate()  < 10 ) ? "0" : "") + startDate.getDate() ;
	var endMonth = (( endDate.getMonth() < 9 ) ? "0" : "") + ( endDate.getMonth() + 1 );
	var endDay = (( endDate.getDate() < 10 ) ? "0" : "") + endDate.getDate();    	
	
	var _startDate = Number(startDate.getFullYear() + startMonth + startDay);
	var _endDate = Number(endDate.getFullYear() + endMonth + endDay);	
	endDate.setDate(endDate.getDate() + gapDate );
	var endMonth2 = (( endDate.getMonth() < 9 ) ? "0" : "") + ( endDate.getMonth() + 1 );
	var endDay2 = (( endDate.getDate() < 10 ) ? "0" : "") + endDate.getDate();    	
	var _endDate2 =Number(endDate.getFullYear() + endMonth2 + endDay2);	
	
	if ( gapDate > 0 && _endDate - _startDate > 0 ){
		alert('Less than '+gapDate+' day between the start and end dates are available!');
		return false ;	
		//return true ;	
	}
	if ( _startDate - _endDate2 > 0 ){
		alert('The start date is earlier than the end date.');
		return false ;
	}
	return true ;
}


/**
 *	defaultAjaxCall
 *  url : url
 *  formName : form
 *  successMessage : 성공메시지
 *  failMessage: 실패메시지
 *  redirectFunction: 호출될 함수
 *  isASync: 싱크여부
 */
function defaultAjaxCall(url, formName,  successMessage, failMessage, redirectFunction, isASync, loadingDiv) {
	if (loadingDiv != "" && loadingDiv != null) {
		divMask(loadingDiv,"Uploading...");
	}
	$.ajax({
		type : "POST",  
		async:isASync,
		url: url,
		data: $("#"+formName).serialize(),
		dataType:"json",
		success : function(data) {
			if(data.resultCode == "SUCCESS"){
				if(successMessage!="")
					MessageBox.dialog(successMessage, function(){
						if( redirectFunction != null ){
							redirectFunction(data);	
						}
					});
			}else{
				if(failMessage!="")
					MessageBox.dialog(failMessage, function(){
						if( redirectFunction != null ){
							redirectFunction(data);	
						}
					});
			}
				
		},
		error:function(data){
			MessageBox.dialog(failMessage);
		},
		complete:function(jqXHR, textStatus){
			if (loadingDiv != "" || loadingDiv != null) {
				divUnmask(loadingDiv);
			}
		}
	});	
}


/**
 *	defaultAjaxCall
 *  url : url
 *  formName : form
 *  successMessage : 성공메시지
 *  failMessage: 실패메시지
 *  redirectFunction: 호출될 함수
 *  isASync: 싱크여부
 */
function defaultGetAjaxCall(url, successMessage, failMessage, redirectFunction, isASync) {
	$.ajax({
		type : "GET",  
		async: isASync,
		url  : url,
		dataType:"json",
		success : function(data) {
			if(data.resultCode == "SUCCESS"){
				if(successMessage!="")
					alert(successMessage);
			}else{
				if(failMessage!="")
					alert(failMessage);
			}
			if( redirectFunction != null )
				redirectFunction(data);
		},
		error:function(data){
			alert(failMessage);
		}
	});	
}


/**
 * 코드로 listbox 생성하는 공통 스크립트 
 * @param setObject
 * @param callUrl
 * @param jsonParamData
 * @param noneSelect
 * @param async
 * @returns
 */
function createComboBox(){
	var setObject = null ;
	var callUrl = null;
	var jsonParamData = null;
	var noneSelect = null;
	var async = false ;
	var returnData = '';
	
	var args = arguments.length ;
	if(args==4){
		setObject = arguments[0];	
		callUrl = arguments[1];	
		jsonParamData = arguments[2];	
		noneSelect = arguments[3];	
	}else if(args==5){
		setObject = arguments[0];	
		callUrl = arguments[1];	
		jsonParamData = arguments[2];	
		noneSelect = arguments[3];	
		async = arguments[4];	
	}else{
		alert('Invalid script call method!');
		return ;
	}
	 
	$.ajax({
		type : "GET",  
		async : async,
		url : callUrl,
		dataType : 'html',
		data : jsonParamData,
		success : function(data) {
			returnData = data;
			$(setObject).empty()
						.append(noneSelect!=null ? noneSelect : "<option value='X'>Choose</option>")
						.append(data)
						; //콤보박스
			
			return returnData ;			
		
		},
		error:function(data){
			alert("서버가 잠시 중단 되었습니다. 잠시 후 다시 이용하여 주시기 바랍니다.");
		}, complete:function(jqXHR, textStatus){
			loadingInit(); 
		}
	});	
}




/**
 * function : gf_openDialog
 * Description : 화면을 오픈 한다.
 * 예) strTitle
 * @param strdialogDivName     String   : divisition 명
 * @param strUrl               String   : 오픈할 화면
 * @param strParam             String   : get방식으로 서버에 보낼 값 cust=1234&entrno=213123
 * @param intTitle             String   : 타이틀명
 * @param intWidth             String   : 폭
 * @param strHeight            String   : 높이
 * @param strModal             boolean   : 모달여부
 * @returns
 */
function gf_openDialog(strdialogDivName, strUrl, strParam, strTitle, intWidth, intHeight, boolModal) {
    console.log(strParam);
	Dialog.open({
		div : strdialogDivName, 
		url : baseUrl+strUrl+"?"+strParam, 
		title : strTitle, 
		width : intWidth, 
		height : intHeight, 
		modal : boolModal
	});

}

/**
 * function : gf_openDialog 
 * Description : 화면을 오픈 한다.
 * 예) strTitle
 * 
 * var pageDialOpt = {
 * 		strdialogDivName: "#dialogContent", 
		strUrl: "or/user/orUser000", 
		strTitle : "열려라 다이얼로그",
		formId 	 : "orUserForm",
		boolModal : true
		intWidth : 122,
		intHeight : 5500,
		boolModal : false
 * }
 * 
 * gf_openDialog1(pageDialOpt)
 * @param strdialogDivName     String   : divisition 명
 * @param strUrl               String   : 오픈할 화면
 * @param strParam             String   : get방식으로 서버에 보낼 값 cust=1234&entrno=213123
 * @param formId	           String   : form의 값을 가져다 서버에 보낸다. 
 * @param intTitle             String   : 타이틀명
 * @param intWidth             int   : 폭       default: 1176
 * @param strHeight            int   : 높이      default: 400
 * @param strModal             boolean   : 모달여부   default: true
 * @returns
 * 
 */
function gf_openDialog1(options) {
	
	var defaults = {
		strdialogDivName: null, 
		strUrl: null, 
		strParam : null,
		strTitle : null,
		formId 	 : null,
		intWidth : 1176,
		intHeight : 400,
		boolModal : true
	};
	
	var settings = $.extend({},defaults,options);
	var strParam = null;
	var url = baseUrl+ settings.strUrl;
	
		//query string이 없고  from id가 있을때
		if(settings.strParam == null && settings.formId != null){
			
			strParam = $("#"+settings.formId).serialize();
	
		//query string이 있고  from id가 없을때		
		} else if ( settings.strParam != null &&	settings.formId == null){
			
			strParam = settings.strParam;
		
		//둘 다 있을때
		} else if (settings.strParam != null && settings.formId != null){
			
			strParam = settings.strParam + $("#"+settings.formId).serialize();
			
		//둘 다 없을때	
		} else{
			
			strParam = "";
		}
	
	Dialog.open({
		
			div 	: settings.strdialogDivName, 
			url 	: url+"?"+strParam, 
			title 	: settings.strTitle, 
			width 	: settings.intWidth, 
			height 	: settings.intHeight, 
			modal 	: settings.boolModal
	});
	
}

//그리드에선 선택된 한개 row 반환
function gf_getSelectedGridData(){
	var jqGridName = null;
	var args = arguments.length ;
	var addKeyId = true;
	if(args==1){
		jqGridName = arguments[0];	
	}else if(args==2){
		jqGridName = arguments[0];	
		addKeyId = arguments[1];	
	}
	var retJson = null ;
	var selectedRowArray = $(jqGridName).jqGrid('getGridParam','selrow');
	var selectedRows = null ;
	if(selectedRowArray != "" && selectedRowArray != null){ 
		selectedRows = selectedRowArray;
		var data = $(jqGridName).getRowData(selectedRows) ;
		data.keyId = selectedRows;
		if(addKeyId == true || addKeyId == 'true'){
			data.keyId= selectedRows;
		}else{
			delete data['keyId'] ;
		}
		retJson = data ;
	}
	return retJson;
}
//그리드에선 선택된 multi row 반환
function gf_getMultiSelectedGridData(){
	var jqGridName = null;
	var args = arguments.length ;
	var addKeyId = true;
	if(args==1){
		jqGridName = arguments[0];	
	}else if(args==2){
		jqGridName = arguments[0];	
		addKeyId = arguments[1];	
	}
	var retJson = new Array();
	var selectedRowArrays = $(jqGridName).jqGrid('getGridParam','selarrrow');
	if(selectedRowArrays != "" && selectedRowArrays != null && selectedRowArrays.length>0){
		for ( var i = 0; i < selectedRowArrays.length; i++) {
			var data = $(jqGridName).getRowData(selectedRowArrays[i]) ;
			if(addKeyId == true || addKeyId == 'true'){
				data.keyId= selectedRowArrays[i];
			}else{
				delete data['keyId'] ;
			}
			retJson.push(data);
		}
	}
	
	return retJson;
}
//그리드의 모든 row 반환
function gf_getAllGridData(){
	var jqGridName = null;
	var args = arguments.length ;
	var addKeyId = true;
	if(args==1){
		jqGridName = arguments[0];	
	}else if(args==2){
		jqGridName = arguments[0];	
		addKeyId = arguments[1];	
	}
	var retJson = new Array();
	var allRowArray = $(jqGridName).jqGrid('getDataIDs') ;
	for ( var i = 0; i < allRowArray.length; i++) {
		var data = $(jqGridName).getRowData(allRowArray[i]) ;
		
		if(addKeyId == true || addKeyId == 'true'){
			data.keyId= allRowArray[i];
		}else{
			delete data['keyId'] ;
		}
		//alert('addKeyId='+addKeyId + ', data=' + JSON.stringify(data));
		retJson.push(data);
	}
	return retJson;
}
//그리드에 있는 마지막 rowid 구하기 
function gf_getMaxIndex(jqGridName){
	var gridListIds = $(jqGridName).jqGrid('getDataIDs') ;
	if(gridListIds == "" || gridListIds == null || gridListIds.length ==0) {
		return 0;
	}
	else {
		return eval(gridListIds[gridListIds.length-1]) ;
	}
}
//그리드에 한row 추가 
function gf_addGridList(jqGridName, jsonData){
	if(jsonData != "" && jsonData != null && typeof(jsonData.length) != "undefined"){ // json 배열이 한개 넘어올떄
		var rowid = parseInt(gf_getMaxIndex(jqGridName));
		for(var i=0 ; i < jsonData.length ; i++){
			jQuery(jqGridName).jqGrid('addRowData', ++rowid, jsonData[i]);
		}
	}else if(jsonData != "" && jsonData != null){//배열이 아닌 단순 json데이타 넘어올때
		var rowid = parseInt(gf_getMaxIndex(jqGridName));		
		jQuery(jqGridName).jqGrid('addRowData', ++rowid, jsonData); 
	}
}

//그리드에 Multi row 추가 
function gf_addMultiGridList(jqGridName, jsonData){
	if(jsonData != "" && jsonData != null){
		var rowid = gf_getMaxIndex(jqGridName);
		for(var i=0 ; i < jsonData.length ; i++){
			jQuery(jqGridName).jqGrid('addRowData', ++rowid, jsonData[i]);
		}
	}
}
//gridData update
function gf_updateGridRow(jqGridName, rowid, jsonData){
	$(jqGridName).jqGrid('setRowData', rowid, jsonData); 
}
//gridData delete 하기
function gf_deleteGridRow(jqGridName, rowid){
	$(jqGridName).jqGrid('delRowData', rowid);
}

//선택된 gridDataList delete 하기
function gf_deleteSelectedGridRow(jqGridName){
	var selIds = $(jqGridName).getGridParam("selarrrow");
	if(selIds == null || selIds.length ==0){
		selIds = $(jqGridName).getGridParam("selrow");
	}
	var delRowId = [];
	if (selIds != '' && selIds != null){
		for(var k=0; k < selIds.length; k++){
			delRowId.push(selIds[k]);
		}
	}
	if (delRowId.length>0){
		for(var k=0; k < delRowId.length; k++){
			gf_deleteGridRow($(jqGridName), delRowId[k]); 
		}
	}
}

//그리드 클리어 
function gf_clearGridList(jqGridName){
	$(jqGridName).jqGrid("clearGridData", true);
	/*
	var selIds = $(jqGridName).jqGrid('getDataIDs') ;
	if (selIds != '' && selIds != null){
		for(var k=0; k < selIds.length; k++){
			$(jqGridName).jqGrid('delRowData', selIds[k]);
		}
	}*/
}

//그리드의 속성에 해당하는 값이 있는 rowid 리턴
function gf_getRowIdByColumnInfo(jqGridName, columnName, columnValue){
	var selIds = $(jqGridName).jqGrid('getDataIDs') ;
	var retRowId = ''; 
	if (selIds != '' && selIds != null){
		for(var k=0; k < selIds.length; k++){
			var gridJsonData = $(jqGridName).jqGrid('getRowData', selIds[k]);
			$.each(gridJsonData, function(itemName, itemValue){
				if(itemName == columnName && itemValue == columnValue){
					retRowId = selIds[k];
					return false ;
				}
			});
			if(retRowId != ''){
				break ;
			}
		}
	}
	return retRowId; 
}

// 그리드의 속성에 해당하는 값이 있는 데이타 리턴 (jqGridName, columnName, columnValue, [true|false])
function gf_getGridDataByColumnInfo(){
	
	var jqGridName = null;
	var columnName = null;
	var columnValue = null;
	var addKeyId = true;
	var args = arguments.length ;
	if(args==3){
		jqGridName = arguments[0];	
		columnName = arguments[1];	
		columnValue = arguments[2];	
	}else if(args==4){
		jqGridName = arguments[0];	
		columnName = arguments[1];	
		columnValue = arguments[2];		
		addKeyId = arguments[3];	
	} 
	
	var selIds = $(jqGridName).jqGrid('getDataIDs') ;
	var retRowData= null; 
	if (selIds != '' && selIds != null){
		for(var k=0; k < selIds.length; k++){
			var gridJsonData = $(jqGridName).jqGrid('getRowData', selIds[k]);
			$.each(gridJsonData, function(itemName, itemValue){
				if(itemName == columnName && itemValue == columnValue){
					if(addKeyId == true){
						gridJsonData.keyId= selIds[i];						 
					}
					retRowData = gridJsonData;
					return false ;
				}
			});
			if(retRowData != ''){
				break ;
			}
		}
	}
	return retRowData; 
}
//그리드의 rowid에 해당하는 데이타 리턴
function gf_getGridDataByRowId(jqGridName, rowid){
	return $(jqGridName).jqGrid('getRowData', rowid);
}

//체크박스 헤더 disable
function gf_chkBoxHdDisable(jqGridName){
	
	$("#cb_"+jqGridName).attr("disabled","disabled");
}


//grid total row 구하기
function gf_getTotalRow(jqGridName){
	
	var totalRow = jQuery(jqGridName).jqGrid('getGridParam', 'reccount');
	
	return totalRow;
}


function gf_getTodayDate(){
	var argSize = arguments.length ;
	var _date  = new Date();
	var pattern = "/" ;
	if(argSize == 1){
		_date  = new Date(arguments[0]);
	}else if(argSize == 2){
		_date  = new Date(arguments[0]);
		pattern  = arguments[1];
	}
	
	var _year  = _date.getFullYear();
	var _month = "" + (_date.getMonth() + 1);
	var _day   = "" + _date.getDate();
	
	if( _month.length == 1 ) _month = "0" + _month;
	if( ( _day.length ) == 1 ) _day = "0" + _day;
	
	var tmp = "" + _year + pattern + _month + pattern + _day;
	return tmp;
}


function gf_getTodayDate2(){
	var argSize = arguments.length ;
	var _date  = new Date();
	var pattern = "/" ;
	if(argSize == 1){
		_date  = new Date(arguments[0]);
	}else if(argSize == 2){
		_date  = new Date(arguments[0]);
		pattern  = arguments[1];
	}
	
	var _year  = _date.getFullYear();
	var _month = "" + (_date.getMonth() + 1);
	var _day   = "" + _date.getDate();
	var _hour  = "" + _date.getHours();
	var _min  = "" + _date.getMinutes();
	var _sec  = "" + _date.getSeconds();
	
	if( _month.length == 1 ) _month = "0" + _month;
	if( ( _day.length ) == 1 ) _day = "0" + _day;
	if( ( _hour.length ) == 1 ) _hour = "0" + _hour;
	if( ( _min.length ) == 1 ) _min = "0" + _min;
	if( ( _sec.length ) == 1 ) _sec = "0" + _sec;
	
	var tmp = "" + _year + pattern + _month + pattern + _day +" "+_hour+":"+_min+":"+_sec;
	return tmp;
}





/*
 * Check Subscriber Search
 */
function gf_CheckSubscriber() {
	 var msg1 = 'Please run open a subscriber search.';
	 var msg2 = 'Please run after a subscriber search.';
	 var rtn = true;
	 if ($("#subscriptionCustomerSearchForm").length == 0) {
		 MessageBox.dialog(msg1);
    	 $(this).hideLoading();
    	 rtn = false;
     } else {
    	 var entrNo = $("#subscriptionCustomerSearchForm #entrNo").val();
    	 if (entrNo.length == 0) {
    		 MessageBox.dialog(msg2);
    		 $(this).hideLoading();
    		 rtn = false;
    	 }
     }
	 return rtn;
}


function gf_checkNumberChange() {
	
	 
	 var v_rtn = true;
	 var v_svcCd = $("#subscriptionCustomerSearchForm #svcCd").val();
	 var v_svcNm = $("#subscriptionCustomerSearchForm #svcNm").val();
	 
	 var v_msg3 = 'Only Mobile Service!!!';
   
	 v_rtn = gf_CheckSttsByEntr(true);

	 if (v_rtn) {
		 // 서비스 : 모바일, voip인 경우만 전화번호 변경 가능 
		 if(! gf_ctnServiceCheck(v_svcCd)){
   	   	  	 MessageBox.dialog(v_msg3);
   	   	  	 $(this).hideLoading();
   	   	  	 v_rtn = false; 		 
   		 }
	 }
	 
	 return v_rtn;
}
/**
 * chekc bill account base information
 * @프로그램 설명 : checkSubscriber 가 true이면서 
 * entrSttsCd = A이면서
 * billAcntSttsCd = A이어야함
 */
function checkBillAcntInfo() {
	if(gf_CheckSubscriber()){
		
		var billAcntSttsCd = $("#subscriptionCustomerSearchForm #billAcntSttsCd").val();
		var msg = 'entrSttsCd is not A.(' + billAcntSttsCd + ')';
		if(gf_CheckSttsByEntr(false)){
			msg = 'billAcntSttsCd is not A.';
			if(billAcntSttsCd =='A' || billAcntSttsCd =='a' ){
				return true;
			}else{
				 MessageBox.dialog(msg);
				 $(this).hideLoading();
				 return false;
			}
		}else{
			 MessageBox.dialog(msg);
			 $(this).hideLoading();
			 return false;
		}
	}else{
		return false;
	}

}


/**
 * 배열 제거
 * @프로그램 설명 : 배열 제거
 * @trgtArray 원본
 * @exclArray 제거대상 배열
 * @datakey   json 키값 기준
 * 
 * index
 * trgtArray= [{name:"ab", editable:true},{name:"bc", editable:true}]
 * exclArray=[0];
 * 
 * result: [{name:"bc", editable:true}]
 * 
 * 값비교
 * trgtArray= [{name:"ab", editable:true},{name:"bc", editable:true}]
 * exclArray=[ab];
 * datakey = "name";
 *
 * result: [{name:"bc", editable:true}]
 * 
 * 값비교
 * trgtArray= [{name:"ab", editable:true},{name:"bc", editable:true}]
 * exclArray= [{name:"ab", editable:true}];
 * datakey = "name";
 * result:  [{name:"bc", editable:true}]
 */
function arrayRemove(){
	
	var args = arguments.length ;
	var trgtArray = new Array();
	var exclArray = new Array();
	var datakey	  = null;
	
	if(args == 2){
		
		trgtArray = arguments[0];
		exclArray = arguments[1];
	}
	else if (args == 3){

		trgtArray = arguments[0];
		exclArray = arguments[1];
		datakey   = arguments[2];
	}
	
	newArr = new Array();
	
	newArr = $.grep(trgtArray, function(object,index){
		
		var excl = true;
		var destVal = object;
		
		$.each(exclArray,function(trgtKey,trgtVal){
			
			if(index == trgtVal){
				
				excl = false;
			} 

			if(datakey != null){
			
					if(destVal[datakey] == trgtVal){
						excl = false;
					}
					
					if(destVal[datakey] == trgtVal[datakey]){
						excl=false;
					}
			
			}
			
		});
		
		return excl;
		 
	});
	
	return newArr;
}



/**
 * 공통코드 옵션 제거
 * @프로그램 설명 : 공통코드 옵션 제거 index
 * selector: 공통코드가 포함된 selector
 * exclArray=[1,2,3];
 * 
 *excludeCodeOptionVal("#rtPymMthdCd", exclArray);
 */

function excludeCodeOption(selector, exclArray){

	$.each($(selector + " option"),function(key,val){
		
		var optionKey = key;
		var optionCash = $(this);
		
		$.each(exclArray, function(key,val){
			
			var arrayKey = key;
			//index
			if( arrayKey == optionKey){
				
				optionCash.remove();
				
			}
			
		});
		
	});
	
}

/**
 * 공통코드 옵션 제거
 * @프로그램 설명 : 공통코드 옵션 제거 code value
 * selector: 공통코드가 포함된 selector 
 * exclArray=[11,21,22]; codevalue
 *
 * excludeCodeOptionVal("#rtPymMthdCd", exclArray);
 */
function excludeCodeOptionVal(selector, exclArray){

	$.each($(selector + " option"),function(key,val){
		
		var optionCash = $(this);
		var optionVal = $(this).val();
		
		$.each(exclArray, function(key,val){
			
			var arrayVal = val;
			
			//code
			if(arrayVal == optionVal){
				
				optionCash.remove();
				
			}
			
		});
		
	});
	
}

/**
 * jsonArray 용
 * jsonData exclArray에 있는 키로 삭제..
 * @param jsonArray 
 * @param exclArray json의 key 모음
 * 
 * jsonArray: [{a:"bb",b:"cc",c:"dd"},{a:"bb",b:"cc",c:"dd"}]
 * exclArray: ["a"]
 * 
 * result:  : [{b:"cc",c:"dd"},{b:"cc",c:"dd"}]
 */
function jsonDataDel(jsonArray,exclArray){
	
	$.each(jsonArray, function(i,data){
		
		var rdata= data;
		
		$.each(exclArray,function(j,val){
			
			delete rdata[val];
			
		});
		
	});
	
}

/**
 * json Object용
 * jsonData exclArray에 있는 키로 삭제..
 * @param jsonData   
 * @param exclArray json의 key 모음
 * 
 * jsonData : {aa:[kk:'33',dd:'434'],bb:asdfasd} 
 * exclArray: ["aa"]
 * 
 * result:  : {bb:asdfasd} 
 * 
 * 직접 키만 지워도 무관
 * 
 * delete jsonData["aa"];
 */
function jsonKeyDel(jsonData, exclArray){
	
	$.each(exclArray,function(idx,val){
		
		delete jsonData[val];
	});
	
}



/**
 * context path 얻기
 * 
 * result: acube
 * */ 
function getContextPath(){
    var offset=location.href.indexOf(location.host)+location.host.length;
    var ctxPath=location.href.substring(offset,location.href.indexOf('/',offset+1));
    return ctxPath;
}



/**
 * 서비스 가 전화번호가 있는 경우 체크 
 * @param pSvcCd
 * @returns {Boolean}
 */
function gf_ctnServiceCheck(pSvcCd) {
	var rtn = false;
	if (pSvcCd == 2 || pSvcCd == 5 ) {
		rtn = true;
	}
	
	return rtn;
}

/**
 * 가입상태가 "A" 인 경우 체크 
 * @param pEntrSttsCd
 * @returns {Boolean}
 */
function gf_CheckSttsByEntr(pMsgYn) {
	var rtn = gf_CheckSubscriber();
	
	var v_msg2 = '현재 활성화된 가입만 번호변경이 가능힙니다.';
	
	if(rtn) {
		var v_entrSttsCd = $("#subscriptionCustomerSearchForm #entrSttsCd").val();
		if (v_entrSttsCd == "A" || v_entrSttsCd == "a" ) {
			rtn = true;
		} else {
			if (pMsgYn) {
				MessageBox.dialog(v_msg2);
				$(this).hideLoading();
			}
			rtn = false;
		}
	}
	
	return rtn;
}



/**
 * 가입상태가 "A" 인 경우 체크 
 * @param pEntrSttsCd
 * @returns {Boolean}
 */
function gf_CheckSttsByEntrSusRsp(pMsgYn) {
	var rtn = gf_CheckSubscriber();
	
	var v_msg2 = 'Subscription Status ::  Close.';
	
	if(rtn) {
		var v_entrSttsCd = $("#subscriptionCustomerSearchForm #entrSttsCd").val();
		if (v_entrSttsCd == "A" || v_entrSttsCd == "S" ) {
			rtn = true;
		} else {
			if (pMsgYn) {
				MessageBox.dialog(v_msg2);
				$(this).hideLoading();
			}
			rtn = false;
		}
	}
	
	return rtn;
}

//grid 초기화 및 page초기화
function pagingInit(form, table){
	$(form).find("[name=totalCnt]").text(0);
	$(form).find("[name=currentCnt]").text(0);
	gf_clearGridList(table);
	$(form +" [name=page]").val(0);
}
function pagingInit1(form, table){
	$(form).find("[id=totalCnt]").text(0);
	$(form).find("[id=currentCnt]").text(0);
	gf_clearGridList(table);
	$(form +" [id=page]").val(0);
}

//페이지 끝 체크
function pageNavCom(selector){
	var totalCnt = $(selector).find("[name=totalCnt]").text() ;
	var currentCnt = $(selector).find("[name=currentCnt]").text() ;
	
	if(totalCnt != 0 && currentCnt != 0){
		
		if(parseInt(totalCnt) == parseInt(currentCnt)) {
			return false;
		}
	}
	
	return true;
}
function pageNavCom1(selector){
	var totalCnt = $(selector).find("[id=totalCnt]").text() ;
	var currentCnt = $(selector).find("[id=currentCnt]").text() ;
	
	if(totalCnt != 0 && currentCnt != 0){
		
			if(parseInt(totalCnt) == parseInt(currentCnt)) {
				return false;
			}
	}
	
	return true;
}

/**
 * 페이징처리
 * pagingLogic(url,form,table)
 * pagingLogic(url,form,table,dataKey)
 * pagingLogic(url,form,table,dataKey,pageKey)
 */
function pagingLogic(){
	
	var args = arguments.length;
	
	var url = null;
	var form = null;
	var table = null;
	var dataKey = null;
	var pageKey = null;
	
	if(args == 3){
		
		url   = arguments[0];
		form  = arguments[1];
		table = arguments[2];
		dataKey = "list";
		pageKey = "pagination";
		
	}
	else if(args == 4){
		
		url   = arguments[0];
		form  = arguments[1];
		table = arguments[2];
		dataKey = arguments[3];
		pageKey = "pagination";
	}
	else if(args == 5){
		
		url   = arguments[0];
		form  = arguments[1];
		table = arguments[2];
		dataKey = arguments[3];
		pageKey = arguments[4];
	}
	
	$.ajax({
		type : "POST",  
		async : true,
		url : url,
		dataType : 'json',
		data : $(form).serialize(),
		success : function(data) {
			
			
			if (data[dataKey].length > 0) {

				if($(form).find("[name=page]").val() == data[pageKey].currentPage){
					
					$(form).find("[name=page]").val(data[pageKey].currentPage+1);
					$(form).find("[name=totalCnt]").text(data[pageKey].objectsCount);
					
					gf_addGridList(table,data[dataKey]);
					var currentGridRow = gf_getTotalRow(table);
					$(form).find("[name=currentCnt]").text(currentGridRow);
				}
			}
			
		},	error:function(data){
			//서버 비정상 동작시 구현
			MessageBox.dialog("err.500");
		}, complete:function(jqXHR, textStatus){
			//MessageBox.dialog("complete:function Saved!" + textStatus);
		}
	});	   
}	

//숫자 체크 이벤트용(this)
function onlyNumber(loc) {
		
	if(loc.value == ""){
			alert("data input plz..");
			
		}else{
			
	   		if(/[^0123456789]/g.test(loc.value)) {
		   		
	   			alert("숫자가 아닙니다.\n\n0-9의 정수만 허용합니다.");
		   		loc.value = "";
		   		loc.focus();
	   		}
		}
	}

// str은 0~9까지 숫자만 가능하다. 변수용 
function checkNumber(str) { 
    
	var flag=true; 
   
    if (str.length > 0) { 
        for (i = 0; i < str.length; i++) {  
            if (str.charAt(i) < '0' || str.charAt(i) > '9') { 
                flag=false; 
            } 
        } 
    } 
    
    return flag; 
}

//이벤트용 regexp
function regexpChk(re,e,msg){
	
	if(!re.test(e.value)){
		
		alert(msg);
		flag=false;
		
	}
	
	return false;
	
}
//string용 regexp
function regexpChkStr(re,str,msg){
	
	var flag=true; 
	
	if(!re.test(str)){
		
		alert(msg);
		flag=false;
		
	}
	
	
	return flag;
	
}

/**
 * 엔터키 이벤트 발생
 * @param textId //input text id
 * @param btnId  //button id
 */
function enterSubmit(textId,btnId){
	
	$(textId).keypress(function(e){
		if(e.keyCode == 13) {
			e.preventDefault();
			$(btnId).click();
		}
	});
}

/**
 * 화면 가리기
 * @param selector division 하기
 * @param msg      화면에 뿌릴 메세지
 */
function divMask(){
	
	var args = arguments.length;
	
	var selector = null;
	var msg 	 = "loading...";
	
	if(args == 1){
		
		selector = arguments[0];
	}
	else if(args == 2){
		
		selector = arguments[0];
		msg  	 = arguments[1];
	}
	
	$(selector).mask(msg);
	
}

/**
 * 화면 가린거 풀기~
 * @param selector
 */
function divUnmask(selector){
	
	$(selector).unmask();
}



/**
 * UTF-8 bytes계산
 * 
 * */
function countUtf8(str) {
    var result = 0;
    for (var n = 0; n < str.length; n++) {
        var charCode = fixedCharCodeAt(str, n);
        if (typeof charCode === "number") {
            if (charCode < 128) {
                result = result + 1;
            } else if (charCode < 2048) {
                result = result + 2;
            } else if (charCode < 65536) {
                result = result + 3;
            } else if (charCode < 2097152) {
                result = result + 4;
            } else if (charCode < 67108864) {
                result = result + 5;
            } else {
                result = result + 6;
            }
        }
    }
    return result;
}

function fixedCharCodeAt(str, idx) {
    idx = idx || 0;
    var code = str.charCodeAt(idx);
    var hi, low;
    if (0xD800 <= code && code <= 0xDBFF) { // High surrogate (could change last hex to 0xDB7F to treat high private surrogates as single characters)
        hi = code;
        low = str.charCodeAt(idx + 1);
        if (isNaN(low)) {
            throw 'Not a valid character or memory error!';
        }
        return ((hi - 0xD800) * 0x400) + (low - 0xDC00) + 0x10000;
    }
    if (0xDC00 <= code && code <= 0xDFFF) { // Low surrogate
        // We return false to allow loops to skip this iteration since should have already handled high surrogate above in the previous iteration
        return false;
        /*hi = str.charCodeAt(idx-1);
         low = code;
         return ((hi - 0xD800) * 0x400) + (low - 0xDC00) + 0x10000;*/
    }
    return code;
}



/**
 * 현재날짜 시분초까지
 * @returns {String}
 */
function getTimeStamp() {
	
	var d = new Date();

	
	var s =
	    leadingZeros(d.getFullYear(), 4) + '-' +
	    leadingZeros(d.getMonth() + 1, 2) + '-' +
	    leadingZeros(d.getDate(), 2) + ' ' +

	    leadingZeros(d.getHours(), 2) + ':' +
	    leadingZeros(d.getMinutes(), 2) + ':' +
	    leadingZeros(d.getSeconds(), 2);

	  return s;
}

function leadingZeros(n, digits) {
	  
	var zero = '';
	  n = n.toString();

	  if (n.length < digits) {
	    for (i = 0; i < digits - n.length; i++)
	      zero += '0';
	  }
	  return zero + n;
}

//숫자에 콤마 붙이기
String.prototype.comma = function(){
	var number = this + '';
    var tmp = number.split('.');
    var str = new Array();
    var v = tmp[0].replace(/,/gi,'');
    for(var i=0; i<=v.length; i++) {
        str[str.length] = v.charAt(v.length-i);
        if(i%3==0 && i!=0 && i!=v.length) {
            str[str.length] = '.';
        }
    }
    str = str.reverse().join('').replace(/\./gi,',');
    return (tmp.length==2) ? str + '.' + tmp[1] : str;
}
//String 콤마빼기 
String.prototype.commaExcl = function(){
	
	var str = this.split(",").join("");
	
	return str;
}

//날짜 포맷팅 : 20121225 -> 2012/12/25
String.prototype.dateFormat = function(f){
    if (!this.valueOf()){ 
        return '';
    }
    if(this == '') {
    	return '';
    }
    var inputDate = this ;
    var result = "";
    inputDate  = inputDate.toNumber();

    var year = inputDate.substring(0, 4);
    var month = inputDate.substring(4, 6);
    var day = inputDate.substring(6, 8);
    
    if(inputDate.length == 6){
    	result = year + f + month;
    }
    
    if(inputDate.length == 8){
    	result = year + f + month + f + day ; 
    }
    
    return result ;    
}

String.prototype.timeFormat = function(f){
    if (!this.valueOf()){ 
        return '';
    }
    if(this == '') {
    	return '';
    }
    
    if(f == undefined){
    	f = ":";
    }
    var inputDate = this ;
    var result = "";
    
    inputDate  = inputDate.toNumber();

    var time = inputDate.substring(0, 2);
    var minute = inputDate.substring(2, 4);
    var second = inputDate.substring(4, 6);
    
    if(inputDate.length == 4){
    	result = time + f + minute;
    }
    
    if(inputDate.length == 6){
    	result = time + f + minute + f + second ; 
    }
    
    return result ;    
}

//숫자만 남기기
String.prototype.toNumber = function(){
    if (!this.valueOf()){
        return '';
    }    
    return this.replace(/[^0-9]/g, '');    
} 

function isAuth(authName) {
	
    /*var surl = "auth/checkAuth?authNm="+authName;
    var result = false;
	$.ajax({
		type : "GET",  
		async : false,
		url : surl,
		dataType : 'json',
		success : function(data) {
			
			var resultYn = data.result;
			
			if (resultYn == "Y") result = true;
			
			console.log(resultYn + "..." + result);
			
		},	error:function(data){
			MessageBox.dialog("err.500");
		}, complete:function(jqXHR, textStatus){
			
		}
		
	});	*/
	
	return true;
}

function gf_getCustomerInfoByPassword(custNo, password){
	var ret = {};
	var surl = "cs/customer.json";
	var customer = {'custNo' : custNo, 'entrancePassword' : {'password' : password}} ;
	$.ajax({
		type : "POST",  
		async : false,
		url : surl,
		contentType: "application/json",
		data : JSON.stringify(customer),
		dataType : 'json',
		success : function(data) {
			ret = data.customer ;			
		},	error:function(data){
			MessageBox.dialog("err.500");
		}, complete:function(jqXHR, textStatus){			
		}		
	});
	return ret ;
}


function gf_getGapDate(){
	 var args = arguments.length ;
	 var gapDate = 0 ;
	 if ( args==1){
		 gapDate = arguments[0];
	 }
	 var _date  = new Date();
	 _date = new Date(_date.valueOf()+(gapDate * 24*60*60*1000));
	 var _year  = _date.getFullYear();
	 var _month = "" + (_date.getMonth() + 1);
	 var _day   = "" + (_date.getDate());
	 
	 if( _month.length == 1 ) _month = "0" + _month;
	 if( ( _day.length ) == 1 ) _day = "0" + _day;
	 
	 var tmp = "" + _year +"-" + _month + "-" + _day;
	 return tmp;
}

function disableCommonButton(buttonObj){
	if(buttonObj != null ) {
		//buttonObj = $("#entrPricePlanForm #entr011SaveBtn") ; 
		$(buttonObj).attr('disable', true);			
		//파란색 버튼 
		/* if($(buttonObj).parent().hasClass('btns9')){
		} */
		//일반 회색 버튼
		if($(buttonObj).parent().hasClass('btns7')){
			$(buttonObj).parent().removeClass('btns7').addClass('btns8');
		}	
	}	
}
function enableCommonButton(buttonObj){
	if(buttonObj != null ) {
		//buttonObj = $("#entrPricePlanForm #entr011SaveBtn") ; 
		$(buttonObj).removeAttr('disable');			
		//파란색 버튼 
		/* if($(buttonObj).parent().hasClass('btns9')){
		} */
		//일반 회색 버튼
		if($(buttonObj).parent().hasClass('btns8')){
			$(buttonObj).parent().removeClass('btns8').addClass('btns7');
		}
	}
}

function maskDomainChange(id){
	if ( typeof(id.attr("masked"))!='undefined'){
		return "-999999";
	}else{
		return id.val();
	}
}

function maskDomainChangeAttr(id,attr){ 
	
	if ( typeof(id.attr(attr+"Masked"))!='undefined'){
		return "-999999";
	}else{
		return id.attr(attr);
	}
}

//배열의 중복 제거
 function valDistinct(arr) {
	    var a = [];
	    var l = arr.length;
	    for(var i=0; i<l; i++) {
	      for(var j=i+1; j<l; j++) {
	    	  
	        if (arr[i] === arr[j])
	          j = ++i;
	      }
	      a.push(arr[i]);
	    }
	    return a;
};

//숫자 타입에서 쓸 수 있도록 format() 함수 추가
Number.prototype.format = function(){
    if(this==0) return 0;
 
    var reg = /(^[+-]?\d+)(\d{3})/;
    var n = (this + '');
 
    while (reg.test(n)) n = n.replace(reg, '$1' + ',' + '$2');
 
    return n;
};
 
// 문자열 타입에서 쓸 수 있도록 format() 함수 추가
String.prototype.format = function(){
    var num = parseFloat(this);
    if( isNaN(num) ) return "0";
 
    return num.format();
};
