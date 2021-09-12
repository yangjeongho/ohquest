
/* 코드관리  */
function clickMenu_codeManage(menuObject){
		Dialog.open({
			div : '#dialogContent', 
			url : baseUrl+"code/view/" + baseLang +"?dialogName=dialogContent", 
			title : 'Code Management', 
			width : 1000, 
			height : 800, 
			modal : true
		});
}
/* 주소관리  */
function clickMenu_addressManage(menuObject){
		Dialog.open({
			div : '#dialogContent', 
			url : baseUrl+"common/address/search?dialogName=dialogContent&mode=A",
			title : 'Address Management', 
			width : 1000, 
			height : 800, 
			modal : true
		});
}

/* 커버리지관리  */
function clickMenu_coverageManage(menuObject){
		Dialog.open({
			div : '#dialogContent', 
			url : baseUrl+"coverage/search?dialogName=dialogContent&coverageMode=A", 
			title : 'Coverage Management', 
			width : 1000, 
			height : 800, 
			modal : true
		});
}

/* 사용자등록 */
function clickMenu_agentManage(menuObject){
		Dialog.open({
			div : '#dialogContent', 
			url : baseUrl+"co/agent/list?dialogName=dialogContent", 
			title : 'User Management', 
			width : 1000, 
			height : 800, 
			modal : true
		});
}


/* 정책 등록 */
function clickMenu_salesPolicy(menuObject){

	Dialog.open({
		div : '#salesPolicyDialog', 
		url : baseUrl+"co/salePolicy/salePolicy?dialogName=salesPolicyDialog",
		title : 'Sales Policy', 
		width : 1000, 
		height : 600, 
		modal : true
	});
	
}
/* 고객부가항목 등록 관리 */
function clickMenu_custAttribute(menuObject){

	Dialog.open({
		div : '#customerAttributeDialog', 
		url : baseUrl+"cs/custAttribute?dialogName=customerAttributeDialog", 
		title : 'Customer Attributes', 
		width : 800, 
		height : 700, 
		modal : true
	});
}


/*     상담 유형 등록             */
function clickMenu_counselType(menuObject){

	Dialog.open({
		div : '#counselTypeDialog', 
		url : baseUrl+"co/counselType?dialogName=counselTypeDialog",
		title : 'counsel Type', 
		width :800, 
		height : 600, 
		modal : true
	});
}

function clickMenu_ftrCodeManage(menuObject){
	Dialog.open({
	div : '#dialogContent',
	url :  baseUrl+"code/ftrcode/" + baseLang +"?dialogName=dialogContent",
	title : 'Feature Management',
	width : 800,
	height : 580,
	modal : true
	});
}

function clickMenu_passwordPolicy(menuObject){
		Dialog.open({
		div : '#dialogContent',
		url :  baseUrl+"cs/password/passwordPolicy/" + baseLang +"?dialogName=dialogContent",
		title : 'Password Policy',
		width : 900,
		height :600,
		modal : true
		});
}

function clickMenu_hostname(menuObject){
	Dialog.open({
	div : '#ubDialog',
	url :  baseUrl+"ubireport/check/hostname?dialogName=ubDialog",
	title : 'Host Name',
	width : 1200,
	height : 600,
	modal : true
	});
}

function clickMenu_coEventLog(menuObject){
	Dialog.open({
	div : '#eventLogDialog',
	url :  baseUrl+"co/eventlog?dialogName=eventLogDialog",
	title : 'Event Log',
	width : 1000,
	height : 600,
	modal : true
	});
}

function clickMenu_coBoardMng(menuObject){
	Dialog.open({
	div : '#noticeDialog', 
	url :  baseUrl+"co/notice/coNotice001?dialogName=noticeDialog",
	title : 'Notices',
	width : 810,
	height : 630, 
	modal : true
	});
}

// 상담QnA
function clickMenu_counselQnA(menuObject){
	Dialog.open({
		div : '#counselQnADialog', 
		url : baseUrl+"co/counselQna?dialogName=counselQnADialog",
		title : 'counsel QnA', 
		width :800, 
		height : 600, 
		modal : true
	});
}
	
function clickMenu_counselGroup(menuObject){
	Dialog.open({
	div : '#counselGroupDialog', 
	url :  baseUrl+"co/counsel/counselGroup?dialogName=counselGroupDialog",
	title : 'CounselGroup',
	width :  1200,
	height : 650, 
	modal : true
	});
}