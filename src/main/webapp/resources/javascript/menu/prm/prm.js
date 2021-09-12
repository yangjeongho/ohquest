
/*파트너 상태*/
function clickMenu_ptrStatus001(menuObject){
	createMainWorkArea('PartnerStatus', 
			menuObject,
			baseUrl + 'resources/images/common/left/btn_notice.gif' , 
			baseUrl+"prm/ptr/ptrStatus001");
/*	Dialog.open({
		div : '#dialogContent', 
		url : baseUrl+"prm/ptr/ptrStatus001?dialogName=dialogContent", 
		title : 'prmPresent', 
		width : 1250, 
		height : 700, 
		modal : true
	});*/
}
/* 준 파트너등록 */
function clickMenu_prmReg001(menuObject){
	Dialog.open({
		div : '#dialogContent', 
		url : baseUrl+"prm/reg/prmReg001?dialogName=dialogContent",
		title : 'Partner Register', 
		width : 1000, 
		height : 350, 
		modal : true
	});
}
/*풀 파트너등록*/
function clickMenu_prmReg002(menuObject){
	Dialog.open({
		div : '#dialogContent', 
		url : baseUrl+"prm/reg/prmReg002?dialogName=dialogContent",
		title : 'Partner Register', 
		width : 1000, 
		height : 600, 
		modal : true
	});
}


/* 파트너현황 리스트  */
function clickMenu_prmPtrList(menuObject){
		Dialog.open({
			div : '#dialogContent', 
			url : baseUrl+"prm/ptr/list?dialogName=dialogContent",
			title : 'Partner List', 
			width : 840, 
			height : 500, 
			modal : true
		});
}

/* Load Partner Usage */
function clickMenu_prmRef001(menuObject){
		Dialog.open({
			div : '#dialogContent', 
			url : baseUrl+"prm/ref/prmRef001?dialogName=dialogContent",
			title : 'Load Partner Usage', 
			width : 930, 
			height : 550, 
			modal : true
		});
}

/* Invoice Received */
function clickMenu_prmInvi001(menuObject){
		Dialog.open({
			div : '#dialogContent', 
			url : baseUrl+"prm/invi/prmInvi001?dialogName=dialogContent",
			title : 'Invoice Received', 
			width : 1000, 
			height : 600, 
			modal : true
		});
}

/* Invoice Received Status */
function clickMenu_prmInvi002(menuObject){
		Dialog.open({
			div : '#dialogContent', 
			url : baseUrl+"prm/invi/prmInvi002?dialogName=dialogContent",
			title : 'Invoice Status', 
			width : 1000, 
			height :600, 
			modal : true
		});
}


/* Invoice  */
function clickMenu_prmInvi003(menuObject){
		Dialog.open({
			div : '#dialogContent', 
			url : baseUrl+"prm/invi/prmInvi003?dialogName=dialogContent",
			title : 'Invoicing', 
			width : 1000, 
			height : 500, 
			modal : true
		});
}

/*Invoice */

function clickMenu_prmInvi004(menuObject){
	Dialog.open({
		div : '#dialogContent', 
		url : baseUrl+"prm/invi/prmInvi004?dialogName=dialogContent",
		title : 'Invoice Detail', 
		width : 950, 
		height : 500, 
		modal : true
	});
}


/* Verification–Verification History (Incoming)*/
function clickMenu_prmVeri001(menuObject){
		Dialog.open({
			div : '#dialogContent', 
			url : baseUrl+"prm/veri/prmVeri001?dialogName=dialogContent",
			title : 'Verification History', 
			width : 1100, 
			height : 600, 
			modal : true
		});
}

/* Verification–Verification History (Outgoing)*/
function clickMenu_prmVeri002(menuObject){
		Dialog.open({
			div : '#dialogContent', 
			url : baseUrl+"prm/veri/prmVeri002?dialogName=dialogContent",
			title : 'Adjustment', 
			width : 1130, 
			height : 620, 
			modal : true
		});
}

/* Payment*/
function clickMenu_prmPay001(menuObject){
		Dialog.open({
			div : '#dialogContent', 
			url : baseUrl+"prm/pay/prmPay001?dialogName=dialogContent",
			title : 'Payment', 
			width : 1000, 
			height : 600, 
			modal : true
		});
}


/* 파트너현황 리스트  */
/*function clickMenu_prmPtrMain(menuObject){
		Dialog.open({
			div : '#dialogContent', 
			url : baseUrl+"prm/ptr/ptrMain?dialogName=dialogContent", 
			title : 'prmPresent', 
			width : 840, 
			height : 700, 
			modal : true
		});
}
*/


