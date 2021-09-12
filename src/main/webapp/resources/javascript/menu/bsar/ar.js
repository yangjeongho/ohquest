
//payment 시작
//납부상세내역조회
function clickMenu_eBnkPym(menuObject){
	Dialog.open({
		div : '#dialogContent', 
		url : baseUrl+"bsar/payment/eBnkPym?dialogName=dialogContent",
		width : 1200, 
		height : 585, 
		modal : true
	});
}
function clickMenu_pymDtls(menuObject){
	Dialog.open({
		div : '#dialogContent', 
		url : baseUrl+"bsar/payment/pymDtls?dialogName=dialogContent",
		width : 1220, 
		height : 605, 
		modal : true
	});
}
//은행납부조회
function clickMenu_bnkTrnsferDtls(menuObject){
	Dialog.open({
		div : '#dialogContent', 
		url : baseUrl+"bsar/payment/bnkTrnsferDtls?dialogName=dialogContent",
		width : 1200, 
		height : 510, 
		modal : true
	});
}
//ocs연동납부내역조회
function clickMenu_ocsPymDtls(menuObject){
	Dialog.open({
		div : '#dialogContent', 
		url : baseUrl+"bsar/payment/ocsPymDtls?dialogName=dialogContent",
		width : 1200, 
		height : 510, 
		modal : true
	});
}
//payment 끝


//nonPayment시작
//미납상세내역조회
function clickMenu_nonPymDtls(menuObject){
	
	var aceno = $("#subscriptionCustomerSearchForm #aceno").val();
	
	Dialog.open({
		div : '#dialogContent', 
		url : baseUrl+"bsar/nonPayment/nonPymDtls?dialogName=dialogContent&aceno="+aceno,
		//title : '요금 > 미납 > 미납관리 > 미납상세내역', 
		width : 1200, 
		height : 700, 
		modal : true
	});
}

/*
//직권해지대상자조회
function clickMenu_termTrgtInq(menuObject){
	Dialog.open({
		div : '#dialogContent', 
		url : baseUrl+"bsar/nonPayment/termTrgtInq?dialogName=dialogContent",
		//title : '요금 > 미납 > 미납관리 > 미납상세내역', 
		title : 'Termination Target Inquiry',
		width : 1200, 
		height : 420, 
		modal : true
	});
}*/

//nonPayment 끝

//rate biz support 시작
//미납현황조회
function clickMenu_nonPymCollectState(menuObject){
	Dialog.open({
		div : '#dialogContent', 
		url : baseUrl+"bsar/nonPymPrsntState/nonPymCollectState?dialogName=dialogContent", 
		width : 1200, 
		height : 620, 
		modal : true
	});
}

//고액미납현황조회
function clickMenu_largeNonPymState(menuObject){
	Dialog.open({
		div : '#dialogContent', 
		url : baseUrl+"bsar/nonPymPrsntState/largeNonPymState?dialogName=dialogContent",
		width : 1200, 
		height : 590, 
		modal : true
	});
}

//에이징 현황
function clickMenu_agingReport(menuObject){
	Dialog.open({
		div : '#dialogContent', 
		url : baseUrl+"bsar/nonPymPrsntState/agingReport?dialogName=dialogContent",
		width : 1200, 
		height : 600, 
		modal : true
	});
}




//대손대상자조회
function clickMenu_writeOffTrgtInq(menuObject){
	Dialog.open({
		div : '#dialogContent', 
		url : baseUrl+"bsar/writeOffManage/writeOffTrgtInq?dialogName=dialogContent",
		title : 'Write Off List Inquiry', 
		width : 1200, 
		height : 560, 
		modal : true
	});
}

//대손손실등록
function clickMenu_writeOffLoss(menuObject){
	Dialog.open({
		div : '#dialogContent', 
		url : baseUrl+"bsar/writeOffManage/writeOffLoss?dialogName=dialogContent",
		title : 'Write Off Loss', 
		width : 1200, 
		height : 600, 
		modal : true
	});
}
//대손확정등록
function clickMenu_writeOffTermi(menuObject){
	Dialog.open({
		div : '#dialogContent', 
		url : baseUrl+"bsar/writeOffManage/writeOffTerminate?dialogName=dialogContent",
		title : 'Write Off Terminate', 
		width : 1200, 
		height : 600, 
		modal : true
	});
}
//rate biz support 끝

