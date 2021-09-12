
/* 가입자 조회 처리 */
function clickMenu_searchSubscriber(menuObject){
	//$("#mainWork").attr("src", baseUrl+"cs/search/subscriber"); // IFRAME 사용시
	//$("#mainWork").load(baseUrl+"cs/search/subscriber"); // DIV 사용시
	createMainWorkArea('searchSubscriber'
						, menuObject, baseUrl + 'resources/images/common/left/csCust000.gif'
						, baseUrl+"cs/csCust000?dialogName=dialogContent");
};

/* 고객등록 */
function clickMenu_csCust001(menuObject){
	Dialog.open({
		div : '#dialogContent', 
		url : baseUrl+"cs/csCust001/" + pubCustNo +"?source=menu&dialogName=dialogContent&newBtn=true",
		title : 'Customer Registration', 
		width : 1220, 
		height : 835,
		modal : true
	});
}

/* 고객관계 */
function clickMenu_csCust002(menuObject){
	
	var custNo = $("#subscriptionCustomerSearchForm #custNo").val();
	
	if(gf_CheckSubscriber()){
		Dialog.open({
			div : '#dialogContent', 
			url : baseUrl+"cs/csCust002/"+custNo+"?dialogName=dialogContent",
			title : 'Customer Relationship', 
			width : 800, 
			height :600, 
			modal : true
		});
	}
}


/* Change contact */
function clickMenu_csCust003(menuObject){
	/*if(pubCustNo == "-1"){
		alert("click after selecting a customer!");
		$(menuObject).hideLoading();
		return ;
	}*/
	Dialog.open({
		div : '#dialogContent', 
		url : baseUrl+"cs/csCust003?dialogName=dialogContent&contactTypeCode=TEL&custNo=" + pubCustNo,
		title : 'Change Content', 
		width : 700, 
		height : 400, 
		modal : true
	});
}

/* 메모  */
/**
 * Description : 메모 리스트 화면을 오픈 한다.
 * developer : Hong Hyo Sang
 * reporting date : 2012-09-30
 * @param menuObject
 */
function clickMenu_csCust006(menuObject){
    
//	if(pubCustNo == "-1"){
//		alert("click after selecting a customer!");
//		$(menuObject).hideLoading();
//		return ;
//	}
	
	
	if (!gf_CheckSubscriber()) {
		return ;
	}
	
	
	var custrnmNo = $("#custrnmNo").val();
	var custNo = $("#custNo").val();
	var custNm = $("#custNm").val();
	var entrNo = $("#subscriptionCustomerSearchForm #entrNo").val();
	if(typeof(entrNo) == 'undefined'){
		entrNo = "" ;
	}
	
	Dialog.open({
		div : '#dialogContent', 
		url : baseUrl+"cs/csCust006?dialogName=dialogContent&custrnmNo="+custrnmNo+"&custNm="+custNm +"&custNo="+custNo +"&entrNo="+entrNo,
		title : 'Operator Work History', 
		width : 1000, 
		height : 600, 
		modal : true
	});
}

/* 특기사항 */
function clickMenu_csCust007(menuObject){
	
	if (!gf_CheckSubscriber()) {
		return ;
	}
	
	
	
	
	var custNo = $("#subscriptionCustomerSearchForm #custNo").val();
	var entrNo = $("#subscriptionCustomerSearchForm #entrNo").val();
    var billAcntNo = $("#subscriptionCustomerSearchForm #billAcntNo").val();
    var aceno = $("#subscriptionCustomerSearchForm #aceno").val();	
    
    
    var Vtitle = "Special Infomatio >> Subscriber :: [" + entrNo + "] BillAcntNo :: [" + billAcntNo + "] Customer [" + custNo + "]";
	Dialog.open({
		div : '#dialogContent', 
		url : baseUrl+"cs/csCust007?dialogName=dialogContent&custNo="+custNo+"&entrNo="+entrNo+"&billAcntNo="+billAcntNo+"&aceno="+aceno,
		title : Vtitle, 
		width : 800, 
		height : 420, 
		modal : true
	});
}


/* Change Address  */
function clickMenu_csCust008(menuObject){
	
	/*if(pubCustNo == "-1"){
		alert("click after selecting a customer!");
		$(menuObject).hideLoading();
		return ;
	}*/
	Dialog.open({ 
		div : '#dialogContent', 
		url : baseUrl + "cs/csCust008?dialogName=dialogContent&custNo=" + pubCustNo,
		title : 'Change Address', 
		width : 700, 
		height : 360,
		modal : true
	});
}



function clickMenu_csCust009(menuObject){
	/*Check Subscriber Sesrch */

	if (gf_CheckSubscriber()) {
		var svcCd = $("#subscriptionCustomerSearchForm #svcCd").val();
		if(svcCd==3){
			Dialog.open({
				div : '#dialogContent', 
				url : baseUrl+"cs/csCust009?dialogName=dialogContent",
				title : 'Family ID', 
				width : 850, 
				height : 540,  
				modal : true
			});
		}else{
			MessageBox.dialog("Service is not IPTV");
			$(this).hideLoading();
			return false;
		}
	}
}

/**
 * Description : 블랙 리스트 화면을 오픈 한다.
 * developer : Hong Hyo Sang
 * reporting date : 2012-09-30
 * @param menuObject
 */
function clickMenu_csCust005(menuObject){
    

	
	
	if ($("#subscriptionCustomerSearchForm").length == 0) { 
		custrnmNo = "";
		custNm = "";
    } else {
    	custrnmNo = $("#custrnmNo").val();
    	custNm = $("#custNm").val();
    }
	
	
	
	Dialog.open({
		div : '#dialogContent', 
		url : baseUrl+"cs/csCust005?dialogName=dialogContent&custrnmNo="+custrnmNo+"&custNm="+custNm,
		title : 'Black List', 
		width : 820, 
		height : 490, 
		modal : true
	});
}



/**
 * Description : House Hold
 * developer : Hong Hyo Sang
 * reporting date : 2012-09-30
 * @param menuObject
 */
function clickMenu_csCust010(menuObject){

	Dialog.open({
		div : '#dialogContent', 
		url : baseUrl+"cs/csCust010?dialogName=dialogContent",
		title : 'Household', 
		width : 930, 
		height : 500, 
		modal : true
	});
}

/**
 * Description : Hotel
 * developer : Hong Hyo Sang
 * reporting date : 2012-09-30
 * @param menuObject
 */
function clickMenu_csCust011(menuObject){

	Dialog.open({
		div : '#dialogContent', 
		url : baseUrl+"cs/csCust011?dialogName=dialogContent",
		title : 'Hotel', 
		width : 935, 
		height : 780, 
		modal : true
	});
}

function clickMenu_password001(menuObject){
	
	Dialog.open({
		div : '#dialogContent', 
		url : baseUrl+"cs/password/password001",
		title : 'Password Change', 
		width : 550, 
		height : 350, 
		modal : true
	});
}