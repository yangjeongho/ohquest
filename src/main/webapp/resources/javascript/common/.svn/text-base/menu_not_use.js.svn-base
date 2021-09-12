$(function(e){
	$("#menu").find("a").live("click", function(e){
		e.preventDefault();
		var menuId = $(this).attr("menuId");
		if(eval("window.clickMenu_"+menuId) != null){
			var menuFunction= eval("clickMenu_"+menuId);
			menuFunction($(this));
		}else{
			alert("function clickMenu_"+menuId +"()이 정의 되지 않았습니다. 확인 하십시요.");
		}
	});
});

// 고객조회시 사용될 공용 고객번호를 담을 변수임.
var pubCustNo = "100000010001"; //기본:-1

/* 여기서부턴 각 메뉴에 대한 처리내용 작성 */
/* 가입자 조회 처리 */
function clickMenu_searchSubscriber(menuObject){
	//$("#mainWork").attr("src", baseUrl+"cs/search/subscriber"); // IFRAME 사용시
	$("#mainWork").load(baseUrl+"cs/search/subscriber"); // DIV 사용시
};


/* 고객관계 */
function clickMenu_csCust002(menuObject){
	$("#dialogContentSource").load(baseUrl+"cs/csCust002?dialogName=dialogContent", function(e){
		Dialog.open({
			div : '#dialogContent', 
			title : 'Customer Relationship', 
			width : 800, 
			height : 510, 
			modal : true
		});
	});
}

/* 특기사항 */
function clickMenu_csCust007(menuObject){
	$("#dialogContentSource").load(baseUrl+"cs/csCust007?dialogName=dialogContent", function(e){
		Dialog.open({
			div : '#dialogContent', 
			title : 'Special Infomation', 
			width : 800, 
			height : 420, 
			modal : true
		});
	});
}

/* 메모  */
function clickMenu_csCust006(menuObject){
	$("#dialogContentSource").load(baseUrl+"cs/csCust006?dialogName=dialogContent", function(e){
		Dialog.open({
			div : '#dialogContent', 
			title : 'Memo', 
			width : 1000, 
			height : 800, 
			modal : true
		});
	});	
}

/* 코드관리  */
function clickMenu_codeManage(menuObject){
	$("#dialogContentSource").load(baseUrl+"code/view/" + baseLang +"?dialogName=dialogContent", function(e){
		Dialog.open({
			div : '#dialogContent', 
			title : 'Code Management', 
			width : 1000, 
			height : 800, 
			modal : true
		});
	});	
}
/* 주소관리  */
function clickMenu_addressManage(menuObject){
	$("#dialogContentSource").load(baseUrl+"common/address/search?dialogName=dialogContent", function(e){
		Dialog.open({
			div : '#dialogContent', 
			title : 'Address Management', 
			width : 1000, 
			height : 800, 
			modal : true
		});
	});	
}

/* 커버리지관리  */
function clickMenu_coverageManage(menuObject){
	$("#dialogContentSource").load(baseUrl+"coverage/search?dialogName=dialogContent", function(e){
		Dialog.open({
			div : '#dialogContent', 
			title : 'Coverage Management', 
			width : 1000, 
			height : 800, 
			modal : true
		});
	});	
}

/* Change Address  */
function clickMenu_csCust008(menuObject){
	
	if(pubCustNo == "-1"){
		alert("click after selecting a customer!");
		return ;
	}
	$("#dialogContentSource").empty().load(baseUrl + "cs/csCust008?dialogName=dialogContent&custNo=" + pubCustNo, function(e){
		Dialog.open({ 
			div : '#dialogContent', 
			title : 'Change Address', 
			width : 700, 
			height : 640, 
			modal : true
		});
	});	
}

/* Change contact*/
function clickMenu_csCust003(menuObject){
	if(pubCustNo == "-1"){
		alert("click after selecting a customer!");
		return ;
	}
	$("#dialogContentSource").empty().load(baseUrl+"cs/csCust003?dialogName=dialogContent&custNo=" + pubCustNo, function(e){
		Dialog.open({
			div : '#dialogContent', 
			title : 'Change Content', 
			width : 700, 
			height : 640, 
			modal : true
		});
	});	
}

/* 대리점정보관리 */
function clickMenu_cos003w(menuObject){
	$("#mainWork").attr("src", baseUrl+"cos/cos003w"); 
}



/* 파트너조회 */
function clickMenu_prmPtr000(menuObject){
	$("#mainWork").attr("src", baseUrl+"prm/prmPtr000"); 
}

/* 파트너등록 */
function clickMenu_prmPtr001(menuObject){
	$("#dialogContentSource").load(baseUrl+"prm/ptr/view/" + baseLang +"?dialogName=dialogContent", function(e){
		Dialog.open({
			div : '#dialogContent', 
			title : 'Partner Register', 
			width : 840, 
			height : 360, 
			modal : true
		});
	});
}

/* 파트너현황 리스트  */
function clickMenu_prmPtrList(menuObject){
	$("#dialogContentSource").load(baseUrl+"prm/ptr/list/" + baseLang +"?dialogName=dialogContent", function(e){
		Dialog.open({
			div : '#dialogContent', 
			title : 'Partner List', 
			width : 840, 
			height : 500, 
			modal : true
		});
	});
}



/* 고객등록 */
function clickMenu_csCust001(menuObject){
	$("#dialogContentSource").load(baseUrl+"cs/csCust001/" + pubCustNo +"/true?dialogName=dialogContent", function(e){
		Dialog.open({
			div : '#dialogContent', 
			title : 'Create Customer', 
			width : 900, 
			height : 720, 
			modal : true
		});
	});
}

