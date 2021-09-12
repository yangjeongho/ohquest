/**
* jqgrid formatter function
*
*
*/

//날짜 포맷 yyyyMMdd -> yyyy-MM-dd
function barPlus(cellvalue, options, rowObject){
	var year = null;
	var month = null;
	var date = null;
	var hour = null;
	var min = null;
	var sec = null;
	var cdate = null;
	
	if(cellvalue!=null && cellvalue!=undefined && cellvalue != ""){
		
	    year = cellvalue.substring(0,4); 
	    month = cellvalue.substring(4,6);
	    cdate =  year+'-'+month;
	    
	    if(cellvalue.length == 8){
	    	date  = cellvalue.substring(6,8); 
	    	cdate =  year+'-'+month+'-'+date;
	    }
	    else if (cellvalue.length == 14){
	    	
	    	date  = cellvalue.substring(6,8);
	    	hour = cellvalue.substring(8,10);
	    	min = cellvalue.substring(10,12);
	    	sec = cellvalue.substring(12,14);
	    	
	    	cdate =  year+'-'+month+'-'+date+" "+hour+":"+min+":"+sec;
	    }
	    
	} else {
	    cdate = "";
	}

    return cdate;
    
}

//날짜 포맷 원상복구 yyyy-MM-dd -> yyyyMMdd
function barMinus(cellvalue, options, rowObject){
	var cdate = null;
	
	if(cellvalue!=null && cellvalue!=undefined){
		
		cdate = cellvalue.split("-").join("").split(" ").join("").split(":").join("");
		
	}else{
		
		cdate = null;
	}
	
	return cdate;
}

//공통코드의 text를 가져오는 함수
function convCodeNm(cellvalue, options, rowObject){

	
	var coCode = options.colModel.name;

	var endIdx1 = coCode.indexOf("Nm");
	var endIdx2 = coCode.indexOf("Name");
	var codeId1 = coCode.substring(0,endIdx1);
	var codeId2 = coCode.substring(0,endIdx2);
	
	var codeId;
	if(endIdx1 != -1){
		
		codeId = codeId1; 
	}
	if(endIdx2 != -1){
		
		codeId = codeId2; 
	}
	
	var codeText = CODE_SYS.name(codeId, cellvalue);
	
	return codeText;
	
}