
function clickMenu_bsArManage(menuObject){

	
	//고객파트<가입자조회>가 열려있고 조회에 성공했는지 여부
	var entrSttsCd = $("#subscriptionCustomerSearchForm #entrSttsCd").val();
	var billAcntNo  = $("#subscriptionCustomerSearchForm #billAcntNo").val();
	
	var URL = "";
	
	if($("#subscriptionCustomerSearchForm").length == 0 || entrSttsCd == "T" || entrSttsCd == "R" || entrSttsCd == "C") {
		URL = baseUrl+"bsar/bsArManage";
	} else { 
		//공통코드 SttsCd참조. 
		URL = baseUrl+"bsar/bsArManage?billAcntNo=" + billAcntNo;	
	}
	
	createMainWorkArea('bsArManage', menuObject, baseUrl + 'resources/images/common/left/bsArManage.gif', URL);
	
}



//과금 시작 SerivceDtlInq
function clickMenu_bs1(menuObject){
	Dialog.open({
		div : '#serivceDtlInqDialog', 
		url : baseUrl+"bsar/bs/bs1?dialogName=serivceDtlInqDialog",
		//title : '요금 > 과금 > 서비스이용내역조회 > 서비스내역조회',
		width : 1200, 
		height : 580, 
		modal : true
	});
}

function clickMenu_bs2(menuObject){
	
	if(!gf_CheckSubscriber()) {
		return false;
	}
	
	var entrNo = $("#subscriptionCustomerSearchForm #entrNo").val();
	var prodNo = $("#subscriptionCustomerSearchForm #prodNo").val();
	
	Dialog.open({
		div : '#dialogContent', 
		url : baseUrl+"bsar/bs/bs2?dialogName=dialogContent&entrNo="+entrNo+"&prodNo="+prodNo,
		//title : '요금 > 과금 > 서비스이용내역조회 > 서비스요약조회', 
		width : 1200, 
		height : 615, 
		modal : true
	});
}

function clickMenu_bs3(menuObject){
	Dialog.open({
		div : '#dialogContent', 
		url : baseUrl+"bsar/bs/bs3?dialogName=dialogContent", 
		//title : '요금 > 과금 > 재과금요청관리 > 재과금요청등록', 
		width : 1000, 
		height : 620, 
		modal : true
	});	
}

function clickMenu_bs4(menuObject){
	Dialog.open({
		div : '#dialogContent', 
		url : baseUrl+"bsar/bs/bs4?dialogName=dialogContent",
		//title : '요금 > 과금  > 재과금요청관리 > 재과금요청내역조회', 
		width : 1000, 
		height : 620, 
		modal : true
	});	
}
//과금 끝


//선불충전 시작
function clickMenu_cashRecharge(menuObject){
	Dialog.open({
		div : '#dialogContent', 
		url : baseUrl+"bsar/prepaid/cashRecharge?dialogName=dialogContent",
		//title : 'Cash Recharge(선불충전 등록)',
		width : 1000, 
		height : 600, 
		modal : true
	});
}

function clickMenu_cashRechargeInq(menuObject){
	Dialog.open({
		div : '#dialogContent', 
		url : baseUrl+"bsar/prepaid/cashRechargeInq?dialogName=dialogContent",
		//title : 'Cash Recharge Inquiry(선불충전 조회)',
		width : 1000, 
		height : 590, 
		modal : true
	});
}
function clickMenu_rechargeHistInq(menuObject){
	Dialog.open({
		div : '#dialogContent', 
		url : baseUrl+"bsar/prepaid/rechargeHistInq?dialogName=dialogContent",
		//title : 'Recharge History Inquiry(충전이력 조회)',
		width : 1000, 
		height : 590, 
		modal : true
	});
}
//선불충전 끝




//선불충전 시작

