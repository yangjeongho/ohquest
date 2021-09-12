var CODE = {}; 
var CODE_SYS = {}; 

CODE.codeList = [];
CODE.retCodeList = [];

//코드명을 조회 하고자 하는 코드그룹 및 코드를 입력
CODE.push = function(){
	var argSize = arguments.length ;
	if(argSize>0){
		for(var i=0 ; i<argSize; i++){
			CODE.codeList.push({"codeGroup":arguments[i]});
		}
	}
};
//코드명을 조회 하고자 하는 코드그룹 및 코드의 JSON LIST를 입력
CODE.pushAll = function(codeJsonInfo){
	CODE.codeList = codeJsonInfo;
};

//조회하기 위해 push된 codeGroup 목록을 clear
CODE.clear = function(){
	CODE.codeList = [] ;
};

//서버에서 조회해 온다.
CODE.server = function(){
	var argSize = arguments.length ;
	if(argSize>0){
		for(var i=0 ; i<argSize; i++){
			CODE.codeList.push({"codeGroup":arguments[i]});
		}
	}
	$.ajax({
		type : "POST",  
		async: false,
		url: baseUrl + "code/codeList.do",
		contentType: "application/json",
		data: JSON.stringify(CODE.codeList),
		dataType:"json",
		success : function(data) {
			CODE.retCodeList = data ;
		},
		error:function(data){
			alert("call fail! ");
		}
	});	
	
};

//조회된 데이타를 기준으로 코드명을 가져온다
CODE.name = function (codeGroup, code){
	var meaning = "" ;
	
	if(CODE.retCodeList != null ){
		var codeList = eval("CODE.retCodeList."+codeGroup);
		for(var i=0; i < codeList.length; i++){
			if(code == codeList[i].code){
				meaning = codeList[i].meaning ;
				break ;
			}
		}
	}
	return meaning; 
};

//조회된 데이타를 기준으로 json형태의 코드목록을 리턴한다.
CODE.list = function (codeGroup){
	var codeList = [] ;
	if(CODE.retCodeList!= null ){
		codeList = eval("CODE.retCodeList."+codeGroup);
	}
	return codeList; 
};

//조회된 데이타를 기준으로 codeGroup으로 listbox 생성하여 리턴한다.
CODE.listbox = function (){
	var argSize = arguments.length ;
	var codeGroup = null;
	var code = null;
	if(argSize == 1){
		codeGroup = arguments[0];
	}else if(argSize == 2){
		codeGroup = arguments[0];
		code = arguments[1]; //디폴트 선택값 지정된 경우
	}
	var codeList = {} ;
	var retListBox = "" ;
	if(CODE.retCodeList != null ){
		codeList = eval("CODE.retCodeList."+codeGroup);
		for(var i=0; i < codeList.length; i++){
			var selected = "" ;
			if(code == codeList[i].code){
				selected = "selected" ;
			}
			retListBox += "<option value='"+codeList[i].code+"' "+selected+">"+codeList[i].meaning+"</option>" ; 
		}
	}
	 return retListBox ;
};
// 여러건이 아니라 특정 한건에 대해서 바로 코드명 조회시
CODE_SYS.name = function (){
	var argSize = arguments.length ;
	var codeGroup = null;
	var code = null;
	if(argSize == 2){
		codeGroup = arguments[0];
		code = arguments[1];
	}else{
		alert("Invalid call!");
	}
	CODE.clear();
	CODE.push(codeGroup);
	CODE.server();
	var retCodeName = CODE.name(codeGroup, code);
	CODE.clear();
	return retCodeName ;
	
};

//특정 코드 한건에 대해서 바로 리스트박스를 생성하는 경우
CODE_SYS.listbox = function (){
	var argSize = arguments.length ;
	var codeGroup = null;
	var code = null;
	if(argSize == 1){
		codeGroup = arguments[0];
	}else if(argSize == 2){
		codeGroup = arguments[0];
		code = arguments[1];
	}
	CODE.clear();
	CODE.push(codeGroup);
	CODE.server();
	var codeList = {} ;
	var retListBox = "" ;
	if(CODE.retCodeList != null ){
		codeList = eval("CODE.retCodeList."+codeGroup);
		for(var i=0; i < codeList.length; i++){
			var selected = "" ;
			if(code == codeList[i].code){
				selected = "selected" ;
			}
			retListBox += "<option value='"+codeList[i].code+"' "+selected+">"+codeList[i].meaning+"</option>" ; 
		}
	}
	CODE.clear();
	return retListBox ;
};

