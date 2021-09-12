function btnEnabled(btnId) {
	$(btnId).attr("disabled", false);
	$(btnId).parent().removeClass().addClass("save btns9");
}

function btnDisabled(btnId) {
	$(btnId).attr("disabled", true);
	$(btnId).parent().removeClass().addClass("save btns8");
}

function bsPagingInit(strFormId, strGridId) {
	$("#"+strFormId).find("[id=totalCnt]").text(0);
	$("#"+strFormId).find("[id=currentCnt]").text(0);
	$("#"+strGridId).jqGrid("clearGridData", true);
	$("#"+strFormId +" [name=page]").val(0);
}

function isAvailablePaging(strFormId) {
	var totalCnt = $("#"+strFormId).find("[id=totalCnt]").text();
	var currentCnt = $("#"+strFormId).find("[id=currentCnt]").text();
	//console.log("totalCnt"+totalCnt+"/ currentCnt"+currentCnt);
	if(parseInt(totalCnt) == parseInt(currentCnt)) {
		return false;
	}
	return true;
}

function bsGridComma(cellValue) {
	if(cellValue == null || cellValue == "") {
		return "";
	}
	return (""+cellValue).comma();
}

function bsGridUnComma(cellValue) {
	if(cellValue == "" || cellValue ==null)
		return "";
		
	return cellValue.toString().replace(/,/g, '');
}

function delimeterDel(cellvalue) {
	//구분자제거(", ") 
	if(cellvalue.charAt(0) == "," && cellvalue.charAt(1) == " ") {
		cellvalue = cellvalue.slice( 2 );
	}
	return cellvalue;
}

function print(param) {
	return JSON.stringify(param);
}

function isNumberOnly(targetValue) {
	
	var regex = /^\d+$/;
	
	return regex.test(targetValue);
}






function gridDataToExcelExport(strGridId, fileNm, sheetNm) {  
	
	Array.prototype.remove = function(set){ return this.filter(function(e, i, a){ return set.indexOf(e) < 0;}); }
	
	//엑셀 출력에서 제외 하고 싶은 그리드의 컬럼이 있으면 그리드의 colModel에 excel: false 추가 할것!!
	if( !confirm("Do you want to download as Excel File ?") ) {
		return false;
	}
	
	var columnNames = $("#"+strGridId).jqGrid('getGridParam','colNames');
	
	var mulitYn = $("#"+strGridId).jqGrid('getGridParam','multiselect');
	
	if(mulitYn == true) {
	//	alert("헤헷"+columnNames[0]);
		delete columnNames[0];
	}
	
	//<([A-Z][A-Z0-9]*)\b[^>]*>(.*?)</\1>
//	console.log(print(jsonString));
//	alert("제외전::"+print(columnNames));
	var colModel = $("#"+strGridId).jqGrid('getGridParam', 'colModel');
	var idx = 0;
	var precludeArr = new Array();
	var tempName = new Array();
	for(var i =0; i< colModel.length; i++) {
		
		$.each(colModel[i], function(key, value) { 
				
			if(key == "excel" && value == false)	{  // 8자리 숫자가 아닐경우 포맷팅하지 않음.  
			
				precludeArr.push(columnNames[idx]);
				tempName.push(colModel[i].name);
			}
		});
		++idx;
	}
		
//	alert("제외대상::"+print(precludeArr));
	var headers = columnNames.remove(precludeArr);
//	alert("제외결과"+print(headers));
//	alert("name들"+print(tempName));
	
	var allRowArray = $("#"+strGridId).jqGrid('getDataIDs') ;
	var idx = 0;
	var bodies = new Array();
	for(var i = 0; i < allRowArray.length; i++) {
		var retJson = new Array();
		var data = $("#"+strGridId).getRowData(allRowArray[i]) ;
		//alert("삭제전"+print(data));	
	
		for(var  j = 0; j < tempName.length; j++) {
			//alert("tempName[i]"+tempName[j]);
			delete data[tempName[j]];
		}
		
		$.each(data, function(key, value){
			//alert(idx+"번째 key::"+key+" //   value"+value);
			retJson.push(value);
		});
		++idx;
		//alert("삭제후"+print(data));
		bodies.push(retJson);
	}
	
//	console.log("최종s:::"+print(bodies));
  
	$.fileDownload(baseUrl + "bsar/gridToexcelExport", {
	    // preparingMessageHtml: "We are preparing your report, please wait...",
	    // failMessageHtml: "There was a problem generating your report, please try again.",
		httpMethod: "POST",
	    data: { gridData : JSON.stringify({
											headers: headers,
											bodies : bodies,
											fileNm : fileNm,
											sheetNm : sheetNm
										})
	   }
	});
}