/* 추출코드현황  */
function clickMenu_statusList(menuObject){
		Dialog.open({
			div : '#dialogContent', 
			url : baseUrl+"prm/baseline/statusList/?dialogName=dialogContent",
			title : 'Extracted Code Status', 
			width : 840, 
			height : 500, 
			modal : true
		});
}

/* 추출코드등록  */
function clickMenu_statusNew(menuObject){
		Dialog.open({
			div : '#dialogContent', 
			url : baseUrl+"prm/baseline/statusNew",
			title : 'Extracted Code Status', 
			width : 840, 
			height : 500, 
			modal : true
		});
}

/* 접속료율  */
function clickMenu_rateList(menuObject){
		Dialog.open({
			div : '#dialogContent', 
			url : baseUrl+"prm/baseline/rateList?dialogName=dialogContent",
			title : 'Connection Rate status', 
			width : 840, 
			height : 760, 
			modal : true
		});
}

/* 컨텐츠 등록 현황  */
function clickMenu_contentsList(menuObject){
		Dialog.open({
			div : '#dialogContent', 
			url : baseUrl+"prm/baseline/contentsList?dialogName=dialogContent",
			title : 'Contents registration status', 
			width : 840, 
			height : 400, 
			modal : true
		});
}

/* 컨텐츠 카테고리 현황 */
function clickMenu_contentsCategory(menuObject){
		Dialog.open({
			div : '#dialogContent', 
			url : baseUrl+"prm/baseline/contentsCategory?dialogName=dialogContent", 
			title : 'Contents Category Status', 
			width : 840, 
			height : 400, 
			modal : true
		});
}


/* 컨텐츠 현황 */
function clickMenu_contentsStatus(menuObject){
		Dialog.open({
			div : '#dialogContent', 
			url : baseUrl+"prm/baseline/contentsStatusList?dialogName=dialogContent", 
			title : 'Contents Status', 
			width : 570, 
			height : 350, 
			modal : true
		});
}


/* 컨텐츠 매핑정보 등록 */
function clickMenu_contentsMapping(menuObject){
		Dialog.open({
			div : '#dialogContent', 
			url : baseUrl+"prm/baseline/contentsMapping?dialogName=dialogContent", 
			title : 'Contents Mapping Information', 
			width : 840, 
			height : 400, 
			modal : true
		});
}





/* 정산내역-접속료 정산내역- 발신통화조회 */
function clickMenu_prmSettleOutGoing(menuObject){
		Dialog.open({
			div : '#dialogContent', 
			url : baseUrl+"prm/settlement/outgoingList/" + baseLang +"?dialogName=dialogContent",
			title : 'OutGoing List', 
			width : 1000, 
			height : 500, 
			modal : true
		});
}

/* 정산내역-접속료 정산내역- 착신통화조회 */
function clickMenu_prmSettleInComming(menuObject){
		Dialog.open({
			div : '#dialogContent', 
			url : baseUrl+"prm/settlement/incommingList/" + baseLang +"?dialogName=dialogContent", 
			title : 'Incomming List', 
			width : 840, 
			height : 500, 
			modal : true
		});
}


/* 정산내역-접속료 정산내역- 타사정산내역조회 */
function clickMenu_prmSettleInterconnect(menuObject){
		Dialog.open({
			div : '#dialogContent', 
			url : baseUrl+"prm/settlement/interconnectList/" + baseLang +"?dialogName=dialogContent",
			title : 'Interconnect List', 
			width : 840, 
			height : 500, 
			modal : true
		});
}

/* 정산내역-서비스 정산내역- 컨텐츠정산내역조회 */
function clickMenu_prmSettleContents(menuObject){
		Dialog.open({
			div : '#dialogContent', 
			url : baseUrl+"prm/settlement/contentsList/" + baseLang +"?dialogName=dialogContent",
			title : 'Contents List', 
			width : 840, 
			height : 500, 
			modal : true
		});
}




/* 검증 및 조정 - 접속료 조정- 접속료 조정 이력조회 */
function clickMenu_prmVerifyAdjustList(menuObject){
		Dialog.open({
			div : '#dialogContent',
			url : baseUrl+"prm/verify/adjustList/" + baseLang +"?dialogName=dialogContent", 
			title : 'Adjust List', 
			width : 840, 
			height : 500, 
			modal : true
		});
}


/* 로밍 - 로밍 파트너정보 - 해외파트너 정보현황 */
function clickMenu_prmRoamingPartnerList(menuObject){
		Dialog.open({
			div : '#dialogContent', 
			url : baseUrl+"prm/jasper/list" +"?dialogName=dialogContent", 
			title : 'Roaming Partner List', 
			width : 840, 
			height : 500, 
			modal : true
		});
}



