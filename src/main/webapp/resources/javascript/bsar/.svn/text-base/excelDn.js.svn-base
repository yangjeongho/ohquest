/*
 * 그리드 데이터 추출
 * 
 * todo
 * 1. hidden 처리
 * 2. 2단 헤더 처리
 *****/
function exportRowData(gridId) {

	var dataArray = new Array();
	var gridData = [];

	dataArray = $("#" + gridId).getDataIDs();

	for ( var i = 0; i < dataArray.length; i++) {
		gridData.push(($("#" + gridId).getRowData(dataArray[i])));
	}
	
	//return JSON.stringify(gridData);
	return gridData;
};

function exportColData(gridId) {
	
	var colNameArray = new Array();
	var colModel = new Array();
	var colNameVal = $("#" + gridId).jqGrid('getGridParam', 'colNames');
	var colNameKey = $("#" + gridId).jqGrid('getGridParam', 'colModel');

	
	// var colData = {};
	//	 
	// //컬럼 json1 no hidden
	// for(var i = 0; i < colNameKey.length; i++){
	// colData[colNameKey[i].name] = colNameVal[i];
	// }

	// 컬럼 json2
	for ( var i = 0; i < colNameVal.length; i++) {

		var colNameValue = replaceAll(colNameVal[i],"<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "" );
		colNameValue = replaceAll(colNameValue ,"\r|\n|&nbsp;","");
		
		colNameArray.push({
			"columnName" : colNameValue
		});
	}
	
	for ( var i = 0; i < colNameKey.length; i++) {

		var colJson = {};

		for ( var key in colNameKey[i]) {

			if (key == "name" || key == "hidden" || key == "width") {
				var jsonKey = key;
				var jsonVal = colNameKey[i][key];
				
				// console.log(i+'key: ' + jsonKey + ' value: ' + jsonVal );
				
//				if(jsonKey == "hidden" && jsonVal == true){
//					alert(jsonVal);
//					alert(jsonKey);
//				}
					
					colJson[jsonKey] = jsonVal;
				
			}
		}
		
		
		
		colModel.push(colJson);

	}

	$.extend(true, colModel, colNameArray);

	// console.log(colModel);

	var exclArray = new Array();
	
	$.each(colModel,function(idx,data){
		
		if(data.name == "cb"){
			
			exclArray.push(idx);
		}
		
		
	});
	
	var colData = new Array();
	colData = arrayRemove(colModel,exclArray);
	
//	 var colNameObj = JSON.stringify(colData);
//	 console.log("colNameObj");
//	 console.log(colNameObj);
	// var colDataObj = JSON.stringify(colData);
	// console.log("colDataObj");
	// console.log(colDataObj);
	
//	return JSON.stringify(colModel);
	return colData;

}
//replaceAll 정규식으로 작동
function replaceAll(inputString, targetString, replacement){

	var v_ret = null;
	var v_regExp = new RegExp(targetString, "g");
	v_ret = inputString.replace(v_regExp, replacement);
	return v_ret;
}

function spaceTrim(txt){
	
	var trimTxt = txt.toString().replace(/\s+/gi,"");
	
	return trimTxt;
}
//replaceAll($(this).attr('expirateDate'),"-","");

/*function replaceAll(txt, replace, with_this) { 
	return txt.replace(new RegExp(replace, 'g'),with_this);
}*/
//var replaceCrdNm = replaceAll(entry["chnl_bsis_crd_nm"],',' ,'^');

/**
 * @returns 그룹헤더 dml
 */
function exportGhData(gridId,groupHeaderSet) {
	
	var ghArray = new Array(); 
	//var colData = JSON.stringify(exportColData(gridId));
	var colData = exportColData(gridId);
	var ghSetting  = groupHeaderSet;
	
	$(".jqg-second-row-header th").each(function(i,val){
		
		var groupHeaderText = $.trim($(this).text());
		    
		ghArray.push({ "groupHeader" : groupHeaderText});
		
	});
	
	//세로 병합 row 1
	$.each(colData,function(i,data){
		var colIdx = i;
		var colNm  = data.columnName;
		
		$.each(ghArray,function(j,data){
			
			var ghData = data;
			var ghNm = data.groupHeader;
			
			if(ghNm == colNm){
				
				
				ghData["mergeDiv"]="height";
				ghData["rowStrtIdx"] = 0;
				ghData["rowEndIdx"]  = 1;
				ghData["colStrtIdx"] = colIdx;
				ghData["colEndIdx"] = colIdx;
				
			}
			
		});
	});
	
	
	var ghWidthArray = new Array();

	//가로 볗합
	$.each(colData,function(i,data){
		
		var colIdx = i;
		var colNm  = data.name;
		
		$.each(ghSetting,function(j,data){
		
			var strtColNm   = data.startColumnName;
			var increaseIdx = data.numberOfColumns;
			var title       = data.titleText;
			
			if(colNm == strtColNm){
				
				var ghJson = {};
				
				ghJson["groupHeader"] 	 = title;
				ghJson["mergeDiv"]   	 = "width";
				ghJson["rowStrtIdx"]     = 0;
				ghJson["rowEndIdx"]      = 0;
				ghJson["colStrtIdx"]    = colIdx;
				ghJson["colEndIdx"]     = (colIdx+increaseIdx)-1;
				
				ghWidthArray.push(ghJson);
				
			}
			
		});
		
	});
	

	var ghFuseArr = new Array();
	var exclArr   = new Array();
	
	$.each(ghArray,function(i,data){
		
		var colIdx  = i;
		var ghTitle = data.groupHeader;
		var ghData  = data;
		
		$.each(ghWidthArray,function(j,data){
		
			var ghTitle1 = data.groupHeader;
			var ghWidthData = data;
			
			if(ghTitle == ghTitle1){
				
				var ghFuseData = $.extend({},ghData,ghWidthData);
				
				exclArr.push(colIdx);
				ghFuseArr.push(ghFuseData);
				
			}
			
		});
	});
	
	
	ghArray = arrayRemove(ghArray,exclArr);
	
	$.each(ghFuseArr, function(i,data){
		
		ghArray.push(data);
	});
	
	return ghArray;
	
}

//TODO 그룹헤더셋 추가... defaults에 추가  테스트 필요
/**
 * @param options
 * gridId  : null, 그리드 id 
   colData : null, json형식의 colName데이터
   rowData : null, json형식의 그리드 데이터
   ghData  : null, json형식의 그룹헤더
   ghYn  	: "n", 그룹헤더 사용여부
   url     : null,
   hiddenYn: "y"   컬럼 속성이 hidden인 데이터 제거여부
 */
function exportXls(options) {

	var defaults = {
			gridId  : null, 
			colData : null,
			rowData : null,
			ghData  : null,
			ghYn  	: "n",
			url     : null,
			hiddenYn: "y",
			groupHeaderSet:null	
	};

	var settings = $.extend({}, defaults, options);

	var id = settings.gridId;
	var colData = null;
	var rowData = null;
	var ghData = null;
	
	var ghYn  = settings.ghYn.toLowerCase();
	var hiddenYn = settings.hiddenYn.toLowerCase();
	
	settings.rowData == null ? rowData = exportRowData(id) : rowData = settings.rowData;
	settings.colData == null ? colData = exportColData(id) : colData = settings.colData;

	//group header 생성
	if(ghYn == "y"){
		
		var ghSet    = settings.groupHeaderSet;
		
		settings.ghData == null ? ghData = exportGhData(id,ghSet) : ghData = settings.ghData;
	}

	var exclArrayCol = [];
	var exclArrayRow = [];
	
	//hidden인 컬럼 제거
	if(hiddenYn == "y"){
		
		$.each(colData, function(i,data){
			
			if(data.hidden == true){
				
				
				exclArrayCol.push(i);
				exclArrayRow.push(data.name);
			}
			
		});
		
		colData = arrayRemove(colData,exclArrayCol);
		
		jsonDataDel(rowData,exclArrayRow);
		
	}
	
	//json to string
	var colDataString = JSON.stringify(colData);
	var rowDataString = JSON.stringify(rowData);
	var ghDataString  = JSON.stringify(ghData);
		
	
	var ts = Math.round((new Date()).getTime() / 1000);
	var tg = "";
	var act = "";

	//id 생성
	var dnDivId = id + ts + 1;
	var dnFormId = id + ts + 2;
	var dnFrameId = id + ts + 3;
	var rowDataId = id + ts + 4;
	var colDataId = id + ts + 5;
	var ghDataId = id + ts + 6;

	var body = $("#" + id);
	var dnDiv = $("<div>");
	var dnForm = $("<form method='post'>");
	var dnFrame = $("<iframe name='xls'>");
	var ftrg = dnFrame.attr("name");

	dnDiv.attr("id", dnDivId);
	dnDiv.css("display", "none");
	dnForm.attr("id", dnFormId);
	dnFrame.attr("id", dnFrameId);
	dnFrame.attr("width", 0);
	dnFrame.attr("height", 0);
	
	dnDiv.append(dnForm).append(dnFrame);
	body.append(dnDiv);
	

	if (rowData != null && rowData != undefined) {
		dnForm.append($("<textArea id=" + rowDataId + " name='rowData'>"));
		$("#" + rowDataId).val(rowDataString);
	}

	if (colData != null && colData != undefined) {
		dnForm.append($("<textArea id=" + colDataId + " name='colData'>"));
		$("#" + colDataId).val(colDataString);
	}
	
	if (ghData != null && ghData != undefined) {
		dnForm.append($("<textArea id=" + ghDataId + " name='ghData'>"));
		$("#" + ghDataId).val(ghDataString);
	}

	dnForm.attr("target", ftrg);
	dnForm.attr("action", settings.url);

	dnForm.submit();
	dnForm.attr("target", tg);
	dnForm.attr("action", act);
	
	setTimeout(function(){
		
		dnDiv.remove();
		
	},1000);

}
/**
 * @param options
   url     : null,
 */
function fileDownLoad(id,url) {
	
	var ts = Math.round((new Date()).getTime() / 1000);
	var tg = "";
	var act = "";
	
	//id 생성
	var dnDivId = id + ts + 1;
	var dnFormId = id + ts + 2;
	var dnFrameId = id + ts + 3;
	
	var body = $("#" + id);
	var dnDiv = $("<div>");
	var dnForm = $("<form method='post'>");
	var dnFrame = $("<iframe name='xls'>");
	var ftrg = dnFrame.attr("name");
	
	dnDiv.attr("id", dnDivId);
	dnDiv.css("display", "none");
	dnForm.attr("id", dnFormId);
	dnFrame.attr("id", dnFrameId);
	dnFrame.attr("width", 0);
	dnFrame.attr("height", 0);
	
	dnDiv.append(dnForm).append(dnFrame);
	body.append(dnDiv);
	
	dnForm.attr("target", ftrg);
	dnForm.attr("action", url);
	
	dnForm.submit();
	dnForm.attr("target", tg);
	dnForm.attr("action", act);
	

	setTimeout(function(){
		
		dnDiv.remove();
		
	},1000);
	
}