//제거된 페이지 나중에 확정시 삭제
/*function clickMenu_depositAdd(menuObject){
	Dialog.open({
		div : '#dialogContent', 
		url : baseUrl+"bsar/deposit/depositAdd?dialogName=dialogContent",
		//title : 'Cash Recharge(보증금 추가등록)',
		width : 1000, 
		height : 600, 
		modal : true
	});
}*/
/*
 * 팝업으로 변태!!!
 * function clickMenu_depositRefund(menuObject){
	Dialog.open({
		div : '#depositDialog', 
		url : baseUrl+"bsar/deposit/depositRefund?dialogName=depositDialog",
		//title : 'Cash Recharge(보증금 환불등록)',
		width : 450, 
		height : 250, 
		modal : true
	});
}*/
function clickMenu_depositBalanceInq(menuObject){
	Dialog.open({
		div : '#dialogContent', 
		url : baseUrl+"bsar/deposit/depositBalanceInq?dialogName=dialogContent",
		//title : 'Cash Recharge Inquiry(보증금잔액 조회)',
		width : 1100, 
		height : 590, 
		modal : true
	});
}
function clickMenu_depositHistInq(menuObject){
	Dialog.open({
		div : '#dialogContent', 
		url : baseUrl+"bsar/deposit/depositHistInq?dialogName=dialogContent",
		//title : 'Recharge History Inquiry(보증금 이력조회)',
		width : 1150, 
		height : 615, 
		modal : true
	});
}
//선불충전 끝




//청구시작
function clickMenu_bs5(menuObject){
	var billAcntNo = '1000000168';
	Dialog.open({
		div : '#dialogContent', 
		url : baseUrl+"bsar/bs/bs5?dialogName=dialogContent&billAcntNo="+billAcntNo,
		////title : '요금 > 청구 > 청구정보조회', 
		//title : 'Bill Information Inquiry',
		width : 1200, 
		height : 630, 
		modal : true
	});
}

function clickMenu_bs6(menuObject){

	//고객파트<가입자조회>가 열려있고 조회에 성공했는지 여부
	
/*	if(!gf_CheckSubscriber()) {
		
		return false;
	} else if(entrSttsCd && entrSttsCd == "T" || entrSttsCd == "R" || entrSttsCd == "C") {
		//공통코드 SttsCd참조. 
		MessageBox.dialog("해지, 임시, 예약상태의 고객은 분리청구할수 없음.");
		 $(this).hideLoading();
		return false;
		
	} else if(ppayEntrDvCd && ppayEntrDvCd == 1) {	//1=선불,2=후불, 3=Hybrid
		
		MessageBox.dialog("선불 가입자는 분리청구할수 없음.");
		 $(this).hideLoading();
		return false;
		
	} else {
		var entrNo = $("#subscriptionCustomerSearchForm #entrNo").val();
		var aceno  = $("#subscriptionCustomerSearchForm #aceno").val();
		var billAcntNo  = $("#subscriptionCustomerSearchForm #aceno").val();
		
		Dialog.open({
			div : '#hotBillDialog', 
			url : baseUrl+"bsar/bs/bs6?dialogName=hotBillDialog&entrNo="+entrNo+"&aceno="+aceno+"&billAcntNo="+billAcntNo,
			//title : '요금 > 청구 > HotBill조회', 
			//title : 'HotBill Inquiry',
			width : 1200, 
			height : 580, 
			modal : true
		});
	}*/
	
		//console.log("entrSttsCd :"+$("#subscriptionCustomerSearchForm #entrSttsCd").val());
	//console.log("ppayEntrDvCd :"+$("#subscriptionCustomerSearchForm #ppayEntrDvCd").val());
//	var entrNo = $("#subscriptionCustomerSearchForm #entrNo").val();
//	var aceno  = $("#subscriptionCustomerSearchForm #aceno").val();
	
	
	
	if(!gf_CheckSubscriber()) {	return false; }
	
	var billAcntNo  = $("#subscriptionCustomerSearchForm #billAcntNo").val();
	//var billAcntNo  = "";
	Dialog.open({
		div : '#hotBillDialog', 
		url : baseUrl+"bsar/bs/bs6?dialogName=hotBillDialog&billAcntNo="+billAcntNo,
		//title : '요금 > 청구 > HotBill조회', 
		width : 1200, 
		height : 580, 
		modal : true
	});
}

/*function clickMenu_bs7(menuObject){
	Dialog.open({
		div : '#dialogContent', 
		url : baseUrl+"bsar/bs/bs7",
		//title : '요금 > 청구 > 해지고객관리 > 핫빌계산내역조회', 
		width : 1200, 
		height : 700, 
		modal : true
	});
}*/

