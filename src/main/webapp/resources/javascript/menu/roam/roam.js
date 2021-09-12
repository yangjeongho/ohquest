/* Associate Partner */
function clickMenu_roamReg001(menuObject){
		Dialog.open({
			div : '#dialogContent', 
			url : baseUrl+"roam/roamReg001?dialogName=dialogContent", 
			title : 'Associate Partner', 
			width : 1000, 
			height : 350, 
			modal : true
		});
}
/* Full partner */
function clickMenu_roamReg002(menuObject){
		Dialog.open({
			div : '#dialogContent', 
			url : baseUrl+"roam/roamReg002?dialogName=dialogContent", 
			title : 'Full Partner', 
			width : 1000, 
			height : defaultScreenHeight900, 
			modal : true
		});
}
/*Exchcange Rate*/
function clickMenu_roamRef001(menuObject){
		Dialog.open({
			div : '#dialogContent', 
			url : baseUrl+"roam/refe/roamRef001?dialogName=dialogContent", 
			title : 'Exchange Rate', 
			width : 830, 
			height : 570, 
			modal : true
		});
}
/*SDR Infomation*/
function clickMenu_roamRef002(menuObject){
		Dialog.open({
			div : '#dialogContent', 
			url : baseUrl+"roam/refe/roamRef007?dialogName=dialogContent", 
			title : 'SDR Information', 
			width : 829, 
			height : 450, 
			modal : true
		});
}

/*IDD Status*/
function clickMenu_roamRef003(menuObject){
		Dialog.open({
			div : '#dialogContent', 
			url : baseUrl+"roam/refe/roamRef003?dialogName=dialogContent", 
			title : 'IDD Status', 
			width : 827, 
			height : 580, 
			modal : true
		});
}
/*IDD Registration*/
function clickMenu_roamRef004(menuObject){
		Dialog.open({
			div : '#dialogContent', 
			url : baseUrl+"roam/refe/roamRef004?dialogName=dialogContent", 
			title : 'IDD Registration', 
			width : 1000, 
			height : 580, 
			modal : true
		});
}

/*IDD MCC-MNC Information*/
function clickMenu_roamRef005(menuObject){
		Dialog.open({
			div : '#dialogContent', 
			url : baseUrl+"roam/refe/roamRef005?dialogName=dialogContent", 
			title : 'MCC-MNC Information', 
			width : 830, 
			height : 530, 
			modal : true
		});
}

/*IDD MCC-MNC Information*/
function clickMenu_roamRef006(menuObject){
		Dialog.open({
			div : '#dialogContent', 
			url : baseUrl+"roam/refe/roamRef006?dialogName=dialogContent", 
			title : 'Timeband', 
			width : 840, 
			height : 600, 
			modal : true
		});
}	

/* Invoice 상태 조회 */
function clickMenu_roamInv001(menuObject){
		Dialog.open({
			div : '#dialogContent', 
			url : baseUrl+"roam/invi/roamInvi001?dialogName=dialogContent", 
			title : 'Invoice Status', 
			width : 1000, 
			height : 600, 
			modal : true
		});
}
		
/*Invoice  receipt                                */
function clickMenu_roamInv002(menuObject){
		Dialog.open({
			div : '#dialogContent', 
		url : baseUrl+"roam/invi/roamInvi002?dialogName=dialogContent", 
		title : 'Invoice Received', 
		width : 1000, 
		height : 400, 
		modal : true
	});
}

/*Invoicing                                */
function clickMenu_roamInv003(menuObject){
		Dialog.open({
			div : '#dialogContent', 
		url : baseUrl+"roam/invi/roamInvi003?dialogName=dialogContent", 
		title : 'Invoice Creation', 
		width : 1000, 
		height : 300, 
		modal : true
	});
}

/*Invoicing                                */
function clickMenu_roamInv004(menuObject){
		Dialog.open({
			div : '#dialogContent', 
		url : baseUrl+"roam/invi/roamInv004?dialogName=dialogContent", 
		title : 'Invoice Creation', 
		width : 1000, 
		height : 700, 
		modal : true
	});
}



/* 로밍 파트너 조회*/
function clickMenu_roamPrm001(menuObject){
createMainWorkArea('RoamingPartnerStatus', 
							menuObject,
							baseUrl + 'resources/images/common/left/btn_notice.gif' , 
							baseUrl+"roam/prm/roamPrm001");
							

	/*Dialog.open({
		div : '#dialogContent', 
		url : baseUrl+"roam/prm/roamPrm001?dialogName=dialogContent", 
		title :'RoamingPartnerStatus',
		width : 1250, 
		height : 850, 
		modal : true
	});*/
}