//operation pymSupport 시작
function clickMenu_subscriberPymPriority(menuObject){
	Dialog.open({
		div : '#dialogContent', 
		url : baseUrl+"bsar/pymSupport/subscriberPymPriority?dialogName=dialogContent&language="+baseLang,
		//title : '요금 > 미납 > 미납관리 > 미납상세내역', 
		width : 650, 
		height : 370, 
		modal : true
	});
}
function clickMenu_billPymPriority(menuObject){
	Dialog.open({
		div : '#dialogContent', 
		url : baseUrl+"bsar/pymSupport/billPymPriority?dialogName=dialogContent&language="+baseLang,
		//title : '요금 > 미납 > 미납관리 > 미납상세내역', 
		width : 800, 
		height : 480, 
		modal : true
	});
}
function clickMenu_pymPriority(menuObject){
	Dialog.open({
		div : '#dialogContent', 
		url : baseUrl+"bsar/pymSupport/pymPriority?dialogName=dialogContent&language="+baseLang,
		//title : '요금 > 미납 > 미납관리 > 미납상세내역', 
		width : 650, 
		height : 310, 
		modal : true
	});
}

function clickMenu_receiptMsgRegi(menuObject){
	Dialog.open({
		div : '#dialogContent', 
		url : baseUrl+"bsar/pymSupport/receiptMsgRegi?dialogName=dialogContent&language="+baseLang,
		title : 'Receipt Message Regist', 
		width : 1200, 
		height : 350, 
		modal : true
	});
}

//operation pymSupport 끝

//report Management 시작
function clickMenu_sumReports(menuObject){
	Dialog.open({
		div : '#dialogContent', 
		url : baseUrl+"bsar/reportManagement/summaryReports?dialogName=dialogContent",
		//title : '요금 > 미납 > 미납관리 > 미납상세내역', 
		width : 1220, 
		height : 630, 
		modal : true
	});
}
//report Management 끝

function clickMenu_ar221(menuObject){
	Dialog.open({
		div : '#dialogContent',
		url : baseUrl+"ar/ar221",
		width : 1200, 
		height : 800, 
		modal : true
	});
}

//common 시작
/**
 * aceno 선택
 * 
 */
function acenoSelDialogCall(inqData,inqSelector){
	
	/* var pageDialOpt = {
		 		strdialogDivName	: "#acenoSelContent", 
				strUrl				: "ar/acenoSel", 
				strParam			: "dialogName=acenoSelContent&callBackFunc=dataInjection+&inqData="+inqData+"+&inqSelector="+inqSelector,
				intWidth 			: 900,
				intHeight 			: 260,
				boolModal 			: true
		  }; 
	gf_openDialog1(pageDialOpt);*/
	var url  = baseUrl+"ar/acenoSel?dialogName=acenoSelContent&callBackFunc=dataInjection&inqSelector="+inqSelector;
	Dialog.open({
		div : '#acenoSelContent',                                       
		url : url,
		data : JSON.stringify(inqData),
		method : 'post',
		width : 900,
		height: 270, 
		modal : true
	}); 
	
	
}

//수납요청 
function receiptReq(){

		var args = arguments.length ;
		var url  = baseUrl+"bsar/ar/arPayment?dialogName=pymReqDialog";
		
		var recpData;
		var callBackFunc;
		
		if(args == 0){
			
			url = url;
		}
		else if(args == 1){
			recpData = arguments[0];
		}
		else if (args == 2){
			
			recpData = arguments[0];
			callBackFunc = arguments[1];
			url += "&callBackFunc="+callBackFunc;
			
		}
		
		Dialog.open({
			div : '#pymReqDialog',                                       
			url : url,
			data : JSON.stringify(recpData),
			method : 'post',
			width : 900,
			height: 705, 
			modal : true
		}); 
}