/*function clickMenu_bs8(menuObject){							03.14 메뉴에서 제외(보류)
	Dialog.open({
		div : '#dialogContent', 
		url : baseUrl+"bsar/bs/bs8?dialogName=dialogContent",
		//title : '요금 > 청구 > 청구서/내역서관리 > 각종내역서발행', 
		width : 1200, 
		height : 580, 
		modal : true
	});
}


function clickMenu_bs9(menuObject){
	Dialog.open({
		div : '#dialogContent', 
		url : baseUrl+"bsar/bs/bs9?dialogName=dialogContent",
		//title : '요금 > 청구 > 청구서/내역서관리 > 정규청구서발행내역조회', 
		width : 1200, 
		height : 605, 
		modal : true
	});
}*/

/*function clickMenu_bs10(menuObject){
	Dialog.open({
		div : '#dialogContent', 
		url : baseUrl+"bsar/bs/bs10?dialogName=dialogContent",
		//title : '요금 > 청구 > 청구서/내역서관리 > 청구제외대상조회', 
		width : 1200, 
		height : 500, 
		modal : true
	});
}
*/

function clickMenu_bs11(menuObject){
	var entrSttsCd = $("#subscriptionCustomerSearchForm #entrSttsCd").val();
	var ppayEntrDvCd = $("#subscriptionCustomerSearchForm #ppayEntrDvCd").val();
	
	if(!gf_CheckSubscriber()) {
		
		return false;
	} else if(entrSttsCd && entrSttsCd == "T" || entrSttsCd == "R" || entrSttsCd == "C") {
		//공통코드 SttsCd참조. 
		MessageBox.dialog("해지, 임시, 예약상태의 고객은 분리청구할수 없음.");
		 $(this).hideLoading();
		return false;
		
	} else if(ppayEntrDvCd && ppayEntrDvCd == 1) {	//1=선불,2=후불, 3=Hybrid
		
		MessageBox.dialog("선불 가입자는 분리청구할수 없음.");
		 $(this).hideLoading();
		return false;
		
	} else {
		var entrNo = $("#subscriptionCustomerSearchForm #entrNo").val();
		var aceno  = $("#subscriptionCustomerSearchForm #aceno").val();
		var billAcntNo  = $("#subscriptionCustomerSearchForm #billAcntNo").val();
		
		//console.log("entrSttsCd :"+$("#subscriptionCustomerSearchForm #entrSttsCd").val());
		//console.log("ppayEntrDvCd :"+$("#subscriptionCustomerSearchForm #ppayEntrDvCd").val());
		Dialog.open({
			div : '#bilAcntSepaDialog', 
			url : baseUrl+"bsar/bs/bs11?dialogName=bilAcntSepaDialog&entrNo="+entrNo+"&aceno="+aceno+"&billAcntNo="+billAcntNo,
			//title : ' ',//요금 > 청구 > 분리청구관리 > 분리청구등록(child) 
			width : 1200, 
			height : 630, 
			modal : true
		});
	}
	
}
function clickMenu_bs12(menuObject){
	Dialog.open({
		div : '#billAcntIntegDialog', 
		url : baseUrl+"bsar/bs/bs12?dialogName=billAcntIntegDialog", 
		//title : ' ', // //요금 > 청구 > 분리청구관리 > 분리청구통합(parent)
		width : 1200, 
		height : 645, 
		modal : true
	});
}

function clickMenu_bs13(menuObject){
	Dialog.open({
		div : '#dialogContent',
		url : baseUrl+"bsar/bs/bs13?dialogName=dialogContent", 
		//title : '요금 > 청구 > 분리청구관리 > 분리청구내역조회', 
		width : 1200, 
		height : 700, 
		modal : true
	});
}

function clickMenu_bs14(menuObject){
	Dialog.open({
		div : '#bs14Dialog', 
		url : baseUrl+"bsar/bs/bs14?dialogName=bs14Dialog",
		//title : '요금 > 청구> 로밍청구관리 > 로밍청구내역조회', 
		width : 1200, 
		height : 570, 
		modal : true
	});
}
//요금조정시작
function clickMenu_bs15(menuObject){
	Dialog.open({
		div : '#dialogContent', 
		url : baseUrl+"bsar/bs/bs15?dialogName=dialogContent",
		//title : '요금 > 요금조정 > 요금조정관리', 
		width : 1200, 
		height : 710, 
		modal : true
	});
}