/* Verification - Monthly Verification History (HPMN) */
function clickMenu_roamveri001(menuObject){
	Dialog.open({
		div : '#dialogContent', 
		url : baseUrl+"roam/veri/roamVeri001?dialogName=dialogContent", 
		title : 'Verification - Monthly Verification History', 
		width : 1000, 
		height : 600, 
		modal : true
	});
/*	createMainWorkArea('Verification - Monthly Verification History', 
			menuObject,
			baseUrl + 'resources/images/common/left/btn_notice.gif' , 
			baseUrl+"roam/veri/roamVeri001");*/
}

/* Verification - Monthly Verification History (VPMN) */
function clickMenu_roamveri002(menuObject){
	Dialog.open({
		div : '#dialogContent', 
		url : baseUrl+"roam/veri/roamVeri002?dialogName=dialogContent", 
		title : 'Verification - Monthly Verification History (VPMN)', 
		width : 985, 
		height : 850, 
		modal : true
	});
}

/* Verification - Daily Verification History (HPMN) */
function clickMenu_roamveri003(menuObject){
	Dialog.open({
		div : '#dialogContent', 
		url : baseUrl+"roam/veri/roamVeri003?dialogName=dialogContent", 
		title : 'Verification - Daily Verification History', 
		width : 1000, 
		height : 550, 
		modal : true
	});
}

/* Verification - Daily Verification History (VPMN) */
function clickMenu_roamveri004(menuObject){
	Dialog.open({
		div : '#dialogContent', 
		url : baseUrl+"roam/veri/roamVeri004?dialogName=dialogContent", 
		title : 'Verification - Daily Verification History (VPMN)', 
		width : 1000, 
		height : 550, 
		modal : true
	});
}

function clickMenu_roamReje001(menuObject){
	Dialog.open({
		div : '#dialogContent', 
		url : baseUrl+"roam/reje/roamReje001?dialogName=dialogContent", 
		title : 'TAP vs. RAP information', 
		width : 1100, 
		height : 600, 
		modal : true
	});
}




function clickMenu_roamReje002(menuObject){
	Dialog.open({
		div : '#dialogContent', 
		url : baseUrl+"roam/reje/roamReje002?dialogName=dialogContent", 
		title : 'RAP File Received',
		width : 1000, 
		height : 600, 
		modal : true
	});
}
	
/* Reject & Return – RAP Creation(HPMN) */
function clickMenu_roamReje003(menuObject){
	Dialog.open({
		div : '#dialogContent', 
		url : baseUrl+"roam/reje/roamReje003?dialogName=dialogContent", 
		title : 'RAP Verification & Adjustment',
		width : 1000, 
		height : 600, 
		modal : true
	});
}

/*Reject & Return – RAP File Receipt (VPMN */
function clickMenu_roamReje004(menuObject){
	Dialog.open({
		div : '#dialogContent', 
		url : baseUrl+"roam/reje/roamReje004?dialogName=dialogContent", 
		title : 'RAP Creation',
		width : 1000, 
		height : 600, 
		modal : true
	});
}
	
/* Nrtrde-NRTRDE Creation Information(VPMN) */
function clickMenu_roamNrtr001(menuObject){
	Dialog.open({
		div : '#dialogContent', 
		url : baseUrl+"roam/nrtr/roamNrtr001?dialogName=dialogContent", 
		title : 'NRTRDE  Information',
		width : 1200, 
		height : 620, 
		modal : true
	});
}
/* Nrtrde-NRTRDE Creation Information(HPMN) */
/*
function clickMenu_roamNrtr002(menuObject){
	Dialog.open({
		div : '#dialogContent', 
		url : baseUrl+"roam/nrtr/roamNrtr002?dialogName=dialogContent", 
		title : 'NRTRDE Receip Information(HPMN)',
		width : 1000, 
		height : 800, 
		modal : true
	});
}
*/
/* NRTRDE – NRTRDE Delivery Information (HPMN) */
function clickMenu_roamNrtr003(menuObject){
	Dialog.open({
		div : '#dialogContent', 
		url : baseUrl+"roam/nrtr/roamNrtr003?dialogName=dialogContent", 
		title : 'NRTRDE Delivery Information',
		width : 1000, 
		height : 600, 
		modal : true
	});
}

/* NRTRDE – NRTRDE Delivery Information (HPMN) */
function clickMenu_roamNrtr004(menuObject){
	Dialog.open({
		div : '#dialogContent', 
		url : baseUrl+"roam/nrtr/roamNrtr004?dialogName=dialogContent", 
		title : 'Error information',
		width : 1000, 
		height : 600, 
		modal : true
	});
}

/* PAYMENT  */
function clickMenu_roamPay001(menuObject){
	Dialog.open({
		div : '#dialogContent', 
		url : baseUrl+"roam/pay/roamPay001?dialogName=dialogContent", 
		title : 'Roaming - Payment', 
		width : 1000, 
		height : 610, 
		modal : true
	});
}