function subsReceiptReq(){
	
	var args = arguments.length ;
	var url  = baseUrl+"bsar/ar/subsPayment?dialogName=subsPymReqDialog";
	
	var recpData;
	var callBackFunc;
	
	if(args == 0){
		
		url = url;
	}
	else if(args == 1){
		recpData = arguments[0];
	}
	else if (args == 2){
		
		recpData = arguments[0];
		callBackFunc = arguments[1];
		url += "&callBackFunc="+callBackFunc;
		
	}
	
	Dialog.open({
		div : '#subsPymReqDialog',                                    //테스트용   
		url : url,
		data : JSON.stringify(recpData),
		method : 'post',
		width : 900,
		height: 705, 
		modal : true
		
	});
}

//영수증프린트
function receiptPrint(recpNo, callBackFunc,recpData,arPymDialogName){
	
	Dialog.open({
		div : '#receiptDialog',                                    //테스트용   
		url : baseUrl+"bsar/ar/arReceipt?dialogName=receiptDialog&language=mn&callBackFunc="+callBackFunc+
								"&recpNo="+recpNo+"&arPymDialogName="+arPymDialogName,
        data : JSON.stringify(recpData),
        method : 'post',						
		width : 335,
		height: 700,
		modal : true
	});

}
//영수증프린트
function receiptReport(recpNo, callBackFunc,recpData,arPymDialogName){
	
	Dialog.open({
		div : '#receiptDialog',                                    //테스트용   
		url : baseUrl+"bsar/ar/arReceiptReport?dialogName=receiptDialog&language=mn&callBackFunc="+callBackFunc+
								"&recpNo="+recpNo+"&arPymDialogName="+arPymDialogName,
        data : JSON.stringify(recpData),
        method : 'post',						
		width : 1050,
		height: 570,
		modal : true
	});

}
//common 끝



function clickMenu_ar25(menuObject){
	Dialog.open({
		div : '#dialogContent', 
		url : baseUrl+"ar/ar25",
		title : '미납 > 대손관리 > 대손대상자관리', 
		width : 1200, 
		height : 700, 
		modal : true
	});
}

// 요근엄무지원
function clickMenu_ar27(menuObject){
	Dialog.open({
		div : '#dialogContent', 
		url : baseUrl+"ar/ar27",
		title : '요금업무지원 > 납부지원관리 > 은행입금내역조회', 
		width : 1200, 
		height : 800, 
		modal : true
	});
}



function clickMenu_hotBillCheck(menuObject){
	Dialog.open({
		div : '#dialogContent', 
		url : baseUrl+"ar/hotBillCheck",
		title : 'HotBill Inquiry', 
		width : 1200, 
		height : 800, 
		modal : true
	});	
}

function clickMenu_gridTest(menuObject){
	Dialog.open({
		div : '#dialogContent',
		url : baseUrl+"ar/gridTest",
		title : 'grid test',
		width : 1200,
		height: 800,
		modal : true
	});
}












// 일마감 배치작업 호출 화면
function clickMenu_batchCloseDate(menuObject){
	Dialog.open({
		div : '#batchCloseDtDialog', 
		url : baseUrl + "bsar/pymSupport/batchCloseDate?dialogName=batchCloseDtDialog",
		title : 'Batch Close Date', 
		width : 300, 
		height : 300, 
		modal : true
	});
}





function clickMenu_writeOffProc(menuObject){
	Dialog.open({
		div : '#writeOffProcDialog', 
		url : baseUrl + "bsar/writeOffManage/writeOffProc?dialogName=writeOffProcDialog",
		title : 'Write Off Process', 
		width : 1200, 
		height : 420, 
		modal : true
	});
}


function clickMenu_writeOffListMng(menuObject){
	Dialog.open({
		div : '#writeOffListMngDialog', 
		url : baseUrl + "bsar/writeOffManage/writeOffListMng?dialogName=writeOffListMngDialog",
		title : 'Write Off List Manage', 
		width : 1200, 
		height : 630, 
		modal : true
	});
}

//수납끝