//조정이력(가입연동인듯...)
function clickMenu_bs16(menuObject){
	Dialog.open({
		div : '#bs16Dialog', 
		url : baseUrl+"bsar/bs/bs16?dialogName=bs16Dialog",
		//title : '요금 > 요금조정 > 조정이력조회', 
		width : 1200, 
		height : 560, 
		modal : true
	});
}

function clickMenu_billDiscountPlan(menuObject){
	Dialog.open({
		div : '#dialogContent', 
		url : baseUrl+"bsar/bs/billDiscountPlan?dialogName=dialogContent",
		//title : 'Bill Discount', 
		width : 1200, 
		height : 580, 
		modal : true
	});
}

function clickMenu_bsApiTest(menuObject){
	Dialog.open({
		div : '#dialogContent', 
		url : baseUrl+"openapi/bs/test?dialogName=dialogContent",
		//title : 'api test', 
		width : 1200, 
		height : 600, 
		modal : true
	});
}




function clickMenu_bsBillCycle(menuObject){
	Dialog.open({
		div : '#dialogContent', 
		url : baseUrl + "bsar/billSupport/billCycle?dialogName=dialogContent",
		//title : '청구주기등록', 
		width : 820, 
		height : 500, 
		modal : true
	});
}

function clickMenu_bsBillItem(menuObject){
	Dialog.open({
		div : '#dialogContent', 
		url : baseUrl + "bsar/billSupport/billItem?dialogName=dialogContent",
		//title : '청구항목등록', 
		width : 1200, 
		height : 600, 
		modal : true
	});
}

function clickMenu_bsBillItemMsg(menuObject){
	Dialog.open({
		div : '#dialogContent', 
		url : baseUrl + "bsar/billSupport/billItemMsg?dialogName=dialogContent",
		//title : '청구항목메시지', 
		width : 1200, 
		height : 610, 
		modal : true
	});
}
function clickMenu_bsBillMsg(menuObject){
	Dialog.open({
		div : '#dialogContent', 
		url : baseUrl + "bsar/billSupport/billMsg?dialogName=dialogContent",
		title : 'Bill Message', 
		width : 1240, 
		height : 670, 
		modal : true
	});
}

function clickMenu_billPolicy(menuObject){
	Dialog.open({
		div : '#billPolicyDialog', 
		url : baseUrl + "bsar/billSupport/billPolicy?dialogName=billPolicyDialog",
		width : 1100, 
		height : 540, 
		modal : true
	});
}






function clickMenu_billWorkDtlRegi(menuObject){
	Dialog.open({
		div : '#billWorkDtlRegiDialog', 
		url : baseUrl + "bsar/operationSupport/billWorkSupport/billWorkDtlRegi?dialogName=billWorkDtlRegiDialog",
		width : 1000, 
		height : 580, 
		modal : true
	});
}


function clickMenu_billWorkProc(menuObject){
	Dialog.open({
		div : '#billWorkProcDialog', 
		url : baseUrl + "bsar/operationSupport/billWorkSupport/billWorkProc?dialogName=billWorkProcDialog",
		width : 1100, 
		height : 650, 
		modal : true
	});
}


//invoice file down to finance-team
function clickMenu_invoiceDown(menuObject){
	Dialog.open({
		div : '#invoiceDownDialog', 
		url : baseUrl + "bsar/operationSupport/billWorkSupport/invoiceDown?dialogName=invoiceDownDialog",
		title : "Invoice File Download",
		width : 1100, 
		height : 450, 
		modal : true
	});
} 

function clickMenu_financeBillWorkProc(menuObject){
	Dialog.open({
		div : '#financeBillWorkProcDialog', 
		url : baseUrl + "bsar/operationSupport/billWorkSupport/financeBillWorkProc?dialogName=financeBillWorkProcDialog",
		width : 1100, 
		height : 480, 
		modal : true
	});
}



/*function clickMenu_billAcntSearch_p(menuObject){
	Dialog.open({
		div : '#billAcntSearchDialog', 
		url : baseUrl + "bsar/bs/billAcntSearch_p?dialogName=billAcntSearchDialog",
		//title : '청구항목등록', 
		width : 1200, 
		height : 640, 
		modal : true
	});
}*/

//청구끝