/* 로밍 - 로밍 파트너정보 - 해외파트너 요율정보 */
function clickMenu_prmRoamingSmsRateList(menuObject){
		Dialog.open({
			div : '#dialogContent', 
			url : baseUrl+"prm/roaming/smsRateList"  +"?dialogName=dialogContent", 
			title : 'Roaming Partner Sms Rate List', 
			width : 1000, 
			height : 500, 
			modal : true
		});
}



/* 로밍 - 서비스기준정보 - 해외파트너 환율 */
function clickMenu_prmRoamingExchangeRateList(menuObject){
		Dialog.open({
			div : '#dialogContent', 
			url : baseUrl+"prm/roaming/exchangeRateList"+"?dialogName=dialogContent", 
			title : 'Roaming Partner Exchange Rate List', 
			width : 1000, 
			height : 800, 
			modal : true
		});
}

/* 로밍 - 서비스기준정보 - sid매핑현황*/
function clickMenu_prmRoamingSidMappingList(menuObject){
		Dialog.open({
			div : '#dialogContent', 
			url : baseUrl+"prm/roaming/sidMappingList/" + baseLang +"?dialogName=dialogContent", 
			title : 'Roaming Partner SID Mapping List', 
			width : 1000, 
			height : 500, 
			modal : true
		});
}

/* 로밍 - 서비스기준정보 - sid매핑누락현황*/
function clickMenu_prmRoamingSidoutMappingList(menuObject){
		Dialog.open({
			div : '#dialogContent', 
			url : baseUrl+"prm/roaming/sidoutMappingList/" + baseLang +"?dialogName=dialogContent", 
			title : 'Roaming Partner SID OUT Mapping List', 
			width : 850, 
			height : 500, 
			modal : true
		});
}



/* 로밍 - 서비스 기준정보 - 해외파트너 요율현황 */
function clickMenu_prmRoamingPartnerRateList(menuObject){
		Dialog.open({
			div : '#dialogContent', 
			url : baseUrl+"prm/roaming/partnerRateList/" + baseLang +"?dialogName=dialogContent", 
			title : 'Partner List', 
			width : 1000, 
			height : 500, 
			modal : true
		});
}

/* 로밍 - 서비스기준정보 - 해외파트너 환율 */
function clickMenu_prmRoamingInvoiceStatusList(menuObject){
		Dialog.open({
			div : '#dialogContent', 
			url : baseUrl+"prm/roaming/invoiceStatusList?dialogName=dialogContent",
			title : 'Roaming Partner Invoice Status List', 
			width : 1000, 
			height : 500, 
			modal : true
		});
}


/* Account 정보등록  */
function clickMenu_ptrAccountNew(menuObject){
		Dialog.open({
			div : '#dialogContent', 
			url : baseUrl+"prm/ptr/ptrAccountNew?dialogName=dialogContent", 
			title : 'prmInfoInsert', 
			width : 840, 
			height : 400, 
			modal : true
		});
}

/* Account 정보등록  */
function clickMenu_ptrInfoNew(menuObject){
		Dialog.open({
			div : '#dialogContent', 
			url : baseUrl+"prm/ptr/ptrInfoNew?dialogName=dialogContent", 
			title : 'prmInfoInsert', 
			width : 840, 
			height : 540, 
			modal : true
		});
}


/* 로밍 정산-매출이익 현황  */
function clickMenu_roamingAccount(menuObject){
		Dialog.open({
			div : '#dialogContent', 
			url : baseUrl+"prm/roaming/roamingAccount?dialogName=dialogContent", 
			title : 'prmInfoInsert', 
			width : 840, 
			height : 540, 
			modal : true
		});
}

/* 로밍 정산-매출이익 현황  */
function clickMenu_paymentNonpayment(menuObject){
		Dialog.open({
			div : '#dialogContent', 
			url : baseUrl+"prm/roaming/paymentNonpayment?dialogName=dialogContent", 
			title : 'prmInfoInsert', 
			width : 820, 
			height : 540, 
			modal : true
		});
}




/*상품등록  */
function clickMenu_prmProductMain(menuObject){
	
	
	    createMainWorkArea('prmProductMain'
			, menuObject, baseUrl + 'resources/images/common/left/btn_product.gif'
			, baseUrl+"pdh/product/productMain?dialogName=dialogContent");
}


/* product Infomation - section code  */
function clickMenu_prmProductCode(menuObject){
		Dialog.open({
			div : '#dialogContent', 
			url : baseUrl+"pdh/product/productCode?dialogName=dialogContent", 
			title : 'Product Section Code', 
			width : 1150, 
			height : 620, 
			modal : true
		});
}
